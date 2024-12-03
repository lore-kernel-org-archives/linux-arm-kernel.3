Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0550E74AC6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 17:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qxuSloquu2ZKlr2RO7bPydO4kceXmUvfq8zF+5PnMRc=; b=acKhPaig6Fe66Xxl1juQehvPqd
	u0VXO/VQQFFSa8PiuClhTufPFu3xrKD7vF9vjbZZjR/J0kICHMzXHhVQOXsZpj6ywh9m1n4C/Jk0r
	Jm+a1tBNgBE9JOCGfs6ouQ0dq6ymDuBWsxiszeGg+1XdwnRPn/yK3rCgKfSM/0YuszBWApSENXwdO
	hcsb97Tzwf9bVZ1fEWLbNlHvhTbvnNaX10wMnToEV9m1PGg3yW1DfC0ei/4rYOhlyBo8g9IHg7u6G
	BvepzkTirecC0Ukc0M1cCnJ2Eb/5Uu+wqEx7gNQOuLEGj9g0JCQ0p3Z4kWtB+MeSOuTd3yfIdtYlK
	asGO4AgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIWQs-0000000ADPC-0vw8;
	Tue, 03 Dec 2024 17:11:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIWPr-0000000ADJR-1Q6o
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 17:10:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D6E05FEC;
	Tue,  3 Dec 2024 09:10:54 -0800 (PST)
Received: from e133380.arm.com (e133380.arm.com [10.1.197.37])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BDD173F58B;
	Tue,  3 Dec 2024 09:10:25 -0800 (PST)
Date: Tue, 3 Dec 2024 17:10:23 +0000
From: Dave Martin <Dave.Martin@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 5/6] arm64/signal: Avoid corruption of SME state when
 entering signal handler
Message-ID: <Z087f9lkTBPFyOzA@e133380.arm.com>
References: <20241203-arm64-sme-reenable-v1-0-d853479d1b77@kernel.org>
 <20241203-arm64-sme-reenable-v1-5-d853479d1b77@kernel.org>
 <Z08kvi0znVM2RHx4@e133380.arm.com>
 <537fe318-a679-4b5c-b87f-93a7812dbeca@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <537fe318-a679-4b5c-b87f-93a7812dbeca@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_091027_955847_B257D46D 
X-CRM114-Status: GOOD (  21.22  )
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

Hi,

On Tue, Dec 03, 2024 at 04:12:33PM +0000, Mark Brown wrote:
> On Tue, Dec 03, 2024 at 03:33:18PM +0000, Dave Martin wrote:
> > On Tue, Dec 03, 2024 at 12:45:57PM +0000, Mark Brown wrote:
> 
> > > +	get_cpu_fpsimd_context();
> 
> > > +		if (current->thread.svcr & SVCR_SM_MASK) {
> > > +			memset(&current->thread.uw.fpsimd_state.vregs, 0,
> > > +			       sizeof(current->thread.uw.fpsimd_state.vregs));
> 
> > Do we need to hold the CPU fpsimd context across this memset?
> 
> > IIRC, TIF_FOREIGN_FPSTATE can be spontaneously cleared along with
> > dumping of the regs into thread_struct (from current's PoV), but never
> > spontaneously set again.  So ... -> [*]
> 
> Yes, we could drop the lock here.  OTOH this is very simple and easy to
> understand.

Ack; it works either way.

Since this is a Fixes: patch, it may be better to keep it simple.

> 
> > > +		/* Ensure any copies on other CPUs aren't reused */
> > > +		fpsimd_flush_task_state(current);
> 
> > (This is very similar to fpsimd_flush_thread(); can they be unified?)
> 
> I have a half finished series to replace the whole setup around
> accessing the state with get/put operations for working on the state
> which should remove all these functions.  The pile of similarly and
> confusingly named operations we have for working on the state is one of
> the major sources of issues with this code, even when actively working
> on the code it's hard to remember exactly which operation does what
> never mind the rules for which is needed.

Sure, something like that would definitely help.

Cheers
---Dave

