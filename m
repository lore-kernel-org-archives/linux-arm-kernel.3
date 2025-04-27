Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0A4AC369D5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Apr 2025 08:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rAHOOZ2NfcJK36SwKCvU8hUdcb2kgW0MQQU/N5qjNJY=; b=aS1MSjRWkLw8btCI2kUl4/1hFe
	3mHUpMudtX+tWj9EU5ak1eFMj0pfQOlk2KLPLO4sVgMoRqyb3YG/D2Udez2B2qMkeuO5qIn/V5P7Q
	qx0h4/32Le7dYtWexzZPfJ0T9a7Uubue4xRBqgIwJvuXNPdtnVy46OTS5VinxHyvrz325psT7ahwv
	/y+iRpCpiHk1QzLq46p8W8nSSqfziLurYJiDxrbaL8EhfEVCW/affjZbMtcAWa0pzf1o2uR7ex4LX
	nCTtUE2S3we7Yz/ONp/az8B1u+VZBeVOVmvVMD9bZq0mB/1k+wXc3ndR6FwARZx2AhBb9Ecr9hlaE
	PLUcDLeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8xaa-00000003D9U-1jU2;
	Sun, 27 Apr 2025 08:42:16 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8xL8-00000003AuO-1jvG;
	Sun, 27 Apr 2025 08:26:19 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-73712952e1cso4015169b3a.1;
        Sun, 27 Apr 2025 01:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745742377; x=1746347177; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rAHOOZ2NfcJK36SwKCvU8hUdcb2kgW0MQQU/N5qjNJY=;
        b=YGHuxlyr2YYlwRHsQtg+Ry9DPvAt5HxT1IJOjz0+76xUo5orcMWBg4DO3LvEfVXpRI
         Xn4BkiJlGXz+MM+o7jHAobjtV/HI7SznHsHGHxVm68dJNmbE0mXemu6TVVmNhvoHiKKB
         pDkpraDnak12oFLWm7uVRK134mK0xEVluZQ+07KRoGF3jHf/0wTafRQ27W25Ay/rzGAb
         TWby5dXpAUrUyUduKPsWQUbO5hzQBNAFMr//s66wn+InT5HvlsdFSdIY4lujiJA6k1Nj
         4ue7K8RoUm9m4ZKLUhNXqUyZTxaMSeQzLUux0/iXysE6G8B6ou+4O450NwWR9I1z9zOW
         UOWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745742377; x=1746347177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rAHOOZ2NfcJK36SwKCvU8hUdcb2kgW0MQQU/N5qjNJY=;
        b=fZPIX4OqRuXCGtFrXVnsPhVILTMGJYJC7um5ip4Kr1dgzB5NG/zKcwQCV+SMpEZzfj
         GhTAdbEHvcKYvgDfqOA3tB9enyViBq0por+W9dgryduoBWDGDrEyIieO1dwFz3jqgvHi
         5hWAiQgqy8aeitLK7KHNhDcllI8yyc817FkXhdwatC4J2xrGOnzOrZYKk6V1SFfq+ZGq
         nxN2eVKk87YBCrwgoMYZt0bXc+fCvT5XZ7888dd7LaRfOZjbh3BSjCFCelfrcTFH+1wJ
         7KaW2rxL8MVd6u6i4bnVRN3p1BHOAycP3icurpI+3RBrIcMHiLwGUO7vWodAASiX9BQJ
         Dmaw==
X-Forwarded-Encrypted: i=1; AJvYcCVVZ+NoGGIy1iIXRt85uvgO4Gro5luSGfFbt9y7JrGfMFxd5LtfYRqmM+/hHwUXfz+OMpBaPpi4GQQPnKdS2ZFy@lists.infradead.org, AJvYcCXsMvx7hddCCTC5YW8TMiv1Je7vdnm7wd4jxupsV9OS5vZ3H0yyxlUs4xCJNLHsYxVmYxUWfSkCu9T9427kr7abfA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxYPpbaZU7YB3oFfleldPE8u+MR70aecB7pfg5lLm5/2+y1LFu8
	1DQEoBQwA0Ri+vVijYHT/bNlnQlXSoyzoa4CMqjCdmBn5lXp+syJ
X-Gm-Gg: ASbGncuqCf1AEJi0xPC4jX2ydyXfWcsSQ23zkYZZTwU6J5aMJqkiQMPWO/vjFQVXhij
	XM5W9vzIkNaIYFhHEFSfDlZuoO74MVb3SdTOemGtjglj/az5jLMDeeppP+SXFPiwBS1ofg1N4eC
	UuyhfksUvm1zwZi7sjiP6MPj9p7xz28UcAUcmEWDK9JJmjqhpy+DXKhqPKD2ILj8i8fqVWy3eLx
	hWlaFopcQuEWDir3hLzn795kO7cO4f60StxVwG3n1iM2Oz9zKLmgD6ZHfk/VFCkN9DDmLnSdZBU
	DAI6mVO9IL2/P00Bg4lrp1WnYBRgYQloOjFcmQNDBg3M7BdpZugImA==
X-Google-Smtp-Source: AGHT+IEWyTJYvTQ8G6tSxlCsQ7uD5ydQMJw2gBZOYNudrhjDGhuqX8sdYQfAp1s2YVBSyzK/XuG/jg==
X-Received: by 2002:a05:6a20:9f8f:b0:1f1:432:f4a3 with SMTP id adf61e73a8af0-2046a56d06emr6773136637.23.1745742377485;
        Sun, 27 Apr 2025 01:26:17 -0700 (PDT)
Received: from localhost.localdomain ([14.171.43.210])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e2549f570sm5900852b3a.0.2025.04.27.01.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 01:26:17 -0700 (PDT)
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
Subject: [PATCH v8 3/5] docs: ABI: Document LP5812 sysfs interfaces
Date: Sun, 27 Apr 2025 15:24:45 +0700
Message-Id: <20250427082447.138359-4-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250427082447.138359-1-trannamatk@gmail.com>
References: <20250427082447.138359-1-trannamatk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250427_012618_454558_0686ADF0 
X-CRM114-Status: GOOD (  14.63  )
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

The LP5812 is a 4 × 3 matrix RGB LED driver
with autonomous animation engine control.

The driver provides interfaces to configure
LED modes manual/autonomous, set PWM/DC values,
and manage autonomous animation engines.

Signed-off-by: Nam Tran <trannamatk@gmail.com>
---
 .../ABI/testing/sysfs-bus-i2c-devices-lp5812  | 144 ++++++++++++++++++
 MAINTAINERS                                   |   1 +
 2 files changed, 145 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-i2c-devices-lp5812

diff --git a/Documentation/ABI/testing/sysfs-bus-i2c-devices-lp5812 b/Documentation/ABI/testing/sysfs-bus-i2c-devices-lp5812
new file mode 100644
index 000000000000..04689663a643
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-i2c-devices-lp5812
@@ -0,0 +1,144 @@
+What:		/sys/bus/i2c/devices/.../lp5812_chip_setup/device_enable
+Date:		May 2025
+KernelVersion:	6.16
+Contact:	Nam Tran <trannamatk@gmail.com>
+Description:
+        Enables or disables the LP5812 device. (RW)
+        0 - Disable
+        1 - Enable
+
+What:		/sys/bus/i2c/devices/.../lp5812_chip_setup/dev_config
+Date:		May 2025
+KernelVersion:	6.16
+Contact:	Nam Tran <trannamatk@gmail.com>
+Description:
+        Configures drive mode and scan order. (RW)
+        Some valid values: tcmscan:4:0:1:2:3 (default), tcmscan:3:0:1:2, mixscan:2:2:0:3, mixscan:3:0:1:2:3
+
+What:		/sys/bus/i2c/devices/.../lp5812_chip_setup/device_command
+Date:		May 2025
+KernelVersion:	6.16
+Contact:	Nam Tran <trannamatk@gmail.com>
+Description:
+        Issues device-level commands. (WO)
+        Valid values: "update", "start", "stop", "pause", "continue"
+
+What:		/sys/bus/i2c/devices/.../lp5812_chip_setup/sw_reset
+Date:		May 2025
+KernelVersion:	6.16
+Contact:	Nam Tran <trannamatk@gmail.com>
+Description:
+        Triggers a software reset of the device. (WO)
+        1 - resets device
+        0 - does not reset device
+
+What:		/sys/bus/i2c/devices/.../lp5812_chip_setup/fault_clear
+Date:		May 2025
+KernelVersion:	6.16
+Contact:	Nam Tran <trannamatk@gmail.com>
+Description:
+        Clears fault status. (WO)
+        1 - clears fault status
+        0 - does not clear fault status
+
+What:		/sys/bus/i2c/devices/.../lp5812_chip_setup/tsd_config_status
+Date:		May 2025
+KernelVersion:	6.16
+Contact:	Nam Tran <trannamatk@gmail.com>
+Description:
+        Report the current thermal shutdown config status. (RO)
+
+What:		/sys/bus/i2c/devices/.../led_<id>/activate
+Date:		May 2025
+KernelVersion:	6.16
+Contact:	Nam Tran <trannamatk@gmail.com>
+Description:
+        Activate or deactivate the specified LED channel. (RW)
+        1 - Activate
+        0 - Deactivate
+
+What:		/sys/bus/i2c/devices/.../led_<id>/mode
+Date:		May 2025
+KernelVersion:	6.16
+Contact:	Nam Tran <trannamatk@gmail.com>
+Description:
+        Selects LED operation mode. (RW)
+        Valid values: "manual", "autonomous"
+
+What:		/sys/bus/i2c/devices/.../led_<id>/manual_dc
+Date:		May 2025
+KernelVersion:	6.16
+Contact:	Nam Tran <trannamatk@gmail.com>
+Description:
+        DC current level in manual mode. (RW)
+        Valid values: 0 - 255
+
+What:		/sys/bus/i2c/devices/.../led_<id>/manual_pwm
+Date:		May 2025
+KernelVersion:	6.16
+Contact:	Nam Tran <trannamatk@gmail.com>
+Description:
+        PWM duty cycle in manual mode. (RW)
+        Valid values: 0 - 255
+
+What:		/sys/bus/i2c/devices/.../led_<id>/autonomous_dc
+Date:		May 2025
+KernelVersion:	6.16
+Contact:	Nam Tran <trannamatk@gmail.com>
+Description:
+        DC current level used in autonomous mode. (RW)
+        Valid values: 0 - 255
+
+What:		/sys/bus/i2c/devices/.../led_<id>/autonomous_dc
+Date:		May 2025
+KernelVersion:	6.16
+Contact:	Nam Tran <trannamatk@gmail.com>
+Description:
+        DC current level used in autonomous mode. (RW)
+        Valid values: 0 - 255
+
+What:		/sys/bus/i2c/devices/.../led_<id>/pwm_dimming_scale
+Date:		May 2025
+KernelVersion:	6.16
+Contact:	Nam Tran <trannamatk@gmail.com>
+Description:
+        PWM dimming scale type. (RW)
+        Valid values: "linear", "exponential"
+
+What:		/sys/bus/i2c/devices/.../led_<id>/pwm_phase_align
+Date:		May 2025
+KernelVersion:	6.16
+Contact:	Nam Tran <trannamatk@gmail.com>
+Description:
+        Configures PWM phase alignment. (RW)
+        Valid values: "forward", "middle", "backward"
+
+What:		/sys/bus/i2c/devices/.../led_<id>/autonomous_animation
+Date:		May 2025
+KernelVersion:	6.16
+Contact:	Nam Tran <trannamatk@gmail.com>
+Description:
+        Controls AEU configuration and playback. (RW)
+        Format: (aeu number):(start pause time):(stop pause time):(playback time)
+        with aeu number 1, 2, 3; playback time 0 - 15
+
+What:		/sys/bus/i2c/devices/.../led_<id>/aep_status
+Date:		May 2025
+KernelVersion:	6.16
+Contact:	Nam Tran <trannamatk@gmail.com>
+Description:
+        Shows current animation pattern status, value from 0 to 7. (RO)
+
+What:		/sys/bus/i2c/devices/.../led_<id>/auto_pwm_val
+Date:		May 2025
+KernelVersion:	6.16
+Contact:	Nam Tran <trannamatk@gmail.com>
+Description:
+        Shows the pwm value in autonomous mode when pause the animation, value from 0 to 255. (RO)
+
+What:		/sys/bus/i2c/devices/.../led_<id>/lod_lsd
+Date:		May 2025
+KernelVersion:	6.16
+Contact:	Nam Tran <trannamatk@gmail.com>
+Description:
+        0 0 mean no lod and lsd fault detected, 1 1 mean lod and lsd fault detected (RO)
diff --git a/MAINTAINERS b/MAINTAINERS
index 091373b01dc2..5d8ee0801c69 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24020,6 +24020,7 @@ TEXAS INSTRUMENTS' LP5812 4X3 MATRIX LED DRIVER
 M:	Nam Tran <trannamatk@gmail.com>
 L:	linux-kernel@vger.kernel.org
 S:	Maintained
+F:	Documentation/ABI/testing/sysfs-bus-i2c-devices-lp5812
 F:	Documentation/devicetree/bindings/auxdisplay/ti,lp5812.yaml
 F:	drivers/auxdisplay/Kconfig
 F:	drivers/auxdisplay/Makefile
-- 
2.25.1


