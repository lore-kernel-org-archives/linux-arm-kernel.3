Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6A2ED6EBF2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Nov 2024 09:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qnWNHQurR2BT+nxYWy2IvZp30NcGQvjeJX7m1KjHGMo=; b=FLqp3bvDW10wEoDmES25Vy+GnA
	YdEH7uA3a/X9kJUy/eykhWYfqBz1y7tXb3Rboo++mJh6GrZ6RidwDrH6kohGjqx0hBRgS6cCzdM8f
	jQEPT6EI3wiH7DPYSPAP4qIKnrKsKYoW7KUg5NudDJT4lt0xxfq+/u7Nd9guC7wDyzIZq8phJQhyA
	3xmCL+4ZC7VPxxsdBBRTA0OoBVRhv24XfIGMjnbaaJJsquHeqSnlNjKdHLjYJIL/4jATtT7+1x+xN
	ZA0X+o46nwbqNK9AKhTtCPrn6KCpFva+ZCZ9Dq7NgJerjF+swa9P7oD17taoIEqgN5P87pvYEs1eS
	o9ivbvfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGxmS-0000000HNq0-2a6j;
	Fri, 29 Nov 2024 09:59:20 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGxlT-0000000HNit-3qOk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Nov 2024 09:58:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5D155A43DE4;
	Fri, 29 Nov 2024 09:56:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB079C4CECF;
	Fri, 29 Nov 2024 09:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732874298;
	bh=b3I9qr/L+dZimBd48x5jitIlhaZduHneXsbuO2bUb18=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iFb6pMjJb/KBhpXJDU4lD2/QSmEZSL9NfXB4ZXJsE2d4Ar20NhTU6SIq1pm/2toNK
	 SFCVBGfwais5M7ThYzZmGS8nyNZRCRobUPYgY9CXmju+3tj26he6AjSrZPKAWTon7i
	 0aYPYGVHQ9+y5O/DHVOSWPy+cVgAx7vysrOyCCQY8lHuFCwQkrCoS3mqUrzq9MaJ7k
	 NWKAU3n4X94fqxBYIQcx/k4xUikiqr7r7fqwgFzmqTBtqHW84/z8dGWJBnUqoyCgay
	 i2D5Syv4+8LaeCmnhJ29ZJNN10krGaV8ddfNm3jriQ0T7Tpaipn+5npT4YHc1H5e1X
	 IMW1VI2DLo0Ag==
Date: Fri, 29 Nov 2024 09:58:13 +0000
From: Will Deacon <will@kernel.org>
To: Quentin Perret <qperret@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: Always check the state from hyp_ack_unshare()
Message-ID: <20241129095812.GA4298@willie-the-truck>
References: <20241128154406.602875-1-qperret@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241128154406.602875-1-qperret@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241129_015820_023259_BCAE0CBB 
X-CRM114-Status: GOOD (  23.90  )
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

On Thu, Nov 28, 2024 at 03:44:06PM +0000, Quentin Perret wrote:
> There are multiple pKVM memory transitions where the state of a page is
> not cross-checked from the completer's PoV for performance reasons.
> For example, if a page is PKVM_PAGE_OWNED from the initiator's PoV,
> we should be guaranteed by construction that it is PKVM_NOPAGE for
> everybody else, hence allowing us to save a page-table lookup.
> 
> When it was introduced, hyp_ack_unshare() followed that logic and bailed
> out without checking the PKVM_PAGE_SHARED_BORROWED state in the
> hypervisor's stage-1. This was correct as we could safely assume that
> all host-initiated shares were directed at the hypervisor at the time.
> But with the introduction of other types of shares (e.g. for FF-A or
> non-protected guests), it is now very much required to cross check this
> state to prevent the host from running __pkvm_host_unshare_hyp() on a
> page shared with TZ or a non-protected guest.
> 
> Thankfully, if an attacker were to try this, the hyp_unmap() call from
> hyp_complete_unshare() would fail, hence causing to WARN() from
> __do_unshare() with the host lock held, which is fatal. But this is
> fragile at best, and can hardly be considered a security measure.
> 
> Let's just do the right thing and always check the state from
> hyp_ack_unshare().
> 
> Signed-off-by: Quentin Perret <qperret@google.com>
> ---
>  arch/arm64/kvm/hyp/nvhe/mem_protect.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> index caba3e4bd09e..e75374d682f4 100644
> --- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> +++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> @@ -783,9 +783,6 @@ static int hyp_ack_unshare(u64 addr, const struct pkvm_mem_transition *tx)
>  	if (tx->initiator.id == PKVM_ID_HOST && hyp_page_count((void *)addr))
>  		return -EBUSY;
>  
> -	if (__hyp_ack_skip_pgtable_check(tx))
> -		return 0;
> -

Acked-by: Will Deacon <will@kernel.org>

I suppose __hyp_ack_skip_pgtable_check() is now quite poorly named,
since we only want to use it in cases where the page is PKVM_PAGE_OWNED
by the initiator. Hopefully nobody smart tries to add it back here!

Will

