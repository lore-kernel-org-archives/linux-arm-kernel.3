Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1A66CCF9F1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 15:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+F6l0oreG7JTFMb6Sz6ExSU/mU3oVRcsO804GwDbowo=; b=2h7d30GXhUqRy8bboSekKCD7zA
	KgBsQdc6GCfloo+btaibLMieS6ZT8uofO+oI/9mwTZFE4qZCfpno9toM/wXAmq0vIXrCKMmlyviBB
	BzBh5554qSWmQzua4uHupFC0N7hEwtCAzA8CH0XfdIOu1zdMy+1igw4rToDVQcReqBP4QYFLVFQVk
	/hcg6xfn91Hrqzf3JTCkElNhM+JsFeoHrwfUuHR75FPJrTf8r+VGerxXSR4Ei4hUw1I2GamH/Hghz
	pSa8vO/GOrpsjx1fyKyzFh/bcAmZ+R38FoRsM2oN1f8WWe3h+X0drp/gqPZGUE0apML7EvXLxQWzb
	vfIrU2SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDPPR-0000000EFFB-28Dy;
	Mon, 27 Oct 2025 15:45:25 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDPPH-0000000EF9T-3EAb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 15:45:16 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-46fcf9f63b6so29177785e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 08:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761579914; x=1762184714; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+F6l0oreG7JTFMb6Sz6ExSU/mU3oVRcsO804GwDbowo=;
        b=bgX9Wc1ZTrQiei7OhZclbngRx/2KMgtjo9DolzHkr6+OPP04DqYdJxjaGQdPp3tlV7
         oQRjjvgBZKtH8DdFtXm0vGMIYRfhjihbvJjNFM0YgTjnYZQAu4aVHJs3BBO8dk8ixVip
         pwwlZtbhxH26S2+JtdiEF8oDCj6gFMJUZG/j4wMzAQfDjHXe9MLOwQ6rcLm5x0+YPsng
         n3xdmneBJ/FcGcz2u/Ma+gmm3/t3+xVzygBHNak1u09ShE6bSjNJS5bd4Gjtsi1oI4EZ
         bEhYsR2Q0nKlXgeUbkjN1c6VXjcLWP1CUQw9Hppgr22ptHePPoOtSVS7GGbONDxI6RfB
         hyDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761579914; x=1762184714;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+F6l0oreG7JTFMb6Sz6ExSU/mU3oVRcsO804GwDbowo=;
        b=B+D+b8BrAlPMSsn0NV7/+NBj29D9D8VY/T/XIURiCjR1uWGCfDOuEBsv4WjpW+dLsT
         Nmz8GzBeRJY3hy25fM33gClnBxyoKqmIYoa4pJ2LcSW+m1a+EjIT1Zp0tSb4HoTadNtX
         O7p2IxapWP85QENe9S6ogNTxnZFVIC5rWorTVvqK5ciLjJz3NjrhGuYuV/jHyBc3A6Ae
         KD2S6nJ2eu9R9LSNKYvxqRjb9+xOmTyCunyYqvGOVjPX3qBuvIwoHPCFnKWTaq1LR5xH
         EPoCZffHn7j3oWr/1os/8A5v5ulqMqjkBIVau2i0cc4deoBUhqs/IyA20rX/PrDs7HAY
         jTSw==
X-Forwarded-Encrypted: i=1; AJvYcCWsFOnlTxBGIGtSzJJswDnAxxzRR3VdjC1rX/H4P6rUi2XiwOaUlABURI06KqeBLVGrgIaWf0fjqgFhaqXLrRHA@lists.infradead.org
X-Gm-Message-State: AOJu0YzQeGs7WTTuWMJwDIG1B/CqVcZ6jX0p+6w/zA+zH+hJRiSjkgLi
	z7ztmahhz4xnHQ9Yf7Aw/x2cQQAjdwYo6JZ2DCeqYgFMuiCS1BhxgHT03qj/qs+RCv0=
X-Gm-Gg: ASbGncvV5IK/voJSyelcv16og0WTGetNGclzPSD8zLBRdtu7XJlef5Gjhx30GO1Rx+y
	unZSaiQwVwswtE0HwTI1t6srEPctC6RXlXzLrSLL/b6xRyJEX4Qx47v2ggPZUL0NTgNZkLRVvIw
	gIvTzLg4Ht9XdS7BJds4ujxjtqbUPCo228ZQZe4i5Jl1dM27NVIDmgPRq4cy0CYe9MfbI0TC/rK
	dm1f7pGhMbMZNnoZhHU5/3S7r8OaMaiKx6TPMxB1PChLOdbEK263Yxqhue3jIXgKn19jWKyR5s9
	WEJAKT3U+KpccXWWVAA28/ZJIBYlpE6Wv6Ngw4DfmhtxGm/hhyYh2nMRLHbZqG6LgIAwO9IYC6X
	jaA7rN1FaXgxG6pbIjmTZQUnueQqF0ZxIo5uEbMV0unM/JZrPom+9mKRq8zcEcEJQlgCY+Tg=
X-Google-Smtp-Source: AGHT+IHRGKVi5MN0KlmP/QWn9GK7Gt4IncDu1UnMNHIlVsLNKr3cmM9451HaPofTrSWpTuM98bmS9w==
X-Received: by 2002:a05:600c:45c7:b0:471:6f4:601f with SMTP id 5b1f17b1804b1-47717e30926mr964515e9.19.1761579914067;
        Mon, 27 Oct 2025 08:45:14 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c1c6:7dde:fe94:6881])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475dd477d0esm138708045e9.0.2025.10.27.08.45.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 08:45:13 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 27 Oct 2025 16:44:55 +0100
Subject: [PATCH v3 7/8] net: stmmac: qcom-ethqos: define a callback for
 setting the serdes speed
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-qcom-sa8255p-emac-v3-7-75767b9230ab@linaro.org>
References: <20251027-qcom-sa8255p-emac-v3-0-75767b9230ab@linaro.org>
In-Reply-To: <20251027-qcom-sa8255p-emac-v3-0-75767b9230ab@linaro.org>
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
 bh=5Gxjb/17qAbEtiGjyBW7mjBpKziLG21U9VH1r3QiV6U=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBo/5N8BBE1xELlKYS4ZKFTuPBcaEPIPgSxudZ/m
 3UORCOMzZyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaP+TfAAKCRARpy6gFHHX
 cmQWEADIxpsG6tmx74j0WRSxVrRH/JRNVBzM4zS/ZdSdSlQ4LxTy1mCDLEtm4Fi/6+WZ/SZiWXI
 1ZzMvymBFVn2D0iZPoYzpkAabamHrQrlQJe6noPUboVYrfR9EeQ+RKSVikMZ98pad0NLj2bT/Nd
 4a0XI3jAoeBjMPegufW4igZP+WeYXpxgIdkxP5b55+7iDHEpWwzDMAFklDLzMcQumr/YYWTAzD9
 mjGM4WGouN/jtGgNHac0Avwd5CJ704zorc5h0XENpiBH/YXCdg1xhJw5RkIUVk9lsQyWS86Hv/H
 P4OSHiq/vBYXZusrl6cMzGlolvc0S0PB4476vZC77MyWRhAzxLtSxRuM6CPLFVxDh7QLA3/kdmT
 iGGSDxGcgn6lvKEQGropggTfrMvRcxtQCSyScQ02aEw92XnTUtqE5sF/4o8R4DYIS6o2sd/RYFA
 eXK4HuFvPXD9fc3ykTGCtnvw+fkq35yCAxUFpNBpB3vgsIaRb3WV5CIS/o+IukZkU8YGX0bXfVu
 J3Plra45gnO0uIBzIJAGgU8uIyRtlqQM+BPBboMu/B9Mmm1UmgksrUDEMv3y36cJ74CwygQcivF
 fbOG3nv0FvGk6hBfzztxguJORGBB4Cepg2dnoMFUVeJK20HwbhY5inwbdsKL5uGhXchr63VTOD/
 KOj+W54h3X1BhaQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_084515_842242_3AB55B80 
X-CRM114-Status: GOOD (  13.73  )
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
index c25b4b4581f9cea6107a39f0bc6165be6955cc1b..840d44f052786a79b85d25d2181467aa96102ec8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -124,6 +124,7 @@ struct qcom_ethqos {
 	struct ethqos_emac_pm_ctx pm;
 	phy_interface_t phy_mode;
 	int serdes_speed;
+	int (*set_serdes_speed)(struct qcom_ethqos *ethqos);
 
 	const struct ethqos_emac_por *por;
 	unsigned int num_por;
@@ -644,11 +645,16 @@ static int ethqos_configure_rgmii(struct qcom_ethqos *ethqos, int speed)
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
 
@@ -879,6 +885,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(ethqos->pm.serdes_phy),
 				     "Failed to get serdes phy\n");
 
+	ethqos->set_serdes_speed = ethqos_set_serdes_speed_phy;
 	ethqos->serdes_speed = SPEED_1000;
 	ethqos_update_link_clk(ethqos, SPEED_1000);
 	ethqos_set_func_clk_en(ethqos);

-- 
2.48.1


