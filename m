Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 828EDD1BDD7
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 17:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RmegqGaWiEjq6y1t31FqfuHvFYkact221kcNJmCLEBI=; b=a8hOdyHZClpdamkRhPCNSII64w
	ydf9Axkxn/MctcuV7qE+z3WWp8US3z6+7ByX+dygabK1n38Fxc/o5QtpWjm955eJSXuB0yIPTBJ80
	DesWUwYYGVN+NUkYcugl2U7tapaVY5UKkrQFfUYDBHI1BPG1RTF25WK1A16JMT7At9v5mQtinJXti
	19LWVJ4mDcA7M1tJawjJhlSU05B7HpBGZC9/hcvpW99EYBdjE00EXmvLUdLLIL5p3cmbFCk1e/v+X
	tw8iDXzxcNTdX3oHjBgnltRrcI8d0TgBH/+UNOnhSbGqZbL1tU+RMmOmtzycOlTiZVpsDC1+PAtKO
	nOMEb5tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t81Lk-0000000Ed1x-1GqS;
	Mon, 04 Nov 2024 17:58:48 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t80tm-0000000EX9v-1C7H;
	Mon, 04 Nov 2024 17:29:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D773BA43194;
	Mon,  4 Nov 2024 17:27:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4221C4CECE;
	Mon,  4 Nov 2024 17:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730741392;
	bh=VIsm+vKuTiWLxy8wAD3WL4oTrYDz0+DlaUdFVPEaR6A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U1+njhmS9C1BnrW3KesZysOFKxuFALDbFR1vlBXfaD5I7h4iBZPIIkY4h1VvoQbPh
	 cfMYVpEODRoCc08vE5388BaJKGrm1XAhcTSqvWGVtSGLCmH1mhp26WC2ALSW639Xxp
	 EkwIVT3Ml1rrDaIS74t9EDDYEDq7Y9mS8Un2QOz9Ygg5MUEjhurM5QgTPOiVOAieN3
	 wPulMMf+wmGO0evh0Dt4fi0fvv7Ds5JNLVpZwyQPqBmEM6ozf4oW6C2fgGkUQsB8JY
	 mmcL1vYtMPRamsYCNVaoKKPy6lpWWuE6IfrN+qPWY2c0MSXiw/AaKXIR88x99+uWLe
	 aClf85IRVrBPQ==
Date: Mon, 4 Nov 2024 10:29:50 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>, Sandy Huang <hjc@rock-chips.com>,
	Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Algea Cao <algea.cao@rock-chips.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Arnd Bergmann <arnd@arndb.de>, dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/rockchip: avoid 64-bit division
Message-ID: <20241104172950.GA741087@thelio-3990X>
References: <20241018151016.3496613-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241018151016.3496613-1-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_092954_408542_785A87FC 
X-CRM114-Status: GOOD (  18.49  )
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

On Fri, Oct 18, 2024 at 03:10:10PM +0000, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Dividing a 64-bit integer prevents building this for 32-bit targets:
> 
> ERROR: modpost: "__aeabi_uldivmod" [drivers/gpu/drm/rockchip/rockchipdrm.ko] undefined!
> 
> As this function is not performance criticial, just Use the div_u64() helper.
> 
> Fixes: 128a9bf8ace2 ("drm/rockchip: Add basic RK3588 HDMI output support")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

Can someone please pick this up? It is still broken in next-20241104...

https://storage.tuxsuite.com/public/clangbuiltlinux/continuous-integration2/builds/2oNvJFRj8tkDieb6VfrMf4rh1Kn/build.log

> ---
>  drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> index 9c796ee4c303..c8b362cc2b95 100644
> --- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> @@ -82,7 +82,7 @@ static void dw_hdmi_qp_rockchip_encoder_enable(struct drm_encoder *encoder)
>  		 * comment in rk_hdptx_phy_power_on() from
>  		 * drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
>  		 */
> -		phy_set_bus_width(hdmi->phy, rate / 100);
> +		phy_set_bus_width(hdmi->phy, div_u64(rate, 100));
>  	}
>  }
>  
> -- 
> 2.39.5
> 

