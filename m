Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A37FECD3427
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 23:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k+M03wsriHpOsFU8WHnfMxHMs0I4TIbUqkb4XbkQNUQ=; b=CrK96As82+vLZowhdehQWTzE7B
	SPNDdUaUBtJYkmOB7/fcL4GFzsnbmNgHHcqB5mMf4aebF0u7cZOgpriHGnRxJOeGP8onZaIbT5v42
	1+6UHB1cTgVtVIbTO6ECRvyD5o2+C9aCoF52o2bf4a/jx/wat+0FFFtXPfNtVvaU/Ppr9Sh+mzHmb
	JSW7yehhgvv3GuCZuQg4trH1hvKGIfDeZt1Tc1Kz+lYtcU7jVHl9zMkXHVKT07C4UbJJ3d8d7ZfC1
	qkvmNzNmVSSF5opiPrXd7RrIcJxSDty8TXQEoC8agGc6Nc7QGUoPe6V8Dc3gntyIUyCouyEz5TynB
	0YP3sexA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK2ng-0000000EbMd-1gqT;
	Mon, 04 May 2026 23:34:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK2nd-0000000EbLA-3lQd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 23:34:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4E3E924C0;
	Mon,  4 May 2026 16:33:56 -0700 (PDT)
Received: from ryzen.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EC9AD3F7B4;
	Mon,  4 May 2026 16:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777937641; bh=yRUjHk/bWRa3yzbi/uy35powhSCptlYsurtPe87JWYM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=NIZxlofX6t0+2104etadZndVgufTMw9ZvqEMHOclqmJC6gHGx/FJ2GAAgTD4+zcGZ
	 c7N5fov8VNvAdoRfsxzoCJ2vcYepEka6aEq8NeWpLckyyjrz0usTToXaoF3iGpc5Pj
	 w611q2DlRNqSgvTjqeFmoWDEwQ2F9XQ9ghdPNtCg=
Date: Tue, 5 May 2026 01:33:25 +0200
From: Andre Przywara <andre.przywara@arm.com>
To: Felix Gu <ustc.gu@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
 <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: sunxi: fix regulator leak in
 sunxi_pmx_request() error path
Message-ID: <20260505013325.74de6c21@ryzen.lan>
In-Reply-To: <20260504-sunxi-v1-1-c0fd0df52776@gmail.com>
References: <20260504-sunxi-v1-1-c0fd0df52776@gmail.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_163406_092521_E73F5C34 
X-CRM114-Status: GOOD (  18.77  )
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

On Mon, 04 May 2026 22:53:26 +0800
Felix Gu <ustc.gu@gmail.com> wrote:

> In the error path of sunxi_pmx_request(), the code calls
> regulator_put(s_reg->regulator) to release the regulator. However,
> s_reg->regulator is only assigned after a successful regulator_enable().
> This causes a memory leak: the regulator obtained via regulator_get()
> is never properly released when regulator_enable() fails.

Yes, that's a correct observation. The fix looks alright, though I
wonder if we should drop the "goto" here altogether, since there is only
one caller, and the code would look better like this:

	ret = regulator_enable(reg);
	if (ret) {
		dev_err(pctl->dev, ...
		regulator_put(reg);
		return ret;
        }
...

> Fixes: dc1445584177 ("pinctrl: sunxi: Fix and simplify pin bank regulator handling")
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>

Regardless, the fix is correct, so:

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
>  drivers/pinctrl/sunxi/pinctrl-sunxi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> index d3042e0c9712..25489beeb312 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> @@ -925,7 +925,7 @@ static int sunxi_pmx_request(struct pinctrl_dev *pctldev, unsigned offset)
>  	return 0;
>  
>  out:
> -	regulator_put(s_reg->regulator);
> +	regulator_put(reg);
>  
>  	return ret;
>  }
> 
> ---
> base-commit: b9303e6bff706758c167af686b5315ad00233bf8
> change-id: 20260504-sunxi-cda91661c181
> 
> Best regards,


