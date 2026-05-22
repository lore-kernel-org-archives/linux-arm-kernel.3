Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8E88CD5BB0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 22:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3jZ2LpbUHZS3fbviqQINQwiQlZjuFtm/3mFTRxLA3Dk=; b=tj6Tby+xfDi3s/
	DZFkIbhMdwt5GlHBzSQAvakydlbyjhcsEZabv2ti8WdybUCGfhnuEFXGhvDkJ/msvrEG9Isya67y8
	LVhWqx4r5IeiGMbRWyWc9nIqq7nyKLTGz+3PMs52hul4pWMnz1l+n9l71eszrARcYbDvwpBhfEDmS
	1F+Onqgq98A3a41triyctSMaWBjFFeH+kaXK7WRs7lgspEvPV/kPE6j8DQaOR2ya69yIq5exBJdwf
	ETcbYR3nnOD0dJgvkF9xUBq1Iv1xn5yemLHnGv0oc9e6QOgX1P89p87AlQYtVaTf3QYg7me1s+3m1
	sa4ntttScBX5Bt1MZdpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQXJA-0000000Bwyv-1FgJ;
	Fri, 22 May 2026 21:21:28 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQXIz-0000000Bwr8-4AMk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 21:21:22 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4903fd19957so17751515e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 14:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779484875; x=1780089675; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3jZ2LpbUHZS3fbviqQINQwiQlZjuFtm/3mFTRxLA3Dk=;
        b=k51TgjEfsxbFlkZQYiG/k0eEb/bVAHHOesyASqQu/taMz5X7/WTwi9uu03eQotmIlt
         rIFYE7xpeMkBIvsYKed2G1JwND8vmKEKZLfTj3nzqnWVCI1GsgHrsNpPNwy99MveuYOC
         7hUHRFDnZJNhx7srxOyhu7Q6OpB4iFilyZZoVB/zukEP0cQ6juxpvnyN3WpMJA7vJQ82
         Yi9yQNJ+Tu7P8XaffCKIJljX+RRWL/cEwpwoXy9TXDG5aG02PmG6Q2zVZeV91LflVUuu
         Pw4YetszdJM6R55hw52+OARzYx1htTT/2hD7q4uYAZfK5jbNJ+zBLJWBdhqqppuTgYlQ
         8iHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779484875; x=1780089675;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3jZ2LpbUHZS3fbviqQINQwiQlZjuFtm/3mFTRxLA3Dk=;
        b=dKln5/EVTw+06ZzvhuE2fgJGgwoS+9s3jzxi9bzom0G71qdA7Pl9I8eJVMzGismQvs
         uO59jh3Zp/wwK/ukvdFPqkDvl7pecJ7lnpyMBFdDKGaV1xClweGrkPVScdpC3EHFSbL2
         lb45Ei1wY/9y2LhE/wpbOwuGXUVtrHZdFPXm7nTrQR5SRIHXJvi0+v+SaZjsxr3oIXBR
         ZfIKIBCtumtO3qPIW8lo9EcB75+GdMuNSlEjQtOmBou7IhmnnHFw/QZpn3G9tYTUIhcK
         VQm62yoaJ5qJCndeBAU2osL6+WkEG8MC7GKBURLeo+faVbzN7iLoRAXajPEGLEafAjGr
         9NgQ==
X-Forwarded-Encrypted: i=1; AFNElJ/ltUHZDZ1O4NWnYfkIxukMsksfyCt5xFDVkgh2CopFEK9GN0C4VNqwfHBhIClsdbiNmUf/uHOkZKbtMaw6Pi33@lists.infradead.org
X-Gm-Message-State: AOJu0Ywt3PxwxYqfU7q10W5uVDL+NWtik4pZ3N7ZkaA6VuRBGho4lCt+
	p5RSSf+dm0ED3hIVOeGNtVjOV96GQtL2srJGzf7OqaKC5jNaXpUkE1xJuKv5vk/W4+c=
X-Gm-Gg: Acq92OGfNHdRArXnkyBW7v/IlW8BMzSwJ+lSmr7DiwVwW4eR8azZ58+i2PJS777gsE4
	11hqOhNMQyBmiOXSgh9qWnA3zD7EsaQD22uNAzo2dvRywc3cYNrDExq2Vrs7YuTOZom0sB5ijXX
	/93l41BqGqqAttphqDSid0HgxvjL4MTFsHnAzHwV13PtXYVlF5EMgNsbVlyjEHRntwV3Dt8A5Ho
	kr/4bH1YupMBt38dWm+MsmvriHdcA9QLPeCZ5R+taPV3EXU+4EBTKUz3hxRfl9QxCpoArlBerK8
	02STRBzeRo2+hXfdyBI2qSs4CeeTcO9Yw/CoDuiZBKLvqwznKAtRR4rFZ2Ap3CmEAeF4Wuz6lzQ
	fxNb8BYJz+NZ0M8FoVAXHvtC8gNG7rTaBfsfElYd5kXo2jxHyRWHbFu+gnO3cvD9OZUhTDH9Flq
	ccf7vriwm2k+johYoVrc6eagcaRVpKLM4=
X-Received: by 2002:a05:600c:46cb:b0:489:1c1f:35f1 with SMTP id 5b1f17b1804b1-49042482762mr77587885e9.4.1779484875487;
        Fri, 22 May 2026 14:21:15 -0700 (PDT)
Received: from [192.168.0.2] ([2a07:7e81:7daa:0:62cf:84ff:feee:627])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454a0b82sm73312225e9.9.2026.05.22.14.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 14:21:15 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Subject: [PATCH v3 00/11] add mcf54415 DAC driver
Date: Fri, 22 May 2026 23:20:28 +0200
Message-Id: <20260522-wip-stmark2-dac-v3-0-16be0ad35a67@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4XOTU7DMBAF4KtUXmM0/kuTrnqPisVkPKYG2lR2C
 FRV7o6dLiqgiOWT5n1vLiJzipzFZnURiaeY43AswTysBO3x+Mwy+pKFBt2ANSA/4knm8YDpVUu
 PJNfQQLCd950NorROiUP8XMTd0zXn9/6FaaxMvdjHPA7pvExOut79rU9agmSDoW1asoBq2+P5L
 faJH2k4VG2pOmXuVwN5ZAcUnMLv1frbZG7rDuxvwhQCnLaoAiky6g6h/iFUIdq1JdOg7RT4H8Q
 8z1+hJ30XhAEAAA==
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
X-CRM114-CacheID: sfid-20260522_142118_066230_5003EB47 
X-CRM114-Status: GOOD (  13.88  )
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
 arch/m68k/include/asm/m5441xsim.h   |  42 ++++++++
 drivers/iio/dac/Kconfig             |  11 ++
 drivers/iio/dac/Makefile            |   1 +
 drivers/iio/dac/mcf54415_dac.c      | 207 ++++++++++++++++++++++++++++++++++++
 7 files changed, 307 insertions(+), 24 deletions(-)
---
base-commit: 9edf4183f0d32146b708220d56ee2d35905ba516
change-id: 20260430-wip-stmark2-dac-7060f49dd94f

Best regards,
--  
Angelo Dureghello <adureghello@baylibre.com>


