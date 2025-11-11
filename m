Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52257CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 21:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:MIME-Version:Message-Id:Date:Subject:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sekYXjOrhbrEeTR1KVQQRJq/2k2UhXo++7CMidIcSxc=; b=MAtcmQf4dXTKreYcSRG+RtdxHx
	Bcoamev0q7Wo1zlVNPzmZX1EcHkcci9Bz0ygGP8X+f1orEQKYycIOnAYIHNbvAk9Zp+ZHR1uSq7ZC
	dtUSVWfoeFnzqY75GOnsmggxMETn/WZug7UCmejFb8QfyB4hVOvqyposcxW+I3DTpP9KuayM6QDlo
	fdtmEiySJ6MYkBxg8c2ex2oDA8kf0lnm3CKGmt5v4SnRQimTveWVGHH+Y/axkmHojXh+BURIz3Gs2
	DupsiWFCUHt2H5YBGVtjJ1bCv2SC5eTN1HbXR+Tpzq7GoXU4VmQIZcqJtg+eL2IRi30NGVEMgdRy1
	FCBya66A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIwM1-00000007ouh-2mBU;
	Tue, 11 Nov 2025 21:56:45 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIwLx-00000007ouJ-3IzA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 21:56:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762898200;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=sekYXjOrhbrEeTR1KVQQRJq/2k2UhXo++7CMidIcSxc=;
	b=gAn/aTVHdS4N0pE4j6Kz1uB7mI6QI5VbP6YZzNShuWq992upcCK9SHrcoeg/BA7kAn3JLb
	uby44yqgaCfvQlS08yX5SfFuenkBv/JW+J3pslP9mNzRIXJGp4D+NjYuP/gfu1PiakC9b+
	hbuv2vrBKQm7l2wxYWyRkRejMsjMqyQ=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-346-f4w6MensNVW7Szi0xYxTGw-1; Tue, 11 Nov 2025 16:55:09 -0500
X-MC-Unique: f4w6MensNVW7Szi0xYxTGw-1
X-Mimecast-MFC-AGG-ID: f4w6MensNVW7Szi0xYxTGw_1762898109
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b2640347c5so61186085a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Nov 2025 13:55:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762898109; x=1763502909;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sekYXjOrhbrEeTR1KVQQRJq/2k2UhXo++7CMidIcSxc=;
        b=sByun9yL2eBD5ylCP8TUEyCHcRXiP/k2nLKei05/vNJl2sVnk6UtfV+DY1VydT3wgM
         AvV1ntrvsyon9gXhwasxqKsdu8uG0PLi3lzqkAX703586UN6lr2RAhrAKyt4M+bvzoRO
         /TSr+9AiBuS3a46RSyOLiOkRM3SYnwIvoUtPF3Uz4XeqPDK6oc7WESbXHdN8UR3PCraj
         q5ATubGADrPd5sH22LxkeE/l9IkvlxCUv5SudqXp6/H7tdliTbB3mxH5thmVthUB627Y
         GEqedsiGdSxYcIxConEGDsSut8a1dG4bljIHQfazehriauVHoF2dxcWYwuRPYXs/SrDS
         fEGA==
X-Forwarded-Encrypted: i=1; AJvYcCX7CjEts+syY/qSCrfKIA9aXBoGYwRe6vYupZr0SHaE/6PPzKSlgBsAY/8k6qVNVVDg00SFJHkQPTzkKcFGl+Zs@lists.infradead.org
X-Gm-Message-State: AOJu0YxHqluut6mOq59Roq5S0vD7fKUMBxZCH/XTdZrmkinZxTn7+iOC
	saQJpI0urupDF7mUK+CFSN37x5CTc4SpawxB3qSOA0HbMW756zf/5MRjaHTtT71smdHFLac/OrR
	ZT0KqrDn6bu6tX0Yek+cB+0E4MsBIEq4mjB+DmO0a1EpzAuRoRTJcJ3fGxkQ2Ugh2GqGwGAvsil
	F2
X-Gm-Gg: ASbGncuv5pC2ydLaE/GRbvo38nqjYfhEFt8ah6KsD8vgADW70e8tKDRjKcaXEsUXAWA
	j8u65tH0ZqOsDFVJG5n7IwZ3GadtjVLkbKU1snsc+rOE3n9bqetYaKdfsMm+0hv6b0eVb0yLfzj
	xHMbhbw2FEjRuk+ml+KsrG40XUBWNh9zi1CzuIy/tH7LDZmwf6GaPbp5Pi5I4EBT/MM8YqCM57n
	1ZaP0P5mstGvSj6c8M9YS2arLmQsqr3mrMlo2nvfvtMl6d4INNz6w/ydgLSgbPX6BNV7y0ab4rQ
	lKEWlpoKyLI5rakkmcCPrPQVIpfN9hH2BW1eFp0UAj43d+CWL0FUQz75P3L1+AYgmm9YHoLuLDI
	wqojG9IAM2LRo3zG847EZ59ynpkQO7Pw=
X-Received: by 2002:a05:620a:1997:b0:891:c122:4296 with SMTP id af79cd13be357-8b29b7daae7mr119517885a.41.1762898108669;
        Tue, 11 Nov 2025 13:55:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG3q6RJGL4tXdFv0MBpLJ0zIlSCrqGboU4B0wfcb2rJgjVxJ9n2CSCtq7Mqu5LGBcREsoJ/Cw==
X-Received: by 2002:a05:620a:1997:b0:891:c122:4296 with SMTP id af79cd13be357-8b29b7daae7mr119514385a.41.1762898108252;
        Tue, 11 Nov 2025 13:55:08 -0800 (PST)
Received: from jkangas-thinkpadp1gen3.rmtuswa.csb ([2601:1c2:4403:8750:d964:d6a9:f204:ed2b])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b29aa032fcsm61335085a.49.2025.11.11.13.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 13:55:07 -0800 (PST)
From: Jared Kangas <jkangas@redhat.com>
Subject: [PATCH 0/2] pinctrl: s32cc: fix uninitialized memory issues
Date: Tue, 11 Nov 2025 13:54:10 -0800
Message-Id: <20251111-pinctrl-s32cc-alloc-init-v1-0-071b3485b776@redhat.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAIKwE2kC/x3MSQqAMAxA0atI1gY6OIBXERc1phooVVoRQby7x
 eVb/P9A5iScYageSHxJlj0W6LoC2lxcGWUpBqNMq7Xq8JBIZwqYrSFCF8JOKFFOpFk1PBP1xls
 o+ZHYy/2vx+l9P8MHwpZqAAAA
X-Change-ID: 20251106-pinctrl-s32cc-alloc-init-cb04ebcc72f3
To: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 NXP S32 Linux Team <s32@nxp.com>, Chester Lin <chester62515@gmail.com>, 
 Matthias Brugger <mbrugger@suse.com>, 
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Jared Kangas <jkangas@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762898106; l=2516;
 i=jkangas@redhat.com; s=20251111; h=from:subject:message-id;
 bh=MdOVB+m45rMEFDn+Bq+cwePT0GndRxWDbiIFqpt2YCc=;
 b=AdTasHXTJYSkS585uvDHRJ55IZFnrgZJSfaxnaDSGB/RTgB+JoI7jS7M+GDTllmpRwiXRd6KK
 tUaoDvX0B3UCOC4ZPo6dQSBEoeXz6M5/Hr0bB51+McJESjBxOOOBew7
X-Developer-Key: i=jkangas@redhat.com; a=ed25519;
 pk=eFM2Mqcfarb4qox390655bUATO0fG9gwgaw7kGmOEZQ=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: yoWB2x_0H5c-XFfGfuHM5opfg2Vf80WSZAxvkkCB6LA_1762898109
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_135641_930337_55BB71BF 
X-CRM114-Status: GOOD (  10.72  )
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

This is a small series that fixes some uninitialized memory issues in
pinctrl-s32cc. As an example of how these can affect the kernel, when
probing i2c-imx, a memory allocation may fail because of the
uninitialized memory giving a junk allocation size, which prevents chips
on one of the I2C buses from being detected:

        # i2cdetect -l
        i2c-1   i2c             401ec000.i2c                            I2C adapter
        i2c-2   i2c             402dc000.i2c                            I2C adapter
        i2c-0   i2c             401e4000.i2c                            I2C adapter
        # i2cdetect -y 0
             0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
        00:          -- -- -- -- -- -- -- -- -- -- -- -- --
        10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
        20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
        30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
        40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
        50: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
        60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
        70: -- -- -- -- -- -- -- --

Compared to when no failure occurs:

        # i2cdetect -l
        i2c-1   i2c             401ec000.i2c                            I2C adapter
        i2c-2   i2c             402dc000.i2c                            I2C adapter
        i2c-0   i2c             401e4000.i2c                            I2C adapter
        # i2cdetect -y 0
             0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
        00:          -- -- -- -- -- -- -- -- -- -- -- -- --
        10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
        20: -- -- UU -- -- -- -- -- -- -- -- -- -- -- -- --
        30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
        40: -- -- -- -- -- -- -- -- 48 -- -- -- -- -- -- --
        50: -- 51 -- -- -- -- -- -- -- -- -- -- -- -- -- --
        60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
        70: -- -- -- -- -- -- -- --

Signed-off-by: Jared Kangas <jkangas@redhat.com>
---
Jared Kangas (2):
      pinctrl: s32cc: fix uninitialized memory in s32_pinctrl_desc
      pinctrl: s32cc: initialize gpio_pin_config::list after kmalloc()

 drivers/pinctrl/nxp/pinctrl-s32cc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
---
base-commit: e9a6fb0bcdd7609be6969112f3fbfcce3b1d4a7c
change-id: 20251106-pinctrl-s32cc-alloc-init-cb04ebcc72f3

Best regards,
-- 
Jared Kangas <jkangas@redhat.com>


