Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42BD2C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 18:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jXbSVytevldhOW6yTI16BOZbfAnBjooyTrFkgreq94E=; b=Xyiy5JpSFYav6Q4ujVLidOWfmi
	umgP9j9+Pu/7FR9/SFfOGr/6NTw6fF3REI3FN61sCY2MEVpjD7JS900cueNumSq6OIVGRBmN39jA5
	jZfuFYklPdWNuB4CVHDFKfr/SwnF2zUXLOuLey2n7+IFLisV6II0BHnyPTXtWxUXEyPb28/2GE633
	THgIUhdTQFJLzRYcbPQi8y/FZOY6CG3/y+8+25KW4yu96CjQTerDMoK8BQDpG/Ofnl73XYB4CnOok
	+PFb9PGhmHGcPI/3xICDq3jSxZZsOBCrkFl06HL/EVSLmfLSwfYaZwOLkm0AIn89+/drvIATAo13j
	N6jEd1LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tj0NI-0000000Frmv-3XL2;
	Fri, 14 Feb 2025 18:25:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tizfY-0000000FkX6-0H48
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 14 Feb 2025 17:40:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=jXbSVytevldhOW6yTI16BOZbfAnBjooyTrFkgreq94E=; b=W2QN96tQq9d5hfaDDvY0p1ABi4
	EDIvaRqZVcX36kOF2EqMYSgyNKLM0AucrNNCYpJW8WMRRiZtrjL5GeI8W3RPjtdkbpQ7nSZ30xRFH
	k9h+esPqJx77PwMl+c1f3GgHyferfGMWDbTlncLfSgiJ1KEPfg2Slqdk7HGNxQaBu8kYCl9TZzw4F
	OAcdBjzJB0BNDX832MAYtfhZkfHLr3zPh8jYE5+fy5FRzlezW1m5pdcUidfzVyfHJ4Q01KpGu4MB+
	1pVtN60C4l+7/T3WMAwK3aXGPdttr+F+wexmVbVGdaGTjF7e2E/K5Pp/fZuqksfzaiw+c0W3eC8gH
	zwwh6WbQ==;
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tizfV-00000001IEY-12Ms
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 17:40:02 +0000
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-72708b0db90so690930a34.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Feb 2025 09:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1739554799; x=1740159599; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jXbSVytevldhOW6yTI16BOZbfAnBjooyTrFkgreq94E=;
        b=Oc1pPVyoGKoOet9nExmhUefL+2fleTIlEp3iTDXiCQAwxlbtFSAawgfIMjcJOciVZl
         h30NaxMXzdn1hlyHYzhOYtFR3lTlL+mqykxdncdI+v8Hnupescg+//XRgCJxkNtvrXVj
         czcFOOhGwmwkiqGaLLDIJG3NpGedeZSxru8OI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739554799; x=1740159599;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jXbSVytevldhOW6yTI16BOZbfAnBjooyTrFkgreq94E=;
        b=Ef9YeyHgnZ1exveik7ZFSoIuE0HW74uFcv8k66VUURKMUvCrCiR40Ou5HUFB5sDUfi
         2Vvwlqx+TSLeyTXVRGdvba7RsPhY8BS1Zdv6pcKk8VM1iVz/XlnrXiJBzPoyBkfXS+CW
         jEBsRZC5OY8WXEVZCPOOZdZ8BHnqF5OE+w2MhoBtz36GpDbepi10o9BUohkp3WGTYihf
         eEOQlHOhyOUMjSHhPPdk0xgoLouMrD73UVs1Uazymy8vUt5jtjqtvngibpcuUkc5JUtt
         FNfHQ8ThO77UXaIY0Ny9Y6CJyQxfxr8kIVs3RG6BHmNtOqoXMoDiMyOUO0CcUY2nQ0S7
         RU8A==
X-Forwarded-Encrypted: i=1; AJvYcCWLC946HEHbe8L4nZL1k4xlAOe8/F/shnv23FtXdok7f8IrCmwn1NVXsof2uCE8Ic0tq89r/XxdX5EFsWTuZFgX@lists.infradead.org
X-Gm-Message-State: AOJu0YySgt5ssJKDju+AWEJqSDMefaac0bDupiGS35stLwp2uzka5W5f
	taFSq4bVSh1Xy2synzKgmUiBv5T3XtWgGtgj/lS6vfjDOzneukCtzMiY5xwJKwbZe/cXEK8iMZH
	s7g==
X-Gm-Gg: ASbGnct4FpAxO16qUUdPGRXi9L/ySdGW7H+/0Ypf+SU2nlDbyuk6Hv776Caqby3x/aI
	H3O8khCaBEsyTn5xDFx378SC0thG/rdpc3Ydc2V//+NteBug76dKMaw5PDFuPiN+id/Sj0cK7O1
	7GdJlqcjrHKNOEJYMgxGgik+xiQduVaX9So+tOtAi06wXhjmxmCn8v6nn3dU2Ka3u0zPT5EQbLr
	nR9sEyhF8tU2nx7F7ymmuADJ23QWjTe/Cmv07y8AlExo6rZ5lOfsFdCFBSS1neo9mgS7FM9t7jM
	VMzkZYK7mV39H5gxumODllPo7Queto/T5CrppaocuTg33DDhW3nuCWOGGuVgKhJEie5cocA=
X-Google-Smtp-Source: AGHT+IHswiwCPm7v4tYhF6/KFpk1Gc9mqP45iu1cae5YdAzQ3o5pgDycSQ+Qw63bZd0jTXMIoI2SqQ==
X-Received: by 2002:a05:6830:6e9a:b0:727:ec1:73ad with SMTP id 46e09a7af769-72712043690mr27736a34.11.1739554798795;
        Fri, 14 Feb 2025 09:39:58 -0800 (PST)
Received: from stbsrv-and-02.and.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5fcb17a4ca4sm1284073eaf.30.2025.02.14.09.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 09:39:58 -0800 (PST)
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
	Andrew Murray <amurray@thegoodpenguin.co.uk>,
	Jeremy Linton <jeremy.linton@arm.com>,
	linux-rpi-kernel@lists.infradead.org (moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 2/8] PCI: brcmstb: Write to internal register to change link cap
Date: Fri, 14 Feb 2025 12:39:30 -0500
Message-ID: <20250214173944.47506-3-james.quinlan@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250214173944.47506-1-james.quinlan@broadcom.com>
References: <20250214173944.47506-1-james.quinlan@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_174001_365486_031B2A97 
X-CRM114-Status: GOOD (  11.56  )
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

The driver was mistakenly writing to a RO config-space register
(PCI_EXP_LNKCAP).  Although harmless in this case, the proper destination
is an internal RW register that is reflected by PCI_EXP_LNKCAP.

Fixes: c0452137034bda8f686dd9a2e167949bfffd6776 ("PCI: brcmstb: Add Broadcom STB PCIe host controller driver")

Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
---
 drivers/pci/controller/pcie-brcmstb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
index 64a7511e66a8..98542e74aa16 100644
--- a/drivers/pci/controller/pcie-brcmstb.c
+++ b/drivers/pci/controller/pcie-brcmstb.c
@@ -413,10 +413,10 @@ static int brcm_pcie_set_ssc(struct brcm_pcie *pcie)
 static void brcm_pcie_set_gen(struct brcm_pcie *pcie, int gen)
 {
 	u16 lnkctl2 = readw(pcie->base + BRCM_PCIE_CAP_REGS + PCI_EXP_LNKCTL2);
-	u32 lnkcap = readl(pcie->base + BRCM_PCIE_CAP_REGS + PCI_EXP_LNKCAP);
+	u32 lnkcap = readl(pcie->base + PCIE_RC_CFG_PRIV1_LINK_CAPABILITY);
 
 	lnkcap = (lnkcap & ~PCI_EXP_LNKCAP_SLS) | gen;
-	writel(lnkcap, pcie->base + BRCM_PCIE_CAP_REGS + PCI_EXP_LNKCAP);
+	writel(lnkcap, pcie->base + PCIE_RC_CFG_PRIV1_LINK_CAPABILITY);
 
 	lnkctl2 = (lnkctl2 & ~0xf) | gen;
 	writew(lnkctl2, pcie->base + BRCM_PCIE_CAP_REGS + PCI_EXP_LNKCTL2);
-- 
2.43.0


