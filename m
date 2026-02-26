Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FC40FD4600
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 00:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aT/CuULkbwm3ZtLWPS1iAQDnaaV5hiK+YKdLvwy3we0=; b=0sEbbO9OSsjIS3UkLaneF2myWR
	2mmgBQOfpQv04DZ8MX7ed1Vpejm6kg+Ug+F2rg4MRI1HQptOIgmyclLS7zGU8J1gUSBfipsPjIHnv
	9HQynqqfoPQSEeiyHyKAw0dc6WZPl6AmRJrX9xJNHp4rtMwvbi3R2SxVks8gwKtMWHtkf0Ibqk5o3
	KSOmw3IrEyLVRCRG46v+Cz6tbQShKdcjQymQspBclCfpCqUIC0h/PtKHbPlQUEKXYG2jfJ+IF72nl
	j8PvdahR71t4HoktU0JVj8CfipNF4GCFYRNh/Var9YGc1tqNkuyh/yvm7OT4m0VwlzK4lxLOME7Yi
	E+0QoS1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvP5n-000000058X5-32qa;
	Thu, 26 Feb 2026 00:18:59 +0000
Received: from mail-ua1-x92c.google.com ([2607:f8b0:4864:20::92c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvP5l-000000058SQ-037I
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 00:18:58 +0000
Received: by mail-ua1-x92c.google.com with SMTP id a1e0cc1a2514c-94de4f5531eso93317241.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Feb 2026 16:18:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772065135; x=1772669935; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aT/CuULkbwm3ZtLWPS1iAQDnaaV5hiK+YKdLvwy3we0=;
        b=cMzls11UXm6614vpccNUxfEBGVurITrZ+llHyh/9E2p8hKuTv3KSpo8JOnq5a+wUXm
         rMWnhwhpQb6jpnp0RvH2XY58UzfCOVfTbf6IehIzT01L53/r1OKrDzLaCnx6qEpGklq2
         xLDMnW2UObdxVgkvjFDyksC9kWTrSFhOLrKofuWl/QgaLfOkxBL1BH0gOMbQ6rDc/TvR
         b2b6hTBWsIYdTJPO0ftuJNDRaejQjqjjD1YVANaWvjyJAYZWQc46DjzfOZXGfZoztpuC
         dBEW/pO5DepLbCZAWlK8Ep5GEdv/pcDJRG3iebwrPWJiNQXU4Jtx5lGvlva9r3acBU6f
         mKHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772065135; x=1772669935;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aT/CuULkbwm3ZtLWPS1iAQDnaaV5hiK+YKdLvwy3we0=;
        b=teMiuAUq6H3/hggxVgFLRQSPX5i4V5s6foWfUMk3yJalTM99ktMPX/TZrdeeDY9jIF
         31B8oMh90KE45hdqFdTZtK/lMPjhyTKqDLPvArudT9OGKDrl+xZ4tAeXY2gNMZtMMD2v
         hWMVFxJ+z49qgwaS8VPLX0glDYxhcy4DpSIhAQjECX8/GhorlUFDh+M0rfxWI+x6+bo8
         SJT/N+RMl62vIp8ikpepjxEt2cPQZPxlSgW1fveCYliaMzF9zWpZsbeqnc9BJ+joA5SH
         78pi0WIAuC9oWfawL/HD8wa/TZCCcNblqJa1e1Ky0MjKe03C5kA5AT/iYKv4UQTMV8yx
         B7pQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKecSR3KmlB3XV5nDwI6nt1ZKLFDugVUors/6u6gc/qlyqiCJ/2lXA8XTYZ+Cqon02vSnZR988GPlwiCvHgK9h@lists.infradead.org
X-Gm-Message-State: AOJu0YxDNbJhDWDXb3BaGsfFYDZI5Ec0zIBYfJL++5K+ALqSPkKFoL9s
	HFvoFMbtq6+FZGQA5yeLkEo0KtveBA2CopqLS5gBYl7lM6FM0+fRqM7zHKxJErqkdOA=
X-Gm-Gg: ATEYQzw0YiE2De4dteMJAIeMIrLrbRO7D7biFmD9rbWvLXzGf4mVY7b00dOn/6NSwRB
	yvqRhRS9u2BS7JQjiiUS+r9lj+ADitgNpxkvSMZJqyMv8ZVpKR0Eb3zllh1kAnYpi+NPyomGzsO
	wmBmO/2fyF3LD6k67VtecNkQ7JKzfzOPIV4f95PXpFy3jZ2861obUScPaRU8S++azcZScwYpG48
	5l1dKfOQCHALOmGkA0CQSpGBMIXWGhZgZyjPzdyM+nLGvCMHIv8FYVM2BOEQZtwt+uw9LWNXMWn
	ksUsnNTUxypILESY5e6CUv58k7s8ZxTgiFYVVLJK00oBk3m9zv3pjzn3ahx3r2bdGa0z41xfVBZ
	4AQdOp1cthUa/QcMdRP0eSq8kEawG6dcMmsL1v50WUDiu0wvipC2aTqTU46vTCUpDdsUY6Hk8Gw
	Bku9zvr6RQGw==
X-Received: by 2002:a05:6102:358d:b0:5db:3bbf:8e62 with SMTP id ada2fe7eead31-5feb2e60d7dmr7045155137.1.1772065135433;
        Wed, 25 Feb 2026 16:18:55 -0800 (PST)
Received: from geday ([2804:7f2:800b:f14d::dead:c001])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ff1ea6ea19sm612107137.12.2026.02.25.16.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 16:18:54 -0800 (PST)
Date: Wed, 25 Feb 2026 21:18:48 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, Dragan Simic <dsimic@manjaro.org>,
	linux-rockchip@lists.infradead.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] PCI: rockchip-host: comment danger of 5.0 GT/s
 speed
Message-ID: <aZ-RaBLVfEZA_FxU@geday>
References: <8db835ffe384db63ee598a203751b298ad1cc267.1772057799.git.geraldogabriel@gmail.com>
 <20260226001229.GA3794668@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260226001229.GA3794668@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_161857_084440_34DCD404 
X-CRM114-Status: GOOD (  28.55  )
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

On Wed, Feb 25, 2026 at 06:12:29PM -0600, Bjorn Helgaas wrote:
> On Wed, Feb 25, 2026 at 07:27:44PM -0300, Geraldo Nascimento wrote:
> > According to Rockchip sources, there is grave danger in enabling 5.0
> > GT/s speed for this core. Add a comment documenting this risk of
> > "catastrophic failure" and discouraging end-users from forcing
> > higher speed.
> 
> A comment in the code might be useful but doesn't discourage end
> users.

Hi Bjorn, thanks for the quick review.

> 
> > Link: https://lore.kernel.org/all/ffd05070-9879-4468-94e3-b88968b4c21b@rock-chips.com/
> > Cc: stable@vger.kernel.org
> > Reported-by: Dragan Simic <dsimic@manjaro.org>
> > Reported-by: Shawn Lin <shawn.lin@rock-chips.com>
> > Reviewed-by: Dragan Simic <dsimic@manjaro.org>
> > Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>
> > ---
> >  drivers/pci/controller/pcie-rockchip-host.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/drivers/pci/controller/pcie-rockchip-host.c b/drivers/pci/controller/pcie-rockchip-host.c
> > index ee1822ca01db..4faf3e29b7d5 100644
> > --- a/drivers/pci/controller/pcie-rockchip-host.c
> > +++ b/drivers/pci/controller/pcie-rockchip-host.c
> > @@ -332,6 +332,10 @@ static int rockchip_pcie_host_init_port(struct rockchip_pcie *rockchip)
> >  		/*
> >  		 * Enable retrain for gen2. This should be configured only after
> >  		 * gen1 finished.
> > +		 *
> > +		 * Dangerous and may lead to "catastrophic failure", with data loss
> > +		 * or worse!
> > +		 *
> 
> Wrap comment to fit in 80 columns like the rest of the file.
> 
> Remove spurious blank line at end.
> 
> This should probably be squashed with the first patch; I don't see the
> benefit of having them separate.
> 
> Why don't we just remove this whole "link_gen == 2" block?  If we
> don't want to use it, there's no point in keeping the code.

Yes, I think I'll go with this second option and remove the code
block outright.

Thanks,
Geraldo Nascimento

> 
> >  		 */
> >  		status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_CR + PCI_EXP_LNKCTL2);
> >  		status &= ~PCI_EXP_LNKCTL2_TLS;
> > -- 
> > 2.52.0
> > 
> > 
> > _______________________________________________
> > Linux-rockchip mailing list
> > Linux-rockchip@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-rockchip

