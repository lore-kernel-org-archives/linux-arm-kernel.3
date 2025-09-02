Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24E0DCA1007
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 03:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yKa72tAMaYiEp5QU2uzmYrLEiYq8WJdxdN4mi1XQFe4=; b=PGbZexX4WQjuf9gikT6IjlFuw6
	LQEbstisQzRySi4ddSLaX5bz4hrJfq7SGWP0nBrUpbFPodRaRtLvalxx5P4zRz3Xnx1oQgE/AdIS3
	P/ULuj7w8V0Z5k5aCUE/GTXkvb+gJKcEl/ZY1cFevQB7AlFSkgxZ8A5zZufx+JfVCT1xiqU+5aI+S
	cCIm/tif3wNumPl///IjSvswxUxDVBTgqfFXweXvnibxyD2Py+eBL7eKUUvOOMZ1nAvnbS1BiCPVN
	GVvyzWkyB4dpWij7ayANmZ0JQxiIfvwk28XgDikG25bCWRhm4o6bhNaSJysak0/CbLg48aF1LH8Og
	//WT5ZnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utI8E-0000000F7VG-3rrW;
	Tue, 02 Sep 2025 03:56:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utI0Y-0000000F5m3-0Gvx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 03:48:35 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5822RoKF024999
	for <linux-arm-kernel@lists.infradead.org>; Tue, 2 Sep 2025 03:48:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=yKa72tAMaYiEp5QU2uzmYr
	LEiYq8WJdxdN4mi1XQFe4=; b=V9WQ0yxkytlWbP/SkTsiQKHrLJW0XQxHQeGOc3
	AHm1VbemjWBjeBCgQWX2+CiwMilJ1VHzH2tSAViGZ+WbxC6oCDb5A9euLdw1JXoZ
	oaB+yImSicqjw2TtuW5hMe1YJSt/chIT8nUTF0O9tN2mp1+kp7XsASDU4AwZqvVE
	MNxpLsebgy68Hi3rGTz46dZ176jhFMDl8nMSrsn2xCMP5WvZtYRg5aew6Ap9B4Hc
	yUwIY5ho9Z+7SGGGKo9X9s38NYcrOBpUgELZ4372vYpmAlEbdrD6FoW01fcRgIpv
	U8z60PVIzZIbz6sGKi33NuykUnPtEkVYK9UaYQRHWPT9shcw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uscuxe8h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Sep 2025 03:48:33 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2445803f0cfso63089205ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Sep 2025 20:48:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756784912; x=1757389712;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yKa72tAMaYiEp5QU2uzmYrLEiYq8WJdxdN4mi1XQFe4=;
        b=KFB+seYbc+7tPYj6nlmiKM/7ft8jarkgSjbZj1lVg7quaEcyBjfbhNiR+8wtS04ksh
         84NWLRC3mZvJs2UuJUsGY4lPwjN8dzvd8Pe//rnPIqpjrIb5EANOFqt6KMwS39ozaAqt
         I4awIBdKAVCiR/PEkje3IKqVE0wjJ2v8hd0KQ4Pg3MQ+R4YcwbZtD0DDG+yAewn28jlY
         ekgx7WCX5yAeNCN3ZlEtPj43qiy2nzRNpBInndue1VPV47UyLme7B+CIC1VNxLgj1EZV
         n6NrRVy8FyOCNtDaXhgF2qfhUDuLWiO/ACePQZ3wCOd+PK7WDAklmJcWNe/D2q/DKTcl
         gLJg==
X-Gm-Message-State: AOJu0Yx7LMf6u1RDzfZeQWsJSopGZ0F5yjT2haIxSIRJFixgLcpJ43q/
	oRuWaHP/e2mtHVwLcwzflGcwksSS5vxCVF30uUgzWII9VpeWbd5mOqWB24fbel/pi7Hhg/9eL6W
	hibikWTzdq8g+4tj8ZAxUYo2EUCSX+DZ6L7yl8WWVqz31N9jdKZEmHA4W9m9QeJ5qUaSDpIwHTW
	VVtA==
X-Gm-Gg: ASbGncuSzUSdtznIYpQKcAi2X/6PkjHU7fkTexbWEmeSiJ40n8Mt5uQIAi8HyYH/+vT
	CS7mV4/SM0KpC3/fPlApQFIjXF3OMlefqHABEJYQQ84ZA8iKeMoIsG/tHh3ns1LVQtAqec0T7oc
	cGKNUanXeqnAi7Ge/mYH9ImenUlqHoU87fdtKc+8D13eeNyFaLOoCTWHmqrZOYyuqw2uJE6g411
	w5tTzbjDfbCF2Z+V5rSKcDGZ/eORmnFGMxwEh6qfznQA9AtkntA8CeYm9/SVpTTEYgYnmwTb2m+
	unaSGO/Pu39FtUBtiCb7Z/rGC2rZLIvu0Rty2WLDS5WvrFPPdEP/XfiMlvT9SpgR1d8Wv6Vt5yu
	9c3WCWWdTmNnulsKid5OcUGPWsQoybtXNpLC1
X-Received: by 2002:a17:902:e80f:b0:240:968f:4d64 with SMTP id d9443c01a7336-249448f9c33mr135634165ad.11.1756784911731;
        Mon, 01 Sep 2025 20:48:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExAbd7KtHY902tMepR979+mkTIDMW7M9jw2QHkr4Ls1PNDX5hM4GxNt4OPOJy08c/0mSNzYg==
X-Received: by 2002:a17:902:e80f:b0:240:968f:4d64 with SMTP id d9443c01a7336-249448f9c33mr135633765ad.11.1756784911264;
        Mon, 01 Sep 2025 20:48:31 -0700 (PDT)
Received: from jinlmao-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24b168157b6sm3467515ad.13.2025.09.01.20.48.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 20:48:30 -0700 (PDT)
From: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
Date: Tue, 02 Sep 2025 11:48:25 +0800
Subject: [PATCH v2] KVM: arm64: Fix NULL pointer access issue
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-etm_crash-v2-1-aa9713a7306b@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAhptmgC/5WMQQrCMBBFr1KyNiVJkzZ15T2kSBinNmAbzdSil
 N7dtFt1IQMf/mfemxlh9Ehsn80s4uTJhyEVtcsYdG64IPfn1JkSyohaSI5jf4LoqOMCsVYFprT
 A0v8tYuufm+vYpN55GkN8bepJrus3yyR5OigLWRkhjbGHQJTfH+4Koe/zFKv7F6grqK1srXai/
 QsELA1qDbKo4BNslmV5A95872wbAQAA
X-Change-ID: 20250901-etm_crash-0ee923eee98c
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
        Joey Gouly <joey.gouly@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Zenghui Yu <yuzenghui@huawei.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, James Clark <james.clark@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        linux-kernel@vger.kernel.org, quic_yingdeng@quicinc.com,
        jinlong.mao@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        Yingchao Deng <yingchao.deng@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756784908; l=2434;
 i=yingchao.deng@oss.qualcomm.com; s=20250901; h=from:subject:message-id;
 bh=pomve51ySnfeym3a5NacsGQMLiUMbbW2nqwOtU9Q3SM=;
 b=bb5AIneQZyVNy1w/19DaiOY0pRfZROqaFONWQ94N/D2KTzx4Qwhkqa6plCGU5jzJpmtAP/dLg
 2aAiLb7LhkMDRSfnmZt1hgR8nWzcT8mVlW5YJt4j6mL+o+/77IbjXhq
X-Developer-Key: i=yingchao.deng@oss.qualcomm.com; a=ed25519;
 pk=xilq+l2r3MI2IvgF26j2OwmdNb/TQNeJMQ3VdJi8C4U=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMSBTYWx0ZWRfX9lplM5v/CagD
 SyvQnqg2KJ4R9D3EXeBnT+i461YpySEH3MsTEbyOO6dcFS8QsgzT4+m4fQMBXniu4jsNU1J9g3L
 y9X7rPZwJJ0E2SS7Tc8oCxkhtV4jxqipPop9TXrdpBYa78H8yNHfkxFTf3Y6c3znnM+YbUIbu1n
 xE2eVZuwRhvIBRndHPzLwe960qtrY9+i8sA8dUbSA66iwRngTP8muKVpKluU9lh+NW8oXvxzpJN
 mJ7n5zEqsAaKpbH/aj2D6Mol40MXkOIs1Dzdvly9zGFwz6q1IfmK6EB7sjci7v3owyqOxmVw6b2
 k+bund5p/hqiyZLvnNSg0Fx6cpoD5m6NGhyAtBMK4Tms57aWbukzzNC3pMDXzptoDKLjCF6d+Wi
 zFtI1Xx0
X-Authority-Analysis: v=2.4 cv=A8xsP7WG c=1 sm=1 tr=0 ts=68b66911 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=ZDfnslOjjdbEBvoarX8A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: h-gKX2uXBAHpwF2AROYGZ4MGcfxHcHDQ
X-Proofpoint-GUID: h-gKX2uXBAHpwF2AROYGZ4MGcfxHcHDQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_01,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_204834_229130_0B499E1B 
X-CRM114-Status: GOOD (  16.24  )
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

When linux is booted in EL1, macro "host_data_ptr()" is a wrapper that
resolves to "&per_cpu_ptr_nvhe_sym(kvm_host_data, cpu)",
is_hyp_mode_available() return false during kvm_arm_init, the per-CPU base
pointer __kvm_nvhe_kvm_arm_hyp_percpu_base[cpu] remains uninitialized.
Consequently, any access via per_cpu_ptr_nvhe_sym(kvm_host_data, cpu)
will result in a NULL pointer.

Add is_kvm_arm_initialised() condition check to ensure that kvm_arm_init
completes all necessary initialization steps, including init_hyp_mode.

Fixes: 054b88391bbe2 ("KVM: arm64: Support trace filtering for guests")
Signed-off-by: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
Reviewed-by: James Clark <james.clark@linaro.org>
---
Add a check to prevent accessing uninitialized per-CPU data.
---
Changes in v2:
1. Move the warning to the end in order to improve readability. No
functional change intended
- Link to v1: https://lore.kernel.org/r/20250901-etm_crash-v1-1-ce65e44c137c@oss.qualcomm.com
---
 arch/arm64/kvm/debug.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/debug.c b/arch/arm64/kvm/debug.c
index 381382c19fe4741980c79b08bbdab6a1bcd825ad..593fcbbc7c014335c5999b774f9bfa367e709cb5 100644
--- a/arch/arm64/kvm/debug.c
+++ b/arch/arm64/kvm/debug.c
@@ -233,7 +233,7 @@ void kvm_debug_handle_oslar(struct kvm_vcpu *vcpu, u64 val)
 void kvm_enable_trbe(void)
 {
 	if (has_vhe() || is_protected_kvm_enabled() ||
-	    WARN_ON_ONCE(preemptible()))
+	    !is_kvm_arm_initialised() || WARN_ON_ONCE(preemptible()))
 		return;
 
 	host_data_set_flag(TRBE_ENABLED);
@@ -243,7 +243,7 @@ EXPORT_SYMBOL_GPL(kvm_enable_trbe);
 void kvm_disable_trbe(void)
 {
 	if (has_vhe() || is_protected_kvm_enabled() ||
-	    WARN_ON_ONCE(preemptible()))
+	    !is_kvm_arm_initialised() || WARN_ON_ONCE(preemptible()))
 		return;
 
 	host_data_clear_flag(TRBE_ENABLED);
@@ -252,7 +252,8 @@ EXPORT_SYMBOL_GPL(kvm_disable_trbe);
 
 void kvm_tracing_set_el1_configuration(u64 trfcr_while_in_guest)
 {
-	if (is_protected_kvm_enabled() || WARN_ON_ONCE(preemptible()))
+	if (is_protected_kvm_enabled() || !is_kvm_arm_initialised() ||
+	    WARN_ON_ONCE(preemptible()))
 		return;
 
 	if (has_vhe()) {

---
base-commit: 8cd53fb40a304576fa86ba985f3045d5c55b0ae3
change-id: 20250901-etm_crash-0ee923eee98c

Best regards,
-- 
Yingchao Deng <yingchao.deng@oss.qualcomm.com>


