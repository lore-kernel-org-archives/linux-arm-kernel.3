Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A3B6F013C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 08:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WSOPBOtCZR55Ppkhd+kncZ0Q+IGD3weYA3vhslBMT/Y=; b=rQyQlWn4AjLCqLqHcJWC2rZZcv
	LfkXk1RsMV3p0oUPAPlwQpwER/sMqKNDSV+1uKQ2xIHA2Tu1g+tbC9ZAi5iSVa7BuTpGL4k9RV3Ox
	SBtZHDdvs5exESKpbc5UiNBI6kNNfSUpTZWRGWJRVlyI74jSO/myTCMzhSvab9wSJHPz/xCyfafhW
	KzdmIXdV/mxtEQJmQEJKHdUOopINribKc7NgMfvfj7FYKsrUZbKVl+84r3lKLdIIspbABuumwcV8V
	TK30nBllglwYX+VjJmq+Oa15g7HUDvbUabPbtLvkd8InrsbMjAl0sBoFQ5TI4mfz97tCUwHsYt+WO
	UpruaG0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w235x-00000003WfJ-3HfS;
	Mon, 16 Mar 2026 08:14:37 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w235v-00000003Weu-37AV;
	Mon, 16 Mar 2026 08:14:37 +0000
Date: Mon, 16 Mar 2026 09:14:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1773648871;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WSOPBOtCZR55Ppkhd+kncZ0Q+IGD3weYA3vhslBMT/Y=;
	b=CVK/GctdHbhsaGBNaVTaF50Q5G6KNGhhw7ZYsF6Tg60uwAtwluqyIUnt5sfiX3FQPdNp++
	9ftUjLk73zaDoY/GFGBVlmgKa8sDFpBPMElWy0Y1hBtf29KoUxuYpjIIfhHoi/hp5hWWdU
	DoARQ9l95JmKBa9DuH9ufdwFrMD0p+YmGNZUj69kR43tykpqr+tM30nGe6qypYCxW/3URc
	ccBL46oJ5Ejv42YiL/WpO4WBZvGSSZ1IoCx6hPbjrqCJToZApjeSbDFKAPz4w6f9tNWP1y
	2VH4i7sS/kPKFbnUlqEaqERt7Gb4XxdVQzOefyMEzBa70l54wj54qFfhAExx8g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1773648871;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WSOPBOtCZR55Ppkhd+kncZ0Q+IGD3weYA3vhslBMT/Y=;
	b=j04c+glpv7gTiC/XCliL9gSVLB2FiG0kUaIanPNt8Ydr4fgPeTFUKO7d+YS9SSq9HJm7FY
	A/Gakj70E7toT3Ag==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Arnd Bergmann <arnd@arndb.de>, Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	=?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>,
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	Alexandre Ghiti <alex@ghiti.fr>, "H. Peter Anvin" <hpa@zytor.com>,
	Kiryl Shutsemau <kas@kernel.org>,
	Sean Christopherson <seanjc@google.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Charles Mirabile <cmirabil@redhat.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
	Jisheng Zhang <jszhang@kernel.org>
Subject: Re: [RFC PATCH v2 7/7] futex: Use runtime constants for
 __futex_hash() hot path
Message-ID: <20260316081429.FJx4fnNl@linutronix.de>
References: <20260316052401.18910-1-kprateek.nayak@amd.com>
 <20260316052401.18910-8-kprateek.nayak@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260316052401.18910-8-kprateek.nayak@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_011435_937029_53E8DB17 
X-CRM114-Status: UNSURE (   8.84  )
X-CRM114-Notice: Please train this message.
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

On 2026-03-16 05:24:01 [+0000], K Prateek Nayak wrote:
> From: Peter Zijlstra <peterz@infradead.org>
> 
> Runtime constify the read-only after init data  __futex_shift(shift_32),
> __futex_mask(mask_32), and __futex_queues(ptr) used in __futex_hash()
> hot path to avoid referencing global variable.
> 
> This also allows __futex_queues to be allocated dynamically to
> "nr_node_ids" slots instead of reserving config dependent MAX_NUMNODES
> (1 << CONFIG_NODES_SHIFT) worth of slots upfront.
> 
> No functional chages intended.
> 
>   [ prateek: Dynamically allocate __futex_queues, mark the global data
>     __ro_after_init since they are constified after futex_init(). ]
> 
> Link: https://patch.msgid.link/20260227161841.GH606826@noisy.programming.kicks-ass.net
> Reported-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de> # MAX_NUMNODES bloat
> Not-yet-signed-off-by: Peter Zijlstra <peterz@infradead.org>
> Signed-off-by: K Prateek Nayak <kprateek.nayak@amd.com>

This all looks nice. Let me look later at the resulting code. Thank you
so far ;)

Sebastian

