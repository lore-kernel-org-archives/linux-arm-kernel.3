Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC443606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 22:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GSmf515+;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iA8AMR+H
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=BUrKgGzA4bbshZplaDoxIhNoQLXgAtDMSDD/aApCg/Y=; b=GSmf515+cDkWjJKjv8kTdtLMye
	KjiZMaDeeiXRyxEMkT+0TZ/5q3bhLIOvokHQ71rpp955vebBwBMc97hcidwKEITlulD888BRUEIw/
	B+TDa9M4lW3qdVSTX0vjQzgXyOREP7DVyulNYUHkmSMy5mZvqUJSWDDma/XTDyv/uO80QsFbKN2nu
	QWuFTFDdPbmCA+jvCxb/asUUOAkh6sWl/dYqrAfP5fIuQC9bgGKqgKoffE8ZcPEByq4MsKrunbom6
	oMBKUC8liZufpPfef6ms0Lv+0AYf4GqtrEHQZBHBrZ4MJ5cRYAYH/YGlVW81XGLRusV3wbW8cIHeF
	n+xdJbXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP5x3-0000000AnbS-2zEY;
	Thu, 05 Nov 2026 22:28:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP5wy-0000000AnY3-2oCQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 22:28:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CA1276020A;
	Thu,  5 Nov 2026 22:28:51 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793917731;
	b=qG+Uh4ECXfh5t97SnOnZzKzy0nLAwiX8OBw2fexDRYujDN+a+i09s40j/8QAr/XEUvrg
	 gLvg9dI70lHhHnq8b+HbV18/RSvtvzp8PF/74XzvJLC0WcS6Yfprxp40xHRRN7THVyB59
	 d/S2SUfGnjd7+qcZ4Mb3C3fU3FZu/uff47GEhBrgSJXc1eZMv4hIp3p3BytMLmUp4U5mW
	 LR9kgfqvo1cGGirhRMW0HcdxQdui8Ij/sGTCBXWFdUonaQa7H981Uvi1SNRMMKE/OufrC
	 Y6aHxQPaaZ9r9kwRm0JZpnBQpeHfTZzBRQeKU0kNayoVZ0pto+q0PS8jso91pnX1X+Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793917731;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=BUrKgGzA4bbshZplaDoxIhNoQLXgAtDMSDD/aApCg/Y=;
	b=SPg08KktR5zF3/iPiJ/F/WppIGXa2Kh2SXSV8mOWyLvTUU+OF+NIIqtT6Mhp9O/IcSpC
	 +oYd2GIXkw/S9aTxBF9IHdDFAughAhjz7jr2T6c5jaobRVC8M+iQKUmsw1RFRfSYzwDjH
	 NoTE8D1MctciDbQv1q8zKy9sey6ugNcCFv5nWseU21gJDilACmshE8LwZPVK/KYC5IhFK
	 kjS/Vs8CMq11+T9xwESdoYbMKtS722hZs1W+fU3Mq/XZVm76tHqz/c7/BCZVppdXafQab
	 n9B0Rma1Vk7jZ2gemL9BKIb409f3sDv++3PM81tAowCkyz5nnD+zbGPG+1EJsp1wJ5w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 79BBC1F008A2;
	Thu,  5 Nov 2026 22:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793917731;
	bh=BUrKgGzA4bbshZplaDoxIhNoQLXgAtDMSDD/aApCg/Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=iA8AMR+H7h7PBofyQ0b9o1dHQdNZsIQleHkRVExT0jYVwqUgD+WiuaUZCkjvjxVF4
	 IyS5h8/uHt3QicIwpqpxNwXKD/CquG1E5+y5QAzgPShfWtlBVZyHz+rHqEfKwxerRU
	 Xk+JPDL+PASifg46eZao/n8WArFhwNqFGAwBczeh1UWOHfM9LHgyJtQZE6RyKghpBf
	 wlZV1Sdndo0wAs657gEOJAyADMD8jx/ewIN4SYweUDnR9eaCVVvSAE2wtL/ccpHLA7
	 ECTP2mNo16XOoc27Zw749kDF8pr3uYVzRh+V/piU2+II9DNRSMWIwTj+ayys3sGCvr
	 7pviLfBK5cHAw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 0570045ABB;
	Thu,  5 Nov 2026 22:28:50 +0000 (UTC)
From: Xuheng Li via B4 Relay <devnull+xuheng.cs.columbia.edu@kernel.org>
Date: Thu, 05 Nov 2026 22:28:51 +0000
Subject: [PATCH 2/3] KVM: arm64: Check the host stage-2 PGD allocation for
 NULL
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261105-hyp-pool-and-map-v1-2-756bb5d8e067@cs.columbia.edu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793917729; l=1285;
 i=xuheng@cs.columbia.edu; s=20261028; h=from:subject:message-id;
 bh=XdIMBDSmGASRQbiHAq1YVe0xT84zqEKj8tGXxAjv0Fc=;
 b=zdxMZTP1ibxSaWoIJZCsCe1ZYXxUtb0lDuKtMIn1ad4RQ5OA8he3O6H1zy9UIpexvI1IJQU+e
 voejNVx2PkuDEQWrUzeAPzgPZ8jUMFUElP2T1SshCeE144SQiVs1u5O
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



