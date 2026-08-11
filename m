Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07A00C5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 21:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6aQogsOegT+g6QZpcciAxI27XEPgO8Du/rqMWdvlx5I=; b=Z4QiMU0aM1gzQVjTIUfPtTIcOO
	w40ffT4TNgmDOBpaBBjMy6rRL7ZGRlsUJ65yF/2RN4sZGIcrHW6I1sCQ43oe9VP1ESxNcBq0pOWDK
	5a+sE8u6O/MHjOIpNX4DHWhcIjL+93QL+WNFirtQ5mpo0G+ACXCuUwmAoWjGO4DL6YDYiQzFvyErq
	+ZvjrqGrgDBl/sORP9Ifj8KJtI6TfkFwYIzPcnwVv1YrcloyKdOMlmWlY+CB40o3Su7pPtC0WPANU
	aqG5uz6eifRSSYqKV5oxdmytJ7V3oVBf1QnWhzro8E6mygUgXlFu0jJPjmulFNUUR36DHALnbjVPR
	TgwoPZ+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wttpR-0000000EyJw-1iMt;
	Tue, 11 Aug 2026 21:16:09 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wttpN-0000000EyIh-3TRi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 21:16:07 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4957952e0f8so341695e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 14:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786482963; x=1787087763; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6aQogsOegT+g6QZpcciAxI27XEPgO8Du/rqMWdvlx5I=;
        b=ASC9Z9kYe2EoJWtvKwCcDOe6eF1/FJE6/MfEsxufsDtCYF64oxlCbWHjRGGWKSD8lj
         tsaC5ojyD6K6cJH6Ra2ltz9nxkDwZHhPPpNY6znTN+rFrUHLZlf1NQnSSGlAU5twokEE
         uxsquUAiVm7FtAy0Tq6c8ah35wdDtwJDEV5DWjdbZlosuJ2teVRgtAye22RJ2YSdRcfL
         BpjnxRPXKokxXUoOegDmOBK4vxmOSIG/gZKqzHlKumogrPhGHTchrgIFBwuzcZwVq33+
         nEu/+7lOnsgRWKIo2zA1G3OfL1Dg0U9IgVfYY+3QRO85XwhittEFfA3R4AmNPhORFtDY
         igvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786482963; x=1787087763;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6aQogsOegT+g6QZpcciAxI27XEPgO8Du/rqMWdvlx5I=;
        b=FCdCNj/DlZmJrlJSTOUCjLU88cMLjOb6e8whHA6ofw9y09yr6nTl+dphBhZzlLHhRf
         uCuJ+wrBYj236lUEsvwCEYMPQK00hcIa9iv9W0sMPI3r/dWTgfANHGXDcEPRCL1R6lbp
         IbQTVd6J2mGKwf1MA4iw2uNXm6xny4nD3vnMjl/+GgZMwLt58sGbuh2RmB0CycL+Vq93
         fEnNixAnPQIPPgVuiunjZDKiYUrCpzlXDUM+kqFe9owywjTnkiALnLBAQQe6HyfciJcf
         JYGdKojvBrB7B2qP4E2GrKWaTKCVnZzt5WPlb1a78vErnHGH/j9VDW2WR1rqfWurw7gd
         ZZvA==
X-Forwarded-Encrypted: i=1; AHgh+Rpv16puIzUOn7a4TF8RtLs1ujFCZTnuBXRgYL/23nU441z/ocm1DmTfIYcn0surS32v0teVNXl8ZONcr2k4Yi2P@lists.infradead.org
X-Gm-Message-State: AOJu0Yyhwcd1CE5uyktXVsYcSnTC12pVrEYw1fFA1gBUMI6ZdOh5S+fm
	NLd6GmS0conAbHfr7DojNz8Zwuqr+EwRKIgaN2lYNqO6/Nr8dmgWUTdh
X-Gm-Gg: AR+sD11j1siGuOMQt8YP26e/v6nKOAse60jXcWrQJ1mDW4D+YVrhH2NyeBJX2/MFlyS
	rd9ywH1OMIbEFreZ9/HgD7cvpEX+f7elbTBMg/W5IwzqwJFg71JonPHvTOxewFWwG6w7Itn6e1u
	XKw2uIFNl1J3nUJO7Hj7uigcxdls/n6GABubrXm4LhlptU4Ewh8AvWvm4h6SM7shv+5lflWMTdK
	ewsZHfMSLQuUVg6yAwabnWXUP7PXVCrFQUjv3Qc5wkaATo84ZxHcc/TA919hWqQstlK+ITUfiev
	nNhwAjoixvGL6Hm6XCq3XdWR+cRetlMtqjMUhtW6P3ifEmhI2vB4qFT/xqeu0Zh70CjtJmkt8W4
	f5TphRoG7ZwbE8cZlzb0TNj28Huu32Y0ONzq0nsMwIX8m0ZzRdf1RXHEe1fAvHVvhv1XbAabibg
	jyjslNZ5NaRMHpy+VZewRHEDBYT29x05VQh0T+NLomvsh22Ixre4yx59Bob2nUut8U8WcyBjErx
	sXFTNwt85k34O15EB/uvMbEhrIOrXp6OSXljvVj15HQKuueUsqosjinV+BL3+gM4nsZ5Q==
X-Received: by 2002:a05:600c:a48:b0:499:73ca:c419 with SMTP id 5b1f17b1804b1-4997c12c6c7mr634725e9.4.1786482962800;
        Tue, 11 Aug 2026 14:16:02 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B94ED005B06BF1B5A09FFE4.dsl.pool.telekom.hu. [2001:4c4e:1b94:ed00:5b06:bf1b:5a09:ffe4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997aa96fb5sm19488225e9.3.2026.08.11.14.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 14:16:02 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
Cc: Igor Paunovic <royalnet026@gmail.com>,
	hjc@rock-chips.com,
	andy.yan@rock-chips.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org,
	Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	dmitry.baryshkov@oss.qualcomm.com,
	luca.ceresoli@bootlin.com,
	p.zabel@pengutronix.de,
	sebastian.reichel@collabora.com,
	cristian.ciocaltea@collabora.com,
	damon.ding@rock-chips.com,
	lumag@kernel.org,
	alchark@flipper.net,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	kernel@collabora.com,
	linux-arm-kernel@lists.infradead.org,
	krzysztof.kozlowski@oss.qualcomm.com
Subject: Re: [PATCH v11 00/21] Synopsys DisplayPort Controller improvements for Rockchip platforms
Date: Tue, 11 Aug 2026 23:15:29 +0200
Message-ID: <20260811211534.8618-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20767137.geO5KgaWL5@diego>
References: <20260806-synopsys-dw-dp-improvements-v11-0-0d508505f383@collabora.com> <20767137.geO5KgaWL5@diego>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_141605_897429_6FB3ED42 
X-CRM114-Status: GOOD (  27.89  )
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

Hi Heiko,

Two of your four points I can say something concrete about.

On the cable being plugged in at boot: I see the same thing on an Orange
Pi 5 Plus, and it is the single thing that cost me the most time on this
hardware. The USB side comes up, the Type-C partner registers - your log
[1] shows typec_displayport binding cleanly at 23.9s - and the DRM
connector is still "disconnected" fifteen seconds later. That is what
happened on 16 of the 21 boots I have logged with the adapter attached;
on the other five the connector came up on its own inside that window.
So here it is the normal case rather than every single boot.

What gets it out of that state without touching the cable is a software
replug of the Type-C port controller - unbind and rebind the fusb302
driver:

  echo 6-0022 > /sys/bus/i2c/drivers/typec_fusb302/unbind
  echo 6-0022 > /sys/bus/i2c/drivers/typec_fusb302/bind

(the i2c address is board specific). After that the connector comes up
and the mode is set normally. I run this from a boot service. It has
fired on 16 boots and has never once failed: on 15 of them the log
records DP-1 going from disconnected to connected within three seconds,
and on the sixteenth the machine was powered off before any outcome was
written. The most recent one, from a boot tonight, is representative -
kernel start at 23:00:28, EDID override at 23:00:52, connector still
disconnected with the cable in at 23:01:07, unbind and rebind, connected
at 23:01:13.

Fair warning before you try it. The kernel I logged this on is a v7.2-rc6
Collabora rockchip-devel build that predates your v11 - it was built on 6
August at 00:00 CEST, so it carries the v9 generation of dw-dp - and it
is tainted by out-of-tree modules. On it the
unbind produces a WARN:

  WARNING: drivers/base/devres.c:1184 at devm_kfree+0xb8/0xd0

  devm_kfree+0xb8/0xd0 (P)
  tcpm_port_unregister_pd+0x70/0xc8 [tcpm]
  tcpm_unregister_port+0x70/0x178 [tcpm]
  devm_tcpm_unregister_port+0x1c/0x40 [tcpm]
  devm_action_release+0x20/0x48
  release_nodes+0x6c/0xc8
  devres_release_group+0x144/0x1a8
  i2c_device_remove+0x5c/0x130

I have it on 13 boots, most recently tonight; the rebind then works
regardless. My kernel is tainted by out-of-tree modules, and I have not
checked whether this is already known or fixed in usb-next, so please
treat it as a heads-up rather than as a bug report.

One timing detail, in case it applies to you: the Type-C partner does not
always show up promptly here. On most boots it is registered within about
twenty seconds, but on a minority of boots it takes far longer - the worst
one I have logged brackets it somewhere between 73 and 88 seconds after
kernel start. Anything that samples the connector state earlier than that
concludes the port is empty when it is not. I only have one USB-C dock to
test with, so I cannot say whether that delay is the board or the dock's
PD timing.

I called this an adapter problem in my earlier reply on this thread, and
your report makes me a good deal less sure of that. My assumption was
that it was firmware specific: this board runs the edk2-rk3588 UEFI port
(my build reports v1.1-13-g824e6c12), whose own support matrix lists
USB-C DisplayPort as only partially working - "No hot-plug detect & EDID.
Only works in one orientation of the Type-C port" - and lists the FUSB302
Type-C controller as not working, with no PD or TCPM driver in that tree
at all. So my working theory was that firmware leaves the PHY in a state
the driver does not reset. If you are seeing the same symptom on a
different board with different firmware, that theory does not hold and
this is something to fix rather than work around. What are you booting?

On ACLK_VOP: thank you for confirming the starvation. That is the first
report of it on hardware other than mine, and until now I had no way to
tell whether it was my adapter.

I do not think your garbling is a milder version of the same failure,
though. Here, at 750 MHz the picture became correct the moment the write
landed and stayed correct, with no POST_BUF_EMPTY logged for the 42
seconds that phase lasted; dropping back to 500 MHz brought the
corruption straight back. That run was on drm-misc-next dc2f9f7fed1a plus
your two series, built with CLOCK_ALLOW_WRITE_DEBUGFS so I could move the
rate at runtime. So on this board 750 MHz is a clean state and not a
marginal one - which also makes me doubt Alexey's reading that the
garbling is an artifact of overclocking the VOP2. At least it is not that
here.

The rest of what Alexey says looks like the right thing to check for your
case. It is worth seeing what pixel clock your 4K mode actually asks for
and what dclk it ends up with; on my side that same comparison is what
exposed a separate bug on this board, a video port left parented to a
dead PLL. One caveat when you compare against my numbers: my 4K120 link
runs YCbCr 4:2:0, which halves dclk, so the mode asks for 1188 MHz while
dclk sits at 594 MHz. If yours is 4:4:4 the numbers will not line up. If
you post the mode and the "setting dclk to rate=... result=..." line from
your log, I am happy to compare it against what this board does.

For reference, the ACLK thread is here; Cristian and Chaoyi have both
replied to it since:

  https://lore.kernel.org/all/20260808104240.13776-1-royalnet026@gmail.com/

Igor

