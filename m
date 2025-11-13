Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D0F1CD8C96
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 16:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K5wt2b9AIytvZm3PkDsPhENWn/BTbuYs0T0/KW2/iVE=; b=47/tyzUstiWwcvagnPAS/kz6Xg
	ypiyx5tut4dxekjD/lzUzJefPQAOzvdz0lNqiBUhiOUAp6sgJFEs5c7mRSyZImzSxotaOeVEcQXkB
	7/l5Rz6VNW1JCefOCU0zJ4kxCuSF5tFGUmy+z7zfclLPV9OYte3WbNZvrFuyYQjLHQrAypxKg/A1S
	DrM4Mf0mTrQy3ihwEKaZZ6k1ZylWBUGXTYnIMRmjkwC4jq4zMxa2hnD8Box+4Zz3gbNDDu2zusgvD
	qn1Oo8r1CK3hkK0fZ+U8MvGk5zUVTwM11ZqhRcRVo9KMGZmu641O2pl1XFXGDFWB15Xi7HenWC9tG
	SumovHKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJa7K-0000000AnJF-3ur2;
	Thu, 13 Nov 2025 16:24:14 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJa7I-0000000AnIi-0pl3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 16:24:13 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-6418b55f86dso1696205a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 08:24:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763051047; x=1763655847; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K5wt2b9AIytvZm3PkDsPhENWn/BTbuYs0T0/KW2/iVE=;
        b=Svqg+hgNMY5fbXNVv2H4VE8eXoCN6ElnPtGJdRidubeT0uuI7U2jcbzzI07Yjjrzfo
         jypeE6QcxgEP9hsp0qQfTKH5CuMFRMglA9kmAxOtUAD7g1iJssFOqBufH95BkXVKdNBt
         fPxqI+Wnr/X5hx8RIduCBqOBD4+9oFsUB+hAc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763051047; x=1763655847;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K5wt2b9AIytvZm3PkDsPhENWn/BTbuYs0T0/KW2/iVE=;
        b=wrzNy1WuwkJan92metFFeFnyJxcjDnZ5p/pWpZhEoKF1JDxPtDFd/vpcoan2nEjc0k
         Hc4u1cmIFO1xowJIEEk456rIrMBcQEzcZ2AFQXud4nPA4lgtFqIi6k3+COZNW9tT9vXW
         EUabZWAMujJsW+X+9svllTvZVbLiufVZQSI67+ERjp5tYlh6PelA7mtm/OWWa61g21eQ
         oHJosNngMCK7qR8NPYvSd1CLM1O+gU7wNegZeBqaWo7HGepDo3XVQvPSdthfzZOdQjRt
         C6ml8H48RIKdt3+d9ZByKYDqb3ZN7sb/S6f8os78InBzdTpCmlmjGOtDmbt/JGcXfTGb
         Gpsg==
X-Forwarded-Encrypted: i=1; AJvYcCWR2dA19oSht9vaVHK618MqH3KkYSjBLSpO8t9Y51S9CjKu85m223PiuKqAN9F4Ckpt17itFTISnio7uyNYuDgF@lists.infradead.org
X-Gm-Message-State: AOJu0Ywwn7Hl2MiJwlUk0FLcui/4gTKSFU/CWEFzFQ6PhddYKal6DF0N
	JbY3fSuFFPsE+ATxEHoGGXfxhcmE99YdhC1Dz1hN9a7GgRWJUzk338vKLkXQ5WoJMqpg8Rj2kzS
	4oqNb/HzB
X-Gm-Gg: ASbGncue+/lUQpRoCOHWGkOkspni0FqLwD1+OiB0qBTYTievI1DzYVJpXKdO0VoJ9RN
	JqOLqR3ipSQGPO+V72y8MdLBfw/16pL1FWn6Bcw93h+DOsY/K2u9hhY+OlwnpCjldE6wtdiOOjw
	mQvgAfkzTpVDyCm751iEjBxVPuB+tq7uVneAc8hpfo0S8cwsXsG5n29E9pDKOlZnGlhMwqMO9WN
	MT7lltSdMZyJGEoQjdj5yjXk/JzTeQoy0K+B4xRtgxq2YhuRlXeCLDygrSQfjTriAnegmfn7/Qd
	CaWL2fapuu4lC0CDsQ9aYRFi5LcaeTg+xVJ5OthLr79IxnCDbgGyGeeFLBUwdFdT0nagaFOa3KP
	+lp7WYPWYGFM2BhrIPLult5lXh5UI9gpiUImNZnzxaPvAOXJgjzMl6M75/ZQY24WVMKLhRm1VSW
	Xkf04jUP3qOwWsIWDxO3DidPDvbRt9ov9eyKSOKXL1+J7AlHPOyw==
X-Google-Smtp-Source: AGHT+IHh/cNc7DIFq1m8UJfyPiJ+Za6XkI0jGkiAs1OlbSIdo/nrT3LY9Wvl/ULja59p+DcxknIpJQ==
X-Received: by 2002:a17:907:1c1b:b0:b37:4f78:55b2 with SMTP id a640c23a62f3a-b7331b5f2b8mr743372466b.34.1763051046437;
        Thu, 13 Nov 2025 08:24:06 -0800 (PST)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com. [209.85.128.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734ff2615esm190265966b.73.2025.11.13.08.24.04
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Nov 2025 08:24:05 -0800 (PST)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-471191ac79dso11361835e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 08:24:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWTjKMniA9/drCY8G0m822wTPOmAu6d0meaMQ46gBbBnFWHAjwOoVSq5kJZgUA5BX1oxhNFSJ1ly3JSE152cnTf@lists.infradead.org
X-Received: by 2002:a05:600c:350d:b0:46e:32a5:bd8d with SMTP id
 5b1f17b1804b1-4778fe553famr1167935e9.3.1763051043969; Thu, 13 Nov 2025
 08:24:03 -0800 (PST)
MIME-Version: 1.0
References: <20251111192422.4180216-1-dianders@chromium.org>
 <20251111112158.1.I72a0b72562b85d02fee424fed939fea9049ddda9@changeid>
 <05c833f0-15bc-4a86-9ac4-daf835fe4393@kernel.org> <CAD=FV=XXWK9pmZQvNk6gjkqe6kgLXaVENgz0pBii6Gai7BdL-A@mail.gmail.com>
 <00ea821c-5252-42cb-8f6f-da01453947bd@kernel.org>
In-Reply-To: <00ea821c-5252-42cb-8f6f-da01453947bd@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 13 Nov 2025 08:23:52 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VSxeKgGcsRb9qiXq7nsbOWZjPvzmGEOhFA+pmABWdknQ@mail.gmail.com>
X-Gm-Features: AWmQ_bkn8U9vLweoLL7ChsWq65S9_NbSZw7csl7J0f4Er_fIbKu-AjDA18N3giM
Message-ID: <CAD=FV=VSxeKgGcsRb9qiXq7nsbOWZjPvzmGEOhFA+pmABWdknQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: arm: google: Add bindings for frankel/blazer/mustang
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, linux-samsung-soc@vger.kernel.org, 
	Roy Luo <royluo@google.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wenst@chromium.org>, 
	Julius Werner <jwerner@chromium.org>, William McVicker <willmcvicker@google.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_082412_324311_C188D8F5 
X-CRM114-Status: GOOD (  57.01  )
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

On Wed, Nov 12, 2025 at 11:23=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> >>> +      # Google Tensor G5 AKA lga (laguna) SoC and boards
> >>> +      - description: Tensor G5 SoC (laguna)
> >>> +        items:
> >>> +          - enum:
> >>> +              - google,soc-id-0005-rev-00  # A0
> >>> +              - google,soc-id-0005-rev-10  # B0
> >>
> >> SoCs cannot be final compatibles.
> >
> > Right. I talked about this at length "after the cut" in my patch. See
> > above. I wish to relitigate this policy and wish to know more details
> > about where it is documented, the reasons for decision, and where the
> > boundary exactly lies between something that's allowed to be a final
> > compatible and something that's not. I made several arguments above
> > for why I think the SoC should be allowed as a final compatible, so it
>
> Because this represents a actual device users run. It is electronically,
> physically impossible to run the SoC alone.

I'm not convinced that this definition is as clear as you're making it
out to be. It's physically impossible to run many "boards" alone.

Want to boot up a Raspberry Pi? Provide it with power. Hook up a
display to it. Hook up a keyboard to it. Plug in an Ethernet cable.
Plug an SD card in it. Without those things it doesn't run.

Want to boot up a lga-B0 SoC? Hook up power to the power pins. Connect
a MIPI panel to the MIPI pins. Connect a UFS chip to the UFS pins.
Without those things it doesn't run.

Yes, the complexity of just "hooking up" the components on an SoC is
an order of magnitude harder than a Raspberry Pi, but it's still just
hooking it up to external components. In both cases, we are modeling
the core "brains" (the part that contains the processor) as the DTB
and everything else just "hooks up" to interfaces.

If I had to make a definition for what the base DTB should be it
should be the component with the boot CPU. _Why_ is that the wrong
definition?


> There are few - one or two - exceptions for the SoMs, but never for SoC.

OK, but the big question: _WHY???_

Where does it say that a DTB has to be something that can run "alone"
and (most importantly) what benefit do we get for making that
requirement (AKA _WHY_)? This is the question you're not answering.
From Rob's response, he doesn't seem to think that a DTB needs to be
for something that can boot alone and he seems OK with allowing a
fairly flexible split here. Rob's response was focused on making sure
we can do validation and I'd love to continue on with that discussion.


> > would be great if you could respond to them and tell me where I got it
> > wrong.
> >
> >
> >> Your commit msg does not explain what
> >> is 'soc-id' or 'soc_id' in this context.
> >
> > In the commit message I do say: "SoC: an A0 pre-production variant (ID
> > 0x000500) and a B0 variant (ID 0x000510) used in production. The ID is
> > canonicaly broken up into a 16-bit SoC product ID, a 4-bit major rev,
> > and a 4-bit minor rev."
>
> >
> > ...then, I further say "In this patch, put the SoC IDs straight into
>
> That's fine.
>
> > the compatible. Though the bootloader doesn't look at the compatible
> > at the moment, this should be easy to teach the bootloader about."
>
> But nothing explains why this SoC can be run alone without board.
> >
> > The idea here is for the bootloader, which can read the ID of the
> > current SoC, to be able to pick the right device tree from among
> > multiple. I am certainly not married to putting the SoC ID in the
>
> I am not discussing about style of the compatible. I said - you cannot
> have SoC compatible alone. None of above gives any argument for that.
>
> > compatible like this. As I mentioned above, in downstream device trees
> > the SoC is stored in a custom node and I thought upstream would hate
> > that. I also considered giving the `soc@0` node a custom compatible
> > string and adding properties about the SoC ID underneath that and
> > teaching the bootloader how to find this, and I can switch to this if
> > you prefer.
> >
> > If you have an alternate technique for which the bootloader could pick
> > a device tree based on the current SoC ID or you have specific wording
> > that you think I should add to the commit message to explain my
> > current scheme, I'm happy to adjust things.
> >
> >
> >>> +          - const: google,lga
> >>> +      - description: Google Pixel 10 Board (Frankel)
> >>> +        items:
> >>> +          - enum:
> >>> +              - google,pixel-id-070302-rev-000000  # Proto 0
> >>> +              - google,pixel-id-070302-rev-010000  # Proto 1
> >>> +              - google,pixel-id-070302-rev-010100  # Proto 1.1
> >>> +              - google,pixel-id-070303-rev-010000  # EVT 1
> >>> +              - google,pixel-id-070303-rev-010100  # EVT 1.1
> >>> +              - google,pixel-id-070303-rev-010101  # EVT 1.1 Wingboa=
rd
> >>> +              - google,pixel-id-070304-rev-010000  # DVT 1
> >>> +              - google,pixel-id-070305-rev-010000  # PVT 1
> >>> +              - google,pixel-id-070306-rev-010000  # MP 1
> >>> +          - const: google,lga-frankel
> >>> +          - const: google,lga
> >>
> >> So what is the lga?
> >
> > "google,lga" is the name of the processor. I was under the impression
> > that the last entry in the top-level compatible string was supposed to
> > be the SoC compatible string. Certainly this was true in every board
>
> google,soc-id-0005-rev-00 is the soc compatible string.
>
> > I've worked with and I seem to even recall it being requested by DT
> > folks. It also seems to match what I see in examples in the kernel
> > docs [1].
>
> Sorry but no. Writing bindings do not request having two compatibles for
> the same soc in two different, independent (orthogonal) lists.
>
> So it is rev-xyz + google,lga-frankel + soc-id + lga, if you need that
> soc-id part.

Probably not worth continuing to discuss until we can agree that the
SoC can be in its own dtb. If we can agree upon that we can talk about
if we need the SoC part in the top-level compatible and how to
accomplish that. I had a few ideas / suggestions in my response to Rob
that roughly break down into:

* Don't model the SoC in the top-level compatible. Maybe put it in the
soc@0 node.

* Come up with a rule for "merging" top-level compatibles if a base
and overlay both define.

Whatever solution we come up with, I want to make sure it handles our
socketed dev boards where the SoC can be removed and replaced with a
different one.


> >>> +allOf:
> >>>    # Bootloader requires empty ect node to be present
> >>> -  ect:
> >>> -    type: object
> >>> -    additionalProperties: false
> >>
> >> Please keep it here
> >
> > "it" being "additionalProperties", I think? I'm not sure I understand,
> > but let's discuss below in the context of full examples and not diffs.
>
> I meant ect node, existing hunk. Properties must be defined in top-level.

OK, much clearer. Thanks!


> > The best my brain can parse your request, I think you're asking for thi=
s:
> >
> > --
> >
> > properties:
> >   ...
> >   ...
> >   ect:
> >     type: object
> >     additionalProperties: false
> >
> > allOf:
> >   # Bootloader requires empty ect node to be present
> >   - if:
> >       properties:
> >         compatible:
> >           not:
> >             contains:
> >               const: google,gs101
> >     then:
> >       properties:
> >         ect: false
> >     else:
> >       required:
> >       - ect
>
> Yes, actually now I see you could drop the "not:" and exchange the
> "then:else:" branches.

For the sake of clarity, I'll go with this:

properties:
  ...
  ...
  ect:
    type: object
    additionalProperties: false

allOf:
  # Bootloader requires empty ect node to be present
  - if:
      properties:
        compatible:
          contains:
            const: google,gs101
    then:
      required:
      - ect

additionalProperties: true

