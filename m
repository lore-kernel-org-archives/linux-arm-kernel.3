Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24058CD37B6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 09:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3M6rRLTQ9CGPGf8NA7+4xvB1DmVHioIYgHph20eH9Ks=; b=anLoz18ofiAoNA
	3xE22CFWJIoNIJsiJyt/taM5Aj8jmW5r2FxC9flE6tCBArvxVvXvA0t3s5AWCztom7+DUQzlLceFw
	pwxqZxc+9H9iz1VyU2X1iyUhReDfE42siSSy+wrfHEX2Fxn0mObFkTmE/mkXiQZRpIk2dxwLqp/rI
	Y8JoG8tfXcCnskwFxjev4lJ3teHRpB6I214Iy3eLBvQBaJXSrMTlneNp5PvvVFMVK/46/m4WdBDez
	Af9Sj5eAYpQlqlIb93ktEYIrGGw9fRJcaSFmfBFhft/j73wEMH2bizoetkLvEskdpzHpZCWVvS2R8
	GzERuU9RlhQ2UQ+3PtgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN5fx-00000001rld-33Qx;
	Wed, 13 May 2026 09:14:45 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN5fu-00000001rk8-1SNV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 09:14:44 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-48d146705b4so78723705e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 02:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778663680; x=1779268480; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3M6rRLTQ9CGPGf8NA7+4xvB1DmVHioIYgHph20eH9Ks=;
        b=Uxi4Ed8Ao3OZi1PaaZvF0pWmNAy+46NoAqim1bVLZ4Bwt7mV8vIu0L697/qADTsSdc
         +Syd5Hk9KGoNpK/FmWdBdLj9pOeq9Uu8Kh+Tb5CAUhI/V3NIewTvbcvVfgsewOZ57JMz
         LoFUMtxFeCAyC8eM6qS132GQ4jcra39KlvbVxVL+Q2SOMEFo5ohwP0hm6wn5iqlZ0loL
         zY7Vj4vV8bok0CYuNZr8f2c99CMfMuz0XeGzoaSPayKURzOyHdoQEeHxGVAviogSCmoc
         FjlJnJ4kQ+QGKgQ5OXMWmg4g/TsC6ikIVJULCpoTQzrh+yjLezfsgI/wHcyaiPOz83eS
         U+cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778663680; x=1779268480;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3M6rRLTQ9CGPGf8NA7+4xvB1DmVHioIYgHph20eH9Ks=;
        b=rGRjuy+fs0VCU+p51sxDUJ+IIlDtxkCnNDzpaFcOISb39oBJjFpWH3jYvs2Jkg9dzd
         MwULsWXSvi4+nPeyi1RLb+DEOkYwKmFyLMjKhspjO0J0KNzpQperXCo6iEN8HCe9/eLN
         HOuHVjy4S933hPY/JqpLzQJ977w6SUU3eKjpjtxTBpR61yiQLOKgH65pEn13DCLxiDVi
         XHp54Y6jijcDNtRrHPA94gvjBHwRCW+mmiw2zChbtDfryZpPqKJUGBTKYVVhVDxaeHuR
         O+9oNNTta4w1lMaFNT+1IEW+Bi2FTHZihLcxpViHWePygVAU8hGj4uZ/OUjFBWFqAPz3
         t1oA==
X-Forwarded-Encrypted: i=1; AFNElJ9ZqwXUl5egXl1bjevUxdgJqpU8Gqd5C23NHciht7oe2WxIoNxzs+zbR1oAnNMDEHyucwso+BJLzTN0bDRebDNh@lists.infradead.org
X-Gm-Message-State: AOJu0YxhSDsoL0TtdDSQgl9GA3iYXt80UQjshHoXGvK2hSV1B6aTofmj
	rdlXL30hkyrKjcjYUFayu1hP/VKRkMNJSqT4h8xIjx9+Je9xGgHyOY2mPd4L8VRjrls=
X-Gm-Gg: Acq92OFAdmzkK+Yjqb7K4Fl8fck/WqjHU5nqDCF2ibZGwf5h32+9AzTR5zqxzAMOEgl
	aoAgqre1kj+/ACXLhsRlZ1WCTnah5EcTTminq1NPCQkLbHvFwsv69tZClMJDKP6S0s7ZKpK4+JY
	pYiSPjAtwGFwkWbcIrgbIk2WMrI9WV152Rz647Z1Mh0PIM65GS/Zeml9rFekQm39KubbuH9xN1N
	w1YUAI9LuVkWY4hkm7WxiHm2XxfrWMm+4ApfgLHUH6bO0wON0QRi5szUaGwAtsp3fnMyvbrpgNK
	cv9N8kftJROLDcCuuxL5bBGng5oCim7z2DheHaykyx7gFUWW+LsjafDvAuS0ZnAtmp5/tHbUOT6
	k6hI28RG+ECBA7W+DSpt5EZ/H8o/UMnkyO11Kd++pxRj2MJEuV5j+Wvo7oU1FS+wCDFM+okTI3U
	rtJrC/vd3d6pqu+Sfi05zHMB8kufq0ONS7LJJon+89bw==
X-Received: by 2002:a05:600c:c4ab:b0:485:30d4:6b9e with SMTP id 5b1f17b1804b1-48fc9a3c1ffmr38082135e9.21.1778663679846;
        Wed, 13 May 2026 02:14:39 -0700 (PDT)
Received: from [192.168.0.2] ([2a07:7e81:7daa:0:62cf:84ff:feee:627])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548e6a66bfsm34590821f8f.4.2026.05.13.02.14.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 02:14:39 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Subject: [PATCH v2 00/11] add mcf54415 DAC driver
Date: Wed, 13 May 2026 11:14:24 +0200
Message-Id: <20260513-wip-stmark2-dac-v2-0-fcdae50cf51a@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4XNyQrCMBgE4FeRnI38Wbp58j3EQ5rFRu1CUqul9
 N1N6kFwwePAzDcT8tpZ7dF2NSGnB+tt24RA1yskK9EcNbYqZESBpsAZ4JvtsO9r4c4UKyFxBik
 YXihVcIPCqnPa2Psi7g/P7K/lScs+MrFRWd+3blwuBxp7v/WBYsCaCZOnueQgyK4U48WWTm9kW
 6N4MLAXkQD/JFggIKFcECOJZN8I8ocggcgzLlkqeEFAvRHzPD8AnWT3ykkBAAA=
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
X-CRM114-CacheID: sfid-20260513_021442_658268_32A1B851 
X-CRM114-Status: GOOD (  12.20  )
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

Note: this patchset depends on mew mcf_read/mcf_write implementation:
Link: https://lore.kernel.org/linux-m68k/209d0653-6386-4b64-9e15-e358f84453ab@app.fastmail.com/T/#t

---
Changes in v2:
- keeping changelog in each single patch, where any
- Link to v1: https://patch.msgid.link/20260504-wip-stmark2-dac-v1-0-874c36a4910d@baylibre.com

---
Angelo Dureghello (11):
      m68k: mcf5441x: fix clocks numbering
      m68k: mcf5441x: add clock for DAC channel 1
      m68k: mcf5441x: setup DAC clock name as per driver name
      m68k: defconfig: update stmark2 defconfig
      m68k: add DAC modules base addresses
      m68k: mcf5441x: add CCM registers
      m68k: mcf5441x: add CCR MISCCR2 bitfields
      m68k: stmark2: add mcf5441x DAC platform devices
      m68k: stmark2: use ioport.h macros for resources
      m68k: stmark2: enable DACs outputs
      iio: dac: add mcf54415 DAC

 arch/m68k/coldfire/m5441x.c         |  21 ++--
 arch/m68k/coldfire/stmark2.c        |  51 ++++++---
 arch/m68k/configs/stmark2_defconfig |   2 +
 arch/m68k/include/asm/m5441xsim.h   |  42 ++++++++
 drivers/iio/dac/Kconfig             |  10 ++
 drivers/iio/dac/Makefile            |   1 +
 drivers/iio/dac/mcf54415_dac.c      | 203 ++++++++++++++++++++++++++++++++++++
 7 files changed, 306 insertions(+), 24 deletions(-)
---
base-commit: 25c66a1b49f3c5463ee8266a3fd5256cbc794610
change-id: 20260430-wip-stmark2-dac-7060f49dd94f

Best regards,
--  
Angelo Dureghello <adureghello@baylibre.com>


