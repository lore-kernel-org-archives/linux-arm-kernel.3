Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D72A9D78776
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 13:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WVY0FTbz4AdN3t8EEt7ziV7biZCYpab1ixrilZdONsw=; b=ls70aA3AQs84w2r8d/FVEKU7pi
	tctJNkY8qjCmEViKtEUziA/InJoATLr3ON8bo2UnS2GeYRfJFApvh+PTOjCRujMvDQRIsINS9tGQR
	TXA5bSnkgPaP5rmhB2zFj3zIKGIvMIa47vQ3/xVtDHIqzhSM1HkbaEWTldYLdBi4GD3tjpJu/Fm6M
	+NHhigRg1PT3YBMx8rqXHyFKrI6n0hwRQFHIpSmwQJzFVWjeJaJ+nK24h+LGfrJ+6R0AWgBZIsvCh
	LSwWhf8qjFp2Xww55jIuAs/VItdYiB+t5FcFqMv20XpAuhHgJjsh9FPZNtcLISIXo7Nv/wrvcyZnI
	I4i+YwfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWasy-0000000ANGr-220R;
	Fri, 19 Dec 2025 13:51:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWasx-0000000ANGa-32Rz
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 19 Dec 2025 13:51:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Sender:Reply-To:Content-ID:Content-Description;
	bh=WVY0FTbz4AdN3t8EEt7ziV7biZCYpab1ixrilZdONsw=; b=e5mXlEQjf3dBEHIyZPBZXfhBxg
	9QUFDgZ86hEf4xZ63zE0xx9Ijk+scCw9lLK03U7vC/Cv9XhSe87A/emlBeDaWaHPay8nSJt7oskCZ
	O7+hr7KMpAleFFGRmge9KJNdtyrakPKJBnvhnWQLEFMyXvDrWl7m/T7F+tijoNtDa/LlcPdyCy+u2
	vKbmqBWVpItmnxOKCu+Ic4D+rMKvFQFFrOQofBa+hf2y9+wQvbapmQdXD2ZMAuRI3hkv0GjU3rSws
	2TDMfF8qdojaSRnOeozAXmAhihc+iDLaittSDucD4g6eBloZwfqogkRhRYVNkvdq1X/LoT2EF9M8d
	6bldM7pw==;
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWa1S-0000000AvQm-1U3g
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 12:55:56 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-b727f452fffso464669566b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 05:51:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766152266; x=1766757066; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WVY0FTbz4AdN3t8EEt7ziV7biZCYpab1ixrilZdONsw=;
        b=HRZUg2iQI7fApHUn8+lTuXhcBWg1DBwVrKw3Nqz0kFYZkawJVzMbiGtlWDXjiNK+V4
         LdvWkTd4P5B4S5oH1gCu8YlguIiT0On3/xZcEwzETzl+JrDejkpdrsruhTvUz4FB7gth
         J5Rgbmpj1HWbreGDLKaC+WK3Bvup5lz5iokxmqDx4w2ZW/0z5Tugz/AQTEXcvpmX/7XW
         omGtcln9NqYdFkIgcMRue2z/MOK16bNXiVP4xtW3rFK7TkZ4MxVFaEJuW7g/npuS6n70
         B0NnuVQbdDMB/n2rYkdmAa9T25VN1PJGijN5Nw3re1V6iZ2FyQA/nqOVGhXVlDAHn4AU
         pmxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766152266; x=1766757066;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WVY0FTbz4AdN3t8EEt7ziV7biZCYpab1ixrilZdONsw=;
        b=n3pK993wPbXlMWZssDt8fL9dJzocTSUgwHNif3mvxBpKQBCmjpqlho9EvXN0yhFdX+
         QGyixXj4lxlGjT/ad+rbIqcZMrhUGF0leTxpc+inwyX4Jbe+JIVUD5YwEKzpajJIOPSr
         6TafaNo6g71H+3/bjTmrQr4zuNo/+8rqpVmhlWuHgZ4I2QT7K+URzsJWEJOSgBgd9tSH
         ZuYKMVe+kv8TmwHUwEhoxHSST9GyJhWKMZmsTcimem2F0e/p9rl1zy/RwLVHauJhwkUk
         0vFuu/G2EQm5s2M4ZEDC9GvuJQvQ+F3qrM2FpAYJYRPjxqUFLzAmk5fKNIyJfOPSSr2Z
         f78Q==
X-Forwarded-Encrypted: i=1; AJvYcCUZxRsAIbD2ZtlenMjz5DfJDovFd8tILZhEWS2rQgllqclqpgRvJyORsmUhUTRq0dERVEhx7jv2w8RhrNyilhrk@lists.infradead.org
X-Gm-Message-State: AOJu0YxiZB2U5lRlgWLKf4TYWKgHdJlNlsEnuNSTb8tS24nkbSLLKIwW
	hJtqr6n6RJ0Zg6inNUvk40DSlVhixQq6p2waxx7KE6/uiPUESOhvULkt
X-Gm-Gg: AY/fxX40ih6Z/R5m3X6u6RNgtbqYdsnifimEtmotq2LX+CsuQORJPlnnIjrABdk9q+R
	amOdIiDnjpY1htAW04TmnhLZB9coVUvL/oQ3T750ls7oY0d8utjwIfHAmxod2jSHQM1skS9wuyJ
	WGjfYfEou+PFBV4Y07Ne92BbYojw6el861bnkwwLaUM4ZENIvyyVBaMz1nPbCjH7f/PtC0r3jiq
	9Ic+6GEMrufPtHFW4XFURy48RLCsyGazlAAXpzaG2sdVC8XAk2Emmo2/xRBhhP0qrk/UBrWbjCk
	l5wMj/1ul/TtDyBOtzokdAv1mVcZfhgfHuVLf+1Zsskc5u/dH//J3l9bZ3X8uFR3rb7gu13PBeQ
	sAW8Wm0EbXdHNyphNTFEASi7m7QaeUsrBlkHutLgIIdOp7IpC9i6/TNuNikKd/lo51gB4K6CPV0
	VuWnChOky0oBM7+ggJa6yJbjm5/keHHm5cmjG7k7HdUhxI/rBWt5JDFl6LaOFeXxwD
X-Google-Smtp-Source: AGHT+IHqGj9nyeirOfNEOBoQJdeIZKX2jxqMX1La5bEetWOpLjaUzix23G3qWZHuR52h5YIkt2/e2A==
X-Received: by 2002:a17:907:96a2:b0:b76:afa4:933f with SMTP id a640c23a62f3a-b80205de9dcmr597496066b.22.1766152266241;
        Fri, 19 Dec 2025 05:51:06 -0800 (PST)
Received: from smtpclient.apple (89-66-237-154.dynamic.play.pl. [89.66.237.154])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037ae2dbesm244601566b.29.2025.12.19.05.51.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 19 Dec 2025 05:51:05 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v7 00/17] media: rkvdec: Add support for VDPU381 and
 VDPU383
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <20251218232829.337811-1-detlev.casanova@collabora.com>
Date: Fri, 19 Dec 2025 14:50:51 +0100
Cc: linux-kernel@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Heiko Stuebner <heiko@sntech.de>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Ricardo Ribalda <ribalda@chromium.org>,
 Hans Verkuil <hverkuil@kernel.org>,
 Yunke Cao <yunkec@google.com>,
 Hans de Goede <hansg@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Pavan Bobba <opensource206@gmail.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 James Cowgill <james.cowgill@blaize.com>,
 linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com,
 Jonas Karlman <jonas@kwiboo.se>
Content-Transfer-Encoding: quoted-printable
Message-Id: <219DE002-BE77-4D28-9BC6-9124F099F211@gmail.com>
References: <20251218232829.337811-1-detlev.casanova@collabora.com>
To: Detlev Casanova <detlev.casanova@collabora.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_125554_486589_53C56A85 
X-CRM114-Status: GOOD (  17.06  )
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



> Wiadomo=C5=9B=C4=87 napisana przez Detlev Casanova =
<detlev.casanova@collabora.com> w dniu 19 gru 2025, o godz. 00:28:
>=20
> These variants are found respectively in the RK3588 and RK3576 SoCs.
> This patch only adds support for H264 and H265 in both variants.
>=20
> As there is a considerable part of the code that can be shared with =
the
> already supported rkvdec decoder driver, the support for these =
variants
> is added here rather than writing a new driver.
>=20
> This patch set uses the newly introduced hevc_ext_sps_[ls]t_rps v4l2
> controls for HEVC.
> Therefore, a patched version of userpace tools is needed for HEVC
> support (added for GStreamer[1] and in an early stage for FFmpeg[2]).
>=20
> The DTS changes can be found in another patch set: [3]
>=20
> [1]: =
https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/9355
> [2]: https://gitlab.collabora.com/detlev/ffmpeg
> [3]: =
https://lore.kernel.org/all/20251020212009.8852-1-detlev.casanova@collabor=
a.com/
>=20

Detlev,

FYI:

In my testbed with=20

i. v7 of [1] on mainline 6.18.2
ii ffmpeg8 v4l2_request [2]
iii. mythv as player [3]
iv. minimyth2 as distro [4]
v. NO applied yours ffmpeg sps/rps hinting [5] (as i'm on ffmpeg8)

I run set of my mpeg2/h264/hevc/vp8/vp9 samples on: rk3328. rk3399, =
rk3566, rk3576, rk3588 and h616 (just for brief test for potential =
cross-regressions)

Results:

a. rk3328: no any regressions; all samples are decoded ok

b. rk3399: no any regressions; all samples are decoded ok

c. rk3566: no any regressions (e.g. in vp9. v6 and older were =
regressing; v7 is ok) =20
c.1 h264: all ok
c.2 hevc: samples without long-term sps/rps: all ok.
c.3 hevc: samples with long-tern sps/rps: v7 is a bit regressing here: =
it gives me sometimes kernel oops requiring hw. reset to bring decoder =
back to live.=20
Exemplary oops: https://termbin.com/upju
Older vers of your code were handling such cases without needs of hw. =
reset

d. rk3576:
d.1: h264: works ok - but randomly i'm getting playback with distortions =
like this: https://postimg.cc/Yh8Djc3L. it is avd. 1 per few playbacks.
d.2: hevc: the same like c.1 and c.2

e. rk3588
e.1: h264: all ok
e.2: hevc: the same like c.1 and c.2
  =20
g. h616 with cedrus: all ok.

btw:=20
Adding to [1] vp9 android code [6] offers me nice working vp9 hwdec =
accell on rk3566/3588. =20

Great work!

[1] =
https://gitlab.collabora.com/detlev/linux/-/commits/add-vdpu381-and-383-to=
-rkvdec-v7
[2] https://code.ffmpeg.org/Kwiboo/FFmpeg/src/branch/v4l2-request-n8.0.1
[3] https://github.com/MythTV/mythtv
[4] https://github.com/warpme/minimyth2
[5] https://gitlab.collabora.com/detlev/ffmpeg
[6] =
https://github.com/dvab-sarma/android_kernel_rk_opi/commit/fd0b1b17cbdfcf0=
c15bc9f411cc7127105157e57
  =20
=20


