Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B688BC5AC80
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 10:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3nr/a0dOZRkxfGZoRpT42C6sSO2flc3qcvSm9XbBZls=; b=2ENclFWrkHZTqQ6xKeqMJCczMx
	dtjfAFTxoFTvlBGTEEjw5yzD1f5XYuZvD7MhzlZYQgdjdkgokLmM8ncn3mWz6Q0bRyJjDlsKdXXfS
	QWs2k6to/xM+tLU7+sCTtVRGg5rWX/Vmi+Y/g9ZV08f4UARLBzeAKMH0TulMPPZQEaD3JrxHwhvj3
	XNdSEcqQLVQYvrn8Vak/f0a0eZiC0B9H52PcFO0+d0/xEmZ5xvU6k7yvMnvOMihOCPnV/K05+3W0S
	hRFgCG5qTR1ykQxQFoP0qn4PMSz+I4bSeb52N4DEJNc6yoHtrD/I2m+BkiEqyy1e9y3fNDcqBKjxw
	wpH4YqxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsI15-00000007hVd-1pDN;
	Fri, 07 Aug 2026 10:41:31 +0000
Received: from out-172.mta0.migadu.com ([2001:41d0:1004:224b::ac])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsI12-00000007hSL-18Lr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 10:41:29 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1786099285;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3nr/a0dOZRkxfGZoRpT42C6sSO2flc3qcvSm9XbBZls=;
	b=iauK43LzFFEk438JMee7/pnVbCao2fOGE8Vj+GrWkJP5A0Ql9PLgc5IyAoOuBVwggvJdfA
	HVK7SqW89K8YcqJ26dFijI5Skizch3Z4iPLVIbhsp+0ddDrZN/lCmQ6/Eiqzujyjlblo/n
	9SxEuIcr5p0Fpn0X/UMATxCraq0ZnUU=
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
Subject: [PATCH v2 3/4] KVM: arm64: vgic-its: Don't save collections the table cannot hold
Date: Fri,  7 Aug 2026 11:41:01 +0100
Message-Id: <20260807104102.2410744-4-fuad.tabba@linux.dev>
In-Reply-To: <20260807104102.2410744-1-fuad.tabba@linux.dev>
References: <20260807104102.2410744-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_034128_483906_6608F078 
X-CRM114-Status: UNSURE (   9.85  )
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

A guest that disables the ITS and rewrites GITS_BASER with fewer pages,
VALID still set, keeps every collection it mapped against the larger
table: KVM stores the new BASER unconditionally and frees the list only
when VALID is cleared. vgic_its_save_collection_table() then walks the
whole list, writing up to 448K past the end of the table, and saves
collection IDs that vgic_its_restore_cte() rejects, so the save succeeds
and the restore fails with -EINVAL on the destination. The overrun stays
in guest memory, as vgic_write_guest_lock() validates every gfn.

Validate each collection against the current table with
vgic_its_check_id() and return -EINVAL, as vgic_its_save_device_tables()
does for devices. Collection IDs are unique and the collection table is
never indirect, so the check also bounds the walk.

Fixes: ea1ad53e1e31a ("KVM: arm64: vgic-its: Collection table save/restore")
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/vgic/vgic-its.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/kvm/vgic/vgic-its.c b/arch/arm64/kvm/vgic/vgic-its.c
index ed281fbf008b9..1589f06e66904 100644
--- a/arch/arm64/kvm/vgic/vgic-its.c
+++ b/arch/arm64/kvm/vgic/vgic-its.c
@@ -2540,6 +2540,9 @@ static int vgic_its_save_collection_table(struct vgic_its *its)
 	max_size = GITS_BASER_NR_PAGES(baser) * SZ_64K;
 
 	list_for_each_entry(collection, &its->collection_list, coll_list) {
+		if (!vgic_its_check_id(its, baser, collection->collection_id, NULL))
+			return -EINVAL;
+
 		ret = vgic_its_save_cte(its, collection, gpa);
 		if (ret)
 			return ret;
-- 
2.39.5


