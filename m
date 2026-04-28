Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD493FF886F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 16:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bpCEDly7MH6bByxakmIbQ1R0PHyCTelNjZ+wTgtP6dA=; b=3uLuIrti1qx9GI8Zox7l5PCDI3
	0YA8abMG4p1LFcXUkoBngZZNCS1uqEp4tZDJ5A5/OhewmAZ0KLjJZTamqudEK1/mJ6eZBmPAvbi19
	I3xsPPeoUvGPOoWLLKhCY7y2ytY/P4qB189hWiEcTB9cnLr79S3PXFjN21Kgd5AWXPyxpgBnAPJpX
	bpcf9YzY0QO1vR3D+WFbkmBlO+qXgnBJnQYh4Do5e2CUO/cuXkL9JMu2TmQCWbSVrOFDy8pDLBnF9
	9y7rQb0ABsEWiIomB4qrAxJgBrxudEqmG1h0Z7Pgbue+Wys4+xVfkKdKIpKw4w3B06/9aU9/a2Skn
	cRmhe4QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHkwy-00000001pnt-26W8;
	Tue, 28 Apr 2026 16:06:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHkwj-00000001pVk-0z3c
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 28 Apr 2026 16:06:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=bpCEDly7MH6bByxakmIbQ1R0PHyCTelNjZ+wTgtP6dA=; b=cXIiiohTx28vXnWwBUDZFJIlMQ
	25fLsdwk0z1vIjVEfpcSkwCZXp+Czh6iTKkEVbddq6MoMknjDafyv88kLpsM0GLl2MPZy0EK3k9LU
	XPeMOEBLNjoKfCmPOOGODiNxXFKHHaQ9tpmJCLQWl+OhK3RCk10f2nrOm5mQQp1fD31v2fIF65Fe0
	IlPWNJkSSH+kZ+L8qqNVEvrBl5TyPWiBPg5a/klzT8P3u2af+crSrS4F4Kzjv+FNeYnnDetUmye68
	5x7LRcB55SOxAOfMzcESBVlUc0B7rDGbDZJxz2W8JZ97Q4KN+fN4iD5XXD4SSjziOIzblo7SXPOtd
	yXcDPPLg==;
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHkwd-00000003Xe9-1Eq1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 16:06:00 +0000
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S81S353102032;
	Tue, 28 Apr 2026 16:05:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=bpCEDly7MH6bByxak
	mIbQ1R0PHyCTelNjZ+wTgtP6dA=; b=SNe7BBiWeLtUPbeZXs+y6B/i5iSZx/f6w
	pafZb37hkDx4YoZ764c0THNIet/vR9Qf7JMxoZk5K9bqisJ/0M3ZWGRUaPV7JpEZ
	JwU7VlPJ9VyfpqUFbA1YvceegUhmXUffgZ8jYj+5mPxXsZAHLG7f281LeyrsdTII
	Y1OVNvUwmgYXzgmDRz1BWuxfDF9E3RBWutSrYXq5FJJLTumEduTeHSkLeCQvZhCI
	z0vEUoFmM2hnCThcwvrayHQE/FGt3OlGfl4dgCT1G105SX9eR/x1gsU4i1aAvpo1
	P+KA4TVQxQz/5k6ELSCy6B8xKubroEQeu5P9/scXBGRKR8S0KrHrA==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4drn44pgqc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Apr 2026 16:05:39 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 63SFroAQ001931;
	Tue, 28 Apr 2026 16:05:38 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4dsa5ga9en-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Apr 2026 16:05:38 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 63SG5Zbm51511756
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 28 Apr 2026 16:05:35 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0A34720040;
	Tue, 28 Apr 2026 16:05:35 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AC1EB2004B;
	Tue, 28 Apr 2026 16:05:34 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.87.85.9])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 28 Apr 2026 16:05:34 +0000 (GMT)
From: Steffen Eiden <seiden@linux.ibm.com>
To: kvm@vger.kernel.org, kvmarm@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-s390@vger.kernel.org
Cc: Andreas Grapentin <gra@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        David Hildenbrand <david@kernel.org>,
        Gautam Gala <ggala@linux.ibm.com>,
        Hendrik Brueckner <brueckner@linux.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>, Joey Gouly <joey.gouly@arm.com>,
        Marc Zyngier <maz@kernel.org>,
        Nina Schoetterl-Glausch <oss@nina.schoetterlglausch.eu>,
        Oliver Upton <oupton@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Ulrich Weigand <Ulrich.Weigand@de.ibm.com>,
        Will Deacon <will@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>
Subject: [RFC PATCH v2 20/28] KVM: s390: Prepare kvm-s390 for a second kvm module
Date: Tue, 28 Apr 2026 18:05:17 +0200
Message-ID: <20260428160527.1378085-21-seiden@linux.ibm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260428160527.1378085-1-seiden@linux.ibm.com>
References: <20260428160527.1378085-1-seiden@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: vyoDx_scQYZbYBDeoFq3c7osnpRWlBfQ
X-Authority-Analysis: v=2.4 cv=Ft81OWrq c=1 sm=1 tr=0 ts=69f0dad3 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=iQ6ETzBq9ecOQQE5vZCe:22 a=VnNF1IyMAAAA:8 a=ncMJ9zR-EkmSMqSD_lAA:9
X-Proofpoint-GUID: vyoDx_scQYZbYBDeoFq3c7osnpRWlBfQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDE1MSBTYWx0ZWRfXyofQI0ArX0OR
 d28m0nfBOaHcZAT9J+NepG5rtcO0n0Jemm+yVamECpqowlJndtYK9XGnvjP7d+UPeXWKr+b0Q7m
 /v435LAZLm2xYAF3g3SYY9E5wsX1/M7jCtrclkzMtSxPDcIWsuOfrvyuosvnKGwQZp1fCnJYrqB
 nS5cwqnYYVqj2SZLwsAp5fGPdAKT0EmXrQ7NEQeJtZUX7yNLKD8SfguOoB4hhYa8kN1AaTXjSzg
 I6Djx+vqkwBtkS6zCIyNopCUOoqszUL220VMmGVTrAVd5GXo4wzSb3L62o+Y4VSsnT9PfNQLVz1
 lBgeph6Hp7qKoN3C5CIjwOp06zTZ5Q87JisxixV5qtBtNolqpgcJ3wwoKE5+2bR+Qw/8nE2sA6B
 yxTHQMekZuuwA1vKFpPLGQo22hwKi6V+q0RsC/mRgOdWgzV459ppRQcWDQQXGY7ARLHc60s28ht
 z/FAf252hXK39vSbN1w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280151
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_170555_657079_81BBD7BE 
X-CRM114-Status: GOOD (  13.09  )
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

The second KVM module will have a different Kconfig set.
When both modules are compiled the Kconfig sets get merged and
the native s390 KVM needs to implement functionality required by
the respective config options. Ensure that s390-KVM will still compile.

Signed-off-by: Steffen Eiden <seiden@linux.ibm.com>
---
 arch/s390/kvm/s390/s390.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/s390/kvm/s390/s390.c b/arch/s390/kvm/s390/s390.c
index 0e325b47d40e..5373b2347651 100644
--- a/arch/s390/kvm/s390/s390.c
+++ b/arch/s390/kvm/s390/s390.c
@@ -5677,6 +5677,14 @@ bool kvm_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range)
 	return gmap_unmap_gfn_range(kvm->arch.gmap, range->slot, range->start, range->end);
 }
 
+#ifdef CONFIG_HAVE_KVM_VCPU_RUN_PID_CHANGE
+/* Make s390 compile if arm64-on-s390 is selected */
+int kvm_arch_vcpu_run_pid_change(struct kvm_vcpu *vcpu)
+{
+	return 0;
+}
+#endif /* CONFIG_HAVE_KVM_VCPU_RUN_PID_CHANGE */
+
 static inline unsigned long nonhyp_mask(int i)
 {
 	unsigned int nonhyp_fai = (sclp.hmfai << i * 2) >> 30;
-- 
2.51.0


