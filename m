Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D5AEE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 12:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=46aYL8Qujac4/4V9g8K6BMoI6Lwj7kmEE7LxrwnxQWE=; b=tmDGnL5vAJX0xtkmrTA541DItl
	CFkrzkxQ1v+C68Ft2aa7qB2MyU70KZ+vsI27zZ3QLccdi+MFs1L03PctnZ86QnXZesHBXcpzLGVpL
	3UHpgRVGEGY/zFrnt4c2p/4poxUiMoZJKbg7MULqrviqHgPfQtjhZ5t+Fz/ehPWyg8/VeyCJ6lKXJ
	qmmBlpQ2vkPbpdHyXDZrT6xNU9wQ9w7iTZhxAHVSO1wrJd2GOHjbxnkQGg7Qg/GWwBd6YlRmUxAUx
	SvP7IhUDm6qco/VMfnvD/xfiDrVCrdXxw1vTXZPdsga0lzE1d6bvRj3Pj0b43MUuVEVYSzcxTu+gG
	+Rr8R6OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKz2C-0000000BO9O-2BpG;
	Tue, 10 Dec 2024 12:08:12 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKz0f-0000000BNrF-1KSU;
	Tue, 10 Dec 2024 12:06:38 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-434f74e59c7so23979405e9.3;
        Tue, 10 Dec 2024 04:06:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733832395; x=1734437195; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=46aYL8Qujac4/4V9g8K6BMoI6Lwj7kmEE7LxrwnxQWE=;
        b=C+S2AlyDohevSrmSV8BeUdF74fiHG+dzHysMU/VJqmGBPVOd9ITL835qyglRETaVhq
         5iboPKev0kQYX5DptQrUHSDphj/THJzLlWc7VRoFMQIv9a0LBZZwOELAAmDjBvBasuLl
         qsWP62fx0p7rcKgWoC7AYrUfwNG74xHbsxccco+Z667hITcDcMyMftOv1nt+pSy3QxNB
         cN4FuqouXjo2s98MFONlKtJbjl2DkhMoka/H4n9Pnb0ucD5evEZyJppbAM6cT2FRzU4A
         YVPKM/OSHBwM6A7LAz0PEjhkE/W/x5jUKDLy5U8LEOtl8VnIPDrB3zrGWGgg5Xi2fk4A
         KVdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733832395; x=1734437195;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=46aYL8Qujac4/4V9g8K6BMoI6Lwj7kmEE7LxrwnxQWE=;
        b=ll4Hgjc9IJJCMlwxHRpSbvyIJBlgvIsmI+Nt6mX6BYMYPNUSzpqIfTrrwQDsDJna7b
         uorWRK0JWE66/lbii9vNqch6PNodrhT4SsUlHTljMta/6jbi57zdEAneRprd86mJor6m
         4NaEc1N7apkqbowN+MHEWPwUaM89IQcAsBQcOLqk9+dXv7ytCzqpvk90ZrTrFJlLLBJM
         iE/63kAbsRkydsKNQ29hwr1OTYaKYEcVnnIjCe9+fypi1vN18BwowjN9rL3RaZ+un3yc
         PTfwvMu7X2p6Np5W3SnqfLZF8+ryIxdwJlSI5+CSR3btZQ1GfRhv40X1hE17UJZJDE3H
         rnAw==
X-Forwarded-Encrypted: i=1; AJvYcCW9Uio/4QiOLFSxlxYEqFskT7D3msd+Ufv35/5XsjJQXduoEAPcg8OvDq72t9eAF4Orru/piKDHeVHk5HctHrgg@lists.infradead.org, AJvYcCXN7pjdWc5o08RCdeVmXZeVDBknlaLv7cqR9DEpTRtAXwQAq24yIl5IBVAn+EJsoZ/F5AweFvT3G1D//UEwguI=@lists.infradead.org
X-Gm-Message-State: AOJu0YxPSAdhgdhuy5rnODBIsWrRnx335/8yM0ddbaw0R5OQrM0L6WwP
	kgJtCGI77nShoKKFEz/w84tfnRVfrdchEeqHryK/LlrwVDeqykXT
X-Gm-Gg: ASbGncvQ9blaDvQ+2K7EpWyyVJGMz2Jb3PfGN+IBxpnawYVTTN+LX/nC+GonKsIRkPf
	Ag01ubsSbwJEtHBQnuk0OWK0IzkTh077f9RMI6vzDVlne6luOfjQ9mtO6mnEZRJqa0sJ7ak99vm
	QZvywz9TcsAoVoaXqF2ln41HId6uvEfk4lYw2MO0f5d20XX/YcQr64TK6FjfS0cQ4abktJU8HCp
	gC53uU3Wkgf6Wl3E/hKrg94k8IftQWkgPkHAoFad69/nT4GY2Es8IE29JA2hjEIUMQ0j49lBFpK
	VSiJEc8ing==
X-Google-Smtp-Source: AGHT+IGpcC8Z7oXmbBOkKTQCK7YHx0j6xObP8W63hf6oMmuAzbltOfilbIotkhxBgXfUoy6iy3NP7Q==
X-Received: by 2002:a05:600c:3b04:b0:434:a706:c0fb with SMTP id 5b1f17b1804b1-434fff3dcfbmr51803755e9.10.1733832395127;
        Tue, 10 Dec 2024 04:06:35 -0800 (PST)
Received: from Ansuel-XPS. (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-386394dd379sm8026747f8f.24.2024.12.10.04.06.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 04:06:34 -0800 (PST)
Message-ID: <67582eca.050a0220.3b9b85.2de4@mx.google.com>
X-Google-Original-Message-ID: <Z1guxUhVSGLHUVUh@Ansuel-XPS.>
Date: Tue, 10 Dec 2024 13:06:29 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	upstream@airoha.com
Subject: Re: [net-next PATCH v11 6/9] net: mdio: Add Airoha AN8855 Switch
 MDIO Passtrough
References: <20241209134459.27110-1-ansuelsmth@gmail.com>
 <20241209134459.27110-7-ansuelsmth@gmail.com>
 <5aec4a94-3cea-41a4-8500-71472fae51d4@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5aec4a94-3cea-41a4-8500-71472fae51d4@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_040637_354506_B988F94D 
X-CRM114-Status: GOOD (  19.99  )
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

On Tue, Dec 10, 2024 at 02:53:34AM +0100, Andrew Lunn wrote:
> > +static int an855_phy_restore_page(struct an8855_mfd_priv *priv,
> > +				  int phy) __must_hold(&priv->bus->mdio_lock)
> > +{
> > +	/* Check PHY page only for addr shared with switch */
> > +	if (phy != priv->switch_addr)
> > +		return 0;
> > +
> > +	/* Don't restore page if it's not set to switch page */
> > +	if (priv->current_page != FIELD_GET(AN8855_PHY_PAGE,
> > +					    AN8855_PHY_PAGE_EXTENDED_4))
> > +		return 0;
> > +
> > +	/* Restore page to 0, PHY might change page right after but that
> > +	 * will be ignored as it won't be a switch page.
> > +	 */
> > +	return an8855_mii_set_page(priv, phy, AN8855_PHY_PAGE_STANDARD);
> > +}
> 
> I don't really understand what is going on here. Maybe the commit
> message needs expanding, or the function names changing.
> 
> Generally, i would expect a save/restore action. Save the current
> page, swap to the PHY page, do the PHY access, and then restore to the
> saved page.
>

Idea is to save on extra read/write on subsequent write on the same
page.

Idea here is that PHY will receive most of the read (for status
poll) hence in 90% of the time page will be 0.

And switch will receive read/write only on setup or fdb/vlan access on
configuration so it will receive subsequent write on the same page.
(page 4)

PHY might also need to write on page 1 on setup but never on page 4 as
that is reserved for switch.

Making the read/swap/write/restore adds 2 additional operation that can
really be skipped 90% of the time.

Also curret_page cache is indirectly protected by the mdio lock.

So in short this function makes sure PHY for port 0 is configured on the
right page based on the prev page set.

An alternative way might be assume PHY is always on page 0 and any
switch operation save and restore the page.

Hope it's clear now why this is needed. Is this ok or you prefer the
alternative way? 

-- 
	Ansuel

