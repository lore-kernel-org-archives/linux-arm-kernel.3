Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C04DD5B861
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 18:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8ivCXo0tlAhX6SrgNkqQcm5Kx6Z8sjaJXC/TK9cEdNg=; b=hQKPgVsc/XZ+AzfS8pydCU9eIy
	U6dGG1UW4KTKIf4zF8VUi8ecdV8oK12ye+ug0y8fEUSfeq08WGSrPZphu86ulL0XHSpuhd/Tkw7JV
	U/wvppSqzEiCT9Y+oH08LmFA/hu1XaKZTEaDEl+pxyWfIJGt2sKDpZOULYlCks8FfgpagsFlBfKQz
	Ysu7PVpQ3KRcY3cbuf7F0jDbhZuhBJyjuEWMAakY9F6yZ8na6V7rNYilCQ+0XQbpsIQ9meVxnSjtY
	QXfdiU2mZsILsjI14V+I3HGJzZZrlF6ZHar/AsHdXJA5xWRSnrFzbBzVW+WCB4b+SXUjvyw7ozXe3
	IaDrz9lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVDOX-000000048Yz-3Cfo;
	Mon, 15 Dec 2025 18:34:05 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVDOS-000000048YO-3mON
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 18:34:04 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-477b198f4bcso30829415e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Dec 2025 10:34:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765823639; x=1766428439; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8ivCXo0tlAhX6SrgNkqQcm5Kx6Z8sjaJXC/TK9cEdNg=;
        b=f2VQIxdFrGvanOv7AdjA/maU2Cj1RcxxDnjruQrgZr0fJ5AeJHXdEUUNS/Dtez7Qaq
         zB5qod6T0TzdCMM03CyAN9r7E22M/XHjTaoHH9t/9Gh9yHzOOo2aX+AczghJaNYAIZj1
         8lACuIthTHgu64/Ou/ny0rIQ9RYU3vHEbjRmOiG0QTUF5g2j3QvX2bHwmPsLHzOXrIv/
         n8lRvovKMvX22FpE0OKGrVJEey5MC3FcxOw0DVBmhBKXFZ/Ku3p5Ntr7ydyP7Ha1mUma
         75q5GUAm08WS0XOyKpvCQpHTOnW44ID5DmH21JQKGHkM9c6amO6EBQY3tCahvp7VLg07
         z5xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765823639; x=1766428439;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8ivCXo0tlAhX6SrgNkqQcm5Kx6Z8sjaJXC/TK9cEdNg=;
        b=q0zYHbEtCR7EtZ/8te+mHpEiTE4HY0tCsjBXtWxjN0LGo7KgRowvV+2NnoxMMhe9wJ
         eO4uE2GqO94dZi85fAEQ4dHthxrtsZXbCM6/v6+45JrHx7Lrh3CobPMNYtwZCrOUIdtb
         s15zO33nZXyWaSlpPzKlUf9X1/ZT0axYH4/ju2y46Z0z5R0Swf9mTAXDfE0+F5pex5oA
         PgZSa5XYRzkOX4alxDm5nDCF0vHZHy8JV+6KOzcxZBSrdK17gRyeD0ueKhmKVYzCcjd2
         SXZsZdEY2T5NC6x+wyxUujQq8g+vhtV3MzSoTXyPY+6rmqTQ5AmGfkPJM5t90EyJyvJD
         a23g==
X-Forwarded-Encrypted: i=1; AJvYcCVfiRAOVFqM+t035y+R6DQ/+MH3lZ2vX78Qoun4RH95cVYUxpolykYjJO2gST+30u1f7yVAupWCjq73WzWGZxYX@lists.infradead.org
X-Gm-Message-State: AOJu0YyBWfofvI1zoLWx3eiUXiCUPudOEw+YLbkNPdsjvHktcozEKjl2
	G9U8WomyiViHsJftnR3TJiEEgCN3kvOP9BMqjnZYHWHiO/ZEbPxwQhEAWg34sxGNNZA=
X-Gm-Gg: AY/fxX6+nVAQTf38VeveCldzTVjlP4b1IffsAWAu1XC8tZ3g8qZZkbKi4Gnybd+2MiP
	fDzcvgfWA41+3NSEr9JXMJ2Ncjzq/VG2l5ai+mKn0H9QoEramJllhjjrBlKlxVULtr1rNR/en1R
	p+Rj9uYXF7vBVOK5Zfdtr8um+Cox8SyxiRZgdRVtxvRw0wCccdu0r1qVvJexlBSTQ2zdM1VHpf2
	hH4RMssDRlKPFBj0aMFge/78EJAYqMAfnZZrIZwGE9jhtM3giKY7++93yO/XigVGgGl6aD/ZYxN
	DCIHhEG+tv/W2F6KEVAIGatOgwC8z+4kEYKDf2WssvxYFhTYB2zRSGZdMLNAcYg3g0WudsnI5Uz
	yLtkLafye6O5BCq59YnlOEF73FzxHnCtF0L2sKxeDUV1z1BugWQJkrw6YZ6SZLwqKquA8bzEuMU
	UbFw8ClNkBOwlsdvUG
X-Google-Smtp-Source: AGHT+IGD9iih4mWv4BLSj82m0Ympx0mGmlL43wh+neFiQaKbjBxHvTG8uww0J8sP/od0z1H7q0uRNg==
X-Received: by 2002:a05:600c:5252:b0:477:76cb:4812 with SMTP id 5b1f17b1804b1-47a8f708ebamr117215125e9.0.1765823638856;
        Mon, 15 Dec 2025 10:33:58 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-430f280cf05sm16491842f8f.7.2025.12.15.10.33.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 10:33:58 -0800 (PST)
Date: Mon, 15 Dec 2025 21:33:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Chester Lin <chester62515@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Conor Dooley <conor+dt@kernel.org>,
	"David S. Miller" <davem@davemloft.net>, devicetree@vger.kernel.org,
	Eric Dumazet <edumazet@google.com>,
	Fabio Estevam <festevam@gmail.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	imx@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>,
	Jan Petrous <jan.petrous@oss.nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lee Jones <lee@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Matthias Brugger <mbrugger@suse.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	NXP S32 Linux Team <s32@nxp.com>, Paolo Abeni <pabeni@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, linaro-s32@linaro.org
Subject: Re: [PATCH v2 0/4] s32g: Use a syscon for GPR
Message-ID: <aUBUkuLf7NHtLSl1@stanley.mountain>
References: <cover.1765806521.git.dan.carpenter@linaro.org>
 <aUAvwRmIZBC0W6ql@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aUAvwRmIZBC0W6ql@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_103400_975405_B7BEA780 
X-CRM114-Status: GOOD (  27.42  )
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

On Mon, Dec 15, 2025 at 10:56:49AM -0500, Frank Li wrote:
> On Mon, Dec 15, 2025 at 05:41:43PM +0300, Dan Carpenter wrote:
> > The s32g devices have a GPR register region which holds a number of
> > miscellaneous registers.  Currently only the stmmac/dwmac-s32.c uses
> > anything from there and we just add a line to the device tree to
> > access that GMAC_0_CTRL_STS register:
> >
> >                         reg = <0x4033c000 0x2000>, /* gmac IP */
> >                               <0x4007c004 0x4>;    /* GMAC_0_CTRL_STS */
> >
> > We still have to maintain backwards compatibility to this format,
> > of course, but it would be better to access these through a syscon.
> > First of all, putting all the registers together is more organized
> > and shows how the hardware actually is implemented.  Secondly, in
> > some versions of this chipset those registers can only be accessed
> > via SCMI, if the registers aren't grouped together each driver will
> > have to create a whole lot of if then statements to access it via
> > IOMEM or via SCMI,
> 
> Does SCMI work as regmap? syscon look likes simple, but missed abstract
> in overall.
> 

The SCMI part of this is pretty complicated and needs discussion.  It
might be that it requires a vendor extension.  Right now, the out of
tree code uses a nvmem vendor extension but that probably won't get
merged upstream.

But in theory, it's fairly simple, you can write a regmap driver and
register it as a syscon and everything that was accessing nxp,phy-sel
accesses the same register but over SCMI.

> You still use regmap by use MMIO. /* GMAC_0_CTRL_STS */
> 
> regmap = devm_regmap_init_mmio(dev, sts_offset, &regmap_config);
> 

You can use have an MMIO syscon, or you can create a custom driver
and register it as a syscon using of_syscon_register_regmap().

> So all code can use regmap function without if-then statements if SCMI work
> as regmap.
> 

regards,
dan carpenter


