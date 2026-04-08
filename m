Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 785F5FD5F87
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 07:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l4pMTBTUeyFRIOglfPk+qmI18Er2Hkt4GWuhLd69r8Q=; b=aX/eQPWiVeRG+XGlyVtUZL46+h
	C1HoxR3Vb42KBIsILZdfIRelXMTU416+eZiFM8hRI5aL85Qbvl3QKSYf1kBZnQ5WPpToaEA3IIp8M
	ELr0abiFC0FwRgJ1g31iLu269gvhghp2+FIeYzChZUzk14YJEEtrhY/1mKKQ6rfJqkKuqc8V5a5Ew
	KYbk2kbk7Qt7bwqJftxw8r9tFBvMYm8a6VLg/QMmCYubiEJJmFvT6ckQeMV4HK0ORfQa+oc5yBG20
	b0bEJAZeHmQDHcKdNQtAAW8NchLLlFeg0JNnMTwwiRLXZ5Q6dVZWVjqFkSqQP+sAho0LIHLf5+UPL
	lVGowZuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wANdQ-00000008SQu-16rB;
	Wed, 08 Apr 2026 07:47:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wANdO-00000008SQO-1DiY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 07:47:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4068043F2B
	for <linux-arm-kernel@lists.infradead.org>; Wed,  8 Apr 2026 07:47:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21F91C19425
	for <linux-arm-kernel@lists.infradead.org>; Wed,  8 Apr 2026 07:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775634453;
	bh=6FGBj6R+3TxRy3lV+rTYpY2sUBGm3uINry4jtIg9hmo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=rXQ4q2ULZrTR194/yg/YQc05sJXt8dCgV0yeKGyulNkmqpXy+tCd2qNDRyg8WzBYc
	 WVlQDBQauUo/4kcKlC4qaQJp+gXOzJubLk7Um48P/KR/vDL6+Zqp/T9UbqJuuQ7yS7
	 GGlTUYB9hWjyS0ATsxb5q4lIglsc0/GYBjKSEzAS2ndsjDZmuV7Cqq3tITdzES4Ohf
	 eEYavR2JHvowp7jmF7oM/mAECQ1LEVJaGUk7wxSaUGBfe0+nV9k0IR7GDylLbSN/Mz
	 X1HlBf8CwDzwutz2jBtrv+90Oi0tUSEZ7XFBonRTGLVSAJPrxHzovMyJPTq+f9JB/8
	 D1ZKOzhZrRYrg==
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-6501547d7edso6219979d50.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Apr 2026 00:47:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU1yNLD2KMnsaR11ARWQgqh6wf/57EXwba8vbraBw4iC3Z3ncoxpTzNUQFVtHPDEcsj0lJJI4ENoq9Sd9F3vscD@lists.infradead.org
X-Gm-Message-State: AOJu0YzwMsewVUj+/BP/9WUQw50hYZwGnB/ow7ib31VZ+dbuf5Ihnbo4
	obna7pqN1LJ3xfIMBkng49tWTwKg5cIyJ0akjyX+py14SbDUXIVcsDJe2Z85vqFIqfVauPLOCLw
	16amkID1pb6IZw+QwezlTcKOdBc0n5ec=
X-Received: by 2002:a05:690c:102:b0:79a:40fb:9346 with SMTP id
 00721157ae682-7a4d6d26cf8mr204354257b3.20.1775634452513; Wed, 08 Apr 2026
 00:47:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260306-aarch64-clear-pages-c-v1-1-77c1bb0f1c21@kernel.org>
 <ac7YJPo4Np2zxxEp@arm.com> <CAD++jL=G81=ueo7djqUETToE459kpFGniWvBwnYbJtmXrm8MFw@mail.gmail.com>
 <adULAT2xus5z3HdQ@arm.com>
In-Reply-To: <adULAT2xus5z3HdQ@arm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 8 Apr 2026 09:47:20 +0200
X-Gmail-Original-Message-ID: <CAD++jLmMxj1C7sGz-Yt8Y+NC1CbrUTTSH4QvcZfYuJAcNoYYCQ@mail.gmail.com>
X-Gm-Features: AQROBzCKD15vLZOPpJlr1WJAhz9pR_gLMWe3rxqqBD2IrNa8GJfdGMWD0iaN0Lk
Message-ID: <CAD++jLmMxj1C7sGz-Yt8Y+NC1CbrUTTSH4QvcZfYuJAcNoYYCQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: clear_page[s] using memset
To: Catalin Marinas <catalin.marinas@arm.com>, Ryan Roberts <ryan.roberts@arm.com>
Cc: Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_004734_369976_47D82348 
X-CRM114-Status: GOOD (  18.82  )
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

On Tue, Apr 7, 2026 at 3:47=E2=80=AFPM Catalin Marinas <catalin.marinas@arm=
.com> wrote:
> On Tue, Apr 07, 2026 at 11:25:55AM +0200, Linus Walleij wrote:
> > Quoting my own commit message hehe:
> >
> > > No performance regressions can be seen, the fastpath
> > > benchmarks differences are in the noise.
> >
> > This was tested on hardware with Ryan Robert's fastpath tool.
>
> BTW, have you tried the perf bench mmap test again with the new
> clear_page? Both with single page and multiple pages scenarios. And
> ideally on more than one platform.
>
> Will pointed out (in a private chat) that current clear_page() uses
> non-temporal stores while memset() doesn't. It may not make any
> difference in practice but it would be good to have some numbers.

Hm interesting point, the perf bench mmap test isn't specifically
in fastpath but since it tends to come up I guess we can add it?

Ryan: is it easy to add this test to fastpath? Or easy for me to do
myself? I looked at the instructions but they were a bit intimidating...

The test is the following:

    We boot the kernel with cmdline like this:
    "default_hugepagesz=3D1G hugepagesz=3D1G hugepages=3D32" to make sure
    we have ample hugepages. This was then tested with the same
    cmdline as the original series:

    perf bench mem mmap -p 1GB -f demand -s 32GB -l 5

    The first run was discarded as the memory hierarchy is cold on
    the first run. Then I ran the above command 5 times and averaged
    the throughput

The x86 commit cb431accb36e51b64ce34b5cc4d5ed292895fd84
also mentions this test:

perf bench mem memset -k 1GB -f default -s 16GB

I tried it on QEMU, no real benefits with either the previous or this
patch, and no regressions either. (x86 passes -f x86-64-stosq
which are some optimized memset instructions)

Yours,
Linus Walleij

