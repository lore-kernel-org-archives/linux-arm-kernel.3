Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A27DC44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 16:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RWOXu6Fzc0IzSZb9XCVBSx5nTdI7maBQu0X7nhEWxe0=; b=yQekCiYz1dZTECLi6uZVygQz87
	TK6MR+67KTThATcwdgl1F0/mHwHgr6kAYCSayv/O/X1xdLe2iR9RoYa4hbxyndkyAR4ZMTYe8RhV8
	IMJ1feD7QwYZ3YGZA3ZOCag31Jjt9UfYnwe6hT2X+sR6RD4+La1pedW8WIbUxhiSF4ExmGcFm92tp
	ZfG7bn2UIvOILXRwxYI9elp03n4Z/ltvnbefQc7+2nvmuPfgoNvwl1fxVgEuhrOcGq/S1Fxqw7r6x
	5nZ7Z/RnuIhH0quJE+ZvvgzLku9UJv1y3QRAvbVStQuHSt7pgRB7vg1WzpOUzP5guJrLQg40QHloU
	8jevKmaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk2nf-0000000FVPz-3jLj;
	Wed, 15 Jul 2026 16:49:35 +0000
Received: from mail-vk1-xa2a.google.com ([2607:f8b0:4864:20::a2a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk2nd-0000000FVPb-17Xz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 16:49:34 +0000
Received: by mail-vk1-xa2a.google.com with SMTP id 71dfb90a1353d-5bfa99f8ef8so568170e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 09:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784134172; x=1784738972; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RWOXu6Fzc0IzSZb9XCVBSx5nTdI7maBQu0X7nhEWxe0=;
        b=Mh//1cXm2J/FPl7luqn5u55VMN/8SdGDLcZqjVHbZh2bAbHT4NSgsaaZfkPBFqPnpn
         +JsmsjumL5UtMQ4g9vdG7TNra2S6mJhneL7mPq4w/cYH4DMyaoX1ozExstw1mqxeu5KZ
         /xLr4C8v5RBJq9S6xrWGEVSfk9BqzMuzFJnC8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784134172; x=1784738972;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RWOXu6Fzc0IzSZb9XCVBSx5nTdI7maBQu0X7nhEWxe0=;
        b=E03WTvPPkYkE3nJgOw+981attVmeBXmcNvDopEkO1JbjBeonBx/lPyEaWZa8MkZYbl
         u/a/1NPyXWMd2StpmwaLXlY09BAPbxA1AseMoqcsSiAG1sQP7tD14aLxATBgZjHpEQGm
         kRzMiE3Y2asSCHYFu0oijpMxGp6y8OG5CDrCpfDS6VWVQ+q3K07P6fmpnxhIYTYiyB8E
         qL7XBCi08EgDATzceJc54dzPqT6Ku7fvmzBLLHb9CbFsGm/2MJeV/XLtiN6aISEBUhQ1
         LyBuIYdi62rOSv7B2mU4J++KBqbjnn6/MKXqu25xLHCNjTdC71S2WROaBLQkqPMd1foR
         lr9Q==
X-Forwarded-Encrypted: i=1; AHgh+RryarlIKNUuyNW1XddPxHG07rvm3GxHx8pA1vyJZzWuur7ltV4WFVJ1hQEFB6BT6fv6eT/lhw7B/4Nh8d2foCiY@lists.infradead.org
X-Gm-Message-State: AOJu0YyqBqWc0Ww7TfRo38zn6IIzfg4GFk38FE4LcOGYdXEKy8WwTvgr
	7KmX8kOJI2pN6LOoNtZi8dGehTlPD2yQq3GkZ7cv0jYo920LF5/dBa7mgRiUwguUl+i+WN7VED0
	k08s=
X-Gm-Gg: AfdE7cmYFEczDqImSScn5fj/CMfCBqM3sMtZTicNoky7ntVCU8dDg7gWUSTBvAbL8G4
	uFjksmZCFLLc46BVAak2dVkDaKEJKUxWVZmLjgCdPmFEbQcyWU9K9RZqfpqHeDmUUeFUBvr7i5X
	B+C8tK8Z+QnHC1OZlVcaT4+6UPRd2tIC0grH9MVXk0MSMZUfQrxCInO8vfTHtxcjK7xO3rTqlmI
	vxBs4mHlMhWd1R+tvyEPPvvSczJBas1It5uGIYkXCOrqTbrG3EHZTtq04j7jXkm7QGNUe4gf5Ir
	CPE+UFAtBLoK0ySrXsNGQWYYTK2deKfCWm67pdcTcmsKkYOI7DQpXctTmEvYwVPbEjx0WoojTGe
	4P6hqGaY3IfGGjKykJW28w++OxotiQeHiCP7bm1oX4SJXxFHtg9u7FHWtuQjN/0p5Imgyj1fZ4J
	NujeZb5jaSVkEKqZ7jrIuTO2a8OQEXHpIyXisyP/q31/6c9FKR49qpnOYYQOVWxbYC3Q==
X-Received: by 2002:a05:6122:1797:b0:5a1:b296:78fc with SMTP id 71dfb90a1353d-5c1372edf21mr124154e0c.1.1784134171526;
        Wed, 15 Jul 2026 09:49:31 -0700 (PDT)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com. [209.85.221.174])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bfbc09a065sm8950908e0c.5.2026.07.15.09.49.27
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 09:49:27 -0700 (PDT)
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5bfc54558d5so2250451e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 09:49:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rr4JDN2IcS7U9RvlyNx/pIncR8dmNXdiVCelldQk1QBZBWlcjr9aHUbcwETt7F0a1yBYp2DXwZ9QB3WnlpuT1ek@lists.infradead.org
X-Received: by 2002:a05:6122:4d15:b0:5bf:7812:3e4a with SMTP id
 71dfb90a1353d-5c1372dab1dmr154635e0c.2.1784134166272; Wed, 15 Jul 2026
 09:49:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260714222338.2965707-1-dianders@chromium.org>
 <20260714152138.6.Ia186a29119b4b5c409815b755e0c2c3965b0495f@changeid> <8e3025c5-16a0-40d7-affa-098ca37699c7@kernel.org>
In-Reply-To: <8e3025c5-16a0-40d7-affa-098ca37699c7@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 15 Jul 2026 09:49:14 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vrd9AxO-NY_CP2h+f21qt4uGY2pOoFgacV+G5bnfd32Q@mail.gmail.com>
X-Gm-Features: AUfX_mwK6webxeT7JT0ytuEP2uAbvjNKVShoZc5WhE6zMIAHOXS5JrDgWdomMxQ
Message-ID: <CAD=FV=Vrd9AxO-NY_CP2h+f21qt4uGY2pOoFgacV+G5bnfd32Q@mail.gmail.com>
Subject: Re: [PATCH 6/7] dt-bindings: mailbox: goog-mba: Add goog-mba mailbox bindings
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Joonwon Kang <joonwonkang@google.com>, 
	Subhash Jadavani <sjadavani@google.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Lucas Wei <lucaswei@google.com>, Brian Norris <briannorris@chromium.org>, 
	Peter Griffin <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_094933_354963_E4671FA4 
X-CRM114-Status: GOOD (  32.28  )
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

On Tue, Jul 14, 2026 at 9:51=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 15/07/2026 00:21, Douglas Anderson wrote:
> > Introduce bindings for the MailBox Array IP block present in Laguna
> > SoCs (AKA "lga", AKA "Google Tensor G5").
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> >
> >  .../bindings/mailbox/google,mba.yaml          | 216 ++++++++++++++++++
>
> Filename must match compatible.

Whoops! Will fix in v2.


> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - google,lga-mailbox-array
> > +      - const: google,mailbox-array
>
> Don't use generic fallback. Just the SoCs.

Sure, if you insist.

In general the "mba" hardware is designed with enough identification
registers that we should be able to autodetect which variant we're on.
Thus, my hope is to not ever need to reference the SoC-specific
variant in the driver itself. It's not the end of the world to use the
"google,lga-mailbox-array" as the generic, I guess...

I don't suppose I can change your mind here? If we take
"google,lga-mailbox-array" as the generic, then going foward a few
generations we end up with:

properties:
  compatible:
    oneOf:
      - const: google,lga-mailbox-array
      - items:
          - enum:
              - google,next-mailbox-array
              - google,nextnext-mailbox-array
              - google,another-mailbox-array
          - const: google,lga-mailbox-array

If we keep "google,mailbox-array" as the generic, then going forward a
few generations we end up with this, which seems nicer / less
confusing:

properties:
  compatible:
    items:
      - enum:
          - google,lga-mailbox-array
          - google,next-mailbox-array
          - google,nextnext-mailbox-array
          - google,another-mailbox-array
      - const: google,mailbox-array

Sure, it means that if someone unexpectedly makes a new Google
mailbox-array that's totally incompatible then the
"google,mailbox-array" sounds too generic, but that doesn't feel like
the end of the world. You could call the new mailbox array designed in
the year 2037 the "google,2037-mailbox-array" and things would overall
be less confusing than using the "google,lga-mailbox-array" as the
generic.


> > +  reg:
> > +    minItems: 1
> > +    items:
> > +      - description: Host registers (not accessible to client)
> > +      - description: Global registers (not present on newer IP blocks)
>
> You have only one SoC. One SoC has only one IP block, no?

Nope! There are several instances of the MBA IP block per SoC. I tried
to explain the situation exhaustively, but there's always the tradeoff
between explaining thoroughly and providing too much text.

To answer this specific question concretely, there is one MBA per
remote processor. Looking at the downstream DTS, I see at least these
MBA instances:
* AOC (Always On Compute)
* GSA (Google Security Anchor)
* GDMC (Google Debug Monitor Core)
* CPM (Central Power Manager)

Each of these 4 MBA instances has its own "global" registers.

To provide more context, each MBA instance can support communication
beyond just the AP (Apps Processor). For instance, the AOC's MBA
instance could be used to talk between the AOC and AP and also between
the AOC and CPM. Let's take this as an example. In this case:

* The AOC is the "host" of this MBA.
* The AP is a "client" of this MBA.
* The CPM is another "client" of this MBA.

The AOC is the only one with access to the "host" registers.

Everyone (AOC, AP, CPM in this case) has access to the read-only
"global" registers describing the MBA instance.

The clients have access to several banks of client registers, one per
mailbox they can access. The host (AOC in this case) also has access
to the client register spaces since that's where the shared message
memory is located.

The overall MBA instance is best identified by the address of the host
registers, even if the client (the AP in this case) can't access those
registers.

On newer versions of the IP block the "global" register bank was
removed and the read-only registers that were part of it were simply
copied to each client instance.

Does that clarify?


> > +
> > +  ranges: true
> > +
> > +  "#address-cells":
> > +    const: 1
> > +
> > +  "#size-cells":
> > +    const: 1
> > +
> > +patternProperties:
> > +  "^mailbox@[0-9a-f]+$":
> > +    type: object
> > +    description:
> > +      Each sub-node is a single-channel mailbox.
>
> This does not look like correct representation. You have one mailbox
> controller with multiple mailboxes, not multiple mailbox controllers of
> single channel boxes.

I spent quite a bit of time debating this when rewriting the driver.
While we could certainly hack things into the existing "mailbox with a
bunch of channels", IMO it would be a worse representation of the
hardware.

I discussed this in the wall of text in this patch series, but
re-hashing it here:

Each "mailbox" in the mailbox array is more like a full-fledged
mailbox than a channel within a mailbox. Each (single-channel)
mailbox:
* Has its own client register space.
* Has its own interrupt.
* Can have a different amount of memory for messages.
* Can have its own conventions for communication.

If we tried to represent the mailbox array as a single mailbox with a
bunch of channels, each instance would have a different number of
"reg" entries and a different number of interrupts. We would also need
an array describing the communication conventions for each channel.
Can it be done? Yes. Is it ugly? Also, yes.

Further evidence that the hardware design intended "a bunch of
mailboxes" rather than "a mailbox with channels" is that the IP block
is called a "mailbox array". ;-)


> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +
> > +    soc {
> > +      #address-cells =3D <2>;
> > +      #size-cells =3D <2>;
> > +
> > +      cpm_ap_ns_mba: mailbox-array@5240000 {
>
> Drop all unused labels.

Sounds good.

