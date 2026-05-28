Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16B91CD6E44
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 15:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1/O6690LTogXCGAhOuB5o8py5EPR7dtCvuZauWGkmhI=; b=QkymjSkDnvaXtXDwcv+a+Suj7d
	P6BDEPCFo7n2oLX0lUOBiFPWc55bm1U5VWg5Pv5+OBIQyAlBLuYIDAkF+YbYgEC95olRe/bh8kTar
	2oZinB3Lh+oaij0pHmj5hSkDr111QnoZAjE2N11KMiJOhDCRGww0GH42d3I1pfjjCmhUyEvNqKatQ
	DppdbkE6QR1THQJoAt/A3LyxR078RDm12iImqD6Vcmgt3c7v3XJhOHipLr6DfpVA1J4LC300E/zFH
	+X0vvUld7G65BWtMdnggBuSpCuBvq+SaH/qJyOAhl+vhCGOn6C5iAyGJx1neDKXrq0PYDh1jqERsr
	BtjJwceg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wScm9-00000005vmo-2FyO;
	Thu, 28 May 2026 15:36:01 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wScm5-00000005vlp-3XhE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 15:35:59 +0000
Date: Thu, 28 May 2026 17:35:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779982556;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1/O6690LTogXCGAhOuB5o8py5EPR7dtCvuZauWGkmhI=;
	b=GHrJv2QIks2eYRD0aUPEBExi74jaugW0snZuzUSQDV1bF3XYOLMB/sFCVjma/gpiuFTKbR
	Dym2lop4/3H17P1HlX5POiIXob6Aw8XVmTA3kinjQYIwhWzgkC1u8TzCSb+5uCdhdZ2NfU
	pXivUt8yFTnWQdPBiqbgdaPQW7pEHTM1eLlXoHTGOt/pKfEu49b9oNtbpHEGZo6rC2bnVN
	Kph3EKLgj2Hv2vD/mU6udYTyPnthTBhL82FZ/78wQb00Iy1nr/4GmFdq/o5OQjm9FNJuAc
	KoxJtRiPxg9aOwhGEJBejgc0P0BDli8W6nxHcfFmfv77e83zvCFCthtMBxKorA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779982556;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1/O6690LTogXCGAhOuB5o8py5EPR7dtCvuZauWGkmhI=;
	b=UtxGoMecbSqZhZ5K9/qEXU3v0cDLx8r6WoZoT2gpHWilvg04Tld9rpJnFijViS/oyxTPXa
	nM4k96rOBNStYmDA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Waiman Long <longman@redhat.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH] arm64/entry: Don't disable preemption in
 debug_exception_enter() with RT kernel
Message-ID: <20260528153554.vllN7_T9@linutronix.de>
References: <20260519222524.886454-1-longman@redhat.com>
 <20260520061920.XCqBHe0x@linutronix.de>
 <a5251664-2c15-4a8e-906b-d204e10c38be@redhat.com>
 <20260528145124.v9o6OcOc@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260528145124.v9o6OcOc@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_083558_017764_C962D20C 
X-CRM114-Status: UNSURE (   7.50  )
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

On 2026-05-28 16:51:24 [+0200], To Waiman Long wrote:
> > The kernel backtrace is produced using the latest v7.1-rc4 kernel. There are
> > a number of changes to the debug_exception_enter() and
> > debug_exception_exit() functions over the years, but the preemption disable
> > code remains since its introduction in v5.3.
> 
> Let me look at this again.

So how do you reproduce this? The calls within debug_exception_enter()/
exit() look harmless or I miss the big thing here.
From your backtrace, you have brk_handler() and this is gone since
commit 31575e11ecf7e ("arm64: debug: split brk64 exception entry") which
is v6.17-rc1. I can use gdb with breakpoint handling.

Sebastian


