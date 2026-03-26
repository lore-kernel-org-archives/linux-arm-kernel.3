Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60EC010A62FF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 14:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Knt8t9hYBVcc+Ey+bKLKvDpLtFkLS2enHg6EzCCsukw=; b=QVq+kvEOLY5q/gDtjoChNR2FSl
	OVxv90mx3qj4bTKbtWc1Zmh7VjKTrRYnJSuRfryNrnTKTXknCTok84P9w7XOHPH3xyTaNS4wvtAeU
	gxlmqGLEWBdHgAWSqMGlzLqLBTWjU/TNAI8gCEG0boRF+oa7nbeTrkjBuLQBHCj9Z5IRr4qZGJysK
	Erw4rZfCGxGQAekgpoq0Ms5sqsXLkH78bV1ZPkJHefOTWH2sFWW5wnxauJ/AYShqNhXZCe8og+aOL
	49mVeYdnWqd/mLhYcv6LGUPqDJ7U3Tw2iEkfaYBXeXL4j8ssr3crP0f7uytIEDUKg9Mgior0IVFDz
	mWEN8YdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5mAC-00000005hYq-0LLL;
	Thu, 26 Mar 2026 14:58:24 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5mA9-00000005hY4-0Z8U
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 14:58:22 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-b980b35534eso334601266b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 07:58:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774537098; cv=none;
        d=google.com; s=arc-20240605;
        b=kq1pxeyC8FPiRdvabQNRARjg83XdJsnHOChKliWE2P6d9srDhKqCGWuFhz2fF7W96G
         u3keSD5BF2V+suf+NupJPsD26SC6c7CXqLashI1Olt/py9Yqu4X21BiaFdo2YeBp6uhL
         1inXT1GpuuPKw4pRI3X6AgW3o3Jq6Q6FhhASkBNFZbdp9XRvgkxvNgcmDA+kELw4BfzG
         fnrLvps89TWpqpj8CF4p1V3bCulfPCZqXwdqyeBM6kaygwcg9m+8zmdDgYniz/AAjWkB
         4gozojCPPNX7dkkf2jBolwQM8o2HnA86ZD3QSp794qysXgzzKCMRLts1Xhp7NR+HS2uk
         yR3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Knt8t9hYBVcc+Ey+bKLKvDpLtFkLS2enHg6EzCCsukw=;
        fh=7PZqTJM9rqq6aiH6nbu5zdXb9kifQ3jSrzAIGpM2UCM=;
        b=a8uJhpJxtctZGg8n1oo/UOIaL5hJooLGI+G6eSq+4fkwOLcgj14VoGl7+tZd6rTtRv
         GpFM6P7Bj/FOLDRHMl8rO76Tn0X1VFmxhITqdCxIPU1D4kqRv2DNHP0kcABhDVnGlN0p
         Ti6c0TFr+31nbmTNmGblUifHxyIVTm3xR9LQJMxjbDLI43HmJxXJVZtGn6KKpkaUbbeU
         Dx4rYKzYKhxal6xdoL8C7oO7+hGiBp5YyM3i8eMGoHvkb5+Dx0HG4CqOXwM2d9q0lxhv
         pnd0saRJrTJNkSq+SIAMBpexwmfmVCW50lWQc5jR3KHafTQw+bXzZJ8Rg1hUKaaqVVtZ
         2w7Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1774537098; x=1775141898; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Knt8t9hYBVcc+Ey+bKLKvDpLtFkLS2enHg6EzCCsukw=;
        b=JlCxYz124HUb5qdnQTcxaHIsA40dwyeJxR+u1nV37Yyp3bzM0Jad6ekEq16JBZbbi1
         nz7SO5N5geze0YjmZC7vcATA25OUV+NfF36USfqOKkpv/L13ythWCz0CuMYGBAdveeR9
         Q8HTzGg64kLnvXG92Ni6bkkFtadrQV4tg3Cht+aK9ofWX1roQJw+86yyCYiwu1IgOQcK
         H1kn1cbKMlmX02g12jl3oI11q4wVzgmjXK8exnjNprVTe0n2BLNT7I0CqO5SurWfRblO
         voJFpKaNAGkrDAHQ3n+J24HGBwwVO3TG4fkQ7Z9ZpLnKUxdjDT8mM8AcQ/lIGuNUh8+/
         /3Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774537098; x=1775141898;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Knt8t9hYBVcc+Ey+bKLKvDpLtFkLS2enHg6EzCCsukw=;
        b=oe8DYmbNQ5wl874Ioeem7ws2Rm4eAm51WT0z+MkFdl9N9JMHnUGmKYgLaUdlR0xkb7
         04SiKA+lW+ZOE4zA70PKa9N1hGu9YoUTunGq+9k7is7GEudgWrWg0B2uBYSM/yjn4eVE
         rSQN6X/SKdOZ7Zx1zWdim9fR9aRa6Y5GiDOSyjsm0D/jICqgDhLjGEzchKfrZ9lGmn4N
         1r6KmP0CZKkCOxTO2/tdiNJXwqawGExXyCwX0QyWofB7Ql8DATzRgc7V9RH7uB4aE52S
         arYXbu2e0jDz5Xq8PrM/6T4NP2soCmXUc/MWEkcMyWDaKGOjiZCQuQCsNRvqEhIhfTWd
         JuDg==
X-Forwarded-Encrypted: i=1; AJvYcCVVE1OheDPY7vL8mnSUdmz4reDlDXHb++9If5DkRW/o2IAY1Kbt0sYxep+Ngbf4ghUb6oknZMvCnwAjOLyTeNoV@lists.infradead.org
X-Gm-Message-State: AOJu0Ywu0SMxsST2IuQFH1yY8IJFQa5aTZ7BKU4XduiFg6lWAivRBFOX
	m5sw2pHcaLK/ItVw5SOx8dGFX8MkNBLm8vXfRuptlS6uqPOwLtdRK7Zsbs26+CpU8RByRDVdLme
	Dy5O299gr/hZltqeZngnjAKHFXYjgV56nOPURSKvhrQ==
X-Gm-Gg: ATEYQzzivAyh/mK7DX4xj/vabtANv3fX8c06yHV6kDa13Ih+4ojo1l7q43MB2P6XxF1
	IAls5x03n1OoefaKKypLAisMd2CuN3RwT/JyryMFH9a62cKmg7gznMH2isyjhUqmLxQSGpYEBuo
	vatX/etyyXTktApCRZGQ1EAG5Hy4Iy1Cq1HhJXfav210RoVyO1DEUvTcm0po8cRpPaZumLCvBz2
	kVDIRHyig4HcwjVOHI9M0WC/RVj+LcK8Z/p8p0H7dyWMoKsNEGCGk12PDXE5L8cY9sJwJ/3QMhL
	m7uZLoA=
X-Received: by 2002:a17:907:1ddf:b0:b98:4104:1f83 with SMTP id
 a640c23a62f3a-b9b34713aa7mr71321766b.19.1774537098508; Thu, 26 Mar 2026
 07:58:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260318-sai-slot-width-v1-1-1f68186f71e3@flipper.net> <14828456.uLZWGnKmhe@workhorse>
In-Reply-To: <14828456.uLZWGnKmhe@workhorse>
From: Alexey Charkov <alchark@flipper.net>
Date: Thu, 26 Mar 2026 18:58:07 +0400
X-Gm-Features: AQROBzADiNamIvMkTjLneuBvCLIAqiBkToo-n1En-MLhpXfCGuUuqWIWcusA_qc
Message-ID: <CAKTNdwEpQssNuuvHG7v-wXcwhVSUcg+o5B2jM88JQAuChcWWxw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: rockchip: rockchip_sai: Set slot width for non-TDM mode
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Heiko Stuebner <heiko@sntech.de>, 
	Sugar Zhang <sugar.zhang@rock-chips.com>, linux-rockchip@lists.infradead.org, 
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_075821_210921_C329EB1F 
X-CRM114-Status: GOOD (  36.05  )
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

On Wed, Mar 18, 2026 at 11:56=E2=80=AFPM Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
>
> On Wednesday, 18 March 2026 15:50:25 Central European Standard Time Alexe=
y Charkov wrote:
> > Currently the slot width in non-TDM mode is always kept at the POR valu=
e
> > of 32 bits, regardless of the sample width, which doesn't work well for
> > some codecs such as NAU8822.
> >
> > Set the slot width according to the sample width in non-TDM mode, which
> > is what other CPU DAI drivers do.
> >
> > Tested on the following RK3576 configurations:
> > - SAI2 + NAU8822 (codec as the clock master), custom board
> > - SAI1 + ES8388 (codec as the clock master), RK3576 EVB1
> > - SAI2 + RT5616 (SAI as the clock master), FriendlyElec NanoPi M5
> >
> > NAU8822 didn't work prior to this patch but works after the patch. Othe=
r
> > two configurations work both before and after the patch.
> >
> > Fixes: cc78d1eaabad ("ASoC: rockchip: add Serial Audio Interface (SAI) =
driver")
> > Signed-off-by: Alexey Charkov <alchark@flipper.net>
> > ---
> >  sound/soc/rockchip/rockchip_sai.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/sound/soc/rockchip/rockchip_sai.c b/sound/soc/rockchip/roc=
kchip_sai.c
> > index 1bf614dbdf4d..ed393e5034a4 100644
> > --- a/sound/soc/rockchip/rockchip_sai.c
> > +++ b/sound/soc/rockchip/rockchip_sai.c
> > @@ -628,6 +628,10 @@ static int rockchip_sai_hw_params(struct snd_pcm_s=
ubstream *substream,
> >
> >       regmap_update_bits(sai->regmap, reg, SAI_XCR_VDW_MASK | SAI_XCR_C=
SR_MASK, val);
> >
> > +     if (!sai->is_tdm)
> > +             regmap_update_bits(sai->regmap, reg, SAI_XCR_SBW_MASK,
> > +                                SAI_XCR_SBW(params_physical_width(para=
ms)));
> > +
> >       regmap_read(sai->regmap, reg, &val);
> >
> >       slot_width =3D SAI_XCR_SBW_V(val);
> >
> > ---
> > base-commit: 8e5a478b6d6a5bb0a3d52147862b15e4d826af19
> > change-id: 20260318-sai-slot-width-378eed5c22cd
> >
> > Best regards,
> >
>
> Thanks for the patch! Looking at where else this reg mask is used, I
> got curious about `rockchip_sai_set_tdm_slot`. It seems to reset
> SAI_XCR_SBW back to 32 when something calls it with 0 slots. Do we
> have to adjust this as well there?

Hmm, from what I'm understanding set_tdm_slot is called before
hw_params - e.g. the Freescale SAI driver doesn't even program the
slot width to the hardware from set_tdm_slot and only updates the
requested value in its internal data structure - to be then written
out when hw_params runs. So I believe it should work as-is, although I
haven't seen any TDM users of the Rockchip SAI in the wild to verify
:)

> I think what we're running into here is the difference between I2S
> normal mode, and I2S justified mode. In justified modes, it'd be
> normal to have a slot bit width of 32 but a valid data width of, say,
> 16. In that case, VDJ would specify whether something is left or right
> justified as far as I can tell.
>
> So basically I'm wondering if we've accidentally been sending
> I2S left-justified data all along when using SND_SOC_DAIFMT_I2S,
> and whether we should only be setting this in SND_SOC_DAIFMT_I2S.

Isn't the difference between SND_SOC_DAIFMT_I2S vs.
SND_SOC_DAIFMT_LEFT_J just about clock timings / edges? I thought both
can have slot width >=3D sample width, but I could be wrong (not an
audio guru here).

> Either way, I can give this a
>
> Tested-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
>
> for ES8388 on my ROCK 4D (with my enablement patches for it there
> on top that I need to get back around to).

Thanks a lot!

Best regards,
Alexey

