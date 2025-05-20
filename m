Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8924AC3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 20:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pPcmUVfo51pXmHZ9ojjiEQMZRh/JPyF52AHVxpwFMmI=; b=AAAi+NfH7+Zcqs
	T019M2QTJbx8rltwFrZcuPBHPUXlChSfqQEdlrjNxO+qt0LJFOjorCoYVjarge9TbEjV1wTv6GQjN
	3omaEg9B3p2XGRDb3sat0W93e7Aif8qarfSX7V1tPicZYqb7sPMGa+W1CPCKvTUzZZSDU3ohQG+Yh
	86OZyiDkyGEf7GMoGFsbdCf7Af5Hnh2z4+BcTd18YLtu0AJnNE0csSr7oZab1yIgsuZlQmqSgAmAY
	3G6MiM9pI0n0OBZ+8DlDhaGChM+hBwd9hb0MMtBf8Koct4YGd2IkJ+ylJWgfFaQ/2kOqRkeBYc4al
	M9FYPGU7Ugv5ViY8OhwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHTC9-0000000E2MP-3Lqn;
	Tue, 20 May 2025 20:04:13 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHT9x-0000000E1ra-3b2s
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 20:01:59 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-736c277331eso6195128b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 May 2025 13:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747771317; x=1748376117; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pPcmUVfo51pXmHZ9ojjiEQMZRh/JPyF52AHVxpwFMmI=;
        b=MdU6MnfLBMRT3IQtvHhlEXGaO5FtAeTIe2LWhwSYmu5+k1cT1ZaoPOQ8iD8xuRVrmA
         3kyE6Y4fvWvNiepsmgTmImn8s2/Q1k9twLmRJ4oOVATaKXz4TSDCWYGXe3X5R8DvHkh7
         Q2MihX8GEhoy51Sq/ZhFUndSQQi9WK53HWgJ+KW0+FVXrTC45808IqfK36C1D5r/11ZZ
         XGJA6U/H32NgzSDiPklP0KaoiTQPPHRSoiy8kjEQyWvM1M2yDs9jwqIt6+BKVmajzbll
         oS+IFXEnmHheXeNwzDdBSmhZtq9pGIISsC1QTq+8JTV7X7WcHQX6QU3aOv5jWYtZBNLA
         dhYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747771317; x=1748376117;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pPcmUVfo51pXmHZ9ojjiEQMZRh/JPyF52AHVxpwFMmI=;
        b=WHkrAXt9sy0zqHwfBgV65rfGkWeyIkqYqEdClSNOfZ3KBDp0/2UkxvqomWpV7OL752
         U3+HVqvg1/Kx2vinvmezlcn9nQn9fFZfzPY6p7QwJvPZT1lJPNaYZM07+8hMw5eErl3g
         1dmurtVYByAKiocbNHDmskl8eFk6M9bgUBzfKYpLPY+tM715Rv580BpqKhw4RdyTgcCG
         /6ZIagzQkctCqcPC2veYO6kE1M2XEbGa8oOTgv/le6g8Vk84isTITD1eEJgUxSZD2LgM
         OWu2MYmGyIchB4VUUW+LmaGhMa+RDibxeLC/atLDNg/JTIpLATbA0bep4veHPqSEzawk
         dhMw==
X-Gm-Message-State: AOJu0YzFrvPNOii+x/yIwiz+0ZgtaqmtR3/iYJxFKLSMcqaC4Id4Lpez
	rJrc5SF6yfD5/E20dhsDoC+5NbMlxnaXVASCj6vIXxbaEuWQVj1WHpVb
X-Gm-Gg: ASbGncsSzbcjXNeIIGO0pb8l+e84hrrCB90qObSx98z50wR2BLOKVUz4nllrJ8PbswR
	pinbNH4G6HHNYMAf6Qt7aZcpK6mT4k/8Pn6VnmIY4+Js8OYlaudcRr+zRTYSAAKV5EEusUseSAK
	Y9L/6xdX3jiihRiirfJ1Dkaq1q0WY11KgraIpS6sjFzDe2OTwvhBbRXCXXXS2tUmB58iJ40G7C9
	E8kzh3LHnmL1H9vq1so+EKnBXS5PGwMKr6fV/TIovUk6RS1yq3Gtktphq23QW1kF6NeoEoM0rsE
	iIDxUnXkqJSZrMUMaPJY6zFi1/h6oVkytSENGylwxA5c4SLwToD3dYX/6DKO+8E=
X-Google-Smtp-Source: AGHT+IFDfd5LYctL/ma3wetrvw9FPRSRjagnju0MP6iGs3B8f4f2NE6YVaDaNUxJ9dcButcaLqSK1g==
X-Received: by 2002:a05:6a21:9614:b0:218:23bd:6927 with SMTP id adf61e73a8af0-21823bd81c6mr17554826637.6.1747771316799;
        Tue, 20 May 2025 13:01:56 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eaf5a0d0sm8412340a12.14.2025.05.20.13.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 13:01:56 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Subject: [PATCH v4 0/4] clocksource/drivers/timer-vt8500: clean up and add
 watchdog function
Date: Wed, 21 May 2025 00:01:40 +0400
Message-Id: <20250521-vt8500-timer-updates-v4-0-2d4306a16ae4@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKXfLGgC/43NQQrCMBCF4atI1kYm0yZRV95DXKTNtA1YK0kMi
 vTupgWhiILL/8F882SBvKPA9qsn85RccMMlR7lesbozl5a4s7kZAkqQoHiKWwnAo+vJ89vVmki
 Bl6UBi1hbjcDy6dVT4+4zezzl7lyIg3/MX5KY1jeov4NJcOCq0qrRTVGCUYe2N+68qYeeTWDCf
 xCcEEnSigq2UtInUiwQIX8gRUZQ7LTJiMLKLpFxHF+TCZ/eQgEAAA==
X-Change-ID: 20250506-vt8500-timer-updates-44a0d22cd720
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747771315; l=2752;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=X/sQ9U42wLvVYm/jm36iRHzP6rqcVZHM8r3/rlxdmNQ=;
 b=ObNId0mYyMmRRfVHG7E1scox/D8xYERNd1Gn9Sx3E23u2AVHDSv13RRB5hW87CpBqbf6nVbiz
 Mr6N7sJG12ZB9no73jbwx2S8e4i7YJ9P5ijAjLK9A5jx6OyuvG23OqD
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_130157_902080_0B72B7A8 
X-CRM114-Status: GOOD (  14.47  )
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

Add named defines for all registers and bits in timer-vt8500.
Move the system events timer from channel 0 to channel 1 when enough
information is provided by the device tree (i.e. more than one IRQ).
Use channel 0 for the system watchdog

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
Changes in v4:
- Changed the watchdog driver to use auxiliary bus instead of platform
  (thanks Guenter)
- Split out the register definitions into a header file shared between
  the clocksource driver and the watchdog driver
- Replaced -1UL with U32_MAX in watchdog max_heartbeat_ms to make builds
  on non-32bit platforms happier
- Link to v3: https://lore.kernel.org/r/20250515-vt8500-timer-updates-v3-0-2197a1b062bd@gmail.com

Changes in v3:
- Dropped the DTS patch already applied by Krzysztof
- Rebased onto v6.15-rc5 as requested by Daniel
- Split out the watchdog code into a dedicated platform driver, like
  timer-gxp does (thanks Daniel)
- Link to v2: https://lore.kernel.org/r/20250507-vt8500-timer-updates-v2-0-65e5d1b0855e@gmail.com

Changes in v2:
- Included the previously reviewed binding change that is directly related
  to this series as the first patch here (thanks Krzysztof)
- Created a separate config symbol for the watchdog function to let users
  build a kernel without forcing watchdog functionality upon them
  (thanks Krzysztof)
- Link to the previous binding submission: https://lore.kernel.org/all/20250506-via_vt8500_timer_binding-v3-1-88450907503f@gmail.com/
- Link to v1: https://lore.kernel.org/r/20250507-vt8500-timer-updates-v1-0-6b76f7f340a6@gmail.com

---
Alexey Charkov (4):
      dt-bindings: timer: via,vt8500-timer: Convert to YAML
      clocksource/drivers/timer-vt8500: Add defines for magic constants
      clocksource/drivers/timer-vt8500: Prepare for watchdog functionality
      watchdog: Add support for VIA/WonderMedia SoC watchdog functionality

 .../devicetree/bindings/timer/via,vt8500-timer.txt |  15 ---
 .../bindings/timer/via,vt8500-timer.yaml           |  51 +++++++
 MAINTAINERS                                        |   3 +
 drivers/clocksource/Kconfig                        |   1 +
 drivers/clocksource/timer-vt8500.c                 | 148 ++++++++++++++++-----
 drivers/watchdog/Kconfig                           |  15 +++
 drivers/watchdog/Makefile                          |   1 +
 drivers/watchdog/vt8500-wdt.c                      |  80 +++++++++++
 include/linux/vt8500-timer.h                       |  48 +++++++
 9 files changed, 314 insertions(+), 48 deletions(-)
---
base-commit: 088d13246a4672bc03aec664675138e3f5bff68c
change-id: 20250506-vt8500-timer-updates-44a0d22cd720

Best regards,
-- 
Alexey Charkov <alchark@gmail.com>


