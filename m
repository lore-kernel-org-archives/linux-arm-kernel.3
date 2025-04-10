Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0CB2C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 18:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MZ5oOh0zz7StublrYqB04NHmYQEpJz4EGl117RgnK/c=; b=n9B6xUPKKdDuxAuyiUNGt8xEg/
	2dJUgFpiMUNPokcUbXHTHk4Cp9tPjvouVGVzaUM0yOB8ECsirDZHtRiWKpohO/kk619eMnWVdjAuZ
	AEHIh/SRV6HH4kp6ZIF6Ue8Bv0jVjlt4E42CD2tkSPZI34elrO8QZxOoAEMrIj8QOMVRc20SJKEgs
	7W//FnGn0VB9Lv2pvcPhL45RMP7It4bTug13ZCwy3IY4w7Zy33D6ZIn7t1G4GlBlkDbIbdePenM9E
	9i3z+TWHfHyQdPTWk0hdst5WA0alR9OIoXPd5hQv6AV+yBE4pjtMzskeGldZ8SBfQRKHTYOH6PuUb
	9DoB15gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2wgL-0000000BWNn-0wVn;
	Thu, 10 Apr 2025 18:31:21 +0000
Received: from out-181.mta0.migadu.com ([2001:41d0:1004:224b::b5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2vl7-0000000BOCH-3axl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 17:32:15 +0000
Date: Thu, 10 Apr 2025 10:31:46 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744306329;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MZ5oOh0zz7StublrYqB04NHmYQEpJz4EGl117RgnK/c=;
	b=nOiU4CeG/HCKdRnVk2rzbyL1a26TgtN4ID/0kj8PycK0GSez9OR4nXI5Czps2kr/tPX8+q
	lBFg0gkwx9t5hbklthzPmlTofoD0xxeXZImqFrMBsGzxQtaYuieFWKQz0TSzaHWD6mrPKZ
	Wa+4EDRSFkvHlHvvFfn6BxW8fFJt/g4=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org,
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	darren@os.amperecomputing.com
Subject: Re: [PATCH] KVM: arm64: nv: Forward hvc traps if originated from
 nested VM
Message-ID: <Z_gAgixMjKQJsWJg@linux.dev>
References: <20250410070743.1072583-1-gankulkarni@os.amperecomputing.com>
 <86mscolc0b.wl-maz@kernel.org>
 <4d1bdea5-43c3-4ca9-9275-feadf158e86e@os.amperecomputing.com>
 <86jz7sl25r.wl-maz@kernel.org>
 <91339d4d-38d7-4512-9fda-339bb4c2a3f4@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <91339d4d-38d7-4512-9fda-339bb4c2a3f4@os.amperecomputing.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_103214_668059_8A6FCD49 
X-CRM114-Status: GOOD (  24.16  )
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

On Thu, Apr 10, 2025 at 06:52:45PM +0530, Ganapatrao Kulkarni wrote:
> 
> 
> On 10-04-2025 04:22 pm, Marc Zyngier wrote:
> > On Thu, 10 Apr 2025 11:20:24 +0100,
> > Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com> wrote:
> > > 
> > > 
> > > 
> > > On 10-04-2025 12:49 pm, Marc Zyngier wrote:
> > > > On Thu, 10 Apr 2025 08:07:43 +0100,
> > > > Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com> wrote:
> > > > > 
> > > > > It was discovered while trying selftest(smccc_filter) that the
> > > > > hvc trap is getting forwarded to guest hypervisor even if it is
> > > > > originated from itself.
> > > > > 
> > > > > HVC traps from guest hypervisor should be handled by the host
> > > > > hypervisor and traps originating from nested VM should be
> > > > > forwarded. Adding check to forward only if the hvc is trapped
> > > > > from the nested VM.
> > > > 
> > > > I disagree. HVC from EL2 must be routed to the same EL2. HVC from EL1
> > > > must be routed to the EL2 controlling EL1.
> > > 
> > > Thanks, Understood, In NV case, hvc has to be forwarded to L1
> > > irrespective of it origin (L1 or L2). Need to add hvc handler in the
> > > smccc_filter.c for the vm (when run as L1), so that it is handled and
> > > returns with required args set.
> > 
> > Why? This test checks under which conditions an HVC/SMC gets routed to
> > userspace. What does it even mean to test HVC if it doesn't make it
> > outside of the guest itself?
> 
> smccc_filter.c has 2 tests (test_filter_denied and test_filter_fwd_to_user),
> which runs the vm(guest_code).
> 
> I was trying to modify test_filter_denied to run in vEL2, which led to this
> patch/discussion. I agree, it does not makes sense to run this test for
> vEL2.
> 
> test_filter_fwd_to_user is not feasible to run in vEL2.
> Thanks for the feedback.
> 
> BTW, I could add hvc handler and run test_filter_denied in vEL2.

I would much prefer that the entire test be adapted to consider the EL of
the guest, only testing the behavior of SMCs for EL2.

Thanks,
Oliver

