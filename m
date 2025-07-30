Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96368C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 19:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WTJ04XJW9rCytOzTtWrCv6iwwB/BOv81eXrzl0rsCXk=; b=cH309YyHxsgoqXWoeUdnQjQ/kB
	Lz54rBbD6mJ09hKmfCBpGJLPE7WIubfsBt8fynnsENsCzV+g9kIHC7kQPoqokEsHlQ5wtrt3bqPPG
	txMUeAJvejwUFfUWRsLrixVXglpUgSASK3xzNeogctqJ1Os0GnYGhsGgmdKatnoanssqnokE3u2s6
	YxRQ2uVxvvYIopac/ck96ucaKwvFrrnB7D0OknquBcAvB3IwwCeYDXLmlRB1ARrBn1B556wHPyMUB
	tZ3EtgTmg/NyWX5ygBWh0uw0E0zfVrk7gr0qs29zdHC1Q9ExOEb/zwNc+UTkyhCr1jaTGfn4ujOvT
	J8ighTVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhCtn-00000002KB9-2MZn;
	Wed, 30 Jul 2025 19:55:39 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhCrH-00000002JYu-08KL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Jul 2025 19:53:05 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3b783ea502eso82376f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Jul 2025 12:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753905181; x=1754509981; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WTJ04XJW9rCytOzTtWrCv6iwwB/BOv81eXrzl0rsCXk=;
        b=cN4fUXklpbT7xD9/rVTVIrGh/T7UtwCxgkQZWl2hObxlOykEz29ZtFHpdl822qvRTW
         zdTQzcypCOmx1XXar3tRSWDN5cuDqRYXLEUAnJlokwCcdMy7TQhI28rhzPuw4k7WoDTm
         vNjrU1pbJCb5eLONHlP1pwu5XTjjypvtZXzbxfgSK12A5JJI8DHIfUAqNzRbLXArhbkv
         xq+vUnpaZ72zRZJath1FWP6rh3LEvU1YQo0fWpq/WVyyGi/CyWACz3ojjozP0xpZa73k
         IrLXh4dfGfmDkW1BNkELfh9hwnwpwmoZUXW1juXTJKWE0sw5uFJVpVa1VjoAHLuE4xZS
         mfjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753905181; x=1754509981;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WTJ04XJW9rCytOzTtWrCv6iwwB/BOv81eXrzl0rsCXk=;
        b=pK8xEkGgHfZb7xL9BgcVLw5CrQWujDeEcULlKq7Kv1Fm5nQW/FbJMpm9fWsE4dxSAu
         eWpbJnRP8W74W8H9CyiX5vYTOd6zXJUfJ2dePgBH06WIlXMnTuVpcFz5DIgpkqyj0WDE
         cr5GRKQ3hfZm80IlReeY7uaVaUqRVXXjZUi2Vt6uzLon1nFQc8yx6G5pb5KIYl1vLAm0
         b2sQil/czvHARWk1oK+geA8Tp6/ZBsKfLIhvZ6Z4jm0lTkJ7sR1TiRONB6BMVB0mjbXU
         k8rI62LpUgX9wYIr+bzklgTqj6AqqaZqvw0ewGSX34y5FCL2GSSKuZzzCCLxIWTCi+rU
         +XPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXN8ll47GSouFwe16UuVwA6eU1tI5ds07UvEzxdaTUksk4WlyYJNMm+z227l8u8AZ+5anhSlGO0gEY+2PMeIuH5@lists.infradead.org
X-Gm-Message-State: AOJu0YyDar28pB1kZ1VUY+DlwHjeeR9yePXxNoOFyvzPoYXFb5MLwabt
	9V8a9QQ+cF8oGjGvfEcMDy5CZBfgAM/p+jjLvb3tVAwWxsA7IfHLFpzbkVrc9n7CgCk=
X-Gm-Gg: ASbGncuSxPdVcqAXDXZNWXsP35BLLPrrf3x09XWMSI/QIHH4cgB+oYvEbLANqe3vvVa
	iy161jwdSvRv6vqbhH8ygW5Za3KnVKaB7zcfBuNfnsl8ECxSdxInbDXTkBVZqCt7ZdNfQR89bgL
	LB4x4hIGhHrLsoJQhk3vlCdhMNf4FsJ5RgW7Y/mc0eyDxjjX5NxsnGf/MzsGU2o+lrcXOfOWRAU
	ZxRG5TjPedh3f6BusEGn9iIJAwXrxmt3RPeC3SvtDtxl9BPfphyzOsKM1Vw9AERz3lPkBKGW7KS
	SoHUOBIkYKYKtLJ9c1EFO+ORgdUFok9BXBg/JsnCkhCMu1EG/9ONDI7ukjBn/hCJfYfd+4ZuL54
	MoH4jIYL1EVYFb8mzDm+8AEoD6jDCysP/0pYOMe+SLKWYgHCM
X-Google-Smtp-Source: AGHT+IF1QpqFcMkkrFcPI7L92Qa8qVcCM46GAZ3UfOx8fwQ0i6q08CK1SCZ+XKjU+FsVU7KYpwE0Xw==
X-Received: by 2002:a05:6000:2890:b0:3b7:879c:c14e with SMTP id ffacd0b85a97d-3b78e6239b0mr7443255f8f.20.1753905181405;
        Wed, 30 Jul 2025 12:53:01 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b78b26a4dcsm9556193f8f.32.2025.07.30.12.53.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 12:53:00 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: mbrugger@suse.com,
	chester62515@gmail.com,
	ghennadi.procopciuc@oss.nxp.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: s32@nxp.com,
	kernel@pengutronix.de,
	festevam@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/8] Add the STM and the SWT descriptions for the s32g2 and s32g3
Date: Wed, 30 Jul 2025 21:50:13 +0200
Message-ID: <20250730195022.449894-1-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_125303_066842_85CC9859 
X-CRM114-Status: GOOD (  12.79  )
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

The NXP S32 SoC family includes timers and watchdogs that can be
dedicated to the CPUs present in the system. The documentation refers
to them as the System Timer Module (STM) and the Software Watchdog
Timer (SWT).  This design originates from the automotive domain, where
the SoC can be partitioned, and a group of CPUs may run different
operating systems or firmware.

On the S32G2, we found 8 timers and 7 watchdogs. On the S32G3, there
are 12 timers and 12 watchdogs.  Please note that the 8th timer
(STM_07) is not described here, as it is coupled with a specific STM
instance used for timestamping. This makes it somewhat special and
requires custom handling in the driver. It will be added later.

All timers and watchdogs are disabled by default, and are selectively
enabled depending on the platform configuration, which may include
different combinations of Cortex-M7 and Cortex-A53 cores.

This patch series introduces support for the SoC and enables both the
s32g274a-rdb2 and s32g399a-rdb3 platforms.

Testing was done only on the s32g274a-rdb2, as I do not have access to
a s32g399a-rdb3 board.

Daniel Lezcano (8):
  arm64: dts: s32g2: Add the STM description
  arm64: dts: s32g274-rd2: Enable the STM timers
  arm64: dts: s32g3: Add the STM descriptions
  arm64: dts: s32g399a-rdb3: Enable the STM timers
  arm64: dts: s32g2: Add the Software Timer Watchdog (SWT) description
  arm64: dts: s32g274-rd2: Enable the SWT watchdog
  arm64: dts: s32g3: Add the Software Timer Watchdog (SWT) description
  arm64: dts: s32g399a-rdb3: Enable the SWT watchdog

 arch/arm64/boot/dts/freescale/s32g2.dtsi      | 119 +++++++++++
 .../boot/dts/freescale/s32g274a-rdb2.dts      |  20 ++
 arch/arm64/boot/dts/freescale/s32g3.dtsi      | 195 ++++++++++++++++++
 .../boot/dts/freescale/s32g399a-rdb3.dts      |  36 ++++
 4 files changed, 370 insertions(+)

-- 
2.43.0


