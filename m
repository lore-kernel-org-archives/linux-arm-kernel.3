Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B18FC88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 10:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FvbLEQ+5qgNl0vRkjXPHqsEPk7oY6DEg8oRMHNxOtSc=; b=QZ/w9ycadbDwNW0vqq/vpzh64P
	I/ybiZ1dBX1mQ/J8pv+8wuh3D4D3nYVyAfq/kMAq5cASuMauGNnRSm3p84xQD11GVIiYZyjRcY0DL
	BpyrIOtyAKVSrpWbWuGkk3RXVcfe2/c+nkUsWcxE2O77xUWlKWd0ThblktYqRaAqhMDFb1qLQ8oaw
	K3BqqZar99I6bufoyg1FTg+0q80yUfhdDP19Zt2JNpDkC3ojG7fWwqARkXx1QW3vyuuRcmr9jQawV
	+ZkMykhWa6jWOGNs4uB3dNzEuPk6d7cWaqSx7gcf1XGqqXY4AYg5opqJaGmtLMK/XicCH9W86y/yJ
	ZccmCGxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x79hr-0000000B8YL-3ZrH;
	Thu, 17 Sep 2026 10:51:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x79hp-0000000B8Xy-15rc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 10:51:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 97B191476;
	Thu, 17 Sep 2026 03:50:59 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B2D533F882;
	Thu, 17 Sep 2026 03:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789642263; bh=XihqMbgiW7kyP3lfZhBkDWHC5GYJp5plq+bKZoZZO64=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RtNfF25amyqFFOwy8f7Iwf2XNcgtv+nIar7eBklFC+H7xAzdIEqMy9x0nlPGgqPRB
	 cJk9SAnVOKw5yit88ub9YsR0jRng8wnZMYVoikwQM+HrvrznRNZAqoMaF/uTPYGa02
	 tQe/QcLuEmF28RDLit3va2X5NLtfgxw0mBTlrlP8=
Date: Thu, 17 Sep 2026 11:50:58 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Florian Weimer <fweimer@redhat.com>,
	Darren Hart <dvhart@infradead.org>, Ingo Molnar <mingo@kernel.org>,
	Davidlohr Bueso <dave@stgolabs.net>, Arnd Bergmann <arnd@arndb.de>,
	Uros Bizjak <ubizjak@gmail.com>,
	Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org, kernel-dev@igalia.com
Subject: Re: [PATCH v8 4/4] arm64: vdso32: Implement
 __vdso_futex_robust_try_unlock()
Message-ID: <aqvGEiZEtZFEWvjL@J2N7QTR9R3>
References: <20260821-tonyk-robust_arm-v8-0-077707b6f1c7@igalia.com>
 <20260821-tonyk-robust_arm-v8-4-077707b6f1c7@igalia.com>
 <aqqngEKC_CsrS62n@J2N7QTR9R3>
 <d0c5ada8-929f-4d39-9f8e-32860fa5b853@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d0c5ada8-929f-4d39-9f8e-32860fa5b853@igalia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_035105_336613_F26A80D2 
X-CRM114-Status: GOOD (  15.79  )
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

On Wed, Sep 16, 2026 at 10:11:01PM -0300, André Almeida wrote:
> Em 16/09/2026 11:28, Mark Rutland escreveu:
> > On Fri, Aug 21, 2026 at 06:50:45PM -0300, André Almeida wrote:
> > > Based on aarch64 implementation, provide a 32 bit entry point for
> > > this vDSO.
> > > 
> > > In order to keep compatibility with arm64_futex_robust_unlock_get_pop(),
> > > make sure to store the pop address at r2 and the compare result value
> > > at r3.
> > 
> > Before we add this to the compat vdso, we'll need to implement this on
> > arch/arm/.
> > 
> > Otherwise, my comments on the patch for the native vdso functions apply
> > here too.
> 
> Right, and the compat entry point at arch/arm64/ would point to the
> __vdso_futex_robust_list32_try_unlock implementation at arch/arm/?

So far we've had arm64 provide its own copy (which e.g. might use
sequences relying on ARMv8+ instructions), so I think we'd do the same
here.

The key thing is that 32-bit tasks on arm64 should see the same ABI as
native tasks on 32-bit arm. As there's a risk that 32-bit arm might have
some ABI quirks (e.g. due to older processors), we don't want to enable
features for compat tasks on arm64 before that's been implemented on
32-bit arm.

Mark.

