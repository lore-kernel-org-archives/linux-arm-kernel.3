Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DEC6C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 22:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R564Jn510zlLPvwqleY77EBM6BeWFYSnZoG/DwHfNHw=; b=1hKUwWjuWcR6MxdMBZTM8K1yM4
	Na/m6JNm2yNnBTbhT98cVra1nyvudTQyMReO90RJ6sPKBlMFiJ6ehIxWDqZqGITtoXMn8k4CFyZLs
	MdIn6dkShZV5GjoFsNAU77d6Ryi00ddsTLoFth1zGxcgCBhYSjWLzqofYYPW3wM2k1cKuORqtDkni
	mFYbUuvc8vsowyEidbF85rOF0u9H5COG3n0UmYyv34Waig51VR5zdzzSBTHL6Hkx6uDJrH3oVE9LQ
	zIOsbDtyn1zZca2ykshVZwJC2os8NIlNZTb7h4G9lD7Uj3LQsqADtvXMkg6n0JfNaAnuGM6shJh8p
	gL4DMV6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsqyq-0000000Cbwz-0cim;
	Thu, 13 Mar 2025 22:24:44 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsqxB-0000000CbsG-1lVL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 22:23:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 008AD5C06D4;
	Thu, 13 Mar 2025 22:20:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2789C4CEE5;
	Thu, 13 Mar 2025 22:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741904580;
	bh=b1hfd49heWssTk01Vsf1Xhytpjfe93HShIU5rdJiXyg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OrkWeDK4jqc6nowXBC+kLr1gAIlWZZlpFYaEsgru7aHVDcUGDagcKPflasADM9K+i
	 Hf3OQjAuFlpnkBrSxTT6Bq5CdZMSL2EdMrfMj7zx4pEiODype5Oidn3XdOWdVmtlSl
	 V2OB0qgJeFCptvVHmBLlUWKKJ6EB4ly15KO0gHjNOmD5IBqdWHdBHWLHUpJ0qJpuy4
	 y+1bviSAqls8r0ZKFuVWRx+Xzj+5A34c0Kt8ArkhEYEe5Lf4KVTUTUru5AHIbQpmVS
	 c/izO5QO0oGFle65jDa5iW0hpCHvR/7wFDTgnSbBA5374Df79Yu77FHb2fPCjEkBH8
	 c1DajYzrHS7sQ==
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	mark.rutland@arm.com,
	bwicaksono@nvidia.com,
	ilkka@os.amperecomputing.com,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org
Subject: Re: [PATCH 0/3] perf/arm_cspmu: Add PMEVFILT2R support
Date: Thu, 13 Mar 2025 22:22:54 +0000
Message-Id: <174190170500.714070.6303342038303900840.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1741190362.git.robin.murphy@arm.com>
References: <cover.1741190362.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_152301_504115_45330CA3 
X-CRM114-Status: UNSURE (   8.74  )
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

On Wed, 05 Mar 2025 16:10:05 +0000, Robin Murphy wrote:
> This is part of something I'm working towards, but I figure it stands
> up on its own enough to be worth getting out early. Compile-tested
> only, but it's straightforward enough that I'm confident.
> 
> Cheers,
> Robin.
> 
> [...]

Applied to will (for-next/perf), thanks!

[1/3] perf/arm_cspmu: Move register definitons to header
      https://git.kernel.org/will/c/862f7ad4d7fd
[2/3] perf/arm_cspmu: Generalise event filtering
      https://git.kernel.org/will/c/6de0298a3925
[3/3] perf/arm_cspmu: Add PMEVFILT2R support
      https://git.kernel.org/will/c/a28f3cbfd11f

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

