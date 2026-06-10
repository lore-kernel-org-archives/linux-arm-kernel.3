Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C2E9CD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 12:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TwHpBqbvtSbLAcNkVSgksoaewYljFVujCr7BwI7/iD0=; b=fu2xDTHZNRtk/mVx+cutRuaqfI
	8OH91AXV5/8z4fbS9Ghn5WvB2wTW4MzhEIq3pmBzzq93a7KLGQPqbx5Qk7qwMEh/5yEXeXbsPoifE
	31CSdAm3pPDBhZ1d9SgurFj3THrLDLQIez6XGw97f80Yb56rQp29zgUK0Ubwh5MHZhA0NTMRWQau/
	fSIH8bAPGeLjnGKGmjeD4IeEMtQosYLVhp068HpQv5yvzJXoqYkgGrSGt+U319cbsXswSnA8uMsOK
	jFmE1ebFWOhm+lqoINY1n0CyuOFUTgNuIdBXdfIeu12VLeNK3gU9ym/+Wh9jgfEtgQ2Irxyt4Oluv
	Fg0oxVbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXHpK-00000007cmc-1ER1;
	Wed, 10 Jun 2026 12:14:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXHpI-00000007cmP-2Qm5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 12:14:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1A080405F2;
	Wed, 10 Jun 2026 12:14:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8B531F00893;
	Wed, 10 Jun 2026 12:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781093672;
	bh=TwHpBqbvtSbLAcNkVSgksoaewYljFVujCr7BwI7/iD0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=k+qt+kRCBRKkU25tM26t+JkyOwAG1/FONrl7l9u1pHLSkd+EuRPiKwS7q90CmkYaW
	 qHjPfcnIYW2NczwlyUT1FbYDvimeFOO8V+7z5/uIDCLGjeCO8DrSDGiTv2EGDGnKC1
	 6hkdLkcq2EeVpeNViT9jf8nMzpyoNUg+dQ95i/+c8l8kGR5r9bcfjFJQq1MNqprZi4
	 ZxDZ+tHnEZQOGxzfTVTiEo9HCXuQMgKQZvwrOg5BaMnubB7B8MzSL3uVzb9Jv03ljG
	 1cqLc9bI+ffBiob8BMLeSZIxozPHMTL2iYl7vmhZAjFmcWK/MLfCGDPKgQPmkn/x/f
	 fh2XNRTs86V2Q==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	easwar.hariharan@linux.microsoft.com
Subject: Re: [PATCH 0/3] arm64: errata: Mitigate TLBI errata on various Arm CPUs
Date: Wed, 10 Jun 2026 13:14:24 +0100
Message-ID: <178108852371.786933.719826336963783417.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260609101203.1512409-1-mark.rutland@arm.com>
References: <20260609101203.1512409-1-mark.rutland@arm.com>
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

On Tue, 09 Jun 2026 11:12:00 +0100, Mark Rutland wrote:
> A number of CPUs developed by Arm suffer from errata whereby a broadcast
> TLBI;DSB sequence may complete before the global observation of writes
> which are translated by an affected TLB entry.
> 
> The ARM64_WORKAROUND_REPEAT_TLBI workaround is sufficient to mitigate
> the issue. This series enables the workaround on affected parts,
> requiring the addition of MIDR values for C1-Ultra and C1-Premium.
> 
> [...]

Applied to arm64 (for-next/errata), thanks!

[1/3] arm64: cputype: Add C1-Ultra definitions
      https://git.kernel.org/arm64/c/60349e64a6c6
[2/3] arm64: cputype: Add C1-Premium definitions
      https://git.kernel.org/arm64/c/d28413bfc5a2
[3/3] arm64: errata: Mitigate TLBI errata on various Arm CPUs
      https://git.kernel.org/arm64/c/cfd391e74134

I also pushed a patch on top to enable the workaround for Microsoft
Azure Cobalt 100 CPUs, as fb091ff39479 claims that is bug-compatible
with N2 r0p0 (+Easwar in case I got the erratum number wrong in the
documentation).

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

