Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2192ACD6E7C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 06:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DRVbzjeKV1ymytOpSDZJEn1esg8I6P0sJ/LROeeCjqc=; b=Ue+MdvWC3LwjJWX5+g7d/jmrGc
	Est85IcLHbDvWsjoSHIPF8io3JBr6GTogZFgerEQwooRW3BD0Ue3t/Jvgx5xs5AbWXvmM5bWQqq+T
	bzsnxi+NeoMqopexw0SQvCvGB704wYaCP9P2PRPv13XWPdiSXOwouMiN2YI9vNtBeOKuuS62mcJ7G
	MIytR5/XvSO+rpwLDp0X36gIbM3IuTGJzqLRli6DlGaJRCBA2X0YV7HKD4CI5pNeEVDzilEn0+saB
	EwtfjnfP/J1iW3xqatJWDHlNYLs/92dCWT/JcnFLvWvSEk/JHujuGJU25aSg2zJLIJaaUibtQWO7U
	Ok84+T/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVO3a-000000009gk-0NNc;
	Fri, 05 Jun 2026 06:29:26 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVO3X-000000009cV-2IpD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 06:29:24 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-45eeba68948so991796f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Jun 2026 23:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1780640962; x=1781245762; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DRVbzjeKV1ymytOpSDZJEn1esg8I6P0sJ/LROeeCjqc=;
        b=X3zpSV+ZksgCgrogaF3anPHwz+rDyr/0H6GK9TRiZzCsAUPzeQVE6vOWG1BskJ02Cj
         vT60LFyPh1JGLFFtFzIoFmKGxpSzOUtmD0ufWK2+BNZhl0DbXTyEGywtXooyX3PxitV0
         8RP7A//G1eJoVm9J5VFtEvYCqfKq2Tlx4qcLw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780640962; x=1781245762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DRVbzjeKV1ymytOpSDZJEn1esg8I6P0sJ/LROeeCjqc=;
        b=kl5bD8i9eoQckDfF8Qz4dl5hKJTFf5uQGnAGqqoBNP2BsDwP0ILUKS2oTKhrPjlUp+
         Ya32wJrf7hOEWUxmtB6GRwcjdVTiIXlobcv2xxdlgvtaZfBtbSsZLFXRhYX1c3FFZQ4M
         Osyh8ALblijLVzC3nuMgoSwaboKyboehu20dB+55JPfpKgG2kwzf6IUGoQfsdYObqaFg
         Ys1yTMuTZ6L8jNNInUzHLAsXCQmb+2JHTCJiIdaRd2My2vtG9jy1fCOxGlj//WwSQHj3
         nGfZE5gLhewa0TewWCfQW7ETzPPtifX9eSrHBmzRxss7qYMfYkXt52mE5gDR57AV2IAn
         VuEQ==
X-Forwarded-Encrypted: i=1; AFNElJ/fj+F4ZqfT9kbcCem73xqKVoZCjqlah9O+VV1l4MUmM/ESzFexE1nh2l6ff2QqMRDD0lbPyM5YZ0GtxO4HP7Wq@lists.infradead.org
X-Gm-Message-State: AOJu0YxFfOhpLr5M1iuDdwVLRaiCsdiC5ynx5ThmqcPTwt0eoYos92tL
	aev5AFeUtSL0o+7WUMO87pOs8FutkuHluRkoUnuXfrkCZWtPL7UpiprXUj3/ffQyccc=
X-Gm-Gg: Acq92OGNWD8Q+GuVr9OXsmlQDWrFDFd3UpHadm6Y63VFkjKfiFFSDyyS7qCz3EJP+zs
	4ljHxosKCJvNbxi8KTiNymWbwt4xJIZMYaxKGHBfWqUbRk0TePSS0oR+jrp9abdK45RehZNnd51
	uC+W+md4Qh+tqTjVzW/fHdcxQl4K4OVgbymTwtiGSb6g6oFebZ8aVYCOyYUQi+G1YAFuykQ44Nx
	62TU7MRDdM99X52H7UTDU79v6U/NPcbJ/4twxxIF1UvruoEhHXervwHbTtL2z3yqGyCJ0ce/Klq
	zykPLPsUsQIfiIjphAWOvipasv9/2Ptt/OiX4VmYVzKYkOe2TYEI0liA94lJfNpgbEqN2cIBHn1
	e3mOai0CMu/Yvb8B/Nbr17dAnV+w6z9SHhVZ97WcqZH6h7xGLPvgyy7j5f/cBqSix58+5BFIEgC
	eZE0RxbJ+Tfz14U/tOZ2Zka9HCyQHZ0TQ4AeDmON4Z7tVFCQNKMDn1Y75kX/mOKkVh4NK/VVnOH
	mOn9r5eeTt2sYHgu6/HkK340Q0etRk728uCADGsTRAiZtxkNyVbcXxB8+3eH/VTNLwsWUvT0nDU
	tM6RY3KO7J9s/83ftZvpBtMVECVWMQDonOTGR0Lu05Pg1g==
X-Received: by 2002:adf:fa89:0:b0:453:e3a1:6580 with SMTP id ffacd0b85a97d-46030501f74mr2325451f8f.25.1780640961700;
        Thu, 04 Jun 2026 23:29:21 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-82-48-44-238.retail.telecomitalia.it. [82.48.44.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344148sm23022648f8f.19.2026.06.04.23.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 23:29:21 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: domenico.acri@engicam.com,
	francesco.utel@engicam.com,
	michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v3 08/14] arm64: dts: st: add sai1 pins for stm32mp25
Date: Fri,  5 Jun 2026 08:27:36 +0200
Message-ID: <20260605062900.368376-9-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260605062900.368376-1-dario.binacchi@amarulasolutions.com>
References: <20260605062900.368376-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_232923_605218_5AC3E8A6 
X-CRM114-Status: GOOD (  10.26  )
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
index eab8ebe71660..ab1e62cf2bfc 100644
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


