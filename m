Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36AFEC83030
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 00:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ID9d9BcvZSRiBAL43tNvk/za2oURSldztZwoYSZZSRw=; b=LnPVvl8Tso6AUBtjX8qT+xnhSd
	zjmZ3yuB9jZMMVIs/nBHdldPGhUCPGGGHoXuyIJfMrKiqcecTRw3ja3eynVYFf97jJHtaterFvKXA
	r7sXd77RiIgzPjXFM2V55Z8DuFea3XRjaMh0pGJq3CcoKly3f6JZmBlMD+TxVaSy+KXBzJXlR7EXT
	ydJIQWiOx9vQwT2sNno5uJAdEwQ95/8h9An0Siu1RhjgiuxTYrcrU7sUoHs2t6mJpXjv60KkXB4F1
	egBTnmsdgIlVpkzy6VQjXToDeSozAWLdHLCGT75pGKYC7KK7iqvj1PWvmR8Ocf4yf6F8VMNGC+xyD
	DbAtEytg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYvnn-00000003pR2-1by1;
	Tue, 08 Jul 2025 00:03:15 +0000
Received: from out-177.mta1.migadu.com ([2001:41d0:203:375::b1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYviZ-00000003oiW-1xZT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 23:57:53 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751932668;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ID9d9BcvZSRiBAL43tNvk/za2oURSldztZwoYSZZSRw=;
	b=iCB7Z7v+qgC1UWXo11wDeTQYTDq197Mo2PfW2D13YQg3yqRj6c3A6ST4556ikTQqdozS3O
	j4raBn9VW285hppCFSam1N59OXM37/ATWcv3SJciEGO9YoW9HTTNmSOSp8xIhlV5mFouXV
	6VErk7tOb4bvc4aPcMwXIMUx/2NXg+k=
From: Oliver Upton <oliver.upton@linux.dev>
To: maz@kernel.org,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	ryan.roberts@arm.com,
	shahuang@redhat.com,
	lpieralisi@kernel.org,
	david@redhat.com,
	ddutile@redhat.com,
	seanjc@google.com,
	Jason Gunthorpe <jgg@ziepe.ca>,
	ankita@nvidia.com
Cc: Oliver Upton <oliver.upton@linux.dev>,
	aniketa@nvidia.com,
	cjia@nvidia.com,
	kwankhede@nvidia.com,
	kjaju@nvidia.com,
	targupta@nvidia.com,
	vsethi@nvidia.com,
	acurrid@nvidia.com,
	apopple@nvidia.com,
	jhubbard@nvidia.com,
	danw@nvidia.com,
	zhiw@nvidia.com,
	mochs@nvidia.com,
	udhoke@nvidia.com,
	dnigam@nvidia.com,
	alex.williamson@redhat.com,
	sebastianene@google.com,
	coltonlewis@google.com,
	kevin.tian@intel.com,
	yi.l.liu@intel.com,
	ardb@kernel.org,
	akpm@linux-foundation.org,
	gshan@redhat.com,
	linux-mm@kvack.org,
	tabba@google.com,
	qperret@google.com,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	maobibo@loongson.cn
Subject: Re: [PATCH v10 0/6] KVM: arm64: Map GPU device memory as cacheable
Date: Mon,  7 Jul 2025 16:57:30 -0700
Message-Id: <175193253138.1687959.6241606194423745301.b4-ty@linux.dev>
In-Reply-To: <20250705071717.5062-1-ankita@nvidia.com>
References: <20250705071717.5062-1-ankita@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_165752_157368_6011A9DC 
X-CRM114-Status: UNSURE (   8.83  )
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

On Sat, 05 Jul 2025 07:17:11 +0000, ankita@nvidia.com wrote:
> From: Ankit Agrawal <ankita@nvidia.com>
> 
> Grace based platforms such as Grace Hopper/Blackwell Superchips have
> CPU accessible cache coherent GPU memory. The GPU device memory is
> essentially a DDR memory and retains properties such as cacheability,
> unaligned accesses, atomics and handling of executable faults. This
> requires the device memory to be mapped as NORMAL in stage-2.
> 
> [...]

I've gone through one additional round of bikeshedding on the series,
primarily fixing some typos and refining changelogs/comments. Note that
I squashed the kvm_arch_supports_cacheable_pfnmap() into the patch that
adds its caller and unwired it from arch-neutral code entirely.

Please do shout if there's an issue with any of this and thanks for
keeping up with the several rounds of review.

Applied to next, thanks!

[1/6] KVM: arm64: Rename the device variable to s2_force_noncacheable
      https://git.kernel.org/kvmarm/kvmarm/c/8cc9dc1ae4fb
[2/6] KVM: arm64: Update the check to detect device memory
      https://git.kernel.org/kvmarm/kvmarm/c/216887f79d98
[3/6] KVM: arm64: Block cacheable PFNMAP mapping
      https://git.kernel.org/kvmarm/kvmarm/c/2a8dfab26677
[5/6] KVM: arm64: Allow cacheable stage 2 mapping using VMA flags
      https://git.kernel.org/kvmarm/kvmarm/c/0c67288e0c8b
[6/6] KVM: arm64: Expose new KVM cap for cacheable PFNMAP
      https://git.kernel.org/kvmarm/kvmarm/c/f55ce5a6cd33

--
Best,
Oliver

