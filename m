Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3287BD4A601
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 05:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Ou8UbN6MA8aa9PohxFjXjHl2o1hgRY+j3Nex/NlwNQ=; b=Ei9Xsm3eChJXGVRivQQ3m1qOiT
	ZIUA7oLSoaGFXI1sTDuJ4Lb/gDKfV88Ub/fCNqCAYkua4IMnEhxPZChqHHj3IkQMVAe6lpjwDtSza
	zCH1w2w73pecwQRJzNOXZy1HniiFFVo1x3GOvxdeHzkK3DU4CmLHf5IFgC/DBTYoreiu8VX3dlk0k
	XSieQKi+WEjG/ZVp6HjQpL/j6bLJmNKUYF4DVvVaP3v1BYDi1ejNeHwHuZZLup7HVAq5N5fue1Ztj
	l+JoYjOkU3p+u/FFX9k9q0clz0M7aqwFdocH7lFy+YwevyBbdScDTrATByHv0lT3REVTaCe7Iqy/W
	1cog7EBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgcMO-0000000DcXc-3RtR;
	Fri, 16 Jan 2026 05:27:00 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgcMN-0000000DcXN-0kVg;
	Fri, 16 Jan 2026 05:26:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 46A8E60160;
	Fri, 16 Jan 2026 05:26:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B2A5C116C6;
	Fri, 16 Jan 2026 05:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768541218;
	bh=KDD9LxmJRHtrpl4VNF+880PssLKwfgCxp0mN1CcY6wA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rqw+51JhjpG929Td0Frsqh6EMXOumrvzrJvrp8TtJtgUx8xdBSMuiwVK3cm4KKoK3
	 zMKvRkfs4YhUH0/FYiFJIwA53dx1fuEhk23tVLRBdYcvvIiilH2wd5DlaSfoAej/7t
	 M/GejA93ZuMtZmdlVWX/e7bBqEu6ltVeEROP40ca+2YMvZhVf6VIwKzBrPsK/N9Uxd
	 tm8aOAIA6kZ5DyokgexHFt2uO61w3qxo2Cs5bIiPUdT9vUcouu8zxStt/O7CRymSVw
	 NH3iUPlNu+2XQQn7ixNoCJwm5nOq+1Wu5JEjVMqtxd523mVHJkzsLruoK9hp0yp0QH
	 qy5chpkJejPPg==
Date: Fri, 16 Jan 2026 10:56:46 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>, linux-arm-kernel@lists.infradead.org, 
	linux-actions@lists.infradead.org
Subject: Re: [PATCH 05/27] clk: actions: owl-divider: convert from
 divider_round_rate() to divider_determine_rate()
Message-ID: <3z4t6h7nwq5ssnhstsnemtnr5xqowgvj4ni52jbcw6uzpbdgnh@i7vnahtfvzch>
References: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
 <20260108-clk-divider-round-rate-v1-5-535a3ed73bf3@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260108-clk-divider-round-rate-v1-5-535a3ed73bf3@redhat.com>
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

On Thu, Jan 08, 2026 at 04:16:23PM -0500, Brian Masney wrote:
> The divider_round_rate() function is now deprecated, so let's migrate
> to divider_determine_rate() instead so that this deprecated API can be
> removed. Additionally, owl_divider_helper_round_rate() is no longer used,
> so let's drop that from the header file as well.
> 
> Note that when the main function itself was migrated to use
> determine_rate, this was mistakenly converted to:
> 
>     req->rate = divider_round_rate(...)
> 
> This is invalid in the case when an error occurs since it can set the
> rate to a negative value.
> 
> Fixes: 1b04e12a8bcc ("clk: actions: owl-divider: convert from round_rate() to determine_rate()")
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Acked-by: Manivannan Sadhasivam <mani@kernel.org>

- Mani

> 
> ---
> To: "Andreas Färber" <afaerber@suse.de>
> To: Manivannan Sadhasivam <mani@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-actions@lists.infradead.org
> ---
>  drivers/clk/actions/owl-divider.c | 17 ++---------------
>  drivers/clk/actions/owl-divider.h |  5 -----
>  2 files changed, 2 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/clk/actions/owl-divider.c b/drivers/clk/actions/owl-divider.c
> index 118f1393c6780f287d26736b2547a8b43751655a..316ace80e87e3b1c22a4011e725644cf37668e5e 100644
> --- a/drivers/clk/actions/owl-divider.c
> +++ b/drivers/clk/actions/owl-divider.c
> @@ -13,26 +13,13 @@
>  
>  #include "owl-divider.h"
>  
> -long owl_divider_helper_round_rate(struct owl_clk_common *common,
> -				const struct owl_divider_hw *div_hw,
> -				unsigned long rate,
> -				unsigned long *parent_rate)
> -{
> -	return divider_round_rate(&common->hw, rate, parent_rate,
> -				  div_hw->table, div_hw->width,
> -				  div_hw->div_flags);
> -}
> -
>  static int owl_divider_determine_rate(struct clk_hw *hw,
>  				      struct clk_rate_request *req)
>  {
>  	struct owl_divider *div = hw_to_owl_divider(hw);
>  
> -	req->rate = owl_divider_helper_round_rate(&div->common, &div->div_hw,
> -						  req->rate,
> -						  &req->best_parent_rate);
> -
> -	return 0;
> +	return divider_determine_rate(hw, req, div->div_hw.table,
> +				      div->div_hw.width, div->div_hw.div_flags);
>  }
>  
>  unsigned long owl_divider_helper_recalc_rate(struct owl_clk_common *common,
> diff --git a/drivers/clk/actions/owl-divider.h b/drivers/clk/actions/owl-divider.h
> index d76f58782c52885a66c96e8bf13b0dea3ba51efd..1d3bb4e5898a3ccf729894533ae194ac4c34b6e3 100644
> --- a/drivers/clk/actions/owl-divider.h
> +++ b/drivers/clk/actions/owl-divider.h
> @@ -56,11 +56,6 @@ static inline struct owl_divider *hw_to_owl_divider(struct clk_hw *hw)
>  	return container_of(common, struct owl_divider, common);
>  }
>  
> -long owl_divider_helper_round_rate(struct owl_clk_common *common,
> -				const struct owl_divider_hw *div_hw,
> -				unsigned long rate,
> -				unsigned long *parent_rate);
> -
>  unsigned long owl_divider_helper_recalc_rate(struct owl_clk_common *common,
>  					 const struct owl_divider_hw *div_hw,
>  					 unsigned long parent_rate);
> 
> -- 
> 2.52.0
> 

-- 
மணிவண்ணன் சதாசிவம்

