Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 878E5C87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 21:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NWDHZJrVWOBu48yVTIxq5bN4KAAfsVdHWzf5NjnxC7c=; b=MdrcXDcBWM3EZPejWY7YszoQvF
	vs741ACQNpdoV2707pglYUns3Co//E7yXf3SA4M3T/VfDoEBSd+YnabqbDJuam3Krl4so/zEJT7va
	F5qWNbIU+/TknOCjtRmVwJ50Zdctpflx01QrmEBjQ9sg3zAKrsb6JsAA7aGjlzX7hrGAODETixVt4
	Red0d9k3upgMoECJI2ajd9VsIALWU5WK0ji3oDQv8/EtQbl/LRkJEjeT4ql2H0U/RFWMCR3903XEC
	s2glhmYxYXaXMM/OthaXt9akpr3sOHrusU3nb8QtOOj5zBmVwiAoPQZT707V4PPD+Hns0A8HjY92D
	hQDzh1DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujOnO-0000000Dn85-21Qt;
	Tue, 05 Aug 2025 21:02:06 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujOkn-0000000Dmx7-0Rlg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 20:59:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=NWDHZJrVWOBu48yVTIxq5bN4KAAfsVdHWzf5NjnxC7c=; b=4I88P4kotaghdXCFOSfBkDGC4o
	sFk7rBF3W7vefj3i0SNWceKobbrdFPCKJTu/qjhMpVIKEay54XbYVhw36DjvMzcbQXud9S/1azxVe
	DKiXLr4lfR3hUd95y8E2leibqEeB+DIWUzcOBwhsW++6DVWlfhakmsiW/XhrQgM65Tsw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1ujOkZ-003pEJ-6T; Tue, 05 Aug 2025 22:59:11 +0200
Date: Tue, 5 Aug 2025 22:59:11 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michal Simek <michal.simek@amd.com>,
	Leon Romanovsky <leon@kernel.org>,
	Suraj Gupta <suraj.gupta2@amd.com>
Subject: Re: [PATCH net-next v4 1/7] net: axienet: Fix resource release
 ordering
Message-ID: <9572f798-d294-4f24-8acb-c7972c1db247@lunn.ch>
References: <20250805153456.1313661-1-sean.anderson@linux.dev>
 <20250805153456.1313661-2-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250805153456.1313661-2-sean.anderson@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_135925_164634_456AC5F8 
X-CRM114-Status: UNSURE (   9.87  )
X-CRM114-Notice: Please train this message.
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

> +static void axienet_disable_misc(void *clocks)
> +{
> +	clk_bulk_disable_unprepare(XAE_NUM_MISC_CLOCKS, clocks);
> +}
> +

...

>  	ret = devm_clk_bulk_get_optional(&pdev->dev, XAE_NUM_MISC_CLOCKS, lp->misc_clks);
>  	if (ret)
> -		goto cleanup_clk;
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "could not get misc. clocks\n");
>  
>  	ret = clk_bulk_prepare_enable(XAE_NUM_MISC_CLOCKS, lp->misc_clks);
>  	if (ret)
> -		goto cleanup_clk;
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "could not enable misc. clocks\n");
> +
> +	ret = devm_add_action_or_reset(&pdev->dev, axienet_disable_misc,
> +				       lp->misc_clks);

It seems like it would be better to add
devm_clk_bulk_get_optional_enable(). There is already an
devm_clk_bulk_get_all_enabled() so it does not seem like too big a
step.

	Andrew

