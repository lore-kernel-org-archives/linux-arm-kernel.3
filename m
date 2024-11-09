Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 312BDD5E368
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Nov 2024 12:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZnvmniB3LeK8KeMuMSmkjZysB0f8NngS3V/dJUbHuv8=; b=4QLa8s6Re9Gux8
	RCPeR3Y+DWvU5tFUqy5+YFcENbKHPpdJULGxUeL2T4zjok0Bx3/WPghllDz3cPq48Ddfm41s1ZPfT
	W0IdE2Rv8Eni6HS7Ki8Q1xxoemD8eJ1RPO3z+1KOUittIeDzewYLcRUuKR8a3hyygsOJ6WCGQP5a2
	M+f0h9LboNmJs2/gJXfa9tjDx52F4KQRTjeywU31i6nUDgKmgzgqxMQKS1KTNzPhA6Aq7yOEJZvdZ
	U76dva25Ne/jGFQOcB37CfVDQBqpgUJUioASF2jVAoNr/o66zrJFzv7Y4ALU0BoitWzb0D/ioJBUs
	SG38hliERvTveVjHRekA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9kwI-0000000DLhB-3OSm;
	Sat, 09 Nov 2024 12:51:42 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9kpX-0000000DKSW-08zq
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 Nov 2024 12:44:44 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5ceca0ec4e7so3756086a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 09 Nov 2024 04:44:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731156281; x=1731761081; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZnvmniB3LeK8KeMuMSmkjZysB0f8NngS3V/dJUbHuv8=;
        b=ieov/WTyLUHFxXg2jPrJMRfBy2V514qh9VJC3Mb/qbJHJ7culI1DyOGfgRw8tIivwU
         BTe/BYx2YHYbkvyXfcwJ6sU6YxH2awxVjJQaP5Kp+C+Gg/FXXq9sLc1n0aqGoXDqLrqH
         c/vM2dQkIMYoq3/2e7rfjNN63rjdJk558J+8F+apxFqvTzK8jmJvPslfyEgBq65fQu11
         V7VOm6kTqt7LIVM9LexjW60qtTXEGVor+SCBo9k0S2+h3MQadWo8+8NQTRGR0vl8bYUt
         AhxC7skHTOV+8BzEQI1jdiPItl40oULeFeaBuBRJgzvB788oSpk4NM5OkD2zHxJjqfT4
         mssQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731156281; x=1731761081;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZnvmniB3LeK8KeMuMSmkjZysB0f8NngS3V/dJUbHuv8=;
        b=U6AkAn3PszCKYP9OswZaQrv/0GXzYMZ+qSYZ0PpBGS61eB3GxuxUy5xOGYGZlF/fft
         0xDLgfuztuy48U8PjJBh7g7gffAOlopex+/RaiWwJyiXXiDaZgzjMambm1Te1ETTA+If
         hL0MAVFU8rHid/HV5FiG4nQe7QRqOHSg0OLRktBAzNIgU6pW1vOUzGtrBWr2nTHzsKpk
         FL6kJEIIUaPN06l9E+5HVc8/pyldQUNfaeU6UPlFYgVOIAQsWbYFaz/xESFEgxUd5VBU
         vdaEWThqZQa5RURnKYt9X70oEpiLKI8lh7uzZZCsb2+l2qixi92gaWMnSUqS2+kVWUFT
         ogyg==
X-Forwarded-Encrypted: i=1; AJvYcCXHmV8YpKxzUFUbeEZq0yfFYxSdEpvdoagkYvkz2i0zBzpW6lzUvHUh05R9O2hu7melizRHoarN3kqhrN8xTXoV@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0QJwrMYM/TfLlImrCR1KJ+DIj49Ipfp87aJo4eWwIr1JaPb84
	8l2vDrIh07Bw7E/VQz7RxCrgg0l9tLyOHY9m9q6dhPORjrrEnUOA
X-Google-Smtp-Source: AGHT+IEIGCuxXrmbH3JmjmIhypDxiqT7VZZMvZ/3txPu0Ud1UAxyBs1Rg9CLp2YCTFkbDWAYDWeRnw==
X-Received: by 2002:a05:6402:40ce:b0:5cf:1122:88bc with SMTP id 4fb4d7f45d1cf-5cf11228de0mr4137881a12.20.1731156280475;
        Sat, 09 Nov 2024 04:44:40 -0800 (PST)
Received: from [127.0.1.1] (leased-line-46-53-189-50.telecom.by. [46.53.189.50])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5cf03b5d793sm2940166a12.17.2024.11.09.04.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Nov 2024 04:44:39 -0800 (PST)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Subject: [PATCH 0/4] power: supply: max17042: cleanup and more features
Date: Sat, 09 Nov 2024 15:44:32 +0300
Message-Id: <20241109-b4-max17042-v1-0-9e2b07e54e76@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADBZL2cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDQwML3SQT3dzECkNzAxMjXUtjA7O0ZHPTxLTEVCWgjoKi1LTMCrBp0bG
 1tQDfK1uyXQAAAA==
To: Hans de Goede <hdegoede@redhat.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>, 
 Purism Kernel Team <kernel@puri.sm>, Sebastian Reichel <sre@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731156277; l=1826;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=AViyC/+sdOhddIa9xjAO4k6SS339kVhh4BSc9RyXqEo=;
 b=90pggLnOjDwy8XmUHTXmK3BpQlR4sHc6LVU9DiIpq7VL088R8yBC5A5aftKbu82FSxx1GYGTA
 X/vuKAzVUFHAIDmfWW6YeaEl/dP8pdBpT3O5BkRrjvSkaf7a3lu1vLO
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241109_044443_109697_E70D22E9 
X-CRM114-Status: UNSURE (   9.16  )
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

Maxim max17042 driver cleanup, and shared-irq feature.

Fuelgauge blocks often are incorporated in bigger chip,
which may use only 1 line for interrupts. Shared-irq
handles that case by requesting irq as shared.

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
Dzmitry Sankouski (4):
      dt-bindings: power: supply: max17042: add share-irq node
      power: supply: max17042: implement dts shared-irq
      power: supply: max17042: use microvolts for voltage comparison
      power: supply: max17042: rename maxim,rsns-microohm property

 Documentation/devicetree/bindings/power/supply/maxim,max17042.yaml | 13 +++++++++----
 arch/arm/boot/dts/samsung/exynos4210-i9100.dts                     |  2 +-
 arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi                     |  2 +-
 arch/arm/boot/dts/samsung/exynos4412-midas.dtsi                    |  2 +-
 arch/arm/boot/dts/samsung/exynos4412-p4note.dtsi                   |  4 ++--
 arch/arm64/boot/dts/freescale/imx8mq-librem5-r4.dts                |  2 +-
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi                  |  4 ++--
 arch/arm64/boot/dts/qcom/msm8916-motorola-harpia.dts               |  6 +++---
 arch/arm64/boot/dts/qcom/msm8916-motorola-osprey.dts               |  6 +++---
 arch/arm64/boot/dts/qcom/msm8916-motorola-surnia.dts               |  6 +++---
 arch/arm64/boot/dts/qcom/msm8916-samsung-gt5-common.dtsi           |  4 ++--
 drivers/power/supply/max17042_battery.c                            |  9 +++------
 include/linux/power/max17042_battery.h                             |  1 +
 13 files changed, 32 insertions(+), 29 deletions(-)
---
base-commit: 929beafbe7acce3267c06115e13e03ff6e50548a
change-id: 20241108-b4-max17042-9306fc75afae

Best regards,
-- 
Dzmitry Sankouski <dsankouski@gmail.com>


