Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CC21C3ABA4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 06:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1J1y0j9xusCEdQGMutlBT7sXepSuuDXERtpBDgORlLg=; b=C1zHgj3vskDf29LlephKzdR8l1
	P+qOKlPSLYilnu0Ka9QvEcQCcCkIXCB4T/lLXvP4mxeAYxLzgcyxcm/6cyG5P0L8l1AfeYu8AUsFK
	U1DzR+fyvHM/EGb8dkS1PYjg98m6FRB1312qRodKOFf0JGGLu/UTz+oSn4Xyp0KyX0p+suuCNoPtX
	WGGwhDKebd6/LZtPbtIHDCm1+MINLpdbgHhYpzBj3aj6scZXe3+VoqaCho4GcR4Q+dp7d6xlvg0LL
	fuvuupiR+uYCRWH96h3tX4mI+Km35+f0Z0pgWWHkih4QqZBam4hojkVogcwc44MYv6yUnOGbu4h1Z
	89bsfx5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9eSb-00000008ZkE-0wUu;
	Tue, 29 Apr 2025 06:28:53 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9eJo-00000008XR5-1LFz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 06:19:51 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-39bf44be22fso3745321f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 23:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745907586; x=1746512386; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1J1y0j9xusCEdQGMutlBT7sXepSuuDXERtpBDgORlLg=;
        b=OHWDBBPIrp7spxWMsKJBqZXWNk95/m7dcmjpF5FVq4tdqtJ8Bng78HOJzFDY8CYjrU
         4MpsuocFv090Qd1SZyufkhd+iU0whyGDuRQFEFJJYeWsApo4H7F1lnMvzeTbIuI1yHGy
         FShFBvwoJ/RZF0Tt2Z5eyRix/ZdOvs5bTkxEywPwwFGb21wr2KoUVlyZ/w16MM9FjeGD
         HVVBCYDh1RvPpDQgATlMdTvpeDxavaP/jg80Zwlm4IdL3lc7fIdOvgAH8d3tTJJEMLg7
         +WpJMetJQR8bwNQKd+7O7ro/RF97SVGmII2+R5bg41CGaHTHQy6MHBmvLOJRW29iLaHS
         iAAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745907586; x=1746512386;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1J1y0j9xusCEdQGMutlBT7sXepSuuDXERtpBDgORlLg=;
        b=tjEz5DNW0dIoBt1p2NjDCQyhPG547QiGj9KdMAyrT7ExVVwE72eGai+tMQL/G1orHN
         Ut0zXkXzAlNYg1Dwo73EBKQmpxFxmLRfGycl9D43+UnlrxwfI/dB/7EFSCqRgS+OzWOZ
         iPHDyxRe3s7PRh1WogfS2uDat2YCGw9w0EHj2EMNnJkrTJSXowusG85jpLjwPY5FPcd3
         QNgWbMut/nRSss4fX5Fu7Bup+WjBHnb3GrHJa1GnZjpNhDxNrtnbU2pqwsduKriOX+Qj
         fSJ/iFRqn9Ofz0X7UtuUdDJ9ez8/1lbELfqlTKRNzrPWCw+20726VMFthMy3eWw/Ny11
         /1kA==
X-Forwarded-Encrypted: i=1; AJvYcCW8uUvOakBp37L4r28Lr9u7Nq1fsU4HMLIJctzqHRzGpr7lkVR1JIuosZ0Ub/hM2Bix5Zby1RT27iXKKGk8fZld@lists.infradead.org
X-Gm-Message-State: AOJu0YzEjyWnYjhFKFx006EzV0PEJ25Izd9M2gDgbO8gH3eHJmKAE0jb
	lrRPOeQtxlGmwsQzd4fhQIpjt3ub0SHbjzpBilgS3ceo3t5Jhj+gv2vyXikLuEM=
X-Gm-Gg: ASbGnctBFxAtFRkftUklEuUWOSPwsIlXBwmwho1C2GRqprzzb+29XyV4B8MJ3V6Qb+6
	Z5RfBNKOEUWRrOmn2tY7k2Qflwy/4TzqfXb2iKmMKfszg3FTNYkJN2OYbMjc7/lWrPF+ujkyq40
	KMdkC8I4Io+tQe5Hxx1Gjd6buATjxXk+KrwknJ+XJgKDGF8FyiXyBGbvr20Ihgs5J59MlwVJyhV
	vNlZMVF67FjLTA9KeOLdhJwTneGTiYvUzGpMIcYULjnMBrzOBOe8DVhe2MJ7eZF62nwMFm6GO2C
	v5AVMlV5r1wK6aZ9zIs/gl0+hjJvcLZ+oZapRTxxbx/L7kLYm587Mvt5ZKPx9Y+HAkGSKKs=
X-Google-Smtp-Source: AGHT+IGZHANJgUSXXTUCKNgmTaHbkPL5ZSTXXFAUgVGHprMJ5PNq0SItX2F9a/mxdybpRLb3hlTLbg==
X-Received: by 2002:a05:6000:3113:b0:3a0:7d64:502 with SMTP id ffacd0b85a97d-3a08ad284a8mr867182f8f.11.1745907586693;
        Mon, 28 Apr 2025 23:19:46 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([145.224.90.246])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073ca4e50sm13302616f8f.30.2025.04.28.23.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 23:19:46 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 29 Apr 2025 07:19:40 +0100
Subject: [PATCH v3 4/5] arm64: dts: exynos: gs101: add pmu-intr-gen syscon
 node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250429-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v3-4-1bcc44fb1d55@linaro.org>
References: <20250429-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v3-0-1bcc44fb1d55@linaro.org>
In-Reply-To: <20250429-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v3-0-1bcc44fb1d55@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 tudor.ambarus@linaro.org, andre.draszik@linaro.org, willmcvicker@google.com, 
 kernel-team@android.com, Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1422;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=IaWY7tcMqLqpKkGNb2+Er9XE4UoUasfxemcbzBXbz1c=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBoEG98E/mWar0gec4zKdLIOJk0f4CBzVOdq+8N8
 sKDMz+m6PKJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaBBvfAAKCRDO6LjWAjRy
 upepD/9CfAi9gMWNP+Tzfre8i3QEfVw9+FE3nB0W/WZ7KZYj1iNdvEHf1zYDmwuLAZdWrz0erun
 LflTXAUP/aTyszRv1AE+5KS4L/WZBVNvx1ngw4tfcAQmy7vMxpVc/w2C9HERcVJ4F6PT9BdIUgk
 ua4llNq65MYAfMA6xTrOZAGpyFNmHikjkpmcwSPZIhswbdk5qrSDIVdLddND7KX/vg0LKdeEaQV
 S7SlDfkv6c9DnYLfIxV+1mVo9qojm3XK9Hr8tcp5HP+9sew2f0bYqJNvSGB8gvlFcDihxkrzNd3
 bfKUPVug99MeoZEPWN5Kx5P13lis92TLHRRFRyJ/K0uJoWYM/H8ReaaGUfciXjAK3kuLdYE9jvK
 eI74QBlsO6KLLJ2eyoVnc+/OJc9fVrrNt3oH4qJ0Kdzjp4SHroLClpF4O10xFPhYkz7XYfB0xVx
 zYyfXTliI9XJQb36Ax7uDcGMY08WX/nzsP2H7oT/RSiabFTRNtZw4/7zF06F4LazOd12hBOdcHd
 /OG/uyPmOgsS5lcYHaJGCJ87VzPqts8bmsNg8yaOMLJosSNn65rnLN74441fyhJmyfFwE02bXZg
 cB4KS0C69MlZsp97sZ34ep9p87Ox5LMCA8RwHq3OJj1gbXvQOektMyKFNjzeaSFwQdgUsLakLCl
 z8cg1Oj6cSQ/W7g==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_231948_365341_26083B4D 
X-CRM114-Status: GOOD (  11.33  )
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

Add syscon node for the PMU Interrupt Generation registers.

Additionally update the exynos-pmu node to provide a phandle
to pmu-intr-gen syscon.

These registers are required for CPU hotplug to be functional.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Changes since v1:
* Model pmu-intr-gen as it's own syscon (Krzysztof)
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index 91cda7758020563b2c5b5768d8921e87b1f4231c..48c691fd0a3ae430b5d66b402610d23b72b144d7 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -1405,6 +1405,7 @@ sysreg_apm: syscon@174204e0 {
 		pmu_system_controller: system-controller@17460000 {
 			compatible = "google,gs101-pmu", "syscon";
 			reg = <0x17460000 0x10000>;
+			google,pmu-intr-gen-syscon = <&pmu_intr_gen>;
 
 			poweroff: syscon-poweroff {
 				compatible = "syscon-poweroff";
@@ -1434,6 +1435,11 @@ reboot-mode {
 			};
 		};
 
+		pmu_intr_gen: syscon@17470000 {
+			compatible = "google,gs101-pmu-intr-gen", "syscon";
+			reg = <0x17470000 0x10000>;
+		};
+
 		pinctrl_gpio_alive: pinctrl@174d0000 {
 			compatible = "google,gs101-pinctrl";
 			reg = <0x174d0000 0x00001000>;

-- 
2.49.0.901.g37484f566f-goog


