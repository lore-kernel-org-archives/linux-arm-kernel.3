Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A1B9E77180
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 21:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H7QDnRhBemOiZezpHGKSoMKm4TcZsXptVa4lYZVMKw4=; b=ZAnfemyQ9Nx5U8zaQ1tpjGnfIN
	l80JgcqQAjinXNaIox7O9xAlbNwTC0UJg6qj3fNRdah6WTwnTTifcjOf+kt3hoLYgDSTEUnYOnEjQ
	5x4kSRcY1nNuaZgcVYih1S7tW4AKCpK7Tb6fnq/gZ10wjpRS+viZeZwwSvIJHphBKYeGuL4pdyilu
	uFBJFashFsPaKuPhcSIKbaKdCgO0mWKoa7OJ8IPA/lH6VaGYq0OZxlJhX2eTshlGf3TIbcu3WxI6v
	ISPAQ76n3xAHY6X6bjUd05WY6zK828lyS5ReXtkFguCCye6+AWEzN4+HmvCJZYG6Cg33/SrpopXuj
	WgJ7xtAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL7ay-0000000Cmt2-2eGH;
	Tue, 10 Dec 2024 21:16:40 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL7Zw-0000000Cmjz-0HnR;
	Tue, 10 Dec 2024 21:15:37 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-aa67bc91f87so47760266b.1;
        Tue, 10 Dec 2024 13:15:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733865334; x=1734470134; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=H7QDnRhBemOiZezpHGKSoMKm4TcZsXptVa4lYZVMKw4=;
        b=GPQeFjA9qRRPs0fMbLEGml4wwCrtNrKG6b4EJxcj7ybqDz5MrD6U20cV8SFdun0sR0
         mImjFAnU2+EjMUa0UOycmuoQqpZ6FLc1r8X7FeACJIaEI97hSCO+P0N7rQyS7O4M0Lfx
         vf4XlXqwcf6Lg2P88iNNf7+PSoatI2x6YKCF4s6oqsuByfc7lTjiIALBoWVfhbt+Cdqw
         cP6S1HKsVmFoTAMfrRz9JQVA5DtlgEbZMPDi7YWViHW1wvr6PmPEeY/VAyA7xVWSdvWr
         gytLGVNVoTBD/yZdoJb+4PX6D6f/hvcf4HOLdnN/2QT85W7hkFy0NbuixeXX4OeFI6H+
         WG2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733865334; x=1734470134;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H7QDnRhBemOiZezpHGKSoMKm4TcZsXptVa4lYZVMKw4=;
        b=LwFw+GVo4SbI7s9rAAly/w/RyVV+MUIda/85yqZEfP2aTradiSk19mnz+kcGiwtVfU
         hv06PnZiRlcAjPcsS3OeB0tkITHGywVY+s0IjvUQdgY10uSkcCM+wkbXefapCXV4SXnq
         vLXMgHDpHq0UGWL5Gjy5aXKPIYlFkN1UX/f2PGy670448TgWNSJr8rMYux8mih0cOZYU
         jVEIqEHCEvrVHkSKlVzKAhOdVw8E0XpGzyPqVsmMvnEz2wAc0fxXLFyjCtkdpKqzMe4F
         e/iipS0drOzREvL7Oek4hlm9aHCKQJWmMw9rz/jxjI7Tss2wsBClju96vN7AkdsaqgCB
         kqtQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbfCrhRGQ4jc6Zp4f/i3qOK5c90Su4Jt/8QU1mgGVBb5O+wajbRcE7Y74sYIW5GKbk/ZDoz0pBHIX0Chs9r/Va@lists.infradead.org, AJvYcCWu1asHuuhnpVGXy9GqWI7Ob9UB8DQL6WBglaavefwUCjz0M5brkmFYi7rMgD7hury7o+crAX/c+3uiBVOvwT0=@lists.infradead.org
X-Gm-Message-State: AOJu0YxFefBevSqKbhIp07STS063Ec+qWoBygeZhkd5sWSzI1kjsW3Mx
	5iyguBEj32by2QiaakHc1H8VUWrY/S6C0gpGlBvKb303X77qJIXN
X-Gm-Gg: ASbGncvRptMT7FQ/qzyHFgvmPF8gVx5+EplFE3GyAtVaQi8OBFcIpbf8ZCJYfUvAlGU
	EHLL0SQCqIrdkeDavsh8fmFFPRtnJXhlCItPjkmxILP+2KgPhpcGHpSkuxzZR4tr+hvgwgtRvwx
	ZIIApJLOX5Q9uWDDa1+Ul+0pTlL2iDwCL0W2QOLxBTqB6TmQSw5Rp4H5c3xmOzwtnQBTvJL6zzz
	/szmzg9Wrw8vZ5ujERkY11kYJgQDyEb4RoZnHevSw==
X-Google-Smtp-Source: AGHT+IGxAjFXMAf+F8mEXMc+auUHpdwpbNPCA+k5jUjJE3/MSupwfdCkIxkoOyQU//98Mv9Et2opNA==
X-Received: by 2002:a17:907:2cc6:b0:a9a:b50:1c4f with SMTP id a640c23a62f3a-aa6b13c92a2mr5523866b.13.1733865333794;
        Tue, 10 Dec 2024 13:15:33 -0800 (PST)
Received: from skbuf ([86.127.124.81])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa650ea7369sm596924566b.74.2024.12.10.13.15.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 13:15:32 -0800 (PST)
Date: Tue, 10 Dec 2024 23:15:29 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	upstream@airoha.com
Subject: Re: [net-next PATCH v11 5/9] mfd: an8855: Add support for Airoha
 AN8855 Switch MFD
Message-ID: <20241210211529.osgzd54flq646bcr@skbuf>
References: <20241209134459.27110-1-ansuelsmth@gmail.com>
 <20241209134459.27110-1-ansuelsmth@gmail.com>
 <20241209134459.27110-6-ansuelsmth@gmail.com>
 <20241209134459.27110-6-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241209134459.27110-6-ansuelsmth@gmail.com>
 <20241209134459.27110-6-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_131536_110031_3A4354A7 
X-CRM114-Status: GOOD (  13.93  )
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

On Mon, Dec 09, 2024 at 02:44:22PM +0100, Christian Marangi wrote:
> +int an8855_mii_set_page(struct an8855_mfd_priv *priv, u8 phy_id,
> +			u8 page) __must_hold(&priv->bus->mdio_lock)
> +{
> +	struct mii_bus *bus = priv->bus;
> +	int ret;
> +
> +	ret = __mdiobus_write(bus, phy_id, AN8855_PHY_SELECT_PAGE, page);
> +	if (ret < 0)
> +		dev_err_ratelimited(&bus->dev,
> +				    "failed to set an8855 mii page\n");
> +
> +	/* Cache current page if next mii read/write is for switch */
> +	priv->current_page = page;
> +	return ret < 0 ? ret : 0;
> +}
> +EXPORT_SYMBOL_GPL(an8855_mii_set_page);

You could keep the implementation more contained, and you could avoid
exporting an8855_mii_set_page() and an8855_mfd_priv to the MDIO
passthrough driver, if you implement a virtual regmap and give it to the
MDIO passthrough child MFD device.

If this bus supports only clause 22 accesses (and it looks like it does),
you could expose a 16-bit regmap with a linear address space of 32 MDIO
addresses x 65536 registers. The bus->read() of the MDIO bus passthrough
just performs regmap_read(), and bus->write() just performs regmap_write().
The MFD driver decodes the regmap address into a PHY address and a regnum,
and performs the page switching locally, if needed.

