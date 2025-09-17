Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACF0DCA0EE8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 10:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OkQ5W8f0VgiP6PCTsWWJrbImt94RgIZfxXIr4G30wgQ=; b=wluIBQZdFfnLddXKurp9UvFAKQ
	ScorQGCvvTsDN7E4EoLFx9a9Ms09uiuMqd8QIZo1wL6ZIUWuwQzOC2urdoeeaZnyPJ+MzaNzVJ7an
	G3hDaBgflpMvk0FOv20ovWcWSUCkl3kCeOJCGROXWwBeIrVCFDzSQ77NaYPNXZwuV7jgv5q6mKpNJ
	q3G8IQiZJwibw5AyMCJ5k5G9o42TPuNHGmtkOSii+dy+0tFwnpIK+F/P15enCyn5g4Qp1e4xZ4xTO
	8VIIvTti2Stz/PZtJgObDug+452o4Aii4PjzIgP+tBPRYtspH94Fg1F1OP4/A0n4VztJCWlH1bi1v
	kQc61QYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyp7d-0000000Aux6-2dqw;
	Wed, 17 Sep 2025 10:10:45 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyp7a-0000000Auw7-3Mrn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 10:10:44 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-45ddfe0b66dso13759095e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 03:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758103841; x=1758708641; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OkQ5W8f0VgiP6PCTsWWJrbImt94RgIZfxXIr4G30wgQ=;
        b=j7IysEYssHoQwXI4mLk+DrWL5IVD6BeGoq1oNyin/wi93sjSog8lQzFWiNOhgN8+Dg
         eJ06VcqFF5s+E8sXRGmv5ZY3ONNM9rMBbAdJVrbvfzUabQL2BNtxxZR7GMnl0bffpijf
         f6VDlRe9BpcqcKFRXKg8wdg7kcyCcx29fZj2ywAScVZQ+a3+C4VrXEbbKYpFTLk5QeNO
         5H0iegPkDIDM7JHl+yClqYrEmx18pnMYRjzNmNxWhbpVdDcAIeviR63NH9t+cyuJTn22
         jWtaYqIqcadKqjvUw6Su4Fz6MFH3M0Z1ljtzjTyaGn2T4QAZGSMOOHRujJ3aXiyAcxgf
         Vm9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758103841; x=1758708641;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OkQ5W8f0VgiP6PCTsWWJrbImt94RgIZfxXIr4G30wgQ=;
        b=cvGAiiImhyQfwZUD1Uyh6jnjR8QmkYB7UqABY27HfOR5PqpW/rBTahA2++FNCUVJBw
         ziQj1H4B5UOA/OwUv38a5AyVvQStKnN89yS9f7WmoRIFS2s1/6AWzLustVo9CGkHH4ng
         mhVRry8OsDrKllTpWMyuQksmedEniKcfnHvCD+/5eI3vd+PDX73zZGIVC62cSVkV/bXP
         OP1t7aTadHQLvT5U0y6iB6DqsDrMx/ibmN6z/7Ysu5ZFzVbHiiIOkwNMHmIMgjowafsZ
         fN88+L5NeFRYbj363QRnKlxOPuX8ilwtxcITYrfnnJxRRjayFrtC4EyIV3dSlc8MYUP1
         4PqA==
X-Forwarded-Encrypted: i=1; AJvYcCUTmJ5r1tvF1ZgmGViAuEO45RHbVz9qM3tgWiRpb++kJXhpzLnlx1SNaWppyKFlD40K/NfPOyEhy60bdxxahBrc@lists.infradead.org
X-Gm-Message-State: AOJu0YzwL9J6CakHZGTtkyvBGTM/b3RZQEK/cktLkHP/hJVaFgCAYsSf
	KxFwwhCbkENJFXt1DBKPPgvE5erTrNXA/ReCGZoNP084Li3VS8+BXPpV
X-Gm-Gg: ASbGncsD7DlSa+4wlSrG4QkMfd1oUbXV/DADwo+BZIBO6wvZKg1XenxhLbZZOZuv6Gu
	uqdjqiJEPyvhWUSVqlvppt6vqqj6jqaojGIvWYyf5K7q8+yLfupXkLKPzi/GOCNwQF2VSzFO8yc
	u7QIW4dkiVHrg+AMt90z5CNe1PWq8Eie97heRaModFeCrKeAOZvqOHysB6gjXeGpZpIe3nlBJWe
	ylMzRkF6lDGpnJWgOm6ia9dam1qUjFGUkHU218m0CjU/KE7QgbX+vsbxax2lpoxR3EBTr0lOt2B
	RPHh2KxSzw2io83qUkWR5ZRPXZIIfXhKnxTMdyZsv5zvTfu8/siXxYB2BYA6393dVyXrMd9jQWL
	i7+bZvJdVeF5rMcE=
X-Google-Smtp-Source: AGHT+IEEatHJpLubzoy4lkQ0hIsi84UEkNPErsL1pNTYQeBGmM1JX4r+iiCRONDCh4wUnphpFnKYhQ==
X-Received: by 2002:a05:600c:c16f:b0:45d:d57b:69bc with SMTP id 5b1f17b1804b1-462074c689amr8001385e9.8.1758103840619;
        Wed, 17 Sep 2025 03:10:40 -0700 (PDT)
Received: from skbuf ([2a02:2f04:d005:3b00:8bcc:b603:fee7:a273])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45f325c3c29sm37511495e9.3.2025.09.17.03.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 03:10:34 -0700 (PDT)
Date: Wed, 17 Sep 2025 13:10:31 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Simon Horman <horms@kernel.org>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [net-next PATCH v18 0/8] net: dsa: Add Airoha AN8855 support
Message-ID: <20250917101031.drg3qairsrinucbl@skbuf>
References: <20250915104545.1742-1-ansuelsmth@gmail.com>
 <20250917092807.uui2qwva2sqbe6sp@skbuf>
 <68ca8217.050a0220.81571.9fda@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <68ca8217.050a0220.81571.9fda@mx.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_031042_858225_CE13E08C 
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

On Wed, Sep 17, 2025 at 11:40:36AM +0200, Christian Marangi wrote:
> On Wed, Sep 17, 2025 at 12:28:07PM +0300, Vladimir Oltean wrote:
> > On Mon, Sep 15, 2025 at 12:45:36PM +0200, Christian Marangi wrote:
> > > It's conceptually similar to mediatek switch but register and bits
> > > are different. And there is massive list of register for the PCS
> > > configuration.
> > > Saddly for that part we have absolutely NO documentation currently.
> > 
> > Please add in the next revision a more convincing argument for not
> > reusing the mt7530 driver control flow. Regmap fields can abstract a
> > lot, and the driver can select a completely different phylink_pcs for
> > different hardware.
> > 
> > I don't see in the short change log included here any mentions related
> > to the mt7530, but I'm not going to search the mailing lists since Nov
> > 2024 for any previous discussions about this...
> 
> Ok will add additional info.
> 
> But In short the FDB and VLAN part are very different. The FDB logic to
> dump entry add and remove is entirely different.
> 
> And the mt7530 itself is full of unrelated function (specific to the
> first revision of the mt7530 switch) so I have to move lots of code
> around.
> 
> If asked I can do it but I have to also introduce lots of extra change.

Ok, it would be good if you could point to an ack from mt7530 people
that they're ok with this choice and motivation.

> > Do you know why it won't receive PTP over IP? It seems strange, given it
> > receives other IP multicast (even unregistered). Is it a hardware or a
> > software drop? What port counters increment? Does it drop PTP over IP
> > only on local termination, or does it also fail to forward it? What
> > about the packet makes the switch drop it?
> > 
> 
> From what they said there isn't any support for 1588v2 (PTP) on the Switch other
> than L2 (that I think they simply forward)
> 
> I can ask more info on the topic, will also check what counters
> increment.

"Don't support PTP over IP" can mean a lot of different things, but I
don't expect "let's drop it" to be expected behaviour. Being a
PTP-unaware switch (which doesn't timestamp event packets and doesn't
participate in the protocol) is an entirely adequate and basic use case,
and we aren't even requesting the switch anything other than to receive
these packets during the selftest (no timestamping). But it doesn't seem
to work, which is bizarre. We don't even know if the problem is specific
to PTP or is more widespread. Maybe it has to do with the UDP ports 319
and 320, maybe with the particular IP multicast groups...

