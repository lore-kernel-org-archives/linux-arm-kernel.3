Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E7EEEE6B66
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 22:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fwjyN5rpDcNi8tXSt2MvaZ0hjN7yLCQAealBMMe+n+s=; b=xe3gsGsymHGQXvsd0TCOZeoFPq
	5r04xOUdNQVTIeYUdHs3mvBY0vJzorfEN5ZzND/gDr+7SHVzer2UpWovGBMcPLy0DBDoXB5biRbFx
	delkZHb4EkTL90Jp3g/5yOnGn285XMzHYCKVcftYWLKwwNdNmZbWyG4X5N5r4z9nZEag3gogvUwBj
	V0B5/JUc5AOHCEla1iZ7eDlsU0pnMpSpa7KCswESv0R4z2jPkNapgfvXDnPaNX6txn59ErWFS6ZP+
	15GOxo+jU/J4HxF/qj0Tao5c4qi/FUUoL40Eu7ib+ORU727UyRC7dDicSfM1Ys+w2KdFsKnXiLmzd
	VBO/NBJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voULL-0000000Bt1g-1acO;
	Fri, 06 Feb 2026 22:30:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voULJ-0000000Bt0q-1gCp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Feb 2026 22:30:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AB6E443D6B;
	Fri,  6 Feb 2026 22:30:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86A29C116C6;
	Fri,  6 Feb 2026 22:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770417024;
	bh=Z+P7HrDrYZhvrXjWO/SCgx6Wkp8oj6hqSqLe9QpQvAM=;
	h=From:To:Cc:Subject:Date:From;
	b=RZixVzDlQcmxliDsdgbBvba8CQr/38HpatiUFUEio41v7SzCNDKFkyw7r5mxlyWv2
	 BFuYfwiRfCZiBi0NFPJyT5zx9heNWOJ1Q2q/gn38L195rvAEFzMWi2vEn+9AJnBfao
	 +vjLEp+TI4VwQmYYm20rnp4aicmPAG1tiMlv6RAlJROYBBIZho71UEuEbrH8yCefLV
	 f4NagEmymUmRFHjsOIL/j6P4Upw/DFHiUuSdmMtYbf57b02LGp6wxN2fWhsFaVTwH6
	 NE0d17ppKXpdceoJc2URuqHFR7TR5XVR6jUxB9tsrKJIRvybfrjwjMFB+SuPpA1f4S
	 0W9S+nSw6FI0Q==
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
Subject: [PATCH v2] KVM: arm64: vgic: Handle const qualifier from gic_kvm_info allocation type
Date: Fri,  6 Feb 2026 14:30:23 -0800
Message-Id: <20260206223022.it.052-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1571; i=kees@kernel.org; h=from:subject:message-id; bh=Z+P7HrDrYZhvrXjWO/SCgx6Wkp8oj6hqSqLe9QpQvAM=; b=owGbwMvMwCVmps19z/KJym7G02pJDJlt2XXH+BYzTOSa/XXJ0Yj1H2MCn/2M2yqvucMk69/l5 YWT0sQ5OkpZGMS4GGTFFFmC7NzjXDzetoe7z1WEmcPKBDKEgYtTACbyKILhv/Pt5RPPBTXwM8wV nhicN3vj280Pa6e6sogzn/jy7ndLvzHDf693SgXyNXuSl138vm/+UYbU8w51X1lsDNb3/lgcLjT vKycA
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_143025_450428_4DBFFFC6 
X-CRM114-Status: GOOD (  13.22  )
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


