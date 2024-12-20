Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB513E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 11:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cnPh/juyVOiTzWCImlW3ZTqxEo/ZPE8pe0CN7AE6LjQ=; b=fLQrf9UTwSraX/IND77QnyLwFr
	mTNuaNJk+OiCrS4V0F1A2fadUoFiINAJrPr7gVK27QY4YJVCMdUeJ2JYRALCLo6ZXAerB52eV16RO
	6FuvtticA6Xz0naPLB9b1e167Cog4XXdqADjHM0iFzPUc+AMLWtHi9Y9cFAAznsNVyWPhSttMsTtk
	SyzgGjVjXHJZncoBGrOVDHTbfY+cEaktTW8+R+/Kc/x8TQE2qqRc85PDUXkci7AccemyrXDpidcmX
	Li62DEQ31lPWvSki9gq5Z8JPbWtQnINwbhkOM6DLxtCki4lrpPE4z11sufNbB7b6JQDckr4T/dyYN
	eNpLFCKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOavk-00000004gHN-03Dw;
	Fri, 20 Dec 2024 11:12:28 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOaJR-00000004baz-00xn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 10:32:54 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-a9f1d76dab1so325083866b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Dec 2024 02:32:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734690771; x=1735295571; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cnPh/juyVOiTzWCImlW3ZTqxEo/ZPE8pe0CN7AE6LjQ=;
        b=mRfCiJOtnM4OXIEjfIFOzo0RlrJ3AALqsqJm5F+RX9kyaZEAO6yX9XNny+HS++QKjA
         wxMLNVdUkKK0lCuDT/qj62eof2t2TZTB86xH4psQksyVizF6WXmeabpPaaiA1bvQgscR
         6g1ZuA60bU9PYfZiowxKs/QwkcZxNLidujVHyz/f4P7KZKF+NwiKjQStzai/8rY6oRL3
         Tar9Y1tipZfckMppKExsqniKB6iWAiXoXDc18yx6bT3MU+IhneOUVrqemrbQeBAmTMxf
         uxA04tcY61PBALtSoCC5eFzg1SPasKmnH7P5q1cTheyW5/SgQxZtbTICEKvQoVAk/Qw4
         DRBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734690771; x=1735295571;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cnPh/juyVOiTzWCImlW3ZTqxEo/ZPE8pe0CN7AE6LjQ=;
        b=Uds65HPx1Ptp0/S9+v/CD60fXCmgk74O5adMaEJpW7c+FX2QpNV+gSx7ss8w83jZi1
         VWZ7WeatE0cgfanTlNSjLVPYq/VUcgMFUnECRvuycRXOWg1kirRthFcQ1dIayxsQJZEv
         fLLkeBCYUCqiazcunag61l0RIhabSti37qfoDyK+bNyMAOmKa5GJUJtFr9RhPfcyxug2
         vuqWIiZVx0slYrXyTFpZ2V5faE8xLYOgeoiRcB8YCTkRwm4UU8JjV0PeteEnDMexkj9m
         YDpsbCA9FmAVr1a11krrDX07BV0xDFcqDKAPUBhDdah9C8eSgymz6BLi8jy/E+i6EGC1
         gIug==
X-Forwarded-Encrypted: i=1; AJvYcCWB7UWfOLUpLrZZUOawPqXpXFpEi2prKg1rEo/35XmLoX7lqiNbmZs6DUifpFZaGa3pdqqxKi6GyQ0glsycHzHi@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4uYDzNtppI2uUk6/6w2v+A5QJ1cccCsWucOb9MrOMvyMvEyT0
	eCveys637DsiXSBmOLEFLzFn2Q8kkUYY6yeTyUm686AwOjeMrNBDJCt2wIjicQWAlRvfZqbhNoy
	x1bYcDA==
X-Gm-Gg: ASbGncuVTYWdpSXIaXK4S+/S1eYR729ispFfSYr8o2aBIoYFp+g0MzTsUBVAMINRXSZ
	srzhNb0zMWpfpqj5ZbaowICe/l9JgD+qxm6L3W7kmuDJv98kSt1G9/ChQdXGPGWn5nIaLjXtkO2
	AsqWGjYboX8/RyioBJF+kY3tVg+RIA/8Ql73Vx6HqfYiaKusZqa17rbIZvQ64nlGssdvrdXO1Nh
	kVgQBdG+pthDLbe/OjlyNh55BvqSn4inZXdp+FZ/qC++GxJ+RrTfkmOHNw5530dxS6Rwq5VZTyr
	pz4ZoVkfa6DfnZre9lOjp9bRI+RjpZRln+EiKt0P
X-Google-Smtp-Source: AGHT+IExwMGLFo9EP9y/Egh+BLh+KfOHOoPkz6X1qvfx7pdCFx5WJHmb12wq7ReFv0+A2rj/5cCZNQ==
X-Received: by 2002:a17:907:5c3:b0:aa6:8a1b:8b74 with SMTP id a640c23a62f3a-aac342179f3mr160475866b.53.1734690770668;
        Fri, 20 Dec 2024 02:32:50 -0800 (PST)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f06543asm161604566b.175.2024.12.20.02.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 02:32:50 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 20 Dec 2024 10:32:50 +0000
Subject: [PATCH v2] arm64: dts: exynos: gs101-oriole: configure
 simple-framebuffer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241220-gs101-simplefb-oriole-v2-1-df60e566932a@linaro.org>
X-B4-Tracking: v=1; b=H4sIANFHZWcC/x3MMQqAMAxA0atIZgNNVVCvIg5q0xpQKw2IIN7d4
 viG/x9QTsIKffFA4ktU4pFhywKWdToCo7hssMbWZKnDoGQIVfZzYz9jTBI3Rlf5yZFv5rprIbd
 nYi/3/x3G9/0A2QmCsGcAAAA=
To: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_023253_059151_DC67203A 
X-CRM114-Status: GOOD (  16.93  )
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

The bootloader configures the display hardware for a framebuffer at the
given address, let's add a simple-framebuffer node here until we get a
proper DRM driver.

This has several benefits since it's an OLED display:
* energy consumption goes down significantly, as it changes from white
  (as left by bootloader) to black (linux console), and we generally
  don't run out of battery anymore when plugged into a USB port
* less of a burn-in effect I assume
* phone stays cooler due to reduced energy consumption by display

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Tested-by: Peter Griffin <peter.griffin@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
This is marked as v2, because it has been split out from my original
series in [1] to make it independent, for two reasons:
* drop the dependency on other patches touching the same file
* no need to mingle this one with adding Pixel 6 Pro support

Other than that, there are no changes and I kept the existing trailers.

For those who want to try this out:
The stock bootloader disables the decon hardware trigger before jumping
to Linux, preventing framebuffer updates from reaching the display. We
have added a work-around in our Yocto BSP layer for the time being
(until a proper display exists upstream). An alternative might be to
port and use uniLoader from https://github.com/ivoszbg/uniLoader, as
seems to be done for some other Exynos platforms.
---
Changes in v2:
- split out of original series
- Link to v1 series: https://lore.kernel.org/r/20241216-gs101-simplefb-v1-0-8ccad1830281@linaro.org
---
 arch/arm64/boot/dts/exynos/google/gs101-oriole.dts | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
index 387fb779bd29..a00cb27e167e 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
+++ b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
@@ -22,9 +22,23 @@ aliases {
 	};
 
 	chosen {
+		#address-cells = <2>;
+		#size-cells = <1>;
+		ranges;
+
 		/* Bootloader expects bootargs specified otherwise it crashes */
 		bootargs = "";
 		stdout-path = &serial_0;
+
+		/* Use display framebuffer as setup by bootloader */
+		framebuffer0: framebuffer@fac00000 {
+			compatible = "simple-framebuffer";
+			reg = <0x0 0xfac00000 (1080 * 2400 * 4)>;
+			width = <1080>;
+			height = <2400>;
+			stride = <(1080 * 4)>;
+			format = "a8r8g8b8";
+		};
 	};
 
 	gpio-keys {
@@ -68,6 +82,13 @@ ufs_0_fixed_vcc_reg: regulator-1 {
 		regulator-boot-on;
 		enable-active-high;
 	};
+
+	reserved-memory {
+		cont_splash_mem: splash@fac00000 {
+			reg = <0x0 0xfac00000 (1080 * 2400 * 4)>;
+			no-map;
+		};
+	};
 };
 
 &ext_24_5m {

---
base-commit: 8503810115fbff903f626adc0788daa048302bc0
change-id: 20241219-gs101-simplefb-oriole-d3fad1f5b498

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


