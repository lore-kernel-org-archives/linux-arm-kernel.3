Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69CE5C43602
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 08:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hIW/bfoVhF6C8YrHlddSaYp+8+PB2sPCZ1uwcJ1svP8=; b=AB4Aeht/z4wXD1rPDNDn/guRGF
	cNfORTmm5ca+iH88hAfG0BAKh2imCthlHTlkG9mtKVGyIdIVFDbOut9TmGMK8iHrN2RYPsWPQY1Ox
	LPJp3EVhBWQv/bYdrlKR1WEqaOPzOgQLmfBGa2JmlW6pfly3QL0s0vfnn8g883iv0o6Uf/uXxs/y9
	UmycoEG8aSIzZ66FSz0E5NLd6nbL/Q7gM7eNIT4Jdu1pk7lWWHPLs3YUbwV7zIqtxERx2EK+aIsR9
	hDLDosJtgpeIhqf7/COY9k/9Qmm9QqOaF+bq2o6ZnlRLM6HOZBQQB68GW9EF1wG5c+EdooepYWIhP
	ZYRkjApQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weqW9-000000013FC-2awL;
	Wed, 01 Jul 2026 08:42:01 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weqW6-000000013EL-13yh;
	Wed, 01 Jul 2026 08:41:59 +0000
Date: Wed, 1 Jul 2026 10:41:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1782895312;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hIW/bfoVhF6C8YrHlddSaYp+8+PB2sPCZ1uwcJ1svP8=;
	b=WlkVgNkTFIYNtIj5qhELBYQd+AxKqlkZG3TrLGwri5qEahI5i2Iq5DPX1nRgw4bnbyacTw
	G6IG8Qy3NuzNrCDMtIbAL5uMpEgdi1pIXIqiIyZJuvq+UJQxYzRGJrpiwLWtT4av1uVvlD
	RGAbzJcyGPtwci6yrymLNTmaiULCn8ET6Tnkm2/7TuvhZos5optOP0cIInMD0X64zBibOX
	wlFtEzmKWPN5JwVjZUwN0LY1fw2+Qpa9cS/QY9chuZM14XdjrlPKAF/CfWpGQWzlVWB5Cy
	hjsnfyncyhqRk3d2cx8c1W7hUUH3sjBIOm/jrY9WePU3JRRm9ynzK2e7bJ681w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1782895312;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hIW/bfoVhF6C8YrHlddSaYp+8+PB2sPCZ1uwcJ1svP8=;
	b=i5WUD6yceXQe3x8TOrF2eWaGcrFDsh2T9jch8rsli5FTanCRAoIUsTybzMrCtoXwtD6xPq
	deJ2Wb7rO9Vu+lAg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Peter Zijlstra <peterz@infradead.org>
Cc: K Prateek Nayak <kprateek.nayak@amd.com>, Arnd Bergmann <arnd@arndb.de>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	=?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>,
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
	Samuel Holland <samuel.holland@sifive.com>,
	Charlie Jenkins <thecharlesjenkins@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Thomas Huth <thuth@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Jisheng Zhang <jszhang@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>
Subject: Re: [PATCH v5 8/8] futex: Use runtime constants for __futex_hash()
 hot path
Message-ID: <20260701084150.GNOeboLw@linutronix.de>
References: <20260630045531.3939-1-kprateek.nayak@amd.com>
 <20260630045531.3939-9-kprateek.nayak@amd.com>
 <20260701075714.GP48970@noisy.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260701075714.GP48970@noisy.programming.kicks-ass.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_014158_435769_EAD9E057 
X-CRM114-Status: UNSURE (   7.96  )
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

On 2026-07-01 09:57:14 [+0200], Peter Zijlstra wrote:
> The big $1M question: does it actually make it go faster? The whole
> point here was performance, right? But I'm not seeing numbers showing
> how awesome these patches are.

I did complain about the about the size of __futex_data which is blown
on distro kernels due to CONFIG_NODES_SHIFT=10 on Debian for instance.
This makes it go away at no extra price but yeah let me boot a big box
and see.
If the performance remains unchanged it is still worth considering due
to size savings on the average box with 1 node. The biggest box I have
access to has four nodes. If I remember correctly, Prateek was saying
that AMD has "normal" boxes which would require =9 for normal operation
and they do run distro kernels so lowering that value is not an option.

Sebastian

