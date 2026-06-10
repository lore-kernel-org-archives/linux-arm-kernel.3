Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6BB8CD98CC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 20:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0uD+V1MP1IrfqCSKgnnEBQvMXliLpNg3JmnXmkFW/Zc=; b=O/obqDpDTxRC1I
	vh2u3WUNsMlFZuqGYN6xXiHwaGv1Jdrbb12rBZ1xwUHNVqA3oKWcO5mkMZS2eLeIa69pz0/zRM5xl
	mFq+hS5YKE3ETv2jNhS0rPEhekS6yKeW+EC5SS1LAt+TI6LHgPtbeQ82WTHDR//UuadLWZ14Z5p+v
	UhP+xHweLQ6bDD9gnc2bRg0dVn5+Tk2VWyuRKW8KKbSCIb0w0KZQ//hJOjzHzXEtWIiXQK23skyW/
	F6YDO07c/eZzU4ZCIA9NQZQ+mKKyw+uBKumfzrovA+xGtPM7MccIoeRoLrhvLcQBjruxcsmNrsKDs
	GUiqRfS3SxJpxiNAxUnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXPdu-00000008KZv-11Zs;
	Wed, 10 Jun 2026 20:35:18 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXPdo-00000008KXH-20h2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 20:35:14 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-490c1915793so51917595e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 13:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781123710; x=1781728510; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0uD+V1MP1IrfqCSKgnnEBQvMXliLpNg3JmnXmkFW/Zc=;
        b=WwOHnABv/7AgH3UrepvyNsvoACaFmuKVq1RoWtROSr0y9Hjb/IrJD4iDl2W6tXQ9wx
         T9XkIzK0r07+dhyQgnKje54XUBQ14nX5mvouTnvFo3KhpCHepimnRMzIbatpdjqmPsWi
         dXCbDCwTa95dCm/HkPbhHKDAdVZwaW9/g6AcDUg8XjiKIdqzudEJtoStuK1uSMNCvn2A
         8nO9sDWKa36IoApdPgmGi1bCuEzePCvEfhGgk2X1bpNW86YrC9Fvk3DEhNu0V19LHt28
         qUZY605UoKSSmI67fwi6NZZ9q3t6m2dOZeMMrj0YejSMoQTrdj3r8OwQU4AeVJFR5Drp
         imoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781123710; x=1781728510;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0uD+V1MP1IrfqCSKgnnEBQvMXliLpNg3JmnXmkFW/Zc=;
        b=bWIhK0Sy8dLXkfamdEDqFm0v1ZKFFYNVez91JqXNiog4/RIFIx0ukFWyN2DZBZlw3f
         ECyMUVKhJoBcdQnnrwr4bZSkz4ryfj+NCWmA1tsDU4iHCspOa0+/0JnOOc08PtLx7R+k
         ofODBDCU6gBeD2rLPAR2QufXYQphvbnHwKremA91g0t3kbKGui0Vv4zpYChgHKIJYQkQ
         cspUvvKanCUdIbgtQN2L1yE3dpcuvgFAo2nD+iFbJEN/RqQ74NUEQCCvDC28Y0BP3UBu
         Oa6Q2B/PiYbqYzsYYaJAkbvDlIcx78gdErjDOxeDMeJtGb+W5ZTPLKn2SdQtRl8g3PEq
         /dxA==
X-Forwarded-Encrypted: i=1; AFNElJ9qM1bJNgsgGYEny7dcMxJ1dSiiWsDuTmmn/ClPOsCUkuQHa/K9enFFOxZ1RWh4KX2ACW9QfBP79Qdr5w9Qk4i6@lists.infradead.org
X-Gm-Message-State: AOJu0YzHyOmL5HL1KS24i+4x/7PCTKqto/Zco0pBCUOh5uKHwRXi76Es
	81hK5kJyjVmpIPZd+MHLAHySg85Tr5NaFeoSyZj3k/CnGibs6Ku/sJUPfqLnbTEl5doihGiZjVA
	sWfnS
X-Gm-Gg: Acq92OH5+riepU5q3/+rXIIlUQWSZYnnFZsVTMZ35QdfjqRFAuTM1JgO4caD8lRU2FD
	aJOBziA9X8UPl/36sc2bsMAG50JG963XnwgrAUbm78MqA/xP7cXUedeiQ9qlQOPAGUbwLQxQIyP
	Zlj9dAVjyfTaKIN6BcBdIXECpWHGLwjLVllfD5juqjOX4pEY8UhlI8OvkCtarzt8hK2XQiI4toG
	DiVsdnPuioiU6oAtIc3QzE9xhxKa04pidVW3ijW1jmm0BsL+RpxOrW7H2GpUr01Bvl4h76jeR2E
	WBASvDvFWCV4NIDftrbWayK4cc2Moiw7cCRAW67wG3HlnfAK2Yoa97BPN2QFkSNhpICgURO5Poq
	C4c6SwXTMDSHVHWtXhEoDxB+H5d5fXHYz6UjCrV4/uFjNIXKbXp+TE3uxBLvrgWs5R5oElNryhE
	p7rckiFCrixO8qvTdRrgH5E7d1BkMe8lMezOSJ5YW7XA==
X-Received: by 2002:a05:600c:1f89:b0:490:e1a6:4d13 with SMTP id 5b1f17b1804b1-490e2d27954mr6307175e9.15.1781123709975;
        Wed, 10 Jun 2026 13:35:09 -0700 (PDT)
Received: from [192.168.0.2] ([2a07:7e81:7daa:0:202:c9ff:fe53:eda4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490dc4715e4sm62390975e9.0.2026.06.10.13.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 13:35:09 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Subject: [PATCH v5 00/10] add mcf54415 DAC driver
Date: Wed, 10 Jun 2026 22:35:05 +0200
Message-Id: <20260610-wip-stmark2-dac-v5-0-b76b83366d5c@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4XOy07DMBAF0F+pvMZoxq+krPgPxGJij6mBNpUdA
 lWVf8cJCx5NxfJKc8+dsyicExdxtzmLzGMqqT/UYG82wu/o8MQyhZqFAuXAaJDv6SjLsKf8omQ
 gLxtwEM02hK2JoraOmWP6WMSHx69c3rpn9sPMzBe7VIY+n5bJUc131/VRSZCsKbau9QYI7zs6v
 aYu863v97O2VC3q9Wr0gdiCjxbpd3X+bdTf6xbMJaErAVYZwujR62vrSq1X0XUMFLQl16ys4z/
 rWIm2MV47MluEsEKYH4TGS8JUomFnqTMKbfhLTNP0CU94Sd0CAgAA
X-Change-ID: 20260430-wip-stmark2-dac-7060f49dd94f
To: Greg Ungerer <gerg@linux-m68k.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Steven King <sfking@fdwdc.com>, 
 Arnd Bergmann <arnd@arndb.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: Greg Ungerer <gerg@uclinux.org>, linux-m68k@lists.linux-m68k.org, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org, 
 Angelo Dureghello <adureghello@baylibre.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_133512_566348_F6ADC0E6 
X-CRM114-Status: GOOD (  14.01  )
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

This patchset adds a minimalistic DAC driver for the NXP mcf54415/6/7/8
builtin DACs.

Currently the driver enables the raw write only. Feature as dma, sync, or
format are not supoprted for this version.

Additional options suppoerted by the DAC module will be added to the driver
later on, as needed.

The same patchset prepares the m68k/coldfire architecture to support
the driver.

Below some basic tests done on stmark2 mcf54415-based board, voltage check
on DAC0 and DAC1:

~ # cd /sys/bus/iio/devices/iio:device0/
/sys/bus/iio/devices/iio:device0 # ls
name               out_voltage_scale  uevent
out_voltage_raw    subsystem
/sys/bus/iio/devices/iio:device0 # cat name
mcf54415
/sys/bus/iio/devices/iio:device0 # echo 4095 > out_voltage_raw 
/sys/bus/iio/devices/iio:device0 # echo 2048 > out_voltage_raw 
/sys/bus/iio/devices/iio:device0 # echo 4096 > out_voltage_raw 
sh: write error: Invalid argument
/sys/bus/iio/devices/iio:device0 # cat out_voltage_raw 
2048
/sys/bus/iio/devices/iio:device0 # 

Same behavior for /sys/bus/iio/devices/iio:device1.

Generated a sine wave by shell script, sine shape is good.

is actually in progress:

Note: this patchset depends on mew mcf_read/mcf_write implementation that
Link: https://lore.kernel.org/linux-m68k/209d0653-6386-4b64-9e15-e358f84453ab@app.fastmail.com/T/#t
Link: https://lore.kernel.org/linux-m68k/20260506142644.3234270-2-gerg@kernel.org/
---
Changes in v5:
- keeping changelog in each single patch, where any
- Link to v4: https://patch.msgid.link/20260531-wip-stmark2-dac-v4-0-7e65ab4215dd@baylibre.com

Changes in v4:
- keeping changelog in each single patch, where any
- Link to v3: https://patch.msgid.link/20260522-wip-stmark2-dac-v3-0-16be0ad35a67@baylibre.com

Changes in v3:
- keeping changelog in each single patch, where any
- Link to v2: https://patch.msgid.link/20260513-wip-stmark2-dac-v2-0-fcdae50cf51a@baylibre.com

Changes in v2:
- keeping changelog in each single patch, where any
- Link to v1: https://patch.msgid.link/20260504-wip-stmark2-dac-v1-0-874c36a4910d@baylibre.com

To: Greg Ungerer <gerg@linux-m68k.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
To: Steven King <sfking@fdwdc.com>
To: Arnd Bergmann <arnd@arndb.de>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
To: Jonathan Cameron <jic23@kernel.org>
To: David Lechner <dlechner@baylibre.com>
To: Nuno Sá <nuno.sa@analog.com>
To: Andy Shevchenko <andy@kernel.org>
Cc: Greg Ungerer <gerg@uclinux.org>
Cc: linux-m68k@lists.linux-m68k.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-iio@vger.kernel.org

---
Angelo Dureghello (10):
      m68k: mcf5441x: fix clocks numbering
      m68k: mcf5441x: add clock for DAC channel 1
      m68k: add DAC modules base addresses
      m68k: mcf5441x: add CCM registers
      m68k: mcf5441x: add CCR MISCCR2 bitfields
      m68k: stmark2: use ioport.h macros for resources
      m68k: stmark2: add mcf5441x DAC platform devices
      m68k: stmark2: enable DACs outputs
      iio: dac: add mcf54415 DAC
      m68k: defconfig: update stmark2 defconfig

 arch/m68k/coldfire/m5441x.c         |  21 ++--
 arch/m68k/coldfire/stmark2.c        |  47 +++++---
 arch/m68k/configs/stmark2_defconfig |   2 +
 arch/m68k/include/asm/m5441xsim.h   |  42 +++++++
 drivers/iio/dac/Kconfig             |  11 ++
 drivers/iio/dac/Makefile            |   1 +
 drivers/iio/dac/mcf54415_dac.c      | 216 ++++++++++++++++++++++++++++++++++++
 7 files changed, 316 insertions(+), 24 deletions(-)
---
base-commit: dcf93520157c17ddfb1f43b66fcdda27714ff1dd
change-id: 20260430-wip-stmark2-dac-7060f49dd94f

Best regards,
--  
Angelo Dureghello <adureghello@baylibre.com>


