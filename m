Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53A54C5DF87
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 06:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=US+vjSEcS3cjXw07qmheRFhsDdHEZnGUsdfTV1Oajdo=; b=hXXS0qqg9uYx6Q8hZuOt56WnD5
	X/D+AdrRB8Emqz209yXWUphD2s2vJ6HDESmpW5RfnbGJTsp0HFzeb7mrdz1QVI1YfxCgJxLOlwI2l
	jPwLRrZRjeIq5Iid3joxcDjcez40SkOJC5M891+mecTLv0g1FsI3wKuIcrpq5NXY8IvlNIPTVVI2Q
	MSz7T0i98krnxiJDDoT5O+IHRdOgLJ/J6DORAv7kbmJtehSxHF87LtIzu29MLbd1xbPDzZy8QiZzA
	e9dbvrhqJbhIR0RKTxbuLb/yrrFq/sU9UXprH2K7lyBHYSTt7YtBIfql/PCXRuDMd4fkh1BYPVuR6
	OjcpIy6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxJ01-0000000CeP4-412A;
	Fri, 21 Aug 2026 06:45:09 +0000
Received: from out-232.mta0.migadu.com ([2001:41d0:1004:224b::e8] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxIzu-0000000CeMG-1zib
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 06:45:05 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=s01m9l8EYn7yXOYXD4CsQkn4QNAqwH/gr7B+G//pUqA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787294700; v=1; x=1787899500;
 b=YYBaX/8oFq2LooNBO1OCp7sEYSAVQo7G89Ire0i3o/ERYRddb+mjVw3557Gb165+pqd1byx/
 EtKVilFxs5nIvPC+EB7L3RNSX6djfr35a5qUwqo7XTu/Rnrya1E0GeOZhX8TuaUs7mXS49QqX/P
 sZcV9gcNzXpVoxnQkhKH5Hlc=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: from claudy.lan (37.156.72.212)
	by smtp.migadu.com with ESMTPS id 22874c4fdda4c102;
	Fri, 21 Aug 2026 06:45:00 +0000
X-Mizu-Trace-ID: 22874c4fdda4c102
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
Subject: [PATCH v2 2/4] Revert "KVM: arm64: vgic-its: Don't save collections the table cannot hold"
Date: Fri, 21 Aug 2026 07:44:43 +0100
Message-Id: <20260821064445.615838-3-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260821064445.615838-1-fuad.tabba@linux.dev>
References: <20260821064445.615838-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_234503_691973_BB938DD9 
X-CRM114-Status: GOOD (  10.34  )
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
index d5ede640812c4..f702ac31b8b1b 100644
--- a/arch/arm64/kvm/vgic/vgic-its.c
+++ b/arch/arm64/kvm/vgic/vgic-its.c
@@ -2537,9 +2537,6 @@ static int vgic_its_save_collection_table(struct vgic_its *its)
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


