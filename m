Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51BE8CD4F4A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 14:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PrnO7x0GW4jDpO7hgVq4BogGg8ikec+SImnjIW54cFk=; b=eDcWlUUBUC5uZTUVx07NHGMD7D
	nUpLkPHv8J8zuwYYfZ9cEaIbfgzt1HZCHESCQS08Zp5j8J5p/0tO3TVsADuvZjCsDb5JEmoMKbOHF
	OEjmy8yg1319QdLtVmBaFeyIRaDtkVzO/gfD8P2BSMsopLBMT0EqtjCv9r7AAFvTFVO62Qr9FH6dJ
	r8dp3pzs9uAzX2r9Ii88QJn9nPGT5UWZ0KXSpo+LpAN5mmDAZHlun8QgH4LK6g7inMFUf2U1VqvNZ
	+GWDb+57HZnyujtsL2eSG/HuvYidZD+H1kxBjvl6RI1xnP1meAVADtBkiMLztaPRiyIHk39KiJS5J
	j60SWltg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOz15-0000000FzIu-10b1;
	Mon, 18 May 2026 14:32:23 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOz0u-0000000Fz97-0HqP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 14:32:13 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-67be871ed3fso5518899a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 07:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1779114730; x=1779719530; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PrnO7x0GW4jDpO7hgVq4BogGg8ikec+SImnjIW54cFk=;
        b=Z8fNHnUV4IpempUMl8fkIE8rNOdo7L42vreYs1NLoADDsH4W/oJePa9vFtaCYP6euZ
         Lwv1yrxgH2q05VgJ/9PLrsw1sMx10LALvORyXcPeQkRR0Jd/EQXuAmdPqrq7MiW25vNo
         j4LAS7oMz9FoNKwMidomnrXKoadVWLU3sM1ko=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779114730; x=1779719530;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PrnO7x0GW4jDpO7hgVq4BogGg8ikec+SImnjIW54cFk=;
        b=iyhhlwwNH1hSXAvh4vI6U0Feq1ddYlqZjlS8hRJcOKxOG41dWDQ48d3VoaCC8Mu4Uw
         N2H2MBLmEmkKXHIMFR0t7LwmZCwD/vmPuH28ysWluTd7ZNgLH1ojB7xIskM1ETIl4jOx
         M0xlgHxa4phZ0SmkP21zBZXRLJoM2V9BazHZV8KEbEyebgLyRKiuseAaZEMk7dbs0Cv4
         p9HE035syKuzYFu2o1WjSSEWjXNfxtK+z+KcyEzn1G4Lxzrbc2d2FE2bu2r02ozfgzOH
         SSBgzvcY6+7dT8JlZBxjOScPK84ILxc2MiY+MpgQ8Umwe+Yf2cN/pUgarkX04cDQNqRW
         OPYA==
X-Forwarded-Encrypted: i=1; AFNElJ9O6m7RI7ZIVpfa3hMwJIAT2Btf1tFjo1cC+hiTOZ7e2qbfqO4gz84C6jfrPOLtEqHV4M+ARnjIHGfrbh9/mQZD@lists.infradead.org
X-Gm-Message-State: AOJu0YzCvD9aAwLslqTBGyPC1DT2iVlzgVc64VzJajZalLh1wco26f60
	rx/KlocWZMS8Dx/aHox2WdXLADNsEYgeL26Rop7jTQTjnqu8/VPB4xmErwxPevywuZY=
X-Gm-Gg: Acq92OHzyq6ZOiteQteVbQhVh8zvgWXASb5YuwwIgxdhBhS9Iv2uUV7i12AkLpsX/3U
	DOu+2TebLLIx1/CwOdcOBW1fUUriMVh4qlFjrOJFGn9odZn/Bl330put/CUAQExIQ9ultAmHg4Q
	QslI5jdEdjmmfgfxMPPdsFLn8h5d7D/dvMggv7ZznDlpPSn+4HNuRwFzWHOsj7Z3UCoxQ9jOeFY
	y0GihRnp4XM4tICE2SkwXKqlDthD/ILITGtwdDVEJcwUNC9zVloDi3ivvpRjLvMOSbs2NWnBT7C
	rVZCSsZo6SCZsIFe2ePyYSgnW90ynwZes9Kl7CwioZU6Vp6Z0Vhqw+JyxNrHuNahMDjMSE7m6Qi
	l8AMrs5mxphy+yVv/ZYduzP53XZBZmQ7zhtA57ER/nHvna8KizjfR2gbsGxQMru9TfGiKO28DKn
	T/cabPp64er4eGQUTo2NCPCOoZgXm0VtvI4r/AygTGTGTzJY/AvMmrpAE13DsUsiDagb94xa5WQ
	jGhrG4wOVcAZCQiAONuBgoklmwdXEB8I1gkM6ldR5fPD8HZuOhBAkZRwRo=
X-Received: by 2002:a17:907:d18:b0:bc5:1e2d:fc53 with SMTP id a640c23a62f3a-bd517961cdbmr792821966b.27.1779114730073;
        Mon, 18 May 2026 07:32:10 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.43.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a1aeafsm39564572f8f.23.2026.05.18.07.32.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 07:32:09 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	domenico.acri@engicam.com,
	francesco.utel@engicam.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 06/15] arm64: dts: st: add can1 pins for stm32mp25
Date: Mon, 18 May 2026 16:31:21 +0200
Message-ID: <20260518143150.3138712-7-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260518143150.3138712-1-dario.binacchi@amarulasolutions.com>
References: <20260518143150.3138712-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_073212_160064_9B197616 
X-CRM114-Status: GOOD (  10.84  )
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

Add the can1 pins used on MicroGEA-STM32MP257-RMM board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index 05bd07a0a561..4be01a6574c7 100644
--- a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
@@ -331,6 +331,28 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	m_can1_pins_a: m-can1-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('B', 9, AF7)>; /* CAN1_TX */
+			slew-rate = <1>;
+			drive-push-pull;
+			bias-disable;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('B', 11, AF7)>; /* CAN1_RX */
+			bias-disable;
+		};
+	};
+
+	/omit-if-no-ref/
+	m_can1_sleep_pins_a: m-can1-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('B', 9, ANALOG)>, /* CAN1_TX */
+				 <STM32_PINMUX('B', 11, ANALOG)>; /* CAN1_RX */
+		};
+	};
+
 	/omit-if-no-ref/
 	ospi_port1_clk_pins_a: ospi-port1-clk-0 {
 		pins {
-- 
2.43.0


