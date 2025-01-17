Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 899EDC02183
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jan 2025 03:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i4+rc7zr12NkY8+R4W4XzHgtWfwIjKXfUvC4zjsYnME=; b=MAxqQYNE6vna+8LrRYOqAG12w8
	y6g44G+wKax7rnheBKSoKl64dCAz25ZlWLlEL9nLAhNP9N5PQwISsV2ASYk2d0f02o2+Tm3T58Zv0
	YR/aaJWZC640223b+ratkQdKt3rRE5QVNEIIzL0qKbsZQkIfERtR3aeI4xZmVij45/PGMpFFNCoqb
	qRheZFYv25AHgt6Yu0IvOB0eRH8qwozOCz7GpH5n5aX8wY2YByTI4KddOl2n7LLgPRxse0NoaruNi
	ulUWB2rgjL6C+gWU9GN01+o/TY3MqBEMX+R6hb+6B18vQSOgpxBihpm1sOcXYwcQMxY4p5DWkIvlm
	y4gZa9bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYdIR-0000000GwNB-3lOH;
	Fri, 17 Jan 2025 03:45:23 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYdH9-0000000GwF9-0uh7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jan 2025 03:44:04 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-542af38ecd6so1842541e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jan 2025 19:44:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737085441; x=1737690241; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=i4+rc7zr12NkY8+R4W4XzHgtWfwIjKXfUvC4zjsYnME=;
        b=OjOJbkYxtmKRRZMXVb9xHarObJYGlLklA5Q5pe4Ya8f93EDvP/d9oHAj1HnINpeU0U
         hmsBQR96Ypra+7y/EJVXmi3GRsRQuR8sukq3YFI+qwOjBtY8q/v0DnzzEGQioY+iS5cf
         cNxUq6SFuC7yTpmfmZgb29zzxmjGjmlRk1p2EenxLljxbwGhj04pZ9ddpnkaetKrVqj6
         AySY+blma6kAWMRCIK4dmjQ5/fh1vF15Eolsl6epxvSdM51VBOFGwutvApzf+t4CPD7k
         ptWDPXeHaDFxr/uf/q0wCT9eyTl2zNMESF4mVpdYperBaWBXlAF+OuSU8QlgLBetcynj
         P/PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737085441; x=1737690241;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i4+rc7zr12NkY8+R4W4XzHgtWfwIjKXfUvC4zjsYnME=;
        b=G9bHvQwoODFfHCD92AcbYUqI+61MLFpqN+1XDJSjyX3N/X9rKeqMbqn+3Yi0V7ZzJ7
         B8QgICBl8x2Y6xlwfE3Uk3Tmpa3KHt+skZJcb+yZk/uIPjSucWQTh6CQ3z7cO2He6Hzj
         fPSf7uc03qk93Y/+Fsvy7Ko1siWl1Zy2qCgLlZcpCs0KDeaimllJ6t3JbBFwWyRREYEZ
         X5EXMl+aDNLCp1NeiwfQNaZ3BXOrT09id7CHG10mjpninFtxTK2UysZwbrTKxhtS+H+V
         kIUMH3pCuebC7yIWLOXliu7OKRJpdTLvGM0QBJSCAOberg68zmZrzQeVtaJKBEM+D3X0
         ctSA==
X-Forwarded-Encrypted: i=1; AJvYcCUZvBIv2Uz7I6hr1lpXln990n+VIeyGFSH2qkWx4DEND9FxavNNB1Vk87ZXa5uGuJzOzMuavz3UHAGdYOP3BErk@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3EgtMjVqvLKXSazFfNJ10Nb+icocgC/C0zVz05PU5wIvq/ztP
	WYsKuf76fy/YWW/foGH90HVZNtyUVdGP62Mo8UXWgN+xh4DyRmPqTSZ6JU52jIc=
X-Gm-Gg: ASbGncsW7veqlN6wU72ts91Q6Ra18J43w7o3m8JneZXyVImgGGppplbO+L1kStovU0b
	cPVlqrxgEB8vGAN9cQU6Vo0s8YEzf+ufCF8bt/51IEkdkQLhXWzm1K9w4kdn5iau0NYdNIQBWXA
	fccUK/z1big3lWhx31E3sDIKEAsTVyUYRFtS32C87au6a7mFdnSjXsVPQhRe1QERTIinOCdv9qx
	iA/zfOsHa+rF64SMW5jb4IQ8IBJmGUq1KFuWKMrUTOjoUzZK8hdWXCPah1e5DgDrzyIs3EMz6dh
	wC9xak5MAci3TOBaOw1LhFUVQr77EkDzADQe
X-Google-Smtp-Source: AGHT+IGz5ay7LtZ6+rSD2XP9rxWv/jABbs6ebwXD/MzQJbyjd0oZnFaAjrC0FEJz70e5w3SHfSay0A==
X-Received: by 2002:a19:5518:0:b0:53f:231e:6fa2 with SMTP id 2adb3069b0e04-5439c253a05mr197064e87.26.1737085441361;
        Thu, 16 Jan 2025 19:44:01 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5439af78d57sm190046e87.232.2025.01.16.19.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 19:43:59 -0800 (PST)
Date: Fri, 17 Jan 2025 05:43:57 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: fnkl.kernel@gmail.com, Hector Martin <marcan@marcan.st>, 
	Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alyssa Ross <hi@alyssa.is>, Janne Grunau <j@jannau.net>
Subject: Re: [PATCH v4 2/5] drm: adp: Add Apple Display Pipe driver
Message-ID: <2alm7gds4k2lnbk36gjdw6yhzhpls3ce5baycdiv7lsigxsbzn@rhwdgnphwwp6>
References: <20250114-adpdrm-v4-0-e9b5260a39f1@gmail.com>
 <20250114-adpdrm-v4-2-e9b5260a39f1@gmail.com>
 <mu7qiybhj7tu5hauk7izfxqlookc3awpknhjk74zwpkbznei4m@kewap6vivzoa>
 <20250116-vivacious-congenial-nightingale-cb2f6d@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250116-vivacious-congenial-nightingale-cb2f6d@houat>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_194403_256384_9401268C 
X-CRM114-Status: GOOD (  19.33  )
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

On Thu, Jan 16, 2025 at 05:01:03PM +0100, Maxime Ripard wrote:
> Hi Dmitry,
> 
> On Wed, Jan 15, 2025 at 12:21:39PM +0200, Dmitry Baryshkov wrote:
> > On Tue, Jan 14, 2025 at 10:38:53PM +0100, Sasha Finkelstein via B4 Relay wrote:
> > > +static int adp_dsi_host_attach(struct mipi_dsi_host *host,
> > > +			       struct mipi_dsi_device *dev)
> > > +{
> > > +	struct adp_mipi_drv_private *adp = mipi_to_adp(host);
> > > +	struct drm_bridge *next;
> > > +
> > > +	next = devm_drm_of_get_bridge(adp->dsi.dev, adp->dsi.dev->of_node, 1, 0);
> > 
> > select DRM_PANEL_BRIDGE for this API to be available.
> > Also there is an issue of lifetimes. The bridge will be destroyed only
> > when MIPI driver is unbound, however the panel can be attached and
> > detached several times.
> 
> Can you expand on that one a bit more? AFAIK, it's always been unsafe
> and we don't have a good mitigation at the moment, so it's unclear to me
> what change you want here.

I was thinking about using drmm_ here, as the DRM device is also created
and destroyed each time. But I might be mistaken here.

-- 
With best wishes
Dmitry

