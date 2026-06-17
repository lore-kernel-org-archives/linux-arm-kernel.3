Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D955CCD98E1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 03:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gix0nvCYK1OhR2Kcuql53IhC6b91d4kE/6Woyx2T6JY=; b=tjHe3HYfTSl2ViiVli9ER039ER
	D0+MMTBbBPd8Cr1F8XYPwi3PFvvuhRdXpXQTh84YPaFwufP8IQXqzfC5PwX4JgByhyO7oaTCVl6Eu
	e/FkAHF/qqcmUotdPQfPIz1K7mAysJ405aIASORNXBlGxZLwOCH3y2syxLvMl5hmGogNsewSDVyWz
	f761T4yvQUohsnYk9nL2d60ub7iOpC4vAHM+oAzYw3kpJa7z9tDEJXXzo86wDapwNjpzNikU1h19S
	uOU5WzGaUIsMNtHlNgpe0UrTUlRG3CY148Fn5c2+9J+EAp1YTNTS58EzETvgU0fwYgoLYpdGZNcOL
	bUndwGXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZh9Y-0000000GZF9-1lFj;
	Wed, 17 Jun 2026 03:41:24 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZh9V-0000000GZE3-1nwI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 03:41:22 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-36da8439078so4569727a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 20:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781667680; x=1782272480; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Gix0nvCYK1OhR2Kcuql53IhC6b91d4kE/6Woyx2T6JY=;
        b=Tn4xATAJYmWCqB/nue4djO2i/1PzNtL3I7IUdRJxZ1LjR2gKHcSfQAIwc51vzkuO0N
         2zqPyLJ/WB6ViIlHZMac2g6SsKP5c4sirPu82ISWi7JBhL+2u1qFjF5zK9GWnfspDeq9
         8EsRO4v/H9MNSjUNdpN0Vfk3MfhJw92XQC1cY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781667680; x=1782272480;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gix0nvCYK1OhR2Kcuql53IhC6b91d4kE/6Woyx2T6JY=;
        b=Fj0oe8+cYvIqW9Jtwvk3D/LHOu5nmmenJDwnpnbA6OmI+r4yZQQJVmonS37DDHtceh
         lSLkJ4Ol11mZwJebzgo6jGkdDRbdPzdPDu+g6xw0/tnJaH0qR37DuJ1SQSpV48/cNd5/
         zi43krBoseJOBOwMExk9FTepEK7BCp1YlrUZeVZ0gPvly0ddSLISKQ9Bz0IO4Mv8FSNG
         oRuK8pWUnchsqfHqelv8pWVqcMRGURlnb8483ybi3SKv5rf8qAV27T/11dn8MVs68GI4
         tSr/llVYWemsU8iDjdEpyVdmeS17BmxrC9orNygFFXjLqKMtCoO0ueAJ/OandfI1PyPh
         iqiA==
X-Forwarded-Encrypted: i=1; AFNElJ9YEPpJAZcGuQXAVHLrC4uo0H/5GvVut1GIMenm31Wh4D5Ee0OuaXhlA48s9PAcYFaaLVkMvLeS5Ta2U3d3nAq5@lists.infradead.org
X-Gm-Message-State: AOJu0Ywlc/6qQmWGcOYvZgbMzgvXTLJ1h6nVvN42Xp4y/v7kOE3Ct6AF
	fip8pf2M8H2XOiWGS4Pvhf2jEzOnfNLsIjU+hc+vugTPzx7JQk4bA7J5TYL+VwXQng==
X-Gm-Gg: AfdE7cmCwIQKnckT2thW3hjqCGlzoSQaQ8JliMW3ygUgBK72GOOMIGL/I3ekahc3PoA
	wL9oxd7AyI1X20Ru6XKFefsy04gTW0S41N5vOdjaGDduiVg/v2v9gsakrBjgG1W6xRUoVGmajtu
	KTukG94EPnBBEbYYNJNG29pwvAMNj0u9ly6ZdtvAblUIKtv3nPjJWpRBNwbBz7QwP324zIvqgFw
	QhCTd8F+FoOeT1l/rg87BBcBY8nCGIk4J/vUfEYWO2mK24B1N+6y3oXBeQZBs8iZ1FdwZdNSrHt
	ScaeEaJz6LiLuiZah0Z40LOhGX9a0lbNF8XWxeMLN6VL9/cQm5CxMFfCHNcDXrSKNslyKB+oh/P
	zGrNaleRH9HMEamwhUxbHLWkNOfUaImFXzxTmltruSYJKyY3G/j/q9fLkpMEAviwmEmcHYRckAf
	TiGmaqJMYqND+2tTBmSzLNE2bwBTx/VJCIxdwhjlT5oaJyVsMHn0c=
X-Received: by 2002:a17:90b:5107:b0:36a:a16b:5f65 with SMTP id 98e67ed59e1d1-37c9372863cmr2233719a91.11.1781667680584;
        Tue, 16 Jun 2026 20:41:20 -0700 (PDT)
Received: from google.com ([2a00:79e0:2031:6:a0b:fabb:5b62:b85b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37c521d8e7bsm4513705a91.5.2026.06.16.20.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 20:41:20 -0700 (PDT)
Date: Wed, 17 Jun 2026 12:41:15 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Sean Wang <sean.wang@kernel.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Mark-yw Chen <mark-yw.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Tomasz Figa <tfiga@chromium.org>, linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH v2 3/3] Bluetooth: btmtksdio: call cancel_work_sync()
 outside of host lock scope
Message-ID: <ajIWAC9b_l6Id_6A@google.com>
References: <20260616111224.152140-1-senozhatsky@chromium.org>
 <20260616111224.152140-4-senozhatsky@chromium.org>
 <CAGp9LzqT4knwk9hONu43cGDr005Phs3xw6T+YexXa3X6JEBOpA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGp9LzqT4knwk9hONu43cGDr005Phs3xw6T+YexXa3X6JEBOpA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_204121_510470_E1173671 
X-CRM114-Status: GOOD (  16.03  )
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

On (26/06/16 19:56), Sean Wang wrote:
> The patch looks good to me. Inspired by your patch,
> do you think should we add another patch to keep txrx_work out of the
> reset window by rejecting TX during reset,
> ignoring reset-time interrupts, and making queued workers exit early?

I honestly don't know, it's hard for to me judge as I'm not all that
familiar with the code.  To make things more complex, I don't think we
see any crashes on reset path.  My personal preference maybe would be
to keep things the way they are?

> Some code like:
> 
> --- a/drivers/bluetooth/btmtksdio.c
> +++ b/drivers/bluetooth/btmtksdio.c
> @@ -567,6 +567,8 @@ static void btmtksdio_txrx_work(struct work_struct *work)
>         pm_runtime_get_sync(bdev->dev);
> 
>         sdio_claim_host(bdev->func);
> +       if (test_bit(BTMTKSDIO_HW_RESET_ACTIVE, &bdev->tx_state))
> +               goto out;

A nit: I think you can test_bit() outside of host lock scope.
Other than that I'm afraid I cannot be of much help here.

>         /* Disable interrupt */
>         sdio_writel(bdev->func, C_INT_EN_CLR, MTK_REG_CHLPCR, NULL);
> @@ -628,6 +630,7 @@ static void btmtksdio_txrx_work(struct work_struct *work)
>             !test_bit(BTMTKSDIO_HW_RESET_ACTIVE, &bdev->tx_state))
>                 sdio_writel(bdev->func, C_INT_EN_SET, MTK_REG_CHLPCR, NULL);
> 
> +out:
>         sdio_release_host(bdev->func);
> 
>         pm_runtime_put_autosuspend(bdev->dev);
> @@ -646,6 +649,9 @@ static void btmtksdio_interrupt(struct sdio_func *func)
>         /* Disable interrupt */
>         sdio_writel(bdev->func, C_INT_EN_CLR, MTK_REG_CHLPCR, NULL);
> 
> +       if (test_bit(BTMTKSDIO_HW_RESET_ACTIVE, &bdev->tx_state))
> +               return;
> +
>         schedule_work(&bdev->txrx_work);
>  }
> 
> @@ -1250,6 +1256,9 @@ static int btmtksdio_send_frame(struct hci_dev
> *hdev, struct sk_buff *skb)
>  {
>         struct btmtksdio_dev *bdev = hci_get_drvdata(hdev);
> 
> +       if (test_bit(BTMTKSDIO_HW_RESET_ACTIVE, &bdev->tx_state))
> +               return -EBUSY;
> +
>         switch (hci_skb_pkt_type(skb)) {
>         case HCI_COMMAND_PKT:
>                 hdev->stat.cmd_tx++;

