Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15242D2B931
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 14:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5w3lqEU7gUm0F3BOVXz2/65o7sBdt+XmCCpMe1M+kps=; b=1h7rsRPnYabfrTLCzqnoRAKaxV
	6UCcHVckNBEh/lsz0+YES7kItERISvN9Oqybgg4xMFE23xdxwpRzMv+X/mEAKsO5rw7Ob/JV0nQOG
	v4FZn+H91of1q/nBf1/q75uSDfa0zrD1Gxxbfx7IBDeGlrcsWTkg+ynPlDMqB/ybX81Lr8NYbx436
	KYHAj44bcLhxJC+mNaEY14Q6zE4BllbmJFD1km1COo/FIXbWJss/cn8X7aQQXh3u/SyjAxdyDVQ+w
	lXTzQhBOImIjxJazQWc9jWPBsYowS3aI+jIzfgsF2KcEtKX2F5d0zF9ldv/rPVY2XPzBaqDWkugLE
	WUNvC7YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8Kbi-0000000HHSq-07L7;
	Tue, 05 Nov 2024 14:32:34 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8KIs-0000000HDns-0Mzy;
	Tue, 05 Nov 2024 14:13:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9B47BA432A0;
	Tue,  5 Nov 2024 14:11:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC80EC4CECF;
	Tue,  5 Nov 2024 14:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730815984;
	bh=o6Aw4cLXm/9l1y3eKvOCg9DO8JdisefQjjjqhLByyZI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=of0sFt/wAowGigdCPNv+Qea29vcJbSjXU1qgp5ubsj1sJS6/DQVQ+8QGa+TB1Pvcj
	 3KHR91v+HxumeQaBEK7eNhyAE/cEfVyZnKYq1uRRStbXwuprBPPeqvifajQoLfTYcb
	 wzFnE5jb/xi84kZQ4d8JziHC1yP9uv51JVP6dXhE8wF4lBr5CUnw/IF2XCCUyYfHXt
	 amKoZpY00RwnEyxZWIYoMlhl1iB22FCEufEBNZZsLdu4hU68Xax0WtDgROIhhUwhk4
	 HORpbbOBekQGbYrXFpPyneK8ZeFZFm/0fCkUXvAwH1GWTBsvlrLn2pS4MLwLToCslW
	 vKbz2bcZ0L43A==
Date: Tue, 5 Nov 2024 15:13:00 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Jiasheng Jiang <jiashengjiangcool@gmail.com>
Cc: rmk@dyn-67.arm.linux.org.uk, max.schwarz@online.de, 
	dianders@chromium.org, david.wu@rock-chips.com, heiko@sntech.de, vz@mleia.com, 
	wsa@kernel.org, manabian@gmail.com, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] i2c: pxa: Add check for clk_enable() and
 clk_prepare_enable()
Message-ID: <pyutqiut5yascxkwrv5ozrwdbmb4k4n2vu5jiia3fpgkra4up2@u7nvqpdscb4n>
References: <20241104214310.6048-1-jiashengjiangcool@gmail.com>
 <20241104214310.6048-2-jiashengjiangcool@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241104214310.6048-2-jiashengjiangcool@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_061306_211002_CEC90682 
X-CRM114-Status: GOOD (  17.11  )
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

On Mon, Nov 04, 2024 at 09:43:09PM +0000, Jiasheng Jiang wrote:
> Add check for the return values of clk_enable() and clk_prepare_enable()
> in order to catch the potential exceptions.
> 
> Fixes: e7d48fa2b5fb ("[I2C] pxa: provide late suspend and early resume hooks")
> Fixes: c3cef3f3c07b ("[ARM] pxa: update pxa i2c driver to use clk support")

I don't think we need the fixes tag here and nowhere else in this
series.

> Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
> ---
>  drivers/i2c/busses/i2c-pxa.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-pxa.c b/drivers/i2c/busses/i2c-pxa.c
> index 4d76e71cdd4b..1118a7f5c6bf 100644
> --- a/drivers/i2c/busses/i2c-pxa.c
> +++ b/drivers/i2c/busses/i2c-pxa.c
> @@ -1503,7 +1503,11 @@ static int i2c_pxa_probe(struct platform_device *dev)
>  				i2c->adap.name);
>  	}
>  
> -	clk_prepare_enable(i2c->clk);
> +	ret = clk_prepare_enable(i2c->clk);
> +	if (ret) {
> +		dev_err(&dev->dev, "failed to enable clock: %d\n", ret);

please use dev_err_probe here.

Thanks for your patch.

Andi

