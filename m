Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1442BC369AE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Apr 2025 20:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H8Z64jhMWr4f68K+GRZRK+Jca5FzqJ7OziWBl/OdXKA=; b=gHw2gQQrsbPqTYFQY4qfaewJ0l
	PDwaTljj4yOLB5Gmwn1KNw/SiWM64Qn9NWDZir3t+YaMIkCNeEQX5xPjYYZTialdi2C4Inqx6Wt25
	KHywguqVTuliyuQtecDNUnHdWWnEqJXkOjqejdRWfh68CnFukSlgNZkW/K8UB88/xbwiRAMbdUJqw
	AO9N2SvQOAy70rtf9AftWEJbTuVP88MywIcX3pjiFBuonRCmztj2CBvObUKsBs8nVuCLqdIsUu3S1
	vMdmPbXfCkzh7IXAy50540mcjjNMBVsQNN5j/6+8U+9+w1vLRzRhBLDY7dqXxBNtSn9JUWEcdaZyd
	gC23t26w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3hhV-0000000GQzU-15za;
	Sat, 12 Apr 2025 20:43:41 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3hRU-0000000GP4T-3R7E;
	Sat, 12 Apr 2025 20:27:10 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-43d0359b1fcso20323125e9.0;
        Sat, 12 Apr 2025 13:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744489627; x=1745094427; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H8Z64jhMWr4f68K+GRZRK+Jca5FzqJ7OziWBl/OdXKA=;
        b=c9bk+hJkiikxChqKbLmHLXkiGsEwBxIMjGvb6iZbREVM5E6s1Sojhz6n+pvTmMSd0C
         bYNLo4/4Sb9JYVkoTg7R2xY7LKLz3osQuc/hErbK090x6lu13inKxMkxIXPTPdGeQ+he
         12pxIFrpm3YGpgEZbCIjSRBQK0px7ukGqcmslcDGDzn2lo+P6vdRt7eXg1bSiDEaTRZz
         G+u/3il1x9eEHGaGRjdNDwhAVf8osE/2/I1F73F+UwmyQpJHTaX0R91VkejXW/7GK78j
         jKUVdCYjpXJg5sRc9QMTa9kkLAmUB4lxjs7pcDW4XQk2V9qv4n0rdS+QKgXaMJ+GKHGl
         Fthw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744489627; x=1745094427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H8Z64jhMWr4f68K+GRZRK+Jca5FzqJ7OziWBl/OdXKA=;
        b=ex9kwjZkC+ZdbX0rw0AlNjeWu5m1BOslMCtTnPdOvugvO8n3nNW8yjk/ctY8Vz6Yrc
         Hja8fFrxJ+fM5lLS23q0SVqk0eOvd09sJxH5sTGB9GmJLMPHGWVrAdwID4nEteWglU+K
         lCbcvVrim25y8JAWjti6sm22At/JorvtQ1SgQQnfSj5UdRda+z4zhUf1WCiMtwlRhFKr
         5HpdUUqT3IisVSdkxeCzbl1Q8Os7yRQvAOjPdn9SyRsf+7KP0DiStHLjv3NqPdQuH6vW
         0S5rfU5vAS7sbJjWHDu44jxK0oVTx0HRnoGMEsaONW3BODCYsOA0OJNig1ylogl7fVi4
         p5VA==
X-Forwarded-Encrypted: i=1; AJvYcCVPe3T5NDhX8cDDr62eBTrYVgITz8oudr9Da/BBMbbEEREBl1XSEFr8fuToZPUGPcxkLcvs5YBPQ7/bVQRAE6Q+@lists.infradead.org, AJvYcCXfku7ixu8QSNPgNQSttXyyKrKIpsduv9xUUCluC5yeBLcSw+Qs2FSbcMoIHeyDlC4K39CpQYbfJDQP@lists.infradead.org
X-Gm-Message-State: AOJu0YwcfJitrDiBVEtuQETkZVRD9IaamBDPjZf65L+Oeugmj1ahQ9zp
	owkoIhKPpZdZLvwvK28vfh0ZtoG4A/220rGY3RC0yRW1WZQqEvXK
X-Gm-Gg: ASbGnctLZicZ7Xj0zX5/GOKUkhucCjtpgSSoiHiXueans/Sl3hteCu7k1uQsGKELt3c
	rawc+KlC2/CBBSuHOVnyBPoy4Ho3sTlmawHimtwgKte9eNt/MXXKzzrr4RCnnODDR7bxJdeMrjd
	ULblBwSGv4hDYoYOWquynFMEvPHQ6o0qzx0YH3Om7zoBLkMi1oDb+Sq3bDaAjdEcvlmxeFAtuKN
	MqywKcqeY3/uA5DB8NogXtP4GDmBHrR1R1A47YdNw2aa8DB0F5axQp424m9t//+SIPnj3a6J/qc
	14W7SDocuU2gYD7QD5bcQiWaiaTB6HWfGaHnqVrSb4a+IPKvLo4luMJdlPrmJSGSBbBP0QBFh8y
	bsYrNpwePxtGLdFvKff5DfYL3yfk=
X-Google-Smtp-Source: AGHT+IG73wjyA14hJiUHlYys0uHoP/Gq7sjSROhJNkoVVZBSO2iuHMJltm4VuHHk5qyF/mQobHC8yg==
X-Received: by 2002:a05:600c:1e1c:b0:43d:1bf6:15e1 with SMTP id 5b1f17b1804b1-43f39622728mr61973155e9.1.1744489627005;
        Sat, 12 Apr 2025 13:27:07 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f2338d802sm131797845e9.1.2025.04.12.13.27.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Apr 2025 13:27:06 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-samsung-soc@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v4 08/10] phy: phy-snps-eusb2: refactor reference clock init
Date: Sat, 12 Apr 2025 23:26:18 +0300
Message-ID: <20250412202620.738150-9-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250412202620.738150-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250412202620.738150-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250412_132708_858966_12AEFD75 
X-CRM114-Status: GOOD (  12.41  )
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


