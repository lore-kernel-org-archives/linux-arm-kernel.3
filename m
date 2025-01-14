Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45BAEE77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 05:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Ra3dSoqbIv2eF9zoZUbyQQPjXpOzfwJvCpeTMxHEKs=; b=j77yDq6Mn9LHv0eOOm/NsMrJoX
	ioUbRsMAN6aLsDyvna/SM9IRUclOn28AGME4QTh+rf7hsEwi9gH5eE5GA66abK+GwKPJ0Qkov94DC
	DW6BgNvI6dK+5OGQdhcGlyBLfbMy/il0BF1Q2cFvYPg3OqinpPWYejbGO76Vw/xpldjnmT07rA6JW
	3+GaRaSzIPOoiNR8RVi/kVWtkgw91U/G+ylGbZURhTfK3zt3NBaaFniwu3v2Xu/sZpXa3E8pKJ+Vx
	VKfePAZC6xUH0FDHQei+pNi7cgn43cPMnphTJ0TPgfufL0DNgdquQz9JpDNZCVB7YwfNIboCkVH/R
	Zfn1oc/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXZkr-00000007XHX-2OPO;
	Tue, 14 Jan 2025 05:46:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXZbL-00000007Vop-47Uh
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 14 Jan 2025 05:36:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:In-Reply-To:References:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=/Ra3dSoqbIv2eF9zoZUbyQQPjXpOzfwJvCpeTMxHEKs=; b=JYfKYH1vbjBE4UR4kjUqh3gJzz
	6Nb4k/KTObOu49F0LaMnQzzijcyFhpeUReunWVSfGbXUldBRCOPhYRhBHZ0D5F1h26uUAxVCQRj4R
	xMbUapDx01ldY1SgRFKR+nZ00Xrie38U4JliPMbauFGN/Th/YqV91h4fk2DkwmJ/9k+l4SKnqqHoN
	toSx5xjoZxw2bZ5Eh5nol7+2BaisPcUWPYZpkFVTs1pdC8PuUjLgcoceKiz13uew6v6LT+OnWusNN
	b0NADBSQPACJpCNvE+v13cSFiLqMgQmXpQsB2RxhrBOGyF6yJCZQdh6ZLHEPALFEKVQLkfMy8KbgB
	KN0YWgRw==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXZbI-0000000APk6-2cgV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 05:36:30 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50E40bZB020725;
	Tue, 14 Jan 2025 05:36:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/Ra3dSoqbIv2eF9zoZUbyQQPjXpOzfwJvCpeTMxHEKs=; b=HikSzvI7KYxlMco7
	RYWzAkybYaofzND7NE4hK4kh74cceDeIxcHy4IlcELeV+V1szgEwQftpeoMU4ZxX
	I5vZm1eC4knIGqbT81HKE+xnKB7NP/T/S7DL4FTYVVSQLQp6k8hlGJ0JB6OvTIIV
	ogtxPXvzkGPqKoc7DrYPk8ot36bUWdSE1GZRtMUo5ZGxUkfriEokjDsR+THoxPFo
	3etaL6pf3ZUxjT2Pq4NLi9xe0h3p0Klve1MwE/m7AFjjw78z1UPxTkdW6KVSr6YB
	EkcMcoBwvtfq0HISfK3vjQQEjxjnepwx64iXQBs1PRNTtxowDx9vO1yyLUvkocWX
	qu4VSA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 445gh60526-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jan 2025 05:36:13 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50E5aCok016202
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jan 2025 05:36:12 GMT
Received: from la-sh002-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 13 Jan 2025 21:36:06 -0800
From: "Jiao, Joey" <quic_jiangenj@quicinc.com>
Date: Tue, 14 Jan 2025 13:34:37 +0800
Subject: [PATCH 7/7] arm64: disable kcov instrument in header files
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250114-kcov-v1-7-004294b931a2@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736832942; l=1362;
 i=quic_jiangenj@quicinc.com; s=20250114; h=from:subject:message-id;
 bh=1kWeMy8H18bHx7q6bxqI4S7xMp8TmEXRvurq+o8jSTk=;
 b=zPdx/wsH9uf3YlAIvy013JGGUIrnRUGzN+n5UmShLK05sjrO5Bv+UKhmFiYiSigdphGdNZ4mt
 wlcCgEsIO2HASI15aSluF7QMoXny39DoX3F20cozNtGxwEHgHdqrSVX
X-Developer-Key: i=quic_jiangenj@quicinc.com; a=ed25519;
 pk=JPzmfEvx11SW1Q1qtMhFcAx46KP1Ui36jcetDgbev28=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: SJSYjyfLnYMRCxOaFXFtA289YzGmtz-L
X-Proofpoint-GUID: SJSYjyfLnYMRCxOaFXFtA289YzGmtz-L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=761 phishscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501140044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_053629_092049_02C4D0FE 
X-CRM114-Status: GOOD (  13.21  )
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

Disable instrument which causes recursive call to __sanitizer_cov_trace_pc

Signed-off-by: Jiao, Joey <quic_jiangenj@quicinc.com>
---
 arch/arm64/include/asm/percpu.h  | 2 +-
 arch/arm64/include/asm/preempt.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/percpu.h b/arch/arm64/include/asm/percpu.h
index 9abcc8ef3087b7066c82db983ae2753f30607f7f..a40ff8168151bb481756d0f6cb341aa8dc52a121 100644
--- a/arch/arm64/include/asm/percpu.h
+++ b/arch/arm64/include/asm/percpu.h
@@ -29,7 +29,7 @@ static inline unsigned long __hyp_my_cpu_offset(void)
 	return read_sysreg(tpidr_el2);
 }
 
-static inline unsigned long __kern_my_cpu_offset(void)
+static __no_sanitize_coverage inline unsigned long __kern_my_cpu_offset(void)
 {
 	unsigned long off;
 
diff --git a/arch/arm64/include/asm/preempt.h b/arch/arm64/include/asm/preempt.h
index 0159b625cc7f0e7d6996b34b4de8e71b04ca32e5..a8742a57481a8bf7f1e35b9cd8b0fd9a37f0ba78 100644
--- a/arch/arm64/include/asm/preempt.h
+++ b/arch/arm64/include/asm/preempt.h
@@ -8,7 +8,7 @@
 #define PREEMPT_NEED_RESCHED	BIT(32)
 #define PREEMPT_ENABLED	(PREEMPT_NEED_RESCHED)
 
-static inline int preempt_count(void)
+static __no_sanitize_coverage inline int preempt_count(void)
 {
 	return READ_ONCE(current_thread_info()->preempt.count);
 }

-- 
2.47.1


