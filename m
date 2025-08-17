Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E25BBCA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 Aug 2025 20:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e0QNMhV/M9OVqh2YUk+/5GFzaAlej2BfgiyW1K3U5NE=; b=SU253jgN+iIuGVjabAlgTjMHKI
	mujNAw7zjhpqRK3y7BV5X48uFzFZpkUfs+et3ySt6QeH+wXrPo5WBVq5SewItwbW6j/Qi06KYgVvr
	mYG8uj/VgOM/f+dyBTiXGsSE6NdD+1Ww0Vsoi6LVJ0riS1o+NV8iNYw4Od/5SmefxEum0o3Bl5c+9
	HZf+cuLxcv1FrOcVEx59mafO+TvtEumd68NRTvCXBtRQ4D3UYcoUMj7XcZ9Ukl99WmdZjXm3sZbZG
	gUUvdfkgzepneNo61C9rc2Frm4GKWoUD0vAYqo+qkq6SwEx3mD8WkNKDxKau1pUE0ufk9kwiZraZQ
	V+Bwy1Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unjyO-000000061AG-1h6o;
	Sun, 17 Aug 2025 20:27:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unjtH-000000060QY-1uID
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 Aug 2025 20:22:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3E0D445CE5;
	Sun, 17 Aug 2025 20:22:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5064C16AAE;
	Sun, 17 Aug 2025 20:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755462125;
	bh=eANUx6yTarI1XjY5Wc/aBHqOLih6GMKUKHwFun94n8E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ppa3LlJYYgfSUE4g1fr7+b+tcGNtLQaSFlPVWC/hL87P8G65Zci7b5sY2DHnAhHyT
	 FNC7gnf6hgjfwsyaneyb46XO37inhwMu7sR6UJVYc7mX8QzZ09tqoc9WoYaY3DuPC3
	 5p/Cje1+mvxJ1ZrIOBlB0TANmyqhTDm1P75fPxdZ5as06MQfPK4KZxwHyG1AJHVp/G
	 /oXUZoJ+2CgdSOVFY1siRkxWk0XMxzguiYOB4AplsGCdtEAp3TYUpm3MXFSOqqLh4z
	 NURLw+hMiR8VhjaSyt7X802DhNj7qLJnbiSy0Fe9ZkKYNdK6kq4ZdD1bxcO5ySK0Up
	 rwqOXHUtr5Z7g==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1unjtD-008PX0-Gx;
	Sun, 17 Aug 2025 21:22:03 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH v3 3/6] KVM: arm64: Ignore HCR_EL2.FIEN set by L1 guest's EL2
Date: Sun, 17 Aug 2025 21:21:55 +0100
Message-Id: <20250817202158.395078-4-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250817202158.395078-1-maz@kernel.org>
References: <20250817202158.395078-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, will@kernel.org, catalin.marinas@arm.com, cohuck@redhat.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250817_132207_522716_DE5E4F1F 
X-CRM114-Status: GOOD (  12.19  )
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

An EL2 guest can set HCR_EL2.FIEN, which gives access to the RASv1p1
fault injection mechanism. This would allow an EL1 guest to inject
error records into the system, which does sound like a terrible idea.

Prevent this situation by added FIEN to the list of bits we silently
exclude from being inserted into the host configuration.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/hyp/vhe/switch.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/vhe/switch.c b/arch/arm64/kvm/hyp/vhe/switch.c
index e482181c66322..0998ad4a25524 100644
--- a/arch/arm64/kvm/hyp/vhe/switch.c
+++ b/arch/arm64/kvm/hyp/vhe/switch.c
@@ -43,8 +43,11 @@ DEFINE_PER_CPU(unsigned long, kvm_hyp_vector);
  *
  * - API/APK: they are already accounted for by vcpu_load(), and can
  *   only take effect across a load/put cycle (such as ERET)
+ *
+ * - FIEN: no way we let a guest have access to the RAS "Common Fault
+ *   Injection" thing, whatever that does
  */
-#define NV_HCR_GUEST_EXCLUDE	(HCR_TGE | HCR_API | HCR_APK)
+#define NV_HCR_GUEST_EXCLUDE	(HCR_TGE | HCR_API | HCR_APK | HCR_FIEN)
 
 static u64 __compute_hcr(struct kvm_vcpu *vcpu)
 {
-- 
2.39.2


