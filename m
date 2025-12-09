Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42E63D3B98D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 18:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hC3dW71mkhE++z+U2ESE5XD95iNxDWNxtFzJVbDAcNY=; b=SQq/0Bzy+E8H27CTmTc1mOH+fA
	AsVUmPxbr8slJZXLd+dk/L+fNzeXRl0Bp5XqMUjh5nlTxYsSKfABucv94qRIx4N3prbCset/9jwez
	cT0r/mVEvdRR/WKIJG1aXvHooiEzUTWPxgo33D2q8V1ew36breTAgFXtPND8AwcFLgb38LWytFuYS
	s+MjDmReXtK2DRki4AjHDztJj9fqr+kzBl3s0WEaOyyes9uU1BqOB0OcJGwQ+iPedA6o4uQt1reTc
	fWqM34X0NIGxabbPsNWn7CvOQnFGCKRMH+LrZ7sKhm3actPFod9luJP6i61tnsrA/2iI2LIgjHA2p
	TYv6Zn9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT2Lu-0000000EeET-3EFX;
	Tue, 09 Dec 2025 18:22:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT2Lr-0000000EeDl-0RIy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 18:22:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 726F542AB8
	for <linux-arm-kernel@lists.infradead.org>; Tue,  9 Dec 2025 18:22:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56751C2BC86
	for <linux-arm-kernel@lists.infradead.org>; Tue,  9 Dec 2025 18:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765304536;
	bh=UKzG5r6tZdd5xrvc+V6BLRMRixav8M5oPtw1A8mobcc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mwhq6b1AtlP0OMsn+a/DpQEi4B0N+2sq78Dxt2pyWdfOVH2ikAvcNljGZzCzboi0K
	 gLUku91R5oGRqNMaxrqpMo8/T+p5qtiTducBd6I/q7Ncm0K8JVkvEjSQR6Bqwka5MZ
	 RlXa2sU0/oTmlp0p8yjSkUy//FQuiURg3pohqm+mXZixvcvWjWwqmbqIC1/GrDcbmM
	 ZcnbZDLR1B6MBn0C1ZoGpKf+K+iPJOUWtQZXPlB9I5COD/4P3GXoa0N7fmKQTqiRye
	 cwffOcCM1LakWN8WAqG18jNIDwsMJdyXhQ0i3dvSskdpxkt5tIaJu79KC7kskvyMt2
	 Y5ui3XRrf2wjg==
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-64165cd689eso188006a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Dec 2025 10:22:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW95kGyCKTen93HlSKsqQY/a9eu14lRvhlyQnx/bmEBke3tlmtEnJ8+AtqWgoekrapRG7AK6/mBqPjK/YVwYPYh@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8tafJipI4rGBD+u4hxtZDO+fUDzz18uFqWl/tweRLw7RzCNfb
	fS+B/50ZFudwh02txK8uAvuYfepMo7ZD9f073BTLZHmA5Z7Ub7UYV6NYwo5qUHLvS/4nvy63wOS
	sTGt5ImgJcHW+WsNPAiZ/r02Yqe1esQ==
X-Google-Smtp-Source: AGHT+IFzTQ9Y3GxkAyIHgOyYgaZYw0NHt6leyzeMXy/GIFoBBTO/qYxLFwa+4RFxSZN6dpV1Csau5W/Nk3OxiiIm2Pg=
X-Received: by 2002:a05:6402:2108:b0:649:21d1:9c76 with SMTP id
 4fb4d7f45d1cf-649641309e1mr2564343a12.4.1765304534437; Tue, 09 Dec 2025
 10:22:14 -0800 (PST)
MIME-Version: 1.0
References: <20250812085037.13517-1-andrea.porta@suse.com> <4fee3870-f9d5-48e3-a5be-6df581d3e296@kernel.org>
 <aKc5nMT1xXpY03ip@apocalypse> <e7875f70-2b79-48e0-a63b-caf6f1fd287b@kernel.org>
 <aLVePQRfU4IB1zK8@apocalypse> <CAL_JsqJUzB71QdMcxJtNZ7raoPcK+SfTh7EVzGmk=syo8xLKQw@mail.gmail.com>
 <aThjYt3ux0U-9-3A@apocalypse>
In-Reply-To: <aThjYt3ux0U-9-3A@apocalypse>
From: Rob Herring <robh@kernel.org>
Date: Tue, 9 Dec 2025 12:22:02 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJxseyQDDNE-p3_4qjXcDwN_XyxWCvQA3hznyASLO7Gvw@mail.gmail.com>
X-Gm-Features: AQt7F2oYAUNkruYIknaJYHumHq3iwSVNlVv8exBJvESkPN0wNo4j8-yt5NPugmg
Message-ID: <CAL_JsqJxseyQDDNE-p3_4qjXcDwN_XyxWCvQA3hznyASLO7Gvw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20251209_102220_778924_77E18B40 
X-CRM114-Status: GOOD (  68.53  )
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

On Tue, Dec 9, 2025 at 11:56=E2=80=AFAM Andrea della Porta
<andrea.porta@suse.com> wrote:
>
> Hi Rob,
>
> On 11:09 Thu 04 Dec     , Rob Herring wrote:
> > On Mon, Sep 1, 2025 at 3:48=E2=80=AFAM Andrea della Porta <andrea.porta=
@suse.com> wrote:
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
> > > > >>> arch/arm64/boot/dts/broadcom/rp1-nexus.dtsi:3.11-14.3: Warning =
(unit_address_vs_reg): /axi/pcie@1000120000/rp1_nexus: node has a reg or ra=
nges property, but no unit name
> > > > >>> /home/andrea/linux-torvalds/arch/arm64/boot/dts/broadcom/bcm271=
2-rpi-5-b.dtb: pcie@1000120000: Unevaluated properties are not allowed ('rp=
1_nexus' was unexpected)
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
> > > > >>> Closes: https://lore.kernel.org/oe-kbuild-all/202506041952.baJD=
YBT4-lkp@intel.com/
> > > > >>> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > > > >>> ---
> > > > >>>  Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml | 9 +=
++++++++
> > > > >>>  1 file changed, 9 insertions(+)
> > > > >>>
> > > > >>> diff --git a/Documentation/devicetree/bindings/pci/brcm,stb-pci=
e.yaml b/Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml
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
> > > > >> No, you cannot document post-factum... This does not follow DTS =
coding
> > > > >> style.
> > > > >
> > > > > I think I didn't catch what you mean here: would that mean that
> > > > > we cannot resolve that warning since we cannot add anything to th=
e
> > > > > binding?
> > > >
> > > > I meant, you cannot use a warning from the code you recently introd=
uced
> > > > as a reason to use incorrect style.
> > > >
> > > > Fixing warning is of course fine and correct, but for the code rece=
ntly
> > > > introduced and which bypassed ABI review it is basically like new r=
eview
> > > > of new ABI.
> > > >
> > > > This needs standard review practice, so you need to document WHY yo=
u
> > > > need such node. Warning is not the reason here why you are doing. I=
f
> > > > this was part of original patchset, like it should have been, you w=
ould
> > > > not use some imaginary warning as reason, right?
> > > >
> > > > So provide reason why you need here this dedicated child, what is t=
hat
> > > > child representing.
> > >
> > > Ack.
> > >
> > > >
> > > > Otherwise I can suggest: drop the child and DTSO, this also solves =
the
> > > > warning...
> > >
> > > This would not fix the issue: it's the non overlay that needs the spe=
cific
> > > node. But I got the point, and we have a solution for that (see below=
).
> > >
> > > >
> > > > >
> > > > > Regarding rp1_nexus, you're right I guess it should be
> > > > > rp1-nexus as per DTS coding style.
> > > > >
> > > > >>
> > > > >> Also:
> > > > >>
> > > > >> Node names should be generic. See also an explanation and list o=
f
> > > > >> examples (not exhaustive) in DT specification:
> > > > >> https://devicetree-specification.readthedocs.io/en/latest/chapte=
r2-devicetree-basics.html#generic-names-recommendation
> > > > >
> > > > > In this case it could be difficult: we need to search for a DT no=
de
> > > >
> > > > Search like in driver? That's wrong, you should be searching by com=
patible.
> > >
> > > Thanks for the hint. Searching by compatble is the solution.
> >
> > No, it is not.
>
> This is partly true, indeed. On one side there's the need to avoid a
> specific node name ('rp1_nexus'), so the only other unique identifier wou=
ld
> be the compatible string ('pci1de4,1' in this case, which identifies that=
 specific
> device). Unfortunately, the same compatible string is also assigned to th=
e pci
> endpoint node filled automatically by enabling CONFIG_PCI_DYNAMIC_OF_NODE=
S.
> We would end up with two nodes with the same compatible, which is not uni=
que
> anymore.
> This applies only when using 'full' dtb (bcm2712-rpi-5-b.dtb) *and* you e=
nable
> CONFIG_PCI_DYNAMIC_OF_NODES, the latter being not necessary since the ove=
rlay dtb
> (...-ovl-rp1.dtb) is not in use here. To overcome this problem, the solut=
ions
> I can think of are the following:
>
> 1- Just disable CONFIG_PCI_DYNAMIC_OF_NODES should work, but only when us=
ing the
>    full dtb version. However, if the user enable that option for debug or=
 to use
>    the overlay dtb version, he better be sure not to use teh full dtb or =
it won't
>    work.
>    This solution seems really weak.
>
> 2- Add another compatible string other than 'pci1de4,1', so it will be re=
ally
>    unique.

No! Neither one. If you end up with 2 nodes when you turn on
CONFIG_PCI_DYNAMIC_OF_NODES, then you have an error in your DT (the
node that CONFIG_PCI_DYNAMIC_OF_NODES *didn't* create is the one in
error).

You need to fix the structure.

> >
> > > >
> > > > > starting from the DT root and using generic names like pci@0,0 or
> > > > > dev@0,0 could possibly led to conflicts with other peripherals.
> > > > > That's why I chose a specific name.
> > > >
> > > > Dunno, depends what can be there, but you do not get a specific
> > > > (non-generic) device node name for a generic PCI device or endpoint=
.
> > >
> > > I would use 'port' instead of rp1-nexus. Would it work for you?
> >
> > Do you still plan to fix this? This is broken far worse than just the n=
ode name.
>
> Yes, if we want to get rid of that nasty warning and comply with DT guide=
lines,
> I think I really need to fix that.
>
> >
> > The 'rp1_nexus' node is applied to the PCI host bridge. That's wrong
> > unless this is PCI rather than PCIe. There's the root port device in
> > between.
> >
> > The clue that things are wrong are start in the driver here:
> >
> > rp1_node =3D of_find_node_by_name(NULL, "rp1_nexus");
> > if (!rp1_node) {
> >   rp1_node =3D dev_of_node(dev);
> >   skip_ovl =3D false;
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
>
> The 'full' dtb (bcm2712-rpi-5-b.dtb) is indeed statically populated.
> CONFIG_PCI_DYNAMIC_OF_NODES is needed only if you use the overlay approac=
h
> (bcm2712-rpi-5-b-ovl-rp1.dtb) and in that case the node will be
> added to the correct device node at runtime, and there won't be any node
> labeled as rp1_nexus.
> That conditional just check for teh presence of the rp1_nexus node to
> choose if the overlay should be loaded at runtime (if rp1_nexus is presen=
t,
> then we are in the static case so no overlay need to be loaded).

Checking is fine, but you are checking the wrong thing.

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
> rp1.dtbo is optional, it's there just for completeness in case anyone wan=
t
> to load teh overlay from the fw, as explained here:
> https://lore.kernel.org/all/ab9ab3536baf5fdf6016f2a01044f00034189291.1742=
418429.git.andrea.porta@suse.com/
> If it causes confusion, we can probably get rid of it with no penalty.

Supporting both ways is fine, but you don't need to duplicate the
source. You can build in a .dtbo from the arch/arm64/boot/dts/...
directories.

Rob

