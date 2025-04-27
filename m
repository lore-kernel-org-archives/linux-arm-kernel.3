Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19BDBC369D5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Apr 2025 08:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bn2eDJZEGPHUnz8R0+iyYHsVW148wSZoydE0VfHZX2w=; b=3Gw812R9vCZGFic+qRd9jITOVK
	V60gYEkEL05ifCOLAqEtA7vLYGHxTDvFAM+q96PrV9ZxTqwjjqktl41EFEGIPjUOqsBCgX8MODIYE
	g+3fEifZ+J2J4JxvADobu1zjNxM2urHzDwFai3F/DnJl22lnzYwZvG/+KtuQ0VJbTp3xdjJT1kbkM
	4c6wGfyM8ZeMpAeSt6ZgLPEWN5SGr29aq/XyKvDY9x8k+BNNMM9fH5+Py3/bp3zVwogdPmo9XRP2L
	YJ8tgns9sdQ5mZSyEJfqp+Z3EgknzUIoyby+T1XJGUq+GLEsatRPMxkoPjS+AHEdwmSgzVPGx3xII
	4tG9TRAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8xUj-00000003C0y-2Vm5;
	Sun, 27 Apr 2025 08:36:13 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8xLE-00000003Avr-1zF1;
	Sun, 27 Apr 2025 08:26:25 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-736c062b1f5so3116928b3a.0;
        Sun, 27 Apr 2025 01:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745742383; x=1746347183; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bn2eDJZEGPHUnz8R0+iyYHsVW148wSZoydE0VfHZX2w=;
        b=fDNCMuptHVuJlPuXyC91OPxJDBMheZQHqydtTZpQyP39s2DsoEbwCQ7flADWTE8ZPT
         2ZsB7+RNnyNHWbMe0yDw/ELgKBL7AmZGsHGVQeRjmbM/l2Z+prAE4aTN1nSVuCAAQPpn
         SJK5EeghlkC9NBQK1Fxl3udVSU9RtmpmkO4ZbY8hat/eB7JZm9MBgDwqI2lf1etrEl3H
         wqck84QhDJb/U0tS0wR7FoZXEcKkLb1aKztkL9R6Ype2qFGqDUPmlS1S2BigKSFvbiza
         O77z6sT9ds2CVi/Eer6cO88goqq6s0C58TbKeflmnTK8hzDykcbTikIeWZQ1QyTQipOW
         hTVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745742383; x=1746347183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bn2eDJZEGPHUnz8R0+iyYHsVW148wSZoydE0VfHZX2w=;
        b=Kvzsam7DG3XBBHbHjMwHp0HcbwvdApE52bEZNOzQQayD6mDYO7AM8045C0WvjAX+34
         wtv1HMj0RUJ8Lvodu/o20Sh4n91k86m9y1SVqeI5wkXzncf7GSzveCmUhleyCt6Ax9Cr
         mlLqt618+2esn2WEPPpyJJhPCVdwot3JSzWyobNJqQaAETqvPkYqATnezyYcFJFu2cqB
         x2Bzaz+5AUzrnKjm8SisLXGQJTA+1Nnm5AvbfyI32k9fHdzDB98LhgIw8pN3NfTQdF7v
         p1ccJtV0wJGZkwMYsDU4399OEqzxX1IxoPnvtlgrU4/LLihxCi7IYOdb3jQRDfP8VgCS
         G8QA==
X-Forwarded-Encrypted: i=1; AJvYcCUxCxCEkeOY83fzXxBCVVMRbGtWA3cbgLRDH9Zhyl2ZWIfHEnt2IryFY81hxM7NLK//GEkzvdPoxkFw81ebLskY@lists.infradead.org, AJvYcCVqOe1GNZsfSsmHUehIHxAzmxe9Yn38jTzgpi6QFakRxEzR1YTTQStcTWKgtcpj2kPm7Y0L2UJjhQduxe2ZRkh9yg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyGhASlMhUB6gowH/ywxN4wV6IFdUAkSNzyXdF2b6WfPKsZHSVL
	Q7vLRdp19YYS6DlLMnE7Alfv7vDNknFGy2llqN9RMVBiwQrad/FC
X-Gm-Gg: ASbGncsw4KjLKc1WtVGhAX+cNzCkVptae0uSvYs4S2j3zGn0Nwp1AcojledNJO//qNI
	xZG6xb70vgmJMgtsm/zqAgKco6H5Z6GYeOdNvbtmFuVDSd/4GHIiw1/Lxj5oLQw+DlxgKJmjAr8
	ae2uXESDvehLMd6xosrdTWKgYis51dINIDXIbvb0/WL18ackT+BI3+rUuRisprj2x2EOuuDMo+C
	ORLfIBUhD9imVnJlxpQTp2GX4gNSX3bf5qIGPpkUYsm5wB6HUZZBnoTj8XTQoij+6SxUS+n5uiW
	MIIBL1vZKpbbyZ3ueBPNLXCFRDxZElPe/wxVo+UxNqmQAZY8yjcqNA==
X-Google-Smtp-Source: AGHT+IFzZAZuflFPkU3MqoWhUEwdg0j/wbO+odL4l1iegaUwoMiDpQ56iI/0hVPdquw4PE+EsQUkfA==
X-Received: by 2002:a05:6a00:3e12:b0:736:32d2:aa82 with SMTP id d2e1a72fcca58-73fd8e548b8mr9932987b3a.23.1745742383453;
        Sun, 27 Apr 2025 01:26:23 -0700 (PDT)
Received: from localhost.localdomain ([14.171.43.210])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e2549f570sm5900852b3a.0.2025.04.27.01.26.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 01:26:23 -0700 (PDT)
From: Nam Tran <trannamatk@gmail.com>
To: andy@kernel.org
Cc: geert@linux-m68k.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	christophe.jaillet@wanadoo.fr,
	corbet@lwn.net,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Nam Tran <trannamatk@gmail.com>
Subject: [PATCH v8 4/5] docs: auxdisplay: document TI LP5812 RGB LED driver
Date: Sun, 27 Apr 2025 15:24:46 +0700
Message-Id: <20250427082447.138359-5-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250427082447.138359-1-trannamatk@gmail.com>
References: <20250427082447.138359-1-trannamatk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250427_012624_511939_2E2BE0D9 
X-CRM114-Status: GOOD (  14.92  )
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

The driver provides sysfs interfaces to control
and configure the LP5812 device and its LED channels.

The documetation describes the chip's capabilities,
sysfs interface, and usage examples.

Signed-off-by: Nam Tran <trannamatk@gmail.com>
---
 .../admin-guide/auxdisplay/index.rst          |  3 +-
 .../admin-guide/auxdisplay/lp5812.rst         | 79 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 3 files changed, 82 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/admin-guide/auxdisplay/lp5812.rst

diff --git a/Documentation/admin-guide/auxdisplay/index.rst b/Documentation/admin-guide/auxdisplay/index.rst
index e466f0595248..5d627f067c77 100644
--- a/Documentation/admin-guide/auxdisplay/index.rst
+++ b/Documentation/admin-guide/auxdisplay/index.rst
@@ -5,8 +5,9 @@ Auxiliary Display Support
 .. toctree::
     :maxdepth: 1
 
-    ks0108.rst
     cfag12864b.rst
+    ks0108.rst
+    lp5812.rst
 
 .. only::  subproject and html
 
diff --git a/Documentation/admin-guide/auxdisplay/lp5812.rst b/Documentation/admin-guide/auxdisplay/lp5812.rst
new file mode 100644
index 000000000000..58d716f899d1
--- /dev/null
+++ b/Documentation/admin-guide/auxdisplay/lp5812.rst
@@ -0,0 +1,79 @@
+========================
+Kernel driver for lp5812
+========================
+
+* TI/National Semiconductor LP5812 LED Driver
+* Datasheet: https://www.ti.com/product/LP5812#tech-docs
+
+Authors: Jared Zhou <jared-zhou@ti.com>
+
+Description
+===========
+
+The LP5812 is a 4x3 matrix LED driver with support for both manual and
+autonomous animation control. It provides features such as:
+
+- PWM dimming and DC current control
+- Slope time configuration
+- Autonomous Engine Unit (AEU) for LED animation playback
+- Flexible scan and drive mode configuration
+
+This driver provides sysfs interfaces to control and configure the LP5812
+device and its LED channels.
+
+Sysfs Interface
+===============
+
+LP5812 device exposes a chip-level sysfs group:
+  /sys/bus/i2c/devices/<i2c-dev-addr>/lp5812_chip_setup/
+
+The following attributes are available at chip level:
+  - device_enable: Enable/disable the device (RW)
+  - dev_config: Configure drive mode and scan order (RW)
+  - device_command: Issue device-wide commands (WO)
+  - sw_reset: Reset the hardware (WO)
+  - fault_clear: Clear any device faults (WO)
+  - tsd_config_status: Read thermal shutdown config status (RO)
+
+Each LED channel is exposed as:
+  /sys/bus/i2c/devices/<i2c-dev-addr>/led_<id>/
+
+Each LED exposes the following attributes:
+  - activate: Activate or deactivate the LED (RW)
+  - mode: manual or autonomous mode (RW)
+  - manual_dc: DC current value (0–255) (RW)
+  - manual_pwm: PWM duty cycle (0–255) (RW)
+  - autonomous_dc: DC current in autonomous mode (RW)
+  - pwm_dimming_scale: linear or exponential (RW)
+  - pwm_phase_align: PWM alignment mode (RW)
+  - autonomous_animation: Config autonomous animation mode with aeu number, start pause time, stop pause time, playback time (RW)
+  - aep_status: autonomous engine pattern status (RO)
+  - auto_pwm_val: pwm value in autonomous mode when pause the animation (RO)
+  - lod_lsd: lod and lsd fault detected status (RO)
+
+Example Usage
+=============
+
+To control led_A0 in manual mode::
+    echo 1 > /sys/bus/i2c/drivers/lp5812/xxxx/lp5812_chip_setup/device_enable
+    echo 1 > /sys/bus/i2c/drivers/lp5812/xxxx/led_A0/activate
+    echo manual > /sys/bus/i2c/drivers/lp5812/xxxx/led_A0/mode
+    echo 100 > /sys/bus/i2c/drivers/lp5812/xxxx/led_A0/manual_dc
+    echo 100 > /sys/bus/i2c/drivers/lp5812/xxxx/led_A0/manual_pwm
+
+To control led_A0 in autonomous mode::
+    echo 1 > /sys/bus/i2c/drivers/lp5812/xxxx/lp5812_chip_setup/device_enable
+    echo 1 > /sys/bus/i2c/drivers/lp5812/xxxx/led_A0/activate
+    echo autonomous > /sys/bus/i2c/drivers/lp5812/xxxx/led_A0/mode
+    echo 1:10:10:15 > /sys/bus/i2c/drivers/lp5812/xxxx/led_A0/autonomous_animation
+    echo 100 > /sys/bus/i2c/drivers/lp5812/xxxx/led_A0/AEU1/pwm1
+    echo 100 > /sys/bus/i2c/drivers/lp5812/xxxx/led_A0/AEU1/pwm2
+    echo 100 > /sys/bus/i2c/drivers/lp5812/xxxx/led_A0/AEU1/pwm3
+    echo 100 > /sys/bus/i2c/drivers/lp5812/xxxx/led_A0/AEU1/pwm4
+    echo 100 > /sys/bus/i2c/drivers/lp5812/xxxx/led_A0/AEU1/pwm5
+    echo 5 > /sys/bus/i2c/drivers/lp5812/xxxx/led_A0/AEU1/slope_time_t1
+    echo 5 > /sys/bus/i2c/drivers/lp5812/xxxx/led_A0/AEU1/slope_time_t2
+    echo 5 > /sys/bus/i2c/drivers/lp5812/xxxx/led_A0/AEU1/slope_time_t3
+    echo 5 > /sys/bus/i2c/drivers/lp5812/xxxx/led_A0/AEU1/slope_time_t4
+    echo 1 > /sys/bus/i2c/drivers/lp5812/xxxx/led_A0/AEU1/playback_time
+    echo start > /sys/bus/i2c/drivers/lp5812/xxxx/lp5812_chip_setup/device_command
diff --git a/MAINTAINERS b/MAINTAINERS
index 5d8ee0801c69..dd504dee3274 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24021,6 +24021,7 @@ M:	Nam Tran <trannamatk@gmail.com>
 L:	linux-kernel@vger.kernel.org
 S:	Maintained
 F:	Documentation/ABI/testing/sysfs-bus-i2c-devices-lp5812
+F:	Documentation/admin-guide/auxdisplay/lp5812.rst
 F:	Documentation/devicetree/bindings/auxdisplay/ti,lp5812.yaml
 F:	drivers/auxdisplay/Kconfig
 F:	drivers/auxdisplay/Makefile
-- 
2.25.1


