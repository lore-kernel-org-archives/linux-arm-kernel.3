Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 776A5C61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 12:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EtQo4uL9ciRrWrgSm+7tcMPkQTLbUYsP8Kt9QCNYgXs=; b=ylLqbwSmOPNFkkfZdEBxhvDmeK
	Ho9VtqS0p4kYa+ZMuac1fzAcQSEMJQBz9SrHetX6ZSUKTY/oCO2GkJynlf+goddz2F+MucTrk/uRM
	blByStPXrHuOqeyQbasILr2LuPKMq4wAMqJpvmETDuMRo5tDSvB9a+yuYcgU5mSN7bJNqYqev8H17
	v3mpCDC96dl+QIBrWxPufTeC7c6Ngk7g+khCbjL0P62fk0MFoyhhRxgOtvkojHO1wCW8ZhmEkuOJQ
	g41SR1lr4pARTmtwR5hmDXQ3PXM/ifgAeJGn26HT80MOjRlzIWdOOsJrG75ReBHuuIA1z1rRlFWoS
	HeIXYi4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzw6G-00000005lRq-0XQP;
	Fri, 28 Aug 2026 12:54:28 +0000
Received: from mail-wm1-x347.google.com ([2a00:1450:4864:20::347])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzw69-00000005lOR-18QJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 12:54:23 +0000
Received: by mail-wm1-x347.google.com with SMTP id 5b1f17b1804b1-4994d67d0e3so5281125e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Aug 2026 05:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787921657; x=1788526457; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EtQo4uL9ciRrWrgSm+7tcMPkQTLbUYsP8Kt9QCNYgXs=;
        b=FnUAVkzx/ikDfnybK1jfr3sHuP3TYxV6UTBA3LYazFC6QK2n0Fwo2mh+mfSR2OTVC/
         GWDhrjYEoOsweftQLdrpg3qrOGsqADO9/mkt6YBfgrfwgEhq5CyEgbe8WMRxQXvHZJUg
         iDp7wjbNQb8mVDKau/gu1FtrmQO/xdo+qcUAMJTQi+7kNm+9gaVZa3pjYbjd00R+yYAC
         oDWkAaTs8TP4vfBNbPw/RuxDfspFHLbTPLM5hlUFVnd1DdJtpLVaxOssW5Sgfv27qiuq
         ZPuJya/pwS3gIMqDDDzrEMax4Vvwe/4k7Nh5N5wuCSqT03GFjzl6dcRNtqGXPd/mpFiW
         hyiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787921657; x=1788526457;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EtQo4uL9ciRrWrgSm+7tcMPkQTLbUYsP8Kt9QCNYgXs=;
        b=iVFkd4A+c6CBNFvtATzUfJYsiOi/einm724tz2eu4haKaTyLc+so1r6EtunshxRMc4
         kIcjWOGxLrOYG2lYQ6z2kHH76Bs8wMnNQJ5dXfA4YDrs4YLpFVx3XFaCU7kU/IjDSDBK
         DIl3Hc/Pm30yqdYVdA34Vx2JYdH2WIn8Hg/Ee+LkahHYbwMteTvEPsIAN8DGQkFAcovn
         v/cCW1Nfsj3Av+3nChG2pJM3j0uYs3TV/A23z1RTllmpb/XZOh5p0vG+I6PhtkVxMRf/
         tU0U8sFdIM+UBIVTBbOvpf3JY2KBiSEo0q2O6qX236Ygn/4iUMSpEJ781J9MOpBU9ar+
         62wQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro8OnF/PSLbLxVvZD5auCn8MHCh1HU5RLUC74bvUyhXvt0l4JxG7fwO7d9zjymoAfiXVOKTg5FWUBPt0Xi3RD8n@lists.infradead.org
X-Gm-Message-State: AFuF++mtTyAbDfS+aYsfq0jxnUBYVcsAxFS+MIXxVUAqfEsN1dZYnTK1
	JiCiAakNxm4d8sgzkQthSt/o8H/zBTFALp1vIgsvK/ld8w1UlM7hQ5AghkU7FVckzr1qqy9duNK
	nEAulCdmvR6f+RA==
X-Received: from wmbgx10.prod.google.com ([2002:a05:600c:858a:b0:49a:d4b6:42fc])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:c0cf:b0:499:726b:7375 with SMTP id 5b1f17b1804b1-49b91c51e62mr90214355e9.14.1787921657014;
 Fri, 28 Aug 2026 05:54:17 -0700 (PDT)
Date: Fri, 28 Aug 2026 12:53:37 +0000
In-Reply-To: <20260828125409.1921538-1-smostafa@google.com>
Mime-Version: 1.0
References: <20260828125409.1921538-1-smostafa@google.com>
X-Mailer: git-send-email 2.55.0.897.gb25b4bd76c-goog
Message-ID: <20260828125409.1921538-3-smostafa@google.com>
Subject: [PATCH 2/7] iommu/arm-smmu-v3: Prevent rbtree corruption from
 duplicate streams
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, jgg@ziepe.ca, 
	nicolinc@nvidia.com, praan@google.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_055421_345317_517752D6 
X-CRM114-Status: GOOD (  14.34  )
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

In handling PCI devices with duplicate IDs, arm_smmu_insert_master()
will continue the loop skipping the duplicate sids insertion in the
rbtree.
However, in the error path of arm_smmu_insert_master() and in
arm_smmu_remove_master(), the code loops over all fwspec->num_ids and
calls rb_erase() unconditionally.

For the duplicate streams, the node is zero allocated including the
parent pointer "__rb_parent_color". That means rb_erase() will think
that this node is root and it will corrupt the tree which includes
other masters not being removed.

Fix this by initializing those nodes with RB_CLEAR_NODE() and check
if they are empty before erasing.

Fixes: cdf315f907d4 ("iommu/arm-smmu-v3: Maintain a SID->device structure")
Reported-by: Sashiko <>
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 494bbfd2869f..36e3778c971e 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -4147,8 +4147,10 @@ static int arm_smmu_insert_master(struct arm_smmu_device *smmu,
 					->master;
 
 			/* Bridged PCI devices may end up with duplicated IDs */
-			if (existing_master == master)
+			if (existing_master == master) {
+				RB_CLEAR_NODE(&new_stream->node);
 				continue;
+			}
 
 			dev_warn(master->dev,
 				 "Aliasing StreamID 0x%x (from %s) unsupported, expect DMA to be broken\n",
@@ -4159,8 +4161,10 @@ static int arm_smmu_insert_master(struct arm_smmu_device *smmu,
 	}
 
 	if (ret) {
-		for (i--; i >= 0; i--)
-			rb_erase(&master->streams[i].node, &smmu->streams);
+		for (i--; i >= 0; i--) {
+			if (!RB_EMPTY_NODE(&master->streams[i].node))
+				rb_erase(&master->streams[i].node, &smmu->streams);
+		}
 		kfree(master->streams);
 		kfree(master->build_invs);
 	}
@@ -4179,8 +4183,10 @@ static void arm_smmu_remove_master(struct arm_smmu_master *master)
 		return;
 
 	mutex_lock(&smmu->streams_mutex);
-	for (i = 0; i < fwspec->num_ids; i++)
-		rb_erase(&master->streams[i].node, &smmu->streams);
+	for (i = 0; i < fwspec->num_ids; i++) {
+		if (!RB_EMPTY_NODE(&master->streams[i].node))
+			rb_erase(&master->streams[i].node, &smmu->streams);
+	}
 	mutex_unlock(&smmu->streams_mutex);
 
 	kfree(master->streams);
-- 
2.55.0.897.gb25b4bd76c-goog


