Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E824C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 21:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e+B3F6T5itIIw6Fea+hP0fYMEiq/rD2eFXwlu5ekNYU=; b=1ngGpXUPYm2vJLbsHy6sqWXl37
	BdYA3t/aaHY0LH3HjWd9Peg71pUx+Qei64RpOohtes1VgD/jMsBmFIvy9t3Rv/ChzaeJln1lYIBS2
	nYxtIVQnpM9CL3KU5eU1+74oaJDvLpbhCfiElmj3Tsf4BnyB6PvePUzXB9dici0DS83+Ssi7DV5DK
	w8W6aGRx1LaOqZdanF87tJUYdcv4lzuzvA9FHBIW1O5XP4gQG3+6GuXL02Pfyuqzjrp1jxt8ekZdh
	T69u5Hh1MBQrDQ2zXUnoDQmGp7VoOIt+z/FpcKEJpa02gnCfPXs8UnfY46eyA41H7+Rb132Fqhe3q
	11MDRXIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSjgm-0000000Gewy-1JgK;
	Fri, 20 Jun 2025 21:54:24 +0000
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSjNs-0000000GcnU-3GHu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 21:34:53 +0000
Received: by mail-il1-x136.google.com with SMTP id e9e14a558f8ab-3ddd68aeb4fso23705985ab.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Jun 2025 14:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750455291; x=1751060091; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e+B3F6T5itIIw6Fea+hP0fYMEiq/rD2eFXwlu5ekNYU=;
        b=gvGePlzitowd6TO7rQf2ZF/m8V8rTN20/QlaAtE+P3FPDCB0V4jMtfobXaN7ZJuhJW
         I7oYczeaAwT2KwhXRLZzPNbBD2TSsCbOvBETFVLwo6ptV1xNtHejC2BynWe20wgEX01B
         ClAhOkbkeDNsDB/fj+UQFMwoJqSAt31iTnPzNbQLqjriuRPJIKuGoL8sf92T77GiO8Yp
         G/1zU1JEGAXlXXctQg9fWGDo5d+EwmlVQ6zUYF7KkHcsEMCcIVT73xPGClAvtH13F/nq
         HYH33/cgN6qyawpwH1rWzw3KgyQ6xBHem4TEAqjT0pgShAzocTKG6gaCvHg71D3Ing9e
         M1AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750455291; x=1751060091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e+B3F6T5itIIw6Fea+hP0fYMEiq/rD2eFXwlu5ekNYU=;
        b=pBIHzg/CYFtFv8t34i8ZSyoKozvAV5YiUGABVGgw55cdHO+akY4Ns6v7h4vmflo5U1
         ztb8YEq+/7TQbAJUqmeVjDwUsxunx0GP570mcKOMHxy3LFlDHPM8BBA/oN+pz4sn7VdR
         PnGtiaRUqpv++ALaSkJQVq6+u5fhsDqAv0seHNAJ7WQNDdr6ZnpObBQeNCSFn3QCsYLj
         2S8nyQ7nQaxF4FxI8dvAVe25jWpH6MvyTCZ2idem+8SCFjrVBpbnSf/rAaFFLbCfgmKV
         WeBGNICSmnQDjbbXVVDd7XSqHFCqlk+lMgDrSd0CNBfFMVTGj/qr3AQm1XzfR/PMkOiX
         wawg==
X-Gm-Message-State: AOJu0Yw2HCe0GhN1lcFoq2kgJPn84QgZHPd0s5to6kjzUQ5D4yg1wP8A
	UUqJ/CRmZAbsvRF3BBiW1+K0Op3oV9PiFIM7JvNUBAjFoF+7Nuigne65S/XZYw==
X-Gm-Gg: ASbGncuz8N/1AUGnSZDHtI2KGOGmawIRd9v/qAFsdzqSuZWHU3uSvvwvNWlT6btuG9X
	Qel/M0cQq63kxFBTY7Wx0rjZ4PskJ5xK29dw8Hi7aRXzNKmts3F3om3kC2LPc8FlaSKdKofhIdW
	AG4hy3ENQbWdbBqnkcrbxV3ldVOvGTm9rJxpxA89wpYvACfTvBMlCC26EZJrDJZg/2h3UxEf+7K
	3ro5WytsVMw1eBai/J8SwlHPtIbQ0tnssoH0t1GErSHnJRw8elF4EJmRkSRrz6ShLI2leqGdI3E
	8QVj7G+kC78DLaBcitF/EMXDZNXhLdTL7YD4MdYlK81djG9zrXj7fWAq25PRnAtwIPQCALBN9mx
	3ObCSTHT4h4gxtO2uJLnC4nM5ltvTKIn1Qd71SYOB7icO8qM=
X-Google-Smtp-Source: AGHT+IEWnxZaEsUoXIyBXQdtG3ofERkIZgoD94IDVPmbvQCBnUrK9o6S+P5EUx9I2ltMG/Cyr6ePaw==
X-Received: by 2002:a05:6e02:174d:b0:3db:754c:63b with SMTP id e9e14a558f8ab-3de38ca55cbmr47468705ab.12.1750455291583;
        Fri, 20 Jun 2025 14:34:51 -0700 (PDT)
Received: from aford-System-Version.. (c-75-72-162-184.hsd1.mn.comcast.net. [75.72.162.184])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5019e0d03e7sm546707173.139.2025.06.20.14.34.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 14:34:51 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: aford@beaconembedded.com,
	Adam Ford <aford173@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: imx8mn-beacon: Fix HS400 USDHC clock speed
Date: Fri, 20 Jun 2025 16:34:46 -0500
Message-ID: <20250620213447.56392-2-aford173@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250620213447.56392-1-aford173@gmail.com>
References: <20250620213447.56392-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_143452_813973_D8E2F0DD 
X-CRM114-Status: UNSURE (   8.90  )
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

The reference manual for the i.MX8MN states the clock rate in
MMC mode is 1/2 of the input clock, therefore to properly run
at HS400 rates, the input clock must be 400MHz to operate at
200MHz.  Currently the clock is set to 200MHz which is half the
rate it should be, so the throughput is half of what it should be
for HS400 operation.

Fixes: 36ca3c8ccb53 ("arm64: dts: imx: Add Beacon i.MX8M Nano development kit")
Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi
index 67a99383a632..917b7d0007a7 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi
@@ -305,6 +305,8 @@ &usdhc3 {
 	pinctrl-0 = <&pinctrl_usdhc3>;
 	pinctrl-1 = <&pinctrl_usdhc3_100mhz>;
 	pinctrl-2 = <&pinctrl_usdhc3_200mhz>;
+	assigned-clocks = <&clk IMX8MN_CLK_USDHC3>;
+	assigned-clock-rates = <400000000>;
 	bus-width = <8>;
 	non-removable;
 	status = "okay";
-- 
2.48.1


