Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC507CEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 07:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iI7nA787yREp7SF+ZgPv2IF22WeDdIHHgGC9t9xZSFo=; b=TQSELjUGzK1vGoT+3Fmgw6D4Le
	0HSP3tzRuJwBjnKILHcC7qYptV2DNVnrIs8ixRM1+ETca741MPswuHB2CgGpjvKsZvaCHTB3T5XGP
	QBEHzLtdXXbV3RjAR9ZajOdwTTdZZ3C+HoHS87V5SK99lUj9by6UXr8K3lQg99mRXVe2BUD3bjAMs
	Wss4PmAzuAKMaUMkQMRviJKCrseap3gpEGcQLnpBlTur84fYgqXcyCcS2rFe/q8wOgxLoFfVswOK3
	y8cgaU7NlwC+9oMRWpMN7dQIvhzUY29UwYwVPUALoa3jkyX9AWqJUxJ0IGoaxHXmnZ5llPtJj3aaA
	eoNOantw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKtFT-0000000FZ1J-3qXd;
	Mon, 17 Nov 2025 07:02:03 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKtFR-0000000FZ0r-0hqv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 07:02:02 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-59447ca49afso4996450e87.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 16 Nov 2025 23:02:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763362919; x=1763967719; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iI7nA787yREp7SF+ZgPv2IF22WeDdIHHgGC9t9xZSFo=;
        b=NxyQqf3GrOIQPdmurFnYXxOgw2y6WQ6VbBYAHm514yqRCGHRFfB/B7CcsTmOFMEonM
         WVPCqar568YBch9/ulOXV8i06UTlH8SzHCvX4hwDLNHGq1dbspddc3DPCQlBufiN+vuL
         e3p55Y0YgKdsZIIFra6hAtDsPGVtpt/t7IDtg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763362919; x=1763967719;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iI7nA787yREp7SF+ZgPv2IF22WeDdIHHgGC9t9xZSFo=;
        b=fRP+PJvkCn8UGb0v1rWbfQBpOqvjmQcOVLMLG9cAyMIncq8BdYWKK3p4jhUH9Pl5mE
         sYgTUovGlXjHo94CEc/clPmIJ8stHVYKPanAUeFxSDZgcBIfSXMEGlThN8xHjesbqeey
         fHbAMFfVOkAHw588BBE1lYrngJR6/La2WTCriHdHw63ra4bSzcKgkfwR6bR7NNT0SRhz
         qBSX6kZUMYWBg/bcnjRdPLdeQNaeHPOvLwMbST3vxHbBR2OAnUnRyNoAAq2fGWURaZ8K
         AiyXl/bhP4m/GHO57vqBLUSo2w39SZP9EOdqmfwqGoV8ZWo+aPLIIL7LxAhME0Q55YAJ
         Iwpw==
X-Forwarded-Encrypted: i=1; AJvYcCUR40tsorZgkmZy5P9ghnaToZjhx6y6KK8HCIYJ3129G/ihHdudsAcO7YGI1FX0N0CIKammbQGJZAbzHXzxOxyv@lists.infradead.org
X-Gm-Message-State: AOJu0YzIMlKzVldiUZc5g4Mls3wg58G71H8WIWLediOOVBgn+8yvDvis
	JBjjW6jWoFSKaKerJq+I8qT2MFe+0w40mmFI2DSxTCcZQM+gBSB/3rLNr+utPJNtyNT90y1ghbl
	tp8PCatEmWe4+PZHGB5KB6ClUDU0fovM4rn+rF+W0
X-Gm-Gg: ASbGncvcWrdiRHcjmEggHYTSJr5vb00HoE06kSQDPPzJejJfXH16obwK4AqCYIWRe/6
	mLI9CslYpjoapVhBazqgiZQNTCI9bUlHsOyP3CATCvjtlDj1nUfszlEQG4Wr9fPyoLGHQF/UXie
	srp/vPhkVP2zsCsQDNC6V93iGE2dWbyFSRbUpha8xIUQUeWzjOzeSQMX/QEiDtMxLwz4xGrdyc9
	EMXVs22K5nr3vBMfbQsgL0VzynJk4b37YY210HuqzcF83KSavC9hwllCjRo9LVYXQNGcl2n0fgj
	vFS3dDOyHhvkgPg=
X-Google-Smtp-Source: AGHT+IERsUCpfw0ba2ZiCnoMPSwz482Iwmvh9l4yNvx3DiJpyztXvkPfAcsqYFZhO50s2/2D2hz7qLUeVGcO3KFp+QU=
X-Received: by 2002:a05:6512:3b09:b0:595:7d95:eab8 with SMTP id
 2adb3069b0e04-59584200406mr3411850e87.23.1763362918712; Sun, 16 Nov 2025
 23:01:58 -0800 (PST)
MIME-Version: 1.0
References: <20251111192422.4180216-1-dianders@chromium.org>
 <20251111112158.4.I5032910018cdd7d6be7aea78870d04c0dc381d6e@changeid>
 <40e67c6d-2430-483b-b4b1-0220ffbd6418@kernel.org> <CAGXv+5Gx+skrUR3PXt=RSL8YyKZYeQCkJ-3qW9wtrHrr9aqWAg@mail.gmail.com>
 <312ca473-77a6-4b95-b558-bb121294fbc9@kernel.org> <CAGXv+5EdkibBaB1-AyyfYO-STtmZzvTh1t-p+QW3jGb8cHY5wg@mail.gmail.com>
 <5180555c-b9c2-498b-af53-dff9ddc7f676@kernel.org>
In-Reply-To: <5180555c-b9c2-498b-af53-dff9ddc7f676@kernel.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 17 Nov 2025 15:01:47 +0800
X-Gm-Features: AWmQ_bniIy-SMvSeqjFnpBYxeAVpBsmuGvcRUbYHegTmYwGCe-auKL5oxLqakP0
Message-ID: <CAGXv+5FmgzPcjQ2qAc6Na2m+_FsCszd5PEPWqPOxkNP-f4c9Bg@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm64: dts: google: Add initial dts for frankel,
 blazer, and mustang
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Douglas Anderson <dianders@chromium.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, linux-samsung-soc@vger.kernel.org, 
	Roy Luo <royluo@google.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Julius Werner <jwerner@chromium.org>, 
	William McVicker <willmcvicker@google.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251116_230201_304321_A402ED6E 
X-CRM114-Status: GOOD (  67.47  )
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

On Mon, Nov 17, 2025 at 2:55=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 17/11/2025 07:43, Chen-Yu Tsai wrote:
> > On Wed, Nov 12, 2025 at 5:49=E2=80=AFPM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> >>
> >> On 12/11/2025 10:35, Chen-Yu Tsai wrote:
> >>> On Wed, Nov 12, 2025 at 4:14=E2=80=AFPM Krzysztof Kozlowski <krzk@ker=
nel.org> wrote:
> >>>>
> >>>> On 11/11/2025 20:22, Douglas Anderson wrote:
> >>>>> Add barebones device trees for frankel (Pixel 10), blazer (Pixel 10
> >>>>> Pro), and mustang (Pixel 10 Pro XL). These device trees are enough =
to
> >>>>> boot to a serial prompt using an initramfs.
> >>>>>
> >>>>> Many things can be noted about these device trees:
> >>>>>
> >>>>> 1. They are organized as "dts" files for the main SoC and "dtso"
> >>>>>    overlays for the boards. There is discussion about this in the
> >>>>>    bindings patch ("dt-bindings: arm: google: Add bindings for
> >>>>>    frankel/blazer/mustang").
> >>>>> 2. They won't boot with the currently shipping bootloader. The curr=
ent
> >>>>>    bootloader hardcodes several paths to nodes that it wants to upd=
ate
> >>>>>    and considers it a fatal error if it can't find these nodes.
> >>>>>    Interested parties will need to wait for fixes to land and a new
> >>>>>    bootloader to be rolled out before attempting to use these.
> >>>>> 3. They only add one revision (MP1) of each of frankel, blazer, and
> >>>>>    mustang. With this simple barebones device tree, there doesn't
> >>>>>    appear to be any difference between the revisions. More revision=
s
> >>>>>    will be added as needed in the future. The heuristics in the
> >>>>>    bootloader will pick the MP1 device tree if there are not any
> >>>>>    better matches.
> >>>>> 4. They only add the dts for the B0 SoC for now. The A0 SoC support
> >>>>>    can be added later if we find the need.
> >>>>> 5. Even newer versions of the bootloader will still error out if th=
ey
> >>>>>    don't find a UFS node to add calibration data to. Until UFS is
> >>>>>    supported, we provide a bogus UFS node for the bootloader. While
> >>>>>    the bootloader could be changed, there is no long-term benefit
> >>>>>    since eventually the device tree will have a UFS node.
> >>>>> 6. They purposely choose to use the full 64-bit address and size ce=
lls
> >>>>>    for the root node and the `soc@0` node. Although I haven't teste=
d
> >>>>>    the need for this, I presume the arguments made in commit
> >>>>>    bede7d2dc8f3 ("arm64: dts: qcom: sdm845: Increase address and si=
ze
> >>>>>    cells for soc") would apply here.
> >>>>> 7. Though it looks as if the UART is never enabled, the bootloader
> >>>>>    knows to enable the UART when the console is turned on. Baud rat=
e
> >>>>>    is configurable in the bootloader so is never hardcoded in the
> >>>>>    device tree.
> >>>>>
> >>>>> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> >>>>> ---
> >>>>> To avoid fragmenting the discussion, IMO:
> >>>>> * Let's have the discussion about using the "dts" for SoC and the
> >>>>>   "dtso" for the boards in response to the bindings (patch #1).
> >>>>
> >>>> That's discussion here, bindings are irrelevant to this.
> >>>>
> >>>>> * If we want to have a discussion about putting "board-id" and
> >>>>>   "model-id" at the root of the board overlays, we can have it
> >>>>>   here. I'll preemptively note that the "board-id" and "model-id"
> >>>>>   won't show up in the final combined device tree and they are just
> >>>>>   used by the tool (mkdtimg). We could change mkdtimg to parse the
> >>>>>   "compatible" strings of the overlays files (since I've put the ID=
s
> >>>>>   there too), but official the docs [1] seem to indicate that
> >>>>>   top-level properties like this are OK.
> >>>>>
> >>>>> In order for these device trees to pass validation without warnings=
,
> >>>>> it's assumed you have my dtc patches:
> >>>>> * https://lore.kernel.org/r/20251110204529.2838248-1-dianders@chrom=
ium.org
> >>>>> * https://lore.kernel.org/r/20251110204529.2838248-2-dianders@chrom=
ium.org
> >>>>>
> >>>>> [1] https://git.kernel.org/pub/scm/utils/dtc/dtc.git/tree/Documenta=
tion/dt-object-internal.txt?h=3Dmain
> >>>>>
> >>>>>  arch/arm64/boot/dts/google/Makefile           |   9 +
> >>>>>  arch/arm64/boot/dts/google/lga-b0.dts         | 391 ++++++++++++++=
++++
> >>>>>  .../arm64/boot/dts/google/lga-blazer-mp1.dtso |  22 +
> >>>>>  .../boot/dts/google/lga-frankel-mp1.dtso      |  22 +
> >>>>>  .../boot/dts/google/lga-mustang-mp1.dtso      |  22 +
> >>>>>  .../boot/dts/google/lga-muzel-common.dtsi     |  17 +
> >>>>>  6 files changed, 483 insertions(+)
> >>>>>  create mode 100644 arch/arm64/boot/dts/google/lga-b0.dts
> >>>>>  create mode 100644 arch/arm64/boot/dts/google/lga-blazer-mp1.dtso
> >>>>>  create mode 100644 arch/arm64/boot/dts/google/lga-frankel-mp1.dtso
> >>>>>  create mode 100644 arch/arm64/boot/dts/google/lga-mustang-mp1.dtso
> >>>>>  create mode 100644 arch/arm64/boot/dts/google/lga-muzel-common.dts=
i
> >>>>>
> >>>>> diff --git a/arch/arm64/boot/dts/google/Makefile b/arch/arm64/boot/=
dts/google/Makefile
> >>>>> index a6b187e2d631..276001e91632 100644
> >>>>> --- a/arch/arm64/boot/dts/google/Makefile
> >>>>> +++ b/arch/arm64/boot/dts/google/Makefile
> >>>>> @@ -1 +1,10 @@
> >>>>>  # SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
> >>>>> +
> >>>>> +dtb-$(CONFIG_ARCH_GOOGLE) +=3D \
> >>>>> +     lga-blazer-mp1.dtb \
> >>>>> +     lga-frankel-mp1.dtb \
> >>>>> +     lga-mustang-mp1.dtb
> >>>>> +
> >>>>> +lga-blazer-mp1-dtbs          :=3D lga-b0.dtb lga-blazer-mp1.dtbo
> >>>>> +lga-frankel-mp1-dtbs         :=3D lga-b0.dtb lga-frankel-mp1.dtbo
> >>>>> +lga-mustang-mp1-dtbs         :=3D lga-b0.dtb lga-mustang-mp1.dtbo
> >>>>> diff --git a/arch/arm64/boot/dts/google/lga-b0.dts b/arch/arm64/boo=
t/dts/google/lga-b0.dts
> >>>>> new file mode 100644
> >>>>> index 000000000000..83c2db4f20ef
> >>>>> --- /dev/null
> >>>>> +++ b/arch/arm64/boot/dts/google/lga-b0.dts
> >>>>> @@ -0,0 +1,391 @@
> >>>>> +// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
> >>>>> +/*
> >>>>> + * Google Tensor G5 (laguna) SoC rev B0
> >>>>> + *
> >>>>> + * Copyright 2024-2025 Google LLC.
> >>>>> + */
> >>>>> +
> >>>>> +/dts-v1/;
> >>>>> +
> >>>>> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> >>>>> +#include <dt-bindings/interrupt-controller/irq.h>
> >>>>> +
> >>>>> +/ {
> >>>>> +     model =3D "Google Tensor G5 rev B0";
> >>>>> +     compatible =3D "google,soc-id-0005-rev-10", "google,lga";
> >>>>
> >>>> So that's SoC, thus must not be a DTS file, but DTSI.
> >>>>
> >>>> ...
> >>>>
> >>>>
> >>>> ...
> >>>>
> >>>>
> >>>>> diff --git a/arch/arm64/boot/dts/google/lga-frankel-mp1.dtso b/arch=
/arm64/boot/dts/google/lga-frankel-mp1.dtso
> >>>>> new file mode 100644
> >>>>> index 000000000000..133494de7a9b
> >>>>> --- /dev/null
> >>>>> +++ b/arch/arm64/boot/dts/google/lga-frankel-mp1.dtso
> >>>>
> >>>> And that's a board, so DTS.
> >>>>
> >>>>> @@ -0,0 +1,22 @@
> >>>>> +// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
> >>>>> +/*
> >>>>> + * Google Pixel 10 (frankel) MP 1
> >>>>> + *
> >>>>> + * Copyright 2024-2025 Google LLC.
> >>>>> + */
> >>>>> +
> >>>>> +/dts-v1/;
> >>>>> +/plugin/;
> >>>>> +
> >>>>> +#include "lga-muzel-common.dtsi"
> >>>>> +
> >>>>> +/ {
> >>>>> +     board-id =3D <0x070306>;
> >>>>> +     board-rev =3D <0x010000>;
> >>>>
> >>>> Undocumented ABI, which you cannot document because these properties=
 are
> >>>> not allowed. You cannot have them.
> >>>
> >>> This is part of the discussion I want to have at Plumbers. But I supp=
ose
> >>> we can start here.
> >>
> >> Then the patch should be called RFC as not yet ready for merging. :)
> >>
> >>>
> >>> The Android DTB partition format uses six 32-bit integers for matchin=
g,
> >>> as opposed to a compatible string used in FIT images. Two of the inte=
gers
> >>> are the "id" and "rev" numbers in the example above. The remaining fo=
ur
> >>> are custom and left up to the (vendor) bootloader implementation.
> >>>
> >>> The values for these fields need to be stored somewhere with the .dts=
.
> >>> The compiled DTB is useless if the user cannot build a proper image f=
or
> >>> the bootloader to consume, and that involves putting in the right num=
bers
> >>> in these fields. The android "mkdtimg" tool can either take the value=
s
> >>> from some known properties within the DTB, or have them fed to it
> >>> externally.
> >>>
> >>> So if we don't want these numbers in the dts itself, then we should c=
ome
> >>> up with some format to store them beside the dts files.
> >>
> >> Re-iterating comment from Rob long time ago: adding such new propertie=
s
> >> is fine, but they must come for more than one user and be universal
> >> across these users.
> >
> > Is Android universal enough? As mentioned above, Android defines some
> > fields that it wants in its DTBO partition header. I am doubtful we
> > could generalize further, since each bootloader scheme wants different
> > things.
>
> There is no such user of these bindings as "Android".

Sure, since many vendors for Android-based devices don't bother to
upstream their device trees.

> >
> >> And of course the ABI needs to be documented which did not happen here=
.
> >>
> >> I indeed said incorrectly that "properties are not allowed". The
> >> properties could be allowed if we document them according to above Rob=
's
> >> comment, but that did not happen.
> >>
> >> Adding these properties per one SoC vendor is not really allowed, like
> >> qcom,board-id and qcom,msm-id, but maybe you intend to make it generic=
.
> >
> > That is indeed not great. I believe this part predates the DTBO partiti=
on
> > format, and is also related to how vendors split their base DTB and
> > overlays, such as the scheme Doug presented.
> >
> > Maybe the new Android Generic Boot Loader (GBL) work will provide
> > unification. I will reach out to them to see what's happening in that s=
pace.
> >
> >>> On a similar note, we would have a similar problem with FIT images an=
d
> >>> overlays. The FIT image format maps a (series of) compatible string(s=
)
> >>> to one DTB and any number of overlays. If overlays are involved, then
> >>> the compatible string cannot come from the DTB itself, and the mappin=
g
> >>> must be stored somewhere.
> >>
> >> I recall, although cannot find now references to, a email talk on the
> >> list saying that such overlays should have their own compatible, thus
> >> solving this mapping problem.
> >
> > Rob provided it in the other thread. The per-overlay compatible allows
> > identifying the overlay instead of using the filename, which I think
> > is much appreciated. But we still need a mapping of what a final device
> > compatible breaks down to.
>
> Who is "we"? Linux does not care about that mapping. For user-space
> "google,yoda-sku0" should be good enough.

"We" as in the Chromebook team, but more broadly, any user or developer
that wants to build a generic kernel image based off of base DTBs and
overlays.

> >
> > For example, say we have the the following:
> >
> > - product common base "google,yoda" (DTB)
> > - codec option one "google,yoda-codec-rt5682i" (DTBO)
> > - codec option two "google,yoda-codec-rt5682s" (DTBO)
> > - WWAN module and SAR sensor option "google,yoda,wwan" (DTBO)
> >
> > We then have different SKUs that are a combination of the above:
> >
> > - product SKU "google,yoda-sku0"
> >   combine "google,yoda", "google,yoda-codec-rt5682s", and "google,yoda,=
wwan"
> >
> > - product SKU "google,yoda-sku4"
> >   combine "google,yoda", "google,yoda-codec-rt5682i", and "google,yoda,=
wwan"
> >
> > - product SKU "google,yoda-sku16"
> >   combine "google,yoda" and "google,yoda-codec-rt5682s"
> >
> > This is the mapping we have to put _somewhere_. The bootloader only
> > knows about "google,yoda-skuXYZ" and "google,yoda", as described in
> > the Chromebook boot flow document [1].
> >
>
> The entire pathset is about Google Pixel so I really do not get how
> Chromebook boot flow got here.

My apologies, I should have forked the thread to make it clear my stuff
was about Chromebooks, but the discussion on overlays seemed relevant.

I'll try to work out an example and RFC patchset based on existing
ChromeOS device trees to further discuss things.


ChenYu

