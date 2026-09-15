Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBD26C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 06:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YJ/ZVEdkNsjrbjg2YrtoA+pGCWrHgTsXZF53fBuFvuY=; b=kzbqB+9P7YqcbLp8I4tihzC4kV
	yXp5hKxJ9d7qC8aH4egVZiAXR30AGNCRSxfCG7lwu6OuCNGhFNhcupgQy+xZ4SVcxVlBoNzdzm8K8
	eSScUYUyJSHq5aQasGrUnyv7ccFjO510QzgwQAWGlly94u16sp5sTY/UOGknbWM4wxPXSfyW/Ph1z
	BXb7cZPALDaD85Kg/3xApCkXAZGutSQEiUKhnSsgwOR4Yd3Swyk5tq6M0LJS7/tXipFh+voSeEUV7
	oBgSiD2+cOmOrcQGd4RIiJ4aYFQ++L5J4q5kySUICVsCwxXxfzXse0nfIuHbPGy7RImkANZlDPPXu
	daBH6EdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6ML2-00000005KXc-0j1X;
	Tue, 15 Sep 2026 06:08:16 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6ML0-00000005KXH-1jFo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 06:08:15 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so4005663a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 23:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789452493; x=1790057293; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YJ/ZVEdkNsjrbjg2YrtoA+pGCWrHgTsXZF53fBuFvuY=;
        b=cpcqzEWQA2cfet8OCMrKm4S1aWDLVXY3g5wH0KQySBhn8WDoeJBoSy5YF5b61pSL2b
         5M5gFJ/RjLGqAhH7FAW/ShIDMkI7sp8fzGYzsDa1Y4DSyDNIvYV32oFqwi1+lwVb3GCW
         jvJZxPfg5NMbIG79SCXOTL+rU8EWC8gozt5I0ZpO9tm1g9V0AHEkUqyugYl/qT6ypwkb
         QoSx4hRfflRZTrS4Zj8RtvcfHH96QWZksXXPZhUtu6OCUjDUgwsid6wg9x0PcWrik3fF
         oCAfORuKO4CHjfryT905y2UPMMKX7YGwYxlv4YmFjKz8BqGW1o5rJfOr+eBAnuQR8LCY
         Mdqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789452493; x=1790057293;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YJ/ZVEdkNsjrbjg2YrtoA+pGCWrHgTsXZF53fBuFvuY=;
        b=ZtBY5lBz2NdvbWA5jRmaak7nmfOhuE9wsXCD3Sya4Y7WteZfccI4KA1TSApiQCWtFd
         2uyaBaKtyK8AxOSZ0gMdJ06rNEqheVOsXRaHHvos/+sCc+dlQtHKKZPTRk2NUMIulLBP
         kvIrU3tp5jMKy0ffwXOWToURvhNyn5I1cVSDHTKA5bBQvWsMrXA6UeFqVPaeoOQPdR8I
         FTeO5UR2zfCVed0fdwPDoQ4dyM6W3He/BYXDwRD7U8MOMFR6BN/oqS0iZETqc0+0tVZd
         ZTGSpmq8poR34lAbt8/rD8Zo2Z8U8rja3r6KjMLPRCnlrtKJ1oVBCUgVZ+pLq2lL62eL
         4zrA==
X-Forwarded-Encrypted: i=1; AKwUvByULAKQrmEUv/Q6oGE2c01STQsaPaw/K+5zZqvydr43pLsNC1m7qX98aZkAY2EBGS8E7T8fLrWrJI1M9TPwMclC@lists.infradead.org
X-Gm-Message-State: AFuF++mYQE+YwvcGzUafXP+szeeGC2q8bhqLlWL4cY+fbvr10XU2p7an
	5G+NoxezzHxa/NaPEZiteaph3u3DyM0DpvcOl48sZ93lfrbu7LggGoyU
X-Gm-Gg: AYBFou0a+IqhQywe2rac5b998DfUEBxEdpyWr6+cfIgmwoI4TbsZPZRS0+LOZVGTS+y
	90qK+YqYZMQVOHfcQ5j3otny+I4RYJ/tC74K61qznOMFUtGQ63KW5ytHoNRndnKMHI/nvkg8YKV
	rGGio8q2uh5K9ZG7Hj6MhxJ4JYv5B857nZau7RWlA+BQboa5epZV/aFoYkhkcUT2c8nonhqB9fN
	f7XIi1o3IqhfZjEsL/KZDRGdOWmYIw7kupOd1WvPINYdROW3EGNT3Wj280paKdu54CVr4lgvwpx
	K7F+aCqe+ADYTcPsevw4qQJJh/Wqd4tzS3FTPij/Mvpo6nCUwWfl8qb/BCOQ7gCN0t+zxL462uf
	5gcjsVUIFxkKnZXFoMSbwGfaPCrMtMPNMtk2p/axl4RFLMjLOyuBovWSdMisqwI5U3MQyjSy//j
	M/f9eUgXqw+hmpwOgce/jE7fRsDckRkLc260fxGxfWx+b7Y/S3k34y9nbPGMNiR8yLGeTyVJlVk
	dPjwxe9HOD167uZSIvYI9yRA6sOe5QrKloNjihHUMWyVumCguWXPBw=
X-Received: by 2002:a17:90b:4a8c:b0:39e:261:4e12 with SMTP id 98e67ed59e1d1-39e02615623mr3589464a91.23.1789452493406;
        Mon, 14 Sep 2026 23:08:13 -0700 (PDT)
Received: from [172.19.1.47] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfda7d765sm3146170a91.10.2026.09.14.23.08.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 23:08:12 -0700 (PDT)
Message-ID: <4997b79c-fb9d-44be-a9ee-1af2d6e5d0f9@gmail.com>
Date: Tue, 15 Sep 2026 14:08:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rtc: ma35d1: fix permanent clock reference/enable-count
 leak in probe
To: Cong Nguyen <congnt264@gmail.com>, Jacky Huang <ychuang3@nuvoton.com>
Cc: Shan-Chun Hung <schung@nuvoton.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260914131850.2331670-1-congnt264@gmail.com>
Content-Language: en-US
From: Jacky Huang <ychuang570808@gmail.com>
In-Reply-To: <20260914131850.2331670-1-congnt264@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_230814_462188_A0B6EFB9 
X-CRM114-Status: GOOD (  13.51  )
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

> diff --git a/drivers/rtc/rtc-ma35d1.c b/drivers/rtc/rtc-ma35d1.c
> index cfcfc28060f6..43358d68565a 100644
> --- a/drivers/rtc/rtc-ma35d1.c
> +++ b/drivers/rtc/rtc-ma35d1.c
> @@ -221,14 +221,10 @@ static int ma35d1_rtc_probe(struct platform_device *pdev)
>          if (IS_ERR(rtc->rtc_reg))
>                  return PTR_ERR(rtc->rtc_reg);
>
> -       clk = of_clk_get(pdev->dev.of_node, 0);
> +       clk = devm_clk_get_enabled(&pdev->dev, NULL);
>          if (IS_ERR(clk))
>                  return dev_err_probe(&pdev->dev, PTR_ERR(clk), "failed to find rtc clock\n");
>
> -       ret = clk_prepare_enable(clk);
> -       if (ret)
> -               return ret;
> -
>          if (!(rtc_reg_read(rtc, MA35_REG_RTC_INIT) & RTC_INIT_ACTIVE)) {
>                  ret = ma35d1_rtc_init(rtc, RTC_INIT_TIMEOUT);
>                  if (ret)
> --
> 2.25.1
>

Hi Cong,

Thanks for fixing this.

The conversion to devm_clk_get_enabled() correctly fixes the
clock reference and enable-count leak while preserving the RTC
clock behavior during the device lifetime.

Reviewed-by: Jacky Huang <ychuang3@nuvoton.com>

Best regards,
Jacky Huang

