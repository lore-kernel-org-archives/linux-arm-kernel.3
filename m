Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7059C02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 19:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p2SP8UN+7O3+LtijH955HifaeFHXMbD1xCtBylyCBjw=; b=rtodaTm1U0LH1QNm7bJCqmQNZo
	bRQxXJWBQeTYJ0YhvzJ28yVwUD1S1Jpxj3XCgWaMIB26JSHWA4nd3f9n6czpANktIfrmEIw1AxYvc
	Tn/5NiSf74vaCmIvw0OtTvGniecfuyfNOiH/RiVR7q16Nos5MpFDSQZVzwTAz6PFRH/Ah8fF3V3sL
	Gg1wPNVD3ZH1c6lqnNuiS6Rc3IIXB3L4n7GKTSlQ7CQxsubZYl7wC6SwbHnNGE49TVCIiTgOV2gYC
	b8WR/a65+6LAKqDQb8LSDDmM13sR+nhc48h3hsf5BsRt9h1uQRUI3OGKB8nMYEl8Dk9/x5D8Wko8w
	ezmW8bvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfl04-00000004Oop-0pRn;
	Wed, 05 Feb 2025 19:23:52 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfkpf-00000004Ms3-1Ypt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 19:13:08 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-2f9bd7c480eso90823a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Feb 2025 11:13:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1738782786; x=1739387586; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p2SP8UN+7O3+LtijH955HifaeFHXMbD1xCtBylyCBjw=;
        b=EZx9Esq9nL4oHetdh+cOFS5abf8J/fxGObWCaMOQZp9EHjpRzsSBg9M0aUKK3RpSyu
         ZDvVdB+mpxzo26ajA5FuM1fm0HAPDgHsPYqJN3vJsPQh198kcIXqvuUu0iwf/SAb879N
         EbfodYmUCey7fAby03LnkOMxeM6NWhtEW8K7E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738782786; x=1739387586;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p2SP8UN+7O3+LtijH955HifaeFHXMbD1xCtBylyCBjw=;
        b=pajzPqTqhjOH9b64U/+KXfXMSTk3BbH2BO4Vy4SL7Qr+gaftDN8yTUq+HVArK4AwRt
         03uviJJE7lkeH1/PpTl16K0a8/PBPfUh2Zk+dCfpqmMa0ATY5kVWQxTSb6YekFcCZpdp
         AWSjpReCF6rYpgNrqLPSb6BOAloOQvNDtIHwQiUFCs44GwJy/WekaRXKAh54CcdbxgQy
         dl8oeRrbztnNS5JQf5ee6SgPwhA7bK6XltzKpwu/FZhpk0UrF81wCFEiEPDzzlJ+R6Up
         KaSdpG+47ZwBWRTYcwjDObKPIgu9BjQn97vpPvAMhvPfTmmSHyFOAySJe6sPxNQdgZCA
         eDVA==
X-Forwarded-Encrypted: i=1; AJvYcCUZSEWbLZNhN0e173TWDwYqTaac1L0JP9b6Efu70cfOOUmy4Kysni+3cigMeUb7jpAzbDV17Vs5W3s5XZRmSAgk@lists.infradead.org
X-Gm-Message-State: AOJu0YxxNxCMaKn5ffFy4dJ8dvFy/Qgl+7+Ayph9LXUAvW+/2nl7uIIy
	JSk5fGJh4hD5aB9FhThV9H1A/3LOBSez4mvryA1qILifdkvwsdvTNctsg+97TQ==
X-Gm-Gg: ASbGnctKrch16Byk+i7HM5Ipv3UDnb79kuZM2xVt00uete6WBJrRrK3RjKttIcS7+ar
	dD7uzkoqOcbhTlFiexNUvy4mtpyuxME+2qJZhS7LJtds01kii36A2BS0wlhKuMU8f7fypZjPf0+
	POnWQ6PpJIFHrsc8J2L8mGkYyW0i5I4uN8AtFPztdyunleRzYBeBeaIZRXZ8YY7+fyXtR22h5yk
	WBheMHbN7eblvkdqhMQ3+6AdMnyT1KhT8rUb58MyX9U6K8LMP+zkAFeaTjrCQJbKjcaThQOi2Ry
	jG5hk2OEXRPOdQZACRaAksX6tz8fng5y9TIyQhU6/0qYBqh45ccpI0n+8hvJv/MHod+/UpQ=
X-Google-Smtp-Source: AGHT+IFWf34gqo2Cq3GC10EE4JpvnnXxd/baqFQ4/rfJGOY8K+FfkhKwIxsYtkyKK3/Ky0Uqi5YYwA==
X-Received: by 2002:a05:6a00:2908:b0:72d:8fa2:9998 with SMTP id d2e1a72fcca58-7303513ac4amr6540559b3a.14.1738782756542;
        Wed, 05 Feb 2025 11:12:36 -0800 (PST)
Received: from stbsrv-and-02.and.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe69ceb1csm12670842b3a.151.2025.02.05.11.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 11:12:36 -0800 (PST)
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
Subject: [PATCH v1 4/6] PCI: brcmstb: Use same constant table for config space access
Date: Wed,  5 Feb 2025 14:12:04 -0500
Message-ID: <20250205191213.29202-5-james.quinlan@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250205191213.29202-1-james.quinlan@broadcom.com>
References: <20250205191213.29202-1-james.quinlan@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_111307_410723_478EDE26 
X-CRM114-Status: GOOD (  14.66  )
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
map_bus methods used these constants, the other used different
constants.  Fortunately there was no problem because the SoCs that used
the latter map_bus method all had the same register constants.

Remove the redundant constants and adjust the code to use them.
In addition, update EXT_CFG_DATA to use the 4k-page based config
space access system, which is what the second map_bus method was
already using.

Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
---
 drivers/pci/controller/pcie-brcmstb.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
index 4f5d751cbdd7..2d1969d7fd30 100644
--- a/drivers/pci/controller/pcie-brcmstb.c
+++ b/drivers/pci/controller/pcie-brcmstb.c
@@ -151,9 +151,6 @@
 #define  MSI_INT_MASK_SET		0x10
 #define  MSI_INT_MASK_CLR		0x14
 
-#define PCIE_EXT_CFG_DATA				0x8000
-#define PCIE_EXT_CFG_INDEX				0x9000
-
 #define  PCIE_RGR1_SW_INIT_1_PERST_MASK			0x1
 #define  PCIE_RGR1_SW_INIT_1_PERST_SHIFT		0x0
 
@@ -728,8 +725,8 @@ static void __iomem *brcm_pcie_map_bus(struct pci_bus *bus,
 
 	/* For devices, write to the config space index register */
 	idx = PCIE_ECAM_OFFSET(bus->number, devfn, 0);
-	writel(idx, pcie->base + PCIE_EXT_CFG_INDEX);
-	return base + PCIE_EXT_CFG_DATA + PCIE_ECAM_REG(where);
+	writel(idx, base + IDX_ADDR(pcie));
+	return base + DATA_ADDR(pcie) + PCIE_ECAM_REG(where);
 }
 
 static void __iomem *brcm7425_pcie_map_bus(struct pci_bus *bus,
@@ -1712,7 +1709,7 @@ static void brcm_pcie_remove(struct platform_device *pdev)
 static const int pcie_offsets[] = {
 	[RGR1_SW_INIT_1]	= 0x9210,
 	[EXT_CFG_INDEX]		= 0x9000,
-	[EXT_CFG_DATA]		= 0x9004,
+	[EXT_CFG_DATA]		= 0x8000,
 	[PCIE_HARD_DEBUG]	= 0x4204,
 	[PCIE_INTR2_CPU_BASE]	= 0x4300,
 };
@@ -1720,7 +1717,7 @@ static const int pcie_offsets[] = {
 static const int pcie_offsets_bcm7278[] = {
 	[RGR1_SW_INIT_1]	= 0xc010,
 	[EXT_CFG_INDEX]		= 0x9000,
-	[EXT_CFG_DATA]		= 0x9004,
+	[EXT_CFG_DATA]		= 0x8000,
 	[PCIE_HARD_DEBUG]	= 0x4204,
 	[PCIE_INTR2_CPU_BASE]	= 0x4300,
 };
@@ -1734,8 +1731,9 @@ static const int pcie_offsets_bcm7425[] = {
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


