Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0449FC9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 08:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Vg0s5N/57YDwzYIoROOFrmDFDxGbcQ0sOsS1KaKDkg=; b=GIrLJEBLEoXAaRfabFrtA83d5j
	TvXKasbY54uJwTypcatylHiTFUkFatJgN/8KYhm7NqEvghW1kSzNiy3lcxrDUfiBm3ZrBBIYh9bd8
	3wxp629phrhEPpGnN2eXVprvI0sxBLbHpKsAp6/QNdfRGhD4jlDrS0Cr4rYEy6Yqf/fnAFfCMBRiz
	9L3t9XV/UBxLdFmXO+MBycXPL6WLtuYZ2Ke6+1bYi2jaPz8KvzaZuy9a28P36C1KloqABrJ5sp302
	pyjqa5uWiZMvsG3kg25jLA6rYkAceWUMZ0Ea9rF1rhex+vhPY1d/Q31YgV8edxaR5bR2bu66ylNB1
	sQhV8/Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9fG0-0000000AVuk-2MNl;
	Thu, 24 Sep 2026 08:56:44 +0000
Received: from mail-ej1-x645.google.com ([2a00:1450:4864:20::645])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9fFn-0000000AVpA-0q35
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 08:56:32 +0000
Received: by mail-ej1-x645.google.com with SMTP id a640c23a62f3a-c294ae16922so219585566b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 01:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790240188; x=1790844988; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/Vg0s5N/57YDwzYIoROOFrmDFDxGbcQ0sOsS1KaKDkg=;
        b=vKJfHwDxcMZniF4p3M4z459Q+lriubEvM1v6pcCwVTEmOKN+5D210tvCXbLs18wpsq
         B6/j+EJXoUhgbHUIvzpV9G7N2XqhXg6JsnIdTRS9UE2wrYXpDNGS83B7CxHy/0au3uLz
         X9PcgcNYMBnctsArJQPhQiwm+3g/iSZ1LQWcmXLCBgSKcJoM2G4/nk/dUHhlNx9tptpj
         gmTnrUqopl+P4e8l3LENBp48VQ5MGQ/CDeg3h27y06gNIXinXjVRIgxEq1orK5RDIflo
         b0TMJQ/3lWsrn3PNYN1JVS/MCWpB5hCBHqE113DAdt/C5mMtJRk3aO+u2RANXbL/DsIl
         qRbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790240188; x=1790844988;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/Vg0s5N/57YDwzYIoROOFrmDFDxGbcQ0sOsS1KaKDkg=;
        b=GJLlfytYF2wIqA8IgosQWgFkXwt1JuCjY5X+yp+CRmHrlo0J65v0T4pxJV8rTX6XYI
         iEjNeIg6xT8aj1IPfFpFEXXugpOl2Av8piWquXQ2biEeikPHcAwcJLO9kHCP/YSUzOhD
         mZjc0eGBx+xNb8hlHFw2ph/o8UOg4itBpsTVPvbMNbKQUD79juBz5kX1lNsmq5ZfYYH7
         Kd9swRO0/CKYBHYV6JgTCW26yCGg7QZo7UToYgV1mWlJxNOv91KXFoq+E4wuBHKIq64H
         ldSTnHNghp42cFVFqIUj9lu0E0ZaKKRl2K1S2s4LlZf0JF3X00edhxyz5UlhsTYCp1/q
         oMyQ==
X-Forwarded-Encrypted: i=1; AKwUvBx9wCogecRCMDP3BAP7AxHHkH2BZCybuF5rvz4cW9Z3Wj0dsKbKnltZTP0+KOh0qUdPzf3j2g2gdp/GqPjOIWu8@lists.infradead.org
X-Gm-Message-State: AFuF++lojxuA++O8IVEl7Sz1tkwoMTGGaTMOoGS60F7zMJ5BQacY6pGa
	htFTfDqeXmN2iaa2aekOAYtkaBikHjvjdiMRs19xIu26YZiHSz0gI2CWP8UELvoP9SFe0GmlFCj
	vmyNWaw3nqB7RHg==
X-Received: from ejcgj35.prod.google.com ([2002:a17:907:7423:b0:c16:9d46:17a4])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:d409:b0:c26:1648:a069 with SMTP id a640c23a62f3a-c2ac24f9cabmr130143366b.36.1790240188197;
 Thu, 24 Sep 2026 01:56:28 -0700 (PDT)
Date: Thu, 24 Sep 2026 08:56:14 +0000
In-Reply-To: <20260924085616.300650-1-smostafa@google.com>
Mime-Version: 1.0
References: <20260924085616.300650-1-smostafa@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260924085616.300650-4-smostafa@google.com>
Subject: [PATCH v2 3/5] iommu/arm-smmu-v3-test: Add missing error checks for
 inv array
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, jgg@ziepe.ca, 
	nicolinc@nvidia.com, praan@google.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_015631_273255_5FF425FE 
X-CRM114-Status: GOOD (  11.28  )
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
2.56.0.rc1.315.gc6ed9934b7-goog


