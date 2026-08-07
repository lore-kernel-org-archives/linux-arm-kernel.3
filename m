Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66683C5AC7C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 10:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EuxLL5anSxH0ImkGmtlRd/tPm7fjlfNIOn8PqzfUkSE=; b=W0nE/dncB0WCbeVhUDkujHsE0l
	sEhKSnIHjK2hhdsCKGB2fA1PwtBMmtQoBEmUu09uM5xGfIORqpAghkW6XwpEj9QLtQsgdZb76/O82
	b11bPY7Spg3YtZyQ3ZjwqbfIT0JgmAGw3bw8dkufHXIAmk+8mOWFzL6ucFRfIvIkq8Js1pUIjwFHw
	drgN1MwMS4cFnJxZ+7LeuLU0Eo85lWuA0mjD0nbNJCjhlyE/+DDBpffueVeu8lO/fqPJ5dAFeaA3y
	taoh+XlT8OsXov/zEdrsF02fENNLWiiUd9HYCiOmG/6yLlxz5LHhLEDYo2bRsfG836J7jJYuCLb9W
	0XFUwrTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsI11-00000007hTB-13Kb;
	Fri, 07 Aug 2026 10:41:27 +0000
Received: from out-184.mta0.migadu.com ([91.218.175.184])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsI0y-00000007hQz-1MSR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 10:41:26 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1786099279;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=EuxLL5anSxH0ImkGmtlRd/tPm7fjlfNIOn8PqzfUkSE=;
	b=hfyUC4DTnMqdKE6bKBikrIsAS8bO140kIo7H8WY4M6xfeOHd/+8S+/y39XXrrCyg69PpQ4
	NOt/PJKlUyuGSLEv1LHrDS5zTZDzsgn5Lz7CO2JIDuMxLVlpQ4J+ltOq8u+8iUeZbIK1X1
	4JZdLtzlnabW4+3v0hyUwgHgcbPgR2c=
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Will Deacon <will@kernel.org>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Sebastian Ene <sebastianene@google.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] KVM: arm64: vgic: Fixes for ITS table save and init retry
Date: Fri,  7 Aug 2026 11:40:58 +0100
Message-Id: <20260807104102.2410744-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_034124_502659_B28C0927 
X-CRM114-Status: GOOD (  14.67  )
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

Respinning today since I am travelling until the 17th and will be slow to
reply.

Changes since v1 [1]:
  - Patch 3: check the collection ID with vgic_its_check_id() instead of
    bounding the walk by the table size, so a collection the table cannot
    address is not saved either. Retitled to match. (sashiko)
  - New patch 4: skip the ITEs that are saved as invalid when computing an
    ITE's next-event offset. (Oliver)

Three unrelated vgic fixes, and one follow-up to the first of them.

The first is the one that matters the most. A guest that issues MAPD,
MAPTI and then MAPC(V=0) leaves an ITE mapped with no collection, and
the next KVM_DEV_ARM_ITS_SAVE_TABLES from the VMM oopses the host. That
is three ITS commands and an ordinary migration save, with no race and
no allocation failure.

The other two are weaker and come after it. The init fix stops the SPI
array leaking when userspace retries KVM_DEV_ARM_VGIC_CTRL_INIT after a
failure. The collection table fix stops the save writing past the end of
the table, and stops it saving a collection the destination will reject.

Patch 4 is not a fix. It makes the restore scan skip the invalid entries
patch 1 writes instead of stepping through them one at a time.

Patch 1 is unchanged. Oliver also suggested deleting the ITEs when their
collection goes away, but I do not think it removes the need for the
check here: vgic_its_free_collection_list() reaches the same state with
the ITTs intact, and that path is not UNPREDICTABLE.

Patches 1 and 3 are reproduced, each with a selftest that fails on an
unfixed kernel and passes on a fixed one. Those are not part of this
series, happy to post them separately if they are worth having.

Based on Linux 7.2-rc6 (075b74841bd00).

Cheers,
/fuad

[1] https://lore.kernel.org/all/20260805093828.3626610-1-fuad.tabba@linux.dev/

Fuad Tabba (4):
  KVM: arm64: vgic-its: Don't dereference a NULL collection on ITT save
  KVM: arm64: vgic: Don't leak the SPI array when init is retried
  KVM: arm64: vgic-its: Don't save collections the table cannot hold
  KVM: arm64: vgic-its: Point saved ITEs at the next valid entry

 arch/arm64/kvm/vgic/vgic-init.c |  3 +++
 arch/arm64/kvm/vgic/vgic-its.c  | 26 +++++++++++++++++++-------
 2 files changed, 22 insertions(+), 7 deletions(-)


base-commit: 075b74841bd0065a3bda3440873c747938e69b68
-- 
2.39.5


