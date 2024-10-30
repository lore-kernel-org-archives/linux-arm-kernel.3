Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9285D5B86D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 09:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mf7KFV+hbtusH/XSAREKJCBjR9jclp7UmMM3e76fQls=; b=wvkZf+8n4c75Fa/DYzzlOZhD6G
	TeiLqbPhiV3L48Y73fY8HOvYOmIMumW4BROWNlbjqT12kq9ashB35FcqMfcqPuFNy0Y5BH48G3v0z
	t1PAKIkOSrrsyuToO4+XQRYGZQr1fLNFISoGeBvkXa0qNHgyMYUoKDdzaTIAZsuHBr2vkFra1NHF1
	8JKHz2doYnUly/VqA9jzYdBheCcEHEb12GGjTDDaBL40y9SuN8mKvBvQSsOmX5puBZptoObmy+FzA
	JbFnyfFSEvJCeBWOSNlmHqHbMfWTi4fXvyQ10KoJGD8QqmIl5FPGF3/Bm+Tjb1WrAvzfjjMrkLAhy
	0Pl/Uj5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t65AX-0000000HPrZ-3Dgn;
	Wed, 30 Oct 2024 09:39:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6559-0000000HOup-2qoT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 09:33:40 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49U8tG1e007054;
	Wed, 30 Oct 2024 09:33:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Mf7KFV+hbtusH/XSAREKJCBj
	R9jclp7UmMM3e76fQls=; b=CkFfTS7SJWoVA9+82OLk7REB+f2n0SFs8u4RNqfN
	TmTlO3F+nJbVCPscQJP1dbhqiCNZ6rvergd2uoJpdYUTqcau9oDFMtlEjNJ0jXvP
	WpqMfIKIaEB8/4s1RvgKoVcmlG0JQVJNVW/D1aZNoLFjyE1XOMjdCt++1py7pOHd
	8T7zatMhqLHO8FsqF9JlxVMhsyHt8fG9LZKv4XNgrmSfy4zwpkxpBfp+f/n9MPnl
	XrJY1bS9PmAcQpS5gVVUZ9ErYRIWtEIQkuzTyQp6R8b48iTCU+afT8urbN08kal7
	Qysm5s1RCM2rTTUFITa7m6VcZMmrnFkO+gzgaaH+R5INNw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42khqbr3y8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Oct 2024 09:33:28 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49U9XRoQ025610
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Oct 2024 09:33:27 GMT
Received: from taozha2-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 30 Oct 2024 02:33:23 -0700
From: Tao Zhang <quic_taozha@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>, James Clark <james.clark@arm.com>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan
	<leo.yan@linux.dev>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
CC: Tao Zhang <quic_taozha@quicinc.com>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
Subject: [PATCH v5 2/4] coresight: Add a helper to check if a device is source
Date: Wed, 30 Oct 2024 17:32:53 +0800
Message-ID: <20241030093255.26915-3-quic_taozha@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241030093255.26915-1-quic_taozha@quicinc.com>
References: <20241030093255.26915-1-quic_taozha@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: -X1xkpsfHRg71X2kVtpVuU9_yPOW9a6M
X-Proofpoint-ORIG-GUID: -X1xkpsfHRg71X2kVtpVuU9_yPOW9a6M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=896
 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxscore=0 suspectscore=0
 malwarescore=0 spamscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410300074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_023339_858192_E1D47DD7 
X-CRM114-Status: GOOD (  14.64  )
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

Since there are a lot of places in the code to check whether the
device is source, add a helper to check it.

Signed-off-by: Tao Zhang <quic_taozha@quicinc.com>
---
 drivers/hwtracing/coresight/coresight-tpda.c | 2 +-
 include/linux/coresight.h                    | 7 ++++++-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/hwtracing/coresight/coresight-tpda.c
index bfca103f9f84..ad023a2a99d1 100644
--- a/drivers/hwtracing/coresight/coresight-tpda.c
+++ b/drivers/hwtracing/coresight/coresight-tpda.c
@@ -24,7 +24,7 @@ DEFINE_CORESIGHT_DEVLIST(tpda_devs, "tpda");
 
 static bool coresight_device_is_tpdm(struct coresight_device *csdev)
 {
-	return (csdev->type == CORESIGHT_DEV_TYPE_SOURCE) &&
+	return (coresight_is_device_source(csdev)) &&
 	       (csdev->subtype.source_subtype ==
 			CORESIGHT_DEV_SUBTYPE_SOURCE_TPDM);
 }
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index c13342594278..9311df8538fc 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -588,9 +588,14 @@ static inline void csdev_access_write64(struct csdev_access *csa, u64 val, u32 o
 }
 #endif	/* CONFIG_64BIT */
 
+static inline bool coresight_is_device_source(struct coresight_device *csdev)
+{
+	return csdev && (csdev->type == CORESIGHT_DEV_TYPE_SOURCE);
+}
+
 static inline bool coresight_is_percpu_source(struct coresight_device *csdev)
 {
-	return csdev && (csdev->type == CORESIGHT_DEV_TYPE_SOURCE) &&
+	return csdev && coresight_is_device_source(csdev) &&
 	       (csdev->subtype.source_subtype == CORESIGHT_DEV_SUBTYPE_SOURCE_PROC);
 }
 
-- 
2.17.1


