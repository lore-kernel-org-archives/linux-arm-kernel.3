Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EA5DD132B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 12:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UOm8t3tx397O6nSn3xLibpe5sobjrBVkHwLcbsHi2vg=; b=yaPcJr1ce2weDzQLFTMQX7Bg5O
	Fw2gm5V/ibsq7Hrw76KQEYQhavLLtlDzG7ZuCK0iDZmy6hcu2AOa6yWMxB6jXwJ+FvNlHtEnlCtlk
	X6I2opQclrtZjKfVmJ1C5wBaZSrQuxTmox1sPGXDxGPOjbc14ZARJLMW6u1pbcyjo7Lmxuhew7vJZ
	q/tKyCihDipNuCcSMjKjKk5umEKgPggKIXvr6htFtGVOah6BqVuKV2JY6HcbFHLyyTPTH7yt5kUKe
	+JnvH74c1qvc4+wSCRKYZNCMCuGx0vxlMm5advt8neyj7fuq7gY+l0PbZswQ+Ks3S8Nftf+Yq+m4e
	r16wRG6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7vuq-0000000DeVK-0Mje;
	Mon, 04 Nov 2024 12:10:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7vhY-0000000DcBq-3qc9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 11:56:58 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A4BjXGG013477;
	Mon, 4 Nov 2024 11:56:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UOm8t3tx397O6nSn3xLibpe5
	sobjrBVkHwLcbsHi2vg=; b=Z2PZbyey9pZCiAkUx67sGk7MKt1k/rnf2ZIg9iwZ
	5VUt1F3NkF3xkVVmQq+ZO0Uc0wlihSzXzKQ+uQec1iKUIqVsZOyIkPKRVoN1CrOv
	nJzLv7Ft7yJPUfIg71NJo76dTe8ZUCUjNYGW5WQIHcR7y8Cy+C4DGO4PL7A71Hm1
	+37coQPoOwIySqF5cyahR4sy7Wq6YcQEFoMxbPO7AX+cA0Fp9C7oKLZl9pQ+6EOh
	5DeIjMYBC/eSvE7HWPuF4/lYkX8FfSsC3hsLLXIwN8c/le+jF8E46Q+M2yl9Wb6E
	eQKUwpcyXrXMXX2/bcSwxBhF5obbvkjKix6Q3V7+ZlidMQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42nd4um2p1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Nov 2024 11:56:47 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A4BuSuC004393
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 4 Nov 2024 11:56:28 GMT
Received: from jinlmao-gv.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 4 Nov 2024 03:56:25 -0800
From: Mao Jinlong <quic_jinlmao@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>, James Clark <james.clark@arm.com>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Mao Jinlong <quic_jinlmao@quicinc.com>,
        "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>
CC: <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>
Subject: [PATCH v6 2/3] coresight: Add support to get static id for system trace sources
Date: Mon, 4 Nov 2024 19:56:03 +0800
Message-ID: <20241104115604.14522-3-quic_jinlmao@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241104115604.14522-1-quic_jinlmao@quicinc.com>
References: <20241104115604.14522-1-quic_jinlmao@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: xa2-vw6mkQSFeP7Qw4DT09FP2vdLpRwt
X-Proofpoint-ORIG-GUID: xa2-vw6mkQSFeP7Qw4DT09FP2vdLpRwt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 mlxlogscore=999 impostorscore=0 suspectscore=0 spamscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411040105
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_035657_105554_E019BBE9 
X-CRM114-Status: GOOD (  22.71  )
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

Dynamic trace id was introduced in coresight subsystem, so trace id is
allocated dynamically. However, some hardware ATB source has static trace
id and it cannot be changed via software programming. For such source,
it can call coresight_get_static_trace_id to get the fixed trace id from
device node and pass id to coresight_trace_id_get_static_system_id to
reserve the id.

Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
Reviewed-by: Mike Leach <mike.leach@linaro.org>
---
 .../hwtracing/coresight/coresight-platform.c  |  6 +++
 .../hwtracing/coresight/coresight-trace-id.c  | 39 +++++++++++++------
 .../hwtracing/coresight/coresight-trace-id.h  |  9 +++++
 include/linux/coresight.h                     |  1 +
 4 files changed, 44 insertions(+), 11 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-platform.c b/drivers/hwtracing/coresight/coresight-platform.c
index 64e171eaad82..633d96b9577a 100644
--- a/drivers/hwtracing/coresight/coresight-platform.c
+++ b/drivers/hwtracing/coresight/coresight-platform.c
@@ -796,6 +796,12 @@ int coresight_get_cpu(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(coresight_get_cpu);
 
+int coresight_get_static_trace_id(struct device *dev, u32 *id)
+{
+	return fwnode_property_read_u32(dev_fwnode(dev), "arm,static-trace-id", id);
+}
+EXPORT_SYMBOL_GPL(coresight_get_static_trace_id);
+
 struct coresight_platform_data *
 coresight_get_platform_data(struct device *dev)
 {
diff --git a/drivers/hwtracing/coresight/coresight-trace-id.c b/drivers/hwtracing/coresight/coresight-trace-id.c
index d98e12cb30ec..df8fe50b413f 100644
--- a/drivers/hwtracing/coresight/coresight-trace-id.c
+++ b/drivers/hwtracing/coresight/coresight-trace-id.c
@@ -12,6 +12,12 @@
 
 #include "coresight-trace-id.h"
 
+enum trace_id_flags {
+	TRACE_ID_ANY = 0x0,
+	TRACE_ID_PREFER_ODD = 0x1,
+	TRACE_ID_REQ_STATIC = 0x2,
+};
+
 /* Default trace ID map. Used in sysfs mode and for system sources */
 static DEFINE_PER_CPU(atomic_t, id_map_default_cpu_ids) = ATOMIC_INIT(0);
 static struct coresight_trace_id_map id_map_default = {
@@ -74,16 +80,18 @@ static int coresight_trace_id_find_odd_id(struct coresight_trace_id_map *id_map)
  * Otherwise allocate next available ID.
  */
 static int coresight_trace_id_alloc_new_id(struct coresight_trace_id_map *id_map,
-					   int preferred_id, bool prefer_odd_id)
+					   int preferred_id, unsigned int flags)
 {
 	int id = 0;
 
 	/* for backwards compatibility, cpu IDs may use preferred value */
-	if (IS_VALID_CS_TRACE_ID(preferred_id) &&
-	    !test_bit(preferred_id, id_map->used_ids)) {
-		id = preferred_id;
-		goto trace_id_allocated;
-	} else if (prefer_odd_id) {
+	if (IS_VALID_CS_TRACE_ID(preferred_id)) {
+		if (!test_bit(preferred_id, id_map->used_ids)) {
+			id = preferred_id;
+			goto trace_id_allocated;
+		} else if (flags & TRACE_ID_REQ_STATIC)
+			return -EINVAL;
+	} else if (flags & TRACE_ID_PREFER_ODD) {
 	/* may use odd ids to avoid preferred legacy cpu IDs */
 		id = coresight_trace_id_find_odd_id(id_map);
 		if (id)
@@ -153,7 +161,7 @@ static int _coresight_trace_id_get_cpu_id(int cpu, struct coresight_trace_id_map
 	 */
 	id = coresight_trace_id_alloc_new_id(id_map,
 					     CORESIGHT_LEGACY_CPU_TRACE_ID(cpu),
-					     false);
+					     TRACE_ID_ANY);
 	if (!IS_VALID_CS_TRACE_ID(id))
 		goto get_cpu_id_out_unlock;
 
@@ -188,14 +196,14 @@ static void _coresight_trace_id_put_cpu_id(int cpu, struct coresight_trace_id_ma
 	DUMP_ID_MAP(id_map);
 }
 
-static int coresight_trace_id_map_get_system_id(struct coresight_trace_id_map *id_map)
+static int coresight_trace_id_map_get_system_id(struct coresight_trace_id_map *id_map,
+					int preferred_id, unsigned int traceid_flags)
 {
 	unsigned long flags;
 	int id;
 
 	spin_lock_irqsave(&id_map->lock, flags);
-	/* prefer odd IDs for system components to avoid legacy CPU IDS */
-	id = coresight_trace_id_alloc_new_id(id_map, 0, true);
+	id = coresight_trace_id_alloc_new_id(id_map, preferred_id, traceid_flags);
 	spin_unlock_irqrestore(&id_map->lock, flags);
 
 	DUMP_ID(id);
@@ -255,10 +263,19 @@ EXPORT_SYMBOL_GPL(coresight_trace_id_read_cpu_id_map);
 
 int coresight_trace_id_get_system_id(void)
 {
-	return coresight_trace_id_map_get_system_id(&id_map_default);
+	/* prefer odd IDs for system components to avoid legacy CPU IDS */
+	return coresight_trace_id_map_get_system_id(&id_map_default, 0,
+			TRACE_ID_PREFER_ODD);
 }
 EXPORT_SYMBOL_GPL(coresight_trace_id_get_system_id);
 
+int coresight_trace_id_get_static_system_id(int trace_id)
+{
+	return coresight_trace_id_map_get_system_id(&id_map_default,
+			trace_id, TRACE_ID_REQ_STATIC);
+}
+EXPORT_SYMBOL_GPL(coresight_trace_id_get_static_system_id);
+
 void coresight_trace_id_put_system_id(int id)
 {
 	coresight_trace_id_map_put_system_id(&id_map_default, id);
diff --git a/drivers/hwtracing/coresight/coresight-trace-id.h b/drivers/hwtracing/coresight/coresight-trace-id.h
index 9aae50a553ca..db68e1ec56b6 100644
--- a/drivers/hwtracing/coresight/coresight-trace-id.h
+++ b/drivers/hwtracing/coresight/coresight-trace-id.h
@@ -116,6 +116,15 @@ int coresight_trace_id_read_cpu_id_map(int cpu, struct coresight_trace_id_map *i
  */
 int coresight_trace_id_get_system_id(void);
 
+/**
+ * Allocate a CoreSight static trace ID for a system component.
+ *
+ * Used to allocate static IDs for system trace sources such as dummy source.
+ *
+ * return: Trace ID or -EINVAL if allocation is impossible.
+ */
+int coresight_trace_id_get_static_system_id(int id);
+
 /**
  * Release an allocated system trace ID.
  *
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index c13342594278..129795873072 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -662,6 +662,7 @@ void coresight_relaxed_write64(struct coresight_device *csdev,
 void coresight_write64(struct coresight_device *csdev, u64 val, u32 offset);
 
 extern int coresight_get_cpu(struct device *dev);
+extern int coresight_get_static_trace_id(struct device *dev, u32 *id);
 
 struct coresight_platform_data *coresight_get_platform_data(struct device *dev);
 struct coresight_connection *
-- 
2.17.1


