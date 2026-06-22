Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2722CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 11:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n3pEs7ELftmADa57rBtbs9ZKMglFTJdohuXXnbaKK8k=; b=Ww705MqW59FaOJMwOC3YruWGKQ
	GULXgFWCLHHBOnWeHW9EV+gfpMohHdrazkSGr+0cGaNRxMXdvv/DOmATAQxrO7MCA5D5X0sF2C/G7
	0ULzgKOc/enhxGp2f3HqHPuTEaJJ77XpS32ReZKkWCevDfvp1uCZ3QXovx4UIxWQZMC2yR3jYQCBL
	SmwKwwjhEjrEYnUSOfqp97IUoRXaAGlCtJ1j1KQ9wuI8rCkWgd0JDLumPk14DqFY9TNt/9LVBMZYF
	sGhFb2+bBqP/rxSudpaUhfzfWkZCLNDkHmHJtW+bkb0w/+Ed/zooit2fbCoQfsPLpT8rJDgqojwvk
	mfOKAZtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbcjD-00000004td4-1KXb;
	Mon, 22 Jun 2026 11:22:11 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbcjA-00000004tcJ-0seO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Jun 2026 11:22:09 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4903d730b1fso64142695e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Jun 2026 04:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782127326; x=1782732126; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=n3pEs7ELftmADa57rBtbs9ZKMglFTJdohuXXnbaKK8k=;
        b=tBiWxHW9puN3R7NDiwz9DX1dAO3kNXmUZlFZVOs39qU7Sb1d/j4KxUePSOKH1ZoXf/
         XVSfVtS2n0gc6y8/bM7Yf3BDgxdieV59mLsVi/odfgBsGMppAGPCrsdVZGEwNBJNQmGI
         SuOLdleGeYktAU1GcVGl0ryOn5uWpKhNz3C3vvop9ZcoI1NxNGNi4MPeKQoGtr2H9GiD
         ZpqjerdTt4O4Mkf4fNvKZBFmpYwTPwq5K2azUvRRlm7Zyj/npRLI9KaLK/38AehY66LY
         uTfkJhrlCavwFezlNmugLetId/C20XAtr/M3GJarBZMgH9DtH3VeG0GQV+wg1jBgY/WR
         GX+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782127326; x=1782732126;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n3pEs7ELftmADa57rBtbs9ZKMglFTJdohuXXnbaKK8k=;
        b=Qh5wFXfQYr6QJvvvxv3BvSYHGheCXua4OUCC2UUy5+yfuK/xrMLH/yy4MIM5ICW2lM
         /WSTTbssvSPvnAWVeMTpM7N4IaYuaqx3WQLNdvjvLRCBFrnIyCPCmSST9YK5s7m5s/hM
         AddzpHNkeHUeK99e6+WJPlcKmGqCVI/F6OgiennZkhWpN7JAzkj71T1TKqvWYjRGQcpp
         UILzDRycl4GrvCL6NpCDfrIuNSrUQaETOoeY3WufYuedlYbKdYom2wBULX32IcQRRVep
         GPXVh03MRr7TBWTou/3Yvl2OGtQVL/xMAGeUqiqXwXQVWddtrZofFvw/0lOcKEm9cHro
         oU1Q==
X-Forwarded-Encrypted: i=1; AFNElJ9l6NzoocC+iCthD5pbldLRLMm7heU/MP627ZLOlYoYOViWZKma0NHIFTgG0aB0MYq8Le7Yk8/06O+UrgU+Mliq@lists.infradead.org
X-Gm-Message-State: AOJu0YzPBzhV8lVYaQQoDZJJw9wSuYHdaoCVVG9WH2eOO7siO44N2YKR
	ZaB8s7uqcGCLFSrKKPloNjubFZHMY4602cavejP2Mohtv9DApMvCNAMB
X-Gm-Gg: AfdE7ckq+nAMdNMGRloAgL6rO0QAEROZPlby7el0wpo8bPxym16/OlZhS8q+EAgrcXH
	0dTtE79l8AMghsIsvgiWL9iOserUj+IU6ljEbqQmQwJo/bWoYN9EMRdv2xwordjCZ7J2BhBQXF9
	/nPF9fvRoQZjqEPKkjEqsU01jB0osVQ9j2BPd25/SL+LcjRaPHZZXiU6pEvr+0mKzvNsl2yTjGT
	mpcGc42P5DCVOp30SiF81TX+tNZts+f1YyNUrF1HDXqqPTsrleerBd+2sqGplx6jW2eyRYD8Ly1
	NmcksO4TWSOuXU1W0NGUR4ls7Cv6LOghoB7Cr1Dgk6VfDbFXpY2vvuPxDq6h7e8gvgsA6BGnkQS
	B/3Y32eeostTd29hSJfSd8eVEpSYrlcxxRM0uYedehZ9xyaOTQ1teQHzKbllLaDPJjffpLrnO9i
	J0Jvz6x0GeQxIo35Fp
X-Received: by 2002:a05:600c:8b2b:b0:492:4a56:690b with SMTP id 5b1f17b1804b1-4924a5669d3mr155913935e9.35.1782127325428;
        Mon, 22 Jun 2026 04:22:05 -0700 (PDT)
Received: from owl5 ([2001:861:3201:3d10:da31:7e0:ef44:ffb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923fd1f886sm270773485e9.4.2026.06.22.04.22.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 04:22:04 -0700 (PDT)
Date: Mon, 22 Jun 2026 13:22:03 +0200
From: Gary Bisson <bisson.gary@gmail.com>
To: Adam Thiede <me@adamthiede.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] drm/mediatek: mtk_dsi: enable hs clock during pre-enable
Message-ID: <ajka2220depklK1_@owl5>
References: <20260120-mtkdsi-v1-1-b0f4094f3ac3@gmail.com>
 <42607fa4-485d-4142-b31c-7bfac71118d2@adamthiede.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <42607fa4-485d-4142-b31c-7bfac71118d2@adamthiede.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_042208_278748_F9C112B6 
X-CRM114-Status: GOOD (  35.86  )
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

Hi,

On Thu, Jun 18, 2026 at 04:06:28PM -0500, Adam Thiede wrote:
> On 1/20/26 05:36, Gary Bisson wrote:
> > Some bridges, such as the TI SN65DSI83, require the HS clock to be
> > running in order to lock its PLL during its own pre-enable function.
> > 
> > Without this change, the bridge gives the following error:
> > sn65dsi83 14-002c: failed to lock PLL, ret=-110
> > sn65dsi83 14-002c: Unexpected link status 0x01
> > sn65dsi83 14-002c: reset the pipe
> > 
> > Move the necessary functions from enable to pre-enable.
> > 
> > Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
> > ---
> > Tested on Tungsten510 module with sn65dsi83 + tm070jdhg30 panel.
> > 
> > Left mtk_dsi_set_mode() as part of the enable function to mimic what is
> > done in the Samsung DSIM driver which is known to be working the TI
> > bridge.
> > ---
> >   drivers/gpu/drm/mediatek/mtk_dsi.c | 35 +++++++++++++++++------------------
> >   1 file changed, 17 insertions(+), 18 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> > index 0e2bcd5f67b7..b560245d1be9 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> > @@ -672,6 +672,21 @@ static s32 mtk_dsi_switch_to_cmd_mode(struct mtk_dsi *dsi, u8 irq_flag, u32 t)
> >   	}
> >   }
> > +static void mtk_dsi_lane_ready(struct mtk_dsi *dsi)
> > +{
> > +	if (!dsi->lanes_ready) {
> > +		dsi->lanes_ready = true;
> > +		mtk_dsi_rxtx_control(dsi);
> > +		usleep_range(30, 100);
> > +		mtk_dsi_reset_dphy(dsi);
> > +		mtk_dsi_clk_ulp_mode_leave(dsi);
> > +		mtk_dsi_lane0_ulp_mode_leave(dsi);
> > +		mtk_dsi_clk_hs_mode(dsi, 0);
> > +		usleep_range(1000, 3000);
> > +		/* The reaction time after pulling up the mipi signal for dsi_rx */
> > +	}
> > +}
> > +
> >   static int mtk_dsi_poweron(struct mtk_dsi *dsi)
> >   {
> >   	struct device *dev = dsi->host.dev;
> > @@ -724,6 +739,8 @@ static int mtk_dsi_poweron(struct mtk_dsi *dsi)
> >   	mtk_dsi_set_vm_cmd(dsi);
> >   	mtk_dsi_config_vdo_timing(dsi);
> >   	mtk_dsi_set_interrupt_enable(dsi);
> > +	mtk_dsi_lane_ready(dsi);
> > +	mtk_dsi_clk_hs_mode(dsi, 1);
> >   	return 0;
> >   err_disable_engine_clk:
> > @@ -769,30 +786,12 @@ static void mtk_dsi_poweroff(struct mtk_dsi *dsi)
> >   	dsi->lanes_ready = false;
> >   }
> > -static void mtk_dsi_lane_ready(struct mtk_dsi *dsi)
> > -{
> > -	if (!dsi->lanes_ready) {
> > -		dsi->lanes_ready = true;
> > -		mtk_dsi_rxtx_control(dsi);
> > -		usleep_range(30, 100);
> > -		mtk_dsi_reset_dphy(dsi);
> > -		mtk_dsi_clk_ulp_mode_leave(dsi);
> > -		mtk_dsi_lane0_ulp_mode_leave(dsi);
> > -		mtk_dsi_clk_hs_mode(dsi, 0);
> > -		usleep_range(1000, 3000);
> > -		/* The reaction time after pulling up the mipi signal for dsi_rx */
> > -	}
> > -}
> > -
> >   static void mtk_output_dsi_enable(struct mtk_dsi *dsi)
> >   {
> >   	if (dsi->enabled)
> >   		return;
> > -	mtk_dsi_lane_ready(dsi);
> >   	mtk_dsi_set_mode(dsi);
> > -	mtk_dsi_clk_hs_mode(dsi, 1);
> > -
> >   	mtk_dsi_start(dsi);
> >   	dsi->enabled = true;
> > 
> > ---
> > base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> > change-id: 20260120-mtkdsi-29e4c84e7b38
> > 
> > Best regards,
> 
> Hello,
> This commit was part of 7.1 and caused a problem for me.
> I'm running postmarketOS (basically Alpine Linux) on a Lenovo C330
> chromebook with a Mediatek MT8173 processor.
> The problem: when the display on my laptop powers off (via suspend or idle,
> like xset dpms off) the picture does not come back when the display powers
> back on (from resume). The display backlight comes on and brightness is
> adjustable but there is no picture. The only fix is to reboot.
> 
> Reverting this commit and applying it as a patch on top of 7.1 addresses the
> issue for me.
> 
> You can view the config I'm using here:
> https://gitlab.postmarketos.org/postmarketOS/pmaports/-/merge_requests/8819
> 
> Is there any sort of testing or other debugging info I can provide to help
> address this issue?

Thanks for reporting the issue, could you share some logs? Is the driver
saying anything during resume? Also, what type of panel is used on that
chromebook?

Thanks,
Gary

