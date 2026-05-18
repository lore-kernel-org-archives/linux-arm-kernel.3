Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 995DFCD4F48
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 07:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ox+SM7WPRgRKtMcZS+L+mOtqodnfGXZXLv9g70yWCdc=; b=P9jxEi7Ek5MyP3/4iuh+sx9kX6
	mNhoLyhsVMdY6omIxBxzOZaTzAH95bNxA1usC1DT9DQajLPWBawUmV4OtbpAl4ySSCjruFWlee7em
	AZ9YO9qmQMJqxwlya4TLwmEOytTjtzMnbHaRGs4hN1xFL7z9A0Zi0sEu1UTcZJl2L0POJ10+cpfWm
	F82bUmrcqpEYQQeZjRlehiXTLXKBbGrZEoq0LQWBdlUcHazsc/miYBUv/tm5LsjxqlJ8Y54t2S2q0
	sJZkogjJWlYJtkokpdMIkZgL6fsAEYjl3vNz9T0eGBhNcSXq7V1pVR0v3JK2SVNAY80n153ZCwTQU
	yKONi6wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOsJO-0000000EZQT-0iAa;
	Mon, 18 May 2026 07:22:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOsJN-0000000EZQ3-2uLW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 07:22:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E113560055;
	Mon, 18 May 2026 07:22:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A97CC2BCB7;
	Mon, 18 May 2026 07:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779088968;
	bh=Z1TZfPHrDTb3oUBwxbXx/41cJWGTkTmFko8g9704EBE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K1KHRrlrcm2vGcAvcFUJ/5hZ0ZeT4kWLeTXE0SbhmH+mDiq5l3SN03XaEMlJmdRV/
	 y2jX8w8kMeFzZs+D+4eMLi1A8hgra49FQT4qOoJ7sI1g9szvBmVC/p03fUgbDhhXEv
	 X3HLRkwLPCSo3MafhnHbv3xCZc323igQCktjCNVFvfIhhxTUvZncrwUc43mv896FpU
	 nGT+LDT5FucTLTx/8dLXE843qrQlHvjQD3g4cGVDlgUefeBkGSN7TerqMHYfF795uS
	 2N9cWZeG7n6IkNFuAHqKXA0WGbHy+H4vu/tdg+YnQs0DHHyY9eusXtNiXCLccp1jDO
	 l74jenB7UEcXQ==
Date: Mon, 18 May 2026 00:22:47 -0700
From: Oliver Upton <oupton@kernel.org>
To: Leonardo Bras <leo.bras@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Fuad Tabba <tabba@google.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 1/2] KVM: arm64: Introduce S2 walker SKIP return
 options
Message-ID: <agq-RyKhBy4CIThm@kernel.org>
References: <20260515195904.2466381-1-leo.bras@arm.com>
 <20260515195904.2466381-2-leo.bras@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260515195904.2466381-2-leo.bras@arm.com>
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

Hi Leo,

Thanks for having a look at this.

On Fri, May 15, 2026 at 08:59:02PM +0100, Leonardo Bras wrote:
> Introduce S2 walker return values:
> - SKIP_CHILDREN: skip walking the children of the current node
> - SKIP_SIBLINGS: skip waling the siblings of the current node
> 
> Also, modify __kvm_pgtable_visit() to fulfil the hing on above return
> values. Current walkers should not be impacted

I'd rather see something based around new walk flags than introducing an
entirely new mechanic around return values.

e.g. you could split the LEAF flag into separate flags for blocks v.
pages:

	KVM_PGTABLE_WALK_PAGE,
	KVM_PGTABLE_WALK_BLOCK,
	KVM_PGTABLE_WALK_LEAF	= KVM_PGTABLE_WALK_PAGE |
				  KVM_PGTABLE_WALK_BLOCK,

and then let __kvm_pgtable_visit() decide how to steer the walk. You may
need some special handling to get the address arithmetic right when
skipping over a table of page descriptors.

Thanks,
Oliver

