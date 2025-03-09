Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39A0FC282D1
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 09:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZIwW4mMqcjhikStJ4LuoRwMzffSHbBGrUJN18yF51J4=; b=YRUrEs9MKhfM4lyKRaKfTioq/q
	5enQSKnAYVvWug+4xu/aWgHKG6TJZa1D/ssRnvjLY0QPoJKQKUAYCNEYnjrysDjSll88NjUZ2NHX7
	RY6iTlpIPaSa5mCR09FiXrOgEadXbYD3ffxL+81ND+jJL1koReBce8yXYyfcnGoj55EiKnHZ/YGqd
	WpacysU4HRTtP5W3QiTTXWpk8LqjnjGLXUEUrOMURYud8ppqc565ehSjzBurDHCeqkyJmiVEZ18Qg
	bvLOo2N0zJ8PX/denuWcUfCDJqu5QXYNzO2V3+B7pwOuq3S01VKnvVnwPdAOzb6vMTecv3hC1xXn7
	pDH4LNaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trCpB-00000000Ggg-0nyt;
	Sun, 09 Mar 2025 09:19:57 +0000
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trCnG-00000000GEU-0BO3
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Mar 2025 09:17:59 +0000
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-6fece18b3c8so10843607b3.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Mar 2025 01:17:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741511877; x=1742116677; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZIwW4mMqcjhikStJ4LuoRwMzffSHbBGrUJN18yF51J4=;
        b=ENKmOF5VPd+F21u8pbzG6uW7ohAM1Ut3NaVgid+jfz6skY/4jgFoz3b9AQtkr+wcdv
         nOABKE3ZzmNF6d2lVE88aT2/1GYQv8kb+VbmO8rHnVEBuFCqGqn5X5TNMu+fS49UNFml
         r0fvra1cd1bzSCDbvoNVLfFkotObU/BM/hYaWZzPcWpctRTf1wpgpb0RtsaDdUEZxTEu
         dHO9E4g5m6TrcIMfnRdYtsm1VPhArW1UYBMCSefr6nG5u4ZS1wvlLGCEbQo04gVA85Xg
         JgjhxKj8JoXMULLjygaHbW8pU4zPC8Xi673mfZTfLoqx3+8krPatmZ1VZ8EeisNzRAft
         mZJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741511877; x=1742116677;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZIwW4mMqcjhikStJ4LuoRwMzffSHbBGrUJN18yF51J4=;
        b=iPHh/JOd3QrVJ7MqDrovq7yhAH1bpc+qPU5rSHYd/tEAiGqCuaWcH9tUGQgEEuAqZk
         nsPxCPDYQk8c4ZEklY3PM85LQKhDcO+MbG/hbmqG94BZPV8YZPm2MlLHTOXMqtj3/Ngv
         b2LsUjrqwGN0yx7KftOh+FCk5ppJ79ICqmb+mo3Doj2/3ucnsVLiEuBl501jZgcdhkZk
         ly7qg7wnlQ7UBQ8EzFo2fLWsbsXwRLL27LFUiAyC3xasEMNgV+TtkoYsH/l1OfT32UCL
         KhOHpQmHBgDhY3gSCnnf/BRLKzrIrY7lptxk6oAg57lW1hniFmQzWQbhIBscal0go40t
         CNvg==
X-Forwarded-Encrypted: i=1; AJvYcCXm0ypLb/qWVcErVsgH1JoG3i8wgzpY7VgtTDnhnJJ3QBlKJF8JCqIt/jm3nWjo6/IcpuH7CgSc56pBTYeQqhpB@lists.infradead.org
X-Gm-Message-State: AOJu0YzSYhvfubMrwZk8ozQ/km7OG1UjH7m9eDcI2+1uaH+FJ3c/hRCj
	dhRIdQm7kUsv3VTlhVt4UmkJXgnlNlThg+uVc/9yNLpj8uLPouUB/osJ5Mh0sjg9QcRFtLz/Q+1
	JImGw5xBzrQe5ywB+wZ7L4dKCGR+tBuxfKqFXSQ==
X-Gm-Gg: ASbGncu4SoDDCnguvl5JvcvUX8SGYixmCIExtY2925bjDdgs1gCPdZ1ZnhIi7eQKnNk
	HPVaEujgNAxAW7Dr6fK1N0ERhva/AG78kuH/15SFs8c5oKT1k8+AF2IGqI0/ka5jyX6i8GHu16x
	y92ha7nJHm7r0GC3DhqZQCQg135NgOZr7HyQH6zCz7
X-Google-Smtp-Source: AGHT+IF5EPBAwX/vFFn1MyOCNXGFDeVtGYDbOKvZ8oN+itZnMpk7nJvsL5ZhfsKbFo9VQ/c2bu3NL+W9hdt3Gt+ff7Q=
X-Received: by 2002:a05:690c:3612:b0:6fd:2192:cf3c with SMTP id
 00721157ae682-6febf3b7663mr133674427b3.34.1741511876931; Sun, 09 Mar 2025
 01:17:56 -0800 (PST)
MIME-Version: 1.0
References: <20250308-phy-sam-hdptx-bpc-v5-0-35087287f9d1@collabora.com> <20250308-phy-sam-hdptx-bpc-v5-3-35087287f9d1@collabora.com>
In-Reply-To: <20250308-phy-sam-hdptx-bpc-v5-3-35087287f9d1@collabora.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 9 Mar 2025 11:17:46 +0200
X-Gm-Features: AQ5f1Jo12FGGsHm8kzdQ4xf0NIPejEccC7plOVJMbEqHfZYKsXU52PdjyJ4Y43Q
Message-ID: <CAA8EJprBcGz0tZ5SDVC_WK2bzjXZAtOj+LfGnSxmwktvaQw=VQ@mail.gmail.com>
Subject: Re: [PATCH v5 03/12] phy: rockchip: samsung-hdptx: Fix clock ratio setup
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Algea Cao <algea.cao@rock-chips.com>, 
	Sandor Yu <Sandor.yu@nxp.com>, Maxime Ripard <mripard@kernel.org>, kernel@collabora.com, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_011758_079072_79A8E373 
X-CRM114-Status: GOOD (  18.71  )
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

On Sat, 8 Mar 2025 at 14:21, Cristian Ciocaltea
<cristian.ciocaltea@collabora.com> wrote:
>
> The switch from 1/10 to 1/40 clock ratio must happen when exceeding the
> 340 MHz rate limit of HDMI 1.4, i.e. when entering the HDMI 2.0 domain,
> and not before.

Am I correct that the only functional change is a switch from
greater-or-equal to simple greater?

>
> While at it, introduce a define for this rate limit constant.
>
> Fixes: 553be2830c5f ("phy: rockchip: Add Samsung HDMI/eDP Combo PHY driver")
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
> index f88369864c50e4563834ccbb26f1f9f440e99271..cf2c3a46604cb9d8c26fe5ec8346904e0b62848f 100644
> --- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
> +++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
> @@ -320,6 +320,7 @@
>  #define LN3_TX_SER_RATE_SEL_HBR2_MASK  BIT(3)
>  #define LN3_TX_SER_RATE_SEL_HBR3_MASK  BIT(2)
>
> +#define HDMI14_MAX_RATE                        340000000
>  #define HDMI20_MAX_RATE                        600000000
>
>  enum dp_link_rate {
> @@ -1072,7 +1073,7 @@ static int rk_hdptx_ropll_tmds_mode_config(struct rk_hdptx_phy *hdptx,
>
>         regmap_write(hdptx->regmap, LNTOP_REG(0200), 0x06);
>
> -       if (rate >= 3400000) {
> +       if (rate > HDMI14_MAX_RATE / 100) {
>                 /* For 1/40 bitrate clk */
>                 rk_hdptx_multi_reg_write(hdptx, rk_hdtpx_tmds_lntop_highbr_seq);
>         } else {
>
> --
> 2.48.1
>


-- 
With best wishes
Dmitry

