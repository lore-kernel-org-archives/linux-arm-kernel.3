Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD4FCCA0FFD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 11:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qQgwpgTjtkLJU+HAWiUzeizRHRiOnurR4p2VY8u2JAI=; b=HzMRJtbsSkpRgaiv4/zD0c7Lm3
	sShuoLarYQ5hgbYYNTa+tlzB2tm8aKuX4RozuEDAlhDdESCNujdoBe1sVB5mxZJMUx/FlXfAWpq1k
	t07kEHYbUw9AVwrYZfhcO9JnhjyWTbBECLoyWTnixNehA67LH32oCRn5rjBhDmSxKDk7I8KRRhczL
	r+TBR7+udRCPxyWJXCJ4UJoRyW+Q7nS1PM7K7MJspfQnVQ4roeOASnMvTymG35Z9bx9lNAlAojOTm
	p5BmqrmyWgPOpimQw5SuORkwy3FH7Tmk271NbF0XsAKAVuVVmr7qA8gYXT2cQWOd35dXn26tSbKd0
	Che2/0mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut2Qi-0000000C0uU-406I;
	Mon, 01 Sep 2025 11:10:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut1MH-0000000Bq2F-2YH1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 10:01:54 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5819eS0J005061
	for <linux-arm-kernel@lists.infradead.org>; Mon, 1 Sep 2025 10:01:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=qQgwpgTjtkLJU+HAWiUzei
	zRHRiOnurR4p2VY8u2JAI=; b=RC9P9Oehzy3AdgflD/E3cj+jUtfRXA6kdEm7xA
	EVOdyhC5Xd6rO3HjZ8NQ/v6zK4wdMzm0EbZEI52abfM6j17bxzZZu+JNTOr3c0hh
	y2D+qAFLCtx1u1syOQ6m7dVo/1oubVehXW2EAUnJUa6aUstK+MmVJUTYsTZfjT6k
	ZHv2Wle/nMnLVl+kDXmG9hVDB2lEnKlqPsKjlD4FFc75p8InD0r85vhIBxpvqe6K
	XEzLSSpVqIgswceb3zNHQznZkpp+IH2j0X0T2ytHKIzrtKMYwpnR0PcukIGnyiXK
	7OVZ4TmxmMUZGs2eU2XC6CsjLO0x8iXIznZSYSxp6/FjaHmg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uq0ecgqj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Sep 2025 10:01:52 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-327b016a1f3so4357516a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Sep 2025 03:01:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756720912; x=1757325712;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qQgwpgTjtkLJU+HAWiUzeizRHRiOnurR4p2VY8u2JAI=;
        b=nBgdqyJ/xGBhKJ6V1LiYEd2n6qLqX2HAKRQ16UzXJphwqgZ34zLoDiWoD4mhG6m2yp
         +uwq0rYzTtuHlkXRFHnWczIwjfjrexfh9HZ6rZYh99a2ResfX0PBo5gjI58HKnplDCeV
         2ftZKV0ILiS+sJMH2GDqap0wBHGHuvRTz/ZsKUHdmZ9tsqF4D0FfJg3z5FoH13YaFAln
         8paRr2OwPaYNQgFSvGbHlHGEyPAHRv8p+cNq0GQmluK4Df0Z22LBqFcYeCR2OHHX8BJF
         jzZQPwZSBNGsqb35Vloiv8V61B6nMRCZ6VefeqfmGtYFA004RQjv7HXbWDBFs/8dYNIm
         aqnA==
X-Gm-Message-State: AOJu0YympzPNYOrCgtwdJeDy2gE4aUDtWDDwyihsu2vpfaS9Mlgb/+v3
	xdCvSUbKDH1Lh+sCeEhun1awplO4aMHn3D6TR4EYmN8oPjDnkoNwN2VO/EjAas03vrVAOhMquTb
	N4ZVZH4rfNQa/xLozjsRA/2xAsCkVZOnBgXdLpKYv6EPCTaIfImjYa9Ct83wfwHygoqzE0hDQcp
	J3lg==
X-Gm-Gg: ASbGncuadE8ACkUdmDeSWzrRai7bBUtt2z8jPzf+ZLTk1N4IBfVOCHvGVe1ID2G/P42
	uSKPvk8a1w/Dsow6FmJm0jDWkPmCcmGVg2HpVLL7/og/yOWewYe9vh3S1Oq9iQRupFOtfG24U7W
	aquU4T/rz2guAECRoDLh3UKr9w1bWFxCpvr5k8NowWr9zBoMo+EMJTv4FNvG3TibwgeFRCwDYk8
	aWAvtF5BEYVZB9HYx+TTbkxJ5xLJsIf1P8/lz/EqiT0GIS3NtYvYcuophJI1vpWjlmIbyhC52yM
	446RqRmDhysLUifTAByR/+xjD8rl6rMmG6g7htjkL9UQRQci1VGGfSrDw5GPe7Xtf0r/nDjOi4l
	o5Sb9S+4CJn22HwjWWAW9eMmj1JnHiHpKMLru
X-Received: by 2002:a17:90b:52cf:b0:325:15bf:4dc2 with SMTP id 98e67ed59e1d1-3281531d3femr10322016a91.0.1756720911590;
        Mon, 01 Sep 2025 03:01:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1Jx0Jsm3pv79yInlxMD+8W/VppGUVhsqwbSB34wrfl77W1ukxVuajcczW1H+8VH9LiCTvhA==
X-Received: by 2002:a17:90b:52cf:b0:325:15bf:4dc2 with SMTP id 98e67ed59e1d1-3281531d3femr10321969a91.0.1756720911094;
        Mon, 01 Sep 2025 03:01:51 -0700 (PDT)
Received: from jinlmao-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4e673ad423sm6012525a12.50.2025.09.01.03.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 03:01:50 -0700 (PDT)
From: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
Date: Mon, 01 Sep 2025 18:01:45 +0800
Subject: [PATCH] KVM: arm64: Fix NULL pointer access issue
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250901-etm_crash-v1-1-ce65e44c137c@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAhvtWgC/3WMQQrCMBBFr1KyNiWTNjZ15T2kSIhTG7CNZmpRS
 u/utFuVgQ/vM//NgjAFJHHIZpFwChTiwAC7TPjODVeU4cIstNJG1Qokjv3ZJ0edVIi1LpDTesH
 /94RteG2uU8PcBRpjem/qCdb2l2UCyef3BVRGgTH2GInyx9PdfOz7nGN1/xuWla8ttLZ0qv0eN
 suyfAAlzbqP4gAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756720907; l=2171;
 i=yingchao.deng@oss.qualcomm.com; s=20250901; h=from:subject:message-id;
 bh=X+Tp/RgBOAXJDPg8M+jMZCaUbGdx0ODDY68KszLl/ck=;
 b=0hURcY7VKduAxWJqet9HVBB0Tztm1vwxHVJRsJrYuafgrjeyxcryvuyzEQCF5cYxXr7GiT3cR
 Hpi+c1kAlhRAj1DhVjCRr2MJL11P7TKvmGA6lC/3cAGyL8mg1vvfLXK
X-Developer-Key: i=yingchao.deng@oss.qualcomm.com; a=ed25519;
 pk=xilq+l2r3MI2IvgF26j2OwmdNb/TQNeJMQ3VdJi8C4U=
X-Proofpoint-GUID: NEhVi1qn7IOyDeg9qtQB0KQg-dqKoZ2o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwNCBTYWx0ZWRfX5LN3+6Ds8Hgy
 kGIUVnVMDnu4d5k4JVoCr0lpHr0Ggqm1hz0xS5CeXzfRaPlzu7qLU1JFjuw+IZBcW+ie99D37bz
 acqkO4j5l26OPJxJBCJ5KwMvyUah0XYQnzhmzJn+GwYl50FWLnpPzS9ETEH5/HKH038nGO9zUjB
 DHQ5jWt2Gi/RHKKPnCE5imEXH89INwMBCL62loEWBroDJ+KsNPcPR0pU4E4z7oIPVkgnO0b7P7i
 gIgasTP6He6XUWouyTOIS7X7aFjaBQ9vveb+5S8FyU8o5jVG1LTjVLsXgV4GEm1IL9VzTQ6nOMj
 NmIMRUKHiDKXElKgzgywlOsZgb+w3OjxGHZBiZc1OSrRIE4U4mDdpCQMtV+ttcOeloSMl1pbxRw
 iUiEOKQT
X-Proofpoint-ORIG-GUID: NEhVi1qn7IOyDeg9qtQB0KQg-dqKoZ2o
X-Authority-Analysis: v=2.4 cv=ea09f6EH c=1 sm=1 tr=0 ts=68b56f10 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=ZDfnslOjjdbEBvoarX8A:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-01_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1011 malwarescore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300004
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_030153_655723_65784D43 
X-CRM114-Status: GOOD (  15.51  )
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
---
Add a check to prevent accessing uninitialized per-CPU data.
---
 arch/arm64/kvm/debug.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/debug.c b/arch/arm64/kvm/debug.c
index 381382c19fe4741980c79b08bbdab6a1bcd825ad..add58056297293b4eb337028773b1b018ecc9d35 100644
--- a/arch/arm64/kvm/debug.c
+++ b/arch/arm64/kvm/debug.c
@@ -233,7 +233,7 @@ void kvm_debug_handle_oslar(struct kvm_vcpu *vcpu, u64 val)
 void kvm_enable_trbe(void)
 {
 	if (has_vhe() || is_protected_kvm_enabled() ||
-	    WARN_ON_ONCE(preemptible()))
+	    WARN_ON_ONCE(preemptible()) || !is_kvm_arm_initialised())
 		return;
 
 	host_data_set_flag(TRBE_ENABLED);
@@ -243,7 +243,7 @@ EXPORT_SYMBOL_GPL(kvm_enable_trbe);
 void kvm_disable_trbe(void)
 {
 	if (has_vhe() || is_protected_kvm_enabled() ||
-	    WARN_ON_ONCE(preemptible()))
+	    WARN_ON_ONCE(preemptible()) || !is_kvm_arm_initialised())
 		return;
 
 	host_data_clear_flag(TRBE_ENABLED);
@@ -252,7 +252,8 @@ EXPORT_SYMBOL_GPL(kvm_disable_trbe);
 
 void kvm_tracing_set_el1_configuration(u64 trfcr_while_in_guest)
 {
-	if (is_protected_kvm_enabled() || WARN_ON_ONCE(preemptible()))
+	if (is_protected_kvm_enabled() || WARN_ON_ONCE(preemptible()) ||
+	    !is_kvm_arm_initialised())
 		return;
 
 	if (has_vhe()) {

---
base-commit: 8cd53fb40a304576fa86ba985f3045d5c55b0ae3
change-id: 20250901-etm_crash-0ee923eee98c

Best regards,
-- 
Yingchao Deng <yingchao.deng@oss.qualcomm.com>


