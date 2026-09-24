Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C318C98317
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 08:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WeCtBbQ7yt7z6sBbxQb9QyYhXFA8zToXd2a7O4Dja9Q=; b=ojDTs/YVshaAOz9RMhlboOY6jE
	5Ke8df0dEB7EIX01ZMSJpVOJUjZDKJmkRRcjNSw93gtdJGfFZ/McCm6PKm+BNaPYHAfOdGCM+KYZX
	q9+vHRDvGs0eHRSU4a1DPoMTSlYH9us+itY0Ra9pOMhQcp0E4wI3bQxPPX0hSrnRYxG4rcCwwiesd
	mSVJGobizPdrgKmyp3WzPl6fwbXP4sOfEb2XbmcWs9T1tgusrg0Zb8U91jaKOaz/t88JUPKGqxcBL
	pJxq+4FFH3cSPOh4h9fgD8mYAy9J8fJFL0+jv3Hyp+o6zowr9iq5mgcrGEpR+gb3dTEFQu9klG3uk
	GKiI39tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9fG0-0000000AVv7-2uj2;
	Thu, 24 Sep 2026 08:56:44 +0000
Received: from mail-ej1-x646.google.com ([2a00:1450:4864:20::646])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9fFo-0000000AVpO-2XJF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 08:56:34 +0000
Received: by mail-ej1-x646.google.com with SMTP id a640c23a62f3a-c29c391bd2fso166902266b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 01:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790240189; x=1790844989; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WeCtBbQ7yt7z6sBbxQb9QyYhXFA8zToXd2a7O4Dja9Q=;
        b=GSweNlKodyZ+3opFLO6B5NNW1f3m/I8eNMSKi/asLJp8u4P9s7DRY8R23HNAbCxCyx
         WNEcloR2y9yv2K25ZgHXY6n3+5EyKFLnTSc41mmjglg3j6fub52C5ghgyDDSeqVU33Sn
         ze6er8YzcVFCaSqocQgddJ6dksYMmCjIv6hW4qVFMtjw+Urg0q2FVXNqeoCo38MZ9F2Z
         pH+cp2m6KdYAaDIsiKAAvZeK26SH4FJL0Bf1frmATfVIhe1YXQAMaG90aravOTWghdO8
         90clJjwjajRGkQfrsNxY6ZLWuahTr48e1ddhiYSz3d1bTacGmTOrJ01oh1ExenK3NqtV
         o9VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790240189; x=1790844989;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WeCtBbQ7yt7z6sBbxQb9QyYhXFA8zToXd2a7O4Dja9Q=;
        b=k6WRaiKR5DbXHXdZZUOZgYtSmIu1hUbLCvFJHW7SGzbHlprQ1eF3p3LWxuLLWVny6l
         ODL9iFrTZJ7LxRhaCrBxvSY6S8+VjYfs8SXhNN3QxXB3jgRMgEk/+uq5KxYAeUjxGhI0
         wMGFdJ4e3IA/PpBEddC8y1oO11gWO03/6bQCPNQ3t6cVruIorb0zRU9wcEv2MxuYGF+5
         KYCqJXNyMlee3caacmGCsAbQIqiCumhV9teeutiLMi0zdzVx5ZXQpDp8Dpw5kmBI3A98
         T+F5otewxQSLj3FQCrzc0Tf3fM6VYsnZfK5pZRQfHmtJhyQcrjM0d9jn7cxkgBjiDErk
         3Ilg==
X-Forwarded-Encrypted: i=1; AKwUvBzsWrYRAiuO7yWbg10axioYqPeZD8mVoYJHwqW3cRvm7xSzz185cEot6x7CCGswbCSgfj5p2GKNfXCpP/pW36lY@lists.infradead.org
X-Gm-Message-State: AFuF++nUu0UfAhT3t9uaFoWc7WOB/uriD+kGnZAUYcx1aVa/ZZWF09kB
	326fOd2yg/ChKBx+zoxko3Kqkj9CDXMJXpwqAknNydnrxmU/J4FE+/TCBjonbXBaKITyEanJtCg
	SgcY54tSKqOpoTw==
X-Received: from ejcet6.prod.google.com ([2002:a17:907:2946:b0:c25:2d7f:4eee])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:7a8b:b0:c29:3b7e:3a94 with SMTP id a640c23a62f3a-c2ac53d2785mr104883766b.38.1790240189335;
 Thu, 24 Sep 2026 01:56:29 -0700 (PDT)
Date: Thu, 24 Sep 2026 08:56:15 +0000
In-Reply-To: <20260924085616.300650-1-smostafa@google.com>
Mime-Version: 1.0
References: <20260924085616.300650-1-smostafa@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260924085616.300650-5-smostafa@google.com>
Subject: [PATCH v2 4/5] iommu/arm-smmu-v3-test: Fix OOB in arm_smmu_v3_invs_test_verify()
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, jgg@ziepe.ca, 
	nicolinc@nvidia.com, praan@google.com, Mostafa Saleh <smostafa@google.com>, 
	Jason Gunthorpe <jgg@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_015632_685423_0DD52BA9 
X-CRM114-Status: GOOD (  12.40  )
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

arm_smmu_v3_invs_test_verify() validates the array bounds using
KUNIT_EXPECT_EQ(), which triggers a failure and continues execution.
If invs->num_invs was smaller than expected, the next loop over
num_invs would blindly read past the end of the invs->inv[] array.
Switch to KUNIT_ASSERT_EQ() to fail and stop the test on bound errors.

Fixes: 15a2a5645ad7 ("iommu/arm-smmu-v3: Introduce a per-domain arm_smmu_invs array")
Reported-by: Sashiko <>
Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c
index 366dcb2b5554..244cf34e5a0b 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c
@@ -643,7 +643,7 @@ static void arm_smmu_v3_invs_test_verify(struct kunit *test,
 					 const int *ids, const int *users,
 					 const int *ssids)
 {
-	KUNIT_EXPECT_EQ(test, invs->num_invs, num_invs);
+	KUNIT_ASSERT_EQ(test, invs->num_invs, num_invs);
 	KUNIT_EXPECT_EQ(test, invs->num_trashes, num_trashes);
 	while (num_invs--) {
 		KUNIT_EXPECT_EQ(test, invs->inv[num_invs].id, ids[num_invs]);
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


