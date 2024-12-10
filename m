Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64FABE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 00:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IPhvV7YLIhUy1iqnrEvgo6o/Cj/1fsbuKiGxw0m5kYs=; b=e7MxBINyH0VLc7IJJGluCL+p+C
	9EBBt5aKaGiGp+wdwvT0cEM9vLSIGdtUyYnyheDA4t+jlZfa5D/9lHx3X/5rTJdGlwxk+8bPbYebM
	tnTZOFPor9avrBAm/x0CAQqw/8lCS1oFNUPPOhoS87zJK4tkcrwJ4g6k2NtDePC2HYeZJ3gBP+Q4H
	JefaRjWjmHjvuuGkxMzDKdKmKxuRy59P8urBOMiuwf5wOBuAyCWeopPFOTMtLiBmU+uINKdrlp61R
	cEKLP3zVfFVVKNCLIKKSCJwIjV8kgOkjX0b7lYTs3hw/MdKBGd+UfZ/nmSrjBSA+OCerFImWj/TEi
	rryERmVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKo0f-00000009gvH-1she;
	Tue, 10 Dec 2024 00:21:53 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKnwj-00000009g3b-3mbQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 00:17:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A47A0A41A7A;
	Tue, 10 Dec 2024 00:15:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2995C4CEE1;
	Tue, 10 Dec 2024 00:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733789868;
	bh=+d/z7lM6Ty4nkhWISS9A4dpkXbJaiWaiwpS72Ypiu1Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QZM3wGonVFHWXCsEXoU3JNBXwF/BxX1+yWNISPgO6Aaqajo8aZwhZMCeQZNgKVlku
	 NkGtQu3PvKpdjpmvwTf75EgWBGIZV9fsZTuObfTZMJyY4mG0YHkMXbHuwVuN/8DRuU
	 0TMePcHK84LhDTBVvGQ73JbDPEAZ8YumGmm3ZMk4f+sTkql0ZBz2HalWpu+OYu3VDv
	 vDX/7XkXFl6wdxJjnbEbh2jn/BMV6uHi2LjGgefRB0qxi2UNyPBseoqPJbbGwiU674
	 qcXzJcsmnvuvDhogWlSMbB2TYiereFg9kf344BggKm/kY3Ng2GvYNmpEY5cMFvbFhI
	 ZeixckeT2DNfg==
From: Will Deacon <will@kernel.org>
To: catalin.marinas@arm.com,
	Robin Murphy <robin.murphy@arm.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	joro@8bytes.org,
	jean-philippe@linaro.org,
	iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	mark.rutland@arm.com,
	joey.gouly@arm.com,
	ryan.roberts@arm.com,
	broonie@kernel.org
Subject: Re: [PATCH 1/2] iommu/arm-smmu-v3: Document SVA interaction with new pagetable features
Date: Tue, 10 Dec 2024 00:17:30 +0000
Message-Id: <173378456062.4186718.3662609391353650164.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <68a37b00a720f0827cac0e4f40e4d3a688924054.1733406275.git.robin.murphy@arm.com>
References: <68a37b00a720f0827cac0e4f40e4d3a688924054.1733406275.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_161750_002500_7D468076 
X-CRM114-Status: GOOD (  10.80  )
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

On Thu, 05 Dec 2024 13:48:09 +0000, Robin Murphy wrote:
> Process pagetables may now be using new permission-indirection-based
> features which an SMMU may not understand when given such a table for
> SVA. Although SMMUv3.4 does add its own S1PIE feature, realistically
> we're still going to have to cope with feature mismatches between CPUs
> and SMMUs, so let's start simple and essentially just document the
> expectations for what falls out as-is. Although it seems unlikely for
> SVA applications to also depend on memory-hardening features, or
> vice-versa, the relative lifecycles make it tricky to enforce mutual
> exclusivity. Thankfully our PIE index allocation makes it relatively
> benign for an SMMU to keep interpreting them as direct permissions, the
> only real implication is that an SVA application cannot harden itself
> against its own devices with these features. Thus, inform the user about
> that just in case they have other expectations.
> 
> [...]

Applied SMMU change to will (for-joerg/arm-smmu/updates), thanks!

[1/2] iommu/arm-smmu-v3: Document SVA interaction with new pagetable features
      https://git.kernel.org/will/c/6e192214c6c8

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

