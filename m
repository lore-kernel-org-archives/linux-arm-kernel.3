Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32815106ACEF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 22:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m83g+4+U1TG2wOkLOGB03G0wrFd+xSPvILMAfdktFYQ=; b=txdf7eUPm6AK3+/QI1wcyuaFpo
	xR3xFKKILLez7VJ7vMIVJASSprjWfKjM9AgRbcqM4fmlx2D7j/SfbFUtou6+1nwHYQE3mUDu5vVT9
	GhmrwILXIY4mu61oXWXjgsHoAJ4+gj/BM8HO3c94twD2mrDJpBwHkUJH/jKIjreoBi4SeORamhc6x
	Zoq5XBeaPAmTtK/+/UFQRAWB9AvHMIXgvvIuOp0YeEP5nHqXgM6zqG1hdmoageR15AUfpzVeyZahm
	YTi9DlOj3zoGJJ+Ju0VJRInFlwgeJgXEwVuWv9PyYHQHFMq8Gciu8trRbK4Jrcc5wZUJJ0SBAQWaq
	8zTUweBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0oEt-0000000Fb5l-3Cdp;
	Thu, 12 Mar 2026 22:10:43 +0000
Received: from mail-dl1-x1233.google.com ([2607:f8b0:4864:20::1233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0oEr-0000000Fb5P-1IEA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 22:10:42 +0000
Received: by mail-dl1-x1233.google.com with SMTP id a92af1059eb24-128ce536fe0so3361c88.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 15:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773353440; x=1773958240; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=m83g+4+U1TG2wOkLOGB03G0wrFd+xSPvILMAfdktFYQ=;
        b=2lA/THPM7vjJJ1hdZmKulm+/OEduUImyTm5R5uUInc4dfgT0z7zlXdGXnyxuIFD4lg
         53lXZ5SofGrxiu2uMJupdWySluxfzZGsOY1Q9G3jDPWRYVs9gcYL7ZOlXolWtZuZAFRM
         rjsr7D/hJSiD7KyMNdsXhbfagh0Ps5Z/euXpXelWM1U+cliuKErMRuYREQdSjYwNwPYv
         h4WJH7d9ov4dwzaKKd3lC8K6OWfWyKtLlnzCU/QiqbDe4wF12wV+M03UKn2tB+oMGSG3
         GLa9TeqeAWOZjcAsuXvNx0S3vBoS2w+EIVCPZvhYcHgyNnt7kgduFMeAf+vQyjU8MpKR
         DHsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773353440; x=1773958240;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m83g+4+U1TG2wOkLOGB03G0wrFd+xSPvILMAfdktFYQ=;
        b=PUpKrpbrRXp4DyMR2PBnFI6E7fVttJO5OeVms/yeHS5HQnX1XAT1DHABBHXic9+pV4
         E/iB1XfTTo2+zqRkCWWOhi36KJLOHP3OpfwMaAkhs92j4Rzb8VQKwGkeO9CgtvsGSYbj
         DmP9Li1b3k2abnMmq9bz8y6FUI7qL5aBoPpP/R1AMJktidh9jhdjBwx+Jbk7I8H0SukY
         Fh+RiiXT3WAHbCmHfnz8Uf8NfUrs7T4emspdGNezmrGnxQT/JtUTV1LuG+4K+lU3JlAx
         q34lfyS638ZXrbqPdyp9/z1/FVTk+q0KPD2sqyH7O8cWyGN5XpzWhBbSASQUYoJP6Zat
         vfoA==
X-Gm-Message-State: AOJu0YzCYP1onWnrLs+sM4kjIZiuQFQKmzWCnMlzVzN84zmGmpnQcQhn
	xLpvAyqeLV8rromCY94aDAKS0T+gyoWYP1i48GgXFeGfSwAck88zCk3tYd0EheXigA==
X-Gm-Gg: ATEYQzwUi7KMKtiCPoU16K6Z3yGylVzSeqfQ9Uui/8A4NVsCKGFF97JXupA4Q30Z+ps
	Chx82uknJGGlym0NXHqUt/GcfNJsAD0cXSmGTOIsKZKUdKFjrJxW+RluA6atu3tbeDH2ccwwRiL
	fc5p41VbXXjTacXd36eupIN3j1MtQezK5CNcxhMVtYWg6WAfDTPHVBOsX4ZO1P8itlvFJDY3mf9
	C1/ESxt7Q6OnSFZ7zsRMSzw1ekvdg6ppPr3myrfUPU7MACRbjfZsfQ5xrikxSIQXUm/ItbcIrLd
	/KLbCkuDSgmrUqgvBbSNm3QWDxA9bac1zk7OzRUUDhV8nspk7P7iHF4fyjmpfvekGQyd8N1Gi7r
	b0Lnm4lcOGWNXYhsQ/slRJCSv1seTxz2p8BK6WX2xMNNg5VrYvjxd+GJsd/l0rvgmIDCw41m810
	UXgMMMsJBdHYAEmFb5ersg99OtPg+ObfTJ6Rz07IaA70MoPKZArFGMBdsAliCkPw==
X-Received: by 2002:a05:7023:906:b0:127:67ef:f181 with SMTP id a92af1059eb24-128f5433f9fmr13869c88.25.1773353439639;
        Thu, 12 Mar 2026 15:10:39 -0700 (PDT)
Received: from google.com (154.52.125.34.bc.googleusercontent.com. [34.125.52.154])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-128e7ccd60fsm10487044c88.12.2026.03.12.15.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 15:10:38 -0700 (PDT)
Date: Thu, 12 Mar 2026 22:10:35 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Mark Rutland <mark.rutland@arm.com>,
	Quentin Perret <qperret@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	James Morse <james.morse@arm.com>, Will Deacon <will@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Kees Cook <keescook@chromium.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Andy Lutomirski <luto@kernel.org>,
	Josh Poimboeuf <jpoimboe@redhat.com>,
	Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v6 2/2] arm64: implement support for static call
 trampolines
Message-ID: <abM52-5Jq1E-Q-6c@google.com>
References: <20211105145917.2828911-1-ardb@kernel.org>
 <20211105145917.2828911-3-ardb@kernel.org>
 <abL_ulvlC9JT7Zgw@google.com>
 <83c36b0a-7e7d-4651-8e2c-86452c3bd96b@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <83c36b0a-7e7d-4651-8e2c-86452c3bd96b@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_151041_352080_1B1EAA49 
X-CRM114-Status: GOOD (  31.27  )
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

On Thu, Mar 12, 2026 at 07:35:34PM +0100, Ard Biesheuvel wrote:
> Hi Carlos,
> 
> On Thu, 12 Mar 2026, at 19:02, Carlos Llamas wrote:
> > On Fri, Nov 05, 2021 at 03:59:17PM +0100, Ard Biesheuvel wrote:
> >> Implement arm64 support for the 'unoptimized' static call variety, which
> >> routes all calls through a single trampoline that is patched to perform a
> >> tail call to the selected function.
> >> 
> >> It is expected that the direct branch instruction will be able to cover
> >> the common case. However, given that static call targets may be located
> >> in modules loaded out of direct branching range, we need a fallback path
> >> that loads the address into R16 and uses a branch-to-register (BR)
> >> instruction to perform an indirect call.
> >> 
> >> Unlike on x86, there is no pressing need on arm64 to avoid indirect
> >> calls at all cost, but hiding it from the compiler as is done here does
> >> have some benefits:
> >> - the literal is located in .text, which gives us the same robustness
> >>   advantage that code patching does;
> >> - no performance hit on CFI enabled Clang builds that decorate compiler
> >>   emitted indirect calls with branch target validity checks.
> >> 
> >> Acked-by: Peter Zijlstra <peterz@infradead.org>
> >> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> >> ---
> >
> > I'm starting to testing this out on top of 7.0-rc3...
> >
> 
> Please use the v3 I referred to on the thread. The code patching is a bit hairy, and so we should only consider that if there is a real use case for it.
> 
> Same goes for the special handling of the ret0 case - AFAIR, the v3 handles that transparently as it will just use the generic RET0 handler as the target.

IIUC, the trampoline tests R16 and returns early if unset. However, for
the RET0 case the register would point to __static_call_return0 and then
do the indirect call anyway. I suppose CFI is fine with this as like you
mentioned, this is "hidden" from the compiler.

However, the R16 test seems unnecessary for the RET0 case, as it is
always set to _something_ right? Or maybe I'm missing something?

Either way, now that I've rebased the patch I can send a... v7? With the
required minor tweaks for RET0 and such.

--
Carlos Llamas

