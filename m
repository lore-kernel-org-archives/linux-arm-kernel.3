Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8832DD4A601
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 05:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7bVtyUh3LeKwr1bX34VoBwIaRzHaQl6/w9wImz6r8kc=; b=XsdhqKbJfkAJq4rBE6oTNquXem
	21q8kw5B2qf4riyG/r7lLo6JAP6zRzGZ6dE7924OJaO6F6iqYRehIc82uRZX8Xkap4oPAMFlXjyYy
	/jdgkHfB8hUK/etyNREEboSksI3CDaPhDztTxH/JaHCctP2+T3S0sDb66x1C4n+cL59CCCHoZpP9j
	dUawWjEMqg25uLButKGRM04CWobXSvu1g5+65t+cz6qFJ/TqHKoUa0auSZcfmYulUM865oZkER3Yx
	x9b8P0pM/O5DWli/xaLAyVfQii5equdJmxTBSmeC2znsss+wBV/mzFSGbpBCWNCIybFStaOJApOvE
	BJQPLoSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgcN0-0000000Dcbs-1aj5;
	Fri, 16 Jan 2026 05:27:38 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgcMy-0000000DcbV-1sOT;
	Fri, 16 Jan 2026 05:27:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C87E660160;
	Fri, 16 Jan 2026 05:27:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8DC0C116C6;
	Fri, 16 Jan 2026 05:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768541255;
	bh=DTf0sFPARXBUzVNF830ArBxXls9z63UypUbrXvLzkQs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XnLEXDt+LR4q7hSpdBzokWnEHw6mWMVj4qBBhoz/yoNkF9UbuPREatcMZVCURJA6o
	 LiJx6Zq83fPhMJUHPSdZuO3wmYLF780EN3BJendmfPACeSSHPQaKlxYXktohZb4MG+
	 qU7y0is5WmOmoQ0hnP7z6+giDqEmuiw133LQpgA4zR4lB8M5Fbyck7D1NcTw4f5Y8R
	 SXJyuPEhON8ixbTxQrLpmSCaNCP48zxkvLMyz/ijM2X+3u1DjJI7tt7wAYQiu8aL6M
	 9F6QxB24alXuVmZ6giRc9A4vdL9lUKXbmZ0M5bleDcv7oMI+zXn0Un+NWle71ECkUy
	 dhPbqVPvVey0g==
Date: Fri, 16 Jan 2026 10:57:24 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>, linux-arm-kernel@lists.infradead.org, 
	linux-actions@lists.infradead.org
Subject: Re: [PATCH 04/27] clk: actions: owl-composite: convert from
 owl_divider_helper_round_rate() to divider_determine_rate()
Message-ID: <gn56qksoznzuexepv27wfn44xyow3nqzsy7gv7jjvty2orfmga@53xsfbu2guy4>
References: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
 <20260108-clk-divider-round-rate-v1-4-535a3ed73bf3@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260108-clk-divider-round-rate-v1-4-535a3ed73bf3@redhat.com>
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

On Thu, Jan 08, 2026 at 04:16:22PM -0500, Brian Masney wrote:
> owl_divider_helper_round_rate() is just a wrapper for
> divider_round_rate(), which is deprecated. Let's migrate to
> divider_determine_rate() instead so that this deprecated API can be
> removed.
> 
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
>  drivers/clk/actions/owl-composite.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/clk/actions/owl-composite.c b/drivers/clk/actions/owl-composite.c
> index 00b74f8bc4375a8f42e9b54c7bf1affe91e1074a..9540444307d6c960af200ec13e7c60abd47ffc85 100644
> --- a/drivers/clk/actions/owl-composite.c
> +++ b/drivers/clk/actions/owl-composite.c
> @@ -57,15 +57,10 @@ static int owl_comp_div_determine_rate(struct clk_hw *hw,
>  				       struct clk_rate_request *req)
>  {
>  	struct owl_composite *comp = hw_to_owl_comp(hw);
> -	long rate;
> -
> -	rate = owl_divider_helper_round_rate(&comp->common, &comp->rate.div_hw,
> -					     req->rate, &req->best_parent_rate);
> -	if (rate < 0)
> -		return rate;
> +	struct owl_divider_hw *div = &comp->rate.div_hw;
>  
> -	req->rate = rate;
> -	return 0;
> +	return divider_determine_rate(&comp->common.hw, req, div->table,
> +				      div->width, div->div_flags);
>  }
>  
>  static unsigned long owl_comp_div_recalc_rate(struct clk_hw *hw,
> 
> -- 
> 2.52.0
> 

-- 
மணிவண்ணன் சதாசிவம்

