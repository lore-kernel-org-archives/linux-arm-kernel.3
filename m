Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED76EC5DF87
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 09:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lP0X+h9e7/fNZIF32Rt952fZ5LhoAYl7zja0UrW/vTk=; b=U7PYPZy51RbiE7ldGrgh0lBZMb
	pBJHiaDDwZzpTmsPb5yVKBliDQ89lHYkbN/10ShVKK+dkJ69T4xmWixHccliIrtF0JlUhX+aDeLSL
	MH/qkZIqx4XLlUlVeGknmpaEzpW7ulIPY1TbO14H7DILiylf/TYT8fj9UgOAp4KpdSyVkGyE2cb3Q
	5oSCRMMQMJ3P0abwRzeFEm4AKCrqnScm17wqYTLlFRf4Y4Oj0aRfKOlZW+afQeFY9S+zjJmjfYl8t
	ofbe6SFxT2WS2kBjNqGmz4cISv/om7c+hqiAY//ogNEHL8oN9L2AQzK4r65iQHLs79KOTmyc4UJX5
	Um//XKfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwytq-0000000BEww-2LDW;
	Thu, 20 Aug 2026 09:17:26 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwytm-0000000BEtq-2W3z
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 09:17:23 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso5991005e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 02:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1787217441; x=1787822241; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lP0X+h9e7/fNZIF32Rt952fZ5LhoAYl7zja0UrW/vTk=;
        b=ix7bVMRKtHRL8ZaJS67/blT9XxKpgFWpX2He//bZhJstU/BNO/f8qXlzD8NCBqBcjY
         Pu7/tZCV5rkdGFzXTWgrt7Xah69FhiZKj8zZFZm4R00v9YJt/SVv4HVcoBPpYEn+D+4r
         prO94ZOiG/N+axDgbFVg3ZNxbxMFpgLbeCOkY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787217441; x=1787822241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lP0X+h9e7/fNZIF32Rt952fZ5LhoAYl7zja0UrW/vTk=;
        b=Xe7JxgNONN3xkRGtViwdsQJf5dcBhurY03lOziXBUXO56rGz5tYsFW9vtben/vyoCV
         S4Ap06oldc8zOVJtN5y0Rae7Fw4h+K/QlgczK/Jn2fzRcB+UaGUn+uJySp8bSynDwafo
         fNHWSWxzRJWq4uRX0532Gckw3Zktt3O6eGDa8VPiN8AICAFyJYdmLig7kGa6SCkaP4fh
         anfkJShVizAXrxhfDDdxDattZbBnI5zIqU7Fb2OW3jujCys9M0StF5yWfjVyHa1gD/VQ
         lsTyUN0B4SRI4x7QiKA2/e7kQgaOipu+dOUwvliTdjSNeS5EkzQ2EDeGKXKLL5GsmQbM
         N9fQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr4F2tVCcCjZ5FLvD2gzzvu4yInjLzfUBZe7k1dUg5t+F7HkGW0qtsQ7mxN9kU4FKcibPcJb7U8SE5jCkEs5RjW@lists.infradead.org
X-Gm-Message-State: AOJu0YxmTfGFJwDhgMaqfaIc8rTAPd8LKO3P+nA0z2qVyj5mv3ayUKCC
	wUKKiPyBZ9ZTvnL8cILIJj1ejtapmalxce23OfGunCKrqE1t2AhOjbilfA6psze8kU4=
X-Gm-Gg: AR+sD10wtCoI1uxDiFozIrmEzKbrnzGu82OoWeynxjJbFMytQZ6VoS4+eENu4Clt1If
	ubi07cXa/fwBrrHkHsuig4zOJP8d53T6kKg6XrXY0cIh9tJV8AGR0d7JWxwd54qCEUomtFP6C3d
	cuSpzSrPmlavpkUdoKNc9tAUbjElQjeOEDYKsdiw8aFzZIk5yGwYUyb7r9dSVxgxTLNMyHErOSa
	hqiymvUYGuODRNnCatZudu5mz3QkwXvCp/P/FvDpxLS4E8KF9Lqdkt3otr9gL8N7CMZwLApkfDT
	Sse1ytiki0MkoMTY4XVgqKdxzq83ApE+E5p1yZoDwMidR53U9oCFXiOqCLRvN5mI/TM/1fqjED0
	pMz+4ila0im3aHL/znDWrCn5kC3zePXUu7Ji337RGeKzW0LDRTc5N4+hG7BrotiGq36X/oh2MjG
	iRGiDZXF5KGC8Cm1t/54UQMRatWOSCMX2EJJen60PK56cJdpJ7rH9Sl2Cfq5D2cLtXIUMy4U9U3
	MloSRFWVPV5sLGjvw3uup0jvhprHgKPSRze0PKQRIt5mvwklyJVuEf7t0HtUW1dhmeZ/7jXs1RX
	MuMcOeekm8Snz3al1dMU6Ibk/WM3oC5KRUBvJGT41zJZ3eKdOajy38ZuN+ODPw==
X-Received: by 2002:a05:600c:a11:b0:499:a0a5:e13f with SMTP id 5b1f17b1804b1-499b06a5952mr46947375e9.2.1787217440660;
        Thu, 20 Aug 2026 02:17:20 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-54-86-139.retail.telecomitalia.it. [79.54.86.139])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14c3775sm10021606f8f.26.2026.08.20.02.17.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 02:17:20 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: alexandre.torgue@foss.st.com,
	francesco.utel@engicam.com,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	domenico.acri@engicam.com,
	michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v8 06/16] arm64: dts: st: add i2c1 pins for stm32mp25
Date: Thu, 20 Aug 2026 11:12:14 +0200
Message-ID: <20260820091652.43541-7-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820091652.43541-1-dario.binacchi@amarulasolutions.com>
References: <20260820091652.43541-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_021722_652503_71DADA44 
X-CRM114-Status: GOOD (  10.48  )
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

Add the i2c1 pins used on MicroGEA-STM32MP257D-RMM board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index 456ece7f8ebc..db485b9ed904 100644
--- a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
@@ -203,6 +203,25 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	i2c1_pins_a: i2c1-0 {
+		pins {
+			pinmux = <STM32_PINMUX('G', 13, AF9)>, /* I2C1_SCL */
+				 <STM32_PINMUX('A', 2, AF10)>; /* I2C1_SDA */
+			bias-disable;
+			drive-open-drain;
+			slew-rate = <0>;
+		};
+	};
+
+	/omit-if-no-ref/
+	i2c1_sleep_pins_a: i2c1-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('G', 13, ANALOG)>, /* I2C1_SCL */
+				 <STM32_PINMUX('A', 2, ANALOG)>; /* I2C1_SDA */
+		};
+	};
+
 	/omit-if-no-ref/
 	i2c2_pins_a: i2c2-0 {
 		pins {
-- 
2.43.0


