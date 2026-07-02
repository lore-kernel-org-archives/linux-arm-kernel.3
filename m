Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E582C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 00:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x/bV7HFJfyzdDuCkRNOH8v9crT+EEgxWSV7YC4KCAEk=; b=IUvW0By53xMvyt/pId4CHufFVj
	t8G3prHBlxetU62BvEYPiySUvjlXyQ0lkHCWgxWMfB9RyHDK4Ph8Mvs++wQMbuJQUkZIqDslt5mR7
	p41cFvB2F9AF4zCNNUu52rMtrr3tNrCxLghRIECe0uJ9/+Y5D9aaj4O9F77aNLyfNiQHbR/tav6Rr
	K8YyvBymVfVdsonYFRUw5r7gBU8dg3Bt47/nbnRDjiivqvCrRYRHvBnCuULWryWEaE4G0z5fZRK2+
	hLCYV7aNCtBbP7vU7f8aBkFIlqlObbfRoCfeYYYaMZ1s2blWoI87Nyj51U1CLqklUvmvH7kHzGsAI
	5DVAEKeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf5SF-00000003Iic-1RS3;
	Thu, 02 Jul 2026 00:38:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf5SE-00000003Ihp-0WyY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 00:38:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 91C486001D;
	Thu,  2 Jul 2026 00:38:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72A201F00A3D;
	Thu,  2 Jul 2026 00:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782952737;
	bh=x/bV7HFJfyzdDuCkRNOH8v9crT+EEgxWSV7YC4KCAEk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=I+T9TE6IKQMVZ23EwjzOMPhKU5WB11Mf0ZUziYjAMvScUBjSgCrryM/Q7/+5ZEsGU
	 JaWcV1yNnoirmY3Lki0oT0X2/nhBuvfQut3AVlpP9b2XQSGKFDu7evEzVybOq1NxER
	 l9F9qwvsNHEIwm502MmF3K5zwIB+BrD3CidN+Lf6m48iygncVcY+nMT3TwdUxfP0vQ
	 oMaNjJ6py51gq/pKdpLjdjFRjjiwjGP3QfYHOAzbgKjttYOZnAHlBs0RC7kNkwXqj8
	 gna7W84b38/usd98eoK3uHHKu9a/0Hb9d6XCyqOS3Wm8rymZgQAnGK5G1srrIaresj
	 TrSxmGkpxiSFg==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org
Cc: Sasha Levin <sashal@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mingwei Zhang <mizhang@google.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Colton Lewis <coltonlewis@google.com>
Subject: Re: [PATCH 0/5] Backport ARM64 VHE boot fixes to 6.6.y
Date: Wed,  1 Jul 2026 20:38:35 -0400
Message-ID: <stable-reply-arm64-vhe-66-20260701193800@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260701204342.2654385-1-coltonlewis@google.com>
References: <20260701204342.2654385-1-coltonlewis@google.com>
MIME-Version: 1.0
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

> This series backports VHE CPU boot fixes to the 6.6.y stable branch.
>
> These fixes are already present in the 6.12.y stable branch (and
> newer), but are missing in 6.6.y. They are required to enable booting
> L1 guests with nested virtualization enabled (kvm-arm.mode=nested).

Ugh, yes, the sha1s don't make sense.

While respinning, please also consider whether upstream 3855a7b91d42
("KVM: arm64: Initialize SCTLR_EL1 in __kvm_hyp_init_cpu()") should
join the series.

-- 
Thanks,
Sasha

