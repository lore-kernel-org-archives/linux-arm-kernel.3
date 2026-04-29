Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E676DFF887E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 22:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+QdR822Oh+h/wb6tFT1ZtMo5BW1zB1OWiICj47LJjjk=; b=XeTM6QYsVfX7XdTdN/Ct+K79ur
	Arb7I4s0RV1U1HpAObOC4oeGSc7lx6yOtXFlMV355iAbpw5ipxwx4ilmiCYSTWgaIZuer3p4bDs/w
	jusRRF6AiYG8ODJVnMp+KzCmN+zg1yTlecEynulQAfK8ttX8MjwRofzlGt+bo1CUrsQOkYblYE7uJ
	Up7UDQOD4efK/aCCvSOWZXV9qp6VxihFLuPPXGovkwnxHFjCzBqkcYQdjjwWL3+w0ktDA9v2w7OBx
	3sXXVL2yBtuhmDGyHewGp3SHYj/gV17GJO5NLniT+7h55vuOVDrwbqreoErhaYm7wYrSyy7Rd/fBv
	dgXaHG7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIDVC-00000004HI8-1clA;
	Wed, 29 Apr 2026 22:35:30 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIDVA-00000004HH1-0QLk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 22:35:29 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-35da2d35eccso155456a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 15:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777502126; x=1778106926; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+QdR822Oh+h/wb6tFT1ZtMo5BW1zB1OWiICj47LJjjk=;
        b=VMrMR/CbX381epuUubeK6pgr2EthfopJVy+e2qWhIiFdZHPa+DLSjE0dJXBaMBfeWh
         /RlcgAmG+i57CnA5a5QSQcA5df3/oUOS+ij98PB8FDJKyvX8HWuiCAWMuxy6veA8Mvxg
         RSW1CrjaOmT1khxl88ktj3xqpOgUBFr0LoQoeWkH7jnzdE/BL6xhK798/yUCDD2FCWsL
         U0G/ukwKPM9BBzAxVnuSEUmBLY1zh0vTomacWYqGlJ6vFhQMnZaqY/nMyF0y91X8pb6p
         LXPWJJJnNSd3HGRdi/4rIXtxILKLnclG3ie8PeTh1ASaUgNdQ4/+gvaYI4DrPexoQX1V
         l1hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777502126; x=1778106926;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+QdR822Oh+h/wb6tFT1ZtMo5BW1zB1OWiICj47LJjjk=;
        b=gxJdCvJr4HAF04qDxnD+IlHW2nIBar2AtD1J5h9y47QAybwFQNexRxGjc/xCdCBupf
         hSWMg7771GfVAGTzGWwNYJU9gG4GdB2fxPHk7e2gacshSQ5PzE3mLN7z/JPIkRzJ5DTa
         BnoOh9M1/7dfJ1gectZ+F8OoHDEUbNzijj34nE9WSB0L1vtIgR4Uhm2vYU5PiBIiJCVk
         NdHmqw09oTF0HBtJeBY3MR2jf1s8Og5xgN8k3xPvnmf9fIk6OoOcN/ZgIVQvSSTCt6Sk
         3qgTp/ifdhpVmCa49BsSyq/ghRX1s1YzU7u3pMQNXjuACW2Dsnm1McX3HqOe51owxMvx
         fz5A==
X-Forwarded-Encrypted: i=1; AFNElJ/p2FO2OMVQ1OvfZ9PCvg2wsyqHLROffTyo354pxffGDEHxNeIdIfx6mln93qajA12gg7Cuc7hJhV/RdPhTe/JX@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3tP1g5JFa/HKStdy+oW0bHdSwv+UpTFQ6fNOMtgaXzEI+O6mB
	q5KXadaGisaNLbsFiJoilVuQyuYn9NZSoB18EURyWilfSFl0lHblBKcU
X-Gm-Gg: AeBDieutZD3rdFm6319hQT6wryY9JOE54MQPvFNwc1uTR3QdGcEEv6GtkoP0a+jGjkh
	i2MocqzJl+wy8VqELfvaNSnFoK7R7E8BsyQ+LBH7Ew4205JLZd4mni0EI5cEbFxWIqKJIGMQnKT
	34ZxRF+MCBegEn46ZeSR0OriiEqYp6DxcmaNGCLisIvoA3L3b0S7NhHPH9yE5z4r3s49XRH+6pI
	c7LKCeCrxV6ADHgcukhl8h1PvfakfozFOI29wrkxL4ZctbcU3FgoJKZOb+7QG8chf4xJk2HmXi/
	YJ6BaMah2Xbpz2zUb1UsJ5F9cy/C8XqMZwahh4Qctp1JNnWm4uQABF3Glx2C+sCsYgPpSOSLH11
	y5Q73+BqOLE38rdUO75l5ihJmMyNQIF2qxG3g+PdOsha73Ru1nErZMYg322Efatd8wGa7MueGKu
	Td8pk1z51cP1U2IvkUOpfk0aGuzKKS0tNAYia6/jFmyzhvffP96w==
X-Received: by 2002:a17:90b:3505:b0:35b:e690:c5ad with SMTP id 98e67ed59e1d1-364c310b735mr183471a91.25.1777502126475;
        Wed, 29 Apr 2026 15:35:26 -0700 (PDT)
Received: from [172.30.1.27] ([222.106.243.217])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364bdf69bc2sm649418a91.10.2026.04.29.15.35.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 15:35:25 -0700 (PDT)
Message-ID: <097b96b4-9a43-404d-b06e-9b087a37dec4@gmail.com>
Date: Thu, 30 Apr 2026 07:35:22 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] devfreq: event: rockchip-dfi: fix missing
 clk_disable_unprepare() on error
Content-Language: ko
To: Anas Iqbal <mohd.abd.6602@gmail.com>, Chanwoo Choi
 <cw00.choi@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 Heiko Stuebner <heiko@sntech.de>
Cc: Kyungmin Park <kyungmin.park@samsung.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260319163011.18876-1-mohd.abd.6602@gmail.com>
From: Choi Chanwoo <cwchoi00@gmail.com>
In-Reply-To: <20260319163011.18876-1-mohd.abd.6602@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_153528_137180_BBEB9C36 
X-CRM114-Status: GOOD (  17.81  )
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



2026-03-20 AM 1:30에 Anas Iqbal 이(가) 쓴 글:
> Smatch reports:
> drivers/devfreq/event/rockchip-dfi.c:215 rockchip_dfi_enable() warn:
> 'dfi->clk' from clk_prepare_enable() not released.
> 
> If rockchip_dfi_ddrtype_to_ctrl() fails after clk_prepare_enable(),
> the clock is not disabled, leading to a resource leak.
> 
> Add clk_disable_unprepare() in the error path to properly release
> the clock.
> 
> Fixes: d724f4a4581b ("PM / devfreq: rockchip-dfi: Prepare for multiple users")
> Signed-off-by: Anas Iqbal <mohd.abd.6602@gmail.com>
> ---
>  drivers/devfreq/event/rockchip-dfi.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/devfreq/event/rockchip-dfi.c b/drivers/devfreq/event/rockchip-dfi.c
> index 5e6e7e900bda..8db0bceeded4 100644
> --- a/drivers/devfreq/event/rockchip-dfi.c
> +++ b/drivers/devfreq/event/rockchip-dfi.c
> @@ -185,8 +185,10 @@ static int rockchip_dfi_enable(struct rockchip_dfi *dfi)
>  	}
>  
>  	ret = rockchip_dfi_ddrtype_to_ctrl(dfi, &ctrl);
> -	if (ret)
> +	if (ret) {
> +		clk_disable_unprepare(dfi->clk);
>  		goto out;
> +	}
>  
>  	for (i = 0; i < dfi->max_channels; i++) {
>  

Applied it.

Thanks,
Chanwoo Choi

