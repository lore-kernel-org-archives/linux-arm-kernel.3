Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51FFEE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 05:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MmN8unikKCAbDTYmOgv4w7VHd2QHTqvHtpUA+yq5Q+w=; b=rhIYKjyuQS6jc7BtmYvaK+m0sx
	XGKU+v92xLPoMz8HL/keptLOK8v0+lwz7WtW5oThlrdZlX4mzXF8/4d/DXrUuqlAxvaWgn9P11JvL
	792H5Uf5tutiKg40DUwJr2aN/1TqwatoggdcPkYlShQeEyb5JS1L9mRXdvhays/+1swC7u/B4s04j
	iE0R3y7dtjXu9ayGNPDxGKww3q2XmSBwpH8DYcw2feq4mV+A+PH80q+tJfziIfQT2Ud9soTnKXySU
	p1hoNpYvuZQm6uMfHHnCkjX/MD4MAloy+tjmm0m/GlePf8zg9evhEG+iuZOf3hm9qogxXZfySqTTj
	hb2yxdvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTaNR-0000000C7qq-03gf;
	Fri, 03 Jan 2025 05:37:41 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTaMB-0000000C7bn-42zI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jan 2025 05:36:25 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-3022484d4e4so148911721fa.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jan 2025 21:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735882582; x=1736487382; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MmN8unikKCAbDTYmOgv4w7VHd2QHTqvHtpUA+yq5Q+w=;
        b=o+TmFju5mgkSwEGzNs/d+FqGhsdOvX5x0Dk4lk2ouxtF5hIH19z6up12jCE8p1KiE4
         yLUJXwTTkAmE961hKKLRXPpzqhSTYYQ6g0TRvkHrwXt8QENIovRdwO+uB1ZW4PuEMUuh
         ouiSuSCVUEoVhqopG54OwkxusDugn77VtX2BsmDb5Lpfl/8zikBCoO2eVa0jyBc+ATKf
         LJ7g9AF6dzRxl9Q7JvROeTHoisiOILO4IbRlWMCf4bSz0kfmMrEq9BlyLPO3/2ODGi5M
         CL/wAuMVzan2bUzbXrlyMq1HfIhD/VrrOUgXnBpnZ3F+5uDWvD66Lr9ITTU3E0Yig5gF
         Aj7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735882582; x=1736487382;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MmN8unikKCAbDTYmOgv4w7VHd2QHTqvHtpUA+yq5Q+w=;
        b=L4OsSfiTpJOU/gY9OLLOopTtjeBX8pIryx1Xf9vYxW3QeR9W5J3Y/id5jKA0z1k91k
         lJPFeumHCl6JY96qw/sF4nGUlcj5PR7kqIuyIb8wnilLPqsL1ZhxP8cYTjUFzsKSAVX5
         Qz+xtAG0VP1lfFG42XwQmFBrtrtWI+0UIVzCBjpZ98s4dzPskm0VktI0zS3K8qGk6Ml/
         46naH/b7uC3WY+8tdtzD7655CWaFPjlWDguiGjp16gMOCy5L4aIPjgBO/bKmN9r60Onl
         Naws8yAI63xIPhg3unVMicuaNhx/ZDZVAvIoaaKuu/AqdWqdTRMEDnSPGAO30vObw4jd
         CHLw==
X-Forwarded-Encrypted: i=1; AJvYcCWsklKhr+/ZCovL8iprLF3Yo3TiRWUOcOZKdHBSJNB8NoqlKB2enNrwqCZhM+nLjF6XntWq033nX83aLiEhSldc@lists.infradead.org
X-Gm-Message-State: AOJu0YyKLKV3P/yRif4ZIcBkmsKrzmfHbQD81cf7bYGjpwoKhYsbyHsR
	b4mz63Q59raAPQzoKCy2MzrwDXFT+k1++JpJOcjLFCeEASTTeviphe70QaejfQg=
X-Gm-Gg: ASbGncuyWdZBt6F3EkDLszpCmX69H5lDYuZle2RsQecYnujTFbvjsLOnDvHaV7sVkq3
	bw1r0IizPo0miDETo/2HFUapPsTTn9kfEav8/fjQOwrqKUnDK9AnAbIaEVvtB4efJWt+8hJNwch
	9nE2MGiWv/CIk/l2n3cUPDN6aob7LLPsqBME/+uzncp7XuYYsyeTd2yrPCS8KEE2urD8lrX0x5p
	ErYNF8iGINx5FGoY0khTbX2WHKuHJO+KIubRsCqr7l76mgbyi+YGzvNYXyyrGx8YRVxJHsHprlo
	gZl0n7etYelSc+J2QeWd7PO5j3oczosYbP8F
X-Google-Smtp-Source: AGHT+IE6OID3IdhzMP3XEYNXHpLMaRxF1DCc2ymnBRQhO5cl+gFLOI6zrATEO677AB0hiGN2d3yNug==
X-Received: by 2002:a05:651c:2114:b0:300:38ff:f8cd with SMTP id 38308e7fff4ca-30468543d63mr161870081fa.9.1735882582025;
        Thu, 02 Jan 2025 21:36:22 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045ad99d6dsm47284711fa.28.2025.01.02.21.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 21:36:20 -0800 (PST)
Date: Fri, 3 Jan 2025 07:36:18 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marek Vasut <marex@denx.de>
Cc: dri-devel@lists.freedesktop.org, 
	Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>, 
	Fabio Estevam <festevam@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Liu Ying <victor.liu@nxp.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Robert Foss <rfoss@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
	Stefan Agner <stefan@agner.ch>, Thomas Zimmermann <tzimmermann@suse.de>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 3/4] drm/lcdif: add DRM_BRIDGE_ATTACH_NO_CONNECTOR
 flag to drm_bridge_attach
Message-ID: <a62utyd6bjhx33ru2aaxwiesexcltbgdcvhgd57c5uyl3htuoa@2kdgodqrqabu>
References: <20241231192925.97614-1-marex@denx.de>
 <20241231192925.97614-3-marex@denx.de>
 <u4hjoteybchte2fdmxle5rsu5jbohm7hjjoejrxiqa6lszqm56@6facok3v55kg>
 <2f2bdcb1-6d83-4939-9dd0-3fb206202273@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2f2bdcb1-6d83-4939-9dd0-3fb206202273@denx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_213624_020576_606981FF 
X-CRM114-Status: GOOD (  22.50  )
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

On Fri, Jan 03, 2025 at 12:20:19AM +0100, Marek Vasut wrote:
> On 1/2/25 6:58 PM, Dmitry Baryshkov wrote:
> 
> [...]
> 
> > > @@ -97,13 +100,36 @@ static int lcdif_attach_bridge(struct lcdif_drm_private *lcdif)
> > >   			return ret;
> > >   		}
> > > -		ret = drm_bridge_attach(encoder, bridge, NULL, 0);
> > > +		ret = drm_bridge_attach(encoder, bridge, NULL,
> > > +					DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> > >   		if (ret) {
> > >   			of_node_put(ep);
> > >   			return dev_err_probe(dev, ret,
> > >   					     "Failed to attach bridge for endpoint%u\n",
> > >   					     of_ep.id);
> > >   		}
> > > +
> > > +		nextbridge = drm_bridge_get_next_bridge(bridge);
> > > +		nextbridge = drm_bridge_get_next_bridge(nextbridge);
> > > +		/* Test if connector node in DT, if not, it was created already */
> > 
> > By whom? And why?
> 
> By the HDMI bridge driver, see 1/4.
> 
> > There is no display-connector bridge, but there is a
> > normal bridge chain, you have passed DRM_BRIDGE_ATTACH_NO_CONNECTOR, so
> > now it's a proper time to create drm_bridge_connector. You have added
> > the next_bridge_optional flag, but it should just prevent the dw driver
> > from returning the error if there is no next_bridge.
> So what exactly should I do here ?
> 
> If dw_hdmi_parse_dt() only exits with 0 if there is no connector node in DT,
> I don't get any output on the HDMI. I have to create a connector in the HDMI
> bridge driver instead and not here, right ?

No. Please make dw_hdmi_parse_dt() return 0 if there is no connector and
the flag is set. Then create drm_bridge_connector here.


-- 
With best wishes
Dmitry

