Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AE87CA5FC3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 07:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nV+g1hQFsSgbglJkQaFO0JiMO0Uva3k8KCHEJ6l5/OM=; b=smRLAe9uticqYHs+eFeBQ29o86
	0g2f+RJTbOwZJ8EhUtlqnFT++pJ3E/bpv8fi/s4FV8vBbVcWlZiRBgI/XvmLG2LkC8/3IuC31VSfZ
	t8/lOpHTnCpuqWhOjOY6SYwSWhXmTSqKbnmOQb0bDQL2OHo9khBjTNMUWKw9UtG9/QR09XJtMSrxw
	+5SUodUEpU4Z0CJ1YhumR6l0LsuU47+G2UG/A3+/jy9PJltwSKK4yHs3mb+0rEHN1wmc9gfOudxRR
	MxIq3RBx2ccOAiwzE0gcg1sDex26CMezwL0ggprEsqB5ZvG6KLm7lCfcumUv9qdK9LQ2Pathj+pMS
	HZuyBtjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBp2T-00000005K1n-0gMB;
	Wed, 30 Sep 2026 07:47:41 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBp13-00000005JPd-1OvX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 07:46:18 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-485984ebf5cso4012212f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 00:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790754371; x=1791359171; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nV+g1hQFsSgbglJkQaFO0JiMO0Uva3k8KCHEJ6l5/OM=;
        b=QxtZJBeqyXmgtAs/yEUmzFcmRmP8ZqzoKWvg9N7TYiwv/csQZw+j8iwKYZowIIo9+q
         JQTUFa1XE6bO9s+mPe/mm/qExsHZGg+P+UL7CFNq1Wko63GHTM83aSBioB8VYf87uXub
         94Jc8Ce1ElPMjagT2r8OQCH4wvPTgiR1symyr1SKmUcZ21UJcrNUs8n+YovCWuot9kmI
         hpNVpa17ZXl7XzUySpt5v8pbFBUf2K0vN9xi5BVtiuYNzQAPHg/x0BsKH242IL8K9DFr
         YhPnsQB1IUR6G7STzxpuwFQf08xGEyH3nja2lXOXH67DrGiJtLYm845jb2gcwG7iTsnr
         yexw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790754371; x=1791359171;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nV+g1hQFsSgbglJkQaFO0JiMO0Uva3k8KCHEJ6l5/OM=;
        b=jse5zJQ9MEXure5agmA8l5iBUMJ7DLoQ1A3uDfDCArom7kHxfdriebYqVa0oXJu5UL
         OpwEiU6xPe5Ag08mtRYwLeYThPoq8aC3Q44Q8AC2lj9NvYlD/vKGZ+QdisXqWb39Rs8m
         wr4LO81PERVPF6sjKXN3rIOJ7WsJ/Pbdtb0nZwO+L2D6Px4X61xnlO8taQa1vold2gR6
         o3N2IfvO4sM62e7PXFCLUVA7+MTax5W+pfQ21FgOy4mJR6xz007sRu0ieAvrfWRWlFcY
         Htd8kcoWp9NPNaPtysNMQV1LRSPqMiFPq8HGr6BqigjJeYRMWn9exGWkNrSPsUYb9wmq
         inHw==
X-Forwarded-Encrypted: i=1; AKwUvBwiNOAd8dEQbIQ2M8iMuMOZ1ektvwO5dz+GPcrJ/OXO/f1xRkN7JvvBmMqtWITBPdET3uw650ywQxy8oZMPvNy7@lists.infradead.org
X-Gm-Message-State: AFq9FYK/FXRjH2VXUE4fUcPRiNKAMvYzBRPWDAPchaltOnhyLGQbQjOb
	NTbsGNXk9vzl8sZc8wA6kfer49P0Q3woI0or04uKLF4Pmoi+PZiadaTf
X-Gm-Gg: AYBFou20LmfD72cWB/I4DK1J3dZwredQvV5Rrbw+AzEhDGJCsXZXOS0gibk57fSR+L9
	tvHpaxtAqviN1WrJ9UcsWvKuQ+NeUvhF3jur7DUCoIiKlb+6hya9eQWbPiA8RIH/k7p0ioZ5QT+
	TWOW4MTdMwH4St50YLhoihekpEZg3kVdsQaBVbr5yZIgGfT7181HFBADZSECYCsEQjyjrjuJf+t
	bi8vx3olL1DxN1llET+aY5kEhb4F4V+Bphs6LoPsh/I8J71BSsve9go/8ucrMlkus9LGt//1DTz
	YYTYzCTKAq76GkAkj7nSu3hRy+OJfQ8q5wgctrIkwgB/ih530U6dSag6YpNvQ0qQ/lmwDbOgY3m
	hn5Ay71tO26HVqwie1Xi46ELvKSF2IFen6uAhCI9RTe9mobVBzJreCKsluf89XNqse/Zrdr3Yw7
	jbVklblio+8FiL0aApEfSz+sww7ojGvYGpz4fT/Qo8Z4ytA7fasso37VO6Lll288LLFUK5PSsRa
	MG+A/QAShAGb9Kc+MFlSMDtBSWLrsQv0vav5gccr5T0vA==
X-Received: by 2002:a05:6000:186a:b0:48a:fbf7:15b3 with SMTP id ffacd0b85a97d-48b02557516mr955736f8f.54.1790754370568;
        Wed, 30 Sep 2026 00:46:10 -0700 (PDT)
Received: from zeus.localdomain (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b02a0185asm1487480f8f.32.2026.09.30.00.46.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 00:46:10 -0700 (PDT)
From: Sander Speetjens <sander.speetjens@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	sander.speetjens@gmail.com
Subject: [PATCH v6 0/2] Raspberry Pi 5 RTC driver
Date: Wed, 30 Sep 2026 09:46:06 +0200
Message-ID: <20260930074608.479089-1-sander.speetjens@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_004613_386964_157FA83E 
X-CRM114-Status: GOOD (  15.57  )
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

The Raspberry Pi 5 has a battery-backed RTC located
on the DA9091 PMIC accessed via the I2C bus[1].
Access to the RTC is provided exclusively through the VideoCore firmware
mailbox interface (not via a direct I2C register interface).

As stated by jamesh on the Rasperry Pi forum [2],
"There are no plans to release a public datasheet for the DA9091."
So we are stuck with the firmware interface for now.
PhilE also states that "The firmware needs full control of the DA9091,
sometimes with extremely low latency,
otherwise there's a risk the supply could just cut the power."

This series adds:
  - a DT property for the charging voltage of the RTC battery
  - the RTC driver that talks to the firmware

The driver and binding are based on (and largely taken from) the
downstream Raspberry Pi kernel. The main changes for upstream are
the addition of a dt binding property for setting the charging voltage and
binding the driver from the raspberrypi-firmware driver instead of from
the DT.

The driver supports time read/write, alarm, and optional trickle
charging voltage configuration via the device-tree.

Testing
- Hardware: Raspberry Pi 5 Model B revC
- Kernel: v7.2
- dt_binding_check: passed
- Basic RTC operations (read/write time, alarm) verified

[1] https://www.raspberrypi.com/news/introducing-raspberry-pi-5/
[2] https://forums.raspberrypi.com/viewtopic.php?t=359073

Sander Speetjens (2):
  dt-bindings: rtc: Add property for Raspberry Pi 5 RTC
  rtc: Add Raspberry Pi 5 RTC driver

 .../arm/bcm/raspberrypi,bcm2835-firmware.yaml |   6 +
 drivers/firmware/raspberrypi.c                |  25 ++
 drivers/rtc/Kconfig                           |  12 +
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-raspberrypi.c                 | 251 ++++++++++++++++++
 5 files changed, 295 insertions(+)
 create mode 100644 drivers/rtc/rtc-raspberrypi.c


base-commit: 93f51579e7df248780214094418f205253383cc5
-- 
2.55.0


