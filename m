Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04B26E77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 09:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GCGMCINTHycaSUk/d2i6Tkx5PMoxq8giUl7PZqrxQnU=; b=V6vw3nwuahWPnDS3J/zXST/LEW
	ZV7oxr4VLIEBFxur2VIBW9g82h2aWYTkjCdUqdxQO6HK2dVfmbTR3YAE0TVVTwGGUb8rrzForyK4J
	kXdWNT9l46hZftzhPz2NCzwDt2mg30MYyksIms6d4cecEnSPiWlUiWi5/n1HuVxnpe4bizt76u0xa
	p0BoEP65rkSFUD0KuAw+43tPSPwHu/9fwSziVueyUTmdYGmtWZn6NeYs6xon9SQDdgrBhWTc3nR5P
	/340VmeppIJhQ05sRAvsSminGoNY+iXkPEZ62Dmzf+EEheFxCoFv3MXx19AgTj0RYQOs/MidlRLWb
	aBOfV5qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNqAO-0000000G2zN-1SQ9;
	Wed, 18 Dec 2024 09:16:28 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNq16-0000000G148-1k08
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 09:06:53 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-8019338c2b2so4013191a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Dec 2024 01:06:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734512811; x=1735117611; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GCGMCINTHycaSUk/d2i6Tkx5PMoxq8giUl7PZqrxQnU=;
        b=efRj4tRiaZUo6hqvceFcG6Yi651rt5WvMySiJHxTv9TmRsAfDGzO0tduZdTiZGtFwv
         HN+BRoCXgTxz/pGOUsPAZMWMVbYtHfsHNTsflVbSbwGs+KVq4t0EFWUzw/gEhqy5zujP
         AvHpaBQIU7l/aFzKGOPiOo/oZQ3bf3qQcmfKzENJz7pSZVRVr/CoyA3FBsTk/LZkmwOl
         /22se+0lrezzwAzIo2f3/9j0r8E/Uys8NERoeN7f5E1SqoxE78XoiR8PVtWKP17vKTL2
         c43hIPjid2yMDewSH52bp9kc1KZ2okErHchUQEPClMoZc5p9mSnA4yKjazzWyFPxDlME
         NFag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734512811; x=1735117611;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GCGMCINTHycaSUk/d2i6Tkx5PMoxq8giUl7PZqrxQnU=;
        b=swzImcGhTC3C6t7i7zzWEEQkB4mEktXxZXEkDypAEZxOiRPfO3MkADdZvkUq5nCvbd
         GUsMnEtKE0IkjaeiX/yv2/RR1rh1E1Fp84nzgRxH4o30TGLg6DEuEM/iCdEWcIHF26nK
         xCHdbfya4xuuxBYxZyomkXJNHqFkSodcOvWWNWWprZooTA9j66l226jdO+Ybyie6eHCL
         7enKmXgnEhVxATvqemSJIUzqOvoOku00h9f25Tb5iHPDwQfyV6C81XRSfEGaJB9S/+/W
         aNbzSDtI7tJ/AkW75OE+T67pBSpB0m/CIiAvcGpQH+NwpEluMtMUjy3WbbJ35pOSOUHG
         k+Sg==
X-Forwarded-Encrypted: i=1; AJvYcCU2LfixmcN27sr2uRwa6Gk7sV0YZrqJ65rcp/ivyWJPXfrN4iPNuio8XrvzTwQM/Q8TmOArwlCJEyLH+vPydrv1@lists.infradead.org
X-Gm-Message-State: AOJu0YyxjjgmUH2dhhKQMW+/FWMTia9XF6W3aVOLlm+UcMuCp4Bgw1Rj
	basnwYEW0ye9xfNv1Oj8QMYNCWW3p8r2GFZuyOBeiBf2XW9VYjAZZm9D7H15vQ==
X-Gm-Gg: ASbGncuGd81yO1w/z1yLRu7vGYsarPGRqPAyV+DYtJDjOb4f5TYoPFi2htXbXiyypxy
	o52sSlls/KqGlYp2XNlTC2+3sXJ/WvRkJeL8xm2XXCsgYo4oVSBubIo16Pu9NsTf6P4c5wMOq9e
	RDtY5ytwPd3Zr23/kIvcAvVWvFB7Dfuk9IvOTnJLPai7EFMRF6SZAbWuy+AuNECHiyYMQwgmn3i
	p0kXQvcUx2h9mBMdUxpD6txvBzCkasibrrGSegbxbyLVVNCo/PsyML1Hg8YEtH+efSO
X-Google-Smtp-Source: AGHT+IHyd0rjMU5k67UAqjTzwzFPT1nFixbQFJlYVvsZ8oxYL1YYOQHvMxEIakRysvdaXHIwPi972g==
X-Received: by 2002:a17:90b:2b8f:b0:2ee:df57:b194 with SMTP id 98e67ed59e1d1-2f2e91fef48mr2602950a91.21.1734512811162;
        Wed, 18 Dec 2024 01:06:51 -0800 (PST)
Received: from thinkpad ([117.193.214.60])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-218a1e6d87asm71760635ad.264.2024.12.18.01.06.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 01:06:50 -0800 (PST)
Date: Wed, 18 Dec 2024 14:36:41 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Christian Bruel <christian.bruel@foss.st.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	lpieralisi@kernel.org, kw@linux.com, bhelgaas@google.com,
	krzk+dt@kernel.org, conor+dt@kernel.org, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, p.zabel@pengutronix.de,
	cassel@kernel.org, quic_schintav@quicinc.com,
	fabrice.gasnier@foss.st.com, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/5] dt-bindings: PCI: Add STM32MP25 PCIe root complex
 bindings
Message-ID: <20241218090641.dtn4niamg6gcvxml@thinkpad>
References: <20241205172022.GA3053765@bhelgaas>
 <d976d74c-80c0-4446-bb9b-960a990c552b@foss.st.com>
 <20241217172502.borj2oy4rpxcteag@thinkpad>
 <5b835381-55bc-4fc8-b848-535f6e881420@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5b835381-55bc-4fc8-b848-535f6e881420@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_010652_464183_D878A193 
X-CRM114-Status: GOOD (  23.05  )
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

On Wed, Dec 18, 2024 at 09:42:45AM +0100, Christian Bruel wrote:
> 
> 
> On 12/17/24 18:25, Manivannan Sadhasivam wrote:
> > On Tue, Dec 17, 2024 at 04:53:48PM +0100, Christian Bruel wrote:
> > > 
> > > > Makes sense.  What about phys, resets, etc?  I'm pretty sure a PHY
> > > > would be a per-Root Port thing, and some resets and wakeup signals
> > > > also.
> > > > 
> > > > For new drivers, I think we should start adding Root Port stanzas to
> > > > specifically associate those things with the Root Port, e.g.,
> > > > something like this?
> > > > 
> > > >     pcie@48400000 {
> > > >       compatible = "st,stm32mp25-pcie-rc";
> > > > 
> > > >       pcie@0,0 {
> > > >         reg = <0x0000 0 0 0 0>;
> > > >         phys = <&combophy PHY_TYPE_PCIE>;
> > > >         phy-names = "pcie-phy";
> > > >       };
> > > >     };
> > > > 
> > > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/pci/mediatek,mt7621-pcie.yaml?id=v6.12#n111
> > > > is one binding that does this, others include apple,pcie.yaml,
> > > > brcm,stb-pcie.yaml, hisilicon,kirin-pcie.yaml.
> > > > 
> > > 
> > > On a second thought, moving the PHY to the root-port part would introduce a
> > > discrepancy with the pcie_ep binding, whereas the PHY is required on the
> > > pcie_ep node.
> > > 
> > > Even for the pcie_rc, the PHY is needed to enable the core_clk to access
> > > the PCIe core registers,
> > > 
> > 
> > But why that matters? You can still parse the child nodes, enable PHY and
> > configure PCIe registers. >
> > > So that would make 2 different required PHY locations for RC and EP:
> > > 
> > >      pcie_rc: pcie@48400000 {
> > >        compatible = "st,stm32mp25-pcie-rc";
> > > 
> > >        pcie@0,0 {
> > >          reg = <0x0000 0 0 0 0>;
> > >          phys = <&combophy PHY_TYPE_PCIE>;
> > >          phy-names = "pcie-phy";
> > >        };
> > >      };
> > > 
> > >      pcie_ep pcie@48400000 {
> > >        compatible = "st,stm32mp25-pcie-ep";
> > >        phys = <&combophy PHY_TYPE_PCIE>;
> > >        phy-names = "pcie-phy";
> > >      };
> > > 
> > > Simplest seems to keep the PHY required for the pcie core regardless of the
> > > mode and keep the empty root port to split the design
> > > 
> > 
> > No please. Try to do the right thing from the start itself.
> 
> Parsing the child node to clock the IP seems weird. Note that
> hisilicon,kirin-pcie.yaml also declares the PHY at the controller level.
> 

Nothing is weird here. Almost all multi port controller drivers does the same.
Most of the single port controller instances define port properties in
controller node only, but that's what we want to avoid now.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

