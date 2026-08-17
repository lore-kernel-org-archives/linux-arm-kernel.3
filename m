Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DF89C5DF70
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 09:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kJpES4C9O4YrVkJIN7nXhM1hcQWXRWHWBBA5SG2W+iI=; b=OzJSjsntoU1niXK5R3LPvl/kEU
	vUcqBpVlMhVe/2SS8D8FUjQ2dFafOAXrI+tQbZQWZcSIsz4pTwesJsTDRG4SSwgqlbL7cqdkPxDLg
	6J9PyGtLHefOHwnDeex9HJV5b4BDraxfi9mu3BePrCCAiZGV0xvp3dIhiTskO9ZK2plooA9I5Bz4k
	b+JkDpNF3vi9lHtu07PGQZb0ERCP87Y/0X7d8ZZXKXxNEL9y5T2fM+Ks0ZrsymMa5jJsaDLR7FsQ9
	iXmVjbj+qeHLZ/eszYQYEpoG7XJKuNgsjguFITsVtjD8QppvipsbG2HYjfRliMchHwvLTttAIKTmP
	O60N/Eiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvtch-00000005oNy-2OjM;
	Mon, 17 Aug 2026 09:27:15 +0000
Received: from out-40.mta0.migadu.com ([2001:41d0:1004:224b::28] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvtcd-00000005oN7-3p4D
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 09:27:13 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=+dxV1ztXc/nHuz2DsiaVJGccpUO0LYuVfovfEcscX04=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1786958828; v=1; x=1787563628;
 b=ayDAGIY37NhmHPH/8YfuOBrRFQb75dL1KL43PYagWL8Sz4Ggbe89IYHlJsGhuxLswZHmCG6R
 Xuwg3VFC/+ufw4jusQ2mdn8NNCVMEY+SEemVIckExIkxonV/bZwhbeiJCEhUw9aL5aUnOr40upJ
 U+SHj0X3NHQzVwOVa7CDayeQ=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: from claudy.lan (37.156.72.212)
	by smtp.migadu.com with ESMTPS id 940d36e792b6947f;
	Mon, 17 Aug 2026 09:27:07 +0000
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Eric Auger <eauger@redhat.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Will Deacon <will@kernel.org>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Sebastian Ene <sebastianene@google.com>,
	Fuad Tabba <tabba@google.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] KVM: arm64: vgic-its: Reword the comment on a collection-less ITE
Date: Mon, 17 Aug 2026 10:27:05 +0100
Message-Id: <20260817092705.1112634-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_022712_149639_A8698FBD 
X-CRM114-Status: UNSURE (   9.60  )
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

The comment above the NULL collection check in vgic_its_save_ite()
names only MAPC with V=0, which is UNPREDICTABLE. The route that
requires the check is clearing GITS_BASER<coll>.Valid on a disabled
ITS, a legitimate operation that orphans every ITE at once. Name both
routes.

No functional change intended.

Suggested-by: Eric Auger <eauger@redhat.com>
Link: https://lore.kernel.org/all/0ce5e496-a067-48fd-80d2-94fe9981d505@redhat.com/
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---

Notes:
    Based on kvmarm/next, since the comment this reworks was added by
    c6c156d931c3 ("KVM: arm64: vgic-its: Don't dereference a NULL collection
    on ITT save") and is not in a release yet.

 arch/arm64/kvm/vgic/vgic-its.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-its.c b/arch/arm64/kvm/vgic/vgic-its.c
index f6538b1976f9b..26c665e0a2386 100644
--- a/arch/arm64/kvm/vgic/vgic-its.c
+++ b/arch/arm64/kvm/vgic/vgic-its.c
@@ -2112,9 +2112,9 @@ static int vgic_its_save_ite(struct vgic_its *its, struct its_device *dev,
 	u64 val;
 
 	/*
-	 * MAPC with V=0 keeps the ITEs mapped but drops their collection,
-	 * and with it the ICID. Save a zeroed entry, which the restore path
-	 * reads back as invalid.
+	 * MAPC with V=0 and clearing GITS_BASER<coll>.Valid both keep the
+	 * ITEs mapped while dropping their collection, and with it the ICID.
+	 * Save a zeroed entry, which the restore path reads back as invalid.
 	 */
 	if (!ite->collection)
 		return vgic_its_write_entry_lock(its, gpa, 0ULL, ite);

base-commit: 57e7cf13ac26bf1a3dba6cfa601f7b2481811575
-- 
2.39.5


