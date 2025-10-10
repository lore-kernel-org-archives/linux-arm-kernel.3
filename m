Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AE5ECCD185
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 17:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FwPo3e7OvqTd1NWuZ8apR3AKltDtOQ12L7y93Bhadpo=; b=unFgp2R25NVNR8M6gDfPbz+MDB
	058TCY7Sg5Dye7brlT7sbjcL9+Cb/Wo8JXE4qAEkcxNb6Cg6OlLml/CeGgIwP8fx9fUnlV9kUMom1
	mAzZiQ/l/wcFqHYwxtdHXP+iksZBsaa1FCkxkYAj9w3rHwX7Hy03SAK1jgU77SmvalTM/xQXwcYJu
	+YXChQ7KfkMyT0kmNu7Y7+R5Krf7GUfcT99/Z61WR5mZ6914nOofUMOv0M+zW5V1wu73jiXqSDlMs
	8tFk7YC/K1/wzIXXJAko+bcOJIDcZkUC3BT6v3hdUiDsAhZIPqXlhl2eeBego8anzAZeFlmQAtT/D
	mWICkj/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7HDG-0000000968m-2Dwc;
	Fri, 10 Oct 2025 17:47:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7HDE-0000000968P-2TkX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Oct 2025 17:47:30 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59ABRbEe024175
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Oct 2025 17:47:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=FwPo3e7OvqTd1NWuZ8apR3AKltDtOQ12L7y
	93Bhadpo=; b=XfEYudEX0tV5K0sqZ6/EVFZfh3UQ07D1IgzeJ5ZDxqEvBTst/EX
	ywP00rfGYi/dfemfB75Pnlrj0QI+hbDy8jGfNXuwsiwKJNXddDze9qhGr2GfR68O
	+DX12cITSMPKRAQa3KBFu6ppaZFphRD4u1/JLDxAfjXFt8J4qX+rXHTP9nZ6cw26
	SBH6eWhnQFGfiGggjCEUEFsq9emlqkntU+J7bEyqJXH9SXyc53VrD7YVBxv8Oevw
	NG4zvShXumdzEeYTys24rqW2pNwO8Nt4wi6H4BW3cdt2ANbaIVgIjF74igEsMwT6
	QY5GHd+Rffgv9TaTqR3javpREgtTOq7W0+g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49q18y92sa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Oct 2025 17:47:25 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-27356178876so30901695ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Oct 2025 10:47:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760118444; x=1760723244;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FwPo3e7OvqTd1NWuZ8apR3AKltDtOQ12L7y93Bhadpo=;
        b=K+p7dMygNzi0h8c/1rgGSMEDOva+PW5hFY41tWMNfXoMDFlKoo/2uFtZE1SNi1Dhlg
         f/FrFfFzLvRoeAVzRPP9VcFdTaMkTQf5Xt2k40NRP1nSHuEKuZi4heWKlimYBJlIb3JL
         ukWJ0/HCz9Ics4Q5KPXqJUUBmP3VbVhW1NptN4Xz1MzqfiXkLCmEAx1Z5nCG7kx5I2di
         HimxYu1NAjfhtXkvOPUIDNADBdLRwdkZC5FElwqoq3eaCmSPAdXsswEuJT1HBeX7+ohO
         FXOivWuGRsjEvuYRNdKtRHG9K9nXHeJkBDBqtGedzc1Rm1M7fywV8ydVbbz/PglQ/ctO
         kE2w==
X-Forwarded-Encrypted: i=1; AJvYcCVSBVYQmPZ6peevqcIuS4Q7dwQn5UvNjLgRruNXvOZCSqfXXUdgym4OQKI8p1HP1Oh8ZxVBPJE7D6X9K+d688B3@lists.infradead.org
X-Gm-Message-State: AOJu0YxStyfLdZNKPdlGkzNp1kQep09hHzawriWgKNxlUQXAz+tQg7lu
	If42w/C9VP8tnKG46D1HNzHrq8qm63XOG3H2wwNmq5Siy0bkILVLHhZhY688JlMmsgsLAgWChCq
	CzLU/K+KICUlA/xJBKh0KdnArxXuI04ZUpo6iPk0+Asv2O/4mMqxpXxLdx7YYPJVYrhKq5NG92x
	EXDg==
X-Gm-Gg: ASbGncs3l99HHiMy5TGuC7zzQbBBsJ361HwBq0OBcdibdrAnS2r+xAYrgA88+JQshVJ
	pW26guriBdrau7zwOtFrKrLn+ubZiWJWhJ7+Y2ULwd2kJm7ywrTXZx+A9kRSatrJwhB2XSlBmA3
	fm7clNY6fdJtUqbAgdK5IaPpMEAElH6A7lmjG5wIXP4KQ9jXctpwjvCJGWtBsHRi78WMiVR3CpI
	M7X5ZwflIT5daEJF6pJLpbDHMgqYQnQvzS6acxhKxSR5DYIIO8neXka8R3znVWc63/a3EznSOHa
	ju+f7hMS9kYR23Tshb72kPCEq6d40m1O4fqAof5jAUbqjt1jsp32B3Qi6OOVhrX/Uf4=
X-Received: by 2002:a17:902:e952:b0:27e:f018:d2fb with SMTP id d9443c01a7336-2902735667emr159110335ad.6.1760118444054;
        Fri, 10 Oct 2025 10:47:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGyhIYzu2yvfjQTBTknIgm2OkThLL5tjUy3aIAha8LlsyWFfhUgj4W2Jq7D4Xj5QA9Zpu/bog==
X-Received: by 2002:a17:902:e952:b0:27e:f018:d2fb with SMTP id d9443c01a7336-2902735667emr159109855ad.6.1760118443498;
        Fri, 10 Oct 2025 10:47:23 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f4ad6esm62469435ad.109.2025.10.10.10.47.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 10:47:23 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Alexandru Elisei <alexandru.elisei@arm.com>
Cc: Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
        Zenghui Yu <yuzenghui@huawei.com>,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2] KVM: arm64: Guard PMSCR_EL1 initialization with SPE presence check
Date: Fri, 10 Oct 2025 23:17:07 +0530
Message-ID: <20251010174707.1684200-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: wVL3z9TVBX1jAOZZa2SW2sF5KRtHMZaD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEwMDA2NSBTYWx0ZWRfXzOXiV6CPtc2x
 fzqX0WukeJUFA/0VV/CIaUux75x4HE34Ft/vnkDhKVzovvbNXq4QSAwpBUyyPfxjOpkaeoxrrdn
 nMWsnqG5ocrLYKt+fvzm5nW5VY5Dp2J2MwkNP7bdvII0EeDLl2RseNeBlMcK7koIQpNmSXPPEgZ
 uuCVTQTr/szQq7sYRmxfB/3QmkIfrvq122aUJLlGfg1ET49mPSTkU4J0TeY6n1bBVgzQ+n9PEmj
 OCk7ds9L8APMn+YgWFWZQi2/NwLDQIGES7B5lYiOYBPdmTc86iW7dT22l3Kz3Jyn8IjrFDy+D8z
 Q8YMfhwz1lSMbUVjqhc8pDyQbkBHaJHcwNgfOdkH6I99Gulji3dZVqo0dUXPbGPIMwQwfV4Xtqw
 LckN7fdvXhCdk0OpPema/VP2T7C1Gg==
X-Proofpoint-ORIG-GUID: wVL3z9TVBX1jAOZZa2SW2sF5KRtHMZaD
X-Authority-Analysis: v=2.4 cv=LJZrgZW9 c=1 sm=1 tr=0 ts=68e946ad cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=sZYUSTO7CAmMIKym-AcA:9
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-10_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510100065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_104728_788992_0054D280 
X-CRM114-Status: GOOD (  17.94  )
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

Commit efad60e46057 ("KVM: arm64: Initialize PMSCR_EL1 when in VHE")
does not perform sufficient check before initializing PMSCR_EL1 to 0
when running in VHE mode. On some platforms, this causes the system to
hang during boot, as EL3 has not delegated access to the Profiling
Buffer to the Non-secure world, nor does it reinject an UNDEF on sysreg
trap.

To avoid this issue, restrict the PMSCR_EL1 initialization to CPUs that
support Statistical Profiling Extension (FEAT_SPE) and have the
Profiling Buffer accessible in Non-secure EL1. This is determined via a
new helper `cpu_has_spe()` which checks both PMSVer and PMBIDR_EL1.P.

This ensures the initialization only affects CPUs where SPE is
implemented and usable, preventing boot failures on platforms where SPE
is not properly configured.

Fixes: efad60e46057 ("KVM: arm64: Initialize PMSCR_EL1 when in VHE")
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
Changes in v2:
- Reworded commit log
- Reused host_data_set_flag() and host_data_test_flag().

 arch/arm64/kvm/debug.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/kvm/debug.c b/arch/arm64/kvm/debug.c
index 3515a273eaa2..4406ab962ebd 100644
--- a/arch/arm64/kvm/debug.c
+++ b/arch/arm64/kvm/debug.c
@@ -15,6 +15,12 @@
 #include <asm/kvm_arm.h>
 #include <asm/kvm_emulate.h>
 
+static int cpu_has_spe(u64 dfr0)
+{
+	return cpuid_feature_extract_unsigned_field(dfr0, ID_AA64DFR0_EL1_PMSVer_SHIFT) &&
+	       !(read_sysreg_s(SYS_PMBIDR_EL1) & PMBIDR_EL1_P);
+}
+
 /**
  * kvm_arm_setup_mdcr_el2 - configure vcpu mdcr_el2 value
  *
@@ -77,13 +83,12 @@ void kvm_init_host_debug_data(void)
 	*host_data_ptr(debug_brps) = SYS_FIELD_GET(ID_AA64DFR0_EL1, BRPs, dfr0);
 	*host_data_ptr(debug_wrps) = SYS_FIELD_GET(ID_AA64DFR0_EL1, WRPs, dfr0);
 
+	if (cpu_has_spe(dfr0))
+		host_data_set_flag(HAS_SPE);
+
 	if (has_vhe())
 		return;
 
-	if (cpuid_feature_extract_unsigned_field(dfr0, ID_AA64DFR0_EL1_PMSVer_SHIFT) &&
-	    !(read_sysreg_s(SYS_PMBIDR_EL1) & PMBIDR_EL1_P))
-		host_data_set_flag(HAS_SPE);
-
 	/* Check if we have BRBE implemented and available at the host */
 	if (cpuid_feature_extract_unsigned_field(dfr0, ID_AA64DFR0_EL1_BRBE_SHIFT))
 		host_data_set_flag(HAS_BRBE);
@@ -101,8 +106,8 @@ void kvm_init_host_debug_data(void)
 
 void kvm_debug_init_vhe(void)
 {
-	/* Clear PMSCR_EL1.E{0,1}SPE which reset to UNKNOWN values. */
-	if (SYS_FIELD_GET(ID_AA64DFR0_EL1, PMSVer, read_sysreg(id_aa64dfr0_el1)))
+	if (host_data_test_flag(HAS_SPE))
+		/* Clear PMSCR_EL1.E{0,1}SPE which reset to UNKNOWN values. */
 		write_sysreg_el1(0, SYS_PMSCR);
 }
 
-- 
2.50.1


