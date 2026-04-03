Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04D3BE85367
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 14:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sXH0Wzyt0A1bijugwBqcmU83Qx2xfswksL1/C9qUqOw=; b=n2k+/nS2M1vXdPqt8us+GzyiJb
	gKwseEoYd1R9ow/PecCO4GcuHRZTbq+iLsRCJtVAD1/RToqshQ60kbEdQ3Fv7A28yOYUeyYjzGXpv
	EPytGfx9fpEOwuxW6eYSNxD300BW6CVRy6uE4iEZlkmU7d/dnXfdWAx23s+TIVNb5DL7GN/+O1Me6
	5dJhlVQ+oQns54PELomT7KTskO2g8KSQoRQ1gLOp+R0YmsO73E8U8GiIc+WH+f2WqgnSGJk1FLjco
	UpHPZ9AKvckWYz3gMSP2vNWfXB+ep0x87hAKeE81hFzB8d9v5/s8a+zKD7FLqqZ3E6TQ7qBLOuU6y
	B7BBpz7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8fWF-000000028rG-0V3w;
	Fri, 03 Apr 2026 14:29:07 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8fW7-000000028mv-3YSO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 14:29:04 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-48374014a77so24784985e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Apr 2026 07:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775226537; x=1775831337; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=sXH0Wzyt0A1bijugwBqcmU83Qx2xfswksL1/C9qUqOw=;
        b=VcRmIvtXqcVAImrcdIkXAU6tmBbzLyKImTDZGCBN63Pkr0kB7eWMJ2DyDpLCySUllL
         781LMuzxQcAnfoIWJSYJznBXtBYYt/i7VPSTf6vwhYLT8AdArn9KGyNG3njvhcQsboYb
         xC7VbrgcquwIQuFIxvCmMezPuCifGi27UfCnTmi9PKYMDkaETZOZNMLCcT926CvEmYEu
         +lzm8sgjYpZ+STO4W06OOj+20dEE/Vufd3LhdHNK4RX6ULdIus1iGwEfMP9ZlPQXuOx8
         Y8K7MvaxNdvulUTo5pk/PceeRUFvCHWHIKqouVNkYGI+L4kgPgCflczjWxHMpNn8Vola
         Sr9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775226537; x=1775831337;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sXH0Wzyt0A1bijugwBqcmU83Qx2xfswksL1/C9qUqOw=;
        b=o7UazJAJaaybse6PurzUEMNZ7dZc6qAHi9qfGYhKm6byE2vHwA6+y89cYxuHPGbEio
         Dg+1USC4Lw53xvCUUX57joNluloJeNqyHqqXbPkPqJNrkEe/hxuAiJAT1QjWfpNvqf4U
         90gwwhb6MYaDC/5jaL7PvYOMDRYQqshkwxvGldyAWqPhCKCiEHWzqtiSF0FmkiJMinZ8
         AcsJqFQi3OwjY4NCpnnQAfmFJJco7UKbU1z3zNqZRI1k8EUP7TYLsY2SRHrSRRtq0NfD
         gBW2fNoOE+c8OB3nm03tuN21JIbbeTRLS5E0NYob0//NB7emTtdI0YU8WvVDRaeKXMOx
         3UUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgrYL+h3dA3Etawj3swrPO/RflZSllgA9uGcuLeCQ+zgrL1g+7yMWpbF1r1yLhwdZXZyNmVom8x1dXmXDx+DA1@lists.infradead.org
X-Gm-Message-State: AOJu0YwFbbAI14vPquAJS+dQdm1k7yopU2F3mFpJwYGG+SPlBgh2zcng
	LcQQkt6g5DTfDgu2pMB0mAjpRtCK76MGGwY20OiyV5yeY5uOLfYD/kFnVzqJcyV5j9U=
X-Gm-Gg: ATEYQzzQnI3AGTV3fCmlt3XeBNmYwDQOcxfX+Yfbb7hWYPqbQpS3U1yHuQsv/7P1g2Q
	yoqWn5nr0xfjg86xxKL/+U3q9hDkTAQU9Bd0N4tcH6w5kuJ2ifqFT2wM2tbz9OTVNAoKmRMy0g+
	VrIVJVudfVZoasn6ZzwdUJQMwFj1aS1QU2DmbOx0Ukou9U5xgCPM17fy30xcHccE6aRiVuwAA3L
	NAFcA7Kj6stQkW1AdxLVUb3nneJBYG2mstZjsQfziEibfaKIAdZjBT5XdvRK8FbsAX/89zDQuJE
	C6k6s677uuznP3/XYVmLFJuD0oh21yTafewAy9+AEZlPdtycUsC5kShMPltlHgHKjuZs7ZrxOsx
	qih0PgefYuVWOevDz/YDsFS6JBW939c3KV/4jQ/2HIaNnjC0Ju/Is1eSmedCd1x/R67plutgrew
	cUsk6fyHkLikMbS20LWugemfGztpzaViP0U35QS+/XJf6WHCcNfchHGgA8sAr2pOBeolEe
X-Received: by 2002:a05:600c:3b87:b0:486:fe23:1707 with SMTP id 5b1f17b1804b1-488997ac1bdmr54229815e9.20.1775226537269;
        Fri, 03 Apr 2026 07:28:57 -0700 (PDT)
Received: from localhost (host-79-33-140-232.retail.telecomitalia.it. [79.33.140.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e9630ddsm258915625e9.13.2026.04.03.07.28.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 07:28:56 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	linux-pwm@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrea della Porta <andrea.porta@suse.com>,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Naushir Patuck <naush@raspberrypi.com>,
	Stanimir Varbanov <svarbanov@suse.de>
Subject: [PATCH 0/3] Add RP1 PWM controller support
Date: Fri,  3 Apr 2026 16:31:53 +0200
Message-ID: <cover.1775223441.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_072859_893665_48797CA0 
X-CRM114-Status: GOOD (  14.38  )
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

This patchset adds support for the PWM controller found on the
Raspberry Pi RP1 southbridge. This is necessary to operate the
cooling fan connected to one of the PWM channels.

The tachometer pin for the fan speed is managed by the firmware
running on the RP1's M-core. It uses the PHASE2 register
to report the RPM, which is then exported by this driver as a
hwmon device.

Subsequent patches will add the CPU thermal zone, which acts as
a consumer of the PWM device.

Best regards,
Andrea

Naushir Patuck (2):
  dt-bindings: pwm: Add Raspberry Pi RP1 PWM controller
  pwm: rp1: Add RP1 PWM controller driver

Stanimir Varbanov (1):
  arm64: dts: broadcom: rp1: Add PWM node

 .../bindings/pwm/raspberrypi,rp1-pwm.yaml     |  52 ++++
 .../boot/dts/broadcom/bcm2712-rpi-5-b.dts     |  12 +
 arch/arm64/boot/dts/broadcom/rp1-common.dtsi  |  10 +
 drivers/pwm/Kconfig                           |  10 +
 drivers/pwm/Makefile                          |   1 +
 drivers/pwm/pwm-rp1.c                         | 244 ++++++++++++++++++
 6 files changed, 329 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml
 create mode 100644 drivers/pwm/pwm-rp1.c

-- 
2.35.3


