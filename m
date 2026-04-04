Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B179BE63FEA
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Apr 2026 19:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fFw0d3YxVX0IoKpqo6KQF5VmNpCfzzBEIlKe5xv8oSw=; b=JZeP3RAlbzPOqocM/u2p0jtdo5
	rvowkz5nGO5fGXnWVlmYyuul7t7ddSJ+xBwLNfCrIUau/SIlqGE91trmyW8fU2lobYKWsWxr7QSFd
	cv1nz4AWe32l4SiQsmw/uEh214fcWACUHwBBlJQ/7gwsivuavnc0mnvaGOuHow08xZTOvR+MgZh21
	U332JpNn3lQ4cRVThiLy49uelfUvcFvRBXfuvk9ExeUeJGdmCB4u09tkAXh7Fmlc9dl4Jbdy/HC6m
	OVZCDxXOCPmnS9ksDgGNvGZAKEeh36OFgBx9dxtLcUavqf2bUpHOfKyVv5cVFmrIOlIZe5SB5WBoY
	C0DDNaww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w970g-00000003iDW-0tcv;
	Sat, 04 Apr 2026 19:50:22 +0000
Received: from mail-vk1-xa2e.google.com ([2607:f8b0:4864:20::a2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w970d-00000003iCn-2Jyf
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Apr 2026 19:50:21 +0000
Received: by mail-vk1-xa2e.google.com with SMTP id 71dfb90a1353d-56a8e0ea02aso3261082e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 04 Apr 2026 12:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775332217; x=1775937017; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fFw0d3YxVX0IoKpqo6KQF5VmNpCfzzBEIlKe5xv8oSw=;
        b=ZxUeOHYtaBGnikK4GN6OQUyzJ1IMptnHYkTjDsdA4XyhVLBJJ3wSql5AiVyUVSJfyd
         af2tthgKRYRmTmPJcBWLUFciv4TfdXadPU0JFiuyj2WWI4BrXuFHKls7UhX2J7JQVFZe
         rvjEgrAbsMu1BN5gKSWxXuxafuSzsbWKClFPqhy3Xo02G2sMAuwuC+HxnXClPTRZ+7j8
         M3bdJ3DA7x/XeLw0OTEeG9c4Li4r2YJHiGVcxixLE+AoRuKnjevC6Bme01XHvsQM7NJ0
         +4G9juaMXNVet+exy1ZLnCPAej9ANgZ/O89ap2sbYl0q1SS2nGeQo0WeDm5lU6Al1ie4
         95WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775332217; x=1775937017;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fFw0d3YxVX0IoKpqo6KQF5VmNpCfzzBEIlKe5xv8oSw=;
        b=EhNZNHumsbVAJ+BsX3g2c/lyZWo1KU3LwaF8Q6Ov3k5dpPE+EOOWy0FppWfrsS/TjQ
         U+YOOTu1zZh6AEaDok4X4F8AJNijZvFBP9n2uw7nl+IosCZjhj6dG1k8e8aI9aXQxk5J
         VDrKRrO92N6VhnKLExAjHdl27oRuSZ//R4oMnk1OhGAR2Gs6m7RuH316XCRYGN4h2tYk
         VnMtc+LeXP4rBXW+9rwjfJDAWeIzKvgHUg2932yB9HPM7HLNqBfddOzOgSo0UuhLISf1
         IP/I4Fwn1pH9ngQ4PIspiLpJL2x7NhIamxrDIECwxCCOf9JwLiwJ50ZygtKtKTkxD4cG
         mvWA==
X-Forwarded-Encrypted: i=1; AJvYcCUlR2PgpJI8+Cp3CXxpxicpInaOHe0cLIAiE0t+3zOGjLGifMt45QUA5So1yM0//Iu5foE5iaQBMcIK8E9EN/xi@lists.infradead.org
X-Gm-Message-State: AOJu0YzwpgW7HJzxpWSkBvanpNudwqKix6EyHf4H8J3Jnu3Yl8A7XxZT
	lHw7HJWch8vew8RU+x7iio/w2eaOlh6BPbfroN3qlSrLrUVHhBxEURFs
X-Gm-Gg: AeBDiesJ+Kt6vDXvqdaHUm4JIjgo1izgaRzyRGvWnr5CgF1Q4OR1LQhfTAb7C3LvLX+
	DFAZTuMBulrRCIjoFujcebpTTrpmlskTUuh05bmNPT7rFoBnzs4Id8MUkQkODAcu0bLTH4VCZPG
	EwSrnPXfnvyrbQ3FqmmMDlujOPTECxe/lyhB2scsORdXZ7OBZhiAwUGyHQW6teLO2uicjeMWF2H
	6B8ZuDa6jZb4stHeKd4DlPC14T/AeB41WWxvA1z8G1+rCMyFPhhOQ540vcYXXcw1NIsKxjX6J3V
	+QOgwYNwUM282/WTeiR+8I0AggikIejvVeRt/Cp8sQuXR7y6KuBkc5glgDsCZuwNJ01i8wv2lCh
	nXh3o/FrthP3htO10EDD1O6zSLxuUohkAjCE7rO8SD/aBxdeTLkabMyKJobwngRkSdcaOCaPiId
	3YXk50kGamFdPW5LM6/eCQQCvIEYpFd4g/Wa9Lxyk3CKqF8LQWcdHblWt6GMR86o4bCu0rNA==
X-Received: by 2002:a05:6123:28:b0:56d:b337:4709 with SMTP id 71dfb90a1353d-56db3374a26mr1454973e0c.6.1775332217583;
        Sat, 04 Apr 2026 12:50:17 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:1b3:a803:fafb:5a7b:510a:6309:f015])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d9b8d22b4sm10695521e0c.0.2026.04.04.12.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 12:50:16 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fabio Estevam <festevam@nabladev.com>
Subject: [PATCH] ARM: dts: rockchip: Remove invalid properies from rk3288-veyron-analog-audio
Date: Sat,  4 Apr 2026 16:50:08 -0300
Message-ID: <20260404195008.1951910-1-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260404_125019_631401_3946D6CB 
X-CRM114-Status: UNSURE (   9.57  )
X-CRM114-Notice: Please train this message.
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

From: Fabio Estevam <festevam@nabladev.com>

The 'rockchip,mic-det-gpios' property is not documented anywhere.

The 'rockchip,hp-det-gpios' property is not a valid property for the
'rockchip,rockchip-audio-max98090' compatible.

Remove both invalid properties.

Signed-off-by: Fabio Estevam <festevam@nabladev.com>
---
 arch/arm/boot/dts/rockchip/rk3288-veyron-analog-audio.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/boot/dts/rockchip/rk3288-veyron-analog-audio.dtsi b/arch/arm/boot/dts/rockchip/rk3288-veyron-analog-audio.dtsi
index 51208d161d65..25c7c0667856 100644
--- a/arch/arm/boot/dts/rockchip/rk3288-veyron-analog-audio.dtsi
+++ b/arch/arm/boot/dts/rockchip/rk3288-veyron-analog-audio.dtsi
@@ -14,8 +14,6 @@ sound {
 		rockchip,model = "VEYRON-I2S";
 		rockchip,i2s-controller = <&i2s>;
 		rockchip,audio-codec = <&max98090>;
-		rockchip,hp-det-gpios = <&gpio6 RK_PA5 GPIO_ACTIVE_HIGH>;
-		rockchip,mic-det-gpios = <&gpio6 RK_PB3 GPIO_ACTIVE_LOW>;
 		rockchip,headset-codec = <&headsetcodec>;
 		rockchip,hdmi-codec = <&hdmi>;
 	};
-- 
2.43.0


