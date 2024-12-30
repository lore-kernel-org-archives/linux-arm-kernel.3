Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CB95E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Dec 2024 13:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q5prvbL4qVVxyUau/62tjpzq6Xjuv+m8EjzcAcEKEz4=; b=bKbQx8Njv9DB2mG6MYaoF+Iacu
	t88kEdFUDeVfw1y3wC8PJt75xcsNbaeDK+9X+Kn+TQroQYG0nbQXkUKwF6pRHzjJEB7mmnRTLmEKS
	8wPbRbx3VulKaRgKnv2M2TlolKbA6uM+CUK1KQr0ItAYL32zaGjB+lu6uTkZQHTMscES1zEGN+AWc
	xREM+VVnCGR2CYYweIsFJyak76utOnID94At1V7MdEfoUh+oMpRK80l1AHE3szyln6mulOUVBwF+1
	RvCuxXzq3XWvOnb4sLUlRZihL0fmkwrqRIhtqKbw54ox0WZR4MCn2sKMKAO05tczh4hV3/v52pirt
	D0YCKkGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSFwx-00000005HcW-0oRN;
	Mon, 30 Dec 2024 13:36:51 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSFvn-00000005HSi-3fhB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Dec 2024 13:35:41 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-5401be44b58so9690004e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Dec 2024 05:35:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735565738; x=1736170538; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=q5prvbL4qVVxyUau/62tjpzq6Xjuv+m8EjzcAcEKEz4=;
        b=DcwZyxZ+t3kDotT68wIz0t2E6Ko9xPxX9SZDhBCayv05E92Y4mAgyLz3RihW2ur42L
         jKyai7DAJbbB7UY8Nr54SHJv6F2xr9Z06Uiae8asJC4DiI751ylVFqvgQkaNvlcje+kn
         CQ4NUa3QKlTknhgMy4BmRsT77hCyRPwWOZTUqVDXTIi40pNV5J+sjTot7vLMT6EdXkIe
         Ahb/RBTn9XZwyQlAnp7GFW1LuVWe8S7pIpgtGvQGLrd8Ig0wynMTaIP/VqDzlQl3VnHK
         cd7o5owsi9hCEx36nIe3HbYHNGkuzi1Fa9i/+hAObk5AfEZRTr0R2PA2F/Ravm+rA6ci
         rnbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735565738; x=1736170538;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q5prvbL4qVVxyUau/62tjpzq6Xjuv+m8EjzcAcEKEz4=;
        b=ddGURFTCuW2tLgdsvZXYApRiPd+GH29OFI6RBLLYhOgVS3N0WOe5EQICZixR/O8svX
         8qQsKKEF45GdtojWInZW7tOO9MYmSQm3mQTvukBvKFpwcTiXEklo4Oespgq2WTzQtq0Q
         gpQSWyfrZs08nKDdCF3xZ/me+tpQDwLaTMbMw0mYZKtqwrYVaNV/LNORNDN2B95xr/zY
         QbgnFDe8tm1X1gTEFtFvpVvqekV+07Whjxblkf5y2Cpv5WwBFYyPEPTCSQXC5X+55S+e
         bpyJBYJdIZ7MR/HPg21mTfzam7E+HhJ1nPrXaf8lEyBuSf/cQW/8eJA0dr3MnQH3KvBE
         szbg==
X-Forwarded-Encrypted: i=1; AJvYcCXwZsEjToB+WW3hyOEw8UtLqcnaoipHAxPFoKPOVuxva9BBBO3TgTNV8WNlWQmO0NHFsGskWJbO3caDixru8CgE@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5w1NGlnkxzK8+emCFeMT8MV/C1RFz+VNKzYl1fukV/ewYk+CK
	WFNMutrHIXnWBStyTy6dm4M7DYGKGyqvhz2TuOx9UapQ+WLcuhf6HrXz3Hkpa4U=
X-Gm-Gg: ASbGncvBuWlXkxJiOwpx6OHI84KcbIOGKon/2+saklZYyB2v8ba+oIFvWTf1bLG4H7r
	fIqTI2mvaAllvP6GIwLfg5kLA9ESfPfawvfXuaCRGBxP+n2hvfHA0UgPZSmZj9FBFAwHNZ8t/ND
	IcdE2mJCjFXZqOj98nYEJVuyvmyHjcaGgUA9EBzrKKx4KlR2FAlY+2UUWJym1pa1Gyv58DNSDbX
	ZYjGBKKPh7Y8c82JQPMaxbKOrUc2+TwjPJatUf3pjYp4tLQGe32Xj+wLospOiPTqoOUffACxYgR
	1pd5HuC+Oj64VhCioo74sYcAi8o3vQe0RE/y
X-Google-Smtp-Source: AGHT+IGYRhZnLXNmLM+FMzz0ZpamPsZkQchJSYMBUnIzcz5KdEvg8k8tQLs0cvWfBZIvHDrkMU6Dow==
X-Received: by 2002:a05:6512:3ca8:b0:542:2a20:e694 with SMTP id 2adb3069b0e04-5422a20e73dmr10688219e87.20.1735565737587;
        Mon, 30 Dec 2024 05:35:37 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5423e0662e3sm1661166e87.188.2024.12.30.05.35.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 05:35:36 -0800 (PST)
Date: Mon, 30 Dec 2024 15:35:33 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, rfoss@kernel.org, vkoul@kernel.org, 
	sebastian.reichel@collabora.com, cristian.ciocaltea@collabora.com, l.stach@pengutronix.de, 
	andy.yan@rock-chips.com, hjc@rock-chips.com, algea.cao@rock-chips.com, 
	kever.yang@rock-chips.com, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org
Subject: Re: [PATCH v4 13/17] drm/bridge: analogix_dp: Convert
 &analogix_dp_device.aux into a pointer
Message-ID: <e52pbjnusvuoqiyoorjr5msrfmgeqs2jt5sk6zcesvzy7cszzk@fzrtpsjoklgu>
References: <20241226063313.3267515-1-damon.ding@rock-chips.com>
 <20241226063313.3267515-14-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241226063313.3267515-14-damon.ding@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241230_053539_904880_F6EFFF09 
X-CRM114-Status: GOOD (  20.63  )
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

On Thu, Dec 26, 2024 at 02:33:09PM +0800, Damon Ding wrote:
> With the previous patch related to the support of getting panel from
> the DP AUX bus, the &analogix_dp_device.aux can be obtained from the
> &analogix_dp_plat_data.aux.
> 
> Furthermore, the assignment of &analogix_dp_plat_data.connector is
> intended to obtain the pointer of struct analogix_dp_device within the
> analogix_dpaux_transfer() function.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> ---
>  .../drm/bridge/analogix/analogix_dp_core.c    | 92 ++++++++++---------
>  .../drm/bridge/analogix/analogix_dp_core.h    |  2 +-
>  .../gpu/drm/bridge/analogix/analogix_dp_reg.c |  2 +-
>  3 files changed, 50 insertions(+), 46 deletions(-)
> 

[...]

> @@ -1127,6 +1128,7 @@ static int analogix_dp_bridge_attach(struct drm_bridge *bridge,
>  
>  	if (!dp->plat_data->skip_connector) {
>  		connector = &dp->connector;
> +		dp->plat_data->connector = &dp->connector;
>  		connector->polled = DRM_CONNECTOR_POLL_HPD;
>  
>  		ret = drm_connector_init(dp->drm_dev, connector,
> @@ -1535,7 +1537,9 @@ static int analogix_dp_dt_parse_pdata(struct analogix_dp_device *dp)
>  static ssize_t analogix_dpaux_transfer(struct drm_dp_aux *aux,
>  				       struct drm_dp_aux_msg *msg)
>  {
> -	struct analogix_dp_device *dp = to_dp(aux);
> +	struct analogix_dp_plat_data *plat_data = to_pdata(aux);
> +	struct drm_connector *connector = plat_data->connector;
> +	struct analogix_dp_device *dp = to_dp(connector);

I see that Analogix DP driver doesn't support
DRM_BRIDGE_ATTACH_NO_CONNECTOR, but at the same time I don't think this
is the step in the right direction. Instead please keep the AUX bus on
the Analogix side and add an API to go from struct drm_dp_aux to struct
analogix_dp_plat_data. Then your done_probing() callback can use that
function.

>  	int ret;
>  
>  	pm_runtime_get_sync(dp->dev);
> 

-- 
With best wishes
Dmitry

