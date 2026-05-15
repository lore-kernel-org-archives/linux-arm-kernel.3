Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0297ECD4851
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 11:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=un4xKj6dT6ED2wP/JPzbfl3yuNb8MArO48PVmah0dIc=; b=i3wd07sJ3rwMLjlsqJ/you8ZLu
	4/vwKdDyJA2DJaH/G4yKuDz/zoTeJRDnOMxhFUxt4ibfvzI+keTwUYbvOMC7SOO1l6QM8yvggl/rK
	8Dq9mLzZ6SkQJUmN/er3dvJa+3YOE7Q/bKrTeE6G0cw3iArUR7GLlI/Oyf+STp33DHWX4VbsFsfpI
	FIe86RgUdoBYpZS3MLPND+dPVBvzjuhfj0j0zaDAkTsME1RRZnxNoFwACE90WZbf9n8MbuQ7EZRD4
	zENzatfEilmqz4l3jnwgGogVYbUa5qOHFK3tgYhOWh4NNF96Zyo/DhX25X0l8ZyX3ptoA7ueQaB1s
	FNBwQykA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNqm4-00000008CYE-1wDe;
	Fri, 15 May 2026 11:32:12 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNqm1-00000008CXU-1AWU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 11:32:10 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-48d1c670255so465e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 04:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778844727; x=1779449527; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=un4xKj6dT6ED2wP/JPzbfl3yuNb8MArO48PVmah0dIc=;
        b=ZGx3Nxo+9vz2RGhYtCbjVxIs3gMviewSOaymKP3+/On/eU839hwtO9c/rpnTZw//0+
         FuMC2wQimFg/r55MDgjmTKgvFH8jLqa2Z8Taepy5xzzHwO+Qo/85n7NC6h3oj/VxavEf
         FWMxRp9LkbZZvA5hffwNF3NJ+xocYqX45l4TOtSzc9CzE8Uea3L0xjKxTHupcPm8Hg50
         EWjViTmgYXpS8sJCuquigp3NVcU8GZjcVYC3ulhZxpAMqzdaBy24YwBnOTU+7Ppdh7fm
         9GJlsxhZ5BAL2SAaB+pkR+n6CfmaSH47ogU61psQSQUQeom5SaPqXYv6JWyVdfGSSVq2
         ntSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778844727; x=1779449527;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=un4xKj6dT6ED2wP/JPzbfl3yuNb8MArO48PVmah0dIc=;
        b=SHIB0oro23Ts5/9DPwu3d0Mq3CEWyVpFqI7giHx6R/A5TXm22IxbJLrMEVOTE8ZCXq
         prg4h9Awz8ls+KffILWwyKUDd9kWmk3b3MYgpmeLynz7jgu9aAXUN/w42IPjWf/pvc+o
         tdLHWBpkgtUNNO/Z3db6rStbfN+MX0YW8PhZJZwe/j5cqRWzfikmNql1MompFM2s8E4j
         sL4O2Rm2HB9b9DqICLnvCK3KDlxDEYiUldbBGl2LhovW+KNQuIiyL3U2jfs1JyAYSFhD
         7DW3E75TrHeI2ySvNY1mvPDj/6ay/SbTj7gr/WcbMajXDzDWScDtscIeHKSYgUCiL/O9
         ZFag==
X-Forwarded-Encrypted: i=1; AFNElJ+gm8XrMwgj8waZ4P56dUigQn8G5aTaiKj6CtrTlrU04cT/RuUVWr37faRMyjHjOiU0m9BSCvr0F5SAioyAnjEh@lists.infradead.org
X-Gm-Message-State: AOJu0YwqyjFkSbZ9Rc1jxukS9tTE0STH6ykKz8OgxAPUnV2zML3+kKDx
	m1eygDGr2wPhBNes5imhCZr4dJmUihyhKZ9zo8gOVKMgxyxefsEQiNomozBMhW/X+Q==
X-Gm-Gg: Acq92OFk1dDJkX0FnuT3MpNp5RAt7no+iA1UDK85aKj0HqSxaGvlvVF0e3/0tny2Swi
	JhPDU9Vr0CIqAw/Es/Pzwa3FNrJZTWEpljC/auUEbD04fiv946m8whozZtZm2omty1wVoZiIHna
	0Xd79vJs5KzKj06u9Z6iRWnifDs9arzh7wYo4uSjh6MwgmDCjeFepLtbghGyG2dDW/1Fch/W7pg
	GtBkdnUQoYY3FQ6GuRGg/AlWmw9flV2RBMacCneSsGEnZmfRkcBhPVQZitvRYNCFD5FK8w32Qtc
	k/A/Uwvo97cr3y/hvQhU9NP9CshLfbWbbLsbxM/8d1YtIOL1foE/PSSQteXuZ7LJtP6QAkOpY1Y
	Rauizwc8pip81FM0jWuPyjBXS8E0rxTs/fajccg2HBKdhgNUsQHsCEJiqDoq1RhkpsUDPzj6ezO
	i/mRTLihrZ0Jh45Fggjv89u3o96ZSa0b9bKVehSXPLks7SRbSQBu05
X-Received: by 2002:a05:600d:6443:20b0:489:1ace:d0d3 with SMTP id 5b1f17b1804b1-48fe8720282mr611985e9.3.1778844726885;
        Fri, 15 May 2026 04:32:06 -0700 (PDT)
Received: from google.com (8.181.38.34.bc.googleusercontent.com. [34.38.181.8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a19a0csm14106306f8f.20.2026.05.15.04.32.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 04:32:06 -0700 (PDT)
Date: Fri, 15 May 2026 11:32:00 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Dylan Hatch <dylanbhatch@google.com>
Cc: Roman Gushchin <roman.gushchin@linux.dev>,
	Weinan Liu <wnliu@google.com>, Will Deacon <will@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Indu Bhagat <ibhagatgnu@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Kosina <jikos@kernel.org>, Jens Remus <jremus@linux.ibm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
	Puranjay Mohan <puranjay@kernel.org>, Song Liu <song@kernel.org>,
	joe.lawrence@redhat.com, linux-toolchains@vger.kernel.org,
	linux-kernel@vger.kernel.org, live-patching@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v5 0/8] unwind, arm64: add sframe unwinder for kernel
Message-ID: <agcEMEl-QR0g6DgF@google.com>
References: <20260428183643.3796063-1-dylanbhatch@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428183643.3796063-1-dylanbhatch@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_043209_369077_89A3203E 
X-CRM114-Status: GOOD (  19.71  )
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

On Tue, Apr 28, 2026 at 06:36:35PM +0000, Dylan Hatch wrote:
> Implement a generic kernel sframe-based [1] unwinder. The main goal is
> to improve reliable stacktrace on arm64 by unwinding across exception
> boundaries.
> 
> On x86, the ORC unwinder provides reliable stacktrace through similar
> methodology, but arm64 lacks the necessary support from objtool to
> create ORC unwind tables.
> 
> Currently, there's already a sframe unwinder proposed for userspace: [2].
> To maintain common definitions and algorithms for sframe lookup, a
> substantial portion of this patch series aims to refactor the sframe
> lookup code to support both kernel and userspace sframe sections.
> 
> Currently, only GNU Binutils support sframe. This series relies on the
> Sframe V3 format, which is supported in binutils 2.46.
> 
> These patches are based on Steven Rostedt's sframe/core branch [3],
> which is and aggregation of existing work done for x86 sframe userspace
> unwind, and contains [2]. This branch is, in turn, based on Linux
> v7.0-rc3. This full series (applied to the sframe/core branch) is
> available on github: [4].
> 

Not sure if related, but after updating my toolchain
(aarch64-linux-gnu-gcc (Debian 15.2.0-4) 15.2.0), I hit link errors:
ld.lld: error: arch/arm64/kernel/vdso/vgettimeofday.o:(.sframe) is being placed in '.sframe'
ld.lld: error: arch/arm64/kernel/vdso/vgetrandom.o:(.sframe) is being placed in '.sframe`

I applied this series hoping that fix it, but it doesn't, so far I
have this hack :
diff --git a/arch/arm64/kernel/vdso/vdso.lds.S b/arch/arm64/kernel/vdso/vdso.lds.S
index 52314be29191..53bdf757ee44 100644
--- a/arch/arm64/kernel/vdso/vdso.lds.S
+++ b/arch/arm64/kernel/vdso/vdso.lds.S
@@ -77,7 +77,7 @@ SECTIONS
        /DISCARD/       : {
                *(.data .data.* .gnu.linkonce.d.* .sdata*)
                *(.bss .sbss .dynbss .dynsbss)
-               *(.eh_frame .eh_frame_hdr)
+               *(.eh_frame .eh_frame_hdr .sframe)
        }
 }

diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index 60c8c22fd3e4..759903acd6fc 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -1064,6 +1064,7 @@
        /* ld.bfd warns about .gnu.version* even when not emitted */    \
        *(.gnu.version*)                                                \
        *(__tracepoint_check)                                           \
+       *(.sframe)                                                      \

 #define DISCARDS                                                       \
        /DISCARD/ : {                                                   \


Thanks,
Mostafa


