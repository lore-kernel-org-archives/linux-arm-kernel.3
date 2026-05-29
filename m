Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF4CBCD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 15:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IdSp5Vw7z+HR0yKWRiC1T9INgcuPtWfpi9peZITRCZA=; b=kUevTMblZAbfJlWxSaAKESoflq
	NMltQt8W0Ylqk+0Bq0mkR7oxmmZhToEuVd1XmXE6zdK7CaFEGw0w8HldFsizYGyn+xyH8w5oU0A7o
	gt4IEKli8iFeKNPdloEnaNZILQJevlU5W9WSotENntypJ/nzuUpdzS6PxT/ABZwlVsUk805WmSd4t
	G98FlOgLXezAhX1vxDXOZuFjULKHOqmNUhJzzC+1XEQirdd6svGQGaxAQdDlWaYLvEiH2pAw9/Vv1
	snsITFaJU1CvQWuy9fvWhkwTYQVBqZ80g2NAae+b86/QojeJbf7bIzd/vLk1U6vzqHHwhWTQF2om8
	1IebJDNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSzZx-00000007mnf-2Gxo;
	Fri, 29 May 2026 15:56:57 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSzZU-00000007mI9-3LId
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 15:56:34 +0000
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64TF7d2Z2776538;
	Fri, 29 May 2026 15:56:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=IdSp5Vw7z+HR0yKWR
	iC1T9INgcuPtWfpi9peZITRCZA=; b=MQJ+nAtm4uZZGXJsd46G+Kf+G/EjsLawB
	OcDKG8qkZ+uIWALCdbhnTzXAlgJ1ih9HPkzQEgo+JWn/r5xbGolBrvsY2ZvxNw/n
	VZ5e0mucOYOLQ6SROg5ySM09EvT7W8cCSLuIlFrdKSUSJpmC5e5ub2JEAWJg0+GA
	qV7zp0exmd0tDgvpWvC2++HZ0jPOgo/f9wRaXnwnWuS1gHvZAio/Vf/zFSRaIZiV
	B5x/YqmRX+FNDKzKIZhgm8ySAmRHBsYWllg+fSOw15W86tLMJPNwzwtOVA9QvojJ
	Nlc4byPx4uJ/mWSFcH+SSbzPBxLyOBxJh7WxI0wi+ZJ/JmfbvSU+w==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ee889m2bq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 May 2026 15:56:15 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 64TFs5pn016946;
	Fri, 29 May 2026 15:56:14 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4edjrbgjpd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 May 2026 15:56:14 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 64TFu66P36700652
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 29 May 2026 15:56:06 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B274A2004D;
	Fri, 29 May 2026 15:56:06 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 655E82004B;
	Fri, 29 May 2026 15:56:06 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.87.85.9])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 29 May 2026 15:56:06 +0000 (GMT)
From: Steffen Eiden <seiden@linux.ibm.com>
To: kvm@vger.kernel.org, kvmarm@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-s390@vger.kernel.org
Cc: Alexander Gordeev <agordeev@linux.ibm.com>,
        Andreas Grapentin <gra@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        David Hildenbrand <david@kernel.org>,
        Friedrich Welter <fritz@linux.ibm.com>,
        Gautam Gala <ggala@linux.ibm.com>,
        Hariharan Mari <hari55@linux.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Hendrik Brueckner <brueckner@linux.ibm.com>,
        Ilya Leoshkevich <iii@linux.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>, Joey Gouly <joey.gouly@arm.com>,
        Marc Zyngier <maz@kernel.org>, Nico Boehr <nrb@linux.ibm.com>,
        Nina Schoetterl-Glausch <oss@nina.schoetterlglausch.eu>,
        Oliver Upton <oupton@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Ulrich Weigand <Ulrich.Weigand@de.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>, Will Deacon <will@kernel.org>,
        Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH v1 12/26] KVM: arm64: Add PVM_ prefix to avoid name collisions
Date: Fri, 29 May 2026 17:55:45 +0200
Message-ID: <20260529155601.2927240-13-seiden@linux.ibm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260529155601.2927240-1-seiden@linux.ibm.com>
References: <20260529155601.2927240-1-seiden@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 7ACddOjvFerXD0E0lV_VSanFeKdPoAcn
X-Proofpoint-GUID: 7ACddOjvFerXD0E0lV_VSanFeKdPoAcn
X-Authority-Analysis: v=2.4 cv=XqfK/1F9 c=1 sm=1 tr=0 ts=6a19b71f cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=VnNF1IyMAAAA:8 a=UoxKMzVWMJxMEg80A50A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDE1NiBTYWx0ZWRfX9wuS4D1QB6x1
 kp1RpIFloqV+maUup3QiOVHUJTBohYC9JyukqiAlpFwt2M80rGHWPKEGm2hIJ5toBChgl0ZG0dv
 OAkDND3dzxNORV4cj1txC4BXdwhR9whZ/VBcKf8FcLV0YJUUmfi3OgUZV1VNYhIB6iB2HnB7/J8
 qtfwsAUkp7VAbkayOY6l+Yij/UKTuulsSTLeWEei59fRB2u9z3jIn5eX0QKMVeqUEo6fBaLlXJX
 SE8Xbgsy3Nh5KKG2QJ4hdnK+9+g/RI42QavKBZzKJleoC6637LUPAxn1wGGl5N1wfrOEAEC+LbV
 NAElljrdJHiYCsyIhvfJqoYFT1f0uazED/Bk4lFIXfQTkYVzyrXQHlztZOWzR77+FgbrOQ8WcBR
 jw+J5J2MNda9llPb4Ecg0yQ7GwWFwax4w80a17pkucClopxVXnEqH/umBTqRSjt0jZmAYA4Uksu
 eOsRi8bItdyq2i7Ckgg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2605290156
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_085628_956102_1BE0F675 
X-CRM114-Status: GOOD (  13.03  )
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

Rename ID_UNALLOCATED to PVM_ID_UNALLOCATED and read_id_reg to
pvm_read_id_reg to prevent future name collisions with other subsystems.
While at it, fix whitespace issues in the macro invocations

Signed-off-by: Steffen Eiden <seiden@linux.ibm.com>
---
 arch/arm64/kvm/hyp/nvhe/sys_regs.c | 48 +++++++++++++++---------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/sys_regs.c b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
index e8d773d38905..08b14053568b 100644
--- a/arch/arm64/kvm/hyp/nvhe/sys_regs.c
+++ b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
@@ -282,8 +282,8 @@ static void inject_undef64(struct kvm_vcpu *vcpu)
 	inject_sync64(vcpu, (ESR_ELx_EC_UNKNOWN << ESR_ELx_EC_SHIFT));
 }
 
-static u64 read_id_reg(const struct kvm_vcpu *vcpu,
-		       struct sys_reg_desc const *r)
+static u64 pvm_read_id_reg(const struct kvm_vcpu *vcpu,
+			   struct sys_reg_desc const *r)
 {
 	struct kvm *kvm = vcpu->kvm;
 	u32 reg = reg_to_encoding(r);
@@ -341,7 +341,7 @@ static bool pvm_access_id_aarch64(struct kvm_vcpu *vcpu,
 		return false;
 	}
 
-	p->regval = read_id_reg(vcpu, r);
+	p->regval = pvm_read_id_reg(vcpu, r);
 	return true;
 }
 
@@ -379,7 +379,7 @@ static bool pvm_idst_access(struct kvm_vcpu *vcpu,
  * register with encoding Op0=3, Op1=0, CRn=0, CRm=crm, Op2=op2
  * (1 <= crm < 8, 0 <= Op2 < 8).
  */
-#define ID_UNALLOCATED(crm, op2) {			\
+#define PVM_ID_UNALLOCATED(crm, op2) {			\
 	Op0(3), Op1(0), CRn(0), CRm(crm), Op2(op2),	\
 	.access = pvm_access_id_aarch64,		\
 }
@@ -438,46 +438,46 @@ static const struct sys_reg_desc pvm_sys_reg_descs[] = {
 	AARCH32(SYS_MVFR0_EL1),
 	AARCH32(SYS_MVFR1_EL1),
 	AARCH32(SYS_MVFR2_EL1),
-	ID_UNALLOCATED(3,3),
+	PVM_ID_UNALLOCATED(3, 3),
 	AARCH32(SYS_ID_PFR2_EL1),
 	AARCH32(SYS_ID_DFR1_EL1),
 	AARCH32(SYS_ID_MMFR5_EL1),
-	ID_UNALLOCATED(3,7),
+	PVM_ID_UNALLOCATED(3, 7),
 
 	/* AArch64 ID registers */
 	/* CRm=4 */
 	AARCH64(SYS_ID_AA64PFR0_EL1),
 	AARCH64(SYS_ID_AA64PFR1_EL1),
 	AARCH64(SYS_ID_AA64PFR2_EL1),
-	ID_UNALLOCATED(4,3),
+	PVM_ID_UNALLOCATED(4, 3),
 	AARCH64(SYS_ID_AA64ZFR0_EL1),
-	ID_UNALLOCATED(4,5),
-	ID_UNALLOCATED(4,6),
-	ID_UNALLOCATED(4,7),
+	PVM_ID_UNALLOCATED(4, 5),
+	PVM_ID_UNALLOCATED(4, 6),
+	PVM_ID_UNALLOCATED(4, 7),
 	AARCH64(SYS_ID_AA64DFR0_EL1),
 	AARCH64(SYS_ID_AA64DFR1_EL1),
-	ID_UNALLOCATED(5,2),
-	ID_UNALLOCATED(5,3),
+	PVM_ID_UNALLOCATED(5, 2),
+	PVM_ID_UNALLOCATED(5, 3),
 	AARCH64(SYS_ID_AA64AFR0_EL1),
 	AARCH64(SYS_ID_AA64AFR1_EL1),
-	ID_UNALLOCATED(5,6),
-	ID_UNALLOCATED(5,7),
+	PVM_ID_UNALLOCATED(5, 6),
+	PVM_ID_UNALLOCATED(5, 7),
 	AARCH64(SYS_ID_AA64ISAR0_EL1),
 	AARCH64(SYS_ID_AA64ISAR1_EL1),
 	AARCH64(SYS_ID_AA64ISAR2_EL1),
-	ID_UNALLOCATED(6,3),
-	ID_UNALLOCATED(6,4),
-	ID_UNALLOCATED(6,5),
-	ID_UNALLOCATED(6,6),
-	ID_UNALLOCATED(6,7),
+	PVM_ID_UNALLOCATED(6, 3),
+	PVM_ID_UNALLOCATED(6, 4),
+	PVM_ID_UNALLOCATED(6, 5),
+	PVM_ID_UNALLOCATED(6, 6),
+	PVM_ID_UNALLOCATED(6, 7),
 	AARCH64(SYS_ID_AA64MMFR0_EL1),
 	AARCH64(SYS_ID_AA64MMFR1_EL1),
 	AARCH64(SYS_ID_AA64MMFR2_EL1),
-	ID_UNALLOCATED(7,3),
-	ID_UNALLOCATED(7,4),
-	ID_UNALLOCATED(7,5),
-	ID_UNALLOCATED(7,6),
-	ID_UNALLOCATED(7,7),
+	PVM_ID_UNALLOCATED(7, 3),
+	PVM_ID_UNALLOCATED(7, 4),
+	PVM_ID_UNALLOCATED(7, 5),
+	PVM_ID_UNALLOCATED(7, 6),
+	PVM_ID_UNALLOCATED(7, 7),
 
 	/* Scalable Vector Registers are restricted. */
 
-- 
2.53.0


