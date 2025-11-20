Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52A1BCF8846
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 11:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A/NH+ihGTI+pHubvmXFI57IU6F78/DwM75gJfoYXgOw=; b=b47zTYu+W2v6LF94FZHLn43nfD
	xw1D+X+HpIgGm4M4jpVNWXS8jdTS/uK14BiHfzD15tLr14atUQ4LFagmFJeoFU9AOZZ/iJOxWAJTn
	a5XMSe0BA+XrnYhRfYuemzKSkjXYb+IX6nXdNY81W8jdki0VxAf3jvIQO75obzNC4kVZhqx+7XAwe
	h5v8qvdX2KPohlU47RivyWHE4RlimIp/szZK1/7FjcIzzmgSEPgweaaKJ2l6KxQ3pBN4hxpTVoUuX
	rvi1PSdmhCe7ChGUgBVdX+686bpmAGmiPPwuXN7QiKtNqA/UmqxTwqyeZS8q14hfLN3gitua9039s
	K6o2+Eng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM2rR-00000006aGc-2yG3;
	Thu, 20 Nov 2025 11:30:01 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM2rF-00000006a8a-2Y2C
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 11:29:50 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-429c48e05aeso475079f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Nov 2025 03:29:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763638188; x=1764242988; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A/NH+ihGTI+pHubvmXFI57IU6F78/DwM75gJfoYXgOw=;
        b=IfQaj2haznt0zcY87bPNnWXL/XVm/1fDhMc8bAVD41RTaBojQY/DNpLGBT7dh2064j
         SedzjpBvmqOxYZybqi8FbI2vmdHfIDAenYEkiajYg15chuj/gwsfNmiCLCai4hdpZDo8
         0BqmAYmo8u9m4rVuwzPdqVRezJjr7fx41kTZd/+kJW4t9EIMOgG7LE4Kf7V554S1y5wj
         AGffJBG95UFXMJ/+J4hbTt+7PZEokV/xJSzzWuNfLQeMoqSMFnSC+Btnfau/yoVPMOYx
         vBVeGYfPPJYjftQQCbdROE9KLFONYk0FDi58aV8TNMxDAYA0nopZSfOjMHPh7Ei+xNMX
         hz+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763638188; x=1764242988;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=A/NH+ihGTI+pHubvmXFI57IU6F78/DwM75gJfoYXgOw=;
        b=Pf9dFaRwyLqg4O5pbZDkIFafY9Tf9BDoj1bEE4xRg86a+kE8wod7ygIgPtQVEnAOOY
         mUL79MvpLCOYaa7yNZq8gB/8fthE/cQba10eaLuKcx2cyXCGZzjOJQxJs6VVl4yytvAX
         3FNyu0t9NULzoaLwL1DNA4lgHmw78PfPLWeIVRwTnwsQ0IYUCxsm6H8xfFwrDt7fEHbN
         khOdz9tZcBRq44L2LYw3L7SqCIc/0mdPxLr7sHTaOHGHfk6gZw34JsXTfUaEghDC/j1x
         1riBU88VUwFxeAdPIu5fp/6cDw7KD5wG4I6j/v/YHXPVmKSjxfF06hrr86T4/v1oqitV
         33Ww==
X-Forwarded-Encrypted: i=1; AJvYcCVgBTTEEdV7d/mrZ+WInTd1/onPb8LBn3mN0dCqJUpY8RVT/QFqob6HCZEbIzhMz/YMus5A0iAd0aVU/Yjbo4is@lists.infradead.org
X-Gm-Message-State: AOJu0YzExCuY014EXtt24LqeuvYMEfAB8QBvIbtSDuaGRr4t3g2VrxG0
	Nq+RtNAbDMZ9WxJdpWqt8RCsmKVGye9lb7fYWnYVl6e59Jx7N8UpktQ8f7CRidwnxoQ=
X-Gm-Gg: ASbGncvK5GgseXvm0nXvnMluZRw5O3E5qr187vvuR6jVue0eishtpmK8bkqf+y8pyt8
	Wt6mJQiMYDeHq14++jPWjIsPRJQBc6yMogbYT3S66IqJG/4oZchZFF0XZBWsrT/ac7WjMWY7NTI
	T9no2EWIir/D11NwAU+r7Wwfaida34RTS1ZwVNVcCM1LyC585kcOrMdNQ0oXEnZH5qdV9gx6mth
	IAhnLzXPs0dXXGGwzeIAM+TAPfvm6BGItMorDj9e82QFsfD68ZQNrMNlbb7pyXr+kgImFn02+47
	rkFI3IRnhiQ9RSPPZc2nI31a62oU6XcFP8GFc6a2u9F8xTvhEKPqXY88T8gnk4zY4surM0hy5TR
	dBvdpQfYdrz2jWszLsITnIeN2xFxaNfCfEJSBJBjJYMMMDZ1nuFEpjXLrXgbrcrspQnhtG7otvh
	GjIvkXOEbyt2ZSP7TUl7t4woRk0cFpofL7x27plPQpv9zEB9nvGPQnb/m1YOwsk0H6Kd0=
X-Google-Smtp-Source: AGHT+IH8k/MswTwGLqwMNfZfEAxN7h+lqxYRkrxtUElx9mhpAEHdT/2K3XzbTjmmMw+BEdrQo+kzoQ==
X-Received: by 2002:a5d:45cd:0:b0:429:c8f6:5875 with SMTP id ffacd0b85a97d-42cba767c05mr2038488f8f.20.1763638185369;
        Thu, 20 Nov 2025 03:29:45 -0800 (PST)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7f34fd1sm4961040f8f.11.2025.11.20.03.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 03:29:44 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Thu, 20 Nov 2025 11:29:40 +0000
Subject: [PATCH v3 6/6] arm64: dts: exynos: gs101: add OTP node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251120-gs101-chipid-v3-6-1aeaa8b7fe35@linaro.org>
References: <20251120-gs101-chipid-v3-0-1aeaa8b7fe35@linaro.org>
In-Reply-To: <20251120-gs101-chipid-v3-0-1aeaa8b7fe35@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Srinivas Kandagatla <srini@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, semen.protsenko@linaro.org, 
 willmcvicker@google.com, kernel-team@android.com, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763638176; l=968;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=bpikWqcBMsiIMl/jbWq2QmBbah7xAa4FAfmzSq15MIU=;
 b=oujFnjxZs2wibNVC2xxzFlbBl/q8pivW+chJMAutHAp5GASDYX9ux7hOfoiFw5KOgRgKW8M/n
 DHqqDaSpRwBBr9VAPGAejPUE/N7kvAgZxqQMLNxJPWpBv35J5h4lmpA
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_032949_660052_018123F7 
X-CRM114-Status: UNSURE (   8.69  )
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

Add the OTP controller node.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index d06d1d05f36408137a8acd98e43d48ea7d4f4292..4be983d4e291b3afe3530fbea0163f70c1a74671 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -571,6 +571,13 @@ soc: soc@0 {
 		#size-cells = <1>;
 		ranges = <0x0 0x0 0x0 0x40000000>;
 
+		efuse@10000000 {
+			compatible = "google,gs101-otp";
+			reg = <0x10000000 0xf084>;
+			clocks = <&cmu_misc CLK_GOUT_MISC_OTP_CON_TOP_PCLK>;
+			interrupts = <GIC_SPI 752 IRQ_TYPE_LEVEL_HIGH 0>;
+		};
+
 		cmu_misc: clock-controller@10010000 {
 			compatible = "google,gs101-cmu-misc";
 			reg = <0x10010000 0x10000>;

-- 
2.52.0.rc1.455.g30608eb744-goog


