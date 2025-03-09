Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39EF7C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 09:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y+UfwYvKoniH4ediByf7+QM/x5ez72G5r941EDLOy/s=; b=Yt7jRpVnZjZctulrDmbp9bsrTC
	Ogeiaspb3Po9l4V2v2mJJ1Wuzkysw/sOPhmrZaavvXygGDblTugskpMKzZwG+/rZD2ZEw8QXr3VE/
	Uxri8s1CwcTgRiC29Zpy3iV4pE1/qJgLg7RgNj15K18paBAYW6KJ3FCRlpqe5ZqP5Wo1dNNihpBzy
	bHpUloWeyGby54eNLeLuVUMBHb3WVIS5wcY6+VvxiYVCDFsgriD4rAEv5eVohuOAnw1rgU8LEZeNH
	B5AMJXoVyK3zNCiGSDi4zU4H7PrYOUEE2pzmZfWionS33Xiyil9tsgkpVOy93TEShBk1LuuVUhmy+
	eaZ94SYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trCxn-00000000Hl8-1jp0;
	Sun, 09 Mar 2025 09:28:51 +0000
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trCvk-00000000HT3-0xHZ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Mar 2025 09:26:46 +0000
Received: by mail-yb1-xb2f.google.com with SMTP id 3f1490d57ef6-e62d132a6a7so2283596276.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Mar 2025 01:26:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741512403; x=1742117203; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=y+UfwYvKoniH4ediByf7+QM/x5ez72G5r941EDLOy/s=;
        b=AqvhRbn7wDK2aqAMbm+xhibCRlVEYXUrsP1mHKEAvCCZM6sajRqMXfBIoZ/IxFTo2c
         +GA8k1xw2zM40xYo/+YaNe7/1OW9lpeubr+mGLDY83ley+UNyj6vrLstc+tAKkTjZSu4
         NOLInddsdiViKbrGzxWl9QBqxY0VyNfXnl3iIvK+qi/oiVlCPcSMZ1c2xKh6x5wCRX9d
         f6i/nCvHfRy+YTqdOT6oyiRyCG3GqGMXeOacC8LcAyLvmYi5XtVqLieKoDCa1BeLBoBU
         4UoufUN0JxO1n8gsKpqjwr7i7xo5tM0C2XFCXszWqUjjYt7oSPpF2QL9eKVBJFNOQrNj
         qBjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741512403; x=1742117203;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y+UfwYvKoniH4ediByf7+QM/x5ez72G5r941EDLOy/s=;
        b=Mw7X1T1qBatA5LsRsRtFU2xUsE/j2iOKCMfw0It2Oyhs/HgUOAve6qfTnlz/xmAqm5
         qkJVUjN3SClpcKuGyeYFxDhafhb1t/XRTfuePSGNuP2080P5ZyZLTTSCIgkcxEUCfvMA
         zLOcRCb6JksBASnmeZSTqJOWQjWLGTxQjNLbEdPuQGZ8fKQJo7z0FdBVfz8aZ42JN3Ah
         oA8PQJrw4dBJSus35SBWODbgioyXDwfIkiQcZbv1pNAW8kY9+s5ImAA2S22D9FhKXooT
         H6zHW18hPPL7t6WCuWTmE/SWkmJlfxvFd7D47BQGTQoJToepN6flleSRCIoEBkCnE1vU
         4raA==
X-Forwarded-Encrypted: i=1; AJvYcCW+DVBYHvcPOdonuK7p2dzEnmMbEQmLyM+Er26az1bVJRUpkig/zdZOkyVeyC2AgaHqikVxwd/ATTeMUfXWhKWW@lists.infradead.org
X-Gm-Message-State: AOJu0YxyVnmEBrLRaDB2n94oh9RPUJnKk5FzS1bPPjVFEhDTZlIHs5bF
	bhoIRrkEw87F86cfMQB9KxeTTBPbg/jcMqd0kugpKvPSJdCpVkvIkNriUPMSUISBs/dHx2+jQN7
	x+JdWGE1xrboymrS7d2ZnSZOFb9oZNbbzoM0Agg==
X-Gm-Gg: ASbGncvC40GhJ2p5JNJPy5QntGgg2PRI7VN6bYs1nYIVUQa10ix8lPoF/GxCV2pKJql
	15xIV3guCQ0/SQ3HWdA1Go39Z3e9zv6Nq56xJ5VMl8wYtDLc6hbwV0p0DB5jAotA6ecVeVoqQDG
	Eq8sGGXaD2tPc8aRaSmVxckhVh3l6HUnaU1Qk5JLVN
X-Google-Smtp-Source: AGHT+IEN3V2OLC8hZDOELnAVWI6ww13m5GBnJ8YaCGEl0AbmzOskx9R9Se1xuJeZm/tmBc9JT8v5uFIi9nlaU4PorAA=
X-Received: by 2002:a05:6902:2683:b0:e60:b17c:423f with SMTP id
 3f1490d57ef6-e635c17bdb5mr13660886276.28.1741512403353; Sun, 09 Mar 2025
 01:26:43 -0800 (PST)
MIME-Version: 1.0
References: <20250308-phy-sam-hdptx-bpc-v5-0-35087287f9d1@collabora.com> <20250308-phy-sam-hdptx-bpc-v5-8-35087287f9d1@collabora.com>
In-Reply-To: <20250308-phy-sam-hdptx-bpc-v5-8-35087287f9d1@collabora.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 9 Mar 2025 11:26:32 +0200
X-Gm-Features: AQ5f1JqfxNZ22KnfkCh9BmlsU97_eUwp8gZfAiDHoYY-EuyqHBEuJ0Y2Zcaf2N0
Message-ID: <CAA8EJpoGu4Tq-wt09Jj+b+=eJ3dNXhPWVOg4DyCQxrJbFNFfYw@mail.gmail.com>
Subject: Re: [PATCH v5 08/12] phy: rockchip: samsung-hdptx: Setup TMDS char
 rate via phy_configure_opts_hdmi
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Algea Cao <algea.cao@rock-chips.com>, 
	Sandor Yu <Sandor.yu@nxp.com>, Maxime Ripard <mripard@kernel.org>, kernel@collabora.com, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_012644_278746_6A46CD10 
X-CRM114-Status: GOOD (  20.47  )
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
> The current workaround to setup the TMDS character rate relies on the
> unconventional usage of phy_set_bus_width().
>
> Make use of the recently introduced HDMI PHY configuration API to
> properly handle the setup.  The workaround will be dropped as soon as
> the switch has been completed on both ends.
>
> Rename rk_hdptx_phy_verify_config() to rk_hdptx_phy_verify_dp_config()
> and introduce the rk_hdptx_phy_verify_hdmi_config() helper to check the
> HDMI parameters during phy_configure().
>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 64 +++++++++++++++++------
>  1 file changed, 47 insertions(+), 17 deletions(-)
>

> @@ -1469,8 +1474,27 @@ static int rk_hdptx_phy_power_off(struct phy *phy)
>         return rk_hdptx_phy_consumer_put(hdptx, false);
>  }
>
> -static int rk_hdptx_phy_verify_config(struct rk_hdptx_phy *hdptx,
> -                                     struct phy_configure_opts_dp *dp)
> +static int rk_hdptx_phy_verify_hdmi_config(struct rk_hdptx_phy *hdptx,
> +                                          struct phy_configure_opts_hdmi *hdmi)
> +{
> +       int i;
> +
> +       if (!hdmi->tmds_char_rate || hdmi->tmds_char_rate > HDMI20_MAX_RATE)
> +               return -EINVAL;
> +
> +       for (i = 0; i < ARRAY_SIZE(ropll_tmds_cfg); i++)
> +               if (hdmi->tmds_char_rate == ropll_tmds_cfg[i].rate)
> +                       break;

return 0;

> +
> +       if (i == ARRAY_SIZE(ropll_tmds_cfg) &&

Then you can drop the first clause in the if

> +           !rk_hdptx_phy_clk_pll_calc(hdmi->tmds_char_rate, NULL))
> +               return -EINVAL;
> +
> +       return 0;
> +}
> +
> +static int rk_hdptx_phy_verify_dp_config(struct rk_hdptx_phy *hdptx,
> +                                        struct phy_configure_opts_dp *dp)
>  {
>         int i;
>



-- 
With best wishes
Dmitry

