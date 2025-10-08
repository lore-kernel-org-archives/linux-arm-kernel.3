Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CBA6CAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Oct 2025 08:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CdoEjc5e7kQwXoL1Cm6IjPM2seG7Imvb9wLqalhk7Jo=; b=ui+rjeV+bCt5mcYVeDrlGeFdTS
	gPbbr2+UVrqpc7EgoxPRFwi0NdKCGgOpBDAJpUw1Iy6wGFhkzdDGay9GBHpg9GIFYolad6Hgl11Oa
	2x7GqrW3C1RMqT5GXvRxKqmgSOdCUdUK3cOYxnStFIXTvK55Gw54d3MuPBY4VfZ4LbKHjtAqBdt5N
	KGGle2axSp2YMSUtNMwZwUDZVfkx/p8D58GKmd+i23bH8Azu3WzedYMf1BisOiYaCoKI4MoAPkRc4
	4rtlFsuiXkBnqegltmeqz/7pc1NVkjB0MhjlaUDt0fIS5Jl15fmp3Igb0MFzUPZwRDkx3JfctQUAb
	pf3c5fNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6PNK-00000003R4X-1996;
	Wed, 08 Oct 2025 08:18:18 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6PNI-00000003R09-0K3L
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Oct 2025 08:18:17 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-46e491a5b96so40384035e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Oct 2025 01:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1759911494; x=1760516294; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CdoEjc5e7kQwXoL1Cm6IjPM2seG7Imvb9wLqalhk7Jo=;
        b=PKV1l0FdbC+g9A/lcvg/2OOfh0RiniQo+A3OTSBaX8skbjff0pWJc+NncAbigsnNOf
         1V9IxEjLGlDiX/OGrmnyxTKz9cx5+z/VgOLDsBsgPzeLmFZN8o1TEIlOgWMvQkg0iO0w
         yhNmHAF0JfEp1Qa7ZLAadaKwChe8kJxEXqy/A5us2ZEnHFfg3v7HK9waKr5FaFhqIgfc
         TmFUUSgv3XkNMVy/TVBXM2eNMOcvcyUBSpoat6F/EpROuM1xokhSUqL7n3HlEPB85b7X
         Uw5daCV0LJ51frNeWCDmFM3cHGoyLMVQZ0/cCAQs8CINfYXK+3UTpTUepMm1jLuN1xIg
         a1Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759911494; x=1760516294;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CdoEjc5e7kQwXoL1Cm6IjPM2seG7Imvb9wLqalhk7Jo=;
        b=Nw4Bv3fejTyNGLy/SZFUNQRrxVYjF7vJbMJl/tQaStXDy6i6JHptSfaJ/bBOfMxUaL
         M75+nZ3sag6X6fP163pRRGKzI2fhDfyeDCLG2tQc0IG8LA4C+d092plw7cA7FPNhSVvH
         qHdJA10k/bguLRXL6kFlhD+ATrdk/xX9YVxMHzbeHuCTnnoiOF4fQ56KDCiCvzAGdPSR
         kTUuhKSgMexpAlPfnPcXrxSPquLhJrQpTidJNFxFSX9Kku1DjT98P2kbt1EuTBGtGM/m
         XseF5Jr4AomW6VoyPq7UNmrtNGScKnjr/rs2a5oFKfZ2OOb5ibdd15aWMjinPPSX6ogr
         JllA==
X-Forwarded-Encrypted: i=1; AJvYcCV++OtpSTsLjv4LlEahBE3G7H5R00lrG3gH+NPTgqKEiNel2dwN2a+1llis6Toz9sCyGuFXze0dZr5caysxqgX7@lists.infradead.org
X-Gm-Message-State: AOJu0YzMZWxtdW/9ff9SjQ0pUoIFVb0nvtcKE+OMxdvs+Ga45hAiGB0v
	//KDX3JQB5OlhxRBK4mOEQeNrHaJGk6GrPWmO1TZVkFmAlA6aT3aVKeI0ggLqu5B8c4=
X-Gm-Gg: ASbGncvlpd4ArtBVZcuNWMH4hIuEeBiICQuO4MMC4k5bA2MNoffakUmoOun6n+yOJYO
	pNn2iztwxt0qSMkr5sPPd956F5BFmMUz/VCM80c12ev2D3kex3BsiJNLm5oVk/DroMUqMWr9W//
	M5fotZr914lvDUSdTECOHK3M/u53+BBnnu4He1qYRFO8Re74uKlhPPAucap4O4I6dsALosLRf3L
	0XdCZ3/RpXktkL1+bXT/NljxDnxNpu+cB671nuw8p3mDgHXXfmS8PelX6BRBaXNZELjXGlpCBx9
	9a5XXpX4lMQmnA0D6u+Z88dUCei6Fux28OMO0JK8Ag5wZaamsWqBRcDKU/mIUVdRqseJu7EWigO
	WlzwQPjVi0HWWcqoOiWy5n+r4TXzkRN7nCUqo0XyUzYPfhxV+OXU3
X-Google-Smtp-Source: AGHT+IGGV9RTxvTs6ChYk2BboL/91pz8TbAVWTDNgaDs9JbMT5f/sR8m26V513f/xADuHAv6BhGW0w==
X-Received: by 2002:a05:600d:4205:b0:46e:74bb:6f6 with SMTP id 5b1f17b1804b1-46fa9af914bmr14615105e9.22.1759911494198;
        Wed, 08 Oct 2025 01:18:14 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:286d:ff1d:8b7c:4328])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8e97f0sm28498943f8f.27.2025.10.08.01.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 01:18:12 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 08 Oct 2025 10:17:54 +0200
Subject: [PATCH v2 7/8] net: stmmac: qcom-ethqos: define a callback for
 setting the serdes speed
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251008-qcom-sa8255p-emac-v2-7-92bc29309fce@linaro.org>
References: <20251008-qcom-sa8255p-emac-v2-0-92bc29309fce@linaro.org>
In-Reply-To: <20251008-qcom-sa8255p-emac-v2-0-92bc29309fce@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Vinod Koul <vkoul@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1914;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=xmsTTIN+xNt0moiTieLp775A3Rxh60igauD1SnixUA4=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBo5h424wYIOWx/QTIauQ0Xb0HiSiOu+mcvinaVu
 GhOkDp/gnqJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaOYeNgAKCRARpy6gFHHX
 cln8D/40P5o2ziTr4Wk7CJ0ckAfckinQriPZ81qAubZQawfXquU0f9MHcGxOVvpWRqeF8pQsvQV
 XSQsT51LnHQ9SZMfesP3vKY0QQaz6SKjkhiAoR2CKFM/8nkGzuRjt7oWYKFKbJVhwkJKAfK6tRf
 6/vUg0er/eXFIy/tXoe71+uRvAqTClesPLUXGcPLRpcGchrumTBYB5j4bKFN0DdQBuNJlp2QbN+
 0/gxygzyNpUtZwtdJLGN73TZSTSE1bVeVicT3tIIiYPIjCW1Lah0/IJL4w5Cp5qEiq5oiThfgjx
 /t6Eq2bUJ5kns+bSpzgVx3cHIMMdqf/Km/K2gUsyBPkW6VF9KvF3QObG17Nej1gxaOGRgDoFje7
 X3/68pKORhRcaflwwnlGIwWUK0BGsjQ9rAZ4OUMg+7Oz8mYGwlhKrI/Aq1Me6slet7SrbfBpkyf
 uEOYvdOLVFR/0WSifZVhrNABqZWtD/BBnanKxR8Rh5VGg3fki7Ev8jEDA364ubJkfYcKWt6O3bK
 q+ukAukJOQmZayqSjIyQ5gqU0j97tXkVuqONtZA0UGiFf7RvuodWy2AteLDVpbwXXmGRt8InpSf
 S03B2C+Ox/rniLc3eY+4YPs40szdtegi1bKYPhM0FIKWxCbL6B97v+vVxnMSPo7t9K2l0S2s0my
 bRm3rw809SJ/T2w==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_011816_151277_B0EFB04B 
X-CRM114-Status: GOOD (  13.88  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Ahead of adding support for firmware driven power management, let's
allow different ways of setting the PHY speed. To that end create a
callback with a single implementation for now, that will be extended
later.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 1fec3aa62f0f01b29cdbc4a5887dbaa0c3c60fcd..2a6136a663268ed40f99b47c9f0694f30053b94a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -125,6 +125,7 @@ struct qcom_ethqos {
 	struct ethqos_emac_pm_ctx pm;
 	phy_interface_t phy_mode;
 	int serdes_speed;
+	int (*set_serdes_speed)(struct qcom_ethqos *ethqos);
 
 	const struct ethqos_emac_por *por;
 	unsigned int num_por;
@@ -646,11 +647,16 @@ static int ethqos_configure_rgmii(struct qcom_ethqos *ethqos, int speed)
 	return 0;
 }
 
+static int ethqos_set_serdes_speed_phy(struct qcom_ethqos *ethqos)
+{
+	return phy_set_speed(ethqos->pm.serdes_phy, ethqos->serdes_speed);
+}
+
 static void ethqos_set_serdes_speed(struct qcom_ethqos *ethqos, int speed)
 {
 	if (ethqos->serdes_speed != speed) {
-		phy_set_speed(ethqos->pm.serdes_phy, speed);
 		ethqos->serdes_speed = speed;
+		ethqos->set_serdes_speed(ethqos);
 	}
 }
 
@@ -881,6 +887,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(ethqos->pm.serdes_phy),
 				     "Failed to get serdes phy\n");
 
+	ethqos->set_serdes_speed = ethqos_set_serdes_speed_phy;
 	ethqos->serdes_speed = SPEED_1000;
 	ethqos_update_link_clk(ethqos, SPEED_1000);
 	ethqos_set_func_clk_en(ethqos);

-- 
2.48.1


