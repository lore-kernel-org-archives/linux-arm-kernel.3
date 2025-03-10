Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D7D5C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 20:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ri5NxGP83GAWZRTNAwusSEW6eUICnHU4WNe3YwZobXY=; b=S5k3Mpus5sm4D5KkNaL07fpESA
	wZFroM0krR00QM1oO7O84lCfmoFPkJhDHNm0K1R0g3dT0RYF5ZKNdeaJtuOy6NC0zSHjPYW2pfTK9
	YZcgr8/mvdzzK5n/SHOU+PiwfvshOdpTUahIlcAXVxfdrZYDeTDxN99kCQUh0cO4l3/RQDGf5/HL5
	5F4wgd0jsFgCdCNXuo2O4WFZKZaKqyrBcwaO1UW4udun7HKaoXYXPIXeGsm5bsKNGc4apMXML4HX2
	1URotVwKJG3FT8mxQ9SagkxZNCCzLqBd8FsrWQeBLGgPINnDvAwcdnLwp3XOaS1NClL0B9H0/tYM2
	mYpNo1yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trjTW-00000003p4E-0YZU;
	Mon, 10 Mar 2025 20:11:46 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trjIf-00000003nHK-1xQU;
	Mon, 10 Mar 2025 20:00:34 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1741636820; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Ep1jAyWe1+XXmXUKDfGKdFqzwvvx567SCPi/EfuLlFK1zh0y4LBX0Exk9U5dGmI1gQJUoWg3uPZ0uOcZiTgCPpTGHxgl1usND5ilmo9DT5ATrMJyrpDKaKM/EVOKdFbhpB7fLqwd0G5lHrmYf8dKMFfbI4jLSbHrKAe3ioduwWU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1741636820; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Ri5NxGP83GAWZRTNAwusSEW6eUICnHU4WNe3YwZobXY=; 
	b=fGPxV/0+GRiJAv1SHqyW9RDRFCRf4N7/wFT/IWpWVnUOGkU+fcyfhBgiOcJXq91mWlq4Ozox9dpp7ZLBc1B9PxOJ9h07SY+PbMB37EwuWjr5PLtWGuRVr7bW5HoGVC/ldA3ztN9E7dasfowC3Q1MPDSjB79/ka4LWwZFPYNUQ48=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
	dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1741636820;
	s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Ri5NxGP83GAWZRTNAwusSEW6eUICnHU4WNe3YwZobXY=;
	b=HrkY0K1V0fypJT4eC4spkdxIKpb07lKFGZP7EJJx+FXGftYALB/4BzpES7ozc/xe
	hyJfrUnyI0M49ueGBJZbTvucN82b3KrQNG7DkFWFwR6cXNb3euNo6PPIPRTMEa1uUE9
	cyZBgbL+Kg+WTuVUQrLQhx7IGQeIoXSMmBFoEe8k=
Received: by mx.zohomail.com with SMTPS id 1741636818884184.34015520872072;
	Mon, 10 Mar 2025 13:00:18 -0700 (PDT)
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
	Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Subject: [PATCH v1 6/6] drm/panfrost: Set HW_FEATURE_AARCH64_MMU feature flag on Bifrost models
Date: Mon, 10 Mar 2025 16:59:21 -0300
Message-ID: <20250310195921.157511-7-ariel.dalessandro@collabora.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250310195921.157511-1-ariel.dalessandro@collabora.com>
References: <20250310195921.157511-1-ariel.dalessandro@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_130033_562779_C2102033 
X-CRM114-Status: UNSURE (   7.30  )
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


