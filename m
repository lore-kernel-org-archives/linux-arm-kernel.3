Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCC9FC02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 18:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TsOCGGo9ceVGY3SPzwGNmGL7lbsQrpsFZ6ZHHv/lIws=; b=fHCVGWkRlTchykhkjCDpQQi29K
	WAVCJcl+ZzIkC6ml/LZH73NohIAYP1O3jymHj8oXjUkhdDuZ/sid51fEHs/d0HyI/mvI1s1HjN67J
	RfZPJ6e7/LTD0W3YLj0oTEO4EWRze5EMXPZU6G/1LSKBsEW7qd+JVQXicnNy1FngZaQZAbdq4gj45
	/rHzw5SG7pPsKjf1JQixZ3RKNrC8vKsXqly3SlyAh7NjlhxVPtf19VHdyFVFrxpPAutwcasHOW2ZH
	vcZzaqShvOjsSnWJ/epcIK5BRSIsFIyqhNdP+urFKRU1oecUpUexBLodXjRB9I4uLw5hSPNlzbLFt
	U/cqQ8OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tj0Vo-0000000FtWP-0A53;
	Fri, 14 Feb 2025 18:34:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tizfo-0000000FkdN-0ahA
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 14 Feb 2025 17:40:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=TsOCGGo9ceVGY3SPzwGNmGL7lbsQrpsFZ6ZHHv/lIws=; b=Cq21K3tEO5mlldpvf/65rUH+qk
	8eNIxZGWqs0A1KhGog7NvPAzXf2iqssi/7Bik/E2+rIvhNnhUhUcXWwKAseg0NzEdzzAj7R158ZJG
	Z8141NnpNXw3dJ8SPCxY/sOppMxF8sVv8ER4rXXm3d5yyf7E5Xa+S7aio2xLv16tGpbAnmgIJuYKL
	YEo8ISvLkb0o4JQKPv8xR3ja72gqsz3BlLK48tScyuEZGjQOUwQHBSgksYbMdEiVySLO2fhwHKUUK
	Q7JOoqwD8ZWYckgepcYJLyPI5lPzxNBh1bnJ3vAz1ylhxYSrj6k4gx5c07urZ2Pw+QNghWNX3filS
	YDClZCdA==;
Received: from mail-oo1-xc33.google.com ([2607:f8b0:4864:20::c33])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tizfj-00000001II3-42Hf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 17:40:17 +0000
Received: by mail-oo1-xc33.google.com with SMTP id 006d021491bc7-5f6b65c89c4so643464eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Feb 2025 09:40:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1739554813; x=1740159613; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TsOCGGo9ceVGY3SPzwGNmGL7lbsQrpsFZ6ZHHv/lIws=;
        b=Ic6Nzlt3j7sLc0QBSYxp6aCxdJQPKeZaXd35DF5T61vW8ozCFAj4/UEflhJmxkeyYQ
         kmJz3biml6l6KoHlaehN2fUQ+OxQ32te/Dgxn4xsLC3HunwMuXuOco29J56BGd9617fP
         Ikclv5CYYCCt+b94ytP8JEcyCwknC94OR9KNo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739554813; x=1740159613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TsOCGGo9ceVGY3SPzwGNmGL7lbsQrpsFZ6ZHHv/lIws=;
        b=L62QbmLnlIa3V1ZqOWpX/RHlc1rGCI4x25z+h6lCG8IIiKBi+LXG6YNf1L3GF/gqoY
         KPk6tGJgUj2HdTSTOJblDZNlZ5uJJ5vriqzvyiBQhaTkZUH6I98CbJTn4ThaPMu2+3Gq
         TV+beO3k3LRdCwdXM3IoQFH2GQ6xlPu+QMwwDFvef3dPWJZeTGFTOZ2+USjRUnU2xAN0
         k2OnDKiVhizNabhTax6flWD0nxFgETWNx5rA31aYAy0WwDI1Z8dhlRmCCpKBeRPvOqOA
         QIffPMvg9eiIRy/rR3zKbJAmesiLrselrd2QNLzmH3prUQ+bfSdmLA7HlCSJK7/yUzrA
         RMUA==
X-Forwarded-Encrypted: i=1; AJvYcCWtxAwy0LqxDVMW1Td7oj+bWppgNVawm3Fy1vfd8vCcy8CT+uin6sox3gG1Sl5V53793C40LhNXg+eQQwmuO0g5@lists.infradead.org
X-Gm-Message-State: AOJu0Yxcno8DBppQy3p844+40qyYGh6V8A+kwTZV/9i1OTTbw9yn4KvJ
	MLniVCtFEyB963zLtLYeXzc5DicMRK8hDvjbvhHccKEA+xCS9kvyC5ziCdKukQ==
X-Gm-Gg: ASbGncuR3BaPsT//Ovh+HvuBNH6GHG4sBHcKhmatH4YHSrCvdMGRSfmu3QGZQAptEyA
	k3NYu3+MchqAHpDtV2fKjPEt1ZpBlfh6i/3orYFrNkAVMjZQYl4XPdB2i2ZKEcG2pe4bD750xq2
	4elXMr6mascIE+HYktyp1nJzXt+eD/STBHNZKk6WdAPlZmQt6jm0sS+JTS7vK3XBvi3LXVGOEkb
	1pZ3AC2LHCtGyFKkXdEJ/xhjGYOLV0FpHPXWzFOqQkQxPmZZ7QvyW6LDrB5Wx4wMzRBmkmMPoKD
	RNnRLZNBof8C71y0xQS3H90Gb34cbP6fHTCK1dty3Bp0elenBt8QRMONT9KGhOVIVgDte7k=
X-Google-Smtp-Source: AGHT+IEHK/RYufUjO2+odce57Cx5Dp9JDUKZ5jsTgSO+dN2Z245MJjJKtjxMOKhmnO9Jpvg4aHpnVA==
X-Received: by 2002:a05:6820:310a:b0:5fc:9bb2:f78 with SMTP id 006d021491bc7-5fcaf564190mr4940899eaf.8.1739554813562;
        Fri, 14 Feb 2025 09:40:13 -0800 (PST)
Received: from stbsrv-and-02.and.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5fcb17a4ca4sm1284073eaf.30.2025.02.14.09.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 09:40:12 -0800 (PST)
From: Jim Quinlan <james.quinlan@broadcom.com>
To: linux-pci@vger.kernel.org,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Cyril Brulebois <kibi@debian.org>,
	Stanimir Varbanov <svarbanov@suse.de>,
	bcm-kernel-feedback-list@broadcom.com,
	jim2101024@gmail.com,
	james.quinlan@broadcom.com
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>,
	linux-rpi-kernel@lists.infradead.org (moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 6/8] PCI: brcmstb: Use same constant table for config space access
Date: Fri, 14 Feb 2025 12:39:34 -0500
Message-ID: <20250214173944.47506-7-james.quinlan@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250214173944.47506-1-james.quinlan@broadcom.com>
References: <20250214173944.47506-1-james.quinlan@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_174016_111737_0DB23E30 
X-CRM114-Status: GOOD (  14.63  )
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

The constants EXT_CFG_DATA and EXT_CFG_INDEX vary by SOC. One of the
map_bus methods used these constants, the other used different constants.
Fortunately there was no problem because the SoCs that used the latter
map_bus method all had the same register constants.

Remove the redundant constants and adjust the code to use them.  In
addition, update EXT_CFG_DATA to use the 4k-page based config space access
system, which is what the second map_bus method was already using.

Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
---
 drivers/pci/controller/pcie-brcmstb.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
index e1059e3365bd..923ac1a03f85 100644
--- a/drivers/pci/controller/pcie-brcmstb.c
+++ b/drivers/pci/controller/pcie-brcmstb.c
@@ -150,9 +150,6 @@
 #define  MSI_INT_MASK_SET		0x10
 #define  MSI_INT_MASK_CLR		0x14
 
-#define PCIE_EXT_CFG_DATA				0x8000
-#define PCIE_EXT_CFG_INDEX				0x9000
-
 #define  PCIE_RGR1_SW_INIT_1_PERST_MASK			0x1
 #define  PCIE_RGR1_SW_INIT_1_PERST_SHIFT		0x0
 
@@ -727,8 +724,8 @@ static void __iomem *brcm_pcie_map_bus(struct pci_bus *bus,
 
 	/* For devices, write to the config space index register */
 	idx = PCIE_ECAM_OFFSET(bus->number, devfn, 0);
-	writel(idx, pcie->base + PCIE_EXT_CFG_INDEX);
-	return base + PCIE_EXT_CFG_DATA + PCIE_ECAM_REG(where);
+	writel(idx, base + IDX_ADDR(pcie));
+	return base + DATA_ADDR(pcie) + PCIE_ECAM_REG(where);
 }
 
 static void __iomem *brcm7425_pcie_map_bus(struct pci_bus *bus,
@@ -1711,7 +1708,7 @@ static void brcm_pcie_remove(struct platform_device *pdev)
 static const int pcie_offsets[] = {
 	[RGR1_SW_INIT_1]	= 0x9210,
 	[EXT_CFG_INDEX]		= 0x9000,
-	[EXT_CFG_DATA]		= 0x9004,
+	[EXT_CFG_DATA]		= 0x8000,
 	[PCIE_HARD_DEBUG]	= 0x4204,
 	[PCIE_INTR2_CPU_BASE]	= 0x4300,
 };
@@ -1719,7 +1716,7 @@ static const int pcie_offsets[] = {
 static const int pcie_offsets_bcm7278[] = {
 	[RGR1_SW_INIT_1]	= 0xc010,
 	[EXT_CFG_INDEX]		= 0x9000,
-	[EXT_CFG_DATA]		= 0x9004,
+	[EXT_CFG_DATA]		= 0x8000,
 	[PCIE_HARD_DEBUG]	= 0x4204,
 	[PCIE_INTR2_CPU_BASE]	= 0x4300,
 };
@@ -1733,8 +1730,9 @@ static const int pcie_offsets_bcm7425[] = {
 };
 
 static const int pcie_offsets_bcm7712[] = {
+	[RGR1_SW_INIT_1]	= 0x9210,
 	[EXT_CFG_INDEX]		= 0x9000,
-	[EXT_CFG_DATA]		= 0x9004,
+	[EXT_CFG_DATA]		= 0x8000,
 	[PCIE_HARD_DEBUG]	= 0x4304,
 	[PCIE_INTR2_CPU_BASE]	= 0x4400,
 };
-- 
2.43.0


