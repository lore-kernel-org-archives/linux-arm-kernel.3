Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBDDBD5B861
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 18:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CG0gW1iIBjVUQ601gkP2K4B+M7f6NFCRLl0r29M0TLc=; b=H40IBEDJqq/HR4fvNr2cf3CHjj
	h30rkk36xl1ep3BVb8qjtBeMakeNbBD6co49olQY2G/D9/9d2XUmV8PCI0c7d3Ky6JtRqzlDVLRFK
	BMLH6bezfqcUtw2bLnOqvRO8zOGEI7UUIhrgZs4PH6c7ljwNymaqc1yEjM+22E4b0hOxsizJ+3dVg
	qzxl7H3iphkndRqQFMBwhZ+tNa1IXh7aRXd3bPWmHspAK8u0BjffFzRHSOC5q381Kr5GIqdANsSE4
	+zeRyM7aZ0xye7xDDv2rBn8lpY72J9jXhQ9L3n5V60gW9HEHffU5QkjiJBzM/c+GprcLwAY9S5lr+
	Lp2PIpCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVCxq-000000046mC-0OSo;
	Mon, 15 Dec 2025 18:06:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVCxl-000000046lg-1hIe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 18:06:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E355843852;
	Mon, 15 Dec 2025 18:06:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 815FCC4CEF5;
	Mon, 15 Dec 2025 18:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765821983;
	bh=rJKmpgwGt+PHS/ree1WrcDO5XiHWvRcZqNyAmcIy9es=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X4dXhe815EGINN9+D1XDn9JYU912TK9FP4PyD9foSopSle3q6dYCpVr7jyRI+DWhV
	 i6Kl7yfrDQ4oeU9p4NFbKlHcZcHLCJnJKJW94SSYYy2027yh6oiX0HK+vlP/mFkgUK
	 mdZ1j/FEb2u77rv4Czi+cnB6TX/3tPXeEf921FoIY1kP8zucob8vquXGqRRwH5blGu
	 xe7Yqqh6OPmRYcD0CODaZO0GScRbWURp5ofAw6wIEfevB9DzZdxup/JiUjV7dz0lu4
	 al90hyz2mGYTARGtQoXeQzQHL243qPui+pkwqiXgqGkCb0e324FpssFbB2tPlaUd/9
	 po/4NT+SEhi5Q==
Date: Mon, 15 Dec 2025 10:06:22 -0800
From: Oliver Upton <oupton@kernel.org>
To: Colton Lewis <coltonlewis@google.com>
Cc: kvm@vger.kernel.org, pbonzini@redhat.com, corbet@lwn.net,
	linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org,
	maz@kernel.org, oliver.upton@linux.dev, mizhang@google.com,
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	mark.rutland@arm.com, shuah@kernel.org,
	gankulkarni@os.amperecomputing.com, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, linux-perf-users@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v5 19/24] KVM: arm64: Implement lazy PMU context swaps
Message-ID: <aUBOHnT1whwR3vbo@kernel.org>
References: <aTidfRwYLYwTfmK_@kernel.org>
 <gsntecoz2v87.fsf@coltonlewis-kvm.c.googlers.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <gsntecoz2v87.fsf@coltonlewis-kvm.c.googlers.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_100625_468237_2AEC0795 
X-CRM114-Status: GOOD (  20.46  )
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

On Fri, Dec 12, 2025 at 10:25:44PM +0000, Colton Lewis wrote:
> Oliver Upton <oupton@kernel.org> writes:
> 
> > On Tue, Dec 09, 2025 at 08:51:16PM +0000, Colton Lewis wrote:
> > > +enum vcpu_pmu_register_access {
> > > +	VCPU_PMU_ACCESS_UNSET,
> > > +	VCPU_PMU_ACCESS_VIRTUAL,
> > > +	VCPU_PMU_ACCESS_PHYSICAL,
> > > +};
> 
> > This is confusing. Even when the guest is accessing registers directly
> > on the CPU I'd still call that "hardware assisted virtualization" and
> > not "physical".
> 
> It was what I thought described the access pattern. Do you have another
> naming suggestion?

	PMU_STATE_FREE,
	PMU_STATE_GUEST_OWNED,

> > > +	kvm_pmu_set_physical_access(vcpu);
> > > +
> > >   	return true;
> > >   }
> 
> > Aren't there a ton of other registers the guest may access before
> > these two? Having generic PMU register accessors would allow you to
> > manage residence of PMU registers from a single spot.
> 
> Yes but these are the only two that use the old trap handlers. I also
> call set_physical_access from my fast path handler that handles all the
> other registers when partitioned.

The fast path accessors should only be accessing state already loaded
on the CPU. If the guest's PMU context isn't loaded on the CPU then it
should return to a kernel context and do a full put/load on the vCPU.

I'm not seeing how this all fits together but for lazy loading to work
correctly you need to evaluate the state of the vPMU at vcpu_load(). If
there exists an enabled PMC, set PMU_STATE_GUEST_OWNED and load it
upfront.

Otherwise, default to PMU_STATE_FREE until the next register access and
this whole thing resets when the vCPU is scheduled out. I had suggested
to you a while back that you should follow a similar model to the debug
registers, this is how they behave.

Thanks,
Oliver

