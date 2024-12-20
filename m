Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A92EFE7718A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 00:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AAbh6kvzri8ctYwKqJBe83JxMpEXpUs+Ep0IfsaKnoM=; b=Cc7JlOIPeIKgwAkAcE48luxt24
	vd6oXoEASzYvApMox6tFxGsh8iMvdfMJCTSotmYbbkWAXWaf3AvzxY23rTcgI5PxPiMpT3JvC0I3r
	gIzvBjLbj10v10PG9IytTc6/fZDEWV752VjSI5QTGsIZoE5ezJCfLRMTjO54Z5j7eycYluPdCiqVc
	UoE7ZiaD5LWbGo4nfU8sRV8HTowZF98dGt6ItRmP2tIZooglaKQZxcQmTq6XxCmSRoWybh2qEX0P7
	dXV/OsqLrIVOKwTtpN5C8ZaawwKbxAg9msCo/ke6W8ZF8nqYJgB55xeEOmDuswv20NVuhHPHpVqzU
	SFlZ38hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOQo2-00000003SlQ-3hb1;
	Fri, 20 Dec 2024 00:23:50 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOQms-00000003SY4-0ojP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 00:22:39 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-5401c52000dso1382578e87.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Dec 2024 16:22:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734654157; x=1735258957; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AAbh6kvzri8ctYwKqJBe83JxMpEXpUs+Ep0IfsaKnoM=;
        b=gcQ4DqUu2WZGGZjangUp2YLnClUMKWfg12z44Tia5lMTU5HiBZOWMrKqOt8QGtiLgq
         faNl9K8mAlg1okhM4RsOqPhviUAfdBczzXt3alJaQs9mhrs1G7yN3y+SQsnr6XZ11dMh
         nzfCo4vTlPPCoN4OJaEhgtzILOjBDHQ0RYhUlN2irp9aIaR5lqC9wjACMV4h9n7SeMIf
         t4/wJzyAIbVg32OGiV0hf2PHVHQdZCKFOJFpzzR/xjSb4RCzQwBQOOn5uMMTIg77dm1L
         jmj8FiZRg0fNIWcLXM+nr/DkCe4/VQxsKY73Qax96r5Sjw5LYXnYXbuNEhzzOHAJAqN8
         aVYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734654157; x=1735258957;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AAbh6kvzri8ctYwKqJBe83JxMpEXpUs+Ep0IfsaKnoM=;
        b=EPsPbQHU8TRac6li3Bl74BpR7ctyjLtK3ORtnT+5TmFzHM4ZUmNsXC62ORG64kytgG
         GOWCfKoaNm/tkv3KiqUMPsKgSxEhKGTEH7VOAHfDDZcFXfqasZ9gG3gk/upnxqU5jaFn
         hITu1+sPPPH3bj7Mt/yzbwuIE631hpwmR7oy+1Ue9kMM7Ejvg2TEw4hJo0TsV0CE6Nd0
         JoXE/SUFA8+9duEfy9nBXkkWwP70WqqVnwJkp+pVCxQhzw4r76Bv6It/0tn+P4Jd0UZf
         EeY5K2NHB/w1x0coFn+OFyxPRjpZSb+o/0YVDIzyXrQ5JWbWOIXYHsXdBxETEui8LCFY
         mTuw==
X-Forwarded-Encrypted: i=1; AJvYcCVJTf+BK2hHRuZEHGjk/46yTK6lvkY7mk/hayjz3ouStMa79avvReXktZbs/HMZFAQY74UgBJgJqeotViSsk2NB@lists.infradead.org
X-Gm-Message-State: AOJu0YyohOulXWPdhHWQxHBo5oIeSEKh0N97u0W5ULyOU8ZcNQip5qrj
	jfWP3SGQPW1q2PG62KXPbWouv/aDOhaqHOyYZnc9PYXn4yFMFX95lrpaq5ZyG+8=
X-Gm-Gg: ASbGncvmBPjOGyWEgzzLP9Lgey4znidOHG2mT53xk6TqDqA9+rHDSQXNU8Cb1ko6mXp
	9umGBXrl0NdCZDG31SQe1GUM9XPR0uu2HaY4bZ7XUb5t9YICg3eaY3nXSuxYC+2UNRfH9PXkdna
	MRHb8+XlO4sWZgeM5MAR7yjHuVso0fb4dxy12qVJxkAgPbUyEhWQsqsy4ATBuGIzBwS7+Dajb/Y
	ASWzaxE8OKJ3IRQ6JYvKG/q65gMRJbGpI2w5WA4mqCKeLhyE1oWUOvQ0bt2M/FA9KnVTr0SLRNR
	NeLcbbit+i8AkC7Ba4siG5AixYS7F4lu/ba7
X-Google-Smtp-Source: AGHT+IHBDB0DL2HFPmb1YTVLVej9ZBG0paM1gMbp8tkms3Vb7rT70j9ksKteZoAkcn4DVOlUEs7IFg==
X-Received: by 2002:a05:6512:3f25:b0:540:353a:5b1f with SMTP id 2adb3069b0e04-542294a1623mr189444e87.0.1734654156655;
        Thu, 19 Dec 2024 16:22:36 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223832b6csm318735e87.273.2024.12.19.16.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 16:22:35 -0800 (PST)
Date: Fri, 20 Dec 2024 02:22:33 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, rfoss@kernel.org, vkoul@kernel.org, 
	sebastian.reichel@collabora.com, cristian.ciocaltea@collabora.com, l.stach@pengutronix.de, 
	andy.yan@rock-chips.com, hjc@rock-chips.com, algea.cao@rock-chips.com, 
	kever.yang@rock-chips.com, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org
Subject: Re: [PATCH v3 04/15] phy: phy-rockchip-samsung-hdptx: Rename some
 register names related to DP
Message-ID: <rkdp44csph6stq2e7emhgjziiwypcas7uqsvcdo7i6ypvg64uz@gnqikl5fzxqd>
References: <20241219080604.1423600-1-damon.ding@rock-chips.com>
 <20241219080604.1423600-5-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241219080604.1423600-5-damon.ding@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_162238_243012_4AD580C7 
X-CRM114-Status: GOOD (  18.50  )
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

On Thu, Dec 19, 2024 at 04:05:53PM +0800, Damon Ding wrote:
> The modifications of DP register names are as follows:
> - Add the '_MASK' suffix to some registers to ensure consistency.
> - Complete the names of some register to their full names.
> - Swap the definitions of LCPLL_REF and ROPLL_REF.

Three unrelated changes, ideally means three commits (I won't insist on
that though). Also please mention that LCPLL_REF and ROPLL_REF were not
used by the existing driver, so it's not a bug and there is no need to
backport it.

> 
> Fixes: 553be2830c5f ("phy: rockchip: Add Samsung HDMI/eDP Combo PHY driver")
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> ---
>  .../phy/rockchip/phy-rockchip-samsung-hdptx.c | 64 +++++++++----------
>  1 file changed, 32 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
> index ceab9c71d3b5..c1b9c73f5f9f 100644
> --- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
> +++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
> @@ -69,41 +69,41 @@
>  #define ROPLL_PMS_IQDIV_RSTN		BIT(5)
>  /* CMN_REG(005e) */
>  #define ROPLL_SDM_EN_MASK		BIT(6)
> -#define ROPLL_SDM_FRAC_EN_RBR		BIT(3)
> -#define ROPLL_SDM_FRAC_EN_HBR		BIT(2)
> -#define ROPLL_SDM_FRAC_EN_HBR2		BIT(1)
> -#define ROPLL_SDM_FRAC_EN_HBR3		BIT(0)
> +#define ROPLL_SDC_FRAC_EN_RBR_MASK	BIT(3)
> +#define ROPLL_SDC_FRAC_EN_HBR_MASK	BIT(2)
> +#define ROPLL_SDC_FRAC_EN_HBR2_MASK	BIT(1)
> +#define ROPLL_SDM_FRAC_EN_HBR3_MASK	BIT(0)
>  /* CMN_REG(0064) */
>  #define ROPLL_SDM_NUM_SIGN_RBR_MASK	BIT(3)
>  /* CMN_REG(0069) */
>  #define ROPLL_SDC_N_RBR_MASK		GENMASK(2, 0)
>  /* CMN_REG(0074) */
> -#define ROPLL_SDC_NDIV_RSTN		BIT(2)
> -#define ROPLL_SSC_EN			BIT(0)
> +#define ROPLL_SDC_NDIV_RSTN_MASK	BIT(2)
> +#define ROPLL_SSC_EN_MASK		BIT(0)
>  /* CMN_REG(0081) */
> -#define OVRD_PLL_CD_CLK_EN		BIT(8)
> -#define PLL_CD_HSCLK_EAST_EN		BIT(0)
> +#define OVRD_PLL_CD_CLK_EN_MASK		BIT(8)
> +#define ANA_PLL_CD_HSCLK_EAST_EN_MASK	BIT(0)
>  /* CMN_REG(0086) */
>  #define PLL_PCG_POSTDIV_SEL_MASK	GENMASK(7, 4)
>  #define PLL_PCG_CLK_SEL_MASK		GENMASK(3, 1)
 >  #define PLL_PCG_CLK_EN			BIT(0)
>  /* CMN_REG(0087) */
> -#define PLL_FRL_MODE_EN			BIT(3)
> -#define PLL_TX_HS_CLK_EN		BIT(2)
> +#define ANA_PLL_FRL_MODE_EN_MASK	BIT(3)
> +#define ANA_PLL_TX_HS_CLK_EN_MASK	BIT(2)
>  /* CMN_REG(0089) */
>  #define LCPLL_ALONE_MODE		BIT(1)
>  /* CMN_REG(0097) */
> -#define DIG_CLK_SEL			BIT(1)
> -#define ROPLL_REF			BIT(1)
> -#define LCPLL_REF			0
> +#define DIG_CLK_SEL_MASK		BIT(1)
> +#define LCPLL_REF			BIT(1)
> +#define ROPLL_REF			0
>  /* CMN_REG(0099) */
>  #define CMN_ROPLL_ALONE_MODE		BIT(2)
>  #define ROPLL_ALONE_MODE		BIT(2)
>  /* CMN_REG(009a) */
> -#define HS_SPEED_SEL			BIT(0)
> +#define HS_SPEED_SEL_MASK		BIT(0)
>  #define DIV_10_CLOCK			BIT(0)
>  /* CMN_REG(009b) */
> -#define IS_SPEED_SEL			BIT(4)
> +#define LS_SPEED_SEL_MASK		BIT(4)
>  #define LINK_SYMBOL_CLOCK		BIT(4)
>  #define LINK_SYMBOL_CLOCK1_2		0
>  
> @@ -165,32 +165,32 @@
>  #define HDMI_MODE			BIT(2)
>  #define HDMI_TMDS_FRL_SEL		BIT(1)
>  /* LNTOP_REG(0206) */
> -#define DATA_BUS_SEL			BIT(0)
> +#define DATA_BUS_WIDTH_SEL_MASK		BIT(0)
>  #define DATA_BUS_36_40			BIT(0)
>  /* LNTOP_REG(0207) */
>  #define LANE_EN				0xf
>  #define ALL_LANE_EN			0xf
>  
>  /* LANE_REG(0312) */
> -#define LN0_TX_SER_RATE_SEL_RBR		BIT(5)
> -#define LN0_TX_SER_RATE_SEL_HBR		BIT(4)
> -#define LN0_TX_SER_RATE_SEL_HBR2	BIT(3)
> -#define LN0_TX_SER_RATE_SEL_HBR3	BIT(2)
> +#define LN0_TX_SER_RATE_SEL_RBR_MASK	BIT(5)
> +#define LN0_TX_SER_RATE_SEL_HBR_MASK	BIT(4)
> +#define LN0_TX_SER_RATE_SEL_HBR2_MASK	BIT(3)
> +#define LN0_TX_SER_RATE_SEL_HBR3_MASK	BIT(2)
>  /* LANE_REG(0412) */
> -#define LN1_TX_SER_RATE_SEL_RBR		BIT(5)
> -#define LN1_TX_SER_RATE_SEL_HBR		BIT(4)
> -#define LN1_TX_SER_RATE_SEL_HBR2	BIT(3)
> -#define LN1_TX_SER_RATE_SEL_HBR3	BIT(2)
> +#define LN1_TX_SER_RATE_SEL_RBR_MASK	BIT(5)
> +#define LN1_TX_SER_RATE_SEL_HBR_MASK	BIT(4)
> +#define LN1_TX_SER_RATE_SEL_HBR2_MASK	BIT(3)
> +#define LN1_TX_SER_RATE_SEL_HBR3_MASK	BIT(2)
>  /* LANE_REG(0512) */
> -#define LN2_TX_SER_RATE_SEL_RBR		BIT(5)
> -#define LN2_TX_SER_RATE_SEL_HBR		BIT(4)
> -#define LN2_TX_SER_RATE_SEL_HBR2	BIT(3)
> -#define LN2_TX_SER_RATE_SEL_HBR3	BIT(2)
> +#define LN2_TX_SER_RATE_SEL_RBR_MASK	BIT(5)
> +#define LN2_TX_SER_RATE_SEL_HBR_MASK	BIT(4)
> +#define LN2_TX_SER_RATE_SEL_HBR2_MASK	BIT(3)
> +#define LN2_TX_SER_RATE_SEL_HBR3_MASK	BIT(2)
>  /* LANE_REG(0612) */
> -#define LN3_TX_SER_RATE_SEL_RBR		BIT(5)
> -#define LN3_TX_SER_RATE_SEL_HBR		BIT(4)
> -#define LN3_TX_SER_RATE_SEL_HBR2	BIT(3)
> -#define LN3_TX_SER_RATE_SEL_HBR3	BIT(2)
> +#define LN3_TX_SER_RATE_SEL_RBR_MASK	BIT(5)
> +#define LN3_TX_SER_RATE_SEL_HBR_MASK	BIT(4)
> +#define LN3_TX_SER_RATE_SEL_HBR2_MASK	BIT(3)
> +#define LN3_TX_SER_RATE_SEL_HBR3_MASK	BIT(2)
>  
>  #define HDMI20_MAX_RATE			600000000
>  
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

