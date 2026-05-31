Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 963AECD6E5D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 May 2026 15:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DG2xp1hSIJeTvHYY9toNTecy4Wvd4sNJMjvyyolvm+4=; b=PQ9h6wE9U4lD2Q
	sCXeH47RsqNj3Po6wf3i5l9Qj7aDhVk095hOHtVpdy8cupbaZSYjSKYGIbgNOAuOk93lQ7wL0uDm5
	mBodgqfsoE1EIPtHWtDNAPPvi56d2meDDOBbRSz9KLQ/Sn7toljeWCIqifxXBDDCu1jmTMw+u7FnB
	d+xEHvvdHn88BfrdJurGuXx/AblgjH+iUocmgN09zPUsBKkFkUHlxxCbr+eCkYF2Ftu0Ybwo9gFp8
	V/F9zaXn2+YDAR7wQqBlq3fIK4ueX0SRkyVokZtUdGnH+prXlBVDrJ/RwO8Ahl5WNq7e7ZGbr6Q9y
	9U5UuEKzCZ8a9u7hW5jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTi3E-00000009gdv-3xXr;
	Sun, 31 May 2026 15:26:08 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTi36-00000009ga8-1gv9
	for linux-arm-kernel@lists.infradead.org;
	Sun, 31 May 2026 15:26:02 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-45ebafde87cso5978523f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 31 May 2026 08:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1780241158; x=1780845958; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DG2xp1hSIJeTvHYY9toNTecy4Wvd4sNJMjvyyolvm+4=;
        b=biO6t0L0DdKzPToo1kzZ4kIuNDFnejhvMrnCF9ljPf7qyHXhQU8nL3MaRBkYW8WV1e
         f1Vyk3UHdxMtGFdlS4OKVXIOXLZy349gtAxTcNxkpxmqj/969L383A++w3KhFUVop86F
         fzyr4G5KyTVzwjqrZuK0qg+g8ZRCTjUZiQAZtPAqK28GhJ3s0dylutxvhkoUjKH7Hsh/
         25JfeNQ9bGpR6xcolSdF3ZqUmftVinpz0Bg8oQ6pB2km5awkIvsh/fqGSP7loadImxOF
         O7PmnSFANzofg8SaCJn1qmUQ0Hg1e18Eu3tKTKJuJHQr5ZnH5DDRsL2LzwbIg5V+jOIC
         OpdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780241158; x=1780845958;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DG2xp1hSIJeTvHYY9toNTecy4Wvd4sNJMjvyyolvm+4=;
        b=PBxZ8UCNRftAFojplxOLOYkIWZSxgsdV0S56cfwAMaUbmhL7nYSc6p2zmxygsNXNwW
         uj2dG8Y+xbDi+Piq9lhuyqZiDw0qxp17G1YZZnvFu/PFq6YTDbrFB6ilyq/SARtgr9li
         LMrm5cZTP9amWRxm2jVfiagJBXsudbWzPhMSq8pkxA4IVPQ/DrHda/kmPOGnGTBaTLX+
         KXl7HhHI9KDPGPD2KNBGlCjT6U7P89rzTbMbfPdMcYF1srE9llWG6rDnXDV2wOTKeybe
         MvWvWE7n3mepCCG3h3UiZHmHhwjh3rT9AFoM9r1Gc6AXEO+THp2OvQE7k5IsyBJTQasR
         D8/Q==
X-Forwarded-Encrypted: i=1; AFNElJ9WOp8zVh+c1EgwSpel6/T7BAcvorPtwDZ1rgF9jOKkERRokIwWu1BjBnXCAboLdeyfH83yOoFiH5oVhc1NOft4@lists.infradead.org
X-Gm-Message-State: AOJu0YwSWTN+xjAIT80djLgzWd4rRnninXGOxEPbdM40JLwCG1bcFjL5
	BWQw7tT/aS9+QWnxQRW4fngljFpB5umDOXo+2HWiC2B9yA78nEKtYJdSVYG8JiWZFRU=
X-Gm-Gg: Acq92OFeM6FAWoSLOMq2TWGyr2C8xJU0+2vClafsUgmHx37rYQTMBUDQztHKdJ5KROi
	9u14gOVHNsdRdwrwJecmCuRsLmLzOax6w9izDYDEOT0scg/w++QksZxQNzNPF+Yt/YpnCGxEPyi
	0wV0w7JFYc3eMiEXtgBuhEhC1bqeMAMwny5jyJK0vXBF/a+jVCU4Tjt69nlD7xwmK0/yQVP3CGF
	woKKAU5rSmQqyCtmNLI09d7166oHL6saCxtsP2HmG4GslAFYX6CAZWVb7XmdxIzQNeNZLNvATzt
	RXp21HBWVWs+yc7yR1nzct7xgysT8N36vivqNRcm4s3IsHT89LGaacJE76w7q0Ox2/+NrLFPgsf
	E/JYtgRGfDRcx0PqfdBtNQ6bIrJrB2wPgc20CrR37zTgfsk8suOwlj2e2pfG01WQPId/rG2xtAA
	s2jQ3dC7bdXGw7UkIODv8pQ446J1IH6ecfsmGdNZGw5Q==
X-Received: by 2002:a05:6000:2581:b0:45e:f8d0:d22c with SMTP id ffacd0b85a97d-45ef8d0d485mr12474042f8f.25.1780241157769;
        Sun, 31 May 2026 08:25:57 -0700 (PDT)
Received: from [192.168.0.2] ([2a07:7e81:7daa:0:202:c9ff:fe53:eda4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef354cf0dsm18526622f8f.17.2026.05.31.08.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 08:25:57 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Subject: [PATCH v4 00/11] add mcf54415 DAC driver
Date: Sun, 31 May 2026 17:25:53 +0200
Message-Id: <20260531-wip-stmark2-dac-v4-0-7e65ab4215dd@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WOzU7DMBAGX6XyGaP1bxJOvAfisFmvqYE2lR0CV
 ZV3xwkHBKTi+Ek7M3sRhXPiIu52F5F5SiUNxzrszU7QHo9PLFOoW2jQHqwB+Z5OsowHzC9aBiT
 ZgIdouxA6G0WlTplj+liND49fu7z1z0zjolku9qmMQz6vyUkvd9ftk5Yg2WBsfUsWUN33eH5Nf
 eZbGg6LbUWdMttopIDsgKJT+BNdfpvMd92B/aswVQFOW1SRFJlrda23UeV7BgzGoW826uqfuqq
 KtrFkPNpOQfilmOf5E18HIxq/AQAA
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
X-CRM114-CacheID: sfid-20260531_082600_776181_7D7576B1 
X-CRM114-Status: GOOD (  13.69  )
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
ibuiltin DACs.

Currently the driver enables the raw write only. Feature as dma, sync, or
format are not supoprted for this version.

Additional options suppoerted by the DAC module will be added to the driver
later on, as needed.

The same patchset prepares the m68k/coldfire architecture to support
the driver.

Below soem basic tests done on stmark2 mcf54415-based board, voltage check
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
Angelo Dureghello (11):
      m68k: mcf5441x: fix clocks numbering
      m68k: mcf5441x: add clock for DAC channel 1
      m68k: mcf5441x: initialize DAC clocks by iio DAC driver name
      m68k: defconfig: update stmark2 defconfig
      m68k: add DAC modules base addresses
      m68k: mcf5441x: add CCM registers
      m68k: mcf5441x: add CCR MISCCR2 bitfields
      m68k: stmark2: use ioport.h macros for resources
      m68k: stmark2: add mcf5441x DAC platform devices
      m68k: stmark2: enable DACs outputs
      iio: dac: add mcf54415 DAC

 arch/m68k/coldfire/m5441x.c         |  21 ++--
 arch/m68k/coldfire/stmark2.c        |  47 +++++---
 arch/m68k/configs/stmark2_defconfig |   2 +
 arch/m68k/include/asm/m5441xsim.h   |  42 +++++++
 drivers/iio/dac/Kconfig             |  11 ++
 drivers/iio/dac/Makefile            |   1 +
 drivers/iio/dac/mcf54415_dac.c      | 211 ++++++++++++++++++++++++++++++++++++
 7 files changed, 311 insertions(+), 24 deletions(-)
---
base-commit: 9edf4183f0d32146b708220d56ee2d35905ba516
change-id: 20260430-wip-stmark2-dac-7060f49dd94f

Best regards,
--  
Angelo Dureghello <adureghello@baylibre.com>


