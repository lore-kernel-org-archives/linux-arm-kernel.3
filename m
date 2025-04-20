Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD74CC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Apr 2025 09:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=fWQY42eWCmlkXVWhry1af/CWnxEZndFo/0hIOaKShAU=; b=qK1MCG0QQalhmJ
	bt8ERMpAfcXTF094xRJ1/mBhOBPQfM+KrG/2kNT1NiJhoRECIjn3Rnkg3tk3OUMgGpc5FxkEIJcPG
	mpfXc2n5TbfKZHcxC2gg/ehI2IyMTGyJOprRq5VS716BEMYImODnaSgc8pzT8MvKKDaStFx7VgRT1
	rCEl+4K6pTQIDSHyfrdME5tSnoY2wix8dps7th+Tg4u4QDU4uWtHc4/tAIBC83s6+sRlDTkSD185I
	6VBlVcT5XafcYoMwBnIP3e6xMdYzio0h6I8Mp/cEB+m0c9r/VjKuy8YdagGucJot/sIr2u+TJewmi
	I6VKcjVyjxeZTRAk6Eyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6R4J-00000002P91-0pBa;
	Sun, 20 Apr 2025 09:34:31 +0000
Received: from mail.ispras.ru ([83.149.199.84])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6R2Q-00000002P0M-1N0X;
	Sun, 20 Apr 2025 09:32:36 +0000
Received: from localhost (unknown [10.10.165.8])
	by mail.ispras.ru (Postfix) with ESMTPSA id ABE754076726;
	Sun, 20 Apr 2025 09:32:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru ABE754076726
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
	s=default; t=1745141546;
	bh=fWQY42eWCmlkXVWhry1af/CWnxEZndFo/0hIOaKShAU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=AS5dK+IKYudFHNvytmLk+fqj7yxTBZjUdVJCcuHfpJwstkabClzSTiwtPwAfKq/Ni
	 1uTL0d3nV+qGrUEpkz09E1oWlkkcgtdcDsX8bZzKHIUDIwRKpfFhQISndwdTZ2QQpQ
	 +kYUP272fI7LfR9Y2z3cZgPezv/ClCT/kEpObEJA=
Date: Sun, 20 Apr 2025 12:32:26 +0300
From: Fedor Pchelkin <pchelkin@ispras.ru>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	linux@martijnvandeventer.nl, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com, neil.armstrong@linaro.org, 
	Furkan Kardame <f.kardame@manjaro.org>, Anastasia Belova <abelova@astralinux.ru>
Subject: Re: [PATCH] drm/meson: fix resource cleanup in
 meson_drv_bind_master() on error
Message-ID: <mpoae5tfugsnvdyv5yzmiifr242mc62gouqqvql7ucjtdxo7b2@7y4plckbcdbn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250409214422.1751825-1-martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250420_023234_859936_07905467 
X-CRM114-Status: GOOD (  10.14  )
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

Martin Blumenstingl wrote:
> @@ -360,6 +360,16 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
>  
>  uninstall_irq:
>  	free_irq(priv->vsync_irq, drm);
> +dsi_encoder_remove:
> +	if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A))
> +		meson_encoder_dsi_remove(priv);
> +hdmi_encoder_remove:
> +	meson_encoder_hdmi_remove(priv);
> +unbind_components:
> +	if (has_components)
> +		component_unbind_all(dev, drm);

As 6a044642988b ("drm/meson: fix unbind path if HDMI fails to bind")
states, it seems invalid to call component_unbind_all() before
drm_dev_put(). Wouldn't this patch reintroduce the problem here?

In that sense the diff proposed by Martijn <linux@martijnvandeventer.nl>
behaves more correctly.


I've also found this thread [1] with another error path fixing patch. It
was suggested to improve that fix with managed drm device [2] interfaces but
AFAICS using devm_drm_dev_alloc() will reintroduce the problem mentioned
in 6a044642988b, too.

I think [1] should be applied as well with Martijn's patch?

[1]: https://lore.kernel.org/dri-devel/20240809124725.17956-1-abelova@astralinux.ru/T/#u
[2]: https://lore.kernel.org/dri-devel/20240828110421.14956-1-abelova@astralinux.ru/T/#u


Thanks!

> +cvbs_encoder_remove:
> +	meson_encoder_cvbs_remove(priv);
>  exit_afbcd:
>  	if (priv->afbcd.ops)
>  		priv->afbcd.ops->exit(priv);
> @@ -374,13 +384,6 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
>  free_drm:
>  	drm_dev_put(drm);
>  
> -	meson_encoder_dsi_remove(priv);
> -	meson_encoder_hdmi_remove(priv);
> -	meson_encoder_cvbs_remove(priv);
> -
> -	if (has_components)
> -		component_unbind_all(dev, drm);
> -
>  	return ret;
>  }
>  
> -- 
> 2.49.0

