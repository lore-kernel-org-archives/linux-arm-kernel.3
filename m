Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E91F6106703C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 14:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0R6OZluBmRNxZl/w5NAcbeDBTecdzejm214xvTMZFOU=; b=JoTtG2WnuNz5S/BlLDMvccwbeo
	+qBbNV+4ORgsiXY+FN7bDyCUirI7l6Lj8jyGt7JBgq1iHE1qKXGcWGpAHtyYmOyTMaBGYJuoSE/ji
	EN+ZQFQ9TPIW8/oLRcsOk3pjmK283dkGV508uo/cl7xmBtDHkJSC8GaPdWOK1BlOIj7Y01YJIDwot
	JtxL84jNmVuGmc352qxGK/xj5FPAhyWiit5SYLV4kY0Av29Cb3nU7NKcGC3xeZB/mhO0U7pMDT8oM
	V71fmkWOLc0dIo6ST8PEuZ+0E17MV6UOOiJWihK0tiaGqRNThVJEMZoaHDwfpdmkanuFiLO3JoaD+
	JdMu2T3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0hFR-0000000EE8c-05TO;
	Thu, 12 Mar 2026 14:42:49 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0hFO-0000000EE6r-0tQP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 14:42:47 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-5a1307438ddso1323794e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 07:42:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773326564; cv=none;
        d=google.com; s=arc-20240605;
        b=J+rm8go82RDV9tqlZdwvFyu91VkpfU5DTG2Ix8wDYFYlbUzXY8F+tGcGgKh97gJRe3
         7HEQKz58EujGX2+jjVbY/4s7gNDGZLq3nl45VKqDyPISLPNZ6fTkjUmSdk5OOPhgxS/g
         Z+tv/1HimceDskOMAV9XU+iy4u33QsW8w3AWsjQNsAPU01w93DO+0yMR6wWFozAghzRV
         2MBdkTADEoMHLPOMTZrZwyxsGOvXbAEtTMKE8gsBkyPUROsgVv0S1wwTm31prNq4ICY+
         iUAyqspmeQEl+2kPMdZfzdIj61kdfThHFRLWVAaRv/D8FWUj9kyMkOVH5J/qwseVkzNM
         kKtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=0R6OZluBmRNxZl/w5NAcbeDBTecdzejm214xvTMZFOU=;
        fh=/7ITRCO2Tsv+Pe1uwhQvVUMNc8opwxm8TtB7yy+OCtI=;
        b=J4tOvYFdzHgvkHdVFy9dXa5NXWvKm54fSFHfjXzgDsJAdPzDRae5E421o91wJlaUFh
         1E4yqsSBoj41P2S3ScgF5YBlEn/aDMpaO4qBzvIbUbxkjM2CTn2Yh+nv9GA74AXM/qGA
         fny467bdHZabm9/E9awt760dHJuryb5RvCmfihQSKB9+LMiioj94GpunNOIJRaHUCMT2
         NU7TyhNLw9zZrq24gFmVce6rXBy7xr3lY58WPfeJM1n26DS9SI78YcP+1MBMGJFuzwj0
         kYPH4ZtefwN/BlQ0tH9cEmWQEVCm+66yD6cdP4fr2ED1iSrFj7pVd34lztDjs2s/hxSj
         6Hvg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773326564; x=1773931364; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0R6OZluBmRNxZl/w5NAcbeDBTecdzejm214xvTMZFOU=;
        b=DvlQJlFZZmdC9Zt+xvIjGDG3PWbSn8RhqkNypxsSfjkG5MhwmwQ79WNENfQygI65LT
         LEpw0iBaQyRMJGxBuUvlyco87lvmKYmE0x+ke7hDirifgX0epGLtPFDLuurr6Xpa/At5
         XPopBuNgPG3rHXsVVXYnccUrLzY9ieSjyeonWnmyBjzKwUA+nUfPHnG71QctiJm7dOjz
         sANYXbtjszzuAUohxOzlVkfl57yZy6DfEciFUOnPEG7epqdJvrNi0hFXz230Cou6+HPo
         sn+Go1qy6kfmFSOdtVjBT4FxnBs0XbBHEWWyBdCAcFOzTNPBMqzbgB4l4uO0suP13sK3
         P/ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773326564; x=1773931364;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0R6OZluBmRNxZl/w5NAcbeDBTecdzejm214xvTMZFOU=;
        b=pknrcDZw33EQ4k+FJFVJcsX0HfwYCLkqsaUjKfvU7Z4FnTh/uh/lDWMPT8WzLkWQj5
         b2IPgZmxsm5jc75726iy4AEJzU6s2AWzvWZxOSXK4psUW6Zs4IRrOdK+6Fr889uXcdWH
         CnFAI5URCXDbIKmqVFjgY7oHA6CAcwHggHsxC4EF7JFpl4PecKGXJ+clm21Cb72Yy4uG
         tds6jvfoyrPhkC2pfuICJU0i2+FErMWV69c1yyfkg/LDY2daGEt45uzHdbtEnlAh4/3+
         zinCUsWrhA0tTsacNT4SXvyPzj0T/dBDivG3XwpTNRLiGstUKzgyAUthl88xAO8pzaeo
         PHsA==
X-Forwarded-Encrypted: i=1; AJvYcCUzPr8l22lOpEKAURv6Q/1dYUy8c9V/j6BSlDzvC6fJAVzl/VnXtFaM7ucqcVeoioWJUTGADTqefraqmZAlEks4@lists.infradead.org
X-Gm-Message-State: AOJu0YxAfdWEc+5X30FA3RMoN1TpX0rsYD5XgyO1APR+i1jrXEaQMb1I
	wyZ47j6AJ64esVB3/iA8AWC3PL3ygHADYDMrxU3Nv2cLIDMdqH8lTkneSoAtMcYt2Wmu+4gRbD1
	XDMkfy/Zo8TyMOeHQDHehwpL53DDqHH2BijVUIZDAzA==
X-Gm-Gg: ATEYQzzKsgowfdqni7mFTzo3+whtXBD0fLdvSrsaZi/+QyYSlUCNDPgDcfly4junS3M
	VkSKqfnOcPpn+sv6IQXGUawaLpuMOvI/0ZGLpTvFPva9kk591K+277A3UIuwL/I00xdBeP5lpkA
	WzdQt6bbNxQuYJiYq3ezDPV3gYeuVYGfp1uYTgOX0QwoxzWAdiJyxGkmqn6qYM/69pnRep8UF/O
	PLPI2EWW2wjEDqsLaa0m+eVa/DKMsKXf9xjDNnMwUq5m6sycXHBr05KZo8uyHZdTjUBB4zpIsZu
	/2iIlrA=
X-Received: by 2002:a05:6512:3405:b0:5a1:2ea2:3683 with SMTP id
 2adb3069b0e04-5a156ddd92cmr2624715e87.44.1773326563685; Thu, 12 Mar 2026
 07:42:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260210053708.17239-1-aford173@gmail.com> <CAPDyKFrsMY8q+rvrbOdppYnefX6TA1-EhF+e+pGG6k49KpeTRA@mail.gmail.com>
 <7fd891b7-b1ff-4668-ac99-8f8ac244d90c@collabora.com> <CAPDyKFqbS+PUkLXkjoHjbiVFCYM4FxQeHdJk_LVVfLA5nGEZ-A@mail.gmail.com>
 <108e6fad-401c-427a-bc30-8ddd00bd93a5@collabora.com>
In-Reply-To: <108e6fad-401c-427a-bc30-8ddd00bd93a5@collabora.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 12 Mar 2026 15:42:07 +0100
X-Gm-Features: AaiRm53Syf4tONBWunUd9bjmXw_xdyFjtpRQ2mt1ntlqT4z8S3DYLkSeLVjeLKo
Message-ID: <CAPDyKFoY+pdSh-h_=Ko9L7QaFo4V4iA2_A0jA3BfnuKmiCyzCA@mail.gmail.com>
Subject: Re: [PATCH 1/5] pmdomain: mediatek: Fix power domain count
To: Adam Ford <aford173@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Laura Nao <laura.nao@collabora.com>, 
	=?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_074246_303676_4517D975 
X-CRM114-Status: GOOD (  43.04  )
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

On Thu, 12 Mar 2026 at 13:46, AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 11/03/26 18:29, Ulf Hansson ha scritto:
> > On Fri, 6 Mar 2026 at 10:50, AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com> wrote:
> >>
> >> Il 12/02/26 12:34, Ulf Hansson ha scritto:
> >>> On Tue, 10 Feb 2026 at 06:40, Adam Ford <aford173@gmail.com> wrote:
> >>>>
> >>>> The wrong value of the number of domains is wrong which leads to
> >>>> failures when trying to enumerate nested power domains.
> >>>>
> >>>>    PM: genpd_xlate_onecell: invalid domain index 0
> >>>>    PM: genpd_xlate_onecell: invalid domain index 1
> >>>>    PM: genpd_xlate_onecell: invalid domain index 3
> >>>>    PM: genpd_xlate_onecell: invalid domain index 4
> >>>>    PM: genpd_xlate_onecell: invalid domain index 5
> >>>>    PM: genpd_xlate_onecell: invalid domain index 13
> >>>>    PM: genpd_xlate_onecell: invalid domain index 14
> >>>>
> >>>> Attempts to use these power domains fail, so fix this by
> >>>> using the correct value of calculated power domains.
> >>>>
> >>>> Signed-off-by: Adam Ford <aford173@gmail.com>
> >>>
> >>> We should have a fixes tag for this too I think:
> >>>
> >>> Fixes: 88914db077b6 ("pmdomain: mediatek: Add support for Hardware
> >>> Voter power domains")
> >>>
> >>>
> >>>> ---
> >>>>    drivers/pmdomain/mediatek/mtk-pm-domains.c | 2 +-
> >>>>    1 file changed, 1 insertion(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.c b/drivers/pmdomain/mediatek/mtk-pm-domains.c
> >>>> index 58648f4f689b..d2b8d0332951 100644
> >>>> --- a/drivers/pmdomain/mediatek/mtk-pm-domains.c
> >>>> +++ b/drivers/pmdomain/mediatek/mtk-pm-domains.c
> >>>> @@ -1228,7 +1228,7 @@ static int scpsys_probe(struct platform_device *pdev)
> >>>>           scpsys->soc_data = soc;
> >>>>
> >>>>           scpsys->pd_data.domains = scpsys->domains;
> >>>> -       scpsys->pd_data.num_domains = soc->num_domains;
> >>>> +       scpsys->pd_data.num_domains = num_domains;
> >>>
> >>> Not sure this is the complete fix, as scpsys_add_one_domain() seems to
> >>> be using the wrong value of "num_domains" too, no?
> >>>
> >>
> >> No, scpsys_add_one_domain() uses num_domains from the soc_data for DIRECT_CTL,
> >> which is expected. Maybe that can be improved, but it's how it is supposed to work.
> >>
> >> So yeah, this patch is resolving an issue, and it is a complete fix.
> >
> > I had a closer look and unfortunately, it still looks weird to me.
> >
> > More precisely, we are allocating and registering a number of genpds,
> > that corresponds to the sum of "soc->num_domains +
> > soc->num_hwv_domains". The index each genpd gets in the array (struct
> > genpd_onecell_data) must correspond to the index specified in DT, for
> > both a consumer-node and a child-domain-node, right?
> >
> > It seems like adding them dynamically changes the index. In other
> > words, the index specified using the "reg" property in a
> > child-domain-node, may not match what a consumer-node should specify
> > in its "power-domains" property. Isn't that a problem? Perhaps not,
> > because we never have both "scpsys_domain_data" and
> > "scpsys_hwv_domain_data", but then why are we adding them in ->probe()
> > with "soc->num_domains + soc->num_hwv_domains"?
> >
>
> As you understood, having both is not really supported right now, and the
> intention there was to have the flexibility to do so without restructuring
> the entire thing in the future.

Thanks for clarifying!

Although, having both seems problematic for the reasons I pointed out
above. At least, it looks like some more re-work will be needed to
support that case.

>
> Though, from what I understand, the confusion comes from a single line (and
> reading it again, I do agree, because I got confused myself for a moment as
> well, and I'm the one who wrote this, so that's bad bad bad):
>
>         num_domains = soc->num_domains + soc->num_hwv_domains;
>
> where, to avoid confusion, this should've been:
>
>         num_domains = soc->num_domains ?
>                       soc->num_domains : soc->num_hwv_domains;

Agreed.

>
> (perhaps with a check `if (num_domains && num_hwv_domains) dev_err(only one
>   supported)` but being this taken from hardcoded data, I'm not really for it)

Agreed, a print would be superfluous.

>
> ...and still, like the proposed fix does:
>
>         scpsys->pd_data.num_domains = num_domains;
>
>
> While I agree, again, in that the code could be improved (and it shall be),
> how the logic behaves, right now, with the proposed fix, still looks good to me.

Okay, I'm queuing the $subject patch as a fix and by adding a stable/fixes-tag.

>
> I can eventually just send a patch that clarifies the `num_domains` if you prefer.

Well, actually, I would suggest splitting the driver into two drivers
(each handling its own type of match data) and adding some shared
helper functions, that both drivers can use.

It's more work, but we should end up with more maintainable code, I think.

What do you think?

[...]

Kind regards
Uffe

