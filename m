Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DC28C02182
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 11:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6GV/GI1CAs1idJHC9goHRl9dRjKhZ5TZhhQYyHtO4m8=; b=p3Kw6VxEygpUxic/96aUDRopYA
	Vz5UN9HcGvpw2+hQeG2TGH7dCqDrxYQuCysNnzI+JdKKTtJB3GayjcOLD0jjmQN3Ylcg+U/op+O9y
	R+4SWUQKIjTvo0rOs7XUwTmDX6x8sODp7VdACJf/H/hC/XJH213v8dFkNhAU7bLIhmZwFu/x62qdw
	1xe8UqxA+RZdVKJmtKb+hALhndOp1F0unZ8LfSGDQFlVGTNp6bEq+Ctzqu63wzFxLs3Qn9HxA83Jr
	69F71AKJ+v+JjCcKnE3GZVw4B/R/5U7Id4Hsyu+6NquK/EADzmLc0Clocl2RWu0Ut6bqp7obOzKwN
	JHmhIvFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tavSG-0000000CLC5-2Zmw;
	Thu, 23 Jan 2025 11:33:00 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tavQz-0000000CKrN-0brQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jan 2025 11:31:42 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-53ff1f7caaeso884466e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jan 2025 03:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737631900; x=1738236700; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6GV/GI1CAs1idJHC9goHRl9dRjKhZ5TZhhQYyHtO4m8=;
        b=pyLdNqsyAMGUfYHBcaQNevOhU733kvPMGcO7RvAmNJC2aEu3TVNiYd+DzRBMa2CTEx
         QfDgN9sT6KWpsrjU7AWX2CDFp1YrzBw5IU3O23GutAMYpPrzDK1eNjwpi+DSsEtIV2SQ
         tff15H0xDOmTf/1p3BXDTyNdFZgQS1MsU8g4W9cSYqRbartNv4lRIHsilh67e6H1r+rM
         g8pNh/C8fjltkVzd3Un2npfaVH+zwZ8jQxwMlufhRhMgX6pg3i3m0YnJuMFRl9ozE3Aj
         2tzZrdVK61jKkks6vjxEN51YOkAijwU2Y2SvcPR7CPgabUoYpwNoCzNt9DCtWxb3hkJd
         7zAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737631900; x=1738236700;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6GV/GI1CAs1idJHC9goHRl9dRjKhZ5TZhhQYyHtO4m8=;
        b=Gx2QkZyGT6jc9YeZQvsYWEOWYzPfwbFcV8t14Z9VEPB2QAioz+MVRolglHsxMNC+Ng
         gQcEzZCGXaB21nLZQd/+Vgj8XibdFOrunkYK9oUXTUsQv2pBvKke5Z/z3PjdCW0E3kdk
         VEHB8XJ8+c2KOupQG08tR84xpvOywFEsnXNPZtYMOcCdSzlKXC+jO8dCbM6yNJzVl2Ez
         cDjAzdcU3cMMCY6aJDZv5uNDmYi6rEFgdOTCtnpqmnokwgLqNnmYpc5mkM987u8FqMsQ
         zVf5BCwMPNrXyAzuFVhIUfAI/tlDf/qqmlPV4Uqup1x9P0FQFGW0xgjSN4wGVUSCq3bp
         nQvg==
X-Forwarded-Encrypted: i=1; AJvYcCUQjVtb22wb/IdC9UeBft87eitUPXM3p5D7rFoGE3Od8pufk1+XR+8xQIK/Cz9sZYveE3xbOCnwMXzK5Yy3J0ZY@lists.infradead.org
X-Gm-Message-State: AOJu0YzgsohLr4Votudgtn8YhLVhrn047a/xSPRkySgNucqf7xbTwI1I
	D5jwhCJfjnbfgJiMXi1vXJXTJGHgkNH8kFDdTIeWnCQyTjb/cmSWq0UxzawRkYTnbyH8MDyF6v7
	H89k=
X-Gm-Gg: ASbGncu+nfkjhfG4oTtR8qJ+GvKqDeotScwepKlUhe6Q42XDJq1nsb9wCVa7V1vPkqW
	gdMc8apBs7dnBDZjuioaiNguYKsaP31/Xcx5+ngnMMg9ZZfiDuEoxl6F93uKEx8oEOqstp5oVut
	2BusSmEGjQ51ly8nM4N6v8E7krchoUtVP7V7P/PfyYFR0MWRBomrFCq8dY6zSQLvnEQuj9lQLEn
	zB8pGr+m13po4/cA8Wi/fiM8HEetlBD9EXo/iMreTkZ5NYakM9hRKxvhYKEQh87NsIMy3YiWgje
	mYqsBndNJxCWCFj1X9T1lFASD0AOl7swnRFaW562N2TMLdZ5mhCy+u5KcCqi
X-Google-Smtp-Source: AGHT+IHtXPZP5fXc+jx9qkDw8OG65Yz52T0nmfyDaHj9u5aH3nN5zjNMvgxVC7Tag6Djcezn71sacw==
X-Received: by 2002:a05:6512:483:b0:540:1b2d:8ee1 with SMTP id 2adb3069b0e04-5439c21f2bfmr7480684e87.11.1737631899528;
        Thu, 23 Jan 2025 03:31:39 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5439af7a281sm2612994e87.259.2025.01.23.03.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 03:31:38 -0800 (PST)
Date: Thu, 23 Jan 2025 13:31:35 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Damon Ding <damon.ding@rock-chips.com>, 
	Douglas Anderson <dianders@chromium.org>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, rfoss@kernel.org, vkoul@kernel.org, 
	sebastian.reichel@collabora.com, cristian.ciocaltea@collabora.com, l.stach@pengutronix.de, 
	andy.yan@rock-chips.com, hjc@rock-chips.com, algea.cao@rock-chips.com, 
	kever.yang@rock-chips.com, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org
Subject: Re: [PATCH v6 12/14] drm/edp-panel: Add LG Display panel model
 LP079QX1-SP0V
Message-ID: <rwn3g7tqgjnc525cjqtivgfgedhooiayn5nujng7bdzazgqhle@wfpuvoyr2tii>
References: <20250123100747.1841357-1-damon.ding@rock-chips.com>
 <20250123100747.1841357-13-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250123100747.1841357-13-damon.ding@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_033141_189301_253CE987 
X-CRM114-Status: GOOD (  15.81  )
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

On Thu, Jan 23, 2025 at 06:07:45PM +0800, Damon Ding wrote:
> The raw edid for LP079QX1-SP0V panel model is:
> 
> 00 ff ff ff ff ff ff 00 16 83 00 00 00 00 00 00
> 04 17 01 00 a5 10 0c 78 06 ef 05 a3 54 4c 99 26
> 0f 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 ea 4e 00 4c 60 00 14 80 0c 10
> 84 00 78 a0 00 00 00 18 00 00 00 10 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 fe 00 4c
> 50 30 37 39 51 58 31 2d 53 50 30 56 00 00 00 fc
> 00 43 6f 6c 6f 72 20 4c 43 44 0a 20 20 20 00 3f
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 8 ++++++++
>  1 file changed, 8 insertions(+)

Please use get_maintainers.pl when compiling To/Cc lists. Added Douglas
to CC manually.

Or, better, split irrelevant patches to separate series.

> 
> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
> index f8511fe5fb0d..77e3fd3ed160 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -1808,6 +1808,12 @@ static const struct panel_delay delay_200_150_e50 = {
>  	.enable = 50,
>  };
>  
> +static const struct panel_delay delay_50_500_e200 = {
> +	.hpd_absent = 50,
> +	.unprepare = 500,
> +	.enable = 200,
> +};
> +
>  #define EDP_PANEL_ENTRY(vend_chr_0, vend_chr_1, vend_chr_2, product_id, _delay, _name) \
>  { \
>  	.ident = { \
> @@ -1955,6 +1961,8 @@ static const struct edp_panel_entry edp_panels[] = {
>  	EDP_PANEL_ENTRY('C', 'S', 'W', 0x1100, &delay_200_500_e80_d50, "MNB601LS1-1"),
>  	EDP_PANEL_ENTRY('C', 'S', 'W', 0x1104, &delay_200_500_e50, "MNB601LS1-4"),
>  
> +	EDP_PANEL_ENTRY('E', 'T', 'C', 0x0000, &delay_50_500_e200, "LP079QX1-SP0V"),
> +
>  	EDP_PANEL_ENTRY('H', 'K', 'C', 0x2d51, &delay_200_500_e200, "Unknown"),
>  	EDP_PANEL_ENTRY('H', 'K', 'C', 0x2d5b, &delay_200_500_e200, "MB116AN01"),
>  	EDP_PANEL_ENTRY('H', 'K', 'C', 0x2d5c, &delay_200_500_e200, "MB116AN01-2"),
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

