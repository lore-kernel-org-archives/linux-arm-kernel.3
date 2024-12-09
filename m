Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A467CE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 15:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fBemlKVePg1M8JMVZCDuH/Kc392eD263a2QapCaGV9U=; b=jH+GC6mT0IJjMpavHlZkw/4myQ
	0ys1/aJZ2DAc7TkwFiULszL96Qd6fxlZSNpI4KoFsmblYTbKFZ4A2TjtzGwtJylMGZEYDp6AfICGp
	o9a2D25xGNX88NuPUfju9zSPaHhH7Oz52J02kUkQZo0Ihj+Shd/K4P98WXO7hbpQX7aGpt8ZD0fHg
	ZmLYP0Vr/qNQvPXnlee0WV94BBK0laLV06M1sKDVyhkiQeKPPvwng2Kn2kh+Lwthj7Q2tMcBdsJI0
	Oa0OLwACNBKewfWZ5WKjrrygFJDj7uavz8R0TewJ8ZrRHz3lD24bM45oFNCoY3IqloYOYc5ePpQDb
	Qi3wEXZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKfMj-00000008KeA-1pGK;
	Mon, 09 Dec 2024 15:08:05 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKfL6-00000008KEF-0Hfy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 15:06:25 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-434f0432089so16433165e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Dec 2024 07:06:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thaumatec-com.20230601.gappssmtp.com; s=20230601; t=1733756781; x=1734361581; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fBemlKVePg1M8JMVZCDuH/Kc392eD263a2QapCaGV9U=;
        b=xlIrA0ygL9IrHZGo8e2RFW/AkQ4gF41Kep9vWmLqNHtb1RNcc75w0cwqsG1lOe77Eq
         e+9rEr+iu0KhXIaLQVcwmpTZXLkzqR+GuWFbBlpeTp+u8oyQB9h1PFjsrFgg3R8CDFxY
         fat+yT/hl+vnRiOFVBp0ODG7YxveFmShQia4eshkS1C3BaJfMnWuH4uge46RkFcOOMpq
         ar7mhIuH8KjXgaDSOh3z1uhs29xUnnZVKcuhvDiy3P7eLgjtWTEQWqhpAz1A58W+WbJX
         I4QFG+8ZajBIXpM4TkaVqz+R/dCD5PhBMmz0GCAnTwAM1zaN6vEO/bdhNeW6YRY7QCsM
         dwjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733756781; x=1734361581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fBemlKVePg1M8JMVZCDuH/Kc392eD263a2QapCaGV9U=;
        b=RaqvjLBYfiCSTyfXB3/0H3sHsfEAYG/4WSZ2vBieL+Furi7y7KTIu67M6JMLjbaY2P
         uqq0X/C12EbYL+OQVVM2Z/t1cj0aoqHoFuhne2GM9BNBPb45wN50l/6QIt3u9riXlmdu
         Nlq2HV2YOJu8yeHD1zKHG7kC0fz9nkws9RgMI8/0d4l8rN0akaYRD1jHDD4hJveFRAeQ
         EdyWNpOXpz1vnw3kyXDgyr5GGyLoYZVNru5/G7YdFqKZf11ihEaLr3qd1sYSxjqT453e
         uCD43yKnj9qjA97AzQCbO2QaTW2pLd7mHMYqftNfC81A7pzqToBsD8tCGEpAuchJkU6l
         S0sQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbmqaZtAtrzXwGLtd1IP1zT5S9rk9U8CMpVRO7Ph1abmRrHmw502JRhzobGfmAct38HxCyMwCiJZEMSAIZyBLJ@lists.infradead.org
X-Gm-Message-State: AOJu0YzJGCLRFldreBhiECAxK6BxoLsuF81+EDjJPWv8IkMxCJrgegF3
	Ut7ULvX5g4nl5EWE2wgq40x6qhKRd7W3EQ+CggpRwfDeXqbb/SfltBZiyd9XtuM=
X-Gm-Gg: ASbGncshrW7oeZRqXBGG+oWGFJ/lfQkz5sn7Gl3lkkNHrTGYR6gK7gCPF4ByPaehJIA
	eYAQSu/R9QN2bGoJGy+vi/Zg2pI9lOtHV5Bx44JNyrg1O0kBVnhwpodYMHKn0SsRBCsTN1j5/xm
	I8k84hqVOnUctJy+4qUcBeQsd1ASKC29WTfBTEKlliSYl40ffJ0IHmmX6U2n9yLSznRb9u89B+S
	dq3Ad8D6wZon0lcq7OUfZaigJAlO711+7CtKsO9
X-Google-Smtp-Source: AGHT+IEaMojRUAQLLwed4/ER+OeZapLgzpX/2UyzkziLJwq8W59lZWRdfU3Peh7xaUCEk69zEFgm5A==
X-Received: by 2002:a05:600c:a09:b0:434:fb65:ebbb with SMTP id 5b1f17b1804b1-434fb65ecb9mr25947035e9.17.1733756781170;
        Mon, 09 Dec 2024 07:06:21 -0800 (PST)
Received: from fedora.. ([91.90.172.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434d43809fdsm103296665e9.1.2024.12.09.07.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 07:06:20 -0800 (PST)
From: Daniel Semkowicz <dse@thaumatec.com>
To: heiko@sntech.de
Cc: Laurent.pinchart@ideasonboard.com,
	andrzej.hajda@intel.com,
	andy.yan@rock-chips.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	jernej.skrabec@gmail.com,
	jonas@kwiboo.se,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	neil.armstrong@linaro.org,
	quentin.schulz@cherry.de,
	rfoss@kernel.org,
	robh@kernel.org,
	tzimmermann@suse.de
Subject: Re: [PATCH v3 0/3] drm/rockchip: Add driver for the new DSI2 controller
Date: Mon,  9 Dec 2024 16:06:08 +0100
Message-ID: <20241209150619.33998-1-dse@thaumatec.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241203165450.1501219-1-heiko@sntech.de>
References: <20241203165450.1501219-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_070624_096811_B3B7CF72 
X-CRM114-Status: GOOD (  19.68  )
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

Hello Heiko,

On 03.12.24 21:54, Heiko Stuebner wrote:
> This series adds a bridge and glue driver for the DSI2 controller found
> in the rk3588 soc from Rockchip, that is based on a Synopsis IP block.
> 
> As the manual states:
> The Display Serial Interface 2 (DSI-2) is part of a group of communication
> protocols defined by the MIPI Alliance. The MIPI DSI-2 Host Controller is
> a digital core that implements all protocol functions defined in the
> MIPI DSI-2 Specification.
> 
> 
> While the driver structure is very similar to the previous DSI controller,
> the programming model of the core is quite different, with a completely
> new register set.
> 
> Another notable difference is that the phy interface is variable now too
> in its width and some other settings.
> 

I did more tests with different LVDS displays. I tested following
configurations with DSI/LVDS bridge:
- 1024x600@60.01
- 1024x768@60.02
- 1280x800@60.07
- 1366x768@60.06

All of them worked without issues, except 1366x768.
With this resolution, video is blurry, and offset incorrectly
to the left. There are also repeating errors on the console:

  rockchip-drm display-subsystem: [drm] *ERROR* POST_BUF_EMPTY irq err at vp3

In correct operation with other resolutions, there is no error.
I am not sure if this is a problem in your series or rather in VOP2
driver.

I tried to track down the problem, and it seems to be a generic issue
when horizontal line width is not divisible by 4.
Lowering line width to 1364px fixes the issue, but of course I have two
vertical lines of black pixels on the right.
I also made some tests with 720x1280 DSI display. Lowering horizontal
line to 718px shows the same problem. With 720px and 716px it works
correctly.

Kind regards
Daniel


