Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A665DC3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 13:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3P/6sXdHxvAwZQAHntU3mNeria1ZXDx/pMQJAoXfL1Y=; b=2fJBQEBo8yK5UZuGZGhLacCVEd
	UjNm8gSaDxet8D88sCE38LMTdS09ZQIQl3LUxnZnh7PUJ+DmRl/G09VlUaVOkSEaUa1MHkD83TpkM
	fguPWoMfbrAR10M7ZtFAh4yhslI2DKRi90eT7j3GRje0NVU3Cc501Y15VK6z/X/5WiXiIgX0rZLsa
	7tt+xW1c56twqu5SrQokgB5aYLETtey8my+g7XeEb//B0nT441CCAHwFNKnnP5SQK/+gwqy7+CvzY
	UvfLsVprVx29K54K703S1fe6mhrv690AM0DS+zORXzaA5WGmO4NP02gXvRY4HWGmuf0CuE2B37Akz
	vjmcG/wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH10y-00000009NHM-2JNE;
	Mon, 19 May 2025 13:58:48 +0000
Received: from mail-wm1-f52.google.com ([209.85.128.52])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH0mt-00000009JoY-130J;
	Mon, 19 May 2025 13:44:16 +0000
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-442f9043f56so23330465e9.0;
        Mon, 19 May 2025 06:44:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747662254; x=1748267054;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3P/6sXdHxvAwZQAHntU3mNeria1ZXDx/pMQJAoXfL1Y=;
        b=KEuRXkhAJUDPlPtHvGtLScwCTAW02BWSxqfVifUjir+wwU1YSkYx98uiN+qXSOxhho
         jG3boiCyDe1QnvGu+6amTaFpFhDlmZtrLaJfXXsHn3GcAgEUQHoHqid8OpCYUdn4fjX1
         uOZMMdkntfQ1nJTb05AWCuJuz/nbK/vvQ0wUQNBq+0ngiefSS02+uUkqrQ/M4RCYuPJH
         Cigmax5Pn3i6UEcmQEAuvkaxaRO313rFzQpdZiOuRbzsRdXkmlJhFU99n7UcSPCnwkb/
         luPhWsipGsWZbLGq5Xa3QciKHbxGKbfr9zYaHdY7kQoTUeadEyXTWtFayMd30pcXukdE
         q57w==
X-Forwarded-Encrypted: i=1; AJvYcCWuZGoUN3CJk6+h1i2JjGOEd4TYMnsoKYd02e2uQai6Fvd1dkVCSP6+NyY5Gz98CHn8tUp5G72w8yalRBLzR07f@lists.infradead.org, AJvYcCXtCBY/OHT/1JuudCxpDGQUaHOvaBy62pkr1+yYsJPmB46738M+NL8NK93Asl6jqz9Ne6jd3K0MXqlwrJdwjuQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YxH1Q4IbnKpAtQSfw03FqNYEMM5LEWf7lNDUcJXay3gSoIqhr4A
	RRAwa7cg+l4OL0vVaKxaU0TAt6OvAeIfaEezuLF406kGBuJUIbLDsBcz
X-Gm-Gg: ASbGncti0vAtt7i8kLQ3LPyw2tLN+nvZscA9YkdoMpbsuHpmzVKSahic2FjWAf8jO18
	bKYd1NfYVy7G4jjndwGU4FYw/2kNQQJ2u3GLuTzPnqhcCsh0gRsS0InXcX++Om1Ayut2qyAg6rd
	9rf7h9WDiPQV3Fx4/cADqAUtc2Ln5I3H8WDasmhgUTMz441Dlw4s2pt4FTEfCIGCHt1OahSajU0
	i9t9AQNNqpNjSbe4RvT6iIllSvmb5wm7aXjY9FOxSjp3fDdeYjY9lALqWsNwdpRuNeXCZ/eJUXk
	UuhYyqBryvdgaVBLNQaOapHtz1fQSFzE5QB4vyYIS/4cP7+KrBf7j4Dptxu1w7aoeKwo3oXZbej
	j/wdoRCicKA==
X-Google-Smtp-Source: AGHT+IED7kzUlsknohwGAlzr7xKPhQnubsTHrLBV9TQD7zLZAZYPSMl1+k3sZJ6J83oZcqAr5dxyHw==
X-Received: by 2002:a05:600c:1553:b0:43d:17f1:2640 with SMTP id 5b1f17b1804b1-442fd665728mr107456505e9.26.1747662253514;
        Mon, 19 May 2025 06:44:13 -0700 (PDT)
Received: from [10.42.0.1] (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f8ab839esm171263005e9.17.2025.05.19.06.44.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 06:44:13 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Mon, 19 May 2025 15:43:41 +0200
Subject: [PATCH v4 09/10] arm64: dts: rockchip: add pd_npu label for RK3588
 power domains
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-6-10-rocket-v4-9-d6dff6b4c0ae@tomeuvizoso.net>
References: <20250519-6-10-rocket-v4-0-d6dff6b4c0ae@tomeuvizoso.net>
In-Reply-To: <20250519-6-10-rocket-v4-0-d6dff6b4c0ae@tomeuvizoso.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
 Tomeu Vizoso <tomeu@tomeuvizoso.net>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_064415_305351_9DC93564 
X-CRM114-Status: GOOD (  13.71  )
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

From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

The NPU of the RK3588 has an external supply. This supply also affects
the power domain of the NPU, not just the NPU device nodes themselves.
Since correctly modelled boards will want the power domain to be aware
of the regulator so that it doesn't always have to be on, add a label to
the NPU power domain node so board files can reference it.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index f5e58851047e80b23f9ff3244692ad868ddc1ff6..3e5199355a12f5c9ed8b6aea1dd95dcf8cbf1846 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -837,7 +837,7 @@ power: power-controller {
 			status = "okay";
 
 			/* These power domains are grouped by VD_NPU */
-			power-domain@RK3588_PD_NPU {
+			pd_npu: power-domain@RK3588_PD_NPU {
 				reg = <RK3588_PD_NPU>;
 				#power-domain-cells = <0>;
 				#address-cells = <1>;

-- 
2.49.0


