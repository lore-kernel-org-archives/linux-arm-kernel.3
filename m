Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9ADFD637C4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 22:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FIbyt9qLC8/HyO6WLPAMcUq4aovgCC1Aa6OugdYE5bQ=; b=pNZMtG3g+oowPtG8thbfC1hb9m
	+58G+M4B3nnv4AZ2X8Lunop8DcOFpjI6gRWohM/q+2kwNacwQ+JO1jy6xDSYKkuPstDMM+r6xXILc
	pPFOAM/zSTxb8ov5rG9DpFSH6xkuq0m9P8FkREcfVeAPD7HbwKOgFzuS2N0zmRBgdka9SF5T4C301
	jKo9T6fgC7Rv/FGAn5HijrMluAz+YQYm3YiouuzZmENMIa7spvmYTa9TfGR2bIbscGmzioDoSWagb
	wluKbRJr3LD4ztnfCJSwI59RTYfCxI+p4m/7cZVzGmJSKcw3+8351/18UAwpXL1/z/yDrhawUQwTO
	5DHDzofw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBLof-00000008AXB-47UJ;
	Wed, 13 Nov 2024 22:26:26 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBLmm-00000008A9m-1kHW;
	Wed, 13 Nov 2024 22:24:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 596ADA41851;
	Wed, 13 Nov 2024 22:22:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13819C4CEC3;
	Wed, 13 Nov 2024 22:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731536666;
	bh=4c3JsyMgE4ipwm0tWTQ4ryrY2cLMm2Jke0JitnwChlc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gw7hWGFtNcNPvDPPYAKVNRQO8c6IuR/deLvbCnzf975LnqSsBaJgBF7i65Q036CMH
	 oZ2Tdz91mcp6yTMYpuw13NNiG/rKcOPA2erZNek99eIUp0DdlTvCuiHBg7MiwFjYTd
	 83/PyQGQ1mCPxqvv4y1JLZrR8anHxfsjibxb919/s76mWeZbs0Ko+2k0qveEyMkmAd
	 xLJfXscazyiglCmJTfSeWlMPfKqE6kyiw9rzA5NjiaioPcPoaIVG6dSHfD9G9dpZT/
	 AfW9jUtSixI0jVPCLQ7wJ9AYu4owmI5RWS1dFaquAJD+PSXh3A5hm/0u/pfRXl4Dby
	 AQJEVQpukwO6w==
Date: Wed, 13 Nov 2024 23:24:21 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Jiasheng Jiang <jiashengjiangcool@gmail.com>
Cc: dianders@chromium.org, rmk@dyn-67.arm.linux.org.uk, 
	max.schwarz@online.de, david.wu@rock-chips.com, heiko@sntech.de, vz@mleia.com, 
	wsa@kernel.org, manabian@gmail.com, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] i2c: rk3x: Add check for clk_enable()
Message-ID: <zd5673eo7kqwg67lsy6h3m4zdpmgp5xzhr355ialwx6zhdopfb@7x3v5b747sqn>
References: <20241107211428.32273-1-jiashengjiangcool@gmail.com>
 <20241107211428.32273-3-jiashengjiangcool@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241107211428.32273-3-jiashengjiangcool@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_142428_568814_A6D3A827 
X-CRM114-Status: GOOD (  14.97  )
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

Hi Jiasheng,

On Thu, Nov 07, 2024 at 09:14:28PM +0000, Jiasheng Jiang wrote:
> Add check for the return value of clk_enable() in order to catch the
> potential exception. Moreover, convert the return type of

It's more an "unlikely exception" rather than a "potential
exeption".

> rk3x_i2c_adapt_div() into int and add the check.

...

>  static u32 rk3x_i2c_func(struct i2c_adapter *adap)
> @@ -1365,9 +1389,12 @@ static int rk3x_i2c_probe(struct platform_device *pdev)
>  	}
>  
>  	clk_rate = clk_get_rate(i2c->clk);
> -	rk3x_i2c_adapt_div(i2c, clk_rate);
> +	ret = rk3x_i2c_adapt_div(i2c, clk_rate);
>  	clk_disable(i2c->clk);

you can't disable a clock that has failed to enable, right?

BTW, although I like this patch (or at least I don't dislike), I
still want to check whether it's wanted or not.

Andi

>  
> +	if (ret)
> +		goto err_clk_notifier;
> +
>  	ret = i2c_add_adapter(&i2c->adap);
>  	if (ret < 0)
>  		goto err_clk_notifier;
> -- 
> 2.25.1
> 

