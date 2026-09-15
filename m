Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1353EC88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 16:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cj8iWYGkmy9fr6Sp+MjBMi0cvssqzarl8Tgut8FUMEc=; b=KSMvXY7e1kDKGCaN1L9jQJHltt
	iYCXHQXndx2xJy20/e25Ilvx1O9oWSmtuLsFLC6iMlscBB7lBvjBFf/P5bXaxhCgfRnTdluHbDbb0
	Sd2lomQ0WJWCY9ZR2VU2rYfHwgUPLphiRUYzOte9lbcsrqMbnFtRBUnQefVFkbRoIa7M4GBgtXYAR
	yCMEBaqnbq7V5svjYg9s7kC/r79Lxf8MoSeD3dA6mGM8W5+Pj5wysBkkw14dJJvJG9aAavVoSwByl
	QGKtBUOY2B3xSi+/TWFevxiLOkkJh6T/BLaPEMrcFpW26LRunII114EPepPd+OErftT/uQv8D9dL/
	H/LxGuoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Vjz-00000007NCm-3rfh;
	Tue, 15 Sep 2026 16:10:39 +0000
Received: from mail-ed2-x10.google.com ([2a00:1450:4864:33::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Vjx-00000007NBu-23ut
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 16:10:38 +0000
Received: by mail-ed2-x10.google.com with SMTP id 4fb4d7f45d1cf-6a98604f6b4so5122250a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 09:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1789488635; x=1790093435; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cj8iWYGkmy9fr6Sp+MjBMi0cvssqzarl8Tgut8FUMEc=;
        b=fr8jAyng7YROt7oAVvZinCL8OzBdiYkAcqKGb2X0eDfZ7XV2XRSM69Q2bOi79n4H11
         F8FABXyrdZcCkiS5QnHgB+v2dUpMgSjU/n3iU1Aktd1eoaWoEm+0cfLrcGuj7cmn84ss
         5CQ38h/Ax3o0UcBSAY8LlDtINi0MqTG8NJcGM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789488635; x=1790093435;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cj8iWYGkmy9fr6Sp+MjBMi0cvssqzarl8Tgut8FUMEc=;
        b=pfsQLZP5O84il2X1igSdp7i9Y0U3ZvsCEDnX54Rf3qeB51ua3WnFFoU9a1iUkdp7dO
         gBCtMcxoV/eRfp5EgW6X5fVstgQwayRAQmt4l/w6glvomJQtRjqHb7XrvfbZ/0tYmcix
         h773l7IgwvuWIw3fOlUp969BAV7LwNn2jTpLJwz/+41O9GYvzyzlKqxxpchJGvfPp7QN
         UpVolqQlfAVFybfV3iFjwo0bKcRnH6Hnqsy8hga6WLNBDvk4EybD21/CimExYLgrxjmn
         EKm1GqIDaB5TAB/GvndqTsDRdB/O0euyd6OpI94QN42v2jGmAAL2v4MQb4XiTGs/omZO
         +mtg==
X-Forwarded-Encrypted: i=1; AKwUvBwyogYk5Sboy3jGzfZlzhIsMOYPxAmX2d3zwTtgiywoM0/0n7n7IYcewiPFs75SXx+fNtxMC86LLUyefJxGGSn2@lists.infradead.org
X-Gm-Message-State: AFuF++lTmXCLs4q3oEMeFQ2GLO1TBUl0UNNtGCDhaU9B2KNYHiYiA10M
	htaOhKx8wMLlT2aC5RPScLDLz6o3RgnUgn34QXSxqm/VwPIV4VNMXpXTfZJx6WKP+SaWjnfw7vd
	vBy4fCLA=
X-Gm-Gg: AYBFou1zEdQC0ysmZYqHAHHZ4uc34m6j0a/IPAWeZZMpnkEN89Xltkypte1fF6Yhu4z
	YkWZazejLIk/symxUvLbLJbPzAoU/zGqLXKUddI7rK2psJcVL66nEabWNz5gFTR4l9+C+8hixqH
	V8orFyRdn2eQrdBsym5x3nA7Symr+gmtmILNl2FXSDtd+8OVsaNXz/+Qa99MMzaU7PyPJ6mTxic
	MhgVBVVO/EJdX0u4xwTNxRlvp0K+r3oSHGvcF/pNrDfsu/N4iFEV69QJoycLCdMu7+Mkp+TDrBh
	a8horbyK1XTNP/AAkUKYIS9nrCRDTRHLrhSRgOA6SAcWDqjVCXJuT9IE+XwjP1v9JFOsmtYnA72
	xlDvVFnrC8q1SOapMOAV2+lk7/nMSKYhgApUDoh4vf52r2cDKfs07Bg0CKVY+FqZJr+cUMXqTRM
	FANZBekR0mplDIqRiKPUkUdYul58vlbJflY4vm0WCpM+J1s9EXeiNp1weYJct91IHvLRC4l+Wb0
	x+4sEaH6K0cntWO1MtEEKz2imoeyKoSxZrDjSWp8tU11u4Ugg==
X-Received: by 2002:a05:6402:a5ca:10b0:6aa:4a7:5e10 with SMTP id 4fb4d7f45d1cf-6aa04a76141mr1906531a12.7.1789488634800;
        Tue, 15 Sep 2026 09:10:34 -0700 (PDT)
Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com. [74.125.228.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9b5830e39sm5849653a12.2.2026.09.15.09.10.34
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 09:10:34 -0700 (PDT)
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c293c683202so503602866b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 09:10:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwzEzV4fI7VyMsZs3gHP1L0X/i7Nu1Lr/joMk95MxC8ktjtji37CYJ/xkJBVmry5hm1qnQw9j/9W/f3pADppbwi@lists.infradead.org
X-Received: by 2002:a17:907:cd0d:b0:c29:439b:d5c1 with SMTP id
 a640c23a62f3a-c29b86141b9mr553591866b.16.1789488168046; Tue, 15 Sep 2026
 09:02:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260915-work-fd-reserve-unify-folded-v1-0-4d5217d6b246@kernel.org>
In-Reply-To: <20260915-work-fd-reserve-unify-folded-v1-0-4d5217d6b246@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 15 Sep 2026 09:02:31 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjeamU=_RYT9cR3dZJ2N-Teo-N1+aYh7jwhrB=iWXD0cg@mail.gmail.com>
X-Gm-Features: AcwNN1WK06t9f9BcKFBIanysXcyUXK4eRICuH4x14s60AdlpF6ijCATIYaYAAvQ
Message-ID: <CAHk-=wjeamU=_RYT9cR3dZJ2N-Teo-N1+aYh7jwhrB=iWXD0cg@mail.gmail.com>
Subject: Re: [PATCH RFC POC 00/50] file: handle files on syscall exit
To: Christian Brauner <brauner@kernel.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Jann Horn <jannh@google.com>, Jan Kara <jack@suse.cz>, 
	Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Oleg Nesterov <oleg@redhat.com>, linux-alpha@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, Jens Axboe <axboe@kernel.dk>, io-uring@vger.kernel.org, 
	netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, bpf@vger.kernel.org, 
	David Airlie <airlied@redhat.com>, virtualization@lists.linux.dev, kvm@vger.kernel.org, 
	kexec@lists.infradead.org, linux-hyperv@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_091037_610256_BC789A4B 
X-CRM114-Status: GOOD (  19.18  )
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

On Tue, 15 Sept 2026 at 04:31, Christian Brauner <brauner@kernel.org> wrote:
>
> TL;DR, this lets arch code handle fd install and cleanup. fd_prepare()
> allocates a descriptor like get_unused_fd_flags() does and records it in
> a slot on the task. fd_stage() attaches the file to that slot and
> returns the number.

Honestly, I am *not* a fan. At all.

I think this adds complexity rather than removing it.

The diffstat tells a story:

>  106 files changed, 962 insertions(+), 861 deletions(-)

in how this adds a hundred lines more than it deletes.

But to make things worse, it adds them in bad places: low-level
architecture assembly code.

Those extra lines are *not* making complicated code simpler. Quite the
reverse. They are taking fairly straightforward "just deal with errors
with normal cleanup in the place where it makes sense" and makes the
*straightforward* case simpler, while making the big picture more
complicated and subtle, and adding new code to places that are not
simple and just blindly do somethign that makes no sense in that
context.

IOW: it's more code, and it's more abstraction, and it DOES NOT HELP.

And yes, most of the well-maintained modern platforms (read: x86 and
arm64) use the generic infrastructure and they don't show that
low-level asm effect. So for those cases, it's mainly just  that added
conceptual complexity and a new odd rule - and makes a *successful*
system call go through that "extra work" and indirection phase that it
didn't use to go through.

So it just spreads out the work, and moves it to a less obvious place.

All for the very questionable advantage that you can now randomly add
a file descriptor without the few lines of fairly straightforward
rollback.

IOW, I do not see a single real upside to this, and I see immediate
downsides to it, and a more abstract complicated machinery.

I do *not* see why we woudl want to make this be a "every system call
exit" kind of thing. If there are places that think it's complicated
to do, they could have *their* local little stack of fd's pending. Why
force it onto the low-level system call entry for every system call
when there are only a small handful of actual real cases (the vfs
itself, and random ioctl's by odd driver subsystems).

              Linus

