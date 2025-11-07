Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A7AECCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 16:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wDYDeeQ/vWAVkTVZ2tumPs2hnzhDw4b29aU1EHWCyII=; b=ZjuZtHHoQ02tpuT1uZ5DdJV5Qy
	8kCet+GNp9OeaBjEpGfOn/CGTfbwKi0ZrEaROX0AzuD9VecmGvMi8xRdl0Wt4ZQmsmr9Td4gecyHw
	OBXEWw7zDuA5c3rscUG8zSymPdgF2NBj52ItGsDkZPdfXL0RbFDxhluNwFjdn+XJ8TNzmzBZEsmb1
	gpOMZQLno3GlGd0eZ8O1KlejV0qF3CceT56PGASDPZAnqhe/Sz+ylxV14ExlgBuKim2HhMnedQgCg
	jDIublCOeAI1hIWOze62XFMWE82oaPInc+i83eeSla6m1Raa3jFC3j6EbOv/uRd6FEBJsRd1ExCDd
	LAPnT7vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHPCd-000000004zS-0xha;
	Fri, 07 Nov 2025 16:20:43 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHPCa-000000004yu-1enT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 16:20:41 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-47758595eecso5021525e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Nov 2025 08:20:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1762532438; x=1763137238; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wDYDeeQ/vWAVkTVZ2tumPs2hnzhDw4b29aU1EHWCyII=;
        b=OyDVyHU3ibbl/B28tmV8WAZx5oRPuHcrrsbH4bKe13etzc9BdcBUihZoJdBjFp00Qi
         84TK/Fn6OtKGS+uo6joPUBq6n5G3G2X46L1soCPMPSL4/7aKz4Gd+uXTfEkUAY+O4DgZ
         LB53cTwIHg0LGv7vCRbbnE1q8O5sYod8boZwPXRy8gAE49QsuGYu0CF6BdLjgn39vvUn
         S2h2PmPq4ERvrWP0QLF9neVVk8+Sw6rkuC4oI/E8mYa6a8ZS2aslUHEsdns6khGU/gVF
         en93+BSxNR9/smRdKU6xqFJSAZGOU0ons9/41Tkxt4IjV5jkSlc5X9j2P4ojTZ5Bg91j
         ZCGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762532438; x=1763137238;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wDYDeeQ/vWAVkTVZ2tumPs2hnzhDw4b29aU1EHWCyII=;
        b=BEtC0K/vHMuYkbgJz8eJl2RTkBTqe6D7TcE4S4AF1htq0h1CE66kTZ3UrEwHbl5TMa
         AQ+RQSHutvOWrujnorVQ0UDcACcMQ+nLyaK3MYAo55LxHdv02H5azJzo6K+DFtC/l8AQ
         g6YihJPOHNcAOq7l0/Qn9ijGoxNRcu2dLWp1p2j12tY3MdauxtNmTTmlkJAoP3igfFir
         0yEgziE5WIRUJY8zIhZXkKekrpzf94PlsGf7Bf+QHwJI0MRMu/Hp25E49sXsyym5X7ol
         GRu9R4gNTpXd4xRfJS7TZ858NLusC3+yNEKkrS1vJrQmCBhewiOX42Tlt8OPyRvQ02kK
         +xfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYFSn4w1NABLNvlUaaHnIytYVI6+aA9DDTL4TypH2qDv8cZZ8N5/gwQRmBMMKzwmz+XACjk0GsghySRC9LuY9w@lists.infradead.org
X-Gm-Message-State: AOJu0Yw05Ey4rrcxmzqjRzRI7wqRmyOcO3WVUEygtLQf6H5Q0tPnfWa9
	QQz6as8SoPzKb/MiS0Y0kT7situDB4+pJmtxR2tUx99zcZ0gJ0N6lzZGifJpk3apiC8=
X-Gm-Gg: ASbGnctsu4l7nxJwZg3qq80kN2kTdKv14zcTkn3CHlTPgSFJ5P0QBDs7IJQ2DytmOzJ
	gLpG6FsQO60/d/H3NoC6mtm9zYasP6wnfOethsdamEMnTP9iKpdZ0UnHR36AUXc4AcTlfrebsTQ
	xGJ3uE6du/tB3SPa7EtzmCyZlKu/DpE9ji3ZzpkTYWzwwAQ2ShTkAxvlMFhZhm2d/TywDwEbRqh
	DCoRihF8k5AzZhM63/Ag2MaM82F/LvtCE9DCLFPiUM7PxmEs+mEWVvvX8UvdL0zsJPfSf8xQtfh
	yYIjwGr8uSlkM4nXwxJyKha8YVWyDIGKBBkr1dy35UOc6zW8BFd/8R+rlQCLVImS8RKY6NrG8gR
	Dcjg3Id+0Pg2X+CXB1MCmenmki7tcyo5NussFXHAb2K+FUBP92rburuqefeuI6+1Cbd+9TRdbkO
	nFkSTmm/gLI0uId2y22Q4u82Tvrz/3WGCQicH9+4CWYd1ilZtTGMcv+lb+jcY=
X-Google-Smtp-Source: AGHT+IFcgdIpQe62FnRg4rVkke0TruBClBrbAABNqXTY7mPIIJ+cQeAzHNDnmh9vCKPrBQJ6NHkN0w==
X-Received: by 2002:a05:600c:1c8e:b0:475:ddf7:995e with SMTP id 5b1f17b1804b1-4776bca6415mr30487885e9.12.1762532438329;
        Fri, 07 Nov 2025 08:20:38 -0800 (PST)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477641fdbd8sm48938385e9.5.2025.11.07.08.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 08:20:37 -0800 (PST)
Date: Fri, 7 Nov 2025 16:22:33 +0000
From: Daniel Thompson <daniel@riscstar.com>
To: Frank Li <Frank.li@nxp.com>
Cc: maudspierings@gocontroll.com, Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 2/4] backlight: add max25014atg backlighty
Message-ID: <aQ4cyVKzgBUfpsj9@aspen.lan>
References: <20251107-max25014-v5-0-9a6aa57306bf@gocontroll.com>
 <20251107-max25014-v5-2-9a6aa57306bf@gocontroll.com>
 <aQ4Vb4eUmSX0Nj6+@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQ4Vb4eUmSX0Nj6+@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_082040_454312_8AE66CDB 
X-CRM114-Status: GOOD (  12.72  )
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

On Fri, Nov 07, 2025 at 10:51:11AM -0500, Frank Li wrote:
> On Fri, Nov 07, 2025 at 01:49:59PM +0100, Maud Spierings via B4 Relay wrote:
> > From: Maud Spierings <maudspierings@gocontroll.com>
> >
> > The Maxim MAX25014 is a 4-channel automotive grade backlight driver IC
> > with integrated boost controller.
> >
> > Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>

<snip>

> > +static int max25014_probe(struct i2c_client *cl)
> > +{
> > +	struct backlight_device *bl;
> > +	const struct i2c_device_id *id = i2c_client_get_device_id(cl);
> > +	struct max25014 *maxim;
> > +	struct backlight_properties props;
> > +	int ret;
> > +	uint32_t initial_brightness = 50;
>
> try keep reverise christmas order

I thought reverse christmas tree order only applied to code where the
maintainers called it out in Development/process (e.g. netdev and tip).


Daniel.

