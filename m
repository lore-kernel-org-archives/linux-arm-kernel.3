Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F504FF8861
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 07:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hffe5YxZ9enS5KCElAXITVujz3rFnAmgcCceKcxI0jU=; b=dIdfnNs8Np/Yc70PiZU8t4KExK
	svVQ7wHO8su+wfqVE8cp+HcYsA6XuMFzCs8iwrVjSJa2/1sViLHHiyDcCuYX1rPITz+r+B5Plb0av
	sSfUI2PXiatmCdsK6fI5AQFruln+ws9Z9xjGdWyiA7WRAT6/SZ8Tp/3aUWK1EWQQf49t4e7rVwfVW
	IrMdbOka/YN9T1abTHE3tkTHH0IZXS9H0NePqPBFG1dL9euN5vlflhZu3/yuDropjFsJ/v8F0Y6Yu
	8bwzXn9pHO91lNRLnymIbNF2g2rYKGjWgHqyg6QKZWB5aAFlHbqyWyr2jrR9EsFaht3/QbGdhs2bl
	Bl4io1bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHG0K-0000000GKWN-2O6x;
	Mon, 27 Apr 2026 07:03:40 +0000
Received: from mail-vs1-xe2b.google.com ([2607:f8b0:4864:20::e2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHG0H-0000000GKW0-1W9l
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 07:03:38 +0000
Received: by mail-vs1-xe2b.google.com with SMTP id ada2fe7eead31-612d8a59cc0so3082973137.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 00:03:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777273415; cv=none;
        d=google.com; s=arc-20240605;
        b=VJePpmNS0AgvuCWwR9PDEwMwWYM3ZhL9Tbpi97vwBEuzg99Djb/yVkt73UpJ85GRm8
         4ntZhC2ZJQgfvbLmMpjT4EZiPJ9JW/INzrkF1+tHoSZhj53JvgwNoYs2oxcd5rYiX2Sn
         oGD/KvRspmqqkD26idi5EO59Ou0i5Q0PoNT/0+mGeUgO0gXwByFZHGVj8HL3iozbneq2
         21bHQT9G3PoWNJ5BLq8h30ovTZ1s0OxwGgJm+NNXmozLPoejbb0YxH3Ll8dQZVfDxesN
         bPoKntlynQXWrek1zJoiJ+8y2lrTmbVJsx5BQN9WtK/pNB1yIpI43djjoTT1EgSVLQ2d
         dvyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hffe5YxZ9enS5KCElAXITVujz3rFnAmgcCceKcxI0jU=;
        fh=xdwFS0BueBBct3LApj412fMM8bFgF7rPKZfcEG0YK8g=;
        b=KJqt6sKFN+ap9a5MUHkGa8ie9VZhOuDM/sOczfbcSFReDYn4HL0UeXZpp8yfWDMiMz
         Mb3A3Q4Ux2FsjFrNyGHPhfnI3jiBGdd/60MiUXhg7VCahumA5VK3iCOzZFJcwoshxJ6A
         cgUwkyKnh+8k16lKMZcDVlYftadHcOD+gTjTxm0NWPlK8i3ffYrUmB3HpfnJ+LfHHHWd
         QhXYOruYCZ6g37A1zyk/PBHvUozSMp7p7ZJdWQgwEvrM5itp9/YgRFi6yeNSJuOuMT8I
         SauPloOssYJj3MSY0n/RiyBTcFKsXLmYkAWry2zi21dCAxYajlATDIbolwOhjIw/e8Bl
         7Zsw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777273415; x=1777878215; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hffe5YxZ9enS5KCElAXITVujz3rFnAmgcCceKcxI0jU=;
        b=ZC7Y0SoMTmBtA3YpwKGCocTOZPfOGealxfA+yASo4D3d3/3oi5A3JFVP1uJiASR7hK
         6r0ia7zWN6GXkatTXasaCXq1xE8O7xndBGm/43NKwdInLCCL93y19vkjQsa19V6LSq8A
         RifLhQlbXgjzxhpSx4KDpEI92ld5L1khT9CI03+vSSyEQRMyFg82bdV42fd7q9ECvu0h
         7zB9yu6TOK0SeA7YKp/Xx8WWIF8X0d7dcrJBrT2zzfbM2/p0G2cl7LKQ3qgJoL75arNF
         FUiZt8ci3bVr21pRs59V+5bnmCsFzfAqS7rczxOl7TahxoyyAeu+dqyXgO6KGR6icUr2
         T2CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777273415; x=1777878215;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hffe5YxZ9enS5KCElAXITVujz3rFnAmgcCceKcxI0jU=;
        b=Gw7ikTlbOn3AF0A3ZdcenLeGvjp0j1vHc4iEIx3oPFrr3A0Idqk2mnFI/0KDLYK6j5
         5XwClE4kNIVDPgyT47sVdaWu5LugBQH/L3ROtuNNV83xdy4dWaqxk9kcpFI70822PQjv
         3L3swNNOn0uFGneu9W2yKL49UQFLf3xLs42q8rkxQRy++1fpdCSjRAXmO3WNVQh2l7Ni
         VGWFkuqWB0kD30Kay0i/LzcZyMlYxVR8LmLrOjj/KmeaUBZ29GLOAoi3n9MUldo2uv6R
         u/3RIYUYxvdYgfZPXRtOoAs+Gqf4lCF36dB5xp396FJn1D0u4/PpFOLMkK5gHgDahyWP
         +nSA==
X-Forwarded-Encrypted: i=1; AFNElJ8qFOQDuCgO4w6gRkFXSFYlNl0bLRQeaLpmel+ZbkjRMo1lafSKsM3gVl0KZ62MNLFfarB6XygxW3loUfwOq/P8@lists.infradead.org
X-Gm-Message-State: AOJu0YyvZd37aw/mfLywZrQLULUYtCVwkpouclxMZ8DBLK+132WObKLj
	NZOtJf3D0JnXpVxcimcFOtgQzNxuFMqXCZt96G35lfCDIA8Go0g0HJ9goKfhHMxRjVVXkLTozYL
	H2Q9y8hWtM34OjMZYaWuxOzNY6h7T1bTrJJmsqqkc
X-Gm-Gg: AeBDieulrQ3DoxZShBmNPD2QJ2hmpifzUHvqXWxsI3nXW45pvCmJddfQ622rTnz0uJw
	9k8bDX7tRgfCZP6yIZmk/jgKnoXMmBo4fuE3zPp+pD2Pqehl/31j1P7C+cVIQeLRWbHyBB5uQL3
	dG+R6fDWbLsF8LjV2bep0EWETqUXFOzj4A3UFTix75WGwRz6Qn45yfsmHUC59L6Xjqxnz2E+FhF
	VdjAzxry97q9OGMuEi4x7sVEu93vpi6fVR4nbCjmbvobTPEE0+7BVSpn/ZB3p3eIZ6qNGXAKcHt
	Zn5gQS6aguc8HuMqGpTEyyao0QFt
X-Received: by 2002:a05:6102:3f86:b0:607:7991:f02e with SMTP id
 ada2fe7eead31-616f8392189mr16279119137.26.1777273414448; Mon, 27 Apr 2026
 00:03:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260421225200.1198447-1-dylanbhatch@google.com>
 <20260421225200.1198447-8-dylanbhatch@google.com> <73e99161-c246-467d-96c2-46911ffc0bff@linux.ibm.com>
In-Reply-To: <73e99161-c246-467d-96c2-46911ffc0bff@linux.ibm.com>
From: Dylan Hatch <dylanbhatch@google.com>
Date: Mon, 27 Apr 2026 00:03:23 -0700
X-Gm-Features: AVHnY4KtKrvy0WTUUTyFTIFDf7aGdgUISg9FGVKdo0AdfDa0OxtNiPCZNoTiW6A
Message-ID: <CADBMgpz5Z0Vxz_cr3L0fsT6j7wqZrnLA7uLGabvYJV5EDoaPDA@mail.gmail.com>
Subject: Re: [PATCH v4 7/8] sframe: Introduce in-kernel SFRAME_VALIDATION
To: Jens Remus <jremus@linux.ibm.com>
Cc: Roman Gushchin <roman.gushchin@linux.dev>, Weinan Liu <wnliu@google.com>, 
	Will Deacon <will@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Indu Bhagat <ibhagatgnu@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Jiri Kosina <jikos@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>, Puranjay Mohan <puranjay@kernel.org>, 
	Song Liu <song@kernel.org>, joe.lawrence@redhat.com, linux-toolchains@vger.kernel.org, 
	linux-kernel@vger.kernel.org, live-patching@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Randy Dunlap <rdunlap@infradead.org>, 
	Heiko Carstens <hca@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_000337_447737_B6C604FC 
X-CRM114-Status: GOOD (  23.92  )
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

On Wed, Apr 22, 2026 at 7:11=E2=80=AFAM Jens Remus <jremus@linux.ibm.com> w=
rote:
>
> On 4/22/2026 12:51 AM, Dylan Hatch wrote:
> > Generalize the __safe* helpers to support a non-user-access code path.
> >
> > This requires arch-specific function address validation. This is becaus=
e
> > arm64 vmlinux has an .rodata.text section which lies outside the bounds
> > of the normal .text. It contains code that is never executed by the
> > kernel mapping, but for which the toolchain nonetheless generates sfram=
e
> > data, and needs to be considered valid for a PC lookup.
> >
> > This arch-specific address validation logic is only necessary to suppor=
t
> > SFRAME_VALIDATION for the vmlinux .sframe, since these .rodata.text
> > functions would never be encountered during normal unwinding.
> >
> > Signed-off-by: Dylan Hatch <dylanbhatch@google.com>
> > Suggested-by: Jens Remus <jremus@linux.ibm.com>
>
> With the minor nit below fixed:
>
> Reviewed-by: Jens Remus <jremus@linux.ibm.com>
>
> > ---
> >  arch/Kconfig                           |  2 +-
> >  arch/arm64/include/asm/sections.h      |  1 +
> >  arch/arm64/include/asm/unwind_sframe.h | 21 +++++++++++++++++++++
> >  arch/arm64/kernel/vmlinux.lds.S        |  2 ++
> >  include/linux/sframe.h                 |  2 ++
> >  kernel/unwind/sframe.c                 | 25 +++++++++++++++++++++++--
> >  6 files changed, 50 insertions(+), 3 deletions(-)
>
> > diff --git a/arch/Kconfig b/arch/Kconfig
> > @@ -503,7 +503,7 @@ config HAVE_UNWIND_USER_SFRAME
> >
> >  config SFRAME_VALIDATION
> >       bool "Enable .sframe section debugging"
> > -     depends on HAVE_UNWIND_USER_SFRAME
> > +     depends on SFRAME_LOOKUP
>
>         depends on UNWIND_SFRAME__LOOKUP

Ah my bad. This mistake was masking similar issues with .init.text and
.exit.text as we had with .rodata.text. I'll send a new version
accounting for those versions as well.

>
> >       depends on DYNAMIC_DEBUG
> >       help
> >         When adding an .sframe section for a task, validate the entire
>
> Regards,
> Jens
> --
> Jens Remus
> Linux on Z Development (D3303)
> jremus@de.ibm.com / jremus@linux.ibm.com
>
> IBM Deutschland Research & Development GmbH; Vorsitzender des Aufsichtsra=
ts: Wolfgang Wendt; Gesch=C3=A4ftsf=C3=BChrung: David Faller; Sitz der Gese=
llschaft: Ehningen; Registergericht: Amtsgericht Stuttgart, HRB 243294
> IBM Data Privacy Statement: https://www.ibm.com/privacy/
>

Thanks,
Dylan

