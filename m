Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E99FF8D778
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 20:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v8h2Y0LqQPmXTQq5JIHTyL05LcABjHyNOjfeQXRiytA=; b=w1m+C1WfnwSmdgL/waS4LW9+rL
	+Cy7ArlCS/iKw1jTCYOtv+LobJW3OoINOGG7aQMPMBiMRQqkGosFISnDpWs4wVEYW3o4JenAmwMKa
	vmCw4AkUfSAzRqVQqYC6SrZH7UTIfrJEs9XkTXkB50ZKZ4w5Pl1J6zmYeGkA9Isfck1Zr/q1TZjMU
	eDKv/F8gcHikZ+AMTTLtHIJGx+sxkoaAt5J+KQBc6JDQeaFvyvtqG+trG+4tBn+StQyMny6uk3oQ5
	GZj0J5hdgvQdjWfJEQcrf/ARhBXAEfD7gPaN4mnL5jhgvCc5LDv63tjjSUltys5e7iSaDGrfAocIp
	Y+a5rKsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDTBt-00000002y7o-2fiG;
	Thu, 16 Apr 2026 20:19:57 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDTBq-00000002y54-1tWO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Apr 2026 20:19:56 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-43cf8fe9c2aso5188080f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Apr 2026 13:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776370792; x=1776975592; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v8h2Y0LqQPmXTQq5JIHTyL05LcABjHyNOjfeQXRiytA=;
        b=Tz1Wh1wu6WbKr5XRrVxO//bhd9uBqHdEa0Y2+2ZZscFhyNkNFXJWJQ2kT3l0kpH9Ud
         oE4XJHZg0IAq5uJlxQ6Q+pxKw/MPK84C7BQSbgDCRxIliTGRaBamrI9vRsQ1L8g5PO9C
         mZbSpZCsewG1nSx3k0iIDRT5e749sA975ag9XsIGf0c4CUCXBRTfJnI9tgTlcflZA0M9
         nUumAWpza7mjJot8Dp1aGC5M33p79RNhsYKV7MPSVkcY11SavYPwk9cgyBi3Vcpz/FLw
         IxYgECu/QXHCAOin7mI2eywVrbHyzk2eFQaroVGS6lViH1MEeSq55jnDKnjc8BfgabKa
         Uxdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776370792; x=1776975592;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=v8h2Y0LqQPmXTQq5JIHTyL05LcABjHyNOjfeQXRiytA=;
        b=bxYdhJZjpW/zUrwTJDQvqbvN8rrmEGWePUt7rC/0e7ePoX/dURYQ0wtZalB3DKVlvR
         OO4ZVV4lehoeH1V+ru8i029nH4o5vZFWGfUTq2f1eY1fH3wzKBl/XC0TIzGfW38SiOOA
         yl898w/wchSoEsJUKXy81yS39j1J/Yiewwy+eTSgBQDtmgzLGLOlGxbdtO/YtrhMboy+
         UtgbzrxUMc636kRIC+rcMCGVi5Zji0xdG0X7I6L8A42yzNLRlxbKBdL7NsbjKrA+e7ev
         x5cempC9oxKTcg84eUssUUz1iipkJ+s6xV/qwOkAlZl8g/PrBMellc/MIp/rn/HzkWzH
         1n1Q==
X-Forwarded-Encrypted: i=1; AFNElJ86RfpUQ4Vd1mhfmMqPYmcBFzLqIFm+FH7KupWWnk6DyGC2XN+NM5rQ2HQIvdPKio24gleP1tr2BGoYhD+2m2dJ@lists.infradead.org
X-Gm-Message-State: AOJu0YzvqvPol7Ycz2oODa+maF0yJ3FXVME1eQgqKgp5o/3b2P6FhCl7
	1s+YdK1sJwLy38R/SLnLPbHklvEdBluFxpWSVspp014v5jNcmPEYV1w0
X-Gm-Gg: AeBDieuA/5BaC3aCAhU4bYgstegA+0Gw0LH83tOsV5Npryo/SFXQIA/343GHj+fIxgl
	LOZOo/gtdk/QgEr51XCDdxTHeg8vPH+FRLgWGr9via0LlRGsUb/sdhlhbbzRC/iiGqSRPzgbFuy
	1kNhAsO21T8uyJS5oMosEgCy1zHixWC9Rjiv+XKd+v2/Z1iYrRInP01FkpbavRrPNrWaGpGKRk4
	dWTzjRwUpM9L+6wVWprpcXHpp7AYWl1Z8ObcEy6HR9UBMn9m958yH3MnTiIKThnoppzKTyfb41K
	7LQ/NPQLeDZ1B9T4QHNKMa2AkaJGjqp7YtIbwP32Tfdv0ZmAmRjORd/fsBPs/8rPmcx2lzVmcqi
	KHrQw/jp3CQAH1HqT0XCrd7KVMHYD7FHeocEZHsVG4YdUzILAfvOyEB1YaglCYMnGbaBwzohmtI
	tSVS7hCz+M2BU7fSWagOSsJJg5fSffc8rsgHAN6nGDIoWZYA==
X-Received: by 2002:a05:6000:2507:b0:43f:dd91:b022 with SMTP id ffacd0b85a97d-43fe15921d9mr1107123f8f.35.1776370792338;
        Thu, 16 Apr 2026 13:19:52 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.227.196])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead35c026sm16180624f8f.15.2026.04.16.13.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 13:19:51 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Thu, 16 Apr 2026 23:19:13 +0300
Subject: [PATCH v4 5/8] ARM: dts: Add an armv7 timer for zx297520v3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260416-send-v4-5-e19d02b944ec@gmail.com>
References: <20260416-send-v4-0-e19d02b944ec@gmail.com>
In-Reply-To: <20260416-send-v4-0-e19d02b944ec@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 soc@lists.linux.dev, linux-serial@vger.kernel.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2173;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=qznDUZF4ymL51U10pRa61DaVkLGHZutq7Ba8beA/2rQ=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBp4URLmC/Ml0WI6oXBseumjwXn28obZZCF4EpdN
 YrIUFZfFdCJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCaeFESxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiLhmQ//UVrPeabRAXHovU4jP/ngUiwqsT0Mhf0
 iBG/XcA4xed8cfu1/ySQqe+/PWLyX6Cipm7fzVo64+FethSj9Izuj6UJLgcMhiWGudtOt48RqtR
 1uwTO9iw20JHJaoZ8+bfhpYXVIEP+5DwPvZgVnHvhyv48I9tcDq0n+cZ1/QQFEKmMB2r+T+ti0j
 I/Cum4GyJNkgVjB+s9uyDPjDLxhprXBiNyTPuRjjgr/go24CU9z6KbDtIRcF+Jk2DI+s85qiV+8
 pg/t6wnkPSH1Bun+K0gdz/hG+lqZxBlxLXYSGCpE9sTQe6ANvEk8zblgqtyfOwobHn66F6r6Oj4
 XHoxuxicDDhRxV+G9QFRZ2PSfISr+F8kzXxFnsLYmWs46rtdLzgekmb+lGlAwaDpv7E7O5RaRcN
 fF8d4Zd8Ozn3Q6d5cGmdV9Y1WU80kl6PdQ455AxH6Oyh3Pz24bHiTAxi1L3qXGK68r/4LTgWYj3
 LItQiRqLd8M5sl4c6OqTE9gI1g7XqCUPyco3cNHGZS1f4bLcSHklxj0fSMpEh7XEaqD6OqU/g3C
 YhP8RQzokDwE0Nsao1Gx5X+38CZptNXSg8bOSsCM8erfIRLS6Bk5BuLXadRJ8fxES01bOkh6Jh4
 6XVyBsq25YqVCPC3g8LoSU3YWxL9XL5e7EtrA7cR1uWEtgbBAagk=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_131955_409608_460EE7FC 
X-CRM114-Status: GOOD (  17.41  )
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

The stock kernel does not use this timer, but it seems to work fine. The
board has other board-specific timers that would need a driver and I see
no reason to bother with them since the arm standard timer works.

The caveat is the non-standard GIC setup needed to handle the timer's
level-low PPI. This is the responsibility of the boot loader and
documented in Documentation/arch/arm/zte/zx297520v3.rst.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---
 arch/arm/boot/dts/zte/zx297520v3.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm/boot/dts/zte/zx297520v3.dtsi b/arch/arm/boot/dts/zte/zx297520v3.dtsi
index d6c71d52b26c..ecd07f3fb8b3 100644
--- a/arch/arm/boot/dts/zte/zx297520v3.dtsi
+++ b/arch/arm/boot/dts/zte/zx297520v3.dtsi
@@ -24,6 +24,15 @@ soc {
 		interrupt-parent = <&gic>;
 		ranges;
 
+		/* The GIC has a non-standard way of configuring ints between level-low/level
+		 * high or rising edge/falling edge at 0xf2202070 and onwards. See AP_INT_MODE_BASE
+		 * and AP_PPI_MODE_REG in the ZTE kernel, although the offsets in the kernel source
+		 * seem wrong.
+		 *
+		 * Everything defaults to active-high/rising edge, but the timer is active-low. We
+		 * currently rely on the boot loader to change timer IRQs to active-low for us for
+		 * now.
+		 */
 		gic: interrupt-controller@f2000000 {
 			compatible = "arm,gic-v3";
 			interrupt-controller;
@@ -33,5 +42,20 @@ gic: interrupt-controller@f2000000 {
 			reg = <0xf2000000 0x10000>,
 			      <0xf2040000 0x20000>;
 		};
+
+		timer {
+			compatible = "arm,armv7-timer";
+			interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
+				<GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
+				<GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
+				<GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
+			clock-frequency = <26000000>;
+			interrupt-parent = <&gic>;
+			/* I don't think uboot sets CNTVOFF and the stock kernel doesn't use the
+			 * arm timer at all. Since this is a single CPU system I don't think it
+			 * really matters that the offset is random though.
+			 */
+			arm,cpu-registers-not-fw-configured;
+		};
 	};
 };

-- 
2.52.0


