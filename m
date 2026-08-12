Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29BA5C5CFEE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 15:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=14LSQB2Ua2JnbWDG5vBR62154KgGG9UD45CnK8iJMI8=; b=XYAF5XlqQQFlrZXxIZv/PLqOfZ
	VEB3iCH4Ry+MKgesP6rPebIk0S153cwMIl+s5n/fgXmR/SXKKyE3ah5WbEFZ7LFyVjzEjrbeq2rj9
	yviMqR8m+scVI5qYvxgw9NYlR9cu+7ckeUVtRGJu3VVwF+FqXzZi5rUL0gyXGkF5//uRQM69qJcYk
	KAsCuX6AskYq/RAa16YJNB4xnn1xxNQGu0iXpFZ+89nyQGx7hz1FHHYbLvr2hLu4FgGxW8AaOrCi6
	HM02tzIUhMo9Y5wSzwa4CCSFFAD4gUlXF6ikA42f9+hAqOWCjpRuTMY/MxV4+5v5L2Tj0MTenuucI
	UglSiScA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuB18-0000000GUSz-3Ffn;
	Wed, 12 Aug 2026 15:37:22 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuB0h-0000000GTvN-3zix
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 15:36:59 +0000
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CE1uZ53594454;
	Wed, 12 Aug 2026 15:36:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=14LSQB2Ua2JnbWDG5
	vBR62154KgGG9UD45CnK8iJMI8=; b=jkRaOv13XNyrfFB6tsxOS/nfBtB5IW7bx
	wZ91m2TnSZUV/AFyl9Dyx33ys6MzcSTlEhm/CcynMhrVg85yVw3np9pfKmMNJ2U6
	m4pCFCo/o71c8GfUFsBPJ09wLRvki3NNr+8utAA5sIlYpIdJY+BHWPnUMjBKJujA
	jhIPvkfFSZgIeEvlE+Xu6mHA3RMKpu5f6Aipo3F0UX85PwNTVLP2dFCJluX0Ijqs
	H9VQP0qDtlY6l/PfVj2KoGGKX4gO+hE8STm1f57Lt8E2HKzfrH5qO6yvOHoJrOxv
	E0s4ADpD8AiMYo5KskONnB8VBOk799Hi1WkInGzQf7vswgcme8VgQ==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4fwvp32e1r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Aug 2026 15:36:43 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 67CFQIVW023680;
	Wed, 12 Aug 2026 15:36:42 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4fxh0gejgf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Aug 2026 15:36:42 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 67CFacOJ30605700
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Aug 2026 15:36:39 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C4B9020040;
	Wed, 12 Aug 2026 15:36:38 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7434B20049;
	Wed, 12 Aug 2026 15:36:38 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.87.85.9])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 12 Aug 2026 15:36:38 +0000 (GMT)
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
        Friedrich Welter <fritz@linux.ibm.com>, Fuad Tabba <tabba@google.com>,
        Gautam Gala <ggala@linux.ibm.com>,
        Hariharan Mari <hari55@linux.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Hendrik Brueckner <brueckner@linux.ibm.com>,
        Ilya Leoshkevich <iii@linux.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>, Joey Gouly <joey.gouly@arm.com>,
        Marc Zyngier <maz@kernel.org>, Nico Boehr <nrb@linux.ibm.com>,
        Nina Schoetterl-Glausch <oss@nina.schoetterlglausch.eu>,
        Oliver Upton <oupton@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
        Sean Christopherson <seanjc@google.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Ulrich Weigand <Ulrich.Weigand@de.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>, Will Deacon <will@kernel.org>,
        Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH v6 17/33] KVM: s390: Move PGM code definitions to asm/kvm_host.h
Date: Wed, 12 Aug 2026 17:36:13 +0200
Message-ID: <20260812153631.3376090-18-seiden@linux.ibm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260812153631.3376090-1-seiden@linux.ibm.com>
References: <20260812153631.3376090-1-seiden@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=AMtp2X5w c=1 sm=1 tr=0 ts=6a7c930c cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=VnNF1IyMAAAA:8 a=7A3N2L3ptH-yS8k9SGwA:9
X-Proofpoint-GUID: PAmGJQGQAdbw2nbGtS_kExc-VFhb3xVC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDEyNiBTYWx0ZWRfXxH7L9fG7x3WZ
 nPqIhg0hUh20oebS6tlTTC4N0egBtYWe5jBmRnhTRteoEqa64Q5/lK/tfu7+hri7kCqvnBuIaSd
 jwcrQn1IC4pB8ag/egOUiUB63izYFzoLbxVOaOzR3bvaxxhke+QC6eZ0MeIdCmot3Ow7CkWD7bI
 88yS6Pe0zCjumeLgTb/USujUXuHlv8tBjUj3aOcaIV5rHwq4/MWdeDKBPTQvT8beG2kkxfqBdWj
 xoIhkXgpxFAdg5/dFABlHSvgBIlODvYT/lYtLeExa6XE1EUd2232fm68TiGOZKPeGZZ+79tVDxP
 ptzs6lR3RvEzm2pJB2Sp22Oej0A4JD/snjowG3b1I7oYaU+237avL5GJd4kcrBpKuGa+Ah8UACR
 HmIBViGh1m0a5vxdcqdyCHPZZVHZyZelw7ubNt2OzVCN8B9BDr45PI8n0F5imNY77oTjsEqtrNo
 h9RairFhIag0LdThslA==
X-Proofpoint-ORIG-GUID: w_FE-BSIIpBCRU0KVMbNrwNM4lQk4Aq0
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDEyNiBTYWx0ZWRfX3yDz3oh0pOhd
 jPqF78rcCa3vHqkgJFIiXlKXDHv2yTe/qXpdCgO9PUPwGlhZjxBqjEMDGJuVnzwT1mC280NQUVk
 ML4cem6TTb685CW2qjYFiLpGRpWsP8A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608120126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_083657_705461_FD2C78AE 
X-CRM114-Status: GOOD (  14.26  )
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

Move PGM code definitions from kvm_host_s390.h (back) to the generic
kvm_host.h. These definitions are needed by multiple KVM implementations
and should be in a shared location.

No functional change.

Signed-off-by: Steffen Eiden <seiden@linux.ibm.com>
---
 arch/s390/include/asm/kvm_host.h      | 57 +++++++++++++++++++++++++++
 arch/s390/include/asm/kvm_host_s390.h | 57 ---------------------------
 2 files changed, 57 insertions(+), 57 deletions(-)

diff --git a/arch/s390/include/asm/kvm_host.h b/arch/s390/include/asm/kvm_host.h
index e76ceee11ef5..147325978225 100644
--- a/arch/s390/include/asm/kvm_host.h
+++ b/arch/s390/include/asm/kvm_host.h
@@ -5,4 +5,61 @@
 
 #include <asm/kvm_host_s390.h>
 
+#define PGM_OPERATION			0x01
+#define PGM_PRIVILEGED_OP		0x02
+#define PGM_EXECUTE			0x03
+#define PGM_PROTECTION			0x04
+#define PGM_ADDRESSING			0x05
+#define PGM_SPECIFICATION		0x06
+#define PGM_DATA			0x07
+#define PGM_FIXED_POINT_OVERFLOW	0x08
+#define PGM_FIXED_POINT_DIVIDE		0x09
+#define PGM_DECIMAL_OVERFLOW		0x0a
+#define PGM_DECIMAL_DIVIDE		0x0b
+#define PGM_HFP_EXPONENT_OVERFLOW	0x0c
+#define PGM_HFP_EXPONENT_UNDERFLOW	0x0d
+#define PGM_HFP_SIGNIFICANCE		0x0e
+#define PGM_HFP_DIVIDE			0x0f
+#define PGM_SEGMENT_TRANSLATION		0x10
+#define PGM_PAGE_TRANSLATION		0x11
+#define PGM_TRANSLATION_SPEC		0x12
+#define PGM_SPECIAL_OPERATION		0x13
+#define PGM_OPERAND			0x15
+#define PGM_TRACE_TABEL			0x16
+#define PGM_VECTOR_PROCESSING		0x1b
+#define PGM_SPACE_SWITCH		0x1c
+#define PGM_HFP_SQUARE_ROOT		0x1d
+#define PGM_PC_TRANSLATION_SPEC		0x1f
+#define PGM_AFX_TRANSLATION		0x20
+#define PGM_ASX_TRANSLATION		0x21
+#define PGM_LX_TRANSLATION		0x22
+#define PGM_EX_TRANSLATION		0x23
+#define PGM_PRIMARY_AUTHORITY		0x24
+#define PGM_SECONDARY_AUTHORITY		0x25
+#define PGM_LFX_TRANSLATION		0x26
+#define PGM_LSX_TRANSLATION		0x27
+#define PGM_ALET_SPECIFICATION		0x28
+#define PGM_ALEN_TRANSLATION		0x29
+#define PGM_ALE_SEQUENCE		0x2a
+#define PGM_ASTE_VALIDITY		0x2b
+#define PGM_ASTE_SEQUENCE		0x2c
+#define PGM_EXTENDED_AUTHORITY		0x2d
+#define PGM_LSTE_SEQUENCE		0x2e
+#define PGM_ASTE_INSTANCE		0x2f
+#define PGM_STACK_FULL			0x30
+#define PGM_STACK_EMPTY			0x31
+#define PGM_STACK_SPECIFICATION		0x32
+#define PGM_STACK_TYPE			0x33
+#define PGM_STACK_OPERATION		0x34
+#define PGM_ASCE_TYPE			0x38
+#define PGM_REGION_FIRST_TRANS		0x39
+#define PGM_REGION_SECOND_TRANS		0x3a
+#define PGM_REGION_THIRD_TRANS		0x3b
+#define PGM_SECURE_STORAGE_ACCESS	0x3d
+#define PGM_NON_SECURE_STORAGE_ACCESS	0x3e
+#define PGM_SECURE_STORAGE_VIOLATION	0x3f
+#define PGM_MONITOR			0x40
+#define PGM_PER				0x80
+#define PGM_CRYPTO_OPERATION		0x119
+
 #endif /* ASM_KVM_HOST_H */
diff --git a/arch/s390/include/asm/kvm_host_s390.h b/arch/s390/include/asm/kvm_host_s390.h
index 0c4e061d7437..22e8d7c4a755 100644
--- a/arch/s390/include/asm/kvm_host_s390.h
+++ b/arch/s390/include/asm/kvm_host_s390.h
@@ -150,63 +150,6 @@ struct kvm_vcpu_stat {
 	u64 signal_exits;
 };
 
-#define PGM_OPERATION			0x01
-#define PGM_PRIVILEGED_OP		0x02
-#define PGM_EXECUTE			0x03
-#define PGM_PROTECTION			0x04
-#define PGM_ADDRESSING			0x05
-#define PGM_SPECIFICATION		0x06
-#define PGM_DATA			0x07
-#define PGM_FIXED_POINT_OVERFLOW	0x08
-#define PGM_FIXED_POINT_DIVIDE		0x09
-#define PGM_DECIMAL_OVERFLOW		0x0a
-#define PGM_DECIMAL_DIVIDE		0x0b
-#define PGM_HFP_EXPONENT_OVERFLOW	0x0c
-#define PGM_HFP_EXPONENT_UNDERFLOW	0x0d
-#define PGM_HFP_SIGNIFICANCE		0x0e
-#define PGM_HFP_DIVIDE			0x0f
-#define PGM_SEGMENT_TRANSLATION		0x10
-#define PGM_PAGE_TRANSLATION		0x11
-#define PGM_TRANSLATION_SPEC		0x12
-#define PGM_SPECIAL_OPERATION		0x13
-#define PGM_OPERAND			0x15
-#define PGM_TRACE_TABEL			0x16
-#define PGM_VECTOR_PROCESSING		0x1b
-#define PGM_SPACE_SWITCH		0x1c
-#define PGM_HFP_SQUARE_ROOT		0x1d
-#define PGM_PC_TRANSLATION_SPEC		0x1f
-#define PGM_AFX_TRANSLATION		0x20
-#define PGM_ASX_TRANSLATION		0x21
-#define PGM_LX_TRANSLATION		0x22
-#define PGM_EX_TRANSLATION		0x23
-#define PGM_PRIMARY_AUTHORITY		0x24
-#define PGM_SECONDARY_AUTHORITY		0x25
-#define PGM_LFX_TRANSLATION		0x26
-#define PGM_LSX_TRANSLATION		0x27
-#define PGM_ALET_SPECIFICATION		0x28
-#define PGM_ALEN_TRANSLATION		0x29
-#define PGM_ALE_SEQUENCE		0x2a
-#define PGM_ASTE_VALIDITY		0x2b
-#define PGM_ASTE_SEQUENCE		0x2c
-#define PGM_EXTENDED_AUTHORITY		0x2d
-#define PGM_LSTE_SEQUENCE		0x2e
-#define PGM_ASTE_INSTANCE		0x2f
-#define PGM_STACK_FULL			0x30
-#define PGM_STACK_EMPTY			0x31
-#define PGM_STACK_SPECIFICATION		0x32
-#define PGM_STACK_TYPE			0x33
-#define PGM_STACK_OPERATION		0x34
-#define PGM_ASCE_TYPE			0x38
-#define PGM_REGION_FIRST_TRANS		0x39
-#define PGM_REGION_SECOND_TRANS		0x3a
-#define PGM_REGION_THIRD_TRANS		0x3b
-#define PGM_SECURE_STORAGE_ACCESS	0x3d
-#define PGM_NON_SECURE_STORAGE_ACCESS	0x3e
-#define PGM_SECURE_STORAGE_VIOLATION	0x3f
-#define PGM_MONITOR			0x40
-#define PGM_PER				0x80
-#define PGM_CRYPTO_OPERATION		0x119
-
 /* irq types in ascend order of priorities */
 enum irq_types {
 	IRQ_PEND_SET_PREFIX = 0,
-- 
2.53.0


