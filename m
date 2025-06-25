Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83069C7EE39
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 17:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aj4jAhuCkHLc0MKXkhpZy35x/RLjZn6KIWkW8s4y+Y4=; b=HwFu9RGv7/rrYUdh4Xz0j/FJ46
	zji63eNMRde3TNENZt3KEHzuDdeaxbWxVrkx/VCOXQmnP3V8bQFNc6CYld+3KjgwoXajIj087wPkd
	wj2R9mMfEtZNaidIu5Smr6M2TKreUZUUOHL56xhdBWuRp9Yx8B7LiuiPc4znQKnQZNmXZGuopxSey
	EbYuaen8d79RJTOAT/pFVTT07l0fEbRqAvA8SwOQGxUAJkLe+ZUVYt6qfxGggvXsg4pjngbKwDf09
	JVIgEKRRBG8ylutLHB7xy0PwQMQT63Fa5SVJDIT8BNq3Z6hn59ods3ILFK2NWLP1hAnl7ioIfAyeM
	xFwfXwdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUU36-00000009T62-16zO;
	Wed, 25 Jun 2025 17:36:40 +0000
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUPWH-00000008faB-1ST5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 12:46:30 +0000
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-e8275f110c6so4951126276.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Jun 2025 05:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750855588; x=1751460388; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aj4jAhuCkHLc0MKXkhpZy35x/RLjZn6KIWkW8s4y+Y4=;
        b=gDOgyx4/j/bnnwAWpzp4ZrIbz7I+00Mn4e/gRx38Ok/5NHcCgzqWtbguW4aS2nlU6a
         6Wv3mAaWhdUeIHQtmmu97kdMF1O6WjxxEW7dwNnkZIeETD/fa+0Dt5HSm622CTv85hfO
         CMywBf7B5BuFVFWoQG/WhfXceHE95e5d1wsGnPmauHuyjHuKvw/7raszVovm069HLr7e
         5BPmj6Wdfl97v3ndAL6zjHGq2hMwGelN1Wivac4hbQpd6j2XJZwK8vWwtAQLPMVMRzNz
         QFCp9sWmdQyFg9Pm4Q8x5afaFfNd9dl6aDkqSx2HamePOZw8zAbVeFdhxqqbWoQya/1w
         BCXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750855588; x=1751460388;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aj4jAhuCkHLc0MKXkhpZy35x/RLjZn6KIWkW8s4y+Y4=;
        b=To5sYDaJgGWg/BxNsVVxvl0x0gjbeMrCt3lQkJWCGZie/te2seP4fWPWFnz14PHSEf
         u0AU0uuuY5YIfLZzny9l6fZ1gkUMy71i6IORfbBxrPeZVxQkP64mmVKJXeqlfTvhv91P
         8fA/RRjftwvOQlLbXwSIXLrTAjCpBDWORvnsQ61J8gGadfgRA3+DlIJ9XjY8GyjGCVfR
         m0W1EtrEOz/72j+aGBoyPICXijx97oVsz/13960z7RmI4GarP6VosRD+Rl/49/cP4kZw
         /MTCcRpVVBPBLPsTteUv5swZlc5c6mIqUc7zbT5pW617EhnN2soNxS/BrwX9elHvvaiv
         D51Q==
X-Forwarded-Encrypted: i=1; AJvYcCVg2O0He2fxyoAIY8oFcksQ2zwyYQipaaSVB+2dK4JauzYBTnALRR+PlBlV7akq6+SXdGBbDVq9tlM6+7dXClWK@lists.infradead.org
X-Gm-Message-State: AOJu0YyDtlp78F4Tt10DN6LiMCzeJes+7uifg+ZFHOXZ6+FWRm9Ei1jJ
	uulnuH4YdQzmneb8WCj/LWZcmHa94DubR6U0w1iNTtBv1/3JPeri70V79ySSJJcO3x1QBICN8qh
	BeAyDIFX9xW8VS6W+pIIhmrbivMnjkoZw3gu0OHFL9A==
X-Gm-Gg: ASbGncuTdzD1MdXPdoLmpwYlGToLSoTVG9OkKm3GyR8SqQ6xue8ouus/ApLuTnPacdj
	KvRQlLCWfNOyBMxcUX6Cn7IjK6DlY7QfPehk9rC2nFY72+IKvfpykcvS2RrKKU3UcggePjn8eL/
	8RK5fvSVnTAiC1MNop/Yt1Y938ArnFnvK+y4OrlWweiVA=
X-Google-Smtp-Source: AGHT+IHuqbs3+ZWuZkWAAPqD4OwhWYQ4/+DMgIxw4fLXOlRsaFo0LQlpSx2p1DV+41IMvrV599rDMZdlt1nY1Sc/mtw=
X-Received: by 2002:a05:6902:2782:b0:e84:2cbd:3212 with SMTP id
 3f1490d57ef6-e86018cf6afmr3027295276.20.1750855588294; Wed, 25 Jun 2025
 05:46:28 -0700 (PDT)
MIME-Version: 1.0
References: <174972756982.3337526.6755001617701603082.stgit@mhiramat.tok.corp.google.com>
 <20250625052106.584905-1-senozhatsky@chromium.org>
In-Reply-To: <20250625052106.584905-1-senozhatsky@chromium.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 25 Jun 2025 14:45:52 +0200
X-Gm-Features: Ac12FXwFOrEcUFEsusjn1MoQ84IvAh5xPRaGYt6omrx5SZ03KEKKj6Opk4VwAGk
Message-ID: <CAPDyKFoYgi3bauUQ8xrc+0KtwmmXi9jNNzcOt_fmyP2pFQ9Jbw@mail.gmail.com>
Subject: Re: [PATCH] mtk-sd: reset host->mrq on prepare_data() error
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Chaotian Jing <chaotian.jing@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Tomasz Figa <tfiga@chromium.org>, linux-mmc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_054629_393621_3DFFACC7 
X-CRM114-Status: GOOD (  15.14  )
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

On Wed, 25 Jun 2025 at 07:21, Sergey Senozhatsky
<senozhatsky@chromium.org> wrote:
>
> Do not leave host with dangling ->mrq pointer if we hit
> the msdc_prepare_data() error out path.
>
> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>

Applied for fixes, thanks!

Kind regards
Uffe

> ---
>  drivers/mmc/host/mtk-sd.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index b12cfb9a5e5f..d7020e06dd55 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -1492,6 +1492,7 @@ static void msdc_ops_request(struct mmc_host *mmc, struct mmc_request *mrq)
>         if (mrq->data) {
>                 msdc_prepare_data(host, mrq->data);
>                 if (!msdc_data_prepared(mrq->data)) {
> +                       host->mrq = NULL;
>                         /*
>                          * Failed to prepare DMA area, fail fast before
>                          * starting any commands.
> --
> 2.50.0.714.g196bf9f422-goog
>

