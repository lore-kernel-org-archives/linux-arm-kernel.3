Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E271BD12688
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 23:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SusX4ntVHYma1Yz0f1nJGYnUk6TZNBm3kg6bvhaT0Bk=; b=rzJdcCz7Tn8EkhyYWgjdG5tpD3
	3GAvg5hQ3RCzCqrQfc/LJgQsc52UE/aqbDxgK6gs3TQxL4gdnaot/8yCTFHivznxxxkrOCnYhC/4p
	0cXMZAzKzTSg6DzP5o/YYRdsZ0J+M4sEmHNIyCLD41vUbUtHuDf5jpDPDoqhNHGYWf54xfm0p8z2e
	1PKbvQsTDjNmU5SXYMSwZtvG07wAT5q1WcEfLWiTONGrOoFjqWVWgs7LUvJDp9oZplxlPN7JuBnFn
	iWldtwUp8MgPFHhKDA6+4p/NvaRdvcYKvijXTkXBfrI1quvswXLyM/NKzcz8GgHIJbzrOioR0A5g6
	9rgwEBSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQZc3-00000005vla-2leB;
	Tue, 02 Dec 2025 23:16:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQZc1-00000005vlU-2lC4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 23:16:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 72E196014D
	for <linux-arm-kernel@lists.infradead.org>; Tue,  2 Dec 2025 23:16:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ADEDC19424
	for <linux-arm-kernel@lists.infradead.org>; Tue,  2 Dec 2025 23:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764717408;
	bh=73gj/hMYyPPC6pUaSwtP2vWY0sFe8jEPmZXl/KtFSWM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qvmPeKrn2Gq7hU7je8RiJMvClbjKsLaImFuYAHBNX+jVxvuewh/GkwtuBbMQ3CNV5
	 p2HvxY6XJ/QiOpYxZTu6wF6u9n+7U7SevqtdQrd/hf98wDrl4aVG7f6QPbcvldsGq7
	 tfUkDHr9/OVtm8WO+98TsKUV3Y4rT3DnxfXmokHyy3Wjh3RQM4hWyW7bC4AA03NE39
	 vmnw89PeNIGlk+lFMvdRtSnCmX/U3Beiw+cQFM6MdDU9+FXd/0vWDXVyW5xtqUNlqg
	 aJTRztm1oc1NoQSJR109SFGfZFrGfnNliaLV0+NPzegezG19LqPG3265S1crVDITE1
	 0ATnjajRX0l6Q==
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-640ca678745so10523288a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Dec 2025 15:16:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVbtyd+6E5AIYx5QwAuNNzc5SYuTLyrYIN2ZiSLzGRL+Bc2psl8jG2hChZS5PHYpIOPE6NThpVsvm8GgVGk7sfD@lists.infradead.org
X-Gm-Message-State: AOJu0YwhKaD7pZrbRkwUqy+lHEIJLWTq1KpfKf8Q91pGthKCVSPuZ8uL
	3i3sBVleXc8VNjQZzMNpNHBUHramqjlLOXQjb/m5tNx9GVIBxitu4DUj/Ur/lmIKG7XuUPzNl2y
	TwJpL+/sm1TY48gE2uqj5Ci4EOn8HLA==
X-Google-Smtp-Source: AGHT+IF2w4KiKuKTA29sK8gYXJZDFRujuwfLeSLhIDKQfP25Hu0pVCozW39ZiIEPEtrmRjepDfxpvt6P0O1AulAuoHc=
X-Received: by 2002:a05:6402:50cc:b0:640:e75a:f95d with SMTP id
 4fb4d7f45d1cf-6479c4822e2mr88119a12.15.1764717406701; Tue, 02 Dec 2025
 15:16:46 -0800 (PST)
MIME-Version: 1.0
References: <CAD=FV=Ux7nGFnYEyX0cUL-9__BKnTYc+kAJjkF458ZnFS7zoJA@mail.gmail.com>
 <aS66WcLPm6e5rdyk@shell.armlinux.org.uk>
In-Reply-To: <aS66WcLPm6e5rdyk@shell.armlinux.org.uk>
From: Rob Herring <robh@kernel.org>
Date: Tue, 2 Dec 2025 17:16:34 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLxLakt94ACgv8z5A-O4WGZPfiZ-7UFaBPaOa7W8L3Cxw@mail.gmail.com>
X-Gm-Features: AWmQ_bmj727TPR_OPMEUDsTOZnYmXNt_Vw9MKoaVj3IgJ9mOrtxgOcritfB3iLE
Message-ID: <CAL_JsqLxLakt94ACgv8z5A-O4WGZPfiZ-7UFaBPaOa7W8L3Cxw@mail.gmail.com>
Subject: Re: Proposal: Officially allow "incomplete" trees as a base
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Doug Anderson <dianders@chromium.org>, devicetree-spec@vger.kernel.org, 
	boot-architecture@lists.linaro.org, Chen-Yu Tsai <wenst@chromium.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	William McVicker <willmcvicker@google.com>, Julius Werner <jwerner@chromium.org>, 
	Conor Dooley <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Tue, Dec 2, 2025 at 4:07=E2=80=AFAM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> On Tue, Nov 18, 2025 at 02:43:20PM -0800, Doug Anderson wrote:
> > This is a continuation of the discussion that started in reply to my
> > patch adding basic device trees for Pixel 10 phones [1].
> >
> >
> > Problem statement:
> > ------------------
> >
> > We would like an officially accepted scheme that lets us more
> > efficiently ship compiled device trees for a handful of related
> > products by breaking the device trees up into a common "base" device
> > tree and then applying "overlay" device trees atop the base to make a
> > full and complete device tree.
> >
> > To make it more concrete, we'd like to build a "base" device tree that
> > describes a SoC and then have the overlays be enough to make a full
> > description of a board. In theory, one could also imagine wanting to
> > expand this to 3 or more levels (perhaps SoC, baseboard, derived
> > boards), though this is not planned at this time.
> >
> > The primary reason for wanting to break device trees like this is
> > efficiency of the shipped binary device trees. A large portion of a
> > final device tree just describes the SoC. We save space in the final
> > compiled device trees if they don't need to contain as much duplicated
> > information.
>
> Having worked on the SolidRun i.MX6 platforms, I agree with this.
> Within these platforms there are:
>
> SoC     SOM             Platform
> imx6dl  pre-v1.5        cubox
> imx6q   v1.5            hummingboard
>         v1.5 + emmc     hummingboard2
>
> On top of these, I have specific "user" extensions for hardware that
> I've connected - e.g.
> - the NoIR RPi camera needs DT modification.
> - for monitoring a mechanical church clock, a "gps" variant that
>   allowed PPS to be used with a GPIO pin, and a "capture" variant
>   that configured the hardware to allow precise event stamping.
> - 1-wire, for ds18b20 temperature sensors.
>
> Without the user extensions, this adds up to 18 DTB files:
> arch/arm/boot/dts/nxp/imx/imx6dl-cubox-i-emmc-som-v15.dts
> arch/arm/boot/dts/nxp/imx/imx6dl-cubox-i-som-v15.dts
> arch/arm/boot/dts/nxp/imx/imx6dl-cubox-i.dts
> arch/arm/boot/dts/nxp/imx/imx6dl-hummingboard-emmc-som-v15.dts
> arch/arm/boot/dts/nxp/imx/imx6dl-hummingboard-som-v15.dts
> arch/arm/boot/dts/nxp/imx/imx6dl-hummingboard.dts
> arch/arm/boot/dts/nxp/imx/imx6dl-hummingboard2-emmc-som-v15.dts
> arch/arm/boot/dts/nxp/imx/imx6dl-hummingboard2-som-v15.dts
> arch/arm/boot/dts/nxp/imx/imx6dl-hummingboard2.dts
> arch/arm/boot/dts/nxp/imx/imx6q-cubox-i-emmc-som-v15.dts
> arch/arm/boot/dts/nxp/imx/imx6q-cubox-i-som-v15.dts
> arch/arm/boot/dts/nxp/imx/imx6q-cubox-i.dts
> arch/arm/boot/dts/nxp/imx/imx6q-hummingboard-emmc-som-v15.dts
> arch/arm/boot/dts/nxp/imx/imx6q-hummingboard-som-v15.dts
> arch/arm/boot/dts/nxp/imx/imx6q-hummingboard.dts
> arch/arm/boot/dts/nxp/imx/imx6q-hummingboard2-emmc-som-v15.dts
> arch/arm/boot/dts/nxp/imx/imx6q-hummingboard2-som-v15.dts
> arch/arm/boot/dts/nxp/imx/imx6q-hummingboard2.dts
>
> basically, every combination needs to be enumerated. So, having two SoC
> dt files, three for the SOM, and three for the platform that the boot
> loader combines would significantly cut this down - to 8.
>
> However, it isn't that simple. For example, when the Hummingboard2 is
> used with the iMX6Q SoC, there's a SATA device present in the SoC level
> that needs Hummingboard2 specific properties to tune the signal
> waveform. However, iMX6DL doesn't have this SATA device in silicon, so
> the node doesn't exist in the base SoC DT file. The situation is the
> same for Hummingboard, but the tuning parameters, being board specific,
> are different.

If that is a separate overlay fragment (i.e. not under another node in
the overlay), we could solve this by having some way to mark the
fragment as optional. Apply it if the base node is present, but don't
fail if not. Could be a need for this without overlays as well.
Something like this:

#include <soc.dtsi>

/optional/ &sata {
  foo =3D <0>;
};

Normally if 'sata' isn't found, that's an error.

To make that work for overlays, we'd have to transform /optional/ into
a property. "target-optional" alongside "target-path" perhaps.

> This means is that there are DT properties that are dependent on the
> SoC DT component and the platform DT component which do not fit with
> splitting the DT files into their individual "component" levels.
>
> The other issue would be the /model property - for example:
>
>         model =3D "SolidRun HummingBoard2 Solo/DualLite";
>         model =3D "SolidRun HummingBoard2 Solo/DualLite (1.5som+emmc)";
>         model =3D "SolidRun HummingBoard2 Solo/DualLite (1.5som)";
>         model =3D "SolidRun HummingBoard Solo/DualLite";
>         model =3D "SolidRun HummingBoard2 Dual/Quad";
>         model =3D "SolidRun Cubox-i Solo/DualLite";

I think you just give up and generalize it: "SolidRun HummingBoard/Cubox"


> as a set of examples. I don't see a clear way to generate these from
> a fragmented scheme. There's a similar problem with the board-level
> compatible:
>
>         compatible =3D "solidrun,cubox-i/dl", "fsl,imx6dl";
>         compatible =3D "solidrun,hummingboard2/dl", "fsl,imx6dl";
>         compatible =3D "solidrun,hummingboard/dl", "fsl,imx6dl";
>         compatible =3D "solidrun,hummingboard2/q", "fsl,imx6q";
>
> These don't include the SoM information.

So we're back to needing to merge compatible even though Doug was
willing to drop it. Or to put it another way, there's usecases for the
base to be different SoC revisions and variants. So I don't think we
should give up on solving that.

> Maybe what would work would be a high-level DT file that contains
> paths to the lower levels that need to be combined, along with
> properties that need to be merged. E.g.
>
> / {
>         model =3D "SolidRun HummingBoard2 Dual/Quad";
>         compatible =3D "solidrun,hummingboard2/q", "fsl,imx6q";
>
>         dts-components {
>                 compatible =3D "boot/dt";
>
>                 component@1 {
>                         compatible =3D "dt";
>                         path =3D "imx6q.dtbo";
>                 };
>
>                 component@2 {
>                         compatible =3D "dt";
>                         path =3D "imx6qdl-sr-som-v1.5.dtbo";
>                 };
>
>                 component@3 {
>                         compatible =3D "dt";
>                         path =3D "imx6qdl-hummingboard2.dtbo";
>                 };
>
>                 component@4 {
>                         compatible =3D "dt";
>                         path =3D "imx6ql-hummingboard2-emmc.dtbo";
>                 };
>         };
>
>         soc {
>                 sata@2200000 {
>                         .. sata tuning properties ..
>                 };
>         };
> };
>
> Or something similar. However, this would mean we would still need the
> 18 or so top level DT files, but also each component as well, which
> will increase the number of files we're having to manage on a target
> platform - so I'm wondering whether it's worth it.

Looks like FIT...

> I don't think we'll be able to get away from this problem: it's likely
> that there will continue to be properties that are specific across
> several "levels" of a split DT setup, and apart from something like the
> above, I don't really see a way to handle them.

I tend to agree your cases might be the tip of the iceberg. I think
someone has to take some existing platforms and see what happens
splitting them.

> I also don't see a sensible way without something like the above for a
> boot loader to know the filenames of each of the components for a
> platform - and it would need to be told the order to glue those
> components together.

We've generally resisted making filenames significant/ABI.

Rob

