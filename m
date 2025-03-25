Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE10FC36008
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 18:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tmx5ewE9CpmYmb/EWKQ5oR/rMw7j+z90kb/HX9r8TaE=; b=1ibBwo/dqNEYp515HfRZy1xwIj
	hpbSrr0H+IKbu3UhP6kwdRfaieiw3KlKsEmNmMKU/pLWGFJeNaz8Of3ixB3UTEbTLY1Z5OIXm3rvW
	SvmMppGqbVuNn51tmg5kD8Urq+Vhu6t6Rkxr3RIRuEbxX3jnQgJvBv16iK0/UCNYQ/YsLbuFr0VVW
	DQPj85abq7YJD0LUJHhIg3OYjOTRSGakguTRhXhmE7dwV52Bi6zj2tmemy49EUZwOJTY7i65KNtL3
	hda2t3DTktYme8AvwMDy3ebkkZlnG9m+AxtnTHtL7a2eXBQq4v04cz+CAczvtX10nO90ft7v7SdT4
	fT+o22UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx93O-00000006jIT-49SO;
	Tue, 25 Mar 2025 18:31:10 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx91e-00000006j1A-0HoW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 18:29:23 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-3011737dda0so7810848a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Mar 2025 11:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742927361; x=1743532161; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tmx5ewE9CpmYmb/EWKQ5oR/rMw7j+z90kb/HX9r8TaE=;
        b=Vywb8YpbR0/ztkEDfn0DgA6A1HY3ilXI4OgjmwnGeDui9z3QUDLT9mwH6NFcn2EOST
         sqDFOWg24x2AkWQ+0KiD6MMhh4q3fQdqWrRla4hSedcv76f0Epvv4eyXH0T2gqOD8d+z
         3hPx1QoeEkxTsBb1jbgTojwqYnB8LsmlQwULIVPZp0UQqoWh2sJGC19LZHBP/8ofvc33
         FuArRfHUks2wFa0bPKnx9otV2VjCsNzyJ2lYPK+hjl4ry2vYx5BKU5AhFK37j0THykVg
         yFG1rIcyYv7klv/x1RfuyTzIHT1FB83ErSc6Inkknv4426iMwMyFBE2zxKsTxjY2fS/k
         Aauw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742927361; x=1743532161;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tmx5ewE9CpmYmb/EWKQ5oR/rMw7j+z90kb/HX9r8TaE=;
        b=maYvIYGMyUD1CmVRG/ioBeR9/65psmS9IV02F6R64UAQqTqgm6405+PXECOvagEZux
         aqGSquqrclBvSLvxHAR6SHyjDgMjCRtZ5p3a/Fn46k0UqRk2wkaSDfdVNRv85hoMNNdz
         RIRzdlS2MGT1BLhQ7TfwJ0Br3DvE9mu7zHfOY1YZGrUZ0bUpz8yP/gzjiRBMEgTgEAwz
         6y+6Wp/5O/IA5oQkpQMOVApOF3oKSUWe8wz2iCam254sq85touStcfI68mKNVBQo7LuK
         LLIibUs704F2jpuLX5I7feSh1qOF+d7U0iXKwnBmbGTnrlPrIpQRn1oIdKJOAeeM1GCI
         wfZg==
X-Forwarded-Encrypted: i=1; AJvYcCXlEVpLmlS7BmNFtQyi921lgiM3mCzoA1WANNKHqTxEjXWJbQxQ8gcnwep3LmK8mHH2MUgsEdxE01pfr+Ww5STC@lists.infradead.org
X-Gm-Message-State: AOJu0YwgSAZ1K32A/QwmAuYOSnUNKmkwoRSsT4WnCaIqIIl9RMPac73X
	iLGLKG0Lsyq0HvZ4KI5McyVOKEDaSvTW1pUyHavxn56xeipik4DZcmMfVmNx5A==
X-Gm-Gg: ASbGncsoKM6co06lubpZDTq+81HU6kc6yfvzFHL1nAyhz6nma68+9stCtASg32jJwqX
	cHUwgh0T/syJKzsZz4wlvcJpKew59yDrOghDatY/1zpJdD6T4DJBus2lIAH+1QEmHb4agwEknh3
	lX8eehnDeDxw3x2XephBJQ6xWnZ7Z7i7tQRlFWqrd8vKh9XTb73qIPS2ji5cjjcXoq32xjHwrsj
	z7KfWeDVBWwnsTDTHU60+wn1HGe+uUYAJ6tXsM1GlYwV0kD7qOl1rSNNtpyHGa8NWaU573nXiIi
	Xe+CoEQvOMhu9zuXXEYJngrZNQb+B7ULX6JIMQWd9rBoq1Ftu5ZNi4fL
X-Google-Smtp-Source: AGHT+IGsYGiIj3zMmleKzhoEAggL4APoyOgKkCTRvkg+1ndeCLopUInmEMl2y5a6pf3LwaqPqiR7kA==
X-Received: by 2002:a17:90b:2d0c:b0:2fa:1e3e:9be5 with SMTP id 98e67ed59e1d1-3030fd769d1mr34439112a91.0.1742927361019;
        Tue, 25 Mar 2025 11:29:21 -0700 (PDT)
Received: from thinkpad ([120.60.136.104])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-227811b2857sm93735025ad.155.2025.03.25.11.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 11:29:20 -0700 (PDT)
Date: Tue, 25 Mar 2025 23:59:14 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Jingoo Han <jingoohan1@gmail.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Richard Zhu <hongxing.zhu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Niklas Cassel <cassel@kernel.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH v12 05/13] PCI: dwc: Add dw_pcie_parent_bus_offset()
Message-ID: <5hkzuqptaor4v5fc7ljxb36zdipeg67lsjfkcah5fkxfyyjt6e@oknqdtbwjitj>
References: <j3qw4zmopulpn3iqq5wsjt6dbs4z3micoeoxkw3354txkx22ml@67ip5sfo6wwd>
 <20250324182827.GA1257218@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250324182827.GA1257218@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_112922_123125_DE94B17B 
X-CRM114-Status: GOOD (  31.78  )
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

On Mon, Mar 24, 2025 at 01:28:27PM -0500, Bjorn Helgaas wrote:
> On Mon, Mar 24, 2025 at 10:48:23PM +0530, Manivannan Sadhasivam wrote:
> > On Sat, Mar 15, 2025 at 03:15:40PM -0500, Bjorn Helgaas wrote:
> > > From: Frank Li <Frank.Li@nxp.com>
> > > 
> > > Return the offset from CPU physical address to the parent bus address of
> > > the specified element of the devicetree 'reg' property.
> 
> > > +resource_size_t dw_pcie_parent_bus_offset(struct dw_pcie *pci,
> > > +					  const char *reg_name,
> > > +					  resource_size_t cpu_phy_addr)
> > > +{
> > 
> > s/cpu_phy_addr/cpu_phys_addr/g
> 
> Fixed, thanks!
> 
> > > +	struct device *dev = pci->dev;
> > > +	struct device_node *np = dev->of_node;
> > > +	int index;
> > > +	u64 reg_addr;
> > > +
> > > +	/* Look up reg_name address on parent bus */
> > 
> > 'parent bus' is not accurate as the below code checks for the 'reg_name' in
> > current PCI controller node.
> 
> We want the address of "reg_name" on the node's primary side.  We've
> been calling that the "parent bus address", I guess because it's the
> address on the "parent bus" of the node.
> 

Yeah, 'parent bus address' sounds bogus to me. 'ranges' property is described
as:

	ranges = <child_addr parent_addr child_size>

Here, child_addr refers to the PCIe host controller's view of the address space
and parent_addr refers to the CPU's view of the address space.

So the register address described in the PCIe controller node is not a 'parent
bus address'.

> I'm not sure what the best term is for this.  Do you have a
> suggestion?
> 

We are just extracting the offset between translated (cpu_phy_addr) and
untranslated (reg_addr) addresses of a specific register. Maybe the function
should just return the 'untranslated address' and the caller should compute the
offset to make it simple?

> If "parent bus address" is the wrong term, maybe we need to rename
> dw_pcie_parent_bus_offset() itself?  
> 

Yes!

> Currently we pass in cpu_phys_addr, but this function doesn't need it
> except for the debug code added later.  I would really rather have
> something like this in the callers:
> 
>   pci->parent_bus_offset = pp->cfg0_base -
>       dw_pcie_parent_bus_addr(pci, "config");
> 

I agree. This should become, dw_pcie_get_untranslated_addr().

> because then the offset is computed sort of at the same level where
> it's used, and a grep for "cfg0_base" would find both the set and the
> use and they would be easy to match up.
> 
> > > +	index = of_property_match_string(np, "reg-names", reg_name);
> > > +
> > > +	if (index < 0) {
> > > +		dev_err(dev, "No %s in devicetree \"reg\" property\n", reg_name);
> > 
> > Both of these callers are checking for the existence of the
> > 'reg_name' property before calling this API. So this check seems to
> > be redundant (for now).
> 
> True, but I don't see a way to enforce the caller checks.  I don't
> like the idea of calling of_property_read_reg(np, index, ...) where we
> have to look the caller to verify that "index" is valid.
> 

Ok.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

