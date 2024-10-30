Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D849D7497B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 07:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KknQSR+eKemNJFp2M8/mGkuIkN4Spn04GdvZ2A49qtE=; b=rI56TbM3BUw8wvjlAcM0xfezuV
	1kGgyZI9DxUNbwoKbU5sZ44RCySjg6Hfz7KdzmrZ2k/6IpMx9g9MFgtmd0BaivrWaUxUvZRNDD7E9
	t/bpiF775oMhlampuF8Owl9q9miU67grbUKN+upNDA99GaE/Soe8cF6knI0SNRghwGGcUFuur78Ha
	SHPOZciw1m7ss3X6zz/72wIgZlY+ojOgdEqdThIYeYkG3FgFF0Dkz7Tb8sqOSbyGjdANJDu+tkFx9
	YQGRQC0xo8kdglVisFoSKvYbEy+e7dikj+9XzzDgDCLsiLTmdC0jrWKU36jiPV7XTxsVf73z5oGPy
	mttBypEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t62mA-0000000H4ig-0bTS;
	Wed, 30 Oct 2024 07:05:54 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t62iu-0000000H46y-0rAd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 07:02:33 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-7ede82dbb63so2147757a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Oct 2024 00:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730271751; x=1730876551; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KknQSR+eKemNJFp2M8/mGkuIkN4Spn04GdvZ2A49qtE=;
        b=Cj3eL85dZjEIQxIAY+ieVpna6wZCoUVPtFoZHnRlO2bL6IvZucIHJAtY/D+d3vSuWI
         0u2Wea2FnhgKY4FqmJQj5z65IYEW8KDovL1X0fG5F9NRG2NbVD/X4kzhb4yYSkplTjgK
         ebtWCpeLU00oZeIGlkrCxrKux736CxI13+nWE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730271751; x=1730876551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KknQSR+eKemNJFp2M8/mGkuIkN4Spn04GdvZ2A49qtE=;
        b=T7Blk0Gz8VDxvNZ0Xj09w9nfbl4SNuiStAY2RxOuc/FuHatyM+Q0IaSewA5wijVOX4
         +wnQ0adXO9tjUlpm3MbfYKTxyJw3mOy51AMLXL53A1WlMceqPanKLcD7e0PqRIBRif1C
         n7+0fCY4HL98CxeACrAVbagOEewMywcf2lwecmqBSMABsqx3VXIjPJlvfwecvW9lRUzZ
         Ti5tlwGSNVPj4HLe2nmbA3TmjGaI/VWG4Ftd669De0vQeYPeiP9BCfMzDgcJYhYjmrJ+
         Ko8Pnw4lSVeq8L17Dcr/cYOjzxwjq+nvwXCq5hZALfRjtHRKFbfnMJLlzhCxNe3sIfEo
         b85A==
X-Forwarded-Encrypted: i=1; AJvYcCWXSDlMHnnIaN3eofcSOqVHfJUTMSW1WkRSSOXNB3r+eFe2KL52mG2uGaGqQZhZQHLnVZF3kv0w+r/vjnKU9pv7@lists.infradead.org
X-Gm-Message-State: AOJu0YxOa+e0t7ul/zOsTNLK/bbsq+jvmPqMOR2qUeC2EtegIrTQFESy
	cPZqaOHLBRohIWX7hGRe1LIGiVVTzj1kYAz0dG3WN9WIRxq6J5Z6EvM3ruxkoQ==
X-Google-Smtp-Source: AGHT+IE542rBFyNruVAgVa8rHIBdj9gp4Qb/CIOnHECLZLKhZmSrZ/HsHZquCKjl9UnkfF9hM4mmVA==
X-Received: by 2002:a05:6a21:1706:b0:1d2:eb91:c0c1 with SMTP id adf61e73a8af0-1d9a851d42cmr19985216637.42.1730271750941;
        Wed, 30 Oct 2024 00:02:30 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:d1f3:aa64:657f:d8a8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72057931a94sm8635848b3a.68.2024.10.30.00.02.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 00:02:30 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] arm64: dts: mediatek: mt8183-kukui-jacuzzi: Drop pp3300_panel voltage settings
Date: Wed, 30 Oct 2024 15:02:20 +0800
Message-ID: <20241030070224.1006331-2-wenst@chromium.org>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
In-Reply-To: <20241030070224.1006331-1-wenst@chromium.org>
References: <20241030070224.1006331-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_000232_248486_FF4C1BE3 
X-CRM114-Status: GOOD (  11.17  )
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

The pp3300_panel fixed regulator is just a load switch. It does not have
any regulating capabilities. Thus having voltage constraints on it is
wrong.

Remove the voltage constraints.

Fixes: cabc71b08eb5 ("arm64: dts: mt8183: Add kukui-jacuzzi-damu board")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
index 783c333107bc..7bbafe926558 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
@@ -35,8 +35,6 @@ pp1800_mipibrdg: pp1800-mipibrdg {
 	pp3300_panel: pp3300-panel {
 		compatible = "regulator-fixed";
 		regulator-name = "pp3300_panel";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pp3300_panel_pins>;
 
-- 
2.47.0.163.g1226f6d8fa-goog


