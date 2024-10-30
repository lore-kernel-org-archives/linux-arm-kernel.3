Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B4AFD5B86D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 09:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w3QGRmNgjXIiFwwmNaUFfizyUclQYS0Fh9BYwMiMwvs=; b=Op9E+V2TxALcZDiSVh5c8X85yE
	OCJAC1Og9sxUQBOzi2SA8Sjf1Gjtgclu3rGtqVM2s+mFqO9Tf2vfNmxJJrHZe6N7jnzwNmRZsGb/D
	06BUy54ngrWxEmARlm/czKhrX7ArKAIP2TIb22T/a/9kXQDK3O/znUHRvmdty9x8IFDVl/1dwT0rh
	Sq2zkVCiE64qbneAAJqM2936HfYczA0xyf39bGEdbn6OImeZu/Jh3Dri9tG6RsO3kc/6hkwgNITqU
	5YTv8g1vdzPfC3Ogyx/NYdrqPYa7ux7MwO+dOnkbaX29Hn7olMR3y6cI/EFw6b5PzmOEcUt4x7J+s
	Gi4r3zIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t65Dj-0000000HQGF-0Nvs;
	Wed, 30 Oct 2024 09:42:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t655D-0000000HOvf-18KS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 09:33:44 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49U0O3bY027014;
	Wed, 30 Oct 2024 09:33:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=w3QGRmNgjXIiFwwmNaUFfizy
	UclQYS0Fh9BYwMiMwvs=; b=FPc+w9QLGvCN9psvyodFhA3qFRPRKVM3NvPA8Zwq
	Kd//ZiJQFh5ctRZZeNvSf/mjESDI3iVMHHDQTAJydr/awi9snUzArqfySArGngz9
	F1RUfsPaW4xoOcxcKscOWeYdRk1oB+ze54RPxseadmHWfIX04mHgP3UU+0U8lruZ
	NYcqkuKfwpgqpGPkMo3q7qR5fFiPAHCZoCdo1Ga7N0lP8w/S7Scw8Yox8rlCAblJ
	4BFs7r4I9kocLEqN6x5pTar8OFz412xLKVGWSam7fx67G9Yr3WIdK5Cby2pd+2Jg
	yWIigeZBXFlTv2PqCnRgvN+eRHMR0KRZv15FbIjbUwnsUw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42gqrgubba-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Oct 2024 09:33:35 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49U9XYdb012003
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Oct 2024 09:33:34 GMT
Received: from taozha2-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 30 Oct 2024 02:33:30 -0700
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
Subject: [PATCH v5 4/4] coresight-tpda: Optimize the function of reading element size
Date: Wed, 30 Oct 2024 17:32:55 +0800
Message-ID: <20241030093255.26915-5-quic_taozha@quicinc.com>
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
X-Proofpoint-ORIG-GUID: evKFG_8ZGWl1LlNBCZIkAkoBRfftFWet
X-Proofpoint-GUID: evKFG_8ZGWl1LlNBCZIkAkoBRfftFWet
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 spamscore=0 mlxscore=0
 adultscore=0 priorityscore=1501 mlxlogscore=999 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410300074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_023343_444182_8BBC6DA8 
X-CRM114-Status: GOOD (  16.60  )
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

Since the new funnel device supports multi-port output scenarios,
there may be more than one TPDM connected to one TPDA. In this
way, when reading the element size of the TPDM, TPDA driver needs
to find the expected TPDM corresponding to the filter source.
When TPDA finds a TPDM or a filter source from a input connection,
it will read the Devicetree to get the expected TPDM's element
size.

Signed-off-by: Tao Zhang <quic_taozha@quicinc.com>
---
 drivers/hwtracing/coresight/coresight-tpda.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/hwtracing/coresight/coresight-tpda.c
index ad023a2a99d1..413828f19d60 100644
--- a/drivers/hwtracing/coresight/coresight-tpda.c
+++ b/drivers/hwtracing/coresight/coresight-tpda.c
@@ -110,6 +110,16 @@ static int tpda_get_element_size(struct tpda_drvdata *drvdata,
 		    csdev->pdata->in_conns[i]->dest_port != inport)
 			continue;
 
+		/*
+		 * If this port has a hardcoded filter, use the source
+		 * device directly.
+		 */
+		if (csdev->pdata->in_conns[i]->filter_src_fwnode) {
+			in = csdev->pdata->in_conns[i]->filter_src_dev;
+			if (!in)
+				continue;
+		}
+
 		if (coresight_device_is_tpdm(in)) {
 			if (drvdata->dsb_esize || drvdata->cmb_esize)
 				return -EEXIST;
@@ -124,7 +134,6 @@ static int tpda_get_element_size(struct tpda_drvdata *drvdata,
 		}
 	}
 
-
 	return rc;
 }
 
-- 
2.17.1


