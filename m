Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90242CD8CAE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 17:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WtyftZQVY4swvTgixLURevtyRejq31WTYbhe23ooHsw=; b=fyErW4bnQ7JjInMQikIT9VFqVt
	5P5HQK9Xgr+8QVIxwgxwaEsWB88s8EMGqWkNB53jB+rdkjTnKrVDTk4Lmz83owAlBQ8PsjX1+HPXR
	52A9A3NO3wTQhTaCsVn6LBamQvlyaYt+K96P/NMRIcJdS6nuejerynKesPiScIa+kLBYWd3KX3pvr
	47+c7zfAbAqVc7wEB4WfA2O3jXHLs8et0IprtbF0vyJo2JBxNTHV4sk6sOhrAz9SWTRzdbLF0zYCg
	687EyDz3x0dUUd+2Xt2wFaBZwShsHIaTg37NEU7GFiRBKeRWJnzSmtSF/M69oqm5xqmHgVJpFDkkH
	xSLc1ifw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJavs-0000000Aqyq-1fm7;
	Thu, 13 Nov 2025 17:16:28 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJavq-0000000AqyP-1UQ6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 17:16:27 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-64198771a9bso1988722a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 09:16:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763054180; x=1763658980; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WtyftZQVY4swvTgixLURevtyRejq31WTYbhe23ooHsw=;
        b=RuaNvWulKE1pzcLSNu6OBES42ay0IbERDMrVg7GMd1WIUj8aRlEeoR9A93s/g1IMYD
         JNK9c8b3LkWOrGW5CdPXb2QXaK3xUFSsFJrVxxMHWF1+VhaPfZhDTdq2ON0eWLC/Q9Cr
         FIZjv3bZTjPY4EvrBxDitOYoBa9MUJ78Two7w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763054180; x=1763658980;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WtyftZQVY4swvTgixLURevtyRejq31WTYbhe23ooHsw=;
        b=qwiuGO16ebsj7z+5itRIKUwJvu+EglPlasMTviXE+8RabXL/rRXpeZlefp2MKY6JQX
         Yn4sNliSRfv+6YUnh8aHX8DSUTl0zHgxd6lEcau52NIOfFp2ZqgA1LpqP1uXPlYiaaIN
         J8zvLcOfswH8dRltdpGVXRTMHZWwnmx6KHL2uhy6sJ2Rwh4q8jvoMpOuTez09vt1DPm5
         XubwoLk1jJHveOen36A8zGUNP0niaIN9bOxxmvVMAElWbDAxSiyYkS3NlwJX8o/NeTwW
         mUMU6OZm67xBXW/+VuqhOfom+jxXuqyg2kaD5olVt4OV39svFwipmOAVZhpNVgDWuIAo
         uVtw==
X-Forwarded-Encrypted: i=1; AJvYcCUb002nfT0WX8FWQgSZM1UzGBv0OcZAwGH+bl+Xz6ZgxJM+kZaupwWaGvX1IqibrViNwZwB5Lwm/KNUBjOCtoKU@lists.infradead.org
X-Gm-Message-State: AOJu0YxHK2jKHtYiz/ho0bwn3gzbR/F7PXTfzvFICaTlHuyU8sSfji81
	5oVNjtgr9bj+1A3/NQsZjvgZS9A3KD9v2ZsuAp4dYHHxETBzArCxCDstaqmTj3ktOQDcr4fFdAw
	fzMoqLBo/
X-Gm-Gg: ASbGnctuLOZfag7+/FW+3R5p+GONRcw0nCVsN+bQvrWdyxvlXgeaxdX3mgHnX4kmITB
	8VVm0PNjcnzhSx94Ky9hgZNTuFz6bA8Iogxb84qce8EHns3zHdxHZ/dWHKKwGkBFhQa2NpSjeRu
	XWuuE3ebHNatDaagx+sUoHbg7fSZJlDskU6tLXUV4QXe+XMwtmHNPipZJ5DMO6SFqlwimGJtv3G
	ff0aGBi/bZ2/VPsEI1s6NlkBNtmatmIY9wscK0+DdeL6Fjqb39WCP7CHPhUoKzUlg8c7GalekSq
	dhCIJ6W7qIq6yH3La1Z7vYxInaB7Ps0gOlF/3K9p8UfD+iY+a3Dny81t9pxcgYa3aaux5YO1dwR
	Le+5D8OBbcycXgWoE6z32JRylcCqlSJ5fgFRXoBPybiuoeFVNLxqR6zRG8w4bQdHXHJls2A+cJx
	s3NQqWtJqAKchVpQLaomjs27CxTE/EF/40yeJjcdxWYmypWhUQFp07aCgeyT2w
X-Google-Smtp-Source: AGHT+IFCydM0ZrmDxDtFwlsXq9EcgVABqfwIjmcyL70IkCcFcblbNOM3I1w7ZNcToZjLmH+8yAJ5bw==
X-Received: by 2002:a17:907:7fa9:b0:b72:decb:f868 with SMTP id a640c23a62f3a-b736789cebamr417766b.2.1763054179905;
        Thu, 13 Nov 2025 09:16:19 -0800 (PST)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com. [209.85.221.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fd8099asm203805966b.43.2025.11.13.09.16.17
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Nov 2025 09:16:18 -0800 (PST)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-429c8632fcbso815990f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 09:16:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXV4T93HALeQskLaqxsuFgnQ8kaFEnLsBA3Ik3zRX/OWLAvnsDsKZ0WBrTfmh5yFUmdFRqQ7f7xxSpw1oD8Yof9@lists.infradead.org
X-Received: by 2002:a05:6000:4008:b0:429:c54d:8bd3 with SMTP id
 ffacd0b85a97d-42b59384951mr167096f8f.53.1763054177127; Thu, 13 Nov 2025
 09:16:17 -0800 (PST)
MIME-Version: 1.0
References: <20251111192422.4180216-1-dianders@chromium.org>
 <20251111112158.1.I72a0b72562b85d02fee424fed939fea9049ddda9@changeid>
 <05c833f0-15bc-4a86-9ac4-daf835fe4393@kernel.org> <CAD=FV=XXWK9pmZQvNk6gjkqe6kgLXaVENgz0pBii6Gai7BdL-A@mail.gmail.com>
 <00ea821c-5252-42cb-8f6f-da01453947bd@kernel.org> <CAD=FV=VSxeKgGcsRb9qiXq7nsbOWZjPvzmGEOhFA+pmABWdknQ@mail.gmail.com>
 <6490f20a-2492-4ee0-8f34-d529e0df0bad@kernel.org>
In-Reply-To: <6490f20a-2492-4ee0-8f34-d529e0df0bad@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 13 Nov 2025 09:16:05 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Us7SU_OifVkS4mdfVhc=xGYSBiBpBk9aA1Ki0y+iYBpQ@mail.gmail.com>
X-Gm-Features: AWmQ_bkZ_nOTQudV33wGWWwO5Hz7EB8FByvmJpxXsQ9PqvC8-S17wTHTwbtZyow
Message-ID: <CAD=FV=Us7SU_OifVkS4mdfVhc=xGYSBiBpBk9aA1Ki0y+iYBpQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20251113_091626_448722_FB7E4E17 
X-CRM114-Status: GOOD (  48.82  )
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

On Thu, Nov 13, 2025 at 8:34=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 13/11/2025 17:23, Doug Anderson wrote:
> > Hi,
> >
> > On Wed, Nov 12, 2025 at 11:23=E2=80=AFPM Krzysztof Kozlowski <krzk@kern=
el.org> wrote:
> >>
> >>>>> +      # Google Tensor G5 AKA lga (laguna) SoC and boards
> >>>>> +      - description: Tensor G5 SoC (laguna)
> >>>>> +        items:
> >>>>> +          - enum:
> >>>>> +              - google,soc-id-0005-rev-00  # A0
> >>>>> +              - google,soc-id-0005-rev-10  # B0
> >>>>
> >>>> SoCs cannot be final compatibles.
> >>>
> >>> Right. I talked about this at length "after the cut" in my patch. See
> >>> above. I wish to relitigate this policy and wish to know more details
> >>> about where it is documented, the reasons for decision, and where the
> >>> boundary exactly lies between something that's allowed to be a final
> >>> compatible and something that's not. I made several arguments above
> >>> for why I think the SoC should be allowed as a final compatible, so i=
t
> >>
> >> Because this represents a actual device users run. It is electronicall=
y,
> >> physically impossible to run the SoC alone.
> >
> > I'm not convinced that this definition is as clear as you're making it
> > out to be. It's physically impossible to run many "boards" alone.
> >
> > Want to boot up a Raspberry Pi? Provide it with power. Hook up a
> > display to it. Hook up a keyboard to it. Plug in an Ethernet cable.
> > Plug an SD card in it. Without those things it doesn't run.
>
> But I can plug them...

I can plug my lga SoC into my dev board too. My dev board literally
has a place for me to drop in the SoC. I unscrew the socket connector,
carefully make sure that none of the balls of the SoC have dust
particles on them (and we have instructions for cleaning the SoC),
then drop the SoC into the socket (ideally using a vacuum pen tool). I
then screw the top back together which uses compression to attach the
balls on the SoC.

Yes, this is only true on dev boards and not phones, but we want to be
able to support dev boards too and it would be silly to have a
different split between DTB and overlays for dev boards and phones
that are based on the same architecture.


> > Want to boot up a lga-B0 SoC? Hook up power to the power pins. Connect
> > a MIPI panel to the MIPI pins. Connect a UFS chip to the UFS pins.
> > Without those things it doesn't run.
>
> These I cannot plug, it's impossible for me.
>
> My clumsy fingers are too big for these pins.

As per above, sockets do exist. They are pluggable. I have confidence
that even with clumsy fingers you could drop the SoC into the slot and
screw the connector down.

I'm still not totally convinced that it should require the existence
of a socket to justify this but, yes, they do exist.


> And following your logic, we should have the compatible for the
> transistors, because that's basically what SoC is made of.

My logic (stated later in my email) is that the minimum requirement
for a compatible should be something with a CPU able to execute
instructions. A single transistor can't do that. If you want to
combine a bunch of transistors together to make a CPU then absolutely
you should be able to have a DTB representing this CPU.


> > Yes, the complexity of just "hooking up" the components on an SoC is
> > an order of magnitude harder than a Raspberry Pi, but it's still just
> > hooking it up to external components. In both cases, we are modeling
> > the core "brains" (the part that contains the processor) as the DTB
> > and everything else just "hooks up" to interfaces.
>
> You mix the topics, so I don't follow. I speak here about bindings - you
> cannot have the that compatible alone, because it is incomplete, just
> like compatible for "transistor" is not correct in that context. You
> speak what could or could be DTB, different topic.

A "SoC" is "complete". It has a processor that can run instructions.


> > If I had to make a definition for what the base DTB should be it
> > should be the component with the boot CPU. _Why_ is that the wrong
> > definition?
> >
> >
> >> There are few - one or two - exceptions for the SoMs, but never for So=
C.
> >
> > OK, but the big question: _WHY???_
> >
> > Where does it say that a DTB has to be something that can run "alone"
>
> We don't discuss DTB here, but the top-level compatibles.
>
> Why? Because DT spec says so.
>
> "Specifies a list of platform architectures with which this platform is
> compatible. "
>
> And when you combine it with the standard definition of the
> "compatible", it is not *a* "platform architecture" but *list* of
> platform architectures describing this device as a whole.

I still don't understand why a SoC doesn't qualify for your
definition. Even if it did, there is _no benefit_ from excluding a SoC
from this definition. I'm trying to figure out what the benefit is for
holding to this stance.

In any case, maybe we can approach this a different way that I alluded
to in one of my other posts. Can we just call the SoC thing something
different and make everyone happy?

1. Rename the SoC file to lga-b0.dtf (device tree fragment) and
_REMOVE_ the top-level compatible. Problem solved--we're not adding a
top-level compatible.

2. Add a special node at the top level of the "dtf" file describing it
(so someone could figure it's useful for). Like:

fragment-info {
  compatible =3D "google,soc-id";
  google,product-id =3D <0x5>;
  google,major-rev =3D <0x1>;
  google,minor-rev =3D <0x0>;
  google,package-mode =3D <0x0>;
};

3. We can compile the "dtf" file using existing tools into a "dtfb".
This looks just like a "dtb" but has no top-level compatible but
instead has "fragment-info".

Now we're not violating any spec because we're not adding any
top-level compatible.


-Doug

