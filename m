Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 258F2C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Jul 2026 22:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=imtw4Ja43+86I9p9y9tUxtB3JG8gRr4QZxWm1ZiCc9w=; b=Zrn/FIk2fV9QEjc3G86VzNZRWq
	TPcLm5AYCisbzVwu3lei5/4RAuWkqXf577tBBVy37DIPQOJox6bupCCRHliEA4ReS8h1gi5IJojGd
	eNMNrlsuq2xrWP5dDkqBrPNQL8FIu1onEerP+lc0I4Cs9EWNuDsYsrhp+f7tpvSj159n1nMmBFB3V
	jOVE6CUGn8ZruEfAcuwysMKRgop/ThgmR0ivPp2gsEdPHAM9eftHjV6XRQ3XFdY7zUHwxA0CVHxuR
	r3OOi0dPTSlUuTA1mdfQzR/Lmf4HU+aJa6fBFXx+uDgQwybCRIo8+AiNHKKiaPXi4jS3j+tJyv1Nh
	azsqwniQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wg8TV-00000008o6m-1ffV;
	Sat, 04 Jul 2026 22:04:37 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wg8TP-00000008o6P-46VV
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Jul 2026 22:04:36 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-39b3931e259so13864801fa.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 04 Jul 2026 15:04:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783202669; cv=none;
        d=google.com; s=arc-20260327;
        b=lh5FWFr/5MhT6kULA0zPbSV3osS1khhCF8t/aPdMI+vFWGZIV2cVQn6FN0DuQzCq7n
         zpnHY6Z+Q0T6K1DsIc3OLTILNEun6fdIUdTHsmSu4Vg7v33iuGPi6C9qWzXvZua5cejC
         wUwRHg8feRlUXzHfYpoVlv7GZYVLXEeWbrTNrh1XgLKIk+rydXBw80cHYacJlcDXL4XT
         OtRiXUED2Vnj3u8lbU5jSd9V4NxNQ7HsuaXywYLt7dQWERStICtjsCYQ3bdf6ahowR8z
         7fA2UxMoNV0RpnYKSDO/cJ8aflYlfukiWJPK+Z+hH+DKig+KFDW9zW9BSJVlOPWCziuq
         lOjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=imtw4Ja43+86I9p9y9tUxtB3JG8gRr4QZxWm1ZiCc9w=;
        fh=Vkp7Z5tQy6oADOP8k235IQ3okR9V9J2bhYndg1gCWPw=;
        b=SN0Jx8lJ+wREmbgHUvPU0mH6MkUa7i7UUBdiW/gcelJzxWayMrfRA/3xX+Exu/iSCk
         xPthlYR3H6sE4ZBO5Pnc2Q0oLgnPwyu/Tknd7pAFCXDs7sh0U/qk+8jPAkO5V8f7HrD5
         ImznH4eQwY0U5fBiGtNqbzJTo/vTvMuiSzevTlCwl9KVVUo72rBRXWlI55TSyU2ZDgub
         G1XwK6uCrul5XBNxlmsaV+8I3H/C8oO2HCef6lxb+qAJ+SlnKt8UFFwI98aedAmdrqIW
         IXm9KvAP8BMMxu1lW2RaCeWH+yMb1glL8aTm9anuYsgGK1qUUk04wJVVwSZdILwbZnYb
         PjVQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783202669; x=1783807469; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=imtw4Ja43+86I9p9y9tUxtB3JG8gRr4QZxWm1ZiCc9w=;
        b=crQfOYurtKW+XpyQWqxR8/iw/G/4n8vAwfZpsHIRL04H6s2+Yype48KU3JAQsEgphO
         JF1IYyYBE+I/E12vsvRsJLwnaDPgBaYF0NUiqw+etxRUrmPcFicWb8sNC9XRDlw+iwBq
         M0jZPz1lS/CJU6QQmoOcGrBQhvyVFNBEYj6r4XYyu/SDTa8weB5r4b4E6q7MHXaL1fve
         Yb6sdAiL6Z1PJKdelC4PA4pu4H6XfyEAA6pS+DJRIlM2DIpxBuffzIj5P3RqkqyO5B/Y
         Ygm+KU2dYVuzLhBCgpMI48023XmjlL6x5ogKqw5GOL9mbtej+Bo/9cvBMwF0CCJ+jzIS
         uuAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783202669; x=1783807469;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=imtw4Ja43+86I9p9y9tUxtB3JG8gRr4QZxWm1ZiCc9w=;
        b=AejPtdhu174fY/l3gcohh+wX2y1vFQSmvpWF5i/JxMTh6/Y90xulTrRoB63H8XUodZ
         43zhucGIDhcmDwwHFCUQabRbMpNnhuOJqKf86fIHk7Q/5uBGYU48EVt4EhV0wdq1u6UD
         Sif0eKIeUcc8pGXPa3xSSLucp+yeuJWHjpjNXPWlv/pmIjftzimyUw8T1dUihUn5Fm0M
         JYZb702FRecRj8i/t+k8zq4h9e8IYrp7sawFIsJJ7Am/UypJ1wnWbmxBsJpuzgcZkucg
         yt1kCiDW6Gjf3l2PNc1M1hamIaoim60nMOJDvAoCk+d1R79CdUbHdsMWBGZRsfpMOx3/
         6eAQ==
X-Forwarded-Encrypted: i=1; AHgh+RrHvNms8j0XgfneDcN4RQ3gy9J650fKiz90tLTi1wmJEFJjdrwG0EgSru0ng7cGsnq48rRVwiUg5WXBc4CNQTXG@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7w7XqotE3b5FRP5pZrUMHk4b4+X5pfpQoZrxoBHeuyZV3Z8re
	iEA6dmsgITwMIU6Ml525XBMIZANzPqeQlVQRRgATTx0qCdEGC35JOkBFcfkf8qTmPj1Qz5mQQxy
	KRmtbooqa0Kgc6wR7dN9cEHe3ObPozCk=
X-Gm-Gg: AfdE7cnfA/HhMrUbtor9PoS33aK4XnUevhs5aXqys0xJewWjXbcD8t3F9krQma5oEGK
	dOfLVckWCq11aNGBeK3SxfDXXJYg+gGPmMecTRluWlOX5+CAdcoax1qfyuwAVTRkevbB0RMcbtl
	flMXz0y+AJNwO/GKyghtftAb3hlPYnyb/FeqdqLEdZpAWU/Odnbzu3JhaCCQnxNjxDWYw2SdpGB
	zVJRKG1K4K2bo5AKvvPZ5bvpxF47A/COyQUO3oJiFwOHZ4SWCaZTGD2svUgYh5Q/Sif0/yfNApS
	Adut2OF2A1DR+4iPl6BXVsFw2hrVLF4PBvB9eRc8S/s9kNO5o1DAwdF1Ugh8Vg==
X-Received: by 2002:a05:651c:2102:b0:39a:e9c1:5809 with SMTP id
 38308e7fff4ca-39b53b5b23cmr8342201fa.3.1783202668746; Sat, 04 Jul 2026
 15:04:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260624100326.413699-1-piyushpatle228@gmail.com> <aj5MNiKSCiEDvDzL@raspi>
In-Reply-To: <aj5MNiKSCiEDvDzL@raspi>
From: Piyush Patle <piyushpatle228@gmail.com>
Date: Sun, 5 Jul 2026 03:33:51 +0530
X-Gm-Features: AVVi8CcSIfFK5hT-w5CsIKgn7jtLkN9mCQbJXOSTVkqzWIMXRePG02SF--UMxGI
Message-ID: <CAMB+xkayaViXeC2GyMMUfeCMzA4=fh-Dq6NYOL-hzKoLfAF19w@mail.gmail.com>
Subject: Re: [RFC] drm/imx: upstream direction for i.MX95 display support
To: Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, marex@nabladev.com, 
	daniel.baluta@nxp.com, Frank.Li@nxp.com, shawnguo@kernel.org, 
	tzimmermann@suse.de, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	airlied@gmail.com, simona@ffwll.ch
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260704_150432_052317_61D80B76 
X-CRM114-Status: GOOD (  28.46  )
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

On Fri, Jun 26, 2026 at 3:22=E2=80=AFPM Liu Ying <victor.liu@nxp.com> wrote=
:
>
> On Wed, Jun 24, 2026 at 03:33:18PM +0530, Piyush Patle wrote:
>
> [...]
>
> > The current dc/ implementation is a multi-device component driver with =
one
> > platform_driver per block bound via the component framework. The downst=
ream
> > i.MX95 driver is a single monolithic platform_driver mapping all blocks=
 from
> > one register base. Unifying appears to require reconciling two bind mod=
els,
> > rather than only adding match_data.
>
> I think that upstream i.MX95 display controller driver would also be base=
d
> on the component helper.  That's something for sure.
>
> [...]
>
> > There is also anticipated divergence which is not yet upstream (i.MX8QX=
P
> > prefetch/PRG, LTS and tiling modifiers, and the downstream i.MX95 blit
> > engine), although mainline dc/ is KMS-only today.
>
> Just want to point out that I sent out v5 patch set[2] to add i.MX8QXP
> prefetch engine(DPRC + PRG) support for KMS.  That changes the driver's
> mode setting code a lot.
>
> [2] https://lore.kernel.org/all/20251027-imx8-dc-prefetch-v5-0-4ecb6c6d49=
41@nxp.com/
>
> [...]
>
> > One question for Liu Ying is whether the separate-driver plus shared
> > helper-library approach is still the preferred direction, and where the
> > helper boundary would be drawn (which blocks/ops are shared versus
> > implemented per driver).
>
> Yes, separate DRM drivers + a helper library approach is still the direct=
ion
> I want.  I think that the drivers and library would sit in the same
> directory drivers/gpu/drm/imx/dc/.
>
> The purpose to add a library is to share code to reduce overall code line=
s.
> I'd assume that shared blocks or common part of slightly different blocks
> should be covered by the library.
>
> [...]
>
> > how the component and monolithic driver models
> > would be reconciled given the differences described above.
>
> Like I said above, I don't think upstream driver would be monolithic.
>
> --
> Regards,
> Liu Ying

Hi Liu,

A quick follow-up with some progress.
I went ahead with the refactoring we discussed and now have it working on t=
he
i.MX95 15x15 FRDM, following the component-based model.
The common implementations for ConstFrame, ExtDst, LayerBlend, FrameGen and
the FetchUnit base have been moved into shared dc-lib-* helpers, with
SoC-specific register layouts and tables supplied as data. The per-SoC glue=
 is
split into dc-drv-common.c, dc-drv-imx8qxp.c and dc-drv-imx95.c, while
i.MX95-specific blocks such as DomainBlend, Dither, FetchEco, FetchYUV,
HScaler and VScaler remain separate component drivers.

The implementation is functional on the FRDM over the pipeline
DPU -> pixel-interleaver -> pixel-link -> LDB -> LVDS PHY -> IT6263 -> HDMI

EDID is read successfully, the initial modeset works for all tested modes
(1920x1080@60, 1280x720@60, 720x480 and 640x480), and Weston and sway both =
run.

There are still two known limitations. The initial modeset works, but
subsequent mode changes currently wedge the ExtDst content shadow load, whi=
ch
appears related to the lack of a reset path for the i.MX95 FrameGen. In
addition, the DSI path is implemented on the DC side but remains unvalidate=
d.

The implementation is currently based on v7.2-rc1 together with your prefet=
ch
v5 series.

The work is now ready to be posted as patch series: Adding LVDS/DSI
i.MX95 support.


Regards,
Piyush Patle

