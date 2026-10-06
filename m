Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5DF1CA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 20:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d7tY7hVtYcSGrMabWy9Irpy+9KqMZ8OzQ5ThjhxFTYM=; b=VExS7NZFUovu/YvUuEcJvTjrpy
	ejzs8+wKkEchfvqvC568+KaUlxzgoLhlnMG4UjlGpFapL+gvepmnEO/YTQ7EZvj7NeI7SK/+nb+i7
	Y+vRRqLexUrTTrPCWlZi5uRwGjdzDqGU3eS9y8zU8yMKo+9QOjyUACcb8dkeUPucq4Q2klEirFt+g
	ZfKeqta73jg1mD4v9Ms8EuCJOnrGqJJlM6zgI+cw43eYc182BQg7ghsrkuRDNaLT1eJt/Q4pxk7s2
	3+zLboIbnCz/uqvh/EdNoECRgN3g+Vni4HqGmk4zvVgk800pvFtkd20c0umnxA34lJoiHqwzhBVAZ
	sVIDR2JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEBjX-00000001MRn-2ckK;
	Tue, 06 Oct 2026 20:25:55 +0000
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEBjQ-00000001MMu-3BKU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 20:25:52 +0000
Received: by mail-oo1-xc36.google.com with SMTP id 006d021491bc7-6df5e315bd1so595825eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Oct 2026 13:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791318348; x=1791923148; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d7tY7hVtYcSGrMabWy9Irpy+9KqMZ8OzQ5ThjhxFTYM=;
        b=MCqC36OF06R/njsHsLOF4fQwqgKLNkDzW8WDLi5pY0zedJnca3KuNlIfiKoo89P2WK
         /LldW+9v76yQksSx3oSR5jzl2Zv+oeVk1PxzYVW7Kov8keDPHBxhUqLH85iUWd+9eA9G
         zE5yIgS1W5sJBfbko6UiEMpp/BQ/LIt/B5ED/BocL7f0agTv1E5yes3bseFsB+EzsiUU
         1eVX9mKn+Kc1hkloiuIdl9b2jRHz9JjzHY58AsXGXLfUvswHHwGxt2eOCFFDqqHScIpv
         2WKeFys/JmnbcNJYNFpye+1j5cjzYaCAb0gRorfCiDm5gEPFHSwbA7yUopyxj7uXo22p
         QCOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791318348; x=1791923148;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d7tY7hVtYcSGrMabWy9Irpy+9KqMZ8OzQ5ThjhxFTYM=;
        b=i1W9fH06gleoEty5yiZ9INEtnRsqnyglznuZAknUK50YkAF22YfcJYuscArKrK7uIX
         vFx1ORjWsb+ClRkAUljltPlH3wMa8FaUnvN3Difdq+c3YkhgschBbQjXRl3jHxJhzlD5
         duYcfMn/4TfP6yN3R1/eWEB1dtgFU5/9lKz2SPGJXV68aWDvrxtrFsp0fs8ZHhYeKd06
         GvP4vuNWE9MhMgMIG1z6rxL5qRIfmY5P0NqhmKRr007ZtZRl+iM4r0p31Oc8b6RgYU6H
         PiaC3zA/qVfA0yepptwiPuBwn6U4FjDy2Pl6Nr4tgx08JO5Ay2YF8byAu0ES+llSqW8m
         j9Bg==
X-Forwarded-Encrypted: i=1; AKwUvBx18IpOzfuz1KTiAdI+oPmVVleknO8RvzXII0zehLOmDodVs0W45i0X7RVGO/5YKntuRPoHMspQOFqYFcfzT/Se@lists.infradead.org
X-Gm-Message-State: AFuF++m6M0+LRNX1SiHJFNfE9++XPMM+ADFHGoAihK5itDg2NcamF05t
	4YDcHd6vLZ1U5OkbX1IPVQTOKE0KiIsBPDGjHN22F0KKAnBTw8L/avYnGESYFvIAIsw=
X-Gm-Gg: AYBFou3pU9ya/iKS/mqYOH9MiNMWswXWJKEiZy2/fkEpm6AF3WuUeUCa41rearHgDi4
	PSPGuku6jF8iy2xqxJvjUISQLhlO4V8rabg592WeVplSzWp34LnEwMGhwj2J7ZB2BBCrrKDSQep
	QALpTYXJdHCpGAjFZqYHj0dY1t33dW5GPWwdxuiZVLqxz60ykoNFiivERYvpjPZhRENpGDz5X2T
	NwN/uQIoQMpveUQyr5W7hKeIgHzuj6Yp2RPFeL9rKROQ1c+Wqf66iwwuGybsob6HJlAehosdrNi
	7LZrqzzm4U85CyrDMfR7+b71BO9JV9ZyjoHzq95aHtPvRZxtu14jo4IfMm7vJYLu2mfEie1vaWR
	RZmCCHbxkCNRjsneBV8LBTtzGdlE+EFT1fWLxADkR5j3r0FQ96WQ0dN2JxmEKCpvlDK/3tcZAT8
	3BajaHpzUecCbi91SrO67cpLauPKBrctWXW7sfMBoJlFSbs/O+nLbie0qqAt3iAQqAHdf8Sp7Qi
	w==
X-Received: by 2002:a05:6820:a28f:20b0:6da:82a6:3a13 with SMTP id 006d021491bc7-6e7a7c16529mr202545eaf.28.1791318347829;
        Tue, 06 Oct 2026 13:25:47 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:372:3180:ce34:1fe7])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6e793f68bf6sm463442eaf.8.2026.10.06.13.25.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 13:25:46 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Tue, 06 Oct 2026 15:25:03 -0500
Subject: [PATCH 3/4] arm64: dts: mediatek: mt8390-genio-common: add the
 panel vddp-supply
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-panel-himax-hx8279-vddp-v1-3-50d884b42aae@baylibre.com>
References: <20261006-panel-himax-hx8279-vddp-v1-0-50d884b42aae@baylibre.com>
In-Reply-To: <20261006-panel-himax-hx8279-vddp-v1-0-50d884b42aae@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=950; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=eCeuXuHqvmP/UFOQEKWmqU216/ZSkndN2WvM0HwWpA4=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBqxVkzFqTYwMskBqktBAGaQIkw6mYPOB0k1bRHJ
 +8urKmt18yJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCasVZMwAKCRDCzCAB/wGP
 wI7sB/0QM+uNZLoX1Jp8NLb2nJn7ClzLVCDOZXUqzT1od9Q9IR+Mai0hZvJJPbZyLWuWg+QKTGS
 NYg/wSz3bQw/6axBFVzO78Kh1bFlH+KP3j23zjsC9zt961U7k9ASdv0XJvU5UxSFoRHafe288eh
 yn68IMEfzt9Vm2sisR7roDYZpx6Aky7yIseJ/bRXhrXBhTQK+GY0OsZJnJUYrkmA08FBm58ZpFn
 lEEDS9l/yFPMFVQbVyrf1uNSe7s5UopCm0G94dDiFSohYZCxVZaohT81NiK3hOyVB9/fldAJvue
 uJUY7G7Yg3bPSW5541+85rKJzL/TEonFNaAps1j54drOKSST
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_132551_246003_6BDCF696 
X-CRM114-Status: GOOD (  10.48  )
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

Add the vddp-supply of the Startek KD070FHFID078 panel, now required by
the himax,hx8279 binding.

On the Genio 510 and 700 EVKs, the panel's VDDP input is on the always-on
vsys_lcm1 rail, the regulator that vdd-supply already points at.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
index 669eaec662f3..449af8014769 100644
--- a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
@@ -324,6 +324,7 @@ panel@0 {
 		reset-gpios = <&pio 25 GPIO_ACTIVE_HIGH>;
 		iovcc-supply = <&lcm1_iovcc>;
 		vdd-supply = <&lcm1_vddp>;
+		vddp-supply = <&lcm1_vddp>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&panel_default_pins>;
 

-- 
2.53.0


