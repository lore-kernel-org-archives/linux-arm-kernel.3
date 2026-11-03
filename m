Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C1C960A6F45
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 10:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HPDsXbxj;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CvW5N8R8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=1roqBbIak5VHBopkuBjXyP6vvZ/gKcXngvv3D+lgPI4=; b=HPDsXbxj04xZEWWN0RE0LtrcRp
	znvTAU/eJGlyGRLYKAJVIKyybvb41vUASqZJiEbCWFzfzA0CbZCMnCiTN2x7ja1SezcYmeEmDHOd7
	U5bSRzSIhNp3FV61+7RsQsG2uVr7cDsPZ19WUekQ1W3+tL/M4e1IJsOkrYtreVCY6wfqS8QDH93fS
	xd09hkhIsUrjQ792KvxTuFARFpM12EhBnhoVA3NAfr5fakNlGQGvHXvuKeg2gPjQpDL2kaVamyWTQ
	6eswORwXB30TET4dFNmG7gVM30vzcdbdW6VgyL3m2aO3ZilUUieeePXuMY7DOeVPK+3ntho+8G8m4
	5t0fETBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOBXb-00000001vGb-0ed1;
	Tue, 03 Nov 2026 10:14:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOBXX-00000001vC6-0XzL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 10:14:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DC04C43957;
	Tue,  3 Nov 2026 10:14:50 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793700890;
	b=aWT+2fTfb6rSyDp8hqxkU37bzf4dU0GAZml/Rhbd9pfZegz2zqHNNAsP7lYrjMgzye7n
	 MSHJx7rk5NH9ai83NCsApH6rCYx4T/ABFtiR8yEUqiwar5AovXeGJn0vEYZQaaCNqkU/9
	 3ke2cGXo9xYo7t7g6MTLpmvTmDDqrEQCwxGNyAYSM94k9LYCCvXZXd1vyrGmoNs7rDkqZ
	 zICbLwYX+79TMnszrX7uDhnZ1tGBr0fCNs3CdgtLtEBXk67h4WXtsAI0N19RPImA/49TX
	 oY7Dy1gF9ooSnC0ghkSli5P79xaFGuvXiQkAUZTvARr1yk3cpIpxzSx0gtbnMgSTmmw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793700890;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=1roqBbIak5VHBopkuBjXyP6vvZ/gKcXngvv3D+lgPI4=;
	b=02CKluIsx9GuHIWZe81hEdJd3zRDOzz9VulzgqRYXrfvoDweqNorAcMfjCdGj5RaSqSL
	 ulonULmSaKBCNiIgDEPPvtw8YXmR1cgmXmQi1khIUmFW42nHKX0fX2CqLg2ax6ggm8UsO
	 QnIZ+D3xg0QL3A0sCVROG2F9jhzETgqDz2tv6wSO9ywQ0FQAWMQjWqrbCi0uHSM54lCNf
	 JBfo3UQncZLbdQ4ayhyAwA/kj56ImLDa796Jjsl4CC3JG2K4V3Gog+wTN8nCQTilX8s6Y
	 706TJ3vDevNw9fYYut+t7VJRKu9duCzHt862A5oNafCzsIdoMP4KKGHZAeO2hlqtgXw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7C3001F00A1C;
	Tue,  3 Nov 2026 10:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793700890;
	bh=1roqBbIak5VHBopkuBjXyP6vvZ/gKcXngvv3D+lgPI4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=CvW5N8R8AvnO6UMiOdlXxmdqCmZTc8DnG3iXw+FB1bJUV20gUBVMo1W+p/+zyLNOs
	 ngTTubzl/yivfhesbqf2eoneUpI35dRkGPoQ9SoiEH1bkWRUQkQBiTBlZS5AMxrPdI
	 oNjwqMf6XXwBe/A2GQh5QjOU/dKjfBu9jlVikUrUNlD+r9Qo0DxMRUYygkdWATe5Fl
	 wh/nfh3bitmJohD4132CbSM+s3Wb/DKOox9XaCVoZJlSqOI4kwAJDNIhmXrk5Row1M
	 h3OfO0Kun4ked4eU+T4y2SrEwyZhjmhYCffBDgkhJiALHSSStqP2RJXt6GlOW+tHmh
	 BV1zZYpVtqkOA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id B9FA0468A5;
	Tue,  3 Nov 2026 10:14:47 +0000 (UTC)
From: Myria Sarvay via B4 Relay <devnull+myrialsarvay.gmail.com@kernel.org>
Date: Tue, 03 Nov 2026 21:14:40 +1100
Subject: [PATCH 05/13] drivers/perf: apple_m1: Use macros for
 per-implementation init functions
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261103-m3-plus-pmu-events-v1-5-a8eb6c1139fe@gmail.com>
References: <20261103-m3-plus-pmu-events-v1-0-a8eb6c1139fe@gmail.com>
In-Reply-To: <20261103-m3-plus-pmu-events-v1-0-a8eb6c1139fe@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, Yuvan Shen <yuvanshen09@gmail.com>, 
 Myria Sarvay <myrialsarvay@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4754;
 i=myrialsarvay@gmail.com; h=from:subject:message-id;
 bh=Xf+Ed/oAri86Vq9SpKX25Hm7YiUp82G8Mq/Z76SJGJE=;
 b=owJ4nJvAy8zAJRbk4iixYu2/l4yn1ZIYsl5uERGYY5X6t0J5xhu7i2If/fP3fo3yVbA1brhx4
 90NjWc1P493lLIwiHExyIopsuibpmlPZmu4VLrMdQvMHFYmkCEMXJwCMJGJiowMj8KuRj55YVrR
 fbNXyvizxJuQmOlzRM5lvD5/fwZPg82ZFYwMG2tZ6k3/uZ893/VqyuebQU5PTpxvDdhtK+tzavm
 cIFFnBgBJxU3A
X-Developer-Key: i=myrialsarvay@gmail.com; a=openpgp;
 fpr=2F35662B930680D275A645B452444118A8ADFEE9
X-Endpoint-Received: by B4 Relay for myrialsarvay@gmail.com/default with
 auth_id=1027
X-Original-From: Myria Sarvay <myrialsarvay@gmail.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: myrialsarvay@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Myria Sarvay <myrialsarvay@gmail.com>

6 generations of apple silicon, with at least 2 init functions for each
lead to at least 12 init functions. Template them with macros to save
boilterplate code.

Signed-off-by: Myria Sarvay <myrialsarvay@gmail.com>
---
 drivers/perf/apple_m1_cpu_pmu.c | 91 ++++++++++++++---------------------------
 1 file changed, 30 insertions(+), 61 deletions(-)

diff --git a/drivers/perf/apple_m1_cpu_pmu.c b/drivers/perf/apple_m1_cpu_pmu.c
index a14864263bf1..e7e9b51ffadc 100644
--- a/drivers/perf/apple_m1_cpu_pmu.c
+++ b/drivers/perf/apple_m1_cpu_pmu.c
@@ -653,71 +653,40 @@ static int apple_pmu_init(struct arm_pmu *cpu_pmu)
 }
 
 /* Device driver gunk */
-static int m1_pmu_ice_init(struct arm_pmu *cpu_pmu)
-{
-	cpu_pmu->name = "apple_icestorm_pmu";
-	cpu_pmu->enable		  = m1_pmu_enable_event;
-	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
-	cpu_pmu->map_event	  = m1_pmu_map_event;
-	cpu_pmu->set_event_filter = m1_pmu_set_event_filter;
-
-	cpu_pmu->map_pmuv3_event  = m1_pmu_map_pmuv3_event;
-
-	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] = &m1_pmu_events_attr_group;
-	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_FORMATS] = &m1_pmu_format_attr_group;
-	return apple_pmu_init(cpu_pmu);
-}
-
-static int m1_pmu_fire_init(struct arm_pmu *cpu_pmu)
-{
-	cpu_pmu->name = "apple_firestorm_pmu";
-	cpu_pmu->enable		  = m1_pmu_enable_event;
-	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
-	cpu_pmu->map_event	  = m1_pmu_map_event;
-	cpu_pmu->set_event_filter = m1_pmu_set_event_filter;
-
-	cpu_pmu->map_pmuv3_event  = m1_pmu_map_pmuv3_event;
-
-	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] = &m1_pmu_events_attr_group;
-	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_FORMATS] = &m1_pmu_format_attr_group;
-	return apple_pmu_init(cpu_pmu);
-}
-
-static int m2_pmu_avalanche_init(struct arm_pmu *cpu_pmu)
-{
-	cpu_pmu->name = "apple_avalanche_pmu";
-	cpu_pmu->enable		  = m1_pmu_enable_event;
-	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
-	cpu_pmu->map_event	  = m2_pmu_map_event;
-	cpu_pmu->set_event_filter = m1_pmu_set_event_filter;
-
-	cpu_pmu->map_pmuv3_event  = m1_pmu_map_pmuv3_event;
-
-	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] = &m1_pmu_events_attr_group;
-	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_FORMATS] = &m1_pmu_format_attr_group;
-	return apple_pmu_init(cpu_pmu);
-}
-
-static int m2_pmu_blizzard_init(struct arm_pmu *cpu_pmu)
-{
-	cpu_pmu->name = "apple_blizzard_pmu";
-	cpu_pmu->enable		  = m1_pmu_enable_event;
-	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
-	cpu_pmu->map_event	  = m2_pmu_map_event;
-	cpu_pmu->set_event_filter = m1_pmu_set_event_filter;
-
-	cpu_pmu->map_pmuv3_event  = m1_pmu_map_pmuv3_event;
-
-	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] = &m1_pmu_events_attr_group;
-	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_FORMATS] = &m1_pmu_format_attr_group;
-	return apple_pmu_init(cpu_pmu);
-}
+#define APPLE_PMU_INIT(gen, family)								\
+static int gen ## _pmu_ ## family ## _init(struct arm_pmu *cpu_pmu)				\
+{												\
+	cpu_pmu->name			= "apple_" #family "_pmu";				\
+	cpu_pmu->enable			= gen ## _pmu_enable_event;				\
+	cpu_pmu->get_event_idx		= gen ## _pmu_get_event_idx;				\
+	cpu_pmu->map_event		= gen ## _pmu_map_event;				\
+	cpu_pmu->set_event_filter	= gen ## _pmu_set_event_filter;				\
+												\
+	cpu_pmu->map_pmuv3_event	= gen ## _pmu_map_pmuv3_event;				\
+												\
+	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] = &gen ## _pmu_events_attr_group;	\
+	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_FORMATS] = &gen ## _pmu_format_attr_group;	\
+	return apple_pmu_init(cpu_pmu);								\
+}
+
+#define m2_pmu_enable_event		m1_pmu_enable_event
+#define m2_pmu_get_event_idx		m1_pmu_get_event_idx
+#define m2_pmu_set_event_filter		m1_pmu_set_event_filter
+#define m2_pmu_map_pmuv3_event		m1_pmu_map_pmuv3_event
+#define m2_pmu_init_pmceid		m1_pmu_init_pmceid
+#define m2_pmu_events_attr_group	m1_pmu_events_attr_group
+#define m2_pmu_format_attr_group	m1_pmu_format_attr_group
+
+APPLE_PMU_INIT(m1, icestorm)
+APPLE_PMU_INIT(m1, firestorm)
+APPLE_PMU_INIT(m2, avalanche)
+APPLE_PMU_INIT(m2, blizzard)
 
 static const struct of_device_id m1_pmu_of_device_ids[] = {
 	{ .compatible = "apple,avalanche-pmu",	.data = m2_pmu_avalanche_init, },
 	{ .compatible = "apple,blizzard-pmu",	.data = m2_pmu_blizzard_init, },
-	{ .compatible = "apple,icestorm-pmu",	.data = m1_pmu_ice_init, },
-	{ .compatible = "apple,firestorm-pmu",	.data = m1_pmu_fire_init, },
+	{ .compatible = "apple,icestorm-pmu",	.data = m1_pmu_icestorm_init, },
+	{ .compatible = "apple,firestorm-pmu",	.data = m1_pmu_firestorm_init, },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, m1_pmu_of_device_ids);

-- 
2.56.0



