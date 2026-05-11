Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6772DCD37B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 16:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WwCAGmH0U4Nhy4j6grH3+nSMTDhiVfCng6CUAeJVa7Q=; b=mpisHWboBCyveFPOjQrCH8crDd
	OmupPeMGvmzDmVGlKZbcb5nQwjh41QplgP72onwRr1+BIFUG3UsfaYg+p5QRT2zUetm/griWgAOzQ
	PVOJcjFS7h9ej6gVNMqRds3oXxLzIDPcpd2FLDMCVGi2PlbEand3MzMzoobPY5MviadgFxA/l7j7S
	sqYScyhuGkR2RECUIl8wLJxl5VPKbvIV7C4w/cCr4+UCSZO3x3wdRZDcYWW0NX/isUKGacWc9cOoE
	v/hhsOiq7gyO4g1Y5UrlFejL2ca1OB02AYecgekGEUZ7F596ijb/ciWjniqRWB+7EtiavLPVKuTyB
	D6HdHHzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMT9b-0000000E9Ew-1K4V;
	Mon, 11 May 2026 16:06:47 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMT9U-0000000E9DX-1ysL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 16:06:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778515599;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WwCAGmH0U4Nhy4j6grH3+nSMTDhiVfCng6CUAeJVa7Q=;
	b=F0+1//NOn5BqXDVeiWvW0k/oynQBeRtkhTEUu9ZRT5RtqqXSqHJUSQfThsYejU2w2mGT/3
	zl+qfQ8/DZpdu3z7FnM5gQFNWKG1XiwhXLX20Lzi6M/F13xbtnMZJR0SdHEFlChcAWqVnH
	TCxDeqYqu4wUTM9k3z1aRCtAWA8ke3I=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-592-xGjCZIleNbOxshkbvCv2hA-1; Mon, 11 May 2026 12:06:37 -0400
X-MC-Unique: xGjCZIleNbOxshkbvCv2hA-1
X-Mimecast-MFC-AGG-ID: xGjCZIleNbOxshkbvCv2hA_1778515597
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8bc140520c7so78906196d6.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 09:06:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778515597; x=1779120397;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WwCAGmH0U4Nhy4j6grH3+nSMTDhiVfCng6CUAeJVa7Q=;
        b=pXnD5CzAm4Z3UTtBT8YIez84q1LQQEc4rBjtTw3f9niGHOAntk8N06ez62KlUOE8ik
         ETiKPqKzt0NoavqzZZANl7r4QWxU/evk6jtkA0NdJ4j3g3k1fa00jtAZzhMvT7rr12gc
         5nDdn+bfZlHhae2Qn1GYI2mMjkidNXwniz9/kT/d/vrnCb7nzYgo/pH8J2k3ZBgAwHIg
         Cz+PNxQUG59aXwuf0RPM7undtVjA2DuZnYVgGzrz8A2Sln3Bqa+uwghrXwJO4jVtS+PE
         i53P82MTnwa02goEX58BlOIzmr+rw1Nu7vH37YFEL4AiOKkDk8PX0+Xr8FrF36gWVzgZ
         dcvg==
X-Forwarded-Encrypted: i=1; AFNElJ+aCKjMLryWAfhryJ/MIoi39SB6VDUdoTUimH5xfWz6SD0VehBe3HHMZPHvdWHSj0G3FaherVjdB+NGAAMgHOeO@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1BRGsJHSGG6X/p7kpKIuOhcplzFgbiZd0iJzaQN8ejcq4Q7WB
	SBn1TcOi04NJYRH5vvdFiwCYYv6brKX5v0ysl6OOWYDG8SJdUD/bogK8gNsCZwpnVoBXjWcMrBI
	jYKSuk+kxHbWBcwKXjzpbIOlHRWdcQwshHbH4GGdNqRWCBpkIdMKSAO/ig6EkhKaL+z1Md2eGl1
	9+
X-Gm-Gg: Acq92OHDruKfqqkvj7BJ+BhYuswdHPxiGCCH1u7r+Xg/Icc+hMW9u+mLsSxKZSKl+vi
	c+EdI5OAzPerH4ucO23Q7i7aLwX0W4SgiQ3O5JM4cIdz3KTUHS68fF/q+uy5YXcIRJC7JpH2FDj
	94CBO79+EzyaQcNFsbRp4baJOE9k9D+Vnx9lbCWYomAeTwXxq1jbCn6SiuXIclqahcNObp28gSp
	eu674b7v+H/GeZ6KuyPSpqU/77xZQLoL6QwZTZK/Gq26ho9MoeJqfYsfItIjEyno5ZJ6fOOZ1Wt
	tsYZ+8ko8p4k2LqOK+y+Yy/bki4bgCJOj47vP9pBAyvrxWEx0qyVWiYCNBbXFlFKs47A7O17G30
	FFRfVn2/77S12rdpTlzwI0MwR9bYxwb4MPLk63502x3nT6PCsGKuMY2E5
X-Received: by 2002:a05:6214:468f:b0:8ae:6d63:3066 with SMTP id 6a1803df08f44-8c1af2eec23mr162718396d6.38.1778515597132;
        Mon, 11 May 2026 09:06:37 -0700 (PDT)
X-Received: by 2002:a05:6214:468f:b0:8ae:6d63:3066 with SMTP id 6a1803df08f44-8c1af2eec23mr162717886d6.38.1778515596574;
        Mon, 11 May 2026 09:06:36 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8bf88247a3csm93252456d6.11.2026.05.11.09.06.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 09:06:35 -0700 (PDT)
Date: Mon, 11 May 2026 12:06:34 -0400
From: Brian Masney <bmasney@redhat.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
	"moderated list:ARM/Rockchip SoC support" <linux-arm-kernel@lists.infradead.org>,
	"open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] clk: rockchip: Use flexible array for clock table
Message-ID: <agH-ivEdw12_3OJz@redhat.com>
References: <20260511032252.361906-1-rosenp@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260511032252.361906-1-rosenp@gmail.com>
User-Agent: Mutt/2.3.1 (2026-03-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5yVP3E3B5YcZLkmZT_5JgTCy55WM4bKEXP6HYKaa4vw_1778515597
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_090640_619510_0E7637CF 
X-CRM114-Status: GOOD (  21.83  )
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

Hi Rosen,

On Sun, May 10, 2026 at 08:22:52PM -0700, Rosen Penev wrote:
> Store the clock lookup table in the Rockchip clock provider
> allocation instead of allocating it separately.
> 
> This ties the table lifetime directly to the provider and removes a
> separate allocation failure path while preserving the clk_onecell_data
> lookup interface.
> 
> Assisted-by: Codex:GPT-5.5
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/clk/rockchip/clk.c | 17 ++++-------------
>  drivers/clk/rockchip/clk.h |  2 ++
>  2 files changed, 6 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/clk/rockchip/clk.c b/drivers/clk/rockchip/clk.c
> index ee8c79b938d3..dbb4b6f33abb 100644
> --- a/drivers/clk/rockchip/clk.c
> +++ b/drivers/clk/rockchip/clk.c
> @@ -359,26 +359,21 @@ static struct rockchip_clk_provider *rockchip_clk_init_base(
>  		unsigned long nr_clks, bool has_late_clocks)
>  {
>  	struct rockchip_clk_provider *ctx;
> -	struct clk **clk_table;
>  	struct clk *default_clk_val;
>  	int i;
>  
>  	default_clk_val = ERR_PTR(has_late_clocks ? -EPROBE_DEFER : -ENOENT);
>  
> -	ctx = kzalloc_obj(struct rockchip_clk_provider);
> +	ctx = kzalloc_flex(*ctx, clk_table, nr_clks);
>  	if (!ctx)
>  		return ERR_PTR(-ENOMEM);
>  
> -	clk_table = kzalloc_objs(struct clk *, nr_clks);
> -	if (!clk_table)
> -		goto err_free;
> -
>  	for (i = 0; i < nr_clks; ++i)
> -		clk_table[i] = default_clk_val;
> +		ctx->clk_table[i] = default_clk_val;
>  
> -	ctx->reg_base = base;
> -	ctx->clk_data.clks = clk_table;
>  	ctx->clk_data.clk_num = nr_clks;
> +	ctx->clk_data.clks = ctx->clk_table;

Where's the __counted_by? Also struct clk_onecell_data is embedded
inside struct rockchip_clk_provider, and I'm not sure offhand how
that'll work.

Brian


> +	ctx->reg_base = base;
>  	ctx->cru_node = np;
>  	spin_lock_init(&ctx->lock);
>  
> @@ -388,10 +383,6 @@ static struct rockchip_clk_provider *rockchip_clk_init_base(
>  						   "rockchip,grf");
>  
>  	return ctx;
> -
> -err_free:
> -	kfree(ctx);
> -	return ERR_PTR(-ENOMEM);
>  }
>  
>  struct rockchip_clk_provider *rockchip_clk_init(struct device_node *np,
> diff --git a/drivers/clk/rockchip/clk.h b/drivers/clk/rockchip/clk.h
> index 9e3503e2ffc2..d4033bf750f5 100644
> --- a/drivers/clk/rockchip/clk.h
> +++ b/drivers/clk/rockchip/clk.h
> @@ -604,6 +604,7 @@ struct rockchip_aux_grf {
>   * @grf: regmap of the general-register-files syscon
>   * @aux_grf_table: hashtable of auxiliary GRF regmaps, indexed by grf_type
>   * @lock: maintains exclusion between callbacks for a given clock-provider.
> + * @clk_table: clock lookup table.
>   */
>  struct rockchip_clk_provider {
>  	void __iomem *reg_base;
> @@ -612,6 +613,7 @@ struct rockchip_clk_provider {
>  	struct regmap *grf;
>  	DECLARE_HASHTABLE(aux_grf_table, GRF_HASH_ORDER);
>  	spinlock_t lock;
> +	struct clk *clk_table[];
>  };
>  
>  struct rockchip_pll_rate_table {
> -- 
> 2.54.0
> 


