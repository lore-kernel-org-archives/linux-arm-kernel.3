Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 946DBCE8D6B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 06:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ztzu8L8EDjVQmWigMrq/r3UxqoaXtRAo05IFtuz6rNQ=; b=mejNCRPBHkg1HERMnofLAw+Skm
	+MKhhkSVbjtepaxirWFD/54vCD8OC+olIKYSGKTnDFMM5P809aM6qbbMZzK5fRbjXlAhasNMQryus
	cG+7eKSyZ7v0eoS8jBqADBnHs1yeokcDEIn30YCn6e/sHVKsbUDhbLJGhlVFbfQEg9Mvwmsb9uofv
	qv5xUbE0spvcX8suMfa5DDz80yjIP8AoA+AloSEJwn/ub40BvOva6V7TMWxZC6jCXbNC3jI3D6g25
	W3/FXJvIocVDHSJkaAUHmt+rOmNCePiTP83Iv5w6Y5bl4OA07PR0t6P0BY/j9nYW8uuA0OqxdpUNw
	CY6TJP6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKsxs-0000000FXAa-10J7;
	Mon, 17 Nov 2025 06:43:52 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKsxp-0000000FX9t-22sa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 06:43:51 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-5957db5bdedso3576576e87.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 16 Nov 2025 22:43:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763361827; x=1763966627; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ztzu8L8EDjVQmWigMrq/r3UxqoaXtRAo05IFtuz6rNQ=;
        b=C5A+S6GMqR8l8EP2ZyhHedBNZX5YgaBiEe+kYgWIFqcEHQbZKrrGH/GPoBzH12yvpa
         TsND/pbOkZipDBwUV+qOLvUZQu9Hs4n+OrmS8zVy0a0tfaesJpZNUMO1+gmyvIdqUElw
         dItTMb6UuRO3zYRDbfcjMIGasIzJY82kdQsKc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763361827; x=1763966627;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ztzu8L8EDjVQmWigMrq/r3UxqoaXtRAo05IFtuz6rNQ=;
        b=cBBiDnfbbErMqjwPa5D4jaJJ3Jwgngn8+a1A1NhwBIQy0waEHWTxZzGWcnEzxpDNsO
         j1c3ecWBRjrBFiB3rgsvKgLZ+f1eyNuhEOYZ1GNj4M87IJyV3cREtAStLgvAxhF5pVVz
         vfDV11RQO0bsOmD8+puRtt0pPZUVZ6HvbQt5IZA0mTti7jkj93WYmmeUlEox4T/vC5t4
         WTHSNRLyMwUWiUMw8mBqGadR5OteoCxC7GyowqjdDVkhwOIvOcH32G+cmaY7T5/BDuXC
         gajVT6D6Bzq6XSX+ZP9JyqhCobQLxj0eC8+m8K4Sm9rkcmO0CwI+LpoPabAQkmLiRr5Q
         0Olw==
X-Forwarded-Encrypted: i=1; AJvYcCVI/yfdJYiBrWzOkkrmoBngSymLKtFWZArThyVYK2PSC7YzHy6y4izsvWfgKu9jWMeYJ2N13DY+uAcaARQLr4zE@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+/3BNabz8GWnxDdFBdo/LkYUv9BnW+RzMsTKqUKJ6rn+VfW4n
	RtajanJPT1Z7nYcDH+DdmVSWC68cAraAbgmiCGr+sd6peWuRhGQqKoGXUZ9HDDh23x3AtSvb+FE
	mBkv49YBHV267ByRbiH3cFDJj/TIusnaGwDlf6JrtQWO0K+lD3GOlSw==
X-Gm-Gg: ASbGnctJPZNTFicNDM9hahDKvtDPVykEPspVpcLMk8gjTWgYDkDkYJgYUmeHqS/r/Ba
	C4rMXtDFp5sCQItXzYaHfMXPAqqroxAMezE0Vdf2pd/6/SZobGN8HjHl10flOpLDJnLNpUvZ90a
	/WDKF3ksz/BTZBCKcvdsorxYE24LrX07h5p7vRlpyPwnq4JuF6AUg92niNfDGlAbz6NlJdDr9KS
	sQWs2jKqDdlT9WoJ3bj5oe97d9fLhYwvZWXDYtBjM1KZNnHoS40UR205TKc6rQQQty+/v483b2+
	xcaWK2godE6ntss=
X-Google-Smtp-Source: AGHT+IEC+yNRKOQ9NawANN7tyYA6Ho86/PVANukDuW3Y5gE7g+0lwkQo3dAyt0tv+U9auseXUxL2sMmlRPYBB0lWDTU=
X-Received: by 2002:a05:6512:39cf:b0:594:5000:4554 with SMTP id
 2adb3069b0e04-59584205e12mr3303964e87.28.1763361826796; Sun, 16 Nov 2025
 22:43:46 -0800 (PST)
MIME-Version: 1.0
References: <20251111192422.4180216-1-dianders@chromium.org>
 <20251111112158.4.I5032910018cdd7d6be7aea78870d04c0dc381d6e@changeid>
 <40e67c6d-2430-483b-b4b1-0220ffbd6418@kernel.org> <CAGXv+5Gx+skrUR3PXt=RSL8YyKZYeQCkJ-3qW9wtrHrr9aqWAg@mail.gmail.com>
 <312ca473-77a6-4b95-b558-bb121294fbc9@kernel.org>
In-Reply-To: <312ca473-77a6-4b95-b558-bb121294fbc9@kernel.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 17 Nov 2025 14:43:35 +0800
X-Gm-Features: AWmQ_bl2shuWAHtLdGE1SHKrUg5L4s7uIhfcqFtBi7QSUqtHRD0ALPKOeLoheIw
Message-ID: <CAGXv+5EdkibBaB1-AyyfYO-STtmZzvTh1t-p+QW3jGb8cHY5wg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20251116_224349_640612_01EE861A 
X-CRM114-Status: GOOD (  65.70  )
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

On Wed, Nov 12, 2025 at 5:49=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 12/11/2025 10:35, Chen-Yu Tsai wrote:
> > On Wed, Nov 12, 2025 at 4:14=E2=80=AFPM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> >>
> >> On 11/11/2025 20:22, Douglas Anderson wrote:
> >>> Add barebones device trees for frankel (Pixel 10), blazer (Pixel 10
> >>> Pro), and mustang (Pixel 10 Pro XL). These device trees are enough to
> >>> boot to a serial prompt using an initramfs.
> >>>
> >>> Many things can be noted about these device trees:
> >>>
> >>> 1. They are organized as "dts" files for the main SoC and "dtso"
> >>>    overlays for the boards. There is discussion about this in the
> >>>    bindings patch ("dt-bindings: arm: google: Add bindings for
> >>>    frankel/blazer/mustang").
> >>> 2. They won't boot with the currently shipping bootloader. The curren=
t
> >>>    bootloader hardcodes several paths to nodes that it wants to updat=
e
> >>>    and considers it a fatal error if it can't find these nodes.
> >>>    Interested parties will need to wait for fixes to land and a new
> >>>    bootloader to be rolled out before attempting to use these.
> >>> 3. They only add one revision (MP1) of each of frankel, blazer, and
> >>>    mustang. With this simple barebones device tree, there doesn't
> >>>    appear to be any difference between the revisions. More revisions
> >>>    will be added as needed in the future. The heuristics in the
> >>>    bootloader will pick the MP1 device tree if there are not any
> >>>    better matches.
> >>> 4. They only add the dts for the B0 SoC for now. The A0 SoC support
> >>>    can be added later if we find the need.
> >>> 5. Even newer versions of the bootloader will still error out if they
> >>>    don't find a UFS node to add calibration data to. Until UFS is
> >>>    supported, we provide a bogus UFS node for the bootloader. While
> >>>    the bootloader could be changed, there is no long-term benefit
> >>>    since eventually the device tree will have a UFS node.
> >>> 6. They purposely choose to use the full 64-bit address and size cell=
s
> >>>    for the root node and the `soc@0` node. Although I haven't tested
> >>>    the need for this, I presume the arguments made in commit
> >>>    bede7d2dc8f3 ("arm64: dts: qcom: sdm845: Increase address and size
> >>>    cells for soc") would apply here.
> >>> 7. Though it looks as if the UART is never enabled, the bootloader
> >>>    knows to enable the UART when the console is turned on. Baud rate
> >>>    is configurable in the bootloader so is never hardcoded in the
> >>>    device tree.
> >>>
> >>> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> >>> ---
> >>> To avoid fragmenting the discussion, IMO:
> >>> * Let's have the discussion about using the "dts" for SoC and the
> >>>   "dtso" for the boards in response to the bindings (patch #1).
> >>
> >> That's discussion here, bindings are irrelevant to this.
> >>
> >>> * If we want to have a discussion about putting "board-id" and
> >>>   "model-id" at the root of the board overlays, we can have it
> >>>   here. I'll preemptively note that the "board-id" and "model-id"
> >>>   won't show up in the final combined device tree and they are just
> >>>   used by the tool (mkdtimg). We could change mkdtimg to parse the
> >>>   "compatible" strings of the overlays files (since I've put the IDs
> >>>   there too), but official the docs [1] seem to indicate that
> >>>   top-level properties like this are OK.
> >>>
> >>> In order for these device trees to pass validation without warnings,
> >>> it's assumed you have my dtc patches:
> >>> * https://lore.kernel.org/r/20251110204529.2838248-1-dianders@chromiu=
m.org
> >>> * https://lore.kernel.org/r/20251110204529.2838248-2-dianders@chromiu=
m.org
> >>>
> >>> [1] https://git.kernel.org/pub/scm/utils/dtc/dtc.git/tree/Documentati=
on/dt-object-internal.txt?h=3Dmain
> >>>
> >>>  arch/arm64/boot/dts/google/Makefile           |   9 +
> >>>  arch/arm64/boot/dts/google/lga-b0.dts         | 391 ++++++++++++++++=
++
> >>>  .../arm64/boot/dts/google/lga-blazer-mp1.dtso |  22 +
> >>>  .../boot/dts/google/lga-frankel-mp1.dtso      |  22 +
> >>>  .../boot/dts/google/lga-mustang-mp1.dtso      |  22 +
> >>>  .../boot/dts/google/lga-muzel-common.dtsi     |  17 +
> >>>  6 files changed, 483 insertions(+)
> >>>  create mode 100644 arch/arm64/boot/dts/google/lga-b0.dts
> >>>  create mode 100644 arch/arm64/boot/dts/google/lga-blazer-mp1.dtso
> >>>  create mode 100644 arch/arm64/boot/dts/google/lga-frankel-mp1.dtso
> >>>  create mode 100644 arch/arm64/boot/dts/google/lga-mustang-mp1.dtso
> >>>  create mode 100644 arch/arm64/boot/dts/google/lga-muzel-common.dtsi
> >>>
> >>> diff --git a/arch/arm64/boot/dts/google/Makefile b/arch/arm64/boot/dt=
s/google/Makefile
> >>> index a6b187e2d631..276001e91632 100644
> >>> --- a/arch/arm64/boot/dts/google/Makefile
> >>> +++ b/arch/arm64/boot/dts/google/Makefile
> >>> @@ -1 +1,10 @@
> >>>  # SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
> >>> +
> >>> +dtb-$(CONFIG_ARCH_GOOGLE) +=3D \
> >>> +     lga-blazer-mp1.dtb \
> >>> +     lga-frankel-mp1.dtb \
> >>> +     lga-mustang-mp1.dtb
> >>> +
> >>> +lga-blazer-mp1-dtbs          :=3D lga-b0.dtb lga-blazer-mp1.dtbo
> >>> +lga-frankel-mp1-dtbs         :=3D lga-b0.dtb lga-frankel-mp1.dtbo
> >>> +lga-mustang-mp1-dtbs         :=3D lga-b0.dtb lga-mustang-mp1.dtbo
> >>> diff --git a/arch/arm64/boot/dts/google/lga-b0.dts b/arch/arm64/boot/=
dts/google/lga-b0.dts
> >>> new file mode 100644
> >>> index 000000000000..83c2db4f20ef
> >>> --- /dev/null
> >>> +++ b/arch/arm64/boot/dts/google/lga-b0.dts
> >>> @@ -0,0 +1,391 @@
> >>> +// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
> >>> +/*
> >>> + * Google Tensor G5 (laguna) SoC rev B0
> >>> + *
> >>> + * Copyright 2024-2025 Google LLC.
> >>> + */
> >>> +
> >>> +/dts-v1/;
> >>> +
> >>> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> >>> +#include <dt-bindings/interrupt-controller/irq.h>
> >>> +
> >>> +/ {
> >>> +     model =3D "Google Tensor G5 rev B0";
> >>> +     compatible =3D "google,soc-id-0005-rev-10", "google,lga";
> >>
> >> So that's SoC, thus must not be a DTS file, but DTSI.
> >>
> >> ...
> >>
> >>
> >> ...
> >>
> >>
> >>> diff --git a/arch/arm64/boot/dts/google/lga-frankel-mp1.dtso b/arch/a=
rm64/boot/dts/google/lga-frankel-mp1.dtso
> >>> new file mode 100644
> >>> index 000000000000..133494de7a9b
> >>> --- /dev/null
> >>> +++ b/arch/arm64/boot/dts/google/lga-frankel-mp1.dtso
> >>
> >> And that's a board, so DTS.
> >>
> >>> @@ -0,0 +1,22 @@
> >>> +// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
> >>> +/*
> >>> + * Google Pixel 10 (frankel) MP 1
> >>> + *
> >>> + * Copyright 2024-2025 Google LLC.
> >>> + */
> >>> +
> >>> +/dts-v1/;
> >>> +/plugin/;
> >>> +
> >>> +#include "lga-muzel-common.dtsi"
> >>> +
> >>> +/ {
> >>> +     board-id =3D <0x070306>;
> >>> +     board-rev =3D <0x010000>;
> >>
> >> Undocumented ABI, which you cannot document because these properties a=
re
> >> not allowed. You cannot have them.
> >
> > This is part of the discussion I want to have at Plumbers. But I suppos=
e
> > we can start here.
>
> Then the patch should be called RFC as not yet ready for merging. :)
>
> >
> > The Android DTB partition format uses six 32-bit integers for matching,
> > as opposed to a compatible string used in FIT images. Two of the intege=
rs
> > are the "id" and "rev" numbers in the example above. The remaining four
> > are custom and left up to the (vendor) bootloader implementation.
> >
> > The values for these fields need to be stored somewhere with the .dts.
> > The compiled DTB is useless if the user cannot build a proper image for
> > the bootloader to consume, and that involves putting in the right numbe=
rs
> > in these fields. The android "mkdtimg" tool can either take the values
> > from some known properties within the DTB, or have them fed to it
> > externally.
> >
> > So if we don't want these numbers in the dts itself, then we should com=
e
> > up with some format to store them beside the dts files.
>
> Re-iterating comment from Rob long time ago: adding such new properties
> is fine, but they must come for more than one user and be universal
> across these users.

Is Android universal enough? As mentioned above, Android defines some
fields that it wants in its DTBO partition header. I am doubtful we
could generalize further, since each bootloader scheme wants different
things.

> And of course the ABI needs to be documented which did not happen here.
>
> I indeed said incorrectly that "properties are not allowed". The
> properties could be allowed if we document them according to above Rob's
> comment, but that did not happen.
>
> Adding these properties per one SoC vendor is not really allowed, like
> qcom,board-id and qcom,msm-id, but maybe you intend to make it generic.

That is indeed not great. I believe this part predates the DTBO partition
format, and is also related to how vendors split their base DTB and
overlays, such as the scheme Doug presented.

Maybe the new Android Generic Boot Loader (GBL) work will provide
unification. I will reach out to them to see what's happening in that space=
.

> > On a similar note, we would have a similar problem with FIT images and
> > overlays. The FIT image format maps a (series of) compatible string(s)
> > to one DTB and any number of overlays. If overlays are involved, then
> > the compatible string cannot come from the DTB itself, and the mapping
> > must be stored somewhere.
>
> I recall, although cannot find now references to, a email talk on the
> list saying that such overlays should have their own compatible, thus
> solving this mapping problem.

Rob provided it in the other thread. The per-overlay compatible allows
identifying the overlay instead of using the filename, which I think
is much appreciated. But we still need a mapping of what a final device
compatible breaks down to.

For example, say we have the the following:

- product common base "google,yoda" (DTB)
- codec option one "google,yoda-codec-rt5682i" (DTBO)
- codec option two "google,yoda-codec-rt5682s" (DTBO)
- WWAN module and SAR sensor option "google,yoda,wwan" (DTBO)

We then have different SKUs that are a combination of the above:

- product SKU "google,yoda-sku0"
  combine "google,yoda", "google,yoda-codec-rt5682s", and "google,yoda,wwan=
"

- product SKU "google,yoda-sku4"
  combine "google,yoda", "google,yoda-codec-rt5682i", and "google,yoda,wwan=
"

- product SKU "google,yoda-sku16"
  combine "google,yoda" and "google,yoda-codec-rt5682s"

This is the mapping we have to put _somewhere_. The bootloader only
knows about "google,yoda-skuXYZ" and "google,yoda", as described in
the Chromebook boot flow document [1].

Now I suppose we could have per-SKU DTBOs that just update the base
compatible string, and have Makefile rules put them all together.
But we have something like 32 SKUs just for this product alone, and
I don't think we want to add that many dtso files. The whole reason
for us to switch to overlays was to avoid the explosion of SKU-based
DTB files.


Thanks
ChenYu

[1] Documentation/arch/arm/google/chromebook-boot-flow.rst

