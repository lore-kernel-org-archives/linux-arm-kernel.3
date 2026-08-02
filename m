Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0F37C55162
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Aug 2026 12:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8NzEz/L4MaCMQSAHBHYHb2gFB0rRQPncj/WkeDZonM4=; b=ZVfjeueqMy1y6jiMVLrAf5cJrb
	u/nM56Lzz1d9QdNk9CG1eXuir8p4RaMkLRjreSszf231pYNCUHYjQJn8E7pmx5lO+IGkl3gkggp0q
	TnIuMH/xY5ExsEpAfY4mWSyqEz6qNcaKIxboB+yy8Zw+0HjwyIyf/3eeFdHLvifHZWUfkPBVOaiCb
	rPPVOJ1D6o1MxEd9P4CKjrnXqbI4zIisVAF8uxrrks9u5/goHMqa6i7H/KPNKWTffYTCebYb8h5FY
	ehUbB6wVmA0oSoGjSQzKshxEQ6EwLbQsFuifq0p4mA3SGLaoUpWQ4HirHT2tbQyTGA4+0neRVcjKk
	Cmbv9raw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqV43-0000000Fbox-3tJ0;
	Sun, 02 Aug 2026 12:13:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqV42-0000000Fbns-27gO
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Aug 2026 12:13:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4752A40695;
	Sun,  2 Aug 2026 12:13:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24BC51F000E9;
	Sun,  2 Aug 2026 12:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785672790;
	bh=8NzEz/L4MaCMQSAHBHYHb2gFB0rRQPncj/WkeDZonM4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=G/BIDdBhh0jGS83ufomQbqpih8WuyrfX9n7eXd3xEdA0uOxw//ZTMdapaH9k1LYIa
	 Le0ZlCvDaRNtOpRbwTuemJeSKgKOgqNS5MjM431wZWRxFt4YDMOzvnVD1WjttqQN5W
	 NPKsrYiUGkAK6Pui+WkOB7KdxEEOecISKGn30xse+6MrHqEaHBdB2yiBRpwv9YfYaF
	 oeLmZVjlYsJmZSS1bq3P7AVVm2no0/Eu0JqM0kuUr4ZCa8sNUqpvNs1UXW0DlCQsQN
	 +eIUrgon8lpdEjW9nd87x8qhzqBBkxUYYKfdxqSrILl6NInPJ22AXNYbJ810E/oB3l
	 7UNhE9HNilGgQ==
From: Will Deacon <will@kernel.org>
To: mark.rutland@arm.com,
	catalin.marinas@arm.com,
	Robin Murphy <robin.murphy@arm.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	ilkka@os.amperecomputing.com,
	bwicaksono@nvidia.com,
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org
Subject: Re: [PATCH v2 0/4] perf/arm_cspmu: Miscellaneous improvements
Date: Sun,  2 Aug 2026 13:12:29 +0100
Message-ID: <178566825175.1853083.11515494641516544186.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1784213435.git.robin.murphy@arm.com>
References: <cover.1784213435.git.robin.murphy@arm.com>
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

On Thu, 16 Jul 2026 15:56:33 +0100, Robin Murphy wrote:
> These are a few quality-of-life improvements for CoreSight PMU that
> I've accumulated based on things which have come up in practical usage.
> There's no real dependency between any of the individual patches, it
> just felt right to send them as a series.
> 
> v1: https://lore.kernel.org/linux-perf-users/cover.1783605641.git.robin.murphy@arm.com/
> v2: Fix valid nits from Sashiko review, add Ilkka's R-b.
> 
> [...]

Applied to arm64 (for-next/perf), thanks!

[1/4] ACPI/APMT: Use stable device ID
      https://git.kernel.org/arm64/c/04aa909b38bf
[2/4] perf/arm_cspmu: Improve APMT-based PMU naming
      https://git.kernel.org/arm64/c/745a724f9c81
[3/4] perf/arm_cspmu: Improve sub-module error reporting
      https://git.kernel.org/arm64/c/60b234db6bf1
[4/4] perf/arm_cspmu: Make IRQ more optional
      https://git.kernel.org/arm64/c/36e200f01991

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

