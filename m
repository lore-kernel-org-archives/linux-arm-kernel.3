Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7C72CF2561
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 23:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wfdgl45TlhUjROY1GcEYL/sA2/gyYtMo6GNhOZ6UTRk=; b=ZRL2vQtKSlDJVwqyLegQ/NKJ/W
	rw1fQ8w1EolSdvjCIPlWCMWVaf5Xzpf2C+B6tuQy2eharHeIMXTxz0q4OFD3W4JHsgUwlB+Lo/Cgg
	Zs+YaVewD1TDbIpmNCHwsIAJ7hb+F8dDFEw4lbcE/kkDYXUSxqJN6v9d39u7+Nfzx+rzzEWRfPnPt
	aMLxEajshc0PuZsdtU393nMuQ+ZycaJ4q+C8uj87aNIHh+I6L6IwISXW9tHH6ttIaFT5FREumJnGc
	VELek335TwWTA8aUw3j4tkJG26Da7bF/S/zFwdqj/nyZDk5dz+i/xFNw/4eKK04+TS49/GcxnDEWq
	MO15M6NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLVRP-00000001Fda-21ZP;
	Tue, 18 Nov 2025 23:48:55 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLVRM-00000001Fd5-1UmY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 23:48:54 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-59434b28624so1818e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 15:48:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763509729; x=1764114529; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Wfdgl45TlhUjROY1GcEYL/sA2/gyYtMo6GNhOZ6UTRk=;
        b=UaTHXqZuJGjIZ2oUPoI+s8cQoy2xHCxYkfJ5QJnI4b7CGdtwvNb13l2KaOa2fkOluu
         YCcPLplKeSMYJlb1FPaEtIBcjr3W2tyU96zZ1ElvxQAKQ/5/4km5sJ3Xj9ilQm8B/Y56
         7Yq944NO+aiup4gmWXHBUSn/hCSY4CLYbVgiA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763509729; x=1764114529;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wfdgl45TlhUjROY1GcEYL/sA2/gyYtMo6GNhOZ6UTRk=;
        b=sHGXghmDdd/ViJ1+SvTpoYQjV4qhiMfUFp0wHcXvRwi/F4HhA5BbM1NUOQiAhf0y0r
         eB9ABNOufGqFoqM12dYyBCwyB91nbnyVT5fgW0nCRxSfi4L4g6B6qhuKM+lJvUIEDpSJ
         H9o+cXwvChu9yyQUCVNCQQXs2QlavOBjwUOE03RCTrq/4NTmvSsn0gk0TckqPWSTbm4x
         eKTIJC+JqLi2/pEG1KSoGuGZmUT0DJG+f2oUKOwA6tIBk3Itf+22xd5++KVdI+EmQdW/
         asCiYnA9sCj0sZ0AT6OHhnHOmD0kQFp3oTE4G5PZ54CgkOd5OJwZyiCg9pvxp7rTqpDY
         TQbg==
X-Forwarded-Encrypted: i=1; AJvYcCV2ZRCmhXC2C53VDL2E3VKt15R0WQm7t/tBkBxcmHcXT4sL8Gue8peadYKch3sYibrT69nnczCQ3yxMVNXsfjY3@lists.infradead.org
X-Gm-Message-State: AOJu0YwB4N1RCxkTKqOf+oMqDUaeRoBQNX0X7AHZhCMdHe+O7QhKFrs1
	Bv7sZrsQJfGJSzRwfChDS2r/gd/7SVRRcdHWeCZzg1Rppae2VgFhBh+MV88NKKz9V0hAyEi+AQG
	jtjTEhwIT7ftmU4p8r1qaB7g/xELngy1W8agCk2ZX
X-Gm-Gg: ASbGncsgBVf6rinuMNp20AtoJJlLHw9XsB7TuTSfB+kt3H4Cl/gZi/ULTfMMxriroZI
	cIzBE7ijbWsCupMv79bwZI2RguOkkjZdFE2WaOumuFdx/CoCCN7qFehciAYAbyo1DPaifNAizfs
	HxSClRDLjK1WOIIauZNBaZYeJzENKP9gDCw8voAnEBQ1tTrOZ8UbDwL1vFHcxcE8TEAp/rmAce2
	aKd4vlBrFy1hWwGNdGqLeFbSSRFbfcaOCQflTJHq1AP1sX10kdqBs5mSPzySlqzlS2zy7PcnCF3
	lusjUp9qEQRIFKbglkkN2zECrOOhhE8smnh0
X-Google-Smtp-Source: AGHT+IG35LTA4LFVibGtlnZ9yjpDlUuNT0fzfs6wnGkoFLOS3t2IhLxzn2dmTxJ6BMd1TCS3ZfXdgvD3BM/PCeOjrX0=
X-Received: by 2002:ac2:5509:0:b0:595:7b9d:c04e with SMTP id
 2adb3069b0e04-595c6cb7208mr56839e87.4.1763509729048; Tue, 18 Nov 2025
 15:48:49 -0800 (PST)
MIME-Version: 1.0
References: <CAD=FV=Ux7nGFnYEyX0cUL-9__BKnTYc+kAJjkF458ZnFS7zoJA@mail.gmail.com>
In-Reply-To: <CAD=FV=Ux7nGFnYEyX0cUL-9__BKnTYc+kAJjkF458ZnFS7zoJA@mail.gmail.com>
From: Julius Werner <jwerner@chromium.org>
Date: Tue, 18 Nov 2025 15:48:32 -0800
X-Gm-Features: AWmQ_bntEbW9VJaqwe6WpNJTYWU6dC3uPbKkw63j0vy6Z95Gr2XVZ8XMupDqb44
Message-ID: <CAODwPW_51fKOfDQbTUFCum13M621Uxi2Zw2YHng0DrrwwvZhRQ@mail.gmail.com>
Subject: Re: Proposal: Officially allow "incomplete" trees as a base
To: Doug Anderson <dianders@chromium.org>
Cc: devicetree-spec@vger.kernel.org, boot-architecture@lists.linaro.org, 
	Chen-Yu Tsai <wenst@chromium.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	William McVicker <willmcvicker@google.com>, Julius Werner <jwerner@chromium.org>, 
	Conor Dooley <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	yupingso@chromium.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_154852_466338_C589CA0F 
X-CRM114-Status: GOOD (  19.70  )
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
>                     , "socvendor,mysoc";

Sorry, I only cursorily followed the previous discussion so I may have
missed the exact need for this part. But I would caution against any
proposal that changes the basic rules of how an overlay is applied.
The definition of how overlays work has (I think?) been stable for
over a decade now, and is implemented in bootloaders that often cannot
easily be updated. I absolutely support your effort to get more
upstream standardization for managing base device trees and overlays
(which I think need to be flexible for arbitrary layers, not just SoC
and board), but let's not break the overlay code in old bootloaders
while doing it.

Is there really a need to merge the compatible strings in your case? I
think in the vast majority of platform identification cases, code only
cares about matching the most precise string (i.e.
"boardvendor,myboard-rev1"). If we do feel like having the whole chain
of identification is necessary, it could be achieved by just
copy&pasting the extra strings into the overlay file. If we have
cross-validation between base and overlay source files we could also
have the validation check that the overlays correctly contain all
compatible strings from their base tree. If we know that the base
trees aren't standalone anyway, we could also just invent other
property names that identify them (e.g. `soc-compatible =
"socvendor,mysoc";`). Anything other than breaking the overlay format
would be preferable in my opinion.

I also feel like we need a better standardized way to tie base device
trees to overlays, like your `/loaders` node proposal in an earlier
email, although maybe that's an orthogonal discussion (but related,
especially if there's supposed to be cross-validation between base
trees and overlays). The compatible string is just not a scalable way
for bootloaders to make this determination, there may be a lot more
differentiation than just "SoC" and "board", and the scheme almost
certainly needs to be platform/bootloader-specific because every
hardware vendor has their own ideas about how to group and reuse parts
of a platform. This information doesn't necessarily need to be *in*
the device tree, it could also just be in a separate YAML file in the
same repo (since bootloaders will almost certainly want to have it
transformed into their own out-of-band descriptor at build-time
anyway, so that they can compress the device tree itself and don't
have to decompress each one for matching), but it needs to be
somewhere.

