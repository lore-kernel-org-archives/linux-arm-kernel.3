Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2554D73E84
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 19:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MnxwsZAxF8STswOuh2vgfeXNVDToeemAzI/Ew3hWeYM=; b=gXMbctcLp/78xvnYbdXvm4OTag
	aCnMBisd8g46HVsMT+Stbr5CKMEdWhV69d9o7y2cfU6K3ZlaDkAwf4KYQ+K7cONuhjpZR1IB+5jhQ
	a/0ShUeQSBfo3bJJTDmAhK9R5c40D59O/m0/+0oSc6k8wEtUiTGQYfmIHemra872CC+WjcdSxHlmd
	Jag6TRN/UDPWWkas9ln1VJaD949urjL6AN9tXFycwWGqmGi+Ry2LkcAlpAzLB6Beae86zvvuryzyQ
	Mw8MVZDgE5sRdKsgXPcLu1baLOQS8UOsj5B5CxvwkD3fQOCkrpWSRbTcKVtFHwPkvcD3bC0zGeiGh
	ipt7uBIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlY2y-00000000Zwb-3osX;
	Thu, 29 Jan 2026 19:51:20 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlY2w-00000000ZwE-1RFC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 19:51:19 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-82318b640beso782750b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Jan 2026 11:51:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20230601.gappssmtp.com; s=20230601; t=1769716277; x=1770321077; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MnxwsZAxF8STswOuh2vgfeXNVDToeemAzI/Ew3hWeYM=;
        b=3Obq45YBScjhaRnzDDOPTfVEY/I7wZZ5Fi01fMcBfpGZ4Nw9rT+whcTZ/7VZMP7wxw
         1CxT7gUK5thD5uX0HGQL3v8BEXgsuUSNRTeHeLY7eoOsQIrY3u9qUE8u8RQTLMMJY80O
         dEd6AL1wkczHt91fv+1lXQjH1S5zMXxnFzVL96fkaF0dWcZf5VKbLTSSJeLo3d+9UqjX
         W56hetzwBdSPbrQff8wbVAgc58oRmTaSiET9y3oX/wdaLYHdaFVBcEAhPWuGgAY7XMJz
         8nnbtsDDWIOR/pmj72wy/rUjIYB1e73oyCNE9UgOV5UcmQHOfcio2+ln/cHtItFwv8Ga
         H5xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769716277; x=1770321077;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MnxwsZAxF8STswOuh2vgfeXNVDToeemAzI/Ew3hWeYM=;
        b=tbzyjshRdpAkGMHm/xKgQi0ph8JVP7QZmLUnPdK589uD3VDJ2sDYVkbnBEzYziNol8
         CCLd/MzX0vPbO9CKl+alltzJp0ZQEamCycUZUsjaZUp1UeHAgQJ49JndhpBtq+HlehEt
         0pAZl09M1kZqU/dhT9oiKmCmQwlnOeaQM+WHId6krQWlFUbtTFSroyahpCQyPbCgxOKy
         J8a0Vwf/Ovo4F65fFUivYqeDSlw+Mtn2me84LL+YdUFzjyqukUmUJ3ufZ4hvCC1hStva
         JT9op3rBkoe6foJlYBCLfQ63jDKi05jd1D/d2p04xg73g4/a3TaS8txG5yzdRA0a75al
         7uQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXucw0+xWFQksM+FJEV0XABB3ZFGHX0cN2cOFMBJkxo29A3XPG+SYWYK/apkEr8mfiP7HeyxY9clhJP41v13oz4@lists.infradead.org
X-Gm-Message-State: AOJu0YzKzhLAF/FdAlkJFA+VzuDBCOzJTt+cuVD9y8FjRzNCvbJ06ZfC
	8lc/v0mjYhlKGbXFfYk7bJ7AvC70tBbZEk/KeZZzBvah/jflh3Kdc/e3AjAnbMpHGBg=
X-Gm-Gg: AZuq6aIYwDuHq5dsHTWzxF2NPN8XDUs+W25cdsAb2C/3CBBMgf+JoGAb+sq125BknIm
	JN95O6Bzi7IZRgxSbE385KdzdOCM4cIMBjGt6psbgEXZkePM3f8OdSBT8Op6pG/xj77DTPHmdUW
	IBajWubDs3pB2b+mCIb7MH/6hQ3v+xsrWHs24LxHZ7Qk53U/pyYtFvX5k9ryuiQxlqmqR1c3b0b
	yZbLKX/l7RzHLLWG2VuPuROWJaejHeOVjN6A5Z6AplA+ftQ/T+X2wkS+GKi+QOtlLV7l/8zEK2w
	n4lw3EHIVBNnIHV/Fop7cDzBIl+JKNT7V8m+5OI0BeP8jJ+ELH+5o+0Gx1gfJVSoFOk5HgDHKH8
	fc8qfwUiW60n4l921/5zTithUNQJJjfc9Wdlq7/5MEzQRfFAqfOOT6GMPC3zXATmpPtdNhklV2x
	O2Hw==
X-Received: by 2002:a05:6a00:3d42:b0:81e:dcb2:52cb with SMTP id d2e1a72fcca58-823aa3fd50dmr448408b3a.2.1769716276774;
        Thu, 29 Jan 2026 11:51:16 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:3::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379c54d4dsm7133424b3a.67.2026.01.29.11.51.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 11:51:16 -0800 (PST)
Date: Thu, 29 Jan 2026 11:51:15 -0800
From: Joe Damato <joe@dama.to>
To: Simon Horman <horms@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH net-next] net: stmmac: spelling corrections
Message-ID: <aXu6M3BKyDhJIXIx@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>, Simon Horman <horms@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-sunxi@lists.linux.dev
References: <20260129-stmmac-spell-v1-1-c7df9a96e482@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260129-stmmac-spell-v1-1-c7df9a96e482@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_115118_520660_1786C12B 
X-CRM114-Status: GOOD (  11.31  )
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

On Thu, Jan 29, 2026 at 05:35:03PM +0000, Simon Horman wrote:
> Correct spelling as flagged by codespell.
> 
> Signed-off-by: Simon Horman <horms@kernel.org>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c        |  4 ++--
>  drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c      |  4 ++--
>  drivers/net/ethernet/stmicro/stmmac/dwmac1000.h        |  2 +-
>  drivers/net/ethernet/stmicro/stmmac/dwmac100_core.c    |  2 +-
>  drivers/net/ethernet/stmicro/stmmac/enh_desc.c         |  2 +-
>  drivers/net/ethernet/stmicro/stmmac/mmc_core.c         |  4 ++--
>  drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c  |  2 +-
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c      | 10 +++++-----
>  drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c      |  2 +-
>  drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c |  2 +-
>  10 files changed, 17 insertions(+), 17 deletions(-)

Reviewed-by: Joe Damato <joe@dama.to>

