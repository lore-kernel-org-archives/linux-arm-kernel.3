Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C2C2CD98CF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 15:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KjI9RSrMpeF9kl7KVlAoFqnYJfNf7P3l6mHXMFpoLdk=; b=K3LA9Zs6tz432LDe9NeJsgcvFG
	x8orLdaquiQIiO7rc6uqaYCWgqrEHOCC9uRkMjadXWTfTwHXQB4grptpUs7mbjZijzLpautIYyyjO
	QCxqjTJHopiY/T1q6OZhuICElAYioiiD1utn2LMqF8UavVGufffX4HdUGYBdtghb6NLngDyXIx9m0
	2GKHwSd0lolyrzRjBLMhYQOKVqre+3KvIMOhdkNoaK6FC38UNgkUoyNXbPu4XFUkcfSeHRJrt+8A2
	n/jA2vr77U4ROhkNfzqfeg+GQDgx92aQkBla1pVWlurVIMkmgrHo29hfE9nB9wpoPmlYibUH3koO9
	5U0+JbEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ9Wk-0000000EWIY-2KJh;
	Mon, 15 Jun 2026 15:47:06 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ9Wi-0000000EWI3-3GZA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 15:47:06 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-45ef779c1c2so2665486f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 08:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781538423; x=1782143223; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KjI9RSrMpeF9kl7KVlAoFqnYJfNf7P3l6mHXMFpoLdk=;
        b=g6F1N5/MbRFin0OYQ/AyCIDhlXlkriEFv5/m6Xgd6FpVNWyaLyVo+1M+nXyJgCG4no
         qFItuXY6fea6mqOizULtUMHOsB6zpqL7VnX93IDtZ+L3adqKY7KZsu5ibwftf65NL9QC
         SSHdCjPz3NptyTuAnWDucCYweGceJdGQTehfLlwbGXkELdTGruHWUFIDWmVcQEvm1Aw9
         gdgr39P+YeZOSrtarcHm69x/GBFwAyXQ00a5dvOUMOv8mqhkGEya0BCNwTvTQloRPiRL
         BnP4BU+I+jKHlwDDEUUhU1j9TMrl3lz8v2fbSUGmWevbf6HivsnolDb62SxrYBOnclE1
         /Wow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781538423; x=1782143223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KjI9RSrMpeF9kl7KVlAoFqnYJfNf7P3l6mHXMFpoLdk=;
        b=JQEOYxf3/DcP6rG0opahZFPXfKPepwnmoY08dknlYAkqXihjVW5RF5uvKAzcFtZp3n
         +8eq8ACv7z80M7iBiZ3kTu24D1Zstgf+OISewE+814Fc5AOBW/He0nx1IapARX0qvcl8
         zf+4C0aQ2t42RztMlSLM/TOptd7C2V5jRCaCuetJ5FLmTF1afJcdbhykT0cwXN3pcRZK
         nHpJ1FlksP3gRRHjiZoikVeDn8L4U+BJsKGtjiMsrA0WargLmrPQnC+p3bahKs5uoYhr
         mzjfuBVO7yB7kkBAfx1fSRocERmbffccYBLnHSEmFx7qNWyJv7PJicvLgg2cVB8kyCW4
         SBGw==
X-Forwarded-Encrypted: i=1; AFNElJ+ZdcztXXpEiUde0Ma9c3LNiZCuVky+VKkFIlCd3kcXHdUqoyMyZFqaEoPjM8nG4P5sdPv9SethM4mcnvQThXNJ@lists.infradead.org
X-Gm-Message-State: AOJu0YyXq6RJ6PvrXwGul11655/vtzQ07ohXBlNR9yipYKCnkeUru86k
	fcwGb3c7rlLw5eHPnTZ0sAJBW9TtxYzmo+VunojhOgeKp0sD+txs7iVR
X-Gm-Gg: Acq92OEKkrAlffEYhIVXorHsxLekn+f7vm9VR544MEjRxSDXtUUZK3fIPT8L5LGXdMF
	hudLcyM1CzOvHid4e+TZTc2hkD+6yvksqoOR/x9NGCXRyE7qgVJwma8vWG+/NMtOLzO923WdHrR
	N7NDB1tsC7Fs+r8RRztG4qVRp/97X/UIMLldSWp7C2o+c1is7jP8wEb1V0iz8eVnme+Dc72JHj4
	18ScWCdOhczw8oPkLYRmapJTmasxYPWeOfd2aOnFIDRtBEq6tYZBV16KlM1iElGzSjXvI+Ee4tP
	2TmrhRvAjZ8k5ZdFSh8tYcYg+g/A1wVrhlXFnMKbmEbndFwNVKIgPocgaKeauCNqo/ljZy4O251
	gaZx/gy8C/G5VJAajBPVaf5VmsCP2/VmfworAgyTXwKuH66Gn6u6sj0UdqnwcOq/1Xqjzw20rvE
	Tnr4j6b1JUF2ODM01+dg8OwMZMoS6RW6HK+8juyx5DpwLl3K7i0TWDmMIvOVyLgMCSh4PlW30su
	LNzN3dGyGVqtNMR6Y/M4ubCAg3cgR3C46uHiQ==
X-Received: by 2002:a05:6000:1acb:b0:460:1bf8:c981 with SMTP id ffacd0b85a97d-4606da57c41mr20753889f8f.5.1781538422504;
        Mon, 15 Jun 2026 08:47:02 -0700 (PDT)
Received: from jernej-laptop.localnet (92-53-159-70.dynamic.telemach.net. [92.53.159.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2c4240sm32724851f8f.27.2026.06.15.08.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 08:47:02 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: wens@kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Cc: samuel@sholland.org, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 mturquette@baylibre.com, sboyd@kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 7/8] dt-bindings: display: allwinner: Split H616 DE33 layer reg
 space
Date: Mon, 15 Jun 2026 17:47:00 +0200
Message-ID: <0r4us4OeRRWtJhxvps-bZw@gmail.com>
In-Reply-To: <86943057-f5b4-4fae-9172-45f13814494f@kernel.org>
References: <20260509190015.79086-1-jernej.skrabec@siol.net>
 <nIKN_benRn2Bk8SDZrkMCA@gmail.com>
 <86943057-f5b4-4fae-9172-45f13814494f@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_084704_844417_569A83DB 
X-CRM114-Status: GOOD (  38.18  )
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

Dne ponedeljek, 15. junij 2026 ob 06:28:54 Srednjeevropski poletni =C4=8Das=
 je Krzysztof Kozlowski napisal(a):
> On 14/06/2026 16:08, Jernej =C5=A0krabec wrote:
> > Dne ponedeljek, 25. maj 2026 ob 14:10:38 Srednjeevropski poletni =C4=8D=
as je Krzysztof Kozlowski napisal(a):
> >> On 24/05/2026 23:33, Chen-Yu Tsai wrote:
> >>> Hi,
> >>>
> >>> (resent from new email)
> >>>
> >>> On Thu, May 14, 2026 at 2:04=E2=80=AFPM Krzysztof Kozlowski <krzk@ker=
nel.org> wrote:
> >>>>
> >>>> On Sat, May 09, 2026 at 09:00:14PM +0200, Jernej Skrabec wrote:
> >>>>> From: Jernej Skrabec <jernej.skrabec@gmail.com>
> >>>>>
> >>>>> As it turns out, current H616 DE33 binding was written based on
> >>>>> incomplete understanding of DE33 design. Namely, planes are shared
> >>>>> resource and not tied to specific mixer, which was the case for pre=
vious
> >>>>> generations of Display Engine (DE3 and earlier).
> >>>>>
> >>>>> This means that current DE33 binding doesn't properly reflect HW and
> >>>>> using it would mean that second mixer (used for second display outp=
ut)
> >>>>> can't be supported.
> >>>>>
> >>>>> Remove layer register space, which will be represented with additio=
nal
> >>>>> node, and replace it with phandle, which will point to that new, sh=
ared
> >>>>> node. That way, all mixers can share same layers.
> >>>>>
> >>>>> There is no user of this binding yet, so changes can be made safely,
> >>>>> without breaking any backward compatibility.
> >>>>
> >>>> There is user. git grep gives me:
> >>>> drivers/gpu/drm/sun4i/sun8i_mixer.c
> >>>>
> >>>> which means this is a released ABI. As I understood, the old code was
> >>>
> >>> We held off on merging the DT changes so that we could rework this.
> >>> I can't find the actual request though. It was probably over IRC.
> >>>
> >>>> working fine but just did not support all use cases. Why this cannot=
 be
> >>>> kept backwards compatible?
> >>>
> >>> AFAIK the "planes" block is shared between two display mixers. As the
> >>> commit message explains, this prevents using the second mixer, since
> >>> only one of them can claim and map the register space. And on the H700
> >>> (which is the same die as the H616 discussed here but with more expos=
ed
> >>> interfaces), there could actually be a use case for the second mixer.
> >>
> >> It explains why you want to make the changes but not why you cannot ke=
ep
> >> it backwards compatible.
> >=20
> > I guess it can be backward compatible, but I don't think it makes sense.
> > Yes, original driver implemented original DT bindings, but there is no =
node
> > which uses that binding. If there is no user of that, why would driver
>=20
> Did you check all out of tree users of the ABI? All vendor kernels,
> forks and all of them for which the ABI was made for?

Since when do we care about out of tree users? I understand that drivers
must support old device tree files. Once they work, compatibility must
be carried forward. But that's not the case here.

In any case, vendor kernels have completely different DT structure. This
was developed independently from them. Take a look at [1] how BSP DT looks
like, specifically Display Engine node.

Of course there are some distros which grab WIP patches from mailing lists
soon after they are available. For example, I know that Armbian carried old
WIP patches which used old ABI. However, such distros generally don't care
about exact solution and ditch patches as soon as proper solution is merged
upstream or even when better WIP patches come around. DT files in such
distros get updated alongside kernel, they are not hidden in firmware.=20

Best regards,
Jernej

[1] https://github.com/orangepi-xunlong/linux-orangepi/blob/orange-pi-4.9-s=
un50iw9/arch/arm64/boot/dts/sunxi/sun50iw9p1.dtsi#L1315-L1339

>=20
> If there is no single downstream/out of tree kernel using this ABI, then
> of course you do not need to consider it. I don't know how would you
> prove that but I am open for suggestions.
>=20
> > need to support it nevertheless? Supporting only actually used DT bindi=
ng
> > allows for better code architecture, as there is no need to support sec=
ond,
> > unused path. It also simplifies testing, since developer doesn't need to
> > test both paths if code is changed in that area.
> >=20
> Best regards,
> Krzysztof
>=20





