Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF7CDEE6B68
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 22:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fwjyN5rpDcNi8tXSt2MvaZ0hjN7yLCQAealBMMe+n+s=; b=KRQl6gyayGPxLrGpcLUo/k+0To
	f2u1wEu2BCfRrj3lll7eozNriEAmYdwflkgp2ww9hGPjKb+knoB8+lzUGhMCLU6jca+Y6ApzDohVv
	xSGHYyHH7ARHChpSPgDSf9B8ImNdysL5bsPtyxkvsQqXA+s5RoxxDW71+Xa5QwcxLMzDePl6FTBrO
	BhDiq20VrpRi9fFvsGXKJ3aO8fZu308J7xpVgiG9xAroqgigloVFL/NkjB9vzwno7bFv23Ebl/Pfo
	dU4q7t2Ls0jVDJqKEGFfp2L83aJ6vErmFB+lklIOe+0cHHEje946kmquNGHMqUQEdzlaWCOu3bIOj
	bA1qwyyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voUHy-0000000Bsdp-0jm1;
	Fri, 06 Feb 2026 22:26:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voUHw-0000000BsdK-1vPG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Feb 2026 22:26:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 15A1540D5B;
	Fri,  6 Feb 2026 22:26:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB44CC116C6;
	Fri,  6 Feb 2026 22:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770416814;
	bh=Z+P7HrDrYZhvrXjWO/SCgx6Wkp8oj6hqSqLe9QpQvAM=;
	h=From:To:Cc:Subject:Date:From;
	b=M/maTH/1GyOlJkiHrZKDc6WK0xeBjxKw1HvwqPCvah5JK1++SWHgWMbV3Y0mSGTjK
	 CpZZXdUyhd4rU410K1s3yW626p1577koXehF3YkzRVQ8p8ORHQfwlNvphsqbC398aC
	 q5SVGaB23LNdFvF8/d8WsN+JsU+LwPDKSmSgCqw5QYRO9kVM5xLM+Y6BUjKHOxwdhd
	 Xs7uJ+Ia0OCGL+oAweuGhGdb/ltItYQ2owycnyHTlSNzmf2iLJPB4LYobVkfoLUesK
	 Ga6njLR/hvHpNCFpoRx/00jjo3lXCc4XB0ozknFOSmCxObWz8oiIhgEjSEv6rYeuDr
	 +0RE1J+g3K06g==
From: Kees Cook <kees@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Kees Cook <kees@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Alexander Potapenko <glider@google.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	Timothy Hayes <timothy.hayes@arm.com>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Keir Fraser <keirf@google.com>,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH] KVM: arm64: vgic: Handle const qualifier from clusters allocation type
Date: Fri,  6 Feb 2026 14:26:53 -0800
Message-Id: <20260206222651.work.438-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1571; i=kees@kernel.org; h=from:subject:message-id; bh=Z+P7HrDrYZhvrXjWO/SCgx6Wkp8oj6hqSqLe9QpQvAM=; b=owGbwMvMwCVmps19z/KJym7G02pJDJltWWsm2YrXNq9aeMTh01VWJk/NwpdsFbfYLBvUdOU+z V628/m8jlIWBjEuBlkxRZYgO/c4F4+37eHucxVh5rAygQxh4OIUgIk8fcHIcDYzXplRz27B+tNP fjwydD3mzqdebzrJ5XL6Fjaj7Ik3eRkZntRbnppy8lRV/s+d/65kK+3+OYHpxeIJE5m56m7etGD azwIA
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_142656_541556_BBB4CC0C 
X-CRM114-Status: GOOD (  12.91  )
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

In preparation for making the kmalloc family of allocators type aware,
we need to make sure that the returned type from the allocation matches
the type of the variable being assigned. (Before, the allocator would
always return "void *", which can be implicitly cast to any pointer type.)

The assigned type is "struct gic_kvm_info", but the returned type,
while matching, is const qualified. To get them exactly matching, just
use the dereferenced pointer for the sizeof().

Signed-off-by: Kees Cook <kees@kernel.org>
---
Cc: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Zenghui Yu <yuzenghui@huawei.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Alexander Potapenko <glider@google.com>
Cc: <linux-arm-kernel@lists.infradead.org>
Cc: <kvmarm@lists.linux.dev>
---
 arch/arm64/kvm/vgic/vgic-init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/vgic/vgic-init.c b/arch/arm64/kvm/vgic/vgic-init.c
index 86c149537493..a53f93546aa0 100644
--- a/arch/arm64/kvm/vgic/vgic-init.c
+++ b/arch/arm64/kvm/vgic/vgic-init.c
@@ -654,7 +654,7 @@ static struct gic_kvm_info *gic_kvm_info;
 void __init vgic_set_kvm_info(const struct gic_kvm_info *info)
 {
 	BUG_ON(gic_kvm_info != NULL);
-	gic_kvm_info = kmalloc(sizeof(*info), GFP_KERNEL);
+	gic_kvm_info = kmalloc(sizeof(*gic_kvm_info), GFP_KERNEL);
 	if (gic_kvm_info)
 		*gic_kvm_info = *info;
 }
-- 
2.34.1


