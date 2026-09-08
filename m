Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C30E5C79F99
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 13:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aSPSjuroE7/Str9fXOGeIfSG5AXSQIgzOXwzsiM3Dp8=; b=Tg8FgOZKUZAyeA2JKkqmE9CBs6
	StmdDqe+L7BRDd0Myh4di/IoSZ3RiFR86h7QBY63OpHwLalK0jvZn34hsqwiC59gGNQZCD71rpteR
	z21A5RaprikaRH7B2NJ2gEMpfQOR/tOYSeHBAXP0vw/xDWSSj3m2KN//rtUWiHWJ3d7Pr5ZUQUL22
	S5+lhVVLD0HaiDLArNN4GqQpYdXVbJGotRXBFbFdnIQH4BY7Gjj48Nx19AhSEE2ZpmtOImB9In7Yf
	uPxQV6KZgNxvtwKWWwSL+kyDFTJitu2jHlM/CfhDzEQhF2N4cD8kAHl58WBX8rB8LzFo77SX5f16E
	1qLxCD+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3vWF-000000095za-3K3j;
	Tue, 08 Sep 2026 13:05:47 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3vWD-000000095wt-0rVb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 13:05:47 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-4843e397f74so5190170f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 06:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788872742; x=1789477542; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aSPSjuroE7/Str9fXOGeIfSG5AXSQIgzOXwzsiM3Dp8=;
        b=f9Thu5ZCUYbjFrCLHissaY6xxhsBuUd4NMQJ3n8juxoVy/T0ecJ04rjMpiVO3PE0Yx
         Ou3E352xXKQ+IOtjepQvHEScWD7zHO42SpQ/b5bunsnophxChp4bEAWzBe6fMfTyHk/b
         mK429ekwop3KnJiXZxLFwkSCGHyYOYS8ZsL3oUbF5G5zaCnCSZ6a07fa9agdHeLgjuci
         hmvBxTJVxqvz5CYAGulcUjoSNZ/DMEp00Uu4wPgJ9cBL1Az5MEzT8klHnzjpA4lvF+Eo
         aKuogjKIJZ0pr8y+6T4TB3TMqIUS43jX/tQDblxETN69RFbsmGzL+SSfi3GRixydASLt
         fonQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788872742; x=1789477542;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=aSPSjuroE7/Str9fXOGeIfSG5AXSQIgzOXwzsiM3Dp8=;
        b=MAVAdHnUudutPF0fCtFVrBhjQze/x2zOJCTyjqIz97s39WUdz3YsTr15uKfgs77UFr
         JWeKmbqPbs39iNtKhFK5eZMvavvM+YfvnqijuN/MCjN4BdLkQbyyO4MXZvtj01fwrXtv
         xf+Atwy7gpXZPFUQIo112LievX1DOJiKNtnEnO2dpeWm+wN3P2HcCY1tRIAaH3WYDHgW
         SC00hLAQb+rbekVaxV7uZOFnbfYe12PeVt9ivV9DjZ+MkAp9z3OzAQEKEYNawMh1FBTd
         sOhpdg1o381otM/2jBBtPML/D2+Nhc+9l/ov5ujm1K2x01MhN0tJFxA8q9mXD6TOO/J1
         KDXw==
X-Forwarded-Encrypted: i=1; AKwUvBwlzSZUwfLeJdo9jXz/T+N59Xbel7YPL7mT2R2lY03hcXDO5jvZHphBA3yaCNxZ28J4juqqyj76i0DT6HE1yF/s@lists.infradead.org
X-Gm-Message-State: AFuF++mme1sLBmvKdREeZwA6y65YPHrKyx/zQgGnD/FUeWBN/YhNUtMe
	cZSFn1KOvSulmv82ReUv4QZBaGvfnFXFxAZMENfsbrrOiRw+4bZBFbmm/a8J2FrXdMU=
X-Gm-Gg: AYBFou2qOnc9iCS+woh/hPtjFDc4beLfSYiZIYadVmpKuKApWoOMN3kQhNaOB5trexh
	hNz88Hs8GB3fkENnHhAGYxJ1U1kjaRddX0QSai6MBecdFK9G6/7ZMbdVtXDKZix6nebOvbOl/gn
	dtabjaplJi0XE4ZQ9vg3bsKbscyiZ2fA4yaKP423dC/GKp7WSn9GBdXHtFYQbGejy3H8vWFDmXT
	AA7bb1+C6kUZ4RNQ47aITW/tBbbl7lqubzal41MGs0+MBvn1b3vI4TQ4/DQ/Ahqs+9omISGNtGh
	WeJFupXe+o/roXCk/UoVbdLecwjYftwpcrz+CdqfjlU3Nykq6lBu+PKh8PmNBV+E2cPqFDHwlx2
	uPtWhtVMizq6ey9CHKy3pJsl23nY/1OSQtlK5wRbfN4z8RXVPj07sztjkvRbDXceVWHrpbVyF2f
	1jg3ZaRzV9nuC+69mUOVVydUTLcUxG33ABxCBmqRayxVCGhthRjJcIu0wwaWw=
X-Received: by 2002:a05:6000:603:b0:485:a517:6287 with SMTP id ffacd0b85a97d-485a5176ca9mr4823534f8f.17.1788872742207;
        Tue, 08 Sep 2026 06:05:42 -0700 (PDT)
Received: from localhost ([82.145.119.95])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48594172546sm27618899f8f.15.2026.09.08.06.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 06:05:41 -0700 (PDT)
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
	Stanimir Varbanov <svarbanov@suse.de>,
	mbrugger@suse.com,
	Sean Young <sean@mess.org>,
	Julian Braha <julianbraha@gmail.com>,
	"Gary Guo" <gary@garyguo.net>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH v8 0/3] Add RP1 PWM controller support
Date: Tue,  8 Sep 2026 15:09:11 +0200
Message-ID: <cover.1788872294.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_060545_252793_AA9C1097 
X-CRM114-Status: GOOD (  20.56  )
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
to report the RPM, which is then exported by this driver via
a function. A subsequent patch will add a new device and driver
to read the RPM and export this value via hwmon.
 
Subsequent patches will also add the CPU thermal zone, which
acts as a consumer of the PWM device.

Best regards,
Andrea

CHANGES in V8:

- rebased on v7.3-rc1
- dropped the syscon. As a result, reintroduce the .remove
  callback
- dropped the reference to syscon in the bindings description
- Kconfig: the driver no longer depends on MFD_SYSCON
- added a new header file to export the function prototype to
  read the fan speed
- added the exported rp1_pwm_read_tachometer() function to
  obtain the RPM
- dropped a now unused local variable in the probe function
- link to v7: https://lore.kernel.org/all/cover.1784539788.git.andrea.porta@suse.com/


Naushir Patuck (2):
  dt-bindings: pwm: Add Raspberry Pi RP1 PWM controller
  pwm: rp1: Add RP1 PWM controller driver

Stanimir Varbanov (1):
  arm64: dts: broadcom: rpi-5: Add RP1 PWM node

 .../bindings/pwm/raspberrypi,rp1-pwm.yaml     |  66 +++
 .../boot/dts/broadcom/bcm2712-rpi-5-b.dts     |  12 +
 arch/arm64/boot/dts/broadcom/rp1-common.dtsi  |   9 +
 drivers/pwm/Kconfig                           |   8 +
 drivers/pwm/Makefile                          |   1 +
 drivers/pwm/pwm-rp1.c                         | 452 ++++++++++++++++++
 include/soc/bcm2835/raspberrypi-pwm-rp1.h     |  10 +
 7 files changed, 558 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml
 create mode 100644 drivers/pwm/pwm-rp1.c
 create mode 100644 include/soc/bcm2835/raspberrypi-pwm-rp1.h

-- 
2.35.3


