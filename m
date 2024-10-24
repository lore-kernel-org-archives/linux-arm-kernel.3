Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0EC3D0BB69
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 07:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w3QGRmNgjXIiFwwmNaUFfizyUclQYS0Fh9BYwMiMwvs=; b=a0Kd2I/74Q3BxO9xdixt+D75jV
	ayhACz2qFL8JY2NuJKN15Vausr4pA+Wllx6kYHgJ5sidyxm3+BUZxqh/YpKM/a9/yVucxU4ZPPb5i
	HZVbqIemVYJrsQIUZ3OFhaMcJaSJaSyw3xjC4Qj/tyi+J97STlsRksjn8Ha4R896O26+9GpTKJa3y
	mmREs3wJerVLMC38WWvMvtdEw3RzIUTqIdOMLgCYyiHzd1498mM4MFyeyTshwgB3tmk5Apuf1DqKP
	Gmct13J9X/M5X+4mA+kzJLSv/k7xrAvnYFG+Jt3+eunVf5GfXEw9YbmwrUaVHTF+N0urb+ngxtN/I
	3owz83ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3s49-0000000H3ZV-35Qu;
	Thu, 24 Oct 2024 07:15:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3rjI-0000000GzEj-2Bfh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 06:53:58 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49NLXitO016171;
	Thu, 24 Oct 2024 06:53:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=w3QGRmNgjXIiFwwmNaUFfizy
	UclQYS0Fh9BYwMiMwvs=; b=khrS+g0OJXOeWylRQTXews0v5kRHXcvsn+dvlp1F
	/yVbZr1EQmrJm/JhV8CULLmUwZXiCH2/magEIV6JunHnHKv27qACFaJqGOF3BC7o
	wQzoBkM9to2DhMN6qJbM/T7Yj3kIiYg/AXwbvwfwvnXaBc4d9/n3XHPLRlwFIarm
	Pj8ibMCENoL7iyUPPa4L6O0V3jt25OUhQgyBdwmpZNa98MJ8xij6JVS7pPEmWorz
	YoFrc+8Gf61wjFAuhPOSISTxEEdS3FOZMrUiHaOyoHD/L1nBI7FP++Zy0KV7K46K
	yNRWmT25Yyt8/6XQjsOdsEjMK62P7OKnuwildSwqBZ+DHg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em3xmrvh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Oct 2024 06:53:44 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49O6rhGd030102
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Oct 2024 06:53:43 GMT
Received: from taozha2-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 23 Oct 2024 23:53:39 -0700
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
Subject: [PATCH v4 4/4] coresight-tpda: Optimize the function of reading element size
Date: Thu, 24 Oct 2024 14:53:06 +0800
Message-ID: <20241024065306.14647-5-quic_taozha@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241024065306.14647-1-quic_taozha@quicinc.com>
References: <20241024065306.14647-1-quic_taozha@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: qpYHDVS8lu2-oqWH0QMbdiIp03Nm8tdF
X-Proofpoint-ORIG-GUID: qpYHDVS8lu2-oqWH0QMbdiIp03Nm8tdF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 impostorscore=0 mlxscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 mlxlogscore=999 malwarescore=0 priorityscore=1501 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410240052
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_235356_598515_E7E5C986 
X-CRM114-Status: GOOD (  16.07  )
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


