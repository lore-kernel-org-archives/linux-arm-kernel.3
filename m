Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2436D73604
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Nov 2024 14:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KVUate8IXpTBbdunUcVuF5j0MQrmSQF2pil6K03dYso=; b=JdRqeBj1oH99F5GcyVGK+MKw9/
	Or9/0C22hc4f4wti+2S6mioqUjUIjLj+hGaKcwlcJlk8ufG6O1W8vFquGN8aUIav+7mLp8NZHjhK6
	Pi2f/XnDW1dElMdOtcpGb9JQIje+6kg2Rrq9+xNW1fdoK4tF8+fGrxh6IrgVxXiABJHadtJMwQ79Y
	RtBR3bw2pETpS3eoqn9+6U4uLyK5vJe7NAy/2FCLgEqhO31p2ajYh+xBUt6bVw/daNY0QukPQROlg
	7j6svarZNrBrTAwPDB61IUtYk1mlHC8cqt/Ae6Ivvsi+PumnIKLjDqD5+Ecn8YQ5wZBy2kJANluOd
	qUQPmvkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHOqg-00000002BFD-4Buh;
	Sat, 30 Nov 2024 14:53:31 +0000
Received: from mail3-relais-sop.national.inria.fr ([192.134.164.104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHOph-00000002BAp-1lUR
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Nov 2024 14:52:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=KVUate8IXpTBbdunUcVuF5j0MQrmSQF2pil6K03dYso=;
  b=gv5W27rdpCkbRSK7XMVvcHiht2gPVnSfkqIwFyAKLkimob8gepRK/xD2
   dPQuJk8bbkIdhP+KmJyq8EF5Hegbhn28vix1h3Ve3VYjS717yVpRQrtCE
   u8O2PCw6ewh0RdQdlnG4JCGthkIID8p1HRu+76N+1BCnDKze8j3BBiaV5
   k=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=keisuke.nishimura@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.12,198,1728943200"; 
   d="scan'208";a="103063229"
Received: from nr-lil-536.grid5000.fr (HELO gros-67.nancy.grid5000.fr) ([194.254.60.35])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2024 15:52:25 +0100
From: Keisuke Nishimura <keisuke.nishimura@inria.fr>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>
Cc: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	Keisuke Nishimura <keisuke.nishimura@inria.fr>
Subject: [PATCH v2] KVM: arm/arm64: vgic-its: Add error handling in vgic_its_cache_translation
Date: Sat, 30 Nov 2024 15:49:53 +0100
Message-Id: <20241130144952.23729-1-keisuke.nishimura@inria.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241130_065229_881757_ED7F47E3 
X-CRM114-Status: GOOD (  14.30  )
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

The return value of xa_store() needs to be checked. This fix adds an
error handling path that resolves the kref inconsistency on failure. As
suggested by Oliver Upton, this function does not return the error code
intentionally because the translation cache is best effort.

Fixes: 8201d1028caa ("KVM: arm64: vgic-its: Maintain a translation cache per ITS")
Signed-off-by: Keisuke Nishimura <keisuke.nishimura@inria.fr>
---
 arch/arm64/kvm/vgic/vgic-its.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/vgic/vgic-its.c b/arch/arm64/kvm/vgic/vgic-its.c
index 198296933e7e..a08835d00aba 100644
--- a/arch/arm64/kvm/vgic/vgic-its.c
+++ b/arch/arm64/kvm/vgic/vgic-its.c
@@ -573,12 +573,22 @@ static void vgic_its_cache_translation(struct kvm *kvm, struct vgic_its *its,
 	lockdep_assert_held(&its->its_lock);
 	vgic_get_irq_kref(irq);
 
+	old = xa_store(&its->translation_cache, cache_key, irq, GFP_KERNEL_ACCOUNT);
+
+	/*
+	 * Put the reference taken on @irq if the store fails. Intentionally do
+	 * not return the error as the translation cache is best effort.
+	 */
+	if (xa_is_err(old)) {
+		vgic_put_irq(kvm, irq);
+		return;
+	}
+
 	/*
 	 * We could have raced with another CPU caching the same
 	 * translation behind our back, ensure we don't leak a
 	 * reference if that is the case.
 	 */
-	old = xa_store(&its->translation_cache, cache_key, irq, GFP_KERNEL_ACCOUNT);
 	if (old)
 		vgic_put_irq(kvm, old);
 }
-- 
2.34.1


