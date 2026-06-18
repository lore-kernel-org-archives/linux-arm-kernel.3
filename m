Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 375ACCD98ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 21:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=E9z0pIRRQq0JjZLgtfI21RJrv64iSxf66JeOGPUHps0=; b=ydQ16S3Q8S+69b
	8CnnTCNOpD77Nne0yOa9ZhUCGXg9krzTyk6HBrht3omtl2tT6ObQW3EY9ylC2W6cbvXVEFbrsXuGr
	Lswf9kc3R9jtxwhZAkgBpcfm5c1+hWgKN0RQtkkV4N0vfYab0hNdTgH6R+U3XVy155g7u3ov/Y88L
	A1ip6IC/Ny73BAcHri32gSwOWyn9sru/LEPNsvmqKNcmLYoOmWIQ91kS2lrFhay3KqAjX3Knj7mkZ
	Qt59hQl3YIEGY7HbkMc4rej38UXR2R4MCXy5Tnr2MvLWpx3ritbjJ3MouY9S1dXxO1xthUc91uEx+
	tlVDrv0oLPAcgcp1BJ9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waJuT-00000001nKt-3eWL;
	Thu, 18 Jun 2026 21:04:25 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waJuQ-00000001nJl-0zeI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 21:04:24 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-5aa68d9d4a3so1744232e87.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 14:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781816659; x=1782421459; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E9z0pIRRQq0JjZLgtfI21RJrv64iSxf66JeOGPUHps0=;
        b=hb5emPU7CJxLgFfX17KtUszc/8w4zgynUpG8TyLJ7jrK3alry5Ya5r7kQ0Fxa9BgyU
         yCbeNAybRuISFv+IwGooTwHm8XhEKBOTWteaKFkimr03J40fxu9sNv7K7mBpF8/rfnnP
         11IEXPbgTM24+O4MTSyH/F56LxvVa6WD8RAimb5esKPH6Se1NgD+TME2dFiQZdQnEbh8
         +7zlnuR+dnICo7lnZ+dKd8SPlX6Ea4J4DqaMY+2I7S6YcYbvW7X3XmJUrZw73JpEexJu
         PG+elARJzuY23B+nzIv0XLWiM7uhVtrssGx9coTbsRjfsENg97gO0FocvnonsfSuI0PQ
         nhAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781816659; x=1782421459;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E9z0pIRRQq0JjZLgtfI21RJrv64iSxf66JeOGPUHps0=;
        b=UH699TUmkkn2YISvZuIZtpnSe3GV1S4Vz7g66EYf+02+JftdMB1dQ0bJI0Lo6jhkSH
         lALgfMAWOt6kFuST3YBwAYpAg15q5or4VVWfZGkP6miIEbU9DT4vTk0tcrqSzELxGQcj
         lzcyiLvA4bR2D4ZpaT6E0Uk20wf4lLLtgH151wiw9nzB188bsJTXu8XjoTpzL3UWPDks
         M4kmkk75NJgauypL2yCGcKMHEvcOngb2/T95EXxz0jX0upq2huPCI2a9Y5qok/WyDnOq
         w1Y1USDXhjDXP2dFE30TPkBJvh0eTC1THOfn/fo5dJY7ZK//+zgWkjvW9XgCbba+YYu9
         bPYA==
X-Forwarded-Encrypted: i=1; AFNElJ+3iHPgliEjnkzfjfj1huiqAX6JKRoiOnhdX9N7deCM7MzROovglmxUo8ZnmrhJJUingImtImzPqoBM9tnAjRLR@lists.infradead.org
X-Gm-Message-State: AOJu0YwrXNwC4RhH5U44jVMRLUzwM0/KD7cwJzx3Pli546QEek9w9I5A
	v9AQMonpmy0Dg22Ny5ZqRMMv/gDueaY4tYFTyBIIGTL0NGcOT744MQowyvIHKbR5Y3M=
X-Gm-Gg: AfdE7cls+FGvwo2FL/tccn8jiOYC16MuPeAR7acaqrUEzWbVi2YGicBeoy6yWGxIQXx
	VY8gnto637poFNxXVSy+8ymHWjoCARX38C6wqg9VJUD3qu9e4J/B+fQgtXqqC4geK6Qa5mljtSF
	kpFJttGbmSm1oiyCFPMk9Lu7If8d6jNk0Xxu98+qZY3Ll/Ua3eBwQ+1p99c+cUZ2aNkXwMZrBAr
	TUyqaHkOSxkAvN5itrBiep4AvjvlalJCCSU3qQv6nJXw7QhUjxSbydcQtjPjf5qwHtLxIerdxIp
	pA5rp4OlnKuXF1n4M4HIl36ghy/biBBsZaRNnZhsloKKdzUSMWe8oqjOQPmSSTmqttiaZE7Dije
	zXeR4+rZy8K1eN6cc9vk/Ec75pPFxcFrhKDmnh6yIeXQXCZcNf2sTJMkL3p7zE82LeOpdWjL1tF
	L6/8Ll2q+XRDBLApvX3Q7D
X-Received: by 2002:a05:6512:8013:20b0:5aa:b6a:738e with SMTP id 2adb3069b0e04-5ad57715b49mr98736e87.44.1781816659260;
        Thu, 18 Jun 2026 14:04:19 -0700 (PDT)
Received: from [192.168.0.2] ([2a07:7e81:7daa:0:202:c9ff:fe53:eda4])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad57493145sm108586e87.69.2026.06.18.14.04.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 14:04:18 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Subject: [PATCH v6 0/2] add mcf54415 DAC driver
Date: Thu, 18 Jun 2026 23:04:14 +0200
Message-Id: <20260618-wip-stmark2-dac-v6-0-48761dbb96d7@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4XRy07DMBAF0F+pvMZo/JokXfEfiMX4RQ20qZwQq
 Kr8O05YFKgrlleae64ln9kQcgoD227OLIcpDak/lIB3G+Z2dHgOPPmSmQSJoBXwj3Tkw7in/Cq
 5J8cbQIi6877TkZXWMYeYPlfx8ek7D+/2JbhxYZaLXRrGPp/WyUkud7f1SXLgQVFssXUaSDxYO
 r0lm8O96/eLtlaNUPVqdJ6CAReNoN/V5W2Tuqwb0NeEKgQYqUlEJ5y6tS5lvSrQBiCvDGFTWRf
 /rItCtI12Ckl3AnyF0D8IJa4JXYgmoCGrpTC+RpgLgaLyA6YQtkHbKoXojftDzPP8Ben+oGRFA
 gAA
X-Change-ID: 20260430-wip-stmark2-dac-7060f49dd94f
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, 
 linux-m68k@lists.linux-m68k.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, 
 Angelo Dureghello <adureghello@baylibre.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_140422_310877_732B1836 
X-CRM114-Status: GOOD (  11.94  )
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
Changes in v6:
- Removed patches 1 to 8, already pushed in m68knommu for-next by
  Greg Ungerer <gerg@linux-m68k.org>
- keeping changelog in each single patch, where any
- Link to v5: https://patch.msgid.link/20260610-wip-stmark2-dac-v5-0-b76b83366d5c@baylibre.com

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

To: Jonathan Cameron <jic23@kernel.org>
To: David Lechner <dlechner@baylibre.com>
To: Nuno Sá <nuno.sa@analog.com>
To: Andy Shevchenko <andy@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-kernel@vger.kernel.org
Cc: linux-iio@vger.kernel.org
Cc: linux-m68k@lists.linux-m68k.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org

---
Angelo Dureghello (2):
      iio: dac: add mcf54415 DAC
      m68k: defconfig: update stmark2 defconfig

 arch/m68k/configs/stmark2_defconfig |   2 +
 drivers/iio/dac/Kconfig             |  11 +++
 drivers/iio/dac/Makefile            |   1 +
 drivers/iio/dac/mcf54415_dac.c      | 183 ++++++++++++++++++++++++++++++++++++
 4 files changed, 197 insertions(+)
---
base-commit: d43c76b1fd85cf6f9a53145ed397d10e76f99213
change-id: 20260430-wip-stmark2-dac-7060f49dd94f

Best regards,
--  
Angelo Dureghello <adureghello@baylibre.com>


