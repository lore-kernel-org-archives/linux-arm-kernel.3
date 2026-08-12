Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6FE0C5CFEB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 07:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4wYPvCbTq/8BkD2bsvkf5s7HshKHTy5IG6ljzWwvcaI=; b=uvJjSPF29ILHhPm3U7+h55fZa3
	EzjdEsUaWj8CAUS+51YLHH5Am3dM0P3lUkJL3DHNe6fsClU1TCGcDsFwPdWJLBuDDzM+rPeD7NfW8
	3EqtgDVRiFQmRzMu9s34PMMD+VLM4xfiBe6VtHWgIKaND9hJUhCRvtSDRANi6zcrr4KuaMMdchyjD
	dSlrurEWB8miHr7di8V8rYnv14V1mSJ+ltcqFCCZNAZRShs5eoGssI6jMyhNoFUZ62GQFY0JKiv+V
	j9rKqZrNpwcaC5KTnQgjWo0RAQNMB5vOx9tgNONm32OEvjIX6uPMl/Qy27pVsui7p5dAKocjXr0wR
	kytnlOwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu3Ok-0000000FZst-2KzD;
	Wed, 12 Aug 2026 07:29:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu3Oj-0000000FZsl-0Vhv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 07:29:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 848BC439EC
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 07:29:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69B991F00A3E
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 07:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786519752;
	bh=4wYPvCbTq/8BkD2bsvkf5s7HshKHTy5IG6ljzWwvcaI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=MPSkYXKSjFROOmHtlJBFofz4meQ5xG35mJ+r5QQPY/2VMVNmHNQ60I7VBIR8FJItN
	 qlcUNGDidxt91y5xNJgqqfRXCn1I3vjhuCZy2I8seQI9YwSJa43rFOrjLzQsUpMpne
	 TW2Rc/InlAsg92iRrunY67TSb5ecpjVeDUEAsuWQgu+2h2HnK92rqb+zj1N/990z5D
	 VgNqRVm413H5q5TgjuYCUGjCYH3sIXCbmxZqvkyYSJyaqux5i0RO9+1f7dolT/4TPI
	 +xDlmOGaLy+4AhJdVaP+kLGeF3HXXtqrxJ5d+r2E7zV/t2/ZXfqxSqJz98yrpgGi1n
	 USFtfv7pDuiaw==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-39c8ee87f7eso6590851fa.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 00:29:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rry6QitFF6ms9HcMMMUm2Fvx9HVmKVJ4bpsHx1d6MmZcZY+ptlkQlVZ3OdST8+yCpl7mq/K6ic11Afu9lA4ayBz@lists.infradead.org
X-Gm-Message-State: AOJu0YxQKYqRDWD/Hjk1QxE8ghDOlHJ2T3qnf98+smxnfQC8TTfLkCwd
	f/HAUdyfwaOdiK6jMVDkKNSlT2yej5bBCMxhMhVcnk7Zf00HQdNcHSHShed69SXOsXA3Zb7wf2b
	/vxKXMWP8oU3AzatMcbCRkicU3Xb5iPY=
X-Received: by 2002:a2e:bc0a:0:b0:39c:6d58:a6e3 with SMTP id
 38308e7fff4ca-3a10d57f6c7mr2289731fa.21.1786519751181; Wed, 12 Aug 2026
 00:29:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260811164528.65747-1-kmehltretter@gmail.com>
In-Reply-To: <20260811164528.65747-1-kmehltretter@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 12 Aug 2026 09:28:59 +0200
X-Gmail-Original-Message-ID: <CAD++jLmVQw15yW2+En2FwZsq7qxUGy8B7xv8QvFSYCybTuZ14A@mail.gmail.com>
X-Gm-Features: AUfX_mySWsnAe9XtBvawNadOQALKRD0MZYPbPofiyEVi3GwFSKQx95g1Gz4umsY
Message-ID: <CAD++jLmVQw15yW2+En2FwZsq7qxUGy8B7xv8QvFSYCybTuZ14A@mail.gmail.com>
Subject: Re: [PATCH RESEND] ARM: alignment: restore uaccess state on emulation fault
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>, Ard Biesheuvel <ardb@kernel.org>, 
	Florian Fainelli <f.fainelli@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
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

On Tue, Aug 11, 2026 at 6:45=E2=80=AFPM Karl Mehltretter <kmehltretter@gmai=
l.com> wrote:

> The alignment handlers enable access to user memory while emulating
> unaligned instructions. If a checked access faults, its exception table
> fixup jumps to the handler's fault label and bypasses uaccess_restore().
> This leaves DOMAIN_USER as DOMAIN_CLIENT with SW domain PAN, or leaves
> TTBR0 page table walks enabled with TTBR0 PAN, while the fault is handled=
.
>
> An ARM926 QEMU test using LDMIA across an unmapped page boundary reports
> DOMAIN_USER=3D1 at TYPE_FAULT before this change and DOMAIN_USER=3D0 afte=
r it.
> SW domain PAN is the default on ARMv5, ARMv6, and non-LPAE ARMv7 builds.
>
> Keep the saved uaccess state at function scope and track whether it was
> saved. Restore it at the fault label only when needed. Paths that did not
> enable user access continue to skip the restore.
>
> Fixes: 274e91b81ed2 ("ARM: alignment: fix alignment handling for uaccess =
changes")
> Cc: stable@vger.kernel.org
> Assisted-by: Codex:gpt-5.6-sol
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Wow nice patch!
Reviewed-by: Linus Walleij <linusw@kernel.org>

Please put this patch into Russell's patch tracker so he can
apply it!
https://www.arm.linux.org.uk/developer/patches/

Yours,
Linus Walleij

