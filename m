Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B88D1E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 11:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vhMGmKlGGOtZ2SvpqF+i7oaaEFRcqd8HwZsDBdF9tV0=; b=1oQ87yH5wTNsSlhsAhbJorBX0y
	/aZQMudLCso8hF5b8vRTZLS4euZMspid54zd3/tFKTMutDcxXbBw1QUjc4r5de7wQlawdJj9KEAGb
	rjlS1SPK+qeH1DVjiKH3R/iTimP5nVJCU1ah23pzm0DQTVS1B2A5jnP7HX4eiNSqiEdcMIPjZ8jNN
	AwGbX9pBVyrMkI+1v9J3CP6UDjB7lV4tz2ofpPagFPouBfnPY+/6v6/IkEtusB9W95W83UGRjCPmv
	mIs9d8y0oFZq4Rmxw/yDJgyeqycDDRIpbGQvDW+Nd+DYO0trFexhwhQJWyC42xsc2hotlAKSxi7V0
	W0aB2rJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tObFf-00000004mlF-0oG5;
	Fri, 20 Dec 2024 11:33:03 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tObAn-00000004lgJ-27uw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 11:28:02 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5d0d32cd31aso2494711a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Dec 2024 03:28:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734694080; x=1735298880; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vhMGmKlGGOtZ2SvpqF+i7oaaEFRcqd8HwZsDBdF9tV0=;
        b=E7d2nFMesIr2tOIWMqEjRFONmLJ85WpPcV3zX38MCPBM9Hf3s21Lgrkh3X4ZFK7eZK
         Hu7jKaV4YwpXpc25F36CfZ1acOikhgu/GVyaF3ZF+VPvijBAENPORB8OLZy8bvCCTgYY
         J7tzRQJU5MXbFpOj/m2cJfG6dPiMYV6no9L6xN8FJmwr3QBVsf57cOCA8iFBHihLr1RK
         yppbuXXzJJoEEgbGhFPpqb8bdAWl0UGsu0+NYv3yWBjNehaCu9TGVFfULcbOEJuyBBt+
         2P5S8j9ghYMfZYCoAgV/4sw/91s2cVJgIiiKLkN+8ua1l9XyJCjERuQSwmfO+eOR/WjN
         PjnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734694080; x=1735298880;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vhMGmKlGGOtZ2SvpqF+i7oaaEFRcqd8HwZsDBdF9tV0=;
        b=Yaj2nCfBxfDd4v7BAlueP40t2ejyoNPviq3onL2bm9douknyFLwnXKEEVHzyaPN186
         RWmDZ1SoRsloo+5u6ZYTb8Ly78Dz+jDLFUtoIL4diN6mWSXDQ6onAF7/0mNx3WHzXRU6
         u4uIjKrsY9MBUFi3NHPklHZgHZb6iQJiKbSQ4uMGlZot1qiHDS79zST1r/KlSmL8smL9
         5+Tbdh+cFW3h1n+kmDo0WBPye7pu3zXnJvKqUAmGRdCeiT4XLAYBU5OEUnn2ZJlBNk6S
         MklaQy7V8gXycw0RyjHqWThhAq6VNzdurViyZquP6HT3NrRJS7PTLZxofVy+ncUpqiAU
         vtgA==
X-Forwarded-Encrypted: i=1; AJvYcCWPip4SIrjcvi+Pl+G9tHHY/1g4g5hOus59fLyTTbtjyPrb/7Fi+CNHbhF636Shq1ytakar7desIhwnf7VC0+/y@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5QNGUulfS5G/lMvf1pvI6ggZPMpIPG1Y/HsqQU9OMMgT5u6z0
	2bwEh1jLezokAElRvGvlV6DAHJzT5ME4CYGs7tm+XmqJvSzZFCkoLjM22bFcWG0=
X-Gm-Gg: ASbGncsQY2z9MCSfdYKs9KSee6Dbq84rBNiqwuJXRG4zvCjhBhQjvVJWSqMpssfRH4d
	9wz8njJ2df0QqheP6xBWiwvvZKGQzxVNP5hOiiKb39AWR4/oWE3RMEzVAoiqtqz3oFqmpDvi98o
	nKZV8CeqGT5zk1DDDMQkbwJv03e1kAH//B/OA8i1/77ifgztRW6UUyQ8IPnXemkUQzSfB0ZZEc/
	6aUdxOLwTTpJK172fwga/rwSFzOx2qCrvIUVNDWPnJPlpPrAPopzPZbiOyV40jImsLD5dprEuJD
	m1WWSGsvsPm/tXdL70lSvpQZB4h90Ijs9bqThSNo
X-Google-Smtp-Source: AGHT+IFU2H+Pw1Dmh9hoL+lth2FhsMr8S0vXuAclD0J3+yf3rw+Dc8UEEShqb5npXBaErUn+eaUhdA==
X-Received: by 2002:a05:6402:3206:b0:5d1:2377:5af3 with SMTP id 4fb4d7f45d1cf-5d81dd83b23mr5556412a12.5.1734694080230;
        Fri, 20 Dec 2024 03:28:00 -0800 (PST)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80701abd1sm1632634a12.76.2024.12.20.03.27.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 03:27:59 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 20 Dec 2024 11:27:26 +0000
Subject: [PATCH v2 3/3] arm64: dts: exynos: gs101-raven: add new board file
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241220-gs101-simplefb-v2-3-c10a8f9e490b@linaro.org>
References: <20241220-gs101-simplefb-v2-0-c10a8f9e490b@linaro.org>
In-Reply-To: <20241220-gs101-simplefb-v2-0-c10a8f9e490b@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_032801_588086_52A4162F 
X-CRM114-Status: GOOD (  13.44  )
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

Raven is Google's code name for Pixel 6 Pro. Similar to Pixel 6
(Oriole), this is also based around its Tensor gs101 SoC.

For now, the relevant difference here is the display resolution:
1440 x 3120 instead of 1080 x 2400.

Create a new board file to reflect this difference.

Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
Note: MAINTAINERS doesn't need updating, it covers this whole directory
---
 arch/arm64/boot/dts/exynos/google/Makefile         |  3 ++
 arch/arm64/boot/dts/exynos/google/gs101-raven.dtso | 33 ++++++++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/Makefile b/arch/arm64/boot/dts/exynos/google/Makefile
index 6e6b5319212a..bc6d600fda84 100644
--- a/arch/arm64/boot/dts/exynos/google/Makefile
+++ b/arch/arm64/boot/dts/exynos/google/Makefile
@@ -4,3 +4,6 @@ dtb-$(CONFIG_ARCH_EXYNOS) += gs101-pixel-generic.dtb
 
 gs101-oriole-dtbs := gs101-pixel-generic.dtb gs101-oriole.dtbo
 dtb-$(CONFIG_ARCH_EXYNOS) += gs101-oriole.dtb
+
+gs101-raven-dtbs := gs101-pixel-generic.dtb gs101-raven.dtbo
+dtb-$(CONFIG_ARCH_EXYNOS) += gs101-raven.dtb
diff --git a/arch/arm64/boot/dts/exynos/google/gs101-raven.dtso b/arch/arm64/boot/dts/exynos/google/gs101-raven.dtso
new file mode 100644
index 000000000000..577f52a4fdad
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/google/gs101-raven.dtso
@@ -0,0 +1,33 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Raven Device Tree
+ *
+ * Copyright 2021-2023 Google LLC
+ * Copyright 2023-2024 Linaro Ltd
+ */
+
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	model = "Raven";
+	compatible = "google,gs101-raven", "google,gs101-pixel", "google,gs101";
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <1>;
+
+		splash@fac00000 {
+			reg = <0x0 0xfac00000 (1440 * 3120 * 4)>;
+			status = "okay";
+		};
+	};
+};
+
+&framebuffer0 {
+	width = <1440>;
+	height = <3120>;
+	stride = <(1440 * 4)>;
+	format = "a8r8g8b8";
+	status = "okay";
+};

-- 
2.47.1.613.gc27f4b7a9f-goog


