Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E39E9D65553
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 20:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bIdOM98L3EBQwsq5FQMMGgLWqa/7d6Lq3LNh7wTZfHQ=; b=WLcuN+LQqJXk3VtoMnqFeoXLSi
	OD6GRgx6i50sYjF1yX/c0uQtWmSedL+by/FR/YNhkD06sQUi4zzooIh5fYeuxjgcqoEjhDHWjHEDU
	M6qOIfDMbYp3kDsVPKQJIgcK9GWagH1dhIB5ctsnl3YNL7zUx6BQT7Y2KYPPj/frGSUL0RvZr8qzs
	oUYdqKs1kc1A4BksY/Gy6pVXbAdFXs3pAx1aRcGUe9MnehvmvuDoazVlTQ8shCCJwiDbWoU6Sz9kD
	RPrKC9iaMqzvksgb+KFvaCjsQIXDcQ8eWHbB3OOeOpyOi/eBhiK6EQfCcy4w18ecgcnPj5rLhy2K1
	QcoxtA3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tG23A-0000000Bdi9-2Ows;
	Tue, 26 Nov 2024 20:20:44 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tG22C-0000000BdYz-2Idc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Nov 2024 20:19:45 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-aa5325af6a0so524021066b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Nov 2024 12:19:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732652382; x=1733257182; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bIdOM98L3EBQwsq5FQMMGgLWqa/7d6Lq3LNh7wTZfHQ=;
        b=HEHeNwhP+hbJJilyEKRUInFrLWCUzDeSA9bBlc50mieormUrxLUNatvmv3ZAKVofMY
         +HYcR2PAHV44WoAW1lBeEGjFWEnxD9uup+DjZ4eirHUjR1u0h/mLwNIOM/soI6mmZBFp
         0jnEagxR+wjqRpZAc/OmKjZS8U8zrwwWvmYcJyiNPS7OdY45K7wFFPkdxOAGZHSW2sUa
         SQDD0QukOLk5apQiWTKRnOGmVbjq9MUGRGW4isepqbrPRmg2eUe0uTsiAv2rI1aXSSEg
         cDbIO5/I5p7JWy6QR1kqUtGSqXyNcbuHqgxvlL31praRpTsknYIV0gqe0wqds1Cdex5i
         DWSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732652382; x=1733257182;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bIdOM98L3EBQwsq5FQMMGgLWqa/7d6Lq3LNh7wTZfHQ=;
        b=J63VrvtoI6XsgqMH6JMIYWuE2uUz+tzRPeUbU3n8jHsQ9Ux8Ul1Vw+7pT0Ti/Xqoc1
         V+BosULpBNK6wd9JO7leyv2m3TaU8G9udcC/BQTL+ECeq8S86LAuQmgpXSNashGrPt6W
         rgpwtEFZ8l9s552nXOwM2xK65CTB+Rj0FUGiMKP/JnC200lkrLRvxRQn6ePm/szcw30z
         PI0hX0zepArLqqfW8Whfpy4OcDuUNa5AttOloa46asgtIGcssA3pl2ks3wBjvKPi2+q3
         MI7ALFcd1g/Mp3bR229+AQOSQHwh8AJGigP5tt1U88O7E5rnEm8dCo6DwtBtYdrOivsx
         WVwA==
X-Forwarded-Encrypted: i=1; AJvYcCXEzjQ/zCISBSUTixWpsQYm5OcQnLmdBtWVI4SJPA2u/piJR1i76bYpG6x0C26g45UOit4mbUppHgi6I2nXRs9q@lists.infradead.org
X-Gm-Message-State: AOJu0YyQ0Gecv86Pc7+nH2HCLTLcRiXoGyCaukEQAQhFIlgw9/buL6xO
	g+O7f/B300wEwUT4UXyb2V7dAKD/ORmmXC9aBQHrpN8LhwsJR1EN
X-Gm-Gg: ASbGnct/JPSsAJpQVlM/k4RRbylEXEAX9+bTrEE/TvxckNbaBav5kCAugjI0NdLAbVO
	mKdJ2M9Ihul858whXowVa6Lw0vuQUuAIdjFhGRzBfhf3NoNdlKJ6xIQFSmIFpnVe7Pl4lnt+oJT
	lLtDAmhtDsmTquy8+R317fyOAKe5KqFmUXm+iEfGkBFK5a8E5jMZusOCH36iSodfgLYmr7920Nb
	4cDO49GmtKpUX92ay4fLXL7IH+09DY7htrHchr+1C3+Pah1ITiXb+ZV5wg8pODd2LE55BpX6RKu
	OSJoTAk570yQS/qYi0hIuP4tBL9IgzTfq1Eah8diTMysSDEIVlXG9wqyTy0sbLG08RMSFzgO4HF
	e3vOdhSODLyx2OMEPMu3h2a4zIcNfcoHiPtM11/0Blw==
X-Google-Smtp-Source: AGHT+IFJzXI+QGnug04VkzBBZH3/3gOfiit7iwiUpCdN3K1kV7d0P626vyqQmw6ZO1DajOX9UOmxZw==
X-Received: by 2002:a17:907:6ea6:b0:aa5:4c3a:3b55 with SMTP id a640c23a62f3a-aa580f5814amr26638366b.36.1732652381959;
        Tue, 26 Nov 2024 12:19:41 -0800 (PST)
Received: from ?IPV6:2a02:3100:b1b1:7000:f43f:954d:8ddd:f91b? (dynamic-2a02-3100-b1b1-7000-f43f-954d-8ddd-f91b.310.pool.telefonica.de. [2a02:3100:b1b1:7000:f43f:954d:8ddd:f91b])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-aa50b3000e6sm628933066b.80.2024.11.26.12.19.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Nov 2024 12:19:40 -0800 (PST)
Message-ID: <fd994907-0d37-41a6-87fe-1064543bf9fc@gmail.com>
Date: Tue, 26 Nov 2024 21:19:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC net-next 03/23] net: phy: marvell: use
 phydev->eee_cfg.eee_enabled
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 Bryan Whitehead <bryan.whitehead@microchip.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Jakub Kicinski <kuba@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Marcin Wojtas <marcin.s.wojtas@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Oleksij Rempel <o.rempel@pengutronix.de>, Paolo Abeni <pabeni@redhat.com>,
 UNGLinuxDriver@microchip.com
References: <Z0XEWGqLJ8okNSIr@shell.armlinux.org.uk>
 <E1tFv3K-005yhZ-E8@rmk-PC.armlinux.org.uk>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <E1tFv3K-005yhZ-E8@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_121944_589778_7B147A50 
X-CRM114-Status: GOOD (  18.53  )
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

On 26.11.2024 13:52, Russell King (Oracle) wrote:
> Rather than calling genphy_c45_ethtool_get_eee() to retrieve whether
> EEE is enabled, use the value stored in the phy_device eee_cfg
> structure.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  drivers/net/phy/marvell.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/net/phy/marvell.c b/drivers/net/phy/marvell.c
> index cd50cd6a7f75..1d117fa8c564 100644
> --- a/drivers/net/phy/marvell.c
> +++ b/drivers/net/phy/marvell.c
> @@ -1508,7 +1508,6 @@ static int m88e1540_get_fld(struct phy_device *phydev, u8 *msecs)
>  
>  static int m88e1540_set_fld(struct phy_device *phydev, const u8 *msecs)
>  {
> -	struct ethtool_keee eee;
>  	int val, ret;
>  
>  	if (*msecs == ETHTOOL_PHY_FAST_LINK_DOWN_OFF)
> @@ -1518,8 +1517,7 @@ static int m88e1540_set_fld(struct phy_device *phydev, const u8 *msecs)
>  	/* According to the Marvell data sheet EEE must be disabled for
>  	 * Fast Link Down detection to work properly
>  	 */
> -	ret = genphy_c45_ethtool_get_eee(phydev, &eee);
> -	if (!ret && eee.eee_enabled) {
> +	if (phydev->eee_cfg.eee_enabled) {
>  		phydev_warn(phydev, "Fast Link Down detection requires EEE to be disabled!\n");
>  		return -EBUSY;
>  	}

This one I had on my list too. Old and new check aren't waterproof as the user can still
enable EEE later, silently disabling FLD. But the check is better than nothing.

Reviewed-by: Heiner Kallweit <hkallweit1@gmail.com>


