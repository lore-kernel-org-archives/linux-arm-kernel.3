Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C852E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 20:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QPDOC2//XkjZODpmg0y0cTcEshGv93e+h8EC+PgTW2w=; b=abGvSuwukM1wDHPMsFzpOcwIzC
	MD0jU22IM1nS/5dPt2bLTS77320bTs9MzHhLjAODxW4KjpYzzttEEOjBywqDbi01FVnklddYDVwfG
	rVVI17RqbnJnuQHVSKIggQ9z0GnlfSrXP1d/A9v/2xAcvkTmfR5QLXDf2etzxKvLPjQ/JBf2jQMfM
	gVJ8s81R/fVoF31xZQ4QdFWgKD5ckWxDB24t0vQSUVg9jGTk27Vc5vZPXiuIZu8QRR6iAKTZKxJLD
	oNHaCHrUKtfiGW80ZK+LkYa+MrgO7e5ahHdBI3lvuh1BMMPn8tICvb42bXqhNt52aH4h8Kkzxwj7q
	A/t2p11g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXnbI-00000009gSM-0fx4;
	Tue, 14 Jan 2025 20:33:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXmZ8-00000009XIr-3njw
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 14 Jan 2025 19:27:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=QPDOC2//XkjZODpmg0y0cTcEshGv93e+h8EC+PgTW2w=; b=icYYG38c2TLULYvULw/dc9hIIU
	5X62/UWLTMTix1l+PNrXwVM7utzYgxAROvDmL1tf4awCgbzDw2jg2/juoYlNb6biJm6uZNYjv+mVV
	h2BLQ3VZsnvkb5frdEzdu7L+t9z3PX5OTcNAxZf7MQQPFJrK7jxYxiGggE8FE2DcfuuMLkNlkbpDK
	7fCd+Dju+7BtGll8xGFA7Imfm8hmh/VXyNAe57oPX+GKOGGFxarMku7amYWqXrOGyNaS6a35KDdsV
	lz8o0+8qXBa7GuFgPiMhZb8gYtpnJkpXLdOKJxjKklw0JZ9MJpRyOMuiS82dY+V/PT3GXRF5y9VoH
	8QC3v4Ig==;
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXmZ5-0000000Aa3y-446o
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 19:27:05 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-38625aa01b3so564524f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jan 2025 11:27:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736882821; x=1737487621; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QPDOC2//XkjZODpmg0y0cTcEshGv93e+h8EC+PgTW2w=;
        b=Hg15awuNLOUlCryxmnye5EXjt1qzhdnd3qRaWU/zh8VXzC0zTCis8Y+mzj3Rg6dPq/
         JrgxwoGar/eMWV0UiqcJxtGkpGqmIOT33oHWI4UblGhLhTxVaZM0xWg5ovll4CGVmi8e
         4yUpiVynsiZzQtMEUDWzwjDHSKHJRxz451xP/1yuGn0OvZhdslsQrU2qOR6PFKZAimFx
         Iwg2F48CR+KJfQXu8gpi6kQ8dRrneixdFAESZo4txypW3YB9CHwaQAvKodAh88/tfxvY
         wJ4iqUqsPN8+lurzNb0LWqZSBXMtxbXJcQ4OS08XwpQk5e7hovF2paaxur7RzB2ahc8F
         RY+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736882821; x=1737487621;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QPDOC2//XkjZODpmg0y0cTcEshGv93e+h8EC+PgTW2w=;
        b=eEK046FrPsz4P8UhAbBddi+HnQGY4f/lp3a+rKvPc6byOgX5B8ypqMyFm0ZYIm22tF
         xKIp/pPh1alAUu+xzovBfDmGbYduJuf0tRF2+kH9sKctVzcGhIXLI2tFBqnAnK0f6OFq
         CT+MULmiMgyGMHWJ+7R3DwbK5rm9tNO0LbCCm9zXFyabUxh34GKl2+yTbxAIf5nW6a39
         xCc8zBSYSV0/qvIH4+4pf5u22e4NWd81MgW2sRQ9/hBOcEampXuSGmhBH8jbkDJ99MNU
         PCxisOxPNswNeS3EBaJKmmDjKMNHgg5pNkVkaObAmdr17tGSnuooT7omhAF4iJMXSsb/
         /VMg==
X-Forwarded-Encrypted: i=1; AJvYcCUb1NL4O8HGBG6Jw/aaRich8A3y8THDiJWKP7Y1ALEkJtCdEWQprjVIxvavN3FkFUxxJPVKTO9hH0Ch9ubeO1Pn@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5Nqu39jBD2Qpwh8mlqdpOADAkPwGaDASDZJo3Zs9K9u0qvCsI
	NIkhJ7ujJmVHM80zz4jLBJvQQPCTDahmwSHd3Gfc3yHvriWXYJol
X-Gm-Gg: ASbGncsaNrjZlwTuLBeFc5BNk1D0v7rgeqZpJcv4T8K3tSmQpCU/lL85FSzYkWfYrqH
	Iee2vqvfHA1qNErJujfTDUvI8OIJpKUjZ7IrIGJP6sDQ9leN8/NDO4J8G9zyYWssoh0L3n4ddKt
	7KTCfthF0NS2ZtqkFmsjw6OUM+bsh63OTsRGlwK4QCH1Z5dHGylPiaq/Klv9X/USLf+DFT1gUOG
	kOSXiCUPaq1FdhaaNIJL4bRAkYAG7KMMCp0P3OINmkX
X-Google-Smtp-Source: AGHT+IFRMhm4Uswt+iLT80MZuXuKVqSaWMPJbe10Y7O9d5L2JP8nrXQetkrsSgWyKgweQMeH2SjLVA==
X-Received: by 2002:a05:600c:35c2:b0:434:941c:9df2 with SMTP id 5b1f17b1804b1-436e272c89cmr94080655e9.8.1736882820898;
        Tue, 14 Jan 2025 11:27:00 -0800 (PST)
Received: from skbuf ([86.127.124.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2e89f29sm219901715e9.28.2025.01.14.11.26.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 11:26:59 -0800 (PST)
Date: Tue, 14 Jan 2025 21:26:56 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Bryan Whitehead <bryan.whitehead@microchip.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Marcin Wojtas <marcin.s.wojtas@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
	UNGLinuxDriver@microchip.com
Subject: Re: [PATCH RFC net-next 10/10] net: dsa: allow use of phylink
 managed EEE support
Message-ID: <20250114192656.l5xlipbe4fkirkq4@skbuf>
References: <Z4ZtoeeHIXPucjUv@shell.armlinux.org.uk>
 <E1tXhVK-000n18-3C@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1tXhVK-000n18-3C@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_192704_275769_D09F9D2F 
X-CRM114-Status: GOOD (  23.11  )
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

On Tue, Jan 14, 2025 at 02:02:50PM +0000, Russell King (Oracle) wrote:
> In order to allow DSA drivers to use phylink managed EEE, changes are
> necessary to the DSA .set_eee() and .get_eee() methods. Where drivers
> make use of phylink managed EEE, these should just pass the method on
> to their phylink implementation without calling the DSA specific
> operations.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---

What is the reason for including this patch with this set, where
it is of no use until at least one DSA driver provides the new API
implementations?

>  net/dsa/user.c | 25 ++++++++++++++++---------
>  1 file changed, 16 insertions(+), 9 deletions(-)
> 
> diff --git a/net/dsa/user.c b/net/dsa/user.c
> index c74f2b2b92de..6912d2d57486 100644
> --- a/net/dsa/user.c
> +++ b/net/dsa/user.c
> @@ -1233,16 +1233,23 @@ static int dsa_user_set_eee(struct net_device *dev, struct ethtool_keee *e)
>  	if (!ds->ops->support_eee || !ds->ops->support_eee(ds, dp->index))
>  		return -EOPNOTSUPP;
>  
> -	/* Port's PHY and MAC both need to be EEE capable */
> -	if (!dev->phydev)
> -		return -ENODEV;
> -
> -	if (!ds->ops->set_mac_eee)
> -		return -EOPNOTSUPP;
> +	/* If the port is using phylink managed EEE, then get_mac_eee is

set_mac_eee() is what is unnecessary.

> +	 * unnecessary.
> +	 */
> +	if (!ds->phylink_mac_ops ||
> +	    !ds->phylink_mac_ops->mac_disable_tx_lpi ||
> +	    !ds->phylink_mac_ops->mac_enable_tx_lpi) {

Does it make sense to export pl->mac_supports_eee_ops wrapped into a
helper function and call that here? To avoid making DSA too tightly
coupled with the phylink MAC operation names.

> +		/* Port's PHY and MAC both need to be EEE capable */
> +		if (!dev->phydev)
> +			return -ENODEV;
> +
> +		if (!ds->ops->set_mac_eee)
> +			return -EOPNOTSUPP;
>  
> -	ret = ds->ops->set_mac_eee(ds, dp->index, e);
> -	if (ret)
> -		return ret;
> +		ret = ds->ops->set_mac_eee(ds, dp->index, e);
> +		if (ret)
> +			return ret;
> +	}
>  
>  	return phylink_ethtool_set_eee(dp->pl, e);
>  }
> -- 
> 2.30.2
> 

