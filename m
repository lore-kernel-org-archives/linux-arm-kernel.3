Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16D1FC4450A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 14:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t/xbg5vG2nKWr3fodMKyYC2B3wNiKq/HK47SCCd7AP8=; b=Bowwygpb2s5x3QDub2jXW8GeBr
	SJifSoH7ll2nCF1sd/LUeEPVaq3XRgmiNRUl3DAe3SNJgtHUNKgM6LNEmT8u3fz69a8qcikm1bczj
	0D07RziQTdikOfUDpfw0laBhRKXdc8K4A0oal2qeMBZdY2FJlbiaQVzynV4aecOCT7vkjFr1jq/Cd
	UPe4lxdP7dhSyWHmjxha+YwmgP29Sv+0gAlNgRVUhQdxuWpfynOu3Vtylp31+gGz8XGO+kYsmZN6i
	3GohmzgxO7e99vSmpU1TXtp6YxH6ikbeaIB13vJ1u2RpZ5Hyrjns251vSF5U0tqGQCeYXBD1T84L8
	hYHmeFTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkMpp-0000000HSSH-324B;
	Thu, 16 Jul 2026 14:13:09 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkMpn-0000000HSRZ-1rbP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 14:13:08 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-493ece78b0cso47378595e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 07:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784211185; x=1784815985; darn=lists.infradead.org;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=t/xbg5vG2nKWr3fodMKyYC2B3wNiKq/HK47SCCd7AP8=;
        b=FGRm9C7kzKEYX93WvtwsscraOiSXZeauJw6EsDm+uZUiSsUlHpklZ/6lNX2hevEsRA
         Z+9tY0YzQSewEEpxFJVilx3mqQwhwQNab/QVq+9zagMO+lWtwOhs9zjAJTsrsATYb287
         2MSsXhB8N+Impcaw4ssweNRASb3fqwvrGLrB0Wa0dp+BrnSFOinIoyrGImGSmugD9jXj
         g+SnrQzQ6kBI94P6JOHAon9V0YVKE+ovgG6Pnquf91G+pm4pL2rYkgE48wbbU2103XBw
         vVCOVoryNg4PI4y6KkK35kqlheYuvcUYqiCmtVUkrEW9mbz5X0auJUfjkgT/okhO2MT9
         bMJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784211185; x=1784815985;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=t/xbg5vG2nKWr3fodMKyYC2B3wNiKq/HK47SCCd7AP8=;
        b=Q7VpvxltVmr0Pcw5X6QPt8lkUOcRtXlyP2hCruMhB8mQ1YvktTOeKBLsMl1iJzCyop
         nZhl2UaoGzpZvepEqInKgPmRqdEcTbwXq/rRINnuYj84kKmu7xH/VUg++P8+Qc5ioTRC
         7Er+LA8Yxutlm0QEVWd+AuUxZLM6AB4+WN9Mk52CFpIIRPnQVDqEcP+Ndo4cRmc38Pu5
         qejTr7j8o8XAAU/KSKyVv+FCpP5s4R+hpLxE1iUMs7MWNGQrJa0GuCOo4IT5OITnJ546
         g8qcan4GRxTUMXEr39PHO7EYfctq48UjEo5HWMhoJhteeufzZI52UTla+9u75YCA3e/k
         qhSA==
X-Forwarded-Encrypted: i=1; AHgh+RpPNvebAwmETMBqJTRM0+5Wi2PmXgZFbE6b9amKoU6KOLx4F9fbDdZzVVuCxX8IggSlKM4wVoFCozSyvU5CLEo0@lists.infradead.org
X-Gm-Message-State: AOJu0YyM011/2CxqKsk+mjdV7mMEITq5M0X7Unn/dGiw0m7aPQyjb6Xl
	9MukpsvgmzGm2vJQk8ESSDA46It9G7k59EEpFYTi+IBAB3T0tFvxdmuakiLtdeKk1nE=
X-Gm-Gg: AfdE7cmNvLssCsvDqTvnvOxWFP8O2Oo54J5bkYEu1hsgMZh5FkLnenT+7QhhjAYyrP3
	KKyxRbtQhhxzx6oVfhxAFcNI9oC0pssppX7DokBheKzV7ojRPEBKh/sO1cE2d9Cm4YYYPkTebTf
	lclvGF0AFTgON0U3yYFIW3UtuLDBKXbZft/uK3InAj5o/SogZ3RLhw4SA6+dpfkqXG4MA5RAQHI
	bIHaOqAJhe/LHd1CWbmxqcIbkYn+kMrDnG3hsB9WcyAMlsKuq9XjaecG2f2+a7OFISz7/nWo3vF
	bJDk5l4bMK76PDxiVJgz79zxY5mqoS54Xw++UqsD5o8DboPKfUEX9XxKSFDIj0qVPKQLLpo8brE
	6KFaYgtEz/AvepWF7SiP1Mnq81T2Yg31k782vaLXAZrjYGWiFGZV/iqqxw3JRjMmu/VXPRmWuY6
	OMJqyPCzHwxFg=
X-Received: by 2002:a05:600c:8509:b0:493:e451:fb8 with SMTP id 5b1f17b1804b1-49515904c4cmr154217465e9.21.1784211184975;
        Thu, 16 Jul 2026 07:13:04 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:9758:7353:c342:aed3])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47f464c1f84sm25108252f8f.29.2026.07.16.07.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 07:13:03 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Linmao Li <lilinmao@kylinos.cn>
Cc: Mark Brown <broonie@kernel.org>,  Liam Girdwood <lgirdwood@gmail.com>,
  Jaroslav Kysela <perex@perex.cz>,  Takashi Iwai <tiwai@suse.com>,  Neil
 Armstrong <neil.armstrong@linaro.org>,  Kevin Hilman
 <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  linux-sound@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-amlogic@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: meson: Keep link pointers valid on realloc failure
In-Reply-To: <20260716100939.1381759-1-lilinmao@kylinos.cn> (Linmao Li's
	message of "Thu, 16 Jul 2026 18:09:39 +0800")
References: <20260716100939.1381759-1-lilinmao@kylinos.cn>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 16 Jul 2026 16:13:02 +0200
Message-ID: <1jh5lzf2fl.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_071307_499361_59C2A68A 
X-CRM114-Status: GOOD (  21.13  )
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

On jeu. 16 juil. 2026 at 18:09, Linmao Li <lilinmao@kylinos.cn> wrote:

> meson_card_reallocate_links() grows the DAI link and private data
> arrays with two consecutive krealloc() calls and updates the owner
> pointers only after both calls have succeeded.
>
> A successful krealloc() may move the data: it frees the old block and
> returns a new one. When that happens for the link array and the second
> krealloc() then fails, card->dai_link still points to the block that
> krealloc() already freed, and the error path frees the new block too.
> The probe error path then calls meson_card_clean_references(), which
> dereferences card->dai_link and kfree()s it again, resulting in a
> use-after-free and a double free.
>
> Set card->dai_link right after the first krealloc() succeeds and keep
> the resized array when the second call fails, so the pointer always
> refers to a valid allocation that the normal cleanup path can free.
> card->num_links is still updated only on full success, which keeps the
> cleanup limited to initialized links.
>
> Fixes: 7864a79f37b5 ("ASoC: meson: add axg sound card support")
> Signed-off-by: Linmao Li <lilinmao@kylinos.cn>

Thanks for this

With this fix there is not much point in keeping the labels doing the
goto error handling. Please remove those (and the err print) and just return
-ENOMEM.

> ---
>  sound/soc/meson/meson-card-utils.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/sound/soc/meson/meson-card-utils.c b/sound/soc/meson/meson-card-utils.c
> index cdb759b466ad..38c1b2ae227f 100644
> --- a/sound/soc/meson/meson-card-utils.c
> +++ b/sound/soc/meson/meson-card-utils.c
> @@ -52,19 +52,18 @@ int meson_card_reallocate_links(struct snd_soc_card *card,
>  	if (!links)
>  		goto err_links;
>  
> +	priv->card.dai_link = links;

You must assign num_links too for this to be consistent.

> +
>  	ldata = krealloc(priv->link_data,
>  			 num_links * sizeof(*priv->link_data),
>  			 GFP_KERNEL | __GFP_ZERO);
>  	if (!ldata)

Adding a comment here saying that meson_card_clean_references() will
take care of the above on the exist path would be helpful

> -		goto err_ldata;
> +		goto err_links;
>  
> -	priv->card.dai_link = links;
>  	priv->link_data = ldata;
>  	priv->card.num_links = num_links;
>  	return 0;
>  
> -err_ldata:
> -	kfree(links);
>  err_links:
>  	dev_err(priv->card.dev, "failed to allocate links\n");
>  	return -ENOMEM;

With this

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

-- 
Jerome

