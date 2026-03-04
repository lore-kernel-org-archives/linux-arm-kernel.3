Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0007EF8FEA
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 14:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yNaltXKAWAjQbwu3MqBmJgovVgpV61nuOt86Xr0pRVM=; b=tp2OVtq1n5XUlluvEYX8EgVtc6
	4IUbQ/g95nqMYVnkxn07IdKZW02usIUUa9+Fto/MCNgHrQrnzDmFnBGaeHxBofGtVYMlDKZoWMyWf
	P5RsZyabdki9aO9R7vItuNPqBYXWl6KLfKV8oapSLYVlsKQ1pE/ViiXaGEXgwAjbPlbYOhLpcziBp
	gih4sbgRD4QK9za4LRUv6eqOm70EYX7NSUFiCKcOvnI9H8FqBgnKa67//dZg7R7mDd9lRVNysyK+f
	7dj7P2q08inntt+p/mXFTEh1BCC0gV6EXwd7fA5XIjXh6W6o/bfzK2K2xqz16PUcH26IwdrMtp8rZ
	1B39wBnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxmqs-0000000HJ4K-09Kf;
	Wed, 04 Mar 2026 14:05:26 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxmqo-0000000HIy9-1Q7W
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 14:05:24 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-483703e4b08so65961315e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 06:05:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1772633120; x=1773237920; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yNaltXKAWAjQbwu3MqBmJgovVgpV61nuOt86Xr0pRVM=;
        b=pvyO5jTK0ckMo3g/TYFOb0qasjLs+saEjZG1V4GVnu5l6xa+IKrs50GAlE3i1uExE0
         LnFF2ro1bxcJ901R6x9HqB8qnjqS5pSA/Y84rLHOn2rK/d3eIUWPoDuZ0nkH0095YTCE
         PJpYvnfjbv5K5NuwE9riEr7TF551DkM3mybuQ1Yt9RqtAImQZcLtznL2BD6+Ve35w54C
         ep3ngyZRWrUk7bIYlaBpjk0wuQWnU1l8FLBy6hzuXhjeed07T7/iu4EV97bZwnmJWXGQ
         QZoQcUztKADW/KRjMxBbEz1R7OwuC2lXZLs8RYqUCujGxwz1VxNr4x/8mD7YGPvTV1Pk
         R7yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772633120; x=1773237920;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yNaltXKAWAjQbwu3MqBmJgovVgpV61nuOt86Xr0pRVM=;
        b=XS0o9dXnCRiQOXF6okFAUBdZHI5wlxBiUoX93lcxBZXKjkgrzGwip2cUtI8Eiivgqh
         H4kpqI1ALNT/TvCM0KbrUg+wFp0POvRv5I3hVC4+6DY37WOUU3iHxA5QkvwUdAQ4HRQb
         qCOWvIxRa/la+o0RuZLun9ChrCYmsOcMbEJ859sR3wbudi//i2le5kjPSwDU48vHcE7m
         kYIUuzjo49x3MUb6wVG7I8Qkg+zw3ydeTB/H87iFmiASWCO8fOFftWKZYql9EgTWKby7
         4GDC9DJVvgUBm/czflcF4cbAD4yhMM7pNvewaUrNFNyHWCC6TqjR7jNGllpMOoaDyMuO
         AqCA==
X-Forwarded-Encrypted: i=1; AJvYcCXiPs0m1P5wQhcwsavkEzhD1w+UeqNe8y+J8ypFkqYoj85gw/MMa2aXCn7PBOWC34YKpuYosIELlEipKlsz27eF@lists.infradead.org
X-Gm-Message-State: AOJu0YzFC1Qi3CFCL0xwQGc/r72LyzrWSy6NudM5v8OvOyeErRdm+tUa
	lSkoU+uvHalbRZ/xgv2pLXad4SfJOqi+T4W+hYis1aLcFagDuF0pP3ryWgUIQiI5jSw=
X-Gm-Gg: ATEYQzxOwn4hvlM5Bzo8xOP7gjlIJZjTTRaF3KbekDofgfMS30uM6D8MSBnRt6iFqnH
	kw9sjmHxmCPvC2cesV4us0X5GWmFe7eSEA8/pkmJqHEXhav7xK6mGFNOJkSvVCAfVZOfJc05cxO
	9CHz07eaVukXk/SDuRZ2BmiJ4xaRc9XcnrYZuBiPhy+n+xo1tQ4TSnSpociIVNeTp/EUPfPldjP
	/gj3vxacwkohQaHswMPfDrZ8LLQeH6vELJH/YfG8Vwlm+BXRe/1Ngnay7DXd5B/6/+3C7WBLUNB
	LraqOnkb0exjsp9/wEvUpWN6nz3wMBJWwgIWDxvjMsEyyJkiiyMz98c9pqdxWRp7bt3/0eaq2wG
	9H5a5+Q9VTlXissl80yB3bNjc2LsuCB0BSgpepXaDIt7qP4CDw+g0A3ULAyIsrRTZvZWeVcMCAE
	sL84RTzNIZWV7GfQ==
X-Received: by 2002:a05:600c:19d4:b0:483:a352:b4e4 with SMTP id 5b1f17b1804b1-4851987df8fmr36433065e9.6.1772633120448;
        Wed, 04 Mar 2026 06:05:20 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-485187b6ffbsm59296165e9.2.2026.03.04.06.05.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 06:05:20 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 04 Mar 2026 14:05:14 +0000
Subject: [PATCH v6 1/6] docs: uapi: media: Clarify HEVC slice_param
 bit_size, data_byte_offset
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-media-rpi-hevc-dec-v6-1-93868ae6dff8@raspberrypi.com>
References: <20260304-media-rpi-hevc-dec-v6-0-93868ae6dff8@raspberrypi.com>
In-Reply-To: <20260304-media-rpi-hevc-dec-v6-0-93868ae6dff8@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 John Cox <john.cox@raspberrypi.com>, Dom Cobley <dom@raspberrypi.com>, 
 review list <kernel-list@raspberrypi.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 John Cox <jc@kynesim.co.uk>, Stefan Wahren <wahrenst@gmx.net>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_060522_404293_31792651 
X-CRM114-Status: GOOD (  14.28  )
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

From: John Cox <john.cox@raspberrypi.com>

Clarify exactly what bit_size and data_byte_offset mean when there are
multiple slices in the bitstream data.

Signed-off-by: John Cox <john.cox@raspberrypi.com>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
index 3b1e05c6eb13..a54e8ea29440 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
@@ -2399,10 +2399,12 @@ This structure contains all loop filter related parameters. See sections
 
     * - __u32
       - ``bit_size``
-      - Size (in bits) of the current slice data.
+      - Size in bits of the slice_segment_data for the current slice including
+        any emulation prevention bytes.
     * - __u32
       - ``data_byte_offset``
-      - Offset (in byte) to the video data in the current slice data.
+      - Offset in bytes from the start of the current v4l2_buffer to the start
+        of the slice_segment_data for the current slice.
     * - __u32
       - ``num_entry_point_offsets``
       - Specifies the number of entry point offset syntax elements in the slice header.

-- 
2.34.1


