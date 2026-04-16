Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 935A2F8D76E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 20:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sy9TqEHIxN6NK0fYsnvnEQIWM0euuGHsvcvwSpdM1gA=; b=Yyrzj5GXbSefVSmh7oXNv3RCf1
	Ke/15NV0oCoP3QZcBABPBUcsw5e7uTdP/oqmXTsjnVJYLmaYTvinqCKyA6jGp8Ig18ic3ijKxALss
	hFH4cFEoOs9npirz5yBV93afIC968CXy+oUeQXq2hXdjdZSpMgv6wmYZ7A2km9u94UKO5+N1bSASX
	+DVlgvP9jP4CJxiN0MbmiHsC4/N3H3sXATlF4VV1PGWrQrd8y9Zj6XhOmA+RAWVCoUbhkHJ9yOdKD
	/9oAAhFdLurKR633vY3tagvWH67FWiO224SUO6OevkpSorIEg2gFxFj1LkZI0/xy3N7af+Mk84DM5
	QyI8nhdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDTC1-00000002yFi-3Ezf;
	Thu, 16 Apr 2026 20:20:05 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDTBz-00000002yCH-22BG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Apr 2026 20:20:04 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-43d72875729so3501718f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Apr 2026 13:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776370801; x=1776975601; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sy9TqEHIxN6NK0fYsnvnEQIWM0euuGHsvcvwSpdM1gA=;
        b=CJ+LHJPEdct1FT2mgCkLBL+52G5LxOe/WF19Lvh5IJkgcgmSHudmIQg92em0XeLQy/
         +bQBKeUDiPTpFwsVstqNIEXiKCHnv7d0zBVcSS/67yXdljhMdADkaLl75B1SxXLBMJjE
         4kuHjEQ2KFAYE/HU9EKO1tKyEK+1lHK+zPJT+x5wcdOcMO1IijoVEPwcawgOaIuju8sY
         oIQcPRJntDAC2OSjYEotem2qvMYm91BfAGypvNax5bvLE6kIji6TUKii73JwJkJKkfiY
         43BGstWRLImPiXLC5QNQ5uobfTecxngLEzZSt3FmJSeooOrQF71VQBGh+KMdRPRhlwMz
         zisQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776370801; x=1776975601;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Sy9TqEHIxN6NK0fYsnvnEQIWM0euuGHsvcvwSpdM1gA=;
        b=mnrNB8yV6FnfD1h0joKpX12hielDPZZVgQ78Az/ONJVL/syUn6MUv3hRnL94bbeDCP
         q3m5mSGbFpAS+kmrHu0NvEKFBS9JhbpCyK2w5D13N77JUDiiJi8IXPO90Bl+Tb24zg0r
         7FL6hQ8zjwuWcs+FUEbMZssbQgqK8J3frCLOpZipqIRiSCbcJEbPv40XPLju/q2GrlGh
         ldYYEqYAtqdZEwce7qvj+nWI/z5UkwiWrb1K6pZlkESJ6mEIbEaRBeYy3T6ycdvu4Yqs
         zv5xaAq+ZxssBe69mO+JKrnB97v63WrJJYlScFW/pI2ufZJ3txg5h2ZCjiX9eMLokgOK
         rb/A==
X-Forwarded-Encrypted: i=1; AFNElJ+utV0VDXkwm9msyu56jDsPtLn9j1hMexwvGnijXGFoSAVf59sx8a0fH1eYknQP2b2tM4l314MBROPf5Psw1+yI@lists.infradead.org
X-Gm-Message-State: AOJu0YwITV272BV3+YQkH6s6NX+MJs12PKjdolJKlCo5yTjwz/Nu7ryt
	Z3TO/CLI5Mj5fnc42ReVF3VcnVCMIlPOKEko+prnbBCRN3XF4wX6t5SN
X-Gm-Gg: AeBDieuxT1VBf2m4qIxwe+d02bDPDqNoICSrbZqK1mq3RVhwjCYtSVVVI2kxn646tq8
	Enb6idDT2gtGuOptyAqvlS1rtFznCxQvpQJkLroAHiiU19Jjov2ai4zx3D3RoA/xc+7Yst+mr6n
	WOVeHyRJA8EFbPLczTlKuRLcm5+5T9vfXDRxTWmZXfN5PoGkPr++MEAiPo175MqZkWvdOvmX5Um
	LSfWup1bRpzmoWaxYdLWghMryKEZBbYlHMWGfeC6cj6F5uXVrPAcyCw8ubMCYpHYExDL+S1Gzhn
	RmMPakdTuKb0vnX2EDSOfdD5pgJFDHSHejLfdlVm0SJwM7PEl6tLBswCZfXE+CX9FMJuuKexgzs
	Yh6ySBJTZ4BRL+IVuwbuhknd+NX8XyNyFSS8pfKmnDqEENmTz5vBd+xtsN0bfOiZKh9vhzgKKtV
	V1+zVowtgOWecJlWnfIGHohRlbuuVwFEG2hPGxxADPdWGVkw==
X-Received: by 2002:a05:6000:26cf:b0:43d:4a43:53db with SMTP id ffacd0b85a97d-43fe1596617mr1025259f8f.26.1776370801383;
        Thu, 16 Apr 2026 13:20:01 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.227.196])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead35c026sm16180624f8f.15.2026.04.16.13.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 13:20:00 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Thu, 16 Apr 2026 23:19:15 +0300
Subject: [PATCH v4 7/8] ARM: dts: Declare UART1 on zx297520v3 boards
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260416-send-v4-7-e19d02b944ec@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1702;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=OkP3mdKoK/wb2ZT5jYJ/ZVN3/jOhvWuJhUE9h0qF2VQ=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBp4URLcuxim/TQS8pbKO5tQensiaHCwPrFRWbsQ
 gPtxXIEKtaJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCaeFESxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiI07g/+J3gFaCAibP2Uu0oP9XXc2ViXRxyXuQ6
 FAr5syZvJc3oJiuQ8lPxaVfhIeRQ/TzRFaWYm4TqFFcoF8CFQku3LTCQ6CC3inaT1TFnlUH7LDB
 DsBg/9ZCh836vnGTHhbrR4IiqackyVH2zvAqFSqk4mfvSASEuNdyOXELcC3/moctlguw8xpR/qk
 ienfNlJqmmmy50hafQi8gmr7xx9zwBLOV4aBbQfX+Zp6v1KZ7hxMaSknODVoa4AmVKIpSOzbulH
 NsGOCLhnJyeYwYU9Uu7CRZqf2cCVeLSJf7fWHvmVxa94/DoAHMl0O4d+EweIqKbH1zPxkQQJ0TF
 bi3cfdDQI3GNgboNRWpm1kyhyplaw/+CG0r8OaZbt9z7DVw3+bdKEVaKDkCl6Gfw3PcJjfYTjsj
 rC/vAByXUmH5gMnozEauB6uMQX1ZY/mcqfvfymRnOOu4CokkWbDMLvFnvj9XEmNjYI4Tc1qlhEH
 KgQKGHrK/pBDTb027GsLc9Gqcb00VrrniSvf3V/AjwlJ/yhMILQzBrgaSg5BJKxcL7EEUTU7vDO
 pqzhEYa/7l+q14+34gB9Pu9fangdFK4cB/jwYClSMrZNlZFnnmlYXtwGeIWRMrvkq2s3haie5dj
 uD7zjc/BZ/mFFBqWm9n9JhgrrQl25WEY1fsfP7pI8rXoDDu79KTc=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_132003_632069_03A0A3CE 
X-CRM114-Status: GOOD (  16.57  )
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

This is the UART that sends Uboot messages and is accessible via pins on
the boards I have seen so far. UART0 and UART2 exist as well in the SoC
and can be used with the right pinmux settings on some boards. They will
be added later.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>

---

The reason why I add the serial1=uart1 alias is to keep console=ttyAMA1
stable regardless of the other enabled UARTs. UART0, as the name
implies, has a lower MMIO address, but uart1 is the one that usually has
the boot output and console.
---
 arch/arm/boot/dts/zte/zx297520v3.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm/boot/dts/zte/zx297520v3.dtsi b/arch/arm/boot/dts/zte/zx297520v3.dtsi
index ecd07f3fb8b3..09fbb1d052e3 100644
--- a/arch/arm/boot/dts/zte/zx297520v3.dtsi
+++ b/arch/arm/boot/dts/zte/zx297520v3.dtsi
@@ -6,6 +6,10 @@ / {
 	#address-cells = <1>;
 	#size-cells = <1>;
 
+	aliases {
+		serial1 = &uart1;
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -57,5 +61,23 @@ timer {
 			 */
 			arm,cpu-registers-not-fw-configured;
 		};
+
+		/* The UART clock defaults to 26 mhz. It will be replaced when the zx29 clock
+		 * framework is added.
+		 */
+		uartclk: uartclk: clock-26000000 {
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+			clock-frequency = <26000000>;
+		};
+
+		uart1: serial@1408000 {
+			compatible = "arm,pl011", "arm,primecell";
+			arm,primecell-periphid = <0x001feffe>;
+			reg = <0x01408000 0x1000>;
+			interrupts = <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&uartclk>;
+			clock-names = "apb_pclk";
+		};
 	};
 };

-- 
2.52.0


