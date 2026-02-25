Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04762FD374E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 14:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vy6cNiKVqqdOzrXGU51JG+BLZ2VHPDg76L+Bf6A/K7w=; b=j5qedeE/czrResPd792QglnY8v
	fTPtYxkr19Tp/09f2jCESzIyCrhUyZH0bFGYC8ImXgByl2WdLYLEsEfX+s1nwal7UYKM1gDutN//y
	OJU/7UbzgiqvlmnF4BovQcR3yUpXOLlVVqO+vYD75RK+YMYtRA47+X9NHn7oLKu56RchTpDKSwJZT
	kNRSi5jobtCM4tFPneOka7kKKnaVD1fkIgyjSAFYK2fKnUQ7/jRhtIeWGjYAPP5cah7VB8frI2Prs
	/oEQzFjNleXD123BN0QBI+0AlL0cbgKgWf7wpINoefjTqcJn9qNKNJ/lvyKY+05Kfw2En/wXaqwZo
	zbxbefQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvFSH-000000049rF-25mJ;
	Wed, 25 Feb 2026 14:01:33 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvFSC-000000049pJ-0384
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 14:01:31 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-b9047e72201so990523166b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Feb 2026 06:01:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772028086; cv=none;
        d=google.com; s=arc-20240605;
        b=gggQzlLl1Bu8iKRcg1JwzkyLS75k38pPx5yN8j4ogiGZLBQOA4gBkH3nIxIZYth3BO
         fuCcMzzcSXFn+bjx/yg+o3CyeRzGQ5yMQsc1FziXHGVRCvE+qs1qmC/Xhjy9e94evFrJ
         AF0MRG21YZ6FSDseJWtH3pvcNFdfPqXEPkTx9SwFrKL1cL/LS/DFF0MYVuYKS/2YGrGs
         bA2z/GwUmoa+cUAmI24NfErmESkiJkAndAVEKqESCwwv30sSW7G5tBYBOdiGlArMkhuO
         cmL/r/vPvmwjlRWYQR1F38TCrtv0SMpRa3Xn+WGNBSmn0phfVdN1LL7tqmva85s/XdA6
         cSWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Vy6cNiKVqqdOzrXGU51JG+BLZ2VHPDg76L+Bf6A/K7w=;
        fh=dTk0tCXv8rv0FxQtVoIu4h6tabHToj8nj0Db6T8S8kQ=;
        b=hyAdnPBciuocxHqlMylENaxrjR+lAzsQHdk+dF8ptySsabtaDEanfyk7RekZEziMcU
         YcjMWYDm2F/Xz5PEAqev8PrvGM4MWlVp2E6+2ETrHlccP53GvJFM9HSzlgD8ftjSponL
         3RahjuNnwqUjTsaTC14zPRckpqCY1S7qFRkJGI1DQ9s2LpLur1SVrr2X2Mcq1X1nafCk
         Piu675sycmNd4MUg2olzMq/G8hX/FDwW9s6JMkJAzaYG9u++psVfKiA6z2FO9A0dUbYM
         WiaKHS/rp04EoulxP886uS83QfZFIOxqXx6CHpOEX8BQpbyzGc3eWolfnN0ikz+S1Vt4
         KCcg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772028086; x=1772632886; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Vy6cNiKVqqdOzrXGU51JG+BLZ2VHPDg76L+Bf6A/K7w=;
        b=FNVu+iGJh/bX14A6OnOKQ29K94Hny+UB8hBNEO9qQhEkDY+ksT4Amk61ldJXXnolgl
         6fyh5OajcujzC0feq8qDIzqVkbgsw+4i0GStQVtQehzZ7GSOlK41BdZd+/8SSzgN/ujM
         x9gm27MOdXydqtecIXFtoMvflxprqlYYbIAVk2rcp5/9oe7vmdlf/9vs7iy6+wpsAbT8
         dMsu5AS+dnDLcuKDK5cx6HuKev7YOiVaI1Lh9dYFF2aqLBWhjAWWFq54Q94dezLAEZWm
         IWsGhTJwgfJUPlfDlKZHXakx97Oi4mcOSVe4ZMCXPWr0pVf5VOmarb4rncUf5qbiNbVv
         1y+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772028086; x=1772632886;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vy6cNiKVqqdOzrXGU51JG+BLZ2VHPDg76L+Bf6A/K7w=;
        b=uElHlnoDrX453H+22C6xngXoMPQFba67OoQuxyMvgPYgGDw7d68q3BY8kMoI3j8WbN
         IG0mJivrRSvMWTElILhixHlAZcKID0CkTQw48XXKlSCrS4MYgjLj3iUs+GAECdvUA4PI
         Iau9zlyHI8Q10p66w0OkBvcOyJy+DfQuSxsRZ1AnJvot9jEVmx1NA2d+xlzb8cfphVTF
         1BLesHmDYHYdFy1hUXbElgfYLakVwQrBDpYlzekfSBJRhAst/SMr933wawtiQKJMWkvy
         jezJmgYWN9h0dV59GDPHRK86TNQg7rXqqi9UpuNmYRRWTQy0ov3qPy/2H7/zBVdmfwA/
         en1w==
X-Forwarded-Encrypted: i=1; AJvYcCWBfCUPMr+FIQxxsU3p2fC5BxG/Dz3FIiUwVtbEztCoEayaAfRv5FJbTANZdU50a602pEBVs3zC5PLd2WyjRqxm@lists.infradead.org
X-Gm-Message-State: AOJu0YwrG5RafrUiZmdTy4yobYv14RsRGgJya+8oziPJWj6CR6Z0jWHg
	J1l6YZOg4zydr2rjLUoDtVdsABFD+KIAPFOMZJENI33OCFw/dA+WzU1M9hyCE5UMAcgnF0ZNFH9
	PnG0wV7947b4qEXTjK5qj1qFNYahJk88DrT91MCxlZw==
X-Gm-Gg: ATEYQzzOkFHCJxqEDkgeGmxulAGB7Cift4rnR6+54YrF9lguDoawyte6l7ZEvVCG2QC
	e4CWE4HUxZzNJ9TWeevoS4dgV7bFV8n7WE1scyR04EtiJKGP+vrIjwGevXinmeHV3yGe/Czv4mA
	N/kmnbF418Qx/xdx+FpOVRqwEfwHHQjnQQhzTkK2x2AnGcMPoOpkbQ/DSe4IJhL6ajr+LfhzYNr
	CIUelAW3VMRgWQbe8zlPGpnUErWAkjfnFMKFxR3bQg3P9Gyxk3K0LBMyBRxfIQ7GjLrB/DYnTJ6
	ZJncq9zaUZUw3QizD4uTtFRyrqyXqNDdGw==
X-Received: by 2002:a17:907:2d89:b0:b93:5297:b3a2 with SMTP id
 a640c23a62f3a-b935297b3bdmr8044466b.59.1772028085419; Wed, 25 Feb 2026
 06:01:25 -0800 (PST)
MIME-Version: 1.0
References: <20260203161917.1666696-1-vincent.guittot@linaro.org>
 <20260203161917.1666696-2-vincent.guittot@linaro.org> <20260210004011.GA2188625-robh@kernel.org>
 <aY2rR3Hlm525kGUN@shell.armlinux.org.uk>
In-Reply-To: <aY2rR3Hlm525kGUN@shell.armlinux.org.uk>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Wed, 25 Feb 2026 15:01:13 +0100
X-Gm-Features: AaiRm52xymbtUvdX0WARhHIKYaRvNgdQ5-vzrvF5qBi6nov6q2mJRcNPXMItfGk
Message-ID: <CAKfTPtBB6ZNde+-t7FKkf0F5Uvy0rDvebM_fsGTy9tk=CBq6Xg@mail.gmail.com>
Subject: Re: [PATCH 1/4 v2] dt-bindings: serdes: s32g: Add NXP serdes subsystem
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Rob Herring <robh@kernel.org>, vkoul@kernel.org, neil.armstrong@linaro.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, ciprianmarian.costea@oss.nxp.com, 
	s32@nxp.com, p.zabel@pengutronix.de, ghennadi.procopciuc@nxp.com, 
	Ionut.Vicovan@nxp.com, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, 
	horms@kernel.org, Frank.li@nxp.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_060128_071662_E44FE4FD 
X-CRM114-Status: GOOD (  25.07  )
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

Sorry for the delayed reply. Some days off kept me away from keyboard

On Thu, 12 Feb 2026 at 11:28, Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> On Mon, Feb 09, 2026 at 06:40:11PM -0600, Rob Herring wrote:
> > On Tue, Feb 03, 2026 at 05:19:14PM +0100, Vincent Guittot wrote:
> > > +description: |
> > > +  The SerDes subsystem on S32G SoC Family includes two types of PHYs:
> > > +    - One PCIe PHY: Supports various PCIe operation modes
> > > +    - Two Ethernet Physical Coding Sublayer (XPCS) controllers
> > > +
> > > +  SerDes operation mode selects the enabled PHYs and speeds. Clock frequency
> > > +  must be adapted accordingly. Below table describes all possible operation
> > > +  modes.
> > > +
> > > +  Mode  PCIe       XPCS0           XPCS1           PHY clock       Description
> > > +                SGMII              SGMII             (MHz)
> > > +  -------------------------------------------------------------------------
> > > +  0        Gen3    N/A             N/A             100             Single PCIe
> > > +  1        Gen2    1.25Gbps        N/A             100             PCIe/SGMII
> > > +  2        Gen2    N/A             1.25Gbps        100             PCIe/SGMII
> > > +  3        N/A     1.25Gbps        1.25Gbps        100,125         SGMII
> > > +  4        N/A     3.125/1.25Gbps  3.125/1.25Gbps  125             SGMII
> > > +  5        Gen2    N/A             3.125Gbps       100             PCIe/SGMII
> >
> > Mixed tabs and spaces. Drop the tabs.
> >
> > What's not clear to me is do you have 2 or 4 lanes?
> >
> ...
> > > +  nxp,sys-mode:
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> >
> >        maximum: 5
> >
> > Though isn't this redundant with the child nodes? You could use the
> > standard 'phy-mode' property in each child.
>
> phy-mode is ethernet, but the above is more than just ethernet.
>
> I've been wondering why a generic PHY driver needs to know this via DT
> when the generic PHY API has:
>
> phy_set_mode() / phy_set_mode_ext()
>  - sets the type of the PHY and its submode (e.g. ethernet interface
>     mode)
> phy_set_speed()
> phy_set_bus_width()
>
> Surely these are sufficient to describe what mode is required from the
> generic PHY, and the generic PHY driver can figure out whether the
> mode is permitted from the above table, programming the PHY as
> desired.

For the lanes that output SGMII, we don't register a generic phy
driver but we provide the pcs with

pcs-handle = <&phy_xpcs0_0>;

>
> For Ethernet, we don't call the 3.125Gbps "SGMII" using that term. We
> use SGMII strictly for Cisco SGMII, which runs at 1.25Gbps. 3.125Gbps
> single-lane serdes ethernet is not able to use Cisco SGMII inband
> signalling because running the underlying data rate with 10 or 100
> symbol replications makes no sense. So we have decided to all this
> 2500BASE-X. If such a SerDes is connected to a SFP cage, then we
> support switching between 1.25Gbps and 3.125Gbps mode depending on
> the module inserted, which requires dynamic reconfiguration of the
> SerDes.

yes, I still have to figure out how to handle 3.125Gbps and 2500BASE-X mode

>
> What I'm saying is that describing a single mode covering several ports
> could make things difficult in the future, so make sure you think
> carefully.

The serdes mode (deciding wether to output pcie or ethernet for each
lane) has to be decided before de-asserting the reset of the HW IP so
we can't really make it dynamic



>
> --
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

