Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 820A4C021A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 18:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zDUFYgrQHlOsuHovpn0q3hLRymzSiYzbhHx/U+nBNRU=; b=SXNLJc4W9lCSt8GFPM64FkT8yU
	LM5nLze8wy6zxekl1aOLf7JcP4UvLP+KzOnnBSV5OA8bwQy6fvrXp4KnJsj91MyAm3+KlTikzGTdc
	QxErInAsyRbz9yjHDE7qSXQsW0Xk+VwINythQtwc1IRqaMcokJdMcb7UQ+1I8kmV2lWc8e0mc249o
	9CL0CtlpbX9CaGFyVidmdgPE1Aqp4FvtUiwHAsWs5nWVF7QqXCq7z5Ztq+pvcPlc9DWqXE9E/s7/H
	g+HmUJoYcVMrb5EOKimp9oim6dAz/z/6feo6arkMBYUOQiwbfryLm5mmHlddqiH0bS0W9ERINMzb+
	d63AWECg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk6HE-00000005frp-22Jx;
	Mon, 17 Feb 2025 18:55:32 +0000
Received: from out-179.mta1.migadu.com ([95.215.58.179])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk6Fl-00000005fdz-0wzU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 18:54:02 +0000
Date: Mon, 17 Feb 2025 10:53:50 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1739818439;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zDUFYgrQHlOsuHovpn0q3hLRymzSiYzbhHx/U+nBNRU=;
	b=pUXy+3/023qBomJERxYkElWuMKOVJ+hx7Uql6gAweLqFA2l+elvxPCy1FMiMLHDfHTdFQZ
	5RxN0P8SzXalwCN9i/ZUpFAtxWHbp4ZkvsYCZ1ZOQEli490Aw4zztX2YSMazUUPDJxf/8L
	0TMcBx39t1hY2vqAV534p1K+ENzVuUw=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH 1/2] KVM: arm64: Fix MDCR_EL2.HPMN reset value
Message-ID: <Z7OFvp7LMcOvWziA@linux.dev>
References: <20250217112412.3963324-1-maz@kernel.org>
 <20250217112412.3963324-2-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217112412.3963324-2-maz@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_105401_475028_6A491FFE 
X-CRM114-Status: GOOD (  15.85  )
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

Hey,

On Mon, Feb 17, 2025 at 11:24:11AM +0000, Marc Zyngier wrote:
> The MDCR_EL2 documentation indicates that the HPMN field has
> the following behaviour:
> 
> "On a Warm reset, this field resets to the expression NUM_PMU_COUNTERS."
> 
> However, it appears we reset it to zero, which is not very useful.
> 
> Add a reset helper for MDCR_EL2, and handle the case where userspace
> changes the target PMU, which may force us to change HPMN again.
> 
> Reported-by: Joey Gouly <joey.gouly@arm.com>
> Signed-off-by: Marc Zyngier <maz@kernel.org>

The existing ABI expectations are that writes to PMCR_EL0.N constrain
the number of counters, so that should have a similar effect on
MDCR_EL2.HPMN.

At the same time, I get the feeling that we should throw out this whole
behavior of writing N to change the shape of the PMU, because it
complete breaks down for NV. PMCR_EL0.N is another one of those fields
that change behavior based on EL and isn't a global source of truth on
the shape of the PMU.

What do you think about adding a new vCPU attribute for selecting the
number of counters for a VM? We can allow non-nested VMs to use the
'old' method of writing PMCR_EL0.N and force nested VMs to use the
attribute.

We can then enforce ordering on the attribute and prevent it from being
used after vCPU reset.

Thanks,
Oliver

