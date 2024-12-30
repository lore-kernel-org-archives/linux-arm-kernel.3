Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88000E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Dec 2024 12:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sk7KZ64g3QjSKBcPqpBugYd5y4zZQVTOsSnxLt9QvEM=; b=kXYz/ALxzjJhH38OZncSuvjYwo
	T3wAdfov/ASMIbyo9ZuacjO07g0tiTBjiHjhL+v6f3WZCFbMLCAkM7vEgFRkUfe0BNTtsyTV/Wxoh
	lSOfizJh4ak+9B7C5awgGLAgaoGj34pUXQzOj9sEohAxmpE010uAUmZXYLBU75mnpEHKdp4q6A8ID
	acheE/KpU5EmMNBz1kUZhkFfl/t8760n+j6cKVVghQeKY9ObOaHImaqAs6o8BwAjbq04pj4RfErMX
	jQamTqJ1mF2n6z2WBTSo/z2QmiYucquGNHbH5pOQVS+ULxKVWdiBvtTn9etLs0YGuAuWkp1YBH792
	GiX10CJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSEyb-00000005BYu-0zmk;
	Mon, 30 Dec 2024 12:34:29 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSExK-00000005BJK-44Bu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Dec 2024 12:33:13 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-5401c52000dso10465676e87.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Dec 2024 04:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735561989; x=1736166789; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Sk7KZ64g3QjSKBcPqpBugYd5y4zZQVTOsSnxLt9QvEM=;
        b=Cc5Jh/N3SWbXyKBdWoQUA2dEt4jcbPRoJRfSZZXp7nV6LhYr506JBvEVztLahhvtvg
         FWeaJDmEryxeURr0oHVsmgKNF9Vgq6ek7E0pP8pdnZbEqwk8NxDuhXY7zxA3ny47XRj1
         Lim7K0o60Gn+bTxG/FHrsVxBWrlJYkefLIFCgVFMPI5wWT5tCxIgimWaBRLUzbPAF7TU
         0RwODM0hb2tTN9oJwlmrUfdi4PCkWzOgp8lpR5nFnkEQIlr6Mv+xrTp02af2cS3HarNH
         moMird7dBWTLzx/waWA86gBeh3zq08K5H4roeHLqXbdVwknAX1OJhKFhWchAVGKqN/jO
         7Isw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735561989; x=1736166789;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sk7KZ64g3QjSKBcPqpBugYd5y4zZQVTOsSnxLt9QvEM=;
        b=V5eg0W3MCyrFuu4msvTZMtvw088ByOqAYtbUn6Kk5MBGEVJogMsRYdmGVg88E7DTxt
         v0C5UR7ZK0PTjgAfFwJqH4Q/PX0FzYrCnHXGvX4yb3sf6kyXPJ+jH67dSRuZhCtKX3CF
         Wq+NzNCZGvNf4bm4K6uhMAvmLMLsZweQRQAMB+FFxb1qYyBGiMdLTENzwghv891h9q86
         ZHbAFbIGMNxI7jpnq8jvX7mWmIyDIdrUw6PStKtmPu+I+OJvA4xt18pkh5Yfy895YbPP
         0UYqn8XIjYhx7vgJzbWon27muydLOiN+GxYenCNGppsfOeSv52GvXOAR5q473VWswI5o
         lgIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXENSU73wHfOJMTn0X2erhsyDJS4Af/vpWB06Dhs7G/TvaXRsxfRkhYVoYmdBJWuYD562IWymzq/YyMcIP09RrD@lists.infradead.org
X-Gm-Message-State: AOJu0Yxq4xBev2hsoZ5DYRftqYyGq91DQa892HUyHuQSdncd7r3dnPUc
	XXi3IkOmlFRRskUDE8SEOYFe66whnCNM7rbDFlueyArCe/5sEJlaNZq0hEjIKRw=
X-Gm-Gg: ASbGncurt4YLEHXWmTn5gOWHSomOY20Fv/D1pa6NycEYI4g6Rx4DJKVPaPbw3m0yw8B
	oT8fCG1aI+wfN+nOXuVX5sKvIkKDgyXJnkuXQcL+3xeD6EBSU3pcfQb/mvMIW0F+PmK2Co/IHL7
	wtG6OHNs4XVxWsYT6K09zMNVe1CCzbTugX5PXyuK1zkQ60/C7AvhMT+8FrgQsAdmD3C5aiZoTap
	Tvt95YxE4QJskJHclfsM1b2vrHRFUFXmfQyuQCtZJjrF7wZnxYhRVppJp1kzqQkoOhTLJf+9m4O
	SU58MMpH+FSFtXcx2TLvsmrF2e+QN94BWAzV
X-Google-Smtp-Source: AGHT+IGzkRgSziPMi+OuvqqF5BpICe3Uj4EKlYJrSjSIBpngZHhFVUrx0eOYogAtQxS8zwZb6NLAVg==
X-Received: by 2002:a05:6512:2246:b0:542:2e04:edd1 with SMTP id 2adb3069b0e04-5422e04f073mr7912458e87.42.1735561988824;
        Mon, 30 Dec 2024 04:33:08 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542238135basm3125829e87.130.2024.12.30.04.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 04:33:08 -0800 (PST)
Date: Mon, 30 Dec 2024 14:33:06 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, rfoss@kernel.org, vkoul@kernel.org, 
	sebastian.reichel@collabora.com, cristian.ciocaltea@collabora.com, l.stach@pengutronix.de, 
	andy.yan@rock-chips.com, hjc@rock-chips.com, algea.cao@rock-chips.com, 
	kever.yang@rock-chips.com, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org
Subject: Re: [PATCH v4 04/17] phy: phy-rockchip-samsung-hdptx: Swap the
 definitions of LCPLL_REF and ROPLL_REF
Message-ID: <ru3xpse4mg62gcxemut3zro6qw6v6firjnefo57k74n2ti66ym@l3pe2hpz5csl>
References: <20241226063313.3267515-1-damon.ding@rock-chips.com>
 <20241226063313.3267515-5-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241226063313.3267515-5-damon.ding@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241230_043311_049848_945586B0 
X-CRM114-Status: GOOD (  13.02  )
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

On Thu, Dec 26, 2024 at 02:33:00PM +0800, Damon Ding wrote:
> According to the datasheet, setting the dig_clk_sel bit of CMN_REG(0097)
> to 1'b1 selects LCPLL as the reference clock, while setting it to 1'b0
> selects the ROPLL.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> ---
>  drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

