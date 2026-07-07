Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11DF9C43602
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 16:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nn6bCErssLM58dCHEzsQ/5uzBTiqECPFsNpc2dMlLdg=; b=K6oRFKAyGzvM8idqzAtMHMDc4R
	XO9vMu0MTEe7mEB+yuIli9q/PCKRthZMItBlRPWATpL+BsCzsjcERPhr+k28uqHZMj6Cyc6uW6O2E
	nAnRv7FzeenhohcjkWHiFQcm5qJO/yS1yOx/cgGpvW1EpHSNxuQtRbMljtiVwt0/sYPFQEG9atfTx
	huG4qWVr/+j2Z1lkUBof2w/vlNB0wfuG6wY57HBBRFmiV2LYw/4WVRU8xoH7Hj91eR+Je7V4EiMVL
	voZkHN+xvlYZ+uhmgTblhSYKqDb5X8vypYVPp3GLNPWD5zE1iBZOJ6lqqCeBfm2sigjuwRSApOeil
	42U1KcVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh98O-0000000FVaa-0WfG;
	Tue, 07 Jul 2026 16:59:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh98K-0000000FVZt-0x8k
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 16:58:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 38C881595;
	Tue,  7 Jul 2026 09:58:49 -0700 (PDT)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B1B283F7B4;
	Tue,  7 Jul 2026 09:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783443533; bh=TOgYj5FZmDTqeFNBMSEMqRwvGMSyqgNulD31bewyFas=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qDnPSKMXMBWbehXuepC1F6L3ke/tSK7hxcPEZ0meUJ+6xmGFl3GZVE6mMMq+luYdD
	 8zIH24dQZY+2siwB/tY4ZevQ0toknhOllwVTHcPsQp79/0JuqTZ8r78j+Ajrgg49RA
	 UOKD6n4ng/Z9QFdYT6xQ274xgz5ql+ciUFeKFbKM=
Date: Tue, 7 Jul 2026 17:58:49 +0100
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: Sean Christopherson <seanjc@google.com>
Cc: pbonzini@redhat.com, kvm@vger.kernel.org, david.hildenbrand@arm.com,
	maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com,
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	fuad.tabba@linux.dev, mark.rutland@arm.com
Subject: Re: [RFC PATCH 0/3] KVM: Dirty page logging for guest_memfd-only
 memslots
Message-ID: <ak0wSQ1133O7B96D@raptor>
References: <20260702142912.6395-1-alexandru.elisei@arm.com>
 <akxOrMnlNga-vtQv@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akxOrMnlNga-vtQv@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_095856_398810_A111D0F4 
X-CRM114-Status: GOOD (  16.76  )
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

Hi Sean,

On Mon, Jul 06, 2026 at 05:56:12PM -0700, Sean Christopherson wrote:
> On Thu, Jul 02, 2026, Alexandru Elisei wrote:
> > The memory represented by guest_memfd-only memslots
> > (kvm_memslot_is_gmem_only() is true) is shared with userspace, which can
> > freely mmap it and access it. The only thing that is preventing dirty page
> > logging for such memslots is that KVM doesn't allow slots backed by
> > guest_memfd to have their flags changed; they can only be created and
> > deleted.
> 
> Please (publicly) document *why*  you want to add dirty-logging support.  It's
> all but impossible to review new uAPI without knowing the use case.

Of course, my mistake, I was so deep in this that I didn't realise that
there might be different perspectives.

My thinking was that since guest_memfd created with GUEST_MEMFD_FLAG_MMAP +
GUEST_MEMFD_FLAG_INIT_SHARED is extremely similar from a userspace point of
view to using an anonymous file (created with memfd_create()), that
supporting dirty page logging and migration would be a natural next step
and would expand the usefulness of guest_memfd. It has nothing to do with
confidential compute.

As to why I'm working on it now, it's because of an arm64 feature that
requires that memory remains mapped at stage 2, called Statistical
Profiling Extension (SPE), similar to Intel's PEBS or AMD's IBS. Exposing
the feature to a guest requires that memory remains mapped at stage 2
outside of userspace explicitely unmapping it, and guest_memfd, with the
patch to ignore the MMU notifiers [1], has this property.  I wanted to
expand the functionality of guest_memfd to support migration of virtual
machines when that arm64 feature is exposed to guests.

[1] https://lore.kernel.org/kvmarm/20260625130902.258331-1-alexandru.elisei@arm.com/

Thanks,
Alex

