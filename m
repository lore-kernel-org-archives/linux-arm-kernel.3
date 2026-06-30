Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB575C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 09:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y9eicy7qFkVmMZW611/qMDh6GaEBG59Bdrl7IT5yIvE=; b=hK+6guIoR+jnaLM5FLbM4aCKTC
	4jStSdRh7mLUmogxCFWIDlZdqf9Q5b3hi1wtA8MaoGEAEg3ODwI7Bar4Dvc8OxoraAmawM+zur1te
	oy59H1VqHr8c4g/JH7yyeU6bAKRzgZBV54JR7movgiZO3TaGzwXgT7rNTugJg+N7lFK3f0dwSKCP/
	kIpNIk+lgiWzVPBUHcG3rZCdU+ebRx7MiFbkeMtGMmiJ4am/eJo/hEVak26XP3+kK835nIrClHrl4
	82+m86Qz0VCNN/NRJtc4MsixBkQBysxIeH5g9zRXGDYoFJSGKfVwIKRPB7jz/xNdMtb7xd8PKZO1O
	pvkwEmfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weUkB-0000000GPmA-2bjz;
	Tue, 30 Jun 2026 09:27:03 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weUk0-0000000GPYz-3Iy0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 09:26:53 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-47248615e4dso2555434f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 02:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1782811611; x=1783416411; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y9eicy7qFkVmMZW611/qMDh6GaEBG59Bdrl7IT5yIvE=;
        b=SO8O+R75LJuHYveEbOw1gUAbEad2H3V/GHvMqJK6U6g9oYKXO7ZYkIaK87x3iA/wSI
         SRS8urRcYitT3HePr5choV9oytUS9GIqn01le4CYgWQQiL8qyX9RqGLbTD9OUgrhuPrE
         1UMKRFB//h60C7u3Omn8Ey2uNeTd+J2dsPi/U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782811611; x=1783416411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y9eicy7qFkVmMZW611/qMDh6GaEBG59Bdrl7IT5yIvE=;
        b=YuaGJ8e3b7aOIQkhtAld1Gc4zbSakEnDUb3A42mFBv8Mizffptwv3JnSWYGtpmRIhS
         WfWX+JHsB0W/+FidJXxydQ4dSdUX4/IjmgKDJWcj+ge9J3KlBQ7oJju1ITeLqD5A3qdz
         snEoGTTingGqkuRUdQiLFAynmzXfLFt1iVZCvPSQsZ0nQgP2Rdczg9tasY8tDThtWtFZ
         tD5UnuSNXyyJ/GPnP17ApL1qQZui7y6lckk9XuXEwEcKDd3Yt/V0HWLrMMmcYVZxawBB
         bBE1Mby6CDCiRCqU/8C+CfI5XqXhuzAhf0kHjsZUsxzGBDs/EnXfcyuzS404uO25wqjT
         uiqg==
X-Forwarded-Encrypted: i=1; AHgh+RqHevzmiXSw/S6LuIXsYNrS0n4UocTdZL2PbUA50xiXwvHUy5RKKkUEtK7EZQh9fmlmWot4HurVUqK3L5/0maNu@lists.infradead.org
X-Gm-Message-State: AOJu0YzEqngH2/4q1FBo8Lzpp+VnQNA5hFoCU/Ym+u6Kmwr4PEtXK3rS
	8j+v1CEiK10GBXkuRnuWwK8jn7hFTROw7TbZK9ioI+PeNZbE9MP8cAwVSxve0CPOmyY=
X-Gm-Gg: AfdE7cms876w5LxT7v4IgxtJ7y1Pw3njfqFhKC25dABQ1zcMT4Gq4kdJ/HvdPzLUhAc
	pRUZHRu2Zs59NQzWFW27mN8D6QVbXLNHFDCXKi0bZExCHzFqhR+PQB4VmQxnnGhUGdgGhQauZJF
	h3Pse9ddf0m8XM94lGwtHKl5VbgXnGAQDnXTG9yNhL5PYL0P8oPz1cDLNV8sw0oDJodhJlq4Oqy
	dSvAEzuwXC70HOZYH4Yrxk5aSCnFHeaFsFqYBgdwxYkjIb6/afQBWzgbRnkv9vJt0wCOAydFjVS
	jGIwthRJ2KYeT+LiwiSrivI5Vlcd00EgjZ6y1BI+ouoqzDgK2kTU0e2B+pkJKpb+yV15cqqhY/d
	jpmkR65F3WZ+O46Loflx9JjVp3ePigrNYcYe8XW3kUSVvcOQhDIM5f+evPQ2rFjnlADG0FQmSNR
	g5VM1AhYZQhrGF3YtC9WjNJykmNmUexwFfiaICORNmoXw64VoNiovf8pF/N8ID99lONHDL1dBKw
	K0OXi4se5a6if1xu5DtU/nIi0rUs1fX2qKfrFy0eU4biQOZemZ9pb29z2ZgtHsAO9mix7GQfBeo
	nj7Sn8P8+7ZHiw==
X-Received: by 2002:a5d:5d89:0:b0:46e:8226:96ba with SMTP id ffacd0b85a97d-475507de518mr3819022f8f.13.1782811610975;
        Tue, 30 Jun 2026 02:26:50 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-82-48-44-238.retail.telecomitalia.it. [82.48.44.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47567a6f0ddsm5669083f8f.37.2026.06.30.02.26.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 02:26:50 -0700 (PDT)
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
Subject: [PATCH v6 09/16] arm64: dts: st: add pwm2/pwm4 pins for stm32mp25
Date: Tue, 30 Jun 2026 11:24:38 +0200
Message-ID: <20260630092628.1695560-10-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630092628.1695560-1-dario.binacchi@amarulasolutions.com>
References: <20260630092628.1695560-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_022652_849928_55EE8904 
X-CRM114-Status: GOOD (  10.42  )
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

Add the pwm2 and pwm4 pins used on MicroGEA-STM32MP257-RMM board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index 6482dd47e977..695c9d771853 100644
--- a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
@@ -433,6 +433,23 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	pwm2_pins_a: pwm2-0 {
+		pins {
+			pinmux = <STM32_PINMUX('I', 7, AF7)>; /* TIM2_CH1 */
+			bias-pull-down;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+	};
+
+	/omit-if-no-ref/
+	pwm2_sleep_pins_a: pwm2-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('I', 7, ANALOG)>; /* TIM2_CH1 */
+		};
+	};
+
 	/omit-if-no-ref/
 	pwm3_pins_a: pwm3-0 {
 		pins {
@@ -450,6 +467,23 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	pwm4_pins_a: pwm4-0 {
+		pins {
+			pinmux = <STM32_PINMUX('A', 12, AF7)>; /* TIM4_CH1 */
+			bias-pull-down;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+	};
+
+	/omit-if-no-ref/
+	pwm4_sleep_pins_a: pwm4-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('A', 12, ANALOG)>; /* TIM4_CH1 */
+		};
+	};
+
 	/omit-if-no-ref/
 	pwm8_pins_a: pwm8-0 {
 		pins {
-- 
2.43.0


