Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF3EDC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 09:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VfpJvRD9QaopNkfQklaUs3pO73GIB0PfsxYTdpdK/Mc=; b=Vsr/rwLDMK1Mfu
	K4yhPTBkI9wd+2tE6cLGVYMdNiyGF6dSbjhM/azrGGfKRBYEVPu9VFR93js/WUurhlhSdoNoNZqHx
	kNAuh+YwSIFCMeD/eZa/DBhcGwdSIJlbzVh75NV7NP+9DP2zwQ9oVMWJ5BMjVJL307joTK+BUy8wb
	0vfvi12+CSr0rx99/nft2WPygJDpGhPWwc1ObjE08RxoVHFHEOF2vrKujjbw8mXkseRCL3DyjcRnS
	HlOYrHdSDt0z79MiqA1xFPRNIFAv87A0EtGSJmyzJftfArVp8hktnZjp715qe9fX9LPy4Ba3Z5hUS
	BJulVi9nVOCLL3g/PLfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl37I-000000006Gv-1EzD;
	Thu, 20 Feb 2025 09:45:12 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl34K-000000005RY-2dMx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 09:42:09 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51K6ewSt014973;
	Thu, 20 Feb 2025 09:42:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=VfpJvRD9QaopNkfQklaUs3
	pO73GIB0PfsxYTdpdK/Mc=; b=ZWgqL5yHLn0fz+gK7P4sak8i5q6X57FyEq7wD8
	bLDqaj7/SVvqOZXh5ewRHUTvcuYUW/P7yvs/j9tkMfWIXdEKQw51Q6j9SZPUEmXv
	KWLSnoeu3HsbLMUUZsqvZ5CV920Wz6zh6l1GXdttyiDhhcqaMp1fbsiwc0aXCzYL
	kqHklkhHEYSLuv3cPT39VjKuVWDFkU/BPNealtUEjJudn1r9+yUe2u3sEhPqZI3E
	FS0NNyN0mzZozfaKu9ussw04pghdJUNDmWUlElyXetGuXFm2+eW9tKQAacvHcX8l
	csEq79vAcFcBPpzSdw/tZ5CGFYzNxVSmhV375z9MOd6FiXtw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy15kt2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Feb 2025 09:42:00 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51K9fxRK014047
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Feb 2025 09:41:59 GMT
Received: from yuanfang4-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 20 Feb 2025 01:41:54 -0800
From: Yuanfang Zhang <quic_yuanfang@quicinc.com>
Subject: [PATCH 0/5] coresight: Add Coresight Trace NOC driver
Date: Thu, 20 Feb 2025 17:41:20 +0800
Message-ID: <20250220-trace-noc-driver-v1-0-15d78bd48e12@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMH4tmcC/x3MTQqAIBBA4avIrBtISfq5SrQQHWs2FmNIEN49a
 fkt3nshkzBlWNQLQoUzn6lBdwr84dJOyKEZTG9sb7TBW5wnTKfHIFxIcKbRhnHSeogOWnYJRX7
 +5brV+gEAUMmZYgAAAA==
X-Change-ID: 20250212-trace-noc-driver-9e75d78114fa
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>
CC: <kernel@quicinc.com>, <linux-kernel@vger.kernel.org>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740044513; l=3442;
 i=quic_yuanfang@quicinc.com; s=20241209; h=from:subject:message-id;
 bh=rChncOtg0mnw9AqVWObnAr5EAgepiFacUpox0dBd+Fs=;
 b=fwJHywpBov/tTCZnx/SMPba0s3hUQU5hbdWZ5i7ciTSJSEI4KqjfVQJkHMNb73HNUJYi4bLd9
 Sxm6CcV9DaXCygbcMLKAQTV7Zh9c6fHQmUpQND6oJo2jiPtFPVOXs0T
X-Developer-Key: i=quic_yuanfang@quicinc.com; a=ed25519;
 pk=ZrIjRVq9LN8/zCQGbDEwrZK/sfnVjwQ2elyEZAOaV1Q=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 1NST2Js7Ik9nZIuKBQ2XdtCNEriUiruF
X-Proofpoint-ORIG-GUID: 1NST2Js7Ik9nZIuKBQ2XdtCNEriUiruF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-20_04,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 clxscore=1015
 suspectscore=0 spamscore=0 mlxlogscore=999 mlxscore=0 bulkscore=0
 malwarescore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502100000 definitions=main-2502200070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_014208_677526_23CA1B01 
X-CRM114-Status: UNSURE (   9.08  )
X-CRM114-Notice: Please train this message.
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

The Trace NoC is an integration hierarchy which is a replacement of
Dragonlink configuration. It brings together debug component like TPDA,
funnel and interconnect Trace Noc which collects trace from subsystems
and transfers to QDSS sink.

Compared to DL, it has the following advantages:
1. Reduce wires between subsystems.
2. Continue cleaning the infrastructure.
3. Reduce Data overhead by transporting raw data from source to target.

    +--------------+                                         +-------------+     
    | SDCC5 TPDM   |                                         |  SDCC5 TPDM |     
    +--------------+                                         +-------------+     
           |                                                        |            
           |                                                        |            
+----------|-------------------+                                    |            
|          v                   |                                    |            
|  +----v----+     Dragon Link |                                    v            
|  |DLNT TPDA|     North       |                         +----------------------+
|  +---------+                 |                         |    TRACE NOC AG      |
|       |                      |                         |                      |
|       v-------------+        |                         +----------------------+
|                     |        |                                   |             
|              +------v-----+  |                                   |             
|              | DLNT Funnel|  |                                   |             
|              +------------+  |                                   |             
|                   |          |                                   |             
+-------------------|----------+                                   |             
              <-----+                                              |             
             |                                                     |             
             |                                                     |             
             v                                                     v             
    +----------------+                                      +---------------+    
    |     QDSS       |                                      |    QDSS       |    
    +----------------+                                      +---------------+
    

Signed-off-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>
---
Yuanfang Zhang (5):
      dt-bindings: arm: Add Coresight device Trace NOC definition
      coresight: add coresight Trace NOC driver
      coresight-tnoc: add nodes to configure flush
      coresight-tnoc: add node to configure flag type
      coresight-tnoc: add nodes to configure freq packet

 .../bindings/arm/qcom,coresight-tnoc.yaml          | 107 ++++++
 drivers/hwtracing/coresight/Kconfig                |  10 +
 drivers/hwtracing/coresight/Makefile               |   1 +
 drivers/hwtracing/coresight/coresight-tnoc.c       | 401 +++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tnoc.h       |  57 +++
 5 files changed, 576 insertions(+)
---
base-commit: 92514ef226f511f2ca1fb1b8752966097518edc0
change-id: 20250212-trace-noc-driver-9e75d78114fa

Best regards,
-- 
Yuanfang Zhang <quic_yuanfang@quicinc.com>


