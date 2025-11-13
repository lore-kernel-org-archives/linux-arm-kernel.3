Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06BABCD4F2F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 03:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kumcQLXhRVJ42+kqGdBB5vBon2g+g8mfBJG3iE4h+7I=; b=xqA/hFtHgAYEySYQsv/5Poa7ia
	76i9qBMK8VmH57SXz6ztEz/LcBQvmlLrcVqOPepuqJS23fVYvrfZ2IwATgEObCZXfbqyApi2eIKXW
	SDrNBFYcUXBdwS9ymU85n9sk3N3A6ucXVEUBDx4K5wp+LfiyKnQVXAPqflwqPtXgLQhh0rvnIFTuB
	qlaEpywN5PpDSzOxctT8Gi3+sUrO5peCBWH6X0W90PhKZ8DkjuV/B+VteuO81RVaPSZ9LNt1hYYv/
	b8vc+6Okp2NGERpoLnawACEFYb6YgMo+ubxLEtpmkdFg5nGma71OZ7N8x8YfWltEq/KcQ8kl6Iiqk
	/3MOY/qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJO2H-00000009qAu-3P25;
	Thu, 13 Nov 2025 03:30:13 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJO2F-00000009qA8-1w0w
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 03:30:12 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-b729a941e35so40655766b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 19:30:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763004608; x=1763609408; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kumcQLXhRVJ42+kqGdBB5vBon2g+g8mfBJG3iE4h+7I=;
        b=B3v15AXNiczoUXEPUl2taf2Apu/87zZ/kn/uIMInwJapW2lpHWwpI42HVyx64c41mG
         TLWvLVYhzpn53v+bZ8P6cBwuisL6mUUdSkZ7rnegD3uwApwh1KjSXU+YqYXpbtVHe7wA
         ByaQFBXsoY7bM0AW1SmIJ4wCW368gSh3Deyvo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763004608; x=1763609408;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kumcQLXhRVJ42+kqGdBB5vBon2g+g8mfBJG3iE4h+7I=;
        b=nb4deZpnFA0C9ZPcMg6wDoUZNOoLwIB5j3hBEyxN9xXmxicqVp6J61jc+o2hCy5PBz
         I+L+uKXwatwTGNiIyOoa919OiLaRBAaG3Lwby01NY7a+qNmrE92DGKagwQTisVzXdh5Q
         oyxlJ5QZzk1IGWGLFQcKs5xWixMfiqSU2Qpde0a8FVUyeB3/jdNacD/ClF+QDjWYuxzF
         fLscHqKj8INuL75x5QGRMFn9ZPID3KrwcM0h54b5X9OtVJYH+auv/cZBvsJW3lHK/lt2
         AXGpQ17pe0Fp/EmA7Xs09BFHMLNCkUhvtTc5unsb/Evl9c3p8rxP2V6uCJys76KrjKo/
         Ueng==
X-Forwarded-Encrypted: i=1; AJvYcCUUNwiQ2xajQePBQjGKZDB1gsbv4pR3UxH3cAi1a85inRLjCrJ6PY89OMjAGqwvwjMYagmS4qUBK8JZwKVjGyP8@lists.infradead.org
X-Gm-Message-State: AOJu0YxHApBn3Tjcn+w6mJHJVpgCu6dRGjPLCx7/bp0pGif+xkpsT8Mo
	FRDL3UbpH0IwqBboEc+TKMclta2YSUYMgS09TDCotFkmv8VfsKOdL5d0Xek9J0ZOW8RxakcY5dC
	wMllVC3y5
X-Gm-Gg: ASbGncsMSA1NbjeC1jq4bkbY0aikJmCY8J1Mw6FEdpZAO7BLq2gJMYpTWTUUsX2F0gm
	mdfLAPPN27ck3UpdC2O3Yua6iJkePsiu+Tsltq1o7UUxI+CmCkcWVylf6RqIzQYUB3z7fGffiii
	XovWztOGySfMsxvueEXndxMMbfXv1ZFYUpO+YROskUrU9B29UlNchlk2/BzVPmDNVA+AtL01MGT
	8ttnVvafOwg50UkKgP08VWPVjD/X7yvUoY91uHcamwRyQLYU9FvG9ngQBOqtIx9u+eOcwRKZriK
	AJeZA/eQtmH29hSYjkd/rTtkUoSrsmGkcibQKjXrr9ovJDcjZ4ktRvztT1P4Q0BYN0A8grtuvWr
	DQJYErBU6VDBLV+JW5w61hxR1vHpAGnJurorAsCBFs+zvnAbFDtZ+3mBjZhaQxZEGCbXte25ZCm
	zURch6w7fu4mLrkj8el8rQcMAsScXRxrjHZMT9zHs=
X-Google-Smtp-Source: AGHT+IHyjo4nbSvtTCQGzZxE45ULbLaoktZCY5PGqmbsEeNen/8scIFzMU6QbrZf1+cdqf1nD95CQw==
X-Received: by 2002:a17:907:2d22:b0:b70:c190:62e1 with SMTP id a640c23a62f3a-b7331a97235mr554405266b.35.1763004608353;
        Wed, 12 Nov 2025 19:30:08 -0800 (PST)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com. [209.85.128.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fad41cesm67229666b.16.2025.11.12.19.30.07
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Nov 2025 19:30:07 -0800 (PST)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47775fb6c56so3889245e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 19:30:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUf/UAGkynfT9Uq+fzDy6vzRfuLvu6oEFZ0cebao06JWXrdVXaDslnbRF+4v9fRP28hhZLiKpLICOLyx7wmV1VP@lists.infradead.org
X-Received: by 2002:a05:600c:3790:b0:475:e067:f23d with SMTP id
 5b1f17b1804b1-477870c52a3mr31201855e9.25.1763004606759; Wed, 12 Nov 2025
 19:30:06 -0800 (PST)
MIME-Version: 1.0
References: <20251111192422.4180216-1-dianders@chromium.org>
 <20251111112158.1.I72a0b72562b85d02fee424fed939fea9049ddda9@changeid> <20251113022719.GA2281498-robh@kernel.org>
In-Reply-To: <20251113022719.GA2281498-robh@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 12 Nov 2025 19:29:55 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WUXK_xs4taxs8Q4kxqvkNYE+Ftk3N=N7Nm7yKEvUMtAQ@mail.gmail.com>
X-Gm-Features: AWmQ_blcmWR5kJDaDngm-8O-X2v8SAcxprJmk_stg7YsNR0KAtWultK00ENsFTE
Message-ID: <CAD=FV=WUXK_xs4taxs8Q4kxqvkNYE+Ftk3N=N7Nm7yKEvUMtAQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: arm: google: Add bindings for frankel/blazer/mustang
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, linux-samsung-soc@vger.kernel.org, 
	Roy Luo <royluo@google.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wenst@chromium.org>, 
	Julius Werner <jwerner@chromium.org>, William McVicker <willmcvicker@google.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_193011_692070_A4E83190 
X-CRM114-Status: GOOD (  72.89  )
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

Hi,

On Wed, Nov 12, 2025 at 6:27=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> On Tue, Nov 11, 2025 at 11:22:04AM -0800, Douglas Anderson wrote:
> > Add top-level DT bindings useful for Pixel 10 (frankel), Pixel 10 Pro
> > (blazer), and Pixel 10 Pro XL (mustang).
> >
> > Since overlays are fairly well-supported these days and the downstream
> > Pixel bootloader assumes that the SoC is the base overlay and specific
> > board revisions are overlays, reflect the SoC / board split in the
> > bindings.
> >
> > The SoC in the Pixel 10 series has the marketing name of "Tensor
> > G5". Despite the fact that it sounds very similar to the "Tensor G4",
> > it's a very different chip. Tensor G4 was, for all intents and
> > purposes, a Samsung Exynos offshoot whereas Tensor G5 is entirely its
> > own SoC. This SoC is known internally as "laguna" and canonically
> > referred to in code as "lga". There are two known revisions of the
> > SoC: an A0 pre-production variant (ID 0x000500) and a B0 variant (ID
> > 0x000510) used in production. The ID is canonicaly broken up into a
> > 16-bit SoC product ID, a 4-bit major rev, and a 4-bit minor rev.
> >
> > The dtb for all supported SoC revisions is appended to one of the boot
> > partitions and the bootloader will look at the device trees and pick
> > the correct one. The current bootloader uses a downstream
> > `soc_compatible` node to help it pick the correct device tree. It
> > looks like this:
> >   soc_compatible {
> >     B0 {
> >       description =3D "LGA B0";
> >       product_id =3D <0x5>;
> >       major =3D <0x1>;
> >       minor =3D <0x0>;
> >       pkg_mode =3D <0x0>;
> >     };
> >   };
> > Note that `pkg_mode` isn't currently part of the ID on the SoC and the
> > bootloader always assumes 0 for it.
> >
> > In this patch, put the SoC IDs straight into the compatible. Though
> > the bootloader doesn't look at the compatible at the moment, this
> > should be easy to teach the bootloader about.
> >
> > Boards all know their own platform_id / product_id / stage / major /
> > minor / variant. For instance, Google Pixel 10 Pro XL MP1 is:
> > * platform_id (8-bits): 0x07 - frankel/blazer/mustang
> > * product_id (8-bits):  0x05 - mustang
> > * stage (4-bits):       0x06 - MP
> > * major (8-bits):       0x01 - MP 1
> > * minor (8-bits):       0x00 - MP 1.0
> > * variant (8-bits):     0x00 - No special variant
> >
> > When board overlays are packed into the "dtbo" partition, a tool
> > (`mkdtimg`) extracts a board ID and board rev from the overlay and
> > stores that as metadata with the overlay. Downstream, the dtso
> > intended for the Pixel 10 Pro XL MP1 has the following properties at
> > its top-level:
> >   board_id =3D <0x70506>;
> >   board_rev =3D <0x010000>;
> >
> > The use of top-level IDs can probably be used for overlays upstream as
> > well, but also add the IDs to the compatible string in case it's
> > useful.
> >
> > Compatible strings are added for all board revisions known to be
> > produced based on downstream sources.
> >
> > A few notes:
> > * If you look at `/proc/device-tree/compatible` and
> >   `/proc/device-tree/model` on a running device, that won't
> >   necessarily be an exact description of the hardware you're running
> >   on. If the bootloader can't find a device tree that's an exact match
> >   then it will pick the best match (within reason--it will never pick
> >   a device tree for a different product--just for different revs of
> >   the same product).
> > * There is no merging of the top-level compatible from the SoC and
> >   board. The compatible string containing IDs for the SoC will not be
> >   found in the device-tree passed to the OS.
>
> I think this is a problem...

Fair enough. Is the right answer to add a special rule when applying
overlays to base dtbs? If both the base DTB and the overlay contain a
top-level compatible, should we merge the two instead of having the
overlay replace the base property? Would that be right in all cases?

Specifically, if we were to look at how we handle our dev boards that
are socketed and can handle either SoC rev A0 or SoC rev B0, I guess
the top-level compatible string somehow needs to indicate this
somehow? If we "merged" the compatible strings of the board and the
SoC?

So if we had a deepspace (devboard) with a A0 rev SoC:

base (lga A0):
  google,soc-id-0005-rev-00, google,lga

overlay (deepspace devboard 1)
  google,pixel-id-070101-rev-010000

Final compatible:
  google,pixel-id-070101-rev-010000, google,soc-id-0005-rev-00, google,lga

If we had a deepspace with a B0 rev SoC:

base (lga A0):
  google,soc-id-0005-rev-10, google,lga

overlay (deepspace devboard 1)
  google,pixel-id-070101-rev-010000

Final compatible:
  google,pixel-id-070101-rev-010000, google,soc-id-0005-rev-10, google,lga


...is that what you're thinking? Of course, it still somehow feels
cleaner to me to put the SoC compatible under the "soc@0" node, though
I know that goes against "tradition"... If we did that then the base
SoC "dtb" doesn't need a compatible at all and the board would _just_
have its own compatible.


NOTE: I don't think this is a novel problem. There are already
existing overlays that mess with the top-level compatible...

grep '^\tcompatible' $(find arch/arm64/boot/dts -name '*.dtso')


> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> > In the past, attempts to have the SoC as a base device tree and boards
> > supported as overlays has been NAKed. From a previous discussion [1]
> > "Nope, boards are not overlays. Boards are DTB." I believe this needs
> > to be relitigated.
>
> I think it is worth having the discussion. There's been some discussions
> about an overlay split with SoMs and baseboards as well. I think that's
> what is driving this addition[1]. I don't think this case is much
> different.
>
> As a different way to combine things compared to .dtsi files, I don't
> care too much how things are structured to the extent that's just
> internal structure and we're moving the combining of files from one
> point in time to another.
>
> My concern here is largely around validation. Can the SoC DTB pass
> validation, and can we still validate the whole thing at build time? To
> start with, it's not great if we have to make the schema allow only an
> SoC compatible without a board compatible. Then suddenly omitting a
> board compatible is always valid. Solving that with an entirely
> different SoC compatible as you have doesn't seem great.

I guess, in theory, we could solve this by simply not trying to
validate the SoC "dts" file on its own. Is this as simple as giving it
its own filename suffix? Do we just call it "lga-b0.dtsb" or for
"device tree source base", or something like that? Then we add kernel
rules where we don't validate that on its own but only validate it
together with overlays?


> My other concern is whether this is an ABI between the SoC and board
> DTBs? And I don't mean just you, but for anyone wanting to do anything
> remotely similar. An ABI is a problem as we don't really have any way to
> validate each piece separately. (This is already a problem for existing
> overlays.)

To keep the problem smaller / easier to think about and not try to
solve all existing problems: the only case we're worried about at the
moment is when the base device tree and all overlays are generated at
the same time. That feels like it might be an easier case to handle?


> > In the previous NAK, I didn't see any links to documentation
> > explicitly stating that DTBs have to represent boards. It's also
> > unclear, at least to me, _why_ a DTB would be limited to represent a
> > "board" nor what the definition of a "board" is.
> >
> > As at least one stab at why someone might not want an overlay scheme
> > like this, one could point out that the top-level compatible can be a
> > bit of a mess. Specifically in this scheme the board "compatible" from
> > the overlay will fully replace/hide the SoC "compatible" from the base
> > SoC. If this is truly the main concern, it wouldn't be terribly hard
> > to add a new semantic (maybe selectable via a new additional
> > property?) that caused the compatible strings to be merged in a
> > reasonable way.
> >
> > Aside from dealing with the compatible string, let's think about what
> > a "board" is. I will make the argument here that the SoC qualifies as
> > a "board" and that the main PCB of a phone can be looked at as a
> > "cape" for this SoC "board". While this may sound like a stretch, I
> > would invite a reader to propose a definition of "board" that excludes
> > this. Specifically, it can be noted:
> > * I have a development board at my desk that is "socketed". That is, I
> >   can pull the SoC out and put a different one in. I can swap in a
> >   "rev A0" or a "rev B0" SoC into this socket. Conceivably, I could
> >   even put a "Tensor G6", G7, G8, or G999 in the socket if it was
> >   compatible. In this sense, the "SoC" is a standalone thing that can
> >   be attached to the devboard "cape". The SoC being a standalone thing
> >   is in the name. It's a "system" on a chip.
> > * In case the definition of a board somehow needs a PCB involved, I
> >   can note that on my dev board the CPU socket is soldered onto to a
> >   CPU daughtercard (a PCB!) that then has a board-to-board connector
> >   to the main PCB.
> > * Perhaps one could argue that a dev board like I have describe would
> >   qualify for this SoC/board overlay scheme but that a normal cell
> >   phone wouldn't because the SoC isn't removable. Perhaps removability
> >   is a requirement here? If so, imagine if some company took a
> >   Raspberry Pi, soldered some components directly onto the "expansion"
> >   pins, and resold that to consumers. Does this mean they can't use
> >   overlays?
> >
> > To me, the above arguments justify why SoC DTBs + "board" overlays
> > should be accepted. As far as I can tell, there is no downside and
> > many people who would be made happy with this.
> >
> > [1] https://lore.kernel.org/all/dbeb28be-1aac-400b-87c1-9764aca3a799@ke=
rnel.org/
> >
> >  .../devicetree/bindings/arm/google.yaml       | 87 +++++++++++++++----
> >  1 file changed, 68 insertions(+), 19 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/arm/google.yaml b/Docume=
ntation/devicetree/bindings/arm/google.yaml
> > index 99961e5282e5..f9f9ea1c8050 100644
> > --- a/Documentation/devicetree/bindings/arm/google.yaml
> > +++ b/Documentation/devicetree/bindings/arm/google.yaml
> > @@ -13,27 +13,18 @@ description: |
> >    ARM platforms using SoCs designed by Google branded "Tensor" used in=
 Pixel
> >    devices.
> >
> > -  Currently upstream this is devices using "gs101" SoC which is found =
in Pixel
> > -  6, Pixel 6 Pro and Pixel 6a.
> > +  These bindings for older Pixel devices don't use device tree overlay=
s so
> > +  no separate SoC entry is added. This may change in the future.
> >
> > -  Google have a few different names for the SoC:
> > -  - Marketing name ("Tensor")
> > -  - Codename ("Whitechapel")
> > -  - SoC ID ("gs101")
> > -  - Die ID ("S5P9845")
> > -
> > -  Likewise there are a couple of names for the actual device
> > -  - Marketing name ("Pixel 6")
> > -  - Codename ("Oriole")
> > -
> > -  Devicetrees should use the lowercased SoC ID and lowercased board co=
dename,
> > -  e.g. gs101 and gs101-oriole.
> > +  Newer Pixel devices are expected to have the SoC device tree as the =
base
> > +  and specific board device trees as overlays.
> >
> >  properties:
> >    $nodename:
> >      const: '/'
> >    compatible:
> >      oneOf:
> > +      # Google Tensor G1 AKA gs101 AKA whitechapel AKA Die ID S5P9845 =
boards
> >        - description: Google Pixel 6 or 6 Pro (Oriole or Raven)
> >          items:
> >            - enum:
> > @@ -41,13 +32,71 @@ properties:
> >                - google,gs101-raven
> >            - const: google,gs101
> >
> > +      # Google Tensor G5 AKA lga (laguna) SoC and boards
> > +      - description: Tensor G5 SoC (laguna)
> > +        items:
> > +          - enum:
> > +              - google,soc-id-0005-rev-00  # A0
> > +              - google,soc-id-0005-rev-10  # B0
> > +          - const: google,lga
> > +      - description: Google Pixel 10 Board (Frankel)
> > +        items:
> > +          - enum:
> > +              - google,pixel-id-070302-rev-000000  # Proto 0
> > +              - google,pixel-id-070302-rev-010000  # Proto 1
> > +              - google,pixel-id-070302-rev-010100  # Proto 1.1
> > +              - google,pixel-id-070303-rev-010000  # EVT 1
> > +              - google,pixel-id-070303-rev-010100  # EVT 1.1
> > +              - google,pixel-id-070303-rev-010101  # EVT 1.1 Wingboard
> > +              - google,pixel-id-070304-rev-010000  # DVT 1
> > +              - google,pixel-id-070305-rev-010000  # PVT 1
> > +              - google,pixel-id-070306-rev-010000  # MP 1
>
> Should upstream really care about anything other than MP1? I don't think
> so. Which ones are useful in 1 year, 2 years, 10 years?

I suspect that nearly all of them are useful, though _possibly_ some
of the early proto devices can be removed?

Specifically, engineers at Google will be supporting these devices for
many many years to come. Newer Pixel phones have something like an
8-year support life during which engineers will need to continue to
support them. From my experience on the Pixel team, unless you can
demonstrate a need for something newer it's common to get assigned EVT
1 or EVT 1.1 devices when you request hardware, even for older phones.

Even if end users are unlikely to need these, having them supported
will be essential for those at Google who need to support the product
as a whole.

We've had similar discussions in the past about Chromebooks and the
need to support old hardware, which is why Chromebooks have many
revisions supported. I can tell you that when we tried to drop old
revisions in the past I had angry people come and visit me.


> > +          - const: google,lga-frankel
> > +          - const: google,lga
>
> It's not clear to me how you map boards to SoC revision? You boot up
> using the SoC DTB and then select the board DTBO based on?

The key here is that combining happens in the bootloader. The
bootloader boots up and has its own (non-device tree ways) to handle
things. It then looks at the SoC ID register, looks at the IDs that
tell it what board it's running on, and picks a base DTB (representing
the SoC) and an overlay (representing the board). It combines these
two and passes a single unified device tree to Linux.

Maybe this is a key difference between what we're doing and what
you're thinking of? We're not trying to boot the main OS with just the
base.


> This all
> needs to be well defined and general enough any (existing) platform
> could use it. If [1] helps or doesn't work for you I'm interested in
> hearing that.

> [1] https://lore.kernel.org/devicetree-spec/20250911151436.2467758-1-raym=
ond.mao@linaro.org/

Perhaps I don't understand the proposal, but it doesn't seem useful to
me (?) or at least it's not relevant to the problem we're trying to
solve here.

If I had to guess, I'd say the problem they're trying to solve there
is that they've got some external peripherals (like an i2c-connected
dohickey). They want to ship their dohickey to customers and tell
customers that they can attach the dohickey to any of a number of
devboards. If a customer attaches their dohickey to a Raspberry Pi it
should go on, let's say, i2c5. If it's on a Beagleboard they'll say it
belongs on i2c3. On an stm32 it belongs on i2c11. So they distribute a
bunch of "dtbo" files with their dohickey, one for each target
devboard. This mechanism allows a loader to figure out which devboard
is running and which overlay should be loaded. Is that right?


In our case, the problem is very different. We're really just trying
to pick together all the pieces that make up a full system.

-Doug

