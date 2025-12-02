Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 237FFD12676
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 22:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yegdrDTIiSzr8qdU/hFwYrh2y7sAILKZQL5h+MMY60s=; b=aU7O9e8k1MPocqs95Uy12UV12b
	+bOW80svbUIEmjn1+26g1NdzLuDPryDQ6NX93NKQrXzZMVC/qAk6QM4s/3TVgBdjgiVuDPmkbAY43
	T+Uzl+zSjrXgZfut0E8z5PwlNDT1nsZNlilur+EEQs7v4oHYoSe6WiNCVX/WDUSBM6J67f6xDSLud
	atjjsq5aqVM85+GrkV+qIkA+GMH4yFgF5Lr7B9clusU6ckl7DjhJutjOmHUGPqERhnfIw8gVVZ04P
	zHPAI0PnYg/7Dl7/oFOJ/aJxMiwRa0SxoWUwZzwKFr1rH+G7+oLdaQUn1tVpqBKop6YV1K27CRJL5
	+mkx7qkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQYPq-00000005rud-2sjN;
	Tue, 02 Dec 2025 22:00:10 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQYPo-00000005rtt-36wo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 22:00:09 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-b7636c96b9aso825938466b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Dec 2025 14:00:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1764712804; x=1765317604; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yegdrDTIiSzr8qdU/hFwYrh2y7sAILKZQL5h+MMY60s=;
        b=JwtrPDwDexGb5DJOQOFW82mFMS4gctdFpd5byH0YRNZ6bmeHyslwQpK4rHr+2tq+ya
         FOiMEPPjwnggh97QWfAnwiIMQjQ6j/Jyx+uOpPMkNxaHaniGstFZb4s1nSqvql9YNFUn
         AS2ktfcnIGnH3vu9fRQPzOcYDShbUqAbWY0bM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764712804; x=1765317604;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yegdrDTIiSzr8qdU/hFwYrh2y7sAILKZQL5h+MMY60s=;
        b=r6Ll1VJEnBfZkQTFbnzAwIyJ7ze529Guo0nPajjBnTNnkFhzKTvsJhKWCrPnG2MNIb
         z6sUkavxXdJoa2mChCdVve+QkH7e72qfNkoLjRL6eXcrboRiFcHZjg3DkUBXB3HQjlEP
         GA2kI4jMnzIRHV4YX9EdNIkl0XAOyrDdofdrob1akQUKqBTspGsLEom3o4BGbBIrObC4
         o2Z0cGDbN9eetYgCWtNAq1DbnEHVfOhltPw3ijdzMfTNPSnfvUBMuknqlw5Ro/YhrtqK
         Yr9N0Y6p1qDCTzGMTYCwBO/5MhJKnBs7Qg9bLYxHYbt/4y5fNUmjipciQOVq3h4hedbU
         YpdA==
X-Forwarded-Encrypted: i=1; AJvYcCXSUZBQhK+upkAoy2c+6PvAj8fOUHOgn0IgswKMC8b+2nzbr7kRlAwWJp08bkaCsco0enepjTtiBtbVze7QwmXk@lists.infradead.org
X-Gm-Message-State: AOJu0YyPx6hmbVnWBY/yXHRmbVo/4fo9ZJjpKQj1w3FjauP/wuWjY6qV
	ibBt2DXRq7xfVXMuyBRpUbFEOZrdm7SktNi6r3tcxrsFFm1SXIzrYLiM25i5p+rw71a1BUIIPds
	UerrnpyJQ
X-Gm-Gg: ASbGncsTJYdhzkoPUfP/qntvPGdPNDEwUevEgRSVgaSXM57PPEMYdSELiNT0IAwr1qH
	oBRPs3FmkjwIPal0LXrmmDepKOcPp4/qFNfunyOROEzJWEcJtexGahdep00osuz77PhnybsDahO
	8W+hEu7udeUGmuZuDADNv/Dc6HVZO+DrFCuTBjt+GNTB3eYzyxposz2hOXzv2p9hLjeL+uJFTLq
	bCjFZmNE9PE5eIqYbTFLO5rFZch6eAbbUPTPd0b7UiunkdRTxKS2UPAlnA08WS5Ox6jPWcQhtLz
	I/FIH3ExB4RXWGHrKMKc5fGpLksy11GbdiVU8hMCfD5gcbBeRsk3Gg3LiOixIexpOezRoyOBAkC
	oQEB7fU24Bnk2u5qaeOu7j96YSm/gbEgL44VPpCPw7HaTYI4bYH1p1ZITSphIyR9z3VJv4QAI/M
	o/FG1YpB83tjFk6vE2b6Sw+b9QzqGSv99iEXOiLIgAg/DfM3Uv/BRfcL1Vf+Zw
X-Google-Smtp-Source: AGHT+IEPgNz5dI3i85r1/qX8Oj+gcrKcBQXTVx/3l+9OKQ6fOgtxM+sEfItmnjMQPaNyGd4NX+dACg==
X-Received: by 2002:a17:906:fd83:b0:b73:8e7d:4f87 with SMTP id a640c23a62f3a-b767184be2bmr4764292766b.45.1764712804029;
        Tue, 02 Dec 2025 14:00:04 -0800 (PST)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com. [209.85.128.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f5a7afb4sm1595942266b.70.2025.12.02.14.00.02
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Dec 2025 14:00:02 -0800 (PST)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4779cb0a33fso63549315e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Dec 2025 14:00:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVSPaqPZZ0LOUmbwE5WtWghWpZcghIK+yGjig64HRDA9jEuqu0vnqHnx+kdPsoib1teMharNhfp+f+uZCVFlToq@lists.infradead.org
X-Received: by 2002:a5d:5e01:0:b0:42b:3131:5435 with SMTP id
 ffacd0b85a97d-42cc1ac9de0mr44938296f8f.2.1764712801617; Tue, 02 Dec 2025
 14:00:01 -0800 (PST)
MIME-Version: 1.0
References: <CAD=FV=Ux7nGFnYEyX0cUL-9__BKnTYc+kAJjkF458ZnFS7zoJA@mail.gmail.com>
 <CAODwPW_51fKOfDQbTUFCum13M621Uxi2Zw2YHng0DrrwwvZhRQ@mail.gmail.com> <CAL_JsqJz8D53OF8PGaq+o6X5zfE1Y4NrH+BpYPEo6OENviJvbg@mail.gmail.com>
In-Reply-To: <CAL_JsqJz8D53OF8PGaq+o6X5zfE1Y4NrH+BpYPEo6OENviJvbg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 2 Dec 2025 13:59:50 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Xe3zqbyN5RVRppWbN=v6L=nECs6HtCu43m=QYUa=iV4w@mail.gmail.com>
X-Gm-Features: AWmQ_bmCUBKo9K_aGB-WNG6OGoI6RAsr0V6rdUnS6-V-21fTohUtnWxeXdCfFXY
Message-ID: <CAD=FV=Xe3zqbyN5RVRppWbN=v6L=nECs6HtCu43m=QYUa=iV4w@mail.gmail.com>
Subject: Re: Proposal: Officially allow "incomplete" trees as a base
To: Rob Herring <robh@kernel.org>
Cc: Julius Werner <jwerner@chromium.org>, devicetree-spec@vger.kernel.org, 
	boot-architecture@lists.linaro.org, Chen-Yu Tsai <wenst@chromium.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	William McVicker <willmcvicker@google.com>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	yupingso@chromium.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_140008_880141_DE1B301D 
X-CRM114-Status: GOOD (  59.97  )
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

On Mon, Dec 1, 2025 at 4:48=E2=80=AFPM Rob Herring <robh@kernel.org> wrote:
>
> > > Possible example if we support 3 levels:
> > >
> > > SoC (incomplete) compatible: "socvendor,mysoc-rev1", "socvendor,mysoc=
"
> > > overlay1 (incomplete) compatible: "referencevendor,referencecodename"=
;
>
> I don't understand this one...
>
> > > overlay2 compatible: "boardvendor,myboard-rev1", "boardvendor,myboard=
"
> > > merged compatible: "boardvendor,myboard-rev1", "boardvendor,myboard",
> > >                    "referencevendor,reference-codename",
> > >                     , "socvendor,mysoc";

I was just trying to come up with an example with 3 levels. Usually a
whole pile of boards are based on a reference design, so the reference
board could be an extra level of overlays. Thinking about this with
the sc7180 Chromebooks, you might have:

SoC: qcom,sc7180 (base DTB)
Reference design: google,trogdor
Actual board: google,lazor-rev1, google,lazor

So final compatible could be:
"google,lazor-rev1", "google-lazor", "google-trogdor", "qcom,sc7180"

In the case of what we ended up with upstream for sc7180 Chromebooks,
we actually _didn't_ include the reference design (google,trogdor) in
the list of compatibles in the final board. I think this was because
the name of the reference design ("trogdor") was also the name of the
reference _board_ and it would have been confusing. ...but I can also
see how one might want the reference board to show up here. I don't
feel super strongly either way.

In any case, I'm OK with not focusing on 3-levels right now and I'm
not actually planning to use it in the short term, I just want to make
sure that anything we do doesn't preclude it...


> > Sorry, I only cursorily followed the previous discussion so I may have
> > missed the exact need for this part. But I would caution against any
> > proposal that changes the basic rules of how an overlay is applied.
> > The definition of how overlays work has (I think?) been stable for
> > over a decade now, and is implemented in bootloaders that often cannot
> > easily be updated. I absolutely support your effort to get more
> > upstream standardization for managing base device trees and overlays
> > (which I think need to be flexible for arbitrary layers, not just SoC
> > and board), but let's not break the overlay code in old bootloaders
> > while doing it.
>
> I think merging compatibles is orthogonal to splitting SoC and board
> DTs. Doug needs to merge because there is more than 1 SoC version or
> base DT to pick. In many cases (SoC revision compatibles are the
> exception upstream), there is only 1 SoC DT and N board DTs. So we
> should consider both and define them separately. In the simple case,
> you'd have something like:
>
> SoC (incomplete) compatible: "socvendor,mysoc"
> Board overlay compatible: "boardvendor,myboard-rev1",
> "boardvendor,myboard", "socvendor,mysoc"
>
> Then you just apply the overlay and it overwrites the incomplete
> compatible. That works with existing overlay applying (overwriting)
> for multiple steps as long as each step is a superset (compatible
> list) of the prior steps.
>
> In Doug's case, I think you need code to decide which base to pick and
> then fixup the final compatible.
>
> SoC (incomplete) compatible: "socvendor,mysoc-rev1", "socvendor,mysoc"
> Board overlay compatible: "boardvendor,myboard-rev1",
> "boardvendor,myboard", "socvendor,mysoc"
>
> And then after applying, you do the merge to insert the SoC rev compatibl=
e:
>
> "boardvendor,myboard-rev1", "boardvendor,myboard",
> "socvendor,mysoc-rev1", "socvendor,mysoc"
>
> You need SoC specific code to know what SoC revision you are running
> on, so SoC specific post apply code should be fine too. There's not
> any existing bootloader problem because you need code to handle this.
>
> Maybe that fixup will end up being generic enough that it's not
> platform specific, but that's an optimization of the implementation.
>
> > Is there really a need to merge the compatible strings in your case?
>
> Well, you could just require duplicating an overlay N times for N
> bases, but that doesn't scale

I'm actually OK with deferring the "pluggable SoC" problem for now.
Even for the Google Pixel team, it's a bit of an edge case. If we have
to solve it by duplicating "dtbo" files for socketed boards (or any
board which could have more than one SoC) that's probably OK for now.
Once other problems are solved, we can perhaps come back to the idea
of merging compatible strings and/or other properties.

In v1 of my Pixel 10 series I wasn't even trying to support multiple
SoC revisions, I was just trying to look forward to the future based
on what I saw downstream. ;-)

If I drop the idea of merging compatible strings and just duplicate
the "SoC" parts of the compatible in each of the overlays, then do we
have something that's landable to get things off the ground? I think
Krzysztof will still NAK my base "dtb" that represents just the SoC
since it's not "complete". I certainly wouldn't want to just steamroll
over his concerns. Krzysztof: Do you have any thoughts? Do you
understand my goal here and agree that it's something worth solving?
If you don't agree it's worth solving, would it help to hear more
people express their interest in a solution? If you agree it's worth
solving, can you provide a suggestion for how we can move forward?


> > I
> > think in the vast majority of platform identification cases, code only
> > cares about matching the most precise string (i.e.
> > "boardvendor,myboard-rev1"). If we do feel like having the whole chain
> > of identification is necessary, it could be achieved by just
> > copy&pasting the extra strings into the overlay file. If we have
> > cross-validation between base and overlay source files we could also
> > have the validation check that the overlays correctly contain all
> > compatible strings from their base tree. If we know that the base
> > trees aren't standalone anyway, we could also just invent other
> > property names that identify them (e.g. `soc-compatible =3D
> > "socvendor,mysoc";`). Anything other than breaking the overlay format
> > would be preferable in my opinion.
>
> There's also a use case I'm aware of where the base DT is just for a
> SoM and then the bootloader applies an expansion board overlay. So it
> is not always "not standalone". And of course, this could be combined
> with what Doug wants to do.
>
> Note that for any new property (or an incomplete compatible) like
> soc-compatible, you will need to consider how we validate it.
>
> > I also feel like we need a better standardized way to tie base device
> > trees to overlays, like your `/loaders` node proposal in an earlier
> > email, although maybe that's an orthogonal discussion (but related,
> > especially if there's supposed to be cross-validation between base
> > trees and overlays). The compatible string is just not a scalable way
> > for bootloaders to make this determination, there may be a lot more
> > differentiation than just "SoC" and "board", and the scheme almost
> > certainly needs to be platform/bootloader-specific because every
> > hardware vendor has their own ideas about how to group and reuse parts
> > of a platform. This information doesn't necessarily need to be *in*
> > the device tree, it could also just be in a separate YAML file in the
> > same repo (since bootloaders will almost certainly want to have it
> > transformed into their own out-of-band descriptor at build-time
> > anyway, so that they can compress the device tree itself and don't
> > have to decompress each one for matching), but it needs to be
> > somewhere.
>
> There is a proposal here[1]. It's simple, but I do wonder if looking
> at the root compatible only is too narrow of a view. An overlay could
> target a connector compatible for example.

Yeah, I'm still not really a fan of that proposal. I think different
loaders are going to need different information to know which overlays
to apply, so we need to define "yaml" files for different loaders and
define the formats for a few different loaders.

From a validation point of view, I'd imagine we'd want to (if
possible) validate all different combinations, but (if it's
well-defined in a binding) we could potentially include rules in the
kernel that understand different loaders and could come up with
different things to validate.


-Doug

