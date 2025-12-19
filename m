Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D546AD711CC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 02:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bVkW/oOJ3zyOi4kAr1KcE1pFjF8ucick+T1vwSZi274=; b=lhyaOE6Qq5yhDFDWQIFjjioD+v
	1qkgCQ/03IZ2aCVVeDWLnqrSA+Rfcz1/YTLLMPojBDGshwm+5NfjIAdD+ytcYGIjHPlu9RGHyDxCO
	JeBUdt8G1z4zIhH79KGMA5DmyWR8f2U6y0W2FP7GgUlyWFj0JI+k8kX7frQtQkfE5LAb5OEwmXWTk
	ZzSzsjVTyrChV6Vfs+MymS5IJBXYZYgjWJhqIuXtgbC9hOYyxKXBPowGjTvGJRJO1jwMzT4EXM5DS
	/MBwN7j2i3HrD7E6/D66+qqRRHUHe5m2LNcgGttJBUY6cB/j7W5jdbIMPlCkpNGyc0GciSV6D4vWS
	UjGkiO0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWQ32-00000009U6y-2Trc;
	Fri, 19 Dec 2025 02:16:52 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWQ2z-00000009U65-0dnb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 02:16:51 +0000
Received: from DESKTOP-L0HPE2S (unknown [124.16.141.245])
	by APP-05 (Coremail) with SMTP id zQCowACHGAyFtURp2kMjAQ--.22672S2;
	Fri, 19 Dec 2025 10:16:39 +0800 (CST)
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
Subject: [PATCH v3] PCI: xilinx: Fix INTx IRQ domain leak in error paths
Date: Fri, 19 Dec 2025 10:16:15 +0800
Message-ID: <20251219021615.965-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1.windows.1
In-Reply-To: <20251119033301.518-1-vulab@iscas.ac.cn>
References: <20251119033301.518-1-vulab@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowACHGAyFtURp2kMjAQ--.22672S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJr4UXr17CrWxtr4xuryrCrg_yoW5JF1rpF
	4DCw47uF4UJFWUuF47G3W5uFy3Wa9Fk34qy3yYgwnrZr13CrWDCF10qFnakF4FvFW8Jr18
	Ar1xt3Wruw47CFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9014x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVWxJr
	0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x
	0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2
	zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF
	4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWU
	CwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIda
	VFxhVjvjDU0xZFpf9x0JUd-B_UUUUU=
X-Originating-IP: [124.16.141.245]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCREAA2lEGBxvagABs2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_181649_548169_FDC5E134 
X-CRM114-Status: GOOD (  12.76  )
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
In xilinx_free_msi_domains(), pcie->leg_domain is also neglected.

Add irq_domain_remove() call in the error path to properly release the
IRQ domain before returning the error. Rename xilinx_free_msi_domains()
to xilinx_free_irq_domains() and add the release of pcie->leg_domain
in the function.

Fixes: 313b64c3ae52 ("PCI: xilinx: Convert to MSI domains")
Suggested-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
---
Changes in v3:
  - Rename xilinx_free_msi_domains() to xilinx_free_irq_domains()
    and add the release of pcie->leg_domain in the function as
    suggested by Manivannan Sadhasivam.
---
Changes in v2:
  - Correct the Fixes tag to point to the commit that introduced the
    legacy IRQ domain leak on MSI allocation failure.
---
 drivers/pci/controller/pcie-xilinx.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/controller/pcie-xilinx.c b/drivers/pci/controller/pcie-xilinx.c
index 937ea6ae1ac4..4aa139abac16 100644
--- a/drivers/pci/controller/pcie-xilinx.c
+++ b/drivers/pci/controller/pcie-xilinx.c
@@ -302,9 +302,10 @@ static int xilinx_allocate_msi_domains(struct xilinx_pcie *pcie)
 	return 0;
 }
 
-static void xilinx_free_msi_domains(struct xilinx_pcie *pcie)
+static void xilinx_free_irq_domains(struct xilinx_pcie *pcie)
 {
 	irq_domain_remove(pcie->msi_domain);
+	irq_domain_remove(pcie->leg_domain);
 }
 
 /* INTx Functions */
@@ -480,8 +481,10 @@ static int xilinx_pcie_init_irq_domain(struct xilinx_pcie *pcie)
 		phys_addr_t pa = ALIGN_DOWN(virt_to_phys(pcie), SZ_4K);
 
 		ret = xilinx_allocate_msi_domains(pcie);
-		if (ret)
+		if (ret) {
+			irq_domain_remove(pcie->leg_domain);
 			return ret;
+		}
 
 		pcie_write(pcie, upper_32_bits(pa), XILINX_PCIE_REG_MSIBASE1);
 		pcie_write(pcie, lower_32_bits(pa), XILINX_PCIE_REG_MSIBASE2);
@@ -600,7 +603,7 @@ static int xilinx_pcie_probe(struct platform_device *pdev)
 
 	err = pci_host_probe(bridge);
 	if (err)
-		xilinx_free_msi_domains(pcie);
+		xilinx_free_irq_domains(pcie);
 
 	return err;
 }
-- 
2.50.1.windows.1


