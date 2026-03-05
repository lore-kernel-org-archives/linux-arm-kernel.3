Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1ACAEFCE5F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 04:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dcwLPgCuX5qGk1VO8dlUrj59t6r//UFI20kbYxyl5TI=; b=Tojae/KrIYLst4LziVbMflDiaA
	UVsYurYSG2Z5d6sNRaqNK6bPbe4vavvV4qGc4tcjJD7iP0gOo/4xOwFrrV5z6EuHIjyXfdmMvUnAi
	lz8EDchz0whGX68v9bY/ybm9IEjOP9wnpIfsItN4S6JoRt99OpSVF1EPRj9Z2Iw8IB7yEeAL7MOo8
	EW9yZE7c374eM3XvqyJ+VeaoM/A/UksLIKmMWqLbCuWRHtKzR12Av459tWYtodd6eE8EdUc1caFYr
	j0/poz45dDB9HeV4e4QoBrOIq4gvxYRxJzhcTSgO+UfjRaWinCdtVAEeJSTMOCCUixqcipXbRD7wy
	UEyJjFYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy0BM-00000000tFG-2wLH;
	Thu, 05 Mar 2026 04:19:28 +0000
Received: from mail-vs1-xe36.google.com ([2607:f8b0:4864:20::e36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy0BI-00000000tEQ-0yiY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 04:19:26 +0000
Received: by mail-vs1-xe36.google.com with SMTP id ada2fe7eead31-5ffb61b0babso743447137.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 20:19:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772684362; x=1773289162; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dcwLPgCuX5qGk1VO8dlUrj59t6r//UFI20kbYxyl5TI=;
        b=VLbnNrJe1aFsbmZ4hEleEF7ZBYbwx2PpKL1d2nc90b5GHxpyirFxxrNbFCAOAxEqIo
         wmV9i9qjWyFcRtZdyaGBV+dWJedtrEB2zEodrT2DtcnUVOXI4UWmWItb8ke/2jdIv1C2
         R1Q0BlE1B/zlQ5HBbVCwGKy7axqYxDtSmrwQABVDLZozGjTFhdAsLCBrTY1cIyAyf9Bh
         /me9lBqS4SucC+fFJrOT59FQsHWARJq/i9vFYqLYy8NpcLTGz/A9k8T0fPSdhTD+XdgY
         DeYlz57Kih2zBeqA2gzEgTT/zuLNnekICdi2P1MiClIO4D4urWIs2ipKu2tKNv3UuwfI
         0vow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772684362; x=1773289162;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dcwLPgCuX5qGk1VO8dlUrj59t6r//UFI20kbYxyl5TI=;
        b=khgFMKVAEHZf6UUXIingT1lXLF8b2UeiFouk9KsUmPpwffIJ5AEJ3zcA1XkA0cDiHU
         16H6I8kGZDc4pF/FR2UUbtoJL3E7BWbDE8SfRLID5ntqr7b207Ijz5+DgmKmfP4rdikj
         kq9UweuPXkmU2yJE6RhVYpNlRssHLkvY/wVkTC6W77zLihCqv2Glz0ImgwjUxFVm4TS+
         6FfMYDEnrHjR0t16gTM+u1/U+cxJqRgpmsPykbrsWgUnelaYIbFqLvlgXUgLSPZws4pl
         eMTsWX6P54FyxU5Wrw6mYJOtEKwqaxOgkrWRpjOzBMefVgaWrAq1TGc18jAmpPBkH/ch
         3ajg==
X-Forwarded-Encrypted: i=1; AJvYcCXnAssqV9pPPIjuqzxobs41Jrh/38LqMeasy1G8M4APADH4bNuK91OyW4bOBaEqLzph/t6lXuAhiwzyM8u/LHE4@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4haj8AdgS8NpP3ghq/Ph78Ry53bK7T4mpKFJE42tYX3BUyVBy
	oyh8alx7+8asw1l6F3eCMSV+fF2exRpRkzGZEyFt5kjFzvB0KeTDYgfm
X-Gm-Gg: ATEYQzxJE9wtNaxaQ/wNn9OgfDZEF2CFEILq7MMpIASot/1hnuaUwvdBvsrvvhHQ7m7
	dQ1N2dEKqOgNvE6+aVX6e7MfpJ8ZtvIjC9njOvwEg1iFAxoyIPtnMX3oT1kitJNk62ls27vIdN8
	uzWW3QfG4HS6EbSBCdy5pirRQsoccX/riyCba3NLZ0mUwmAHE8+WFKMQkPlzlz/aAyiNZxcFQYf
	nnlUcTKHJUTqPHWso2GJbID02O2zor/6zv+a9VhG7UkFuTjiVPtaJWWd49K6w+NiKAAraaYKqQq
	3UZaZD6e+Je3shKxruUogOhfAJH1SGCni4E79nq6GDGgDB912l0TGl8XqFr5NiqhZgfB2D3xKQX
	5dB/lk/Tzqj2Q+gZ93VHHkQgnswmqOOdV0qGdvUa3ubTmPc6wYzAhlemgBse+PzEf9aYhDNMnzx
	M=
X-Received: by 2002:a67:fbce:0:b0:5ff:b8d8:b40d with SMTP id ada2fe7eead31-5ffb8d8d44bmr1248639137.21.1772684362172;
        Wed, 04 Mar 2026 20:19:22 -0800 (PST)
Received: from geday ([2804:7f2:8080:fd2e::1])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-94df6577a4fsm21273560241.10.2026.03.04.20.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 20:19:21 -0800 (PST)
Date: Thu, 5 Mar 2026 01:19:15 -0300
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
Subject: Re: [PATCH v5 3/4] PCI: rockchip: drive at 2.5 GT/s, error other
 speeds
Message-ID: <aakEQ_qtBbYCaUsA@geday>
References: <cover.1772239598.git.geraldogabriel@gmail.com>
 <2a0a4aa97bb8b0cb511cb651c5d66c9ec8bab97a.1772239598.git.geraldogabriel@gmail.com>
 <d2b91260-7666-3606-69ec-0e7cb7a48c02@manjaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d2b91260-7666-3606-69ec-0e7cb7a48c02@manjaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_201924_279279_730CB262 
X-CRM114-Status: GOOD (  39.85  )
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

On Sat, Feb 28, 2026 at 07:16:41AM +0100, Dragan Simic wrote:
> Hello Geraldo,

Hi Dragan,

> 
> On Saturday, February 28, 2026 01:55 CET, Geraldo Nascimento <geraldogabriel@gmail.com> wrote:
> > Configure the core to be driven at 2.5 GT/s Link Speed and ignore
> > any other speed with a warning. The reason is that Shawn Lin from
> > Rockchip has reiterated that there may be danger of "catastrophic
> > failure" in using their PCIe with 5.0 GT/s speeds.
> > 
> > While Rockchip has done so informally without issuing a proper errata,
> > and the particulars are thus unknown, this may cause data loss or
> > worse.
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
> >  drivers/pci/controller/pcie-rockchip.c | 15 +++++++++------
> >  1 file changed, 9 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/pci/controller/pcie-rockchip.c b/drivers/pci/controller/pcie-rockchip.c
> > index 0f88da378805..2f211d1f4c7c 100644
> > --- a/drivers/pci/controller/pcie-rockchip.c
> > +++ b/drivers/pci/controller/pcie-rockchip.c
> > @@ -66,8 +66,10 @@ int rockchip_pcie_parse_dt(struct rockchip_pcie *rockchip)
> >  	}
> >  
> >  	rockchip->link_gen = of_pci_get_max_link_speed(node);
> > -	if (rockchip->link_gen < 0 || rockchip->link_gen > 2)
> > -		rockchip->link_gen = 2;
> > +	if (rockchip->link_gen < 0 || rockchip->link_gen >= 2) {
> > +		rockchip->link_gen = 1;
> > +		dev_warn(dev, "invalid max-link-speed, fix your DT\n");
> > +	}
> 
> I'd suggest using a bit more formal message here, like the one below,
> which would also avoid addressing the user directly:
> 
>   "Invalid max-link-speed found, limited to Gen1 to avoid data corruption"

We really should spare on characters here, but I see your point and will
try to cook up a better way.

> 
> >  	for (i = 0; i < ROCKCHIP_NUM_PM_RSTS; i++)
> >  		rockchip->pm_rsts[i].id = rockchip_pci_pm_rsts[i];
> > @@ -147,12 +149,13 @@ int rockchip_pcie_init_port(struct rockchip_pcie *rockchip)
> >  		goto err_exit_phy;
> >  	}
> >  
> > -	if (rockchip->link_gen == 2)
> > -		rockchip_pcie_write(rockchip, PCIE_CLIENT_GEN_SEL_2,
> > -				    PCIE_CLIENT_CONFIG);
> > -	else
> > +	if (rockchip->link_gen == 2) {
> > +		/* 5.0 GT/s may cause catastrophic failure for this core */
> > +		dev_warn(dev, "5.0 GT/s may cause data loss or worse\n");
> > +	} else {
> >  		rockchip_pcie_write(rockchip, PCIE_CLIENT_GEN_SEL_1,
> >  				    PCIE_CLIENT_CONFIG);
> > +	}
> 
> I don't think we need to emit a warning here, because, as we've already
> established through earlier discussions, the rockchip_pcie_init_port()
> function should never receive an invalid speed value.

Just as a lame excuse, those messages were everywhere in the mid of my
development, this is one that escaped deletion, will drop.

> 
> >  	regs = PCIE_CLIENT_ARI_ENABLE |
> >  	       PCIE_CLIENT_CONF_LANE_NUM(rockchip->lanes);
> 
> It would make most sense to squash all three patches in this series
> into a single patch, because they all form a single logical unit, which
> introduces changes that are just going to be harder to track down later
> if it's all scattered into multiple separate patches.

I agree, having all drops in one big patch is the better tactic here.

> 
> The only possible issue with the squashing comes from the inability to
> have different patch subject prefixes for different driver changes, but
> I think that's actually not an issue.  The long-term benefits of having
> everything as a single patch outweighs the benefits of having different
> patch subjects with separate patches.
> 

Sure, will do so for v6.

Many thanks,
Geraldo Nascimento

