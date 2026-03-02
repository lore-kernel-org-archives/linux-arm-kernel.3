Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B53B8E9B36A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 12:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hHdX83DJ8NzB0+Dg2GzVMundpvvc3+ChCaV5hT6gxKs=; b=WZRB/ASj5a9Dlt9xqaUHP5OUPx
	rsUEMvXyLkZHYe5x7s4S7bPjPKL4rKVzVHIbt3zArM3b2AA3sX661ev8SWHMjrgGOXMPGkr+QOM5w
	Zr/rol7O7PPAQ91lyiViatWyMt2qzN7OQbDCfnTRO9jUyEVo3lyQRLcFN/7WB1Pt2JwzZSNoMrdYc
	mi3vAIPaYcNHGbFtSEYtiizNorkmNVvpWcScNYQSbJ7juTVr7rY/o92WVTl5b69RVj7gaPYjcVkfU
	Kd3d9G0/B8OtjRVMvUlU50AwjEWaE2Z3DlvjY4mdG2BG0KbTtnvdLi5mzpQtc3d8q3Ok2o47fBhev
	Xcsu/2KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx2fc-0000000D1hw-1neY;
	Mon, 02 Mar 2026 12:46:44 +0000
Received: from mail-ot1-f51.google.com ([209.85.210.51])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx2fZ-0000000D1gt-207D
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 12:46:42 +0000
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7d18a9d2b1aso3883854a34.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 04:46:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772455600; x=1773060400;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hHdX83DJ8NzB0+Dg2GzVMundpvvc3+ChCaV5hT6gxKs=;
        b=oD8FKj9f7IrnYp37bIQll758JQ8xaaO3zckbJYO7pSmwBv1vv5co1ua97orERf/DfQ
         yZ7VgrwYRT1VQiboR0Cxed3gbkH954YqKry2EY89yJ6LCCncK88yz3v1zRq41FOvmB2d
         MkNHmCMU/wzRSp4f1lo5rGE5cTgs9Q0Q6D8cRabKIdnyCCXbB68voquCrR1flYHzpQGn
         YxzgR90sTAZR4FVlIdih0myB2hNdT6sHIGeVoZ0eMN5vH1sJnaeBfHIM1WefqZLSksPh
         vBOVSaf3syUzd2H2vKFaFrwjaaPjS42vi5FQUzCk05FLePJblAfaYON4/6WpGcdvFzL5
         YqQw==
X-Forwarded-Encrypted: i=1; AJvYcCXs8dXBLxcbkwG9cGcDxXXYyOp07KrJpoNCnhtKtre7S3MEP9MTKENuDxBRNFIoOUH7HfZTwKsPVikt3r2bC3+K@lists.infradead.org
X-Gm-Message-State: AOJu0YzREkJKuTVqjge6q4SltkWAU3o3yLKL7ABWOt0CjXriUB82xB1i
	neVpVzoZQjM2hukOjIgIsGYZ66ZSj0nLl76dtF19O/t8DJjkEhbgziaF4gMkNEiP
X-Gm-Gg: ATEYQzyg0FEyHbGZIRgyqHYCcXKvmipsllJEtCyTJ0qEXDnp1Z0r1+oLwun4Du2sg4z
	vGqaDzNcHp6nSDEbqzx6+Rg+QKZVS6GgIoEHJRy84KvqSHE9khNJkTBUF9358/GmycfeJHzvSd0
	sunNaABlwZ4oPQk4zATXrQjrWLyFWh95TqGyWRUvFCWqxsFAuGWvQdGji2yN9MIdOvloxj4FZh3
	8+HCK9AKdcmVxjDzxDPzUmlVhI9gZxcCPjID6VFl3bElaY6FzSkNTYQ2u4fBc8Sp3t9n6qKfcwx
	PFag3P+UBeoJ7JgCBc6BGEPH55xxe5S0EoPWBdq72M1Ayy1fFJJC9oX053YWe4ZEkSbZQveaCeI
	l83CG41nkWqFZOjXaEv5HIZCDOM96VBtnlj0EoyAKQwU23FIhMm3mTC/GGZkc69/zE3ArEk6Y/l
	ogFxPXcmPU3Swx5o81uD+DKeEH0wLQNBrfvX08b2AmrEWspmLln2koevB4aKscVZia5xZvg1Dh4
	/c=
X-Received: by 2002:a05:6830:3981:b0:771:5ae2:fce0 with SMTP id 46e09a7af769-7d591bbee14mr7612310a34.20.1772455599657;
        Mon, 02 Mar 2026 04:46:39 -0800 (PST)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com. [209.85.167.175])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d5866269a8sm10816138a34.13.2026.03.02.04.46.39
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 04:46:39 -0800 (PST)
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-463208653d6so3539325b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 04:46:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWY+NljvuBtWYbWqzbb/OHziFhpPi1JCckeFIC0b+BzunaW0TDyZH1jfTG/bwPskSEM9EdR9APZuDcjCoeXyd5o@lists.infradead.org
X-Received: by 2002:a05:6102:b0f:b0:5ff:3159:303f with SMTP id
 ada2fe7eead31-5ff3228629emr4217443137.7.1772455202516; Mon, 02 Mar 2026
 04:40:02 -0800 (PST)
MIME-Version: 1.0
References: <20260227153225.2778358-1-cristian.marussi@arm.com> <20260227153225.2778358-3-cristian.marussi@arm.com>
In-Reply-To: <20260227153225.2778358-3-cristian.marussi@arm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 2 Mar 2026 13:39:51 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVCgq4Wbm8g_O9e1sPhJ4PyY-nWTt9RW1f3=G3a0PvdKA@mail.gmail.com>
X-Gm-Features: AaiRm53Myvi_2ZqSj1TUDPoKLpT_7oeJnXIYfnZdksVjKBsJ5C9Q8S7vMIJT-rk
Message-ID: <CAMuHMdVCgq4Wbm8g_O9e1sPhJ4PyY-nWTt9RW1f3=G3a0PvdKA@mail.gmail.com>
Subject: Re: [PATCH 02/11] clk: scmi: Use new determine_rate clock operation
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	arm-scmi@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, sudeep.holla@arm.com, 
	philip.radford@arm.com, james.quinlan@broadcom.com, f.fainelli@gmail.com, 
	vincent.guittot@linaro.org, etienne.carriere@foss.st.com, 
	peng.fan@oss.nxp.com, michal.simek@amd.com, dan.carpenter@linaro.org, 
	geert+renesas@glider.be, kuninori.morimoto.gx@renesas.com, 
	marek.vasut+renesas@gmail.com, Brian Masney <bmasney@redhat.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_044641_517144_A33D6D66 
X-CRM114-Status: GOOD (  28.98  )
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

Hi Cristian,

On Fri, 27 Feb 2026 at 16:33, Cristian Marussi <cristian.marussi@arm.com> wrote:
> Use the Clock protocol layer determine_rate logic to calculate the closest
> rate that can be supported by a specific clock.
>
> No functional change.
>
> Cc: Brian Masney <bmasney@redhat.com>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-clk@vger.kernel.org
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

> --- a/drivers/clk/clk-scmi.c
> +++ b/drivers/clk/clk-scmi.c
> @@ -57,35 +56,17 @@ static unsigned long scmi_clk_recalc_rate(struct clk_hw *hw,
>  static int scmi_clk_determine_rate(struct clk_hw *hw,
>                                    struct clk_rate_request *req)
>  {
> -       u64 fmin, fmax, ftmp;
> +       int ret;
>         struct scmi_clk *clk = to_scmi_clk(hw);
>
>         /*
> -        * We can't figure out what rate it will be, so just return the
> -        * rate back to the caller. scmi_clk_recalc_rate() will be called
> -        * after the rate is set and we'll know what rate the clock is
> +        * If we could not get a better rate scmi_clk_recalc_rate() will be
> +        * called after the rate is set and we'll know what rate the clock is
>          * running at then.
>          */
> -       if (clk->info->rate_discrete)
> -               return 0;
> -
> -       fmin = clk->info->range.min_rate;
> -       fmax = clk->info->range.max_rate;
> -       if (req->rate <= fmin) {
> -               req->rate = fmin;
> -
> -               return 0;
> -       } else if (req->rate >= fmax) {
> -               req->rate = fmax;
> -
> -               return 0;
> -       }
> -
> -       ftmp = req->rate - fmin;
> -       ftmp += clk->info->range.step_size - 1; /* to round up */
> -       do_div(ftmp, clk->info->range.step_size);

Oh, so the truncation bug exists in the original code, too.

> -
> -       req->rate = ftmp * clk->info->range.step_size + fmin;
> +       ret = scmi_proto_clk_ops->determine_rate(clk->ph, clk->id, &req->rate);
> +       if (ret)
> +               return ret;
>
>         return 0;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

