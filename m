Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DA7CC4452D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 08:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NI52X9v5J5Li+DSNwCiore0FEn2owtImCI3bUa3xGzY=; b=tNyKOv8QKtmXavLwSe0fNhcyNF
	HZY68YGbs200Xu82EXLM87LADKB1M5uQm4sKOaFzqfaJzBInbXykVQMzRiOzFb7P8jTjkj7vMiwDr
	ARoQR2BAgsMbmEYQFBZTtRXA+/CZF0pUCd/LI8GqB+u1sG0nqlMeJhXKJcF4DlNnd/ycBkOoXVIL1
	VvhLS5KixFaDZwb/+SxO0v32Q4+UmzQTK2Jl3PaO4MCDNdBvj0HPLkXciGAbzPPIdYHuY9NnR70/w
	J4nLv5owKKHLnoId50MxDNfUWD6kEVtXGZ4NwYum1F2Ba3Jy+v88h1KHX8xwxxPHeGFYFyEJGPj/w
	CgCum7Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmSEy-0000000BEY8-06JU;
	Wed, 22 Jul 2026 08:23:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmSEs-0000000BEWa-2Tn0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 08:23:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EB7D960A64;
	Wed, 22 Jul 2026 08:23:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 895701F00A3A;
	Wed, 22 Jul 2026 08:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784708617;
	bh=NI52X9v5J5Li+DSNwCiore0FEn2owtImCI3bUa3xGzY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Z+2+lmYsiECDh4MZR89QAKpJ0mF818r2V/gBWvBCrcNhdc6jPxCuetYgMM5YEEhyn
	 SPrPrAuVvl8Vdoe83XJtfIjderHnNr5nVNsFNa4mrs8fqK+rtLywvdYq2IflhK2Daz
	 tWkn7VjCVhQET+9cuDaYHU6XO9F7xUgMJLR5OG4ayWqgYXiaRjYECTqYJA6cw2Z1aJ
	 1wqc3Ejo1M/6nHqnEO5jh7vxU0WGBfG0kct8deI62JTET0RNOBSbY7m5YjSDakmIx7
	 UXck0AUN3RR6hihKfBnQ2L5aGy8gmNgC7yAUmFtRWv6t9B+p24jLPORzZhKVSFppRZ
	 aTlVtcFNRivKw==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kohei Enju <enju.kohei@fujitsu.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Sami Mujawar <sami.mujawar@arm.com>,
	Steven Price <steven.price@arm.com>,
	Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH v3] virt: arm-cca-guest: use migrate_disable() for attestation token requests
Date: Wed, 22 Jul 2026 09:23:21 +0100
Message-ID: <178467175320.116388.3560341069343395580.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260612111007.49434-1-enju.kohei@fujitsu.com>
References: <20260612111007.49434-1-enju.kohei@fujitsu.com>
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

On Fri, 12 Jun 2026 20:09:21 +0900, Kohei Enju wrote:
> The RSI attestation token init and continue calls must be issued from
> the same CPU. arm_cca_report_new() currently snapshots the CPU number
> and uses smp_call_function_single() to issue those calls on that CPU.
> 
> With CONFIG_DEBUG_PREEMPT=y, the smp_processor_id() call used for the
> snapshot triggers a debug splat [0] because it runs in preemptible
> context. The snapshot does not pin the task to that CPU; it is only used
> to choose the target CPU for smp_call_function_single(), which can fail
> if that CPU is no longer available.
> 
> [...]

Applied to arm64 (for-next/coco), thanks!

[1/1] virt: arm-cca-guest: use migrate_disable() for attestation token requests
      https://git.kernel.org/arm64/c/24f55f511b9e

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

