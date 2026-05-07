Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40F8CCD3442
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 08:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DJFhlhCeFrLG8D3BZsphXQxlHW1aEO91AkSao6yRrGw=; b=KxWxMHR2goQNyC5Wovumb7VNA9
	sLjdg20oU1I5N6tOwozmXPlbxQWpGkk3uusgi/2xcsGhjfGi0sorCaZP99qAyMdw0z1w/dNVakPFt
	hSpRr8cCu5B3+1eQUpFAnJ8HuxiJDH1fFIZ+/9JunROJ4IxXQ3C1+iY+DJG+tVZIKGnTNsApFMWkL
	vRjSovYG0Pe5Ctz3EgAsUsUVztVbl8Cq8zOlQAK3n5DqoVPYTRHlOg1SOzhiSEtVlSToTWcjfwOv5
	X6abvGsq14A0otX3ymGjM08KgKgWlRaOPDZApr1ukwQY0BIrXEbr4Skl2MYr7wZKL5UpbsNSTM/p5
	Y6bJ80Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKu8W-00000003BQC-3Lx8;
	Thu, 07 May 2026 08:31:12 +0000
Received: from azure-sdnproxy.icoremail.net ([207.46.229.174])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKu8S-00000003BPH-1hDB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 08:31:10 +0000
Received: from E0004057DT.eswin.cn (unknown [10.11.96.26])
	by app2 (Coremail) with SMTP id TQJkCgBHXqG0Tfxps3kXAA--.38748S2;
	Thu, 07 May 2026 16:30:45 +0800 (CST)
From: lizhi2@eswincomputing.com
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	rmk+kernel@armlinux.org.uk,
	maxime.chevallier@bootlin.com,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Cc: ningyu@eswincomputing.com,
	linmin@eswincomputing.com,
	pinkesh.vaghela@einfochips.com,
	pritesh.patel@einfochips.com,
	weishangjuan@eswincomputing.com,
	Zhi Li <lizhi2@eswincomputing.com>
Subject: [PATCH net v1 0/2] net: stmmac: eic7700: fix delay calculation and initialization ordering
Date: Thu,  7 May 2026 16:30:36 +0800
Message-ID: <20260507083037.152-1-lizhi2@eswincomputing.com>
X-Mailer: git-send-email 2.52.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: TQJkCgBHXqG0Tfxps3kXAA--.38748S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ur47uFy3Kw4UAr1UCF4UArb_yoW8Kryxpa
	95Kr15t340qFyxGwn2vF1Iqa4rXay8Ga15Cr1rXr95Z3Z8CF9Yyr1xKw4DuFy7Ar4xZF1Y
	vryjq3Z8Ca4qyaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBv14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lw4CEc2x0rVAKj4xxMxkF7I0En4kS14v26r4a6rW5MxkIecxEwVCm-wCF04
	k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18
	MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr4
	1lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l
	IxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4
	A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0pRkwIhUUUUU=
X-CM-SenderInfo: xol2xx2s6h245lqf0zpsxwx03jof0z/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_013108_790508_4060C67E 
X-CRM114-Status: UNSURE (   8.69  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Zhi Li <lizhi2@eswincomputing.com>

This series fixes several issues in the EIC7700 DWMAC glue driver
affecting existing eth0 functionality due to incorrect delay programming
and initialization ordering.

The previous implementation used an incorrect delay step (100 ps),
while the hardware operates with 20 ps granularity. This resulted in
incorrect programming of RX/TX delay values relative to the actual
hardware timing model.

In addition, the driver did not guarantee that clocks were enabled
before accessing HSP CSR registers, and did not explicitly clear
TXD/RXD delay registers, which may leave residual configuration from
the bootloader and affect RGMII timing determinism.

The device tree binding is updated to reflect the actual hardware delay
model and to clarify the semantics of MAC-side delay configuration,
aligning it with the real programming model without changing the
intended semantic meaning of the properties.

Changes in this series:
  - Correct delay step from 100 ps to 20 ps and validate input range
  - Ensure clocks are enabled before CSR access
  - Clear TXD/RXD delay registers during initialization
  - Update dt-binding to use range-based constraints (0-2540 ps, 20 ps step)
  - Make delay properties optional depending on RGMII mode
  - Clarify MAC-side delay semantics in binding documentation

These changes correct eth0 behavior and hardware programming correctness
for existing usage.

The previous revisions (v1-v7) mixed bug fixes and new functionality.
Based on review feedback, the changes are now split, and this series
contains only fixes targeting the net tree. Eth1 enablement will be
submitted separately to net-next.

Previous discussion:
  https://lore.kernel.org/lkml/20260427072353.1114-1-lizhi2@eswincomputing.com/

This binding update is safe as there are currently no in-tree users
relying on the previous enum-based representation.

Zhi Li (2):
  dt-bindings: ethernet: eswin: refine delay model and HSP register
    description
  net: stmmac: eic7700: fix delay step calculation and ensure safe
    register initialization

 .../bindings/net/eswin,eic7700-eth.yaml       |  50 ++++--
 .../ethernet/stmicro/stmmac/dwmac-eic7700.c   | 154 +++++++++++++-----
 2 files changed, 148 insertions(+), 56 deletions(-)

-- 
2.25.1


