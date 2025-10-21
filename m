Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4397ECCD1AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 20:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KX1U3LQDhrzk0zMYgAFvq4hyuRv8alrTza4fIy2YOi0=; b=CFo1OqVjtds49FPZsw/ERmLf5b
	2iqAQfuythzUNc7LZxx6KWUO9GjApK5Dogk/hPcqU86QaHy/alepYd8pkJx+B0qUc66+DJT897gcc
	es2lkkpkaGyeRNf3xRUZ4pMUjnyvOynEU9Tc36rBlUcxrcN9saGfNtdGc1I6GcgAVBm0PKhsqEFwj
	xpDsTnvo9CBTwRz30U8MIkXvNVnc5UfhFklEZt/7l+yoHluzTeU9XkyVTxJyEgFCTRdGEqN+ea7Ux
	0nSzBJ8eimz50KMS/eoxbPAxK0JdwCW38V1UVXSZ0UF/5TA7xyy5heZiYE7MswoLXG+FD6p/Lw3DN
	vYAf571Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBJLq-00000000dpL-45FE;
	Tue, 21 Oct 2025 20:53:02 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBJLo-00000000dmx-3fWw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 20:53:02 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-47106fc51faso71605265e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Oct 2025 13:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761079979; x=1761684779; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KX1U3LQDhrzk0zMYgAFvq4hyuRv8alrTza4fIy2YOi0=;
        b=EitVobE1VU54q0w8+NZypQVqSZUhkmIY0i0CIGKlhamOHBsPy4DFVdnbWCCDs+EwIG
         WPHypLYHlUi4umSBbGk3zQQdiJknc0XyzUWJtA12j7QnmWbeODFWX5ywwQiRaWGOD6ha
         5+MvOZI5doOtX6TwTh0bnbdDRf10lBtYPOhi7uQEv9Fzc9me7qdLMIv4XmIZBIAyxD9L
         QYZYRF5y0fiHnAjRuC8TvCaJHvNlWmEGzeGiJiB+UMsA7fmLiTI9tmb59uugrdg1Jmge
         4+sl3GUB5sV6hTuPX26+WgBct88n0swcy2VNRJtgLSv7MLPclFDwlnxc+D40tIMfCbBm
         bLZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761079979; x=1761684779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KX1U3LQDhrzk0zMYgAFvq4hyuRv8alrTza4fIy2YOi0=;
        b=kBQAdeEvzCdiPk5LSMYMcUGFrbzin+dOR/qXVrJo5OraDtGipw7tnyyD42He597lmi
         bS25O+0P/URHqxEKX4Uqg7hY6niJx4SoKWCzCisTe8WqK83yZ01YT6xvGx00pvgvbfHM
         Rb0zeQIAn8VXJQDNBAD3yx2xdDe6umg9YfqBu6ODRPtD+p8GHtz5h7Ld7KEJwA3a4GoZ
         dCyJX/eum7/GuaOD8K9/l+XpkMTnjUN5x6M1kDxBS/VTy0sIxuZcjfmZg8I8Nsw3KFWO
         FHpgszNWEctzJ6wOHaJ8MJLMCpA6SrTJMk7pdJxbcUvdphtsMBMObSnPGuVUeyA0q/bK
         y4xA==
X-Forwarded-Encrypted: i=1; AJvYcCVOB5aeW5VTBnX0Jwyrz9F2tEnNETi3NaLki3t+9fyCqE5bTHmSAZoYkucllqf7OwuJvfDmgEdrI/wBJbjEPyA3@lists.infradead.org
X-Gm-Message-State: AOJu0YwBRfVfNwp+u7v4W9rlUXvmXf4hzlZx5BOZT8KaRoFD+lu+R/z4
	1oCXJvRy7P/7eTMaZTIFnMB3H91o42MMbmqWf9YRlDAJ8lGaQ+kNcEGm
X-Gm-Gg: ASbGncszsvHuyfjbmCdrQwrgMhWyMdpswOdmS6l5WhhnF2lJORbAInj12u84pyNf8js
	VwB//d5/Ax72OM36IGCB1JaNqlreYBr4IWKHg2BDti6FNHpspewW77yJ/tb3dt9x9RYpuclznZI
	24oTX7x5ckXlpwVQNNvqjpsvdpoG+rJNuNRbXoI67TiUYWo0dqTytju20DtSXnae4uxV51lXfwL
	JrJ+N2NJovcNHBfvKpcU225b4qnxZ+pXkKdlewZLK8KA6V28eWjVEkViPyZ6qi4yHF3irr3OHIf
	ys3/MMkClqgoonou+lg6mVDlJApI3JXVOdfAznNPOWY9ensaztFaS9yvBE4n7RXhEvaVE0ysCTG
	5CJ2aeAiNMkMGzBhim8C9W0yDMIpZ+ofSCiPEwcTtwhtNf39ys46mThio54IRxfeCRVb811VSdM
	2qE4x2Apja9oqRemzjUrcy8aZdL2O4jyEU3T6G+1+9MSYGzogyBAC+
X-Google-Smtp-Source: AGHT+IG48cx6eMc3yWVGBT0daBkOovb/80ZhUVtFTOZrtyO8Rw6UMLlSBk12jg9YEQoOEfu4lRZoog==
X-Received: by 2002:a05:6000:240c:b0:3fc:c90d:9957 with SMTP id ffacd0b85a97d-42704d6c585mr13473049f8f.16.1761079978558;
        Tue, 21 Oct 2025 13:52:58 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f009a797sm21895076f8f.27.2025.10.21.13.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 13:52:58 -0700 (PDT)
Date: Tue, 21 Oct 2025 21:52:54 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Linus Torvalds
 <torvalds@linux-foundation.org>, kernel test robot <lkp@intel.com>, Russell
 King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org,
 x86@kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Heiko
 Carstens <hca@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>,
 linux-s390@vger.kernel.org, Julia Lawall <Julia.Lawall@inria.fr>, Nicolas
 Palix <nicolas.palix@imag.fr>, Peter Zijlstra <peterz@infradead.org>,
 Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>,
 =?UTF-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>, Alexander Viro
 <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara
 <jack@suse.cz>, linux-fsdevel@vger.kernel.org
Subject: Re: [patch V3 07/12] uaccess: Provide scoped masked user access
 regions
Message-ID: <20251021215254.673dbd35@pumpkin>
In-Reply-To: <874irsz581.ffs@tglx>
References: <20251017085938.150569636@linutronix.de>
	<20251017093030.253004391@linutronix.de>
	<20251020192859.640d7f0a@pumpkin>
	<877bwoz5sp.ffs@tglx>
	<874irsz581.ffs@tglx>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_135300_937921_817080A1 
X-CRM114-Status: GOOD (  28.91  )
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

On Tue, 21 Oct 2025 16:42:22 +0200
Thomas Gleixner <tglx@linutronix.de> wrote:

> On Tue, Oct 21 2025 at 16:29, Thomas Gleixner wrote:
> > On Mon, Oct 20 2025 at 19:28, David Laight wrote:  
> >> There is no requirement to do the accesses in strict memory order
> >> (or to access the lowest address first).
> >> The only constraint is that gaps must be significantly less than 4k.  
> >
> > The requirement is that the access is not spilling over into the kernel
> > address space, which means:
> >
> >        USR_PTR_MAX <= address < (1U << 63)
> >
> > USR_PTR_MAX on x86 is either
> >             (1U << 47) - PAGE_SIZE (4-level page tables)
> >          or (1U << 57) - PAGE_SIZE (5-level page tables)
> >
> > Which means at least ~8 EiB of unmapped space in both cases.
> >
> > The access order does not matter at all.  
> 
> I just noticed that LAM reduces that gap to one page, but then the
> kernel has a 8EiB gap right at the kernel/user boundary, which means
> even in the LAM case an access with less than 8EiB offset from
> USR_PTR_MAX is guaranteed to fault and not to be able to speculatively
> access actual kernel memory.

It wouldn't be a speculative access, it would be a real access.
But 4k (eg a single page) is plenty for 'reasonably sequential'.

Pretty much the only thing that has to be disallowed is a reverse
order memcpy() (or one that accesses the last bytes first) for
copy_to/from_user() if the length parameter is ignored completely.
Linus wasn't brave enough to remove it from the current version
of access_ok().

I do wonder if any other cpu have the same architectural issues
that required the guard page between user and kernel on 32bit x86.
(One is a system call at the end of the last page.)

LAM is one reason why 'masked_user_access' is such a bad name.

	David 

> 
> Thanks,
> 
>         tglx


