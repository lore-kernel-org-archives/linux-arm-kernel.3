Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2400C5DF6D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 10:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T3ygx2YBagS7ZdoNXD3rWIKBdEDYy8M4TiSiWcSBeQs=; b=hmwk5qxuoc2hapS9wLfa4tVY27
	nxSUTd/RYH2L4OVapgOfvYNZeYsEf4mZWGEOf5jtrKC6Oizdk1XeMq/ojt/mAmH3bElMwvL46vW8+
	8yk8SHWrsxSooj1Au1A2ht/+5W3qR3fjT/hYckp3L/JTXjHQjpoUWNuGYYS6L8mLRP+IPocevEkp+
	ijibjU9IKNjL9rSUaa70GmHNeFpzsvAFest2GSGxHvzy34YX4c8zjVLV6N2QYsjJVLqu4sEGG3yhf
	HHaQPRRBHnP7gd6tUVRaUYTZ1nFENc0DEHfa+wISn9dXQeUBbqdg4SZQnveMfjogOeZ3Rgmvzhe6k
	UblA7v+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwdX7-00000009Y2n-0q8S;
	Wed, 19 Aug 2026 10:28:33 +0000
Received: from out-208.mta0.migadu.com ([2001:41d0:1004:224b::d0] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwdX0-00000009Xzi-1rSy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 10:28:29 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=gt4LUz6h5wdD5n/G/j7Qa+IcB6A6stflUNl5aSZem7k=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787135304; v=1; x=1787740104;
 b=FNX+dtOP+BMnAoZhYheV5rHOmQpLGCMD7bFh0Y93NzumSAJC5xEDiumMv4QHlzPC96jWB6Uu
 5qJzRkNhMvCu4LLTBcntTd1U2VoHmzJy1LTzIxbC0+YXj27FajBiR3yBsjfHW1Pg28NzV92qsPt
 gjDxVs2r6iYd88uVarg7NGyo=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: from claudy.lan (37.156.72.212)
	by smtp.migadu.com with ESMTPS id 1b7461c5e495a37b;
	Wed, 19 Aug 2026 10:28:24 +0000
X-Migadu-Flow: FLOW_OUT
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
	Eric Auger <eauger@redhat.com>,
	Fuad Tabba <tabba@google.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] Revert "KVM: arm64: vgic-its: Don't save collections the table cannot hold"
Date: Wed, 19 Aug 2026 11:28:07 +0100
Message-Id: <20260819102809.310708-3-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260819102809.310708-1-fuad.tabba@linux.dev>
References: <20260819102809.310708-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_032826_655489_D313483E 
X-CRM114-Status: GOOD (  10.70  )
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

This reverts commit 9b10fb74e4b661543d188701bd4d024fc5c18f58.

Freeing the collections when GITS_BASER<coll> changes removes the state
this check rejected: vgic_its_cmd_handle_mapi(),
vgic_its_cmd_handle_mapc() and vgic_its_restore_cte() all validate the
ID against the current table before allocating, and the table can no
longer change under the list. What remains is a collection whose entry
is not backed by a memslot, which the write fails on anyway, so the
check costs a save userspace should be able to issue reliably and buys
nothing.

The reverted commit credited the check with bounding the walk as well.
It stays bounded without it: collection IDs are unique and each is below
the table's capacity, so the list cannot be longer than the table.

Suggested-by: Marc Zyngier <maz@kernel.org>
Link: https://lore.kernel.org/all/87ecg9owwa.wl-maz@kernel.org/
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/vgic/vgic-its.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-its.c b/arch/arm64/kvm/vgic/vgic-its.c
index 3339d9977af27..cc6ea5c3409ae 100644
--- a/arch/arm64/kvm/vgic/vgic-its.c
+++ b/arch/arm64/kvm/vgic/vgic-its.c
@@ -2535,9 +2535,6 @@ static int vgic_its_save_collection_table(struct vgic_its *its)
 	max_size = GITS_BASER_NR_PAGES(baser) * SZ_64K;
 
 	list_for_each_entry(collection, &its->collection_list, coll_list) {
-		if (!vgic_its_check_id(its, baser, collection->collection_id, NULL))
-			return -EINVAL;
-
 		ret = vgic_its_save_cte(its, collection, gpa);
 		if (ret)
 			return ret;
-- 
2.39.5


