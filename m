Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CB2AE9A765
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 10:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CKyTYEVkPWyYi+asBSLq81UHgxquPBaNzWMSVDTBSBo=; b=gB/eHchvaqcqa+SPsmFigl8sUu
	bRMZkTawNUBGl+Xyj9e8HzZWBO8aTBGpJ09TzrPlQuCr73Y090haFAydoUPjvkBc2uelBfabKTyYc
	OGkf4jSs6DSWpZvP7cn96e5DocF/n3cMXZYEkuISY5DsDxRX4Y19MItHBPmNS2rn4iPA6+KjpSZ3W
	jJIi+qprpmn/jwbWxISKpRD5+J8E4jrjEehCO6Nfx0sZlJLUpxBPLMhsNNm0PGbyLwCo4vNuNrFaH
	W6UmU88U1Obm6YUr+88sA7BFi4/EJb9uZlrdltEw9VR/eQER1elXgNDE5TZrxPP9WDHEIkRSYHu7v
	g75YkIVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4zMq-00000001EmD-1qik;
	Tue, 24 Mar 2026 10:52:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4zMo-00000001Elq-17Yn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 10:52:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 06FD6153B;
	Tue, 24 Mar 2026 03:52:03 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 778003F73B;
	Tue, 24 Mar 2026 03:52:07 -0700 (PDT)
Date: Tue, 24 Mar 2026 10:51:44 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Subject: Re: [PATCH 1/2] arm64/entry: Fix involuntary preemption exception
 masking
Message-ID: <acJswNy3X1jG_gh0@J2N7QTR9R3>
References: <20260320113026.3219620-1-mark.rutland@arm.com>
 <20260320113026.3219620-2-mark.rutland@arm.com>
 <c4e823cd-bd35-0e4b-d3fd-52688bfdf4ab@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c4e823cd-bd35-0e4b-d3fd-52688bfdf4ab@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_035210_371760_1FF85279 
X-CRM114-Status: GOOD (  13.45  )
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
Cc: vladimir.murzin@arm.com, peterz@infradead.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org, tglx@kernel.org, luto@kernel.org, will@kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Mar 24, 2026 at 11:14:28AM +0800, Jinjie Ruan wrote:
> On 2026/3/20 19:30, Mark Rutland wrote:
> > On arm64, involuntary kernel preemption has been subtly broken since the
> > move to the generic irq entry code. When preemption occurs, the new task
> > may run with SError and Debug exceptions masked unexpectedly, leading to
> > a loss of RAS events, breakpoints, watchpoints, and single-step
> > exceptions.
> 
> We can also add a check in arch_irqentry_exit_need_resched to prevent
> schedule-out when the DA bit is set.

That *might* be good enough for a backport to stable, but that's not the
right fix going forwards.

Checking the DAIF.DA bits will prevent preemption from anything other
than real interrupts, and Thomas said we should preempt wherever
possible:

  https://lore.kernel.org/linux-arm-kernel/87h5qak2uv.ffs@tglx/

The interrupt handling path is also inconsistent w.r.t. masking DAIF
upon return, and with that cleaned up it'll look the same as other
exceptions, and we can't rely on DAIF.DA.

I think there are alternative options here; I have a half-written reply
to Thomas's other message:

  https://lore.kernel.org/linux-arm-kernel/87fr5six4d.ffs@tglx/

... and I'll try to finish that up and get it out shortly.

Mark.

