Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 148EEC71148
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 16:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mzNQkY2OXtljp7yt/i/tI+v/gWIw5D47TujWJasE/B0=; b=s4J96wQHKJjw5mTgCH2iaW5EPU
	8kjqbCG83MQPOOmz89F7eIB4vEkp+UFdy2NmHyxCRMjLg9CLTngWPNndkGreAguOZdeg5rExVhlIo
	hkrcPxH4CPs3J1WPUjDBR1DKJDtdj+InAf0nBYw4Kxgd28onOEu58k3SpXzBgQVFXHCQpHN3iiXGP
	EUxsMx192bxP/ScRW18DLzzwv3YM7VAIv7n86dpBpzEef0Wx2aq5tMVRw7JyfLUKPNlpJvYoWInAx
	8xuY481B+gjLevUwE0UtZ0WcHZXQaSCa1nzBLOIcwPSEqjI1GfJyAzGtaP6P79YJLTKV7D5b45Wo3
	thrWdSkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ6ry-0000000Gzhj-2PaQ;
	Fri, 13 Jun 2025 16:03:06 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ5kY-0000000Glu9-03Oe;
	Fri, 13 Jun 2025 14:51:23 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-31329098ae8so2008234a91.1;
        Fri, 13 Jun 2025 07:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749826281; x=1750431081; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mzNQkY2OXtljp7yt/i/tI+v/gWIw5D47TujWJasE/B0=;
        b=T5UyoAView4pZEnR+pubW3yO3fF3sDY9XzSSzzoUlRmwy6Xrc2R0Ac8F9XwgZrTuZi
         fwEejck5+LyR/E2pfMmPD4z8xPB+X/EPwI2KOj71GRAhxoygCKAG3DlBkFZ7jpkNXw3y
         ULmRTNEZy/WrKKx8dlvO1aSu0HbkLaKGSVZxzleFi5ca5v3DJPY2iRc78ym9jz4JxpG7
         +woeXJObrGsG+OZ8KMH1tb2Q4Mw5rjR1xZP5uwVvL/5cffQTypslsVoGbxIaHfirLFZX
         H2OI1uWEX6LqQn8NjFB5SPNwuZjidWMG4Vci/7h+m05zFi7pMHSVsUdA8ZLATOt5f7cD
         PGyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749826281; x=1750431081;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mzNQkY2OXtljp7yt/i/tI+v/gWIw5D47TujWJasE/B0=;
        b=Tpq7PvvBp53Z1geWFBjpZWwuEsHM9pLfWGzZai0M8YBmCD3/ZvPKCmqFYX70H5Nzkt
         +2Qm2sn6HoKsgCdsuZXRlGq/ZJBJI0bD9IxWnlvXqM0SR9wc+rSPgWlCWyk8Pbi67708
         MCemOxaHd5SmSsVRnuZ2n2xGHcHNjMLdnaZp9Y3YeHnUeuGvbW31OO6h/vQm9VcsBIKe
         5WoJk2oGy2e0f8r/oqBwt7hN4ljbxj3q3tPsOez15vr5ttCnacMV641t+8Izt1i5yBNQ
         GcssiOVaX9GgUJiOtmL3hTkYXpGJP1YnwdBcf+rpFrJCS2LXQ4lZTouOCu9YN39UvnZV
         G/vg==
X-Forwarded-Encrypted: i=1; AJvYcCUi7El3RoD8SMZmZVubFTlvlakrerQx7U46DiAXbMhnvcAVJnN8i3VPpEetyTggGNgPPTEF/zXlaB3t5t/Y8/hE@lists.infradead.org, AJvYcCWAGPpPm3Ako204gTPolWHNGHT8gRadJ3fwDlVvg2DjTMrDeci3zP1mqoAOSWXByjgB/UM6qBXWjwZq@lists.infradead.org
X-Gm-Message-State: AOJu0YzJhuirbo50xf+8uZWYIuFwcQTVSYCxduP4fmiXrIm1Y4m6sFFQ
	uN+eDiFkMT6Jqi9zrL68gyQG1nyCJO3Hq3pxPHvCJllllhImt4fs6AAhUX9W/iVx
X-Gm-Gg: ASbGncvUF4qGVmhPV46ys2F6OQ+ekx2jq6FUlrzNPT3dfEdeqE56dwJbBemgwUGL97N
	M/lc1yD4KTeSmvMoglShbk+4MCtZaDvlF+PpLKA3nkE5rOG1eAkfjlDcIg5p8aE4HuwA/Hzv9Sv
	7TNERyOUHsMvGp//6vhH3SRPFrBwliysdVeOiuv76QwDJhWohLWeDsP10OKxab8gaobqGFji94z
	fiK8gFeRs+V+uSWrfn0+Anu2WZYtH6D0vZ84L6gtgCyhk9Fms4hTN5gh34RmnporgaDXbbudJez
	Fwzn6vLlGadwPhY6aYfy4lnYbIkAqG/KAk+AkWLqPrXmoN1OJQ==
X-Google-Smtp-Source: AGHT+IEU1euNi7vVAr/Eva34gPyHAVXAx6uKoAkzHEKswgDcWh+Lz9KRkR7xgmskZ5u1W9LnCJ8nuQ==
X-Received: by 2002:a17:90b:4c09:b0:30a:3e8e:ea30 with SMTP id 98e67ed59e1d1-313e90b17a4mr1463779a91.11.1749826281041;
        Fri, 13 Jun 2025 07:51:21 -0700 (PDT)
Received: from geday ([2804:7f2:800b:838f::dead:c001])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c19d2ea0sm3463812a91.20.2025.06.13.07.51.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 07:51:20 -0700 (PDT)
Date: Fri, 13 Jun 2025 11:51:14 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-phy@lists.infradead.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH v4 1/5] PCI: rockchip: Use standard PCIe defines
Message-ID: <992ab6278af59b8f2f82521bf4611f69a916bbe1.1749826250.git.geraldogabriel@gmail.com>
References: <cover.1749826250.git.geraldogabriel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1749826250.git.geraldogabriel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_075122_047679_3C39A1F4 
X-CRM114-Status: GOOD (  11.26  )
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

Current code uses custom-defined register offsets
and bitfields for standard PCIe registers. Change
to using standard PCIe defines.

Suggested-By: Bjorn Helgaas <bhelgaas@google.com>
Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>
---
 drivers/pci/controller/pcie-rockchip-host.c | 44 ++++++++++-----------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/pci/controller/pcie-rockchip-host.c b/drivers/pci/controller/pcie-rockchip-host.c
index b9e7a8710cf0..65653218b9ab 100644
--- a/drivers/pci/controller/pcie-rockchip-host.c
+++ b/drivers/pci/controller/pcie-rockchip-host.c
@@ -40,18 +40,18 @@ static void rockchip_pcie_enable_bw_int(struct rockchip_pcie *rockchip)
 {
 	u32 status;
 
-	status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_LCS);
+	status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_CR + PCI_EXP_LNKCTL);
 	status |= (PCI_EXP_LNKCTL_LBMIE | PCI_EXP_LNKCTL_LABIE);
-	rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_LCS);
+	rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_CR + PCI_EXP_LNKCTL);
 }
 
 static void rockchip_pcie_clr_bw_int(struct rockchip_pcie *rockchip)
 {
 	u32 status;
 
-	status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_LCS);
+	status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_CR + PCI_EXP_LNKCTL);
 	status |= (PCI_EXP_LNKSTA_LBMS | PCI_EXP_LNKSTA_LABS) << 16;
-	rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_LCS);
+	rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_CR + PCI_EXP_LNKCTL);
 }
 
 static void rockchip_pcie_update_txcredit_mui(struct rockchip_pcie *rockchip)
@@ -269,7 +269,7 @@ static void rockchip_pcie_set_power_limit(struct rockchip_pcie *rockchip)
 	scale = 3; /* 0.001x */
 	curr = curr / 1000; /* convert to mA */
 	power = (curr * 3300) / 1000; /* milliwatt */
-	while (power > PCIE_RC_CONFIG_DCR_CSPL_LIMIT) {
+	while (power > FIELD_MAX(PCI_EXP_DEVCAP_PWR_VAL)) {
 		if (!scale) {
 			dev_warn(rockchip->dev, "invalid power supply\n");
 			return;
@@ -278,10 +278,10 @@ static void rockchip_pcie_set_power_limit(struct rockchip_pcie *rockchip)
 		power = power / 10;
 	}
 
-	status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_DCR);
-	status |= (power << PCIE_RC_CONFIG_DCR_CSPL_SHIFT) |
-		  (scale << PCIE_RC_CONFIG_DCR_CPLS_SHIFT);
-	rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_DCR);
+	status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_CR + PCI_EXP_DEVCAP);
+	status |= FIELD_PREP(PCI_EXP_DEVCAP_PWR_VAL, power);
+	status |= FIELD_PREP(PCI_EXP_DEVCAP_PWR_SCL, scale);
+	rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_CR + PCI_EXP_DEVCAP);
 }
 
 /**
@@ -309,14 +309,14 @@ static int rockchip_pcie_host_init_port(struct rockchip_pcie *rockchip)
 	rockchip_pcie_set_power_limit(rockchip);
 
 	/* Set RC's clock architecture as common clock */
-	status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_LCS);
+	status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_CR + PCI_EXP_LNKCTL);
 	status |= PCI_EXP_LNKSTA_SLC << 16;
-	rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_LCS);
+	rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_CR + PCI_EXP_LNKCTL);
 
 	/* Set RC's RCB to 128 */
-	status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_LCS);
+	status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_CR + PCI_EXP_LNKCTL);
 	status |= PCI_EXP_LNKCTL_RCB;
-	rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_LCS);
+	rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_CR + PCI_EXP_LNKCTL);
 
 	/* Enable Gen1 training */
 	rockchip_pcie_write(rockchip, PCIE_CLIENT_LINK_TRAIN_ENABLE,
@@ -341,9 +341,9 @@ static int rockchip_pcie_host_init_port(struct rockchip_pcie *rockchip)
 		 * Enable retrain for gen2. This should be configured only after
 		 * gen1 finished.
 		 */
-		status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_LCS);
+		status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_CR + PCI_EXP_LNKCTL);
 		status |= PCI_EXP_LNKCTL_RL;
-		rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_LCS);
+		rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_CR + PCI_EXP_LNKCTL);
 
 		err = readl_poll_timeout(rockchip->apb_base + PCIE_CORE_CTRL,
 					 status, PCIE_LINK_IS_GEN2(status), 20,
@@ -380,15 +380,15 @@ static int rockchip_pcie_host_init_port(struct rockchip_pcie *rockchip)
 
 	/* Clear L0s from RC's link cap */
 	if (of_property_read_bool(dev->of_node, "aspm-no-l0s")) {
-		status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_LINK_CAP);
-		status &= ~PCIE_RC_CONFIG_LINK_CAP_L0S;
-		rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_LINK_CAP);
+		status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_CR + PCI_EXP_LNKCAP);
+		status &= ~PCI_EXP_LNKCAP_ASPM_L0S;
+		rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_CR + PCI_EXP_LNKCAP);
 	}
 
-	status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_DCSR);
-	status &= ~PCIE_RC_CONFIG_DCSR_MPS_MASK;
-	status |= PCIE_RC_CONFIG_DCSR_MPS_256;
-	rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_DCSR);
+	status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_CR + PCI_EXP_DEVCTL);
+	status &= ~PCI_EXP_DEVCTL_PAYLOAD;
+	status |= PCI_EXP_DEVCTL_PAYLOAD_256B;
+	rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_CR + PCI_EXP_DEVCTL);
 
 	return 0;
 err_power_off_phy:
-- 
2.49.0


