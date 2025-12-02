Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24DE0D1266A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 20:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K1Z1gpYyVlWN4964g+8VdhJkOzma6JMhAsAp5ym1zGM=; b=kplZNyj9Gjr7msSc/hKkA2U+w3
	uwUnKrgk7MqJg8Vk45PkR46tP7J3TGabtxLTdVhMbneWpModysGlf1ZlDKWLeMiiM5BQhk2+Gvmy5
	yEgNUmDdN1NraThlcqpz2ZsoXu4z4+zCkmcjcE549HNT2RLncyllENhdSEUUFIN0BdPETp7G4R9bV
	lhr7Ik+54qgtYzNwShefztQucPcnhZHw0SDTWHyo8IigdCSg24zKy2u6wUPdX2+B9ATYvbOmihGVo
	qGp6Qa+tTkaO9IeVBJGXPBCL/Pxs3oEhy1ZvAMozwGRuihJLABS9xBWzwV+hJv+O2oA3Dw7qBw8dX
	X5s0Ryog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQWf8-00000005mnO-03So;
	Tue, 02 Dec 2025 20:07:50 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQWf5-00000005mmp-1THO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 20:07:48 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-b79d0a0537bso22279366b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Dec 2025 12:07:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1764706065; x=1765310865; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=K1Z1gpYyVlWN4964g+8VdhJkOzma6JMhAsAp5ym1zGM=;
        b=oTC6hPqax81ThjtJoOO6q5W92h1j9SJRhdE7ONrgkZkub8wKDlqo7UGQ8jtJVRfd7g
         Cte+eNZ7+gWOFqNKSW+vFpmE96JwCXbSDxpL8PrjyYKqB52iNRH/M5SkV55hITm0nnv3
         VM0BFzCj6ZvRClMJDdeqgqSsux/XlTWIohkyg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764706065; x=1765310865;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K1Z1gpYyVlWN4964g+8VdhJkOzma6JMhAsAp5ym1zGM=;
        b=HzLSzPb9WwFjeBVNwNZnGtq2o6qyyEoAVup0laua2M+K7h7NOMnLZ/TA+Bo1Mdcd6d
         q9U2RhupZtCOcf3bY6uDGhUcUym5B2U1xABcxikdugp3Mf9f5iLawJSrG6DsJEfjWiPw
         4bl09hxO/eIpDbS18znNKGX7WTzurs6EdOe81UcSXERf31iKrGdrWhuUMLslQnVIooMe
         74DuiLgi+65e3bAg0gRgK20DvRY72mFC4hZ/+tDrdLUhYCSP1o0IHa98w6pynqpgilgX
         ZGd2tXAfjO4CMfjHuuzd4NNEkfmqwreP23SLFEtrdO+HHk7CrG+UAysMOLygD7tvGZlq
         7kEw==
X-Forwarded-Encrypted: i=1; AJvYcCXSoeffqllk6I4TwFyaAnBEf7B5i/Nl6NsZ20frL1AibaTR4v1YIB3wRCeTmYEBtUdh0Q3OmyyAv2IlB4gAE50x@lists.infradead.org
X-Gm-Message-State: AOJu0YyuB7qmPsF9JGY4sSpuUa6Ez6aBlxzbk5Val5YQpw1Aia51IL05
	enoa/fOqoge5nl69G08cCbV3+eBCcIxXDlE0E1TyNPpi0y/gDoSzGLhzqwdeK8vSi3qKm/E14nt
	vPGDpIIamY5MnZq+lj1TFw4qk7XL+kz5m8ivqaXVo
X-Gm-Gg: ASbGncvjvt2zxMCMXsdvcVqk5CcqgbG3es05AXcp2ELYkj+rIy4ztKauq9GjptpHrNp
	904SVyhWpU29fV1pvPmVzQnF1feXGZu5z8QN1ulirUL/KRKykL7+Z2ddfmNYnulZC8oSbY6SRW5
	fH7+GgmwFZJPOTeLe8KmO8ITHb6OPi/sfjbPS1eItbzwf3Yo4vIKtkY8wPYRzI++/X2sUGj4I+X
	FUHUeJS/uBKsXQR4VL6AyC5kEIIdQE0e2KmRHiOeLfIWHyKm+DBhB/LNXoSBlZpqxjq4XbEqw==
X-Google-Smtp-Source: AGHT+IHpNDvlQF6rrVzJte7nrF7RpWvOee7GviXU+nEM/LhRTuCAt8IXC4tPve/eMT8xSEnq+zf+mASWeYblufPu2p0=
X-Received: by 2002:a17:906:dc8b:b0:b79:b910:fd45 with SMTP id
 a640c23a62f3a-b79d118c79emr39330966b.38.1764706064920; Tue, 02 Dec 2025
 12:07:44 -0800 (PST)
MIME-Version: 1.0
References: <CAD=FV=Ux7nGFnYEyX0cUL-9__BKnTYc+kAJjkF458ZnFS7zoJA@mail.gmail.com>
In-Reply-To: <CAD=FV=Ux7nGFnYEyX0cUL-9__BKnTYc+kAJjkF458ZnFS7zoJA@mail.gmail.com>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 2 Dec 2025 20:07:32 +0000
X-Gm-Features: AWmQ_bnVY6hul7hU5okWO5b51z2U7n3Hx5WSWCXXOIPs5Du940FPVrwtuGaFSl4
Message-ID: <CAFLszTiVT9rHwympUJSehxaDR7ks9Bs2FVjYEuN6=j1e_-289Q@mail.gmail.com>
Subject: Re: Proposal: Officially allow "incomplete" trees as a base
To: Doug Anderson <dianders@chromium.org>
Cc: devicetree-spec@vger.kernel.org, boot-architecture@lists.linaro.org, 
	Chen-Yu Tsai <wenst@chromium.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	William McVicker <willmcvicker@google.com>, Julius Werner <jwerner@chromium.org>, 
	Conor Dooley <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_120747_462956_51AC9238 
X-CRM114-Status: GOOD (  57.07  )
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

Hi Doug!

On Tue, 18 Nov 2025 at 22:43, Doug Anderson <dianders@chromium.org> wrote:
>
> This is a continuation of the discussion that started in reply to my
> patch adding basic device trees for Pixel 10 phones [1].
>
>
> Problem statement:
> ------------------
>
> We would like an officially accepted scheme that lets us more
> efficiently ship compiled device trees for a handful of related
> products by breaking the device trees up into a common "base" device
> tree and then applying "overlay" device trees atop the base to make a
> full and complete device tree.
>
> To make it more concrete, we'd like to build a "base" device tree that
> describes a SoC and then have the overlays be enough to make a full
> description of a board. In theory, one could also imagine wanting to
> expand this to 3 or more levels (perhaps SoC, baseboard, derived
> boards), though this is not planned at this time.
>
> The primary reason for wanting to break device trees like this is
> efficiency of the shipped binary device trees. A large portion of a
> final device tree just describes the SoC. We save space in the final
> compiled device trees if they don't need to contain as much duplicated
> information.
>
> A secondary reason for wanting to break device trees like this is to
> more nicely handle when a board has a socketed SoC that can be
> replaced with a finite (and small) number of different SoCs (usually
> revisions of the same SoC). Even if this secondary reason is
> considered invalid or too difficult, the primary reason still
> describes a compelling need.
>
> In order to make this proposal work, it's expected that a bootloader
> will understand the scheme and will know how to combine the overlay
> atop the base before passing a complete device tree to the main OS.
>
>
> Current state of the art (downstream):
> --------------------------------------
>
> In Android, we do a pretty good job of solving the stated problem
> using device tree overlays. We describe the SoCs in "dts" files and
> compile them into "dtb"s. We describe boards in "dtso" files and
> compile them into "dtbo" files. A bootloader can handle identifying
> the correct base and overlay (the scheme for doing this is a separate
> but related topic) and applying the overlay atop the base "dtb". This
> solution is fully implemented downstream for Android phones and is
> well documented [2].
>
> The issues I'm aware of with the current state of the art are:
>
> 1. In order for the base device tree to pass schema validation on its
> own we'd need to document the top-level compatible strings in the
> device tree. It is the opinion of at least some device tree
> maintainers that a SoC doesn't qualify as a top-level compatible
> string. This prevents the device trees from landing in an officially
> sanctioned location.
>
> 2. It is also possible we may fail schema validation for the base SoC
> tree if the schema marks a property as "required" but that property
> needs to be filled out by the board (perhaps a "-supply" is marked as
> "required", since most "-supply" properties are filled in by the
> board. I'm not sure this is a big issue, but it's something to think
> about.
>
> 3. It's unclear if there is any official "ABI" promised here once
> we've compiled and validated the base device tree on its own. Will
> people assume that they can have out-of-tree overlays derived from the
> base SoC tree and that those out-of-tree overlays will continue to
> work across changes / cleanups to the base? NOTE: this is a
> pre-existing question for existing device tree overlay usage, but the
> sheer quantity of nodes/properties that a board would be expected to
> overlay/modify in the base make the problem more prominent.
>
> 4. We want the final device tree's top-level compatible to be all the
> compatible strings from the board followed by all of the compatible
> strings for the SoC. When the board's overlay is applied to the base
> SoC tree, though, the board's top-level compatible fully replaces the
> compatible from the base SoC tree. This can be solved today for
> non-socketed boards by just duplicating the SoC compatible strings in
> the board overlays. We can't solve this today for socketed boards,
> though we can simply make sure that no software drivers rely on the
> specific SoC compatible string being present and thus we can ignore
> the problem.
>
> None of the above problems are big enough to have prevented widespread
> use of this scheme in downstream Android.
>
>
> Current state of the art (upstream):
> ------------------------------------
>
> Upstream if we have a pile of related boards, we do allow
> deduplicating things at a source-code level with "dtsi" files. We can
> have a SoC "dtsi" file and that file is included by all boards that
> use that SoC. When it comes time to validate or ship things, though,
> we only work with full devices trees. This means that we ship
> duplicated information.
>
>
> Proposal:
> ---------
>
> 1. Allow the top-level compatible string of an "incomplete" device
> tree to be documented so it can be validated on its own by tools. It's
> understood that this SoC is not a board by itself and we'd never boot
> a full OS with this device tree without adding an overlay that changes
> the top-level compatible. Add a top-level property to the device tree
> (perhaps "incomplete-compatible;") to indicate that the tree is not
> complete without an overlay.

or be more description, e.g.: compatible-scope = "soc"  - or just scope = "soc"

In other words, I don't think we should be frightened to define some
levels (soc, som, carrier, exxpansion, chassis?)

>
> 2. If it turns out to be needed (hopefully it's not), allow some type
> of syntax in yaml files that allows a property to be marked as
> "required" in a "complete" device tree but not in an "incomplete"
> device tree. Alternatively, we could discourage marking properties as
> "required" if they're expected to be filled in by a board.

Another option would be to validate the soc DT with a chosen board,
just as a workaround. It would probably be good enough.

>
> 3. Define that there is no promised ABI between "incomplete" device
> trees and anything not stored with them. Specifically, all valid
> combinations of "incomplete" device trees with overlays to complete
> them should be enumerated together with the "incomplete" device tree.

This seems important, yes.

>
> 4. When applying an overlay to a device tree that's "incomplete", the
> top level overlay will be merged instead of replaced.
>
> Example for 2 levels:
>
> base (incomplete) compatible: "socvendor,mysoc-rev1", "socvendor,mysoc";
> overlay compatible: "boardvendor,myboard-rev1", "boardvendor,myboard";
> merged compatible: "boardvendor,myboard-rev1", "boardvendor,myboard",
>                    "socvendor,mysoc-rev1", "socvendor,mysoc";
>
> Possible example if we support 3 levels:
>
> SoC (incomplete) compatible: "socvendor,mysoc-rev1", "socvendor,mysoc"
> overlay1 (incomplete) compatible: "referencevendor,referencecodename";
> overlay2 compatible: "boardvendor,myboard-rev1", "boardvendor,myboard"
> merged compatible: "boardvendor,myboard-rev1", "boardvendor,myboard",
>                    "referencevendor,reference-codename",
>                    "socvendor,mysoc-rev1", "socvendor,mysoc";
>
> Obviously in the 3-level scheme we need to know the order that
> overlays are applied, but that's true for overlays today anyway.
>
> The above proposal takes the current downstream "state of the art" and
> addresses the known issues, solving the original problem statement.
>
>
> Other thoughts:
> ---------------
>
> If you don't like the proposal, I'd be interested in knowing if you
> have other ideas for solving the original problem statement, or if you
> simply think the problem we're trying to solve here is an invalid one.
>
> I'm happy to post up another revision of my Pixel 10 device trees
> following this proof of concept (or other ones). My v1 was _very_
> close to this, but didn't have the "incomplete-compatible;" property
> and didn't implement top-level compatible merging.

This proposal seems good to me.

We don't need to worry about old bootloaders since they presumably are
not installed on new hardware. Assuming Linux adopts this proposal, I
am sure people will implement it in bootloaders when they need to.

Chen-Yu, thank you for the reminder re my extensions thing for FIT. I
had forgotten about that. Here are some current proposed FIT
additions, BTW, in case anyone is interested in taking a look:

https://github.com/open-source-firmware/flat-image-tree/pulls

Regards,
Simon


>
>
> [1] https://lore.kernel.org/r/20251111112158.1.I72a0b72562b85d02fee424fed939fea9049ddda9@changeid
> [2] https://source.android.com/docs/core/architecture/dto/partitions
>

