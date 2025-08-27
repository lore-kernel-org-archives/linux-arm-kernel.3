Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4267ACA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 18:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Y/5x0a6OSZBvnPwlcCX/O04CwF8+LjpCd3H9tQgcvg=; b=V465i+qZ5lwsblgKfXWMkXM9OA
	yL7qE0jR7AKIWjnbr6RPrmN+0IyKXo2fwNluUcZ1sH22EnoVSkw6vHXEYUC1BOhL9mD45XTIUHrea
	kK/+MbViyypiEG1uMJvYj5auQ1YP5EUsD/9Ak/fRPkAz9cQ8zl3vzukr8AYqHz+Ij5IhLNB5SLV3Y
	hIs/L/ODNOpyFXuhMXbqJftDCFYFDoX2Bjw6GVvQIlRSfFHdI9Ob5bj/Cr5QbYxphijfJSsBk/g+m
	QZouE/2/QW4Gz3pAJpp8WfcMAlCj7AxkVyHMD83xGRS2vtdeVv4j0qF1deYQpzdghq+CFd8LzdRQl
	vyvW6lFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urKf4-0000000GROx-3qNd;
	Wed, 27 Aug 2025 18:14:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urIja-0000000G8nB-0LNT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 16:10:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7BED4600BB;
	Wed, 27 Aug 2025 16:10:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33131C4CEF0;
	Wed, 27 Aug 2025 16:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756311049;
	bh=tmEM96C2TC0zXIOl9E5p1YhX5LWEHFaDzYtjcvT2phY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=B2w3Cblf3lxPOpGNnPh1nppii6f7VZVk2Z4PCoYKlDtKiVpZ4rdYNqaLhb8MBRgl8
	 TzbcEm99yP6bm/ysbcg4SYF5qsYIbrXoBPcrFPi+Hwop8GVzZijAr99pxPXuh2POIu
	 lHMTCrOcLcFoP9BNhr4dXfvs9WNxHgmkUFdkxRL1jGeLN/SjtZWDLW4NjTZ5mxHoTg
	 CcKpY9nZTI38POnt0ES44pXEVPElUpWI59aU15RcZmMm/IFJPeGT1aJ+eSOInH0QEf
	 z7XE3He7SqPaZF3N108upgMpOdrLjlt7uTBAJHhBc3d3UNB+T9DuUlOgkVEx+CMwQL
	 IuQ7zHM+wpupQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1urIjX-00000000yGc-0Sax;
	Wed, 27 Aug 2025 16:10:47 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH 03/16] KVM: arm64: Compute 52bit TTBR address and alignment
Date: Wed, 27 Aug 2025 17:10:25 +0100
Message-Id: <20250827161039.938958-4-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250827161039.938958-1-maz@kernel.org>
References: <20250827161039.938958-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

52bit addresses from TTBR need extra adjustment and alignment
checks. Implement the requirements of the architecture.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/at.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/kvm/at.c b/arch/arm64/kvm/at.c
index 04b7ff4426303..36cee6021b2ae 100644
--- a/arch/arm64/kvm/at.c
+++ b/arch/arm64/kvm/at.c
@@ -28,6 +28,8 @@ static int get_ia_size(struct s1_walk_info *wi)
 /* Return true if the IPA is out of the OA range */
 static bool check_output_size(u64 ipa, struct s1_walk_info *wi)
 {
+	if (wi->pa52bit)
+		return wi->max_oa_bits < 52 && (ipa & GENMASK_ULL(51, wi->max_oa_bits));
 	return wi->max_oa_bits < 48 && (ipa & GENMASK_ULL(47, wi->max_oa_bits));
 }
 
@@ -301,6 +303,16 @@ static int setup_s1_walk(struct kvm_vcpu *vcpu, struct s1_walk_info *wi,
 	x = 3 + ia_bits - ((3 - wi->sl) * stride + wi->pgshift);
 
 	wi->baddr = ttbr & TTBRx_EL1_BADDR;
+	if (wi->pa52bit) {
+		/*
+		 * Force the alignment on 64 bytes for top-level tables
+		 * smaller than 8 entries, since TTBR.BADDR[5:2] are used to
+		 * store bits [51:48] of the first level of lookup.
+		 */
+		x = max(x, 6);
+
+		wi->baddr |= FIELD_GET(GENMASK_ULL(5, 2), ttbr) << 48;
+	}
 
 	/* R_VPBBF */
 	if (check_output_size(wi->baddr, wi))
-- 
2.39.2


