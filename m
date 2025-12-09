Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D87B6D3B98D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 18:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=14bMkS32vyjuNUJxn1KJXFpEDIMf9iTp0dr+ymIdyrI=; b=xWMyUOV/rOgNvaQpnLEjrWvRMX
	iu1ccZy4xP32tZKZBpZuDRytfrYZdHWvqu66A9amhg3h737ZEKluwjZwKHTrJQvvsqOPVstA7tLtW
	/TeF9+HApr6vqo/CL6ppeEiIRrERMhDlfALvg00vqxvKneI0T6VJVSBOYeCodInJ/izUaHVPg1057
	ZU4FtvmBfboX1UGNPkIv+3ETWIaRUhIMHTiYx4nb6nH6jszr2MthJGwGjNvdFO3MEgZiBpm4A5GRN
	uRUTORnC6FOlsFu/tOOZbGvTiEsEZBK5rCAZXurPox/pQ1AMd/qhcNzBqLiks2GtuuGQxS/C71aZ2
	yi3+o1Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT2O6-0000000EeQX-0oMk;
	Tue, 09 Dec 2025 18:24:38 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT2O3-0000000EePk-0VQ2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 18:24:37 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-64175dfc338so10219947a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Dec 2025 10:24:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765304673; x=1765909473; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=14bMkS32vyjuNUJxn1KJXFpEDIMf9iTp0dr+ymIdyrI=;
        b=cLx4zk5hfruUCiTWuV0qJqKnTQZvgkuxWRwm2VOwA8GXkDlhmxXMLsoAGwhWnbHNpn
         qH7tZh83ZIGX/WvTRd6tDLKhApf1zm1DdI4/6Jz+DuhXNUt/7iaiIGr3lTT+q//HwbJV
         zapJzqGSdIj22J+rVSHSFP72nYdTwtSdt4YgMz9s2g/c0SBqAxDAV/Ok2S80mI6Bkc7M
         EmQ0hfkbvFEMtkq/BhrbK4Whbx5i5MW3Zeujd6GlkmPi5rvUkBWNwFwHPYw0PGM08uox
         acgEQAdX88tnPxjSecqGZ2jc45L0IfnlSikDGm7wSKtuchkPsqNjR/t2rCoG/BEcurNN
         CM7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765304673; x=1765909473;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=14bMkS32vyjuNUJxn1KJXFpEDIMf9iTp0dr+ymIdyrI=;
        b=R3pR5EDYehQWOxCZnPvXOfpShYJApFE1CZKU09VmtHJINx6Zb3W7EqUgu5R3tVirnb
         jV2sTamY7ritCh69vBa5v7lfEnAQrl09SIXxyb7rMrQ+akTlMzMiFpAi5A1zPiog0jau
         MsGok8W0a1fJUx+/hRKbMaBvxRKyEkfdtYTVX2SL3XZ5Q5p+Vjug0wD8dUyroFP1dnz7
         1LB3k6dzaOZr1ITxkc+sMPRZ3IulKVMaoV/skb2dvae11YqQZhxI/NPFkQzz9xjfWCk8
         h1mPdHm7sT5MsP8RJD3PHioDie63lOjzuKHxYW4ZmS1XrcX3lVa999X+f44GaV8k5IAH
         2WmA==
X-Forwarded-Encrypted: i=1; AJvYcCW9dtUMCHvAvG0DKhOuncyUbsHBNRgH9ukFSDCl02przXwzJuZUZyh2AAxKw8j+cIw/Opa5bcjv+K0EursUwhBf@lists.infradead.org
X-Gm-Message-State: AOJu0YykKEBlnusttf9O5Ms5vp2yQS+uU18xj2inFUDzkjlc/kQ5a5uU
	JwmLATwOJKOQ7Uz8QmF0UF6WqOehEN/tEny30Ugf2zlgpnZGH9VBrFsuPmHeRrhZwSk=
X-Gm-Gg: ASbGncvhswCS9OuXsJR4arhUgfbk1yCtqG4UklENs23cLsxqdvkInFX0sQf2KRCUeRW
	vXwF8uKGiMEX/U/aleM74qYH5qeJqfzXNXiu67xo8G4oiUDRAH23I/cY6XlMvWF40fjOYpU9ro2
	BOldoWLKcwOhn6wFw7x+1LnMYCVBBvANQakwRm4S1oyPGAQmHWjRqkWZk3Y+eFpSmLCn4T+AWom
	xEmb8TieCXJNreXB0wpqb80AlpUp8zWdYBumRwQH4A+M1GUgWOU9pThU7QKkTSYy2ef2wjumA8+
	fsr5pp2tc/u7qoL9rETT2vYmeuZBDBZBX8DDBLZ8TXXZoD29kwhs3y1mCJcZXjM3jSvoGa2BY3Q
	wX4ECrdCO4PFSQmmcRHWJ25vNE9aQPSN360dcY/9JcQ+J15mh2lQ98NXl7BNHs+MqyhZMuoLLfI
	VVoZdLERvuos9xB/3xhnLFy0NJ/P9V9j4Zr993nJQZGyJyjfiuU4gCOA==
X-Google-Smtp-Source: AGHT+IFzN6N/sbq1uXmJgOqn3EBMakM832XtgAIi34Rg4eem35Dwu+XnW2vFIsPQPbpEjRXtdwmGXQ==
X-Received: by 2002:a05:6402:524b:b0:647:99fb:1e18 with SMTP id 4fb4d7f45d1cf-64919c1e989mr9536089a12.8.1765304673192;
        Tue, 09 Dec 2025 10:24:33 -0800 (PST)
Received: from localhost (host-87-6-211-245.retail.telecomitalia.it. [87.6.211.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-647b412146bsm14413161a12.23.2025.12.09.10.24.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 10:24:32 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Tue, 9 Dec 2025 19:27:03 +0100
To: Andrea della Porta <andrea.porta@suse.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
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
	kernel test robot <lkp@intel.com>,
	Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH] dt-bindings: pci: brcmstb: Add rp1-nexus node to fix DTC
 warning
Message-ID: <aThp99OfgAfNFUX-@apocalypse>
References: <20250812085037.13517-1-andrea.porta@suse.com>
 <4fee3870-f9d5-48e3-a5be-6df581d3e296@kernel.org>
 <aKc5nMT1xXpY03ip@apocalypse>
 <e7875f70-2b79-48e0-a63b-caf6f1fd287b@kernel.org>
 <aLVePQRfU4IB1zK8@apocalypse>
 <CAL_JsqJUzB71QdMcxJtNZ7raoPcK+SfTh7EVzGmk=syo8xLKQw@mail.gmail.com>
 <aThjYt3ux0U-9-3A@apocalypse>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aThjYt3ux0U-9-3A@apocalypse>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_102436_027598_90081068 
X-CRM114-Status: GOOD (  69.53  )
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

[+cc Herve]

On 18:58 Tue 09 Dec     , Andrea della Porta wrote:
> Hi Rob,
> 
> On 11:09 Thu 04 Dec     , Rob Herring wrote:
> > On Mon, Sep 1, 2025 at 3:48 AM Andrea della Porta <andrea.porta@suse.com> wrote:
> > >
> > > Hi Krzysztof,
> > >
> > > On 08:50 Fri 22 Aug     , Krzysztof Kozlowski wrote:
> > > > On 21/08/2025 17:22, Andrea della Porta wrote:
> > > > > Hi Krzysztof,
> > > > >
> > > > > On 10:55 Tue 12 Aug     , Krzysztof Kozlowski wrote:
> > > > >> On 12/08/2025 10:50, Andrea della Porta wrote:
> > > > >>> The devicetree compiler is complaining as follows:
> > > > >>>
> > > > >>> arch/arm64/boot/dts/broadcom/rp1-nexus.dtsi:3.11-14.3: Warning (unit_address_vs_reg): /axi/pcie@1000120000/rp1_nexus: node has a reg or ranges property, but no unit name
> > > > >>> /home/andrea/linux-torvalds/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: pcie@1000120000: Unevaluated properties are not allowed ('rp1_nexus' was unexpected)
> > > > >>
> > > > >> Please trim the paths.
> > > > >
> > > > > Ack.
> > > > >
> > > > >>
> > > > >>>
> > > > >>> Add the optional node that fix this to the DT binding.
> > > > >>>
> > > > >>> Reported-by: kernel test robot <lkp@intel.com>
> > > > >>> Closes: https://lore.kernel.org/oe-kbuild-all/202506041952.baJDYBT4-lkp@intel.com/
> > > > >>> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > > > >>> ---
> > > > >>>  Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml | 9 +++++++++
> > > > >>>  1 file changed, 9 insertions(+)
> > > > >>>
> > > > >>> diff --git a/Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml b/Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml
> > > > >>> index 812ef5957cfc..7d8ba920b652 100644
> > > > >>> --- a/Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml
> > > > >>> +++ b/Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml
> > > > >>> @@ -126,6 +126,15 @@ required:
> > > > >>>  allOf:
> > > > >>>    - $ref: /schemas/pci/pci-host-bridge.yaml#
> > > > >>>    - $ref: /schemas/interrupt-controller/msi-controller.yaml#
> > > > >>> +  - if:
> > > > >>> +      properties:
> > > > >>> +        compatible:
> > > > >>> +          contains:
> > > > >>> +            const: brcm,bcm2712-pcie
> > > > >>> +    then:
> > > > >>> +      properties:
> > > > >>> +        rp1_nexus:
> > > > >>
> > > > >> No, you cannot document post-factum... This does not follow DTS coding
> > > > >> style.
> > > > >
> > > > > I think I didn't catch what you mean here: would that mean that
> > > > > we cannot resolve that warning since we cannot add anything to the
> > > > > binding?
> > > >
> > > > I meant, you cannot use a warning from the code you recently introduced
> > > > as a reason to use incorrect style.
> > > >
> > > > Fixing warning is of course fine and correct, but for the code recently
> > > > introduced and which bypassed ABI review it is basically like new review
> > > > of new ABI.
> > > >
> > > > This needs standard review practice, so you need to document WHY you
> > > > need such node. Warning is not the reason here why you are doing. If
> > > > this was part of original patchset, like it should have been, you would
> > > > not use some imaginary warning as reason, right?
> > > >
> > > > So provide reason why you need here this dedicated child, what is that
> > > > child representing.
> > >
> > > Ack.
> > >
> > > >
> > > > Otherwise I can suggest: drop the child and DTSO, this also solves the
> > > > warning...
> > >
> > > This would not fix the issue: it's the non overlay that needs the specific
> > > node. But I got the point, and we have a solution for that (see below).
> > >
> > > >
> > > > >
> > > > > Regarding rp1_nexus, you're right I guess it should be
> > > > > rp1-nexus as per DTS coding style.
> > > > >
> > > > >>
> > > > >> Also:
> > > > >>
> > > > >> Node names should be generic. See also an explanation and list of
> > > > >> examples (not exhaustive) in DT specification:
> > > > >> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
> > > > >
> > > > > In this case it could be difficult: we need to search for a DT node
> > > >
> > > > Search like in driver? That's wrong, you should be searching by compatible.
> > >
> > > Thanks for the hint. Searching by compatble is the solution.
> > 
> > No, it is not.
> 
> This is partly true, indeed. On one side there's the need to avoid a
> specific node name ('rp1_nexus'), so the only other unique identifier would
> be the compatible string ('pci1de4,1' in this case, which identifies that specific
> device). Unfortunately, the same compatible string is also assigned to the pci
> endpoint node filled automatically by enabling CONFIG_PCI_DYNAMIC_OF_NODES.
> We would end up with two nodes with the same compatible, which is not unique
> anymore. 
> This applies only when using 'full' dtb (bcm2712-rpi-5-b.dtb) *and* you enable
> CONFIG_PCI_DYNAMIC_OF_NODES, the latter being not necessary since the overlay dtb
> (...-ovl-rp1.dtb) is not in use here. To overcome this problem, the solutions
> I can think of are the following:
> 
> 1- Just disable CONFIG_PCI_DYNAMIC_OF_NODES should work, but only when using the
>    full dtb version. However, if the user enable that option for debug or to use
>    the overlay dtb version, he better be sure not to use teh full dtb or it won't
>    work.
>    This solution seems really weak.
> 
> 2- Add another compatible string other than 'pci1de4,1', so it will be really
>    unique.
> 
> > 
> > > >
> > > > > starting from the DT root and using generic names like pci@0,0 or
> > > > > dev@0,0 could possibly led to conflicts with other peripherals.
> > > > > That's why I chose a specific name.
> > > >
> > > > Dunno, depends what can be there, but you do not get a specific
> > > > (non-generic) device node name for a generic PCI device or endpoint.
> > >
> > > I would use 'port' instead of rp1-nexus. Would it work for you?
> > 
> > Do you still plan to fix this? This is broken far worse than just the node name.
> 
> Yes, if we want to get rid of that nasty warning and comply with DT guidelines,
> I think I really need to fix that.
> 
> > 
> > The 'rp1_nexus' node is applied to the PCI host bridge. That's wrong
> > unless this is PCI rather than PCIe. There's the root port device in
> > between.
> > 
> > The clue that things are wrong are start in the driver here:
> > 
> > rp1_node = of_find_node_by_name(NULL, "rp1_nexus");
> > if (!rp1_node) {
> >   rp1_node = dev_of_node(dev);
> >   skip_ovl = false;
> > }
> > 
> > You should not need to do this nor care what the node name is. The PCI
> > core should have populated pdev->dev.of_node for you. If not, your DT
> > is wrong. Turn on CONFIG_PCI_DYNAMIC_OF_NODES and look at the
> > resulting PCI nodes. They should also match what the hierarchy looks
> > like with lspci. I don't recommend you rely on
> > CONFIG_PCI_DYNAMIC_OF_NODES, but statically populate the nodes in the
> > DT. First, CONFIG_PCI_DYNAMIC_OF_NODES is an under development thing
> > and I hope to get rid of the config option. Second, your case is
> > static (i.e. not a PCIe card in a slot) so there is no issue
> > hardcoding the DT.

Are you planning to get rid of the CONFIG_PCI_DYNAMIC_OF_NODES features?
There could be other drivers relying on that besides RP1 in overlay mode,
e.g. LAN966x for instance.

Thanks,
Andrea

> 
> The 'full' dtb (bcm2712-rpi-5-b.dtb) is indeed statically populated.
> CONFIG_PCI_DYNAMIC_OF_NODES is needed only if you use the overlay approach
> (bcm2712-rpi-5-b-ovl-rp1.dtb) and in that case the node will be
> added to the correct device node at runtime, and there won't be any node
> labeled as rp1_nexus.
> That conditional just check for teh presence of the rp1_nexus node to
> choose if the overlay should be loaded at runtime (if rp1_nexus is present,
> then we are in the static case so no overlay need to be loaded).
> 
> > 
> > As far as the node name, I don't care so much as long as the driver
> > doesn't care and you don't use '_' or 'pcie?' (that's for PCI
> > bridges).
> > 
> > And why do we have drivers/misc/rp1/rp1-pci.dtso and a .dtso in
> > arch/arm64? There should not be both.
> 
> drivers/misc/rp1/rp1-pci.dtso is just a wrapper over rp1-common.dtsi,
> which is to be compiled in as binary blob in the driver and loaded at
> runtime.
> rp1.dtbo is optional, it's there just for completeness in case anyone want
> to load teh overlay from the fw, as explained here:
> https://lore.kernel.org/all/ab9ab3536baf5fdf6016f2a01044f00034189291.1742418429.git.andrea.porta@suse.com/
> If it causes confusion, we can probably get rid of it with no penalty.
> 
> Many thanks,
> Andrea
> 
> > 
> > Rob

