Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F249DC5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 23:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mm10wdMdh/+6h4HJAKRKNt7oV5Saby0KSm+rAiNPAjE=; b=rBQQwUtYVpbZLx77LQSKPQSRA2
	IXItKh2f7qATivDEog+kZZAp7nHagpP7Q1a/Q/H5x/1U5gaFQ1SMEVvSPDl/sEEuwqFBkQsqGx31x
	TQFkMfqJ/Bzgy1MRefGi8K21GXDODCGGlx4v16sxRGAL7HqyjLApq+VVkBfpgTZdeoo81WJFuFxGy
	rTgHT+a7cBwzcwjZKludCi5KOXe6H7c9MgA+2X5UgnTzhYMOE2U6I3FQiWMw6hNTmqSIx3sVZ+XWm
	ejq8ria8PfIqhkoGZfGV6pA/BG6KDzhWoWSX21O6RMOaMDMmLhssaMMtEJKK6rNE7Qg36FQiJHubo
	EQjpcEPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtvvt-0000000F5cw-1swz;
	Tue, 11 Aug 2026 23:30:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtvvs-0000000F5cf-2T4a
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 23:30:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 38A7643B7B
	for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 23:30:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 101B21F0155B
	for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 23:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786491056;
	bh=mm10wdMdh/+6h4HJAKRKNt7oV5Saby0KSm+rAiNPAjE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Jn4DDQ7hhCxJoo3tK++tbWVHNK4wNMPUDcEgrnwWDH0FghP3+gBVVBulNPQKR+CYj
	 eAR1nshAeb4/sx77Ra18u/bKHedPdVM/xjg0bN4kTHebwtcdu2dQbmmQp2LUYTiZcw
	 9f/lpxCI8TakDgy8+6xntXNt06bB2wnmnaP4P7yYixSSkUm7wFinit5typM08w9qK6
	 YCCktIHNLD2AVnwK9aIRPuP0P8f7QY0VdDrKGRvuuyv4+G/XxbXiozkhT+xlWcAA+j
	 OAh093MUjByxOCdTA39rCipxgeSYkoe4OYR1qkjSnw9Wdfkh3pnG1C4d+gHQydn5IK
	 rgR29a2Ib3cDw==
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-9061a795d76so4169036d6.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 16:30:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqZji6W324Oe4IYIlK14RAQphZepVMFX1NHdFBAnoZsuul9pG3YUOd8LspzEdmtIEBidrCQJvIeTelWY7Fd01dq@lists.infradead.org
X-Gm-Message-State: AOJu0YynjVSicRdQ33U0ulJB/wV/EnmgKQkqY6PKFeTfu8wQqLKRGVYc
	09kAcBkruM9TRq/BctiHpFyKt5q7zelL2fSgFbCZu/S0ETWrq5l7ihdehkFRmy4ZPFNP7pvcu6m
	xw1eCOArIUgebzLuP6Xa7z49ioUYKXlE=
X-Received: by 2002:a05:6214:492:b0:8f0:a849:f392 with SMTP id
 6a1803df08f44-90a6ff45bdcmr7684206d6.14.1786491055243; Tue, 11 Aug 2026
 16:30:55 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1786230311.git.jpoimboe@kernel.org> <e246f9ed3b06724147ca801af3deea5e2cb3b80e.1786230311.git.jpoimboe@kernel.org>
In-Reply-To: <e246f9ed3b06724147ca801af3deea5e2cb3b80e.1786230311.git.jpoimboe@kernel.org>
From: Song Liu <song@kernel.org>
Date: Tue, 11 Aug 2026 16:30:43 -0700
X-Gmail-Original-Message-ID: <CAPhsuW62H8-wCzh0fKN0Cakv5Av-A2=bKg1f7BkS3WYs+H7fLQ@mail.gmail.com>
X-Gm-Features: AUfX_mwAp1sFG-jsaJmeqTRSEzzIwn1foHFPe56LR-NW_OH8s91tXk8W6El9i-Y
Message-ID: <CAPhsuW62H8-wCzh0fKN0Cakv5Av-A2=bKg1f7BkS3WYs+H7fLQ@mail.gmail.com>
Subject: Re: [PATCH v4 06/22] arm64: vdso: Discard .discard.* sections
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, 
	live-patching@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, 
	Joe Lawrence <joe.lawrence@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	Mark Rutland <mark.rutland@arm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, 
	Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Sat, Aug 8, 2026 at 4:18=E2=80=AFPM Josh Poimboeuf <jpoimboe@kernel.org>=
 wrote:
>
> In preparation for enabling objtool on arm64, add .discard.* to the
> vDSO's /DISCARD/ section so objtool annotations don't cause orphan
> section warnings or leak into the final vDSO binary.
>
> Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>

Acked-by: Song Liu <song@kernel.org>

