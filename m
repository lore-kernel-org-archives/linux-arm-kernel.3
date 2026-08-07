Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09E45C5AC7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 10:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FXAUwRKtIA0sEu908Fyzr1rasWtjR+9/qFmLbf34T8M=; b=u9x51yt82QLzv6jgNXl1YWhIYL
	Qb+SxQ37SOJkmEfqXWDF7qnKEt0jtYKfCzpj+Ox4BPqoB5zsfSwN4fE5/4LQEJa0LIp24zIN8N//J
	Eg/WWc+4i7tW9t/yMnhX4FWG5zXf7ADGugON/H1BZcfmFpcDh7Nk2uWT16ntRTOMkn8yx6K/3wJhc
	+G5uLOcp1MwG2DVEbjlUmfQIMmwAov7PduzPABwd7Zz40Gq6cRYUNhv54pDlzv0n/PIKXAa8mAil1
	TFBDdmOfzRIPlge5vFNsuX/nIxGuWlCHAAP6Gr1PdjYxv+q0Rr/fTgNzYFuF6IvD/l/5aQkmkBK+8
	wOmZochA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsI18-00000007hYU-2gjM;
	Fri, 07 Aug 2026 10:41:34 +0000
Received: from out-173.mta0.migadu.com ([91.218.175.173])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsI13-00000007hTj-3mPh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 10:41:31 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1786099287;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FXAUwRKtIA0sEu908Fyzr1rasWtjR+9/qFmLbf34T8M=;
	b=kyHH7hsLJROPYWYpdDqxaH6UQTXc3sRl2HQttC8Q+OCWBcKB3LHKv8tx9G3nVrgLbNGkO1
	MzUycBBIi52m5RAPF0d3UoQnyVoONLV2H9D5Y+5R0zq2fgDHiXrKQeCDAtipbRPQfU2CHs
	GVzmNRrVMC/0B422oEcoL07SZL6/x3Q=
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
Subject: [PATCH v2 4/4] KVM: arm64: vgic-its: Point saved ITEs at the next valid entry
Date: Fri,  7 Aug 2026 11:41:02 +0100
Message-Id: <20260807104102.2410744-5-fuad.tabba@linux.dev>
In-Reply-To: <20260807104102.2410744-1-fuad.tabba@linux.dev>
References: <20260807104102.2410744-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_034130_099150_4C5CF196 
X-CRM114-Status: GOOD (  11.66  )
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

An ITE whose collection was dropped is saved as an invalid entry, and
vgic_its_restore_ite() has no offset to follow from one, so the scan
steps a single entry at a time until it reaches a valid entry or the
end of the ITT.

Compute the offset to the next ITE that is saved as valid instead.

Suggested-by: Oliver Upton <oupton@kernel.org>
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/vgic/vgic-its.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-its.c b/arch/arm64/kvm/vgic/vgic-its.c
index 1589f06e66904..9e782a4fea7e5 100644
--- a/arch/arm64/kvm/vgic/vgic-its.c
+++ b/arch/arm64/kvm/vgic/vgic-its.c
@@ -2035,15 +2035,16 @@ static u32 compute_next_devid_offset(struct list_head *h,
 
 static u32 compute_next_eventid_offset(struct list_head *h, struct its_ite *ite)
 {
-	struct its_ite *next;
-	u32 next_offset;
+	struct its_ite *next = ite;
 
-	if (list_is_last(&ite->ite_list, h))
-		return 0;
-	next = list_next_entry(ite, ite_list);
-	next_offset = next->event_id - ite->event_id;
+	/* Point at the next ITE that vgic_its_save_ite() stores as valid. */
+	list_for_each_entry_continue(next, h, ite_list) {
+		if (next->collection)
+			return min_t(u32, next->event_id - ite->event_id,
+				     VITS_ITE_MAX_EVENTID_OFFSET);
+	}
 
-	return min_t(u32, next_offset, VITS_ITE_MAX_EVENTID_OFFSET);
+	return 0;
 }
 
 /**
-- 
2.39.5


