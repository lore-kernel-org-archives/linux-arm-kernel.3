Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93974C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 09:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T9Lo43FKv0UzNv+DqheKNJ0v2vJAyWuHFwECjygzQOw=; b=JvLM85vRoPvurPoSiDRXGR0PeI
	NVJP+NGT//PfNRZSwKqGsPmbZN4cJQS1xXJqKq/0FUI+/ZdDrsdRDAfA2xasJ4EL81RUF3uGpE6xN
	NscSGCAJF4eFlXpOiaIbv4DhL4BhqkGjREqGLVNYZAnAdcUAeGsE1bwaC3T0z7Fb1hedI3WT2dBNx
	8ZBzv3pcXv3MGbgpHZ2BIC6LXjIcGf1uWy76ET4EsQyGGVXXMBCuKa+wlD7kGWmCxO94fNKIlMsAR
	DijGmG9WvaiE08GNwAXqbW3x6Yed+/9OmsFKltG0zceyDt4/2bz5n8524qTLCk7uZedXyy5MSU1te
	Yz5Jk6Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weUku-0000000GQVH-3KaK;
	Tue, 30 Jun 2026 09:27:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weUk9-0000000GPjF-3ZME
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 30 Jun 2026 09:27:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=T9Lo43FKv0UzNv+DqheKNJ0v2vJAyWuHFwECjygzQOw=; b=Ouyk4aYrUKocQwn6FlL1+HVvRB
	AV9DWmUjoODgkUHQPYj9Mgu5pMnNRZHchKbto9YFH5+Jnh7spJsE4y0Xj+rOw7xd+k366ElNj4t42
	z0OH4jSzSCO0Obxevot9Zb5VQOiT4jj82HcZDxvxn3lNwPoXdcoAqTIwswZDosy2eRkkLnyo/6F2E
	oVDmcrWBFxbi09sKoP9mKUm3k5pUZsKbEjda5evkL0vJ6xonEe+HMYxIsgYW+FU8gDdAj2kXB6Nih
	jLI9zejSHCL4jn8+JxNSPxlrX6fWBD/WZ0MIda5tm1khsjklE226amcEepUyDA0HOZeCdgJ71AFZx
	T4rhnmAw==;
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1weUk2-00000001hxg-0YIi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 09:26:56 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-4720f3bf164so216768f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 02:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1782811612; x=1783416412; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T9Lo43FKv0UzNv+DqheKNJ0v2vJAyWuHFwECjygzQOw=;
        b=gvpQmOxlDbx2ha3ZVRY90mh7Asc4Zv0+T/iG+juoH6fcmvCsKzSQhPP3oLig7vhmlp
         +uxUHMUYISsjYjL64p16l0V9h3PgGcsKOs2cBBg1/IIHbWcSeUdON5wIGaOkqIUWHoM6
         1jC0784YSSRcb9CukaTykGgYlhFBQotCuH794=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782811612; x=1783416412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T9Lo43FKv0UzNv+DqheKNJ0v2vJAyWuHFwECjygzQOw=;
        b=iwrUr9c3YRa7EtmxWxFZT2qozPslsMdOV+t8MKjsxaWx3t4LdfxvQmV/jtlfHNDKCq
         S/53Zb4e6xSXesl/duJqFpxCzI60thFVVNEp4T1ThcE/zIWzRroBMdt7YbXzlrC4kH9U
         ra0KNUefNamQn1lXLRep/ss7nBscnB4iZAyb4U1+Va4C3AZyTt1/SE58sGkFFI4ORIRw
         K6OeGf2JHQtrwXK2DP4mipGkizEMzscrUR+ZYGTfIWaxN8STWgnzS4Qd0BZ31nfNK2vv
         AuRYDVLnRKrosvYMbkPC0XkpB/CFcG8kWXh4jHCJ0pCOWlTLkruPOLpgAJ2ly6u9pVN3
         pTCA==
X-Forwarded-Encrypted: i=1; AHgh+Ro+UuTmqTU13xhgwWGivOXKVJt7whieuQQGH/0ffdQK65v6oMFF2T7jnosFSKHg0fyAMbJ1LSUW2GxDOQTfUWLO@lists.infradead.org
X-Gm-Message-State: AOJu0YwA1fw9oX/UAe2N1axnPrPBDhzdwe1g0PYtZnoQU0zjV04rjT0J
	e/YV+xgVjnAa/V/WWv2p4grcc/rc/xIM5Wh+XmmUCXxKxVo3B/oj46T9d+UY97fE/Ns=
X-Gm-Gg: AfdE7cl7WyjAbGv/pQS8zge9xaIUu2yFuBUvhB3+09647WrCI88+PN2DOMZXaTkNpAg
	3H4UgIjkL9B2lbF3pYUN9UgCk0PKfesYC35aRqtDlFb6E2OhOIS4wcuzZ7KPKJzXawydqAlD/eX
	DVljT5FCIf3qUi+Mk4uzJYrYvfU7aklnKeye33Tfp9TF9OIXY+jXjYV3TtrcJuQDs4rC94DaHC3
	dcc6tI+fNGRw7TTgO/VLZqR87Bj1ZnDsV42wjINAnsd8VKe23p8FkZYs9hs9XdvbvZ5cTE4YLe4
	P82z7OP3p2MNihM1pYsaTRzIN6P681oKIUAoYFAQq4wXq35+kb+oViGExKINg1pNCTbBu64t+Cj
	mjKzsfCkP4SRnOOkN76jJcxRCEP8Djg9Ldm0LZa85/vwLWumQK2qSfzX+JnpDaJjLONnjSzDeWz
	qZ+72gtWB7pwq3GKrWhb3wLH2SofFTcFG0UiWXGtzxT+ox0sWqyUU6la8yk4Z60tdsiIfZOaMpO
	zg79YMPAW2UgxB1x1ASfY9WbLPV6tk7W36U+aBhShb/Vj/ecNVz+yyVI/3/8Ig/pkmM/RpidrtQ
	ZZAKblII2sKGXA==
X-Received: by 2002:a05:6000:2dc8:b0:474:c3a5:4132 with SMTP id ffacd0b85a97d-475de54e0c8mr1597205f8f.9.1782811612406;
        Tue, 30 Jun 2026 02:26:52 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-82-48-44-238.retail.telecomitalia.it. [82.48.44.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47567a6f0ddsm5669083f8f.37.2026.06.30.02.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 02:26:52 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	francesco.utel@engicam.com,
	michael@amarulasolutions.com,
	domenico.acri@engicam.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v6 10/16] arm64: dts: st: add sai1 pins for stm32mp25
Date: Tue, 30 Jun 2026 11:24:39 +0200
Message-ID: <20260630092628.1695560-11-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630092628.1695560-1-dario.binacchi@amarulasolutions.com>
References: <20260630092628.1695560-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_102654_586207_EB446E14 
X-CRM114-Status: GOOD (  10.18  )
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

Add the sai1 pins used on MicroGEA-STM32MP257-RMM board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index 695c9d771853..002fbc724b9d 100644
--- a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
@@ -520,6 +520,51 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	sai1a_pins_a: sai1a-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('D', 9, AF3)>, /* SAI1_SD_A */
+				 <STM32_PINMUX('D', 8, AF3)>, /* SAI1_FS_A */
+				 <STM32_PINMUX('D', 10, AF3)>; /* SAI1_SCK_A */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <1>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('D', 11, AF3)>; /* SAI1_MCLK_A */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <2>;
+		};
+	};
+
+	/omit-if-no-ref/
+	sai1a_sleep_pins_a: sai1a-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('D', 9, ANALOG)>, /* SAI1_SD_A */
+				 <STM32_PINMUX('D', 8, ANALOG)>, /* SAI1_FS_A */
+				 <STM32_PINMUX('D', 10, ANALOG)>, /* SAI1_SCK_A */
+				 <STM32_PINMUX('D', 11, ANALOG)>; /* SAI1_MCLK_A */
+		};
+	};
+
+	/omit-if-no-ref/
+	sai1b_pins_a: sai1b-0 {
+		pins {
+			pinmux = <STM32_PINMUX('D', 4, AF4)>; /* SAI1_SD_B */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+	};
+
+	/omit-if-no-ref/
+	sai1b_sleep_pins_a: sai1b-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('D', 4, ANALOG)>; /* SAI1_SD_B */
+		};
+	};
+
 	/omit-if-no-ref/
 	sdmmc1_b4_pins_a: sdmmc1-b4-0 {
 		pins1 {
-- 
2.43.0


