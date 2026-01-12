Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF9AED2505C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 09:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pH7l/IngScfdGsuBC+TU2Q1UG3VpnMUzYFClpTkwAAs=; b=k102XNzRiZqX7W0XkssAR1oBMA
	XscdsyjoKxvOxrm7jGyi+I6GvyjPUdr6XS9/3OB+6tb26RKXC51KuJ71ZgxQbjdvBdMiGHUtpFOC7
	TG4+Cau4SRervX6GXFQvPQBlp8XqQvQwqQDrC/ipfXwEDWabrA01OJ646K11HrlHli3H7uy6Rtp+/
	mZRiylq93rqzhYPR/pM4I7GLofT0qwUyohGE9RuqkQAOr3Y9LjpibeacOmAIylEUlBIlJpmwb1Oci
	0svss1meuV7NQvrJh1UHLZzZYHU9wbgR4fClbf90CIY93CMS4uZETVq8zpvnTBWHZ/yibAiQnoQSB
	biRRNXjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfE8r-000000054tj-2sT8;
	Mon, 12 Jan 2026 09:23:17 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfE8o-000000054s9-3aXF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 09:23:16 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-47d1d8a49f5so39683785e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Jan 2026 01:23:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768209792; x=1768814592; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pH7l/IngScfdGsuBC+TU2Q1UG3VpnMUzYFClpTkwAAs=;
        b=Sf6q/4WHQA48v+/GgvVioGRmrg8ojJjxPyrnBLJuxOjzhAxJ8+aeEmp85bqn580icP
         ctqnzEDch/HD+hfGUDsYUIECO3xeneAenxKzOUxyvhn0sKPU/2ur086I5lv2e9taQgiy
         L0pT8qzNKoN8AM1F8Uko2hO9QmbD6hTk9g6f080w2uG14Kn/ofEBqh1lZLeJ2h3v9hgC
         O1mLmNpiNmi4GjtMHhZzNjw0pTE13ZbX5Tl9ORZ0zDnoL1y+YzpB7kJJh59i6NsglxeR
         47RbdOWw4BoUUmC7geCceQAPIJK1osE9aR6UiEndAX4Sz8c38ELD/F5BHpsPoyIZnnhe
         CPqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768209792; x=1768814592;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pH7l/IngScfdGsuBC+TU2Q1UG3VpnMUzYFClpTkwAAs=;
        b=aGzlUrl+9Vd1lk0Rzcy6epRyr80wYshWKXDOykYL/pI4PhLxmBY5UTlXRLERNHZ3hH
         TyNTuaPPi7KZdbslsxPrEFHIW0ByW+WmNOb0Bc2Rc2OGifF5uHYo0ZsHx1MOclq5tok5
         tEqwX3iubjkKSOlrhj3QGkWgMEOzR1mc/8pQrolNhb88gVyARTEzwj2fy1s1zjiX/RCr
         1kSMGLKZawD6tqnAtMw15bU9XvfCIi0TfSl0wC7KOGeAesFOqzpVVpIG/ata9okseMz5
         AOF/zxf8CQUq4gODya12cKIDy2bQ1hMUdDbtbB1lFmofTUkIlbPZj9Vzb04jIniYRyws
         c0Zg==
X-Forwarded-Encrypted: i=1; AJvYcCWq99OYCihMylIW5EydmK9sEGkGS9KsT1VIy/u/iESmmYILKcRrJEmV/5tye/pac/B8vUtH4vzZioebFQiZOaNq@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8d12sN/HLOVRHrb2hN6GgZOhi/1e+Hb2mShC/jUSj05usQnBL
	pzHJKOq44YazkWniNzGLZ212rzC4MbxGaXCtB+JX3FuDcxswrbT/l+7n
X-Gm-Gg: AY/fxX4mjwY/UQWx3zZTti/5VNT/ZJhnzaDzZykRiVT1vx6OOZdoQX2ac8+1Q9/jJ/R
	lP9uzX2hIYn/C+YgmBf+zD7zlDvPHpdcsm678LJaIdaBqumS1BYCfK486xZPgIkixnNNsTQyQ7V
	ycpeaF1g+KVxgcrFB0nRh6EF6pgyeJ2Plkw8ZGCx4RYsWoa5PwJgj1OIJhZw2CNmOsR8fcl7Kge
	2fZDNng/tSdI3nzplBHPFbpXPomAhwJUBqXs9C3K7cnvObv7cFvj+LXMZdbFFTvFau1AalIbyap
	V6lKCA9VKJNdcoQRenAVFeY0uPDDtda7tOXFHIzP0Fr+IgZcGOxbypcdtyAYkZqBHnUMOK9JqzX
	hLOdI8mW66hNMRwgynyXqOyWo7uRaH2Mn1/aLPR5krlD0XWAGumyBpL6kiN2NwxlTNk6DWh35FC
	r8YaUVHQA0wck=
X-Google-Smtp-Source: AGHT+IEgPar+mXM5tZEw8XTR8zGlfzWecvjpL3x+Bjt2enom7FVlV7Q9qKVKAMWvUj+uzL/JY/TX0A==
X-Received: by 2002:a05:600c:1d0c:b0:471:700:f281 with SMTP id 5b1f17b1804b1-47d84b4093cmr171075305e9.25.1768209792166;
        Mon, 12 Jan 2026 01:23:12 -0800 (PST)
Received: from eichest-laptop ([2a02:168:af72:0:6091:7b62:54d8:ee9e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f41eb3bsm357831195e9.7.2026.01.12.01.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 01:23:11 -0800 (PST)
Date: Mon, 12 Jan 2026 10:23:09 +0100
From: Stefan Eichenberger <eichest@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com,
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, francesco.dolcini@toradex.com,
	robh@kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: Re: [PATCH RESEND net-next v2] net: stmmac: dwmac: Add a fixup for
 the Micrel KSZ9131 PHY
Message-ID: <aWS9fbfvuayJpo3a@eichest-laptop>
References: <6ee0d55a-69de-4c28-8d9d-d7755d5c0808@bootlin.com>
 <aVuxv3Pox-y5Dzln@eichest-laptop>
 <a597b9d6-2b32-461f-ac90-2db5bb20cdb2@lunn.ch>
 <aVvp70S2Lr3o_jyB@eichest-laptop>
 <aVvwOYce1CFOLiBk@shell.armlinux.org.uk>
 <aVv7wD2JFikGkt3F@eichest-laptop>
 <aWC_ZDu0HipuVhQS@eichest-laptop>
 <8f70bd9d-747f-4ffa-b0f2-1020071b5adc@bootlin.com>
 <aWJXNSiDLHLFGV8F@eichest-laptop>
 <aWJ0iV6-_4XqpeHD@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aWJ0iV6-_4XqpeHD@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_012314_937725_3043A70D 
X-CRM114-Status: GOOD (  25.24  )
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

On Sat, Jan 10, 2026 at 03:47:21PM +0000, Russell King (Oracle) wrote:
> On Sat, Jan 10, 2026 at 02:42:13PM +0100, Stefan Eichenberger wrote:
> > Hi Maxime,
> > 
> > Not problem, thanks a lot for the feedback and the discussion. I will
> > then proceed with the current approach and send a new version with an
> > updated commit message.
> 
> We could add a flag to:
> 
> /* Generic phy_device::dev_flags */
> #define PHY_F_NO_IRQ            0x80000000
> #define PHY_F_RXC_ALWAYS_ON     0x40000000
> 
> indicating that the MAC requires the full preamble, which the PHY can
> then test for and configure appropiately.
> 
> The question is, whether the requirement for the full preamble applies
> to many MACs, and whether there are PHYs that default to producing
> short preambles.
> 
> Looking at Marvell 88e151x, the only control it has is to pad odd
> nibbles of preambles on copper (page 2, register 16, bit 6.)
> 
> AR8035 seems to make no mention of preamble for the MII interfaces, so
> I guess it has no control over it.
> 
> I've not looked further than that.

From what I have seen only the S32 and i.MX8MP MAC require the full
preamble because of the errata. I also checked the i.MX93 and i.MX8DX,
they don't mention the errata, so I assume they are not affected.

Not sure if adding the flag would be a bit overkill. However, assuming
we would do it that way. Would ndo_open be the right place to set the
flag in the mac so that the phy knows about it?

I would think about something like:
- Add a flag STMMAC_FLAG_KEEP_PREAMBLE_BEFORE_SFD to stmmac.h
- Add a flag PHY_F_KEEP_PREAMBLE_BEFORE_SFD to phy.h
- Add STMMAC_FLAG_KEEP_PREAMBLE_BEFORE_SFD to priv->plat->flags in the
  mac driver platform probe (e.g. dwmac-imx.c).
- Set PHY_F_KEEP_PREAMBLE_BEFORE_SFD in stmmac_init_phy (during
  ndo_open) if STMMAC_FLAG_KEEP_PREAMBLE_BEFORE_SFD is set under
  priv->plat->flags.
- If PHY_F_KEEP_PREAMBLE_BEFORE_SFD is set in the phy driver keep the
  full preamble if the phy supports it during config_init.

I could send the next version doing it that way, to see if that's the
better approach.

Regards,
Stefan


