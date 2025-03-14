Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97B9CC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 18:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ue3BpmFyUsYRwD1wWp1a0iuC4FefTH8SxucMqzrgyVg=; b=4FX0OCI2cU+1v4xVvwZqxi1f3T
	AtMNPx52izRjGWM/HWRw13vKkX7MKAmV0XpCaE+OCwbWiiF2ml4Ljg4SgRIFggOMgcD0dmK2yqacU
	S1wK/UF28kFNqrZsD6Sx/oCJYQK/u/0ZmqaCKF2I4dxtuTheQX6gvNAwh5LY7D0s3WlcNQ+gBVy1I
	F4sTSlhbRCDi26uSHDnmyMSR2+4vZj2uAyW9LqkrlqbAqopL6qRSOrobx4eDpG5eFLjjNfIWFFey9
	eD7gbNsUpmygfAF/l5skaZl9WrfjlfsUuW428Og0TX1BQKApoPDiWBUJ/AeG+S/y1bEd+XXUwIkOG
	LHwa3VHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt9Kb-0000000ExbX-2nAW;
	Fri, 14 Mar 2025 18:00:25 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt91E-0000000EuXl-3tn8;
	Fri, 14 Mar 2025 17:40:26 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1741974011; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=laszCL+xymvxUAlHSLmV/VVSrB+qO9n+Pcz2vQfeqj8jyUfYmBHn+GEPljifBtcIPlERWKS7SdmsSNudyS8K8haIVKoeYMNe2kkQMaLC8R2R+LoSTmcGnPquuXwkj/wLiL1r/x38zEvzfLqPgwiQhtQqhY+XbwZZjoP0I7cTX1I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1741974011; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ue3BpmFyUsYRwD1wWp1a0iuC4FefTH8SxucMqzrgyVg=; 
	b=T6tSgYcC/IEpIuCQaAILw9nsaWqNaqD7ZiYO48MTOYZpELktios50KCKhwii4OCtaMu6fgFktfJtMiefnBNovSQzbTPzsVG0NJa5dEUUIyom/xIMxC5kQBngfYsry/eQXIcvozWJeQZZM2KpGGWRaIPym7kGZRcDxaHakRiWVYY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
	dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1741974011;
	s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=ue3BpmFyUsYRwD1wWp1a0iuC4FefTH8SxucMqzrgyVg=;
	b=YjW0o1d+WXIqjZ6Qfzadvx5imyrCc1RYXHJbNms05xNKdSKZD02i9ONGiXlqxule
	7XJ7ONkZesPKSbI4G6vkQUZNgNsn56MUKag+emoo0uipX1pYsFVjPxmoxuWs2tcCb4r
	iKHgpAfKdaou9ocL5yAqKDZWwx3TsdQ0tG85YeHY=
Received: by mx.zohomail.com with SMTPS id 1741974009961643.9425677323535;
	Fri, 14 Mar 2025 10:40:09 -0700 (PDT)
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: boris.brezillon@collabora.com,
	robh@kernel.org,
	steven.price@arm.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	kernel@collabora.com,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	sjoerd@collabora.com,
	angelogioacchino.delregno@collabora.com,
	Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Subject: [PATCH v2 3/6] drm/panfrost: Set HW_FEATURE_AARCH64_MMU feature flag on Bifrost models
Date: Fri, 14 Mar 2025 14:38:55 -0300
Message-ID: <20250314173858.212264-4-ariel.dalessandro@collabora.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250314173858.212264-1-ariel.dalessandro@collabora.com>
References: <20250314173858.212264-1-ariel.dalessandro@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_104025_026841_573EACED 
X-CRM114-Status: UNSURE (   7.00  )
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

Set this feature flag on all Mali Bifrost platforms as the MMU supports
AARCH64 4K page table format.

Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Steven Price <steven.price@arm.com>
---
 drivers/gpu/drm/panfrost/panfrost_features.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_features.h b/drivers/gpu/drm/panfrost/panfrost_features.h
index 7ed0cd3ea2d4c..52f9d69f6db9d 100644
--- a/drivers/gpu/drm/panfrost/panfrost_features.h
+++ b/drivers/gpu/drm/panfrost/panfrost_features.h
@@ -54,6 +54,7 @@ enum panfrost_hw_feature {
 	BIT_ULL(HW_FEATURE_THREAD_GROUP_SPLIT) | \
 	BIT_ULL(HW_FEATURE_FLUSH_REDUCTION) | \
 	BIT_ULL(HW_FEATURE_PROTECTED_MODE) | \
+	BIT_ULL(HW_FEATURE_AARCH64_MMU) | \
 	BIT_ULL(HW_FEATURE_COHERENCY_REG))
 
 #define hw_features_g72 (\
@@ -64,6 +65,7 @@ enum panfrost_hw_feature {
 	BIT_ULL(HW_FEATURE_FLUSH_REDUCTION) | \
 	BIT_ULL(HW_FEATURE_PROTECTED_MODE) | \
 	BIT_ULL(HW_FEATURE_PROTECTED_DEBUG_MODE) | \
+	BIT_ULL(HW_FEATURE_AARCH64_MMU) | \
 	BIT_ULL(HW_FEATURE_COHERENCY_REG))
 
 #define hw_features_g51 hw_features_g72
@@ -77,6 +79,7 @@ enum panfrost_hw_feature {
 	BIT_ULL(HW_FEATURE_PROTECTED_MODE) | \
 	BIT_ULL(HW_FEATURE_PROTECTED_DEBUG_MODE) | \
 	BIT_ULL(HW_FEATURE_IDVS_GROUP_SIZE) | \
+	BIT_ULL(HW_FEATURE_AARCH64_MMU) | \
 	BIT_ULL(HW_FEATURE_COHERENCY_REG))
 
 #define hw_features_g76 (\
-- 
2.47.2


