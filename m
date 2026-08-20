Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0260AC5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 14:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=czoOrQkTCM70VZKBNhJxXyCegI+z86opj24pXPk8LIQ=; b=WvvSWguG4e+hmdHC+PmhYd2WnG
	F8Vxx+HaBFsT7D6PvYVGqynpG8Y92hNo4+vKpynI5OIu8Dj2qJmgBAXigtX+qdM+WuZikcOig9HAw
	x367G9/FAoegZv8kcGAkD5NWd9LVegL7ZRfJIKUzaTUQ560EAcG75SevpUPqA+8OBTbysY3RKriZY
	T3n8pwdZw/Fv76xuaGj8FCDYxu2kONPoyr36zckEPNblei0dhnLcGJPvpTmV0gZLwcGWekN7bOtr7
	P+f/NWZV6Se7SBpiXpq0k7FhOdQu9rBe7p69guT6FBZXqtdguhH1+FFnLX4gdRiK0krpqTmtR7OKv
	nh+l1xow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx3L3-0000000Bei5-24tI;
	Thu, 20 Aug 2026 14:01:49 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx3Kj-0000000BeQu-1GDC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 14:01:30 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-47f3b39f2a1so1957177f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 07:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787234488; x=1787839288; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=czoOrQkTCM70VZKBNhJxXyCegI+z86opj24pXPk8LIQ=;
        b=WhL0/gISuuaV85E6ZnW3QIBTjPvQbqKSHT6MEqjxWHawgX+ztz0gfA2/ESnCn8p6b3
         C+SK61kLp/nEq4W7NXwO0xZpNfHiPrFFGKw4Uub0zBYlOjo8SJp7j5mNRP+VaAqujs8I
         YXCn48VZgrhkk4253F+YnQ+yXyRMSt5XQ1cNGOB2qFwWhswCnaM8oGcUg3ePNbu7nzUt
         qJRcEenJXymwTNOMrKCbAmZBfX5UGQl9U6L7oapl3XOwUQ64zqaTykC/R19JuMQ5CtvZ
         KlqprzAn5WTKUt/hS4K0jIzIGo3bRoPo4WMDT6LKP710L/BZR0wdO9b9ztH3eqXZf4wp
         cUmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787234488; x=1787839288;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=czoOrQkTCM70VZKBNhJxXyCegI+z86opj24pXPk8LIQ=;
        b=CiUw92UiMFvQZtSGYTc1yaLbXLKixd0UhCuBiUWeHgNChPFZtcQJZZsTvLh8G5ar/N
         wKToozzY1/PSl/aWaZHsDzpqRNOVX80emo+UfjdfnyRqPRbc4nD05KjaR86Kwt1NQ9wJ
         FnTfqzKoMZdQaqaBhc3N/irooLvoNkQ0/NF3O6CEP0EHxDvAktCwsgld/YQ2ImoZmYuu
         m80SIkzkf4n3unxlhWw5tDNGe8etEw0n8fWnZ0mBMCUOnlWcm1zpIT2pguq+Rh2zZIaI
         V76ogR0BIA3KABxHQJ3qJjHFblBLHEyry7ssvjKQ6ElN5b+vS8cY5L+nuZyVJZvSVC1H
         douA==
X-Forwarded-Encrypted: i=1; AHgh+RqkDdiImzbu5TKVaq0PyDPyfF+hYvpbdVxpVlqVTQdupunYi8Ogdg4jldIGNnJwP77pR0gjYHhT6iysOssiCBaO@lists.infradead.org
X-Gm-Message-State: AOJu0YycFVU4xCjdXuzhYyOfUySWWDaXatcBf5f0lIRG50lELs7AJKS5
	upUtAENs42XVCrhhN/fMSa2TjE2t12R2oL5sFZzjRfF6O+CMQWqLeTbs
X-Gm-Gg: AR+sD11cqqLYb9gv98q+D7tbmxw5hkFP53pBbvj73TlKU/ZnaDnkazzuGYEM+ZgS9gk
	7qFeySYAf+eMHxSX5gw4/anddPC7xaGN9MMT+stocOxxImejmyVHpAqQutNwbU5Ms9E9IAoDTlY
	UV5QMTRKw2ztaQJHqAgbjKtLny4Pok050r3YrFyQSVYfi3FMrKxAwL3SKzs0YHV0VmdqJEhW+yj
	3kqXzAUFs6DDcoX17xfW+dGs8qnG/wr42saR/AKGbn8KIq1i3P/INa9K3KKA6jW1b/Nh/+WXENC
	D8dF9+wj19R4zNvwDYxGN92ComflSXjuo2iLN9Ntc3Lh62KM+Vkwhvl73P6mDrO20z98yfM1SAy
	1JcYQSqwuYsbT7l7BoAt5lm9zvI0vy0wlXncMO9p1y8Nhliyw9XJgNvfzI51IygArxYbeNS3dht
	TepEWruPwRa7Mk65ejlj9aIna6h4f4rG9y6WnQ/rgLDo4EGIdRgdQwgI7nTuSabJBGtbEHGzzve
	LDH1OFybVl5VowCE+kNR5N/eAOJL7bU2yWFZl909NXlFhpbsvAWnuSdQA==
X-Received: by 2002:a05:600c:190d:b0:499:873b:471c with SMTP id 5b1f17b1804b1-499aa1738e7mr212033545e9.6.1787234487497;
        Thu, 20 Aug 2026 07:01:27 -0700 (PDT)
Received: from [127.0.1.1] (lmontsouris-656-1-83-121.w82-127.abo.wanadoo.fr. [82.127.110.121])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa0e473dsm137978275e9.15.2026.08.20.07.01.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 07:01:27 -0700 (PDT)
From: Amin Gattout <amin.gattout@gmail.com>
Date: Thu, 20 Aug 2026 16:01:11 +0200
Subject: [PATCH 4/4] arm64: dts: rockchip: add csi dphy nodes to rk3576
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260820-rk3576-dphy-v1-4-70e25e8d5e78@gmail.com>
References: <20260820-rk3576-dphy-v1-0-70e25e8d5e78@gmail.com>
In-Reply-To: <20260820-rk3576-dphy-v1-0-70e25e8d5e78@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
Cc: Michael Riesch <michael.riesch@collabora.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, Amin Gattout <amin.gattout@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787234481; l=2044;
 i=amin.gattout@gmail.com; s=20260818; h=from:subject:message-id;
 bh=bGK8ht4ZsYBRwxHCHXvcjD3xAuJ63yHglUCiy5arzTU=;
 b=44XQHZryO6sGy33sUIcTlfpaikDf14UiSkCAI8QjIux3seiY5mPvwK9CfmRjJ91dTLd2ARq2C
 DFtOzYij4uWB57MbraTHamPWVk21d/zyK7wnc1Wjdlg9Xw97C2nmNO+
X-Developer-Key: i=amin.gattout@gmail.com; a=ed25519;
 pk=MSIqDPkCOkwtyP8Fns1m+KFU9SgqoDl2mpLe18vL+hQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_070129_396965_F122E8BB 
X-CRM114-Status: GOOD (  11.46  )
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

The Rockchip RK3576 features two MIPI CSI-2 DPHYs. Add the device
tree nodes for them.

Signed-off-by: Amin Gattout <amin.gattout@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3576.dtsi | 34 ++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
index b0c0d3c8b1b1..b7a527614243 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
@@ -973,11 +973,21 @@ sdgmac_grf: syscon@26038000 {
 			reg = <0x0 0x26038000 0x0 0x1000>;
 		};
 
+		csidphy0_grf: syscon@2603a000 {
+			compatible = "rockchip,rk3576-csidphy-grf", "syscon";
+			reg = <0x0 0x2603a000 0x0 0x2000>;
+		};
+
 		ioc_grf: syscon@26040000 {
 			compatible = "rockchip,rk3576-ioc-grf", "syscon", "simple-mfd";
 			reg = <0x0 0x26040000 0x0 0xc000>;
 		};
 
+		csidphy1_grf: syscon@2604c000 {
+			compatible = "rockchip,rk3576-csidphy-grf", "syscon";
+			reg = <0x0 0x2604c000 0x0 0x2000>;
+		};
+
 		cru: clock-controller@27200000 {
 			compatible = "rockchip,rk3576-cru";
 			reg = <0x0 0x27200000 0x0 0x50000>;
@@ -2848,6 +2858,30 @@ hdptxphy: hdmiphy@2b000000 {
 			status = "disabled";
 		};
 
+		csi_dphy0: phy@2b030000 {
+			compatible = "rockchip,rk3576-csi-dphy";
+			reg = <0x0 0x2b030000 0x0 0x10000>;
+			clocks = <&cru PCLK_CSIDPHY>;
+			clock-names = "pclk";
+			#phy-cells = <0>;
+			resets = <&cru SRST_P_CSIPHY>;
+			reset-names = "apb";
+			rockchip,grf = <&csidphy0_grf>;
+			status = "disabled";
+		};
+
+		csi_dphy1: phy@2b070000 {
+			compatible = "rockchip,rk3576-csi-dphy";
+			reg = <0x0 0x2b070000 0x0 0x10000>;
+			clocks = <&cru PCLK_CSIDPHY1>;
+			clock-names = "pclk";
+			#phy-cells = <0>;
+			resets = <&cru SRST_P_CSIDPHY1>;
+			reset-names = "apb";
+			rockchip,grf = <&csidphy1_grf>;
+			status = "disabled";
+		};
+
 		sram: sram@3ff88000 {
 			compatible = "mmio-sram";
 			reg = <0x0 0x3ff88000 0x0 0x78000>;

-- 
2.43.0


