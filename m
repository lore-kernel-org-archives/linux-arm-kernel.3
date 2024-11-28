Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63314D69113
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 14:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xA8QccDB7jDinpTszrKQcVtNkmKlzXFjmJDa5bO0Mmg=; b=vxBocvgNVbM+TlA3DkHv8Wn+Sk
	/pQzix5PF1Yz+7/Q2a40fPMJISbTOEvXYLfG96hpCA8WjacBFlXCDEFj14GqUZ/cQLK3Tmr6svgUg
	cl+Fs5P2mGoft8rSR1sa0FiNNnI74/k7ifAosgh/Iu2dkXdPOdsvXScVrqdlSPivcXl1ec9HIbOku
	HhuouKm0rengBRnN8wd/kaySosuppIHHwwAtd07KwX4DDbdqGGuQL78Ai8nsqZyDirjFsxtpar3U+
	RB0QCkb33yirisJUKPLEZ41aNND1HuFmC9KPSYwF+ibkETj5jsxS7ZuPooJhHH2xRlNuZ9e31OQNq
	uh5I9G1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGfMl-0000000FkIj-0z0Q;
	Thu, 28 Nov 2024 14:19:35 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGfLm-0000000FkBu-274K
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 14:18:35 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2ffe28c12bdso4997831fa.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Nov 2024 06:18:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732803512; x=1733408312; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xA8QccDB7jDinpTszrKQcVtNkmKlzXFjmJDa5bO0Mmg=;
        b=ghFTctlgUrOBXrGO8g9HduiQPyZoSnjKXYjGAj7fvoJvFpOcsorseYjmF+7ScYKQ32
         YJUfUHcwvrrbXKDdmrOcUv8YLxmfXCXRpMSmZQblTH4eN2RRSLVbk6hiQSzgzyp0yv1l
         VfdTR1CztOitzFOmb47gUoMPEmpRk7rl75eYiOBOuLJKX11AmE+557LY3SKHbIAI4CA6
         ZRuGgoK8AZHT2bSsd5MEaJK35On4oK4HWyxtFPFiACNkutJhm1j0CBZqsQo+8iJu77R+
         P7SZfDryTuLrpAlrHHLCf30lcQEYIN8SYKJqi0CSs6nbn94cBcp8dpHauzG82i6xr9uI
         xeCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732803512; x=1733408312;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xA8QccDB7jDinpTszrKQcVtNkmKlzXFjmJDa5bO0Mmg=;
        b=O10g+JkrBX6aJImrYdPjPYUshL0MMcLNEQriqDUTF4grQVocahd3rgViDhpfGzYDK2
         JxVrHMI0XNyabASOSO56f0c9IrMirzP5rA2NTs3UR8QsHuvEtQsGXGoR+wWHo9okx7KK
         3fnt1Ji/ud+3gs3k0zibry8Y9Mf05WuZzTzTl1PpfjbvkxHQ9gEZpHDvSkKsAUrkgfCl
         bXZx9UUUri0FWvDVBgcVRaUL3dRpjRJAewAU4YYDv3uh2TqTRjcwRN4ITTuJpLxhyywb
         /YtIT+0O0BcXUdUWnPk/JujSV0VMPAGlcl8uFi83C09HKS3oTj8LEC7ByWJFECNIDk63
         +rMw==
X-Forwarded-Encrypted: i=1; AJvYcCV6/5J6aL1vLSfNkeB07Km0yL6zuZof/P04FPPuGVLIZ/uvaXqQjoGlNVRycMZVqe/KjSEFtA47HsUb3U4L/o02@lists.infradead.org
X-Gm-Message-State: AOJu0Ywk0deF0W5xF6H/g88vYSSOR3C7+7/7RqWXLUQgWC2QQzAVuqEV
	3GRIpazWXf61ga7E3vPwbEdmtz4+UgJmHa4RCvCOyyhze+1p1nkpXNTf9C8WZj0=
X-Gm-Gg: ASbGncvXpVFfNLzdx/qfqbBMB8Oc8bVRJ0E6KRm3Gq0qPYATqrPuDVvumI+/bmazD4c
	SxBcLSWY021Uii4p1+NHJbmvgnYX6eq6ALTxlpjIBr667a35TREmympR/3F7qm54rlKasZ0JbUt
	fnG0T6WJ263NUwQZxya7BLFKDY+CEww8Q8NMNO1wrWnj8NPK6tBaJzaptJaOOj10A0URA7C4byR
	x6YGr5X0bKJgw3YQTxOIC3uVd/c5pj+VXo7RyzhDdAcR7Yn2nZ91aEZpViRkn9syjqv7YKuzIdO
	mveC0hI2BX/PinTbEcHFLlVMC4tFSw==
X-Google-Smtp-Source: AGHT+IEWrfuUcnXV1iqJHqdNEOSGIK8M6/LbygKUp+v7qqACcol4zNxR8qGEVUdI0pmwpuF4EUOzaA==
X-Received: by 2002:a05:651c:887:b0:2fb:8920:99c6 with SMTP id 38308e7fff4ca-2ffd604fc7fmr46439611fa.23.1732803512212;
        Thu, 28 Nov 2024 06:18:32 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ffdfc75452sm2022861fa.85.2024.11.28.06.18.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 06:18:30 -0800 (PST)
Date: Thu, 28 Nov 2024 16:18:28 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Sui Jingfeng <sui.jingfeng@linux.dev>
Cc: Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, p.zabel@pengutronix.de, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, 
	simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, glx@linutronix.de, vkoul@kernel.org, kishon@kernel.org, 
	aisheng.dong@nxp.com, agx@sigxcpu.org, francesco@dolcini.it, frank.li@nxp.com
Subject: Re: [v4,09/19] drm/imx: Add i.MX8qxp Display Controller display
 engine
Message-ID: <kixewphwyawbyrfu6pxtqx5fywqmq7ms2sa5j5pzogetmebcjz@ouhpohk7twbc>
References: <20241125093316.2357162-10-victor.liu@nxp.com>
 <c4334c9b-833b-4923-8188-64d662231512@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c4334c9b-833b-4923-8188-64d662231512@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_061834_532670_CD3E2B24 
X-CRM114-Status: GOOD (  18.91  )
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

On Thu, Nov 28, 2024 at 04:46:53PM +0800, Sui Jingfeng wrote:
> Hi,
> 
> On 2024/11/25 17:33, Liu Ying wrote:
> > i.MX8qxp Display Controller display engine consists of all processing
> > units that operate in a display clock domain.  Add minimal feature
> > support with FrameGen and TCon so that the engine can output display
> > timings.  The display engine driver as a master binds FrameGen and
> > TCon drivers as components.  While at it, the display engine driver
> > is a component to be bound with the upcoming DRM driver.
> > 
> > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > ---
> > v4:
> > * Use regmap to define register map for all registers. (Dmitry)
> > * Use regmap APIs to access registers. (Dmitry)
> > * Inline some small functions. (Dmitry)
> 
> 
> Why?
> 
> Its seems that the switch to regmap APIs is not very necessary,
> as ioremap/writel/readl are simple enough and easier to use.
> 
> Isn't that this just introduce an intermediate layer? It's okay
> for display bridges/panels that behind I2C bus or SPI bus. But
> then, why drm/msm still haven't be converted to use the regmap
> APIs ?
> 
> Just a few questions, has no opinions to your patch.

Please respond to the original review comment. Then we might be able to
discuss if the suggested change was logical or not. Discussing changelog
doesn't make sense becasue there is no context here.

-- 
With best wishes
Dmitry

