Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 647ADCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Nov 2025 23:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ciGXNa1z8OLW1upm7VDcuKg7m+mkewvk1om1QMnHPzA=; b=tClSxIQHI9utw7T1seTAXbUMe8
	Oais8ojMAlGPc4zdNGReI6kGj4moAq7ZRRoyc5gaCdLICXC4Ru9DUFp/8HXJRc3W9GDYrn6+CBWJH
	YYKpUY/zqk2PgfEOFD5sthuizzesm2L0mNi5poKHJ8Dhn/5mIomDOvV0y/V2g64P4sTuzyJHZnh39
	9iWoCnZvH1rzfv8RoVenWen6e3X3yCMkOozRNarGSNjuWFUmOeZV+l7+A9B6l4rbUpN+wueDnLvaM
	is/lSQTXfWBsA+/XKV2YKeUxzJI7KWwfL9bkAdrtkSAHvMMq7nyGFwhxGKAHSAFBTj3MpTrtyBXJh
	1r8vbHyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIFIN-00000004Wxr-106G;
	Sun, 09 Nov 2025 23:58:07 +0000
Received: from mail-vs1-xe33.google.com ([2607:f8b0:4864:20::e33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIFIK-00000004Wx3-1vfG
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Nov 2025 23:58:06 +0000
Received: by mail-vs1-xe33.google.com with SMTP id ada2fe7eead31-5ce093debf6so1767228137.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Nov 2025 15:58:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762732682; x=1763337482; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ciGXNa1z8OLW1upm7VDcuKg7m+mkewvk1om1QMnHPzA=;
        b=iqaiPT/cQSeiUSU/dHCoHKistj07Hg3iPBvg1nrJwlLFPeAmxV3F6Y7of5Rc5uOjRZ
         iIebhizJhmgrmGpIrAULkXYjiGRBCzroW/+r6sopATG2IbwhnDKS1vpnXik9lYHcSwzx
         +7ppqiSWg4ThGMY9FdVuc+j3HNUEcPn08n8mFKFoimI4S4GuHRs9V1Cz5AyH01WIZi2+
         o/7NC+xeQQRVXM/bNL2qPRkhxW/aRywrTYsyNqB9TwcnOWwfJ8zHd9FbneD20wKBWm3V
         TBR73YcTWR3pRfBkDHQMGw8cdN8ejjzOBq6DsXuHWqidkJ+noMQBMSfFW8ZN7cBpJEyk
         YYgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762732682; x=1763337482;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ciGXNa1z8OLW1upm7VDcuKg7m+mkewvk1om1QMnHPzA=;
        b=U/BBgx+LQwZCJHYpg3WOCCu9IRyRMI8gCjhWJVuurWejtvbv6joyJFH4/uFYHUZnFf
         kqSQyRyjvp+FV6LVs3cmqnwR/9SyYXBTYkWiR/hMjU0+BDzi83sGUv23zxTWHMKNWCvh
         hTUvCTy0fI4jEUlvBTAklCHskBc5UvJKg80qjBaxnZeQulw6GoZijlg6OZEWNcV8maHo
         TlPHfnYw6ZChKpO7p85S/MFk3Pos4dQxDCCEz7CuTcYjFJfyJW3BO7tV072VjIPFp5MN
         6WbMu7TeomDpRJVv14hds9TvXQJXw7ufQIe4krAFn2bUOvFBYoYNTzw5nWIR6m3YJC1I
         SSoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJLK7OlVvs5McqZu3XxHmFNo3eHcR1ug4cqFgh6JIIa//K/qrOf2TUnCAyLkT2EVfTOHJYhA7a2JIg6gvQPsmd@lists.infradead.org
X-Gm-Message-State: AOJu0Yw++V6ADUlxthJ9Su0zybrzAJIWiBOMF4Wx5GLDDBbtKPBY4qgt
	7C7kB3gDRzTOnuh+tO16huXh1hYcOCbfLT21uFnM8rlKFiDQ3oGV7u1G
X-Gm-Gg: ASbGncsErggF+8obIJs8rt/Cm5k+kxh8R4/X+xWkXGMDLh+ojgZFZjsL1icFYE5wmm8
	af8Lo0U5GR1WXC+AJ7dtUo+aFVgmmdiJYdKhE7KVHZN3EzvTIwl/IfM7RSanb/pcQ097Tw92MGx
	lY86M1IOSlnYg2xqNdfrMuqkDME6cQwjTo9IzkVwb2HBlsx8xb7vpScIFGO5+a+qxNotYVA1s/M
	jjfR72SBIKwbz++nanoHHDLJYKmTGyDKXX2AkvxGAZ0c+EbhPakrqlD7DoHfc6snKhU0INHXMXQ
	iRephwUmfoeikF2lDvlaVW2OEFdmDMKCLDnpzxaRB+U6j5IJUV/mstZV/8bPyizOvgIMZo97JW9
	HDSUl+MYxiYQY5c+KsaMlqE4Zy4ByeSZ91fYLU9CnEjy9HXhPHm17ZdU8yerhtaI/r3kfBu4hcb
	dO4DlWVUXy
X-Google-Smtp-Source: AGHT+IHkEshzMykihoxZN8xwmOnrJz2pDDGH7SWMAzmcaEUtc/A4N6Xa3uJOm+m//4yVDMfdlbkPlw==
X-Received: by 2002:a05:6102:3049:b0:5db:f031:84c4 with SMTP id ada2fe7eead31-5ddc475a644mr2405338137.28.1762732682621;
        Sun, 09 Nov 2025 15:58:02 -0800 (PST)
Received: from geday ([2804:7f2:800b:6140::dead:c001])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-559958320aasm6388204e0c.20.2025.11.09.15.57.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Nov 2025 15:58:00 -0800 (PST)
Date: Sun, 9 Nov 2025 20:57:52 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Dragan Simic <dsimic@manjaro.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>, linux-rockchip@lists.infradead.org,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Johan Jonker <jbx6244@gmail.com>
Subject: Re: [RFC PATCH 2/2] PCI: rockchip-host: drop wait on PERST# toggle
Message-ID: <aREqgL8JVYUcKO7R@geday>
References: <d3d0c3a387ff461e62bbd66a0bde654a9a17761e.1762150971.git.geraldogabriel@gmail.com>
 <20251103181038.GA1814635@bhelgaas>
 <aQrKtFT0ldc70gKj@geday>
 <17220ae9-9e0e-cb0b-63bd-eaf9a6ed6411@manjaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17220ae9-9e0e-cb0b-63bd-eaf9a6ed6411@manjaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251109_155804_519373_41BAE722 
X-CRM114-Status: GOOD (  28.20  )
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

On Mon, Nov 10, 2025 at 12:51:49AM +0100, Dragan Simic wrote:
> Hello Geraldo,
> 
> On Wednesday, November 05, 2025 04:55 CET, Geraldo Nascimento <geraldogabriel@gmail.com> wrote:
> > I did some more testing, intrigued by why would a delay of more than
> > 5 ms after the enablement of the power rails trigger failure in
> > initial link-training.
> > 
> > Something in my intuition kept telling me this was PERST# related,
> > and so I followed that rabbit-hole.
> > 
> > It seems the following change will allow the SSD to work with the
> > Rockchip-IP PCIe core without any other changes. So it is purely
> > a DT change and we are able to keep the mandatory 100ms delay
> > after driving PERST# low, as well as the always-on/boot-on
> > properties of the 3v3 power regulator.
> > 
> > This time everything is within the PCIe spec AFAICT, PERST# indeed
> > is an Open Drain signal, and indeed it does requires pull-up resistor
> > to maintain the drive after driving it high.
> > 
> > I'm still testing the overall stability of this, let's hope for the
> > best!
> > 
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3399pro-vmarc-som.dtsi b/arch/arm64/boot/dts/rockchip/rk3399pro-vmarc-som.dtsi
> > index aa70776e898a..1c5afc0413bc 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3399pro-vmarc-som.dtsi
> > +++ b/arch/arm64/boot/dts/rockchip/rk3399pro-vmarc-som.dtsi
> > @@ -383,13 +383,14 @@ &pcie_phy {
> >  };
> >  
> >  &pcie0 {
> > -	ep-gpios = <&gpio0 RK_PB4 GPIO_ACTIVE_HIGH>;
> > +	ep-gpios = <&gpio0 RK_PB4 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> >  	num-lanes = <4>;
> > -	pinctrl-0 = <&pcie_clkreqnb_cpm>;
> > +	pinctrl-0 = <&pcie_clkreqnb_cpm>, <&pcie_perst>;
> >  	pinctrl-names = "default";
> >  	vpcie0v9-supply = <&vcca_0v9>;	/* VCC_0V9_S0 */
> >  	vpcie1v8-supply = <&vcca_1v8>;	/* VCC_1V8_S0 */
> >  	vpcie3v3-supply = <&vcc3v3_pcie>;
> > +	max-link-speed = <2>;
> 
> FWIW, we shouldn't be enabling PCIe Gen2 here, because it's been
> already disabled for the RK3399 due to unknown errata in the commit
> 712fa1777207 ("arm64: dts: rockchip: add max-link-speed for rk3399",
> 2016-12-16).  It's perfectly reasonable to assume the same for the
> RK3399Pro, which is basically RK3399 packaged together with RK1808,
> AFAIK with no on-package interconnects.

Hi Dragan!

Thanks for the catch, you are correct. But in this case it was just
for my tests and it crept in in the git diff. I wasn't really proposing
to make that change.

Thanks,
Geraldo Nascimento


