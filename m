Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44B12C61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 12:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y3t59Cwp3hUZ2CzdmTE2YwsjNcWIkkKVh96IkZiq53c=; b=DXNa9y3ro54uClw8UTiqO86h0k
	kmepxAwXgcDDqqecC2aVsg5M/yL3JhPhXohHDlL+Ts8dRbQ51a+W7GScLVJ1CZotLgZGMFzkcpVqX
	zNPsAijRyq9hSh8OmV292IUX5z6nc49Dp6Ak4GmRNyfIMmWajXqMGv5xIz+XYgq6diVryWKbzfp8W
	n791CGanihkAQ1T7WQAQauiaxtRJMiy6lojx27/4Z9RA/Yt3RloObmY2J3sDdvKi4wTfLS2s2BgjL
	+oyVFryo6TnKdV/JI7yFO+Qlb+7x1YssQ3IrampbUfXpRrf3bZ6AYNDHXuPBhxrkVeKfhoJ8XvEeE
	KtHdyoLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzw6h-00000005ldp-2Qa7;
	Fri, 28 Aug 2026 12:54:55 +0000
Received: from mail-wr1-x447.google.com ([2a00:1450:4864:20::447])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzw6M-00000005lUh-0DqY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 12:54:35 +0000
Received: by mail-wr1-x447.google.com with SMTP id ffacd0b85a97d-47f81362fb1so560542f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Aug 2026 05:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787921672; x=1788526472; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y3t59Cwp3hUZ2CzdmTE2YwsjNcWIkkKVh96IkZiq53c=;
        b=H41luHbkoRx4vex8alvQdsvcP92vgT5czdKQhBa0KDvMMF/umPJdgny3opP3rVt9od
         okhVBGetlQ3l2LtYoEF9I5YAhIFmTvZUc7TR/NLrf6FYnQ3MLXtvKFKbpsEJdq1fAAbK
         Hs7KPDv8+O2SOiS4bR796oKrpjkV1LGixz/jq5+lZxhIpRhGiUUfJtNAtTQtg4r9e90I
         UqfqGzKEBq3h5ss7jHv+TMAd1UtzXet5J8tiBBMf2cwftTxpnT06T8g1YheGHTHCXiIn
         ejlYcYrTFeGS5G0F+baGqiJ1xf0CfzKdyoOGwpUUEOKLUfbtHlXYKIynui2N5/Pkrrhw
         Cgrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787921672; x=1788526472;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y3t59Cwp3hUZ2CzdmTE2YwsjNcWIkkKVh96IkZiq53c=;
        b=TBHiQIa7SxkMNqp8HjR0OJD0D8jwg6fj9+5CiNb3YjNPZXbfrLDDtMfAeBiZ5bMtTY
         mnEBYcqP/EQ/I6fqZvtOBY6xTvS+yZ5udO9kQT21e3lwG/rTuyMBEwaup83PQRKizWsR
         vftNCGGiPVNdQzOjpAgGJiNsiEJZecH138u2yiaK1C+1MYdXIKkWq4oYi59eoFOl2KmJ
         Uwa1wFs0ikU9eMU7cnNjpE+itHCEwChKqAwidU6Zu2Io1GtxCnZIxV1tu1T1S6VmLWaG
         lSIQ38MH/KXNFzJADjfsg9rvC/w+dHFhnebIUfCnTYCJfvfvJ/8hk300fFaRJ9cCZvrt
         zTCQ==
X-Forwarded-Encrypted: i=1; AHgh+RqpcOur1hFAwUCekVCOGqzTBJcrdmYfgADfvCuy53Idb5xm4pRc1TZcIIQZ2zht52Na9SG8oQ8QoxX+fd0U1Bb3@lists.infradead.org
X-Gm-Message-State: AFuF++l0gsXHuQFYKXH/KIl1YskVM+btSdnJnwhlu4txlf61n51f5jOG
	P7+zZik1nOPfyMtxNwnuG4/krrpTCxeSfs/HbjRNJ6ftUulLHHtRozCkbAbrakT5C3DHeyWKoKU
	qoedzMPmXcOwHCg==
X-Received: from wmsm23.prod.google.com ([2002:a05:600c:3b17:b0:495:6261:8954])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1c02:b0:499:8ff5:8ec4 with SMTP id 5b1f17b1804b1-49b91c2e11dmr109166555e9.3.1787921671689;
 Fri, 28 Aug 2026 05:54:31 -0700 (PDT)
Date: Fri, 28 Aug 2026 12:53:40 +0000
In-Reply-To: <20260828125409.1921538-1-smostafa@google.com>
Mime-Version: 1.0
References: <20260828125409.1921538-1-smostafa@google.com>
X-Mailer: git-send-email 2.55.0.897.gb25b4bd76c-goog
Message-ID: <20260828125409.1921538-6-smostafa@google.com>
Subject: [PATCH 5/7] iommu/arm-smmu-v3-test: Add missing error checks for inv array
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, jgg@ziepe.ca, 
	nicolinc@nvidia.com, praan@google.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_055434_110832_50996000 
X-CRM114-Status: GOOD (  11.22  )
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

arm_smmu_invs_merge() and arm_smmu_invs_alloc() can return NULL or
errors which are checked by the driver but not the test.

Add KUNIT_ASSERT_NOT_ERR_OR_NULL() after calling them to fail the
test instead of accessing NULL or ERR pointers.

Fixes: 15a2a5645ad7 ("iommu/arm-smmu-v3: Introduce a per-domain arm_smmu_invs array")
Reported-by: Sashiko <>
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c
index eae08d4d77ec..366dcb2b5554 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c
@@ -704,17 +704,20 @@ static void arm_smmu_v3_invs_test(struct kunit *test)
 
 	/* New array */
 	test_a = arm_smmu_invs_alloc(0);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, test_a);
 	KUNIT_EXPECT_EQ(test, test_a->num_invs, 0);
 
 	/* Test1: merge invs1 (new array) */
 	test_b = arm_smmu_invs_merge(test_a, &invs1);
 	kfree(test_a);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, test_b);
 	arm_smmu_v3_invs_test_verify(test, test_b, ARRAY_SIZE(results1[0]), 0,
 				     results1[0], results1[1], results1[2]);
 
 	/* Test2: merge invs2 (new array) */
 	test_a = arm_smmu_invs_merge(test_b, &invs2);
 	kfree(test_b);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, test_a);
 	arm_smmu_v3_invs_test_verify(test, test_a, ARRAY_SIZE(results2[0]), 0,
 				     results2[0], results2[1], results2[2]);
 
@@ -726,6 +729,7 @@ static void arm_smmu_v3_invs_test(struct kunit *test)
 	/* Test4: merge invs3 (new array) */
 	test_b = arm_smmu_invs_merge(test_a, &invs3);
 	kfree(test_a);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, test_b);
 	arm_smmu_v3_invs_test_verify(test, test_b, ARRAY_SIZE(results4[0]), 0,
 				     results4[0], results4[1], results4[2]);
 
@@ -737,6 +741,7 @@ static void arm_smmu_v3_invs_test(struct kunit *test)
 	/* Test6: purge test_b (new array) */
 	test_a = arm_smmu_invs_purge(test_b);
 	kfree(test_b);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, test_a);
 	arm_smmu_v3_invs_test_verify(test, test_a, ARRAY_SIZE(results6[0]), 0,
 				     results6[0], results6[1], results6[2]);
 
@@ -748,12 +753,14 @@ static void arm_smmu_v3_invs_test(struct kunit *test)
 	/* Test8: merge invs4 (new array) */
 	test_b = arm_smmu_invs_merge(test_a, &invs4);
 	kfree(test_a);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, test_b);
 	arm_smmu_v3_invs_test_verify(test, test_b, ARRAY_SIZE(results7[0]), 0,
 				     results7[0], results7[1], results7[2]);
 
 	/* Test9: merge invs5 (new array) */
 	test_a = arm_smmu_invs_merge(test_b, &invs5);
 	kfree(test_b);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, test_a);
 	arm_smmu_v3_invs_test_verify(test, test_a, ARRAY_SIZE(results8[0]), 0,
 				     results8[0], results8[1], results8[2]);
 
@@ -765,6 +772,7 @@ static void arm_smmu_v3_invs_test(struct kunit *test)
 	/* Test11: purge test_a (new array) */
 	test_b = arm_smmu_invs_purge(test_a);
 	kfree(test_a);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, test_b);
 	arm_smmu_v3_invs_test_verify(test, test_b, ARRAY_SIZE(results10[0]), 0,
 				     results10[0], results10[1], results10[2]);
 
-- 
2.55.0.897.gb25b4bd76c-goog


