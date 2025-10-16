Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 045BFCCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 20:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/cKRiSBHedJeuF2YiPC1JdZMWW96N+8/8JV1od4hamE=; b=31GpOM9fsxCem0GthDRmsSJjtZ
	f8rZQiowOBZ/Bl6KBgkDZ4UJF0TQzALKj8odebY0hP+TevWUE4QYjXVWmAqTQhWuM9l0bVZHWsZ0m
	nWTuOlx8tpWCSOzJ/SgjmFfkGsKM0z2h5VtfSaHsvS9BII9iLiGjxqjBbTYSuTjF6S0aitWIdOr+R
	UhTLrUyxyJ2e/L4BJe/r4WMlMTba6ZfJ4X5GbJquRW1i9eiLY8KARA3nOmQLRL7WghNu0NJE4ZWET
	jGOoTOhdPAkhXKmV74/8ho6xL6Hu96UfUgFQy1U15zHPaS7PQId4QlXFt+nYrMoVtg2YoMEVrtvG8
	FQ8S+vrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Uxk-00000005vRo-1I4Q;
	Thu, 16 Oct 2025 20:52:40 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Uxg-00000005vQk-3HCw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 20:52:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760647955;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/cKRiSBHedJeuF2YiPC1JdZMWW96N+8/8JV1od4hamE=;
	b=LdSJQzpj6VonGYUkTxhD6cg7fx6ksYNMBWqfCoJxDsrxiYT3bMbnpvJKBGU6RMq5xMZTUM
	E5G4qHRdcNT+6dqMw+2O6QDXOnAtL1hxcFaZuHsI9Noy22zpKysZMbTQE1RjKGz3e8A35i
	hjddUnYxW0Up4Ihq3FrHbck0xWBRplY=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-173-lVNxijYeNp-8jrpBn7O1gw-1; Thu, 16 Oct 2025 16:52:34 -0400
X-MC-Unique: lVNxijYeNp-8jrpBn7O1gw-1
X-Mimecast-MFC-AGG-ID: lVNxijYeNp-8jrpBn7O1gw_1760647953
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8904a9e94ebso244694785a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Oct 2025 13:52:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760647953; x=1761252753;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/cKRiSBHedJeuF2YiPC1JdZMWW96N+8/8JV1od4hamE=;
        b=GFMKRLmwow/mTNUa/eJFPb7F0/4uEeqEtmj9NsbDfv/MnFxq8FeF0f3RpDwIblWeBs
         533lHWwwVcAx0wl40K0OyO+LHzdx9SdqIlH6ZBuVHnAmBJJ199tlHN9YtL/4VFI07WDu
         Y2vFISCTdAEwHo3kVU02zAcxJdZDvKtYvdhfWc3FFKKCuj+C9eijV0xqMbPxt3QojMRY
         VsNhvj/lGe88gJRiaDA2CXqRklJewvh5wpr8L0/IiHfpqPFgb5/I1idgQKam+6duTpJj
         5xUA+5L0WeHFqBDrOPaTP629mFQGNh3ATUBP0TjCS8OnBYwPsi5uHJMAkmIzmbEyVUCI
         LfEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGu8jF2AVjvL+8x28f8QiCFsyK7V0mjkyI48XB/8h6YK8wVZfnvMVOy0CvCBj9vlSDb+od/q6gg9YenYSeGrj1@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/cNRA6MmVeEiA9jbwtNyG/RD5aMDxr9LmaiMSo8NKfPQOw5yr
	7NBF1p3VX+HCCkJEWp/xfLp/Y73TDqOK5Te1eoo6iFLj/vqWDA6X1LwlfeVVEaCaJD6H4GiqoNG
	0IkAoCd1SpuX02TK0/7i5Xue0FHCNkLOsNOFkQmCjH9d6RKqymcgZjQ+ky0KtDzAi9SrgPcpFlx
	Bs
X-Gm-Gg: ASbGnctz2c1O+qI86m3GD9vS3NwEmU6PItzHOWoNPE3m+4bJsKDuoXdx20f7Nmlp3qA
	bp7PsgkfIBimHbriq5sIJW8YJLwGj41RYl2f6JGBG/wgteXMxrmFedG0txcx9eZ9s+gVO6c4i6W
	PCWx450u7VcOApEOnXreRvxJnZmjhyhqs07zHpxGUToC1gciiL4TMDAwOGEArfNTqe5gQdKMczg
	09FTd9KlHJST8tKfpb3P993FQiOArcZTZvu0/1oEz7SOTm7g9gEfn+SPGeMZ1ELYpdDeA8rm1oU
	kL9urBNtoVH2BUR4zx9vycIpg6CfWfvTx3GY8ExX04RYGc76cXLbq+AKrhfT/e4Yz9yaGyt8pNN
	zOe9F8upaSqhaBX+xEWbG8d63mzB7JOlp9t7rlidHcfmgWS90zU+EvB3hFM+5pIna/w==
X-Received: by 2002:ac8:598b:0:b0:4e7:1f00:2ce8 with SMTP id d75a77b69052e-4e89d281865mr19862021cf.18.1760647953512;
        Thu, 16 Oct 2025 13:52:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHATwA2Ecq5ayw4bx1RtADAqnB2jb/OZrDzGJ991Q3kxbxfK4bp4SH8V/S+x7MWZzR6YqvEcQ==
X-Received: by 2002:ac8:598b:0:b0:4e7:1f00:2ce8 with SMTP id d75a77b69052e-4e89d281865mr19861681cf.18.1760647953054;
        Thu, 16 Oct 2025 13:52:33 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87c0120cc36sm47970366d6.2.2025.10.16.13.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 13:52:32 -0700 (PDT)
Date: Thu, 16 Oct 2025 16:52:30 -0400
From: Brian Masney <bmasney@redhat.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	Laura Nao <laura.nao@collabora.com>,
	=?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>,
	Chia-I Wu <olvaffe@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>,
	kernel@collabora.com, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 1/5] clk: Respect CLK_OPS_PARENT_ENABLE during recalc
Message-ID: <aPFbDl_JKyDay1S5@redhat.com>
References: <20251010-mtk-pll-rpm-v3-0-fb1bd15d734a@collabora.com>
 <20251010-mtk-pll-rpm-v3-1-fb1bd15d734a@collabora.com>
MIME-Version: 1.0
In-Reply-To: <20251010-mtk-pll-rpm-v3-1-fb1bd15d734a@collabora.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8THtLOw827REIRWk5kvPeMQfa4TniZfSq9yu632c4q8_1760647953
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_135236_897407_E79C1B84 
X-CRM114-Status: GOOD (  22.11  )
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

Hi Nicolas,

On Fri, Oct 10, 2025 at 10:47:09PM +0200, Nicolas Frattaroli wrote:
> When CLK_OPS_PARENT_ENABLE was introduced, it guarded various clock
> operations, such as setting the rate or switching parents. However,
> another operation that can and often does touch actual hardware state is
> recalc_rate, which may also be affected by such a dependency.
> 
> Add parent enables/disables where the recalc_rate op is called directly.
> 
> Fixes: fc8726a2c021 ("clk: core: support clocks which requires parents enable (part 2)")
> Fixes: a4b3518d146f ("clk: core: support clocks which requires parents enable (part 1)")
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/clk/clk.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 85d2f2481acf360f0618a4a382fb51250e9c2fc4..1b0f9d567f48e003497afc98df0c0d2ad244eb90 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -1921,7 +1921,14 @@ static unsigned long clk_recalc(struct clk_core *core,
>  	unsigned long rate = parent_rate;
>  
>  	if (core->ops->recalc_rate && !clk_pm_runtime_get(core)) {
> +		if (core->flags & CLK_OPS_PARENT_ENABLE)
> +			clk_core_prepare_enable(core->parent);
> +
>  		rate = core->ops->recalc_rate(core->hw, parent_rate);
> +
> +		if (core->flags & CLK_OPS_PARENT_ENABLE)
> +			clk_core_disable_unprepare(core->parent);
> +
>  		clk_pm_runtime_put(core);
>  	}
>  	return rate;

clk_change_rate() has the following code:


        if (core->flags & CLK_OPS_PARENT_ENABLE)
                clk_core_prepare_enable(parent);

	...

        core->rate = clk_recalc(core, best_parent_rate);

	...

        if (core->flags & CLK_OPS_PARENT_ENABLE)
                clk_core_disable_unprepare(parent);

clk_change_rate() ultimately is called by various clk_set_rate
functions. Will that be a problem for the double calls to
clk_core_prepare_enable()?

Fanning this out to the edge further is going to make the code even
more complicated. What do you think about moving this to
clk_core_enable_lock()? I know the set_parent operation has a special
case that would need to be worked around.

Brian


