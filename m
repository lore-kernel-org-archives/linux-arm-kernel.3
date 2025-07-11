Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E0BFC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 09:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u8PRFvvft00MtlCnONcjj4pEZ2b2KyEKUMgdQwR1pHM=; b=Tzi/yxgP86QpxjodQeSS+katcI
	19Il5p+lswezTmUWipCp3jKOhawK7XdcVVeFwOzqtvbwHygzF+75GsA+6wr4ZvWL0SCzJGLeczftc
	IM/c2+6YHYdW5T9yWFQFwmO2MbnUFfyN/UxhVZd3hMInCQmxj7J6xobdRKj9HMubb25+cW0M9vHnM
	p0J8n7Xqe1a1M7alEPBJYnb7wD2DSneTEHB+w5o7w6LUYM3oaq19qJqC8GkrZlLMTCyE7smue7LxY
	1u96SNcO8umTJ5ZghA9UcLjgsWf2Z0qoC28QmM0vv4Wbmrxyydh3y1owHeQTJmZhyLYXA+zp1BOsO
	FQM6mqqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaAVm-0000000EOd1-0qPP;
	Fri, 11 Jul 2025 09:57:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua9Tu-0000000EDPk-3PcP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 08:51:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D699516F2;
	Fri, 11 Jul 2025 01:51:34 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9D9C93F6A8;
	Fri, 11 Jul 2025 01:51:42 -0700 (PDT)
Date: Fri, 11 Jul 2025 09:51:39 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Paul Walmsley <paul@pwsan.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Tony Lindgren <tony@atomide.com>,
	Russell King <linux@armlinux.org.uk>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org, linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] ARM: versatile: clock: convert from round_rate() to
 determine_rate()
Message-ID: <20250711-invaluable-enchanted-baboon-53fb4f@sudeepholla>
References: <20250710-arm32-clk-round-rate-v1-0-a9146b77aca9@redhat.com>
 <20250710-arm32-clk-round-rate-v1-3-a9146b77aca9@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250710-arm32-clk-round-rate-v1-3-a9146b77aca9@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_015146_892980_BD6811D8 
X-CRM114-Status: GOOD (  18.43  )
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

On Thu, Jul 10, 2025 at 07:42:18PM -0400, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
> 

Acked-by: Sudeep Holla <sudeep.holla@arm.com>

> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
>  arch/arm/mach-versatile/spc.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm/mach-versatile/spc.c b/arch/arm/mach-versatile/spc.c
> index 790092734cf6155daa63c44a1e5af00ecef30737..812db32448fcd415fa1a60f8bb971661369151e1 100644
> --- a/arch/arm/mach-versatile/spc.c
> +++ b/arch/arm/mach-versatile/spc.c
> @@ -497,12 +497,13 @@ static unsigned long spc_recalc_rate(struct clk_hw *hw,
>  	return freq * 1000;
>  }
>  
> -static long spc_round_rate(struct clk_hw *hw, unsigned long drate,
> -		unsigned long *parent_rate)
> +static int spc_determine_rate(struct clk_hw *hw, struct clk_rate_request *req)
>  {
>  	struct clk_spc *spc = to_clk_spc(hw);
>  
> -	return ve_spc_round_performance(spc->cluster, drate);
> +	req->rate = ve_spc_round_performance(spc->cluster, req->rate);
> +
> +	return 0;
>  }
>  
>  static int spc_set_rate(struct clk_hw *hw, unsigned long rate,
> @@ -515,7 +516,7 @@ static int spc_set_rate(struct clk_hw *hw, unsigned long rate,
>  
>  static struct clk_ops clk_spc_ops = {
>  	.recalc_rate = spc_recalc_rate,
> -	.round_rate = spc_round_rate,
> +	.determine_rate = spc_determine_rate,
>  	.set_rate = spc_set_rate,
>  };
>  
> 
> -- 
> 2.50.0
> 

-- 
Regards,
Sudeep

