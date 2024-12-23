Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFE95E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Dec 2024 11:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oAg0zQo1HvAo0iqaanIJTGGSdxrt4g4lbpXT4Fzk4t8=; b=IHd7sPDiBODeCyB+xy1gfPp9i0
	DMeOczS4yM7NZLjeIXLT0f6RF495E4DQdXMgXfEoUZp5ddFsY7CWuzwXUSu5UXNRJP4QCR/S7p07q
	LNWsu6Ju8Oi4w0sVRv1QTwgjb4K6rdvoG7bCYtGBloZ114GHNg0svQXBbQxMFGbj9BbEpZggFxnwm
	Y0gktdlTNmTyMOUUHUwiDX3HLCpVR4BQliuPX4/HfWDTiUDYJ+CYtmne01xCOGpWi7MDX9q2Y8dyT
	vfFN+YVqu+ZV0xKOSj7XKgb5adzbz62poP6wN6c6VgzAkeIqFDgRC0bgM8NL9K/va312pQLAXerLM
	xD6uf+ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPgZN-00000009tfu-0C3l;
	Mon, 23 Dec 2024 11:25:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPgR4-00000009sYb-3BUW
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 23 Dec 2024 11:17:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=oAg0zQo1HvAo0iqaanIJTGGSdxrt4g4lbpXT4Fzk4t8=; b=EqDhhvQIO8VrTSvL1gOFccuGgn
	6YKjbeLvqGd32pkYQR48Dc3+7y7/pknWlD6Vi109rGLs6wzJxjyBFCGCFSZfoITuq1inXv9be1dJq
	8b3V4OyCxuxHuB7r3h9PyqgCQhzzGesyL6oeyk7I62hKugQW/cMya8ReZ/H8tge8S2JYHHSD04JYr
	3Up+wBqefazl+6MFG0Md9GtheulOcdJPfVa9ntcItSDWaZQj/RGdZAh6dMtbm/bXobl4bzUPdsfYu
	UXfxMTX8ZgQiR72Ugc1gCtBSfneEWh4W2t4Rla9M56FhLSz7Na2+CMS1rPaHNxqCcB+PmPuqA5+Ch
	UBL8rsPQ==;
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPgR0-00000006KSf-3Ief
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Dec 2024 11:17:17 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-54026562221so4345911e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Dec 2024 03:17:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734952631; x=1735557431; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oAg0zQo1HvAo0iqaanIJTGGSdxrt4g4lbpXT4Fzk4t8=;
        b=yEketbYSIWub3wqsHKpLOoXflntOe7Fsk/hHvOMKrgkn1XJUW4Kq2tHKiwlmmD0HvY
         c84Jk1cwYmEsytNB1y95TqJdSxB2mkic+T/FvXihaXcJW679XOYkBs1LjJgb6XuF17ZU
         k18+qtu48IhTbK+0Ecw9pCTpKiZaU1QTo4jXv9YV6oYMppJGqvzz/sPBWejQ5iJSVkNt
         oUaqoHfcmNjBbuycNT8aOESnlc2HQMGbgB657sd7woHzH0mN/LPn5lKKtfMu0U6aGaR+
         oz4exmUboDkL4PeNQjMhxVXrKhWCtAuKEvpkfX6m9pp0JVzSvsJXayscKJUrkRjpf10r
         kMaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734952631; x=1735557431;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oAg0zQo1HvAo0iqaanIJTGGSdxrt4g4lbpXT4Fzk4t8=;
        b=eU1LCoDRKMSTJf87Y2Gl/4dB95yeg0fXn+q7AZD+v9Cqf1eKXZU6nq2ZSsEQUhFxqz
         hcLiRIBADzF/72U4bXb+1n6oHqQWjaUEOizHOwKEvHkMZ8VrVe8KnU+MjyDqdZFcKwVK
         aYVoKd2eOpqszky7y4zZI3C48zPusas33zDriSIV/8BllxbJW1CtdOGvTrk2dW0mPaGC
         BXaStFspl27pb7dRk6cfpD+OieTGVL+ZIwAa00b9visZ4Luh9CXAVhsJhmy3JV1w+X7B
         yD3bsrG7B8Zn9/gTd5Sj6LcbNU3D6pANayFudU/pLq5zhUoY06iUQzCgHglZggJfW9ub
         mvpg==
X-Forwarded-Encrypted: i=1; AJvYcCXLfNBziCRL1cjz2/ZGlwuN7jAree+IKrO1gw0Nc6cX2CdPe+RvXFSn292STG0F6ON1mG6ou+x1OO1TwepqqX0g@lists.infradead.org
X-Gm-Message-State: AOJu0YzfkDjDpOOmyS1qamskk3qwMehT4bAv/8aR99u6heO/7dNwUaMw
	V1aQOoS0T7r1wR8aFEPS/Fq2BGWWDLF1XESFLkJK1MDkuIBjg9FAlMQeBZ9EBss=
X-Gm-Gg: ASbGncs85jxcypP++VCG/lYmwjSVEnBsgzvgp7WCVFSZa5f/nSrPXjxdZ4xEw1M7pBt
	RwCsMvSeOrswLsgcCa7S4LQdFI2PamCmE3oPhjIdiwqxE5D2bvRiDa01bi2CVJAASiBIm0cT6BV
	v/1bV2l/TXxO9WLSyGYt1M9D6NXNAjm8dNu7DpQ3oYzqlJQ3HT+PO3JphfGq95Nq+vt4MhYS+AQ
	j24o9jEZuwHOwNVu1liwlYvMBqPxeY+hsoEN/NrN9DlLMyqN+2xO5UCLS7SjNxXUM9811ZFNe7f
	F3UO1tV30yKkEMEaH4sTi7s38L4WIjudiHpe
X-Google-Smtp-Source: AGHT+IGwOxJn54Td8r+NyaqARiydob0173z+5mppR6r0JXqtqFfPSqJJa2vifkVmQItUKQ/aSDHrlg==
X-Received: by 2002:a05:6512:39cc:b0:542:250d:eefb with SMTP id 2adb3069b0e04-5422955fd2fmr4096765e87.41.1734952631337;
        Mon, 23 Dec 2024 03:17:11 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223825f48sm1244622e87.225.2024.12.23.03.17.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 03:17:10 -0800 (PST)
Date: Mon, 23 Dec 2024 13:17:07 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, p.zabel@pengutronix.de, 
	airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, tglx@linutronix.de, vkoul@kernel.org, 
	kishon@kernel.org, aisheng.dong@nxp.com, agx@sigxcpu.org, 
	u.kleine-koenig@baylibre.com, francesco@dolcini.it, frank.li@nxp.com
Subject: Re: [PATCH v7 11/19] drm/imx: Add i.MX8qxp Display Controller
 interrupt controller
Message-ID: <6eg5ahmcxfvwzoybqqcksqergoeu5ivsqshfjjmotwe6t4brge@aahohpjlfqic>
References: <20241223064147.3961652-1-victor.liu@nxp.com>
 <20241223064147.3961652-12-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241223064147.3961652-12-victor.liu@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_111715_013956_7EB536F4 
X-CRM114-Status: GOOD (  17.02  )
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

On Mon, Dec 23, 2024 at 02:41:39PM +0800, Liu Ying wrote:
> i.MX8qxp Display Controller has a built-in interrupt controller to support
> Enable/Status/Preset/Clear interrupt bit.  Add driver for it.
> 
> Reviewed-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v7:
> * Fix regmap_config definition by removing name field, correcting read ranges
>   and setting max_register field.
> * Collect Maxime's R-b tag.
> 
> v6:
> * No change.
> 
> v5:
> * Replace .remove_new with .remove in dc-ic.c. (Uwe)
> 
> v4:
> * Use regmap to define register map for all registers. (Dmitry)
> * Use regmap APIs to access registers. (Dmitry)
> * Use devm_kzalloc() to drmm_kzalloc() to allocate dc_ic_data data strutures.
> * Set suppress_bind_attrs driver flag to true to avoid unnecessary sys
>   interfaces to bind/unbind the driver.
> * Take DC interrupt controller driver as a standalone driver instead of a
>   component driver.
> * Replace drmm_kcalloc() with devm_kcalloc() to allocate an array for
>   struct dc_ic_entry.
> * Call platform_get_irq() from DC interrupt controller driver to make sure
>   parent interrupt controller driver is probed first.
> 
> v3:
> * No change.
> 
> v2:
> * No change.
> 
>  drivers/gpu/drm/imx/dc/Kconfig  |   1 +
>  drivers/gpu/drm/imx/dc/Makefile |   2 +-
>  drivers/gpu/drm/imx/dc/dc-drv.c |   1 +
>  drivers/gpu/drm/imx/dc/dc-drv.h |   1 +
>  drivers/gpu/drm/imx/dc/dc-ic.c  | 282 ++++++++++++++++++++++++++++++++
>  5 files changed, 286 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-ic.c

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

