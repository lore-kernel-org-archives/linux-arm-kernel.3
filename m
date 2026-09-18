Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79A7AC982DA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 13:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3mqGfRoVdfq7E+mHTQJBKISisjVhVOSDyzLzlLFbT8s=; b=knkk5SH3a79cX6Uc9pbSczXV1F
	lXj7jDpxklSJz45wXIXVNRdYulnlJyvRUsHv7DtiwJ2eXe/F7Pe8b3QE58pSb7/WMG3ICdOsh5DdW
	voaUODbQmQLO9nvzUgw1nS3bso1wjgXnQ+wIHUiXcvU36awRohsT71WhX6pEKtkICqFSazGTdcFQs
	bAQ2Gz9at/u257B4r3uJQQmU5mzXDxsjeskoOekIj/0P2i+vMXJ54tI+ZCkCNNK5gbTxIY96h+Ym+
	3g6PuGUUornYPm9tm5dr/kBXTpJ5352p0ElsHQoAF+sRzyxX9M3+ychgpAyKaqR87HYcbnV/hAWJ8
	/zs4A2+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Ygv-0000000EX4O-26Zz;
	Fri, 18 Sep 2026 13:31:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Ygn-0000000EWuN-13Qn
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 18 Sep 2026 13:31:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=3mqGfRoVdfq7E+mHTQJBKISisjVhVOSDyzLzlLFbT8s=; b=h0Z4Gel+muPd/IZUjVXpl4tOw3
	QCKPTqwsuwwdBvwz9qLmriRctO9MC0ee6L2jRyHDqmtUANpOKJNQw+AAfYbJJe+6JX4VBTjVQwVv3
	9waa7Ao8f4HOgUK9RAKLVxkkwDzELua2IDdfm+V6m6Ep67Y9ZdQhPsYUrR8slC2VxU3cTWDnxoOR6
	zaRGLp/1H7BMpkoEgB354ouYHbNxxbd7mH2ZbbsDvFn+Xey7S4zjjrjWFHAClsZJmskSyxJoI62ic
	MzxZXE2q06JeUuC6DbHYaCyfBxfNWUP4PxKq9yIDpb1fOlPXeb1okpFICw3r3bvmt854vMYAECc88
	vuSneAPg==;
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x7Ygi-0000000A8X3-0Z0S
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 13:31:39 +0000
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68IA1PqA960700;
	Fri, 18 Sep 2026 13:31:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=3mqGfRoVdfq7E+mHT
	QJBKISisjVhVOSDyzLzlLFbT8s=; b=oHqNUUK7QtMJohudWNUbZxVKDHJRlu5fw
	288+rIASaeOtn28sQrhlMqsqmNQYs5k5syQ5UYCuFlRk2+oI8RUMaUPJYf2CF1HT
	KrThW66f53oDnLzybVQOv6iDyCfqdLV3bjfdPT1QYvM3ZGzTX29rgBEIDC7JY8bs
	y1iC5ub7G0YO16LwDO2lCw5pOOIooE1fO8M/SG8zZ4kNgJ7IUMhAC2pjCfK/dT1x
	O8LX7W1+BSf2pQIFDCwi0ZPz1bRfsgn4MOzt11i1VRWkfkjvAE1CoWl0TWP9Hg4L
	uIphVLhKUOQN4SVChheEYd5FWmvq0wYiztJnPLHcBpu4QRGnMR5Xg==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gmxf5gb6k-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 18 Sep 2026 13:31:18 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 68IDOLxU1684689;
	Fri, 18 Sep 2026 13:31:17 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4gs4tv8bh5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Sep 2026 13:31:17 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 68IDVAtJ51642848
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 18 Sep 2026 13:31:10 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0412C20040;
	Fri, 18 Sep 2026 13:31:10 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A8A832004B;
	Fri, 18 Sep 2026 13:31:09 +0000 (GMT)
Received: from tuxmaker.lnxne.boe (unknown [9.87.85.9])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 18 Sep 2026 13:31:09 +0000 (GMT)
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
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Ulrich Weigand <Ulrich.Weigand@de.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>, Will Deacon <will@kernel.org>,
        Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH v8 05/29] KVM: Restrict kvm_get_kvm/kvm_put_kvm export to internal KVM modules
Date: Fri, 18 Sep 2026 15:30:42 +0200
Message-ID: <20260918133107.1042730-6-seiden@linux.ibm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260918133107.1042730-1-seiden@linux.ibm.com>
References: <20260918133107.1042730-1-seiden@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: IzGp1T9JHTVQGhSGOM8MW0mgylfcyXqI
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE4NCBTYWx0ZWRfX/Ce7xezjbWGc
 qVkDsiLCaMfAhjqgZ+cHJvVobHmEsQKxt0wSKboXRDAgAmKMhvXeyug1/kVmlJWftHXcll0D7Ft
 P9Z4ziUSWtPBeTADmfH6Z1hzUc3egOk=
X-Authority-Analysis: v=2.4 cv=cvgOAF4i c=1 sm=1 tr=0 ts=6aad3d27 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=U7nrCbtTmkRpXpFmAIza:22 a=1XWaLZrsAAAA:8 a=VnNF1IyMAAAA:8
 a=cWV-k8hB2h86IYwIXi4A:9
X-Proofpoint-ORIG-GUID: 2cK9Jgsw_kboKG4yhhAg5SVvhmho0g-i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE4NCBTYWx0ZWRfX9/m04V2tjKkt
 u0p1Ywr4vzs+xtCXCwLsTXBrSimc9Y1jKn/WJjwZB/2bKRp3mkp2plHyZQ1W3tY3s5ub7D9Go9H
 ozdg0N7BltEBDJaLyUuMoPJaugHRV71DJXj0S/ylryqgi+B0ajOIFIy/6RzyXNEtn8pOP8ukGPx
 GbZU1kYkjpD3E9gHMzxUpjI7OioFRiiolwAdirWiT2zdHN7IuY2iLOh4fdR+RxAOOOy98PsreTq
 rTkEXXC7WSGsCYMC4RUq8sCtshZSG0jodu6T+VOsPaNMjjXTl2TdW7eZmGFVB8kyWS7Lv/Iw083
 PV+cJDNdbvjv0aveIZbnoP4Z0tp62Bm77PwCbloSB60lRQffrOdTaqnTD12NV8/TX+VmMNf61uR
 YRXJxYsPCNpQVYUyEJIR1PJTPozDoK5DJpZfSTTOEVLwQPfj+/XfGemwxabGyjOmNdVq87KyhhJ
 ugNvtwvzD4kJBYryP0Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609180184
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_143136_599364_EBD9B393 
X-CRM114-Status: GOOD (  14.44  )
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

Switch kvm_get_kvm, kvm_get_kvm_safe, and kvm_put_kvm from
EXPORT_SYMBOL_GPL to EXPORT_SYMBOL_FOR_KVM_INTERNAL. These symbols are
now only used within KVM itself. No external module needs them now that
VFIO uses file-based reference counting. Remove the corresponding
exemptions from the x86 KVM Makefile exports check.

Suggested-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Steffen Eiden <seiden@linux.ibm.com>
---
 arch/x86/kvm/Makefile | 5 +----
 virt/kvm/kvm_main.c   | 6 +++---
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/arch/x86/kvm/Makefile b/arch/x86/kvm/Makefile
index e6d395ede9e2..c6bf463f5032 100644
--- a/arch/x86/kvm/Makefile
+++ b/arch/x86/kvm/Makefile
@@ -61,10 +61,7 @@ exports_grep_trailer := --include='*.[ch]' -nrw $(srctree)/virt/kvm $(srctree)/a
 				-e kvm_page_track_unregister_notifier \
 				-e kvm_write_track_add_gfn \
 				-e kvm_write_track_remove_gfn \
-				-e kvm_file_to_kvm_fn \
-				-e kvm_get_kvm \
-				-e kvm_get_kvm_safe \
-				-e kvm_put_kvm
+				-e kvm_file_to_kvm_fn
 
 # Force grep to emit a goofy group separator that can in turn be replaced with
 # the above newline macro (newlines in Make are a nightmare).  Note, grep only
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index bab71d398236..891a67cb365a 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -1314,7 +1314,7 @@ void kvm_get_kvm(struct kvm *kvm)
 {
 	refcount_inc(&kvm->users_count);
 }
-EXPORT_SYMBOL_GPL(kvm_get_kvm);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_get_kvm);
 
 /*
  * Make sure the vm is not during destruction, which is a safe version of
@@ -1324,14 +1324,14 @@ bool kvm_get_kvm_safe(struct kvm *kvm)
 {
 	return refcount_inc_not_zero(&kvm->users_count);
 }
-EXPORT_SYMBOL_GPL(kvm_get_kvm_safe);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_get_kvm_safe);
 
 void kvm_put_kvm(struct kvm *kvm)
 {
 	if (refcount_dec_and_test(&kvm->users_count))
 		kvm_destroy_vm(kvm);
 }
-EXPORT_SYMBOL_GPL(kvm_put_kvm);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_put_kvm);
 
 /*
  * Used to put a reference that was taken on behalf of an object associated
-- 
2.53.0


