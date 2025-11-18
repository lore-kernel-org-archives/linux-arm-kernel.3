Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6D15CF2561
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 22:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=H80IEDD5SztQTOwQNxdUh5iH8SZS9qkZgSnNnJ77XOA=; b=bAf8xMgwPoOCHl1m/7ieza9RKn
	qVeif0XyVXFKwDzpk0SJ0M30pfS+hMbQ7QQs/n/VkOIVpmHOioZi2znpMbUeMBePLATC3GXms8hgo
	n7h9Aw9ANXcNY2zzG1M38bRbYPWBun/V0WpSC/FQLkt6pmiOTc0vevGYD6uojZTIyiuxTyTlJjhhf
	Ki9+PT989EVOtBKGm8WGZRLWcVjJ5hiuojB3ILbAe13TfeV3KubsG4WZuWPYx+9v2O4prPxoV9huS
	lTGV99Xkmn+ThFsr1/ZBsC/y8K+0ZCMG84OaXIlIOLrVNEjKC7H2acw7o/SZ54Rxl0iqLWRV37xSC
	Cyn5TXJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLUQD-00000001C37-3JMW;
	Tue, 18 Nov 2025 22:43:37 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLUQB-00000001C2g-0YMI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 22:43:36 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-640c6577120so10238414a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 14:43:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763505812; x=1764110612; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=H80IEDD5SztQTOwQNxdUh5iH8SZS9qkZgSnNnJ77XOA=;
        b=B9In84iZP2YM4DKJvuqlDkumAmFJ0ODX7CuA8oyYrszjNy6rfDhgHH95AMKRSWYK+j
         OULuliv6TBA3VKdxoniSLYCziqq7qZ5XvSVAlogIf/iyQndftR0AgXUdBmDPJ5YojsXg
         mDlgZEuwX32XQGnujSH46zwSkZmwMrafqciwM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763505812; x=1764110612;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H80IEDD5SztQTOwQNxdUh5iH8SZS9qkZgSnNnJ77XOA=;
        b=RSMbKX6SEfky/C0rYFbPF0UyWn/5oaTFkbDs4DyJ8RH0PUJd3ghK2lBQVjNt7KbN8I
         /YVvTHuH/tcsPJHTwZDYRDsPrB5EAhYYHCXRv07R8ZCjgb1hZ+PYdkeWmzExjNO/f9WM
         H4OQrZQKBKE5to6Q9CzyIvOLlBp5Y8Bt3I5wzOxJpDkXFQXQpmd2drRudWc6ZKAO3ipL
         JtEpVj0rUUwV/BS2VUbcelWw3ieYlQkehPKqG9/ek6TDUqvCFGqBuebLPEQrdQasvwWY
         /E5HENPmD5zMs3DvxRQnrowALJJa6gUHQrWfOWWh2RFwMTXYymU9Oubga/9xQ4xR1AlD
         sseA==
X-Forwarded-Encrypted: i=1; AJvYcCUKcUKKYdsUW/0JSChOcbTZBfaalTQcEQitHGac2CXOKS6vpLwabBaPZdVeNRH4UBLlEkYIm+hCUvLr4msYLDXU@lists.infradead.org
X-Gm-Message-State: AOJu0YxkqFkY3am/OjhRUx9jjbM4+qGlmY/sdDivNV0t7wSbrQE2FjHU
	5LtjOq8B6sbkIIFINtQJHWtDLAGjFa5QU7IvjEM7GbgNH0EtRDQDfNJaoX53IWiKjLGXNkSt1u+
	dBzCzrA==
X-Gm-Gg: ASbGncus7J3fBcn+AzkwgshnLQpm/yBTN5LLDjrLO26gK0085oniBtck+gLIEJDy/BS
	63zRIpoMdZ3wRLh718w7HaHmEIGXVFtEQv/An30sD+VidX5o7ECsnYWSRg8bXPSpnMGZO8H1Iit
	oy5DHDHyIzdnnqPZu0mf1S4ZTNLzlj/bLbLjPxnXuDsDoH857Y4PSWFUs85V4L/V4v/nL65iKMq
	eSK4LWhKldd1ZYowwPHXBpd03BiWgCrfoPBsF9VE8GpzRwQm6zyQYVUePG2hguC8BEE9ojMhGLU
	yPoHcVKljqc5gfm2p99l4h7gij2YlqqDL+P6QTS5idxhPUpab6FDX8l+2F0/5gt4g6brDtcYQco
	hyWc89zD4aikWdeIc0WrIfJnghrN5QOaF/Uv/biCtlsIa7Jn81MZX1Hjv8g6z/MT2TlaNyYTIyn
	JUGwG/jCDgP4bk08IxRngRX0KC4FjotVnfgvjjPbTMRl3pSr0AUA==
X-Google-Smtp-Source: AGHT+IF0nuPLnbaTTt3diNt2NCIgszE5Av3ZKU1OaEwlZonR2AC0OnuDmDhvrZXvTvyn3uKaWE+Fjg==
X-Received: by 2002:a05:6402:2111:b0:641:3d64:b120 with SMTP id 4fb4d7f45d1cf-64350e89f50mr15172586a12.18.1763505812614;
        Tue, 18 Nov 2025 14:43:32 -0800 (PST)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com. [209.85.221.49])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6433a3f8e6dsm13778955a12.10.2025.11.18.14.43.32
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 14:43:32 -0800 (PST)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-42b427cda88so4336302f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 14:43:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXp7xkkHFOaQIlxm51HArnu7Xl/4rLGm1m2Xbhdg5ybjRlUI1y7jV6kEiKODv4XvHlZdgs2/pfC2x3asxKQ47Kf@lists.infradead.org
X-Received: by 2002:a05:6000:4285:b0:429:d0b8:3850 with SMTP id
 ffacd0b85a97d-42b59373560mr15721916f8f.48.1763505811684; Tue, 18 Nov 2025
 14:43:31 -0800 (PST)
MIME-Version: 1.0
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 18 Nov 2025 14:43:20 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Ux7nGFnYEyX0cUL-9__BKnTYc+kAJjkF458ZnFS7zoJA@mail.gmail.com>
X-Gm-Features: AWmQ_bll7WeW0i59nxOAqQR7FvjUYkkrtgy-Zj5as_5uRuWHBgIIpodvLfSaXG8
Message-ID: <CAD=FV=Ux7nGFnYEyX0cUL-9__BKnTYc+kAJjkF458ZnFS7zoJA@mail.gmail.com>
Subject: Proposal: Officially allow "incomplete" trees as a base
To: devicetree-spec@vger.kernel.org, boot-architecture@lists.linaro.org, 
	Chen-Yu Tsai <wenst@chromium.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	William McVicker <willmcvicker@google.com>, Julius Werner <jwerner@chromium.org>, 
	Conor Dooley <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_144335_246848_C6DF8C16 
X-CRM114-Status: GOOD (  33.46  )
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

This is a continuation of the discussion that started in reply to my
patch adding basic device trees for Pixel 10 phones [1].


Problem statement:
------------------

We would like an officially accepted scheme that lets us more
efficiently ship compiled device trees for a handful of related
products by breaking the device trees up into a common "base" device
tree and then applying "overlay" device trees atop the base to make a
full and complete device tree.

To make it more concrete, we'd like to build a "base" device tree that
describes a SoC and then have the overlays be enough to make a full
description of a board. In theory, one could also imagine wanting to
expand this to 3 or more levels (perhaps SoC, baseboard, derived
boards), though this is not planned at this time.

The primary reason for wanting to break device trees like this is
efficiency of the shipped binary device trees. A large portion of a
final device tree just describes the SoC. We save space in the final
compiled device trees if they don't need to contain as much duplicated
information.

A secondary reason for wanting to break device trees like this is to
more nicely handle when a board has a socketed SoC that can be
replaced with a finite (and small) number of different SoCs (usually
revisions of the same SoC). Even if this secondary reason is
considered invalid or too difficult, the primary reason still
describes a compelling need.

In order to make this proposal work, it's expected that a bootloader
will understand the scheme and will know how to combine the overlay
atop the base before passing a complete device tree to the main OS.


Current state of the art (downstream):
--------------------------------------

In Android, we do a pretty good job of solving the stated problem
using device tree overlays. We describe the SoCs in "dts" files and
compile them into "dtb"s. We describe boards in "dtso" files and
compile them into "dtbo" files. A bootloader can handle identifying
the correct base and overlay (the scheme for doing this is a separate
but related topic) and applying the overlay atop the base "dtb". This
solution is fully implemented downstream for Android phones and is
well documented [2].

The issues I'm aware of with the current state of the art are:

1. In order for the base device tree to pass schema validation on its
own we'd need to document the top-level compatible strings in the
device tree. It is the opinion of at least some device tree
maintainers that a SoC doesn't qualify as a top-level compatible
string. This prevents the device trees from landing in an officially
sanctioned location.

2. It is also possible we may fail schema validation for the base SoC
tree if the schema marks a property as "required" but that property
needs to be filled out by the board (perhaps a "-supply" is marked as
"required", since most "-supply" properties are filled in by the
board. I'm not sure this is a big issue, but it's something to think
about.

3. It's unclear if there is any official "ABI" promised here once
we've compiled and validated the base device tree on its own. Will
people assume that they can have out-of-tree overlays derived from the
base SoC tree and that those out-of-tree overlays will continue to
work across changes / cleanups to the base? NOTE: this is a
pre-existing question for existing device tree overlay usage, but the
sheer quantity of nodes/properties that a board would be expected to
overlay/modify in the base make the problem more prominent.

4. We want the final device tree's top-level compatible to be all the
compatible strings from the board followed by all of the compatible
strings for the SoC. When the board's overlay is applied to the base
SoC tree, though, the board's top-level compatible fully replaces the
compatible from the base SoC tree. This can be solved today for
non-socketed boards by just duplicating the SoC compatible strings in
the board overlays. We can't solve this today for socketed boards,
though we can simply make sure that no software drivers rely on the
specific SoC compatible string being present and thus we can ignore
the problem.

None of the above problems are big enough to have prevented widespread
use of this scheme in downstream Android.


Current state of the art (upstream):
------------------------------------

Upstream if we have a pile of related boards, we do allow
deduplicating things at a source-code level with "dtsi" files. We can
have a SoC "dtsi" file and that file is included by all boards that
use that SoC. When it comes time to validate or ship things, though,
we only work with full devices trees. This means that we ship
duplicated information.


Proposal:
---------

1. Allow the top-level compatible string of an "incomplete" device
tree to be documented so it can be validated on its own by tools. It's
understood that this SoC is not a board by itself and we'd never boot
a full OS with this device tree without adding an overlay that changes
the top-level compatible. Add a top-level property to the device tree
(perhaps "incomplete-compatible;") to indicate that the tree is not
complete without an overlay.

2. If it turns out to be needed (hopefully it's not), allow some type
of syntax in yaml files that allows a property to be marked as
"required" in a "complete" device tree but not in an "incomplete"
device tree. Alternatively, we could discourage marking properties as
"required" if they're expected to be filled in by a board.

3. Define that there is no promised ABI between "incomplete" device
trees and anything not stored with them. Specifically, all valid
combinations of "incomplete" device trees with overlays to complete
them should be enumerated together with the "incomplete" device tree.

4. When applying an overlay to a device tree that's "incomplete", the
top level overlay will be merged instead of replaced.

Example for 2 levels:

base (incomplete) compatible: "socvendor,mysoc-rev1", "socvendor,mysoc";
overlay compatible: "boardvendor,myboard-rev1", "boardvendor,myboard";
merged compatible: "boardvendor,myboard-rev1", "boardvendor,myboard",
                   "socvendor,mysoc-rev1", "socvendor,mysoc";

Possible example if we support 3 levels:

SoC (incomplete) compatible: "socvendor,mysoc-rev1", "socvendor,mysoc"
overlay1 (incomplete) compatible: "referencevendor,referencecodename";
overlay2 compatible: "boardvendor,myboard-rev1", "boardvendor,myboard"
merged compatible: "boardvendor,myboard-rev1", "boardvendor,myboard",
                   "referencevendor,reference-codename",
                   "socvendor,mysoc-rev1", "socvendor,mysoc";

Obviously in the 3-level scheme we need to know the order that
overlays are applied, but that's true for overlays today anyway.

The above proposal takes the current downstream "state of the art" and
addresses the known issues, solving the original problem statement.


Other thoughts:
---------------

If you don't like the proposal, I'd be interested in knowing if you
have other ideas for solving the original problem statement, or if you
simply think the problem we're trying to solve here is an invalid one.

I'm happy to post up another revision of my Pixel 10 device trees
following this proof of concept (or other ones). My v1 was _very_
close to this, but didn't have the "incomplete-compatible;" property
and didn't implement top-level compatible merging.


[1] https://lore.kernel.org/r/20251111112158.1.I72a0b72562b85d02fee424fed939fea9049ddda9@changeid
[2] https://source.android.com/docs/core/architecture/dto/partitions

