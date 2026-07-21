Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACB93C44529
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 07:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dGv7EC+RRgTgrfV+NT/WM/6UEMID2tEKb0vtTaWsXRw=; b=WIVpmHABMrMIQJeEwHPIYhBG2p
	ScJyp99CuL7v38Vz+Hehi46k8zcXHXtJJRfH5BdMjVXhIIUAIqUGLxe8v5YE6z8YpqtKV8+e2IEfz
	+TtUTjngdXtDnH5JwUjkVMUeq0DRjBJuSVwoD/YILdHfHv/8xofKG3fu+gjzjm66JwhE0TSxdFyU3
	iMk6mxWLRLHkJJAVQ5BSIRS9BrqWSje5OAiTWzmwBculmrHiYBttT8tDjyak3WqgVskkR/06X/bsQ
	PdPn6toGdoqZO39FZrB5nFbdVKQwxIvO3yamZH6EaeAWJsZff6/WnnhLmj6auG5nK0HQyxNxos+fy
	0C2B0F2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm4xz-00000008emD-3FVi;
	Tue, 21 Jul 2026 07:32:39 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm4xw-00000008ekr-0uDV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 07:32:38 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-47f64ca1c2dso727688f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 00:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784619154; x=1785223954; darn=lists.infradead.org;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dGv7EC+RRgTgrfV+NT/WM/6UEMID2tEKb0vtTaWsXRw=;
        b=BX6/D8R4/KDCDtpCvxGrogDAQjNx4X3VhCAFHCbbHMQ2okjx9nPU026JtBvMAPFZyq
         8bLWm2bVcoTsGKnh0PXHwYSPgcwoPg6tLKUmOABKgQYBPZ+aVxfbeNb1YEjyc2mO3NVF
         6MGeod+vLk5Sr2cMnEuLdg13gtud+PasWoxqnHnRPjzQu0QwuL0pxDT/ZYHrRco9yfe0
         Ivqvgmf5OtuwXiJR/f1jghwI+/HSGT7umCZuq1NbVhl82iCyy319NcX1o+Up54ZgnQX0
         nCRHni0o/JHeC1NYnNiezcMuUfERN+8GvXVWbjagFRLpX0GJeZww5wxfP+2OBenyA+DG
         Ae4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784619154; x=1785223954;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=dGv7EC+RRgTgrfV+NT/WM/6UEMID2tEKb0vtTaWsXRw=;
        b=H8fQZ6tRw8J5AgMTq3jChI990/75XVc4O2UeYLJwK9NT8yauuALv6qbvMZQzDNm0mK
         vfMxC8YHUEv+CuNA6EI6Wg63Njson9FuLRTqgo+hIC9smo+v21plqzB5Rj+7lxEjAbi6
         oS1vU2ufH2xjfURpUY1tjVj5OfnkV//LY/ucQApejDAzjw6EIwz5Gki7DsarsaPuBoAt
         ThM0KAmFq0b4mMBDxFTcMfEnIv92xcL80JQH+Y1w/Q7Ene0bmypP7b4sr0WlL70ZfAyg
         G69fmn0h8ymK5GUIca74b+DPBl7r2Tk2b2c91zOFPdl4Z89fGRU8L7nGSFs3TIwJA63e
         gsjg==
X-Forwarded-Encrypted: i=1; AHgh+Rrg7hb+kjHjYWHEayxfTLywv8VdEmQM/bhliDcYAXaaTZFdyOURf0rhLA8U8ehF4WOscV4+7zPsMubwLdbpSZRa@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2rSaFsk7nMRoJ9547UXuhF9xRgC6QnJ3ZCheSuxA5jx7EiMJv
	swqoc40HI14CgFMehsyPjJT+T3aObhwzlryy2z2a3/Pq8z00HRt3RugumASVAXjPHeQ=
X-Gm-Gg: AR+sD13hBEhTtPLAvIhVwopDsrB0iKVnNjD80xHJvlKtYzVQ6wavopbQH0llYjBZ11H
	BMhldIZjWGq0lmhsYkJhq+aa93bNQWdwN2COt6MviPaEO9CYa3gn7yjfi3rPlMAciLvWT0lWoem
	qvmJUfQ4e6qmr0fp1EFJiz1fd2zcM3pFj7OrVhs3fbLVVt3BUByAZ+n1oMkioXI+fMJlAsJr0Vt
	CL13zqd0Vd8ySF+8VO5Vgcjh6mf+7e8F9wMpDIWOYn6WgZZi7pehAejzb08q68xcz9KbkDidvYl
	+cht5M2KVq4+3QAflZwCW/d3/dasISy/nuLiLj+d3qyO1zmUdZeirtgYWo3KkzVo7hmZwM4qVoI
	0aryIWpo1sxCD4cFa0P4AdN/D53RJIrOwftjEpHppgmuZ40Tvqs27nVto7+UQMZ5Is7H+gKZ4Q8
	Zf
X-Received: by 2002:a05:6000:4a17:b0:47f:80e5:b9b3 with SMTP id ffacd0b85a97d-47f80e5bb24mr1515729f8f.33.1784619154020;
        Tue, 21 Jul 2026 00:32:34 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:3b11:1fce:47ee:c5bf])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47f63ee0086sm39480548f8f.30.2026.07.21.00.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 00:32:32 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Jaroslav Kysela <perex@perex.cz>,  Kevin Hilman <khilman@baylibre.com>,
  Liam Girdwood <lgirdwood@gmail.com>,  Mark Brown <broonie@kernel.org>,
  Martin Blumenstingl <martin.blumenstingl@googlemail.com>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Takashi Iwai <tiwai@suse.com>,
  linux-arm-kernel@lists.infradead.org,  linux-sound@vger.kernel.org
Subject: Re: [PATCH RFC 1/2] ASoC: meson: meson-card-utils: use
 meson_card_parse_of_optional()
In-Reply-To: <87tspti0ng.wl-kuninori.morimoto.gx@renesas.com> (Kuninori
	Morimoto's message of "Tue, 21 Jul 2026 01:36:51 +0000")
References: <87v7a9i0o8.wl-kuninori.morimoto.gx@renesas.com>
	<87tspti0ng.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Tue, 21 Jul 2026 09:32:30 +0200
Message-ID: <1jldb4er1t.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_003236_272127_BDCD64A2 
X-CRM114-Status: GOOD (  17.64  )
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

On mar. 21 juil. 2026 at 01:36, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com> wrote:

> We already have meson_card_parse_of_optional(). Let's use it for
> snd_soc_of_parse_aux_devs() too.
>
> It is using snd_soc_of_parse_card_name(), but let's keep as-is
> for it for now. Beuase it will be not able to share code when
> Card capsuling.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  sound/soc/meson/meson-card-utils.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/sound/soc/meson/meson-card-utils.c b/sound/soc/meson/meson-card-utils.c
> index 8617a4661a339..d144ab79b645b 100644
> --- a/sound/soc/meson/meson-card-utils.c
> +++ b/sound/soc/meson/meson-card-utils.c
> @@ -300,7 +300,8 @@ int meson_card_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto out_err;
>  
> -	ret = snd_soc_of_parse_aux_devs(&priv->card, "audio-aux-devs");
> +	ret = meson_card_parse_of_optional(&priv->card, "audio-aux-devs",
> +					   snd_soc_of_parse_aux_devs);

snd_soc_of_parse_aux_devs already properly handle if the property is not
present. I'm not a fan of adding another level of function if it does
not bring anything valuable to the mix.

Could you add more context describing what you trying to accomplish with
this "card capsuling" thing ? A link to the RFC maybe ?


>  	if (ret)
>  		goto out_err;

-- 
Jerome

