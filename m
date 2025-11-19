Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6F9FCF256C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 03:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=27SAYyrLovjO8qeXsMMReuLQ0OPZEedxIr7aZRb0Rpc=; b=4TBX3qERmWi5AsGb603Xg5G4k9
	Xdf2ALC4UnWOOCw28kCO7ghpdrqF6TjwSo1Q898nkUorm8+GyiO12BnJazCmbB39IJ1y/C+vt7xkg
	SYL5Qw8Pw0FxkJnw/hhBxSGQ4VkWEaGlPvAxqRL+P8mj6nqPtPW5rPpXmkBt5OtF04C5R9On3ovP3
	W4dBPfgUVGBFV9DPAfZLpijD/GtBYDOAqdGcwXvYGzo9/rPcJhgYJzN1ibv/g0kF3ocEB/27PyimL
	KRL9mdUhKVM1Y8E1PVLG6XI4hgTIK1ITM5Hypr5XECWxq1xRyU/zKd+27AdA/RjdrdxXnNetDVx+f
	rB9HZUHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLYx4-00000001TUs-3UpF;
	Wed, 19 Nov 2025 03:33:50 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLYx1-00000001TUL-41qJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 03:33:49 +0000
Received: from DESKTOP-L0HPE2S (unknown [124.16.141.245])
	by APP-03 (Coremail) with SMTP id rQCowAAXpdeUOh1pnpc_AQ--.34112S2;
	Wed, 19 Nov 2025 11:33:42 +0800 (CST)
From: Haotian Zhang <vulab@iscas.ac.cn>
To: lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org
Cc: robh@kernel.org,
	bhelgaas@google.com,
	michal.simek@amd.com,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Haotian Zhang <vulab@iscas.ac.cn>
Subject: [PATCH] PCI: xilinx: Fix INTx IRQ domain leak when MSI allocation fails
Date: Wed, 19 Nov 2025 11:33:01 +0800
Message-ID: <20251119033301.518-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: rQCowAAXpdeUOh1pnpc_AQ--.34112S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJr4UXr17Cr4DWw1kCFyDJrb_yoW8Jw4DpF
	WDGw17uF4DJFW5WF4UC3W5ua43Wa9Fyryqy3yIgwnrZF13u3yjkF1jgFyFvF1rJF48Jr1U
	Zr18t3WrZF15CF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUB014x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F
	4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
	7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r
	1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02
	628vn2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCY02Avz4vE14v_Gr4l42xK82IYc2Ij64
	vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8G
	jcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2I
	x0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK
	8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I
	0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU1GQDUUUUU
X-Originating-IP: [124.16.141.245]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiDAULA2kdElRw1gABsU
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_193348_370532_5A773A10 
X-CRM114-Status: GOOD (  10.19  )
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

In xilinx_pcie_init_irq_domain(), if xilinx_allocate_msi_domains()
fails after pcie->leg_domain has been successfully created via
irq_domain_create_linear(), the function returns directly without
cleaning up the allocated IRQ domain, resulting in a resource leak.

Add irq_domain_remove() call in the error path to properly release the
IRQ domain before returning the error.

Fixes: 699ca3016268 ("PCI: xilinx: Check for __get_free_pages() failure")
Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
---
 drivers/pci/controller/pcie-xilinx.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/pcie-xilinx.c b/drivers/pci/controller/pcie-xilinx.c
index 937ea6ae1ac4..e8cf320f3764 100644
--- a/drivers/pci/controller/pcie-xilinx.c
+++ b/drivers/pci/controller/pcie-xilinx.c
@@ -480,8 +480,10 @@ static int xilinx_pcie_init_irq_domain(struct xilinx_pcie *pcie)
 		phys_addr_t pa = ALIGN_DOWN(virt_to_phys(pcie), SZ_4K);
 
 		ret = xilinx_allocate_msi_domains(pcie);
-		if (ret)
+		if (ret) {
+			irq_domain_remove(pcie->leg_domain);
 			return ret;
+		}
 
 		pcie_write(pcie, upper_32_bits(pa), XILINX_PCIE_REG_MSIBASE1);
 		pcie_write(pcie, lower_32_bits(pa), XILINX_PCIE_REG_MSIBASE2);
-- 
2.50.1.windows.1


