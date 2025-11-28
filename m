Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7003BD116EA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 10:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ny2Z6mLWottV2YbnY97zrXCbswuCtztM4NoOFmDOekM=; b=U261JI3gm1GyNTh2Cqvcxkj3zt
	WAotm56Icnq9DL9UhHi5pE/XbSG9Wy53yQvcLfkIHosmGQkwSCy86FEnu2E0UnlPEsUG2Osu07q5E
	13SyEEESVS4sfYjv9G1GR5Ftg6bwYWmpcFVhL90uqOtk9PL7E1Bb/PpYAO0C6Zpcct3zkxjwxrX0K
	pMVTSRdDe4CvG2az/4EqU8njLrcz5BwTP0yf4m3BIQAwEUCEluKBBz0DOOe/i2/7JOaASJtATnZFR
	g0M83PQqsbXLA67bwOYnIAHU+HlJ7E4kTgNinXEqhKau/8t5N5iCV1lnXjgCt8z11EMofDsC09rq4
	UbixnlhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOvQm-00000000GXn-3cD0;
	Fri, 28 Nov 2025 10:10:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOvQi-00000000GX8-42F4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Nov 2025 10:10:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 26809176A;
	Fri, 28 Nov 2025 02:10:11 -0800 (PST)
Received: from e140010.arm.com (unknown [10.57.90.76])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1181A3F73B;
	Fri, 28 Nov 2025 02:10:10 -0800 (PST)
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: maz@kernel.org,
	oliver.upton@linux.dev,
	joey.gouly@arm.com,
	yuzenghui@huawei.com,
	suzuki.poulose@arm.com,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Subject: [PATCH 1/4] KVM: arm64: Document KVM_PGTABLE_PROT_{UX,PX}
Date: Fri, 28 Nov 2025 10:09:43 +0000
Message-ID: <20251128100946.74210-2-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251128100946.74210-1-alexandru.elisei@arm.com>
References: <20251128100946.74210-1-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251128_021021_047883_52D0AC87 
X-CRM114-Status: UNSURE (   8.15  )
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

Commit 2608563b466b ("KVM: arm64: Add support for FEAT_XNX stage-2
permissions") added the KVM_PGTABLE_PROX_{UX,PX} permissions to stage 2 and
to EL2 translation regimes, but left them undocumented. Let's fix that.

Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 arch/arm64/include/asm/kvm_pgtable.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
index d57c12f074a4..fc02de43c68d 100644
--- a/arch/arm64/include/asm/kvm_pgtable.h
+++ b/arch/arm64/include/asm/kvm_pgtable.h
@@ -240,7 +240,9 @@ enum kvm_pgtable_stage2_flags {
 
 /**
  * enum kvm_pgtable_prot - Page-table permissions and attributes.
- * @KVM_PGTABLE_PROT_X:		Execute permission.
+ * @KVM_PGTABLE_PROT_UX:	Unprivileged execute permission.
+ * @KVM_PGTABLE_PROT_PX:	Privileged execute permission.
+ * @KVM_PGTABLE_PROT_X:		Privileged and unprivileged execute permission.
  * @KVM_PGTABLE_PROT_W:		Write permission.
  * @KVM_PGTABLE_PROT_R:		Read permission.
  * @KVM_PGTABLE_PROT_DEVICE:	Device attributes.
-- 
2.43.0


