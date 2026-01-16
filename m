Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B07FD4A601
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 05:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WsjmALyVMv/lKjecnKPSAiMGdSWagGmEUInMn+OdPk0=; b=YwrNbki8V7yepH4Q9JE/hwNZuw
	Af7xWL+v7VXvOosr/efIyfwbVHerfIeuZ5UDvsjab/AeVC7ambSQFqpPYYWzFMIy6QlnbagYE9pn2
	kodydbnCuV89H86csMo/aBhcWMEXI0IIa0BTWl11CdDmXP0ciPDvTAYcO50+iRCpWRbP9/O3k5SZv
	Mvu11vvxxRBbZxfZoqAkgpEYNhsvxUwQFxqoDofOCvx4WkF5bCJz6FLWSTR2I24O0SnW48hJ1lfxV
	wSfCxEPyoNJ0QPs50UeLdgLLbLtvj1e5LeKzk/1F2wcvAoNDOyCgx1tHhPr+USsoMrd1UulT5gueD
	uwLvVj3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgcJW-0000000DcK7-3CrR;
	Fri, 16 Jan 2026 05:24:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgcJV-0000000DcK1-2Pyb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 05:24:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A36B560160;
	Fri, 16 Jan 2026 05:24:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34B19C116C6;
	Fri, 16 Jan 2026 05:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768541040;
	bh=BQu3mpLQG6eHjs8ydYktrN0gAodUMDTO76Ji6LqLCD4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G6z0ZKUmK2HQkrIu5eLrl4KEqF3mVgSTqyeR2lhV8gVZm4hh8I/7Xfy5qy2rbzvkG
	 OizGRaU4TBYdUERLOrKUP0XeCDQ0LfRmxOTMxvDnsZlkMCWll5SDRkXUKEBGTtpIvs
	 e0/sKTc+teBN9yDHETda+8U40mZXeFsL7HP92GchywAp1doYYd+fkOzgqANWUYlcKU
	 nn0nCHKVk1gEh9SBrppajDOfJX+IDXx//RDL7bFuXgpVo6uwmWXYm2UaH6qV//uGji
	 PlKJLmU+WBMoqsb07Eo0zyusNpuiKzl9ysr5syjbpgvI/LiLjks0Nz2Dzz3Kndg1YK
	 Tn1YuL6HqnUnQ==
Date: Fri, 16 Jan 2026 10:53:49 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 06/27] clk: bm1880: convert from divider_ro_round_rate()
 to divider_ro_determine_rate()
Message-ID: <qwefkxof64ndorzghf6itii532ntbafzpqxvpn5lb5eolwikho@s7zenouizofa>
References: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
 <20260108-clk-divider-round-rate-v1-6-535a3ed73bf3@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260108-clk-divider-round-rate-v1-6-535a3ed73bf3@redhat.com>
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

On Thu, Jan 08, 2026 at 04:16:24PM -0500, Brian Masney wrote:
> The divider_ro_round_rate() function is now deprecated, so let's migrate
> to divider_ro_determine_rate() instead so that this deprecated API can
> be removed.
> 
> Note that when the main function itself was migrated to use
> determine_rate, this was mistakenly converted to:
> 
>     req->rate = divider_round_rate(...)
> 
> This is invalid in the case when an error occurs since it can set the
> rate to a negative value.
> 
> Fixes: cf1d95fa0c64 ("clk: bm1880: convert from divider_round_rate() to divider_determine_rate()")
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Acked-by: Manivannan Sadhasivam <mani@kernel.org>

- Mani

> 
> ---
> To: Manivannan Sadhasivam <mani@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org
> ---
>  drivers/clk/clk-bm1880.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/clk/clk-bm1880.c b/drivers/clk/clk-bm1880.c
> index dac190bc6e19a6dd4be413ea52d41f74934a1aa9..536df8e828eab83fbd3812135139c703aa7a1ce3 100644
> --- a/drivers/clk/clk-bm1880.c
> +++ b/drivers/clk/clk-bm1880.c
> @@ -621,12 +621,8 @@ static int bm1880_clk_div_determine_rate(struct clk_hw *hw,
>  		val = readl(reg_addr) >> div->shift;
>  		val &= clk_div_mask(div->width);
>  
> -		req->rate = divider_ro_round_rate(hw, req->rate,
> -						  &req->best_parent_rate,
> -						  div->table,
> -						  div->width, div->flags, val);
> -
> -		return 0;
> +		return divider_ro_determine_rate(hw, req, div->table,
> +						 div->width, div->flags, val);
>  	}
>  
>  	req->rate = divider_round_rate(hw, req->rate, &req->best_parent_rate,
> 
> -- 
> 2.52.0
> 

-- 
மணிவண்ணன் சதாசிவம்

