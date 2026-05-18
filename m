Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C33BCD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 02:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MFnnI6BLldGNd3xKUEPWwgoYbIBXOTqb1boV/gtJDt0=; b=0FR5j2w1rlgOGWwIa0TsRvLryJ
	vkjAC0UoKu+PFjAFduwQSnYK8npa890aQ2oABhucRe2rzAcXHDUtm7rQJonAVf1n7fBmO1diLWSzb
	Za2Uc+ILXt0tx0PdtJT5ZAmTgFPESOcXz32mTB0VvB1iHUMDeF1u5aTkSKJsPhH2MsQgVio8BpBaU
	Adv2f1tEbmElLMnSZvBn9UNDRnaWV7t6MwfBdtBc6zMUhUTU2TOGqBgd2HS0hsVxLPmlw0eOP+MQq
	Da1HWVERmx9zOdFG0fPqPCN7I7Xk63FC6fH00QHoR4cM6W55MuMH3E8ikNOt4JMvmn0VeybaFEv/W
	bNYf7iWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOnaU-0000000Duob-31EL;
	Mon, 18 May 2026 02:20:10 +0000
Received: from zg8tmtyylji0my4xnjeumjiw.icoremail.net ([162.243.161.220])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOnaR-0000000Dunf-0Mim
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 02:20:09 +0000
Received: from E0004057DT.eswin.cn (unknown [10.11.96.26])
	by app2 (Coremail) with SMTP id TQJkCgBHXaApdwpqD0oaAA--.47720S2;
	Mon, 18 May 2026 10:19:23 +0800 (CST)
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
Subject: [PATCH net v2 0/5] net: stmmac: eic7700: fix delay calculation and initialization ordering
Date: Mon, 18 May 2026 10:19:19 +0800
Message-ID: <20260518021919.404-1-lizhi2@eswincomputing.com>
X-Mailer: git-send-email 2.52.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: TQJkCgBHXaApdwpqD0oaAA--.47720S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tFW5Xr1fJF45Xr1kKryfZwb_yoW8AFW8p3
	93GFWrtr1kJryxJws7JF1vvFWrtan3CF1Y934rG3s7X3s0gas0qw18K3WFgFyUCr4xZF1j
	yF4UXa98Cas0krJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBq14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4U
	JVW0owA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwAKzVCY07xG64k0F24lc7CjxVAaw2AFwI0_GFv_Wrylc2xSY4AK6svPMxAIw2
	8IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4l
	x2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrw
	CI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI
	42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z2
	80aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7sRi7KItUUUUU==
X-CM-SenderInfo: xol2xx2s6h245lqf0zpsxwx03jof0z/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_192007_270530_D5CF8C40 
X-CRM114-Status: UNSURE (   7.73  )
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

v1 -> v2:
  - Update eswin,eic7700-eth.yaml:
    - Limit the binding changes to adding optional TXD and RXD delay register
      offsets in eswin,hsp-sp-csr.
    - Restore the original enum-based definitions for rx-internal-delay-ps
      and tx-internal-delay-ps.
    - Keep rx-internal-delay-ps and tx-internal-delay-ps as required
      properties.
    - Restore the original example content, with only the additional optional
      TXD and RXD delay register offsets.
    - Restore Acked-by from Conor Dooley for the binding change, which was
      temporarily omitted in v1 during series restructuring and has been
      reinstated now that the change is stable and properly isolated.

  - Update dwmac-eic7700.c:
    - Split driver changes into smaller patches based on review feedback to
      improve reviewability and bisectability.
    - Keep the existing requirement that rx-internal-delay-ps and
      tx-internal-delay-ps must be present in the device tree.
    - Treat TXD/RXD delay register offsets as optional and only program them
      when provided by device tree.
    - Remove the previously proposed fix_mac_speed logic.

  - Link to v1:
    https://lore.kernel.org/lkml/20260507083037.152-1-lizhi2@eswincomputing.com/

Zhi Li (5):
  dt-bindings: ethernet: eswin: add optional TXD and RXD delay register
    offsets
  net: stmmac: eswin: fix HSP CSR init ordering after clock enable
  net: stmmac: eswin: clear TXD and RXD delay registers during
    initialization
  net: stmmac: eswin: correct RGMII delay granularity to 20 ps
  net: stmmac: eswin: validate RGMII delay values

 .../bindings/net/eswin,eic7700-eth.yaml       |  13 +-
 .../ethernet/stmicro/stmmac/dwmac-eic7700.c   | 126 +++++++++++++-----
 2 files changed, 101 insertions(+), 38 deletions(-)

-- 
2.25.1


