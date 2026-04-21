Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BB55F94CAB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 20:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=prSl3YomUAP/O+c4YIncfvP9MWtenSiESKpVMQ4hE6Q=; b=K7KZ40TmzHFVzax2wnxHBmlx11
	Ph1xaN68jn7UMWXhuAeKtiPUjAOvMLjxY2md26+sM0sNDMSUU3Fgh9nWHLKdBb7xSd83jq+Z9Idr1
	Ij/32hArgGGMqxAoU2liHOlMAgkWJbo4vlUpMbAnt1eAlYlCzFieQbDHEDjke7ehY2jePRX/i6saI
	XeGE/ddhWxoInZ2LjNSMq4ibIVkF7kYkcCpAPGP37d3wvDXun6ANdr3zYvRbkm8EbXPv4co7Muk7W
	gxdBoSjqcjS0c3JXJvp8/BR7jONDVMnl5XPOph2KFVnMs2m7320F0d46SDfGyx69W26gEOholq3P1
	Q3DQa2hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFHe7-0000000982g-3CAE;
	Tue, 21 Apr 2026 20:24:35 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFHe5-000000097zx-1Y3p
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 20:24:34 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso26063235e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Apr 2026 13:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776803071; x=1777407871; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=prSl3YomUAP/O+c4YIncfvP9MWtenSiESKpVMQ4hE6Q=;
        b=mvb3OjaXP0WzQPUgqfJHy75pkf3CECvTxh7VLBgXr9eqLNj67w+ionhVLroixuzfks
         czSiUHJ9cMx76M/JdFSpL5cOop9272xMKqpG6U+bAN7zajU+TcCD2HE4Srh/ukyrrgLo
         8avDRHWvHVtm6p6gTgYz1K87NMgpk5HKqj3s0iiWVi17Bw+0dnVc0EQQ2tJa6VFGmBwf
         eCQ1iQSSO4NEN0dQG9w4ZTOnYkJGWAX//f/SzkuFrxifsmYcw9r6rWGpxfbEqgR7pWOR
         wjxO7/3/eFfGzceNiFBpBU16Ad6iczVN/KfjOC2hVNFuIiurKoQMamVX8DzO+CFZYalr
         B+AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776803071; x=1777407871;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=prSl3YomUAP/O+c4YIncfvP9MWtenSiESKpVMQ4hE6Q=;
        b=PCxZOOrXUais+1Aoiqjbxggt/hwYAnVgn74zhpUsvmzdS+Rvg6eX/Yla/p9aT8qrU9
         CqolIXxPzkKignUsr2SibAayTk4dW9t0+wHF/t+M1LnbOyyg1s74Cof1Xu7e+7QRUPha
         TYIiezBSYCUU+snSxe4OVeZjralj22GPRDNTkjxlsUotpldMwRRBviCk8rK4FmfJ3uYf
         7tkqShIkqmR/m3G4rlHNp4e8VstQ7vBgT9GwWYsQ4i3FaXdQZa6XL4nTrOg8ihQj6pTP
         46ofy4TEKivi3Zqm+m3PhA8wmJMOu38i/9XAlPYNE13o3bxk396E+EVsKt8msE8KQRJP
         cMhQ==
X-Forwarded-Encrypted: i=1; AFNElJ8nUt0ZvsCt5iloj/ySgzFQqIyWOOWmgo6Bqte90h0zzpyGEaYbg3xbJyYK7yfwGrlP1dBTxqfkoY3zV1urVA+7@lists.infradead.org
X-Gm-Message-State: AOJu0YwI9ZsTe2bfAeF/PNIhDB6hUViKaMgj8ZehHYA/L/uhTF4ByJnT
	iMKygHzlVhlXfz9ELOV5Jm5Skqtl4sBBedSY2EESeoDZjzaNfywxrqOB
X-Gm-Gg: AeBDietKD+XOp3dKfLbz9fKFJdArwJFFDNk+MINV2wv9qvaMh1nMSuBcaVOK3c9VcLQ
	18ebQ8iVvrkEqKm5XIOzGvN3yDlWr+dzRBhR1+GaE63rURldv3xNb0fYOh7i6QXQNw/7yoJsLYe
	zfwEiKDPQsQ/CwszpcF0qYb7rCtuLUHKaWjzJmQbfCvSjJmRPhL3V5I96+IH0CX7jM03yftqfmL
	NT64E8a7RuKN0qh14IR4oemP8shTX8aDPX+Oj1trlgkbnp9e+8eG5VGhdvj32jekJ0wwKAwSgmu
	VAM9i8CItnD846x+hibjlzotD710Ira9ehPYvm38KoPa5103HU09b9GTZ1pqboiWkvvgUbiBsRy
	A6fD1Hftbn4QrUn9hWLNeFsA8UMUcHIT4vBterqH5uVeCCztDzK5cVwz0J4YCeWoin/bYcY9HO5
	FOGniu/SaKRIidL2nmAI9MjIv/tQ5mtfyrCEN0/3M2m5gS
X-Received: by 2002:a05:600c:c0c8:b0:488:a824:fe04 with SMTP id 5b1f17b1804b1-488fb787bfdmr213701545e9.26.1776803071290;
        Tue, 21 Apr 2026 13:24:31 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.227.85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc0f82bbsm655989805e9.3.2026.04.21.13.24.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 13:24:30 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Tue, 21 Apr 2026 23:23:15 +0300
Subject: [PATCH v5 7/8] ARM: dts: Declare UARTs on zx297520v3 boards
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260421-send-v5-7-ace038e63515@gmail.com>
References: <20260421-send-v5-0-ace038e63515@gmail.com>
In-Reply-To: <20260421-send-v5-0-ace038e63515@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2509;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=+LNOv45vrQbMiDCXtxIdZ1Z4wULCgyg45rbtYEUkz2k=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBp59zXfrQzEUhybTMkuA5I94/3Ymni5D6AUZPwC
 aINr5DnuqWJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCaefc1xsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiIQLBAAh13d/JcWPxwb69Uu73n5XpfiUQ8mnSS
 jTntxCjqPXK4oMz2E6WWElqupU9dACH3H2OwKhUt4gX31WdDFm5uhI/zaXfY0IinGaI3Zvm8nVJ
 ySf/MATiAvZ4zlu1Y0SrQIcYLGtu+/ZNa+C3OziXKgQndPs9pHGQgrcQi5WSYoGYGIugmEUJgza
 9xgnC6N81uTZ5JHFF5AO43J4EpHi/sdgcMzh1HW93NAmKbMfdJA7eRyj70Qg8sOU0DSMrLY6gYl
 WGEfZ1JdnKuGovZpgCzN6bjOPUpS86gq+1sm1S5uUkQdrsYkDHYjD5qYcYOVw0P5/92/ZExfaTh
 wTPr1DzMeIMN4hJqcRwbK4mPrMosRnfPnvf8Rm5bPP4BAZZUIsKacTAYBMCTmB0Y/uywOsbFyul
 bFEZBPdT+6FiGmozmvdzRVcsaKI4Mt82WstZTJPzzxKiESlehgZ41wwJuzydwGe+foprt+IW/+U
 guJu8ff/D6qrdW/2jM1BxM2amnNfJYj8huLkoeK0iOFVNVCWKGu/Sh3/wBe4dP8pgQXeeZ/ZTzx
 cfRPkEnGBQ8vu3E8D7uEWyf8hK/eXqD9WLskT5FpXn/vHz8sVZWuc5IjMf2c+w1bAdrKAEiTGQR
 GIcqUtRIb31dHmISZVwQ6G0hrTHPM99QmoF5IvKMQGWRREWSsPOI=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_132433_442722_1D683C1B 
X-CRM114-Status: GOOD (  13.91  )
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

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>

---

Changes since v4:
* Declare all uarts
* Remove the UART aliases for now. I can revisit this when I get my
hands on a board that exposes two UARTs.
---
 arch/arm/boot/dts/zte/zx297520v3-dlink-dwr932m.dts |  4 +++
 arch/arm/boot/dts/zte/zx297520v3.dtsi              | 39 ++++++++++++++++++++++
 2 files changed, 43 insertions(+)

diff --git a/arch/arm/boot/dts/zte/zx297520v3-dlink-dwr932m.dts b/arch/arm/boot/dts/zte/zx297520v3-dlink-dwr932m.dts
index ac20215fddef..1700f46aba86 100644
--- a/arch/arm/boot/dts/zte/zx297520v3-dlink-dwr932m.dts
+++ b/arch/arm/boot/dts/zte/zx297520v3-dlink-dwr932m.dts
@@ -16,3 +16,7 @@ memory@20000000 {
 		reg = <0x20000000 0x04000000>;
 	};
 };
+
+&uart1 {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/zte/zx297520v3.dtsi b/arch/arm/boot/dts/zte/zx297520v3.dtsi
index 903050c684cb..ca65797ed926 100644
--- a/arch/arm/boot/dts/zte/zx297520v3.dtsi
+++ b/arch/arm/boot/dts/zte/zx297520v3.dtsi
@@ -20,6 +20,15 @@ cpu@0 {
 		};
 	};
 
+	/* Base bus clock and default for the UART. It will be replaced once a clock driver has
+	 * been added.
+	 */
+	uartclk: uartclk: uartclk-26000000 {
+		#clock-cells = <0>;
+		compatible = "fixed-clock";
+		clock-frequency = <26000000>;
+	};
+
 	timer {
 		compatible = "arm,armv7-timer";
 		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
@@ -60,5 +69,35 @@ gic: interrupt-controller@f2000000 {
 			reg = <0xf2000000 0x10000>,
 			      <0xf2040000 0x20000>;
 		};
+
+		uart0: serial@131000 {
+			compatible = "arm,primecell";
+			arm,primecell-periphid = <0x0018c011>;
+			reg = <0x00131000 0x1000>;
+			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&uartclk>, <&uartclk>;
+			clock-names = "uartclk", "apb_pclk";
+			status = "disabled";
+		};
+
+		uart1: serial@1408000 {
+			compatible = "arm,pl011", "arm,primecell";
+			arm,primecell-periphid = <0x0018c011>;
+			reg = <0x01408000 0x1000>;
+			interrupts = <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&uartclk>, <&uartclk>;
+			clock-names = "uartclk", "apb_pclk";
+			status = "disabled";
+		};
+
+		uart2: serial@140d000 {
+			compatible = "arm,primecell";
+			arm,primecell-periphid = <0x0018c011>;
+			reg = <0x0140d000 0x1000>;
+			interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&uartclk>, <&uartclk>;
+			clock-names = "uartclk", "apb_pclk";
+			status = "disabled";
+		};
 	};
 };

-- 
2.53.0


