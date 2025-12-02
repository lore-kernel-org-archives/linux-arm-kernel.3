Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE9D5D1267A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 22:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DuXSsKE9g0wgo8lmJJvSeZzq7qMa9oZIDVgvyGW3d8I=; b=IoCgi9eZIts0PyTwkjopYKXa3S
	6TJYqT8pSVV3KdzgQqaVYEGBk9/M3ojMvpZZCyhJhjjL5O02YX4v1xZhix7Q2zs6g21SWDcYIIQe/
	6X+uYnFT2oQgG4zCR8WQgVKl2Hc2E3qb+Ntg9GubJTSNN1gjnsRW3gDtOhKhchx+PxiXTjhDfjWch
	KM8FwUJiRGr3lL3OkOLEZ/llCgu7aEkzKTosRzyd4jpNSQuQyV33lz5d25fACeBkRpeNz0txAK1TP
	y7vlg8Cd4LB+oiOlATjaaDWM5UXS9pHGUqjt3r3b4Ax1U4cMQ+DjYk9k+kuBT6Jf/ed0TwwpYdaTZ
	CZ6qAw1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQYtu-00000005tw6-2ZIh;
	Tue, 02 Dec 2025 22:31:14 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQYtq-00000005tv2-18wL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 22:31:12 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-b713c7096f9so976572866b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Dec 2025 14:31:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1764714667; x=1765319467; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DuXSsKE9g0wgo8lmJJvSeZzq7qMa9oZIDVgvyGW3d8I=;
        b=I7HB2t/IDSJsoGJuTN52ipDgyL4UpVUpg1vPmmXil0q6iJDyAeXF5zQiqZzk20WaKH
         RdE4IIhq+14AXYwQvIJNdGwJh8Z5T3MBIPRnVLTZvkL3+LnMzHQmuThPLaN+OkbhPAH4
         4jIr7suXisnLCaFlOMopuOxfMgc+PBN2DvEQ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764714667; x=1765319467;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DuXSsKE9g0wgo8lmJJvSeZzq7qMa9oZIDVgvyGW3d8I=;
        b=j5NVkR246TFFfmTbUmTRHqH8yihpd7dbercSKrl6Pqw/d6x8Uem6U8lNBjuuXOD+GE
         phF9LKqI7UO10wi26aoZgfxXLlG3Y8zeMnsCVurL7W67nuuw99qGVHtUSq2bLQY7aCut
         X2gyh3J4GUmSLOsH2sX4yARK7NjwWawkZetIl3GaSvpx85YTprlhZ2k/bH3pTu/0uR2t
         Hln3wMFc46jXvnlrL9FM1VP2OZf0/oqJsovQHHlfbVs5JyV/L8Ic228kd09epezjpOKq
         3VNASlP4T94s3sCZDXMV74OQeRdr3h9XGn4T6TXVHlBFjgj6XnwE2x6YL+mGttZ5ZfBI
         q9Tw==
X-Forwarded-Encrypted: i=1; AJvYcCXhIknRMwOJXikwqYKXFJo0c75+KlKT3fP0sAxHEG9VhewVdMrC6azqrFb+3z+4Ho2N9+gqJ+KrV5fUqJLeXRds@lists.infradead.org
X-Gm-Message-State: AOJu0YzO9ECuUqEdpxgShW6/83geNK6VURml5i4uh4/UCnYjFI+LlbAm
	hhhwuDOGq8+5pYncoFTe8FhaNxYcWHObLNjslO0ZX0BPDzNLiWZTVvb7EsqHJIpM7R4BGrRLQdQ
	+ZFxCpQ/2
X-Gm-Gg: ASbGncuXriGC1Sl9BR6ZKyExrVC4dm2x43z5kEORzpwN6+TGke2s/845SL5sItdsJOu
	OyWHyPj7qAtOgni7RUUIHprDWd9zy7oWtoYICHwSTB96mzQRO8NmfULmsr9sEoh8+QF8zROOsB2
	ZBhzMROHfodeSDdVumJKavIjIbJeGAa70+p2bGRFfj/MnjQfTmKIZKXfTEOToxwa2rl08jvwJ3T
	Mg23+IRqQMziOpGz/afh/MFa5+M/Jb596lWD/FVBJlGlIEzLpbsucoxc8eOim+DACNaGfdO3SHS
	52NNmGvVqO7lurJFh2hOmaFJBwV6uBFHsSw+3iyJYxJBnhofRqW6DRfbM6AOQxnZJK42US9tHwH
	Jko7M0i7evdrLG3R7iZTGTy/OUpr+wnA3MbuRJrZhgqJOlwZpvujeLH3n58K68DoB5dIwbnEbTy
	T0BAXBd69L1hQBMlVTiVj1WMgRYUUS0xmyRVY2SQY+eKqrXYObWg==
X-Google-Smtp-Source: AGHT+IHRF0dE79aMJIHO3dpLgJdA6nqaHJLplMpMAwMRB4ZLE08TXMyABcUokps6dQjgDtayp/90Fg==
X-Received: by 2002:a17:907:3f8a:b0:b73:301c:b158 with SMTP id a640c23a62f3a-b79dbe71be1mr2027466b.6.1764714666994;
        Tue, 02 Dec 2025 14:31:06 -0800 (PST)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com. [209.85.128.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f519e2a7sm1621841066b.19.2025.12.02.14.31.04
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Dec 2025 14:31:04 -0800 (PST)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-477a2ab455fso68897605e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Dec 2025 14:31:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVIkxxwu4iXACgEZsPnZr1gOReKG4tp5x4wQ3mPdGKUH93ThvOVukKsRjsbuk02G8apVViMXv46hEgg5kPgGJ98@lists.infradead.org
X-Received: by 2002:a05:6000:2007:b0:42b:3b3a:5e52 with SMTP id
 ffacd0b85a97d-42f7223773emr784394f8f.39.1764714663803; Tue, 02 Dec 2025
 14:31:03 -0800 (PST)
MIME-Version: 1.0
References: <CAD=FV=Ux7nGFnYEyX0cUL-9__BKnTYc+kAJjkF458ZnFS7zoJA@mail.gmail.com>
 <aS66WcLPm6e5rdyk@shell.armlinux.org.uk> <CAODwPW-sBSZfzbTnYLcGr2sN=+5p+okUeJEJeVvJOHCx3JbOgg@mail.gmail.com>
In-Reply-To: <CAODwPW-sBSZfzbTnYLcGr2sN=+5p+okUeJEJeVvJOHCx3JbOgg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 2 Dec 2025 14:30:52 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WsWNb3FnHQHKGKzTckLuPNR4iDCQ2rxg07bLXwqZ-pWA@mail.gmail.com>
X-Gm-Features: AWmQ_bnreofmVzYeCHzPsyJJNHJLUpWtcWHtk5rxJWZfVBP3NQVojlqKSM7G3lw
Message-ID: <CAD=FV=WsWNb3FnHQHKGKzTckLuPNR4iDCQ2rxg07bLXwqZ-pWA@mail.gmail.com>
Subject: Re: Proposal: Officially allow "incomplete" trees as a base
To: Julius Werner <jwerner@chromium.org>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>, devicetree-spec@vger.kernel.org, 
	boot-architecture@lists.linaro.org, Chen-Yu Tsai <wenst@chromium.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	William McVicker <willmcvicker@google.com>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_143110_893969_47F8A6F8 
X-CRM114-Status: GOOD (  51.30  )
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

On Tue, Dec 2, 2025 at 1:58=E2=80=AFPM Julius Werner <jwerner@chromium.org>=
 wrote:
>
> >> Is there really a need to merge the compatible strings in your case?
> >
> > Well, you could just require duplicating an overlay N times for N bases=
, but that doesn't scale
>
> I think my question was more along the lines of "is there actually a
> reason why the combined compatible string needs to be that accurate"
> (i.e. contain the right "socvendor,mysoc-rev1" or
> "socvendor,mysoc-rev2"). What is the purpose of having that string in
> there?

Yes, this matches what I just sent in several of my replies. What
exactly is the top-level compatible supposed to represent? I think
different people have different ideas. Is it documented somewhere? I
guess I could start a new thread to solve just this one question,
though I suspect not everyone (not even core DT folks) will agree. If
they don't, how do we solve that? Who is "the decider"?


> It wouldn't be used for matching which DTB(O) to load in this
> case because we're already past that step. It's not used by the kernel
> directly for anything as far as I know.

It has _sometimes_ been used by the Linux kernel. Specifically the
fact that the SoC is represented in the top-level compatible is used
to "blocklist" the generic cpufreq driver
(drivers/cpufreq/cpufreq-dt-platdev.c). I've never loved this, but it
is an example.

Occasionally, I have also seen random software workarounds that rely
on the top-level string. See Linux commit 127068abe85b ("i2c:
qcom-geni: Disable DMA processing on the Lenovo Yoga C630"), which
added:

+       if (!of_machine_is_compatible("lenovo,yoga-c630"))
+               dma_buf =3D i2c_get_dma_safe_msg_buf(msg, 32);

...that's been since removed, but it's one example I can think of
where the top-level string was temporarily relied upon.

There are certainly lots of hits for `of_machine_is_compatible()` in
Linux today. I don't know if these are all for good reasons, but they
are examples of people relying on it. In my experience it's mostly
used for things that are a bit hacky, to avoid an unexplained bug, or
to work around the fact that someone didn't add a specific enough
compatible string somewhere else in the device tree.


> Is it used by userspace
> programs which parse /proc/device-tree/compatible in order to detect
> which SoC revision they're running on? Because that's the only use
> case I could think of that really remains, but I'd argue that the
> compatible string is a pretty poor vehicle for things like that

Agreed. This type of thing has always been broken on Chromebooks which
have more than one revision/sku listed since a single device tree
works on more than one device. We had long arguments about this in the
past and I think DT folks finally threw in the towel and let us land
these, though I think they still don't really like it to this day.


> (it
> would be easier to parse and use to just put a `soc-revision =3D <1>`
> property somewhere). So if this is the only problem I'd say maybe just
> don't use the board compatible string for that, don't expect to be
> able to find such details in there accurately. But if we do think it
> needs to be that accurate for some reason, then I'd suggest platforms
> like this (which should be rather few, e.g. only those that really
> have a socketable SoC with differentiations that are so compatible
> that other than this identification information itself it doesn't
> require any device tree differences) should simply have their
> bootloaders rewrite the compatible string into the right format with
> all the necessary information manually, rather than expect the overlay
> application process to create it correctly.

Yeah, trying to stuff the world into the top-level compatible never
seemed amazing to me. Given that today's advice is to have a top-level
`soc@0` node, IMO SoC-specific details ought to be under that. This is
something that Stephen Boyd suggested a while ago but it never gained
traction.


> > I also don't see a sensible way without something like the above for a
> > boot loader to know the filenames of each of the components for a
> > platform - and it would need to be told the order to glue those
> > components together.
>
> I think platform identification and matching which overlays to apply
> should remain outside the scope of the device tree itself. The main
> reason is that you usually want to compress DTB(O) files for
> efficiency, and when you have a large list of overlays in a kernel
> image you don't want to have to decompress them all just to determine
> which ones to load for the current platform. So I think it's generally
> better to let bootloaders come up with their own scheme to store this
> information inside their file systems or whatever other data
> structures they use to find these DTB(O) files.

IMO it's still nice to be able to store some of the metadata that the
loader will use in the overlay files, just so we don't need a parallel
set of files. The current Android way of doing things is that the
metadata in the "dtbo" is parsed by the packaging tool (`mktdimg`) and
that creates the tables that the bootloader needs. This seems
reasonable, even though I'll argue that the metadata needs to be
documented under a specific node (one for `mkdtimg`). I wouldn't want
to have to maintain a separate file mapping overlays to their
metadata.

-Doug

