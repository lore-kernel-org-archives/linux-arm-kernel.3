Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF968C36002
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 07:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qe/MCCvdJLYJ3g+QnwJQUU6NC2SI4IaMPwysTrJxuV0=; b=pWqfTbpOndxCzMcFq+/1XVDxcQ
	z0RRbf+1+2se7vr59nPhrMTNbYBj5n5a8nirOw9ECI9h85lHue7GPVT9DqUPp3SxtNNvszvdIROVF
	uk4UsEIVq1hQzz3sFHFzNO4lo0WDx2bG+a6ybt6Ij4p2kgwW20tCur7eeLpsOvLHKGH1VCjWQiDik
	5I1lYJ1p1ZPPvokOxBdPcs+N8yNC6Axc94ZoCik53vfRZzwdzdQ9+ofUo5np9eY+rwZAfToOn4ngU
	Bf66Loz54AOU0ukehrZVeEsltJ7joQIq662VKTrMvEhqmINycp76qETnfG2vKI8x+J5vpqFbQOX1W
	R/d00a5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twcLo-00000002Sms-1t80;
	Mon, 24 Mar 2025 07:36:00 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twc9S-00000002RLt-0IB1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 07:23:15 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-22423adf751so71903105ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Mar 2025 00:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742800993; x=1743405793; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qe/MCCvdJLYJ3g+QnwJQUU6NC2SI4IaMPwysTrJxuV0=;
        b=kkczlXys8kBjlxzE3VPydr0T7sZqE9fJUzqxLW/pFEuDuPHBsvAJxvRYkZ5r5J+hx1
         sO9YpM0dalegZ5yWtHTJkE0YTEIA29Mz29x+admqFIC+cDPRqNG8XL/0fgZc9V2Iukhf
         SF9UhglmTHTkXKymwA7vJwjLvEmqlM8qa+XnhzYLrBHD4bza17Yyrdf5hMPsQVx7Y00G
         74yC4YkkRSxFwsO+byJJeY3I19G1MXzg7oN4+pvSobzS8LMbSv0AjCCLTGDxB1IIT6Es
         wUyO/9va61GJUCZTFpPQcZzbjtJUzs2wwD89nvmZ5+EdXSwOw1nmFjKZo18//lUnd5c9
         dGrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742800993; x=1743405793;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qe/MCCvdJLYJ3g+QnwJQUU6NC2SI4IaMPwysTrJxuV0=;
        b=wbdOJJiEdCgt3uCpkjcRSoQnTuaucAPAPmtx5U7WqVpmIvmA9TzhMVQbeOYeAHZJuI
         DgtQwQYtbPe5vAIU7NUF6lwwXahbscI9RBpH5PHeHuy0MhHCkZiHhmgt91BrCE+iAC3T
         WuJO62api0q8qqxnyuKdOX+MTHShat5m8hY5k+0tX4ZNhg8gqEIFLpCTH6kQVEWGNyXn
         HwNbtJtpQqv0fPbtSN30FBJsfWvLLNJm7lHaIXgtti1YKI+/mahmUZ+wcOCgEXyGoHrF
         40YLzYlm/S3SAQwTCS+fyrUM6Dm6TXA0PiHzNEN6hOVd/urc/VpUtF5MKm7QggnYqZl3
         fLCw==
X-Forwarded-Encrypted: i=1; AJvYcCW8iO00HRlJ85lNxcGZyyCyH/H5QaaRh/weGGEXfwkfHo95Atp7pfov8d9jIUSVv/B+arnZBC6odK7FQRv3Szpd@lists.infradead.org
X-Gm-Message-State: AOJu0YxKPCHNstLXtf3xhap3TthAVhGsDLlfz1v2bV9KJ+Kd0FuNlzEL
	wauHkIsjx5+JFw6Wtu9IKsxZVIaqQsYAgGanftSMVIOur9/Ri7bORt3E4vn19g==
X-Gm-Gg: ASbGncu9QIvwsy5Q0nXYLGqdt42n2gYUg5KPeKE5yS2MSFW7WZlTBgUHoK+l7tqzwGH
	StStSbeq4uQ1foi9g9pAitNytDdYYhCPREibWjgvVUrJRYZ1HndQqXqmea5h78qst6/hcfq/nlg
	ZcFFkXIJLDMqfOlfYMV2+VmR9Az6QVxIFZuEt94iy68kkVn08U1qpxaeU8W3+22uM00IUY93IES
	10xvUGuQJGQDXXDqJScICEfhJgBLgJW674sQJNmDw3K+936ChN+wU0RuC4EDarzowCeymcvFuc9
	dWFv7KGmx9BDc4TmLJ6P5x1ADS6+gChDouUcLqeUMVBlI5CelSxCgdGlRWwSs2Q2iZQ=
X-Google-Smtp-Source: AGHT+IEVDoBTCHOODzvBGMAnc/Iok1j6AhaExydrGDQgnCUirKAYBNkCKwG2t70sQoq1tMM3o02m1Q==
X-Received: by 2002:a17:903:230d:b0:220:e9ac:e746 with SMTP id d9443c01a7336-22780e46648mr200826765ad.53.1742800992590;
        Mon, 24 Mar 2025 00:23:12 -0700 (PDT)
Received: from thinkpad ([220.158.156.91])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22781208966sm63304325ad.254.2025.03.24.00.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 00:23:12 -0700 (PDT)
Date: Mon, 24 Mar 2025 12:53:05 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: Frank Li <Frank.Li@nxp.com>, Tony Lindgren <tony@atomide.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH PATCH RFC NOT TESTED 1/2] ARM: dts: ti: dra7: Correct
 ranges for PCIe and parent bus nodes
Message-ID: <hhvst2uvlymcyir5sb5vwd4ezko7yawwp5cnosluaz2hkabcna@ywr4thtjpdps>
References: <20250305-dra-v1-0-8dc6d9a0e1c0@nxp.com>
 <20250305-dra-v1-1-8dc6d9a0e1c0@nxp.com>
 <20250313165311.2fj7aus3pcsg4m2c@thinkpad>
 <20250314064642.fyf3jqylmc6meft7@uda0492258>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250314064642.fyf3jqylmc6meft7@uda0492258>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_002314_133778_CFCE2A2F 
X-CRM114-Status: GOOD (  43.82  )
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

On Fri, Mar 14, 2025 at 12:16:42PM +0530, Siddharth Vadapalli wrote:
> On Thu, Mar 13, 2025 at 10:23:11PM +0530, Manivannan Sadhasivam wrote:
> 
> Hello Mani,
> 
> > On Wed, Mar 05, 2025 at 11:20:22AM -0500, Frank Li wrote:
> > 
> > If you want a specific patch to be tested, you can add [PATCH RFT] tag.C
> > 
> > > According to code in drivers/pci/controller/dwc/pci-dra7xx.c
> > > 
> > > dra7xx_pcie_cpu_addr_fixup()
> > > {
> > > 	return cpu_addr & DRA7XX_CPU_TO_BUS_ADDR;  //0x0FFFFFFF
> > > }
> > > 
> > > PCI parent bus trim high 4 bits address to 0. Correct ranges in
> > > target-module@51000000 to algin hardware behavior, which translate PCIe
> > > outbound address 0..0x0fff_ffff to 0x2000_0000..0x2fff_ffff.
> > > 
> > > Set 'config' and 'addr_space' reg values to 0.
> > > Change parent bus address of downstream I/O and non-prefetchable memory to
> > > 0.
> > > 
> > > Ensure no functional impact on the final address translation result.
> > > 
> > > Prepare for the removal of the driver’s cpu_addr_fixup().
> > > 
> > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > ---
> > >  arch/arm/boot/dts/ti/omap/dra7.dtsi | 18 +++++++++---------
> > >  1 file changed, 9 insertions(+), 9 deletions(-)
> > > 
> > > diff --git a/arch/arm/boot/dts/ti/omap/dra7.dtsi b/arch/arm/boot/dts/ti/omap/dra7.dtsi
> > > index b709703f6c0d4..9213fdd25330b 100644
> > > --- a/arch/arm/boot/dts/ti/omap/dra7.dtsi
> > > +++ b/arch/arm/boot/dts/ti/omap/dra7.dtsi
> > > @@ -196,7 +196,7 @@ axi0: target-module@51000000 {
> > >  			#size-cells = <1>;
> > >  			#address-cells = <1>;
> > >  			ranges = <0x51000000 0x51000000 0x3000>,
> > > -				 <0x20000000 0x20000000 0x10000000>;
> > > +				 <0x00000000 0x20000000 0x10000000>;
> > 
> > I'm not able to interpret this properly. So this essentially means that the
> > parent address 0x20000000 is mapped to child address 0x00000000. And the child
> > address is same for other controller as well.
> > 
> > Also, the cpu_addr_fixup() is doing the same by masking out the upper 4 bits. I
> > tried looking into the DRA7 TRM, but it says (ECAM_Param_Base_Addr +
> > 0x20000000) where ECAM_Param_Base_Addr = 0x0000_0000 to 0x0FFF_F000.
> > 
> > I couldn't relate TRM with the cpu_addr_fixup() callback. Can someone from TI
> > shed light on this?
> 
> A "git blame" on the line being modified in dra7.dtsi gives the
> following commit:
> https://github.com/torvalds/linux/commit/c761028ef5e2
> prior to which the ranges is exactly the same as the one being added by
> this patch.
> 
> The cpu_addr_fixup() function was introduced by the following commit:
> https://github.com/torvalds/linux/commit/2ed6cc71e6f7
> with the reason described in
> Section 24.9.4.3.2 PCIe Controller Slave Port
> of the T.R.M. at:
> https://www.ti.com/lit/ug/spruic2d/spruic2d.pdf
> ---------------------------------------------------------------------------
> NOTE:
> The PCIe controller remains fully functional, and able to send transactions
> to, for example, anywhere within the 64-bit PCIe memory space, with the
> appropriate remapping of the 28-bit address by the outbound address
> translation unit (iATU). The limitation is that the total size of addressed
> PCIe regions (in config, memory, IO spaces) must be less than 2^28 bytes.
> ---------------------------------------------------------------------------
> 
> The entire sequence is:
> 0) dra7.dtsi had ranges which match the ranges in the current patch.
> 1) cpu_addr_fixup() was added by
> https://github.com/torvalds/linux/commit/2ed6cc71e6f7
> 2) ranges was updated to <0x20000000 0x20000000 0x10000000> by:
> https://github.com/torvalds/linux/commit/c761028ef5e2
> 3) ranges is being changed back to its original state of "0)" above.
> 

Thanks a lot for the reference.

> cpu_addr_fixup() was introduced to remove the following:
> 	pp->io_base &= DRA7XX_CPU_TO_BUS_ADDR;
> 	pp->mem_base &= DRA7XX_CPU_TO_BUS_ADDR;
> 	pp->cfg0_base &= DRA7XX_CPU_TO_BUS_ADDR;
> 	pp->cfg1_base &= DRA7XX_CPU_TO_BUS_ADDR;
> in dra7xx_pcie_host_init(). The reason for the above is mentioned in the
> "NOTE" as:
> ---------------------------------------------------------------------------
> The limitation is that the total size of addressed PCIe regions
> (in config, memory, IO spaces) must be less than 2^28 bytes.
> ---------------------------------------------------------------------------
> 

I don't think so. This note is for the *size* of the addressed regions. The
fixup corresponds to the sentence in your above note from TRM:

"able to send transactions to, for example, anywhere within the 64-bit PCIe
memory space, with the appropriate remapping of the 28-bit address by the
outbound address translation unit (iATU)"

I think the limitation is due to the 29-bit address bus width of the PCIe
controller slave port as mentionend in section, 24.9.4.3.2. And that correlates
to the truncation of the upper 4 bits of the IO/CFG/MEM addresses. So even if
the CPU passes address range relative to offset 0, PCIe controller converts it
to 0x20000000/0x30000000 based on the instance.

If my understanding is correct, then commit, c761028ef5e2 should be reverted and
this patch can be applied.

> I am not sure if Frank is accounting for all of this in the current patch
> as well as the dependent patch series associated with removing
> cpu_addr_fixup().
> 
> Regarding testing the series, I unfortunately don't have the hardware so
> I cannot test it.
> 

That's a pity. If TI employee doesn't have access to an upstream supported
platform, then I'm not sure whom we should ask for testing.

Could you please ask around and see if you can get access to one? I'm sure that
the hardware will be available somewhere :)

- Mani

-- 
மணிவண்ணன் சதாசிவம்

