Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFEB5C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 18:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JcN4/9CSJN5rkyu5eOfeNCH8pnymRY8wa04sQtTz80M=; b=QdjN+fk0QS7ht5oyDZWyMbSu3Q
	+pjH1pJk+E2htdNEjDhs44Wh2ZAsKi2UXDjej+v+DeCsvOtMyH3X0wIYT112//Z/pnAyiavnKW9oT
	FeaQfp8t2pbnrw1lDD932OJxkrXHD0hPYzbi05gyEdQSQGwU1pu8vNj4VgVYVWMG3DuxlUPtteWZI
	f8XionjhGQ4gBShqsQ2Zcb43ZvTjPxnBi2yl/SGs8cqpBsD+oN235CQkJ1/za9vAySvoZyhJRt/Ln
	vVgsCVWL49ry4WM3ZbAUKzsC3ot3aFD6Tt1Z2i3+6Ge2i7VEFEDVhWYd4aoShVjgVrUFXbukGMIxX
	50/vhwiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt9wM-0000000F2uW-08u2;
	Fri, 14 Mar 2025 18:39:26 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt9uU-0000000F2kI-1txM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 18:37:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1F2525C4C5C;
	Fri, 14 Mar 2025 18:35:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD216C4CEE3;
	Fri, 14 Mar 2025 18:37:27 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>
Cc: Will Deacon <will@kernel.org>,
	joey.gouly@arm.com,
	kvmarm@lists.linux.dev,
	maz@kernel.org,
	oliver.upton@linux.dev,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com
Subject: Re: [PATCH 0/4] arm64: mitigate CVE-2024-7881 in the absence of firmware mitigation
Date: Fri, 14 Mar 2025 18:37:25 +0000
Message-Id: <174197730164.734861.6726211221092480832.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250128155428.210645-1-mark.rutland@arm.com>
References: <20250128155428.210645-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_113730_533063_421519B9 
X-CRM114-Status: GOOD (  10.59  )
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

On Tue, 28 Jan 2025 15:54:24 +0000, Mark Rutland wrote:
> On some CPUs from Arm Ltd, it is possible for unprivileged code to cause
> a hardware prefetcher to form an address using the contents of a memory
> location which is accessible by privileged accesses in the active
> translation regime, potentially leaking the contents of this memory
> location via a side channel. This has been assigned CVE-2024-7881:
> 
>   https://developer.arm.com/Arm%20Security%20Center/Arm%20CPU%20Vulnerability%20CVE-2024-7881
> 
> [...]

Applied to arm64 (for-next/leaky-prefetcher), thanks!

There hasn't been much review (thanks Oliver for looking at the KVM
bits) and there's some implied work that can go on top of this series.
But the patches looked fine to me, so I queued them. Mark or others,
please shout if you'd like them dropped, they are on a branch.

[1/4] arm64: cpufeature: rename unmap_kernel_at_el0() -> needs_kpti()
      https://git.kernel.org/arm64/c/174ade921138
[2/4] arm64: cpufeature: factor out cpu_is_meltdown_safe()
      https://git.kernel.org/arm64/c/f4fe70cd8522
[3/4] arm64: cpufeature: mitigate CVE-2024-7881
      https://git.kernel.org/arm64/c/837dfd070e94
[4/4] KVM: arm64: expose SMCCC_ARCH_WORKAROUND_4 to guests
      https://git.kernel.org/arm64/c/d2c173acbf93

-- 
Catalin


