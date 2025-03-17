Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FC5AC35FF3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 15:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8ko5u8UGR6vLGK2T6EY0xPz43YUrrXiIQoaCjRcfxpk=; b=rjv7nBd8LU3avgrQYkJu04NKlf
	SUpBBygz7DqOCQdfSj1a2r5ipPvmQ0kon462V847zj2YMnbL8+wt6LS/bobOfwahDhfuNd+NxUIEM
	arwVRGNFBcSyYVHDXPX3OopZPZc65eoLOVBZ8OIq6nxHVFCJG3Mut8dsok0nynXMiUA36wl/oa/eF
	nSxvXqCVpnZRYbqbCF0ppv9Xt+wS7qOUmehOHTEnfgp5HirJhLkcNtB36y6LIc1FLKH220Vk+bnbM
	k2SgnroHQgCngwgYXzqpwe8elmzXoeIxV3L/IjX6OTvhPW+2LPJt1/ex1WA9kJd4zJLWWu81Q17G8
	yg5Qi0dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuBxE-00000003423-37aU;
	Mon, 17 Mar 2025 15:00:36 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuBrs-000000032gU-2p6q;
	Mon, 17 Mar 2025 14:55:05 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1742223291; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=RYUaiD3Mz4k5fvw1by0Na+O2at92VulAtv2M8E1AP9TCnvG/psP3kXFbVtbrBu+t0jcCoLu7jek26UGHQj7s0LANPJHpgke8PZ+m/C7rrNGk98mTctdf2uYvvwSkAoBpbjZCksxIgjrPIGk7VNF7qloGRsdluYwrJfqYUSn9Z2Q=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1742223291; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=8ko5u8UGR6vLGK2T6EY0xPz43YUrrXiIQoaCjRcfxpk=; 
	b=kcsPQ9VRO5anAuRiLwAYx05gNxFK0zDpC6Qj27bPet9BCraT0dl9QoAp9TMdypSi5ZmMz+hHNwm4DVWNKr41w0ItYjiR0HpVMGLLANpJZ3SAQIbxLkFLRmN6A4mwukSMVssz3qhiq7b17g1hpO2K2SfoMTGy6n+UMQ6iV/v+9Jc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
	dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1742223291;
	s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=8ko5u8UGR6vLGK2T6EY0xPz43YUrrXiIQoaCjRcfxpk=;
	b=Rj74kfnkc3JDkMjGsoxDnqVJKqVZbQg3AXKVvcCcXu/iKktkyr1olTjSV+sqWuZE
	ZGBOlDdoI3wg339dsO7AWR8lhHDccK7QYbE2D4xiSjyg1X5eEfJ0rqeW55elpSz0Vd3
	KOe1idT3Joe3+eFVji6hhxujYqVxfz8M4xP3+oVA=
Received: by mx.zohomail.com with SMTPS id 1742223290652601.8281280971676;
	Mon, 17 Mar 2025 07:54:50 -0700 (PDT)
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
Subject: [PATCH v4 3/6] drm/panfrost: Set HW_FEATURE_AARCH64_MMU feature flag on Bifrost models
Date: Mon, 17 Mar 2025 11:52:42 -0300
Message-ID: <20250317145245.910566-4-ariel.dalessandro@collabora.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250317145245.910566-1-ariel.dalessandro@collabora.com>
References: <20250317145245.910566-1-ariel.dalessandro@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_075504_769405_8B9E4833 
X-CRM114-Status: UNSURE (   7.03  )
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
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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


