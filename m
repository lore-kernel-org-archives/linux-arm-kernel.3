Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FFA5E64A85
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 12:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6M6cTvNs7V+xqyuwhG0n9JcP4Mq9Zi3RChVjlFoyS9c=; b=Eud3RgStQCyeDgiCuv3CmVbPFd
	Nocf6r2vyv45+YJYuZx5E6Ypjk+GXAHUIKgZOemJ6ipmMiN1lNRPwrNdRMGZB4y4HwUx2nRV1fwCu
	d6AM8RuWgPO7n9OLVlM83zakn38fvaQGPH1NFB7wOPBITsnkov9otksh2gE9QSj810jvUgzf6vQ4J
	dsiSCis8efnPCfxWNG7RqgpsyRQP3D7Q1BjUMWzvIQrQEcRPcKcDw6rm+jzKmtdN/T0SqnYMDutpU
	QvnWUwxRpJzqIc/RAB6qxTFQUQDHSS2XNQdAaSTOH4yRKqBPS947YvFs/gWC8+LVBXtcPIQe/ptm6
	HUsc8CJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIRrm-00000009Ovd-0alt;
	Tue, 03 Dec 2024 12:18:58 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIRmt-00000009Nfk-3Dtv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 12:13:57 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5d10f713ef0so500518a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Dec 2024 04:13:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733228034; x=1733832834; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6M6cTvNs7V+xqyuwhG0n9JcP4Mq9Zi3RChVjlFoyS9c=;
        b=bwsHYZw8qrZzvuEHRjKj+EzzMisoF1hFG5qVSMb9W9sw6UV+CeCkqzhG8pH8oJBV5I
         IZGNioo4HP9pbzJBbKhJM9CSV98HHH4/CwR71hSSORsjrfAQA1C3OONGY5rbVgiBdgpj
         yc9lQj5ORW6uibCVMVX115UhsOVXRIBm8weYlspqKNbKque07nRQBFjILnJSmQeDb3XH
         LZ64bb+8A73BY+Ys7YYGXdRPZ/gLnhUU7Lo6BJSb408fugDPMsnc+VR5g4vL9IQi8z1v
         P2S6PfQTggwko+sLxPNaksQuqVfiSMsSKcfarVTr0Z0hXYiv0n6RYRWYeAmCVgjFCEi6
         Fx7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733228034; x=1733832834;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6M6cTvNs7V+xqyuwhG0n9JcP4Mq9Zi3RChVjlFoyS9c=;
        b=TH2eT4CwKLTn3651wMfScN7Fr++yUeFQU5j8C64fHf2rhG7ZhbNr/JiskAsXK1jYPz
         bixfCTbCVYYaL1ClQXCVfGW3mtM2BLLsj6jYbu7dvhjqEFpBW91wJiPM7DRMhMurv8ch
         F6UJaoA6mBrS7hewsZ+pU/BcV2nB5T5/hpBkMRCbV8wKRA2Png29HZ3HUHA43e79wtUf
         8qC1bi30MtWr9TAitUmP1gSLiWgYTvA5u2nolmKH69bZd2YzSAGaGsPqQJMYfNaSZ/gE
         B4j+uWwrFp3X6S6JR76rF96ClP+TemF8+RxyM05MeGtSM+Nz8Rm3gX6CQB3Hy89f8r88
         74oQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKc5B0prjMeMt0bBICPOcFvC6UEKQWh7RQyPu9iaKK3VPqYnCTVo0o7kCyKqfwQgYEdEAIPOQy+itnkOThpE3Q@lists.infradead.org
X-Gm-Message-State: AOJu0Ywdqd3/t3+gJUOwIBSU6Uf2kxaRxqlVimoLZBgunXmsMx/EsJ9l
	5sp1riILUUnipnv6wPys94mInAT8FT94ugT3kpk2Vt7YJUT4u4pyaZO10Os5ZkA=
X-Gm-Gg: ASbGnctD5vPl3wnZ0N1a1yB2Qy/7JJiWiXZpmYhl7BXmM85uLuaVxhCkteOHaN6/8U8
	Zbl55qECItdYwEL7P4TsQ8CH8CYzFKe1ODP0nwgW5DaIm0R6D3KNk2pFxLOq/5msgSeMbBIqGy+
	TDjODrK0vSd+hSYz2CocnAs+t3UkzEhgZbc+HZ99b2Gi28utxs2HbuYxMMzQZzg+zmk4a1LXvV6
	57yEWtQYp7T7zK/aw9zVEDQP5I5Sf0X10nySe8ckhGaJFKK62lA5f/DJavvn05mPa/7PuQ7K2IV
	rkjm9yKIljmI+xg0o22pNCrHJAv5WM4xgQ==
X-Google-Smtp-Source: AGHT+IFmVCN79AgO12dD2PdCbqVnKblHT8yfYp2CBGY/43ZxpcqEVT7DluzFyun9DnuIF1YW27jRrA==
X-Received: by 2002:a17:906:d54b:b0:aa5:3fe7:4475 with SMTP id a640c23a62f3a-aa59453454fmr3031209566b.11.1733228033761;
        Tue, 03 Dec 2024 04:13:53 -0800 (PST)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5996c245bsm607603766b.8.2024.12.03.04.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 04:13:53 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 03 Dec 2024 12:13:53 +0000
Subject: [PATCH v2 5/8] phy: exynos5-usbdrd: gs101: ensure power is gated
 to SS phy in phy_exit()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241203-gs101-phy-lanes-orientation-phy-v2-5-40dcf1b7670d@linaro.org>
References: <20241203-gs101-phy-lanes-orientation-phy-v2-0-40dcf1b7670d@linaro.org>
In-Reply-To: <20241203-gs101-phy-lanes-orientation-phy-v2-0-40dcf1b7670d@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Roy Luo <royluo@google.com>, 
 kernel-team@android.com, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 stable@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_041355_819885_9FA45E3A 
X-CRM114-Status: GOOD (  12.40  )
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

We currently don't gate the power to the SS phy in phy_exit().

Shuffle the code slightly to ensure the power is gated to the SS phy as
well.

Fixes: 32267c29bc7d ("phy: exynos5-usbdrd: support Exynos USBDRD 3.1 combo phy (HS & SS)")
CC: stable@vger.kernel.org # 6.11+
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v2:
* add cc-stable and fixes tags (Krzysztof)
* collect tags
---
 drivers/phy/samsung/phy-exynos5-usbdrd.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
index 2a724d362c2d..c1ce6fdeef31 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -1296,14 +1296,17 @@ static int exynos5_usbdrd_gs101_phy_exit(struct phy *phy)
 	struct exynos5_usbdrd_phy *phy_drd = to_usbdrd_phy(inst);
 	int ret;
 
+	if (inst->phy_cfg->id == EXYNOS5_DRDPHY_UTMI) {
+		ret = exynos850_usbdrd_phy_exit(phy);
+		if (ret)
+			return ret;
+	}
+
+	exynos5_usbdrd_phy_isol(inst, true);
+
 	if (inst->phy_cfg->id != EXYNOS5_DRDPHY_UTMI)
 		return 0;
 
-	ret = exynos850_usbdrd_phy_exit(phy);
-	if (ret)
-		return ret;
-
-	exynos5_usbdrd_phy_isol(inst, true);
 	return regulator_bulk_disable(phy_drd->drv_data->n_regulators,
 				      phy_drd->regulators);
 }

-- 
2.47.0.338.g60cca15819-goog


