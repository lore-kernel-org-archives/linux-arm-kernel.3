Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B331C982F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 10:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UWyw6GenqzB0Wv/KjUzt8dv4Hf93e69h31+KA7jwNuM=; b=BVOgCt8HEWB4s4pd3BFvQQDq4K
	slbTLYty20k3ZQcWIar3CJLz/tDp1N1TFttmTqZaFbNh+doPFzOYNNACOBLbIDbqw21NWIT+EFVF0
	MojfbYATAU2spKJIozGR9PWp+F/oCKsW1g/Btmkm0jpliMwrqclwwPec1lORrMDXdiyxSuxecff/q
	Jv5ZdSmfBDuGsojhekkZA3aoZzlr6IGJQv5rMvXA36BbZHglf6dgB7welZP2AQMtU7BBpo0D8AqG5
	8Qgz2zKFztmjwvMMrzqHwx7UVp3d+BKVx/Y2sIxpha6FFi28/O8Pf1xhjbDyOwUooRXPoJmx2VWKI
	Jfj486qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8xUv-000000051P5-14K5;
	Tue, 22 Sep 2026 10:13:13 +0000
Received: from mail-vk1-xa30.google.com ([2607:f8b0:4864:20::a30])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8xUs-000000051O4-3pTO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 10:13:12 +0000
Received: by mail-vk1-xa30.google.com with SMTP id 71dfb90a1353d-5c985f055b9so861806e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 03:13:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790071989; cv=none;
        d=google.com; s=arc-20260327;
        b=Ocb1px10+otccin2epyvmmfq9Yk/cV8D2S93c8nPuHnNHrA4hj6KxAxAtXXP4gtIkY
         t7y5E11uBFvtnbkpre6CdXPtRR6QmaBwDh0z2/TZ/w5xeYGsjj0zAJchpPAkn8FkdJhP
         lwx9t8wFkzs8U8vgZdh5Epo83mj0BNSWM5k/nD7sxN8wYUpyP9ABSb2K2KQPcaIAZuBa
         CWySQXV3S6Ccl2y/dwrIaJ0x85xJ+meLKu+KZmHuCsag3YFTWhQtsQyJVfOePlrIz9Tm
         NVWNsosNYf3ZsVUgtOFyRjxKya2OqCsQp61BudSSr0+DfKjFSawEmVVv1b4I2mdD+Eyj
         OJ2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UWyw6GenqzB0Wv/KjUzt8dv4Hf93e69h31+KA7jwNuM=;
        fh=IsjcKOCpM7UPLnsNlduj1gqCUoKHHtl0gO2+/XcSgYI=;
        b=R05H6SJjBzncSMQexng6DKRAQb/HSfhQH0sOG1Pm1W9if9QKokdQHeIXypaHKcN3A3
         f640FNCo4Zm0f/KVwAe/ip5Y+jiSpVPc7kuiUUVpaQ9/zYald4uZX+WwdlVTSVv4848B
         fFe/SYae0OkbXP0pwgQAwzkbLNqT7RtlixSJHtbtBTEt0Cw1+8zacA66MqlVv9gSQ1lZ
         5qT2H82jSpk4IAB+xhh1pGuQP35jtDiAuw7s4SCZ8iMBrdw1CoFLzBRPh2bwgb0CG1e4
         7FtRJYHz3bN7TkF5bAZsypbph0bCPAUobVbgrK9YXUWjmO4A1Bzc5KweKFmkrN8xOOyj
         rYMw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790071989; x=1790676789; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UWyw6GenqzB0Wv/KjUzt8dv4Hf93e69h31+KA7jwNuM=;
        b=DLj1lPRXxjPUnXdRcKdpwXtECsXSa3CdJPkXOnM6BJJJ/rpIXhaGKs6jK/t6nVp/nH
         16KcF0WwFZRJdANtMcY/tL7wAko7YqEPiPTQ+xh8HWe5xzyJZkmN6P25vdMRWxhdWHGd
         z1tSaij3Ikh2WfF7RPG3FH9L2e8MEo5BVU2O31H4zH+VGCtyhvER3ZM4XJnVg5KQrT+K
         Ybxv6OIsXDAAooCnbvJAsZddk3k+le3YDOlmGs9ufW6mDlBhitYN+E3Zp3ns6ENFsylV
         SwtNz+LWIAq+eZMQUsyZG4hLDZJAzr+QGG7JUkenscmEpRkYq4T+GyscmWV2fQVzJl8w
         KQvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790071989; x=1790676789;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UWyw6GenqzB0Wv/KjUzt8dv4Hf93e69h31+KA7jwNuM=;
        b=Hko2u+5G57CpSTpRievZk33fueU6VNkLkti1tbJQaJ9WgRrPHk2upZNDu3aZmnoZ47
         KSdAviijjsnW4lc5SH9kCotaJVAPLWhDFmC6Fi5YrCc9gtvEtq8efCcadHF9a4ainGGj
         w4B5yiaCbojHQqCdeiFBz3z5zvV6QEeJsodKew1WiwCPznrZ5DvtZYzl7iTfSeyRKfRH
         2p1UvwA4oj6dplSrXT5rOCRTx95RRyPImbRdmjU8v5jK2EvCXamI4si/Vr9cVRIbDLoL
         DN2yhSDtTHaXK0Ic69glA3wDbwWas2YVfmPdVuDAlvoJ14c53EXOpBQr/Bao336Pk1XW
         6V6w==
X-Forwarded-Encrypted: i=1; AKwUvBz62dElr82ZuXoxFNm6DUVumDZjd4yi388q3Cd40s9Dks8tB1mnDLaAqbdxYc08MIhOwy9KobKPWSyM0C7VuZql@lists.infradead.org
X-Gm-Message-State: AFuF++kZdADHJ8yBdDRewd3RDBWLLJHxI73Lce9iSfAbikjrZ50uVx31
	UcLFKzHuCxYjMVLUHgpJo7NF7T79WVgpxh41U0OxNbOFjDfIbFNEBL0EwbwjmM8vEswVHy/vmNn
	1sGCWC2UJy5bQFitaPiiAn0lq+CKzn9U=
X-Gm-Gg: AYBFou3bLVtWFqpJuh7Uz5HjrGfI30Nw+vpA9Z/x3uOrTMpywoDe5H0NvcrJydPrpji
	clAj+Am3SxZq7rKJGF7T7g81XOw9Y2Wod7GiryZNAHtDAWFlh9r7rZoF+B0Y9K00OAwbpRn5VsW
	0v02KIkXvHIQzkk+g4wCC4OhfyoS4d0Yf/4AgEHpT5onQN/u+7Z5vcXVDGPU5WaWgbU4dITBZVf
	cR0OANvJKhKGQi8jBcVopI7uMYhzBpNz+qMAIWZxXOQ9fsd3IP+uyYDaMRxvDzE8GcV2b5hWtCi
	+5Ik8TtHSRWDsFosLvakvzItegyV2VNkN/HMtE1MYZhKvIEiBk3kYg==
X-Received: by 2002:a05:6122:2b8a:b0:5c9:9f03:cb07 with SMTP id
 71dfb90a1353d-5c9e343983fmr1483343e0c.2.1790071988975; Tue, 22 Sep 2026
 03:13:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260916235200.20712-1-ansuelsmth@gmail.com> <20260921135933.7e8857ba@kernel.org>
In-Reply-To: <20260921135933.7e8857ba@kernel.org>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Tue, 22 Sep 2026 12:12:56 +0200
X-Gm-Features: AcwNN1XO-IQtQQeBFy8m7z0RqgCFyAn_vcQf_nLSSDZxar5hmkBbTIMafTrhl4Q
Message-ID: <CA+_ehUwy9RUKCCHDnqoED3AMVnErgGr9RCrCR4ceg5QONq1wOQ@mail.gmail.com>
Subject: Re: [PATCH net-next v16 00/12] net: pcs: Introduce support for fwnode PCS
To: Jakub Kicinski <kuba@kernel.org>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_031310_959706_17C6B58A 
X-CRM114-Status: GOOD (  24.02  )
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

Il giorno lun 21 set 2026 alle ore 22:59 Jakub Kicinski
<kuba@kernel.org> ha scritto:
>
> On Thu, 17 Sep 2026 01:51:26 +0200 Christian Marangi wrote:
> > This series introduce a most awaited feature that is correctly
> > provide PCS with fwnode without having to use specific export symbol
> > and additional handling of PCS in phylink.
> >
> > At times there were 2 different implementation (this and the one
> > from Sean) but Sean agreed that this can be picked and used in favor
> > of his implementation as long as his case with race condition is
> > correctly handled.
>
> Looks like the review for one of the patches failed so it won't be
> emailed out:
> https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260916235200.20712-2-ansuelsmth@gmail.com
>
> Are all of the issues invalid?

Only one is relevant, but expected.

The remark on the fwnode patch are invalid. The driver is expected
to return those error as probe defer is not supported.
(a notifier and late attach/detach is used to align to phylink logic)

For the specific Airoha PCS driver it's really speculation from the AI
but HW doesn't work as described by AI.

The only real comment that is valid is about the alternative way
to give supported interface with the .get_capabilites OP.

This is currently not supported as there isn't any user and it will
be implemented as soon as there will be one. It's really to limit
the patch delta of this change and to progress further.

Maybe FIXME might be suitable?

>
> Once the AI review is cleared, some human will have to review this
> and vouch for you as a maintainer. Better still be your co-maintainer.

I think some revision ago there was Andrew that reviewed some code.
Anyway thank a lot for checking this once in a while, I feel it's a pretty
important change but I understand it's complex to handle as it does
introduce a whole new subsystem.

