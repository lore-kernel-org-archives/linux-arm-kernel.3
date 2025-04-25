Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF06BC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 12:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2dy23SZTpPz/OtRsVa67VPlSbZbxd200TTdg7Zq9HNk=; b=xWYBkK0GQzmmwYWdi8YljqPSaY
	B7vP8pcdhTrbQz7xdPOJPpV1TRz66fiF1GGRL+23IhxUl773YZuFucbQ6KrJI9cQ9AiUlCD9HmbR7
	3rxDVAJ7A12SKizAkWc/qZY+vd95wHEoMjUcpgs4xDja0OcEdROt3EGXZLUesRDnmDB5axmLGW4Eh
	sXhPDpiwALh3boqPOHfrAm2NcGzqJ4Jq7ZEhZM7kCgolpT/uVT4VCsr4qrZbw/1InvX375lVef4Ea
	pcRJ/ad3xv9rDmyo0q9JLK6q01di2y+cmI976V37Gy4nXVKxpqn8WEwNUeg16M85RhrtvNXB7cmVx
	JaQ+dn4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Ho4-0000000H3x5-1tbm;
	Fri, 25 Apr 2025 12:05:24 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8GBN-0000000GiLt-2nKl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 10:21:22 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-707d3c12574so17730797b3.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 03:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745576480; x=1746181280; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2dy23SZTpPz/OtRsVa67VPlSbZbxd200TTdg7Zq9HNk=;
        b=wCkW+99eWphLWYsdjv4GhAiCgn3I6HuGroJV/7J0F5tCHlhH7RMhArLYlsKzNHikqv
         Lpogx9sl2M9xmNK+bezjMKvczRiDeZw/+rT86ZZ2r/gnE18cajgWEkyCDkJgExEwoClN
         CsgVqcQBOa0GPgeLD2qdl9DFdFzA1SNn7IX/Cstk1dJSm8zfWv+G8jUJRio2x6dEaS/c
         zniZitz9NsnC6gGbQvYH8Q23+PVa5ChZc0hyzbAr1Tbc9jC6CCD2yxGacZyoAAUu8W3z
         yp9efBrCFRJ4cgPOnalA2p6wQJ8F7Tai0Yl7kNh95U68TVR+isiylYn7oIKQjhPzgwQN
         rRaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745576480; x=1746181280;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2dy23SZTpPz/OtRsVa67VPlSbZbxd200TTdg7Zq9HNk=;
        b=IpQIYcAA2V461OInCYGczoveYdJ7iV5VfGSWyqw/WpFHcwQ1TRXVunI6p44CEmnoo6
         oCnLPYja17dR/bgcd5wER32Q/5orxCzYeUnkArCmgAS7SYWaWBEOdVaM8Wq9atco6slj
         XF1BTYO5PmxWS77caoxeL40nGUUwJIK4Pl67SWdtsXC5nZOdffhE8BZLbEGEndG6PLRI
         IYmZNiJLEglMYQxwwnhJLMcw8E74uJN2g3gkT+J3+r9ibTTixZJlJw0f6f812n237x48
         ZLBqjffH/Q6kChNPvCgseFtusqI2SfxAJZ5of60RlWUq/2BGq/s1uYvMeavnzU0D5mo+
         AnQg==
X-Forwarded-Encrypted: i=1; AJvYcCXTzhrxnJP0QRswbtu91tJObwnLsAHASKsHiuE166bCsNrPWR74dHZIn0EdFBJfsz61cnP00RdSSl02AY0uV7AV@lists.infradead.org
X-Gm-Message-State: AOJu0YwnNgDftJ2bwQDDrPrEKXHRxjmJp3gEZdZYKH4RfsnXSKrBZvL1
	LqA+WZLCSiL8A5O1syplztChKZDykWDJHpNGQomu5bC2F8Z3O0Rdr4nC+jZzs1JnCe9E1d/wy/4
	6v5X0owvE4Ydg8ryOdFzi1NzrbJYCkSN3W6bdIg==
X-Gm-Gg: ASbGncuPpljPAZWszj2sgi6ot1kVyh40cND6Bg3ZBsKj13MSCYuelI3CdDYdGsgzzBH
	R7bVXCekzHmXW/v7sbJslCMsEkHV1xQN0mEJ1CWxsRs2fUl5NMPw2rO7uLNyQekUpF+2rxp7uOZ
	tQ+tKNmUswG4DcugfvYXrZvZU=
X-Google-Smtp-Source: AGHT+IGCkeBYkL01Ob0/q+cYVVyOOQUT9d0JdZJ2RLVPcS+2b1wB0bERA+PHNQouav0l20rXKN6j1bHrWfsqVHaUuzI=
X-Received: by 2002:a05:690c:61c8:b0:705:6afe:4580 with SMTP id
 00721157ae682-708544de4demr18549377b3.19.1745576480517; Fri, 25 Apr 2025
 03:21:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250421090951.395467-1-wenst@chromium.org>
In-Reply-To: <20250421090951.395467-1-wenst@chromium.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 25 Apr 2025 12:20:44 +0200
X-Gm-Features: ATxdqUFyawKWbJKKMCdA_eJxPR8YeUvlb5__azoGszdJwBU8e_s7VHYVEWsbp3g
Message-ID: <CAPDyKFroHJt7u6CzmPLnWv6rii4+adsFNDgoVqA-2AvN6S911g@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: mediatek: Add error messages for missing regmaps
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_032121_712285_50AF35C6 
X-CRM114-Status: GOOD (  18.31  )
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

On Mon, 21 Apr 2025 at 11:09, Chen-Yu Tsai <wenst@chromium.org> wrote:
>
> A recent change to the syscon regmap API caused the MediaTek power
> controller drivers to fail, as the required regmap could no longer be
> retrieved. The error did not have an accompanying message, making the
> failure less obvious. The aforementioned change has since been reverted.
>
> Add error messages to all the regmap retrievals, thereby making all
> error paths in scpsys_add_one_domain() have visible error messages.
>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/pmdomain/mediatek/mtk-pm-domains.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.c b/drivers/pmdomain/mediatek/mtk-pm-domains.c
> index b866b006af69..22cdd34ed008 100644
> --- a/drivers/pmdomain/mediatek/mtk-pm-domains.c
> +++ b/drivers/pmdomain/mediatek/mtk-pm-domains.c
> @@ -397,20 +397,26 @@ generic_pm_domain *scpsys_add_one_domain(struct scpsys *scpsys, struct device_no
>
>         pd->infracfg = syscon_regmap_lookup_by_phandle_optional(node, "mediatek,infracfg");
>         if (IS_ERR(pd->infracfg))
> -               return ERR_CAST(pd->infracfg);
> +               return dev_err_cast_probe(scpsys->dev, pd->infracfg,
> +                                         "%pOF: failed to get infracfg regmap\n",
> +                                         node);
>
>         smi_node = of_parse_phandle(node, "mediatek,smi", 0);
>         if (smi_node) {
>                 pd->smi = device_node_to_regmap(smi_node);
>                 of_node_put(smi_node);
>                 if (IS_ERR(pd->smi))
> -                       return ERR_CAST(pd->smi);
> +                       return dev_err_cast_probe(scpsys->dev, pd->smi,
> +                                                 "%pOF: failed to get SMI regmap\n",
> +                                                 node);
>         }
>
>         if (MTK_SCPD_CAPS(pd, MTK_SCPD_HAS_INFRA_NAO)) {
>                 pd->infracfg_nao = syscon_regmap_lookup_by_phandle(node, "mediatek,infracfg-nao");
>                 if (IS_ERR(pd->infracfg_nao))
> -                       return ERR_CAST(pd->infracfg_nao);
> +                       return dev_err_cast_probe(scpsys->dev, pd->infracfg_nao,
> +                                                 "%pOF: failed to get infracfg-nao regmap\n",
> +                                                 node);
>         } else {
>                 pd->infracfg_nao = NULL;
>         }
> --
> 2.49.0.805.g082f7c87e0-goog
>

