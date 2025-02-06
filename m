Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C790DC02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 15:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=a2kdGBwKdhSyKBzLWld2aYRlhOaG9fb1XZv1nvGV6Bk=; b=VFTinlz2uAR1fU4UWxZmYqfW2V
	3LXjE1KP0z6Y6ThyqN9cxl0u2qt5JHidYA9r5y5WlWpqx3ex8WuXX5ghN0Q4+BFjzydnrB4Iue/k6
	TvFRuuQgAdGqq9YhVUhBI3NQs8dmAjftxNLZMPzkRIIsEMv9ciMySEpV7r4Ae36FtdIpbgiBMJTcE
	/IMnUP4ajTlZJPPq8lJwfqMezHA+WN7kWtRVv1UcbuFlgWluWwVCvYru3JlwMQeX7t+5FX9xNBddL
	xDUZwPio5wl/H9v7qzjV5Sxl1UY39Z+BDxwBCLRDaZIKbkgIzk7PEFOe2o9Byk+2HFyh/c7tg8tUJ
	/XHryq4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg3kt-00000006hep-1TJN;
	Thu, 06 Feb 2025 15:25:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg3gu-00000006hAd-1qL5
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 06 Feb 2025 15:21:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=a2kdGBwKdhSyKBzLWld2aYRlhOaG9fb1XZv1nvGV6Bk=; b=ediMSiKzpeVs/7jLXFlv1NqqaT
	8q4JbwCcPdDHshgwHRrRQFEAP04su0pxGZgEF9qXmuKwJru+tIVhYZpHg8NdnqLbxkqYuVplx0K1l
	eDNlA56vSdNv96CO128CppbiXKetLw5sLFY77A0wr6Tqn6hevd08BNt/y20i6FvTwdMZT3+o2WZSX
	6iBo13eTeEK+FU+qqtqyUDJKLqai/LmIB1KAbaf+3ZLorE+lenLZ09n6SVlUQ8c4WFkZeT0oNyawG
	+mUYyWj33QaT/SasvbjQgKb7G4cbGHlfBrabXuJvyohSISx46qxMXoVAnFFi4NuczJaIns5czL/qJ
	Hh4Ydxag==;
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg3gr-0000000GySO-1YfI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 15:21:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 39687A439B2;
	Thu,  6 Feb 2025 15:19:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7928C4CEDD;
	Thu,  6 Feb 2025 15:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738855272;
	bh=eQlGH64WFsKvyNl+JJp7HVJjAWxwJIxovk4rzFV0bm8=;
	h=From:To:Cc:Subject:Date:From;
	b=JUg/B5MdF3LXUE4kZ7v8Xz5nVXk8k5lrUOA0BPQE7D/6fu53KfWkrLtFA6pA/TBQb
	 L9s9Zg1BKhoVEiL/xD+socdW1LOERAHYZJznzwwwduKz4FTASjmGK46hi1FS9UiOBM
	 HC+8RIsPCopfD/7eBPojmizx4EbtsBeS5IGco6uTC+dyjWoTcZyJmCSMpRWcsKUS82
	 pr1gUFJxASd1IkCW2A7gvwZ+U6txJWuNgxNFiC+oFUiE8eXllgMN1k+a1VapjRmB8t
	 AdN5BmXzVNRkLi8oFPCMqXRAoxuyDNaRSbEwCbMxZGPHXcIPx8wdM4DiAhEj/WfV9Z
	 JGbvhiRS+IkXQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tg3gk-001Axu-0A;
	Thu, 06 Feb 2025 15:21:10 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Alexander Potapenko <glider@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH 0/3] KVM: arm64: Assorted vgic fixes for 6.14
Date: Thu,  6 Feb 2025 15:20:57 +0000
Message-Id: <20250206152100.1107909-1-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, glider@google.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_152117_569708_0F7685DB 
X-CRM114-Status: UNSURE (   8.39  )
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

Alexander, while fuzzing KVM/arm64, found an annoying set of problems,
all stemming from the fact that the vgic can be destroyed in parallel
with the rest of the guest still being live.

Yes, this is annoying.

Fixing this is not going to happen overnight (though I have some
ideas), but we can make what we have today a bit more robust.

This is what patch #2 is doing. Patch #1 is just removing a loud
WARN_ON() that serves little purpose, and patch #3 fixes the actual
bug that Alex reported.

Hopefully, none of that is controversial...

Marc Zyngier (3):
  KVM: arm64: timer: Drop warning on failed interrupt signalling
  KVM: arm64: vgic: Check for unallocated PPI/SPI arrays
  KVM: arm64: vgic: Gracefully handle resetting an unallocated interrupt

 arch/arm64/kvm/arch_timer.c | 16 +++++++---------
 arch/arm64/kvm/vgic/vgic.c  |  7 +++++++
 2 files changed, 14 insertions(+), 9 deletions(-)

-- 
2.39.2


