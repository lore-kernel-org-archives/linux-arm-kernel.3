Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22A2AC3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 06:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iUi86ZpuqrYLmDZVh7MKw9JIS0afXPNB4K1CF7NR0P8=; b=QLZ0zFC0KavqFFqlpwsFynZ7gG
	rGjxQSv60a6gUr8TfzeYQM5VpxzXY2Mr4y0HpwZzBmqrScI/qTlixAbEI8WCyolVxn6HIea+Vpv9V
	Rw+xLEx1d8hZdlmtwAmj7VgEaNtejzxLn9qqu2C9h3qv+v+a88gCIZ8A6qTzd3QixJ/uu1ZqQ/fUl
	X2mplivAqKBnZg2gxQapxKBNGhls+9jedQUycDUvOgYnPMztmLg0IfQZQXvIkM0H1aVVNKsXhHT1G
	uSUbwHxiA10yOld2QkIuwgsn/uhpgBnDix6GEDNKJxjdpfYouV7K0F4jSflc47fSY3b5NesHh57+L
	gs9Z8YCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDHX9-00000002eoX-41Lb;
	Fri, 09 May 2025 06:48:35 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDHV7-00000002eC5-1I2N
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 06:46:30 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5492HLgZ023383;
	Fri, 9 May 2025 06:46:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=iUi86ZpuqrYLmDZVh7MKw9
	JIS0afXPNB4K1CF7NR0P8=; b=ns8cNkG0WGicGZB9WQj83yYNog6akqx9uAt5Zt
	09/K/vZID8ivzatlkqvL0DH8zjoGeG5+0vCjgyc/2gsgpc6n7wAbPBNqjfGfTKVF
	o3+BOorT9y3P2bjF2AFmQGnD87wM+Qc41/p4TlkpaWeUGCRxyBliij/or+wZIGZA
	FkUydGS5S7IpOraPJxmwB7rabenr+NxiTW9BzOt13U6hTi0tHrC1sZLCg50GbPJ5
	bJs1c+XXOauMPzRYwNtbCJMayRZx2qmYm+cTmvcjRe3ci43u3Pn1a4yDEqUVO5LJ
	Dvi1Zy3t4N02QhGvabNTOEluJvNaAVGoZGVlLDToshUIGX0Q==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp83pxs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 May 2025 06:46:24 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5496kNK0023854
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 9 May 2025 06:46:23 GMT
Received: from hyiwei-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 8 May 2025 23:46:17 -0700
From: Huang Yiwei <quic_hyiwei@quicinc.com>
To: <james.morse@arm.com>, <linux-arm-kernel@lists.infradead.org>
CC: Huang Yiwei <quic_hyiwei@quicinc.com>, <linux-kernel@vger.kernel.org>,
        <quic_aiquny@quicinc.com>, <kernel@quicinc.com>,
        <kernel@oss.qualcomm.com>
Subject: [PATCH] firmware: arm_sdei: Add EVENT_SIGNAL for ARM SDEI
Date: Fri, 9 May 2025 14:45:52 +0800
Message-ID: <20250509064552.3330202-1-quic_hyiwei@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=M7xNKzws c=1 sm=1 tr=0 ts=681da4c0 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=VzfuvANLIRT1E9q52_AA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: P4IilRsj_1CdUCQ3Rgu9tmwXhP4Whn79
X-Proofpoint-GUID: P4IilRsj_1CdUCQ3Rgu9tmwXhP4Whn79
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDA2MyBTYWx0ZWRfX8GQ3I69q1xug
 pz6maFohElt3CllP0F7lgXLyweRfutx6TMAbB/YNz96TD2bP/SnIPxkP70dpRf+VUJnErzRUE5j
 hPYStfhvhidm0GYrXkOlebxHRuv6bia7sxQRbACgj9m/zlubL/GrOkOl1+RazwwxJKtxUwVEqB8
 PrH0NnDqptC2meO7dULnNKUtt8EJin9bdGwwby2zoWfsPl5wPZy3ptEKdakbFlpH/Up8OPUxUDQ
 Ncfa2FazXJAjPZ89mekS1FHy2OnPwmz7juvOv218XQP2OuafaIV7T2+R2vhkgEdPP6Ex1qpl4bT
 5+Co4tiQ/qaGvA784m/9GoiekGWfQ58k+MeWMTprfLZWp6ffOydVYBmE2Z+3gsR5fM+pTNaFDqR
 FpXiepyp1Upp9mLfJE0KP9r8M5oBDLB9Y8hIvV53Rvdpz95KLyUwMO7niWlPVebQkZxRu/AE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_02,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 mlxscore=0 priorityscore=1501
 spamscore=0 mlxlogscore=999 bulkscore=0 impostorscore=0 clxscore=1015
 suspectscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505090063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_234629_356395_B579BEE5 
X-CRM114-Status: GOOD (  12.34  )
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

SDEI_EVENT_SIGNAL is a standard interface for SDEI feature and useful
for customized firmware calls. Therefore, adding this missing interface
to SDEI driver.

Signed-off-by: Huang Yiwei <quic_hyiwei@quicinc.com>
---
 drivers/firmware/arm_sdei.c   | 6 ++++++
 include/linux/arm_sdei.h      | 1 +
 include/uapi/linux/arm_sdei.h | 1 +
 3 files changed, 8 insertions(+)

diff --git a/drivers/firmware/arm_sdei.c b/drivers/firmware/arm_sdei.c
index 3e8051fe8296..3140bb505f06 100644
--- a/drivers/firmware/arm_sdei.c
+++ b/drivers/firmware/arm_sdei.c
@@ -299,6 +299,12 @@ static int sdei_api_get_version(u64 *version)
 	return invoke_sdei_fn(SDEI_1_0_FN_SDEI_VERSION, 0, 0, 0, 0, 0, version);
 }
 
+int sdei_event_signal(u32 event_num)
+{
+	return invoke_sdei_fn(SDEI_1_0_FN_SDEI_EVENT_SIGNAL, event_num, 0, 0, 0,
+			      0, NULL);
+}
+
 int sdei_mask_local_cpu(void)
 {
 	int err;
diff --git a/include/linux/arm_sdei.h b/include/linux/arm_sdei.h
index 255701e1251b..3c0862a03d09 100644
--- a/include/linux/arm_sdei.h
+++ b/include/linux/arm_sdei.h
@@ -36,6 +36,7 @@ int sdei_event_unregister(u32 event_num);
 
 int sdei_event_enable(u32 event_num);
 int sdei_event_disable(u32 event_num);
+int sdei_event_signal(u32 event_num);
 
 /* GHES register/unregister helpers */
 int sdei_register_ghes(struct ghes *ghes, sdei_event_callback *normal_cb,
diff --git a/include/uapi/linux/arm_sdei.h b/include/uapi/linux/arm_sdei.h
index af0630ba5437..247b5d035864 100644
--- a/include/uapi/linux/arm_sdei.h
+++ b/include/uapi/linux/arm_sdei.h
@@ -17,6 +17,7 @@
 #define SDEI_1_0_FN_SDEI_EVENT_UNREGISTER		SDEI_1_0_FN(0x07)
 #define SDEI_1_0_FN_SDEI_EVENT_STATUS			SDEI_1_0_FN(0x08)
 #define SDEI_1_0_FN_SDEI_EVENT_GET_INFO			SDEI_1_0_FN(0x09)
+#define SDEI_1_0_FN_SDEI_EVENT_SIGNAL			SDEI_1_0_FN(0x0F)
 #define SDEI_1_0_FN_SDEI_EVENT_ROUTING_SET		SDEI_1_0_FN(0x0A)
 #define SDEI_1_0_FN_SDEI_PE_MASK			SDEI_1_0_FN(0x0B)
 #define SDEI_1_0_FN_SDEI_PE_UNMASK			SDEI_1_0_FN(0x0C)
-- 
2.25.1


