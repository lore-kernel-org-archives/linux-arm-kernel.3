Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED79ED2444A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 17:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aNaY4Xp11z7CIwlZFJgR83dSZLkci8XyLzs0K/rt6vc=; b=dpJZC1z8JKmSfccky2DcsD4snN
	nICzCPOSKOd1lMpVLMIDi1OOrjZyrDmeE3X12u9N7fL0lpuD0hx0o1jpTBcxVU87oUcMpB4PwGECK
	65YtjctB0H+B8VxeMEKFVIAQxg8cSxrFKPrg/XY0k976wUCyr8A/4NmS426MaZ5l72hpTIgfHwcTz
	gpym0IgROQYsPlsSbrre4J2yh1Yd0gwlMmQ58Q7nBCnqDEv8HLWYBO3FRpJozqH3+PVwIIMQpkA/e
	gMgVWwaPwv5tjUKJcwhK+lvUB4gWIBF7UCEjFf/j13fYTxcfaW6094lwGJcyx5ympmq1S3PQ0JLXV
	FPu1TXSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRCpZ-00000008Lg7-1jG6;
	Thu, 04 Dec 2025 17:09:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRCpX-00000008LfY-05a7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 17:09:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 68E044434E
	for <linux-arm-kernel@lists.infradead.org>; Thu,  4 Dec 2025 17:09:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17334C16AAE
	for <linux-arm-kernel@lists.infradead.org>; Thu,  4 Dec 2025 17:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764868162;
	bh=ozsg4eLgtauKgJ3H79DciPuHkymo9rMsTDj/oVDQG/Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=tvI0t3PppjBwAgLlyJx1wWZC9indt/Tx10fEBb3gp9gJfIrtha8sE106jk5mNvVx/
	 111V3vcH7rETlbaupvlcSyS81CV3AEeSQy+zV7ZibqlENbWAyniti+b0FQCnU5lqW7
	 1G2QYLL9CsEPJLkOS7V+CdkajMD36mowAg9U7p7mfCpFl2degElYrc7JHl5Uul7sAB
	 FRPga1InK+wMGkB1xkPuOaF6fpEw58vsCnifaRXZQjBvDoNVp7cpRdsfoQ3YBlWOXl
	 tTV92sJ80l/pxFe90ycKaf6DIeRK6Vl+6Me6ig0y3jh9wO6bYrQb7R5gCE0O+/Q7hR
	 0Js6MFCcTD4WA==
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-63c489f1e6cso1970783a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Dec 2025 09:09:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXRvv5t5+sHZl2zfWFIPuRZJunZ0GY0l6WSRZQZNDtAwoVvJOvkzS7hX8PSlln5PF81BMr5Tjy6FFspuGWC5I2a@lists.infradead.org
X-Gm-Message-State: AOJu0YwoD9ILKlcyb3OoH5eMHKLLcWCEAv1DapxVVeu4zzUsgLQ+KTqG
	kJKSG2nspvVPCXZW4ZEdMrOBYCwjDg56batoevLZU04U1bzqLztvlSw7G4mxtnQhmvujVmtL14p
	z4oDIEIUljF4pZWKToyj4q/ByLxc7dA==
X-Google-Smtp-Source: AGHT+IE0h1OfhwPlHlU/zqfmmwyoK86/xLpsj/AoOe6qs54NDfjqeNrTcOPci/SfJTS7EyFSSYCViXJ4jSy9O3HUuCE=
X-Received: by 2002:a05:6402:1a43:b0:640:aae6:adc5 with SMTP id
 4fb4d7f45d1cf-647a69f6860mr2612946a12.4.1764868160633; Thu, 04 Dec 2025
 09:09:20 -0800 (PST)
MIME-Version: 1.0
References: <20250812085037.13517-1-andrea.porta@suse.com> <4fee3870-f9d5-48e3-a5be-6df581d3e296@kernel.org>
 <aKc5nMT1xXpY03ip@apocalypse> <e7875f70-2b79-48e0-a63b-caf6f1fd287b@kernel.org>
 <aLVePQRfU4IB1zK8@apocalypse>
In-Reply-To: <aLVePQRfU4IB1zK8@apocalypse>
From: Rob Herring <robh@kernel.org>
Date: Thu, 4 Dec 2025 11:09:09 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJUzB71QdMcxJtNZ7raoPcK+SfTh7EVzGmk=syo8xLKQw@mail.gmail.com>
X-Gm-Features: AWmQ_bk-kALt_k3I5clEjqRRUksBAOMX1BPr5dYQDHIANQpdcGuEg7qIa9ngHh0
Message-ID: <CAL_JsqJUzB71QdMcxJtNZ7raoPcK+SfTh7EVzGmk=syo8xLKQw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pci: brcmstb: Add rp1-nexus node to fix DTC warning
To: Andrea della Porta <andrea.porta@suse.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Jim Quinlan <jim2101024@gmail.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, kwilczynski@kernel.org, 
	Manivannan Sadhasivam <mani@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rpi-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, iivanov@suse.de, svarbanov@suse.de, 
	mbrugger@suse.com, Jonathan Bell <jonathan@raspberrypi.com>, 
	Phil Elwell <phil@raspberrypi.com>, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_090923_104034_9379A87D 
X-CRM114-Status: GOOD (  47.05  )
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

On Mon, Sep 1, 2025 at 3:48=E2=80=AFAM Andrea della Porta <andrea.porta@sus=
e.com> wrote:
>
> Hi Krzysztof,
>
> On 08:50 Fri 22 Aug     , Krzysztof Kozlowski wrote:
> > On 21/08/2025 17:22, Andrea della Porta wrote:
> > > Hi Krzysztof,
> > >
> > > On 10:55 Tue 12 Aug     , Krzysztof Kozlowski wrote:
> > >> On 12/08/2025 10:50, Andrea della Porta wrote:
> > >>> The devicetree compiler is complaining as follows:
> > >>>
> > >>> arch/arm64/boot/dts/broadcom/rp1-nexus.dtsi:3.11-14.3: Warning (uni=
t_address_vs_reg): /axi/pcie@1000120000/rp1_nexus: node has a reg or ranges=
 property, but no unit name
> > >>> /home/andrea/linux-torvalds/arch/arm64/boot/dts/broadcom/bcm2712-rp=
i-5-b.dtb: pcie@1000120000: Unevaluated properties are not allowed ('rp1_ne=
xus' was unexpected)
> > >>
> > >> Please trim the paths.
> > >
> > > Ack.
> > >
> > >>
> > >>>
> > >>> Add the optional node that fix this to the DT binding.
> > >>>
> > >>> Reported-by: kernel test robot <lkp@intel.com>
> > >>> Closes: https://lore.kernel.org/oe-kbuild-all/202506041952.baJDYBT4=
-lkp@intel.com/
> > >>> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > >>> ---
> > >>>  Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml | 9 +++++=
++++
> > >>>  1 file changed, 9 insertions(+)
> > >>>
> > >>> diff --git a/Documentation/devicetree/bindings/pci/brcm,stb-pcie.ya=
ml b/Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml
> > >>> index 812ef5957cfc..7d8ba920b652 100644
> > >>> --- a/Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml
> > >>> +++ b/Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml
> > >>> @@ -126,6 +126,15 @@ required:
> > >>>  allOf:
> > >>>    - $ref: /schemas/pci/pci-host-bridge.yaml#
> > >>>    - $ref: /schemas/interrupt-controller/msi-controller.yaml#
> > >>> +  - if:
> > >>> +      properties:
> > >>> +        compatible:
> > >>> +          contains:
> > >>> +            const: brcm,bcm2712-pcie
> > >>> +    then:
> > >>> +      properties:
> > >>> +        rp1_nexus:
> > >>
> > >> No, you cannot document post-factum... This does not follow DTS codi=
ng
> > >> style.
> > >
> > > I think I didn't catch what you mean here: would that mean that
> > > we cannot resolve that warning since we cannot add anything to the
> > > binding?
> >
> > I meant, you cannot use a warning from the code you recently introduced
> > as a reason to use incorrect style.
> >
> > Fixing warning is of course fine and correct, but for the code recently
> > introduced and which bypassed ABI review it is basically like new revie=
w
> > of new ABI.
> >
> > This needs standard review practice, so you need to document WHY you
> > need such node. Warning is not the reason here why you are doing. If
> > this was part of original patchset, like it should have been, you would
> > not use some imaginary warning as reason, right?
> >
> > So provide reason why you need here this dedicated child, what is that
> > child representing.
>
> Ack.
>
> >
> > Otherwise I can suggest: drop the child and DTSO, this also solves the
> > warning...
>
> This would not fix the issue: it's the non overlay that needs the specifi=
c
> node. But I got the point, and we have a solution for that (see below).
>
> >
> > >
> > > Regarding rp1_nexus, you're right I guess it should be
> > > rp1-nexus as per DTS coding style.
> > >
> > >>
> > >> Also:
> > >>
> > >> Node names should be generic. See also an explanation and list of
> > >> examples (not exhaustive) in DT specification:
> > >> https://devicetree-specification.readthedocs.io/en/latest/chapter2-d=
evicetree-basics.html#generic-names-recommendation
> > >
> > > In this case it could be difficult: we need to search for a DT node
> >
> > Search like in driver? That's wrong, you should be searching by compati=
ble.
>
> Thanks for the hint. Searching by compatble is the solution.

No, it is not.

> >
> > > starting from the DT root and using generic names like pci@0,0 or
> > > dev@0,0 could possibly led to conflicts with other peripherals.
> > > That's why I chose a specific name.
> >
> > Dunno, depends what can be there, but you do not get a specific
> > (non-generic) device node name for a generic PCI device or endpoint.
>
> I would use 'port' instead of rp1-nexus. Would it work for you?

Do you still plan to fix this? This is broken far worse than just the node =
name.

The 'rp1_nexus' node is applied to the PCI host bridge. That's wrong
unless this is PCI rather than PCIe. There's the root port device in
between.

The clue that things are wrong are start in the driver here:

rp1_node =3D of_find_node_by_name(NULL, "rp1_nexus");
if (!rp1_node) {
  rp1_node =3D dev_of_node(dev);
  skip_ovl =3D false;
}

You should not need to do this nor care what the node name is. The PCI
core should have populated pdev->dev.of_node for you. If not, your DT
is wrong. Turn on CONFIG_PCI_DYNAMIC_OF_NODES and look at the
resulting PCI nodes. They should also match what the hierarchy looks
like with lspci. I don't recommend you rely on
CONFIG_PCI_DYNAMIC_OF_NODES, but statically populate the nodes in the
DT. First, CONFIG_PCI_DYNAMIC_OF_NODES is an under development thing
and I hope to get rid of the config option. Second, your case is
static (i.e. not a PCIe card in a slot) so there is no issue
hardcoding the DT.

As far as the node name, I don't care so much as long as the driver
doesn't care and you don't use '_' or 'pcie?' (that's for PCI
bridges).

And why do we have drivers/misc/rp1/rp1-pci.dtso and a .dtso in
arch/arm64? There should not be both.

Rob

