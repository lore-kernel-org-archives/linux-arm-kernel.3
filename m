Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC6F3606A335
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 15:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Uv5xuYHr;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=M/7yHUfQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=6P0PHr+n9Ve3fxg8VsvgwFjBRTqtcr54xk6mXcgcgeU=; b=Uv5xuYHrN7F7+0hBghbbnOcGSY
	aEU5uO3g7d0Lce8gWUfct5fYCfV1luZNJTKJCU9Fz/HB0h3xlKb+/RXwhq4uYSIjVr8oAEoAH4IT+
	oIfWJecjbysP1q/HyXLBlwM8oVX6+gR5GEetRF2Xx3m+DzVSYETWETA3zlqB5tuDUplPAlycKPv5k
	rketDqZaQU3oTg8LZiBbLRh3qlQPEiHsPiwSBDqBjOISC5ipuntLR3qCTVA0zz3m1x6nzPlVUJF+d
	CvDZ+3OEI1Rv51afdVZCVSDBMv0lBakZZB3jZPdd+ST9vFOgsNGJcOfAbPnc0q3GQnEWs48rPzd/k
	HQzMVVyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOGlZ-000000031Aq-3tCe;
	Tue, 03 Nov 2026 15:49:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOGlX-000000031A6-2vrX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 15:49:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 32C9F1595;
	Tue,  3 Nov 2026 07:49:35 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 03B563F673;
	Tue,  3 Nov 2026 07:49:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793720978; bh=BID+rQWcre0pu+Hc8/Ybye16P1LYmsxhx3QBHIdrvHQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M/7yHUfQ91gZ+q5qgdzem+UFmbdEMxBYyz+CL9oOvdC8qU9gEx1QByMs0dBh+bV/c
	 zNfL2nWco0s5rbt1FNC0ZHZmFsRdKEgL5t9QFmJHt83yp55KIPjWcZ8E56qPdA0qmM
	 H+Xuz2havdng9mdabhglVmV5KYNVjHwcLv4/cOug=
Date: Tue, 3 Nov 2026 15:49:34 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>
Cc: Wei Wang <wvw@google.com>, Mark Brown <broonie@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	wei.vince.wang@gmail.com
Subject: Re: [PATCH] arm64: suspend: Save and restore TPIDR2_EL0 across CPU
 suspend
Message-ID: <auoCjmMnzRE8c1cN@arm.com>
References: <20261102234813.1069156-1-wvw@google.com>
 <aunKa8uBZJTCzVjd@willie-the-truck>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aunKa8uBZJTCzVjd@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_074939_774979_C7640AB3 
X-CRM114-Status: GOOD (  18.17  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 03, 2026 at 11:50:03AM +0000, Will Deacon wrote:
> On Mon, Nov 02, 2026 at 11:48:13PM +0000, Wei Wang wrote:
> > On systems with FEAT_SME, TPIDR2_EL0 is part of userspace thread state:
> > the AAPCS64 SME ABI uses it as the ZA lazy-save pointer, and the kernel
> > context-switches it eagerly in tls_thread_switch(). While a task is
> > running, the live register is the only copy of its value.

[...]

> There's a lot of unnecessary (AI-generated?) detail in here. Please can
> you trim this down a bit? I don't think we care about the firmware part,
> the stuff about idle or the bionic crash. The bottom line is that we're
> not saving/restoring a live EL0 register across suspend/resume.

I should get an LLM to trim it down when applying ;).

> > diff --git a/arch/arm64/mm/proc.S b/arch/arm64/mm/proc.S
> > index 7afbece885a3..c7b7fa6491c3 100644
> > --- a/arch/arm64/mm/proc.S
> > +++ b/arch/arm64/mm/proc.S
> > @@ -103,6 +103,10 @@ SYM_FUNC_START(cpu_do_suspend)
> >  alternative_if ARM64_HAS_TCR2
> >  	mrs	x2, REG_TCR2_EL1
> >  	str	x2, [x0, #104]
> > +alternative_else_nop_endif
> > +alternative_if ARM64_SME
> > +	mrs_s	x2, SYS_TPIDR2_EL0
> > +	str	x2, [x0, #112]
> >  alternative_else_nop_endif
> >  	ret
> >  SYM_FUNC_END(cpu_do_suspend)
> > @@ -142,6 +146,10 @@ alternative_if ARM64_HAS_TCR2
> >  	ldr	x2, [x0, #104]
> >  	msr	REG_TCR2_EL1, x2
> >  alternative_else_nop_endif
> > +alternative_if ARM64_SME
> > +	ldr	x2, [x0, #112]
> > +	msr_s	SYS_TPIDR2_EL0, x2
> > +alternative_else_nop_endif
> 
> nit: We use msr and REG_* for TCR2, so it would be more consistent to do
> the same for TPIDR2_EL0 if the assembler is happy with it.

TPIDR2 is not defined in arch/arm64/tools/sysreg yet (for some reason,
only TPIDR_EL1 is). Since this is a cc stable, I think we can leave it
as is and do a TPIDR* cleanup going forward.

-- 
Catalin

