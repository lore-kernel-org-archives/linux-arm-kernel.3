Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9191CCF2C9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 12:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0ea1NkzfJDwnTqydzvzwnSUsTKx9gypchzjscNQluAM=; b=r6uRq1LM7L8XmiD+b1RCtBIjTf
	FZClnzGIfJvwQ753Ru3zPdZ0w5iFehtkNSJx3JmyDPDCuWL+HnSRFi0efCKSXXEiHXXqDpmdxQAfL
	oHNjVuU7ExuHFWzNuTVHhMULpwoo9NWTBpiFVy4nvxcV+jx46KaPy/PLtNXfCepsdmnt1SKpX3DCi
	SyEr8PABeTzQA0fLeEDJ6PbKCYn+romVBNCMVJYaqwsGnxEf+pmDEEdZ/NzW6dheHDDy7HHgW9wqz
	RhR8tmGBfou3c21zvgI4XhQDkbJZZb44A4XMkKKjhvVCei7A6jKpby8xkKJABlOIDJ2a+CTYPeSp6
	Rby0xYgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIQ4U-00000005qn8-0QI6;
	Sun, 18 Oct 2026 12:33:02 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIQ4H-00000005qew-2K3u
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Oct 2026 12:32:53 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4a1df146015so4860995e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Oct 2026 05:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792326768; x=1792931568; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0ea1NkzfJDwnTqydzvzwnSUsTKx9gypchzjscNQluAM=;
        b=QEEBGuMEohlUrUWy9sMiYCb21WhG5XLJJ9zyFNc4OL9m2aXbMiD9y8gtoQs45Iydcl
         Hk6gpeFccAdX1H7H5B3epWNjfzNfjPOyvFRVLOssAsKQ7WN2odRI5ey42VPJVrhkKyJ5
         Re17D1+x2+MVBL/RwEMnC+IUj0wbOiiPghcAxjKnB6i3LsHnO+UZX4BlLeKEuSEOVMZH
         Hz6P88hSI8322hhAcR1jJgdgSPbSolf9l+dL7db55XxNFf/m/objm+nPvoQvv2umox0D
         579mN98C+yvX+YlJtyKV7Mz9mykKiH/Oxs0/3sdnUXMsdZi6//CxanDCh0+UjAKmvQTO
         jBuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792326768; x=1792931568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0ea1NkzfJDwnTqydzvzwnSUsTKx9gypchzjscNQluAM=;
        b=RkHkr40qtdVJxULDL7jk7K6RVXBX+0DBaBpdTz7BBFIueUJLNxObSMWEPvpb7Oyp8w
         twfczWRaimEz6LhDjNUj5pGmco7PmtSisYDbml0zqbK2Oj65sFBTGx2/FLTwMiWX56wh
         sLyiu567E2D/gyJ8lU47P1SEUXEKaOuw9bspIJQKiMLCN0YJc6Vjr+tGQIu5qZLL6hO8
         rwoDec1LtXe6Tu7jfMd+VTMxt/cdUm4iWhR0TDgbmiBXP2yhJVm6Ln/WR5j7Xc4orIV9
         mgh3jaBrXqUUOcy/uZF559DY6BuWt0m3+J+SfmlA9SBIqwctokg4iq8CF0BDk29arDcs
         nKWg==
X-Forwarded-Encrypted: i=1; AKwUvByDlnIP32aPm24I3GpaScJzy+i8iGrIIUmPBIPowBZ5lArquWxPMymBDs+3fe/2b3esTsMZbMknWiE/YOZ4YJeB@lists.infradead.org
X-Gm-Message-State: AFq9FYLAazPWZs5t/OQ5Sc9wy7wPl49tLDq9JzgVHc4ojfKXN6P1qV6b
	/cjrWC6Vz5juG+aIsDhVTJV0qKk1iHEJl8bezY3/PN+jy+lqTzF6aP0R
X-Gm-Gg: AYBFou0FPlb3WmYqYnjNqcFw5Y4yh80/XE+cK3hq99hY1YBgMDJ33IIIDNVZRxlTNHz
	Qb1R7tW/MFde0FVdosLZ1qEHJZ2QJ4SnwE4+BFZ/t8UeGQaAINXJm+lHrYMdQvAsUmOPzGfnemm
	xn8p9whoAA1AeaeU2sHNg5fVNIFveYDhstE6yS4F/Ihw3XcueksES0I/WFfB0Z0P8HjrSqiMUvJ
	YVKtlJZDiocTGsE/FkCvslHDukHXPYlgFRcNpk4X2kgceH85X8e3IK/BQfCXFQxX4m9wctXA2mM
	nU22dKcQrJU5rjbNNIIbDr1YvIPwnkx98EqLmIWViaUr6fHLm4yCMVs1d0B7SqjGVp4qSuqnwfe
	P3tOnJn+DxE5VyLr8HwvWByImg0SgpdeEBI+c0cmsZjb/ETSNFPKKmeDzDPFHekYz4Ms0dDkbf4
	ilScZzSAFKiLPdAk1RoQjk8QA+MJgcwjka7hn9Ss2xf2eOw6ajqGQS2i/y6tt+BDhNRSuWgkGN8
	pyxAjhMVz2u0YUtOmLNYjDUwpTlVVTpqr3nIF92wdrpT2JpWc0ypD46dTi9g2GEoCyoBl38KlN6
	fONbD9OrplehmZNhlaMSlA==
X-Received: by 2002:a05:600c:1f86:b0:4a1:93fd:8f8 with SMTP id 5b1f17b1804b1-4a1d75ab363mr108377035e9.4.1792326767681;
        Sun, 18 Oct 2026 05:32:47 -0700 (PDT)
Received: from Lord-Beerus.station ([93.66.71.207])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8ddde4esm245012535e9.12.2026.10.18.05.32.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 05:32:47 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v1 2/4] arm64: dts: imx91-var-som-symphony: Mark I2C recovery GPIOs as open drain
Date: Sun, 18 Oct 2026 14:32:25 +0200
Message-ID: <35386d3fe663aa5e42dfbe904b554968ab8d5f7a.1792326585.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1792326585.git.stefano.r@variscite.com>
References: <cover.1792326585.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_053251_242835_EF2C9D6D 
X-CRM114-Status: GOOD (  12.92  )
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

From: Stefano Radaelli <stefano.r@variscite.com>

Mark the SCL and SDA GPIOs used for LPI2C1 bus recovery as open drain to
match the I2C bus requirements.
This also avoids the warning emitted when the I2C core enforces
open-drain operation on SCL.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/imx91-var-som-symphony.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx91-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx91-var-som-symphony.dts
index c1e6c9978275..437a23840898 100644
--- a/arch/arm64/boot/dts/freescale/imx91-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx91-var-som-symphony.dts
@@ -224,8 +224,8 @@ &lpi2c1 {
 	pinctrl-0 = <&pinctrl_lpi2c1>;
 	pinctrl-1 = <&pinctrl_lpi2c1_gpio>;
 	pinctrl-2 = <&pinctrl_lpi2c1_gpio>;
-	scl-gpios = <&gpio1 0 GPIO_ACTIVE_HIGH>;
-	sda-gpios = <&gpio1 1 GPIO_ACTIVE_HIGH>;
+	scl-gpios = <&gpio1 0 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio1 1 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 	status = "okay";
 
 	pca9534: gpio@20 {
-- 
2.47.3


