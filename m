Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4B7AC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 06:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fsJLZhqOR3UbjWEM7x+FIdlo40Tmj4551WlKIRMpMPg=; b=ichNJj4kI5OhctRysgXcr8ZhSA
	vEyzK4BK9kvudJTC3U6aUHgyp4o82HqOZAAxeIuhNxDmhlDWNI5iQGJ7W8mmOW5d+pe6D5AY+WcKT
	7/Ig32ZBLt+bB0F9Y/XmDGeQNvwbkwJit1LeGNxLAELdmuNLGasZyqhICvVlUT/3W6bAkouHj+woK
	w5SRzr/qkQjYsVv7YAA5ZoXctoQRvEPz2NKKqNVUwUbvP4d3Uv4T32q4H0nl3qsCYKQAg5HZV5Lf9
	je2iV7wM0G3J5K6EqVkLXR02I1r+0l8DdjKQFgNIq8C6ElBp7Y0/QihM+2pw12Ty9OWt+94deAlYs
	y3hqgTrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjWdb-0000000B2ZN-0rer;
	Tue, 14 Jul 2026 06:29:03 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjWdU-0000000B2TG-2vVw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 06:28:58 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2ccdb73f0e1so5759845ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 23:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784010536; x=1784615336; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fsJLZhqOR3UbjWEM7x+FIdlo40Tmj4551WlKIRMpMPg=;
        b=CcvS63aHFAvZGWIYoOmougJ+a+tSZc+0Qq9rYsSXpdP1EyKAhqSqXNifE5ZiuAdLqT
         4BcPtUXV2I+fKt97IfAxvEpTyoaSnOZB8A1ol4VrBwONXem4+5ofEHkg7mh2CDkiZ+fI
         cAVVfQ1rainQzeXOzQfCcnXzicp1abGS7xyC3txSARwu5feVwyOBmmc636vCZ4Op/c2U
         MZNJSQ0kpWsWg9LxLcHtBN3kL5xYYIu0z2Arh7WFGLiglm/h7ipg1/8TSgIVncutdyhb
         vNyVIQI7IeBOBOZ4/4kZ9sBEUeOQd0dSX1+G+8MKNbjdIvJdGe49xroONWw+SqXqrcnY
         pA7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784010536; x=1784615336;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fsJLZhqOR3UbjWEM7x+FIdlo40Tmj4551WlKIRMpMPg=;
        b=A7queJkflWjEpbwSfDkBWMQ0d6r7EDXv5fAlwxse9MTxehPIspkhH4vXUFV+UFH5Iq
         Rb4IL4NgRVQaxGlFL8Fvz3QuhPB+ad1qiztpima9yj6zfAzNcFMvxtQr17g8k/GFLlW4
         3vj+mU3KxDQAkHKKfxtAzK4+TdNWpQlxKD8dtzSKyBATL4/b0t3MW6hGkqNxjnFT/iMM
         xiIY2zR7PDYvxaX326hecxXwFvZPGRxBmd6wb+XeZwp5nx9QfGGcPy1X1+nQBHDDRbsa
         IB3shxhYZoqxBgNKYuvlZAFXX8QrvZiAj59HsFLP2RVTVvrBZm4fzP7MxSW3YfHzq80X
         ztFw==
X-Forwarded-Encrypted: i=1; AHgh+RqoA4gdoTMh8r9QfoTocghy5nTmvLxGzGV/kzc1poTFqK31uGxihHQTFjNqjJb9b+ug9f0Q6u0SOJX+qkd4bOic@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+sEyKuo4U+MbQKy2i766yqMtyxlaCZnVllU+2q8fTIm6unSep
	sONa/7pjXtOg775cZIpVdCS9bBZsT/spYa/nBqf9h6KIEMfGugoOmE4i
X-Gm-Gg: AfdE7cnMOSEQySJOiPC1ffK56/UApn97yaUBWnWEqvLpv6XT9uw2cEEHBVbqUxTeftU
	k3V9zPDMUzRK8imzDMwqXjyiaNs7TQdCUa61BIOc1IRz3NHOViZUQQMW49s7jxkPHQHDZOEdFLt
	qx+jvk+Y0SrzYKgSq1NSJ1nr+sFA6y9ibwerTZMDgOQsuIh6S+bfHm/9YxRu+VoBU0jA40t/cK5
	Nn7oYRboWdbaaWHnr1Dt0n/N33Xy93UQezc+yAmkk//XM3OY+TQR3bslDt1MGRpb8pHdLrQ5RRC
	EcEZfceVrPOXNSdO8xyWDhawpFsA5TsBUEJFAqhloopkR3uVfG/jUivnVamjm4iIQFkMBQTu/Hm
	0+xWZI9oKrb85lPut1DGB7Ns06EK+/OHAxkzCXSV4ifI3C1llZz1stHAbuu0MYYyoWJeBu27N/V
	AEFYMl4rbojT3il9mjakFU0n0udCdlPhYmDPaJYq2JOM+PvcTGKrnoKxPlW3nENeyu6aksyjToy
	D5z3XT7cU9jvuC2EUBnFpmuttBeiXKrjzO87X/rHhPqg/awZgDqdHXTK/hwAnl+
X-Received: by 2002:a17:903:b4f:b0:2bf:7b62:a038 with SMTP id d9443c01a7336-2ce9eae29c0mr123749945ad.9.1784010536065;
        Mon, 13 Jul 2026 23:28:56 -0700 (PDT)
Received: from [10.160.5.76] ([119.17.57.186])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc99cc5aasm110915985ad.0.2026.07.13.23.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 23:28:55 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 14 Jul 2026 16:28:15 +1000
Subject: [PATCH v2 08/12] arm64: dts: apple: t600x: Add common SMC hwmon
 sensors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-smc-subdev-dt-v2-8-13fa78873121@gmail.com>
References: <20260714-smc-subdev-dt-v2-0-13fa78873121@gmail.com>
In-Reply-To: <20260714-smc-subdev-dt-v2-0-13fa78873121@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=966;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=HLHEl0SO/lEahgCGK95iQtDGGar7Zg/9GoIChI66pAs=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFmh1xlFnAxDa7pW5PYsjBK9Y2uTcDjovdya+zbN+YdXn
 Jbz/36yYyILgxgXg6WYIsuGJiGP2UZsN/tFKvfCzGFlAhkiLdLAAAQsDHy5iXmlRjpGeqbahnqG
 RjrGOkYMXJwCMNU38xn+e674tCBa0vCiu9z24NabgidN4qQdXebeK3Dcqcm76vHPYIbfLCw/Orv
 eiW/nTDKRPZz8Nevu9TprtdDLvDzCr6ccVnFmBAA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_232856_748790_61901C4F 
X-CRM114-Status: UNSURE (   9.21  )
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

Add the SMC hwmon sensors common to all SoCs

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t6001.dtsi | 2 ++
 arch/arm64/boot/dts/apple/t6002.dtsi | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t6001.dtsi b/arch/arm64/boot/dts/apple/t6001.dtsi
index 6dcb71a1d65a..4fb934d7e71f 100644
--- a/arch/arm64/boot/dts/apple/t6001.dtsi
+++ b/arch/arm64/boot/dts/apple/t6001.dtsi
@@ -67,3 +67,5 @@ p-core-pmu-affinity {
 &gpu {
 	compatible = "apple,agx-g13c", "apple,agx-g13s";
 };
+
+#include "hwmon-common.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t6002.dtsi b/arch/arm64/boot/dts/apple/t6002.dtsi
index a532e5401c4e..0f81fc612a2a 100644
--- a/arch/arm64/boot/dts/apple/t6002.dtsi
+++ b/arch/arm64/boot/dts/apple/t6002.dtsi
@@ -305,3 +305,5 @@ &ps_gfx {
 &gpu {
 	compatible = "apple,agx-g13d", "apple,agx-g13s";
 };
+
+#include "hwmon-common.dtsi"

-- 
2.55.0


