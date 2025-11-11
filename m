Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 297DFCCFA18
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 18:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oaPx+RbuOdfUl5IPAPZCJEKCGDHkAnifisqySPX8VXY=; b=l70UibRA1HFCKjJQogVaToiIuP
	5PtxQIEVcHEUe477x0oqQ2XvDx03LWhDjnrOnas4/YQL3Q+AJAwsKKE6+4lQ8RNEfiycYvU+19+ID
	BA8L0BKisTViVzT8r4GB2h26jOxjgaUTxDehejJ35CNYHqIX7PR2pXcxm++soGb/sZA4gQaHL0765
	5wKd5ZDE1RtcHtXk8S2aTGYCAwMKEMDJXud3QYTTIhNDJJbwSpnh9o9Z/SYHdOxAwTgYq+4F7sUMf
	0l+9jIBePw4FGDpmJv2yvYWbH8Zl/QZofYBNxRqPKhCCsv2Sc7TyPSpZFX/Va5OPYGHTmnaOQ/JFA
	jOj+Ceug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vItSQ-00000007dcO-1ebg;
	Tue, 11 Nov 2025 18:51:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vItSJ-00000007dbK-1J1p
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 18:51:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 977E44437E
	for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Nov 2025 18:51:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70CF7C2BC87
	for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Nov 2025 18:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762887062;
	bh=XJ4g0f0gVuYpinuWbbR3hceAqP09MK82bKYB3vvGeVY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=u1NhlQxAxeJdhO7bkL3wBsXuhIl5LSvdmcwbJWTX1gG+spiewS/p3BdLBcLpC74v5
	 AVZq0VFLoGGjLqAcXDviZORf2ZWxB3mE14YMn6+pXVeNkCzbDEh31UAIVC7u+v5h3k
	 CqGjEoSfFbPgxTZjaUERNg0Eh4HDqsWTMDzJOrJI/xDSRDIEzWv/up9Lof71GUDTY9
	 0qeAqL73WRJjxKUaqQR2UIO1wB+KjLjPL9NKe8sDMe7nSGMw3DWUEELcQ8YO0Z6yzV
	 RipWUECuEnIn/UxhYMnFXkQom8aWB4FwvNMUTwaCJxblrD5d44GX4+w+4xOzfTvkPy
	 /iZ8Hn4BTCOcw==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-59431f57bf6so9139e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Nov 2025 10:51:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXt1nbWlBXxN+SEd/odI6ZTDwSEqUGrhoRCOP6FvvSYEi3V974hKFObRBVC/7lG8ZQUuDullXRuphZ8Q4jttyfL@lists.infradead.org
X-Gm-Message-State: AOJu0YxUidhoNsb0CZ8pmfqKJ6OCWXj+FKf6ZRMCc71mz1F6HHmkwIn4
	jTFol1ca85SQoA0miEom6c3alF8paVf4hlJPl9ctR3exo4tDacKfAQYt/CkCXfvOSz/CEvqz7xh
	WR7HbpYSpuV9DprDZYZYbULYfy+8DK20=
X-Google-Smtp-Source: AGHT+IH+f6meLkHSJnvqK/GI+08sHMkWRWmZmzjoXE5pVS4YB6CNivhW0spMcyvs1k9S/4LXS4QimEbZb50C4gOFpNY=
X-Received: by 2002:a05:6512:3d21:b0:594:27fb:e80f with SMTP id
 2adb3069b0e04-59576e22001mr74109e87.37.1762887060676; Tue, 11 Nov 2025
 10:51:00 -0800 (PST)
MIME-Version: 1.0
References: <20251015205634.3820870-9-ardb+git@google.com> <aROEXadFWdJoQEzx@arm.com>
In-Reply-To: <aROEXadFWdJoQEzx@arm.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 11 Nov 2025 19:50:49 +0100
X-Gmail-Original-Message-ID: <CAMj1kXGYGSrhUbJ8jboSbch6tp00zfpnGdfJEQcbq=RmLFy5CA@mail.gmail.com>
X-Gm-Features: AWmQ_bmn0XfBWIxhlEWjmu5ftCNZ6fTZUngXH8l15WK1fdsKV0lT36GtFrubF_s
Message-ID: <CAMj1kXGYGSrhUbJ8jboSbch6tp00zfpnGdfJEQcbq=RmLFy5CA@mail.gmail.com>
Subject: Re: [PATCH v4 resend 0/7] arm64: Make EFI calls preemptible
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-efi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, 
	Mark Brown <broonie@kernel.org>, Pierre Gondois <Pierre.Gondois@arm.com>, 
	Sami Mujawar <Sami.Mujawar@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_105103_368486_C02A4C4D 
X-CRM114-Status: GOOD (  14.67  )
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

On Tue, 11 Nov 2025 at 19:45, Catalin Marinas <catalin.marinas@arm.com> wrote:
>
> On Wed, Oct 15, 2025 at 10:56:35PM +0200, Ard Biesheuvel wrote:
> > Ard Biesheuvel (7):
> >   efi: Add missing static initializer for efi_mm::cpus_allowed_lock
> >   efi/runtime-wrappers: Keep track of the efi_runtime_lock owner
> >   arm64/fpsimd: Don't warn when EFI execution context is preemptible
> >   arm64/fpsimd: Permit kernel mode NEON with IRQs off
> >   arm64/efi: Drop efi_rt_lock spinlock from EFI arch wrapper
> >   arm64/efi: Move uaccess en/disable out of efi_set_pgd()
> >   arm64/efi: Call EFI runtime services without disabling preemption
>
> The series looks fine to me:
>
> Acked-by: Catalin Marinas <catalin.marinas@arm.com>
>
> What do you plan to do with this, merge via the EFI tree? Are there any
> dependencies?
>

As you prefer - I can take it via the EFI tree, or you can take it.
There are no conflicts with the other kernel mode FP/SIMD related
changes that we are taking via libcrypto, and there are no other
dependencies that I am aware of.

