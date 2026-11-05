Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 952CF606A326
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 22:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aYqre9al;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ReWuArwn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=clOx71cOsA26RUdAeVKpCY0AdtjlbFGk/TTkJ7LEcnk=; b=aYqre9al7tf2r1x1rkCWNMYOAd
	3YJH1/l8IV9ZANdwpQMUN6fm+C7mQqfRRV8JbKvUTzPLJe+CQObuKYyEDrjXke0uaAZw9umS4pc+c
	hu2DDDvCBwhHrLMgGVDed89UVDDSiFdP/E+TUBBSC+iED/3zUAyPFA1S3CLu+49HlPtyvEArNE42a
	wa3Lq9ATqwqpjQbKkvs7LkLNt5omQ0fMonitziMEe4Ow8UAbr5N7ZzMa9c7HGapZ8vf43lAXkujsO
	uVksjwlYYNBRHk754wf562sUvsJs3AIg6LXfp0iJuHLoKe6lwiqsGX1GckcDO9E4xP3TZVptCqU1a
	hl4yiJLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP5x5-0000000AncD-2LUs;
	Thu, 05 Nov 2026 22:28:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP5wz-0000000AnY9-0DEn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 22:28:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7E60160204;
	Thu,  5 Nov 2026 22:28:52 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793917732;
	b=EJ5gd9UzY71FmtSTwEk+5BdYKQihEhXl/uuLVwj6kuRTivj9j3OMs+xQitSEsfBB9RvY
	 haRj6wSmBh8p1QjtrWxTAYZkMnHZYXun1I0/c1TUAMigP5lPwqbojciCY+elXJs9+lHC3
	 ARG3mCkIjZShdo1dhzPjFd8dMxKWam4E2x0yDIkkF4/NzL4vHH93zHnjd2+S2y6Jqz9bq
	 Z548eaX9N74jwmuLNxeXZR+b7IPh48wdzJsfTab0zkkatRqKHfCHwyLbT/oEFqjz/eCLM
	 f2ABECWvcOPbP8BVfGB6ZGVG70HI055JuU1pZBjJrPpGfDs3VYU6FOGso24EFq22fYA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793917732;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=clOx71cOsA26RUdAeVKpCY0AdtjlbFGk/TTkJ7LEcnk=;
	b=pdr4pDxuSat+VWi4tnPYkqvRrtG2dpoqFeSWZvcjh4ahACla/IbfzRunxOxvoyRVH5xV
	 0oMCoVUChevxOcpvcl7HfgWUhMFZphdjbh7NBoAKhaAD5kwtWTgkYJ6kLqzSFQSYQhvaP
	 hWF30kHa6PNRyl/W4j6Ls2BW8ZtCCLhyQuHSdeN50Jqch5zwYMl8CuDG1E+K9c2bFXhDD
	 gXZxs025B+P7OdaFTtf8S3RWtorFtd7lNT1op2+rc/dk5QXeGQbo1fKKZWpVlooMqgAew
	 4TvqoV3TAN+Ho29BFJN29t+e40hsgPes7tvBbCBKObkOpSjJILH+P7Jo2+b3p/uVyDA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 88E161F008A3;
	Thu,  5 Nov 2026 22:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793917732;
	bh=clOx71cOsA26RUdAeVKpCY0AdtjlbFGk/TTkJ7LEcnk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=ReWuArwnr+EHGAIVc8HAF+mBYh2t22rclI5IhGpedr+nV2jtfAuB5ukOGGleLAkGf
	 maByrPA7bXglF6Gd8knsW6B+tA/UaS5mFwzG3fKlNmPgC9ZTeraTiVB8YDHtYbH9ik
	 JOBiCpeomVOcUYjsJCUVG7oQKLv4TlcJA2NbE8vaOmIYYCZW29MjdMFbmvzGw0U9QI
	 qR1xLuKwYF85MpCljOH1g1gI7/r7DfkiOksWKVRaw3bFZw9PlYguqE13WOCJTTbLwe
	 f0bNmC5+l3H4YYWHIVNUJNDahOJQ2QBSaFDPl9h4GdrK6nHsiWi/byk4/ar+ORwZrr
	 i/PxDxzl0d1jA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 14C5945ABF;
	Thu,  5 Nov 2026 22:28:50 +0000 (UTC)
From: Xuheng Li via B4 Relay <devnull+xuheng.cs.columbia.edu@kernel.org>
Date: Thu, 05 Nov 2026 22:28:52 +0000
Subject: [PATCH 3/3] KVM: arm64: Don't replace a valid hyp block mapping
 with a table
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261105-hyp-pool-and-map-v1-3-756bb5d8e067@cs.columbia.edu>
References: <20261105-hyp-pool-and-map-v1-0-756bb5d8e067@cs.columbia.edu>
In-Reply-To: <20261105-hyp-pool-and-map-v1-0-756bb5d8e067@cs.columbia.edu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793917729; l=1509;
 i=xuheng@cs.columbia.edu; s=20261028; h=from:subject:message-id;
 bh=UqwLIs4gUAaU1DFo5IEMy2L+DohqOBeFqpV1fxyeXnM=;
 b=FLN/1if17KjTwirD2Rz8VRHYWeTjz3nnWvVapf24PLDZ6KrUxmcPXokTdK/ubpqkdY/77p2E9
 1RZwNGDprENAgXH5e7C9pN2Tbjy7DQw92MVuxGaz0HR/0ceepxq2bIW
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

When kvm_pgtable_hyp_map() is asked to map part of a range that a valid
block mapping already covers, hyp_map_walker_try_leaf() declines, as the
request cannot be a leaf at the block's level.  hyp_map_walker() then
allocates a zeroed table and stores it over the valid block entry.  The
walk descends into the new table and maps the requested pages, but the
rest of the block is now unmapped, and the valid block was replaced
without break-before-make.

No in-tree caller maps into an existing hyp block mapping today, so this
cannot be triggered in mainline.  Fail such a request with -EEXIST
instead, so that a future caller gets an error rather than silently
losing the rest of the block.

Signed-off-by: Xuheng Li <xuheng@cs.columbia.edu>
---
 arch/arm64/kvm/hyp/pgtable.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index 9c83837b1..4c731b101 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -434,6 +434,13 @@ static int hyp_map_walker(const struct kvm_pgtable_visit_ctx *ctx,
 	if (WARN_ON(ctx->level == KVM_PGTABLE_LAST_LEVEL))
 		return -EINVAL;
 
+	/*
+	 * Replacing a valid block with a table would need break-before-make,
+	 * and the new table would leave the rest of the block unmapped.
+	 */
+	if (WARN_ON(kvm_pte_valid(ctx->old)))
+		return -EEXIST;
+
 	childp = (kvm_pte_t *)mm_ops->zalloc_page(NULL);
 	if (!childp)
 		return -ENOMEM;

-- 
2.53.0



