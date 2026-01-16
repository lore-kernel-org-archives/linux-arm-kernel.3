Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A815D4A601
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 05:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uEKorl75fY+RGdY7pfYH3x/1qsK+dVah+mvVBWkhxSs=; b=F7G3/Qq/vbwNYT3Jrg6AojnTyW
	PwLlhhwTEBMVaYs11JoZXa007xejZUq3oBXaDDHxhkTVD/WdB41BLSLuYNmqp7pXl78WmF4hdxATc
	TEsk4vu2VQFRzAfvUCSB7LC4NKUPbI0mZ6OmXRdbcEP7W4d3mXw1Z147oMtm+iLNf9fehN1K0XXl5
	5W0iGczFzgf9gdOYV6FHqb5WLsj6ctFB53GgHROgSta0FQpNDz/QsR0L0KcIS/Q+fcYkzo9wECGNO
	cdcTs/wDLgwxuYbjwMJ/0PglzqF9vNF0zi1sxGkKYfztdD3aqeoP9/k6fIBzY+M2ozxhbA1oJ4jYq
	iVoYc60A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgcKF-0000000DcNj-0Vnk;
	Fri, 16 Jan 2026 05:24:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgcKD-0000000DcNV-1f5u
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 05:24:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D27FE6016B;
	Fri, 16 Jan 2026 05:24:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72B9EC116C6;
	Fri, 16 Jan 2026 05:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768541084;
	bh=NwY3QX/TS1dlEYZQJV31aR1WN3dHki8xFOUrGHfMi6A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=loCaNHboE8fDkZPiXWADlD0VM0xF9KyhTmq4U9vDE2o64pjkC7hsuxg+evz4rh8q4
	 F62lfwwMCgyWclcTyhgYoYJyYA/aL6hDKdsqmuvdBZewGAcayBwv8iEybcRTVPKnXx
	 4eKimeqoN6vmem+bRqSwq3ZT1uOIAedQc7SyQY1oPqPfbkI3T87j24FElfxKUWik95
	 HdNX5W5nVOPrTkrVDDfF2QHw98CGAUHOAXEVaErEX5Y5pEdwI+30qED8/vbmQrOm6D
	 QodD3KF2hGBbkG2+bg5Y8FmeN6TvZiK+Sw6s41hXylKuwboG5IrkHcgqTeZpkSs32p
	 WF8tST/Rl2taQ==
Date: Fri, 16 Jan 2026 10:54:33 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 07/27] clk: bm1880: convert from divider_round_rate() to
 divider_determine_rate()
Message-ID: <lst5lt4gkjzfj2ozajukmyaozw7xeees63v6omimkvbn7xzgcl@7omzhb45ddlr>
References: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
 <20260108-clk-divider-round-rate-v1-7-535a3ed73bf3@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260108-clk-divider-round-rate-v1-7-535a3ed73bf3@redhat.com>
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

On Thu, Jan 08, 2026 at 04:16:25PM -0500, Brian Masney wrote:
> The divider_round_rate() function is now deprecated, so let's migrate
> to divider_determine_rate() instead so that this deprecated API can be
> removed.
> 
> Note that when the main function itself was migrated to use
> determine_rate, this was mistakenly converted to:
> 
>     req->rate = divider_round_rate(...)
> 
> This is invalid in the case when an error occurs since it can set the
> rate to a negative value.
> 
> Fixes: 64613d7fb42f ("clk: bm1880: convert from round_rate() to determine_rate()")
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Acked-by: Manivannan Sadhasivam <mani@kernel.org>

- Mani

> 
> ---
> To: Manivannan Sadhasivam <mani@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org
> ---
>  drivers/clk/clk-bm1880.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/clk/clk-bm1880.c b/drivers/clk/clk-bm1880.c
> index 536df8e828eab83fbd3812135139c703aa7a1ce3..1bdceb36fa87e8250c10a7fc0791379e1533bb38 100644
> --- a/drivers/clk/clk-bm1880.c
> +++ b/drivers/clk/clk-bm1880.c
> @@ -625,10 +625,7 @@ static int bm1880_clk_div_determine_rate(struct clk_hw *hw,
>  						 div->width, div->flags, val);
>  	}
>  
> -	req->rate = divider_round_rate(hw, req->rate, &req->best_parent_rate,
> -				       div->table, div->width, div->flags);
> -
> -	return 0;
> +	return divider_determine_rate(hw, req, div->table, div->width, div->flags);
>  }
>  
>  static int bm1880_clk_div_set_rate(struct clk_hw *hw, unsigned long rate,
> 
> -- 
> 2.52.0
> 

-- 
மணிவண்ணன் சதாசிவம்

