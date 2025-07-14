Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2DBDC83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 02:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i6JzBgQljb1p+1NlyyYibH1USStHrkmH4JsqwLuSza8=; b=E2F31WAU8XU3Es6dEps41Vjxjh
	b1TleatRPBPJxPC9FmmJeCQiTypztAIpzftAs3EeLBIw6wuGbYPKcXpm1+C4m5X7v3bTQ8qQiMZbx
	Q2IR5uJUixErXDewVAyA/Y/3XoKWevCDmgyb9lgwaIzAopGdAHoANByenaw1orhCtu5N7ezdEmNzQ
	t2dbWx5tsQivynSLbuLdKGwPK0MrbhEsr/pzCquALcd3ZjzA5NFr1sOZy7cqisEmsWxW4uop3V4hT
	jgvn0FMs/i+uAY0syujPaU8LIzaCAJm/zPx2+Xbo4Yb0OFUeDltSDj69+qZyFGu5E+Kaki06+ZGHC
	d34GX2hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ub8qY-00000000yVO-307s;
	Mon, 14 Jul 2025 02:23:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ub8oA-00000000yDq-1vfO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 02:20:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A0AEF61136
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Jul 2025 02:20:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23BE9C4CEF6
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Jul 2025 02:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752459645;
	bh=i6JzBgQljb1p+1NlyyYibH1USStHrkmH4JsqwLuSza8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=AoUoENTAeXxa8t8weBai9VLbYTNcWO23BxK3RiXf6kviLHFD+Ov7eRk8a5VxfwxDO
	 boukk1akLGf+PCdwWHhOOdINWnKYsRpqF5DwyL3W5Ak8aacLB8o3ai8aAZIlrf63kF
	 9Q8wA1ZHBPetVd4WABO+sCo91hm5VYVvFZgNmr1H+LdJSEhv+2mclsSzh+UpyrNweL
	 DCB+vCA2W2e7meth2SdiOkRQVlZfO2ZBfwLkqLWqXFHtDpF92BUQ7ky7pNo+Q90BkQ
	 DkypO3gMUoqKmnEZkMos3WApzEx2+qu3tnelKrnZ/t73e5GZZHYhQ1bwjfn4rfqiBJ
	 BiEbmVn12cMIw==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-32b50f357ecso33344651fa.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Jul 2025 19:20:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWP6recunlhTI6oq5+6CRa1sBKafEI44WG1iLO8j12Wfp2pdRhlhE0q2lmDJV3yzPwpJeu7euzKl3evIOVkp/1t@lists.infradead.org
X-Gm-Message-State: AOJu0Ywv3+YahF07an8YhonQ7Wzl7dkFqLlbEBHqLAmCIa6SvbDSj0wc
	8mGpLLxerAKknZvWgg0Lz/Iwef+zJBNFo2PC1iWZawjxlnfh7VAgSIwwR+wQ6BEbhAgtf649bhc
	hpuRIQwjWH8X/igOIN095vqtzlFFWdfQ=
X-Google-Smtp-Source: AGHT+IFPUFMYWwjnzBcXwC0d6fwvdcN+mKrXo3pSpk73ThHe79z/VmIJ2Q3NAcpEs+1oONoYKC6JrFPxuK85+vm9p14=
X-Received: by 2002:a05:651c:221d:b0:32b:488a:f519 with SMTP id
 38308e7fff4ca-33053292135mr39355511fa.6.1752459643430; Sun, 13 Jul 2025
 19:20:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250514174339.1834871-9-ardb+git@google.com> <20250514174339.1834871-16-ardb+git@google.com>
 <20250711134833.GI905792@noisy.programming.kicks-ass.net>
In-Reply-To: <20250711134833.GI905792@noisy.programming.kicks-ass.net>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 14 Jul 2025 12:20:30 +1000
X-Gmail-Original-Message-ID: <CAMj1kXGEHWMhMgY8ZMiRxKPTeD+oZBReozKwA4udJsrp-j_P_A@mail.gmail.com>
X-Gm-Features: Ac12FXwLcQxZDL-vTtg_BIL4PN-M5Xpb-28I605kB-Ll_-F_i8KKCCRihwo90qw
Message-ID: <CAMj1kXGEHWMhMgY8ZMiRxKPTeD+oZBReozKwA4udJsrp-j_P_A@mail.gmail.com>
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

On Fri, 11 Jul 2025 at 23:48, Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Wed, May 14, 2025 at 07:43:47PM +0200, Ard Biesheuvel wrote:
> > From: Ard Biesheuvel <ardb@kernel.org>
> >
> > The only remaining reason why EFI runtime services are invoked with
> > preemption disabled is the fact that the mm is swapped out behind the
> > back of the context switching code.
> >
> > The kernel no longer disables preemption in kernel_neon_begin().
> > Furthermore, the EFI spec is being clarified to explicitly state that
> > only baseline FP/SIMD is permitted in EFI runtime service
> > implementations, and so the existing kernel mode NEON context switching
> > code is sufficient to preserve and restore the execution context of an
> > in-progress EFI runtime service call.
> >
> > Most EFI calls are made from the efi_rts_wq, which is serviced by a
> > kthread. As kthreads never return to user space, they usually don't have
> > an mm, and so we can use the existing infrastructure to swap in the
> > efi_mm while the EFI call is in progress. This is visible to the
> > scheduler, which will therefore reactivate the selected mm when
> > switching out the kthread and back in again.
> >
> > Given that the EFI spec explicitly permits runtime services to be called
> > with interrupts enabled, firmware code is already required to tolerate
> > interruptions. So rather than disable preemption, disable only migration
> > so that EFI runtime services are less likely to cause scheduling delays.
> >
> > Note, though, that the firmware executes at the same privilege level as
> > the kernel, and is therefore able to disable interrupts altogether.
>
> Is the migrate_disable() strictly required, or just paranoia?
>

Runtime services might be polling the secure firmware for an async
completion when they are interrupted, and so I don't think it is
generally safe to assume that an interrupted EFI runtime service can
be resumed on another CPU.

