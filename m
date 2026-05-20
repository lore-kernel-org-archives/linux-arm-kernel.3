Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08BF7CD5BA4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 16:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g/mdElG8XVxrRo7A/JbBcO6mbY0uvLE8ILKRJCbpdxM=; b=jthAK+kiLi0/Sxe0eP1B/ljyf1
	17OqPb/TBrqpLMj1UMWkPyHiT+FisXayjutZdqveMRhwcQXxh1kGIlFuA4EYW/XXJFUK7lIu8svdB
	QvxA1Rf5fWEk9KyMq9XlFnJGlN1kOFCnv1zoYLiCmmelQhkFYIKw8QPsgsOcrbVv645Yk78j1rm6Z
	+ymMBdrijLmQw5K3qZ7YLeYMYYKF6N/6GpIhajmU772rdL5QpHrRoqOtq3w4Nvot/ftFCf77m1pm7
	0xi2LdQhymgt7ywCjKGS7zmPGtbo76dteT8oomPcvrpJa2VnGIvGBAekVY83Mk70acfeVxCT64G98
	kUGHqMhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPk3O-00000005CoP-3NEe;
	Wed, 20 May 2026 16:45:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPk3N-00000005CoB-3H8T
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 20 May 2026 16:45:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:CC:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=g/mdElG8XVxrRo7A/JbBcO6mbY0uvLE8ILKRJCbpdxM=; b=HnVxxRBZ91n0TzhMWjqoFoUndy
	JCeNU09NIJUZ2psJ+WvOI35zLwLg9RbuYlgwEBJ2bVzffymcqIb0xPOS9KT2KMv5IRMAKayVFl3cw
	e7XkOlrZwHrTp4+ChNeO3eFqfxTHBa2m5Ow9bT3ZzYc02jrkXgCvxD7dtV1Iip+mi3aIdNjQrNyL1
	JC11wBesqv2DOW307ChG0U7PjSI18RF3ap/rZAleFA+n9uxdx/ZVvZmdjpuEqCYw2FLGZJn73nb44
	Iq51GqqZaatq/BPFf46s2P/oBEoclTCTXxyVIwSY7qPAsQruJHd9RlheH+uGijNFYyy0dE2hfg77j
	dpMG6w9A==;
Received: from pdx-out-008.esa.us-west-2.outbound.mail-perimeter.amazon.com ([52.42.203.116])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPk3I-0000000HQ4a-1pER
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 16:45:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1779295548; x=1810831548;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=g/mdElG8XVxrRo7A/JbBcO6mbY0uvLE8ILKRJCbpdxM=;
  b=YfFJoWDGSsCb1Om9s9uPIuhzonAC6rh+LLzO41eUdunPnvaYR5eh6/Na
   i1rtIde1Xpf0WZa0fU5YLVYCGV8DrDM9zthOxl3ZtiLKG/0EdZmrJnodP
   i2USyTLlt5h4b/8csG0Xo1w5Ly6Qh4p83gXTVHKVKMgUuOFkyYTLt6doM
   aiGUJCA2s8grsd9M88RFFBZhtO5nEtaXS3gnCQaMGmy2U39mkm0KljJKm
   1U31TyL8rXffMD1balaH70lcJux1nSAslAHO7VYjkAviF0XjReaTvg67D
   XdlidZaPJzsYJuPCUhmKWSPKaHWlrSSC2zy9X8yEl4zVLcOy/1Xit+dfZ
   w==;
X-CSE-ConnectionGUID: 6CM/v+SqS3mro50F9m7WLQ==
X-CSE-MsgGUID: txtMnmxBREy9rUBnieDnrw==
X-IronPort-AV: E=Sophos;i="6.23,244,1770595200"; 
   d="scan'208";a="20121903"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-008.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 16:45:38 +0000
Received: from EX19MTAUWB002.ant.amazon.com [205.251.233.111:9226]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.36.77:2525] with esmtp (Farcaster)
 id c4cbe365-4159-4256-8585-8622e4278cdf; Wed, 20 May 2026 16:45:37 +0000 (UTC)
X-Farcaster-Flow-ID: c4cbe365-4159-4256-8585-8622e4278cdf
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Wed, 20 May 2026 16:45:35 +0000
Received: from 80a9970eed1e (10.187.170.17) by EX19D001UWA001.ant.amazon.com
 (10.13.138.214) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37; Wed, 20 May 2026
 16:45:34 +0000
Date: Wed, 20 May 2026 09:45:32 -0700
From: Justinien Bouron <jbouron@amazon.com>
To: Leo Yan <leo.yan@arm.com>
Subject: Re: [PATCH] arm64: Add user and kernel page-fault tracepoints
Message-ID: <ag3lLB3ep279D9iX@80a9970eed1e>
References: <20260520045524.75670-1-jbouron@amazon.com>
 <20260520073606.GA101133@e132581.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260520073606.GA101133@e132581.arm.com>
X-Editor: VIM - Vi IMproved 9.1
X-Originating-IP: [10.187.170.17]
X-ClientProxiedBy: EX19D043UWC003.ant.amazon.com (10.13.139.240) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_174549_915713_F3E78814 
X-CRM114-Status: GOOD (  23.49  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Gunnar Kudrjavets <gunnarku@amazon.com>, Ryan Roberts <ryan.roberts@arm.com>, Quentin Perret <qperret@google.com>, Catalin Marinas <catalin.marinas@arm.com>, Kevin Brodsky <kevin.brodsky@arm.com>, linux-kernel@vger.kernel.org, David Hildenbrand <david@kernel.org>, Lorenzo
 Stoakes <ljs@kernel.org>, Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, May 20, 2026 at 08:36:06AM +0100, Leo Yan wrote:
> On Tue, May 19, 2026 at 09:55:24PM -0700, Justinien Bouron wrote:
> 
> [...]
> 
> > @@ -606,6 +609,11 @@ static int __kprobes do_page_fault(unsigned long far, unsigned long esr,
> >  	int si_code;
> >  	int pkey = -1;
> >  
> > +	if (user_mode(regs))
> > +		trace_page_fault_user(addr, regs, esr);
> > +	else
> > +		trace_page_fault_kernel(addr, regs, esr);
> 
> Based on the discussion [1], Arm64 has already supported perf sw event
> for page-faults:
> 
>   perf record -e page-faults ...
> 
> Seems there have a plan to consolidate perf event and tracepoints but I
> have no idea how it is going.
This refactor/consolidation is not specific to arm64 right? I see that both x86
and riscv also have both the tracepoints and the perf event, presumably they
will need to be refactored as well?

> I would leave this to maintainers.
Agreed.

> 
> > +
> >  	if (kprobe_page_fault(regs, esr))
> >  		return 0;
> 
> tracepoints should be after kprobe_page_fault(), as explained [2] by Mark.
Interesting. The reason I put them before the kprobe_page_fault is because this
is how x86 is doing it. x86 calls kprobe_page_fault from do_kern_addr_fault /
do_user_addr_fault which are called _after_ the trace_page_fault_{user,kernel}.
Is there a reason why this is allowed in x86 but not arm64?

Also I did not realize that there already was an attempt to add the page-fault
tracepoints in the past!

Best,
Justinien
> 
> Thanks,
> Leo
> 
> [1] https://lore.kernel.org/all/20250520140453.GA18711@willie-the-truck/
> [2] https://lore.kernel.org/all/aCtZfiU8bgkSAgLh@J2N7QTR9R3/

