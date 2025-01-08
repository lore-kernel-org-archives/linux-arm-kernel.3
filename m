Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BD97E77199
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 06:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Nc1mY/MdHNTD26dunvUUor60YcWZhxt/SzPCNrCbBU=; b=C9FQDkHNhh+CSK0E7wvLB0CqFf
	sv6yEyoGsdgromcV4rF609S+gQn0xyjBrB5rlfl+obWQa7aYEmnads8ydbonIFTF8xkwQZ4JhyylR
	keKY/jsE6R/A8utK87XXeS3XIhh0YBa7xfdw9b/eXVtXMWus6UES67cOvMOOvprFByAzreaa3rhwe
	e7rYgxqzmQrIaaZDX8OEKrvCJ7cDXSyXIuXam8qdXZ+xRXlM+zBC9Oc4oalA5WsSoyn6edLyvvXu7
	k4r5twNkeDNGW2jgLEvKhegwISmA9Gj6oKUpM9StGxKytTMX6RYytBnnuVyCw9sc8N8UT87IoHCdT
	Wgvtem+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVPho-00000007I00-3Cvl;
	Wed, 08 Jan 2025 06:38:16 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVPgY-00000007Hnb-1TQQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 06:36:59 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-5401c52000dso17993105e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jan 2025 22:36:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736318216; x=1736923016; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Nc1mY/MdHNTD26dunvUUor60YcWZhxt/SzPCNrCbBU=;
        b=HM/PQaskPKQhJgZkGSwTwl7U0Q299ueaM4IITwylorB5QxA+7GzqsACamgX/kgvyca
         SjR3Qz/VVEYlgX6N0dxT/2O9J18j1lIUtHyNoxjiz09d1fAGRx3uVZ/7EFkK/dKuUG7P
         B87jzfVwP2LjFRc2YO0blsGp+y4PKAdgIbNus=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736318216; x=1736923016;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Nc1mY/MdHNTD26dunvUUor60YcWZhxt/SzPCNrCbBU=;
        b=cx5b+pM2fVGMdRc/CMj6a+Ce8OVaKESYkejJYyQ6Anen1cYBa9bDWdjsoaE40mc5Dn
         JeUZkrf3OcHwyUxh4ZGJC7G2KEkv4QWGCYRfFFjBXwRvXb47As3FLyWhad5Y401asS3h
         PtXEtPmf+9d6hFG5yugwQef3UlY5u/SJk1tuRAB4VK0xux2j71XdzNv4zp6ltnqAEVbb
         mlCzTPPOTToXpNW+2p1wutC/zARNO63OaxQkXHnBKbsFeJhbhGR4HAYe8HKMqYfi7lI9
         b/aFMofcWwfrHJQO/jSQrjOY0XZH4b7BCp+vrh3NIOEJ3KADiYxzfmRimBCKTjZiHUJm
         xJrg==
X-Forwarded-Encrypted: i=1; AJvYcCWs6w56Y6wRDJ6Fsn5GJxEuT69Uv40a386wcJkNlWtONJB3+8oOdMn67Yy74jv56DaiqtOCmme3fNTgzGzy6uI2@lists.infradead.org
X-Gm-Message-State: AOJu0YxqBKDIk0OdmRtKIjWKVg/WXPsiuziQ6nya69PyGvf+orIWEc12
	HaYEp9itxtRGqA+iR7nvIjlNvic7YgwrS6uQxTUqdPtEDPA4k0VPojk3GJwTp6M5Wy5bsbFd2mE
	1CE2ikgD4b018Pi2diclXyCTb4731hitrZfau
X-Gm-Gg: ASbGncuWKB3dXdnpbF9Fd2P7ugkFqIsEHYU0/1QxUw/2H1M/sx0y9eTficzCSCxEt0f
	tpiroOfcYcSMGBkyWny0bygAGt3ncjqwims4VK8sLxH+DoNtBXmWeUw/RO+6jLBvuRw==
X-Google-Smtp-Source: AGHT+IGHVkym1t/Pb1hcHJ4RbcQBDkTuC3OWyRXgFvvWFc+8sjFU+XQFXPNW+BW5Ozs5wI3/m0uRHByMTrGZF+sWK7w=
X-Received: by 2002:a05:6512:31d2:b0:53e:3a73:6ddc with SMTP id
 2adb3069b0e04-542845c55f0mr421253e87.33.1736318215416; Tue, 07 Jan 2025
 22:36:55 -0800 (PST)
MIME-Version: 1.0
References: <20241223100648.2166754-1-wenst@chromium.org> <481a6eec-c428-45cd-98a6-5a91f3ceb187@collabora.com>
 <CAGXv+5Fj5s9FUyaxmEkGimxjEcS6OEfm4_5Zso+YocSi+Vt4pg@mail.gmail.com>
 <bbc6aa2a-fe48-4e06-b070-fd66dbd00e15@collabora.com> <CAGXv+5FoOM=ZUCWigdCaPbc4FCBtLVX2xnUJnVnVsBH=7yoZ=Q@mail.gmail.com>
 <efb88dd0-3b66-49fe-b279-e66c4574cf9d@collabora.com> <CAGXv+5HWcYrCzWJD4e=WP1WVNfqG5Y2_z+_oetWZq2ZKjXP75g@mail.gmail.com>
 <eda10efe-a301-45d3-9bf6-088275db7af5@collabora.com>
In-Reply-To: <eda10efe-a301-45d3-9bf6-088275db7af5@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 8 Jan 2025 14:36:44 +0800
X-Gm-Features: AbW1kvbDKrbFQjU6XyUH5Hc8L3tHpZUYKW41Cjn0PmEo8btxf4x5xJJU_HtXlkg
Message-ID: <CAGXv+5EdU-8__5uTpcX2JT0Lw=kXraVpnMLjgcJS1jrN_zwAww@mail.gmail.com>
Subject: Re: [PATCH] nvmem: mtk-efuse: Enable GPU speed bin post-processing
 for MT8188
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_223658_425923_AB41C702 
X-CRM114-Status: GOOD (  42.46  )
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

On Tue, Jan 7, 2025 at 9:12=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 23/12/24 17:15, Chen-Yu Tsai ha scritto:
> > On Tue, Dec 24, 2024 at 12:08=E2=80=AFAM AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com> wrote:
> >>
> >> Il 23/12/24 16:57, Chen-Yu Tsai ha scritto:
> >>> On Mon, Dec 23, 2024 at 7:43=E2=80=AFPM AngeloGioacchino Del Regno
> >>> <angelogioacchino.delregno@collabora.com> wrote:
> >>>>
> >>>> Il 23/12/24 12:24, Chen-Yu Tsai ha scritto:
> >>>>> On Mon, Dec 23, 2024 at 7:11=E2=80=AFPM AngeloGioacchino Del Regno
> >>>>> <angelogioacchino.delregno@collabora.com> wrote:
> >>>>>>
> >>>>>> Il 23/12/24 11:06, Chen-Yu Tsai ha scritto:
> >>>>>>> Like the MT8186, the MT8188 stores GPU speed binning data in its =
efuse.
> >>>>>>> The data needs post-processing into a format that the OPP framewo=
rk can
> >>>>>>> use.
> >>>>>>>
> >>>>>>> Add a compatible match for MT8188 efuse with post-processing enab=
led.
> >>>>>>>
> >>>>>>
> >>>>>> Let's just change the MT8188 compatible list to
> >>>>>>
> >>>>>> compatible =3D "mediatek,mt8188-efuse", "mediatek,mt8186-efuse";
> >>>>>
> >>>>> That would be "mediatek,mt8188-efuse", "mediatek,mt8186-efuse", "me=
diatek,efuse"
> >>>>> then?
> >>>>>
> >>>>
> >>>> No, we're dropping the generic "mediatek,efuse".
> >>>
> >>> That means we also drop it for MT8186?
> >>>
> >>> Thinking about it more, I think it's stretching things a bit. The har=
dware
> >>> is clearly backwards compatible, or we wouldn't even be reading value=
s
> >>> out correctly. The only difference now with MT8186 and MT8188 is that
> >>> they have a speed-bin field with a value that we want passed to the O=
PP
> >>> framework, and the interpretation of that value is not really part of
> >>> the efuse's hardware. We chose to do the conversion in the efuse driv=
er,
> >>> but we could also have done it in the GPU driver.
> >>>
> >>> What I'm saying is that we should not need to change the compatible s=
trings
> >>> to make this work.
> >>>
> >>
> >> No we don't forcefully have to drop it from MT8186, and doing so would=
 be kind
> >> of hard and actually producing unnecessary breakages with (very) old k=
ernels.
> >>
> >> Just add a `deprecated: true` to the binding that wants `mediatek,efus=
e` and
> >> start with MT8188, where 8188 is in enum and 8186 is const.
> >>
> >> We can do MT8188 because that'll still work even with old kernels (sin=
ce MT8186
> >> is there since before MT8188 was introduced), and it's something to en=
able a new
> >> feature.
> >> This means that there's not going to be any breakage with new DT and o=
ld kernel.
> >>
> >> I want the mediatek,efuse binding to be like the majority of the other=
s across
> >> the kernel, so, no generic compatible.
> >
> > In that case shouldn't the fallback be the oldest SoC in the list?
> > Maybe MT8173, which is currently marked as deprecated, so we undeprecat=
e it?
> >
> > Certainly not the MT8186.
> >
>
> MT8173 doesn't have the post processing enabled.... if you can test that =
the code
> actually works for MT8173 as well, giving meaningful results, then we can=
 just use
> the MT8173 compatible :-)

What I'm saying is (and hopefully I regenerated my thoughts correctly)
that if we want to get rid of the generic compatible string, then we
need a base fallback string. The MT8173 one would be the one.

The MT8186 efuse at the hardware level AFAIK is no different to the
MT8173 one. They simply store bits. How the bits are allocated is
defined by the layout. How the bits are interpreted is also not
a property of the hardware.

In the current design the need for post-processing does not depend on
the SoC itself, but rather the node name being "gpu-speedbin". Even
if we turned on post processing for all models, it wouldn't matter
for the other SoCs.

And the reason the conversion is in the nvmem driver (the provider)
rather than panfrost (the consumer) has nothing to do with the
hardware. IIRC you simply wanted to provide a generic implementation.
If the conversion were in the GPU driver, we wouldn't special case
MT8186 here. If the speedbin value were split into two or more
cells, we probably would have stuck the conversion in the GPU
driver.

So, we could have "mediatek,mt8173-efuse" replace "mediatek,efuse"
as the fallback compatible, and turn on post processing for it,
and things would be the same as before, and also work for MT8188.
How does that sound?


Interestingly, the new "fixed layout" description actually allows
for compatible strings in the NVMEM cells. That would allow matching
against a cell's compatible string instead of its name.


Thanks
ChenYu

> >> Cheers,
> >> Angelo
> >>
> >>>
> >>> ChenYu
> >>>
> >>>> Cheers!
> >>>>
> >>>>> Fine by me. :D
> >>>>>
> >>>>> ChenYu
> >>>>>
> >>>>>> instead :-)
> >>>>>>
> >>>>>> Cheers,
> >>>>>> Angelo
> >>>>>>
> >>>>>>> Cc: <stable@vger.kernel.org>
> >>>>>>> Fixes: ff1df1886f43 ("dt-bindings: nvmem: mediatek: efuse: Add su=
pport for MT8188")
> >>>>>>> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> >>>>>>> ---
> >>>>>>>
> >>>>>>> I'm not exactly sure about pointing to the dt bindings commit for=
 the
> >>>>>>> fixes tag.
> >>>>>>> ---
> >>>>>>>      drivers/nvmem/mtk-efuse.c | 1 +
> >>>>>>>      1 file changed, 1 insertion(+)
> >>>>>>>
> >>>>>>> diff --git a/drivers/nvmem/mtk-efuse.c b/drivers/nvmem/mtk-efuse.=
c
> >>>>>>> index af953e1d9230..e8409e1e7fac 100644
> >>>>>>> --- a/drivers/nvmem/mtk-efuse.c
> >>>>>>> +++ b/drivers/nvmem/mtk-efuse.c
> >>>>>>> @@ -112,6 +112,7 @@ static const struct mtk_efuse_pdata mtk_efuse=
_pdata =3D {
> >>>>>>>      static const struct of_device_id mtk_efuse_of_match[] =3D {
> >>>>>>>          { .compatible =3D "mediatek,mt8173-efuse", .data =3D &mt=
k_efuse_pdata },
> >>>>>>>          { .compatible =3D "mediatek,mt8186-efuse", .data =3D &mt=
k_mt8186_efuse_pdata },
> >>>>>>> +     { .compatible =3D "mediatek,mt8188-efuse", .data =3D &mtk_m=
t8186_efuse_pdata },
> >>>>>>>          { .compatible =3D "mediatek,efuse", .data =3D &mtk_efuse=
_pdata },
> >>>>>>>          {/* sentinel */},
> >>>>>>>      };
> >>>>>>
> >>>>
>
>

