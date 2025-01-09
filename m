Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C808E77199
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 12:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h8hd6QQPe6WsmCvGJJcJ/fM8HdXFIRmyRc/10BLVlxA=; b=aVNaCzFaKPDpmFTqMW3oT0IAPd
	B9hZJifapw+7HLR8YiAqnkQ4guixG8OinPRCNAjcmOUiVm5o5El7V1Sx49BERkNhwrFlxmCh0VCJc
	gXDZYa8A5EeQqwMRvnYsMooNeoUmod3j9LtJtvqDAGS4JLs7gutTZtHHYPmXMaV1y2ZefeyJyI2dr
	+H82sjN/Hr6sxgkGyXD4SFYPWnsbohJhN1TApU03GB/F6tRx+4OEK+mKTkddKCGfeadHkR2CLr71A
	CCr8Xc+xCORTzo96683ahGk/O96VYizbzX+ZCHzvbWLczS/jO/e8r7mzdZynmt/BkII4XOv5ZikEj
	S780x3gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVryi-0000000BuAm-2w82;
	Thu, 09 Jan 2025 12:49:36 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVrxU-0000000BtxM-1uSw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 12:48:23 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-3022484d4e4so8528061fa.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jan 2025 04:48:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736426898; x=1737031698; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=h8hd6QQPe6WsmCvGJJcJ/fM8HdXFIRmyRc/10BLVlxA=;
        b=Q2aEe0/M+8uPRUD6G9wqEhE++uEnENYSUjAdYy9rB3/FqvmN+RDDzbi9NpBSHMQThX
         eTg2ijPBxL7dipEWnouqtb/J7JfLeLWbjM8hlBxmOugbZev+vyd4cYf8TFA8obEPmgsN
         AJKhTObOx702ZBf/0A5Nt+3VcGnHYAH04wsOzs6YovT9KyXZoW9xXqi16/8ENNE/FSmG
         ayCZsxEdR4/cFE5CkmSmPXmmruUSgnanlbZ3ac074HKAFlLBNyYGrtY7tCC+MvzjR35e
         IC+cP23rK/PGc/xvx4gR7QyR1QasBwm8Gq+Tcaw3zxaSUQyzSZwy3ZRf/7S8EpIzau8/
         YEow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736426898; x=1737031698;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h8hd6QQPe6WsmCvGJJcJ/fM8HdXFIRmyRc/10BLVlxA=;
        b=hbXVzEp/o9MK139X4u/fbB1TSx6UVF9DLubT3p6DCsaDkxayRzxuPhiqtwAC+ipGu2
         fA2aULfXaRknHpE+VpD+yUQo76lSZPi5p/VhsubuSlnSywLipdqDpR1fmRtWBL3ClzqG
         cyNa7eE0vedLbDkAAD30eHsJrMO+bEnmQC7qvjNDFtAy9rQc8SCX2htVVuY1kYrNMJuW
         zCDdiUL1FtqBFmSqC8dOm/pc0hY7rNzM6804MvVF0GUFC9RYEvkXyd0/LRH5MKOKD0uM
         saacGezLdddj86+fQSK3PkUKsAO2i+sGKYDZ5674vIvu/ZZcx3JJL4/SCZcoGJ6KRdEq
         B3Qw==
X-Forwarded-Encrypted: i=1; AJvYcCVfRQ1nuJl5xy1/Qr0fy8dp19cv9j1fJ+9d86R4rrfapF565HQHJg5998uyfZQJ0aVa2euim4vyt1ZhEqfavvwP@lists.infradead.org
X-Gm-Message-State: AOJu0YyQ+2U5ZOmyXbeChK8L9so1+LQyqQT0klonXzEpL0r1zCMw6pVp
	yIFTeRnQQA5iz0/ZUpxQ2RhMbnMPXHd+eCaYp/W08nQqgGxNaVMpuMmCg69CuTE=
X-Gm-Gg: ASbGnctPMuwAwqYP7j651FIlhu85yGT2a6YJN4fpykKvXrN0OsTLLeiD+DxBtqjUJYC
	rJHJxLmDMEMwghKn5AEDmDnLE8zhbYflPQQq6vd5ea8X2NKz9XWqdKeI0dCyDMYQCTdzPUyGymy
	Z761eyEhmJjJBdGUln0mMr0eF6mycq9HC9K00tVRTx6ywzbadvtlSuMevYZSP1+aSgka+ISnCXH
	dk/x4rByWZG/p6iscxjtn1wXEMOl7hfjA7BEDDeY3XKV3tv0Yl6IRbiTl4wKviCslT4RNYdlFae
	OKVJpxsB+IK52OB9qD7bVhULajkE/HBs4mDp
X-Google-Smtp-Source: AGHT+IFxJ3zGC3CDmY37DlIYBY9oRzAVUXgzKckNzpAHdg+Ck4ZfBSulYaV0hud+81kqukRgXfjP1g==
X-Received: by 2002:a2e:a7ca:0:b0:302:1c90:58ee with SMTP id 38308e7fff4ca-305f4571db2mr17630521fa.18.1736426898468;
        Thu, 09 Jan 2025 04:48:18 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-305ff1ec1a0sm1889261fa.105.2025.01.09.04.48.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 04:48:17 -0800 (PST)
Date: Thu, 9 Jan 2025 14:48:15 +0200
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
Message-ID: <d7zpv6qt52mhny54dejw4yqlp2k2c437op7qmepqe27pufplqk@64xvohrz7h2q>
References: <20250109032725.1102465-1-damon.ding@rock-chips.com>
 <20250109032725.1102465-13-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109032725.1102465-13-damon.ding@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_044820_805735_819CC5D3 
X-CRM114-Status: GOOD (  22.90  )
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

On Thu, Jan 09, 2025 at 11:27:17AM +0800, Damon Ding wrote:
> Move drm_of_find_panel_or_bridge() a little later and combine it with
> component_add() into a new function rockchip_dp_link_panel(). The function
> will serve as done_probing() callback of devm_of_dp_aux_populate_bus(),
> aiding to support for obtaining the eDP panel via the DP AUX bus.
> 
> If failed to get the panel from the DP AUX bus, it will then try the other
> way to get panel information through the platform bus.
> 
> In addition, use dev_err() instead of drm_err() in rockchip_dp_poweron()
> , which will be called before rockchip_dp_bind().
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> 
> ---
> 
> Changes in v4:
> - Use done_probing() to call drm_of_find_panel_or_bridge() and
>   component_add() when getting panel from the DP AUX bus
> 
> Changes in v5:
> - Use the functions exported by the Analogix side to get the pointers of
>   struct analogix_dp_plat_data and struct drm_dp_aux.
> - Use dev_err() instead of drm_err() in rockchip_dp_poweron().
> 
> ---
>  .../gpu/drm/rockchip/analogix_dp-rockchip.c   | 41 ++++++++++++++-----
>  1 file changed, 30 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> index 0957d3c5d31d..3ae01b870f49 100644
> --- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> @@ -124,13 +124,13 @@ static int rockchip_dp_poweron(struct analogix_dp_plat_data *plat_data)
>  
>  	ret = clk_prepare_enable(dp->pclk);
>  	if (ret < 0) {
> -		drm_err(dp->drm_dev, "failed to enable pclk %d\n", ret);
> +		dev_err(dp->dev, "failed to enable pclk %d\n", ret);


why?

>  		return ret;
>  	}
>  
>  	ret = rockchip_dp_pre_init(dp);
>  	if (ret < 0) {
> -		drm_err(dp->drm_dev, "failed to dp pre init %d\n", ret);
> +		dev_err(dp->dev, "failed to dp pre init %d\n", ret);
>  		clk_disable_unprepare(dp->pclk);
>  		return ret;
>  	}

-- 
With best wishes
Dmitry

