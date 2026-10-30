Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6431C606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 23:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1SSBKKOz;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=PH8PPoSa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=uYpqsAQ9OY9DsYZMcCG2ZubulWPZAxVNHKqjmPqUy7A=; b=1SSBKKOzRP3CMI
	u4N9yMfZKtquHaD3jYeKXQHLt6qJIrbzbTbPfaYP4nsCwSPvoRgZWTYB596/PQ+goo6/MTPFkHNyh
	LYFjGC47imFKoWTy+QIcn9iLPjjFXOCVIM6G6nzYlUSCwvFuUMiskRD4ecDB3UAYZZiQSii3etUh1
	gKW3TA+Ihmn3nDTvKk1Ag/oTq2Yw2biXb1aOaa/nYRMzkzVwl5+BA9icblcYwvrYxEy5IFRvZUUnu
	D9p52WjP7fxOe+KIyyUwPCcB5pNGHZj1oeRjEWexKMMGoIYjVuxCRpI0eI6qdkaoA8vzJwscbmUP0
	4/sCmdObY+OaR8zEcL5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMw6h-0000000CjUR-0Xxu;
	Fri, 30 Oct 2026 23:33:59 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMw6e-0000000CjSy-2NYU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 23:33:58 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-c40e02b2ebaso207074566b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 16:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793403234; x=1794008034; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uYpqsAQ9OY9DsYZMcCG2ZubulWPZAxVNHKqjmPqUy7A=;
        b=PH8PPoSaMq9894jeDch3mkYhMnkjNXHu9eh/og+UMycbkues7nyW45x9mh/Y1YF/jm
         2fOidXZmDI02lVFerLa7Ow5zuReKw1lgtf6PmPT8slsVsKMhqoqPoBKTh/Cxt2r03ic6
         SrLEBcKIDJXPuk1l+PrRFuJnvU/EZThifJLV4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793403234; x=1794008034;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uYpqsAQ9OY9DsYZMcCG2ZubulWPZAxVNHKqjmPqUy7A=;
        b=MvSzLhXYnHUqz18QE9fkczrd2QOV3c9FeZUlnFPKYxaPKJpbfJJqZKxQSjZmDfNUuj
         F7raM+fXGbH0Rz6b4BpYDVR0pJvi0mdvzqNCcKPtIFOLqRlyUB6vv3IHedlcKA6RMS2E
         vNY33xblXHTamgUvEaxTjj+fk67s3/BkTm0g5akEK7AY/E+pvIjcyGOcUPFYGuAIgx3h
         yUiiLstsHZeXGmVMYRHIM42NzPwXJg9EbIR9s3DiCJzNDJt+hgQl/yDWLuBhLN5z0H8R
         ZIS8b0UL8PTkmnmUHuYwnL2jqSMbaUGsJbU/NktKu9i7a/ql3tprchqjCX3KDNCOslf7
         b2eA==
X-Forwarded-Encrypted: i=1; AKwUvBzIKmWLwfq3QdXUAliPGb6b+h0RgdpkRHkJtZzXtaxKPBXyIecIUFQbzUycjSjcHzjdHtmu3e7Z8I+SGjXz4rUc@lists.infradead.org
X-Gm-Message-State: AFq9FYLf5waZysfKAAkGdf0a7GiYUq+yUj07nkHNPeGrgzmfV5W629oT
	DWL6FK53xGrtFpRYIPU8PrH6EbJMEMIM/pOBsdq04W41WadwBZ0sT1zpMIkneOyK3TJPGRHRoqP
	2/kDfSA==
X-Gm-Gg: AYBFou0uVUtc3WJvCHKwSoMi2ElgvNkoOGvfH2tjNXm4sw4WhGJxHA5q3OI7yTZeUIE
	qs6IjNTNbQQgojfyJ0wtN0mqpR4VbqeRum/K35NALRXj8y8Y3Tks9slu+Q4q+CQO2X+LhTP6N5C
	wauT2hSxLMCb05cIJUSc1eHpznHsj7+2l1L3D8bYA0zFjW4+ST2ZamUyYaH1guLHOmOjUeOxAno
	RgsjTYXO68r/4HqHUOoxNrXHgd9L252hKa1nNm0rh1lMA5sgrENfwi0Hc/vqgww+Hbqb4laCY2r
	SJ8R0FaOErJCvN2Az8fw9dG5jPS8HXp3M412QmGjLv4/VPnTx621iN4Ph+NsV7Kr/5k5N3y3LyD
	Ki1i6UD5jnjl1/5HCLgtMC2YtTzY5yJZ+KcGlrqRIVrWIV0TD2Sz7BYBiub3W6VrnVYpch+9t64
	n2myhTW3GBMq3rYriTCJACvtrbfIHjF0jm8F8gTsriENODLjGr9/LJVdPH30Rvv9iPHzjdDF4W/
	mywp11Aut0/SCcGDwd1f6O/MU8hl70uv+MVGUVi1Zd9ud0BFxQcJwhDnFz2qk9KSoYXFHVjxJwO
	Lo+LfDk5K3Lmt3VAZXb8fmhDkjiWqDZm1WtvLNiZB7ItcOUDIaMVxuMtFBEnpRCo2txn
X-Received: by 2002:a17:906:c142:b0:c42:2f4e:522a with SMTP id a640c23a62f3a-c4ca7a5077emr326297466b.25.1793403234068;
        Fri, 30 Oct 2026 16:33:54 -0700 (PDT)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com. [209.85.221.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabe0f37esm118558366b.33.2026.10.30.16.33.51
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 16:33:51 -0700 (PDT)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48df4e9d2d4so674513f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 16:33:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBysoAiMf6SxDaZxd+DOsxfRGEato5D+a55Ix9KuFJbX+mYe1YbCP1Bf/atb73sWIgfhQx/6gssWN1bxnuTY6Szn@lists.infradead.org
X-Received: by 2002:a05:6000:2f84:b0:48b:69d4:bb35 with SMTP id
 ffacd0b85a97d-48e6e2eb71fmr8424199f8f.12.1793403230649; Fri, 30 Oct 2026
 16:33:50 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261023235408.3063350-1-dianders@chromium.org>
 <20261023165211.v2.3.Ia186a29119b4b5c409815b755e0c2c3965b0495f@changeid> <20261030-terrific-quartz-bumblebee-e36da1@quoll>
In-Reply-To: <20261030-terrific-quartz-bumblebee-e36da1@quoll>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 30 Oct 2026 16:33:38 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U2tEe53B4AmmkWTZvqvBDNN7K8Q+o+3PHoNuQnfS73sg@mail.gmail.com>
X-Gm-Features: AclHuK-AIJt-7HpT3-PstezQbN3lpub-bPABaJI-gDK7o3ghrvyRXOTdOvBTJG0
Message-ID: <CAD=FV=U2tEe53B4AmmkWTZvqvBDNN7K8Q+o+3PHoNuQnfS73sg@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] dt-bindings: mailbox: goog-mba: Add goog-mba
 mailbox bindings
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Joonwon Kang <joonwonkang@google.com>, 
	Subhash Jadavani <sjadavani@google.com>, Peter Griffin <peter.griffin@linaro.org>, 
	Lucas Wei <lucaswei@google.com>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Brian Norris <briannorris@chromium.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_163356_720536_99C33CD8 
X-CRM114-Status: GOOD (  34.16  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On Fri, Oct 30, 2026 at 3:48=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Fri, Oct 23, 2026 at 04:52:20PM -0700, Douglas Anderson wrote:
> > +properties:
> > +  compatible:
> > +    const: google,lga-mailbox-array
> > +
> > +  reg:
> > +    minItems: 1
> > +    items:
> > +      - description: Host registers (not accessible to client)
> > +      - description: Global registers (not present on newer IP blocks)
>
> That's still confusing. Last time you said:
> 1. You identified 4x instances of MBA
> 2. Each of the instance has global registers (quotting: "Each of these 4
> MBA instances has its own "global" registers."), then why does the
> binding say otherwise?
>
> You repeat here again "newer IP blocks" so how many versions does your So=
C have?

In v2, I'll remove the "(not present on newer IP blocks)" part and
remove "minItems: 1". Both Pixel 10 SoC (laguna or lga) and Pixel 11
SoC (malibu) have the global registers. Newer (unreleased) SoCs lack
these (read-only) global registers and all of the information that was
in them is replicated in each mailbox's register space. There
shouldn't be any harm in making them both required for now and we can
make the change later.


> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +
> > +    soc {
> > +      #address-cells =3D <2>;
> > +      #size-cells =3D <2>;
> > +
> > +      mailbox-array@5240000 {
> > +        compatible =3D "google,lga-mailbox-array";
> > +        reg =3D <0x0 0x05240000 0x0 0x00010000>,
> > +              <0x0 0x05250000 0x0 0x00010000>;
> > +        ranges =3D <0x0 0x0 0x05260000 0x00020000>;
> > +
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <1>;
> > +
> > +        mailbox@0 {
> > +          reg =3D <0x0000 0x1000>;
> > +          interrupts =3D <GIC_SPI 250 IRQ_TYPE_LEVEL_HIGH 0>;
> > +
> > +          #mbox-cells =3D <0>;
> > +
> > +          google,tx-payload-words =3D <4>;
> > +          google,mba-queue-mode;
> > +        };
> > +
> > +        mailbox@1000 {
> > +          reg =3D <0x1000 0x1000>;
> > +          interrupts =3D <GIC_SPI 251 IRQ_TYPE_LEVEL_HIGH 0>;
> > +
>
> Please make the example complete. Last time you wrote:
>
> "If we tried to represent the mailbox array as a single mailbox with a
> bunch of channels, each instance would have a different number of
> "reg" entries and a different number of interrupts."
>
> and I do not see that. I see each instance having exactly one reg entry,
> exactly one interrupt with difference in RX and TX.
>
> The DTS here:
> https://lore.kernel.org/all/20261026144346.1.Iaf8214205f496225013f482f6e0=
035e89ac624f2@changeid/
>
> has the same.

OK, sounds good. I can give more examples. That being said, I'm having
a hard time finding a great example that _proves_ that this shouldn't
be a single mailbox with a bunch of channels. Specifically, although
the hardware itself is fairly flexible, the current firmware running
on the remote processors isn't taking advantage of all of this
flexibility. That being said, it is not far-fetched that this would
change as more users of this IP block emerge. This IP block is used
_heavily_ in Google designs.

Really, I think my argument for describing things this way comes more
from looking at the hardware register descriptions than from looking
at the current users. I think modeling the bindings to best match the
hardware design is the right approach. Let me see if I can give more
details here, even if they don't translate well into examples...

Let's start by looking at the CPM mailbox array. This is the mailbox
array shown in the examples. The first two mailboxes (0 and 1) in this
array allow the AP to communicate with the CPM. They are high
bandwidth and use queuing. One is for TX, and one is for RX. In
current designs, both happen to use 4-words per transfer.

What you can't see (and won't translate into examples) is that this
same mailbox array has many extra mailboxes. These extra mailboxes are
used for the CPM to communicate with other system components. From
what I see, the second two mailboxes (2 and 3) are used to communicate
to the AP's secure firmware (TF-A) and also use queuing mode. Then
mailboxes 4 and 5 communicate to the GDMC (Google Debug Monitor Core)
and _don't_ use queuing. Mailboxes 8 and 9 communicate with the AOC
(Always On Compute). There are a pile of other mailbox pairs. Though
we don't model these mailboxes in the Linux device tree (which only
looks at things from the AP perspective), the protocol used here is
very different.

Different mailboxes in the array are allocated to different processors
in the system, which is why each mailbox is fairly self-contained.
Each mailbox in the array has a 4K register space representing that
mailbox. To me, this is a primary reason why these are best
represented as full-blown mailboxes, not as "channels". Each of these
mailboxes is a self-contained unit and can be allocated independently
toward one of the processors in the system. They don't look like
"channels". The thing that ties them together into an "array" is that
all the mailboxes in the array all talk to a given "host" that owns
the mailbox array. Yes, sometimes several of these mailboxes end up
routed to the same processor in the system, but fundamentally they are
still separate mailboxes...

Yes, we could try to make these mailboxes look like "channels", but
the hardware is really designed around each mailbox in the array being
an independent/separate thing.

Does that make sense?

From a perspective of "do these each need their own node": Even if we
don't currently see an instance where multiple mailboxes are routed to
the non-secure AP and some use queueing while others don't, the
hardware supports it and we should make sure the bindings are ready
for that.

If you want, I can create a hypothetical example where some mailboxes
use queuing mode (or have a different TX word size) and others don't.
Would that make things look better?

---

To show examples of some of the other mailboxes in lga, here is the
"GDMC to AP NonSecure" one. You'll note that it starts at mailbox 2 in
the array (not mailbox 0) since mailboxes 0 and 1 in the array are
routed elsewhere.


gdmc_ap_ns_mba: mailbox-array@6240000 {
    compatible =3D "google,lga-mailbox-array";
    reg =3D <0x0 0x06240000 0x0 0x00010000>,
          <0x0 0x06250000 0x0 0x00010000>;
    ranges =3D <0x0 0x0 0x06260000 0x00020000>;

    #address-cells =3D <1>;
    #size-cells =3D <1>;

    gdmc_ap_non_secure_req_mba_client_2: mailbox@2000 {
        reg =3D <0x2000 0x1000>;
        interrupts =3D <GIC_SPI 302 IRQ_TYPE_LEVEL_HIGH 0>;
        #mbox-cells =3D <0>;
        google,rx-payload-words =3D <4>;
    };

    ...

    gdmc_ap3_req_mba_client_10: mailbox@a000 {
        reg =3D <0xa000 0x1000>;
        interrupts =3D <GIC_SPI 310 IRQ_TYPE_LEVEL_HIGH 0>;
        #mbox-cells =3D <0>;
        google,rx-payload-words =3D <4>;
    };

    gdmc_ap3_resp_mba_client_11: mailbox@b000 {
        reg =3D <0xb000 0x1000>;
        interrupts =3D <GIC_SPI 311 IRQ_TYPE_LEVEL_HIGH 0>;
        #mbox-cells =3D <0>;
        google,rx-payload-words =3D <4>;
    };
};

---

The "AOC to AP" mailbox for "lga" looks like this. In practice, the
software uses most of these as "doorbell only", though exactly one of
the mailboxes here actually gets data transferred over it.

aoc_ap_mba: mailbox-array@b480000 {
    compatible =3D "google,lga-mailbox-array", "google,mailbox-array";
    reg =3D <0x0 0x0b480000 0x0 0x00010000>,
          <0x0 0x0b490000 0x0 0x00010000>;
    ranges =3D <0x0 0x0 0x0b4a0000 0x00020000>;

    #address-cells =3D <1>;
    #size-cells =3D <1>;

    aoc_ap_0_mba_client_0: mailbox@0 {
        reg =3D <0x00000 0x1000>;
        interrupts =3D <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH 0>;
        #mbox-cells =3D <0>;
    };

    aoc_ap_1_mba_client_1: mailbox@1000 {
        reg =3D <0x01000 0x1000>;
        interrupts =3D <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH 0>;
        #mbox-cells =3D <0>;
    };

    ...

    aoc_ap_19_mba_client_19: mailbox@13000 {
        reg =3D <0x13000 0x1000>;
        interrupts =3D <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH 0>;
        #mbox-cells =3D <0>;
    };
};

