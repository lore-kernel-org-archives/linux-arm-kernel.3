Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D911C61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 12:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ecFwLqLiGFgZXlWDMNOiqsl5/zZT7jnAo8maGJSVqdA=; b=0i9th4wtIN1DO3shPdnUp8qAtK
	nNmm1xGGUB+vbVlKlevKblA+FdxQzQfuQmMz9S/qJ0+muAlwVe6XlJnn4r/iuzrdYzMmwEkcwnwhY
	bmJbo3WaUk+csVlW1IP47+mVDDV/M4IwSW87xMEyOoA5kVDJiiRS1Vw/x11BCu9C8u94GVjegZSxN
	F5SY3t4tsNDpx49UvX1nS1UfQAnFHor+qcf3a4fhoHdA0O7OO2Y4fCntzB3Zmp3uC6IXC2YqHK4l8
	v4L/tYwkAYiSo6TTdydq7aCeDV4eWVezV8xeeITMOABqZ7DXZRZe4WymzRCNv2QHyfqo0L6cfv0IF
	4MHj90+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzw6h-00000005le8-2mPG;
	Fri, 28 Aug 2026 12:54:55 +0000
Received: from mail-wr1-x446.google.com ([2a00:1450:4864:20::446])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzw6N-00000005lV8-2fUo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 12:54:39 +0000
Received: by mail-wr1-x446.google.com with SMTP id ffacd0b85a97d-47f8f8fde2dso499552f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Aug 2026 05:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787921673; x=1788526473; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ecFwLqLiGFgZXlWDMNOiqsl5/zZT7jnAo8maGJSVqdA=;
        b=auyrhQBwMu2uHPPx6QBBi8YrqYZALQCg5GYoHzSzLjPZvH2ixflICIRNXm5oTPlf1G
         HZgxD2TR4GOF3oQ/v+iicsMfbys2iUGW5Qp/PC3/Qquk+OYdc2F9kimAlJzzPkNZMsvS
         zv8gFDWdhqTO8yDyNWDP+YU4tfEGS0A7IsXdFMWtquODyGUSvUkfHXsfHriQ+4bmh1Y+
         8EAURzOxuIfxVxXyphS0aXhFZ1nqDZUZyWHAl3noDl7jukSuD5SDNtDoZYCY5GJ7US8Z
         YSbBJG7PaCsLOOenx+G1Z23x3BJfze5tNOyGgs75elzg0yj3l9NYZ1abLyPYNp1d3aL3
         nrDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787921673; x=1788526473;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ecFwLqLiGFgZXlWDMNOiqsl5/zZT7jnAo8maGJSVqdA=;
        b=nRIGqjS7Tr1grM1Tffn3OdrQqawmin/gbDyWYkLIwbPNlUy1o+/HFXPpx5i0od3NPZ
         vRqDdjgVvrGxg/4HlRi70Gfzu0xbQn3C2E9G9zv85f4c371vWtqE7q4WG/QAnkXfGAza
         A4GPP2MifABYYZLwcqOPmtrqQmxncy37tn4AWXJ15h5E0dM0tyXoP1ofOTPa/BcXYcAy
         huUFZ0qDSmvqtmX5J9mcwFf2vz9QUDp0OZbsUGuVwIGyar6zLXfRtVom70BxnGLX2W6i
         qSV9cNBde5W40N1Q32Uh2V4C8muyvkl26+nsVCxDKS+ZElZdDR/xMTzjUGBF6U0pTQIZ
         6u1w==
X-Forwarded-Encrypted: i=1; AHgh+RoQv+eBrd992WkcjAaTgRgnDB9vIQK/NcsaYOthQ7a8dZtwsm6d6azkiHS03qzWsX0NE4QiSXycrsE4YBk3EF+A@lists.infradead.org
X-Gm-Message-State: AFuF++mh6+wHv9R6rolD4kICfbM2ZDbkHGlxhCz9tvn2DxWuB+07xTaw
	Jr0q6/nt8S60TS9hI/vkuJA4S3KZzfaUdYJmRQMnHO06xljX3XKOMgrRRghEP8elYX4Yt9FxOM6
	h7FsVBgl6Z/WTBw==
X-Received: from wmlv9.prod.google.com ([2002:a05:600c:2149:b0:49b:8f4c:fc2e])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:6088:b0:49b:2796:be30 with SMTP id 5b1f17b1804b1-49b91c433a4mr103156005e9.11.1787921672987;
 Fri, 28 Aug 2026 05:54:32 -0700 (PDT)
Date: Fri, 28 Aug 2026 12:53:41 +0000
In-Reply-To: <20260828125409.1921538-1-smostafa@google.com>
Mime-Version: 1.0
References: <20260828125409.1921538-1-smostafa@google.com>
X-Mailer: git-send-email 2.55.0.897.gb25b4bd76c-goog
Message-ID: <20260828125409.1921538-7-smostafa@google.com>
Subject: [PATCH 6/7] iommu/arm-smmu-v3-test: Fix OOB in arm_smmu_v3_invs_test_verify()
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, jgg@ziepe.ca, 
	nicolinc@nvidia.com, praan@google.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_055438_359982_DA7F77B6 
X-CRM114-Status: GOOD (  12.25  )
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
2.55.0.897.gb25b4bd76c-goog


