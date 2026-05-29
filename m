Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EEB1CD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 15:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ljBGB7KNBcV4js4ARcAzKk20xu/gcYobP0fAzwBLxO4=; b=SdHK71K7ak4p76rbznxg650EX2
	RlhJkQ3z615+EUcfnJxG/ZT1LLM51fqOWPlwURhVAC2DdTvrg5bmkLnpDZ29ttMf5dZ37wpk6fOQW
	6VIc3aoxFMV3/AfelYyaGIbyk2Wln+MoxWT5e2jq9gAK82RZNfEa9pXMeTqFgrZTZ0c5CzaDv8vcE
	eDZST/Tv7fz6BSx9FvwMCz8wA9M1Lr09LtiI5IdNJ+zccXgx3ncdOKU3uIuQyzjhqWErceJ7MR7g6
	G/IqKJevrf0PZMVn44P2siMH6M4HbbtBb3n3WSmdD7sDtaQRiA26pJts/lwEJAa5hWiy1Ig+pHVpN
	ZBmIh5qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSzZq-00000007me8-14Rh;
	Fri, 29 May 2026 15:56:50 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSzZT-00000007mFc-2R8D
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 15:56:32 +0000
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64TF6ZrS2133949;
	Fri, 29 May 2026 15:56:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=ljBGB7KNBcV4js4AR
	cAzKk20xu/gcYobP0fAzwBLxO4=; b=UpzwAVFBQLF+gdifZpeiTX/DHEiNgtZqo
	kyqKhAwAxggW851r5n6xNQyE82hvmfM0NLx1TRsffeCO/JD7TyB9/wBmS0kSNaMA
	KNODtAcHgMVzC9ZRxJNmKW9UsvYm6604U18KqSW/7op+Bln/aMWUzTgv78fimYge
	UqVe0QQoY+jwrNm1p62zL6yMuOS73Wpq771rTFIOb1jqqgocBZxQmfC3+nSeBsMB
	cJKaagda22ZAHMeY8Pj/X9MIf4lSbFfDQftkk+bNhr8e0s07tSpVMWzWO83f2spe
	Vu2XuNLxquPHoee/3Aoh99tIaavIB9c5yr8FWLi/wQGpBu3DFMPBQ==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ee887v3v6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 May 2026 15:56:14 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 64TFs7n3023023;
	Fri, 29 May 2026 15:56:14 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4edjrc0k29-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 May 2026 15:56:14 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 64TFu4qw16187694
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 29 May 2026 15:56:04 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 259A920040;
	Fri, 29 May 2026 15:56:04 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CE58D2004D;
	Fri, 29 May 2026 15:56:03 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.87.85.9])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 29 May 2026 15:56:03 +0000 (GMT)
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
Subject: [PATCH v1 05/26] KVM: arm64: Generalize kvm_has_feat_*
Date: Fri, 29 May 2026 17:55:38 +0200
Message-ID: <20260529155601.2927240-6-seiden@linux.ibm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260529155601.2927240-1-seiden@linux.ibm.com>
References: <20260529155601.2927240-1-seiden@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=QLJYgALL c=1 sm=1 tr=0 ts=6a19b71e cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=RzCfie-kr_QcCd8fBx8p:22 a=VnNF1IyMAAAA:8 a=_j3w4fkP5V9tGIP_pu8A:9
X-Proofpoint-GUID: pjTP7KJw7SCX0_U55yppFHYCNLoNtDUQ
X-Proofpoint-ORIG-GUID: pjTP7KJw7SCX0_U55yppFHYCNLoNtDUQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDE1NiBTYWx0ZWRfX6V5nzLMy5oqZ
 givv/kpikfps64HDzkuYJMwm24WuhYZrue3RNXGoYhzBUU5Iyj9hR5SM3uOzxDf1V+rwIOEiv5b
 EgVPvjOgEdWVMFy/bawWtKBfmXpjEYRZhhAshn080uNe3rb71JfAuXe4F/qgWdTK3xPxjUwYUJt
 NbvBEfm0jhFYtZ9l9cyEhujKJEkAQHCuF40uilN7TOEehuStJ49rnx7pi/k/f3b+jHeRQZekGIn
 9zvCu2/Jo8X+m3gS/inHV3951jbha/CFy6boFTXzbyiqJshNRdbSpzEJybPBJ1K8QYRqoSKwNrm
 v833snpklKzJtDu3NqEAKF1MwMelE0AdPvt8K+VFKHCBaDNVY0xgLUiD6VEP+LDTjeA7dpvIUr9
 +pVJVvfpYuYrhFMnIWOST2OmDuh3bTSa7094eOP9oRgVzdDvO+f4DrBxAbhOZkZk/tLiMLDqXeV
 SELU6JrsMU8t+s3YTJg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290156
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_085628_129119_D69C06B6 
X-CRM114-Status: GOOD (  12.30  )
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

Introduce an intermediate macro that extracts the value from a passed
parameter instead of reading the VM's ID register. Allow using other
sources of ID register values, i.e. read directly from the hardware or
during a sequence of sanitization steps.

Co-developed-by: Nina Schoetterl-Glausch <nsg@linux.ibm.com>
Signed-off-by: Nina Schoetterl-Glausch <nsg@linux.ibm.com>
Signed-off-by: Steffen Eiden <seiden@linux.ibm.com>
---
 arch/arm64/include/asm/kvm_feature.h | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_feature.h b/arch/arm64/include/asm/kvm_feature.h
index 6dd7b4a4929c..b627696ac648 100644
--- a/arch/arm64/include/asm/kvm_feature.h
+++ b/arch/arm64/include/asm/kvm_feature.h
@@ -26,6 +26,16 @@
 	 cmp_id_feat_signed(val, id, fld, op, limit) :			\
 	 cmp_id_feat_unsigned(val, id, fld, op, limit))
 
+#define id_has_feat(val, id, fld, limit)				\
+	cmp_id_feat(val, id, fld, >=, limit)
+
+#define id_has_feat_enum(val, id, fld, variant)				\
+	cmp_id_feat_unsigned(val, id, fld, ==, variant)
+
+#define id_has_feat_range(val, id, fld, min, max)			\
+	(cmp_id_feat(val, id, fld, >=, min) &&				\
+	cmp_id_feat(val, id, fld, <=, max))
+
 #define get_idreg_field_unsigned(kvm, id, fld)				\
 	extract_id_field_unsigned(kvm_read_vm_id_reg((kvm), SYS_##id), id, fld)
 
@@ -45,18 +55,17 @@
 	cmp_id_feat(kvm_read_vm_id_reg((kvm), SYS_##id), id, fld, op, limit)
 
 #define __kvm_has_feat(kvm, id, fld, limit)				\
-	kvm_cmp_feat(kvm, id, fld, >=, limit)
+	id_has_feat(kvm_read_vm_id_reg((kvm), SYS_##id), id, fld, limit)
 
 #define kvm_has_feat(kvm, ...) __kvm_has_feat(kvm, __VA_ARGS__)
 
 #define __kvm_has_feat_enum(kvm, id, fld, val)				\
-	kvm_cmp_feat_unsigned(kvm, id, fld, ==, val)
+	id_has_feat_enum(kvm_read_vm_id_reg((kvm), SYS_##id), id, fld, val)
 
 #define kvm_has_feat_enum(kvm, ...) __kvm_has_feat_enum(kvm, __VA_ARGS__)
 
 #define kvm_has_feat_range(kvm, id, fld, min, max)			\
-	(kvm_cmp_feat(kvm, id, fld, >=, min) &&				\
-	kvm_cmp_feat(kvm, id, fld, <=, max))
+	id_has_feat_range(kvm_read_vm_id_reg((kvm), SYS_##id), id, fld, min, max)
 
 /* Check for a given level of PAuth support */
 #define kvm_has_pauth(k, l)						\
-- 
2.53.0


