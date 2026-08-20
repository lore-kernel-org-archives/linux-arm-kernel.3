Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AFF9C5DF85
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 13:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ne4vpn6S8dDIeQGKLcmrAac8qYrgoBlC4Ci88bD6Wpk=; b=fkbVGX7poBV1tAYr4FJJ8fiCEE
	kqKnjzfZDn8sHMUlEsXb7axmVMH+IjRkb9j7PTxzh9wlKKv6lVzxzsIw8XrbYlI6d8fbH7AhhWoyF
	XIMhc0R6mqqMO5EC3sjHhFfT3DxsKwrHnkkAdwDNWplbkMemHv6eXe1dklgRS6u18x5Q2BVHtozI2
	C4qfhGktWlHdAx+aPbRTf/wnG/dp9HF66vANfhFdKj14kx3qXSiAdHB9KSFtxFmAZXVgqSx8YGBj+
	rsh0sD3GhvH9MGKsCADjeBIvgOBpefofFPWzZGENlnRTsH9OKEqAl4HFtPAum6OepWnXPvDtaTboD
	Y6RzSFUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx3Fl-0000000Be2w-2ji4;
	Thu, 20 Aug 2026 13:56:21 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx3Fi-0000000Be2H-3cXS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 13:56:20 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2cacf197759so28902235ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 06:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787234177; x=1787838977; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ne4vpn6S8dDIeQGKLcmrAac8qYrgoBlC4Ci88bD6Wpk=;
        b=XMtqzRH7frTQmg3+ueGeRsM4DBxZWLfLXUiedpwJIMghLqWgbg32Dqa1oUcIXgsnlV
         adJOMw+5GeKBJ4qHyE17pFMZhkkqeL/R2X3ZuxHSiz+ab/qHzrMtbJF773omJHaPnLYY
         x+1FuaY8Q7GXreP0LR8XEXef3z1ZvaM3kylAW54fDyC79e+VXK6juRw8Lz7rA1jt75Vh
         /z0LTinqmhPaZRJlsNb9oOKoVaxwGY078eOhJjy5Dfzls7Hj2eE5gvUSDxPwB59zrPRN
         y+tl7QaEgDqW8JX1qw0n6pfclf+v4DOuQr02Q4wFkNWPS9U3tdcyXtfx49CB9ayTrKZh
         r/7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787234177; x=1787838977;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ne4vpn6S8dDIeQGKLcmrAac8qYrgoBlC4Ci88bD6Wpk=;
        b=SgfN9hmF8K8FVkKX/4CarxrGaah3K3l1efpeCPei8WYmtOw9hKBVbUF5jHfb8fcSx/
         Rg/xdh07PxZuG0cMVN+XSf6Uo6Ymu9AYcRnq/GMjQNaUbrjIDbAXc54vjwSUrvOpvQqs
         R+YQ7vmuL4HOTHvQaGHlaqQw0X5cduSmBpg2Mx78O8tG4fKVcl72Os0n5S0VonwisS5x
         wLJZ4yMlcnkhLi1tIYh7NyO8bp6wWUbXa/XZXlSqZPKi8QRukPaGCSSXMwKZktlIhM0N
         LxFC9jNyFJQWShNEzQmxngG/SW/0FlJ42K5SN/jFxcSkeTLl7+eho4nsEI1SWF//5bR9
         BCZQ==
X-Gm-Message-State: AFuF++n7xFZmpO81+ykVr0REQZwDuRwB9PA2zXpmfdi7AwGGqhAmlVwS
	Tj6f73nmjqyN9tF5pVBty7WCLeXLwP0OdkvLFyt+I5uRNxrMrJB1WqZL
X-Gm-Gg: AR+sD11OK6UuaARuSHF/22Ee5U81k9/jGJ8AKX5DHErE1mSheohbSiuK4OsW/UV3Gvp
	y9JacNQGzG/1u8YQ8stB8UsWahL6L1Y7nRi0GnsamK4+5OsyGMC9OmGcZ1OxG9xHNG8T0J9JRh6
	7fmTORKlSSiCSD9q4QkFLaB/a9j/OzssHK6Ph86CDywx4CHRPnrN/iESxgmDeDkRPV+9iGK1iZV
	L71kec3p+YTKAtdcsiLihQRqYRnAQvFpmNkRlzD1lwEUW3ABUkbU2fF0z3ji5PQZuFpHOkob46u
	95vlb7tsHCoji569znsf7HErMy/01bQ+EF4D5n+gL7Fku5elu2HBEAJ+Xq1qRwn6apPhfjVUoSP
	HLhEZgmlFexA0noq7wO9FUjEh4VMa/AoCxB1Um1cETC0OgSwO01r4U74W6w+gBUftiYNqVwXmON
	Q4GnrrChiIGrvxcRN3/cPbi3yeIj+fi6ixvsIC/OKD5Up8L9kTzzEpyviV/rTRRZBX0nwWnh+4L
	0EyfnqS
X-Received: by 2002:a17:902:e551:b0:2ce:93a3:c168 with SMTP id d9443c01a7336-2d5fd7147cdmr238498905ad.7.1787234177379;
        Thu, 20 Aug 2026 06:56:17 -0700 (PDT)
Received: from haichao.tail057a43.ts.net ([2001:da8:e000:1206:85a4:b9cf:b578:4307])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d62e36e1e3sm7476405ad.44.2026.08.20.06.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 06:56:16 -0700 (PDT)
From: Ruoyu Wang <ruoyuw560@gmail.com>
To: Shuai Xue <xueshuai@linux.alibaba.com>,
	Jing Zhang <renyu.zj@linux.alibaba.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	Markus Elfring <Markus.Elfring@web.de>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ruoyu Wang <ruoyuw560@gmail.com>
Subject: [PATCH v2] perf/dwc_pcie: Fix PCI device reference leak in probe
Date: Thu, 20 Aug 2026 21:56:11 +0800
Message-ID: <20260820135611.3901886-1-ruoyuw560@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_065618_909717_86931903 
X-CRM114-Status: GOOD (  16.26  )
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

pci_get_domain_bus_and_slot() returns a referenced PCI device. When the
subsequent RAS DES capability lookup fails, dwc_pcie_pmu_probe() returns
-ENODEV without releasing that reference. Repeated failed probes can
therefore keep the PCI device allocated after removal.

Declare the looked-up device with __free(pci_dev_put), so the temporary
reference is released on every return path. Keeping the reference scoped
to the whole probe also covers all later uses of the device during
initialization.

This issue was found by a static analysis checker and confirmed by manual
source review.

Fixes: 7f35b429802a ("perf/dwc_pcie: fix duplicate pci_dev devices")
Suggested-by: Markus Elfring <Markus.Elfring@web.de>
Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>
---
Changes in v2:
- Manage the lookup reference with __free(pci_dev_put).
- Keep the reference scoped through the complete probe.

Link: https://lore.kernel.org/r/20260814133925.1385687-1-ruoyuw560@gmail.com/
---
 drivers/perf/dwc_pcie_pmu.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/perf/dwc_pcie_pmu.c b/drivers/perf/dwc_pcie_pmu.c
index 5385401fa9cf6..0e69bd71c3e61 100644
--- a/drivers/perf/dwc_pcie_pmu.c
+++ b/drivers/perf/dwc_pcie_pmu.c
@@ -694,16 +694,16 @@ static struct notifier_block dwc_pcie_pmu_nb = {
 
 static int dwc_pcie_pmu_probe(struct platform_device *plat_dev)
 {
-	struct pci_dev *pdev;
+	u32 sbdf = plat_dev->id;
+	struct pci_dev *pdev __free(pci_dev_put) =
+		pci_get_domain_bus_and_slot(sbdf >> 16,
+					    PCI_BUS_NUM(sbdf & 0xffff),
+					    sbdf & 0xff);
 	struct dwc_pcie_pmu *pcie_pmu;
 	char *name;
-	u32 sbdf;
 	u16 vsec;
 	int ret;
 
-	sbdf = plat_dev->id;
-	pdev = pci_get_domain_bus_and_slot(sbdf >> 16, PCI_BUS_NUM(sbdf & 0xffff),
-					   sbdf & 0xff);
 	if (!pdev) {
 		pr_err("No pdev found for the sbdf 0x%x\n", sbdf);
 		return -ENODEV;
@@ -713,7 +713,6 @@ static int dwc_pcie_pmu_probe(struct platform_device *plat_dev)
 	if (!vsec)
 		return -ENODEV;
 
-	pci_dev_put(pdev);
 	name = devm_kasprintf(&plat_dev->dev, GFP_KERNEL, "dwc_rootport_%x", sbdf);
 	if (!name)
 		return -ENOMEM;
-- 
2.51.0


