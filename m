Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38817C02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 19:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FyxoQmP+DrPfyNDFU6zDEUm+WeVsHxsrhuRbOaUfCms=; b=FRncvHr2VYBQhx1Y+kG+882E/s
	ujlQO3JH46pmKjWbYuMcJSWpaXCdbnVNl9WMUjpsLQVp5mrgds+BkuePMjrYT4U31YWXZTAj6j8xW
	sM5ufZzDPyEJZ3Z841CuB08aM/VXz8WNtx9d5El41bO12MmwIeouR7J6huyfCuKcjmbPXXQYfK5lw
	CfiGnXDaqN9kHTC/Ve5iRaqN3NR232IMphAfSbT+anvyUTPfU96JMxatPPGX6yFAyGcj8BVRts2z+
	etMaP3Gav/AJZoAU/TlY0uJeagxaubU90SwtYu6/Ht9kBGnHG9lZbMMk7DiIZoA1h0MVkljb8Lwgr
	ShUosdbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfkye-00000004OdW-2Vrl;
	Wed, 05 Feb 2025 19:22:24 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfkpV-00000004MpV-1TgG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 19:12:58 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-21661be2c2dso3506115ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Feb 2025 11:12:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1738782777; x=1739387577; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FyxoQmP+DrPfyNDFU6zDEUm+WeVsHxsrhuRbOaUfCms=;
        b=YK6P/BV/DVZOCczcqYF5i07ngtCCoMEusxvFcw6QlReJl6//jHiLkXRorGHpBft13s
         PKJ7ZdpHR03tPVJ4UpfCPaEg7jyhY30U/Yt/w0JAuCQyyyOaNqo2/6xTqC5s6jDhrT6z
         X6M78F9hDaGe/PT31tOypEg7Q0/lRj1fFrc9U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738782777; x=1739387577;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FyxoQmP+DrPfyNDFU6zDEUm+WeVsHxsrhuRbOaUfCms=;
        b=kE7Are8lhbACREdhekVsUSvvOInyMuoABtrnUWFqjaaFR6swXQixerSoaZJo9sf6ol
         J0toTgzlD9K9jRaRwiO1+2yo/JRCsgBrmUp4P3naDCX7cCg0QZje+Tg9ibtP0msiruB+
         EL3LPdAh2Pl/GOEps/3AO26dX/3DwWdDfuFU7qzMou1/5aJ0cyIkMZbLBny4EvrpbrxL
         IQ57gOEhCDfWUWfQG+jREunNUScSpyACXc+lJ2j6IZrIYMfgMcMpl8LU6fp5/CrQ5PHd
         qYLjLVSvdxvD7Bs+Xz3cSdiHr6JkAQjJVlYHX6/RiKzlVea0WIU0ktUmk6uG6ELULger
         T7ww==
X-Forwarded-Encrypted: i=1; AJvYcCURoQGIlVOJQ+/prfWrWcQg7miefzfrhavX0lyXoleX/7iWATk7/Bg2mJv8NVHh1oMu3yt6QzhvEZ4B/eU7tGK7@lists.infradead.org
X-Gm-Message-State: AOJu0Yyi1g4W72mSez02CiERS7O6XqW75H2XoGamovwwdcaVzcezDHjJ
	SYzKZYBUmJU7lYIP9gJSR0SrY3MZ+tQvcLGvQP97qghbfUkfVm1fKRfnbRraog==
X-Gm-Gg: ASbGncur+zmquGCXNAa7L6Pi12eG8N80FAEV6pGH450LYZmgOnKugvAm75Z+hNAmMKn
	QJR5b/788y3U5h2qyQLOWWTW20zSVZf6ymHUGiMyYduMJeGFrZu++ep7K/nY8qmii2mLCn7EnR8
	M0xtS47Ctfrc5Yiwd/nwGskD6X4M/2jziz41SZjGUmeYU+vmve5FAIhoHu1v+oAf3c97OhvDAIX
	O3VdG4hvQivpzMo0+0GlmNE+z76JF2dB5rR6zhi56IBppZpO3qrH4Hc/SPI5s9KVlde5H0mQPXb
	hVROnn79AyMNM3x7Wlq2hPVUWf01FOQ9I/AqsBRWRSDFid1BZVwaWpc8SBigxRh6+U/Ba80=
X-Google-Smtp-Source: AGHT+IGu6hun4FwjJUr/ASi5VtU1r7KzOWGkU1swFqWYgTtfTk7Rzk7GNGUnU+ZBJXjxJW+oGt6ZSw==
X-Received: by 2002:a05:6a00:3002:b0:725:b201:2362 with SMTP id d2e1a72fcca58-7303511e562mr5701360b3a.11.1738782746930;
        Wed, 05 Feb 2025 11:12:26 -0800 (PST)
Received: from stbsrv-and-02.and.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe69ceb1csm12670842b3a.151.2025.02.05.11.12.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 11:12:26 -0800 (PST)
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
Subject: [PATCH v1 1/6] PCI: brcmstb: Refactor max speed limit functionality
Date: Wed,  5 Feb 2025 14:12:01 -0500
Message-ID: <20250205191213.29202-2-james.quinlan@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250205191213.29202-1-james.quinlan@broadcom.com>
References: <20250205191213.29202-1-james.quinlan@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_111257_390395_C1535401 
X-CRM114-Status: GOOD (  14.48  )
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

Make changes to the code that limits the PCIe max speed.

(1) Do the changes before link-up, not after.  We do not want
    to temporarily rise to a higher speed than desired.
(2) Use constants from pci_reg.h when possible
(3) Use uXX_replace_bits(...) for setting a register field.
(4) Use the internal link capabilities register for writing
    the max speed, not the official config space register
    where the speed field is RO.  Updating this field is
    not necessary to limit the speed so this mistake was
    harmless.

Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
---
 drivers/pci/controller/pcie-brcmstb.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
index 546056f7f0d3..f8fc3d620ee2 100644
--- a/drivers/pci/controller/pcie-brcmstb.c
+++ b/drivers/pci/controller/pcie-brcmstb.c
@@ -47,6 +47,7 @@
 
 #define PCIE_RC_CFG_PRIV1_LINK_CAPABILITY			0x04dc
 #define  PCIE_RC_CFG_PRIV1_LINK_CAPABILITY_ASPM_SUPPORT_MASK	0xc00
+#define  PCIE_RC_CFG_PRIV1_LINK_CAPABILITY_MAX_LINK_SPEED_MASK	0xf
 
 #define PCIE_RC_CFG_PRIV1_ROOT_CAP			0x4f8
 #define  PCIE_RC_CFG_PRIV1_ROOT_CAP_L1SS_MODE_MASK	0xf8
@@ -413,12 +414,12 @@ static int brcm_pcie_set_ssc(struct brcm_pcie *pcie)
 static void brcm_pcie_set_gen(struct brcm_pcie *pcie, int gen)
 {
 	u16 lnkctl2 = readw(pcie->base + BRCM_PCIE_CAP_REGS + PCI_EXP_LNKCTL2);
-	u32 lnkcap = readl(pcie->base + BRCM_PCIE_CAP_REGS + PCI_EXP_LNKCAP);
+	u32 lnkcap = readl(pcie->base + PCIE_RC_CFG_PRIV1_LINK_CAPABILITY);
 
-	lnkcap = (lnkcap & ~PCI_EXP_LNKCAP_SLS) | gen;
-	writel(lnkcap, pcie->base + BRCM_PCIE_CAP_REGS + PCI_EXP_LNKCAP);
+	u32p_replace_bits(&lnkcap, gen, PCIE_RC_CFG_PRIV1_LINK_CAPABILITY_MAX_LINK_SPEED_MASK);
+	writel(lnkcap, pcie->base + PCIE_RC_CFG_PRIV1_LINK_CAPABILITY);
 
-	lnkctl2 = (lnkctl2 & ~0xf) | gen;
+	u16p_replace_bits(&lnkctl2, gen, PCI_EXP_LNKCTL2_TLS);
 	writew(lnkctl2, pcie->base + BRCM_PCIE_CAP_REGS + PCI_EXP_LNKCTL2);
 }
 
@@ -1324,6 +1325,10 @@ static int brcm_pcie_start_link(struct brcm_pcie *pcie)
 	bool ssc_good = false;
 	int ret, i;
 
+	/* Limit the generation if specified */
+	if (pcie->gen)
+		brcm_pcie_set_gen(pcie, pcie->gen);
+
 	/* Unassert the fundamental reset */
 	ret = pcie->cfg->perst_set(pcie, 0);
 	if (ret)
@@ -1350,9 +1355,6 @@ static int brcm_pcie_start_link(struct brcm_pcie *pcie)
 
 	brcm_config_clkreq(pcie);
 
-	if (pcie->gen)
-		brcm_pcie_set_gen(pcie, pcie->gen);
-
 	if (pcie->ssc) {
 		ret = brcm_pcie_set_ssc(pcie);
 		if (ret == 0)
-- 
2.43.0


