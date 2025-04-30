Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5616EC3ABAD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 11:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hKEMsFz+5InyWRGlQjljTVa4FuIOoyVGX3MTSQHG8CQ=; b=3VpIwQWkNxUdwCg8aa/KYRvk1O
	2zXiJ4JRTOMG74Vc8ZNspVs3scJJbQ9NAy9b43G/1fqrh+bCw3eFnkb9Ygngc60Li6t4IJ4it+Yg5
	IRDGEk3gRRbqbQSqGz6CsOde5BxY8x+Il3gx5AmnuSlJiEY7JIEsN7357Zts85caE6b17PcBf9loa
	317Z3YOQcFWN7ZcbxnwAUO5N9xbsGyHyI9K24i3HroSvVnSANu/AJCNyV9DykuXfBng32Ysr+r+DZ
	gx0Ipj9r3ORO6o9Z1Da9n7LBB3SCYPn214H7wd4qnOKpWX4h1skY6wy+RWg85r0gjA7i1GLRgcTRv
	ty5GIU4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA60T-0000000Cjtj-0wCR;
	Wed, 30 Apr 2025 11:53:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA5EW-0000000CcTC-0WiS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 11:04:10 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53U9Vg8o020908;
	Wed, 30 Apr 2025 11:04:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=hKEMsFz+5InyWRGlQjljTV
	a4FuIOoyVGX3MTSQHG8CQ=; b=HcXHScSu9OWopRFmC+98IqgqTuGr36HWMRe5dW
	TrXYplnoEwyaGk8CXRS6l1ZPl+hrRDIIqJ4LuRFebGnyG9CXSWHoxoOYLHRJith3
	2NcAhjEoX+gHMeBEZgibde9RD11zeYVyUe1xk4cQqSO+m2eXnii6OAIKAkFutmN/
	ppmO/Ny8hCOkjzogelR6fteq/Dx0nJGognBJRt82jCUiUo7Es2AF6WMT255VTkF2
	PJgmMnUByg9k+6aK+aQYbzoBCeNFB1zqVoKCmS5cErAbsBUwAKYcKzy7jnGfSro7
	+q8pjo68aJc7LQd3kG7SWGdXhD3SUxHLmzIpqdRnAOTFz/gQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u1svrn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 11:04:01 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53UB406N000323
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 11:04:00 GMT
Received: from hu-jinlmao-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 30 Apr 2025 04:03:59 -0700
From: Mao Jinlong <quic_jinlmao@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>
CC: Mao Jinlong <quic_jinlmao@quicinc.com>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>
Subject: [PATCH] coresight: Disable MMIO logging for coresight stm driver
Date: Wed, 30 Apr 2025 04:03:47 -0700
Message-ID: <20250430110347.2091013-1-quic_jinlmao@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=G5AcE8k5 c=1 sm=1 tr=0 ts=681203a1 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=3H110R4YSZwA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=veiSyZ7YIUJwdJkxcWIA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDA3OCBTYWx0ZWRfXzcHPg5bF2V3V 5ci/HKzPJBTroBOjJXIZ3GGTQt04f/uBScdMxOyZ4J1W0f2HpsKg6WIWR9DX+d7oCy9fR2WE+0q CCaGHLgL0HCRkQd5cq27tEMbX2EiWJXLlFGNrcLRhKOAam+9ZAJj6+uqF6P5pXFP6kJCwqPsWPR
 re35RFMnBHV1KrShHnhGrJWVKZbuIq5LIpDRT2TQrg9ONxBLMEkfpl2vfkyi1hkJrjmLMFgWZCJ 6BYmOktCganK0UogKr9l86WMKK9KGyiIUEW/iMovdZzomAZmhm+9LAyUIQ2gBJEJw0Gw8LATJFC 9c8Mur686zP9gTAQfDVr00hoXt0+BYz79hZaeACWKjGr02oLjLIbMrShel70aCWalrMj6V6XQGe
 1df3gh1rjtxXWrCXb9WfVlp2JrRRelFHmhhhp7AbqNnWufObUsP3GApTzJ/CUlTLtUB8FCpT
X-Proofpoint-GUID: F0SnEkpOGs_Q7K3q_ivJ26wbALxZLoGJ
X-Proofpoint-ORIG-GUID: F0SnEkpOGs_Q7K3q_ivJ26wbALxZLoGJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_03,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 impostorscore=0 phishscore=0 mlxlogscore=952
 lowpriorityscore=0 adultscore=0 mlxscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504300078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_040408_302669_2E60F6BA 
X-CRM114-Status: GOOD (  11.17  )
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

When read/write registers with readl_relaxed and writel_relaxed,
log_read_mmio and log_write_mmio will be called. If mmio trace
is enabled to STM, STM driver will write the register to send the
trace and writel_relaxed will be called again. The circular call
like callstack below will happen. Disable mmio logging for stm
driver to avoid this issue.

[] stm_source_write[stm_core]+0xc4
[] stm_ftrace_write[stm_ftrace]+0x40
[] trace_event_buffer_commit+0x238
[] trace_event_raw_event_rwmmio_rw_template+0x8c
[] log_post_write_mmio+0xb4
[] writel_relaxed[coresight_stm]+0x80
[] stm_generic_packet[coresight_stm]+0x1a8
[] stm_data_write[stm_core]+0x78
[] ost_write[stm_p_ost]+0xc8
[] stm_source_write[stm_core]+0x7c
[] stm_ftrace_write[stm_ftrace]+0x40
[] trace_event_buffer_commit+0x238
[] trace_event_raw_event_rwmmio_read+0x84
[] log_read_mmio+0xac
[] readl_relaxed[coresight_tmc]+0x50

Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
---
 drivers/hwtracing/coresight/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hwtracing/coresight/Makefile b/drivers/hwtracing/coresight/Makefile
index 4ba478211b31..f3158266f75e 100644
--- a/drivers/hwtracing/coresight/Makefile
+++ b/drivers/hwtracing/coresight/Makefile
@@ -22,6 +22,8 @@ condflags := \
 	$(call cc-option, -Wstringop-truncation)
 subdir-ccflags-y += $(condflags)
 
+CFLAGS_coresight-stm.o := -D__DISABLE_TRACE_MMIO__
+
 obj-$(CONFIG_CORESIGHT) += coresight.o
 coresight-y := coresight-core.o  coresight-etm-perf.o coresight-platform.o \
 		coresight-sysfs.o coresight-syscfg.o coresight-config.o \
-- 
2.25.1


