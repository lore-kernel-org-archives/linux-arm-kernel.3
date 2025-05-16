Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F498C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 00:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JjiUdzwTlgF7w0URyU++Kki15dFMFT3VBhtDDAzpQtQ=; b=aWlOFZ9Bq+JsX76rLPOHjwT0ST
	fU95PEyj02VBalZhiy5LiKMFxp6fpi2wgb8EKlErv9FgU3/h10SSDkNdC3p9KwfPVhsejJ8JAWq6U
	cnvXNCoevwT8TXZdVD0OnPWRu15//jIyeBmroanZ1k0sINdr4V5QHj/lR6aVisL46Bz/xc0No2hbt
	C8T+ppGgb6DASGR8ABpSjzukfn8NGumoZAJBczFp936Xa5p3ctiUQ7D8TPtF2tKxYyuMgvQqp9L4U
	mZi9kEK4SuXW7qLHPc9iPlA0m6gHZRvb3MCIqM3efGTuoYicZ4B+i0K1lpmcqQg/D8OM08wS/esha
	AQ7xhuTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFj5x-000000029CV-0vY4;
	Fri, 16 May 2025 00:38:37 +0000
Received: from zg8tmja5ljk3lje4ms43mwaa.icoremail.net ([209.97.181.73])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFj2q-000000028ss-41u0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 00:35:27 +0000
Received: from E0005182DT.eswin.cn (unknown [10.12.97.162])
	by app2 (Coremail) with SMTP id TQJkCgAHp5UziCZokJV8AA--.28341S2;
	Fri, 16 May 2025 08:35:03 +0800 (CST)
From: weishangjuan@eswincomputing.com
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	richardcochran@gmail.com,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	p.zabel@pengutronix.de,
	yong.liang.choong@linux.intel.com,
	rmk+kernel@armlinux.org.uk,
	jszhang@kernel.org,
	inochiama@gmail.com,
	jan.petrous@oss.nxp.com,
	dfustini@tenstorrent.com,
	0x1207@gmail.com,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Cc: ningyu@eswincomputing.com,
	linmin@eswincomputing.com,
	lizhi2@eswincomputing.com,
	weishangjuan <weishangjuan@eswincomputing.com>
Subject: [PATCH v1 0/2] Add driver support for Eswin eic7700 SoC ethernet controller
Date: Fri, 16 May 2025 08:34:49 +0800
Message-ID: <20250516003451.682-1-weishangjuan@eswincomputing.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: TQJkCgAHp5UziCZokJV8AA--.28341S2
X-Coremail-Antispam: 1UD129KBjvdXoWrur1rAr1kXr1kKw4DXw1fWFg_yoWkGwb_Cr
	n7Zr95Ja1UXF4jvayjkrs7ur909F4DJryfCFs8AFWav3sFq3yDGF95A34kZF18Gr4rJF9x
	Wryft34Iyw12gjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbhxFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
	Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwAKzVCY07xG64k0F24lc7CjxVAaw2AFwI0_GFv_Wrylc2xSY4AK6svPMxAIw2
	8IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4l
	x2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrw
	CI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI
	42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z2
	80aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7sRifHU3UUUUU==
X-CM-SenderInfo: pzhl2xxdqjy31dq6v25zlqu0xpsx3x1qjou0bp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_173525_295602_D582DF44 
X-CRM114-Status: UNSURE (   9.83  )
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

From: weishangjuan <weishangjuan@eswincomputing.com>

  Introduce a driver for the Eswin eic7700 series SoC ethernet controller,
  adding support for the ethernet functionality in the Linux kernel. The
  driver provides basic functionality to manage and control the ethernet
  signals for the eic7700 series chips, which are part of the Eswin SoC family.

  Supported chips:
    Eswin eic7700 series SoC.

  Test:
    I tested this patch on the Sifive HiFive Premier P550 (which uses the EIC7700 SoC),
    including system boot and ethernet.

weishangjuan (2):
  ethernet: eswin: Document for eic7700 SoC
  ethernet: eswin: Add eic7700 ethernet driver

 .../bindings/net/eswin,eic7700-eth.yaml       | 142 +++++
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 +
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-eic7700.c   | 521 ++++++++++++++++++
 4 files changed, 675 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-eic7700.c

-- 
2.17.1


