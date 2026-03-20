Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0EC7109318F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 08:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z8BTqnTP+MmFfu7yIevMNTcW0CwEuW3w6MEJfZCoELY=; b=Uggm2TQbU5P1UeKzwxJeEBqIbK
	XHRHvuMw+N1drzAc4W06rfX/roid/Za3Hj9ClhTIfd9FCR29TWRAAsYhSMuqNc5H2UCoo/JywzXFi
	0A1A5Vp1FK/Y/KuJTecfmzDJCcHH5cHBorzC74m1O7oSy69/CdYQ7hSYqEDKAJQvax6Q+seX1FVUz
	VTnC/2p8jItYdQCqrVCNGUHMv3jfCgVHQYcJ4SqvkG5ByVNoF4Velbng4wzjAQwwacnAsYFWI7Tvc
	KF/1gaxIF8a384H5ZUnIUvU5N2a2WPQHT6uGem+A+Wo/LVySo4TrI9ot5YZc7W5haMJ/gIr+ilyJy
	dMQbdsRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3VSx-0000000CNss-0sZb;
	Fri, 20 Mar 2026 08:44:23 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3VSl-0000000CNhh-2IdC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 08:44:12 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2b0484a6de4so7610355ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 01:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773996251; x=1774601051; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z8BTqnTP+MmFfu7yIevMNTcW0CwEuW3w6MEJfZCoELY=;
        b=XLgob3F76upCl1tjijDBqBzoY855dIDDLVoj44w/OYbQwssfj2xZXT1GI5/97KwJZr
         6IueFXkepu/SUP6xewm6LsGp9F8EndIEX7blDeOdY3QYfbdol+az0T0+LewPkhHAhBc4
         YvdUgQjJv47YVBpdMtvWSvmmKw8jnGBzFh5CI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773996251; x=1774601051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z8BTqnTP+MmFfu7yIevMNTcW0CwEuW3w6MEJfZCoELY=;
        b=Xda3FeEXw8DHe3pWYRvsIaNPl8gCNRMNK+y2P+IMm7Ze1933a1ASLmCPZo2UbejVUD
         5uZXV978RoOwsmh2xFw1vyIeAUbKr/mGZHRADWalL5ioa7O7IVKcGUgRTCUC84pU7uVQ
         cS+kodPdBiKBpINORUCyi5mCF+h9xAxr2F/mI2H7eGysk3MYF2Gh35RyFIWOJuTsjBmq
         mb+2EZLFM2TKc3DDxCQfq9UQ5b8QNOq1GvELVVDORSJx4dN+qHZ8vpkU/gVDgBS3RM2b
         mc2J+zDxX/oDDa5LOnCoMUNbMv4SJTUn1B0QIRXiH9rT4dt9jxbcd/Y9mcEtuv5aoXdB
         oxaA==
X-Forwarded-Encrypted: i=1; AJvYcCUixdsuejPiXm3eWuQBc9fdGAJ1DWMx6YOPL+F7Wyn7g9uTZcOFLFzv9jrhk3UTiz/H59WRy+bPNpfPo+Xcgn2x@lists.infradead.org
X-Gm-Message-State: AOJu0YzfEt9vIDQkhQRONIKcpt9YHd6u+lD1i8MYA8IQG49mo0LVviJ3
	jKYude8LJN3ehq3AQug8WV2e0LjExcEMq4H7iUePmuDNdf6Yy4XPPWob1N3KJ0tI5w==
X-Gm-Gg: ATEYQzxoWS0alMYjv2x68qNrI8kB2wkALwCsZu2vv/aGURGgvnFxP1duTMHY0SuNWO6
	hXp4Mjbi0f/Gm4GneDV/0QRxtmIDUZHA7VgP3KB0zGEdKPvlxXuiVP9iZKo9gNxHYPJj2Ho34f+
	XWlZbRNNih+JzDjvaTcJnXk0ZOA8YkQiJr3oueOWX9y/ViH+uJGGmrcff25dc+2eydMMZKASkuQ
	JN4nyt29N37AA1mf2ZhIeAHutxWZHwT3tVJ5dfL8iFJGwIxdnqxXB7N/DZXdBW/IoxweH3WLg0s
	FbOakEymK67cRvClwj95039QINNGEpEowtbGtOpL+FQDv+1kBmzZehICbto28ay6gijx9kNhi0d
	C0ZT/toLZhCgvvLy75e05xa2S8PkoDzLtRrzXAe2ST25We4Tv1CnjiC2K+ttLzW2PSQCD49Irzh
	FvLLaxZpxpA1CWFDhiF5k0c7aw6D29GvehcxlvQR5xWhcsCkrbeRykA2n/G3tTUCHp5RMLgWgd4
	4wK4Y69
X-Received: by 2002:a17:903:244d:b0:2ae:ceb0:d5f0 with SMTP id d9443c01a7336-2b08280221bmr18950125ad.47.1773996250947;
        Fri, 20 Mar 2026 01:44:10 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:9cdf:e932:6f2f:c654])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0836a3066sm14917905ad.75.2026.03.20.01.44.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 01:44:10 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 05/13] arm64: dts: mediatek: mt8192-asurada: Add supplies for ChromeOS EC regulators
Date: Fri, 20 Mar 2026 16:43:37 +0800
Message-ID: <20260320084351.2461060-6-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.959.g497ff81fa9-goog
In-Reply-To: <20260320084351.2461060-1-wenst@chromium.org>
References: <20260320084351.2461060-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_014411_595063_2651E00F 
X-CRM114-Status: GOOD (  11.19  )
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

The ChromeOS Embedded Controller exposes two regulators to the system in
the MT8192 Asurada design. Both these regulators also have power inputs.

Add supplies for these two regulators.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
index 318903b112a3..f4c8c3aa7a57 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
@@ -1535,6 +1535,7 @@ mt6360_ldo3_reg: regulator@0 {
 			reg = <0>;
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <3300000>;
+			vin-supply = <&pp4200_g>;
 		};
 
 		mt6360_ldo5_reg: regulator@1 {
@@ -1542,6 +1543,7 @@ mt6360_ldo5_reg: regulator@1 {
 			reg = <1>;
 			regulator-min-microvolt = <3300000>;
 			regulator-max-microvolt = <3300000>;
+			vin-supply = <&pp4200_g>;
 		};
 
 		typec {
-- 
2.53.0.959.g497ff81fa9-goog


