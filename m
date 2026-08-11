Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE4AAC5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 13:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SJxmRQM7F3EcGKJ2usgmmLbzV+Jao4QSmpRGL3/m8nM=; b=FllHKWVswCQAn+lDoD+B27wxiV
	iYaC88GhUAfBdkoBiA25ULWoHmnL3+utNkDgJ+kLpE/7ZpRpO/QvekxqzRvWH9MHe3+f+3lrH9e5n
	zKwTZaAun3J0w2UPLTzVl6mYHQrVPOFLxUtWsY0kZsMf/DM0SDUKBwFlGhp8wMlvgfBo9zqgWEXs8
	6LqIfTL/NWgCV0+FxKzHYvieZONCK7vtpWjWALBt+C64qYasg+v9QYu3j0zCKCJxqo6a6lEH5GaRg
	gDP8h+jvNrQ4oSvwnaoEXAjem0CW+MaNNsOWgbwEce1WQgtShHTjo5bA1pTe1F/61UPBenAmPtbNU
	vk4yNp5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtmsJ-0000000E8Fe-1vFt;
	Tue, 11 Aug 2026 13:50:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtmsI-0000000E8FS-0hvq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 13:50:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3207B600AD;
	Tue, 11 Aug 2026 13:50:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D724C1F000E9;
	Tue, 11 Aug 2026 13:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786456236;
	bh=SJxmRQM7F3EcGKJ2usgmmLbzV+Jao4QSmpRGL3/m8nM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=dPzERcAojVuBzzizgM/Q9daClJkJFXcnYt58TlPSQRhoBEAUAoUkWLtUjeIjfEXjR
	 Z/pO4eWJ8tcWaNsrDByaW+EENLpX4Roscs9HhbhH1C4PrRDlaAPTFYF/EOgw1yK0dk
	 qGuJACz4GvyOW22WmuEUCJIfLdnpCJj5LhPyJPASM+Or210vqAjSQLLxauj7V3TIKk
	 cPQJm7Oe1jsKlNuvDnbXfWpFt0fv7dt6R09ZcA0anc3f4JHZIN3AY6flzj5pfYifli
	 jXx3pNf82AqjCmNic36H5gvBJdAVhJL81aoYIQAXXXE41oYsXQ3nHYxbM8NaXRjgNZ
	 6gNk0/+2FG8aQ==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	Vladimir Murzin <vladimir.murzin@arm.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	mark.rutland@arm.com,
	maz@kernel.org,
	ruanjinjie@huawei.com,
	liaochang1@huawei.com,
	leitao@debian.org
Subject: Re: [RFC PATCH v2 00/45] arm64: Add support for FEAT_NMI
Date: Tue, 11 Aug 2026 14:50:28 +0100
Message-ID: <178644801936.3298642.13329648987825635057.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260727163453.7969-1-vladimir.murzin@arm.com>
References: <20260727163453.7969-1-vladimir.murzin@arm.com>
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

On Mon, 27 Jul 2026 17:34:08 +0100, Vladimir Murzin wrote:
> FEAT_NMI provides an architected mechanism for supporting non-maskable
> interrupts (NMIs) and less-masked interrupts (LMIs).
> 
> Since we already support pseudo-NMIs via priority masking, introducing
> another flavour of NMI on top of the existing infrastructure could
> easily become messy, making the code harder to follow and reason
> about.
> 
> [...]

Applied patches 8 and 9 to arm64 (for-next/nmi), thanks!

[08/45] irqchip/gic-v3: make the unmasking of pseudo-NMIs explicit when handling IRQs
        https://git.kernel.org/arm64/c/067f029c6463
[09/45] arm64: entry: Avoid unnecessary local_irq_disable() on kernel exit
        https://git.kernel.org/arm64/c/39aebe0e8946

This should fix the pNMI splat reported by Breno at:

  https://lore.kernel.org/all/20260807-arm64_fix-v1-1-d069ccf9d71b@debian.org/

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

