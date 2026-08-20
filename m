Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E53CC5DF85
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 15:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aV5T/K4cq3A0vUOUngyduigVmyhN4lJozTgVuBaaZaA=; b=etBdHqtxdoMfnNLuoiX7p8C81f
	YGgmt4e2vxgaMel1pgSp+YVjlC13vcvmys00iGw2c6dZ/GK2ZgJtlRWkUf9TTmrH3nRvkj1Ovc57M
	MYVRi0/mOsQHp6WUgZUIdedOpGvoTtIY24WbtUTACi+aZBSft4g/UwsXSx8vEkgKA2nSSHQDkU06g
	uCu0ivdug7GFvIm+pUK6A5q4Q/jihohZvWebTTUE0P0sccH6O0ytlllJG9OBKGOC5zX3hxT9gOmxc
	Npf35tYs/kN36AApGYrWZcYRQs9S6ZVGQKJyCNu3ATePm/Ytl3vU9g9EdCASiEmwWrwUGU95Lrc1U
	KYRucbzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx4GH-0000000BlG7-0Zh6;
	Thu, 20 Aug 2026 15:00:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx4GD-0000000BlFk-3leJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 15:00:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8E0A3153B;
	Thu, 20 Aug 2026 08:00:46 -0700 (PDT)
Received: from e122027.cambridge.arm.com (e122027.cambridge.arm.com [10.1.25.29])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0C2973F85F;
	Thu, 20 Aug 2026 08:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787238050; bh=O2lTX9I3YPIZ+bo0YXEpysRU2CMztWSeM004+MCAceE=;
	h=From:To:Cc:Subject:Date:From;
	b=AJ9VAcMwdCmOOsbBcXQZufYWWNusiIl7BpU3vmD6YO3IigW5quK+sWWKSRw6WizW+
	 2iHoint2tEOBaY/FtrZULKYZFMh6cSYapIOjbko+WSq2JakMtMPRdyuCxIt5JrP25V
	 G89vzy1Y+G0OyH3LpA9w1LneqtGXWnPsnUMn2ObQ=
From: Steven Price <steven.price@arm.com>
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Marc Zyngier <maz@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Steven Price <steven.price@arm.com>,
	"T.J. Mercier" <tjmercier@google.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Jiri Pirko <jiri@resnulli.us>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: [PATCH v2 0/4] Clear shared pages after private-to-shared conversion
Date: Thu, 20 Aug 2026 16:00:29 +0100
Message-ID: <20260820150034.88729-1-steven.price@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_080053_999418_83B3C5AD 
X-CRM114-Status: UNSURE (   8.99  )
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

set_memory_decrypted() doesn't (currently) guarantee to preserve or zero
memory, but both the GICv3 ITS driver and the system_cc_shared dma-buf
heap currently allocate memory with __GFP_ZERO followed by calling
set_memory_decrypted(). On an Arm CCA system with MEC this can cause
ciphertext to be visible to the guest rather than the expected zeros.

Patches 1 and 3 fix this by zeroing after the set_memory_decrypted()
call.

Patches 2 and 4 fix other related bugs that Sashiko found. Patch 2 fixes
the issue that set_memory_decrypted() can be a sleeping call, so moves
the allocation out of an atomic context.

Patch 4 deals with the situation where set_memory_decrypted() fails and
the rollback path could attempt to re-encrypt memory which was never
decrypted.

I've sorted the patches by area, but there's no (semantic) dependency
between them.

Changes in v2:
 * Switched to use BIT(n) rather than 1 << n in the GICv3 change.
 * Added Jason's R-b.
 * Patches 2 and 4 are new.

v1: https://lore.kernel.org/r/20260820105026.53208-1-steven.price@arm.com

Steven Price (4):
  irqchip/gic-v3-its: Zero shared pages after conversion
  irqchip/gic-v3-its: Allocate VPE tables from sleepable context
  dma-buf: heaps: Zero system shared heap pages after conversion
  dma-buf: heaps: Fix shared system heap allocation rollback

 drivers/dma-buf/heaps/system_heap.c | 24 +++++++++++++-----
 drivers/irqchip/irq-gic-v3-its.c    | 39 ++++++++++++++++-------------
 2 files changed, 40 insertions(+), 23 deletions(-)

-- 
2.43.0


