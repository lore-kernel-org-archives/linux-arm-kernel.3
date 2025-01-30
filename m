Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E079C02193
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 21:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v9cA1UeLXNARJOxVOlCXVATDoCFX4K7MnNcdOFH14rk=; b=WJbGWhK757WiG4mtZRG2Xy1FwF
	neCZUQyO7Q02GVUNA6bhp6b5YlLSMVqxlMvPODnfNCJsXklXiHvGfF10SP5CX3rgqVU9vAtgr2g6S
	adhN+baxSFrumpxR0j3sD4BC15dKryFL4/q0ODNKCXcK+Up4jzWu2bDFSNjtu16/LT3QHweorbw5I
	1uoOloJJIudQwVur3Q4YJ2u/fo54B+bJEai5RCicArkyLLgEGWwP877d5zUdeXAF63YUbFMzBYNBw
	Z1pyQ8xNEQBGaA21aTmBqyflK9MtH6cPhbMctMFEwgeYnvykxNWNEys7ZiPZOoCLLx6lYnMRp8WKI
	XvzqSr7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdcQj-00000009g0V-1dGl;
	Thu, 30 Jan 2025 21:50:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdcPP-00000009fs6-3yKY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jan 2025 21:49:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 551CA5C5AC7
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jan 2025 21:48:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DC67C4CED2
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jan 2025 21:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738273751;
	bh=v9cA1UeLXNARJOxVOlCXVATDoCFX4K7MnNcdOFH14rk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=BSkJIVElc5hm3FBv0tBJK/9SQvqb3rg2WqjDGiRayeIG18GV6uN/QXgZ6har2Crmy
	 2q01SbUOlCvwDptGAGz07dF2DroOh00wMr18QP6Ee0Qf72dVI7To6OUS+D367j7G41
	 MXrrU3ZkUjyZzyQrkiITZuLmqUObDhVsBMM3SgFy1pB+tE9ms6SjwPS+hXCWLTzlrS
	 JHASK6K81Pw6AWCOaBCbP/48B3nJ0snbcMBBtKm9F0GtGmXMQL4jcKZPRuayJoyJ4e
	 dSdm1AhrD9juO5Z9omChhaBsX1DJ9zJOGVow4GyHvoP+I5tuRAYRhTBiGhxtytxRlN
	 6b1q57SY1BJSw==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5401bd6ccadso1327593e87.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jan 2025 13:49:10 -0800 (PST)
X-Gm-Message-State: AOJu0Yzaa8e2VLE/C/D5UFpsLE+H3QJdr3sI9zc9EExXFfI01T3seJec
	+yXIopgN9x/vkbzWyZYW2i/HT/Xu2Jz8B0B2PrNwwZd/8RtSZrAaNm4UbPRGwdal5Y8YB1THA8A
	q9kx1x0IYv/v7+qQ+atPozGWYvO4=
X-Google-Smtp-Source: AGHT+IGvsZ9UV23BN7NAzI3cBwpZgGYzUNfAG/ADzOOwOyeo8NhgHVLMg1B/e14T3YmWFv4z3T9psdaM5dSo92pIl0w=
X-Received: by 2002:a05:6512:10d6:b0:540:20f5:be77 with SMTP id
 2adb3069b0e04-543e4be00e6mr3243865e87.3.1738273749389; Thu, 30 Jan 2025
 13:49:09 -0800 (PST)
MIME-Version: 1.0
References: <20250130204614.64621-1-oliver.upton@linux.dev>
In-Reply-To: <20250130204614.64621-1-oliver.upton@linux.dev>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 30 Jan 2025 22:48:58 +0100
X-Gmail-Original-Message-ID: <CAMj1kXHchMo1dMAd5N--vZOnegoci=kRDQ2N06dVZueixzzhaw@mail.gmail.com>
X-Gm-Features: AWEUYZnBwtpu0VhT2GWd3rq9lUk_NVWIl74tK03ECfTc-9lJwZURu3xgt8g3hZU
Message-ID: <CAMj1kXHchMo1dMAd5N--vZOnegoci=kRDQ2N06dVZueixzzhaw@mail.gmail.com>
Subject: Re: [PATCH] arm64: Move storage of idreg overrides into mmuoff section
To: Oliver Upton <oliver.upton@linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	James Morse <james.morse@arm.com>, stable@vger.kernel.org, 
	Moritz Fischer <moritzf@google.com>, Pedro Martelletto <martelletto@google.com>, 
	Jon Masters <jonmasters@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_134912_074124_CD6650A2 
X-CRM114-Status: GOOD (  19.44  )
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

Hi Oliver,

On Thu, 30 Jan 2025 at 21:47, Oliver Upton <oliver.upton@linux.dev> wrote:
>
> There are a few places where the idreg overrides are read w/ the MMU
> off, for example the VHE and hVHE checks in __finalise_el2. And while
> the infrastructure gets this _mostly_ right (i.e. does the appropriate
> cache maintenance), the placement of the data itself is problematic and
> could share a cache line with something else.
>
> Depending on how unforgiving an implementation's handling of mismatched
> attributes is, this could lead to data corruption. In one observed case,
> the system_cpucaps shared a line with arm64_sw_feature_override and the
> cpucaps got nuked after entering the hyp stub...
>

I'd like to understand this part a bit better: we wipe BSS right
before we parse the idreg overrides, all via the ID map with the
caches enabled. The ftr_override globals are cleaned+invalidated to
the PoC after we populate them. At this point, system_cpucaps is still
cleared, and it gets populated only much later.

So how do you reckon this corruption occurs? Is there a memory type
mismatch between the 1:1 mapping and the kernel virtual mapping?


> Even though only a few overrides are read without the MMU on, just throw
> the whole lot into the mmuoff section and be done with it.
>

This is fine in principle, but I suspect that it could be anywhere as
long as it is inside the kernel image, rather than memory like BSS
that is part of the executable image but not covered by the file.

