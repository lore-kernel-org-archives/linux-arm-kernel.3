Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E750CC79F89
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Sep 2026 03:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8CCZA4VoDQ6PBSjxOO7MB9iXLnCy8XMS9eXQBMC5ARg=; b=O5AAQRwO4PT60WZ7q5rpjIK/y8
	GEF1dsIDFfFyv79Ox1RZsKqoZPibWaenXUgT0Kqn7vWx1Eis7b+6yKM/9fsUGdMBKpb5aXombO23k
	HDLU/NrVSomyfzESg7crPSFK96DITcyf43Ic5xrmvCb+gWcWpiRlXZnbK2CP9+/tjgQs/9Sp0+cOr
	RoTL76cyvWCKHrsHLStnDLc5zZQGLf2XtHuKUxC3vbWGZ5aKFGIO4dxYKQ6r50FNdFAIuYHLT9C5O
	+Z9NtmusNneG0Y89s7A5uyHVnH71egeije2JqF16JQBe/3gPjikdVY6kYvtxCMfgmQNmRkXNg1l2i
	wo5kPRQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2gts-00000003d3G-0Az6;
	Sat, 05 Sep 2026 03:17:04 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2gtp-00000003d2o-3qzz
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Sep 2026 03:17:03 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-49b0dbfbf7bso13282255e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 20:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788578219; x=1789183019; darn=lists.infradead.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8CCZA4VoDQ6PBSjxOO7MB9iXLnCy8XMS9eXQBMC5ARg=;
        b=CtWzjM4SjpyWyFx2YD+e0oJ+Tg5ZSGPa+eKRQoreo7nQiJI7aKO25TFWv4lr/voJrw
         ftahS7WKJ8IlE1tU9hnEvZ1pTZEthn4gO6JcHxxGNSqUriP1N/lCwycPt/EY6D0BHdv9
         +aBbrCTccEoJebWxVptEiWVKEHdOmViY0H5rSZ9EJkVrT8U6dYOKo5QnGFMjhdpM0C8C
         T3xtkxFKA/ceLBT8c479HEsZ7Xeq1x3w+RvPmibqEaLUyIAn3HTov7JmvrYdSTZXrc2u
         V0V1U7v4YQE57JggAnESZRu0qFtBXPzzhfcphYgfASJ7HVpuOry8z2DrD1jnyvbPUwed
         bSpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788578219; x=1789183019;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8CCZA4VoDQ6PBSjxOO7MB9iXLnCy8XMS9eXQBMC5ARg=;
        b=JuO8fVJmD83OQPewtv0zQ1oucH7HvKFN/kU/0NSxdyMetlDDUs9O1dPP7tsCW4eiZ4
         8fTc2ha+1jkLWXzhswzcT3rsGkNDy6fMtU9NzfU9n6SIHjgReSfUjQ41bJCwqlWh4L8O
         T3+5Jw7pkNWy/+hI1n2GMRassTHZCUUXn8J2bA+SHwCv9iNMSk9+oULNqcxnicHqbn9X
         xwMW+o5oeUfFS5aur2CN+9OpmpfRe3EIojJZaOWAzxDC9S08RUqNdgaRNPQBI/knlkpI
         nA+MzBUKOyI7Ao93ctaa9ZZaWoVSUzfVwhHzmhdxY70cLmwLtfNuJRsW3WK1I54hB7dQ
         kuHg==
X-Forwarded-Encrypted: i=1; AKwUvBwS5hBAcft819QeCY/aGTka9uG7Gh7J7ygJLQBgezgD1JcoJ3Um6XOX26YM6WznPMwDF1mjbPINbJSUsck5xyRp@lists.infradead.org
X-Gm-Message-State: AFuF++k9h17AZswJgQoXeGeQKI7+1gokZGGcy/wPKfDU/wAKLqxWHCbG
	7pILp8N44K+N1nehioY8px5TPyhWpNbvG26ImDSSzQi6G0uzIZuSRD4V
X-Gm-Gg: AYBFou3Sp8bHx7CcylFbZrsPfANVlORRd3L/dNOD7mw21efXU44vF4pCFFedJuVs7gj
	i9W07yatM4a2e9Dj0ySLvX+3VLQAgodAJA/OQZmUf3bDDBt7dhsI8HyFOawSqQIoWhpfgnKEmz8
	JYp4CjcjgqrPMyB3vit1LvdgG+KZIli2MmcHvc9QnYgkUao9ikSxMyEyjF3ZNB1YCVWgF4Sr1OV
	DeMxGV0mMnL/v1RDYMSq7PDWj5KCzlV1JtCkS5qpHltFaS9ZVimUNHA4hCYbF6Q2t2gAiEnw6IQ
	FI8E9xb+xFc1y8YSEd1ha1l/2dUOOOT/5dvclYZB7e3cxMy9BWRP5HUKGixK+RbiZ75z6VhxCJp
	mGfbDkDAVQZ2qi8i7I1HOXSGE7BVxOk5WJ5Db4hTv9HhvRycJ1YlaRwhtEaY191+DMaoXFTjzmA
	+TIX2CnHefnR4tfjJR2fQZX4GhWRdee59vUBcA9gCz64utveezAdZbnHw/GXMWt+YAmOi/bDH4P
	jF2a+wkzFLwbE3gyDAaezmWkzrpNv3qLevu09eHmYfVbSBTjgTWQTY7PvFyjUO5RmrEA1SnWGwT
	fnRfHxfage9FjTdaG1nYh3IwXtqICcUyywCBZwbH5wEUpRHCdqtettvwmGZFqPsJGpwfLSYteB0
	Ieof1JN5BXniz29L7WmSvZoURcXLlJ+39WbwBKBKTyOnAQ3VLfU4Ruw==
X-Received: by 2002:a05:600c:1d01:b0:499:cd34:f7c with SMTP id 5b1f17b1804b1-49cf81e6f87mr157093075e9.5.1788578218915;
        Fri, 04 Sep 2026 20:16:58 -0700 (PDT)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d03543064sm25312595e9.13.2026.09.04.20.16.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 20:16:58 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Barzin Lotfabadi <barzin221@gmail.com>
Cc: Ryan Walklin <ryan@testtoast.com>, dri-devel@lists.freedesktop.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] arm64: dts: allwinner: h616: add HDMI device tree nodes
Date: Sat, 05 Sep 2026 05:16:55 +0200
Message-ID: <uGlvDrXdQ7mTWJ790WN0hw@gmail.com>
In-Reply-To: <20260904213329.3910099-1-barzin221@gmail.com>
References: <20260904213329.3910099-1-barzin221@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_201702_008184_B56C7904 
X-CRM114-Status: GOOD (  27.22  )
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

Dne petek, 4. september 2026 ob 23:33:27 Srednjeevropski poletni =C4=8Das j=
e Barzin Lotfabadi napisal(a):
> Hi all,
>=20
> These two patches add the device tree nodes needed for HDMI output on the
> Allwinner H616 family.  Tested on an Orange Pi Zero 3 (H618, 4GB), which
> drives a 1920x1080@60Hz desktop with these applied.
>=20
> Mainline already has DE33 mixer support in the sun4i driver, but there are
> no display nodes at all in sun50i-h616.dtsi, so nothing probes.  Ryan
> Walklin's "arm64: dts: allwinner: h616: add LCD timing controller and
> display engine support" series adds the display engine, bus, mixer and TC=
ON
> nodes, but states that HDMI output is not provided.  These patches are the
> missing HDMI half.
>=20
> Every register address, clock index and reset line was read out of the
> vendor device tree shipped with the board and translated to the mainline
> dt-bindings macros; the clock and reset numbering was verified identical
> between the vendor and mainline CCU headers before substitution.
>=20
> Two things I would appreciate guidance on:
>=20
> 1. Patch 1 currently also adds the display engine, bus, mixer and TCON
>    nodes, because Ryan's series has not landed and the HDMI nodes need
>    something to attach to.  If his series is merged first, I am happy to
>    respin this as an HDMI-only delta on top of it.  That is probably the
>    right shape; I did not want to post a series that applies to nothing in
>    the meantime.
>=20
> 2. These nodes alone are not sufficient for a picture.  Two driver changes
>    are also needed: an H616 variant in sun8i_hdmi_phy.c (only
>    a83t/h3/r40/a64/h6 exist today), and setting the TCON pad select bit in
>    sun4i_tcon.c.  Both exist in the Armbian sunxi-6.12 tree, authored by
>    The-going.  I have deliberately not included them here, because I cann=
ot
>    provide a Signed-off-by on another developer's work.  If someone in a
>    position to carry those forward would like to, I am happy to help test.
>    Without them these nodes probe but produce no output.
>=20
> checkpatch is clean apart from one 103-column warning on a remote-endpoint
> line in patch 1; the identical construct at the same width already exists=
 in
> sun50i-h6.dtsi:183, so I left it matching the surrounding convention.
>=20
> One implementation note worth recording, since it cost a boot cycle: the
> DE33 mixer's three register regions must be named "layers", "top" and
> "display".  The driver fetches the latter two by name, so a wrong name he=
re
> surfaces as "invalid resource (null)" and a -EINVAL bind failure several
> layers away from the cause.
>=20
> Result on the board, with the two driver patches also applied:
>=20
>   sun4i-drm display-engine: bound 1100000.mixer (ops sun8i_mixer_ops)
>   sun4i-drm display-engine: bound 6510000.tcon-top (ops sun8i_tcon_top_op=
s)
>   sun4i-drm display-engine: bound 6515000.lcd-controller (ops sun4i_tcon_=
ops)
>   sun8i-dw-hdmi 6000000.hdmi: Detected HDMI TX controller v2.12a with HDCP
>   sun4i-drm display-engine: bound 6000000.hdmi (ops sun8i_dw_hdmi_ops)
>   [drm] Initialized sun4i-drm 1.0.0 for display-engine on minor 0
>=20
> with the connector reading "connected", EDID read correctly from the sink,
> and 1920x1080 among the reported modes.
>=20
> Full boot logs, the decompiled vendor device tree the nodes were derived
> from, and a photo of the running desktop are at:
>=20
>   https://github.com/BarzinL/h616-hdmi-mainline
>=20
> Based on mainline a500db7819c5.

NACK.

This uses old, improper description of HW. That's why it was never
merged. Two mixers would never work with it. Also, TCON_TOP
isn't directly compatible with H6.

Here is newer work:
https://lore.kernel.org/linux-sunxi/20260509190015.79086-1-jernej.skrabec@s=
iol.net/

Best regards,
Jernej

>=20
> Barzin Lotfabadi (2):
>   arm64: dts: allwinner: h616: add display engine and HDMI nodes
>   arm64: dts: allwinner: orangepi-zero3: enable HDMI output
>=20
>  arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi     | 191 +++++++++++++++=
++++++
>  .../dts/allwinner/sun50i-h618-orangepi-zero3.dts   |  25 +++
>  2 files changed, 216 insertions(+)
>=20
>=20





