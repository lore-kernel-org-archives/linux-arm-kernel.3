Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C55A0C55171
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Aug 2026 12:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Aqy2sYYT7nnUkMKb18Do+wSj73tQDySesnEYTmLzDA=; b=orWtHwYZjHnEHCmJGGQUNiDPf8
	Pzqtrd74RE32T/Rbq6Cm5ymKfRU5bEshKgbNDwTrdIb0W1zPBxXzEUE+7dfMHK/HNwSa5G43fhPtQ
	egdm1CYQYs3KsFwCm9SAtMQC9YUjrLBDzFXUBCWLj4BvHlFvc44dY42RhupLW9W7d7qJ8tRmXPITP
	MVr9xVl3YUnevWoICX0A9Ycc066Ixtadfgh0ytcyj9wh03sVhRoAh/+tT74D+AXgRfGz9gLwcasIQ
	ZaKBDjXSFvo/1YO2m/stRJ64Dn0JVw4jwA/cfFugtgXChP3/KQ9raKImDShWLxQ+GN3SklGpMR6U4
	ZgNukq+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqV3v-0000000FbhF-0vYi;
	Sun, 02 Aug 2026 12:13:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqV3t-0000000FbgC-493m
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Aug 2026 12:13:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7212160A8D;
	Sun,  2 Aug 2026 12:13:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EDC21F00A3E;
	Sun,  2 Aug 2026 12:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785672781;
	bh=3Aqy2sYYT7nnUkMKb18Do+wSj73tQDySesnEYTmLzDA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ddbpve+n2FKi5781AgtIVpmrm2J/V9NRcD63fLvJmf4hugH0PWSdGzCk38EazjDsd
	 gu68KGeUkHGHDDFq+eBcftIpGGoPmhxnyMVXE+UMsW2gI9BlRxCxJ7jVvWU0VWXZGv
	 rt/S5wPyrBebC9FgpELtPSvixYn2Yu5dYwEXoeY2qY/wFSgdENtDr/dZT08EQbUCCf
	 6mmOjDN8TtzZZJ3K9/Rnm4KIX9InnzzKMZTpaoVVCrdtDnqHB3ySfOpRfIDrVvx29l
	 dF4U0QmmGO2GfXQRjEDO/SQWoY1xQnwabYWR430J89AI6yFRvYiAOlJNMJqalQnv7G
	 281zT4w7dtQbw==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH] perf: arm_pmu_acpi: Get rid of the edge-triggered interrupt oddity
Date: Sun,  2 Aug 2026 13:12:26 +0100
Message-ID: <178566828667.1853598.3447293945350631960.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260725162627.145301-1-maz@kernel.org>
References: <20260725162627.145301-1-maz@kernel.org>
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

On Sat, 25 Jul 2026 17:26:27 +0100, Marc Zyngier wrote:
> The ACPI spec bizarrely indicates that the PMU interrupt can be
> edge-triggered, which contradicts the very basics of the PMU
> architecture (SW is required to clear the interrupt condition for
> the level to drop).
> 
> Remove the code parsing this flag and always flag the interrupt
> as level triggered, no matter what firmware says.
> 
> [...]

Applied to arm64 (for-next/perf), thanks!

[1/1] perf: arm_pmu_acpi: Get rid of the edge-triggered interrupt oddity
      https://git.kernel.org/arm64/c/e445816a488a

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

