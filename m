Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A36DC55162
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Aug 2026 12:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gLmff9u5nyhTuQ6q2fk8/LobDnQcJw60OqqnmaHOfJI=; b=YKFDNBxgoTIcvVJ86Tj6V7WJ34
	CV1OEtVHg8D9OWzldkxqfExlRfU2qrG+KkQ859d6bfHOaMcyfZoUXuNzeuHeTe+QphsRbJOLV6c+E
	aYkS9mjTrIYgyeFq2t3U6IYNv2pKJeMxTzCQeGrubIrPr6mrm+vMcd0CpKQtFPfGTqoCsu5lnTSmY
	Lx5ftnNRs11bH2AKzRGDTdFfUCmEhx+0WnGk2/twWbyDQTRJEd7A3Gqfnb2AGimHp8bZAC3w5uyIe
	htKGNV6lIV7F1wjPOlDwn0AtwS5uigD0f2UzeYMElZXwF/7c1dw/o2mr2g1QO+OQCoj7FFivKyH6B
	aLGxtdQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqV4H-0000000Fc5P-2W1X;
	Sun, 02 Aug 2026 12:13:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqV4G-0000000Fc3L-1KYV
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Aug 2026 12:13:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BB78460A85;
	Sun,  2 Aug 2026 12:13:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF2B71F000E9;
	Sun,  2 Aug 2026 12:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785672803;
	bh=gLmff9u5nyhTuQ6q2fk8/LobDnQcJw60OqqnmaHOfJI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Bv0AkaL1yuukqMTeJcoLq6d9VJQy21IXYs5LQnaQwAzSEwU4fP7DYU5kZE6ueqoT3
	 2aH7RULPK41ReMn2DpPCewT1eRW8K/Yia/VYyit1Ek1rMH4HSyjkE6Xm2zhW7rfIwb
	 lPyVqZjHo56kZo+sVdaQkXqgwb+kYZ65u7KN6eD4PKfGuBIdzePlb9cpOenT69a8HX
	 XL6GpGDmH6BH3bJg/Td7DYLRkmyC4fEue5iAM76fZnVqU2UvZ1TUNZhOvJ5rXNjkoO
	 VJ+BeQKfd4ZXfahcjrB9xVFe3BjE/0Wd5mD1imT12tZPfmXLQmdO+bcYJjObseQF1u
	 +/orF+YmJfbqw==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	Will Deacon <will@kernel.org>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	linux-kernel@vger.kernel.org,
	Kees Cook <kees@kernel.org>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v4 0/2] arm64: Fix handling of tracer updates to x0 on syscall entry
Date: Sun,  2 Aug 2026 13:12:35 +0100
Message-ID: <178566435675.4143863.9174179007442722052.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260730132651.25993-1-will@kernel.org>
References: <20260730132651.25993-1-will@kernel.org>
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

On Thu, 30 Jul 2026 14:26:49 +0100, Will Deacon wrote:
> This is version 4 of the patch previously posted here:
> 
> v1: https://lore.kernel.org/r/20260714143600.23853-1-will@kernel.org
> v2: https://lore.kernel.org/r/20260716120640.6590-1-will@kernel.org
> v3: https://lore.kernel.org/r/20260717182758.17111-1-will@kernel.org
> 
> Changes since v3 include:
> 
> [...]

I decided against applying these for v7.2 this late in the cycle, so
I've queued them up for v7.3 for some more exposure.

Applied to arm64 (for-next/ptrace), thanks!

[1/2] arm64: ptrace: Keep 'orig_x0' in-sync with x0 on syscall entry
      https://git.kernel.org/arm64/c/88b839ce497c
[2/2] arm64: syscall: Pass 'orig_x0' as first argument to native system call
      https://git.kernel.org/arm64/c/5a87e8c7f370

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

