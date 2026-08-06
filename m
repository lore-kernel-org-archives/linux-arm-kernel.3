Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E017AC56208
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 21:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zwZ9QBMqGE2tZiVXNSVp3vvHqmz+exr7B1ifk8CdFas=; b=c9Jhp9zPfsXafyq00TrpxYeC0F
	rWFZwLKZbOPRkFqYp6mPtjH8vyFjK55TKd1XxT3f6hqdXwR60e2sAeMbtVqeDnIl0Hn+reQljZVf+
	laI8BPfzrM/m83ewcGBL7K+I1pIyWXwUWu6mywSErcpIklFLhkBZPyXXY6Ay8uherxmSkqMZNyKGC
	4nw58eKY/bnLwk6bLkiSOGRlT7JliseFr8Sc1e1Yyhc4KMDhUS8vd1jSIYCe0zQb1fefNzQbe8aG/
	2bYJ/az+eTtebakaDqO43o3QOYKvIfoHsR9NNR/7YpFyWNCG1Dxa8nT6c8TYJKM8xIEb3SZI0j0Vh
	bl2BfSyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws5ZX-00000006isR-0BFC;
	Thu, 06 Aug 2026 21:24:15 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws5ZT-00000006iro-3MBV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 21:24:13 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-84e04df8c46so3048815b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 14:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786051451; x=1786656251; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zwZ9QBMqGE2tZiVXNSVp3vvHqmz+exr7B1ifk8CdFas=;
        b=HYMUBC6JEoEVgdLdGkOwkHljl3dOhIxUvKRYBlHqOp5+jUq3aqAWxXLKBfE1t4nL/e
         P12TZEdwqOaHAfepr0azJ5Tw9WmM7FIDnaflR5SpLR4I/FZ/c1WqFO59715bmaYLBL+p
         wTUz7XIljQGYZQRsk/QWaER2Fyt9tf0LiiDJ5CVF8/erdXmgCNLhsQsXVpfxkqLOv3Lv
         1rxpiVaJUNTXA64k+hP5Z42Xa0sKsY86+Cj4ZmgJ3+rahwnCwm0er1ZkU54/sZtCWUNp
         lLA4o6PA7iWG6sqaWUClZ0m2aHFXQPF+vNcVp/d2FwlEVhlUXSdCt/nGAK7SpbUpSak6
         ejPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786051451; x=1786656251;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zwZ9QBMqGE2tZiVXNSVp3vvHqmz+exr7B1ifk8CdFas=;
        b=g9FIeFXcvbCI4Fj5giPpt2XhdxBBKN4Xrwn9qHmh3XM+eHz5w+WdULmcNlwrakr5c8
         5/bXWNUmziPJt4XMBcg5ljPV10Oo69DvcIUHQgzlNXYSIaySwtZ9PqhboDrnyP9AEX8L
         pyds7casj0JiU6Hbhu1DrRNvycLC4QKL3+3rsxsCxjXM0mbpvOQ+vaEXqGp4B/kxEXC0
         zuf79NQ+aYlrx8+3rlRX9PwH514mOXNaqWdBn3tIulR4GU08KnufJkcrT7kbirFMnhfh
         PIM+qTdYTsj6c3Pbm2gDnWrSWM9DG3JfXQuOej9UGB2tQM3hMI4dXDakNVxMvRiMLH03
         0nrg==
X-Forwarded-Encrypted: i=1; AHgh+RoPmZ7zDNDT1e+yoNJeyusXbiOkkAPmQTukT9yNGuCggSGR6OeW2JQ4ORYR4gui8+RVbJXkTTaV2I/Z/sZ3T1sb@lists.infradead.org
X-Gm-Message-State: AOJu0YxBCHKqhWYzqbuoMDFl46dfb6mSO2Snqe5vGdVQzuMmQcJztarC
	aRmbnqrzFLL+/cBtMSBRL8Jj8EQL1Fu2xQNBonji7VPvRn52GkLaAF0D
X-Gm-Gg: AR+sD109t2mad6dCNdJAu7EwCMdrrXaWq/1lL1cYGa6qF//dXY73f3W3QT3tAqCjAZH
	KCaG3D4wx0F1lJnt/otVYcv/mhU2EFGDqXPKlzzMqh8m19E7Ef5A6OEKYsc+HliiTMjx+Ej5yfO
	bA62s0PS66Zev+e6falJwrMQXEEzwq6nm8c5KMBAjZ1jOPlfQgnTjY7PnTljAWABbHe162as4SE
	ybFAO4Fw3M8SUGniwgzeQe82clP3I/dyFhJcy6AlmMtqJxnmkzBUdxqyCSSQBnz1BOc0SJJDMN2
	fd+YhjHS3Kjw7/6Ex4N1fYsxqIiXEYU8Pnknqx+Viria1pENiGxILCiX5d6ecB+jL0LFrsqDIzj
	L7yLtDsTtb1x0qA4VZkmLhap0sgZbJvQ7EKbsybYlpACnxREvP7UtmT9l4nCJloBPPqhMyKsyxV
	N0bMxszk/lhL7ikqywaZihvNPrRzp4JZ0cehfEwus1vg1nGFw88FEtdKhjNydrzyHi4eWWPENqF
	ETyvZfMdE6XxA==
X-Received: by 2002:a05:6a00:2d0b:b0:848:5c00:fa91 with SMTP id d2e1a72fcca58-84f2e0ed967mr19698345b3a.38.1786051450767;
        Thu, 06 Aug 2026 14:24:10 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a3a188esm10061b3a.5.2026.08.06.14.24.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 14:24:09 -0700 (PDT)
Date: Thu, 6 Aug 2026 14:24:08 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Hongyan Xu <getshell@seu.edu.cn>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-watchdog@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, jianhao.xu@seu.edu.cn
Subject: Re: [PATCH] watchdog: at91sam9_wdt: prevent timer rearm during
 teardown
Message-ID: <70f6bc97-a82b-4d9c-b3cd-79cbb4cf7866@roeck-us.net>
References: <20260806060613.1830-1-getshell@seu.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806060613.1830-1-getshell@seu.edu.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_142411_838883_FCBB30A7 
X-CRM114-Status: GOOD (  10.70  )
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

On Thu, Aug 06, 2026 at 02:06:13PM +0800, Hongyan Xu wrote:
> at91_ping() rearms the watchdog timer from its callback. timer_delete()
> neither waits for a running callback nor prevents it from rearming the
> timer, so probe failure or driver removal can leave the timer accessing the
> devm-allocated at91wdt after it has been freed.
> 
> Use timer_shutdown_sync() on both teardown paths. It waits for a running
> callback and rejects any attempt by the callback to rearm the timer.
> 
> Fixes: 5161b31dc39a ("watchdog: at91sam9_wdt: better watchdog support")
> Signed-off-by: Hongyan Xu <getshell@seu.edu.cn>

Applied.

Thanks,
Guenter

