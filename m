Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D587CD5BAB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 15:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rOD0s3+Nm7YrRVW4EuyNWoyOgd63/WffAsBvv24U6I0=; b=GONPLs6QTRtldGfsrkpk8eigam
	GihdHPmm94Hk271rs4nzdSD7J42A42+KisKk4HxdX3g37rpNeJeVCtmEbzxOJqPPmDmp2CozsoKLt
	aWpGMOBzeXWB2dfykvUwVHET241KB1BOWcV8JIeeNCpdo/912AQJyBubgq2a846WFGSBifkBal3+F
	/+XqReIu3h7L20/i4j793Z6HEhiwC5ntENyit8FdAnn5nwk8flj4J8o3FYJ/eKjfUCk2j8+ztSxBn
	HFiDSNd6/yM1ZUellaju4VbHDahwiVbMvhM+cV5jMyvxZihxBrMW493x5FoeakgZJgvzj5GVybkgD
	fwTtpbig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPMIb-000000020oh-1Vsc;
	Tue, 19 May 2026 15:24:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPMIY-000000020lX-2QnZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 15:23:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 108AE60221;
	Tue, 19 May 2026 15:23:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39324C2BCB3;
	Tue, 19 May 2026 15:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779204237;
	bh=I+IjMYlDv1l4GPKm44lgcCi3BwfRmTlX+eKtPHhhqsw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KYZnYUNq9Tu1sJ42jVFYrVmNjc4OMw6j4rHkWc8RCHgSKRCcftXwoeNUIWSz9+OS0
	 r0c02nrsnqNc6/JQjsTHsaeU37UrpfA8nClHDw5XOtuH5Kvf56lKMLFliBfQlkLWRY
	 rOnOly7/E/NAF2d3srHRek71+aoEYVHDdMQWp6krJsvzXg66vIfvRxx5RA6asbk2CJ
	 cGHQ0O/3wJY3ev9zpJ5G2P4UdLdtdWLML8qCUsnXmR/PIxXpQ740UUg7yaVjVlgxjm
	 OEkCYc8tl/MiNQl1JgFj77G3Ko+KFlK1zIH03Olc8YqjhtuFhozw9FJ7ZutA73ebha
	 sEYUKk1vNmAWQ==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	Kevin Brodsky <kevin.brodsky@arm.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/5] POE sigreturn fix and extra tests
Date: Tue, 19 May 2026 16:23:00 +0100
Message-ID: <177918804505.746149.6023931077901684027.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260427-poe_signal-v2-0-2bd9d6f16ab4@arm.com>
References: <20260427-poe_signal-v2-0-2bd9d6f16ab4@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Mon, 27 Apr 2026 13:03:32 +0100, Kevin Brodsky wrote:
> Commit 2e8a1acea859 ("arm64: signal: Improve POR_EL0 handling to
> avoid uaccess failures") introduced special handling for EL0 registers
> that impact uaccess. This did not however handle the case where a signal
> handler removes the relevant record (poe_context for POE) from the
> signal frame; this is clearly not typical behaviour but it is legal.
> That commit resulted in arbitrary data from the kernel stack being
> written to POR_EL0 in that case.
> 
> [...]

Applied selftest updates to arm64 (for-next/selftests), thanks!

[2/5] selftests/mm: Fix resv_sz when parsing arm64 signal frame
      https://git.kernel.org/arm64/c/c364aa56d673
[3/5] kselftest/arm64: Add POE as a feature in the signal tests
      https://git.kernel.org/arm64/c/42c21954063e
[4/5] kselftest/arm64: Move/add POE helpers to test_signals_utils.h
      https://git.kernel.org/arm64/c/925a082ec2a0
[5/5] kselftest/arm64: Add tests for POR_EL0 save/reset/restore
      https://git.kernel.org/arm64/c/f2db075234c8

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

