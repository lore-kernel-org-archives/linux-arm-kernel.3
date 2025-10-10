Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0331BCCA476
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 15:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5ZoRFa4EgNbo9YHpT/rgkVAy6RF2nhrPvBGmNOSTvII=; b=NpdbrMSg4v0U20+nsF7IDqYaiB
	aEaL7t1+d5exu6tfnDZ7kQewJeMyoFj2HarNVQNcNS6+87IgXKSKtWMYbchu8pgW14povRzkwpSVj
	jFbxW7mBVJMT0ygR+jouU4Urz8IHnZTrV1onTg/YzQxVDLJzug3JI0FxQDF6+SVQD+nn0gk/obOlo
	Eb0jsAVAwiUTuj+6rxGmMXBmRRfFPPBAW1Z3OCCri2rUgjP3shPfQQdZsh51+W4WyWdmVktYIDtdw
	/Q0W8fWeEYOOYW6ciFVLhRgwuRKFVJAI+smXlnc7KOKlTqcxaaQSGXZBVboo52NPJCUdHVjj9riDY
	2XvGkpCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7FTt-00000008wXZ-1aDd;
	Fri, 10 Oct 2025 15:56:33 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7FTq-00000008wWl-2x4Q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Oct 2025 15:56:31 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-639fe77bb29so3249948a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Oct 2025 08:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760111789; x=1760716589; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5ZoRFa4EgNbo9YHpT/rgkVAy6RF2nhrPvBGmNOSTvII=;
        b=dypI44+TOQbSL6WYyyEaVpF9J2Y08aUiotEnesVl1PFAyZxmp4kfT0pC/5Mqg7KkqX
         to4uP2x4zi5MftEy+3dM3TZAJ3nNW+20rx4pPETO7i+GyiFlZWzbLEGNGcoxqQS+u0Ra
         dqTkn+gwpCYiJBKGBavQn5YGJlC6e44vLXDZZWKccht+45+pa6OIniYvHjwgrF6/2dk/
         bqKUWRk642E3Az2MuK3jOeaklNhnbIj2RRvtGyc/Kgu2XibI8gUYFlDIvt/qDxxUH7U9
         qVBbbye3KxAPvC05UXW6D4eOUGbwWPeu8+ER37HJNmQMTYuacABdJjUEx+XfXAsuEMP1
         Vr8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760111789; x=1760716589;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5ZoRFa4EgNbo9YHpT/rgkVAy6RF2nhrPvBGmNOSTvII=;
        b=s503fxRvTfvC5/QptYbjn5g+GphTt9m0EyHmDKkp2BrMnqFO+NCQTCtglV91WuT6Rs
         nNypXJ2lMjCt08jDws0B8OtdmyLdwYr/0r5FiWNTQzvB5rWCIGJxnKxP5Gw6BXKpFffi
         CSqUjBWYg+w+/GDNL2Uv172o4wdQbfkar/DfJJfb9LyPyZsFwWxceV1FCmqpZfjBu0xk
         Tnd850500hK8kT+hGR518P5f0Rd6M+P3XjjtNloXWMbeY2MCLBfAZNRNBPdRE2afk67I
         qdUJPRcgHtSzQBalp3quQ/6Dwv+KJGtecSZqfnwEDkh4itfdPutloe1flnha0t/4FaLc
         3oww==
X-Forwarded-Encrypted: i=1; AJvYcCXt5YNmSAiDmzExc2e1fVORU3SGYvPA5jx7fCuaIJYuOi4GDGfsQsiKkB6JcasD0hqiu5DoTtC7UkqpgQ/4uWoD@lists.infradead.org
X-Gm-Message-State: AOJu0YwSLMNtWpeIQZKVGFbjsa25kr5KvpaJ5NsvBPV37dDYTctzfY8e
	rr9XPS96L38DcHSO7EbEQqCzPE29uh8QrHWwl6yhE4AA6Iu80aMc4ZHd2n12O454Kws=
X-Gm-Gg: ASbGncv4vYMoSys5kgvABceNSMYi1xA6XpJWhJR/9bywcIn3+ZtxJG9hEjHnjdaFD46
	a9IUMuh+RbiymH8uG57TYVINp25M/bi+jhLVO5pTMrggMHXAxxfZb4QY98yVG/rxRJgnr5bU6zN
	LijnMPWTjFT6XjK0sutLyN+AXhmUqa8eJYIa8dlh7Hqe+VNjHVAuWQFeJzsw7h1VTgHnStY1lT+
	PYdahsMpHbrspFriehyliM0xE6HsVjl4t/23Kh2kjYZHvuCtHZH7noEHz4odCls1ZfsiGyuQLN4
	fubJuFZ/p8c+1gNcWAbhVq2ozuzvZob390f7Ikr7i25lPSXcqERygX0Uemvjv9UU/hnK+WbtM0h
	ZRMPyotjd2cTDo45blnOue3MvesJSjXONwTaQvloa9l5M/k4vJuGw1vVci/n6YFDsSKLVrPT5fH
	txxTwnBjM+tnjs1Tl4F2lHOpyKwYTZG++NOJA=
X-Google-Smtp-Source: AGHT+IFPrLD0cpURVx9vlEq9MIRSEh4Uvrp2QcOigo0VAcKE9vYjUK34xwAVj5/gi01gKaUb5M2abg==
X-Received: by 2002:a17:906:4789:b0:b41:c892:2c67 with SMTP id a640c23a62f3a-b50abfc861amr1291709266b.45.1760111788585;
        Fri, 10 Oct 2025 08:56:28 -0700 (PDT)
Received: from puffmais2.c.googlers.com (224.138.204.35.bc.googleusercontent.com. [35.204.138.224])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d5cacba7sm261285866b.5.2025.10.10.08.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 08:56:28 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 10 Oct 2025 16:56:26 +0100
Subject: [PATCH] arm64: dts: exynos: gs101-pixel-common: add node for
 s2mpg10 / clock
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251010-s2mpg10-clk-v1-1-dafb5d179395@linaro.org>
X-B4-Tracking: v=1; b=H4sIAKks6WgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDA0MD3WKj3IJ0IJ2ck62bnJRkkZxkYGaQbGimBNRRUJSallkBNi06trY
 WAJcH5UZdAAAA
X-Change-ID: 20251010-s2mpg10-clk-cbb8cb060c16
To: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_085630_761796_6BC858E2 
X-CRM114-Status: GOOD (  11.77  )
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

On Pixel 6 (and Pro), a Samsung S2MPG10 is used as main PMIC, which
contains the following functional blocks:
    * common / speedy interface
    * regulators
    * 3 clock outputs
    * RTC
    * power meters

This change adds a node for the clock outputs which are used as inputs
as follows:
* RTC clock for AP
* GNSS receiver, WLAN, Bluetooth
* vibrator, modem

The names have been chosen to match the schematic.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
Note: This depends on the samsung,s2mpg10-clk binding which was
only recently merged into Linus' tree via the clock tree.
---
 arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
index 84ff3e047d3b31b5f96d4d6c78ec933bb05f3e6b..93892adaa679439bd87b0630cf9416b05c9d4536 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
@@ -109,6 +109,13 @@ pmic {
 		system-power-controller;
 		wakeup-source;
 
+		clocks {
+			compatible = "samsung,s2mpg10-clk";
+			#clock-cells = <1>;
+			clock-output-names = "rtc32k_ap", "peri32k1",
+					     "peri32k2";
+		};
+
 		regulators {
 		};
 	};

---
base-commit: 2b763d4652393c90eaa771a5164502ec9dd965ae
change-id: 20251010-s2mpg10-clk-cbb8cb060c16

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


