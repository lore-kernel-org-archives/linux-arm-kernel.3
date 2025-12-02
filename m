Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96133D12671
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 21:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CJjbgV1eS7BL1xy0Zf+xm5L8Tso2mARa+UsmChy1VOc=; b=y2iSgBsTt5AbErYazfw70LORBp
	rlusJ3yfV1uXnhtPEk49RM/wDtqXAAq63zwqxcMYqVWr92F+6+ZZiQjzVMSLfF0xcvJK7zlikG4QS
	xPP15ZKeos+sqQMJfB2+T++WN8t9XIn0vmGdmdZupgOxv0aNJC2g3Ces10CRRNi8IbFVA/8ANAFtP
	Fx6OB7NItR+uKr02+zorOwQCbq/QBPVvjQQBNFHdmjCkBm/3o4YBmVwZF1NU0hnaYuqESo9fA5qbP
	2EgtoSenufKhRWvY9cJo3Hg7f02QHBAnaeYVwuPw0u2DQ9AQ2L1mnf8wRFNJhyd29mrJC1QIY5GpT
	ayks2j6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQYOE-00000005rnl-18ag;
	Tue, 02 Dec 2025 21:58:30 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQYOB-00000005rnN-1UcB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 21:58:28 +0000
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-4ee147baf7bso44231cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Dec 2025 13:58:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1764712705; x=1765317505; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CJjbgV1eS7BL1xy0Zf+xm5L8Tso2mARa+UsmChy1VOc=;
        b=ZRfBMQVcfh4DhezHlHHiBmEz/fWXJ09JBCuSrkgGRebMU5XymEu4LeokhK/KUajwSQ
         NAWTSynW1ilVb0bCm2O6ZRLrujdwSihLZyYMc9olvbxK8I9YH1iCGpltMcN2pdhgWemg
         rQZ+WqZ9DKqi4xSbrt/HhVF6sCDSaVfqVUYGI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764712705; x=1765317505;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CJjbgV1eS7BL1xy0Zf+xm5L8Tso2mARa+UsmChy1VOc=;
        b=ngSAn9OFkZmLJ4MjM7sKJFo66amzIg2Bw3pGB5vITBI8CJ5ZRAcZjijGCEaWv6eGsN
         es6aR1aGazFuGw2qvI5fX2UH/+z11NTvJztoJ/9rFsTfmWEA8HmBP7d+N9PU3VDaNozI
         A+TRriKLNnpVGklRoHzMEOZRqEXHphXJBOhRJ5fltBwemstGq4ij8EurelgQ+GApuHMK
         2eexeaQ/3o/jRrxvTmvS7nYsRWDjqcQ6UYRweA62X17HV0xRM5oe/iM43OBfzRiJMbnz
         xbqvc99zvdrnZ6katkztxaI72ag+d1arzxtl0bIp1ph0MPWgov9lOY8/gMpMHNr26XoR
         UDqA==
X-Forwarded-Encrypted: i=1; AJvYcCUFtCt/wsXrgPx/0XgHaf3g/4MgQsrGWnhq6Cp470VO/W7JdZ5acb/ED3J9AV48q1oc0uWFiNAPm4hCch+os1/P@lists.infradead.org
X-Gm-Message-State: AOJu0YzZU7WQILqyhtU6QkwdFk9UE+rVeiujpHtsmw08NqgKniMlbd6B
	60r/jZguPyyaDkcD5CeH80qprkCWpSbzmobztELgHlhjy601QWckdKQFjirEcnn5mk4vH7a9lZg
	DEaeMemfVq9hYPjDJoURuh2IlLlTr5E1TULZMg3Ss
X-Gm-Gg: ASbGncv9Sgc8wEpHjFWzj3R0MabHoxtpqGGWvR8mwQbNvYi5qDfV/2Z5seVCEgWyHkm
	uyRDGLHsMOa0tUreuhq8k8pIHmnLDOMdqqUGrdHnw3Y4xAtG8Rg47tW78wVt+ZmPSXNfXq9vfrP
	pJVdHSJsCnYEVUjIVxZH2svqE5UHv0PFxiuaglNVwnmxRTK+UvidRMYPC9YTrvDD4tmPAoAHSdC
	E14yueta3JKQMEeVdYrFY/cqWTSE3u9G2AiRu2MkxAD+YkcO+b84z9lMEV1SWNvEeSxSxG1ap3k
	Ml3kb/BPvUCJ0OGJz2AmJaVhgA==
X-Google-Smtp-Source: AGHT+IEJoS5cQUm7MFcrbQhQAjWCi7MPicot9CgewN6+69XnOFKD7CHPUUCC8pAzsPq0Q5gpd4+wlqL6QT0KlUSuYos=
X-Received: by 2002:ac8:5d53:0:b0:4ed:5f45:447c with SMTP id
 d75a77b69052e-4f0156dbae1mr3031191cf.6.1764712704587; Tue, 02 Dec 2025
 13:58:24 -0800 (PST)
MIME-Version: 1.0
References: <CAD=FV=Ux7nGFnYEyX0cUL-9__BKnTYc+kAJjkF458ZnFS7zoJA@mail.gmail.com>
 <aS66WcLPm6e5rdyk@shell.armlinux.org.uk>
In-Reply-To: <aS66WcLPm6e5rdyk@shell.armlinux.org.uk>
From: Julius Werner <jwerner@chromium.org>
Date: Tue, 2 Dec 2025 13:58:11 -0800
X-Gm-Features: AWmQ_bnC9qaigXasflKJ8xzyBPfPJVnrPWglxYBrFOsLQ65Ccm6SRcf2WhMDLSE
Message-ID: <CAODwPW-sBSZfzbTnYLcGr2sN=+5p+okUeJEJeVvJOHCx3JbOgg@mail.gmail.com>
Subject: Re: Proposal: Officially allow "incomplete" trees as a base
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Doug Anderson <dianders@chromium.org>, devicetree-spec@vger.kernel.org, 
	boot-architecture@lists.linaro.org, Chen-Yu Tsai <wenst@chromium.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	William McVicker <willmcvicker@google.com>, Julius Werner <jwerner@chromium.org>, 
	Conor Dooley <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_135827_407209_C3CE8B57 
X-CRM114-Status: GOOD (  41.80  )
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

>> Is there really a need to merge the compatible strings in your case?
>
> Well, you could just require duplicating an overlay N times for N bases, but that doesn't scale

I think my question was more along the lines of "is there actually a
reason why the combined compatible string needs to be that accurate"
(i.e. contain the right "socvendor,mysoc-rev1" or
"socvendor,mysoc-rev2"). What is the purpose of having that string in
there? It wouldn't be used for matching which DTB(O) to load in this
case because we're already past that step. It's not used by the kernel
directly for anything as far as I know. Is it used by userspace
programs which parse /proc/device-tree/compatible in order to detect
which SoC revision they're running on? Because that's the only use
case I could think of that really remains, but I'd argue that the
compatible string is a pretty poor vehicle for things like that (it
would be easier to parse and use to just put a `soc-revision = <1>`
property somewhere). So if this is the only problem I'd say maybe just
don't use the board compatible string for that, don't expect to be
able to find such details in there accurately. But if we do think it
needs to be that accurate for some reason, then I'd suggest platforms
like this (which should be rather few, e.g. only those that really
have a socketable SoC with differentiations that are so compatible
that other than this identification information itself it doesn't
require any device tree differences) should simply have their
bootloaders rewrite the compatible string into the right format with
all the necessary information manually, rather than expect the overlay
application process to create it correctly.

> There is a proposal here[1]. It's simple, but I do wonder if looking at the root compatible only is too narrow of a view. An overlay could target a connector compatible for example.

This seems to just assume that every overlay matches exactly one base
tree, that kinda defeats the purpose of overlays in this case (sharing
data between multiple base trees). For our purposes we need a much
more complicated system that is able to stitch together an arbitrary
number of overlays based on identifiers specific to our platform.

> However, it isn't that simple. For example, when the Hummingboard2 is
> used with the iMX6Q SoC, there's a SATA device present in the SoC level
> that needs Hummingboard2 specific properties to tune the signal
> waveform. However, iMX6DL doesn't have this SATA device in silicon, so
> the node doesn't exist in the base SoC DT file. The situation is the
> same for Hummingboard, but the tuning parameters, being board specific,
> are different.

I think you would solve this simply by having more overlays? In that
situation you can have a imx6q.dtbo, imx6dl.dtbo and
hummingboard2.dtbo for the generic nodes and properties relating to
each of these components, and then a imx6q-hummingboard2.dtbo
specifically for the SATA tuning parameters of that SoC+board
combination. Your bootloader then just needs to figure out which of
those to load for which platform. (Of course there also has to be a
toplevel DTB, so if you don't have any further revision or SKU
differentiation above that then imx6q-hummingboard2.dtb could simply
be your toplevel DTB, containing those tuning parameters, and the rest
could be overlays. imx6dl-hummingboard2.dtb would then be an empty
toplevel DTB (save for the compatible string) if everything else that
makes up the platform gets provided by the overlays.)

> The other issue would be the /model property - for example:
>
>         model = "SolidRun HummingBoard2 Solo/DualLite";
>         model = "SolidRun HummingBoard2 Solo/DualLite (1.5som+emmc)";
>         model = "SolidRun HummingBoard2 Solo/DualLite (1.5som)";
>         model = "SolidRun HummingBoard Solo/DualLite";
>         model = "SolidRun HummingBoard2 Dual/Quad";
>         model = "SolidRun Cubox-i Solo/DualLite";

These can also go in the toplevel DTB. Basically, the toplevel DTB can
always refer to the most specific cross product of components and
contain properties like these that only make sense for the specific
combination. There will be a lot of toplevel DTB files, but they will
be for the most part very small. The "meat" of the device tree is
factored out into overlays that can be shared by multiple toplevel
DTBs. The benefit is smaller image size for platforms that need to
bundle DTBs for all possible variations in their kernel image (and
whether that's worth it or not is up to each platform, we're not
asking to make these overlays mandatory, we're just saying that we
have platforms that do need (and are in part already using) something
like this in order to deal with the sheer scale of supported platform
variations, and we'd like there to be an upstream standard for it).

> I also don't see a sensible way without something like the above for a
> boot loader to know the filenames of each of the components for a
> platform - and it would need to be told the order to glue those
> components together.

I think platform identification and matching which overlays to apply
should remain outside the scope of the device tree itself. The main
reason is that you usually want to compress DTB(O) files for
efficiency, and when you have a large list of overlays in a kernel
image you don't want to have to decompress them all just to determine
which ones to load for the current platform. So I think it's generally
better to let bootloaders come up with their own scheme to store this
information inside their file systems or whatever other data
structures they use to find these DTB(O) files.

