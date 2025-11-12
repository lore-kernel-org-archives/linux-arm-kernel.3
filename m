Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5223ACD13D3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 08:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZHjf7jIZnxtsxZp2emdUV+gnCb68DhjnRQYjjOEpq+E=; b=hck+vcaNKspVfHyT2NwQzGxxMP
	bzwttd8b5Nm/sI+NvqOruiE2ysbXMOvNiFEQK1DeailB6pGhb9DFn/Fur7P0NPjJ7kFTglexZ+zVR
	8gz6bbKClX3pwj+aW/CxqPc2Zi64AJn8sTushPeZXrplh1fCL1iqBeRcrzztsqc36wMnlRHj/DebM
	4XSRWiuVunmwJIQUvP4vTs/pL5NzouXmYbMNkGz7u7eSjnWyt/JqMjYornFp6lqvzASoOTBqaVVso
	ittsLWrCZIDrwtNs6nOS+3zpaeHGg5gnMEIg4qUqqRA4fcdlnreqN4ibpE+d27UoMFz42/4XZpPCK
	f185MTvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ6EF-00000008LJi-3GlO;
	Wed, 12 Nov 2025 08:29:23 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ6EA-00000008LGS-18oS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 08:29:19 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-47112edf9f7so2808225e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 00:29:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762936156; x=1763540956; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZHjf7jIZnxtsxZp2emdUV+gnCb68DhjnRQYjjOEpq+E=;
        b=TOl637QKRpWdtMeS0SteFMlkVZsJVWpY+mdeWTYrn/Gz1wqbqt87KqOY6bx84yS57h
         oskbbWoUYdopqbPyzFzzec2efW9jN8J55n4cFGwz/L2zgqvQESgDby29hmCCn2xiOSIh
         TDz16cP+55yfJP+D48bS8XqIM/UAjmH2R83csakN83JXnyImhTgMis/V0PlGit2f1lro
         1staSe7oQEKdsYcGF3m8pr+hoyidW6uaEsGZn//6ncv9AX1ayy0l3PKDoD/dbY8QLZpP
         jksy+BFLbMOFkHacoDw9ITuyVdWMa3Q7L2y8xrKArYIl7cN4yWQKCtsninH0j4FB4NFG
         9VYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762936156; x=1763540956;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZHjf7jIZnxtsxZp2emdUV+gnCb68DhjnRQYjjOEpq+E=;
        b=QF3KmniMI3mI+IPIbYjqT+/bP8BWH6ZE5maoTD13nW9dQX9EwzPf1U6SpsXwFK+Ceu
         Nuw0/vuHDiGFGgb1Io+81hcNxSGTmwtdkwM36U+1B2TV+sAUmfFGC7ZTVDaQyBHgNEPL
         5i72vjjiV/3sVhrobT8B71C8fZjIQi88yG8vSfxmdsatW7oOO9JjTSwm+tPuAoBFW/nT
         sTIrISwhbFGZBL8euMMyUtjGAJ1nZMokdjcvSVHDvgYKmmM5MolA83xQDYv6PMeRVpZ4
         RHBIUvAVfw3Gbo1TIAFrhlDWbxRs0l6QRKxpl9LIoPa5LDe72jgQD5OPrimBsOx6OSC8
         0Ahw==
X-Forwarded-Encrypted: i=1; AJvYcCVfpvM/t7PcbG7SAGXGDrlfjiXJ5K7iO9Ibg/9/FWkdhJxNWuXhNUQm47GyVmzt1vc/8TVshKFgYdF9GvHvMwoc@lists.infradead.org
X-Gm-Message-State: AOJu0YzccR8Cjzm+ZCQDyOKiux2Z0qntwGM/jV+aMKzjv055kWaYZtWj
	wMYKDCcQ1aeVTcHPQF2qnWG698TABkg0fTrT2MI7t6YPzlwQ0ngjSl7jvySbwIIdPqw=
X-Gm-Gg: ASbGnctyzBZkE9fcmkSmRO6hyQCRhXrbq4mjQznPuz8uC/4wxchQfq0mRWgO8cnkXrV
	kzM8q87wU9+GNUOLfe8olPCuor19lhtDlJzvsDEy438B4HBCIq9qbKbyWCv5GCfkU6RPCNbeB6L
	Q3+/icbYOGl6iA6U9I+9zF00FX7Rwvoof9xYiUR+hXfVRejb7glueoAm/2dA4mIEegvwR5KqFoV
	ruxCztmWMUCak8YHat49mbrYMLJuvmDMtany3wdI7n/eHXc3kfzgbs6ofVq6AJTj3sHK0HS0loM
	koQkKiP8wAX0rKKFFEUiPCETG0OimmfiOHctIeShsnHIJJlZuVOEZyMw1YM/P8SDHNCrVxNZBA3
	/SVNVug777mPxeP+gZRn3Kx4eIuNvQLxwEXejPZYH6VX/0ZPKVQK3dGHAhpqWUU1dTzribik2F/
	TJlGZs2d+Rw2bIKyb3pSHLSaGD8vTkZFWDe2Fh1POoE8YD6JEYOF6NuEdECZJioK9IUpg=
X-Google-Smtp-Source: AGHT+IHMFuV13oHLomlsN36IUFndxfrhBYzdbMd7xr9GK3XGTbsPAlzk7x/twn8UPGjcB0CfYJpACQ==
X-Received: by 2002:a05:600c:c493:b0:475:dd9a:f786 with SMTP id 5b1f17b1804b1-477870be153mr16131355e9.40.1762936156234;
        Wed, 12 Nov 2025 00:29:16 -0800 (PST)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac677ab75sm31571428f8f.35.2025.11.12.00.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 00:29:15 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Wed, 12 Nov 2025 08:29:07 +0000
Subject: [PATCH v2 3/5] arm64: dts: exynos: gs101: add OTP node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-gs101-otp-v2-3-bff2eb020c95@linaro.org>
References: <20251112-gs101-otp-v2-0-bff2eb020c95@linaro.org>
In-Reply-To: <20251112-gs101-otp-v2-0-bff2eb020c95@linaro.org>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: semen.protsenko@linaro.org, willmcvicker@google.com, 
 kernel-team@android.com, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762936153; l=965;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=/pSl/oshIgGZZ5UojmE7NZi7LX3/HS9nWv/b7bm1yIQ=;
 b=R1Z+JLiXPWLMgVafAqh+YxTkJcvlF+ccSnLeqflAeZ3Ttx/LZtnpqjWgaPkjDW7swQcPDVzoX
 +LgNAN/4E3WDOaOJv39p6v/i5tN2Ua4VMj7GcXteu9NW5JKmTxD3K2f
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_002918_340190_5289806D 
X-CRM114-Status: UNSURE (   8.78  )
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
2.51.2.1041.gc1ab5b90ca-goog


