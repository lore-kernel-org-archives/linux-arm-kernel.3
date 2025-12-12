Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50229D44176
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 10:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oH5Dsb1naLnW7dWzGXhlOLJ/pnzetkUvxVuR5fJQEFg=; b=VELaRmJYqNjMn2stGc3i655v87
	qRlimJALNG9vqA9fHh4l3wjT3o/nGeN70DBwBGMuFCGSznU9R6KJWgPhAELq18g5Ya9SPvZQ9JS+/
	XV9hWHn5UVSwh7goegCvbFFa3erALi8cBgcfXCs6tVi0dHyJdcRNfT6D/PapetEalizeI+pm+A/0Z
	i/1QRrI17J06fRdKhH1tH3N3fDedeOJCJNc5yjKb4faR6ADR7aagnKgZaS/U+WbnQA0FhK9FOpRyE
	If+dSv7a0o4KRzx8XlWiqbonxW62VOYzJI1U66v0ODHe6pn8Ck4LbXCpt8hQvsIXnumfrMeIPEu/2
	EzvKAcGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU0j4-00000000RfB-1DH8;
	Fri, 12 Dec 2025 10:50:18 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU0j1-00000000ReW-43V0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 10:50:17 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-6419aaced59so1689470a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Dec 2025 02:50:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765536614; x=1766141414; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oH5Dsb1naLnW7dWzGXhlOLJ/pnzetkUvxVuR5fJQEFg=;
        b=gmbn0suxgD9m8c8ld7Y0PHy6MHAHuParoTeJD1bkrpEQPDtNE3+7Bly4VWi4Ul4sQO
         PHVvPznUEYhw7Tj/9KdS55gvvg8peyFt82YvNTgrKX+BvpDli3HGuyuEmaWX02mWq6fY
         IyY/jenJzES2yF8qhu/bXTA/nTOJsnF8RNTfL1SHhm3XkYr+BqFuj97KONC1teq3k4Gr
         TOvuOkuUZsJO7dyckDruOw+iHPa5ZJvmTypVhE4toTR2J2cxQbKkxrD4Z7O2vfqyCbi4
         2Fb3Ox9XE7Z9ytIjDrKauK6rvDZlcpSSUdY4CUA8ABQ9/ROpa0NMGs2S5WakK+WWqydo
         b9eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765536614; x=1766141414;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oH5Dsb1naLnW7dWzGXhlOLJ/pnzetkUvxVuR5fJQEFg=;
        b=j9f4lJLFJ8eJRtGixC4kKkIgj7x4EbwwLycB3Fdpk/bHOUEWg6QIkVj8lMMLVyk1Th
         UQoIpuGkA++EUwvs/ZK6g6X1J+gt5IzKvfsH0gII2xXfnuRVw+UfimOfpjRw2IA5IdWP
         KTsZN4Fr1vZ35565a2LFmUTr1kMQW/9VATHTepawPkPcE6mvUsnBzQVpIWOEidAzpPTz
         tNzV2+00JAZHkHWpKu9WTHTt59VHx57aCFhySlcreFMP0MQbzjKgX5d0koiksxkmhaMk
         k9aI4DdmEhtMjW8URvo5Z1Ll9RZOITgv2qggg+vDlg3kKPRefsf1kmdDc2/ByZe6NAqH
         rFQQ==
X-Forwarded-Encrypted: i=1; AJvYcCWoWwjqzukj5fCnExBO25ZSYd8L+coxPUhFazDMfJ4dWvWlBFBqXAlPvvQup2D8+FaR87svoe8dDny+CUMalQNv@lists.infradead.org
X-Gm-Message-State: AOJu0YyEV0C47wMENoTBrqrdkvI1Vf8HorvObZs2Ozm/IQjIb2CMIsaZ
	Y1ei3+JsMVBJ1dVWgQ5ghbcshlDO+BpFMuLotH4aGqzlQuIgsUTpCGmN8KHVTT6/URA=
X-Gm-Gg: AY/fxX5JODhyCxiGHBu75lMITzB68cIu+QsF7a/blkdPuxcKnxfInz2tTfVO0q/r5OD
	1SV8hNuldAisXVGPrFomRINxMEOQzzGTY3J+70dpuV0e7iMuSlnZszuGv2IXqcTsxKpdtff727W
	UVsqCAPaqh2GmaZ2i7xyo9naR/uQK2kmdjOLCbey7rzzx14TVpHQYT0cy2u2E/331KxNt0oFRHZ
	WcT57WX9qm4eO/QT/tQ7tAp7uv8euzGQkwJGyVFpFVjVeloC817gvip7Jk5jb6jP0JhczVZiWJK
	KuR/POt9vYxAwBx960eztdRwHEor8qKqbSCoS2cr6u1mSUap4v2SEJpRNrfhB3IRX9fNBoeB/+Y
	3GY+2yxJSxRWBpPChla5cwgJLuYYKQM24uilWOBrrw7vkmYvSPFKHOx5Otc1m4kBYVsbAzwyCYP
	8fRRO/Xo5llPLv5ZnTKPfqeA2lRZ3+0mY/NVqZXE+xEQN/tpvcpwRPrg==
X-Google-Smtp-Source: AGHT+IGck4kKwwuc5UddoonnynVhYKwpmHQM5vRIV3zz1AKvip50OdgKpOlRUBUIDMMPxx61FIjoTg==
X-Received: by 2002:a05:6402:3551:b0:649:8378:994a with SMTP id 4fb4d7f45d1cf-6499b07e4b6mr1530658a12.0.1765536613938;
        Fri, 12 Dec 2025 02:50:13 -0800 (PST)
Received: from localhost (host-87-6-211-245.retail.telecomitalia.it. [87.6.211.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6498210ed32sm4861010a12.29.2025.12.12.02.50.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 02:50:13 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Fri, 12 Dec 2025 11:52:44 +0100
To: Herve Codina <herve.codina@bootlin.com>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Jim Quinlan <jim2101024@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>, kwilczynski@kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, iivanov@suse.de, svarbanov@suse.de,
	mbrugger@suse.com, Jonathan Bell <jonathan@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] dt-bindings: pci: brcmstb: Add rp1-nexus node to fix DTC
 warning
Message-ID: <aTvz_OeVnciiqATz@apocalypse>
References: <20250812085037.13517-1-andrea.porta@suse.com>
 <4fee3870-f9d5-48e3-a5be-6df581d3e296@kernel.org>
 <aKc5nMT1xXpY03ip@apocalypse>
 <e7875f70-2b79-48e0-a63b-caf6f1fd287b@kernel.org>
 <aLVePQRfU4IB1zK8@apocalypse>
 <CAL_JsqJUzB71QdMcxJtNZ7raoPcK+SfTh7EVzGmk=syo8xLKQw@mail.gmail.com>
 <aThjYt3ux0U-9-3A@apocalypse>
 <aThp99OfgAfNFUX-@apocalypse>
 <20251210150008.2ef2f8c4@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251210150008.2ef2f8c4@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_025016_092522_35972C0F 
X-CRM114-Status: GOOD (  72.48  )
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

Hi Herve, Rob,

On 15:00 Wed 10 Dec     , Herve Codina wrote:
> Hi Andrea,
> 
> On Tue, 9 Dec 2025 19:27:03 +0100
> Andrea della Porta <andrea.porta@suse.com> wrote:
> 
> > [+cc Herve]
> > 
> > On 18:58 Tue 09 Dec     , Andrea della Porta wrote:
> > > Hi Rob,
> > > 
> > > On 11:09 Thu 04 Dec     , Rob Herring wrote:  
> > > > On Mon, Sep 1, 2025 at 3:48 AM Andrea della Porta <andrea.porta@suse.com> wrote:  
> > > > >
> > > > > Hi Krzysztof,
> > > > >
> > > > > On 08:50 Fri 22 Aug     , Krzysztof Kozlowski wrote:  
> > > > > > On 21/08/2025 17:22, Andrea della Porta wrote:  
> > > > > > > Hi Krzysztof,
> > > > > > >
> > > > > > > On 10:55 Tue 12 Aug     , Krzysztof Kozlowski wrote:  
> > > > > > >> On 12/08/2025 10:50, Andrea della Porta wrote:  
> > > > > > >>> The devicetree compiler is complaining as follows:
> > > > > > >>>
> > > > > > >>> arch/arm64/boot/dts/broadcom/rp1-nexus.dtsi:3.11-14.3: Warning (unit_address_vs_reg): /axi/pcie@1000120000/rp1_nexus: node has a reg or ranges property, but no unit name
> > > > > > >>> /home/andrea/linux-torvalds/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: pcie@1000120000: Unevaluated properties are not allowed ('rp1_nexus' was unexpected)  
> > > > > > >>
> > > > > > >> Please trim the paths.  
> > > > > > >
> > > > > > > Ack.
> > > > > > >  
> > > > > > >>  
> > > > > > >>>
> > > > > > >>> Add the optional node that fix this to the DT binding.
> > > > > > >>>
> > > > > > >>> Reported-by: kernel test robot <lkp@intel.com>
> > > > > > >>> Closes: https://lore.kernel.org/oe-kbuild-all/202506041952.baJDYBT4-lkp@intel.com/
> > > > > > >>> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > > > > > >>> ---
> > > > > > >>>  Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml | 9 +++++++++
> > > > > > >>>  1 file changed, 9 insertions(+)
> > > > > > >>>
> > > > > > >>> diff --git a/Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml b/Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml
> > > > > > >>> index 812ef5957cfc..7d8ba920b652 100644
> > > > > > >>> --- a/Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml
> > > > > > >>> +++ b/Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml
> > > > > > >>> @@ -126,6 +126,15 @@ required:
> > > > > > >>>  allOf:
> > > > > > >>>    - $ref: /schemas/pci/pci-host-bridge.yaml#
> > > > > > >>>    - $ref: /schemas/interrupt-controller/msi-controller.yaml#
> > > > > > >>> +  - if:
> > > > > > >>> +      properties:
> > > > > > >>> +        compatible:
> > > > > > >>> +          contains:
> > > > > > >>> +            const: brcm,bcm2712-pcie
> > > > > > >>> +    then:
> > > > > > >>> +      properties:
> > > > > > >>> +        rp1_nexus:  
> > > > > > >>
> > > > > > >> No, you cannot document post-factum... This does not follow DTS coding
> > > > > > >> style.  
> > > > > > >
> > > > > > > I think I didn't catch what you mean here: would that mean that
> > > > > > > we cannot resolve that warning since we cannot add anything to the
> > > > > > > binding?  
> > > > > >
> > > > > > I meant, you cannot use a warning from the code you recently introduced
> > > > > > as a reason to use incorrect style.
> > > > > >
> > > > > > Fixing warning is of course fine and correct, but for the code recently
> > > > > > introduced and which bypassed ABI review it is basically like new review
> > > > > > of new ABI.
> > > > > >
> > > > > > This needs standard review practice, so you need to document WHY you
> > > > > > need such node. Warning is not the reason here why you are doing. If
> > > > > > this was part of original patchset, like it should have been, you would
> > > > > > not use some imaginary warning as reason, right?
> > > > > >
> > > > > > So provide reason why you need here this dedicated child, what is that
> > > > > > child representing.  
> > > > >
> > > > > Ack.
> > > > >  
> > > > > >
> > > > > > Otherwise I can suggest: drop the child and DTSO, this also solves the
> > > > > > warning...  
> > > > >
> > > > > This would not fix the issue: it's the non overlay that needs the specific
> > > > > node. But I got the point, and we have a solution for that (see below).
> > > > >  
> > > > > >  
> > > > > > >
> > > > > > > Regarding rp1_nexus, you're right I guess it should be
> > > > > > > rp1-nexus as per DTS coding style.
> > > > > > >  
> > > > > > >>
> > > > > > >> Also:
> > > > > > >>
> > > > > > >> Node names should be generic. See also an explanation and list of
> > > > > > >> examples (not exhaustive) in DT specification:
> > > > > > >> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation  
> > > > > > >
> > > > > > > In this case it could be difficult: we need to search for a DT node  
> > > > > >
> > > > > > Search like in driver? That's wrong, you should be searching by compatible.  
> > > > >
> > > > > Thanks for the hint. Searching by compatble is the solution.  
> > > > 
> > > > No, it is not.  
> > > 
> > > This is partly true, indeed. On one side there's the need to avoid a
> > > specific node name ('rp1_nexus'), so the only other unique identifier would
> > > be the compatible string ('pci1de4,1' in this case, which identifies that specific
> > > device). Unfortunately, the same compatible string is also assigned to the pci
> > > endpoint node filled automatically by enabling CONFIG_PCI_DYNAMIC_OF_NODES.
> > > We would end up with two nodes with the same compatible, which is not unique
> > > anymore. 
> > > This applies only when using 'full' dtb (bcm2712-rpi-5-b.dtb) *and* you enable
> > > CONFIG_PCI_DYNAMIC_OF_NODES, the latter being not necessary since the overlay dtb
> > > (...-ovl-rp1.dtb) is not in use here. To overcome this problem, the solutions
> > > I can think of are the following:
> > > 
> > > 1- Just disable CONFIG_PCI_DYNAMIC_OF_NODES should work, but only when using the
> > >    full dtb version. However, if the user enable that option for debug or to use
> > >    the overlay dtb version, he better be sure not to use teh full dtb or it won't
> > >    work.
> > >    This solution seems really weak.
> > > 
> > > 2- Add another compatible string other than 'pci1de4,1', so it will be really
> > >    unique.
> > >   
> > > >   
> > > > > >  
> > > > > > > starting from the DT root and using generic names like pci@0,0 or
> > > > > > > dev@0,0 could possibly led to conflicts with other peripherals.
> > > > > > > That's why I chose a specific name.  
> > > > > >
> > > > > > Dunno, depends what can be there, but you do not get a specific
> > > > > > (non-generic) device node name for a generic PCI device or endpoint.  
> > > > >
> > > > > I would use 'port' instead of rp1-nexus. Would it work for you?  
> > > > 
> > > > Do you still plan to fix this? This is broken far worse than just the node name.  
> > > 
> > > Yes, if we want to get rid of that nasty warning and comply with DT guidelines,
> > > I think I really need to fix that.
> > >   
> > > > 
> > > > The 'rp1_nexus' node is applied to the PCI host bridge. That's wrong
> > > > unless this is PCI rather than PCIe. There's the root port device in
> > > > between.
> > > > 
> > > > The clue that things are wrong are start in the driver here:
> > > > 
> > > > rp1_node = of_find_node_by_name(NULL, "rp1_nexus");
> > > > if (!rp1_node) {
> > > >   rp1_node = dev_of_node(dev);
> > > >   skip_ovl = false;
> > > > }
> 
> I don't fully understand what you want to do.
> 
> This piece of code is present in the drivers/misc/rp1/rp1_pci.c driver.
> This driver is used when a specific PCI device is available on the system.
> This device is PCI_DEVICE(PCI_VENDOR_ID_RPI, PCI_DEVICE_ID_RPI_RP1_C0)
> 
> In order to work, the driver needs either CONFIG_PCI_DYNAMIC_OF_NODES or
> having the full PCI hierarchy described in the DT leading to this device.
> Indeed, it needs a DT node related to the PCI device.
> 
> I don't understand why rp1_nexus should be described at the PCI controller
> root level.
> 
> Only PCI devices (or bridges as they are particular devices) at this level
> as decribed in the pci-bus-common.yaml binding [1].

Ack. As you and Rob pointed out, I will amend the full DT hierarchy with the
PCI nodes in the way as they are dynamically created by CONFIG_PCI_DYNAMIC_OF_NODES.

> 
> If the purpose of this 'rp1_nexus' node is to only avoid the application of
> the overlay, even if I don't understand why, you should search for something
> added by the overlay and not for the 'rp1_nexus' node in the whole DT.

I cannot search for something added by the overlay if I need to choose whether
to apply the overlay or not in teh first place (iIOW the overlay is not yet loaded).
This is not of a concern however, since I'm planning to get rid of the overlay
for reasons already explained here [1]. This will not only solve all of this
problems but it will also address Rob's concern of not relying on 
CONFIG_PCI_DYNAMIC_OF_NODES.

> 
> Instead of:
>   rp1_node = of_find_node_by_name(NULL, "rp1_nexus");
> 
> You should search for a sub-node added by the overlay. Something like the
> following for instance:
> --- 8< ---
> int rp1_probe(struct pci_dev *pdev, const struct pci_device_id *id)
> {
> 	struct device_node *np;
> 
> 	np = dev_of_node(&pdev->dev);
> 
> 	...
> 	if ( np && of_find_node_by_name(np, "pci-ep-bus@1");
>         ...
> }
> --- 8< ---
> 
> If you really want to be sure that the "pci-ep-bus@1" comes from an overlay
> you can check for the OF_OVERLAY flag.
> --- 8< ---
>   node = of_find_node_by_name(np, "pci-ep-bus@1");
>   if (node && of_node_check_flag(node, OF_OVERLAY))
> --- 8< ---
> 
> Also your overlay has to be applied on the DT node related to your PCI
> device and not the rp1_nexus you search for in the whole DT. In other
> word, in your driver, the following is not correct:
> 
>    err = of_overlay_fdt_apply(dtbo_start, dtbo_size, &rp1->ovcs_id,
>                                            rp1_node);
> 
> It should be:
> 
>    err = of_overlay_fdt_apply(dtbo_start, dtbo_size, &rp1->ovcs_id,
>                                            dev_of_node(&pdev->dev));
>  
> In your overlay, your have
> 	__overlay__ {
> 		compatible = "pci1de4,1";
> 		#address-cells = <3>;
> 		#size-cells = <2>;
> 		interrupt-controller;
> 		#interrupt-cells = <2>;
> 
> 		#include "arm64/broadcom/rp1-common.dtsi"
>        };
> 
> Only sub-nodes should be present (#address-cells = <3> and #size-cells = <2>)
> can be there just to make DTC happy.
> 
> It is worth noting that any properties other than #address-cells and
> #size-cells lead to memleaks. And so avoid them.
> 
> Memleaks are reported at runtime when the overlay is applied with this
> kind of logs:
>  OF: overlay: WARNING: memory leak will occur if overlay removed, property: ...
> 
> I am pretty sure that you have those kind of traces when you apply your
> overlay.

Indeed.

Many thanks,
Andrea

[1] - https://lore.kernel.org/all/aTvtr5v4DjuqctdY@apocalypse/

> 
> compatible, interrupt-controller and #interrupt-cells should not be added by
> the overlay. Either they are added by when PCI nodes are created by 
> CONFIG_PCI_DYNAMIC_OF_NODES either they are already available in the base
> DT if the PCI device is described in the base DT.
> 
> [1] https://github.com/devicetree-org/dt-schema/blob/aa859412ce8e38c63bb13fa55c5e1c6ba66a8e3b/dtschema/schemas/pci/pci-bus-common.yaml#L226
> 
> Best regards,
> Hervé

