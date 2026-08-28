Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D988C61DCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 12:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yqE2RL7ob83hHe4LCs/SgOtsDWUwdfHdO0PxSusQVD0=; b=eyBbUDCpUA+ubdFyzeOib4ei/t
	4OvdRSTRTDZwCQ1Vf8gzrx7+idvC3oLJPGsx6otgCo0qcmsQR8ZE0mAXA6vLqnsX1t7kcbm5l0vn9
	8Z25PWPYJcgxPXPuw7Ma4GCRFLd6jYCH5jXLKmCKIDC5QEOKyDobQn/ystAw4GaUs0Z6RdT7oSTar
	e48NkbB7lL2kBWPeg2JtNTbR5rG2g3VSa1fI31EdStdvr53jyGOi6jcs0ny5OhgIyttHijLkjZVJz
	ULdxp6xiT9iqR4RLyre2wv+Uz4TjPfSWRGPW2z02tCSdB2PmYwDQCBaxijDoaKZfw9H4/eVYq6bAe
	uIzxCM3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzw6h-00000005leV-3Lx3;
	Fri, 28 Aug 2026 12:54:55 +0000
Received: from mail-wm1-x347.google.com ([2a00:1450:4864:20::347])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzw6Q-00000005lWO-1XMh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 12:54:42 +0000
Received: by mail-wm1-x347.google.com with SMTP id 5b1f17b1804b1-495474a5fbcso7802355e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Aug 2026 05:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787921675; x=1788526475; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yqE2RL7ob83hHe4LCs/SgOtsDWUwdfHdO0PxSusQVD0=;
        b=fQq8FE+RhZ+9bDvXiFAZ+qZiUDVPpbNR74VxuVtx021ZHo0QarsDmACm48xq1GkIjf
         OPC1/umKJxmrYdW4AGIK9AeGkS6JG5RoZMI5/moywAJDAz7b3XOKHHgdBi/JQHFr90Ua
         F3unxQm+/VmyMkOcRAj9B+50qSg4A1MleyARLKS3UnkniJYPTBed1EXlll2y9Y8Uj2me
         QCQGdMoSON6Sdolinwr/NpvFBCWd/K2r3PsPMckos4SNrlfXBscBfUdiPu0VyDG3EM3H
         4av/lSGHABG2oFR5LLNNP/0qeZaPW7EYazWGENQ2HDVwbuRHSKvDZCA3lpPC9Qo1Xe3c
         k1Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787921675; x=1788526475;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yqE2RL7ob83hHe4LCs/SgOtsDWUwdfHdO0PxSusQVD0=;
        b=NcUojDHLLE/psbhvWGvvyAQjoc16fWQh33eTp4DZdSDTvpv4z8a8AO0Gi27oznHg6e
         jnjKPzpNHc97cwYGhAMxkOGxdhVC/gaD9OtPZOxsaVWCanZF9ay5ucVTDiwKNTtI2TKh
         VuYlPm2PkQr2PLml7iGGPHs3GD+8Xsx7XjpuwpkdB9ICp2QbqhW9k4NUQqDXJlVF1zcZ
         fRZu6MlIGZcg0ZMCi06f0YJkUgA6HgWcUxAHROr7VUaTOJVU5cpSRJJg2vFEAqgwzuL8
         H/gEAE8VDB7os7xA1AiqZw/b+jdWItHZrRR3rLRgiH00viEu/XtUlvzLldixj7wexAgS
         +9oQ==
X-Forwarded-Encrypted: i=1; AHgh+RoOU95nU/RFJeQav7bhxE/hl+Wrw6dLJ/TQBT8i9bkR8RiMB14+pZ4kvbZm4V8G8x82Yp49E8pChqBpXImJmIGt@lists.infradead.org
X-Gm-Message-State: AFuF++mrGV+/rcIw4k7NrD4f4sdMYLQ3s2Ao3tDADZ5R6n7e16NCn5u1
	Z7hidgi+3pQQzVHx5+wstlUdsD3XmaX9Iy+WIkDEOmQTJ5Ruj5Btt6bk2ychZuL3szLFvPCmv0R
	KQSPTySODT9zyhg==
X-Received: from wmlf1.prod.google.com ([2002:a7b:c8c1:0:b0:493:bd51:5095])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8b6b:b0:49b:c8e:8e6 with SMTP id 5b1f17b1804b1-49b91bd99b7mr113293015e9.0.1787921674606;
 Fri, 28 Aug 2026 05:54:34 -0700 (PDT)
Date: Fri, 28 Aug 2026 12:53:42 +0000
In-Reply-To: <20260828125409.1921538-1-smostafa@google.com>
Mime-Version: 1.0
References: <20260828125409.1921538-1-smostafa@google.com>
X-Mailer: git-send-email 2.55.0.897.gb25b4bd76c-goog
Message-ID: <20260828125409.1921538-8-smostafa@google.com>
Subject: [PATCH 7/7] iommu/arm-smmu-v3-test: Fix UBSAN error
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, jgg@ziepe.ca, 
	nicolinc@nvidia.com, praan@google.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_055438_424295_B8A45C6C 
X-CRM114-Status: GOOD (  12.37  )
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

struct arm_smmu_invs marks its flexible array member inv[] with the
__counted_by(max_invs).

arm_smmu_v3_invs_test() uses invs1 to invs5 which has num_invs = 3
but omit max_invs.

This causes the following UBSAN error:
[    2.333240] UBSAN: array-index-out-of-bounds in drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1116:21
[    2.333604]     # arm_smmu_v3_invs_test: lib/ubsan.c:228: array-index-out-of-bounds in drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
[    2.334129] index 1 is out of range for type 'struct arm_smmu_inv[] __counted_by(max_invs)' (aka 'struct arm_smmu_inv[]')
[    2.335375] CPU: 6 UID: 0 PID: 155 Comm: kunit_try_catch Tainted: G                 N  7.2.0-g8dcb331fbb72 #2 PREEMPT
[    2.335759] Tainted: [N]=TEST
[    2.335791] Hardware name: linux,dummy-virt (DT)
[    2.336254] Call trace:
[    2.336932]  show_stack+0x18/0x24 (C)
[    2.338443]  __dump_stack+0x28/0x38
[    2.338494]  dump_stack_lvl+0x54/0x6c
[    2.338518]  dump_stack+0x18/0x24
[    2.338541]  ubsan_epilogue+0x10/0x44
[    2.338565]  __ubsan_handle_out_of_bounds+0xb8/0xbc
[    2.338834]  arm_smmu_invs_merge+0x688/0x8ac
[    2.338862]  arm_smmu_v3_invs_test+0xd4/0x598
[    2.338890]  kunit_try_run_case+0x64/0x160
[    2.338914]  kunit_generic_run_threadfn_adapter+0x28/0x4c
[    2.338955]  kthread+0x10c/0x12c
[    2.338984]  ret_from_fork+0x10/0x20
[    2.339433] ---[ end trace ]---

Explicitly set max_invs = 3 on the test arrays to match the number of
elements.

Fixes: 15a2a5645ad7 ("iommu/arm-smmu-v3: Introduce a per-domain arm_smmu_invs array")
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c
index 244cf34e5a0b..e52a7d95c919 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c
@@ -654,6 +654,7 @@ static void arm_smmu_v3_invs_test_verify(struct kunit *test,
 }
 
 static struct arm_smmu_invs invs1 = {
+	.max_invs = 3,
 	.num_invs = 3,
 	.inv = { { .type = INV_TYPE_S2_VMID, .id = 1, },
 		 { .type = INV_TYPE_S2_VMID_S1_CLEAR, .id = 1, },
@@ -661,6 +662,7 @@ static struct arm_smmu_invs invs1 = {
 };
 
 static struct arm_smmu_invs invs2 = {
+	.max_invs = 3,
 	.num_invs = 3,
 	.inv = { { .type = INV_TYPE_S2_VMID, .id = 1, }, /* duplicated */
 		 { .type = INV_TYPE_ATS, .id = 4, },
@@ -668,6 +670,7 @@ static struct arm_smmu_invs invs2 = {
 };
 
 static struct arm_smmu_invs invs3 = {
+	.max_invs = 3,
 	.num_invs = 3,
 	.inv = { { .type = INV_TYPE_S2_VMID, .id = 1, }, /* duplicated */
 		 { .type = INV_TYPE_ATS, .id = 5, }, /* recover a trash */
@@ -675,6 +678,7 @@ static struct arm_smmu_invs invs3 = {
 };
 
 static struct arm_smmu_invs invs4 = {
+	.max_invs = 3,
 	.num_invs = 3,
 	.inv = { { .type = INV_TYPE_ATS, .id = 10, .ssid = 1 },
 		 { .type = INV_TYPE_ATS, .id = 10, .ssid = 3 },
@@ -682,6 +686,7 @@ static struct arm_smmu_invs invs4 = {
 };
 
 static struct arm_smmu_invs invs5 = {
+	.max_invs = 3,
 	.num_invs = 3,
 	.inv = { { .type = INV_TYPE_ATS, .id = 10, .ssid = 2 },
 		 { .type = INV_TYPE_ATS, .id = 10, .ssid = 3 }, /* duplicate */
-- 
2.55.0.897.gb25b4bd76c-goog


