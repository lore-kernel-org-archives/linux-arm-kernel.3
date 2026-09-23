Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17D34C9830B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 13:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eEL/ziy119TiL5y3r1fCl+gEEEgKmW5ZTGC1Lv1U1dM=; b=ntNsrgVCyMQG2nXILubGupaRpf
	kcR5Qf+tzGT/1FzlKUShjOXA7z9JUZb2/bGrlt5jVTk52AkCF0W3Ic0FmbMGiCFRDRE1NzzbM7e1z
	x/c+c7mXasLAouUyN/Xnm2F2wcZKX4XjX4WMB30Zar2SDQ73QmUJY70y9DP1CEDJv8YC4/XrJy0aE
	cpJdBg2Z7B6s2rc+j3ClTf4ORaL3ryTGBmNwYJ8/KGMgokPGk/ix8Pcz1Mmtdhsk/Uu68U7z1284C
	uA4RePLCsQXE+/2LnY+CsEMDknQaEIvv8eG9aSgch7b3h8W/rzdkKSkE9ck5YqTbUBIH3iW8HsPfN
	ajB8lR0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9MnG-00000008MF3-0xRQ;
	Wed, 23 Sep 2026 13:13:50 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9MnC-00000008MCj-2qfb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 13:13:48 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49ccff31419so7654265e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 06:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790169224; x=1790774024; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eEL/ziy119TiL5y3r1fCl+gEEEgKmW5ZTGC1Lv1U1dM=;
        b=FFJ56fFjMFvotC8fx0m93MP9vVE1NmIbIHycPNXZ1j58PeDwueQ/nFZW/DX4fRlTvD
         IxILuyfAnTLtYcaLilDMsYoxAjeZcKSaWCbJv0XJKhQVy6hiNYZModbV3IdfMNq+USco
         VIFJCCA5K8kkfrdCgECt0YGRrmM6w0nPsBdrPd8DRvnUv0IymA+XGvnQzBWMYL6CQe5T
         9udpYQQep6fbQ5sOubgGwcEwRIOqMTaYrgQvmJiLFZV2EPHJf0YMuFVY4OU+xhkOAsSF
         AZ0oVqlWnEOkFQzG6UPb7sKGg9EUnXmExov25dTlPlg8sPPaSTm3xUh9sfyIvEB54vSF
         mSmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790169224; x=1790774024;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eEL/ziy119TiL5y3r1fCl+gEEEgKmW5ZTGC1Lv1U1dM=;
        b=GiScOKQ19MkisktSqgPod9j1pLaPB0o1WeCr7atE+MPM9UuB4BKt/tGWdYS3a9nFU+
         KMBWuOO9zBfOFaoB6Ack/xA9Stt41c3Zpv7jdpqp66Tzg9HFkSkrE5ib/enx+dEBRQ1V
         wPVV3P9j7jZsoUjcQVXlChnI88mOCLRW2udYB5paryW5GuNNDGkkbs75O+fBOxOYf47K
         G91ooONVgaX/hQKYzFDlb3c+DaFRY1YRjhEZCQl0Kl+VqKMN9/0XzTWiV5Svumjx4E+b
         htDppXQeWvIJ+JqBHhZ0cA3LMMPw4I5ZXRIuthjV757HVj2cBt6AkcCzxJb+zmdyoxy4
         LdCg==
X-Forwarded-Encrypted: i=1; AKwUvBxUZVCz3hK7YObG6sZ/DhCLgjO7pa1AnPoIQ7IFrr/Y5DRldQjPI30J5p8w98KIw5R0VGZpyGb+ushfNNbKwvnG@lists.infradead.org
X-Gm-Message-State: AFuF++lZFk7DgPoFdejQrrdCBaFcBrKWwa0oDiFfpGQmxolqf+B8j0GS
	axxK/96XrpAv6GbaM+iSTou5wj0pe4wf7ORurUkf49wPnArAQsyaJ/Au
X-Gm-Gg: AYBFou0101bGVAyzByQA7uWXq1xZ6HpVSXT4MLNQNgAhVbxtlD1UslRjZHO1ZYYJXHA
	N+kqOgCQ02Ckfzk9DfWdssIfzKmsbmi3wNR1/whY4BOcyrhz78xcGwiDSCN57AN7YoBpKyFfuf9
	4XJaerRHv7KBRAVGQ9e0LLDS8yA2X4T8ozndAE+A3ulIJOUCrZ8YQeCOy+XiVPwVL3kWc9fBg3h
	R6Vr92XNX7OF5TyZ/Fq4lrA+NIcyg7xQsMJQUgyezDwVi3GGi7hF7q83iYe8nYyrdfhoEGbWvNr
	LweRfsQ+zpajPIuYJIV6BYZk+pgIOH0VE4nu677NXouW0LklmMvjYlr2ZT4zzQWT+wsOgraIn7K
	BSuxGPjarxzuQhpgfSeX70K+Ht23Rsuka/cUcawFg+SrvwycFnRvONLKtIYGY3yaZ0TBVkxYozA
	EdSSPnpT9FDF13iyGqSEQb/NkPowwG08ieowuqPL+rKSmY1bfaRCYtMsgcef3iNDkbzsapZXUVZ
	dTSo+0Hr63nh7oNTPetknDjKINv9ka9/vCPr1QGFqHT5A==
X-Received: by 2002:a05:600c:1d14:b0:49f:ce73:4a with SMTP id 5b1f17b1804b1-49fdf34f0e0mr36303145e9.34.1790169223305;
        Wed, 23 Sep 2026 06:13:43 -0700 (PDT)
Received: from zeus.localdomain (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe0c3731fsm57230235e9.2.2026.09.23.06.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 06:13:42 -0700 (PDT)
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
Subject: [PATCH v4 0/2] Raspberry Pi 5 RTC driver
Date: Wed, 23 Sep 2026 15:13:21 +0200
Message-ID: <20260923131323.1099979-1-sander.speetjens@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_061346_751352_1A07DEC3 
X-CRM114-Status: GOOD (  15.60  )
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

 .../arm/bcm/raspberrypi,bcm2835-firmware.yaml |   8 +
 drivers/firmware/raspberrypi.c                |  25 ++
 drivers/rtc/Kconfig                           |  12 +
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-raspberrypi.c                 | 242 ++++++++++++++++++
 5 files changed, 288 insertions(+)
 create mode 100644 drivers/rtc/rtc-raspberrypi.c


base-commit: 93f51579e7df248780214094418f205253383cc5
-- 
2.55.0


