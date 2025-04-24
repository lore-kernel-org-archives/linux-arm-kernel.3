Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3F55C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 17:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4UWBOqT9BQ7cJ0Q+cVJ9EImaxIc5GHy8LlSBjL9UleE=; b=xVdt2zLWOW/1xZopZi/xctaszU
	NiukYS7R4+lMUoL7x0lJsnwctvlxjUf/hDpHzsZYxe6vjMUa3JB+9tRfpFHXMQHroYTTBL//Q6Nzk
	MUOoSqHWqRvW4I37nMjO12oE5PezeAJuSSKE43XtQ/U118uQ158TsL1JhHnlkfdV7IbWYz+APSSj/
	MkOoV02wY5YWmjNHt9laKz1rvQVb6UusistjUdCUdkHb1KvPkdfTcvw+uXlSrKrUI7OjVJeuh+WC3
	aeo3oDCSP7kxAlojtioCtzmMoqPpVLJFdjofYtIkhJSgPzxx/VuVxDUKdQSTnMnO4vhZ0uYbbNcXd
	k2Dg1zPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u807e-0000000Er8F-3wQS;
	Thu, 24 Apr 2025 17:12:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7ztb-0000000EpUq-3zdB
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Apr 2025 16:57:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=4UWBOqT9BQ7cJ0Q+cVJ9EImaxIc5GHy8LlSBjL9UleE=; b=VS3D22u2kOmi1zg+21C1pSQ6Ix
	FgAEtmI/j2T4rWcSMxc5Dn/F1T9cqOntEKpV6FEfY9sLIXubWzJp+h0FBPZkzHpE5eWCtD1FqiNQE
	HeRjOFHzHaFEu7Yyp2yMZU9nSTYzKSNLJ+sUJbeVLeiy7eyvYMp76RqLIgkMgwCJkBoe/xPiZIIgg
	1IQc4je1ueRus76RA6bhB1TqmEOH9SKyyEvePtY4Yt9LJTE68B6ib3y7eKJMjEz8igcMP93RR081M
	jU81XM3YhYLNUv1pSfTF4u2s51Kny1PKFFCJobv8dvv5nI+5Lq6chtZhXEb/Oy6nJQv9YXI2fQ3lY
	uTD9xWPw==;
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7ztZ-0000000Brns-0p5z
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 16:57:54 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-70825de932bso21406247b3.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 09:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745513871; x=1746118671; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4UWBOqT9BQ7cJ0Q+cVJ9EImaxIc5GHy8LlSBjL9UleE=;
        b=yNO9uhM0nrZdyGyrrIU4mwvnsd/j6DX9iw7NMMeejEKKvY355UR1gos3xl3vpz+Omj
         5HcJoJAaZHISB8S64Z2L0HPhpeVlA6Q3EA8NurYxNtelXyfKbRqifRYrMiyue+x2YDdn
         Vsx9KXTxCiFZ3nnwQK6GVZc5muLF4a9uvRVmnjkXAAGwt3oY7nVvq8nSYL/1D+WR4MzB
         sjlYHiB/f7IJWWD2I4brQIRTsSZSV0ndZRgwb3ZcJ85ro9BFvgKB2ErQD8uhgX/1KGMa
         X9FC0uQBBlunWmyK/jNZf0JfLgrkDfhSyfLYyhfwf6uzgONWdyrnPGpatvchTvYT1xrF
         Q9yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745513871; x=1746118671;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4UWBOqT9BQ7cJ0Q+cVJ9EImaxIc5GHy8LlSBjL9UleE=;
        b=V0VdSxFJzJSDgqWKSHxar+8cy2s5NnbxDlJ4pKkXaia1ned2rDv8bDA4q1YU2aKY8p
         ihcTKuE5/+yaN2ytPXA3F4BFIbOlhac8+rjDDNA+Fiv0W7bUb7d8uYjy8kOrcSdRgCtZ
         aHm81xVzQRlbgadNxCQOZwILu6QM4015sD5mRd+ycrdEVcNRdIADq1E7kIpkRdmKPJ8k
         I6zhjoO+ahRvMCmlgiaGheoZsW9oCTOW9K30zqn38O6hFwMP38Tq574I0Qq5OgvKXrmd
         QpCM0V+56Q+g7kob93gW2lwwCSBLK1lGA10MeDxWFSfui0cZtzEVuWS4K9k6ILGiMXR/
         kgfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNp1sF0W6uS92+kWA1DOhKnlz/uJ7k2T2TzrQck1DqrwVYGA5+zJl6fHXIVHcFxjORwnncqBVuDUBr1bsTv0zg@lists.infradead.org
X-Gm-Message-State: AOJu0YzGTFg19FGK1bmpwv7n7YfRVFRVRFv4Kck2s7ZkjUv74MKpqDBr
	7MtHe5U3wDBujLJhiP7qpWza3jyjkpgFKnqSGtX1Tv59k592lQVsyDXMhi+rpbNH8DF/kY2Opt5
	EmsDU2T1a+iyDJYmTQLu8sbZ4FuWytHJLULzponnp+4gs4wfG
X-Gm-Gg: ASbGncugJQAhQNBfxmtAW9Ksg5KkU4/paNC+1+qaRzWLN2k2LguSV7RW50HUi+dAYPR
	b/zpuBQx2hP6pS0VAfItMZnMjcmWeRP8tgXDqAwAl21tKy9BGNB2D3+sS387YGAErraOpX88LFh
	RnZ9qsWCdDi+nBCFCrwcQdwJU=
X-Google-Smtp-Source: AGHT+IGZwaRl4P1Wxhayc+MnVljOr11BOtHfrFEm1vQsUQMxHQizyhtv/7AFFv8NlJ5cAkU5O6MeCHOLGAaLO55RO0Y=
X-Received: by 2002:a05:690c:f8e:b0:6f9:c8d9:50f with SMTP id
 00721157ae682-70841872b65mr41237107b3.2.1745513870829; Thu, 24 Apr 2025
 09:57:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250415190558.16354-1-wahrenst@gmx.net>
In-Reply-To: <20250415190558.16354-1-wahrenst@gmx.net>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 24 Apr 2025 18:57:14 +0200
X-Gm-Features: ATxdqUHxyVIHgxpL1J4W8JjxhWlMB9H1a8S4Aqg362aeLmyJrpLw1ILNYaKA04U
Message-ID: <CAPDyKFp+unkqOSwF5hh9dLe9Q1o0_dUPfOmfrmv52Dt6-aUoHw@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: bcm: bcm2835-power: Use devm_clk_get_optional
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, linux-arm-kernel@lists.infradead.org, 
	bcm-kernel-feedback-list@broadcom.com, kernel-list@raspberrypi.com, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_175753_317512_118BCA7F 
X-CRM114-Status: GOOD (  18.82  )
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

On Tue, 15 Apr 2025 at 21:07, Stefan Wahren <wahrenst@gmx.net> wrote:
>
> The driver tries to implement optional clock handling with devm_clk_get.
> It treats all errors except EPROBE_DEFER as a missing clock, which is
> not correct. So use devm_clk_get_optional here and get the corner-cases
> right.
>
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/pmdomain/bcm/bcm2835-power.c | 16 ++++------------
>  1 file changed, 4 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/pmdomain/bcm/bcm2835-power.c b/drivers/pmdomain/bcm/bcm2835-power.c
> index d3cd816979ac..f5289fd184d0 100644
> --- a/drivers/pmdomain/bcm/bcm2835-power.c
> +++ b/drivers/pmdomain/bcm/bcm2835-power.c
> @@ -506,18 +506,10 @@ bcm2835_init_power_domain(struct bcm2835_power *power,
>         struct device *dev = power->dev;
>         struct bcm2835_power_domain *dom = &power->domains[pd_xlate_index];
>
> -       dom->clk = devm_clk_get(dev->parent, name);
> -       if (IS_ERR(dom->clk)) {
> -               int ret = PTR_ERR(dom->clk);
> -
> -               if (ret == -EPROBE_DEFER)
> -                       return ret;
> -
> -               /* Some domains don't have a clk, so make sure that we
> -                * don't deref an error pointer later.
> -                */
> -               dom->clk = NULL;
> -       }
> +       dom->clk = devm_clk_get_optional(dev->parent, name);
> +       if (IS_ERR(dom->clk))
> +               return dev_err_probe(dev, PTR_ERR(dom->clk), "Failed to get clock %s\n",
> +                                                            name);
>
>         dom->base.name = name;
>         dom->base.flags = GENPD_FLAG_ACTIVE_WAKEUP;
> --
> 2.34.1
>

