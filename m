Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30FF5C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 20:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gwDkA/k4uQ8rJWv4rXBFYD6yrpVbwo5iXFFYCV9jD3M=; b=atIbCJwii/6LC+MBNQ1nEKGQPH
	NtPawBAq/icP0hRqVWTi+bKfgZ+4rDs7BDv+CrG5LCTJLyT6eV3vSPpEyLuE4o5e9E883vDWRVvYw
	9J6qz2RU+NrvhNux7ieYIXoU9ePyB+IR2FlBBNpWu/e9szEIW/5oPNfs/KZ/A/HphDBLACJ+i/xZ8
	8PbfRBsS936ck0DlwS/twybTtW5vXNAWDtlAwMEWwimou8FHkptlZLlY4Px/wQ2v1vt2HgttPRO1q
	TVhAXM386J5EJbiJeVM/7kwLAeeR9Z5iWrBVyB+wTWbe6JwbKELqCQNk+8LcVqHmL6vi7ObpxLHbA
	LK8PSUOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaKc0-0000000FoB6-1trC;
	Fri, 11 Jul 2025 20:44:52 +0000
Received: from out-184.mta0.migadu.com ([91.218.175.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaJdi-0000000FfY9-1hom
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 19:42:35 +0000
Date: Fri, 11 Jul 2025 12:42:26 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1752262952;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gwDkA/k4uQ8rJWv4rXBFYD6yrpVbwo5iXFFYCV9jD3M=;
	b=Py4slIFZS4yfmDNfDVrRc6kKPfCrBTpWJhlMdMs8CsgIjAu65Ka3BQErVwzOSzZTSdQ2uW
	O9PfpB0wHuY6xLA0J1gx9Nv5ddly0Z2/QFWP5xCBetO7kDdUIg/hyMpW0WYQPjAD76b7C6
	btUC6rqqZgOgSNxCLk+VCW9zxtrsuJM=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Jiaqi Yan <jiaqiyan@google.com>
Cc: maz@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org,
	pbonzini@redhat.com, corbet@lwn.net, shuah@kernel.org,
	kvm@vger.kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	duenwen@google.com, rananta@google.com, jthoughton@google.com
Subject: Re: [PATCH v2 3/6] KVM: arm64: Allow userspace to inject external
 instruction aborts
Message-ID: <aHFpIpIfqVCQZVgG@linux.dev>
References: <20250604050902.3944054-1-jiaqiyan@google.com>
 <20250604050902.3944054-4-jiaqiyan@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250604050902.3944054-4-jiaqiyan@google.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_124234_585616_340F13DC 
X-CRM114-Status: GOOD (  12.09  )
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

On Wed, Jun 04, 2025 at 05:08:58AM +0000, Jiaqi Yan wrote:
> From: Raghavendra Rao Ananta <rananta@google.com>
> 
> When KVM returns to userspace for KVM_EXIT_ARM_SEA, the userspace is
> encouraged to inject the abort into the guest via KVM_SET_VCPU_EVENTS.
> 
> KVM_SET_VCPU_EVENTS currently only allows injecting external data aborts.
> However, the synchronous external abort that caused KVM_EXIT_ARM_SEA
> is possible to be an instruction abort. Userspace is already able to
> tell if an abort is due to data or instruction via kvm_run.arm_sea.esr,
> by checking its Exception Class value.
> 
> Extend the KVM_SET_VCPU_EVENTS ioctl to allow injecting instruction
> abort into the guest.
> 
> Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
> Signed-off-by: Jiaqi Yan <jiaqiyan@google.com>

Hmm. Since we expose an ESR value to userspace I get the feeling that we
should allow the user to supply an ISS for the external abort, similar
to what we already do for SErrors.

Thanks,
Oliver

