Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F7BAC3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 May 2025 15:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7bV39ciPbYxAqyF9bw5GexYzHMHyeT7cFiiGjkDg4x0=; b=bqxM4LA0o30W3Pqe3bUtAtB+Pe
	LEkFj/tqNn1cZ/ROTepNrwGFYuwJfBmQpQ4jSIgbbQg6AJSHIFxwuDeA/rgr7QwiJkU37KdpoBLUs
	h9BjYSX3MGYq7ynJtUQdlwgS+KM1byXm2pmLCH3/SF3WAeA+8hYq2tKolQopDavY+CkqK7AawMlpz
	NMxSmkDWakrz2oLX7vbd6BmRsqBpJeaffsAXtv7kwLtu4yVYvZ8bFA1SBJQsCHz40LHYlhWZ1cYYM
	tXNIX2CXkzZ5SLsaX0Fvs4NBOD9WAR1fgyYDIHlJFGNXmbAew7JK9qh52lz6ahHGFNLY786ZKqztq
	e+xmvgMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDmM9-000000066qA-3fw3;
	Sat, 10 May 2025 15:43:17 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDls8-000000064EL-2XR1
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 May 2025 15:12:19 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-b0b2d0b2843so2335523a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 10 May 2025 08:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746889936; x=1747494736; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7bV39ciPbYxAqyF9bw5GexYzHMHyeT7cFiiGjkDg4x0=;
        b=L+kOvWny5f26aI2EUp2t0VU6o5UhDIB7k1rQptqTckvI1/A36OX/wzzUk3WEjVDHRU
         FYa6fATzFGpMzP5BZIs7Sqszuh4Z7Zb7q9JaCDEoImsVMZT1rncDDFjn7+5V01BsvHTy
         j2E1cJlGyF3AcybVyw0ENRT0MifxxZkAyHwAyld61Q9hkMo5yuJAl/p/Wg3lOdxkuAwg
         XGETg5NT5aVR7ChUMkCp68vQ1np/u5vUD04tYIQDYoY+hN/QkWnLb246MIC0F8SgY/E0
         4AgTj1DNzhw47qNJI0GJ86AQfqurdI2hLAzxcoGpxH4ViabKtOvFeSMDwTIGpdhFuZL3
         x0UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746889936; x=1747494736;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7bV39ciPbYxAqyF9bw5GexYzHMHyeT7cFiiGjkDg4x0=;
        b=dlYPgL0YtKY+hb2xufUyri33uc9Gq977TySl15Oms6PUFE7TSiWOXthZi8of+YgnVt
         AOLadfdQgPnguN42LGFY6QELylf3bqW6EcZi7/yhg1ENZ4Uay9T+ZBcx89ZoFkrjy7Yf
         aGsyuoK5Hqjn2hBDSv87zDmrGm+Z3sjNcHQlThvNBZdsfOwt6+s2jzAr+CnWPADNh7Gh
         HwSDb63BZV8EPO/FSov7JigHXCN4dobzcFYJb1iUVCfOGCICz725Q9TH/k3Gp2YAhpza
         FNHErjD50522nQ6jeEWopcs9NvanWQG8mU7TWb4IObbuVk1xr4YPpIstTfKEBrUprPTG
         rkmA==
X-Forwarded-Encrypted: i=1; AJvYcCWIs1b4IzKAN5hXghqnq5W0hRsZo/PaSChDSxH3Ahfpg9M5omvAfaLA5mP68THH7kW9GOzFi7oZRFpU43j9qu4u@lists.infradead.org
X-Gm-Message-State: AOJu0YzpUVqURQNiUyJY0L1ndc3Sx8pszwkYw0LXMVWi1YAHB5OIoWiC
	pEvxOspRQPUm2raBXYeV9VEuzKtcSb27QI69S+ok4EEclzwQ2OBO
X-Gm-Gg: ASbGncs+gEKoctlFAKiWUeOg6w1MX1UC0hBpUYF9r6XXsDr/MXgRcMs6mcxlHu4cpUY
	mnUR9kk0la2XmdB/q8m1exQ0Y2ALDbNugG6KOFjs0l3kJbJ0remn1FtUbcmlQ0GQMLg8r348gVH
	OIAjE4eUx95sMG/+oXQeLjuKei7CYzWDhiQovVZybGjcJTonVV2lMxIM0f9kjfehHe6IFmk4y3Z
	ayEqdMwMFCLXuLxk7/MOx2COmeY2kqeGt4szdSImoiDvmEdMmbbgQpwuh0QANGdFAvsDehdGX0H
	lT/9NbZDbrKMeElFVmAsy1mvAUs+gvSJbODRCtmIfxKd9J4KIPvT/A==
X-Google-Smtp-Source: AGHT+IEFX2DqwxdNjmLY0TBMvhcn8rxV1W/2cg8dtnsnJo8cCkPubmci8tpWb2EV8Dq18hbWVPX+Mw==
X-Received: by 2002:a05:6a21:920b:b0:20d:5076:dd78 with SMTP id adf61e73a8af0-215abc78934mr10836620637.42.1746889935720;
        Sat, 10 May 2025 08:12:15 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-b2350ddca3asm2990493a12.58.2025.05.10.08.12.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 08:12:15 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Sat, 10 May 2025 23:10:55 +0800
Subject: [PATCH v7 14/21] arm64: dts: apple: t7000: Add CPU PMU nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250510-apple-cpmu-v7-14-bd505cb6c520@gmail.com>
References: <20250510-apple-cpmu-v7-0-bd505cb6c520@gmail.com>
In-Reply-To: <20250510-apple-cpmu-v7-0-bd505cb6c520@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Sven Peter <sven@svenpeter.dev>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=894; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=gOE3a46CDNX3yVDAoVpyrWK4j8QsbYn+HXz/rfkRHIk=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoH2ycOS1PSJO7bDASE4Z1GCvIbNEZdRdYcGnw/
 xFXUL+wJ7iJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaB9snAAKCRABygi3psUI
 JBSiD/4qe75dvVc4Aw8hNudfAwPjI1bmZ+dtl7+6KmhbrsxG8HVCuIUUtaTMrO18hBl2MzqRwlN
 Gsvc3t1A+/SVN6MqPXkBKdjW98xgBKaqvqydSFkDUuPoNWgVqbEzTBfYb/ZI27Z5YTkeTTiXJFS
 qikXFLANYPM1Cl3AurtLMxb++72gZVWawt0pLkAqhBZuQM+atr45CSntSH/1cidDRpVzAXCvqDd
 xboQrsmwXB4HxAe5JQhbR6qI+hGEncTrnzhKO/V9k4FEjLD9yJjd6yqszbPb5mpGjD0aiDSTdcx
 3ZsDRiLysIsLD1i+fVqDXSVuhLmAa0EPd+5Gb3DQQJT6lSpr5hhugPOFKbcUg92AU56GFxHZIJe
 Uf/l28LPkd7syoZxn2QJnMghBzBh2eC+93e0Qvp2LFL+KtLIuWE+GxeHLXXO/xFH0W2Lj/rKki+
 MiukYYBKsWSrcCvz8BFCNWaIUeMo3L6q1q8MjFvHt+tLtNtoIoK7Qgxv5fuTilqx9QG+aqaThw4
 ayW9KfspL09CYGa8Oe8HSMB3uoVfcz2hSdarxmHY4rUSYzDVyCRZCGPLy3aTF2tHAY6JFZgzMmn
 vKdD0Ub5doPjb1OTb4GXAh8/SUbdcDNOts6cF7fEPyUxDirlBHi6ICD4t4KyeYeHeeGzFakNz0Y
 GF+VOsk8tfi/sKA==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250510_081216_647224_DDD931DC 
X-CRM114-Status: UNSURE (   9.94  )
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

Add CPU PMU nodes for Apple A8 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t7000.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t7000.dtsi b/arch/arm64/boot/dts/apple/t7000.dtsi
index 85a34dc7bc01088167d33d7b7e1cdb78161c46d8..f1415f50cb150ce1d33999c817243c3dc9184199 100644
--- a/arch/arm64/boot/dts/apple/t7000.dtsi
+++ b/arch/arm64/boot/dts/apple/t7000.dtsi
@@ -193,6 +193,14 @@ timer {
 		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
+
+	pmu {
+		compatible = "apple,typhoon-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ 75 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 78 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0 &cpu1>;
+	};
 };
 
 #include "t7000-pmgr.dtsi"

-- 
2.49.0


