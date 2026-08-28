Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A190CC61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 12:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RAMHtBFkdmGbuLyv/P0Pos4ZoeExbNjIBs0ygiScewk=; b=vlG5mL+r0t+LXBOfBSEqhPnJrA
	zA/wn96xwR8U0qJtI2fN+QjflHHYeC8s0pLJN8qXh9jPg0Wc5ZbeSLJuk+w0zCP1v4O/Qi01UsvD+
	SjQthpio2ckMlo3Jez5tZov2/niCX1QpWY4NA5K/rJ5NQ7fn1/pTNOq9BqcITeuAYGE/WgT6baAcz
	p7J9MZUR/Xf1OtIJ9bmcwUOSn2kHHUwkFMjboQkCpxy/vBuI7ZP4RSjzXfAiGSDPiT5Rljf3nj9hp
	0GvDbEr7b/i4+K0vcmk6SProfD1Q9sGnOPhxcaNKEUDeiFcSLfzmdMnWfjkbOkB3oEdw8TKy3KujF
	lwny+rdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzw6G-00000005lS8-0tli;
	Fri, 28 Aug 2026 12:54:28 +0000
Received: from mail-wm1-x346.google.com ([2a00:1450:4864:20::346])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzw6B-00000005lPJ-46nD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 12:54:25 +0000
Received: by mail-wm1-x346.google.com with SMTP id 5b1f17b1804b1-499a8039ff5so9469775e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Aug 2026 05:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787921660; x=1788526460; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RAMHtBFkdmGbuLyv/P0Pos4ZoeExbNjIBs0ygiScewk=;
        b=ohEFXssvKK5FOuUGaRbTdJcRCWJobpxpF8LhIeL5xvV5w7YajiK9vak0EoSptrvZ3y
         PYQY9Q/mCgJuQhGUvjKmOm1ZZf8qqlMWZ6VA0AA1utBdwNmT9zs5OtLxsx0iqud70QvP
         Oml/YTmXAxuZ8+0qK2qxIaigYXmbhiYLIn7IWHBWh5ZxdnOy4kSzeCK5PUeaIKMbgeJ3
         MZ9w4YXaM6F3VsuzpDtTN3YSEPcw3A24nffY+u8NJ4jlOjnuNSnRAf90etJQUEEZcgS+
         lwNKMh3re3oP0Yl7JzjU9o8e9auRepP5An0AO+ktrDUJOIW9XAzBKZtjAB3XUDv1EDRT
         kRmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787921660; x=1788526460;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RAMHtBFkdmGbuLyv/P0Pos4ZoeExbNjIBs0ygiScewk=;
        b=iKec2tgi4lqPi0abYU5TbGdnDozf88+AVNIVyZ9iFkfllDCupgdxQHGPEGijCzngmi
         45DGdGoQA39Ys7Pno5/ikMSyFW3jSCSckXkJ4C12a+DBaMQqJ/QI9clQx36tHrzhhu1g
         WHTJHmX+KurHQgd8mYbcArDCxaFmnFbVwiUo+muG0R4vmBiFa28R1hTt3B+c/e+fNqph
         if40tNqk9d5BNzSjq5KS6e1x4wpM/tteiLKLlq8e/T60PGTICRMRDiyVwLm3fm4VKqBQ
         EHPIbHuoE+jmPpxtuycKpCStCuB/WSXbmI6TRx3iiuVY0/bXf3OLLZlayvzVMoieNfl4
         SY1Q==
X-Forwarded-Encrypted: i=1; AHgh+RrDa7E/E5zSVv/aE3SRDHFSSZ8f9OUXhTYZTXT826aiH4XvxZA6idS4hRM30pbNJVrWrUE1iFavuTzagD7W8H04@lists.infradead.org
X-Gm-Message-State: AFuF++lCT7LXC9LXc6KitUpJCOEnKy89ZRg3RJUPRKJ5cvRCYo65CTCB
	tbYm68GFlk0iwKQcvCcfeiZMr1EyHgCR53IDFE6zEkyF6oA88xGm9jk/VaIjvgr3YvYkN6JMLmB
	bLJ0WKCeGDRaL5g==
X-Received: from wmbe18.prod.google.com ([2002:a05:600c:5912:b0:495:5edc:795b])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8b6b:b0:49b:c8e:8e6 with SMTP id 5b1f17b1804b1-49b91bd99b7mr113262645e9.0.1787921659759;
 Fri, 28 Aug 2026 05:54:19 -0700 (PDT)
Date: Fri, 28 Aug 2026 12:53:38 +0000
In-Reply-To: <20260828125409.1921538-1-smostafa@google.com>
Mime-Version: 1.0
References: <20260828125409.1921538-1-smostafa@google.com>
X-Mailer: git-send-email 2.55.0.897.gb25b4bd76c-goog
Message-ID: <20260828125409.1921538-4-smostafa@google.com>
Subject: [PATCH 3/7] iommu/arm-smmu-v3-iommufd: Fix error path in arm_vsmmu_cache_invalidate()
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, jgg@ziepe.ca, 
	nicolinc@nvidia.com, praan@google.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_055424_088228_69F6344A 
X-CRM114-Status: GOOD (  15.27  )
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

arm_vsmmu_cache_invalidate() issues commands in batch size.
However, if arm_vsmmu_convert_user_cmd() fails, it will return to the
user that it processed "cur - cmds" which may be part of a batch not
issued yet.

Fix this by calculating the returned entry_num solely based on the
"last" that tracks the last batch that was successfully issued.

Also, fix the number of commands for early failing condition.

Fixes: d68beb276ba2 ("iommu/arm-smmu-v3: Support IOMMU_HWPT_INVALIDATE using a VIOMMU object")
Reported-by: Sashiko <>
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
index 25982bdbcbd9..91776c555f0e 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
@@ -379,10 +379,13 @@ int arm_vsmmu_cache_invalidate(struct iommufd_viommu *viommu,
 	int ret;
 
 	cmds = kzalloc_objs(*cmds, array->entry_num);
-	if (!cmds)
+	if (!cmds) {
+		array->entry_num = 0;
 		return -ENOMEM;
+	}
 	cur = cmds;
 	end = cmds + array->entry_num;
+	last = cmds;
 
 	static_assert(sizeof(*cmds) == 2 * sizeof(u64));
 	ret = iommu_copy_struct_from_full_user_array(
@@ -391,7 +394,6 @@ int arm_vsmmu_cache_invalidate(struct iommufd_viommu *viommu,
 	if (ret)
 		goto out;
 
-	last = cmds;
 	while (cur != end) {
 		ret = arm_vsmmu_convert_user_cmd(vsmmu, cur);
 		if (ret)
@@ -405,14 +407,12 @@ int arm_vsmmu_cache_invalidate(struct iommufd_viommu *viommu,
 		/* FIXME always uses the main cmdq rather than trying to group by type */
 		ret = __arm_smmu_cmdq_issue_cmdlist(smmu, &smmu->cmdq, &last->cmd,
 						    cur - last, true);
-		if (ret) {
-			cur--;
+		if (ret)
 			goto out;
-		}
 		last = cur;
 	}
 out:
-	array->entry_num = cur - cmds;
+	array->entry_num = last - cmds;
 	kfree(cmds);
 	return ret;
 }
-- 
2.55.0.897.gb25b4bd76c-goog


