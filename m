Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26D96E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 10:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8JZJoaJUaNREKAXmerLK4Rd1hRsVn/PObGVachLq/qE=; b=dMIqb3hPNqu93krLN3AsOo61Vv
	VZQXLvbXO26jbAvBR+I+t3QyaDWPhQSje2f51pY9A3qR6o/6jyy40FKpmIcA2/HOpJGCna/cIaU0B
	O13vfFTNfG/dhk4IjVuroqgEHLmjupRt89pG0TgNDX93xBHhmREf80idPHIpePRj80pxC4qRM26fh
	2ywqnYO5kmyi4wFAKLO28EKQoq+PSEDPKRVr7E5jui+ibI/kd5UdzNjHkXb3BTo6RlRJXQvxHLdAH
	bRPKfbJK3wBrIjsTs7YOjliO+wu0bwRGKQT3Rl9vtINiKFzSmc2/lTRXokojj9YvHYt+Nm24SbmxR
	vAA2ui7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV7G6-00000004SuJ-2x0O;
	Tue, 07 Jan 2025 10:56:26 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV7Er-00000004ScU-26AU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 10:55:13 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-30229d5b21cso85182731fa.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jan 2025 02:55:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736247307; x=1736852107; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8JZJoaJUaNREKAXmerLK4Rd1hRsVn/PObGVachLq/qE=;
        b=flAM62qZBto9aHKIz9Ub0aRwipx2z3SNh55dKLkAuxjwflOqlGBaRkcuw1JKdemPMM
         tsRAC5mf7iXXrr27IMGgJ1PcTHAxtzZd9813Ah0XykQiZ1IMiYEfUtaq/dyXbZ3Df/+D
         Q4v+Xk5adGla2TyYoXJXGn1kG2Y+bC5b+tm71CZ6wX7AU3tTUwFCmcEFxRAIDMiZeB9l
         VgHsYtgYyd3nVTvdYdqhiZSR6U4u4fUD5iGrcNVk0wSrKUYW+7QIgjgGjoff6xhj7ytc
         rAgtDBVHfnJbZOLnu69EB1SvXFGMgSbQEYwfjf8s51mIthqPYoc4ctPaJ0TK+IaVMxbB
         CAxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736247307; x=1736852107;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8JZJoaJUaNREKAXmerLK4Rd1hRsVn/PObGVachLq/qE=;
        b=lTKNPMBMAsl0+wnAyqTByvfo+gS4xwajRalF+Q0YjcSDTO8DVjViqt8h838QMVS8DA
         o/mB5S1zA5iDv8XJgO47TypgKY7V6nbIjdnXU4U/CD4+VWHsvbYdbo8kz/S54SJc4iza
         gdPeCiS096QO2AmQtekzUPdhtMp+gdbejRNjD8gUqO6GKPQtymKny5KIww/7PMEvFIGm
         hOeqyyOhc9Kyl1RwVUaVc1GptGOKjkR7f4mAaf0Xb75vW2BRXYIqI0u9ZPDKPTTfL5JT
         km/qQ7P3Xe2lkU+J5GDfVgEMZFCNXpxmVjWRA89hXAKtt5vDm9bxDnYGodnT0AcisUA5
         C0Ig==
X-Forwarded-Encrypted: i=1; AJvYcCW9PgZuDQwsQ+o2LZct/TgJhyu3wijn0eGBxOGvmtrrt9pTur54+QCEup7QYpyeNO3AoCGg8SXn38zh/l2ov0jF@lists.infradead.org
X-Gm-Message-State: AOJu0YzYTH519Yg0atnyE2iTxexQkzNRCoKyi3trsuVt4AfnfjmWBhNu
	IbTWGXoz7RF3ALHDEgrGQ1yx3sesC2uWgVswIB/+wcYhfC/km9yxhqiUu6HYisw=
X-Gm-Gg: ASbGncv4B+UnciuIHMjZ9/QkB1FiVBKjczh4KSEGCQJ5+Wh5PKqqEQpNYqa+mD37tEH
	9uotEEX0c+gsKc750Nx70WlSgeix7GZBnbkCEpqk0yxpLbhKa9fu657b6ePP+21K1IUndfRqfly
	LmY5s/bxY18B6Jlx+b4iz7bKYYFmaVFc2cde9ak71SVX2i9r7suKswj+yBA8cXOhS1raZ6IK6ef
	TxkXfatUl/tJhsO10RCnFj1tA6qAekTwmCLwh45vS+JVlHQE1wtKQp8mFxNKxSrcFoBvNCLc2bA
	nnbyB+nMCz5wE2PacLis1xfiPvVUkqU/SEa2
X-Google-Smtp-Source: AGHT+IGLgKzFbsWmFq6sHxnOSAOcAHZ8LpCXiCvq8SonzUfMjFA3G31B6U5QoMf8+KUqSpyXSGnKNw==
X-Received: by 2002:a05:6512:1392:b0:542:213f:78fa with SMTP id 2adb3069b0e04-542295224demr17287062e87.7.1736247307140;
        Tue, 07 Jan 2025 02:55:07 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223832ba9sm5226861e87.277.2025.01.07.02.55.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 02:55:05 -0800 (PST)
Date: Tue, 7 Jan 2025 12:55:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, rfoss@kernel.org, vkoul@kernel.org, 
	sebastian.reichel@collabora.com, cristian.ciocaltea@collabora.com, l.stach@pengutronix.de, 
	andy.yan@rock-chips.com, hjc@rock-chips.com, algea.cao@rock-chips.com, 
	kever.yang@rock-chips.com, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org
Subject: Re: [PATCH v4 07/17] phy: phy-rockchip-samsung-hdptx: Add support
 for eDP mode
Message-ID: <pffzxwsqwkklur3b7c7hp6g5wonzam5fs35fwblil3cjfofozk@clwgt5gcb32a>
References: <20241226063313.3267515-1-damon.ding@rock-chips.com>
 <20241226063313.3267515-8-damon.ding@rock-chips.com>
 <shr7ak7keqza3gw6wra2zra35qht2cxlzkvtuhzl3swzf2fwxy@i2v4o53lhese>
 <96f8310f-93f1-4bcb-8637-137e1159ff83@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <96f8310f-93f1-4bcb-8637-137e1159ff83@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_025509_544747_AE9E51E4 
X-CRM114-Status: GOOD (  29.38  )
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

On Tue, Jan 07, 2025 at 11:02:15AM +0800, Damon Ding wrote:
> Hi Dmitry,
> 
> On 2024/12/30 20:45, Dmitry Baryshkov wrote:
> > On Thu, Dec 26, 2024 at 02:33:03PM +0800, Damon Ding wrote:
> > > Add basic support for RBR/HBR/HBR2 link rates, and the voltage swing and
> > > pre-emphasis configurations of each link rate have been verified according
> > > to the eDP 1.3 requirements.
> > 
> > Well... Please describe what's happening here. That the HDMI PHY on your
> > platform also provides support for DP / eDP. Please document any design
> > decisions that you had to make.
> > 
> 
> Yes, I will add more relevant descriptions in the next version.
> 
> > > 
> > > Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> > > 
> > > ---
> > > 
> > > Changes in v2:
> > > - Add the module author
> > > 
> > > Changes in v3:
> > > - Split this patch into two, one for correction and the other for
> > >    extension
> > > 
> > > Changes in v4:
> > > - Add link_rate and lanes parameters in struct rk_hdptx_phy to store the
> > >    phy_configure() result for &phy_configure_opts.dp.link_rate and
> > >    &phy_configure_opts.dp.lanes
> > > ---
> > >   .../phy/rockchip/phy-rockchip-samsung-hdptx.c | 896 +++++++++++++++++-
> > >   1 file changed, 889 insertions(+), 7 deletions(-)
> > > 
> > > @@ -933,9 +1484,339 @@ static int rk_hdptx_phy_power_off(struct phy *phy)
> > >   	return rk_hdptx_phy_consumer_put(hdptx, false);
> > >   }
> > > +static int rk_hdptx_phy_set_mode(struct phy *phy, enum phy_mode mode,
> > > +				 int submode)
> > > +{
> > > +	return 0;
> > > +}
> > 
> > No need for the stub, please drop it. The host controller driver can
> > still call phy_set_mode() / _ext(), the call will return 0.
> 
> Without the &phy_ops.set_mode(), the phy driver can not get phy_mode to
> distinguish between HDMI and DP mode via the phy_get_mode(), even if the
> host driver calls phy_set_mode() / _ext(). Additionally, the previous
> discussion [0] also mentioned future considerations for dynamic switching.
> Indeed, I should add a related comment before the 'return 0;' to enhance
> understandability.

Oh... I see. Without .set_mode() callback the attrs.mode won't change.
We should probably fix that, there should be no need to add dummy stubs.


-- 
With best wishes
Dmitry

