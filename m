Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF33CE77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 05:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CFVY0tjOmtO4qAqPnzy1tUQpQ6ETWmPtYq/HPU3qSi0=; b=RIGfvajzzc+520j9QKcofr3HTg
	y07RsVtAyeSv24FzoOscfWDbJZSjQPOfhD6CBMhK/W48YHK2/9cIxt4VgBJZwv/GHa/Wshs2RMH5k
	N8E3y+va1zslyuTrZAJmm1BkD3oxCxnrnQkCR6ZDW5pkuKFefRhUGPJRcJgLxIQPeOwJU4dGlP1u1
	v1DvefK0rHtQFyYDZCqni40tQeTQucUgrdx7r5hMJu3AQYP25x40PVoPasNz/6IIhO3vy3xOTXk19
	xgGwsc9vQj9AjU+KZiH8ZQfXo8VESv8hk9vrfNP4LJbLNXI0xvO8kOHGwuENKwnSTYeAbstr4SkvK
	yzncnvqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXZen-00000007WSg-1MXZ;
	Tue, 14 Jan 2025 05:40:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXZb2-00000007Vep-2xQM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 05:36:14 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50E2fc3u019144;
	Tue, 14 Jan 2025 05:35:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CFVY0tjOmtO4qAqPnzy1tUQpQ6ETWmPtYq/HPU3qSi0=; b=aXbBkGUgRenYY+kr
	GhmhQxZFugwhs7ZerU+nCDz07oNXy4dB4IsS2Dn6ffnsRAFAHFmCulqCfnvn0VZR
	bIytfkOm3h0P5hnNhe8KtDRHc8NH8eI9DlQNPjFbr8uU61jzSSWI8lo63KxdwObG
	g+W8U0oLtB92OF40g3tTxMK1mz7UYvFQ8oMYPZrIgS+gcyD4nqoVAm9Gz6kFruCF
	s4DxNhbl1OReEc6X2stwMw0UD7kOwcqAU55wLJ0gHbGVK0i5TF/P7V49jaVzrFOQ
	HtJqJkcvB2YAuVoH74/8hjKc+QzkWFrpur5WdJVKmG7EukAMBxVk0586B5vLzQkx
	lXQJPQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 445fc68apd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jan 2025 05:35:59 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50E5Zwtu020376
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jan 2025 05:35:58 GMT
Received: from la-sh002-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 13 Jan 2025 21:35:52 -0800
From: "Jiao, Joey" <quic_jiangenj@quicinc.com>
Date: Tue, 14 Jan 2025 13:34:33 +0800
Subject: [PATCH 3/7] kcov: allow using KCOV_TRACE_UNIQ_[PC|EDGE] modes
 together
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250114-kcov-v1-3-004294b931a2@quicinc.com>
References: <20250114-kcov-v1-0-004294b931a2@quicinc.com>
In-Reply-To: <20250114-kcov-v1-0-004294b931a2@quicinc.com>
To: Dmitry Vyukov <dvyukov@google.com>,
        Andrey Konovalov
	<andreyknvl@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Andrew Morton
	<akpm@linux-foundation.org>,
        Dennis Zhou <dennis@kernel.org>, Tejun Heo
	<tj@kernel.org>,
        Christoph Lameter <cl@linux.com>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
CC: <kasan-dev@googlegroups.com>, <linux-kernel@vger.kernel.org>,
        <workflows@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-mm@kvack.org>, <linux-arm-kernel@lists.infradead.org>,
        <kernel@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736832942; l=1250;
 i=quic_jiangenj@quicinc.com; s=20250114; h=from:subject:message-id;
 bh=cUrFJ9xlku6iOVJmqRm3AKSPyxlxbIELfrHlRVSE678=;
 b=PN4imkwKcD7/nAryYV3lJaq77IA4e+9rhwFDEIua2TPoylFR2tEVvYzX1A0kElet197HOJhRv
 KnL6OAxKhzVAAeMfHluhR5AD/KnczeQvktL1Pe8Wg8BhWFmOtiquMjy
X-Developer-Key: i=quic_jiangenj@quicinc.com; a=ed25519;
 pk=JPzmfEvx11SW1Q1qtMhFcAx46KP1Ui36jcetDgbev28=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 2ybqo6M8sHxWZsrwE_g4pZ5-4RN20TNw
X-Proofpoint-GUID: 2ybqo6M8sHxWZsrwE_g4pZ5-4RN20TNw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=891 adultscore=0 suspectscore=0 malwarescore=0
 phishscore=0 clxscore=1015 impostorscore=0 priorityscore=1501 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501140043
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_213612_864220_E8C17C35 
X-CRM114-Status: GOOD (  13.80  )
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

KCOV_TRACE_UNIQ_PC and KCOV_TRACE_UNIQ_EDGE modes can be used
separately, and now they can be used together to simulate current
KCOV_TRACE_PC mode without sequence info.

Signed-off-by: Jiao, Joey <quic_jiangenj@quicinc.com>
---
 kernel/kcov.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/kernel/kcov.c b/kernel/kcov.c
index 5a0ead92729294d99db80bb4e0f5b04c8b025dba..c04bbec9ac3186a5145240de8ac609ad8a7ca733 100644
--- a/kernel/kcov.c
+++ b/kernel/kcov.c
@@ -716,6 +716,8 @@ static int kcov_close(struct inode *inode, struct file *filep)
 
 static int kcov_get_mode(unsigned long arg)
 {
+	int mode = 0;
+
 	if (arg == KCOV_TRACE_PC)
 		return KCOV_MODE_TRACE_PC;
 	else if (arg == KCOV_TRACE_CMP)
@@ -724,12 +726,14 @@ static int kcov_get_mode(unsigned long arg)
 #else
 		return -ENOTSUPP;
 #endif
-	else if (arg == KCOV_TRACE_UNIQ_PC)
-		return KCOV_MODE_TRACE_UNIQ_PC;
-	else if (arg == KCOV_TRACE_UNIQ_EDGE)
-		return KCOV_MODE_TRACE_UNIQ_EDGE;
-	else
+	if (arg & KCOV_TRACE_UNIQ_PC)
+		mode |= KCOV_MODE_TRACE_UNIQ_PC;
+	if (arg & KCOV_TRACE_UNIQ_EDGE)
+		mode |= KCOV_MODE_TRACE_UNIQ_EDGE;
+	if (!mode)
 		return -EINVAL;
+
+	return mode;
 }
 
 /*

-- 
2.47.1


