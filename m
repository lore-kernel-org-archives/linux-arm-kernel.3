Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD5A9C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 01:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UktKUUVgFXfpNQzRoxlwygzcOcwN5oFlxC5sDzVSosE=; b=Oq1DI6ntpdSnG/0HG0QPbU055f
	ygi2Ag5ahU8p6kbLe7CgQk5SueHbRjPbj0Qs15/mmg3TLsszyLW4dXui4l8n+mifRsAZIZI3hGVxG
	PfuqJ3pnYg/zDq4YF22i0PLYBAzW70dyiIPvvB4+PyH5yn71o5+rWD5/Ua123L2a5c/34GzH8JA/+
	30hH1hAoOt7dIishdDNLehgUE4N4hqERHDuTgSENfLIUolEokf7+swahKeixey5DhH6yQN6qUpnV5
	2CxgkUY9MlDkMFRaykT0m/VoE1mBLEJusqZmAy3Xc0T/lwQQVPrKKpZYCSr+fCko1dAUDLO2M837G
	fCffd5wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txyM5-0000000CKdx-1Ed2;
	Fri, 28 Mar 2025 01:17:53 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txyKK-0000000CKVk-3jJN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 01:16:07 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2239c066347so39455795ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Mar 2025 18:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743124563; x=1743729363; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UktKUUVgFXfpNQzRoxlwygzcOcwN5oFlxC5sDzVSosE=;
        b=B4G/6Nc+Pw4bmH6hIpBld0mI8UAVY/hWxd3roz/N68rCSiJfmeUVNrL4uB+QkdVDHc
         LxmdFs/PkQkbzrbjNakQyTz4XZyPpkg/oSDpNXXFND8xpuwXrD5SPh2MTteStufOG84I
         yKz24qrJHJ5/hrJKT1/dLemWJFru1kv2geYKYfUGBb3BnjS8wi8/+QEwA48NkzQMii8E
         3N00dhb6gr/zz6OSz+WJOUvjCC2veohAYmttjNGI/pbuttZkmzXdcs6x9nv8yUntACSM
         YimDbOIwFrenNiayxWFG6uncC3nXke+zsaQ5/nRZ6Rmb1Mz+vkSffE+dBDN6kU9VgLse
         RGLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743124563; x=1743729363;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UktKUUVgFXfpNQzRoxlwygzcOcwN5oFlxC5sDzVSosE=;
        b=RjpmemlO5bvs0+PxKH8L9PXSG0UkKhnWb24X2B87AIvB3LRq0WGgxeAzOFRoqe50pa
         A/Qw7zVmTcVRJ7BOfFNGFrnu7ZHVHzat6iY02O4k4WY2i3cL1m6+VyloPpwWXsK8yji1
         JU2jAgOfWDJkBsxBK2HwPE6zOTAlu9fkJyOtiH6uH5mJ3e4Ay6wd/xTKd8pSf1AdD+PE
         pdS0Nhqk/brSCRjQJvVVVT/hZpjPv4Wly2kqj+fwjWgZ4Nzoh0UJgo+3SnoQvyttAEtJ
         rZ21XCC+Kd9y+N7QTpTZw27g256/KMiYJgeK4zuFyX69Xp3qV0GEJmpTjaRfQKg05gI0
         JqYg==
X-Forwarded-Encrypted: i=1; AJvYcCW6bKJeWCGp6j3PbTzxzSjRAxXJxNIdmg497QV8sr96+pcfSFKsCYfbpbrKY+kEbPwfp+5Y0rUHUkdlo4Z6g0vg@lists.infradead.org
X-Gm-Message-State: AOJu0YwfMmSHPQqS7xPlc7T9rbbbTM1o7E4BAtCg4S1IWf7rqUCHNdYd
	QCiqhCXrwJdjdi+fq9m8yELqfTp6QyrwKxQsBJ1aHMT4+83jPmgP
X-Gm-Gg: ASbGncuILD/M8S1PVMzvGHisb7uUtrO+qdWQ08znIxjsdvfuij8pDWRfIGUyRRXs0U/
	AG9/KXCBGd3ZZcwpZ06plgGOuvPyIKWVbit0GECcbLeFnih90KKipuKy0IEbjbUBdnNMIP3st24
	qxR9TbkDU/IEztA17Kqi2P+z+LJKOzfAHnu3KOEq79fyHnfLaNufim0whzTmpAhzDCs81TErwEZ
	rYvVSTJL4kEOkbwzqKDAkEe+WYvEMfMN/G1Ha+luqVSg1vb3MClJS0l67YiviWjE0jpuyOShtyp
	KGQgEGNBnRdNhLmxdnYW6cKirPm3Y7c0S9DPZo1jDzJNczQqHesuqrSXYvuBATXaUrRaZyOLyuy
	dZDQFsUAFxogCY3TC0/wlPy879XmylnoHcSs=
X-Google-Smtp-Source: AGHT+IFsa4ooa9WyM+hXEZ/VKN3czMhSBprfgrFtEeIEImHL9Em/a0EmMkNmL2FmVwvZNwNZ3kwIyg==
X-Received: by 2002:a05:6a00:4fc1:b0:736:5c8e:bab8 with SMTP id d2e1a72fcca58-73960e10bdemr8365322b3a.3.1743124563325;
        Thu, 27 Mar 2025 18:16:03 -0700 (PDT)
Received: from ?IPv6:2605:59c8:829:4c00:82ee:73ff:fe41:9a02? ([2605:59c8:829:4c00:82ee:73ff:fe41:9a02])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-73970def6d9sm549308b3a.10.2025.03.27.18.16.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 18:16:02 -0700 (PDT)
Message-ID: <8d3a9c9bb76b1c6bc27d2bd01f4831b2cac83f7f.camel@gmail.com>
Subject: Re: [PATCH net-next v5 09/13] net: phylink: Use phy_caps_lookup for
 fixed-link configuration
From: Alexander H Duyck <alexander.duyck@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, davem@davemloft.net, 
 Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski <kuba@kernel.org>, Eric
 Dumazet <edumazet@google.com>,  Paolo Abeni <pabeni@redhat.com>, Russell
 King <linux@armlinux.org.uk>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 thomas.petazzoni@bootlin.com, linux-arm-kernel@lists.infradead.org, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, Herve Codina
 <herve.codina@bootlin.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,  =?ISO-8859-1?Q?K=F6ry?=
 Maincent <kory.maincent@bootlin.com>, Oleksij Rempel
 <o.rempel@pengutronix.de>, Simon Horman <horms@kernel.org>, Romain Gantois
 <romain.gantois@bootlin.com>
Date: Thu, 27 Mar 2025 18:16:00 -0700
In-Reply-To: <20250307173611.129125-10-maxime.chevallier@bootlin.com>
References: <20250307173611.129125-1-maxime.chevallier@bootlin.com>
	 <20250307173611.129125-10-maxime.chevallier@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_181604_927655_4ACAD558 
X-CRM114-Status: GOOD (  22.26  )
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

On Fri, 2025-03-07 at 18:36 +0100, Maxime Chevallier wrote:
> When phylink creates a fixed-link configuration, it finds a matching
> linkmode to set as the advertised, lp_advertising and supported modes
> based on the speed and duplex of the fixed link.
>=20
> Use the newly introduced phy_caps_lookup to get these modes instead of
> phy_lookup_settings(). This has the side effect that the matched
> settings and configured linkmodes may now contain several linkmodes (the
> intersection of supported linkmodes from the phylink settings and the
> linkmodes that match speed/duplex) instead of the one from
> phy_lookup_settings().
>=20
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> ---
>  drivers/net/phy/phylink.c | 44 +++++++++++++++++++++++++++------------
>  1 file changed, 31 insertions(+), 13 deletions(-)
>=20
> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> index cf9f019382ad..8e2b7d647a92 100644
> --- a/drivers/net/phy/phylink.c
> +++ b/drivers/net/phy/phylink.c
> @@ -802,12 +802,26 @@ static int phylink_validate(struct phylink *pl, uns=
igned long *supported,
>  	return phylink_validate_mac_and_pcs(pl, supported, state);
>  }
> =20
> +static void phylink_fill_fixedlink_supported(unsigned long *supported)
> +{
> +	linkmode_set_bit(ETHTOOL_LINK_MODE_10baseT_Half_BIT, supported);
> +	linkmode_set_bit(ETHTOOL_LINK_MODE_10baseT_Full_BIT, supported);
> +	linkmode_set_bit(ETHTOOL_LINK_MODE_100baseT_Half_BIT, supported);
> +	linkmode_set_bit(ETHTOOL_LINK_MODE_100baseT_Full_BIT, supported);
> +	linkmode_set_bit(ETHTOOL_LINK_MODE_1000baseT_Half_BIT, supported);
> +	linkmode_set_bit(ETHTOOL_LINK_MODE_1000baseT_Full_BIT, supported);
> +	linkmode_set_bit(ETHTOOL_LINK_MODE_2500baseT_Full_BIT, supported);
> +	linkmode_set_bit(ETHTOOL_LINK_MODE_5000baseT_Full_BIT, supported);
> +	linkmode_set_bit(ETHTOOL_LINK_MODE_10000baseT_Full_BIT, supported);
> +}
> +

Any chance we can go with a different route here than just locking
fixed mode to being only for BaseT configurations?

I am currently working on getting the fbnic driver up and running and I
am using fixed-link mode as a crutch until I can finish up enabling
QSFP module support for phylink and this just knocked out the supported
link modes as I was using 25CR, 50CR, 50CR2, and 100CR2.

Seems like this should really be something handled by some sort of
validation function rather than just forcing all devices using fixed
link to assume that they are BaseT. I know in our direct attached
copper case we aren't running autoneg so that plan was to use fixed
link until we can add more flexibility by getting QSFP support going.

