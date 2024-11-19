Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 571CAD591D4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 07:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fYHxGu57Vd/67w2lE6iMGTcHGQWrzFlObyNHWuPMT1k=; b=1h3JYp6Z1FQ5p5sYOxoiNVYVUY
	0d6EpNeVfTLClQduLSRdhWI/aySXJY4zosv3X99gfekLWtQiOkS7movpqXwx+8O6ijuMYf37aoTZs
	ibttwOvoj6aglco0SWVI2e5/O53uTe5Ftyiu55I/cMFCxbLi5YQGW9rHm5jx9L//+w96GNgStzTl3
	jEFOgZkVAxwf4QYvJe5VDae2evZmwwq3aBJNRPUPDG1vifqWlP2RoRXYbdhEVKQtfiwleJ0YomtjH
	wX23dIxk2d0U5B3MHGKfDVv2RQolb70fXe2aolZkM5gjm/x8WFXfm7zX8ULpGpJYPQ0D2x1ssQekR
	/kIABQPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDIT8-0000000Bc1r-1RxR;
	Tue, 19 Nov 2024 07:16:14 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDISC-0000000BbvU-2NTY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 07:15:17 +0000
Date: Tue, 19 Nov 2024 08:15:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1732000512;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fYHxGu57Vd/67w2lE6iMGTcHGQWrzFlObyNHWuPMT1k=;
	b=3cVL8lf0Gb/HWJXsnjzFswzLt0MXmK8lKTNk9B1V6rvcJzSfEH0dIAcQDVWOb/QV8D+n4N
	m2tr85+9HY+P6/ldmAvE0kL4WeImVJfRxmdgR3TlpxfwEy0BNb4Sra7pqoZ/JA0nnFSrUG
	fJQBSiIAHYNinfY3VZJUu1tnfBSiZaKAMFo2+JXjk3OFVFvv6uh3S08VU8fKEFo7SF9Pso
	jDHRSExl7S5om4W8x+H5JWcyREh0XXZi8+aT1P57YPp/LOdAaWmf2edApTYzZDXkrXycEa
	O5XK8VT1P9wqL2H5XnlvMCG4r+tnuLoYaNCEOyzfVCcUF/9ZLMfL1Om1H44dTQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1732000512;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fYHxGu57Vd/67w2lE6iMGTcHGQWrzFlObyNHWuPMT1k=;
	b=fbjdjWM/UYcRFULLa6J86gF2bgO/IHXOCZ7BVYjO3x41u7LqH+rG9jZZt7xRzKioJfCTOf
	xkNWFejviIZuH4Cw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Krishna Reddy <vdumpa@nvidia.com>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH] iommu/tegra241-cmdqv: do not call smp_processor_id in
 preemptible context
Message-ID: <20241119071510.-6OKEw2q@linutronix.de>
References: <ZzvZkMKhwmJESpdM@uudg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZzvZkMKhwmJESpdM@uudg.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_231516_758385_32995DE9 
X-CRM114-Status: UNSURE (   9.42  )
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

On 2024-11-18 21:19:28 [-0300], Luis Claudio R. Goncalves wrote:
> With PREEMPT_RT enabled some of the calls to tegra241_cmdqv_get_cmdq()
> during boot will happen in preemptible context. As this function calls
> smp_processor_id(), these calls will trigger a "BUG: using smp_processor_id()
> in preemptible" backtrace if DEBUG_PREEMPT is enabled.

If this is only on PREEMPT_RT, where is the disabled preemption coming
from on !PREEMPT_RT?

> As tegra241_cmdqv_get_cmdq() only calls smp_processor_id() to use the
> CPU number as a factor to balance out traffic on cmdq usage, it is safe
> to use raw_smp_processor_id() here.
> 
> Signed-off-by: Luis Claudio R. Goncalves <lgoncalv@redhat.com>

Sebastian

