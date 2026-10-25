Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA33A606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Oct 2026 06:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tzQSO8iU;
	dkim=pass (2048-bit key, unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=tGc83Fo9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=jw5VuQf1ANvsD9FFFvRp8AlB3r45zUeN3fSTLXP6SlM=; b=tzQSO8iUA+M1+e/nnOKL9+Tdic
	ngj+q/OabywhFVg7krp4/KOG4xm9PfIHn6UegK96idKdA7tB1ZgqGclri6EQN9eYWnyhse+/Vmy+b
	WfNE0lWBkKbtvvUVNH3L8G9jBR/w1/gMUc+m+HzZiHK8wPRS8C5jiLSHd9PGWchHu8x6B3wED8cok
	tT8UtOsYaXe1Jokocjgzi8ApGAFP26HQ1oagsf//nbbtn4rUqus03gqo7kaMZcYr3InQcvAmyj4RZ
	vanrAcj5qhn/tDiAphWttblQpC027ZbQACOIaGXjmBLwUMVuqmZGqX1cTJAKYDW1b0Uq2PuAxgYaf
	XheZDnEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKrte-00000000nss-0GSR;
	Sun, 25 Oct 2026 06:39:58 +0000
Received: from mx0a-00082601.pphosted.com ([67.231.145.42])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKrtD-00000000ni7-3Qps
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 Oct 2026 06:39:32 +0000
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69P4sOTE544352;
	Sat, 24 Oct 2026 23:39:19 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=jw5VuQf1ANvsD9FFFvRp8AlB3r45zUeN3fSTL
	XP6SlM=; b=tGc83Fo9azP9Hld1MGo4oT9nIU4PWshaC7wLq6VFFboPQtyqmwGvW
	CkunPXf3yX9aldKbUUrJ1O+pNjhN19H4ahoZyLCqKOmKAfWQChPFTUcR19Qd+d9o
	cT6Eq0x7ePKKZ14h5lMFxLc2a5kCdHcVrkrT+SeLBFKAd+1ymYQ+thwn88bgSvyx
	pa6E2UwRxiFGpOoCDhVwXfxWTkqRaIa7zvsULib/wcWhCo7JY1K8U1gp5Ot3jkci
	kXLmNcseO4wGFsqhkxw8WOidb297uknJ9gUS11S8JKYOW0kTLpH7wCQ6SMZZ78MT
	dTgie5XEGdhYWOGE59ANb9WL1mZMFTIMQ==
Received: from maileast.thefacebook.com ([163.114.135.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hguyh32kw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 24 Oct 2026 23:39:19 -0700 (PDT)
Received: from localhost (2620:10d:c0a8:1c::1b) by mail.thefacebook.com
 (2620:10d:c0a9:6f::237c) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Sun, 25 Oct
 2026 06:39:17 +0000
From: Amir Ayupov <aaupov@fb.com>
To: James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Suzuki K
 Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>,
        Alexander
 Shishkin <alexander.shishkin@linux.intel.com>
CC: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Randy Dunlap
	<rdunlap@infradead.org>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Daniel
 Pereira <danielmaraboo@gmail.com>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-perf-users@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 5/7] perf: arm_pmuv3: Add pmuv3_event_implemented()
Date: Sat, 24 Oct 2026 23:39:05 -0700
Message-ID: <cd3e622681f7254216b0488f09d2cb2d91a2d8ca.1792907333.git.aaupov@fb.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1792907332.git.aaupov@fb.com>
References: <20261012230527.750567-1-aaupov@fb.com> <cover.1792907332.git.aaupov@fb.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI1MDAyNiBTYWx0ZWRfX3HpC6ZmlsThT
 W54cJt5/0v7bB4BoRwEQauwZbrIsCgdYT3B6ceYi3edHzFAE76EMiovNjOsok3q9OxbaIDcBtY3
 d9MFvBkNNKdxYY8Vv/TzGTn9aPekKsJJwICssCQWx/FOmPEhVmBvH1Gvrv+45uKO4PLgJZp+0rF
 MDyHDpamEizJ9nug4so42zctRjHqQ71MVIlNQo6A8Wd9C4hJoQOtbN1FXhtVL5bHJg3Gw/+Pqka
 U2i3DwQEUKa9AkBS/QYQYW6x1ywf7wFb056llmVpEURG94GEsauehr83jzl3VWOmjBL+m5+rYHU
 kjJFpBfpzvqBkWy4XtWYPJVaRZGVHjWcPapns8wqvARmfmD9BvHMP0cXZX5DT9etkypE9bRg/oe
 s6nJ/QFleJHl5gTLNFjXfBNrqasd0vzyrBYb6St0Jd2++lokKP4aK4wEuXiBjQ0/ObdETgVK1ur
 5DWYyYD6VTuaAIENp8w==
X-Proofpoint-GUID: K2LKffOrXNyFHYQrvV1nbHrNZ-TI8Yx5
X-Proofpoint-ORIG-GUID: K2LKffOrXNyFHYQrvV1nbHrNZ-TI8Yx5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI1MDAyNiBTYWx0ZWRfXwwWf5fIaDzp8
 kfqlN4UavRsctlzP/hrDzA92SDzyBSuzB8pmHwzPMGZ7kYW8wW3CFv69l6LcvMC7f9iRDcrmYma
 H5MyE3nrYNsi68TEEAAtAA5FY+6ml7E=
X-Authority-Analysis: v=2.4 cv=FY+iV5+6 c=1 sm=1 tr=0 ts=6adda417 cx=c_pps
 a=MfjaFnPeirRr97d5FC5oHw==:117 a=MfjaFnPeirRr97d5FC5oHw==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=crHB47gyY4rKiduisYu9:22 a=KKAkSRfTAAAA:8 a=FOH2dFAWAAAA:8
 a=zNmvvb9I2tHsirClY3sA:9 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-25_02,2026-10-21_02,2025-10-01_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261024_233931_875149_F7AB5308 
X-CRM114-Status: GOOD (  15.61  )
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Drivers outside the PMU driver may need to know whether the local CPU's
PMU implements a common event before relying on it, for example a trace
unit driver checking that the PMU counts its external outputs as
TRCEXTOUTn.

Add pmuv3_event_implemented(), which reads PMCEID0/1 on the calling CPU:
events 0x0000-0x003f are reported in bits [31:0], and the common events
from ARMV8_PMUV3_EXT_COMMON_EVENT_BASE in bits [63:32] from PMUv3p1. Move
ARMV8_PMUV3_EXT_COMMON_EVENT_BASE next to the event numbers in
arm_pmuv3.h so it is available without CONFIG_ARM_PMU.

Suggested-by: James Clark <james.clark@linaro.org>
Assisted-by: Devmate:Opus-5.5
Signed-off-by: Amir Ayupov <aaupov@fb.com>
---
 include/linux/perf/arm_pmu.h   |  1 -
 include/linux/perf/arm_pmuv3.h | 22 ++++++++++++++++++++++
 2 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/include/linux/perf/arm_pmu.h b/include/linux/perf/arm_pmu.h
index 02d2c7f45b527..792283d29d7b5 100644
--- a/include/linux/perf/arm_pmu.h
+++ b/include/linux/perf/arm_pmu.h
@@ -124,7 +124,6 @@ struct arm_pmu {
 	u64		reg_brbidr;
 #define ARMV8_PMUV3_MAX_COMMON_EVENTS		0x40
 	DECLARE_BITMAP(pmceid_bitmap, ARMV8_PMUV3_MAX_COMMON_EVENTS);
-#define ARMV8_PMUV3_EXT_COMMON_EVENT_BASE	0x4000
 	DECLARE_BITMAP(pmceid_ext_bitmap, ARMV8_PMUV3_MAX_COMMON_EVENTS);
 
 	/* Only to be used by ACPI probing code */
diff --git a/include/linux/perf/arm_pmuv3.h b/include/linux/perf/arm_pmuv3.h
index d698efba28a27..965c40b28dd77 100644
--- a/include/linux/perf/arm_pmuv3.h
+++ b/include/linux/perf/arm_pmuv3.h
@@ -78,6 +78,9 @@
 #define ARMV8_PMUV3_PERFCTR_STALL_SLOT_FRONTEND			0x003E
 #define ARMV8_PMUV3_PERFCTR_STALL_SLOT				0x003F
 
+/* Base of the common events reported in PMCEID{0,1}[63:32] from PMUv3p1 */
+#define ARMV8_PMUV3_EXT_COMMON_EVENT_BASE			0x4000
+
 /* Statistical profiling extension microarchitectural events */
 #define ARMV8_SPE_PERFCTR_SAMPLE_POP				0x4000
 #define ARMV8_SPE_PERFCTR_SAMPLE_FEED				0x4001
@@ -315,4 +318,23 @@
 
 #include <asm/arm_pmuv3.h>
 
+/*
+ * Whether this CPU's PMU implements a common event, as reported by
+ * PMCEID{0,1}: events 0x0000-0x003f in bits [31:0], and from PMUv3p1 events
+ * 0x4000-0x403f in bits [63:32], which read as zero before PMUv3p1.
+ * Must run on the CPU whose PMU is queried.
+ */
+static inline bool pmuv3_event_implemented(u16 event)
+{
+	bool ext = event >= ARMV8_PMUV3_EXT_COMMON_EVENT_BASE;
+	u16 id = ext ? event - ARMV8_PMUV3_EXT_COMMON_EVENT_BASE : event;
+	u64 pmceid;
+
+	if (id >= 64 || !pmuv3_implemented(read_pmuver()))
+		return false;
+
+	pmceid = id < 32 ? read_pmceid0() : read_pmceid1();
+	return pmceid & BIT_ULL(id % 32 + (ext ? 32 : 0));
+}
+
 #endif
-- 
2.52.0


