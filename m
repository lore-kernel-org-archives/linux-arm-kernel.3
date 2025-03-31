Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABA7AC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 22:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/x38y9D+bvULPl9mRXR1jnQ3ZFxCTMyxYRseHkuGiqE=; b=WU1ilRR0OAtH5HnJ/5Vh6+Mvh0
	2SQiClCmEqVr1fGQLBlu7p3bCKAiwYjjhyeQOLDoib8kJz9CQSoaTzQ+Y9lNF0XYBJg03HLddr72i
	Yz+xEgbGYkoIJOlb1kUcaZKCgIVw3pIUttl8Nb5esRERdFnU1JyUw0u9sM+x6kGaOfjQDkSdSCeuo
	GKNxi0PBT1b6PfH8hdG2W8zMxisunkTXa2bf0FZTb8F9eF8Tw4vEMdG3HDZa65lZCYYmRKTBmQgp9
	W+jP2KF7daf4yzruIIUPs9wnCSBteNmQdKk/DH3PVlSlQ8G39hkongtX5mhxleLbjeKK9i0kw2dSF
	mgHy9sgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzNgz-00000001W6l-1Ai7;
	Mon, 31 Mar 2025 22:33:17 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzNfC-00000001VvR-3Rih
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 22:31:27 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2260c915749so67939675ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Mar 2025 15:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743460286; x=1744065086; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/x38y9D+bvULPl9mRXR1jnQ3ZFxCTMyxYRseHkuGiqE=;
        b=ROG7D7GAoaaI+vsFGRlJnQvJyL87r+lJ8iAXIsKL4J63cS7bOfqb6ndc5H4DJ773qw
         hbuf8zxvleNkXTCDJm62eaxI4PYhYQn83uy7IzR2fUjU7tltex0t4eDk1lBkAQ33iHxG
         76abcaaCUGCQHVml+HO/ltcHkkNTSKorpKAzx5+sOUbzmVUOJlCUjHG7tNFZ7RGyLaDV
         t7pjezOqaEL5XLI+ikPi7j05qfPtleC6h94luqfKSokkA4zB6P7rQAEo8nctFCyht2u6
         GucjEqKCx19wHIuBDzdChZid9JuMr4/5xjy26roUX6faozzgj0TJXUxWdlxE/aveucPb
         pu/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743460286; x=1744065086;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/x38y9D+bvULPl9mRXR1jnQ3ZFxCTMyxYRseHkuGiqE=;
        b=aumrQl5vGiK7SxYKlX7NUWUG+++25BnR+iyyl9ia9WGMtToPt25yDw6hKudXv5SDJ1
         sgsQz2kcvoHz/8CRJxvJsIYloHBqSAuRrDNfJLAD5TbjjN3BuqZBmOSPlambYQSTM2kB
         lWan9IfA5zxILEMUJT/IF9FVqNDuMIcGpLI09wV7D9ELHG3nInScsr1V8U63tsURbA/S
         ybZcZpKA3NyFbGna4eH0R/QmCkmsSOgnBqM9ivA5WFo1l0gpbKdVad/J7D60byUI6p1i
         6RV+pn/poW1UwgwPB84/6HhIQIN3zpsbBeT9zqGsRkQiYSbieYr/mDLPSSlMTVQuhOtR
         lxUg==
X-Forwarded-Encrypted: i=1; AJvYcCVIijRySbr6NDSFSxmaH2t83cYuRvIveohKpOWdC23Rq/9zp58s1ZvBu13CHgMIiQQBZ1rPY7SBwiOqZufmu1fO@lists.infradead.org
X-Gm-Message-State: AOJu0Yxc5m0STwe51DCBO2zJjT8oXEwU9NMaarAXmjugH0RpR0j8B+zU
	rF760IBx8Wbkz0ZK57CpTzh2WFF0/gV+govKhefd7VYktn/Adb3C
X-Gm-Gg: ASbGncv3SHRI7HRaEbXfzN4r4zddZ9mNhpyMOdbjxaJezpsfv99S8P4Su7aPV+M8RiG
	imuonIKJQf2/5tjVpOiGTKelmEySzEIQKQgY8E6ChXQRMUnE7uhAsDEFre1RqBO8w7Y/K9y4S0d
	SxqqRp20TZCU2pNybLwBL8CB/J3Z6VTM5fhC4eSPWD47UozXp1srXiR4klLwcPgvWX4TgpRmzkj
	4xkc8fMqkvYT3c+amBS9S0LfOnfwKyLD1V5fV5GDs9Bm+NQuFpVJjLnSqeetiwaVP92/piayIPd
	OntLqIrRgiRuJSfV7gSaSBS9B4ZZvLcCVoiNKTJxzEh1C69MUam94v+Ifz/QBQRSiEQ9I3xXquQ
	JMjZ6TFQsvH0iIK4drywgXM0E81IYaD/CbvI=
X-Google-Smtp-Source: AGHT+IF/JompVVPMEUWrVSbGF3Fm7fHmvyqZCfgc6BpS0nNlvNEwE++JBwgxQucv/KQpsd5yTnFYyg==
X-Received: by 2002:a05:6a21:7a4c:b0:1fd:f48b:f397 with SMTP id adf61e73a8af0-2009f649022mr18125913637.23.1743460285791;
        Mon, 31 Mar 2025 15:31:25 -0700 (PDT)
Received: from ?IPv6:2605:59c8:829:4c00:82ee:73ff:fe41:9a02? ([2605:59c8:829:4c00:82ee:73ff:fe41:9a02])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-73970deecbfsm7536215b3a.33.2025.03.31.15.31.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 15:31:25 -0700 (PDT)
Message-ID: <44f5c55e5fac60c118cb4d4e99b49e6bf6561295.camel@gmail.com>
Subject: Re: [PATCH net-next v5 09/13] net: phylink: Use phy_caps_lookup for
 fixed-link configuration
From: Alexander H Duyck <alexander.duyck@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, "Russell King
 (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, davem@davemloft.net, Jakub Kicinski
 <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 thomas.petazzoni@bootlin.com, linux-arm-kernel@lists.infradead.org, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, Herve Codina
 <herve.codina@bootlin.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,  =?ISO-8859-1?Q?K=F6ry?=
 Maincent <kory.maincent@bootlin.com>, Oleksij Rempel
 <o.rempel@pengutronix.de>, Simon Horman <horms@kernel.org>, Romain Gantois
 <romain.gantois@bootlin.com>
Date: Mon, 31 Mar 2025 15:31:23 -0700
In-Reply-To: <20250331182000.0d94902a@fedora.home>
References: <20250307173611.129125-1-maxime.chevallier@bootlin.com>
	 <20250307173611.129125-10-maxime.chevallier@bootlin.com>
	 <8d3a9c9bb76b1c6bc27d2bd01f4831b2cac83f7f.camel@gmail.com>
	 <20250328090621.2d0b3665@fedora-2.home>
	 <CAKgT0Ue_JzmJAPKBhe6XaMkDCy+YNNg5_5VvzOR6CCbqcaQg3Q@mail.gmail.com>
	 <12e3b86d-27aa-420b-8676-97b603abb760@lunn.ch>
	 <CAKgT0UcZRi1Eg2PbBnx0pDG_pCSV8tfELinNoJ-WH4g3CJOh2A@mail.gmail.com>
	 <02c401a4-d255-4f1b-beaf-51a43cc087c5@lunn.ch>
	 <Z-qsnN4umaz0QrG0@shell.armlinux.org.uk>
	 <20250331182000.0d94902a@fedora.home>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_153126_860897_4F513CC4 
X-CRM114-Status: GOOD (  14.99  )
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

On Mon, 2025-03-31 at 18:20 +0200, Maxime Chevallier wrote:
> On Mon, 31 Mar 2025 15:54:20 +0100
> "Russell King (Oracle)" <linux@armlinux.org.uk> wrote:

...

> I was hoping Alexander could give option 1 a try, but let me know if
> you think we should instead adopt option 2, which is probably the safer
> on.
>=20
> Maxime

So I gave it a try, but the results weren't promising. I ended up
getting the lp_advertised spammed with all the modes:

    Link partner advertised link modes:  100000baseKR4/Full
                                         100000baseSR4/Full
                                         100000baseCR4/Full
                                         100000baseLR4_ER4/Full
                                         100000baseKR2/Full
                                         100000baseSR2/Full
                                         100000baseCR2/Full
                                         100000baseLR2_ER2_FR2/Full
                                         100000baseDR2/Full
                                         100000baseKR/Full
                                         100000baseSR/Full
                                         100000baseLR_ER_FR/Full
                                         100000baseCR/Full
                                         100000baseDR/Full


In order to resolve it I just made the following change:
@@ -713,9 +700,7 @@ static int phylink_parse_fixedlink(struct phylink
*pl,
                phylink_warn(pl, "fixed link specifies half duplex for
%dMbps link?\n",
                             pl->link_config.speed);
=20
-       linkmode_zero(pl->supported);
-       phylink_fill_fixedlink_supported(pl->supported);
-
+       linkmode_fill(pl->supported);
        linkmode_copy(pl->link_config.advertising, pl->supported);
        phylink_validate(pl, pl->supported, &pl->link_config);



Basically the issue is that I am using the pcs_validate to cleanup my
link modes. So the code below this point worked correctly for me. The
only issue was the dropping of the other bits.

That is why I mentioned the possibility of maybe adding some sort of
follow-on filter function that would go through the upper bits and or
them into the filter being run after the original one.

For example there is mask which is used to filter out everything but
the pause and autoneg bits. Perhaps we should assemble bits there
depending on the TP, FIBER, and BACKPLANE bits to clean out everything
but CR, KR, and TP types if those bits are set.

