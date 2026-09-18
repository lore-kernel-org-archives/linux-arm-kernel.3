Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7435FC982DA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 13:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dGxaGv9ue7Ewuq1eHs7QObjbv274+o/jH3uV6I04G0M=; b=L25HAOU3z85uQgN640T3lG6tlA
	it19SlnLSFPzBYr956wpUOOspfup90Dn8JomSbBND6qy7YYE6tf3F07Uhqm7hUwe9yMzovtXotqRY
	y6kEmxg7CsJb3J5yI087ixkhnPjrYNqiInb6z34h2fRbMB/KxlZ81q1Fz5Ndn14AwK+yPCjboOYtX
	Ksf6YHZ+93KE/boIR65Qz6nL/Z2zFH5+2H/p4uL+n0OfU0XYk5P7w3GdUyRoULj3ugB7ANF+iRDvO
	C41a8rJYBPfpD9L7QpQ/sci+/Ko5FJAi0qvGY9EGa0ZcXg0LNJ+bA0MK6Xx9ALN4HykLS6Y37y3Vh
	IHUvPfQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Yge-0000000EWrE-3XJF;
	Fri, 18 Sep 2026 13:31:32 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Ygb-0000000EWpQ-3HEA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 13:31:30 +0000
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68IA1VA7946109;
	Fri, 18 Sep 2026 13:31:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=dGxaGv9ue7Ewuq1eH
	s7QObjbv274+o/jH3uV6I04G0M=; b=kP5caMYGjWiK5Zg2yVeZnKRrXStfjjtMN
	e/nksQVa3dP8EalptcgmlGUF+v3Ahmg2yc0p4zB/DU8GnrEY4nYECNrkvd9sVl26
	nbeJeYM/6c7PKV5zAYs/7uFhyiHuKYU71EK4i39njZSHmgqon8ugiKVQ6I+FUPBT
	UJYEAYEqhciujOOozkNoMHE4lBDC8twyRQQN7k9p+nsWHNt43qC7wubksU2Yzkra
	8T7KYhqUKPu2+G0UAtGlo9Aq8FOjrEYqdi+2nyeiAqW0YdEHB6FVmvDAIXfl8kSV
	78Z5/U1pzbRlSyGUUDwOwnxb6SfI7qfFpGFYhsBn98PgNk5rIjn+g==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gmx848a5f-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 18 Sep 2026 13:31:16 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 68IDO2Jf777731;
	Fri, 18 Sep 2026 13:31:15 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4gra3yxkbh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Sep 2026 13:31:15 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 68IDV9JJ40042858
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 18 Sep 2026 13:31:09 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3C34A20040;
	Fri, 18 Sep 2026 13:31:09 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E2CB62004B;
	Fri, 18 Sep 2026 13:31:08 +0000 (GMT)
Received: from tuxmaker.lnxne.boe (unknown [9.87.85.9])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 18 Sep 2026 13:31:08 +0000 (GMT)
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
Subject: [PATCH v8 03/29] KVM: x86: Use file_to_kvm_x86() in SEV
Date: Fri, 18 Sep 2026 15:30:40 +0200
Message-ID: <20260918133107.1042730-4-seiden@linux.ibm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260918133107.1042730-1-seiden@linux.ibm.com>
References: <20260918133107.1042730-1-seiden@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE4NCBTYWx0ZWRfX5upRvvzS/GHQ
 9nzo7qmWVjtnz5WCcRPJtMyGiKna5NBxlk52F16Fu7SE1ZgImvaJG3+AnTRMLE5rziu38wu3CNv
 e6v77EWhmvcX9ZJxQCnoFNVmxfARWU2rEONrXkuFLFxIDPJeLovOAl/n3GDG39h0C/YsmpGgEuF
 l7ywT9z8OnhSffJXBHwNhtGFf2nsHS1QLlUPUschoawP034y7xT/W010DIbZRl5PAijEaclg4aR
 KcX0brqYW+pnCoJ3jR916UGmhL7cjRSd1nYiFxZqwCTn77I0FcR3go/9s4wC9ZzNV8ddHs5lDLF
 kuMcIYgLCWSBUHk7HK8iVFpvTh4dNhsDQg1p5oYdsNEohNylYE0Fj5Y8LTDu3caeSPuPS9ZtWHb
 31c7/ybfWsltitju73Ed+1ubKgLx39eXdmFI6wzBS6jMNV1scoueo2kvFVygBRI2lva6WOG4gKl
 gnPwlbBenMtKmbaj87Q==
X-Proofpoint-ORIG-GUID: kZZrtHqZQ3qIZ0PGz-KG7j3HrJTxHGUp
X-Proofpoint-GUID: LktavOI8BR_X_3gU2-eZCG7Zm5MjsSFG
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE4NCBTYWx0ZWRfX7KFZJvIoroxU
 WgpTbxWHlqJPPemq926nr1d+8zrUDr9bVB1iP81J6PUQWzmLq14agA2NJBDdfp/sjZhuteq3dgP
 4NPOzBPElk6Xk0hws92vYwS+pghTpvA=
X-Authority-Analysis: v=2.4 cv=cY9HPXDM c=1 sm=1 tr=0 ts=6aad3d24 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=iQ6ETzBq9ecOQQE5vZCe:22 a=1XWaLZrsAAAA:8 a=VnNF1IyMAAAA:8
 a=JZHfIBTrcVpj99XhhAcA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 malwarescore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180184
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_063129_825076_B904F989 
X-CRM114-Status: GOOD (  13.90  )
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

Use the new arch-namespaced helper  instead of open-coding the file
check and private_data cast separately.

Suggested-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Steffen Eiden <seiden@linux.ibm.com>
---
 arch/x86/kvm/svm/sev.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
index 5705723f1f41..6b0eacde4f06 100644
--- a/arch/x86/kvm/svm/sev.c
+++ b/arch/x86/kvm/svm/sev.c
@@ -2145,10 +2145,10 @@ int sev_vm_move_enc_context_from(struct kvm *kvm, unsigned int source_fd)
 	if (fd_empty(f))
 		return -EBADF;
 
-	if (!file_is_kvm(fd_file(f)))
+	source_kvm = file_to_kvm_x86(fd_file(f));
+	if (!source_kvm)
 		return -EBADF;
 
-	source_kvm = fd_file(f)->private_data;
 	ret = sev_lock_two_vms(kvm, source_kvm);
 	if (ret)
 		return ret;
@@ -2866,10 +2866,10 @@ int sev_vm_copy_enc_context_from(struct kvm *kvm, unsigned int source_fd)
 	if (fd_empty(f))
 		return -EBADF;
 
-	if (!file_is_kvm(fd_file(f)))
+	source_kvm = file_to_kvm_x86(fd_file(f));
+	if (!source_kvm)
 		return -EBADF;
 
-	source_kvm = fd_file(f)->private_data;
 	ret = sev_lock_two_vms(kvm, source_kvm);
 	if (ret)
 		return ret;
-- 
2.53.0


