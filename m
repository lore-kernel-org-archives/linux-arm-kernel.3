Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8B8606D806
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 23:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ykn86qG+;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g4tfZ07T
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=BUrKgGzA4bbshZplaDoxIhNoQLXgAtDMSDD/aApCg/Y=; b=ykn86qG+Lgp/mvwFJUT/QxhEYa
	SJJWPiNqkz0WW8oS6EzEc3O/7necCTU97OvnpHGcTEigZWLJhB3TIJnUGXPOtzOf8l36EhjZv7pUu
	gJIe0gjb0fbnpGBKN3cAxOkUyt/IOE5sQGzTp9XuAtAUmEQH5bxGb5xYEOflBw05jzRWSP1wdVbMX
	95kPscOvQWQRdkt+O6MXv328wW2NcUOTRrVQEJputX/Et4Jq/K/s7uCBWkvlRIU6n8fUkxwbNKFLV
	TBQ2i2vfo/lkV8PwtG9BfPsqraQ7a17ax6vi/tBg0zlIdF3HyOSkZ2J/f48Swg2UWpODZnC1jsGUJ
	tO2R3UFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP6Qw-0000000AqBP-2dKF;
	Thu, 05 Nov 2026 22:59:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP6Qv-0000000AqB2-3OlG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 22:59:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 81D9C42378;
	Thu,  5 Nov 2026 22:59:49 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793919589;
	b=PFQALOieoYNrqozxl52VwVusyCOEXfWDwZpbqzrQ62rUbSWFSp6SDxw18cFFLO1VmiFC
	 orujH7edfB3aguA+EBiL0hQvma+zld9Nw77tuBC+ftq3GeScDM9/D+SwOCuGFYAU/V5TX
	 /P0QUrqc5s0Jkfz0zrvrX+kKQWcw/EOk/+7zrGWA0tG1PL0HsXLtom7WpzVpFZDDJSBTB
	 vnGu3lqWzN290bNMzP4uwzXZXJiDvU5FE3nhjX5GZ0V3cMYHKnlPJfOsTWwwY2jMbtE+u
	 PwnGZQPdUyNzKVxlxSlcJ+i8BD0OV+T3QT+GVNkDpJLLX8VlYmWW9E8tNB2zfYqvBXg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793919589;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=BUrKgGzA4bbshZplaDoxIhNoQLXgAtDMSDD/aApCg/Y=;
	b=mpo7sB7a5MIlM3G7kLzPCEIC6JlvrmQynyVSvdGce1C1OqVWObV3bCvxT9mbFr0da1dd
	 UHhKf2a7VrT+Uzh1t7OrmwWTv5wqgmNdyFLH43b+UuvXthpL3NQsSuHHfxnc88+vcHRw3
	 kjQ5po5H0bVB2bqKBtppmC0Nrp7ZhRk4rpkG+5PWCf88MpzD/6z4GsdRJaAiNtW53BLiO
	 0WksetqYb+phvKQHf41WzwHiy/bzw/Ojb7/kRvBqs14zyZnPia202sJGwgfEbFiuF+l05
	 N0WHYmWXaFEvObVmE7+61zBvsiJsSLQ5bYIW7wpfrcn73U//k0rFProNVDDEJ0sTgwQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7276D1F0089F;
	Thu,  5 Nov 2026 22:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793919589;
	bh=BUrKgGzA4bbshZplaDoxIhNoQLXgAtDMSDD/aApCg/Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=g4tfZ07TvA13GbI7bfVzM2uk1qTqlhMSMPmBfi1OPqi4wCueN9Zdg3WAHWO4FDRAv
	 /gtuPeJv89sjVPh4rle2di+pT2HSO12x7KmfNbCJprnWySQ0HJOurk9CFol4p2Foso
	 l2gaLF+VadXnqp1HpnZqG3adyTEW8JWbFziApBf31s5CsVDFvHQycTaKdDQhSRVg4B
	 vy689UK5cenTGzqC1oh7kqFyIileag9+cqRPQMwEKc9VaMs5ncigccv5hAs0B/XoLb
	 hKD5cN+zO8CZD2v1ai0iEeIXe9TKJBZkSSFNRwwB3amNj94bDLuKQaKCxBcfbwwJKN
	 uUAhwhMRBE0lg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id EFBD245AD7;
	Thu,  5 Nov 2026 22:59:47 +0000 (UTC)
From: Xuheng Li via B4 Relay <devnull+xuheng.cs.columbia.edu@kernel.org>
Date: Thu, 05 Nov 2026 22:59:49 +0000
Subject: [PATCH v2 2/3] KVM: arm64: Check the host stage-2 PGD allocation
 for NULL
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261105-hyp-pool-and-map-v2-2-44a6ca90190b@cs.columbia.edu>
References: <20261105-hyp-pool-and-map-v2-0-44a6ca90190b@cs.columbia.edu>
In-Reply-To: <20261105-hyp-pool-and-map-v2-0-44a6ca90190b@cs.columbia.edu>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>
Cc: Quentin Perret <qperret@google.com>, Will Deacon <will@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Mark Rutland <mark.rutland@arm.com>, Fuad Tabba <fuad.tabba@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, kvmarm@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Xuheng Li <xuheng@cs.columbia.edu>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793919587; l=1285;
 i=xuheng@cs.columbia.edu; s=20261028; h=from:subject:message-id;
 bh=XdIMBDSmGASRQbiHAq1YVe0xT84zqEKj8tGXxAjv0Fc=;
 b=IYseq6oMUYI7xPYqCu8HI+7gkAetQ3w4+ns34XBkZMS+HEwhZqz0Z138syy5KpNwBdnAztEdM
 r1OLdD/vZpkCRRh+5QHK3jlPcBtikNHnddgDeUPNg9SF53GdH3JP63Z
X-Developer-Key: i=xuheng@cs.columbia.edu; a=ed25519;
 pk=L1HVV+goqxYmEMO/OXakL6uf9isSpgk2QrLlFqyZ2Qs=
X-Endpoint-Received: by B4 Relay for xuheng@cs.columbia.edu/20261028 with
 auth_id=1349
X-Original-From: Xuheng Li <xuheng@cs.columbia.edu>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: xuheng@cs.columbia.edu
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Xuheng Li <xuheng@cs.columbia.edu>

host_s2_zalloc_pages_exact() passes the result of hyp_alloc_pages() to
hyp_split_page(hyp_virt_to_page(addr)) without checking it for NULL.
If the host stage-2 pool cannot supply the PGD, hyp_virt_to_page(NULL)
yields a bogus struct hyp_page, and hyp_split_page() reads and writes
through it, which ends in a hyp panic during pKVM initialisation
although kvm_pgtable_stage2_init() is prepared to fail with -ENOMEM.

The pool is sized so that this allocation, the first one made from it,
cannot fail, so nothing in mainline reaches this path once the pool
size is computed correctly.  Return NULL early anyway, so that a
mis-sized pool makes initialisation fail cleanly.

Signed-off-by: Xuheng Li <xuheng@cs.columbia.edu>
---
 arch/arm64/kvm/hyp/nvhe/mem_protect.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index d4c332a91..ee0848f2e 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -85,6 +85,9 @@ static void *host_s2_zalloc_pages_exact(size_t size)
 {
 	void *addr = hyp_alloc_pages(&host_s2_pool, get_order(size));
 
+	if (!addr)
+		return NULL;
+
 	hyp_split_page(hyp_virt_to_page(addr));
 
 	/*

-- 
2.53.0



