Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C382C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 May 2025 15:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H8Z64jhMWr4f68K+GRZRK+Jca5FzqJ7OziWBl/OdXKA=; b=o4NtQmEah0l/ov109DoR7gNhLn
	iKph+D5bE2rwopZUvkKKa5AhHnbb1vwtgLy95K2WMGZ0BGy8mY+DoR8ecmZwXHNxW31IkZmMzJ3C+
	yFsJ/pLNFojXn6YzSwnzpzY2RGX2w7Aw1Dzj9po9sZY8FXOYaVqO+r604+JECsH3n9VajlHp++Z2i
	1UAvrlktrFRPHdoWXO1iQFO+6qKt4jjRghddcbqKAvjLG1Pkr1IBbyh4dkQqxSy0nt9lc8bKD+8cj
	W18+50GPGWFQrEXa8D+VlYK/poiuKRmkUjk1C0kyOSQ/vKQBIZk9mNN8qoPYZNa60LXfWb0A958fe
	Zj9tEd/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBas8-00000005S5B-0dGh;
	Sun, 04 May 2025 15:03:16 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBabG-00000005PSb-2jRc;
	Sun, 04 May 2025 14:45:51 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5efe8d9ebdfso6153309a12.3;
        Sun, 04 May 2025 07:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746369949; x=1746974749; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H8Z64jhMWr4f68K+GRZRK+Jca5FzqJ7OziWBl/OdXKA=;
        b=UQGnu/uADu7fzFyRZ6REPhFreLk35aVDJY/e7SZ6vlLgkJjb2RKTNHFGlpoF92yPU5
         Gi3HRCJxgTflSdzMMKOlhJpNgenLxJpA4UAvOqi6NCyvdP3NPemRRZiJ8r8W3CZYQ+jf
         QVhTOmlF9j5bN8QrabH5jG/CnEtNV/kRAedd3QQnTz2Hpahqt4VF3MLtbGdmrV2wWgEq
         h9IXfQwBzUQttLpP/zztbnxdjjMHFyYc4IdQXhvF1jVEgp6+EuZI1Y5wGNX8W6zLbUQD
         Grv7H1209f91KZCrsyOJaMD3l5l1LpY9plKSEMNo6ptWhAJbH5vjX7UvMs+JUNFZKxZK
         2dFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746369949; x=1746974749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H8Z64jhMWr4f68K+GRZRK+Jca5FzqJ7OziWBl/OdXKA=;
        b=JsULkDM0X+xnPu5pa6UOH6iTasjC4PqlJnDlVZQSU73PyuQsUrQjawwwEdNbahzLcC
         LMvP9QqfDrjbsRDslZsn8xwt9l/no7FejIeoTfUXdDzXaT5629xCv1F7PZfkH9D7s1wQ
         aRKJ/cvEWxU3LrN7Hz5qBju+cOGNYKUAwmzdFlEyN4Bx/u3Ck9tndARdjHtWII43AHVx
         w9vaZXZV9NIIsm/HhG1i8h5cUZpuF7EvJ7SuO6AbypHd3G5LvP1eMK8AnU0kRkcI2inu
         XE/kqF8WIe5WR4jAZbnAWlqI4o6sHY2vRaIK65gt4lzJmCF6JgsLoMLGFs3NhLvt4kGS
         Emmw==
X-Forwarded-Encrypted: i=1; AJvYcCU5PRQbjMiWUMstZmlphJ311uf63K6jFA8K8bEpnYU/TXJ91zA/S9fuiC2Vj0WuG7y+gQc1J2a1KFk3iVzRBdLm@lists.infradead.org
X-Gm-Message-State: AOJu0Yxc0TCMprqipZrsBsTiU0Vfk0ScSBGc583/lFXIQGAyN+ji/KeV
	vHD6mGAnwYrKlLGd0OEHMoZif0eED/ZSknmndodORUBcY79rvyXZ
X-Gm-Gg: ASbGncu3JNrrw2LOa7XdfZENq2BtSlfBBYWRE+HOcYz7nrnEQGHVMOT58mSNMaMgzHv
	ZLEWL78rTsL2olTj/QEk9pCGfRxNjcL9Nyb715jm8iFAqZFT+f4fEKseHCyPBsKoJN3bSqU7KEn
	v0nT+6d36cyUhrBd4rbtWIO9rFXyFtR9e6pxjJvoaWoFjq6YKHlUEWIkEFAGID0QllMZMckDyBq
	mti33itiqFgn3AlbZWMfxIV2pVSMspQSM3JtHS+XnaZ4OcqgQ1knX2NPULrPd8fl1IoRf7Kj2XZ
	j/QOFc7op4Qvvb1j4DI2q6XMfUbUjayh1hY1KIH2J974oxEk/Z+dpGIWL92aE0pvH1BXtJcwuah
	J3ukVi6IJbAHA/lP8SnFvqFHKLS8=
X-Google-Smtp-Source: AGHT+IHLAPcmE4D8uUqNIDaDTGoj/0IoKeVQe1JZfKk7Q4vsF1Q3KnS4KP0HYO6oATvrVjuDaOVFJA==
X-Received: by 2002:a05:6402:5cb:b0:5f6:20c4:3b0d with SMTP id 4fb4d7f45d1cf-5fab0576293mr3229682a12.8.1746369949176;
        Sun, 04 May 2025 07:45:49 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5faecf59d31sm1147258a12.77.2025.05.04.07.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 07:45:48 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-phy@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 08/10] phy: phy-snps-eusb2: refactor reference clock init
Date: Sun,  4 May 2025 17:45:25 +0300
Message-ID: <20250504144527.1723980-9-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250504144527.1723980-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250504144527.1723980-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250504_074550_692918_73741219 
X-CRM114-Status: GOOD (  11.69  )
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

Instead of matching frequencies with a switch and case, introduce
a table-based lookup. This improves readability, reduces redundancy,
and makes it easier to extend support for additional frequencies in
the future.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/phy/phy-snps-eusb2.c | 61 +++++++++++++++++++-----------------
 1 file changed, 32 insertions(+), 29 deletions(-)

diff --git a/drivers/phy/phy-snps-eusb2.c b/drivers/phy/phy-snps-eusb2.c
index f05333901..8caa62c0b 100644
--- a/drivers/phy/phy-snps-eusb2.c
+++ b/drivers/phy/phy-snps-eusb2.c
@@ -192,44 +192,47 @@ static void qcom_eusb2_default_parameters(struct snps_eusb2_hsphy *phy)
 				    FIELD_PREP(PHY_CFG_TX_HS_XV_TUNE_MASK, 0x0));
 }
 
+struct snps_eusb2_ref_clk {
+	unsigned long freq;
+	u32 fsel_val;
+	u32 div_7_0_val;
+	u32 div_11_8_val;
+};
+
+static const struct snps_eusb2_ref_clk qcom_eusb2_ref_clk[] = {
+	{ 19200000, FSEL_19_2_MHZ_VAL, DIV_7_0_19_2_MHZ_VAL, DIV_11_8_19_2_MHZ_VAL },
+	{ 38400000, FSEL_38_4_MHZ_VAL, DIV_7_0_38_4_MHZ_VAL, DIV_11_8_38_4_MHZ_VAL },
+};
+
 static int qcom_eusb2_ref_clk_init(struct snps_eusb2_hsphy *phy)
 {
+	const struct snps_eusb2_ref_clk *config = NULL;
 	unsigned long ref_clk_freq = clk_get_rate(phy->ref_clk);
 
-	switch (ref_clk_freq) {
-	case 19200000:
-		snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_HS_PHY_CTRL_COMMON0,
-					    FSEL_MASK,
-					    FIELD_PREP(FSEL_MASK, FSEL_19_2_MHZ_VAL));
-
-		snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_CFG_CTRL_2,
-					    PHY_CFG_PLL_FB_DIV_7_0_MASK,
-					    DIV_7_0_19_2_MHZ_VAL);
-
-		snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_CFG_CTRL_3,
-					    PHY_CFG_PLL_FB_DIV_11_8_MASK,
-					    DIV_11_8_19_2_MHZ_VAL);
-		break;
-
-	case 38400000:
-		snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_HS_PHY_CTRL_COMMON0,
-					    FSEL_MASK,
-					    FIELD_PREP(FSEL_MASK, FSEL_38_4_MHZ_VAL));
-
-		snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_CFG_CTRL_2,
-					    PHY_CFG_PLL_FB_DIV_7_0_MASK,
-					    DIV_7_0_38_4_MHZ_VAL);
-
-		snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_CFG_CTRL_3,
-					    PHY_CFG_PLL_FB_DIV_11_8_MASK,
-					    DIV_11_8_38_4_MHZ_VAL);
-		break;
+	for (int i = 0; i < ARRAY_SIZE(qcom_eusb2_ref_clk); i++) {
+		if (qcom_eusb2_ref_clk[i].freq == ref_clk_freq) {
+			config = &qcom_eusb2_ref_clk[i];
+			break;
+		}
+	}
 
-	default:
+	if (!config) {
 		dev_err(&phy->phy->dev, "unsupported ref_clk_freq:%lu\n", ref_clk_freq);
 		return -EINVAL;
 	}
 
+	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_HS_PHY_CTRL_COMMON0,
+				    FSEL_MASK,
+				    FIELD_PREP(FSEL_MASK, config->fsel_val));
+
+	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_CFG_CTRL_2,
+				    PHY_CFG_PLL_FB_DIV_7_0_MASK,
+				    config->div_7_0_val);
+
+	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_CFG_CTRL_3,
+				    PHY_CFG_PLL_FB_DIV_11_8_MASK,
+				    config->div_11_8_val);
+
 	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_CFG_CTRL_3,
 				    PHY_CFG_PLL_REF_DIV, PLL_REF_DIV_VAL);
 
-- 
2.43.0


