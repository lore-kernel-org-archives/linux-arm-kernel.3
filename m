Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D189C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Jun 2025 22:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pVDqG7Qru3dfMpTwDZ3dCGAw70KwMy1IAEgL6+IAtD0=; b=OrZV8pJh4aa0mu/29zVdXZkS7a
	UB1j0f1eMyNnUXJ+Im6XFY9BHq4yt3v2XjUdIY6VjzseH+U8A3/dZHxLWuqB90Yf1D0IthBNllxiP
	bUg35YKticZHoqb8Of0UwIeCzMgohV1kBzyzGfBUlSlyLMoomghLx7up7sNoUojhZgEpEIhLq2SxZ
	5BNydZbPRTqbTISGaxdKLmqPQtPwne1o/hnM8Yu1aOuuf0lMq8+hrTi1aX7GqLZdPEAXpE3YAZZK+
	C0ybLsOTukNG4N1/uS3w9xk87T60R5n2mBaqpvgE0/xhNf0g5H26605xZbB1TWVur8ksLCf6vTuNd
	j7PXy/ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMDrb-00000009FLf-49wv;
	Mon, 02 Jun 2025 22:42:39 +0000
Received: from out-173.mta0.migadu.com ([2001:41d0:1004:224b::ad])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMDpN-00000009Ez2-2iTq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Jun 2025 22:40:23 +0000
Date: Mon, 2 Jun 2025 15:40:11 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1748904017;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pVDqG7Qru3dfMpTwDZ3dCGAw70KwMy1IAEgL6+IAtD0=;
	b=DRGlTg2l6dj3mx3YU+Hkrx8unn1zTLt40R3DTpki2p/KXrAfQdCsBTXlNY3/1LiA5NL/C3
	AKu5HQu4fMzKoqvysZOOGOi+dS5HDBNebnMVbg8Q3KTQ3HS+lmWRWnqZ0S7Jx7EQrbL9cC
	j1ccMBNvsr0LPvKUOue0qfpmAfPYP1w=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Colton Lewis <coltonlewis@google.com>
Cc: kvm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>, Shuah Khan <shuah@kernel.org>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 16/17] KVM: arm64: Add ioctl to partition the PMU when
 supported
Message-ID: <aD4oS1_tnMPlgDJ6@linux.dev>
References: <20250602192702.2125115-1-coltonlewis@google.com>
 <20250602192702.2125115-17-coltonlewis@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250602192702.2125115-17-coltonlewis@google.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_154021_906725_CB0ADFCC 
X-CRM114-Status: GOOD (  13.73  )
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

On Mon, Jun 02, 2025 at 07:27:01PM +0000, Colton Lewis wrote:
> +	case KVM_ARM_PARTITION_PMU: {

This should be a vCPU attribute similar to the other PMUv3 controls we
already have. Ideally a single attribute where userspace tells us it
wants paritioning and specifies the PMU ID to use. None of this can be
changed after INIT'ing the PMU.

> +		struct arm_pmu *pmu;
> +		u8 host_counters;
> +
> +		if (unlikely(!kvm_vcpu_initialized(vcpu)))
> +			return -ENOEXEC;
> +
> +		if (!kvm_pmu_partition_supported())
> +			return -EPERM;
> +
> +		if (copy_from_user(&host_counters, argp, sizeof(host_counters)))
> +			return -EFAULT;
> +
> +		pmu = vcpu->kvm->arch.arm_pmu;
> +		return kvm_pmu_partition(pmu, host_counters);

Yeah, we really can't be changing the counters available to the ARM PMU
driver at this point. What happens to host events already scheduled on
the CPU?

Either the partition of host / KVM-owned counters needs to be computed
up front (prior to scheduling events) or KVM needs a way to direct perf
to reschedule events on the PMU based on the new operating constraints.

Thanks,
Oliver

