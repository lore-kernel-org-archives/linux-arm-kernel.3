Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DE76104891E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 22:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k+TH6jAGK26TrEc9oITkY4dihAUESin1rX1KN45OKxY=; b=Ixb2OTy5ldK1ApPfOPlSgb6ku/
	eRSvrKYq6liP1qYKUP5tjlrvhJKuH57AQTSbayKg/pPJ0X0z5oT77iKl9qZZlYqYHMmAOHvwsqhv7
	csr34gTwhWkYgPR8KaV85Jr3omYYVK7vHjEmKbXVbCuKC8qh9czxrdPPTQS5L/5YgW7JEpRMy7cP3
	VDIn0Hclbf61h82N+mRcjpDWUeo4kBGb/ELnCG2meshRDwJVrdBPLsotw1Aq4rElW4xeMtrnnXoBj
	2xeBMH+txHI3PgG9g2qNtaR2GqJJeLxXPGwnydrjx/LXra9AG4o0+Ef1Rhy8oNksyM2siUMd+4j/H
	0hZ4JGLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw6cR-00000009ExS-3zDa;
	Fri, 27 Feb 2026 22:47:38 +0000
Received: from mail-vk1-xa35.google.com ([2607:f8b0:4864:20::a35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw6cP-00000009Ewj-2QNr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 22:47:34 +0000
Received: by mail-vk1-xa35.google.com with SMTP id 71dfb90a1353d-56739adfa1aso2107574e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Feb 2026 14:47:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772232452; x=1772837252; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=k+TH6jAGK26TrEc9oITkY4dihAUESin1rX1KN45OKxY=;
        b=YPqqRARkYOVGjTlhOedU4SnPv2V6Gs6F+oXLjS2wDNe+IRVUyM82G01YGqXzvLEMux
         U5THpmJQMBmrJscKCAcM1ob6w0CJ1BaiduZho8cwhjarOd8AxYcQG/i6c7aZUnuUC2+R
         Z9xgu7PAoLLS3hucuvnhVzHkgsf9BQvRmQtCTevmr3qoqiKpPcCf67ltURQqATIAhArR
         x4n97SGH/o/mMhx48rOMyaXi4YKSWTO0ra77BHzaLIEundvS/54f3js1IMd3v7Zu4M5d
         v7K4iBrM4XD4rGb+cRGtAQRf2BH6q3DrnUey20oSVnpJbsXvhyzj7Sjg2DVtjPJnIeSt
         ogVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772232452; x=1772837252;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k+TH6jAGK26TrEc9oITkY4dihAUESin1rX1KN45OKxY=;
        b=hkFAaSvQtN+OETF46aI4/g14ynzYcNrYu7U8SMxDMv5bT9xiPfA8r59g42glFWIud6
         KKGWfPWlWpFhtPIajOYStplVK/oIfLZdc4qPSzin3/wHVQk7c3LpOkTKZSnnRhMriWte
         gwtFn0VLuU9ekisDgMwTgj5JKQpGpwL8w/Dp9WJbf/AVErRFZxGUBx3em8UJvduIRGDh
         3hzt/1qQCvPiOP4yur9B9bXbzhPhkJo9iJ/7FgcnOmjnKcFJqrk4hyy06fM696arCrtf
         4JLghwxPyiSDezZ5feKCsl0DQLoE9+w7v1o0VfESMJV8WgUhj/f6jnQBkEs+7m264RYd
         igog==
X-Forwarded-Encrypted: i=1; AJvYcCVnE5dnEisKMi5uiRQGzHkQP4anAtHgsKRB/sc42tqgTaS3lctGDsDPA1urla5QIt1G1D5c9/gUxexEgUX2UwQ8@lists.infradead.org
X-Gm-Message-State: AOJu0YxWEUMc8rAnK1OWvw4F2OxgVSRNBlz0S7pmJPvmCCCEup+tFda0
	EFbVu18doG6LrguQo5A4LX90k+XFFhTlggh21i0nrU3yAGxub7jQYo2K
X-Gm-Gg: ATEYQzwshN6IC5ItvUBhOo9NWjgxtViwTOWBCsvVheE1B7ABXwJ7I22nsbOrcct8SKB
	BsTbA8adBdztfy+wS/2r2fO2jgjIikNh+8PSkWzwCcMFgTJWrClC91KQorHGJdOd3UGt6xVPkcK
	lbtXOjeixlStts2zI1fsTiF2Ms33qRB4XT7gRvhaqlz73Fr8eipuYldoiu6NPapFADrJY/An8R2
	UEDZB8CAO7nbpqEqViUrhySYZG61ZR72VnLq9r/fqyHSTdHaJJHPlW+IHx+mj7fVsk1ga/cFpf4
	z3VN9BS5izuMih9ktV3KqjEP0T28O7tgR+gmQR/eCraaDULTsyLgKr5vJnLT+gGOCqz2uxzqo5H
	Z7I1vWJW/Ru/tlflDPSilpG2TW3iaIsvq4iiN8XOkbMQW2pPUQMbndNzD5iHbSBgJV3acfYBlg7
	oqrWa0+BuvVg==
X-Received: by 2002:a05:6122:4b08:b0:566:3c58:efcb with SMTP id 71dfb90a1353d-56aa09ebdcbmr2825977e0c.3.1772232452162;
        Fri, 27 Feb 2026 14:47:32 -0800 (PST)
Received: from geday ([2804:7f2:800b:feb1::dead:c001])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56a91bd2291sm8103706e0c.9.2026.02.27.14.47.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 14:47:30 -0800 (PST)
Date: Fri, 27 Feb 2026 19:47:23 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Dragan Simic <dsimic@manjaro.org>
Cc: Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/4] PCI: rockchip: drive at 2.5 GT/s only and error
 out other speeds
Message-ID: <aaIe-_WCD7s6Cd5j@geday>
References: <cover.1772169998.git.geraldogabriel@gmail.com>
 <9e3754ee0d1f5bc8051e28e1a5b8c046440456f5.1772169998.git.geraldogabriel@gmail.com>
 <b44e454e-f98b-4505-5603-bfc4455d11b9@manjaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b44e454e-f98b-4505-5603-bfc4455d11b9@manjaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_144733_653164_000C669E 
X-CRM114-Status: GOOD (  37.99  )
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

On Fri, Feb 27, 2026 at 06:33:34PM +0100, Dragan Simic wrote:
> Hello Geraldo,
>

Hi Dragan,

> On Friday, February 27, 2026 06:36 CET, Geraldo Nascimento <geraldogabriel@gmail.com> wrote:
> > Configure the core to be driven at 2.5 GT/s Link Speed and error
> > out on any other speed. The reason is that Shawn Lin from Rockchip
> > has reiterated that there may be danger of "catastrophic failure"
> > in using their PCIe with 5.0 GT/s speeds.
> > 
> > While Rockchip has done so informally without issuing a proper
> > errata, and the particulars are thus unknown, this may cause
> > data loss or worse.
> > 
> > This change is corroborated by RK3399 official datasheet [1], which
> > states maximum link speed for this platform is 2.5 GT/s.
> > 
> > [1] https://opensource.rock-chips.com/images/d/d7/Rockchip_RK3399_Datasheet_V2.1-20200323.pdf
> > 
> > Fixes: 956cd99b35a8 ("PCI: rockchip: Separate common code from RC driver")
> > Link: https://lore.kernel.org/all/ffd05070-9879-4468-94e3-b88968b4c21b@rock-chips.com/
> > Cc: stable@vger.kernel.org
> > Reported-by: Dragan Simic <dsimic@manjaro.org>
> > Reported-by: Shawn Lin <shawn.lin@rock-chips.com>
> > Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>
> > ---
> >  drivers/pci/controller/pcie-rockchip.c | 13 +++++--------
> >  1 file changed, 5 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/pci/controller/pcie-rockchip.c b/drivers/pci/controller/pcie-rockchip.c
> > index 0f88da378805..26fc350a66c1 100644
> > --- a/drivers/pci/controller/pcie-rockchip.c
> > +++ b/drivers/pci/controller/pcie-rockchip.c
> > @@ -66,8 +66,9 @@ int rockchip_pcie_parse_dt(struct rockchip_pcie *rockchip)
> >  	}
> >  
> >  	rockchip->link_gen = of_pci_get_max_link_speed(node);
> > -	if (rockchip->link_gen < 0 || rockchip->link_gen > 2)
> > -		rockchip->link_gen = 2;
> > +	if (rockchip->link_gen < 0 || rockchip->link_gen >= 2)
> > +		return dev_err_probe(dev, rockchip->link_gen,
> > +				     "Invalid Link Speed\n");
> 
> I'm quite surprised to see what happened here in the v4?  The changes
> introduced in this diff block in the v3 were perfectly fine, i.e. we need
> to correct any runtime occurrences of Gen2 speed setting in the rockchip_
> pcie_parse_dt() function, together with emitting a warning that urges
> the users and the board dtb maintainer to fix the board dtb.  I'll get
> back to this below.

I see what you mean now. Sure, this could be incorporated for v5 without
a problem and is the more proper way to solve it.

> 
> >  	for (i = 0; i < ROCKCHIP_NUM_PM_RSTS; i++)
> >  		rockchip->pm_rsts[i].id = rockchip_pci_pm_rsts[i];
> > @@ -147,12 +148,8 @@ int rockchip_pcie_init_port(struct rockchip_pcie *rockchip)
> >  		goto err_exit_phy;
> >  	}
> >  
> > -	if (rockchip->link_gen == 2)
> > -		rockchip_pcie_write(rockchip, PCIE_CLIENT_GEN_SEL_2,
> > -				    PCIE_CLIENT_CONFIG);
> > -	else
> > -		rockchip_pcie_write(rockchip, PCIE_CLIENT_GEN_SEL_1,
> > -				    PCIE_CLIENT_CONFIG);
> > +	rockchip_pcie_write(rockchip, PCIE_CLIENT_GEN_SEL_1,
> > +			    PCIE_CLIENT_CONFIG);
> >  
> >  	regs = PCIE_CLIENT_ARI_ENABLE |
> >  	       PCIE_CLIENT_CONF_LANE_NUM(rockchip->lanes);
> 
> At this point we need to check and bail out if no longer supported Gen2
> speed setting is received, which also applies to the appropriate spot in
> the PCIe endpoint driver.

Right, it is a bit of a double-check I think but it can't hurt.

> 
> To clarify, it's the responsibility of the rockchip_pcie_parse_dt()
> function to validate and possibly correct the speed setting, because it
> is what receives that setting as a value from the board dtb, while the
> consumers of that validated speed setting should check it, to make sure
> the speed is right because they no longer can handle requests for Gen2
> speed, and simply bail out if the received speed isn't right, i.e. if
> it differs from Gen1.
> 

Like I said, it ends being a double-check, because we can't let probe
progress if link_gen ends up being different than 1. Either we force
2.5 GT/s with a fair warning or we error out on the probe already.

Thank you,
Geraldo Nascimento

