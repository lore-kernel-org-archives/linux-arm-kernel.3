Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A559AC28B20
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 23:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n6STaknpZNYUi31WfcbcFyYuyQ/X3QqoCZMhNEWphEY=; b=OommhVepyvBh+xARcg+LuyqvDL
	iF9I2vlA44UbrXN1cQEPIYIxsvm7c5jq+qlsVJNje9QwVkvVvvNgutvm0gzvujE79+rdTFSr3B7uH
	i3aPCZXHI5WsmoCt+kfOHbTTdPH93HGZoxZHSQU8zTzPQ6n7ZdGwD9SZmsYjsgioIs2Ngsc0WP+3T
	R0q1iUbvJ6nVLiQ7AKV9+Vn247SBX5LAQbmihf2IIPbsskmZCGnTjCK3TAhEdK5fWoo4mTaYaONjI
	f28PUozRCY4ffPPj2arniYMwuYh4Wm2lI4RBRsw2TfZlqYlrb8a6HGWAE6sEq50DIycf2tJ6vvtz8
	eizXcEbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyJ7p-0000000EV2T-1v1l;
	Fri, 28 Mar 2025 23:28:33 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyJ63-0000000EUlg-3ZWb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 23:26:45 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-43948021a45so26466965e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Mar 2025 16:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743204402; x=1743809202; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n6STaknpZNYUi31WfcbcFyYuyQ/X3QqoCZMhNEWphEY=;
        b=S0RiHjP/Ro52/T1FeW+WDzGzIAWXFC7DEIJuqH+BxMdkSBP0qbo4XdZSCXD8RdsYsJ
         Qg08zTiEyNP4RtqGTSt6VreBLU9qPo0e1oXzNXH4lcmrhRD6RF9pnwCXPIJq+WghI2Bu
         CjozCQesC3ZNKOYhVbb3ADZsOkbwFAAo/Up5FnN9Dd5oo3OiS5R28AwQvlfOSYy05flo
         Xpb3la7kLQ7v3C0dSqhy0lR+HkOhMhmAagD6SIKiY7xNxfiLrrFuizJ1DN1I0rLL9k7C
         BdyQC+o4sY2LatZwBAZHiS6/VNe9j6vQf7fQ+y5g8aXnhemcL9znOTitiCd/LwVI+ufc
         O2gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743204402; x=1743809202;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n6STaknpZNYUi31WfcbcFyYuyQ/X3QqoCZMhNEWphEY=;
        b=CIshGR436uqSLKk8bw1CGsR2fVURl83c9t7j714yT9BtvSiZFpfEQVojK145HnR8+Y
         bN0gp3R0/YM3h/Tb0iTy+1c7di7r3Dxwwgqb2d3SyrrDCiVnUKypu/b+jjl3vsQP7+Qn
         a/2af3bfFVfr+SDTKKj7GB+/7R/aJ523moqXHjABG42YA3e4wb4bBp/d0rQZwpaqnZb/
         VSz9FpHpdIAVnOTTRtyDUQMjJyLaAFnk/5mL5ALH6vYOIgizohBXajfcHWJtVNiYKC1R
         Zjw3NabPDlCG236KB3cDvDhvNR9hBi6vUECoaXxApu98oi6m7Z3RB/sm+v7MdJXyZrvQ
         Z2ww==
X-Forwarded-Encrypted: i=1; AJvYcCVXrUhZoDWP0lDvfTxcmIygMm8H0v1YbVD4D+jaA0BX//TFV0VX7XHrg0TEzZlka88lJnNvfOLXdSodAn1bwHm4@lists.infradead.org
X-Gm-Message-State: AOJu0YwOBU6ZrO8tNR/mSOY0vM31lEAozTZMHSjqL+okfNuLdHsPkeGh
	C3sX60pW+gVDzaCYyd8qmCzc6sHaBPmaAmclDaGxrwSssLHfEgdS0DnGop6x/jHA7rzBrbddMgG
	oyNNns2K6ngXlgkEjxgE+X8DDqvY=
X-Gm-Gg: ASbGncvoD/IB0XlWAXUZNLn4imS3cS5bZ+tYttzJHa8t9HVWrb9IaxjqwTLLu5/xZzS
	yhqmfmKqI/ZzRb5w5lWJeAd62DDVo7WW9hLaua9wtGcfQCogaKmKySIziI9sTp8ZKN1q51Aw8tl
	8qkqFKiMmm9KgQX1LUCeEvIDbvXzoUeJOqzIgCUhzy1Z101c73Oq6I+r76CRY=
X-Google-Smtp-Source: AGHT+IGqnOtE6iSguCCt/EOVRI29ntJXAd0Co1D5ys+CD+aLtuLOr2l+DKgmshYuKhMhJRzehRryDVjtuLL+QWYN8UA=
X-Received: by 2002:a05:600c:1d1f:b0:43c:fceb:91f with SMTP id
 5b1f17b1804b1-43db6226ecfmr11952995e9.11.1743204401846; Fri, 28 Mar 2025
 16:26:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250307173611.129125-1-maxime.chevallier@bootlin.com>
 <20250307173611.129125-10-maxime.chevallier@bootlin.com> <8d3a9c9bb76b1c6bc27d2bd01f4831b2cac83f7f.camel@gmail.com>
 <20250328090621.2d0b3665@fedora-2.home> <CAKgT0Ue_JzmJAPKBhe6XaMkDCy+YNNg5_5VvzOR6CCbqcaQg3Q@mail.gmail.com>
 <12e3b86d-27aa-420b-8676-97b603abb760@lunn.ch>
In-Reply-To: <12e3b86d-27aa-420b-8676-97b603abb760@lunn.ch>
From: Alexander Duyck <alexander.duyck@gmail.com>
Date: Fri, 28 Mar 2025 16:26:04 -0700
X-Gm-Features: AQ5f1JqDq9Q7sgwto-hg2UInEPPfl2eOmLlxCBC65yTnf1VkUtCGKdQGnJ3L08E
Message-ID: <CAKgT0UcZRi1Eg2PbBnx0pDG_pCSV8tfELinNoJ-WH4g3CJOh2A@mail.gmail.com>
Subject: Re: [PATCH net-next v5 09/13] net: phylink: Use phy_caps_lookup for
 fixed-link configuration
To: Andrew Lunn <andrew@lunn.ch>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, davem@davemloft.net, 
	Jakub Kicinski <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
	Russell King <linux@armlinux.org.uk>, Heiner Kallweit <hkallweit1@gmail.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com, 
	linux-arm-kernel@lists.infradead.org, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Herve Codina <herve.codina@bootlin.com>, 
	Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean <vladimir.oltean@nxp.com>, 
	=?UTF-8?Q?K=C3=B6ry_Maincent?= <kory.maincent@bootlin.com>, 
	Oleksij Rempel <o.rempel@pengutronix.de>, Simon Horman <horms@kernel.org>, 
	Romain Gantois <romain.gantois@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_162643_893124_AE2BECA1 
X-CRM114-Status: GOOD (  32.28  )
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

On Fri, Mar 28, 2025 at 2:45=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > Also I am not sure it makes sense to say we can't support multiple
> > modes on a fixed connection. For example in the case of SerDes links
> > and the like it isn't unusual to see support for CR/KR advertised at
> > the same speed on the same link and use the exact same configuration
> > so a fixed config could support both and advertise both at the same
> > time if I am not mistaken.
>
> Traditionally, fixed link has only supported one mode. The combination
> of speed and duplex fully describes a base-T link. Even more
> traditionally, it was implemented as an emulated C22 PHY, using the
> genphy driver, so limited to just 1G. With multigige PHY we needed to
> be a bit more flexible, so phylink gained its own fixed link
> implementation which did not emulate a PHY, just the results of
> talking to a multigige PHY.
>
> But i don't think you are actually talking about a PHY. I think you
> mean the PCS advertises CR/KR, and you want to emulate a fixed-link
> PCS? That is a different beast.
>
>         Andrew

A serdes PHY is part of it, but not a traditional twisted pair PHY as
we are talking about 25R, 50R(50GAUI & LAUI), and 100P interfaces. I
agree it is a different beast, but are we saying that the fixed-link
is supposed to be a twisted pair PHY only? That is the part I am
confused with as there are multiple scenarios where you might end up
with a fixed link configuration at a specific speed for something not
twisted pair. For example in our case the firmware provides us with
the fixed modulation/lanes/fec configuration so we can essentially
take that and treat it as a fixed-link configuration.

In addition one advantage is that it makes it possible to support
speeds that don't yet have a type in the phy_interface_t, so as I was
enabling things it allowed some backwards compatibility with older
kernels. In the case of fbnic I was planning to use pcs_validate to
strip down the supported features and essentially limit things based
on the bitrate per lane and the number of lanes. We were only using CR
so for us the result should only be 1 regardless based on the speed
match.

The general idea I had in mind for upstreaming the support for fbnic
was to initially bring it up as a fixed-link setup using
PHY_INTERFACE_MODE_INTERNAL as that is essentially what we have now
and I can get rid of the extraneous 40G stuff that we aren't using.
Then we pivot into enabling additional PHY interface modes and
QSFP+/28 support in the kernel. Then I would add a mailbox based i2c
and gpio to enable SFP/QSPF on fbnic. After that we could switch fbnic
back to the inband setup with support for the higher speed interfaces.

One option I would be open to is to have me take on addressing the
issue in net-next instead of net since I would need to sort it out to
enable my patches anyway. I was mostly bringing it up as I was
concerned that I may have not been the only one impacted. I was using
the fixed-link/internal combination to basically signal to the phylink
interface that we were locked in and weren't going to change it, as
such the only impact for me is it seemed to result in a warning
message about the link configuration not being recognized and the
supported/advertised modes being empty.

