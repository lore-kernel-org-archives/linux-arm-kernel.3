Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E6321125856
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 17:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fZnfHCfBs+6Zz4+9A320LuMDypzwbYjaEq8gelT4T9I=; b=OrUkzrX9EJ4mCu86mPw7/J3GO5
	T/FObTpH/dZYv9xV5Z5Ja/T66wNiFyYzzZmkL3aUeJq/7+Wb87O7C9vfYf/xnDtULVm+c6F0YmV3f
	apGG97vXajC96kD5RH7yn12Yq2bH+RvVyROy0SdS+ssgJfDnkuhhLUTJ2G+NMoyhpIIMBQNhzM1Js
	kdghABcQ9g7k0PufWrO+3nOZ2Et18H7/txuR6dZHYTRhXPLzXIa7HAbi+ckBxeJmKxVWsaWGsE2Qh
	DoxhomcPEvg5Rvhlp1dvN12WasMk8Gj7fkTxir+oV0119aEH/Jb//WbKa6Wyboe6mm3Pme5/KpUc1
	qkJgzZOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0NNr-0000000C1uQ-2MKl;
	Wed, 11 Mar 2026 17:30:11 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0NNp-0000000C1te-1FfS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 17:30:10 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-5a13e1cfa45so188059e87.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 10:30:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773250206; cv=none;
        d=google.com; s=arc-20240605;
        b=JIO79PG3DzQVHB0pRxzXpTOaz9i2nlKsH5CUAz5nRw9J9mpdDcGQ1t1D3EbSlyL2uh
         TPsekrz+yBTXqt7RCL9eERb0dxsBY714937ODE2etfrpHKnIAZuMHrAlSnRD+5+dWXag
         df9pqsoZA2LIpr8Vz3SfDFdeFyUdjmQkDfdQGLMNDRN4Lu2fgNyFrJ1EQZRc6gpWuZAW
         HDqkx/8oI75/mfXuogn09wxcwrh7Zxj64QiX+sDuOMSNPlBbgNzlHltl2jeUjwYbc4Hw
         b4c4BltB6bmfFEFfao1yxcr0322LpnamFrsM7mozpz3Hu6nzKbO+k+yy6vQO+1OUTT45
         OIcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=fZnfHCfBs+6Zz4+9A320LuMDypzwbYjaEq8gelT4T9I=;
        fh=eh6SaXrLw4AkLSvrgdyWLIr+MaB2h6SF8rvFcEslIvs=;
        b=YZXS9usWwQzyGQasd9KAc/un1DrHif5uMnr5cLqFYKauePN/4iH2+pwjDB+xxIPzpX
         7o7D8KW0HXEgs5XH0itMpt1kPlepwO7czvifaiqWUtqMltZM15M9xTfNIv9zBy/fUaH4
         IgQRrVJD0yFXXEGOmIifXwL/2Up5+xEoIaMOTbJifcvs4yMSlv5XuyQiZkw+UGaIwxZS
         z55ZZvV6JJw1uogdyf3hfJblm40mColD6a+M8s38pClFUwXqQx72Ah+fvjjwYEChrE0/
         ZZqbJYXwhZrhFZ33F/nVB1+1BrkctOAoUvivuvnCB8jluRk5M43KsIfmnSlnlZQ/T+Gr
         Z7Hg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773250206; x=1773855006; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fZnfHCfBs+6Zz4+9A320LuMDypzwbYjaEq8gelT4T9I=;
        b=lrAYS8Rz0fIdPXvzk8D7yT0xPyip9msfH40smepgyMuntAFu6cYl/gSqfzpLXVJL69
         lodbsnymnw2cylSEnWziWxQbKv+HjzPgbSEPI8+sQb8JdsED50nW0cXP61s68pVD34UO
         V7rpNa2Ed6kA4it35Bl9mhY1W8ozRbY+ogZHvb6XnZbf1fPch5lJwnCMfp6TNfCSxdWP
         mgbCsnIeKJSMFhWCjhV6m2dmEfd69t6+qK5j/lDx7uJTxMeHqS1z9kg92aV5u/idOeaR
         LMwTUF7ycPzU0oHEZRfdCikk9nKDm1QZc4i1tuMFXPwUdbzRVLF9EiRbAlScSguYYLYd
         LXpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773250206; x=1773855006;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fZnfHCfBs+6Zz4+9A320LuMDypzwbYjaEq8gelT4T9I=;
        b=sGz5m9rXW1VL4b145369qTqvtIwgxZijyQRh+4T9OiNiPn0MStFuFNKgwyU6MMt/GB
         ZtyQ7ftfkyDA+5UDIJxVE98GGRNnhoFlxAgeWU6bkL0ufPZtTvasugPLNXhDcikSVjCs
         xI8VJDOHlhECqnWBnK1QgHNLfRN9zQLqCS/jvcEyCY2xotO/ZHpKdeGllCmpCc+OBhY4
         3pfv74nfJL2RZ2j0DsmubnSqMdGxlWCz4XfcYdjNP08jZdD8M9W4fF2xN4k5TXnZKaZG
         mnSTDl4KtgMbdpPj4vql0mjjwhS2Fmnewj6AghjT+eFrwyaoimeYLXFF7AEoGDc2AwPD
         l74Q==
X-Forwarded-Encrypted: i=1; AJvYcCVQWJRWR+6sTVDFoQVDWpmu4ZwAFH/vnpxTHer5qVLf7W1ZuVRtrGsvjmkHlC59QfznST60/4L4XuO52roI7CGK@lists.infradead.org
X-Gm-Message-State: AOJu0YzFzgdgMWuXJak7/xovI3692FtACDxk7mrmoyBRfpuZ+yiodNlF
	2lvwO0XfinnVg/U3SsFSUJxSOI2H5JruuaYg87xWh1bfObwQLT2J/kbmzGRLX6wvvSuLE3dCFkQ
	Adg3k0Sa13KpH52cmkUXgcHLiROm5OtvM7Kd/UzjLiQ==
X-Gm-Gg: ATEYQzzhuWIpA268q16KD2emSi9JtEYsgbE9WnMAg075U+NHi9Wo7z5DdRtuq+lV2gQ
	+Kmk2NEq96VkTj/7YI2UBV3pUmubgsICx4KiuuijlqZ9QYxx41N3ZqVjdIQkIA3kiLWFLtRWAWD
	xVmWBzeC8r2qGaAZ9IBu94Ew957UvlR2NvKXAPUxmSmtGazpbGnhGALOPkHEw9P5Flz9fGBh0zB
	M6GdqLDcbxA6Pv7Zp5hGrIs8u6LfH5HMkNwK4qj9Z9Pks1vzpOZlG7Dx4tR0xW0r21ZZWbx8hcD
	JxmUrRCGySSn3nvVSWI=
X-Received: by 2002:a05:6512:2c0d:b0:5a0:ee11:8d94 with SMTP id
 2adb3069b0e04-5a156ba88f7mr1283885e87.1.1773250206343; Wed, 11 Mar 2026
 10:30:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260210053708.17239-1-aford173@gmail.com> <CAPDyKFrsMY8q+rvrbOdppYnefX6TA1-EhF+e+pGG6k49KpeTRA@mail.gmail.com>
 <7fd891b7-b1ff-4668-ac99-8f8ac244d90c@collabora.com>
In-Reply-To: <7fd891b7-b1ff-4668-ac99-8f8ac244d90c@collabora.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 11 Mar 2026 18:29:30 +0100
X-Gm-Features: AaiRm52dneMJr0I61s4TTlnxGT0AaZqfVcItp2PRBKI4_FSf_MRvM1HPHY0fnQg
Message-ID: <CAPDyKFqbS+PUkLXkjoHjbiVFCYM4FxQeHdJk_LVVfLA5nGEZ-A@mail.gmail.com>
Subject: Re: [PATCH 1/5] pmdomain: mediatek: Fix power domain count
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Adam Ford <aford173@gmail.com>, linux-mediatek@lists.infradead.org, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Laura Nao <laura.nao@collabora.com>, 
	=?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_103009_363968_500871F5 
X-CRM114-Status: GOOD (  29.06  )
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

On Fri, 6 Mar 2026 at 10:50, AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 12/02/26 12:34, Ulf Hansson ha scritto:
> > On Tue, 10 Feb 2026 at 06:40, Adam Ford <aford173@gmail.com> wrote:
> >>
> >> The wrong value of the number of domains is wrong which leads to
> >> failures when trying to enumerate nested power domains.
> >>
> >>   PM: genpd_xlate_onecell: invalid domain index 0
> >>   PM: genpd_xlate_onecell: invalid domain index 1
> >>   PM: genpd_xlate_onecell: invalid domain index 3
> >>   PM: genpd_xlate_onecell: invalid domain index 4
> >>   PM: genpd_xlate_onecell: invalid domain index 5
> >>   PM: genpd_xlate_onecell: invalid domain index 13
> >>   PM: genpd_xlate_onecell: invalid domain index 14
> >>
> >> Attempts to use these power domains fail, so fix this by
> >> using the correct value of calculated power domains.
> >>
> >> Signed-off-by: Adam Ford <aford173@gmail.com>
> >
> > We should have a fixes tag for this too I think:
> >
> > Fixes: 88914db077b6 ("pmdomain: mediatek: Add support for Hardware
> > Voter power domains")
> >
> >
> >> ---
> >>   drivers/pmdomain/mediatek/mtk-pm-domains.c | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.c b/drivers/pmdomain/mediatek/mtk-pm-domains.c
> >> index 58648f4f689b..d2b8d0332951 100644
> >> --- a/drivers/pmdomain/mediatek/mtk-pm-domains.c
> >> +++ b/drivers/pmdomain/mediatek/mtk-pm-domains.c
> >> @@ -1228,7 +1228,7 @@ static int scpsys_probe(struct platform_device *pdev)
> >>          scpsys->soc_data = soc;
> >>
> >>          scpsys->pd_data.domains = scpsys->domains;
> >> -       scpsys->pd_data.num_domains = soc->num_domains;
> >> +       scpsys->pd_data.num_domains = num_domains;
> >
> > Not sure this is the complete fix, as scpsys_add_one_domain() seems to
> > be using the wrong value of "num_domains" too, no?
> >
>
> No, scpsys_add_one_domain() uses num_domains from the soc_data for DIRECT_CTL,
> which is expected. Maybe that can be improved, but it's how it is supposed to work.
>
> So yeah, this patch is resolving an issue, and it is a complete fix.

I had a closer look and unfortunately, it still looks weird to me.

More precisely, we are allocating and registering a number of genpds,
that corresponds to the sum of "soc->num_domains +
soc->num_hwv_domains". The index each genpd gets in the array (struct
genpd_onecell_data) must correspond to the index specified in DT, for
both a consumer-node and a child-domain-node, right?

It seems like adding them dynamically changes the index. In other
words, the index specified using the "reg" property in a
child-domain-node, may not match what a consumer-node should specify
in its "power-domains" property. Isn't that a problem? Perhaps not,
because we never have both "scpsys_domain_data" and
"scpsys_hwv_domain_data", but then why are we adding them in ->probe()
with "soc->num_domains + soc->num_hwv_domains"?

[...]

Kind regards
Uffe

