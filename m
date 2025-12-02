Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54390D116F3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 00:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oeguxzobQAB3EZbFcGpLg32aJHzhS0qrVQLsNvfJv+k=; b=IOsil2axO+rTFPnbvoeVR4oKsx
	DR9CwgJ/UJb+bUq6/n4y2OFPBXUFc7h+hOvAH2f4LkGEpL1T6F4YOaxBrjFTKfAZDdj09UBPIY3LD
	eTua02yQoBLFFV0vae/9OnI6ZyLOzscSAsUIThjJFlQR2Xb5H5RLSbCTIDq0quGaqCNAWcoHMHFnM
	7+8E86X1kpL72EhSfJ87X0LwIZ99Mu0A8Qw+XLg/CamKGMZpaaiB+oHmN4AXGOSSOCaX2zSVJtMAv
	I4A2w/9VNUfsP7vzXe5VqfFS1i2YJ+HaHM1ZWUCqrE2RMrS6FhXRSWuLAf8bLRwvP1LetneHlnLFa
	GVdgJ/gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQEd7-00000004efc-2qOj;
	Tue, 02 Dec 2025 00:52:33 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQEd5-00000004efH-1teQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 00:52:32 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-640a0812658so1739766a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Dec 2025 16:52:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1764636749; x=1765241549; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oeguxzobQAB3EZbFcGpLg32aJHzhS0qrVQLsNvfJv+k=;
        b=bOaNKNFmyrMFZ1DgR0HIhYXPb+46L4l6RbRC0l/Uu+Zbek5bTfcwKy1lgGuoj3pmrO
         zSSV2b2xONQEj+jz6Fiih2waHHit8+dDOdIPKY1J8oJNwlpxqJU06Q8XZa+2kVaYEBgS
         Rhs6EgS9apa2CEGoR5WIikWA9nzsagmembZOg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764636749; x=1765241549;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oeguxzobQAB3EZbFcGpLg32aJHzhS0qrVQLsNvfJv+k=;
        b=CrN8valrN6BAPUhIPBezRj/9fbxUXjCM/Io4GeOWZCwn2kIMNVeZaTSw5Pojlp5HRT
         azojQi5nRgZj2axX0VQ0aAIlhGR3DEyBzM6jwdfs0ifrEcKgkKnnn52vbEUIZhq93/jF
         M7qLY+zwZV8W+6X02DM4etGwxrC6354AE2wTWSkAfDhGkO1H/5avGzTVuiBaYPNlD2DW
         ZcFNiEuvlUveFWIzzHzvSO3fQPAmRBE/YL8IN9uo2ny1Toiw3GMNt1mHlrpiLx5MWwRg
         Brsdsme8OZTMewoKwV0Zpl3VBM9k8rEZ00r+Q0ilZaVvUIh3lL72Q3TVgPtY2j/Wd+wc
         sWJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXH2R6Zwnqq7Ti8C8n9GF5VIZX2vs9tqFKnUDWLnB6xymETW9tv0aBmcoqmzZ15JOi80aDy8dhOHweSWK7+5WCY@lists.infradead.org
X-Gm-Message-State: AOJu0YyzQbyDo7xO2B5aD139kuFdXK8jeqxjeBWeXW0BwQh9eOX9sNp/
	cEO7ry+WLpWx3Q1ZoNONnjPjpkD8EZYtuzooW9jzJHmx4kKG4Bo0LQHD7kZJQ39MOb6KqLYwp1E
	wvEjuTQor
X-Gm-Gg: ASbGncuCTcanG0VO2Y3mpV0d4xpywO8awDPVLYJzDMolZmnNXWhBW/XQZaQEOR/O+SA
	PKkwe+Nui+2Roy3IeAR48kOo/Q9TLd7whB2yPfMiTyub19e0R+TQ/kU8odOSrA7SmOmQS9XDZvQ
	UGbiMu8KAjNB2WMWJEPOTjE+Wcp0lhjRaN3N1TpLAjGWm9m4H7d0hL0uaABLqHaWKTkHQODaE9/
	tAeHjpWlHvkOtFhm3Fsfo4n0fQEXoa8aOn7pP2iZQqrN5JKbBJvLHk6N0UUI/ce2WF3LF1Lv6BO
	053StPdwEBuNvEzMj83nOns4zfzTzbW2kIVx4OmQMEz2Roy8HE0C7jW5bGoMpNvl/CXjWglZgS9
	twl7Q7WO1ey2fi5nJCw+7L0l1Gf4CVKO84kegbVxV/4vB7aBGIgIsapcLx375w5TasZKeb7+wiw
	/nvp5q4mtvujPfFJbiC3Oqa4ILSJqyZdnssSeUfOOiaSZFH/wGEw==
X-Google-Smtp-Source: AGHT+IGOgziPq17vh0Tl4hmivZERrBMQZun9rRUFRrCwXW+6aZ7kzrcuM+J5QCJ6QxuxW0KuzM7FiA==
X-Received: by 2002:a05:6402:2549:b0:647:6ec9:8d8b with SMTP id 4fb4d7f45d1cf-6476ec98dc4mr8073932a12.34.1764636749163;
        Mon, 01 Dec 2025 16:52:29 -0800 (PST)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-647509896d1sm14330111a12.0.2025.12.01.16.52.28
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Dec 2025 16:52:29 -0800 (PST)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b739ef3f739so182957266b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Dec 2025 16:52:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXTHyU2/PpTZ7dpuErKgmrdkmXOKvCAHcBp12j8563FIn2ppP8UomxSswER8+HyHt9CgjW6JJDqLy/vyFp7eoA9@lists.infradead.org
X-Received: by 2002:a5d:64e9:0:b0:429:b9bc:e826 with SMTP id
 ffacd0b85a97d-42e0f35bdb6mr29386558f8f.53.1764636261047; Mon, 01 Dec 2025
 16:44:21 -0800 (PST)
MIME-Version: 1.0
References: <CAD=FV=Ux7nGFnYEyX0cUL-9__BKnTYc+kAJjkF458ZnFS7zoJA@mail.gmail.com>
 <CAD++jLkuRQKoiEN928GtAj7wUts5PxH905bLp6ZhKsJ3NnenEA@mail.gmail.com>
In-Reply-To: <CAD++jLkuRQKoiEN928GtAj7wUts5PxH905bLp6ZhKsJ3NnenEA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 1 Dec 2025 16:44:08 -0800
X-Gmail-Original-Message-ID: <CAD=FV=X5=AK4XMANv+fatn3d9Y5vo9AXsHWb_47HmNaMWUtMwA@mail.gmail.com>
X-Gm-Features: AWmQ_bk30zsEX6ldKjcS73dst-qzy7aOugGH30_jv9Y6DTxDabuDBqyR7LAhrbg
Message-ID: <CAD=FV=X5=AK4XMANv+fatn3d9Y5vo9AXsHWb_47HmNaMWUtMwA@mail.gmail.com>
Subject: Re: Proposal: Officially allow "incomplete" trees as a base
To: Linus Walleij <linusw@kernel.org>
Cc: devicetree-spec@vger.kernel.org, boot-architecture@lists.linaro.org, 
	Chen-Yu Tsai <wenst@chromium.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	William McVicker <willmcvicker@google.com>, Julius Werner <jwerner@chromium.org>, 
	Conor Dooley <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_165231_598745_8B4DDF39 
X-CRM114-Status: GOOD (  51.38  )
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

On Mon, Dec 1, 2025 at 3:52=E2=80=AFPM Linus Walleij <linusw@kernel.org> wr=
ote:
>
> Hi Dough,
>
> thanks for your mail!
>
> Let me just see if I understand correctly what you're trying to
> do  (and apparently actively doing in production):

Thanks for your thoughts. Just to be clear, even though I've dealt
with device trees on a lot of ChromeOS boards, this is something that
_Android_ phones are doing in production and is what I'm focusing on
here. The whole scheme is at least roughly documented at:

https://source.android.com/docs/core/architecture/dto/partitions

This is all stuff that predates me looking at Android. I'm just coming
in and trying to make sense of what's there and trying to upstream
what I can.

Separately, it can be noted that we always _wanted_ a similar solution
for ChromeOS, but we never quite got there... ;-)


> On Tue, Nov 18, 2025 at 11:43=E2=80=AFPM Doug Anderson <dianders@chromium=
.org> wrote:
>
> > We would like an officially accepted scheme that lets us more
> > efficiently ship compiled device trees for a handful of related
> > products by breaking the device trees up into a common "base" device
> > tree and then applying "overlay" device trees atop the base to make a
> > full and complete device tree.
> (...)
> > In Android, we do a pretty good job of solving the stated problem
> > using device tree overlays. We describe the SoCs in "dts" files and
> > compile them into "dtb"s. We describe boards in "dtso" files and
> > compile them into "dtbo" files. A bootloader can handle identifying
> > the correct base and overlay (the scheme for doing this is a separate
> > but related topic) and applying the overlay atop the base "dtb". This
> > solution is fully implemented downstream for Android phones and is
> > well documented [2].
>
> So in the kernel we have several arch/*/boot/dts/vendor/ folders
> where they have:
>
> soc.dtsi included by board.dtsi included by system.dts
> and the top system.dts is all that get compiled.
>
> So what you say is that you do the same thing but at runtime?

Essentially. In this case, we don't ship the device tree _sources_ but
ship _compiled_ device tree. We compile the SoC into a "dtb" and then
combine anything above the SoC into a single "dtbo". We ship several
"dtb" files and several "dtbo" files and combine them at runtime after
we identify which hardware we're running on.


> Can you just describe why this is done like this with
> overlays?
>
> I can only guess that you have one bootloader that needs
> to compose device trees to many systems and the bootloader
> only discovers the system it is running on and its constraints
> at runtime, so shipping the static system.dtb as many people
> do is not an option for you?
>
> And the reason the bootloader doesn't already know what
> it is running on and doesn't just pass that one device tree
> or is just prepared with that one device tree has something
> to do with manufacturing or so?
>
> Sorry it just evades me.

Our builder creates a single "image" that can be flashed onto any
number of devices. Users (or manufacturers) can download and install
this single image and it will work on a wide variety of devices. So
you can download a single "Pixel 10" image that can be installed on
any of the Pixel 10 devices (Pixel 10, Pixel 10 Pro, and Pixel 10 Pro
XL). It will also work on our development board and early
pre-production variants of those boards.

In order for this to work, we need a lot of device trees and
_something_ needs to pick the correct one. Right now, the bootloader
is in charge of this task.

If we had less variety of products that we needed to ship then, yes,
we could just ship the one device tree and have a separate build for
each product. ...but that doesn't scale terribly well.


> Probably becayse even U-Boot these days use the provided
> device tree dtb, for the system targeted, to initialize itself. I
> suppose your bootloader is generic enough to avoid that
> chicken-and-egg problem, right?

FWIW: I believe even U-boot supports shipping a pile of device trees
and detecting things at runtime. See the "FIT" image:

https://docs.u-boot.org/en/latest/usage/fit/index.html


> I guess if I had this problem:
>
> soc.dtsi
> board-a.dtsi
> board-b.dtsi
> system-board-a-v1.dts
> system-board-a-v2.dts
> system-board-b-v1.dts
>
> etc having to be combined at runtime, in a bootloader, I would
> consider shipping exactly these files in a memory-based
> filesystem in my bootloader, and bake a DTS compiler into
> my bootloader so it can just build a device tree for what
> it detects.
>
> But I guess you didn't want to hear that :D

You're saying to just ship device tree source instead of binary? Hmmm,
it's an interesting idea. It wouldn't be _terrible_ since "dtb" stores
a lot of strings to begin with, but I think it would still add enough
of a bloat to make it a no-go for us... I would also imagine it would
be a pain to deal with #include of header files with #defines. Do we
somehow partially pre-process the device tree files but don't apply
the #include files. It might be possible to solve some specific cases,
but having this work in a generic way seems miserable.


> Anyway, please describe how you ended up in this situation,
> I'm trying to understand this.

The main goal is just building/shipping one image to support a variety
of similar products and trying to save space by not repeating the SoC
bits over and over again.


> It is quite clear that device tree overlays were intended for
> say plug-n-play additions and minor fragments to be added
> to a basically complete device tree, what you are doing was
> probably not how it was intended. (Or let's see if someone
> proves me wrong on that.)

Not sure what makes that so clear, since it's not clear to me. In any
case, even if device tree overlays weren't intended for such a usage,
they actually seem to work fairly well for it, even if upstream
currently rejects device tree usage like this.

FWIW, the fact that bootloaders (like U-Boot) have the ability to
apply overlays makes me think that _someone_ intended them to be used
similar to how Android is using them. ;-) If it was just expansion
cards then (presumably) someone would boot to Linux and just apply
overlays from there. See:

https://docs.u-boot.org/en/latest/usage/fit/overlay-fdt-boot.html


-Doug

