Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6D5AD59F49
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 15:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WnU6pHwwddDjt6FdWtTJnBbHXeTqCkDZhF5Dg9Grfcc=; b=Ee7BMgmtqfJR8mOE1RosqJ/dWC
	IDSlcEmhmXnmj3cJH0CiQj/u/NS+aiPUiqN0GEtEsrqWz/uoFbaRMd7KKmbatO5Z9iT4zZBRPTPkP
	rvELi+fY5dRdGuxaTIkGOkHbrle2Q/PE4skKPCMFCmjuWW8/eL+2uLTH1pHpbn03TKGMJ3wnz7yHF
	054rM6zgvATajxn8j3aCSPOTmNJQmXFU/ulAnfbcOkLx3NRl5nVu6OAv4gUHwqL1Fv0Ws1xPChxql
	MP0Qgw9b2Zr5sY00ma1Us1tFtDtKUo+RwaC+THfEMrrXiUpvYikkN2PWp5S4FW15eDISJxSGMsjS/
	Wu5cPFHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8iNL-00000003uRR-2Dny;
	Wed, 06 Nov 2024 15:55:19 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8iLb-00000003uAY-2Y9G
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 15:53:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DC313A43F6B;
	Wed,  6 Nov 2024 15:51:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE83CC4CEC6;
	Wed,  6 Nov 2024 15:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730908410;
	bh=6/DLV0Ij3ucV/bFgMjAQCQcBgcmt5Ui1j16wxrUI0HQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DtQ/J9Ii8Xw09w+p1m7kGR6qBbFkl/7zHiQ6fuct/0LC8qmEnnHajDhM7norJNjw1
	 j33wtCQMl608Y6B2l9F9i547VX147JEBqW5A+KCy+/eEhObUoX7TA0aICb0VpmD31l
	 mxX2ESPGjiZN9nRyIOxxrfGfLE5nzJLts/BASu4M+feFsgecfTuwogBkKTMOX3sr2M
	 9DR4ulxzKGHC7U3Uz+sjfziJkNHVMLK63qR/5We98LtDUZfhG49P3j97ZWfecT3dLs
	 JzVWUchvSaL4XNUT3UY3MkdUz+HdXR3/G+StxGIrC6PwetPjJwCRtl8uOOI63Suo+Q
	 1kQZvwIsi61Jw==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Mark Brown <broonie@kernel.org>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 0/2] arm64/fp: Fix missing invalidation when working with in memory FP state
Date: Wed,  6 Nov 2024 15:53:22 +0000
Message-Id: <173090098098.2905624.10744681189844988391.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20241030-arm64-fpsimd-foreign-flush-v1-0-bd7bd66905a2@kernel.org>
References: <20241030-arm64-fpsimd-foreign-flush-v1-0-bd7bd66905a2@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_075331_735384_3FE9BD6A 
X-CRM114-Status: GOOD (  11.94  )
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

On Wed, 30 Oct 2024 20:23:49 +0000, Mark Brown wrote:
> Mark Rutland identified a repeated pattern where we update the in memory
> floating point state for tasks but do not invalidate the tracking of the
> last CPU that the task's state was loaded on, meaning that we can
> incorrectly fail to load the state from memory due to the checking in
> fpsimd_thread_switch().  When we change the in-memory state we need to
> also invalidate the last CPU information so that the state is corretly
> identified as needing to be reloaded from memory.
> 
> [...]

Applied SVE patch (with updated commit message) to arm64 (for-next/fixes),
thanks!

[1/2] arm64/sve: Flush foreign register state in sve_init_regs()
      https://git.kernel.org/arm64/c/751ecf6afd65

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

