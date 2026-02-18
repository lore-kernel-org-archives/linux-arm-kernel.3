Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF2ACE9A03E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 08:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s4xtdZq7ZOIcHdSeKfZqgNu8Mz/fkUqSTcDWpnIDA68=; b=Sy8wOpB6GeNJ36oOR8pTxLQ3Ro
	2BSVJe/w/pzPT0pvMnFHP2ayBpb0EMxzh2h/kAo3XecoicCMLqctMfh/2QAG7THofYNqGnSZV4/kF
	z9qu039UkilSwjBQisvbABVRAIcgQqlpduOfQW6eNK+KLouHI0cVqMZEVuSvIic+4l22tcKvJ77qZ
	d9PgEUQhtoXCSasgDOP+g+4CvEb415qGpf1lQuVy6qvymjibRco0i3dhVi7eJHu9vhHEyDlOcOfhZ
	x4GLba+fW7wNE8sp1Q+LjvZpBMtfZEsAzroCJsDpCBAQXkbH4Go+7SA2BwILgPJF2cS8/PbthgYiJ
	b93pc5Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsdPH-00000009VQr-2umK;
	Wed, 18 Feb 2026 08:59:39 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsdPE-00000009VQM-1u7b
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Feb 2026 08:59:37 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-4359249bbacso401297f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Feb 2026 00:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771405174; x=1772009974; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=s4xtdZq7ZOIcHdSeKfZqgNu8Mz/fkUqSTcDWpnIDA68=;
        b=KxU57/cl0lySbgf8VslqVgRrbuLyFHTZAZ+x/oQeKPdxD0Pjkg+pe3hEICjMrFEQzy
         coW7W2HfvoOMpU12lfyW+cJM9+fxQPJXuTZnuLeqGbzzKb0usaE/ApPJSg46LHGWvXBM
         1zAEfJLeNUjzAUs7vUBq+As7KRthqnuDH7umpQy2SRw1NR0MRL5+4KuEpqWhla5hpv/i
         wM5oF6AalSju83/gaTOMfEUgCaILGD0djKO9nmm/hMsvMDVwk/2u2w/2cWZAhxHCn2rG
         +zJ486WUFG30q+4y9g8VOikkOfKGlFpq5xLFmQG+lc63S6oNogRDlxOBdZ5czXnJDCO8
         vBuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771405174; x=1772009974;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s4xtdZq7ZOIcHdSeKfZqgNu8Mz/fkUqSTcDWpnIDA68=;
        b=evuenD2rBBZehVmXGqYh5K/LUOfU/PXmJi42V4FA+ghs2Gf0DL4gyG9QK9Ma8kvMhB
         EYjPpi2rt/pf2e3V3MD+d1l9mfRtonOIGqBi/mJC+10sW57ox+xTJ0aZJz4VlA9Hrzgb
         9Hl9wO8OKk16N0PW0WuWSKfZDUc9dJobbBe0ZQ+LCLPVbPHyYvVUuwM8nDavbmW/qNBd
         N4fSnnOTd0ybq89NZOzI/TQaWSdNkBU52JhZ/Pmu7mb6C2NsVYLhqncs5LNrehIqFsBK
         nMeV0zRtKXpzUZpdLLmJXomAiuGeqh6SeuAPtFqwROPkrO2hmkeWOuWF8J8fKD4HOfI7
         sYFA==
X-Forwarded-Encrypted: i=1; AJvYcCWXwmammXtHRhUBTX2M+AqXCraTXx/ttPz5A9ofhXHqzpuHHaddyMrXhujvXhnYlJwmOFoUu+pPRjeug+fwKUel@lists.infradead.org
X-Gm-Message-State: AOJu0YxaYKSxEzUiSHcRADxVqHOKVf3ijEu7ezqf/5V2r6clrB33p8Zj
	5LvqOcTaNrLhUltv6whuXAD0F5BaRXooG7QtZ4YeI0TepCGhXqMzAb/j
X-Gm-Gg: AZuq6aK3q/k8Vp7cwJbtB1XaW/7iNcVvPyQMHy+pUbS7JPwikfRO5l5Q6/UqPY5pmv2
	0xE/NPCWV5xMkQoFw7cTpBde/r1ASkrByWRdD4sg3Gm51NbKkeYFIKdu9dPxw2R4MzI5HSIqQN2
	ftOq1SfjvKZzc0qV05sVTjk3QdJ9t5rfw6ZKUNS7/Sz1r1SEzOXXBaEzYQ3T3+kSznS4DaYOP4i
	kJWjYpRsGgjbYQkX0uy9/pq6gJkzoEsM9MaZxr3vHH/K2V/kf9FXQt5Zd3bCK6Tqr5H0R3iPPzU
	/kgRZecRm3hzfyS/dXczCqmMTZA5vxhiZ7QKSHQR+hzP7ksovw4duzeEOLM/qcEFy9LZtxx6dI2
	sIA1OLorgHRHXZJqL1c9XmxaZIfMZoywX8cXth3C/nj3HyOtSid/zquqTT3VeKja1U/ja+stNJI
	qkQGZ0A5iQxt1BU+MO1y00rNmIsHpnLyBbakM3pJ9Khr9sbSHpH1qBdwKy269oNZ+KN+ip17/jn
	LzSBDjNCtdoaFsMUMjRlAQjFzga0xL/tRCQ600npYUmJpY=
X-Received: by 2002:a05:6000:2410:b0:437:6b6e:d108 with SMTP id ffacd0b85a97d-43958bfe6a7mr1881588f8f.8.1771405174240;
        Wed, 18 Feb 2026 00:59:34 -0800 (PST)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.vodafonedsl.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796abc85csm39968574f8f.22.2026.02.18.00.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 00:59:33 -0800 (PST)
Date: Wed, 18 Feb 2026 09:59:31 +0100
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v1 03/11] arm64: dts: freescale: imx8mm-var-som: Update
 FEC support with MaxLinear PHY
Message-ID: <aZV_c0lmBwjOI_Ep@Lord-Beerus.station>
References: <cover.1771353301.git.stefano.r@variscite.com>
 <3b984b93a43a07bc9c4f6414a08a3a0f45daaaa8.1771353301.git.stefano.r@variscite.com>
 <31f30651-7c99-42cb-9e27-e4806529d137@lunn.ch>
 <aZTCGH1rKWdvYg5-@Lord-Beerus.station>
 <fceeda41-66cc-4bb2-ab53-d4b1ec25348a@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fceeda41-66cc-4bb2-ab53-d4b1ec25348a@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_005936_874154_8365D42A 
X-CRM114-Status: GOOD (  23.88  )
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

Hi Andrew,

On Tue, Feb 17, 2026 at 09:43:16PM +0100, Andrew Lunn wrote:
> 
> And here you loose me. RGMII is between the MAC and the PHY. The PHY
> is on the SOM, so there is no need for RGMII to leave the SOM.
> 
> MDIO is can understand going to the carrier, because there can be
> other devices on the bus, such as an Ethernet switch.
> 
> You say the LEDs are not on the SOM. So they should not be listed in
> the .dtsi file for the SOM. It could be the RJ45 is a cheap one,
> without LEDs. The colours will depend on the RJ45 socket. It could be
> a single LED is connected to the front panel, which is typical of STB
> etc. So the LEDs are a board property, not a SOM property.
> 
> > > >   Two LEDs are defined to match the VAR-SOM carrier design:
> > > >     * LED@0: Yellow, netdev trigger.
> > > >     * LED@1: Green, netdev trigger.
> > > 
> > > Where are the LEDs? You say "carrier design", so are they on the
> > > carrier? The DT properties should then be in the .dts file for the
> > > carrier.
> > >
> > 
> > The LED signals are driven directly by the PHY and originate on the SOM.
> > They are exposed on the SOM connector and are typically routed straight
> > to the RJ45 integrated LEDs on the carrier.
> 
> The problem here is 'typically', not absolutely required, otherwise
> the magic smoke will escape making the box useless.
> 

You are right sorry for the confusion: RGMII is internal between the MAC
and the PHY and does not leave the SOM. What is exposed on the SOM
connector are the MDI pairs towards the magnetics/RJ45 and the PHY LED
output signals.

Given that the actual LEDs are implemented on the carrier side (RJ45
with integrated LEDs, pull-ups and LED supply), would you prefer that
the LED description is moved out of the SOM .dtsi and into the carrier
.dts?

My idea would be to keep the Ethernet controller/PHY node fully
described in the SOM .dtsi (since the PHY is on-module), and add only
the LED subnode/definition in the carrier .dts where the LEDs are
actually present.

If this is the right approach, I will apply the same pattern to the
other Variscite SOMs where we currently describe PHY LEDs at the SOM
level (e.g. imx8mp-var-som, imx93-var-som).

Thanks again for the review.

Best regards,
Stefano

