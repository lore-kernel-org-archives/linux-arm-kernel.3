Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87416D1D482
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 16:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dc6ScawRFQFrQUqCDUjRRKZdfrcmCO8h2beLP6+ws/E=; b=fmAKVUpan/9YSXNj91XHHWD9mx
	LEIxr7R1DpF3PY66wVVzp8bLA6Qy2W0gmQ9GjqUTFki98NWFbsNd3+0qn6lYtA84cy8MgBS0usG5A
	NAeESQcsotUIW2fo1ynZ6h/0ChojurmS5HNKSwSdVrskbkgwf1F2WOahlqiDezQcaDqDj5FP5xbe0
	aICGST30NNvzOwLlG/L/YaMwAAqTOAsgaDxfjHHlwDtTeV/nRbzysujzCrBACEu6mKGCDXw6uODqm
	FPtrqHmM3rN1gGEiVLadqm1s1esf76RVndc/OhWvDcjm9oJOS3MeGdjMUbH+FsfDJuON4vp8m8UlD
	oBTKuuCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdsu0-000000008p9-1057;
	Thu, 08 Jan 2026 16:30:24 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdstw-000000008mp-24GM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 16:30:23 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-432d256c2a9so496317f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Jan 2026 08:30:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767889818; x=1768494618; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dc6ScawRFQFrQUqCDUjRRKZdfrcmCO8h2beLP6+ws/E=;
        b=e/ADq6IOfJ7g9L5yrCELRjaNRUyLACK6GEnJAgOJn7t73x2Xn7M/Puu5KJOoLs0YRt
         ziKhCn8gejW4/98tqy7AcycsqQ4M4aIcp3/koxrXcL08V7lyy7d39cOlFcmsrb7N8qUL
         0mg5tcHk7ZToUUNsCZLqVTPUfl0gnN8T8QHYJ3Icx8Jyhp+xuT2+VGY3zDeFCSxZmcXU
         kLUYQhK7VKqBLcHZMUMCTk5K7c5mC/omWTLrquxfwz9KrGD7Y9dQY5uWhNxcVbiYlhl0
         bU0rfIbELBIumLzB910ZUW6yWNHQLzMmC99eSfgtvASBmlR9R2mVEnc4EUVS4cswVeVb
         2SRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767889818; x=1768494618;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dc6ScawRFQFrQUqCDUjRRKZdfrcmCO8h2beLP6+ws/E=;
        b=vhWd7sUFDABjDegf4mqjtugPa3YwgAMAU76uWGPvfJl03nqhR6M939YK3VWUtHWVKW
         6WV7g6Oxz34Y9lKcCnvwfv7Q6dG7dsfBlyUgpVwKvr1iKDgM7G0SNErC7tc3i7kioNh5
         xPhQatXpWkhttjycvjM6NSRnxvj0fzySANWuMruJvbxmgoPTeqKA4/Hh862cq9kgqzOj
         ilAH2FSsghuA70gjHJqRkj639OAtSpvS83gGp+OLeenluXhyRk4f4Y9+YG1pAKlP4aP3
         jHksRixfVORxDOLttdpYTPmTItpje9B5YQX13ukzv6+cvZPewEI6OnBGSw56w/R2GpNH
         nHSw==
X-Forwarded-Encrypted: i=1; AJvYcCURvfLBFRpxD71Ym8UkLfOF+RtS1WYTzrY4uBW0sCZ/ZuuZTFkZB3NWqXu2kAHDfXU9NezX+Y6Zb3NYelhM7xiE@lists.infradead.org
X-Gm-Message-State: AOJu0YztxE4U78j2m6SBtIUpLtFhMTUmkP2g8x6dsuKOyh2AL9gQiiuT
	iw3/v4MV7Ka2mz98tx9y7j24lK1gJ0Ql8fdxDn0wT566/m/V6jM1DaDO6U9Wyg==
X-Gm-Gg: AY/fxX6Ghuc/zhOr5rcXifTwyS5zKizp5qrHD5SkBuyLd5+vH+XWy8tKCBlGzwyyhgh
	Mtnn9cy8n5+MwQK1ChwUCtQ7WLflIxN7IsQz0V36Z/nDr3ciPViWl9Qqkfs3geTvMvY6w5AJ72m
	dr6D6VT+8fEKbLQL7b8c/zdFt0lPYGzR+aNx1t3TDmSKFIfue6htMnIFFgmOQFETmGIwYM3/n28
	UPmYITk6xplG7qd3VRprAmXLQ3BEafnnXzvtPYoLd//efYk/1VK9gDVoAYcxJpzct8+Tgy7VyFq
	OoAUcBHXR0JEz6KRBdgfxPaMTRc7XrbCkeyaWiBjrEuW2MwoX+5FEb0zt4pftND1dqrc6EQ9Ydg
	Lgt9w1qVh0vzTECqVb87kPXVWQ0RMrTNnf3g/Cg066bf0TxD1JNRhgKQw9YVtTIDcoAorpKHli6
	QAgDQNTsXnrL3Snlk=
X-Google-Smtp-Source: AGHT+IE4SajyDnRk2hr30qLnG3Fcgl62hbDw/YtWLnVk7GBUPLY+eK+cM4NcwzeY7S/EvSNq+LiWyA==
X-Received: by 2002:a05:6000:1844:b0:430:f7bc:4cf1 with SMTP id ffacd0b85a97d-432c377422amr9188459f8f.26.1767889817727;
        Thu, 08 Jan 2026 08:30:17 -0800 (PST)
Received: from owl5 ([2001:861:3201:3d10:f038:1f4:4b8b:647c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ee5eesm17365651f8f.34.2026.01.08.08.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 08:30:17 -0800 (PST)
Date: Thu, 8 Jan 2026 17:30:15 +0100
From: Gary Bisson <bisson.gary@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com,
	simona@ffwll.ch, matthias.bgg@gmail.com,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: Re: [PATCH] drm/mediatek: mtk_dsi: Add support for High Speed (HS)
 mode
Message-ID: <aV_bl8c3tMpih9s_@owl5>
References: <20260108101959.14872-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108101959.14872-1-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_083020_527789_AFCF494B 
X-CRM114-Status: GOOD (  13.44  )
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

On Thu, Jan 08, 2026 at 11:19:59AM +0100, AngeloGioacchino Del Regno wrote:
> Up until now, the MediaTek DSI Controller has always been working
> in Low Power Mode (LPM), as this driver has always ignored the
> MIPI_DSI_MSG_USE_LPM flag hence never setting HS mode.
> 
> In the current state of the driver the only thing that is needed
> to add support for DSI High Speed (HS) transmit is to simply set
> the "HSTX" config bit in the configuration register.
> 
> Check if flag MIPI_DSI_MSG_USE_LPM is set and, if not, set HSTX.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Tested-by: Gary Bisson <bisson.gary@gmail.com>

This patch was needed for the TI SN65DSI83 DSI to LVDS bridge to work as
it requires HS mode.

Regards,
Gary

