Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6EACCD6E49
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 15:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZtdNOjsS5e1+chG/SOEjXZHnwNU0fc8NOy7/AKFWsBU=; b=kdBlsfZqSfBPp9yQzwYuA7Sjnl
	nxlL2sHl511N9CFnCre6WnbqAYF3ol5QNv1TpTK2d5t3z0IVrzlwa4ibLCRBypo/dxP0QSdNUKqS3
	KmoseLhQPf9OKoiWEEZ7Oz+ocBgOVhZRDwuIRWigCbCqM/Y5jVnOFESlJ4L8vDgGXx4DcfbzxZN+B
	Z802Vbm97aFiVAluM/JpAfGetc4C4rKn2wyR4vXuPvfT3ToP4xZyRyuNGZq+ZaVaDvfUqVv6yFp1M
	KMZmMwfeQDW88Q0R9gE2XipPvoK/a+q212EIOccqLlZNGn4ObuTYNGyX6JAnvFpau4YfiwSiRLnd6
	K8O0EAFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSzZo-00000007ma0-19Wf;
	Fri, 29 May 2026 15:56:48 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSzZP-00000007mBz-1aYI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 15:56:24 +0000
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64TF5i9E2418034;
	Fri, 29 May 2026 15:56:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=ZtdNOjsS5e1+chG/S
	OEjXZHnwNU0fc8NOy7/AKFWsBU=; b=g6b1nIncytF7I5499HWr1yrq1R/EY6xyr
	TpedGbyJUFiQuSiP5dHBcTGVkd2NTw0gC1p9DisYRdfu0ZIeaHZ3GcBZaxE5oB0e
	pJSgUV2YjM/XhEc9/2f4qIk1Go/6oV2DIasxS5xEw/TCF7WpHDUmggpcmHYdHlOR
	cCfC4rSh6pi1VhhDK9daGQVM8QZkD6WJsiX7qDnf56S2PBPigi60gYxGjkAF6aWl
	9CBbAlmdURPPpo8/WmXDqpo6z2N/gs+sZMRwE2JoPrs9QI3iWyXg9hyASMgpnhYD
	0wxREnxZGzLUcP/WOvTbs7B7tO8OT7kEmYM5vdGD1UTelTZD7xyiw==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ee884vkmn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 May 2026 15:56:10 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 64TFs5Dd003155;
	Fri, 29 May 2026 15:56:09 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4edjrbgm7r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 May 2026 15:56:09 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 64TFu3Dc41877920
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 29 May 2026 15:56:03 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6A71F20040;
	Fri, 29 May 2026 15:56:03 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1E7BE2004D;
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
Subject: [PATCH v1 03/26] KVM: arm64: Generalize get_idreg_field_*()
Date: Fri, 29 May 2026 17:55:36 +0200
Message-ID: <20260529155601.2927240-4-seiden@linux.ibm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260529155601.2927240-1-seiden@linux.ibm.com>
References: <20260529155601.2927240-1-seiden@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=L4MtheT8 c=1 sm=1 tr=0 ts=6a19b71a cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=iQ6ETzBq9ecOQQE5vZCe:22 a=VnNF1IyMAAAA:8 a=Qz9-bC73Ewa-9BkP4PUA:9
X-Proofpoint-ORIG-GUID: Y8uUbAKDXN_ID0QggIym4anEE5667k0U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDE1NiBTYWx0ZWRfXyDiYpjBYGR3M
 8DzHC0YkcfkpvmaUG1sT7vzwzaTmojweT/MfINdf7VZOBWRVmf/u5NKJP8eytk1Ik4rkGaB4gjO
 bHT1XNig42Hc3gdqFs3u/2vz9VjmRurEOyBE1DHvrQI7pgS/6joLKTF0hfjUtpvgu16YoUqS4Vy
 vjPGySXjkiE1po+O9TKyfJcaylw8f3fpskeXclADc7fZfElKxbWvSaN5V2decooYIDkgccuwOp6
 KJu3KTwBlx2igMhoxqWhP3N/mxU5IKEffO04xfPzRUAYd2auxb7/pUqdCAjb1CJAZNDwFMROLT/
 AN/JvehoyYHHXM01P5J06qKaAnQUEO0LBT/cdpXvudkrOGB3xzglfZyh0peYG14wB2WftzuZ0KJ
 cEHw+PwrIH1xIYEF93C9EUF48stwT2sLAtENSqXkdxN0MwWKh0YjbW9uuwWw/i8BP2WMaMup+A5
 dXrgRLxIFCCVavQW2XA==
X-Proofpoint-GUID: Y8uUbAKDXN_ID0QggIym4anEE5667k0U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290156
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_085623_424020_16696F83 
X-CRM114-Status: GOOD (  12.43  )
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

Introduce intermediate macros that extract the value from a passed
parameter instead of reading the VM's ID register. Allow using other
sources of ID register values, i.e. read directly from the hardware or
during a sequence of sanitization steps.

Co-developed-by: Nina Schoetterl-Glausch <nsg@linux.ibm.com>
Signed-off-by: Nina Schoetterl-Glausch <nsg@linux.ibm.com>
Signed-off-by: Steffen Eiden <seiden@linux.ibm.com>
---
 arch/arm64/include/asm/kvm_feature.h | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_feature.h b/arch/arm64/include/asm/kvm_feature.h
index d580f4ffab34..067550d5b208 100644
--- a/arch/arm64/include/asm/kvm_feature.h
+++ b/arch/arm64/include/asm/kvm_feature.h
@@ -6,20 +6,23 @@
 #include <linux/bitfield.h>
 #include <asm/sysreg-defs.h>
 
-#define get_idreg_field_unsigned(kvm, id, fld)				\
-	({								\
-		u64 __val = kvm_read_vm_id_reg((kvm), SYS_##id);	\
-		FIELD_GET(id##_##fld##_MASK, __val);			\
-	})
+#define extract_id_field_unsigned(val, id, fld)				\
+	(FIELD_GET(id##_##fld##_MASK, (val)))
 
-#define get_idreg_field_signed(kvm, id, fld)				\
+#define extract_id_field_signed(val, id, fld)				\
 	({								\
-		u64 __val = get_idreg_field_unsigned(kvm, id, fld);	\
+		u64 __val = extract_id_field_unsigned((val), id, fld);	\
 		sign_extend64(__val, id##_##fld##_WIDTH - 1);		\
 	})
 
+#define get_idreg_field_unsigned(kvm, id, fld)				\
+	extract_id_field_unsigned(kvm_read_vm_id_reg((kvm), SYS_##id), id, fld)
+
+#define get_idreg_field_signed(kvm, id, fld)				\
+	extract_id_field_signed(kvm_read_vm_id_reg((kvm), SYS_##id), id, fld)
+
 #define get_idreg_field_enum(kvm, id, fld)				\
-	get_idreg_field_unsigned(kvm, id, fld)
+	extract_id_field_unsigned(kvm_read_vm_id_reg((kvm), SYS_##id), id, fld)
 
 #define kvm_cmp_feat_signed(kvm, id, fld, op, limit)			\
 	(get_idreg_field_signed((kvm), id, fld) op S64_SYS_FIELD_VALUE(id, fld, limit))
-- 
2.53.0


