Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAC6BCCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 12:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DzW1Nmfxb6NiioFQyuj9BtUlANBvsFTwFmbLEk2yLZU=; b=TQlZSz47f4wolwQP0BhTNuxXJr
	qoR7U5ND5CUuz5m9Jz7z77Ph252fKGQlRG+uQSBr02ZaIEHcQJJIxRaw8h3SiI7rARNbJx/1ZVFFS
	2JXgYgp+m9Y/gizhHmpUkHOvw2nrxICBb/+KX1ivva/2w/IsMlZlu8x7O3XVWPbMWJVLMG4ed0k4k
	nU5CQ3DZ9wNj5auuKIpWo00jvYdq+ldtJHui4QmnhHSk/LjOig5srxMubDwARYoN+jnrLNFlbiiLK
	RX8zFlm9wu/Fu5NgCqafsMmZ26oIr8B2N4QvzLPJTyrfRzJXOJHwxgRj3NX8Xo2PF0PI52ZK9Amir
	3IIu+ZGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIQvy-00000005Ovk-3o9p;
	Mon, 10 Nov 2025 12:23:46 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIQvw-00000005Ouc-18Y9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 12:23:46 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-63b9da57cecso4626476a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 04:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762777422; x=1763382222; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DzW1Nmfxb6NiioFQyuj9BtUlANBvsFTwFmbLEk2yLZU=;
        b=NHCCTgLdfUEQtPcSu0r6QMmiabBaBPaYEJE+2tYVbf8FQQSHw7iKzfdgnoS/uADUJz
         hdSPv690Foq4L1AXYAbS8lKDum5uDaWy0RtZ5WA0jerjF7HYjKWR27fq8G+T0tPM3Oue
         5CMQ1HXZhR1hTj08U+btVZ3vAInJ40MWI3fiW8TXzT8YCYOW1DGZLxyuT2yLnyBthY+0
         ztF5fJVBF3DqWF4tt5HVPPrReL7XVmnJxqh/xsTk1v7drqY0g8CT9vA5md5VWZulrKo8
         HZIpCpTUZABZR9KItlifymd9k3tBCoH6b/ni+tWKOX+W3LR4mztR0wZdDOiFplTJC6A5
         poFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762777422; x=1763382222;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DzW1Nmfxb6NiioFQyuj9BtUlANBvsFTwFmbLEk2yLZU=;
        b=I1LO2gKTli92nQaMLezAJV/Ao5gVon9iEUCn+o8YlaW45x2Zog8bRaUMZsS4oCxOjG
         H/QMMkaexhwrqyPXOu1DexyEwXhHS+ROJXCDaRccjhuCEQpKsgOHw0drVfmHhPUyOHmm
         EiDgRArrS1oGbzXymhhiMpHk8fQkP/ioJB1Gr7R6HKMf3oVFr86/Ye+08yGKd6d2O00f
         aDPJbIUCLaCqx6hC8PNvua7eqXjWDPPXCQ7RmC4rnSOyk5xAvjiZVV+5bz+f05LvA5dZ
         N8boGGgCPdpLc9XVQq7u3yDHJZI5Z4sfQCvxOotTHcV654C27q1BL5h3jAk54Q/bFocT
         xiXw==
X-Forwarded-Encrypted: i=1; AJvYcCWzlTrzDGX7vUVpu4L+E/A6qQURW56UlQepTD0iJ2VbF8kxpOeHMiebEWbR6ez0yOTAQHA2XRftHJJRyCpSZUxv@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6RRDI9nTpcMgZQljsL9vcDiBczKwB3niVbI3Mg47VjybuiP8d
	smWDxVE77Kz2X0eLS+rnLiZWZ6ruFXlRp1lH6WaQqVpcm3yvcuvs0c/b5DLZfoiUQlQy6G85ryU
	4p3gCqJC51JEVvfIchH9hgzki2Tx1iveszJNVzk0hxw==
X-Gm-Gg: ASbGncs8Np7sKMQrVvEj6WSx3K0sbquHySqp6ZeNup1/3tuU3rtdfPYgVcjT7OykUNL
	I4gtr7AOj7lX6qEOp55CyFtkdSZfyAxugS8jACgIHYAjS+yA5lM6mSewegt6Y6MBAXbFSrVd6y1
	0Gg7RfBl2kq5dxSgFBN1oRNILa8y90xlWmpj92EFFIfecbqhhFRxffG4WHIRUCySBcXsiL0KNEL
	T1HCE65TCGrStunXAgbWna7V6KzvAEGE1BkLdbliQU0tHuTeXwbqiKxKYTzSlfOLaipVE9Aplpg
	G3xOTis=
X-Google-Smtp-Source: AGHT+IGm5+Uu79ujlZItIA42GflK7UfV+AyBRUd53fOR/2PdZlplGxgc5r7/bRr9gNtqR7fwtBSp/+VdEs2VA7Pi6Oc=
X-Received: by 2002:a05:6402:305c:10b0:640:c454:e8 with SMTP id
 4fb4d7f45d1cf-6415e7fd2c9mr4878827a12.30.1762777421528; Mon, 10 Nov 2025
 04:23:41 -0800 (PST)
MIME-Version: 1.0
References: <20251106-clk-pmdomain-mediatek-round-rate-v1-1-49441ea27f84@redhat.com>
In-Reply-To: <20251106-clk-pmdomain-mediatek-round-rate-v1-1-49441ea27f84@redhat.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 10 Nov 2025 13:23:03 +0100
X-Gm-Features: AWmQ_bnh8tp1oLAuPElgvSFmN8WE23c2ga9LAvFWkFMPaVp1NApY8JmtQI4OamU
Message-ID: <CAPDyKFoq=dJW_FCVykBwH85+RbeZ-SR6=vF0vKw+237TsgOfDA@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: mediatek: convert from clk round_rate() to determine_rate()
To: Brian Masney <bmasney@redhat.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Maxime Ripard <mripard@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_042344_329135_2EFDA748 
X-CRM114-Status: GOOD (  21.50  )
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

On Fri, 7 Nov 2025 at 00:40, Brian Masney <bmasney@redhat.com> wrote:
>
> The round_rate() clk ops is deprecated in the clk framework in favor
> of the determine_rate() clk ops, so let's convert this driver so that
> round_rate() can be removed from the clk core.
>
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c b/drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c
> index af20111067c02a5f9a0d6d751e9e0dc32c1a4d90..9bad577b3ae4bf1b83d4f782bb52f56f779a8974 100644
> --- a/drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c
> +++ b/drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c
> @@ -309,11 +309,11 @@ static unsigned long mtk_mfg_recalc_rate_gpu(struct clk_hw *hw,
>         return readl(mfg->shared_mem + GF_REG_FREQ_OUT_GPU) * HZ_PER_KHZ;
>  }
>
> -static long mtk_mfg_round_rate(struct clk_hw *hw, unsigned long rate,
> -                              unsigned long *parent_rate)
> +static int mtk_mfg_determine_rate(struct clk_hw *hw,
> +                                 struct clk_rate_request *req)
>  {
>         /*
> -        * The round_rate callback needs to be implemented to avoid returning
> +        * The determine_rate callback needs to be implemented to avoid returning
>          * the current clock frequency, rather than something even remotely
>          * close to the frequency that was asked for.
>          *
> @@ -325,7 +325,7 @@ static long mtk_mfg_round_rate(struct clk_hw *hw, unsigned long rate,
>          * high current frequency, breaking the powersave governor in the process.
>          */
>
> -       return rate;
> +       return 0;
>  }
>
>  static unsigned long mtk_mfg_recalc_rate_stack(struct clk_hw *hw,
> @@ -338,12 +338,12 @@ static unsigned long mtk_mfg_recalc_rate_stack(struct clk_hw *hw,
>
>  static const struct clk_ops mtk_mfg_clk_gpu_ops = {
>         .recalc_rate = mtk_mfg_recalc_rate_gpu,
> -       .round_rate = mtk_mfg_round_rate,
> +       .determine_rate = mtk_mfg_determine_rate,
>  };
>
>  static const struct clk_ops mtk_mfg_clk_stack_ops = {
>         .recalc_rate = mtk_mfg_recalc_rate_stack,
> -       .round_rate = mtk_mfg_round_rate,
> +       .determine_rate = mtk_mfg_determine_rate,
>  };
>
>  static const struct clk_init_data mtk_mfg_clk_gpu_init = {
>
> ---
> base-commit: df5d79720b152e7ff058f11ed7e88d5b5c8d2a0c
> change-id: 20251106-clk-pmdomain-mediatek-round-rate-649a9bf7d30a
>
> Best regards,
> --
> Brian Masney <bmasney@redhat.com>
>

