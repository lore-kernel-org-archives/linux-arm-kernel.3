Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBFD8E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 03:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5FmDRLFpz5VQYbAEJQmse1pMniexgMfpHZTjVy2AVGc=; b=4SQHnp8o0y7N7wtlMQbJOyS2Rz
	+yg9Jemxi9MtAKooQsOWd1ld3UJcRMsLNKcdE5vMD1/6sbw/p0opjgzEHHArNKc0bU2T4mcJVcHDu
	ZJh1jZfNVJ0Gy25DNOqMFWiRSqJhQ8uYJ818XWwchl5YiigYVq1mnRM686QxR0w7LawpNDI20zus8
	86mEuqjnSHa1L/ji2rht4GXFBamccvu2McQCHw9D7LhrMVfVBmHvW/kxaa9ASmPMNttRumAO63dVy
	ZVutJtkdTNWoWdEFKnLqlDNsiUGdrB5mLRwQk5Mykkp74A/cn5iueF1nNjC2+bdT8MGGaexwHNOlK
	GwQU/W5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTBsY-00000009etN-1D3P;
	Thu, 02 Jan 2025 03:28:10 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTBrM-00000009enX-2KPH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jan 2025 03:26:58 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-53f757134cdso12086020e87.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jan 2025 19:26:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735788414; x=1736393214; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5FmDRLFpz5VQYbAEJQmse1pMniexgMfpHZTjVy2AVGc=;
        b=T57KQmGp+CLecaEhJOje5rpNkMiQvEviKUBhj4eLnySCjbIMEuiozgEIzeJeP+bXYH
         zfBMOwzoeZpXMiXBipQGKk85rLoAOZGwZNdRV8/irsmytg0rllXLRu7bVDGQqaG75eRP
         dJFKA2J/q68qCIOjVgPUiiYBNz5ltifd0569/4iW2bFWXUuRBOS6n9akun2ogkROGi49
         +I8pCwNa92FDrOdknT2R+f59/vV5h0fRqs+DDBlepm1UmQPpqE+uXedEf0efx+t/YSHu
         GpiwYUzo84sKAsZpW1jdpvFSrH6KzF7SfdSz/nGeg4Z0/5jcOonSqnaPqdUitfHzZDiw
         1dIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735788414; x=1736393214;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5FmDRLFpz5VQYbAEJQmse1pMniexgMfpHZTjVy2AVGc=;
        b=rGeVBismxfsbX0yUwxQk74iud9YIJlWxyAY8nWCogf2F2sRoSDd2E4ZxtjNkK94phj
         OEgiv4xxExS3/nTVYy7nI0on7kQYC2TOC87hUiv061+3i3n/T0yevsX1mkQvwyS9CjM4
         Kak+7GIymAlsxu3wYaQvWrRCpXhEGqO6k1IJ3G697jBvGUZuB3u9+H9RfmoVdlcfrMdM
         SCYZiw1FUBLwMsCdjURoqXahCbxyzDjf4jUTP3m3YO9nN+ZJ8+/sxczEnLToHTQAG0UM
         VSkADBxiUuAwrHy1p5WpMlMrWdXN0bN6qjyF1pTz9z+6dZOzL6SX7tOGsrue0RG1Pwub
         qemg==
X-Forwarded-Encrypted: i=1; AJvYcCUZV9jWl/BrhwBUBWyw+QPryvn3ICSV7FtDHubDP/GXTyXQr8cayUaHUZqn+zS32CPxDdlUbsGMidfi1sYYxm9F@lists.infradead.org
X-Gm-Message-State: AOJu0YyYdBf1OCBSVEkwayUWLllfBlp0tSR16/jhPrNhupA4DSzeh89a
	1AxZaZd12sJ+eh/rEudqBRb1TcxnfsP25CIuwjRgZqbfUH68jgHrCc9f/OrWiF8=
X-Gm-Gg: ASbGncsHxyVRGwVExhI4xJBzeCrAlLcRqC0AqCbcW+6Oi+XCKV9fi99/LPBfWYuCsNh
	9LNFVnnbfTUjrKy/Vi7AWAM7BHtTGauW0+To5jxLgSuv8sVIeLkBWte4+/w6Zk2VWH4k5D4g3Xg
	ltWJWb6pwnsNgWZRuMPXdERmYdXiiXxMzvq7UA6tW0KFOT30VgW66C6fpmarRIbinfosaTVldF+
	LKzNDdkB8yAFJo7qfavnfE8OzytOSCSRqZkr+WOe44ZSXrdeuko4+PnRXqwGqqG3pi4hPbezDcU
	wTp6LIrDxzNfSJ/XdDRDL8FVL9Y7clkakHd0
X-Google-Smtp-Source: AGHT+IH7I7RcNKZb9xeKgk2U2YJlaxlN65glovYfr8zNiCQJ9pCqdsXeeY1ES71gZQ0js0Fb7YH1MQ==
X-Received: by 2002:a05:6512:3f0c:b0:53e:3a7d:a1df with SMTP id 2adb3069b0e04-542295619ecmr13281012e87.45.1735788413995;
        Wed, 01 Jan 2025 19:26:53 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045ad6cae6sm41978011fa.23.2025.01.01.19.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jan 2025 19:26:52 -0800 (PST)
Date: Thu, 2 Jan 2025 05:26:50 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org, 
	Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>, 
	Fabio Estevam <festevam@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Liu Ying <victor.liu@nxp.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Robert Foss <rfoss@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>, Stefan Agner <stefan@agner.ch>, 
	Thomas Zimmermann <tzimmermann@suse.de>, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/4] drm: bridge: dw_hdmi: Add flag to indicate output
 port is optional
Message-ID: <ac4kkjv2nmziu6pd6vkuxbllhkqaueu32snfetpemtu2l5s6ud@cvystps3734o>
References: <20241231192925.97614-1-marex@denx.de>
 <20241231203136.GD31768@pendragon.ideasonboard.com>
 <88778e2b-8c43-46a1-bb79-0d9c968a5233@denx.de>
 <20250101223620.GA7206@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250101223620.GA7206@pendragon.ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250101_192657_461668_4A9E35F1 
X-CRM114-Status: GOOD (  35.05  )
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

On Thu, Jan 02, 2025 at 12:36:20AM +0200, Laurent Pinchart wrote:
> On Tue, Dec 31, 2024 at 10:10:51PM +0100, Marek Vasut wrote:
> > On 12/31/24 9:31 PM, Laurent Pinchart wrote:
> > > Hi Marek,
> > 
> > Hi,
> > 
> > > Thank you for the patch.
> > > 
> > > On Tue, Dec 31, 2024 at 08:28:48PM +0100, Marek Vasut wrote:
> > >> Add a flag meant purely to work around broken i.MX8MP DTs which enable
> > >> HDMI but do not contain the HDMI connector node. This flag allows such
> > >> DTs to work by creating the connector in the HDMI bridge driver. Do not
> > >> use this flag, do not proliferate this flag, please fix your DTs.
> > > 
> > > What's the rationale for this, what prevents fixing DT instead of using
> > > this flag ? Adding such a flag will most likely open the door to
> > > proliferation.
> > 
> > See the V2 series discussion, there are a few in-tree DTs which do not 
> > have the HDMI connector node. The rationale is there might be more and 
> > they might come from vendors, so this flag is necessary to work around 
> > those DTs.
> >
> > > If you can't fix the DT on particular boards, patching it could be an
> > > option. We had a similar problem on Renesas boards, which we fixed with
> > > a DT overlay, see commit 81c0e3dd82927064 ("drm: rcar-du: Fix legacy DT
> > > to create LVDS encoder nodes"). This made the workaround self-contained,
> > > and allowed dropping it several kernel versions later (in commit
> > > 841281fe52a769fe, "drm: rcar-du: Drop LVDS device tree backward
> > > compatibility").
> >
> > Frankly, I would much rather fix the few in-tree DTs and mandate the 
> > HDMI connector node in DT, which would keep the code simple, rather than 
> > maintain a backward compatibility workaround for problem which might not 
> > even exist.
> 
> The in-tree device tree sources should be converted as part of the
> series, I don't see a point trying to maintain backward compatibility
> for in-tree DT sources.

DT is an ABI. We are supposed to keep backwards compatibility with
existing device trees (at least for a while). I'm adding DT list and
maintainers to be able to provide comments on this topic.

> For out-of-tree sources it depends on how likely the problem is. There's
> no regression if nobody is affected. I personally like restricting
> backward compatibility to the strict minimum, to ensure that all new DTs
> will use proper bindings. Making the backward compatibility code
> self-contained helps there, and we could also print a loud warning
> (WARN_ON() seems appropriate) and set a date for the removal of the
> workaround.

-- 
With best wishes
Dmitry

