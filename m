Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABC3AC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 23:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kjtIav82DLIhRiYC6DDTmMkHb2eXdJHCwSAp2ZkRmAo=; b=oaf5uQehD514dY4FOB+E0Bigh5
	0qdStvGBQJtUklZR0vNxgqzg8VfMSkuzeLcHSlAJds/ofpHEaJyMAXDbFvJi2bLLYzF7V9uOb1cal
	mTx2kT3X91RRpOvBquO6a1Cbsf78YU1ZQu8FylYRUyL7U/la6Xu4P/YsDUc35izj+0nigw/x1QxcL
	Kyce+zFrdHTUb1w37a7wJpr7eIRrVIiTNvCiZTa6DWxMpd06ubRMwyU+Lby9p3t7SDvthkJBrWdVZ
	V+G5PfZms4Bz3OQjEYuIE3taiLvy2ljg77kYE6wb+MiArSXaROOd8WGRb1qPZJMcSC7l+x0vto2py
	lTg+h9Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua0ip-0000000DHJU-2XS8;
	Thu, 10 Jul 2025 23:30:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZy1A-0000000CxBa-3PsQ;
	Thu, 10 Jul 2025 20:37:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=kjtIav82DLIhRiYC6DDTmMkHb2eXdJHCwSAp2ZkRmAo=; b=Ls7NRHvnigCXYQRjo4B6gZgygV
	b7ugxrwbzIPq+ewRrpb7fN4oiqYQu8iMjMA2XetblUMTqL0xEIVQe0LJ0+F5wOIkPulQB0i03m6Rx
	nidH0JCpyYmhhQJcGLmS0ih8vOQhS0hUYkeGgOBFIAJ2caM4OfgRmOz8dwT2zNqtw/2Yi/ME40aoF
	PriWiUKi5yUiXuSzJiLYTF5792JT26h9p6SFiCIPOaf+HfQaTMTN7QYKcadmRJyD3jd2N0Q/JOQkh
	SMVA+W6DJzeUjPRN5SECOH6aOI9bMeTBcHt2O/xFj+98oET/1JgLQanACk0IuKYTI6ZdKFFvP816a
	pTaiC3YQ==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZy17-000000099en-1iSu;
	Thu, 10 Jul 2025 20:37:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 579B947065;
	Thu, 10 Jul 2025 20:37:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D23AC4CEF9;
	Thu, 10 Jul 2025 20:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752179835;
	bh=CgImUwkenH3liQ9C4iUaFmfKZb9tKRP5V6VjbmRzY7c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TA6c2YcVTUWe8n7Xs2HiUhvJxDMcNT6SJjTUUXso5JEZKSsxFA3wb79FtxLbTTNwq
	 i54iGisjtcG3VMssx1SIWXEDDadm7Gebx0O0Jy9w6gGBizquH2j8hKMQIg4CB7XcfR
	 KXBMGANpwxlgjgpVQOBItGHx4qPCQg9TiZsw9ar/GKDsCsIfgwayem9liUNUvhWDfm
	 ZHyZhl1j3qdcsWlCktLbIYkQ3k/Xv5radA5gtc6opgrh1zr6wXDuDPgHzGrN2S06Ii
	 V2nJbm6F8gOqb8l3BkwdzdzAZdG7zIVa/0sGk1H70zDbsg5bwsP+rOXkSVC9CqdMqE
	 glSd795lbkl6Q==
Date: Thu, 10 Jul 2025 15:37:13 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Alexey Klimov <alexey.klimov@linaro.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Paul Cercueil <paul@crapouillou.net>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2 01/12] pinctrl: pinmux: open-code
 PINCTRL_FUNCTION_DESC()
Message-ID: <z5hmnijgcowad5d7kksqockdltuggf2mszrsxhyv6yqwo3jwqr@n6hslkul4mbq>
References: <20250709-pinctrl-gpio-pinfuncs-v2-0-b6135149c0d9@linaro.org>
 <20250709-pinctrl-gpio-pinfuncs-v2-1-b6135149c0d9@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250709-pinctrl-gpio-pinfuncs-v2-1-b6135149c0d9@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_213717_807256_6EE73BF4 
X-CRM114-Status: GOOD (  16.44  )
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

On Wed, Jul 09, 2025 at 04:38:57PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> This macro is only used in one place and pin function descriptors should
> only be created by pinmux core so there's no point in exposing it to
> other pinctrl users. Remove the macro and hand-code its functionality.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

> ---
>  drivers/pinctrl/pinmux.c | 3 ++-
>  drivers/pinctrl/pinmux.h | 7 -------
>  2 files changed, 2 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
> index 0743190da59e819d1c72c1ed1ece72f206d60d65..daa7a11adabf672f802a8e9577c14e4da56b8678 100644
> --- a/drivers/pinctrl/pinmux.c
> +++ b/drivers/pinctrl/pinmux.c
> @@ -893,7 +893,8 @@ int pinmux_generic_add_function(struct pinctrl_dev *pctldev,
>  	if (!function)
>  		return -ENOMEM;
>  
> -	*function = PINCTRL_FUNCTION_DESC(name, groups, ngroups, data);
> +	function->func = PINCTRL_PINFUNCTION(name, groups, ngroups);
> +	function->data = data;
>  
>  	error = radix_tree_insert(&pctldev->pin_function_tree, selector, function);
>  	if (error)
> diff --git a/drivers/pinctrl/pinmux.h b/drivers/pinctrl/pinmux.h
> index 2965ec20b77fb360ca244800e30f1eafa988a2b1..5c039fd09f7474b4c104d3c36e0e8b8dc73a2ddd 100644
> --- a/drivers/pinctrl/pinmux.h
> +++ b/drivers/pinctrl/pinmux.h
> @@ -141,13 +141,6 @@ struct function_desc {
>  	void *data;
>  };
>  
> -/* Convenient macro to define a generic pin function descriptor */
> -#define PINCTRL_FUNCTION_DESC(_name, _grps, _num_grps, _data)	\
> -(struct function_desc) {					\
> -	.func = PINCTRL_PINFUNCTION(_name, _grps, _num_grps),	\
> -	.data = _data,						\
> -}
> -
>  int pinmux_generic_get_function_count(struct pinctrl_dev *pctldev);
>  
>  const char *
> 
> -- 
> 2.48.1
> 

