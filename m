Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A39CCAC58E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 09:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cCj3Q3naHzqXegaqSInVQDC2Zcbf4MW8x6sxX5pqavE=; b=VbnvCGVCjYlHZ42zjCQVz88gWj
	EDBfrcN4FumuLMqGCei5wW6HZHVdesjMyuPusjZXQ6SJVCn9J7amMtwyi7DVaPo5PddVwpEmufJ9w
	0Dd9pVSQ5oxHXybTtToLLFrXUolPD4Dmzioqzs0f4uxZkR8iUq9+NAcEPq0WJ+13m5kXe63TlvC0+
	Mw/0pI2Du4gsUJK0zYDDO69tZwWgYpCP2XmeqUWD5GVG2cZf5VH79hAvvqKQd8mbGg56CKL+5eevo
	ZO84CcDSwiIFlPSr3Wo5w9b/I761pQFop6K24/xeRZwmPFixiLNXwbcYOyokhT41st5fR+FZ+QGAa
	DfyeCPpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy59M-00000003Mlc-3PAK;
	Mon, 15 Sep 2025 09:05:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy59L-00000003Mku-11xV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 09:05:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 430C840A9C
	for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Sep 2025 09:05:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26BABC4CEFB
	for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Sep 2025 09:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757927126;
	bh=cCj3Q3naHzqXegaqSInVQDC2Zcbf4MW8x6sxX5pqavE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=NHFymLEImSuJGzDSX72RVOO3xWU/oDfeIqRocIOvKGq1klMWCUxwDJ6y6j7jxnEAp
	 RtBzpd9WWaFckwHwal0j2EGeDomr2FsiLZujwcjhJmGpTp9jpxzlSCtnlymug70BP6
	 W/REXlSfQ9YtqCy8451pyvHkXXeaqUV1WV2wqedNmz/B8n1itRJcVc1BA5b4q5fghs
	 2ZggH6dZomUJ60RK/h2t5/y0CVBJ+DB9f8Q+s2fiwSKkOu33XzsAqY91rj5TcdyEGa
	 aGQ12g2Hawa9IaHmS5WnLh3F9YlTU40yP2jVPy8d7vPmJ8ccYFpvDzK/jdD4vhNIkR
	 qtjDzsDSKVMWQ==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-571a58b385aso2820526e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Sep 2025 02:05:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXSghhEZahDo9F0LZaDHPcntSip3ONbK0plS+eae/Fsden8WwvAIxhLGmYWh9HvVShVBZUDsPaGlf9GyjmsUeax@lists.infradead.org
X-Gm-Message-State: AOJu0YwBv+1B1rcbmt76mDeYLCrfQ3Zp0ItqWayMRZ8+bc/dnYyVYk2n
	NXaR47KOmT5UM0XQAIUytjxyClJInzJWJCHydapuDCjyeSq7I6xv/O9/HDThjWC9nm02+jWqq3H
	o9bVl7R2S5yT714uKNPUmeOPDsGppYXA=
X-Google-Smtp-Source: AGHT+IHU1JbnB8Dh8mhdaqmGNO8VcLGfN29A2e1tVWDquY0zzLdP4Hbu4WOrAduP5n/lZYPBwgBXJEB6omijdgk4+c4=
X-Received: by 2002:a05:6512:3b20:b0:55f:4d2e:2caf with SMTP id
 2adb3069b0e04-5704a10625bmr3730109e87.18.1757927124489; Mon, 15 Sep 2025
 02:05:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250905133035.275517-9-ardb+git@google.com> <20250915085244.JLUfpdSP@linutronix.de>
In-Reply-To: <20250915085244.JLUfpdSP@linutronix.de>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 15 Sep 2025 11:05:11 +0200
X-Gmail-Original-Message-ID: <CAMj1kXEonDpry5ZJoApGfqP95qFByAWGxcCFtfFycspT6-V8Rw@mail.gmail.com>
X-Gm-Features: Ac12FXxK1bPiaQoP3Diw47u3wwrVfevGyCRg0i39vc5cUJTuroUZlBx2hlvMe7A
Message-ID: <CAMj1kXEonDpry5ZJoApGfqP95qFByAWGxcCFtfFycspT6-V8Rw@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] arm64: Make EFI calls preemptible
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-efi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_020527_323719_01C73B3B 
X-CRM114-Status: GOOD (  20.59  )
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

Thanks for taking a look.

On Mon, 15 Sept 2025 at 10:52, Sebastian Andrzej Siewior
<bigeasy@linutronix.de> wrote:
>
> On 2025-09-05 15:30:36 [+0200], Ard Biesheuvel wrote:
> > From: Ard Biesheuvel <ardb@kernel.org>
> >
> =E2=80=A6
> > Note that this is only a partial solution in terms of RT guarantees,
> > given that the runtime services execute at the same privilege level as
> > the kernel, and can therefore disable interrupts (and therefore
> > preemption) directly. But it should prevent scheduling latency spikes
> > for EFI calls that simply take a long time to run to completion.
>
> That sounds nice. There is no feature flag that could tell if a specific
> EFI-call (or any) will disable interrupts, right?

Sadly, no. At runtime, the EFI APIs that manage this at a higher level
of abstraction are no longer available, and so the only available
option for firmware to ensure that code runs uninterrupted is to mask
interrupts at the CPU side. Everything else (timers, interrupt
controllers) is owned by the OS at this point, so runtime firmware
cannot touch it (even if it wanted to - it has no idea where memory
mapped peripherals live in the OS's memory map that it runs under)

It would be nice if we could sandbox this in a VM but that is not
straight-forward.

> But if the source code
> is available, you could check.
>

Even though much of the code is based on the public reference
implementation, the tweaks that require playing with interrupt
masking/unmasking are often part of the downstream, closed source
forks.

