Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98A2BCCFA06
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 08:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H26VIwt+agnnRoIUvWCQXs/2JOF56AwXUHjfpfr4mpA=; b=gBZETHcsS/qJlkPUW3wwWMwpkc
	GxvIRBozFcYGNZYAS3Q3HNXDebZltUbek+8PP8buyJEVAkcvs7+CunWyWy2D5PIDU+23LUvpEm2a3
	V5Xg2FDsv5hKHtaE8is+e64dFB3+cmjeVNYwk4O4uvBBaFUii7R7CmlY7+aRpUs4HYFqkmNUTQjIs
	QlDsspopMdMPBs8ma2xBNRDw2QLnHH3GqE0W/I5oAerTEtfscOLgxDlQZds7uJwVxpQOulblr2lsp
	xjS0xwCFLxHhYMfnY1X1UvQr5GUQHJ594uI9b8BWtm5fJDkap8bbnMt9/LBja4KTAbHvC9izBHGLH
	rZ0DLAWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFpX8-00000009PCs-0mht;
	Mon, 03 Nov 2025 08:03:22 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFpX5-00000009PBb-1HOZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 08:03:20 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-429c19b5de4so2110954f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Nov 2025 00:03:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762156997; x=1762761797; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H26VIwt+agnnRoIUvWCQXs/2JOF56AwXUHjfpfr4mpA=;
        b=yUCvF5/H9P3G+XPTVpTZwBMr1JVXzh4nrRtXysVNYQpYnkUCrL8c3smEyANcfIuVM7
         cpVfD6aRPlA5G/WRXdgBb2GrXILrofJZa8t4rCB4QNOdHAjIAtClQwQlQ4wsotbjPNuq
         nt9INvsnI/wnKLzBfhWkmc7hMNapA5hRED8wKrbWOyOlzQRKAikBoZ+qmuB265RSO6wM
         A/gmPV7LpFJrAeizzyhMwgOh+0tnIVNw092XVU37xc2n/tM+eGgtSpPxyB3+Cc6STdBG
         VPxgSxLBOTb1Dks7z0I5/anGwaVNCXwLN3DI0ZJ4PNyXTCLVlXPX4S9CUPeyhTtv3I7f
         CD6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762156997; x=1762761797;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H26VIwt+agnnRoIUvWCQXs/2JOF56AwXUHjfpfr4mpA=;
        b=fMt7JCcybNbGwJaHcQelnHa2w9RVowHacifzcBxhetd9vIDoj1fyCyG0WfnDWpfYr9
         oj9EoskmHq5696vK9hOa018Ycn3i/5/K9aCI/8eBs1Q/+Iw4RPLPbSEb/hIh7479peRr
         IobiZu5V5hfyi6uqluloiQPdBgh1lEtsbCvLF9MK2Kg5UxxU3Mt2QPlCymGTzpxZ74mK
         TG21bwynDaS+8Bt7ALCaKi9EUS6nfOyV9CfkhhghWrK0ZsnHr4ALp9CsVFMdkbXofmKB
         jIWQI1hx2qsXLPKvQnZ7wTc5Ne7heVYu0P36glR/0H94oes9bWwewnqmXu9hv7n40cNE
         ae7Q==
X-Gm-Message-State: AOJu0YyA6+ok3Xbvw3F3vsADRedgEaABAUXdqyyDjXfdDKdOasvJNbvT
	pYnooceTj2MBu+5EzV4W18rEDgVYEKK8BmMsP2SY4dB+EhXZOfPT18OIxKbFi4o2zbg=
X-Gm-Gg: ASbGncvgprf2I6EBE/1cMVL04XRnxlqhQWcb+cviXZlHkdZMWD4cQ4EXbGWIaL7PyR9
	4DBxwmAdW4EJCAqWBbX0DZJpNqs2Uyi5TppBu4pH98bcri5y9MaYo4j7xLFR9Y9NGQhwP9bcrde
	/MWVyxaKKOM4QXWPlZLS089XjSDM6n72/+xyA8dtnUdYoMEvZZOueaP+wP1w1kAiM/Oh1/IBkd4
	sIy4zjKnBBBkYFIENSYQi24bMC2b0NP7i3ew8ue7o61+9cOTcUrS1DqF+NY3DqmdECTgZlGT03F
	G2/GhH4w8Vw5X0K5Z1CiuiiYODrnewL6z3zeaJQXuQJ6UcZ8Z+hZ9UqghM4TlKF4CXXYNJqjmWh
	xoTjn6r2ZtmQNe4GETxgmaNmLLvbtIr/gRJ3Bjdd5oJi8wNh9K6b676ZkB5m1/dd/W0jT2y5jOu
	sDEcDOJ7k1imKZ026VJosdG3O5YGJtaJI=
X-Google-Smtp-Source: AGHT+IGNz9UjeIUIyTmrdpy1PxW7eeOvbLMlDXLQPjJMq+zpapydUSIPBZjaS+Vh5y+ecN3Jkbp6Fw==
X-Received: by 2002:a05:6000:2501:b0:429:ca7f:8d72 with SMTP id ffacd0b85a97d-429ca7f903emr4511698f8f.23.1762156997401;
        Mon, 03 Nov 2025 00:03:17 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([145.224.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4773c4ac5d6sm142336215e9.8.2025.11.03.00.03.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 00:03:17 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 03 Nov 2025 08:03:11 +0000
Subject: [PATCH 2/2] arm64: dts: exynos: gs101: remove syscon compatible
 from pmu node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251103-remove-pmu-syscon-compat-v1-2-f2cb7f9ade6f@linaro.org>
References: <20251103-remove-pmu-syscon-compat-v1-0-f2cb7f9ade6f@linaro.org>
In-Reply-To: <20251103-remove-pmu-syscon-compat-v1-0-f2cb7f9ade6f@linaro.org>
To: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dan.carpenter@linaro.org, kernel-team@android.com, willmcvicker@google.com, 
 dan.carpenter@linaro.org, arnd@arndb.de, robh@kernel.org, 
 Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1645;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=UGPgjULdS+we3HJqc3I3soms/UG6+af7wQFeI8hNCdo=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBpCGHBKP/enJRrOYHc08VISfExyYfUCOIHP/hNH
 NbGGlSpBV6JAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaQhhwQAKCRDO6LjWAjRy
 uiiWD/97FQHrIvR7Ad+ObGfq9pO2VhDQDunpWCIekHI474m6k3nUj2ags+XEydrybbUAlBAJS5S
 si656ToMn2SK+oYw+BO2niz2Pnh58THEqnm5FlS9Q1Fw0RJgiyFaPhfWKR0dR6MTPrso9RSjEEc
 wx+vGME5loVJgJHMvBwdrtyy/L6m7g7TV4OWB8DBuExigkqdQLacipDGXbONDP/j5mMrEDQ2Vdo
 Ga30F3f/pW5rr5mVrtVHEjzV4+Z1UVsfJw5L4qUeyZY7/Mh0HAMQ1sh0jixf8UUkUTrQhlOyv4u
 Z4Lq8D5GirrHGhFoNmC/X1GlxGSlhc1ltUzAyyMhQ7rolomG4gsBqPY5XwwOLcN6sokE184lhJT
 i/lw0r6FicCx76Sh2r0Kno9sFUpPl7pibEXgKfeSCT76z3wnN685iKmTZvdbUI/LRFzxITlhtXe
 2vMgFIbxfimbqKqCI1F53ty/eBHVvbqsJ9YZbDplSLYkFOXXzmztRZ5HG9rg6y6HYDCMMUWi9mo
 UPmWmJT9SbbjnVgz1L0S+rd2mExb8FEZZ4opckU9JwoX36t+3qjTkxLcrXpln64RGdoGpBnRJpk
 6UAIy+QaOQt91LDA3BGDxPC1+yu3UKgv5FjICgKUkKCPNo/bun1F5f2T7XLSD0s4Fkg57+Qz4eY
 GbB0Tw4cdgP5DSg==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_000319_366506_EB62FB9C 
X-CRM114-Status: GOOD (  14.61  )
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

Since commit ba5095ebbc7a ("mfd: syscon: Allow syscon nodes without a
"syscon" compatible") it is possible to register a regmap without the
syscon compatible in the node.

As mentioned in that commit, it's not correct to claim we are compatible
with syscon, as a MMIO regmap created by syscon won't work. Removing the
syscon compatible means syscon driver won't ever create a mmio regmap.

Note this isn't usually an issue today as exynos-pmu runs at an early
initcall so the custom regmap will have been registered first. However
changes proposed in [1] will bring -EPROBE_DEFER support to syscon allowing
this mechanism to be more robust, especially in highly modularized systems.

Technically this is a ABI break but no other platforms are affected.

Link: https://lore.kernel.org/lkml/aQdHmrchkmOr34r3@stanley.mountain/ [1]
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index d06d1d05f36408137a8acd98e43d48ea7d4f4292..e1a7d33fd4a369f7b352b81d2070beb62a0ced16 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -1705,7 +1705,7 @@ sysreg_apm: syscon@17420000 {
 		};
 
 		pmu_system_controller: system-controller@17460000 {
-			compatible = "google,gs101-pmu", "syscon";
+			compatible = "google,gs101-pmu";
 			reg = <0x17460000 0x10000>;
 			google,pmu-intr-gen-syscon = <&pmu_intr_gen>;
 

-- 
2.51.1.930.gacf6e81ea2-goog


