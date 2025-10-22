Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91AC2CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 11:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nvWvVWsMp2HvZc/pRVfJNYeSWgEzu4aPg/sGoBmwFsM=; b=ZESvLaUqisugkwrgwPsS64cx0z
	+4CoxyT0UW3NIPaymZwmfqe4LDe7tnKH+V+KN8RVnqtny3eVzIt2+dADLeDJeOT/rhCLvYg4ZnNQ4
	ms/t+7q5ReguC+/dKpDBtph3iZ496aicRZpmp24gfTSIJMsWLKUvLIT4ln9srviDQmkTqdLPq+aKe
	fgigITb77Y8cIROZZNXqwNkn3wTBk0R3QRIu0dLmqpp8Ppq3b0I0ZL22HX9mys/hgYaurDFLXXoud
	cZdpLalEVgcaNWyNjR2a0kmP7sjKq6dN8c/3J0AxVWONm2nF5Vd6Euzqm6JgvsfGk+4si9P2Kn2A4
	xgAsCGtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBXTQ-00000002jPo-36l3;
	Wed, 22 Oct 2025 11:57:48 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBXTL-00000002jOc-0FW8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 11:57:45 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-471bde1e8f8so17428475e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Oct 2025 04:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1761134261; x=1761739061; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nvWvVWsMp2HvZc/pRVfJNYeSWgEzu4aPg/sGoBmwFsM=;
        b=Phavu5UevBu5aBkp0/ZIlmPv+7T/5eTOy9BHfw5DlBBhqADtDUM6ugKhStNf2tFlgq
         uITu1bgTeMBevhGpyRK7Jpvf8n/+Xm+veKEa3nDBuAvetrBAyAq2JN9bscrmADcJzakU
         cMtuGNt3jFSzmR0/FxWChwjzFdSOsYqDhBqBsqYl9a8IIYSOhXD6oYxyAN3C9tlVIp7N
         8O2pYTT0fImAq6qu8e0KQ+TwA+nMtDohUixygs5SNPI3OoC3Eug06zKP/PvhYSxwYgpf
         4nfrrrnMG+3kWSalvuuvJvgs1xiiwPoN9EJrkC1gHOghg503XO4nPnv4BYMP9rlGKoC2
         eKcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761134261; x=1761739061;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nvWvVWsMp2HvZc/pRVfJNYeSWgEzu4aPg/sGoBmwFsM=;
        b=H/MjR+4S6oohmukz1TuUq563a/QOTR2DX3XgMQ2tOx2b306+WUCiTZ3JusyQ6OkQXt
         76rf05rb+NejOeMiQ8PoViqKjbzrL5+FxaqZYEiSqgoK/XAlKR+DmFQkWbyFj+F6m3P6
         bTPO0DpmTngZxLksBNPkCvBTc4XhVjS+9lVV/dNdD8RrzcgAOCaPWN3BUlNFyBaxhF5P
         ZudyAyfUoDX2H8rGzZRZtMMnZ9Ksnv4FrPRrilQQEbR9A14Ook+b6+2mIoLrg6hx5EoM
         DsKNnJPO5tyliwmAb9qhcJXsaGJP32zoE6ZHJN3+oOorXdeqn8e+3HjOC/amZKKoZ+Xv
         kHAg==
X-Forwarded-Encrypted: i=1; AJvYcCWAKW2Sva0W61mWoRo9TuAvl0f99UwAq0PSxdJLQc3x1WKCCLD5eWMydazvcHSyX/cSOYST2S9PnSNZhl1QENOd@lists.infradead.org
X-Gm-Message-State: AOJu0YysilquPlIVCVlwGru9xk+hyaN6zrWOAVSCN6hpFdKLwhY7j8cs
	dxBNBamzM7yWIl/lP+X7XDyI5zEBbO9dPvFTrzjSmBNRMEK/dKrCIeFIkplC1nmjXS8=
X-Gm-Gg: ASbGncuFANqHy8Jml1Hg+PspSGw1XrxDJM9DMvkmc9RwLktJxqjHLFIFN0+oAbkVUvh
	w7eUn2IQc19CU57SfmiFTLqjcH2kHnwMRXNYdvxOEL4uGohCLUzZyQD4lDk5d9iJElyZXeTYxjs
	9a7hSTE2cqYvtihNelN7w/ymqxyf3kZiihF4PI5vvjIzsiD7tvJ/h9TjMhKPyl7AypO9Db/suDk
	KUEh5EDu41HQzGOdMTEAlSORRjwRKuAiT0CSmb1FDnCYroohKubGEnv2vCPNQJNqSM+GkNx7BHB
	qgXSDhiluOfQvDFqvpTOJw27qbHuHY+oHYnMgZK4j7rdP/jKMOaDwvsTmhLi8xZLXDizDN7KfSp
	f0RBAFicPCWw7UGIx5AtCOYdIoR8M/zJyUjYh7KfeNNJ26WeSLpEFUBLgJzfqkWzY364T9ikf34
	xal+wXvZprDg==
X-Google-Smtp-Source: AGHT+IHU1kUQ/j+2c0DWldc7DeJQPageEV0i7vez8IloaeUnW6bD/qTCz4m2QvWTUpZaGhquDY3CAg==
X-Received: by 2002:a05:600c:6385:b0:458:a7fa:211d with SMTP id 5b1f17b1804b1-47117912365mr156602265e9.29.1761134260710;
        Wed, 22 Oct 2025 04:57:40 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:bdae:f4f4:58be:ea26])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-475c42d9524sm39570535e9.18.2025.10.22.04.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 04:57:40 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Kevin Hilman
 <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  chuan.liu@amlogic.com,
  linux-amlogic@lists.infradead.org,  linux-clk@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] clk: amlogic: Fix out-of-range PLL frequency setting
In-Reply-To: <20251022-optimize_pll_driver-v1-1-a275722fb6f4@amlogic.com>
	(Chuan Liu via's message of "Wed, 22 Oct 2025 14:58:51 +0800")
References: <20251022-optimize_pll_driver-v1-0-a275722fb6f4@amlogic.com>
	<20251022-optimize_pll_driver-v1-1-a275722fb6f4@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Wed, 22 Oct 2025 13:57:39 +0200
Message-ID: <1j8qh34098.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_045743_460549_49ABFB54 
X-CRM114-Status: GOOD (  17.86  )
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

On Wed 22 Oct 2025 at 14:58, Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org> wrote:

> From: Chuan Liu <chuan.liu@amlogic.com>
>
> meson_clk_get_pll_range_index incorrectly determines the maximum value
> of 'm'.

This explanation is little light !

How did the problem show up ? Under which condition ? How did you come
this conclusion ?

Other people having problems might benefit from the explanation 

>
> Fixes: 8eed1db1adec6 ("clk: meson: pll: update driver for the g12a")
> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
> ---
>  drivers/clk/meson/clk-pll.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
> index 1ea6579a760f..b07e1eb19d12 100644
> --- a/drivers/clk/meson/clk-pll.c
> +++ b/drivers/clk/meson/clk-pll.c
> @@ -191,7 +191,7 @@ static int meson_clk_get_pll_range_index(unsigned long rate,
>  	*m = meson_clk_get_pll_range_m(rate, parent_rate, *n, pll);
>  
>  	/* the pre-divider gives a multiplier too big - stop */
> -	if (*m >= (1 << pll->m.width))
> +	if (*m > pll->range->max)

Making sure m does not exceed the maximum value is valid too.
You should check both conditions then

>  		return -EINVAL;
>  
>  	return 0;

-- 
Jerome

