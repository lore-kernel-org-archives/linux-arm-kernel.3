Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 707ADC3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 08:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bMQS8LhbxO7fSprRTvxryhpgj+eGd6U/hKwb3rgYqas=; b=nrLWjzQCPUwIjroklpwPW1KT2I
	30u4nOoYVIvQQhfo0i7GlY0KEVdZ8JFAKv7av7nGN2Yr/pfth/diZBU1mpfYCHeqjTm8fjLMIJpSD
	D+hcbqogzx1UFCIf8d9CtvRdudNHCN2ZtV1j77IlYJBZpsoOfD64AlbEzWGQbK4113NSLobHfnNNK
	VFGZGXWfLxlwg7nWKbwJhLKNWqIlyovRF4yPFrpHLad92wQUWAZsDp33VBDpvrkCOhV8hPx+FgN6o
	YSyrLzVo95+EXJX2jlNy0/P3MfdVgsn71RD175JQcuXpUjpJJ2j3m9qYvcBL9KyevWH3kUgiUVDOy
	oqz0oIHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHI6W-0000000BywH-1LJs;
	Tue, 20 May 2025 08:13:40 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHI4P-0000000ByfB-1MMG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 08:11:30 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3a371097fe1so1413452f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 May 2025 01:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747728687; x=1748333487; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bMQS8LhbxO7fSprRTvxryhpgj+eGd6U/hKwb3rgYqas=;
        b=cCXvWf10vF7l5wBqXWBopg+duDeBpej0k7os18cGVDBD2zFtWObhuRAqg+Db4l6Iyq
         gMcdJdtqEUbZ2ZmHP3W4fzfKac9o/MGATAT71u/U79WUQq57iFtix9mxrAGKTNjj+Wgb
         nrX+SvbR0qrjFAKZoBUIFzCm+H4A92syEc8unH7MeYD4mxRidg4A5OUEC+aWiCygHLaB
         DU0kGvYM3o1JHVNPgsumUlWCzRy2PdKwuq1JR7N8VewrzvnN9OjuM0n4tz9tUmWHjFzx
         c8HmqQW1+cLtIrwalMswBhygA80Q1C5hlC6HOwT3WH65m+wakkug1941OVcbOProenId
         0SpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747728687; x=1748333487;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bMQS8LhbxO7fSprRTvxryhpgj+eGd6U/hKwb3rgYqas=;
        b=xUNjobsEOlfWPpFp4MoDzCBtV6E0F+xSvglDKG2mTF5b2UVKfvdkh1W+42i7VxTPTl
         9PmOzRj6rYwLyZSjzZ6+SdNHd9sFFwMTGhgi5YYVZtVM3x4U5vhJPtfAJMVzFgme3IW3
         buyE1ijsl5ZpB5UBmWIpXvWnHv1glhRs1HIShTgcQKXY10jpeiAvi9gCSjq/Wu5hXtpC
         LimYcNnuJGW+SUjLbxBv1+csxsIHFPOndwhddYzGBY0xkRz8fzhQVQaBz3+qUZJYMuqJ
         RFSuNvpPPEAvPI71xLq9aBmfWTb27yLlaRigyGN1qEzoXNsKoiZzr4B2vHR0wPwni3T9
         hbmQ==
X-Forwarded-Encrypted: i=1; AJvYcCU200/2fjAcvM10BY8QjsLWm9NyTGzC+3TKKRIMdPfhdnRhF2V2MM+1YR7niREuFqrXgFYblM/KF3kM3QkQhLhc@lists.infradead.org
X-Gm-Message-State: AOJu0YyMI7x0Bl4tC7RcyiNpRRKP4yBPudpOWfnWWBvJgCx+6xrO0ssI
	zIqXbgc9+ctKrLy2R9Hmvv8B/xJRH56PwBAWeYwzO+sGWGIbv0SeMdII
X-Gm-Gg: ASbGncuPX8XHw3Oe+sQCmcb8S50/TXCSvoIwr0EHu2u2ymcAyLk3vEbpA3LXT6YCUo2
	RpXZUkFgV+vm5pIq4W9FBE3Z9XACuM7JKxHl661ga6e13u7jsuYN8D7eqv5RvaJ1Rywgv247Ppn
	mKrT+S4KICZZpLxHx1Q++P05EushY1xFWKh0SGjdIUI+di9CF8PhL/9DsvYq4pU7vEiiJV+oeLC
	RXophCJyzpr7UGc/ZF9Ji6dgZijAEIyF1cCh3F5/EGK8zjYpEe+if5HEyxteVNcpbzOBDmyezsW
	W4tpvFQPPVJCJyOPQr5op+E3HRQQNhVPA3NwGY/oioSYOErftsl1
X-Google-Smtp-Source: AGHT+IHPt5mJFjG5oAuprYIeJnO/pC95ipGYDXia9QgdBEyS/izQKeoP0AicXPY7/tdYWNp50rrG9Q==
X-Received: by 2002:a05:6000:2510:b0:3a3:5c8b:5581 with SMTP id ffacd0b85a97d-3a35fe5c56bmr11561628f8f.4.1747728687040;
        Tue, 20 May 2025 01:11:27 -0700 (PDT)
Received: from Red ([2a01:cb1d:897:7800:4a02:2aff:fe07:1efc])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a3632a2bffsm13922363f8f.32.2025.05.20.01.11.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 01:11:26 -0700 (PDT)
Date: Tue, 20 May 2025 10:11:24 +0200
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH] net: dwmac-sun8i: Use parsed internal PHY address
 instead of 1
Message-ID: <aCw5LAx1Nmfxk8Y4@Red>
References: <20250519164936.4172658-1-paulk@sys-base.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250519164936.4172658-1-paulk@sys-base.io>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_011129_363589_27165A05 
X-CRM114-Status: GOOD (  22.76  )
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

Le Mon, May 19, 2025 at 06:49:36PM +0200, Paul Kocialkowski a écrit :
> While the MDIO address of the internal PHY on Allwinner sun8i chips is
> generally 1, of_mdio_parse_addr is used to cleanly parse the address
> from the device-tree instead of hardcoding it.
> 
> A commit reworking the code ditched the parsed value and hardcoded the
> value 1 instead, which didn't really break anything but is more fragile
> and not future-proof.
> 
> Restore the initial behavior using the parsed address returned from the
> helper.
> 
> Fixes: 634db83b8265 ("net: stmmac: dwmac-sun8i: Handle integrated/external MDIOs")
> Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> index 85723a78793a..6c7e8655a7eb 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> @@ -964,7 +964,7 @@ static int sun8i_dwmac_set_syscon(struct device *dev,
>  		/* of_mdio_parse_addr returns a valid (0 ~ 31) PHY
>  		 * address. No need to mask it again.
>  		 */
> -		reg |= 1 << H3_EPHY_ADDR_SHIFT;
> +		reg |= ret << H3_EPHY_ADDR_SHIFT;
>  	} else {
>  		/* For SoCs without internal PHY the PHY selection bit should be
>  		 * set to 0 (external PHY).
> -- 
> 2.49.0
> 

Acked-by: Corentin LABBE <clabbe.montjoie@gmail.com>
Tested-by: Corentin LABBE <clabbe.montjoie@gmail.com>
Tested-on: sun50i-h6-orangepi-one-plus
Tested-on: sun8i-h3-orangepi-pc

Thanks
Regards

