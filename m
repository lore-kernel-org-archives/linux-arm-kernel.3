Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B75FEEC28C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 22:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CxKAMe7f9QMNvuAHtwpQGdYxL4rGK+3rUYWpJliAQt4=; b=dXmXBjpFFoEBKR06aLWu6N39oU
	9jx00j5tXAVaV5CUAQ+DmFycMICM5k+efeZ3E86292owQretqAVM9vO+VyIcxEec0iNwrQ399NKIR
	hFL2bjU7boabTEuRESZRQtYaTtuT4ihtTRSEnhImZUmp9C3G/Ucj3egU+GAsTPhO4YMlJkN8v2Eo0
	3YsY5e2N7vR5VL+qsyCWtJSmFoTvWK/1Oobv6XKFBokHx+kMd9WTcjgXeN+jZtmat9xdxk06XTJyW
	Mj3jiQraxsH3tl4l8/ASLyECNd7KnbtEiC10gkNWB74lzggcojqXH+hXhF8mf2oYCc2CHUGEhWim7
	naRwolGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vue8E-000000015uC-05Zg;
	Mon, 23 Feb 2026 22:10:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vue8C-000000015tt-0qxl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 22:10:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 170C66013F;
	Mon, 23 Feb 2026 22:10:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 667CEC116C6;
	Mon, 23 Feb 2026 22:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771884618;
	bh=TiiOQqNHktq/5G+T5x5YTYD4HR/N6YOwWMUtNo5Xo/A=;
	h=From:To:Cc:Subject:Date:From;
	b=Hb373X9YT2GI7A4BjZtUHH14z0wda6haAKF0D9il4wuJfOIokRq3PSnGzuvBB9/Gk
	 t8ogGQGq0I3P/cKAbysqgnbCdxMtxjIyflHNkj07mcXLm3CXmVDi45HspPYbOOU8Nr
	 QNgOuAr82FnQzjCPfD4xOK6dIy1l2jRncNkh1ABYVhwFjJky73gOSIbUsFaP6f2umk
	 +OJvefTbN5HhMgd9tSiZ9b8fS1IZnySSXP5NHzNEtxigS8H+86iNr0ZVOZ5KBhFa2w
	 MME6EGCuCrV4zX6VWWwvRKNhR+5dT7ZLlBB5PG1vHqjtlnzjcYFUXyfy3lZNFrgATb
	 Tqi9f3s16Z0zQ==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: Will Deacon <will@kernel.org>,
	Zeng Heng <zengheng4@huawei.com>,
	Jinjiang Tu <tujinjiang@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 0/2] arm64: Fix syzkaller splat in ioremap_prot()
Date: Mon, 23 Feb 2026 22:10:09 +0000
Message-ID: <20260223221012.31962-1-will@kernel.org>
X-Mailer: git-send-email 2.47.3
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

Hi folks,

These two patches aim to resolve the syzkaller splat reported by
Jinjiang at [1].

Rather than introduce a new arch hook, as was proposed in [1], this
series instead augments the existing ioremap_prot() hook on arm64.

Cheers,

Will

[1] https://lore.kernel.org/r/20260130073807.99474-1-tujinjiang@huawei.com

Cc: Zeng Heng <zengheng4@huawei.com>
Cc: Jinjiang Tu <tujinjiang@huawei.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>

--->8

Will Deacon (2):
  arm64: io: Rename ioremap_prot() to __ioremap_prot()
  arm64: io: Extract user memory type in ioremap_prot()

 arch/arm64/include/asm/io.h | 26 ++++++++++++++++++++------
 arch/arm64/kernel/acpi.c    |  2 +-
 arch/arm64/mm/ioremap.c     |  6 +++---
 3 files changed, 24 insertions(+), 10 deletions(-)

-- 
2.53.0.371.g1d285c8824-goog


