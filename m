Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BBDBC55822
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 09:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rPDR+Ax2mjvgE26rYgUW+aQnYDPjJl0AyLsMcbzCS2k=; b=A5YE3si+9oa72YEu9UnM0RarWZ
	efr9zBBZa7cZOK9QsN5/snxf9BunK9VA28dncjGPHR5cVJOmxvBOR+eUVPhNt8sbKns18CbtPbRuc
	ZChStE5djo7mxrE7pLXR3gNYnniNQK8C6RGZ78YpbnXg5oRx/PET5l/lfEPdPuJ2i6rpCsNVANm/h
	EK8Lny7TOEzR01xrMmcfGrcbgabfOy865SBXC2Pfsfg31SWXFsIm6UxHkySSx2kNrt2y/wm/IuabK
	Bt7eHvpATF+WjGMMqvC+LGOuayIaiYkHye9kcuaXOiLWjvE8JcenUI8FGhZkqnM22JvN/fwEIXLrC
	qpRoLktQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrY5a-00000003dza-2f2s;
	Wed, 05 Aug 2026 09:39:06 +0000
Received: from out-173.mta0.migadu.com ([2001:41d0:1004:224b::ad])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrY5Y-00000003dxx-1K4b
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 09:39:05 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785922741;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rPDR+Ax2mjvgE26rYgUW+aQnYDPjJl0AyLsMcbzCS2k=;
	b=HKh4IXIvqrrAd7KFVo/dSmdjPRRZMObTmeFaKbo5EMkOmXXM+1o86Ee0aN/gyM/SzcPAnJ
	q68WWH/Xtvr3kpy/Mgn/KTFGjaWSu8EuI7GlcrwH4K1bz/0GzWHXWB1yrd3u9f935NnRB0
	jrFbV/x1AQD13RPGtMysx7Wje4vSNXM=
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
Subject: [PATCH 3/3] KVM: arm64: vgic-its: Don't write past the end of the collection table
Date: Wed,  5 Aug 2026 10:38:28 +0100
Message-Id: <20260805093828.3626610-4-fuad.tabba@linux.dev>
In-Reply-To: <20260805093828.3626610-1-fuad.tabba@linux.dev>
References: <20260805093828.3626610-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_023904_495756_39894B2D 
X-CRM114-Status: GOOD (  12.31  )
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

vgic_its_save_collection_table() computes max_size but uses it only to
decide whether to append a terminator, leaving the walk over
its->collection_list unbounded. A guest that disables the ITS and
rewrites GITS_BASER with fewer pages, VALID still set, keeps every
collection it mapped against the larger table, because KVM stores the
new BASER unconditionally and frees the list only when VALID is
cleared. A save then writes up to 448K past the end of the table.

The writes stay in guest memory, as vgic_write_guest_lock() validates
every gfn, so the guest only corrupts itself. Stop at the boundary
regardless and return -EINVAL, which is what
vgic_its_save_device_tables() returns when a device falls outside its
own table. -ENOSPC describes the condition better, but -EINVAL is
already in the error set documented for KVM_DEV_ARM_VGIC_GRP_CTRL,
and -ENOSPC is not.

Fixes: ea1ad53e1e31a ("KVM: arm64: vgic-its: Collection table save/restore")
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/vgic/vgic-its.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/kvm/vgic/vgic-its.c b/arch/arm64/kvm/vgic/vgic-its.c
index ed281fbf008b9..c709fc5e17cda 100644
--- a/arch/arm64/kvm/vgic/vgic-its.c
+++ b/arch/arm64/kvm/vgic/vgic-its.c
@@ -2540,6 +2540,9 @@ static int vgic_its_save_collection_table(struct vgic_its *its)
 	max_size = GITS_BASER_NR_PAGES(baser) * SZ_64K;
 
 	list_for_each_entry(collection, &its->collection_list, coll_list) {
+		if (filled == max_size)
+			return -EINVAL;
+
 		ret = vgic_its_save_cte(its, collection, gpa);
 		if (ret)
 			return ret;
-- 
2.39.5


