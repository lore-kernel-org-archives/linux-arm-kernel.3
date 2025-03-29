Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E032C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Mar 2025 19:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yHjnimUXRB9yqs2JrX76wgCEkUn1WbBc4dXkc5jfVng=; b=uViF4jY6Xu241iQkp/9lqZSUGH
	gXJ2rqSEQ2X4P7Xry1s1fpQN3muapwSm3tq/mwQlskyvIV3UB6e6JNjx+++UMn32CwnQi/0RtuGmE
	GRoCvs483Lot4JURYVbEvheWNbU+0hbQ1N168qhqGW8MqIVqUHzaxfJppusSB6Fp4ZZuB7K3t2lFL
	KnWD7IUmC0R18lao30Xb6nZWk1c4ZB8XJU2qY16xjgFPXj9XB98BfZBDLSREDZh/+TRHxXlA5YKAx
	3hM6YHv7QBkamycjNPHTSV//ocg9S7k14hTOub15reotdLAzwtGeBp3zPMoGdV6qed5xqbw8C6q9i
	/eosPC6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tybXO-0000000FRFZ-0upi;
	Sat, 29 Mar 2025 19:08:10 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tybOy-0000000FPzd-2iH9;
	Sat, 29 Mar 2025 18:59:29 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5e5c9662131so4971896a12.3;
        Sat, 29 Mar 2025 11:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1743274766; x=1743879566; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yHjnimUXRB9yqs2JrX76wgCEkUn1WbBc4dXkc5jfVng=;
        b=LViaFSQ8hTP20DwGJsirioJO/rltd/6Ug77BVoSDXUw3JfSfMl78B0ZeQKwn9WDy6S
         Wfn74vBcQfs2vvZZTlsjmLU3eYbty24vS5Qng0Hz/GDTtmzy9IqCJT40ivcCIP3+rm+C
         GtgRf2Tb+xwResRFUcsdACEXfCBx0VB54be+SIZUuxx6XTvEesybP6Z8IDAb1Nd9gpRZ
         YGOE0BHruiXMZyZ8PA5chYT1QD2X21z5Gl7oQ9Bj1B6YIT2EPh+z8bOSwtyZ00OaJI+6
         fvVqSco3FZUXz2ODtHT4PHQG2BVC1zU6iQdMEDExSjAhz6w3OyiXk20uztfk2fAnigqq
         7x/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743274766; x=1743879566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yHjnimUXRB9yqs2JrX76wgCEkUn1WbBc4dXkc5jfVng=;
        b=Dtj9PQvxiObWWevZ1s92bA8mPrvi7t/IuT2cQm5w/JvbdDUDLuRNGGwdx0Dz1C18Zp
         7TmyaF3QGpDQyAAjiEK9+U0J5Yfctrli3bGmUEHKFGpq9Y7M/UC4FBt/uz1S8JrshI5S
         zIz/IWGvRMLF/HGduGWg+s5f2gu/MfsdJbYiJ5G6BDQ4/j9DxNC5J3vCmwVOuDllsIJV
         Tzz3eRH5Iu7epCzK+XADUPCH/DfMisXJJaIOhk+BOGF0FF+6M+66BiCogksBA2egjRji
         oEf/zvqyATIQjDSiP+OC8aq28tDYXwZzqEqNcKbvK9yw2KqAlukb9FoSpSNsEyZjh60i
         M1Bg==
X-Gm-Message-State: AOJu0YxYitpFZpj84UToR3map7IBhyFxwTT9BWv2mzJHWK89bfgKS+Dc
	XX/HvZZUAinksmyZKwNSHuDrXYeJiKuR56x1STgdLOum2c7In/vOC3m3gA==
X-Gm-Gg: ASbGnctkdNkDHd47Ln5z2vMrtmXRmTpAVwO+DBdGzyx324qe5cxokt4e+qY7gxf8F7G
	AdMxcC4Ag47V/kx+JPciiaNEqYwBysag2/MPZ8hXYhWi1ZC0O4iXFkJB9hGXbhn70uXN0k7Cw6m
	piBgypPUsmkmkpFvBsK1l0icCdvwkFBnLzyyxF4i222RnW5Zjmz5Lbnrf3Y+avJZvpddrGS9J8t
	1rs/aFb5FpQxkpS2+Yf39qkqhTjtvnr/iuKChuexw61Bzkj7FC2gGxWWk3Gwb3zRLMH/Cnwjsx1
	qLAT7tv+MaFhJ7XmRAPpJ3Vnah8qz7miQzGj7hqkO7Wt7hLf01CBMgAfHjfpigojWW1vyDQ/UII
	28lCAgrQHb+LgNGtAzUS8ucXLJ7nwyjZME78XrF9FbVcpb5N8Qg8Nph3FIyNlp/IjUhDVN9QT4d
	LsyynM
X-Google-Smtp-Source: AGHT+IFWI6IwRE1qRMFr432PaEFmBmF6a/bj6HZe2GViLF3Hz14MG35bIU/UGxCXhgixCty/+QMSGQ==
X-Received: by 2002:a17:906:7955:b0:abf:4bde:51b1 with SMTP id a640c23a62f3a-ac738a4bf32mr302869766b.21.1743274766374;
        Sat, 29 Mar 2025 11:59:26 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ad73-6800-0000-0000-0000-0e63.310.pool.telefonica.de. [2a02:3100:ad73:6800::e63])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-ac7196dd46asm364497866b.160.2025.03.29.11.59.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Mar 2025 11:59:24 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	jbrunet@baylibre.com,
	khilman@baylibre.com,
	neil.armstrong@linaro.org,
	christianshewitt@gmail.com,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 4/7] arm64: dts: amlogic: gxl: enable UART RX and TX pull up by default
Date: Sat, 29 Mar 2025 19:58:52 +0100
Message-ID: <20250329185855.854186-5-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250329185855.854186-1-martin.blumenstingl@googlemail.com>
References: <20250329185855.854186-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250329_115928_684625_A1F13A31 
X-CRM114-Status: GOOD (  12.85  )
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

Some boards have noise on the UART RX line when the UART pins are not
connected to another device (such as an USB UART adapter). This can
be addressed by using a pull up resistor. Not all boards may provide
such a pull up resistor on the PCB so enable the SoC's pull-up on the
UART RX and TX pads by default. This matches the default (from u-boot
or SoC hardware) state for the pinmux configuration on these pads.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
index 2dc2fdaecf9f..460c46cfad6a 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
@@ -163,7 +163,7 @@ uart_ao_a_pins: uart_ao_a {
 			mux {
 				groups = "uart_tx_ao_a", "uart_rx_ao_a";
 				function = "uart_ao";
-				bias-disable;
+				bias-pull-up;
 			};
 		};
 
@@ -180,7 +180,7 @@ uart_ao_b_pins: uart_ao_b {
 			mux {
 				groups = "uart_tx_ao_b", "uart_rx_ao_b";
 				function = "uart_ao_b";
-				bias-disable;
+				bias-pull-up;
 			};
 		};
 
@@ -188,7 +188,7 @@ uart_ao_b_0_1_pins: uart_ao_b_0_1 {
 			mux {
 				groups = "uart_tx_ao_b_0", "uart_rx_ao_b_1";
 				function = "uart_ao_b";
-				bias-disable;
+				bias-pull-up;
 			};
 		};
 
@@ -522,7 +522,7 @@ mux {
 				groups = "uart_tx_a",
 				       "uart_rx_a";
 				function = "uart_a";
-				bias-disable;
+				bias-pull-up;
 			};
 		};
 
@@ -540,7 +540,7 @@ mux {
 				groups = "uart_tx_b",
 				       "uart_rx_b";
 				function = "uart_b";
-				bias-disable;
+				bias-pull-up;
 			};
 		};
 
@@ -558,7 +558,7 @@ mux {
 				groups = "uart_tx_c",
 				       "uart_rx_c";
 				function = "uart_c";
-				bias-disable;
+				bias-pull-up;
 			};
 		};
 
-- 
2.49.0


