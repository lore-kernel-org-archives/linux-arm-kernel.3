Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 888D0CCA491
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 08:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=soC3oS7a5a03KgF4DpWOLsJcd+T0181emvr4pS+/rCo=; b=ZtOPKFwU6vhNxxX2qNyu2uuAZx
	oSwKNkuCV3bJ1WTAfwTF+MnPdaW/KiNe55eTIIaLGmAnm1F0BT+Y47ojLlm1L4OPEn5tPd8v0isLv
	kOhz/7MetMncwl0iZIfg0tOTNYXzkuza7Qiydg3nLO3EwK24QKy67H/fL/bhRhd1IUxrMuEmmh9x5
	oU+Ol7ztEgHnyeLkZ2RzsbPhxf1owjNM9Xatjsj39faKK96StZhF4AmbDeMBjnHiL38nPzBtO4Zw4
	swgPL7Z+VcSfAB568KxUgXtG7ycBY6Bj5TU3tnQXCPoqq31qKdSOeqh6RUkEfmEPGSr8RYCCezI2T
	yU82g75A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHdkl-00000002Okk-2W63;
	Fri, 16 Oct 2026 08:57:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHdkg-00000002OcS-1zlj
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 16 Oct 2026 08:57:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=soC3oS7a5a03KgF4DpWOLsJcd+T0181emvr4pS+/rCo=; b=UyFeime+i0vS0dEduXuCyC5fMF
	onbc1LvdQ4sKL/6JsBLsGwsrieo01Cnnd0rsVplWwkGU0G6WKvsRi+lswZzU2UrCrmXD0sZtk3+MY
	l9cJnmIW1ULLXZXhzE0rQ6chSg+86PZTiW5Exno70XKY6te2Oq/w+YSloX/l9uJn56E7K0XszQLqT
	ugIC68/LbGrPdCTDRAXu/5ZUN5SaW1GKksP6nDc4b7QwX74co6wJcl/p5JS60c0jsxVeTFpgpa/Fs
	jY8n+hpcQ/uGPUsAV1Ve4yHIdme4KDXcROvn1IJrxVaevla/VmnOGW1ohsES9EdPMK1t4q+rjxn7j
	l5AG9UtA==;
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHdkd-00000001HxU-0zet
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 08:57:21 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2e8ad5b2f61so4019495ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 01:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792141037; x=1792745837; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=soC3oS7a5a03KgF4DpWOLsJcd+T0181emvr4pS+/rCo=;
        b=XdqPAZ6vs1/RAufnD78UUZgGTAEgYM0x7n3cuFsso8bQe6YRJedy/pimXe8O5mK+7z
         Lac66ShfgJ+ww7xkQJqnZMZKwagajCFVDCCuF7fI13x2PiUUo8hOga/0qRqXhzjd4b4G
         rLLON/CeX68PdDwnGEkuOahYg3ELl3B9gKyBL1YAtUN//pHCrfZQmDTGyMBOG0r7tzdT
         U8EVLbU/ufK9YpXvco8yBe7Aasc1qSXIBOU93OarZ0I5kxCILzGlM5l2MKrwoTBUGrcJ
         Fe0N1gKDOlU0D0VLA3sJjtaSFyH0rPxWKS3rj0/S34m/SeDwfCcljso8fj0YY5DA/AIT
         Lt2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792141037; x=1792745837;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=soC3oS7a5a03KgF4DpWOLsJcd+T0181emvr4pS+/rCo=;
        b=c69SBE8Dw7dCGkaD/KRpsCWb7BqRhz6pazURCXC+NDAI//adn2Pi7B0aCn35HTqZni
         n5DLr1BCkKEt7p6GaKf6n5tCqK8LXkAd39ilenoWKEJS5/lFjF+ghAygbLd7ct5HgzyW
         zNJeDy1eBqr1nLYWKfPbu7EGbIjG1aqKwnTrdQQNJDcWe5cffBjK0EVfoefT1oKtQyGK
         44mSRSBiIYVCDsW3G1uAqJaue1GKlvIKFn/deudI+blN5apVTyfLV+ZypiY+1WuffHIZ
         v8Gr9qD46J2fCShMo1Ijmp+dklNm7ud9TKmqlDKNiiGpH1rwgvnyWt2rl1isIw4HJHbD
         7C/g==
X-Forwarded-Encrypted: i=1; AKwUvBw8p4r36pL6EpdTqUEAt8welzqLU/MtPHwYw4+r29PKftl7IoAH4LtRNaLaLs9NGrMJUwnuAVVLVAQeQlfWCJnr@lists.infradead.org
X-Gm-Message-State: AFq9FYIlFmAsP4WqRWc+dQ5FMRgz9kHjdVvIbQ7UDqOb9zVzOPdYS4Tb
	vSoOKb0WxeqcJ+kFOqqehUfZVK5ZY697BaO68A+czj5+s6H+HbWLX16b
X-Gm-Gg: AYBFou17rG2b5FMZsQKKP/cMsl8izQ7Mcq/BWLPuofSiFSJF7hikWKKcibT4M8h2vd0
	Pof46OsGiDBJQgox6OiSgiGdY1BNFtKUfEAuZ8+7Da7DCI3IdUPuEZPg/DKX7WJMdYnGlSoGu3t
	5jPLxTS0FqaTLEc0PoAfAchP+t4Ir7kfnJSjAsHs9LS4/k6BUS7Nabppm281U1g/MlprM0gYimP
	CKZchm8JtE+K6iRyBE3luTZdZ4ApJRBvMEIT/DtuNK+iiVBfznBZwTLCZ/45UxhhGJyoxm0n0rr
	Rm5lQLJwi4CscJ3DEipgixgnU0yaLSSsc0lQ7qMQZivNyX5J63fgYPPeMO9FgrABNWTv3XbRnqR
	KomXZl9Q6UGNpRvQpNMAqGVSFn3voPKk34bWav9spdgBjOlJNfWNbSxwIJ51t1Z1GCWz4KhlAzH
	yPCGBuQ+WVZKyh2GTH2KY3GoaDgnRPB5HXXxBqS0gWnKIRQnsxy6c5D0MHcf/uqPqRKeGT3HfwU
	qPJqLVzt7+wKhLHukT1Y7bcQtyNsg==
X-Received: by 2002:a17:903:2407:b0:2e9:53b1:a3c8 with SMTP id d9443c01a7336-2e953b1a559mr91141175ad.0.1792141036442;
        Fri, 16 Oct 2026 01:57:16 -0700 (PDT)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e882a20sm6971025ad.62.2026.10.16.01.57.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 01:57:15 -0700 (PDT)
From: Jason Yang <jason98166@gmail.com>
Date: Fri, 16 Oct 2026 16:56:41 +0800
Subject: [PATCH v5 7/8] arm64: dts: rockchip: use two phy cells for the
 rk3588 mipi dcphys
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-dcphy-rx-v1-v5-7-e63b49eabe2d@gmail.com>
References: <20261016-dcphy-rx-v1-v5-0-e63b49eabe2d@gmail.com>
In-Reply-To: <20261016-dcphy-rx-v1-v5-0-e63b49eabe2d@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Guochun Huang <hero.huang@rock-chips.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Michael Riesch <michael.riesch@collabora.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Jason Yang <jason98166@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792141002; l=1777;
 i=jason98166@gmail.com; s=20260721; h=from:subject:message-id;
 bh=4OavUBeyGqaDIQHOgA/IhtahRkKYw5WBMKHlgGZGkLg=;
 b=v4sInDUQ/7XkIMzK26fj1mNhWedwz2y1jAeJhVW/owd/Y+g6H8l/hQlvpgno7POd/zFYYL10J
 lVky0MG/7a6BXkIlwekLASsH7MOoF5G3njxjIvRURKOz+XEH0L9NH+L
X-Developer-Key: i=jason98166@gmail.com; a=ed25519;
 pk=xQmD001Q/ooHl39PxyQtusbUQmgbOsSfpFryRVWZ/k4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_095719_627183_84735075 
X-CRM114-Status: GOOD (  11.54  )
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

The MIPI DC-PHY binding takes a second cell that selects the transmitter
or the receiver. Switch mipidcphy0 and mipidcphy1 to two cells and let
dsi0 and dsi1 select the transmitter.

Signed-off-by: Jason Yang <jason98166@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index 376ad04e0786..94d68fd89753 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -1788,7 +1788,7 @@ dsi0: dsi@fde20000 {
 		resets = <&cru SRST_P_DSIHOST0>;
 		reset-names = "apb";
 		power-domains = <&power RK3588_PD_VOP>;
-		phys = <&mipidcphy0 PHY_TYPE_DPHY>;
+		phys = <&mipidcphy0 PHY_TYPE_DPHY PHY_DIRECTION_TX>;
 		phy-names = "dcphy";
 		rockchip,grf = <&vop_grf>;
 		status = "disabled";
@@ -1816,7 +1816,7 @@ dsi1: dsi@fde30000 {
 		resets = <&cru SRST_P_DSIHOST1>;
 		reset-names = "apb";
 		power-domains = <&power RK3588_PD_VOP>;
-		phys = <&mipidcphy1 PHY_TYPE_DPHY>;
+		phys = <&mipidcphy1 PHY_TYPE_DPHY PHY_DIRECTION_TX>;
 		phy-names = "dcphy";
 		rockchip,grf = <&vop_grf>;
 		status = "disabled";
@@ -3429,7 +3429,7 @@ mipidcphy0: phy@feda0000 {
 			 <&cru SRST_P_MIPI_DCPHY0_GRF>,
 			 <&cru SRST_S_MIPI_DCPHY0>;
 		reset-names = "m_phy", "apb", "grf", "s_phy";
-		#phy-cells = <1>;
+		#phy-cells = <2>;
 		status = "disabled";
 	};
 
@@ -3445,7 +3445,7 @@ mipidcphy1: phy@fedb0000 {
 			 <&cru SRST_P_MIPI_DCPHY1_GRF>,
 			 <&cru SRST_S_MIPI_DCPHY1>;
 		reset-names = "m_phy", "apb", "grf", "s_phy";
-		#phy-cells = <1>;
+		#phy-cells = <2>;
 		status = "disabled";
 	};
 

-- 
2.43.0


