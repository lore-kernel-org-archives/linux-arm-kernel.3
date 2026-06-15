Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6A83CD98CF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 14:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hkIb+b4xA4Dtv3ljZrlwMo9RpQWTNWYQCjFJM6rj18U=; b=dE2tgOLnJADfRAGaTgDh66nhiy
	ioJ9NMBebW83odn67jBGWXUQnMC4EfswsNbQSuvkoXIYfHmsBi1hsBAY8H18Em2/LBkzMqHKzjTKO
	oMV8gJerCIEvteSTLOXaB02kz6FRrK+Z4I1936QykORltjuaEAAZ6ts/uJaRO5tbaBFGv0uxebZp1
	WJawDn2VHicuUXqmMn2GrzwCaYyVNaCrVoF0B69zzbmhiovlfl1295a9LlIiEP4CVHWLrXp/Vpjkf
	skT8orgRXVdDWTo1KaAolj+mUu42AN14s5PJp1uK25fga5zgHM9rgmy1IwP1fGCEErB3wwEF8G4i9
	VS0IiwRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ89I-0000000EO5E-0ukH;
	Mon, 15 Jun 2026 14:18:48 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ89F-0000000EO3h-0XJF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 14:18:46 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-490c1915793so30222615e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 07:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781533123; x=1782137923; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hkIb+b4xA4Dtv3ljZrlwMo9RpQWTNWYQCjFJM6rj18U=;
        b=WoGBWv/j8ibIxllhx1tqvIa6z+QhntQWPAl4xIXAEMgwzBOz8czgimA8vsSkrGpaE3
         UsEPz8UdsBtGn2QvP1825EQOfPV2/m782FrOt1UB+grMUozoLDc5r2wS9CqC2JHKcygf
         58PfGUkiuWQl6VR3N2gknlZriFa+GrtpiufpZIe4/VJOGb1RFc6d8iZHP4qJqRL5EUVm
         OKPyETGgdHrAA0ZDuc4rn2LFUhny1JuL9oq3aw+1+XIug+Jg8osiOhdSGSIntmaeo7nA
         TY1GEOTenrJ82uw00fF8dFiE4lMf0fREQTHAYzXlz2VlbtOmcCwC3HS1l3lXjbq5q1YJ
         Evyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781533123; x=1782137923;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hkIb+b4xA4Dtv3ljZrlwMo9RpQWTNWYQCjFJM6rj18U=;
        b=fZ0NLTlDkyCeV0Ok2iIiIogT844ZdzjrUrpgWZT+tN3oP409A8UkWjGqt9iNoRRPg8
         Mcyf+JEtFwlDaUdxmoA4duRZTPuq0NXbj4bcaqkDG0rHl90Kc6k/DgzIf3sBZ+CwMYYm
         YlIgHLpAPe94m1gm9fRsaCjqmIO4nOEHF17nG81cZ7fh8SjLcaWY3aGxdnSWbwJxvyNx
         7kTqTGFl/3gFCzqqyInh6ZFsk/woFDmEUYw5QDNB9c3s3pzHxrBqasTxPbg2VDA7mccH
         2ckLZtpmQc67bJdkzq0oB97itV9TZzZ6/6e2ifYVj93gkbX9EBo729TmuVFQEAwxFYRD
         HUtg==
X-Forwarded-Encrypted: i=1; AFNElJ+ctAfeQksHw/mP0Sduv4m5vfKo1/EepSLlAIqxUQz/wUa/lpINEkmWAk9OCQAt5IQ2nKFmfeMSdbekvaTcr6Z8@lists.infradead.org
X-Gm-Message-State: AOJu0Yzd5+whKxLE/7IHeT2RsKDwy9F5k/iIgVfkVPc2BhidAl5Pt8Sj
	8MYd5n8K1z8IHU7Lg3MxDrefvp6RDsPErOdmkB0/S+uiIGGjMoKtjNUq
X-Gm-Gg: Acq92OGvrvWfgCYb9LENGgti/tzwm43AznWIQ12jRZSNrMInNL1MzE+o4UFRqJDFAcw
	ri9929LE2qLoYyvDz3E38bhNIrCtz7tSqtJHWMwC1kFylEuA9CCliTXgaMkL8qHymXYPeVLYZ+O
	vX+khzickyQuzyzMLqHz3nvbYfEZX4Pg6d/mLlU8tHOdV99h5lnz0dNvIxN10jqGFfzN1CFuOAH
	VbDWmrjWHsvY2zz+Xux/Ob7oAZQgZGkypwoyph00nDhNYiBSmpJ35NEs8akBR+/e+Mz6BXhhliL
	yqHh9Iw9vW6dqtOkDjkkFCuK9i8p60LYbXWRlJNmAP1wchhKMaJFdLgz2TYWYAwr4mT2JdK/zEA
	xPHiFf4XepRHaGHAJiLoX0kV8iFc0VXXRKem/dKT6WIB7gSmyEIl1q2jBmrEb9XEzJSHUzO+Wdz
	wTtz/4ZbV8c8h2UQB++cXyVDR8dNF8PE6IWZMWI0he9xPSp5ro0kT70w==
X-Received: by 2002:a05:600c:3153:b0:490:e5c1:b897 with SMTP id 5b1f17b1804b1-490ec4fe7c2mr195111285e9.20.1781533122746;
        Mon, 15 Jun 2026 07:18:42 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-88-103.ip49.fastwebnet.it. [93.34.88.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492202edec6sm283566035e9.3.2026.06.15.07.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 07:18:42 -0700 (PDT)
Message-ID: <6a3009c2.561280e1.2acd9f.2f06@mx.google.com>
X-Google-Original-Message-ID: <ajAJvXT9R7UrMqQA@Ansuel-XPS.>
Date: Mon, 15 Jun 2026 16:18:37 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Saravana Kannan <saravanak@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, llvm@lists.linux.dev
Subject: Re: [PATCH net-next v7 01/12] net: phylink: keep and use MAC
 supported_interfaces in phylink struct
References: <20260615122950.22281-1-ansuelsmth@gmail.com>
 <20260615122950.22281-2-ansuelsmth@gmail.com>
 <371a1df7-084c-4431-bd00-0045298e3212@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <371a1df7-084c-4431-bd00-0045298e3212@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_071845_184336_A62360E1 
X-CRM114-Status: GOOD (  26.23  )
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

On Mon, Jun 15, 2026 at 03:33:34PM +0200, Maxime Chevallier wrote:
> Hello Christian,
> 
> On 6/15/26 14:29, Christian Marangi wrote:
> > Add in phylink struct a copy of supported_interfaces from phylink_config
> > and make use of that instead of relying on phylink_config value.
> > 
> > This in preparation for support of PCS handling internally to phylink
> > where a PCS can be removed or added after the phylink is created and we
> > need both a reference of the supported_interfaces value from
> > phylink_config and an internal value that can be updated with the new
> > PCS info.
> > 
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > ---
> >  drivers/net/phy/phylink.c | 22 +++++++++++++++-------
> >  1 file changed, 15 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> > index 087ac63f9193..4d59c0dd78db 100644
> > --- a/drivers/net/phy/phylink.c
> > +++ b/drivers/net/phy/phylink.c
> > @@ -60,6 +60,11 @@ struct phylink {
> >  	/* The link configuration settings */
> >  	struct phylink_link_state link_config;
> >  
> > +	/* What interface are supported by the current link.
> > +	 * Can change on removal or addition of new PCS.
> > +	 */
> > +	DECLARE_PHY_INTERFACE_MASK(supported_interfaces);
> 
> Can you clarify a bit what you mean here ? Is that the combination of the
> interfaces the MAC supports AND the currently in-use PCS ?
> 

Combination of interface the MAC supports and the currently attached PCS
(not the current one in use)

The fact that it can change is due to the fact that PCS can be attached
later and supported_interfaces can be updated accordingly.

-- 
	Ansuel

