Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B568F104951F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 09:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ttxazta4+9VArSIS1TYkCKSJ97bHw7VqLjcIgzTZGIg=; b=VLcPsHGjRts2c4PaWsp8cKMTem
	YGEznvmVsoKuPBnlpxuCGhhVw4lTjVrMFaFyavHVNi2AS9AhSaxZ/qYC7j97UzakskbbHbXr+wv6v
	PY+6q1ZQOKE7Zx0EPhYaZIrZbQcui30i6eKOFtG8k/pQ/qNbb3g0egtZcRUNncUM/ilgQ1zfhbvGW
	p0UlQMxemLaw+0t639k5Z0tj04VBgLuW9CNxyRJuTTcljQlrs6chyxfMlkA3U8pDWwzYW0FmVeap2
	PFKFNRWLh/3yTWHAH3d/uvRKbnekS/XlV0cfmf8JpL3YuWGtZfJfP2iXyDJS7EKGW4dCvCpZDUE1j
	tEqcYN3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0G7e-0000000BIxC-3DZI;
	Wed, 11 Mar 2026 09:44:58 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0G7b-0000000BIwn-468i
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 09:44:57 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2ae4d919f9bso63759845ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 02:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773222294; x=1773827094; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ttxazta4+9VArSIS1TYkCKSJ97bHw7VqLjcIgzTZGIg=;
        b=k1NPYeCuahG9BiM9azMPBheexBs6yvVa9hcIxMt2LZ3eI0UDqa5r1Pzpn0SqFDaZQP
         tK0vMEgmsYfb7qvKme7eroH1IILtd/kFY61225OPMFtjMaIhrIlmMWdoDg2nhkXjM9E9
         tTVVmzJEC6QhGkT3AkhgpoXQQpvQbfvyT0/B3AMp4o2CAwnsbwM/Cz8ooEqKQ6nuxvN1
         m3C3YJJw5mFkc1NDWquervFikVsFlUVrrtfh7cyN+RNWe/el1sGklryQCuJlwQyxctDC
         YmXAt2ZbJ4cE0W3VXE0+LiKSGl6QDI9Urn150WCpfKbiByhl21Ce+na0vLFLTgbUSFx0
         +Iaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773222294; x=1773827094;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ttxazta4+9VArSIS1TYkCKSJ97bHw7VqLjcIgzTZGIg=;
        b=O41AgVgjCoA1anZMAoQk7+rTrYgOX7aXPCJiZwqrriv4QIA+Ecgd/uEvXxT4J78wib
         s1sTkICu0yypVNJ88wdXNHxskeu66uAWEd81BTm6a0PIQJnvsDqpVamrjVCArZdbqYuT
         y8A/Byoo6yqsBnSGtqw7bFLb/gQ0EhrK2HRLqKDRmlZYYxsXW/t1wm8kRgtSd5s7QBRz
         BI7NUySRgulU0D8CC+rcuWFF7+pD2bzCRI04AoyOYswqpRhUd/aqyU9x+lY7oL1HKJvy
         yW9a5reQuqoN1qQy+RxXjlhbzbgEtD6zNWUlzk6sZFrel4LPta6ubL2f89ewKq1KJ/7j
         tEQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTiJK4IjRzwdFJodENCqb6dOP+apH5ddyL3AFc3mqmq8QqCq+M4Tzeg11kugZgzNMS1rxWY9lzHx91uQQm7ONV@lists.infradead.org
X-Gm-Message-State: AOJu0YxkbCgqT/kzgptHI6EAdHPgouZKXUEp5cnDd8iwYt7Q6T3Xd8BQ
	qwv6cMSHidcGnxczLEwyjdNLMgxIwxxF1eUHUXpDTfAgqOVjeMmiSV1I
X-Gm-Gg: ATEYQzx6aBf8HoEpnjXcVXZTga1JVfsph0E7vbfj8b98w338AcnyVhmXDXYAmOKyTH+
	ptApIaaKZx8XguBGHNQdhwGWPK9/eikxN+xqGUxcotm9SOr+bJaaxWghYeotrzxMzPKfvdoHgSu
	W2yJ6v5W/FPwtND0ueB6wuTisUDKNB7HV3ToMxg/z6WK7lu1gTHP9jqjeIEUb23ptuuVLh0wg+0
	cS4G4mZlnWLdFEYM1ueVSTapppzgCBkIG9Y+slkZQeMsLrVe6YxxuK3CQ7UfvL8WQam/2RV3Wlp
	u7Uw8a3/Z0hLVtW8TDj2FBptfBrvMcFfkXZYAg4pTTGGu94R6l91HTnoPPZIv6J07NPwZ1CEhOZ
	+ekaXHxj1U0GqqU/e5fozNfTDV+Z5IadRuIeLZNV+sSM0J7Y2VOayBqqxwG//eUcykHaWNShwIc
	huo/2togZm/+j7fyfagUAWsmuzy26urA==
X-Received: by 2002:a17:902:d4c7:b0:2ae:4dce:7e99 with SMTP id d9443c01a7336-2aeae7b4ed9mr19716495ad.20.1773222294132;
        Wed, 11 Mar 2026 02:44:54 -0700 (PDT)
Received: from arm-server.. ([2001:288:7001:2724:1a31:bfff:fe58:b622])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aeae246751sm18109015ad.23.2026.03.11.02.44.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 02:44:53 -0700 (PDT)
From: Cheng-Yang Chou <yphbchou0911@gmail.com>
To: will@kernel.org
Cc: robin.murphy@arm.com,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	jserv@ccns.ncku.edu.tw,
	Cheng-Yang Chou <yphbchou0911@gmail.com>
Subject: [PATCH] iommu/arm-smmu-v3: Allocate cmdq_batch on the heap
Date: Wed, 11 Mar 2026 17:44:44 +0800
Message-ID: <20260311094444.3714302-1-yphbchou0911@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_024456_024275_CF613E92 
X-CRM114-Status: GOOD (  14.81  )
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

The arm_smmu_cmdq_batch structure is large and was being allocated on
the stack in four call sites, causing stack frame sizes to exceed the
1024-byte limit:

- arm_smmu_atc_inv_domain: 1120 bytes
- arm_smmu_atc_inv_master: 1088 bytes
- arm_smmu_sync_cd: 1088 bytes
- __arm_smmu_tlb_inv_range: 1072 bytes

Move these allocations to the heap using kmalloc_obj() and kfree() to
eliminate the -Wframe-larger-than=1024 warnings and prevent potential
stack overflows.

Signed-off-by: Cheng-Yang Chou <yphbchou0911@gmail.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 66 +++++++++++++++------
 1 file changed, 48 insertions(+), 18 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 4d00d796f078..734546dc6a78 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -1281,7 +1281,7 @@ static void arm_smmu_sync_cd(struct arm_smmu_master *master,
 			     int ssid, bool leaf)
 {
 	size_t i;
-	struct arm_smmu_cmdq_batch cmds;
+	struct arm_smmu_cmdq_batch *cmds;
 	struct arm_smmu_device *smmu = master->smmu;
 	struct arm_smmu_cmdq_ent cmd = {
 		.opcode	= CMDQ_OP_CFGI_CD,
@@ -1291,13 +1291,23 @@ static void arm_smmu_sync_cd(struct arm_smmu_master *master,
 		},
 	};
 
-	arm_smmu_cmdq_batch_init(smmu, &cmds, &cmd);
+	cmds = kmalloc_obj(*cmds);
+	if (!cmds) {
+		struct arm_smmu_cmdq_ent cmd_all = { .opcode = CMDQ_OP_CFGI_ALL };
+
+		WARN_ONCE(1, "arm-smmu-v3: failed to allocate cmdq_batch, falling back to full CD invalidation\n");
+		arm_smmu_cmdq_issue_cmd_with_sync(smmu, &cmd_all);
+		return;
+	}
+
+	arm_smmu_cmdq_batch_init(smmu, cmds, &cmd);
 	for (i = 0; i < master->num_streams; i++) {
 		cmd.cfgi.sid = master->streams[i].id;
-		arm_smmu_cmdq_batch_add(smmu, &cmds, &cmd);
+		arm_smmu_cmdq_batch_add(smmu, cmds, &cmd);
 	}
 
-	arm_smmu_cmdq_batch_submit(smmu, &cmds);
+	arm_smmu_cmdq_batch_submit(smmu, cmds);
+	kfree(cmds);
 }
 
 static void arm_smmu_write_cd_l1_desc(struct arm_smmu_cdtab_l1 *dst,
@@ -2225,31 +2235,37 @@ arm_smmu_atc_inv_to_cmd(int ssid, unsigned long iova, size_t size,
 static int arm_smmu_atc_inv_master(struct arm_smmu_master *master,
 				   ioasid_t ssid)
 {
-	int i;
+	int i, ret;
 	struct arm_smmu_cmdq_ent cmd;
-	struct arm_smmu_cmdq_batch cmds;
+	struct arm_smmu_cmdq_batch *cmds;
 
 	arm_smmu_atc_inv_to_cmd(ssid, 0, 0, &cmd);
 
-	arm_smmu_cmdq_batch_init(master->smmu, &cmds, &cmd);
+	cmds = kmalloc_obj(*cmds);
+	if (!cmds)
+		return -ENOMEM;
+
+	arm_smmu_cmdq_batch_init(master->smmu, cmds, &cmd);
 	for (i = 0; i < master->num_streams; i++) {
 		cmd.atc.sid = master->streams[i].id;
-		arm_smmu_cmdq_batch_add(master->smmu, &cmds, &cmd);
+		arm_smmu_cmdq_batch_add(master->smmu, cmds, &cmd);
 	}
 
-	return arm_smmu_cmdq_batch_submit(master->smmu, &cmds);
+	ret = arm_smmu_cmdq_batch_submit(master->smmu, cmds);
+	kfree(cmds);
+	return ret;
 }
 
 int arm_smmu_atc_inv_domain(struct arm_smmu_domain *smmu_domain,
 			    unsigned long iova, size_t size)
 {
 	struct arm_smmu_master_domain *master_domain;
-	int i;
+	int i, ret;
 	unsigned long flags;
 	struct arm_smmu_cmdq_ent cmd = {
 		.opcode = CMDQ_OP_ATC_INV,
 	};
-	struct arm_smmu_cmdq_batch cmds;
+	struct arm_smmu_cmdq_batch *cmds;
 
 	if (!(smmu_domain->smmu->features & ARM_SMMU_FEAT_ATS))
 		return 0;
@@ -2271,7 +2287,11 @@ int arm_smmu_atc_inv_domain(struct arm_smmu_domain *smmu_domain,
 	if (!atomic_read(&smmu_domain->nr_ats_masters))
 		return 0;
 
-	arm_smmu_cmdq_batch_init(smmu_domain->smmu, &cmds, &cmd);
+	cmds = kmalloc_obj(*cmds);
+	if (!cmds)
+		return -ENOMEM;
+
+	arm_smmu_cmdq_batch_init(smmu_domain->smmu, cmds, &cmd);
 
 	spin_lock_irqsave(&smmu_domain->devices_lock, flags);
 	list_for_each_entry(master_domain, &smmu_domain->devices,
@@ -2294,12 +2314,14 @@ int arm_smmu_atc_inv_domain(struct arm_smmu_domain *smmu_domain,
 
 		for (i = 0; i < master->num_streams; i++) {
 			cmd.atc.sid = master->streams[i].id;
-			arm_smmu_cmdq_batch_add(smmu_domain->smmu, &cmds, &cmd);
+			arm_smmu_cmdq_batch_add(smmu_domain->smmu, cmds, &cmd);
 		}
 	}
 	spin_unlock_irqrestore(&smmu_domain->devices_lock, flags);
 
-	return arm_smmu_cmdq_batch_submit(smmu_domain->smmu, &cmds);
+	ret = arm_smmu_cmdq_batch_submit(smmu_domain->smmu, cmds);
+	kfree(cmds);
+	return ret;
 }
 
 /* IO_PGTABLE API */
@@ -2334,7 +2356,7 @@ static void __arm_smmu_tlb_inv_range(struct arm_smmu_cmdq_ent *cmd,
 	struct arm_smmu_device *smmu = smmu_domain->smmu;
 	unsigned long end = iova + size, num_pages = 0, tg = 0;
 	size_t inv_range = granule;
-	struct arm_smmu_cmdq_batch cmds;
+	struct arm_smmu_cmdq_batch *cmds;
 
 	if (!size)
 		return;
@@ -2362,7 +2384,14 @@ static void __arm_smmu_tlb_inv_range(struct arm_smmu_cmdq_ent *cmd,
 			num_pages++;
 	}
 
-	arm_smmu_cmdq_batch_init(smmu, &cmds, cmd);
+	cmds = kmalloc_obj(*cmds);
+	if (!cmds) {
+		WARN_ONCE(1, "arm-smmu-v3: failed to allocate cmdq_batch, falling back to full TLB invalidation\n");
+		arm_smmu_tlb_inv_context(smmu_domain);
+		return;
+	}
+
+	arm_smmu_cmdq_batch_init(smmu, cmds, cmd);
 
 	while (iova < end) {
 		if (smmu->features & ARM_SMMU_FEAT_RANGE_INV) {
@@ -2391,10 +2420,11 @@ static void __arm_smmu_tlb_inv_range(struct arm_smmu_cmdq_ent *cmd,
 		}
 
 		cmd->tlbi.addr = iova;
-		arm_smmu_cmdq_batch_add(smmu, &cmds, cmd);
+		arm_smmu_cmdq_batch_add(smmu, cmds, cmd);
 		iova += inv_range;
 	}
-	arm_smmu_cmdq_batch_submit(smmu, &cmds);
+	arm_smmu_cmdq_batch_submit(smmu, cmds);
+	kfree(cmds);
 }
 
 static void arm_smmu_tlb_inv_range_domain(unsigned long iova, size_t size,
-- 
2.48.1


