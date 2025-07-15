Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9952DC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 00:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QUWyRua1PVsgjZHyzHVszCN6h+pSG9rSXu9z+2oNTDM=; b=M4plkgZzYdEWBlO89+mh/6KHdA
	i1SrkUv0ZimYsADcX0LZsYNjEMh6GznbEWceX8b7cHXQVcGpjyZ14DuoigLaKG+JHeuNgwyOWL13m
	JBOaCprAmyyfLZkpstGavFKYuzmWq9FgRdwAg6k2S8Cc/kkUerZOi9tzd5KGLYFgdEmdGUKkKkgfs
	xWd9gtP/s/b4VzmFXeWdnxnmt66dAq2y9ijxaT2sEwtZEcQvfzdPEAYd7zFhs3BkXpR16h3pE0Sd4
	2iqnCs1EZ5ClVfFnxUd1q65hGUwZeYB5nmSqWLCQXCGSYSMFGGMn357A9nNTSNHu2hSA/L07ahElP
	PDepCY+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubTrO-00000003g28-1sfz;
	Tue, 15 Jul 2025 00:49:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubToy-00000003fuM-1JJX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 00:47:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C606661483
	for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Jul 2025 00:46:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C519C4CEF6
	for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Jul 2025 00:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752540417;
	bh=QUWyRua1PVsgjZHyzHVszCN6h+pSG9rSXu9z+2oNTDM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=nobd/7RvPlaubgwTLjxG9HViOA5c65b3VYG8GgvTKY6MZkg4VsOJea+uJZ/f6tkkb
	 up6mTZXz/04SZpsFzSwhAg+L4QW0OzQfMcX5GJIPJS8LGC83ECscqfSgofd1OZ9REL
	 Mg6cz6xXHzBAl//zfVD8dEteRG9YdtWMCX4nuVeOBKhrVhOqg+J2qoB7rsK6NAv0/7
	 +NS6nW+8d4I55lyh4yFgDpCPxbdichtqkKk+MpaqT22N0FETlH6jC8391DnSoabRGT
	 16NTp05ayoCqz9epx/zfmyNhrGg436yCwdp/VPpskT6ClhfEdyuewZmwFMO0+COsX7
	 /9VIsgYVU/JoA==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-32b4876dfecso59728321fa.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Jul 2025 17:46:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVkMG5B+uNl0H9nvx3doHDXTXx3Gnyo27/ZX77W/IaJcAdzh+vUvnvczy9ZKj0dAqZHhk6b4Hbe8iB6hyvnUqXQ@lists.infradead.org
X-Gm-Message-State: AOJu0YzIN/Lo/Ow+v5/1zQHSgDncyOt+N1SVc4K4Mm2NzSRhi9tDvpjG
	mbBWWkn4wUycRZMePiAxitxQ60OXyTGUAcV7GdT2LQac8kNZ8iUqZaS4zlY7ldM8Odo6loXV5uP
	zGX15vMIKRn9G3mz+bJBenWcGVc+gVyM=
X-Google-Smtp-Source: AGHT+IEK8xvGJsiLgjph1djYADb6nimHmTBNnLJKglHEK/iwDCjgQNndxfE14N2T8V7Sllti6VjlMLrU2PBcyU3/K50=
X-Received: by 2002:a05:651c:4002:b0:32b:3c11:518b with SMTP id
 38308e7fff4ca-330811a2361mr2611401fa.9.1752540415579; Mon, 14 Jul 2025
 17:46:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250514174339.1834871-9-ardb+git@google.com> <20250514174339.1834871-16-ardb+git@google.com>
 <20250711134833.GI905792@noisy.programming.kicks-ass.net> <CAMj1kXGEHWMhMgY8ZMiRxKPTeD+oZBReozKwA4udJsrp-j_P_A@mail.gmail.com>
 <20250714105520.GS905792@noisy.programming.kicks-ass.net>
In-Reply-To: <20250714105520.GS905792@noisy.programming.kicks-ass.net>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 15 Jul 2025 10:46:43 +1000
X-Gmail-Original-Message-ID: <CAMj1kXEw=RSnf_Af=+AKWmuxJ+0dL_4CFSX7TyKo+SSKpxc6Bw@mail.gmail.com>
X-Gm-Features: Ac12FXwhxWd487QWnvJuNFtNxvH8YdIgyz_tVB6S9DDi7Xvs3l2_QCE4SmvUJoY
Message-ID: <CAMj1kXEw=RSnf_Af=+AKWmuxJ+0dL_4CFSX7TyKo+SSKpxc6Bw@mail.gmail.com>
Subject: Re: [RFC PATCH 7/7] arm64/efi: Call EFI runtime services without
 disabling preemption
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-efi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
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

On Mon, 14 Jul 2025 at 20:55, Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Mon, Jul 14, 2025 at 12:20:30PM +1000, Ard Biesheuvel wrote:
> > On Fri, 11 Jul 2025 at 23:48, Peter Zijlstra <peterz@infradead.org> wrote:
...
> > > Is the migrate_disable() strictly required, or just paranoia?
> > >
> >
> > Runtime services might be polling the secure firmware for an async
> > completion when they are interrupted, and so I don't think it is
> > generally safe to assume that an interrupted EFI runtime service can
> > be resumed on another CPU.
>
> Can we please get a comment with that migrate_disable() explaining this?
>

Sure

