Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D697C0218C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 18:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ucEtL2vpaDXIcOOJNCX2jaEjGKELSNePIN/Dbu21H78=; b=YTwdNP4xm0X1Z+1DvKHLmRB7IE
	QArgQqP7oRSJ+HZrs9PqHC7e7Q60ne+GtoJC0+KRg8SjkmuIpLCB5DEg0IX9j2HgmshNqxYVJYxU8
	my93wnVuwGkOEa7wcP52dtfGdw4iSegXZPWA++LZm3UYcWkJ9tDUZZoFjOkeDieh8KK3+Q9+qowi+
	K/E1LX9nRdnO9GkEBnTAnqprzeqToMMuhhxbWMkqeMZ1O3LOv0wOYq2m8rhpOtbfEj7cZ1TT+Lq/I
	DbJTO/3gicj9lDs02nRQq7s9PChMInt4mJXD4wW/VEjOFVXCozpjzZJXA+1vNLOwvOabLpXrUV5nt
	S8mzxBDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tafvg-0000000B2Ob-2NFB;
	Wed, 22 Jan 2025 18:58:20 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taftl-0000000B2BT-0rrs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 18:56:22 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-30229d5b21cso234981fa.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jan 2025 10:56:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737572179; x=1738176979; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ucEtL2vpaDXIcOOJNCX2jaEjGKELSNePIN/Dbu21H78=;
        b=dXGuyawGNyGuDREcyyNV3FLk+QD/tHC+SzEk22ErptUBPFZwV7RPhT7w0aSukNrYe4
         doFjkdAseXucQ0FomEo72H/neMF/plmf6fGosADN6p8fqSgMzZahgeolIkbF0S+yDIL7
         D+APA8HYPLbKyEQXJGYM5PaSYI8QDItbsg+H0FD6AkyOcFy+l/AWXA92kEUF0/OP9bZS
         I6LR9JA9b4nxYN7NhYqaFBVE61hVk+qrLFlFcJi+fAS401/5BQIuLzfcZa2vs/eLjc8o
         nTQT9tFRQ9AKcBAGt6Fz8zhfr9i7eEpr25h8X+bKs5IyL1xvyqlk5O0KjVovyoa3SJ7P
         yqtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737572179; x=1738176979;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ucEtL2vpaDXIcOOJNCX2jaEjGKELSNePIN/Dbu21H78=;
        b=cU53eMenYC43FAyvLLT7qRn2Mu7vuvMTK4khG7uQlXa+M/Lvis2IcsStL0HaALQq0k
         U6rZIVKVzpuByYpAfRn2xdoQk/u7tD8HI2NTrM2Vl0P6Zc1/GiJohaEJZdwnNxCC+Jqb
         5zD/HJU8/tnm0CQhUXbeqYlila2KHitH4HrKHU/BZgEtnO98F2Kflfkvzh3l6viKLUOC
         s8qsWkhZ8rMmHA83YyL5Gp2bj//GlZGTsUgMiKSUqwf0xcd3zyFaOc9o1ALAhysEshuY
         DA77rng1VKpEn6qgp5lXz6TgukrVDycTJ4YlEAjpd0rp1tfzPeC5hkC4lDBmNzWWRPSf
         n9+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWijezRwuV1dHFNlSoXT/oVboCj7NXzZ89EC+kGLZwkmISntBVM66XMJUU0gKfJenyjUujcI8Rf6Cp4thNq62fz@lists.infradead.org
X-Gm-Message-State: AOJu0YwFt1rTLpVFNu+gmdLe+decKA4Z3mNr1RUlSHmDXLwKCJF1fs4L
	t5TqmjNtyWCFRuGZCgY5Bjf0AsDw3rtLSdSRv8xBDdWr6N4EkDK3AWWQkMQ7VAM=
X-Gm-Gg: ASbGncuRrBf5pPlkdLZt4eh+0EbvM51NIVMx9wQ6SYTJ8pzp5agwCfLPYvKxEeXygnt
	FMvtlhje4Izkx+hSMXvdFgRKwO8i4vfomJ0jVW5Q9dsQdgMQYvFCpFjbXzxtIKbllFLYAEd0zBM
	gQBM4121Vqxt7xTLP0dDZhpAVzEwHRGe/VHttGIbR21xKsM8Lili45icm1tPzpsi4JfErQGXeqM
	YsbukIW8DAlZztzP2jdFhkCK3aeIxkwkMGeOvIwviR80b83saunHHdH+0in/Ytce8Tej52XPI6/
	eXf3U1pwXw6XswmIykgF7nk3eJIyobTTn5JEFMTacm1KCIX9Lw==
X-Google-Smtp-Source: AGHT+IH1Num8sybuVWGX6lQCu41xk40pAQuzRF+kjqRrF1p7We/fl/ksVQE0dG+SV6CSYwqD02NYlQ==
X-Received: by 2002:a05:651c:1713:b0:300:7f87:a6a with SMTP id 38308e7fff4ca-3072cab0c95mr63866951fa.7.1737572178788;
        Wed, 22 Jan 2025 10:56:18 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3072a35acb6sm26558281fa.62.2025.01.22.10.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 10:56:17 -0800 (PST)
Date: Wed, 22 Jan 2025 20:56:15 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, rfoss@kernel.org, vkoul@kernel.org, 
	sebastian.reichel@collabora.com, cristian.ciocaltea@collabora.com, l.stach@pengutronix.de, 
	andy.yan@rock-chips.com, hjc@rock-chips.com, algea.cao@rock-chips.com, 
	kever.yang@rock-chips.com, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org
Subject: Re: [PATCH v5 12/20] drm/rockchip: analogix_dp: Add support to get
 panel from the DP AUX bus
Message-ID: <qrtcanwfokvc5x6xtgxhi2fs6fcibhnnhenegrdialx7cgy7u3@ea4v3woh5gki>
References: <20250109032725.1102465-1-damon.ding@rock-chips.com>
 <20250109032725.1102465-13-damon.ding@rock-chips.com>
 <d7zpv6qt52mhny54dejw4yqlp2k2c437op7qmepqe27pufplqk@64xvohrz7h2q>
 <330041c4-aaee-4b41-8ccd-e2807415c709@rock-chips.com>
 <ba369b98-9a2a-421a-9251-4db3c1dcedd9@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ba369b98-9a2a-421a-9251-4db3c1dcedd9@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_105621_254659_AEC0DEE3 
X-CRM114-Status: GOOD (  31.39  )
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

On Wed, Jan 22, 2025 at 05:37:53PM +0800, Damon Ding wrote:
> Hi Dmitry,
> 
> On 2025/1/22 16:17, Damon Ding wrote:
> > Hi Dmitry,
> > 
> > On 2025/1/9 20:48, Dmitry Baryshkov wrote:
> > > On Thu, Jan 09, 2025 at 11:27:17AM +0800, Damon Ding wrote:
> > > > Move drm_of_find_panel_or_bridge() a little later and combine it with
> > > > component_add() into a new function rockchip_dp_link_panel().
> > > > The function
> > > > will serve as done_probing() callback of devm_of_dp_aux_populate_bus(),
> > > > aiding to support for obtaining the eDP panel via the DP AUX bus.
> > > > 
> > > > If failed to get the panel from the DP AUX bus, it will then try
> > > > the other
> > > > way to get panel information through the platform bus.
> > > > 
> > > > In addition, use dev_err() instead of drm_err() in rockchip_dp_poweron()
> > > > , which will be called before rockchip_dp_bind().
> > > > 
> > > > Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> > > > 
> > > > ---
> > > > 
> > > > Changes in v4:
> > > > - Use done_probing() to call drm_of_find_panel_or_bridge() and
> > > >    component_add() when getting panel from the DP AUX bus
> > > > 
> > > > Changes in v5:
> > > > - Use the functions exported by the Analogix side to get the pointers of
> > > >    struct analogix_dp_plat_data and struct drm_dp_aux.
> > > > - Use dev_err() instead of drm_err() in rockchip_dp_poweron().
> > > > 
> > > > ---
> > > >   .../gpu/drm/rockchip/analogix_dp-rockchip.c   | 41 ++++++++++++++-----
> > > >   1 file changed, 30 insertions(+), 11 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/
> > > > drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> > > > index 0957d3c5d31d..3ae01b870f49 100644
> > > > --- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> > > > +++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> > > > @@ -124,13 +124,13 @@ static int rockchip_dp_poweron(struct
> > > > analogix_dp_plat_data *plat_data)
> > > >       ret = clk_prepare_enable(dp->pclk);
> > > >       if (ret < 0) {
> > > > -        drm_err(dp->drm_dev, "failed to enable pclk %d\n", ret);
> > > > +        dev_err(dp->dev, "failed to enable pclk %d\n", ret);
> > > 
> > > 
> > > why?
> > > 
> > 
> > The &rockchip_dp_device.drm_dev will be assigned in rockchip_dp_bind(),
> > which is called after probing process. The PM operations have been
> > advanced to the probing for the AUX transmission, so the dev_err() may
> > be better than drm_err().
> > 
> 
> Using drm_...() uniformly may be better [0].

Yes

> 
> > > >           return ret;
> > > >       }
> > > >       ret = rockchip_dp_pre_init(dp);
> > > >       if (ret < 0) {
> > > > -        drm_err(dp->drm_dev, "failed to dp pre init %d\n", ret);
> > > > +        dev_err(dp->dev, "failed to dp pre init %d\n", ret);
> > > >           clk_disable_unprepare(dp->pclk);
> > > >           return ret;
> > > >       }
> > > 
> 
> Best regards,
> Damon
> 
> [0]https://patchwork.kernel.org/project/linux-rockchip/patch/20250109032725.1102465-6-damon.ding@rock-chips.com/#26209891
> 

-- 
With best wishes
Dmitry

