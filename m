Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D15CD5B85E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 17:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6c09UTI5I175mARZJpPXEvTRp0ulm1kPBbJ/DwkRbAk=; b=OO0INpVUOj38J7ybWkaFIs6kRS
	xEG0es+XgZ+eoRskIve++6RBFWYPMACmLHGuUk2od2mrxqvOq7THAJYwT2FyZvn4J8vhuDlcwhExQ
	ecl3ITtmPTcTFwgQqyEFmBCiBkFn0+FwzMPWjqm/zOnzl8TfL6vaFnMsYSKbqdskpjx46KVDpnUiE
	jj+YNwTA1ZwoXlTcfw7R67OIoROJOYYifKstH7x2eWCubG+Kj9TyjOu2+hIZyXAaSeLYX3EPbvSiX
	bU531pHWdVnHvh2pL2YEcdewes8J3wqd6frrlcHDqIuvJ4QJucwiMOP4xlv0acIyQkfK/PEy63Ohx
	N/o1i5Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVCiK-000000045Wy-0I0w;
	Mon, 15 Dec 2025 17:50:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVCiI-000000045Wg-2SIM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 17:50:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9F63D60007;
	Mon, 15 Dec 2025 17:50:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 132FCC4CEF5;
	Mon, 15 Dec 2025 17:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765821025;
	bh=YrTHPSx4341UHi+jq+akqh9qZcSw7dvO2ic7YUiWbg0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CEVe02IunMd7oRHFksHEuNX1ZGXmcKIUYs9D3rfyToXy2S9a/vJIReRvxn0hSyuHq
	 ZYiHE+ofGwyMAJmluKhkQYrdZH/sUMKtertR6dDwxTG+iRRnl/gjKIqHFfSgnoV8Fk
	 /L9lVyXu1WUxeBFv8WZU9ewBj0Uk7MrThe65m2SeSzSV5CJ1IHPADfw7Bhajy5exxg
	 f29m8+hYKOCCh9kjItC7brKVPTJ8NfuY+VapVLoxSo3SCPlFZTTXHGejcN362IY5CC
	 x0KbRMlW7m0lhBWnhBDb71H/F/MBsH1wSUTLQinohrsqHRnKc3HV6K4mEP6ckdb691
	 4ezHrJtnERipQ==
Date: Mon, 15 Dec 2025 09:50:23 -0800
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
Subject: Re: [PATCH v5 21/24] KVM: arm64: Inject recorded guest interrupts
Message-ID: <aUBKX8iqsptyTb4S@kernel.org>
References: <aTioEWHu0ZbFCjR6@kernel.org>
 <gsnt8qf72tv9.fsf@coltonlewis-kvm.c.googlers.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <gsnt8qf72tv9.fsf@coltonlewis-kvm.c.googlers.com>
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

On Fri, Dec 12, 2025 at 10:55:06PM +0000, Colton Lewis wrote:
> Oliver Upton <oupton@kernel.org> writes:
> 
> > In no situation should KVM be injecting a "recorded" IRQ. The overflow
> > condition of the PMU is well defined in the architecture and we should
> > implement *exactly* that.
> 
> When I say "record" I just meant "updating the virtual overflow register
> to reflect an overflow".

Right, consider changing the shortlog to read more along the lines of
"detect overflows for partitioned PMU" or similar.

> > On Tue, Dec 09, 2025 at 08:51:18PM +0000, Colton Lewis wrote:
> > > +/**
> > > + * kvm_pmu_part_overflow_status() - Determine if any guest counters
> > > have overflowed
> > > + * @vcpu: Ponter to struct kvm_vcpu
> > > + *
> > > + * Determine if any guest counters have overflowed and therefore an
> > > + * IRQ needs to be injected into the guest.
> > > + *
> > > + * Return: True if there was an overflow, false otherwise
> > > + */
> > > +bool kvm_pmu_part_overflow_status(struct kvm_vcpu *vcpu)
> > > +{
> > > +	struct arm_pmu *pmu = vcpu->kvm->arch.arm_pmu;
> > > +	u64 mask = kvm_pmu_guest_counter_mask(pmu);
> > > +	u64 pmovs = __vcpu_sys_reg(vcpu, PMOVSSET_EL0);
> > > +	u64 pmint = read_pmintenset();
> > > +	u64 pmcr = read_pmcr();
> 
> > How do we know that the vPMU has been loaded on the CPU at this point?
> 
> Because this is only called by kvm_pmu_update_state which is only called
> by kvm_pmu_update_state <- kvm_pmu_{flush,sync}_hwstate <-
> kvm_arch_vcpu_ioctl_run after a vcpu_load.

That's assuming the PMU is loaded eagerly which I thought we agreed it
would not be.

Thanks,
Oliver

