Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B843C36002
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 07:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t4Jk0LIldEE4o6suSfIbfBeNG/DNl11H9LcTF8uhDEw=; b=ee5HxdFD9Zzh/o5ERUaegfdQ88
	XhCk40j41yhuUY/5Avcg/G1xlYcGkTR2fFSBv/nIzfQXJD06DRe+/Qtn3yILTVWy7vY7PUbgYfF6s
	dtl39WcqlfoZMeuJlKXQq2SxCzqNBlYe6rOoe2x8U3u9mEvxkOKgwR5aGs0gIEFtYCtsWS4bv/UPX
	uZZ5NxD2Juq3Z7iLDfL5WwjtzzJOXl8+jduuHcmm9a9mkf62eoZPQ2Ylckru45Z3OjOwAoAmDTziK
	9cse99yTxCU6bKpIcDwGrfwuBQMnFpZnM/JNzg2XeP+X33b/YiGqo0Yn8OUmK+7MRysRdz1BlImYF
	1eEKs4eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twcQx-00000002Tfb-09xh;
	Mon, 24 Mar 2025 07:41:19 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twcDZ-00000002Rs2-30SL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 07:27:31 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-223fd89d036so72847245ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Mar 2025 00:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742801249; x=1743406049; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=t4Jk0LIldEE4o6suSfIbfBeNG/DNl11H9LcTF8uhDEw=;
        b=WTG45FK+fX1nlrRTB2mPpxrDenjlyTNBjzOGOhsr7ZuhlENRmmuTxQO8INOw24mibP
         Ch2rRxK45jli26/tAoVCywHWkRSERnSrV6tviJIlqTdVyoJLsSk/0LsIjT8SGdwMKF43
         i7hHVuu18ZxCLGUbYl5zYnszAV6zk4056WZNRk6xhKYyORVUaZU5u6roo/adNHGsaKZq
         H2rdMD26pv1eOXyMtLysjxXAJc0V5tHiscSgFjePeBd8gOxMFngAXhyxx6N9j+4D6Npy
         C9Qknhtsw2JWelAkrU11rRixfW7FeiTlCb99KKstF56GonlyyRaS/0ZWhbChjZ1j8uhi
         nDTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742801249; x=1743406049;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t4Jk0LIldEE4o6suSfIbfBeNG/DNl11H9LcTF8uhDEw=;
        b=T92hk0b/vnwPJjMMhw94kfkCrViGhKI8JuecaR1pfUMXRXz50Cyofyn+V2M3sEtdCr
         ceeVzBrHETS9KLIqDj2BCc6xz+I3AxL+v1GyMzKDWGkM2WZ9tK2YRv8eZHf7LG3cM20L
         leZPLcItwJ1449ywu870NwIYGAjVlWGPKJiDQcsHS4x2JRFA1gNnpiG3PtEvyAaQrwPl
         kDpZl25lEq+pvxE63Q6uc/l9UAmx2ENmUc75SL07YouzmPHRQh47ri35nyFvFvV+5Umn
         5dSk6CCTBFlc5HkiFXqm6cCxirqfVLQBkccf98+vk5L4B20QVcITeSlY4UmCVWSn+mih
         NW1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXGgG3ftAugk3p/QOgrmf6NhpU1JjrGKIsppFYfM/04n3+BRAu7uvFYgwFjZjISlouimouV5hn0SRQSOTdKYANw@lists.infradead.org
X-Gm-Message-State: AOJu0YwV/moIc3Bq3GNV7nZ3zduftYOhBhqOha47H8QCEa/mAzcIFKjP
	Kx7lx1B/dxIsAFo104cxTZdmU/XERF+Jb9jxk8byd3gvYuTP/dfcBuot2aSkeg==
X-Gm-Gg: ASbGncsYfq+z2b2gwVfN8qJ4V12BsMU/LWAaFzIGf94D3JJJMc1P0GICd1R7kzZp66t
	vgTHOE2OK9fOrx4o7sxRDIl3RFbY3NwcJHo03UtvKNhZA9aN2nYlnApI6kvZ6smJKcAVivOIfPC
	V6nN79m2Z0xAxI+sWhy8/QW1EWCnbHRe7HdxKceQEy/TNEgckyFrWQkPX5Nz5GECHleHvmBaJIs
	HlrIeBVQDKk903DUfITrSk9RwGk9R1A4iL/BU/N2t/8HAchNdi0wLZNUFzkxvBKUHw+vmSOirrp
	LcrikppQorKeL2CogFFets6RllSoQsmSCPwJjSKvqlucMtCFrs9ExzqQv8hsbN9x/uo=
X-Google-Smtp-Source: AGHT+IHB65h48pA/PuuIX4VGQx/BccbBSG+++EkqxSdIHlt8LtP0CEKu1UjMquapa/+391yz2zz6zQ==
X-Received: by 2002:aa7:9317:0:b0:736:a682:deb8 with SMTP id d2e1a72fcca58-7390596685bmr22890137b3a.8.1742801248596;
        Mon, 24 Mar 2025 00:27:28 -0700 (PDT)
Received: from thinkpad ([220.158.156.91])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73905fd67c1sm7406411b3a.60.2025.03.24.00.27.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 00:27:27 -0700 (PDT)
Date: Mon, 24 Mar 2025 12:57:21 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Siddharth Vadapalli <s-vadapalli@ti.com>, 
	Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Bjorn Helgaas <bhelgaas@google.com>, linux-omap@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH PATCH RFC NOT TESTED 1/2] ARM: dts: ti: dra7: Correct
 ranges for PCIe and parent bus nodes
Message-ID: <ahkgq7aujrluhuqbdv2mbn5gjcu6hn4bi3jw4xar52ximyx5pi@mw4v4lzrvtky>
References: <20250305-dra-v1-0-8dc6d9a0e1c0@nxp.com>
 <20250305-dra-v1-1-8dc6d9a0e1c0@nxp.com>
 <20250313165311.2fj7aus3pcsg4m2c@thinkpad>
 <20250314064642.fyf3jqylmc6meft7@uda0492258>
 <Z9RFJDdnoU+aKwF7@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z9RFJDdnoU+aKwF7@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_002729_765248_F4C409A9 
X-CRM114-Status: GOOD (  49.66  )
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

On Fri, Mar 14, 2025 at 11:03:00AM -0400, Frank Li wrote:
> On Fri, Mar 14, 2025 at 12:16:42PM +0530, Siddharth Vadapalli wrote:
> > On Thu, Mar 13, 2025 at 10:23:11PM +0530, Manivannan Sadhasivam wrote:
> >
> > Hello Mani,
> >
> > > On Wed, Mar 05, 2025 at 11:20:22AM -0500, Frank Li wrote:
> > >
> > > If you want a specific patch to be tested, you can add [PATCH RFT] tag.C
> > >
> > > > According to code in drivers/pci/controller/dwc/pci-dra7xx.c
> > > >
> > > > dra7xx_pcie_cpu_addr_fixup()
> > > > {
> > > > 	return cpu_addr & DRA7XX_CPU_TO_BUS_ADDR;  //0x0FFFFFFF
> > > > }
> > > >
> > > > PCI parent bus trim high 4 bits address to 0. Correct ranges in
> > > > target-module@51000000 to algin hardware behavior, which translate PCIe
> > > > outbound address 0..0x0fff_ffff to 0x2000_0000..0x2fff_ffff.
> > > >
> > > > Set 'config' and 'addr_space' reg values to 0.
> > > > Change parent bus address of downstream I/O and non-prefetchable memory to
> > > > 0.
> > > >
> > > > Ensure no functional impact on the final address translation result.
> > > >
> > > > Prepare for the removal of the driver’s cpu_addr_fixup().
> > > >
> > > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > > ---
> > > >  arch/arm/boot/dts/ti/omap/dra7.dtsi | 18 +++++++++---------
> > > >  1 file changed, 9 insertions(+), 9 deletions(-)
> > > >
> > > > diff --git a/arch/arm/boot/dts/ti/omap/dra7.dtsi b/arch/arm/boot/dts/ti/omap/dra7.dtsi
> > > > index b709703f6c0d4..9213fdd25330b 100644
> > > > --- a/arch/arm/boot/dts/ti/omap/dra7.dtsi
> > > > +++ b/arch/arm/boot/dts/ti/omap/dra7.dtsi
> > > > @@ -196,7 +196,7 @@ axi0: target-module@51000000 {
> > > >  			#size-cells = <1>;
> > > >  			#address-cells = <1>;
> > > >  			ranges = <0x51000000 0x51000000 0x3000>,
> > > > -				 <0x20000000 0x20000000 0x10000000>;
> > > > +				 <0x00000000 0x20000000 0x10000000>;
> > >
> > > I'm not able to interpret this properly. So this essentially means that the
> > > parent address 0x20000000 is mapped to child address 0x00000000. And the child
> > > address is same for other controller as well.
> > >
> > > Also, the cpu_addr_fixup() is doing the same by masking out the upper 4 bits. I
> > > tried looking into the DRA7 TRM, but it says (ECAM_Param_Base_Addr +
> > > 0x20000000) where ECAM_Param_Base_Addr = 0x0000_0000 to 0x0FFF_F000.
> > >
> > > I couldn't relate TRM with the cpu_addr_fixup() callback. Can someone from TI
> > > shed light on this?
> >
> > A "git blame" on the line being modified in dra7.dtsi gives the
> > following commit:
> > https://github.com/torvalds/linux/commit/c761028ef5e2
> > prior to which the ranges is exactly the same as the one being added by
> > this patch.
> 
> Okay, original one correct reflect hardware behavior.
> 
> >
> > The cpu_addr_fixup() function was introduced by the following commit:
> > https://github.com/torvalds/linux/commit/2ed6cc71e6f7
> > with the reason described in
> > Section 24.9.4.3.2 PCIe Controller Slave Port
> > of the T.R.M. at:
> > https://www.ti.com/lit/ug/spruic2d/spruic2d.pdf
> > ---------------------------------------------------------------------------
> > NOTE:
> > The PCIe controller remains fully functional, and able to send transactions
> > to, for example, anywhere within the 64-bit PCIe memory space, with the
> > appropriate remapping of the 28-bit address by the outbound address
> > translation unit (iATU). The limitation is that the total size of addressed
> > PCIe regions (in config, memory, IO spaces) must be less than 2^28 bytes.
> > ---------------------------------------------------------------------------
> >
> > The entire sequence is:
> > 0) dra7.dtsi had ranges which match the ranges in the current patch.
> > 1) cpu_addr_fixup() was added by
> > https://github.com/torvalds/linux/commit/2ed6cc71e6f7
> > 2) ranges was updated to <0x20000000 0x20000000 0x10000000> by:
> > https://github.com/torvalds/linux/commit/c761028ef5e2
> 
> Actually this patch is not necessary, with cpu_addr_fixup(), it should
> work with/without c761028ef5e2 change because it just the use CPU physical
> address, the finial result is exact same.
> 
> > 3) ranges is being changed back to its original state of "0)" above.
> >
> > cpu_addr_fixup() was introduced to remove the following:
> > 	pp->io_base &= DRA7XX_CPU_TO_BUS_ADDR;
> > 	pp->mem_base &= DRA7XX_CPU_TO_BUS_ADDR;
> > 	pp->cfg0_base &= DRA7XX_CPU_TO_BUS_ADDR;
> > 	pp->cfg1_base &= DRA7XX_CPU_TO_BUS_ADDR;
> > in dra7xx_pcie_host_init(). The reason for the above is mentioned in the
> > "NOTE" as:
> > ---------------------------------------------------------------------------
> > The limitation is that the total size of addressed PCIe regions
> > (in config, memory, IO spaces) must be less than 2^28 bytes.
> > ---------------------------------------------------------------------------
> >
> 
> That is functional equal.
> 
> > I am not sure if Frank is accounting for all of this in the current patch
> > as well as the dependent patch series associated with removing
> > cpu_addr_fixup().
> 
> I have not track back the history. I think before
> https://github.com/torvalds/linux/commit/c761028ef5e2 is correct reflect
> hardware behavor. axi@0 trim down 4 bits before send to PCI controller.
> 
> The commit message of c761028ef5e2
> 
> "In order to update pcie to probe with ti-sysc and genpd, let's update the
> pcie ranges to not use address 0 for 0x20000000 and 0x30000000. The range
> for 0 is typically used for child devices as the offset from the module
> base. In the following patches, we will update pcie to probe with ti-sysc,
> and the patches become a bit confusing to read compared to other similar
> modules unless we update the ranges first. So let's just use the full
> addresses for ranges for the 0x20000000 and 0x30000000 ranges."
> 
> I think maybe only ti's bus fabric do address translation at that time, and
> DT team and dwc pci driver never consider that before. Now more vendor bus
> fabric do address translation. So needn't every platform driver consider it
> but it require DTB reflect hardware behavor correctly.
> 
> We may revert patch c761028ef5e2 firstly, after some time later, we can
> cleanup cpu_addr_fixup().
> 

I agree. Commit, c761028ef5e2 is not going to break anything afaik (even the
cpu_addr_fixup), but it would be good to get it tested.

> It will be wondful, if someone help test it.
> 

Let's see if Siddharth can come up with some good news.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

