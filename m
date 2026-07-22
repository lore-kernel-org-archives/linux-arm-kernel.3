Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 391B9C44532
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 17:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6YX3CosssI6KHChiFe/bPd9GHkJ0zXvX16gTAellRDk=; b=A7gf1iTPZk0vJAlbiifeKthSWf
	hvvXdqxTaURehuqaSaQRn3gk6awrSOEef5KVjrH1pnKeo0YxfSOvf6JAHs9Xu0mm03fGkp1gOpEqt
	nfsN6OxgaD/+D1ET6I/CAaHYFFLHCetwL/ts3N9ydmnbx1FPmRcr79989cGto+FO1ldgnO+XxFUmb
	GCxovxIK0Cxp0KVFzQEfN+Ay2nMN2VFXn+oUifWBDSN5Ed0EFiOjhVzRedrclaVPXz91Kt8uhUZ0A
	D3gBIrrvC80Vi9eqZxKvoWk1aazzmCekvgWjv6VBcEpeZEofE2OlFtEK4jGC23MM3CMy1xFHWGGXT
	9G8LP7Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmaUS-0000000CQXX-22mr;
	Wed, 22 Jul 2026 17:12:16 +0000
Received: from mail-vk1-xa2e.google.com ([2607:f8b0:4864:20::a2e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmaUP-0000000CQWc-4BIP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 17:12:15 +0000
Received: by mail-vk1-xa2e.google.com with SMTP id 71dfb90a1353d-5c2c46a428eso801061e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 10:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784740333; x=1785345133; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6YX3CosssI6KHChiFe/bPd9GHkJ0zXvX16gTAellRDk=;
        b=bRsyI/HojIiqrgtxf0gE+Ye2TAGcc/kCKQUlZAAddQI40qLbLPoTZ9jCogAUJbqT7E
         hCAt9XCJnfcSL69yMOtEbS8J1d/Z8AdnxG1g/QUReIbgYJvsIuJRK0UXSh6ZROfh4BV/
         e0BQjvfmt+POr9+lhwi3RVzDpZtzwJ4HacpHU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784740333; x=1785345133;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6YX3CosssI6KHChiFe/bPd9GHkJ0zXvX16gTAellRDk=;
        b=FljGDcjc9IRu1SA9hSy7BfVy5/xhffmAYciJafdbhdmiSyINYKXJ7xSRC7d1+T6yY0
         /YRXXmsaBRcRi31JArhgArvEbz+eqTDE3/i3uR/I5fQHYPOQNmMSoF91hPMaF42Q/l+V
         rz0m20rr4BeYCqeDEXOXYpeT1EMT3pA2nic7w8ON5rac6B0G5EveRT3Jkv+EazXZ1/GR
         yQMP9ClBoxT7rxLmX4O2oDzbk1JS8OeH8lQEZuRucHDY9yZGppNceS/gs5ir5+42iKUz
         lBBNvC+VbFhz1VZbN9IcYueH6ZzMQXX6TmJmtVILuBQFuKM/DcPz/rVQd97+ZDOlNXl6
         VmaQ==
X-Forwarded-Encrypted: i=1; AHgh+RqbkeCgfAlboeXe7UGdnmem1c+4FBACS/I/xVRPMU6or0L+1NY5/HNuIwb2vMeh0m7+2jizx/SM80WkCR8cmzdV@lists.infradead.org
X-Gm-Message-State: AOJu0YysQwpvlBV65lOM9e5sodglbfUQLfSlnbQ+fRVcfJQns2sLZ6Kg
	+FuKASpMh4T+PrCBYL+WqsU3crsxZ8+0Ga2uld7Q8c7J48Srxoj0IoC9JkQSwD+TcPoiGfMgFVJ
	8Rd4=
X-Gm-Gg: AR+sD11PLBiA1+OE0sLrqoI4Cf0vbUx7hrV1Hq/ABo3hGcrazLBstWOgazCRZj0Hjc5
	ljtTty8fVbTHXHde9Et44qWy5SpkvPhbtloUJ3hmDr44ycbR5P25yBMv2xKgj07NU1SnNJszjKc
	0pyhjAwHBtMmGv9yAG+4WVQoeMxRGc84jrWRc1xdIWrEl4Bx/1ySKvW7q/VYRX00QEpRDuF6xfX
	sPPjvfCLziiz2qWYMdM7ztLuJ+XdX86r+OcD4nAhG7W4cVoCIgrWnj9e89eIxcTyv4fZY7rzPZq
	CMUfaOFOLYj/3SduJEO+4jyAHzPJbaPQr2vTCQBARhQO9ko6YPKs6F0lInD9TJY8LCBa89hG3eH
	kW3duc8wPNRfxp+C73VNxwsfjvfUjthCcXFGRncyndpWWH0pdlOSxADiTVHgg+vNJpn3qK64vO4
	qdoRAjZDCRzjOk2ckYDXOfmoTjywtTWQbCslGoQOpk
X-Received: by 2002:a05:6122:4fa2:b0:5bd:ecad:8f9c with SMTP id 71dfb90a1353d-5c1b665d5a2mr8624377e0c.6.1784740332586;
        Wed, 22 Jul 2026 10:12:12 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c2c62b63cfsm3900043e0c.5.2026.07.22.10.12.12
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 10:12:12 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-969524c1a63so4532095241.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 10:12:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpNujFrkuzAcpDL+a7Q/DM7ytaX5ephwznZSlpQaMvGaBnDGPJKNOmhldGoaoLVdsop191y3kxlRT14Mi8hG0/Y@lists.infradead.org
X-Received: by 2002:a05:6102:41ac:b0:739:77a7:90bc with SMTP id
 ada2fe7eead31-74753727549mr9620851137.23.1784740331107; Wed, 22 Jul 2026
 10:12:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260714222338.2965707-1-dianders@chromium.org>
 <20260714152138.6.Ia186a29119b4b5c409815b755e0c2c3965b0495f@changeid>
 <8e3025c5-16a0-40d7-affa-098ca37699c7@kernel.org> <CAD=FV=Vrd9AxO-NY_CP2h+f21qt4uGY2pOoFgacV+G5bnfd32Q@mail.gmail.com>
 <208b12fb-8f6f-4cc4-9517-bc59180aa094@kernel.org> <CAD=FV=XOGjLUF-1qOY=zCYJYq85MzkJ_56WbhraTcyAjU_z+RA@mail.gmail.com>
In-Reply-To: <CAD=FV=XOGjLUF-1qOY=zCYJYq85MzkJ_56WbhraTcyAjU_z+RA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 22 Jul 2026 10:11:59 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VtNuF8E3OpV4pAS78-prMpaWgPy=+GtiFaeMVhki8jAA@mail.gmail.com>
X-Gm-Features: AUfX_mxvQ1AOoNj8OTI8i9aE7gStQVh4N4s4w7gmV1VP-TIiWsTp_ivnIG4C0EQ
Message-ID: <CAD=FV=VtNuF8E3OpV4pAS78-prMpaWgPy=+GtiFaeMVhki8jAA@mail.gmail.com>
Subject: Re: [PATCH 6/7] dt-bindings: mailbox: goog-mba: Add goog-mba mailbox bindings
To: Krzysztof Kozlowski <krzk@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>, 
	Rob Herring <robh@kernel.org>
Cc: Joonwon Kang <joonwonkang@google.com>, Subhash Jadavani <sjadavani@google.com>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Lucas Wei <lucaswei@google.com>, 
	Brian Norris <briannorris@chromium.org>, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_101214_089396_035DC578 
X-CRM114-Status: GOOD (  46.82  )
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

On Thu, Jul 16, 2026 at 9:31=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> > >>> +patternProperties:
> > >>> +  "^mailbox@[0-9a-f]+$":
> > >>> +    type: object
> > >>> +    description:
> > >>> +      Each sub-node is a single-channel mailbox.
> > >>
> > >> This does not look like correct representation. You have one mailbox
> > >> controller with multiple mailboxes, not multiple mailbox controllers=
 of
> > >> single channel boxes.
> > >
> > > I spent quite a bit of time debating this when rewriting the driver.
> > > While we could certainly hack things into the existing "mailbox with =
a
> > > bunch of channels", IMO it would be a worse representation of the
> > > hardware.
> > >
> > > I discussed this in the wall of text in this patch series, but
> > > re-hashing it here:
> > >
> > > Each "mailbox" in the mailbox array is more like a full-fledged
> > > mailbox than a channel within a mailbox. Each (single-channel)
> > > mailbox:
> > > * Has its own client register space.
> >
> > That's nothing special yet. Many providers of multiple resources have
> > these resources in dedicated registers. Arguing this, each GPIO in a
> > GPIO controller as well has its own register space so is basically a
> > GPIO controller on its own.
> >
> > > * Has its own interrupt.
> >
> > Just like GPIOs...
>
> Sure, having a giant list of interrupts and register offsets isn't the
> end of the world.
>
>
> > > * Can have a different amount of memory for messages.
> > > * Can have its own conventions for communication.
>
> I notice you didn't respond to the above bullets. How would I deal
> with different mailboxes in the array having different communication
> conventions? Different mailboxes in the array might have different
> "payload" sizes. Some mailboxes in the array might use "queue" mode
> conventions and some might not. Do I need to devise some complex
> scheme for describing which mailboxes in the array use which
> convention?
>
>
> > Well, this could be. But you still have one child per channel (cells=3D=
0)
> > and all children address space is in parent's space, so that's clear
> > indication. It's one controller with multiple, although some different,
> > channels.
>
> Sure, it's definitely one IP block and I'm not arguing against that.
>
>
> > > If we tried to represent the mailbox array as a single mailbox with a
> > > bunch of channels, each instance would have a different number of
> > > "reg" entries and a different number of interrupts. We would also nee=
d
> >
> > No, you would have only one device node. Very clean solution instead of
> > 100 children for each individual mailbox.
>
> There are definitely not anywhere near 100 children. At most a given
> instance of an MBA IP block could have 32 mailboxes. In practice, most
> have fewer.
>
>
> > It's the same with clocks (TI) - you do not get device node per clock,
> > even if TI did it 10 years ago. You do not get here device node per cha=
nnel.
>
> Sure, the clock history is one thing to look at here. IMO, this is not
> the right comparison, though. Trying to describe all of the complexity
> of a clock tree in device tree is an exercise in futility. It's just
> too complex to get it right, and there really are hundreds of clocks.
> The mailbox array, on the other hand, is a much simpler beast.
>
> I think regulators and PMICs are a better comparison here. When we
> describe a PMIC in the device tree, do we have a single PMIC node and
> then have clients refer to a "regulator ID" to index into which
> specific regulator in the PMIC they want? No, we don't. We use
> sub-nodes for each specific regulator. This gives us a nice place in
> the device tree to put information about each individual regulator,
> since each regulator in a PMIC is different.
>
> Certainly if we had a mailbox controller with a bunch of identical
> channels then describing them as sub-nodes wouldn't make sense.
> Existing in-tree mailbox controllers have a bunch of homogenous
> channels, and thus the existing solution of using a channel ID works
> well. Here, the sub-nodes buy us something and provide for a cleaner
> solution.
>
> I don't understand the downside of my current proposal. It represents
> the hardware better (both the HW designers' intentions and the reality
> of its structure), avoids adding complexity to the device tree, and
> feels clean.

FWIW, I still feel fairly strongly about the fact that #mailbox-cells
shuld be 0 here and the fact that each mailbox in this mailbox array
is best expressed in the device-tree by its own node since. In other
words, the best model for this hardware is an array of single-channel
mailboxes, not one mailbox with many channels. The main reason is that
each mailbox in the array is _not_ homogeneous and is not intended to
be. The main argument is that every mailbox in the array can have a
different message-buffer size. While we can discover the
message-buffer size of each mailbox in the array at runtime by reading
hardware registers, the different message-buffer sizes suggest that
each mailbox in the array is designed to be able to use a different
message-passing convention. The message-passing convention is defined
by the firmware on the remote side and is _not_ discoverable, so we
need a place in the device tree to describe it for each mailbox. Each
mailbox in the array having its own node is the proper place to put
information about this convention.

Krzysztof: Do you still oppose this? I feel pretty strongly, so before
changing this to some awkward bindings, I'd love to get confirmation.
I'd also be interested if anyone else on the CC list has opinions on
the topic.

-Doug

