Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96C7BC54E71
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 13:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HDXmWTsf7I1TS3xfzRIhPnHMEzq5/8iyDHno0DQJuug=; b=rfTgJCfxKl9PxI
	jUT1OoOOsXmEoM1aywAX/pQVMWlP2Q+UPS6Y5PqbVTPBFuGgOAf5xd2BpRmu06P7WqE3Wbxtujy57
	2XJ3+st0K6yxClRUxPk56gBURSyHuoqrhtRFZh4dvSCP577RPndgvrhlmN2m43px+44YcyTiIP+Sz
	sDRwI9RNGlaSUsmHILoLRDA0ALmKs54AODz71ykQO9OPYVZbi9CjiJD4rBvrMSZK4ik9AmnZHZvQK
	qst0PtGwhzfJiyBp7WE/vZhL70upqdWzlx6/Y6hvhjLuspgl27b6KrHk7g7uVdxXS0QEG3komLVoi
	uuv9KgcmTeaZGHNT1hYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHjZy-0000000Fx3x-1uAR;
	Wed, 21 May 2025 13:33:54 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHj3e-0000000FrQ6-3D67
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 13:00:32 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-231bf5851b7so52619855ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 May 2025 06:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747832430; x=1748437230; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HDXmWTsf7I1TS3xfzRIhPnHMEzq5/8iyDHno0DQJuug=;
        b=TsjnyhgyxGdjNJswdWyzMq9BdmyP8efKuWqmSPNrcBL87/5ATbxM0utpN6TQjupTG7
         y0xq5T6ZABae9VrsycqcFU0L762DIMZXVhQWNtBnC9WomtY68CfP0d0qy0Omc8AsBgGl
         f24Z6BVtSmJ/rYe45nBclgWKVBW0nUfDo4fi+tdBxaaYBPHyJx8nsCDPjJ35Xu+rxPtK
         8+wTuKepjgfyQEdTe0tzYOG+cazumch5Bfz+OdecX3Fy/pGxcDoJRUNKYWT0RhW2BaqX
         MC80mDUwHIjZxd22ZFu/Os4/KaZuPUi8OSuxtPhZ9kv2TnxoIOQo989C0huCB+fpjGnn
         Av1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747832430; x=1748437230;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HDXmWTsf7I1TS3xfzRIhPnHMEzq5/8iyDHno0DQJuug=;
        b=UBUIByhQRpMEyuLX4tIpnHG7XmMqt8GCSes7L6P4bRR0/QsUQ5MLf0CfhNe2MHXNmK
         gkHW8sOvD15MQkZEFp8GuMeGcSMKtimsTsIFbEgorNgz2hYA+m/ZxqFKC3zCuet/yo9/
         m8E+7Qk+pYSbb7dpDgTtk/3p0iJWBi2au0fN6ikNY54N4ti7HV5aPYmuxLk8Q3Z5YIV6
         MLtnZXlaq/F1Bs6aLYQYR6l1oOx9jnNtF5Om5NkvAUJ86kcSfJlbnY6k3iN1Se7lyfrD
         B1PWpw6D0Av1BIyeBZ7nB3fdMlz+AZ6ssCZcBNqUFj2+3pSk0rUUu8vZVZRXXS2tXNX9
         AqBg==
X-Gm-Message-State: AOJu0Yx89H2IJHzB907V9L4LJrRErTT88ra57RQ6XNrpDLMqjZfqlawb
	m2wdveOgKgccxM2crQAZJomdA2ggigyI4jGVazXooG0gT539fJZDk1bz
X-Gm-Gg: ASbGncuGJfldRHbkuZzxIdrNd8th4neP8xOTF4Fqm3NkdJDRGY6IVp1ly8NyhhsnuN/
	Chs6nu4yxPN68/ZMtpX1oYiaiaG8I1bmY8QwK1MngOhih7RKJbgwd7yAKOrXp1/BWMcxHjZpA2k
	z95G6Ln038yV3TAMMjt2PYAYda7hU50UgcVwgjEQUbWlJRH9c4a2eTPNqTAZVO72WA9jlLnzo5q
	ChGcbL7vMSUKRRNvKU4rNjRH/4WdwovIsH5GUMaztj8913coMRnA9913PQD7NjRGwLEVt6+2v0L
	chkScFInQ9gkS/MOvN7tricQfJPfi2ZaM5sDs7EBH2TLrIsNOXMHNEwbXyZMOkI=
X-Google-Smtp-Source: AGHT+IETmfah9/Lis2umG8XC4OQGkFd507KrHD8I0xERoUCucaoppzoXMSBE2xqQNCQOuHekoDmfAA==
X-Received: by 2002:a17:902:da82:b0:223:635d:3e2a with SMTP id d9443c01a7336-231d451ece8mr285952975ad.23.1747832428328;
        Wed, 21 May 2025 06:00:28 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4adb017sm92691165ad.53.2025.05.21.06.00.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 06:00:27 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Subject: [PATCH v5 0/4] clocksource/drivers/timer-vt8500: clean up and add
 watchdog function
Date: Wed, 21 May 2025 17:00:08 +0400
Message-Id: <20250521-vt8500-timer-updates-v5-0-7e4bd11df72e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFjOLWgC/43NwYrCMBDG8VeRnDcymWYS19O+h3hIm6kGrC1JN
 yjSdzcVhCIKHv8fzG9uInEMnMR2dRORc0ihP5egn5Voju58YBl8aYGABARG5nFDAHIMHUf5P3g
 3cpJaO/CIjbcIopwOkdtwebC7feljSGMfr48vWc3rE7TvwawkSFNb09q20uDM36Fz4bRu+k7MY
 MZvEJwRYvKqhg0RvyLVAlH0AakKgurXuoIYrP0rohcIqg+InhGvKzBOGcd6iUzTdAdlFno/hwE
 AAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747832426; l=3426;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=cdjF3TyDd/LgsIhw2etMRg5WSfJF62c9yDJ6ng08a1g=;
 b=ma0iwc8DTqUhwnyyiYWa8a3KhHx8UmK1V9I9hxX8gPu9maQusfOU96vUNbxeR2Yz32R62AOnJ
 sql3vw+weXrDYalo/8YJEiMJIQc3r3esh3yLyU6b3iTkzxEemgwesrA
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_060030_852513_6AE57D9A 
X-CRM114-Status: GOOD (  17.64  )
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
Changes in v5:
- Make sure the watchdog timeout value is clamped to hardware limits
  before writing it to the registers (thanks Guenter)
- Add a comment about the watchdog match value (deadline) wrapping around
  the U32_MAX boundary, which is expected behavior (thanks Guenter)
- Avoid moving register definitions to the shared header file to reduce
  churn: the watchdog driver gets direct pointers to the two registers it
  uses anyway, so it doesn't have to know all those offsets and bits
- Put the watchdog Kconfig entry with other ARM platforms where it belongs
- Link to v4: https://lore.kernel.org/r/20250521-vt8500-timer-updates-v4-0-2d4306a16ae4@gmail.com

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

 .../devicetree/bindings/timer/via,vt8500-timer.txt |  15 --
 .../bindings/timer/via,vt8500-timer.yaml           |  51 +++++++
 MAINTAINERS                                        |   3 +
 drivers/clocksource/Kconfig                        |   1 +
 drivers/clocksource/timer-vt8500.c                 | 166 +++++++++++++++++----
 drivers/watchdog/Kconfig                           |  15 ++
 drivers/watchdog/Makefile                          |   1 +
 drivers/watchdog/vt8500-wdt.c                      |  88 +++++++++++
 include/linux/vt8500-timer.h                       |  18 +++
 9 files changed, 316 insertions(+), 42 deletions(-)
---
base-commit: 088d13246a4672bc03aec664675138e3f5bff68c
change-id: 20250506-vt8500-timer-updates-44a0d22cd720

Best regards,
-- 
Alexey Charkov <alchark@gmail.com>


