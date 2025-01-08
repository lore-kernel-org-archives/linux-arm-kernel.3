Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CD76E77199
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 20:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3dUcoQ+aJnvEfN1li7ugchm2pXhqwyBsL7eSPz6fVuQ=; b=NJxcK2vWX6gO88+BW02aLvABPx
	7oL0F4HNkc7nAabfYic8eySJ+TGgQ8t6tMTgpRhHLawQh2QJTbOM2SUFI43qqCzdKqnJ5G5zOq+fK
	2fATPWFfWQXVrCNecitp9WsV57wO+sD9SLAWCQdL6TAtlQWbFaczY4R2cEVec9kQGpxd41tuaOPiq
	UID812iW2KVJRI6KeSAQZdxJ12luwiksKVNG6QvxQqfOMdq9Y7iXK7L+ghH1wxQ8C9brP76VDe5/r
	qpZO3SNnO13QMXqDrit9H8x3KmHqL0iv2/I+rO2wCS1HSI3IlQsmPrPehnxQGg4SqAOiMgVrHpFCE
	IHJxktZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVcU1-00000009jxA-23nA;
	Wed, 08 Jan 2025 20:16:53 +0000
Received: from out-188.mta0.migadu.com ([91.218.175.188])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVcRf-00000009jOD-2ljX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 20:14:29 +0000
Date: Wed, 8 Jan 2025 12:14:07 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1736367260;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3dUcoQ+aJnvEfN1li7ugchm2pXhqwyBsL7eSPz6fVuQ=;
	b=h5VZv3N739dsIe4sOr6/azdQLG5BRbbL8SnCVksw3MIVjGefRV0Jb3Pfn2Z1MF/5cT26tU
	Yl+Cc4kSm/JJCVH8649DQj5nvX556dqpLYwPqN28NG7J2IQQiD0T2CVo41j/huapyaxURx
	sAMxBL8Y42QHcAgAU4Ukfjfi6tQZEQk=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Will Deacon <will@kernel.org>
Cc: kvmarm@lists.linux.dev, Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mingwei Zhang <mizhang@google.com>,
	Colton Lewis <coltonlewis@google.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/18] KVM: arm64: Support FEAT_PMUv3 on Apple hardware
Message-ID: <Z37cjxFu2CPi_xNr@linux.dev>
References: <20241217212048.3709204-1-oliver.upton@linux.dev>
 <20250108123840.GA9197@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250108123840.GA9197@willie-the-truck>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_121427_993971_079EC411 
X-CRM114-Status: GOOD (  10.90  )
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

Hey Will,

On Wed, Jan 08, 2025 at 12:38:41PM +0000, Will Deacon wrote:
> What's your plan for this series? I started looking at it and I can take
> the first four apple_m1 patches if you like?

I plan on posting a respin of it by next week, which should look pretty
much the same besides cleaning up the build error I introduced :)

Besides that, I think we need to decide on the KVM side of things
whether or not we want to support an event counter in addition to the
PMU cycle counter. Janne's FEX use case would certainly benefit from it.

Do you think you could grab patch #3? It is entirely unrelated to the
series at this point with the PMUv3 event remapping helper.

-- 
Thanks,
Oliver

