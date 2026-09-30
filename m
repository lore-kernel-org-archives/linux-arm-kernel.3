Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2DF1CA5FC1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 17:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dpj1xdiSYmBVD2mZoG/uajyoZR60+eYA8soe6s9W9ZE=; b=dk6e5GmK3ltjdXZqJ2XWc8eZFC
	3XZPY+RpiIdy3x8DYSUi/mEdxE1iVZhjei7wHK0AD9DSjS4qcSc2TV5oeMQ+k2pAAkz3BkXeOkvPK
	h194ug5tiS4T2fWt3wH5G/Flxp+1wN2g9Ye6idMUwEW5GqSYcxVvXOlchHCqLTCUyxADZ8NnApz0w
	rIWTKUdCGaseL1fXtx+kPL8AByjeVeyO0qSu2HYS+vqme04R3rcJMBIz0mYqlpZJ+UEw1PE52NVG3
	iSGmxbVUG0IcCenLgI8LZn0wiEC4rG+0vgv7eVe42m/TcZHH1N3Gh70OBwdolyPg6L9Bm6w62MPqc
	k/VmQ/JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xByHw-00000006tLs-3DE7;
	Wed, 30 Sep 2026 17:40:17 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xByHr-00000006tKq-1kF4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 17:40:13 +0000
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UE5aNs1335962;
	Wed, 30 Sep 2026 17:34:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=dpj1xdiSYmBVD2mZo
	G/uajyoZR60+eYA8soe6s9W9ZE=; b=dX8MeEt5tFMEd/dIfspLcRxIrn+fOXy1w
	Tac3u2s3H4QeNzlw73iJBwGTCEptmaTPyipTpaeDrRV2LyQ3XVOuQVxj4XR5PzVr
	TeFjSYklX5RMVHRiMmx+poUCKAWs9W7Nr4SvPnGIdDxkLqO/9Be/X1YQX1WHyqEI
	dGmXhifcPL/l5831PtZgb3tZbVSpsSu/D5Rx1krm6/3dgYp2erOFT5BfWP2mCT+o
	xnKnyKFnuPARjVR3cnkQh3c0krBosg2b/Xu9vNM3vumXmhf9jnLpee0rmwAoTWYs
	Yv612u4unoGtoxDvh907QvoxtfPhzx2jHQ8JjweWkl3EY9fDrpXSQ==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gx5qrehbn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 30 Sep 2026 17:34:51 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 68UE35O03583597;
	Wed, 30 Sep 2026 17:34:50 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4h0g8e59rk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Sep 2026 17:34:50 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 68UHYkXH35389744
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 30 Sep 2026 17:34:46 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B223E20049;
	Wed, 30 Sep 2026 17:34:46 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 646B32004E;
	Wed, 30 Sep 2026 17:34:46 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.87.85.9])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 30 Sep 2026 17:34:46 +0000 (GMT)
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
Subject: [PATCH v9 13/24] KVM: s390: Use dedicated function for migration mode
Date: Wed, 30 Sep 2026 19:34:28 +0200
Message-ID: <20260930173441.66762-14-seiden@linux.ibm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260930173441.66762-1-seiden@linux.ibm.com>
References: <20260930173441.66762-1-seiden@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA2OCBTYWx0ZWRfX0mImgFHyodry
 IDe3DUMPYfLKyfY+VeOa//UHYXGX4r/X1dlW3/Z6upUb471cOmeiEvoCKUGl5YP9cB52hzLfm05
 6pNxiG9Fj7SZySfR1QTEovcswrH/6o4P69QZcYMGDHxIgTyN/XEhcmYu572EbKYMY+AY7VQgBxD
 Zcm0HQLpepvyCdfpKQkGKk5/iuCkoChcYuU78MNaBYjlBtB4JIeUItbKfB//R9xfaxPI6GlVC6F
 Zr1G9nnwzaBRzayPUNqTCGnAmq8j1Y49peRrpu3rHVTcm5LThC7SqOe/t2OqxMQbqDkQNzxQ1u9
 UzNcx5lpbzMbCS3Es/avpdnwEBF3BkUVUlHqpboefwf4aa+i2iyREll6bezbo69OXIEiHoVbam6
 P7r0PFOBEH/mkRPsXW9tln9yQxqS+ab1iyaYDYMn/GwLXO0fxyPFTykYcI2WiE7rimlMOWnj2SR
 1qrwg3H2MXcpJF7SiDw==
X-Authority-Analysis: v=2.4 cv=SPbXx+vH c=1 sm=1 tr=0 ts=6abd483b cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=uAbxVGIbfxUO_5tXvNgY:22 a=VnNF1IyMAAAA:8 a=BPKNEzTBeHxawKP70jYA:9
X-Proofpoint-ORIG-GUID: yop6eIuiVu9cJ0vzWuHapJqy8J5Aeqgu
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA2OCBTYWx0ZWRfX/sh2PPm24v6l
 1Wz7yjPXqifXOQJbB0HibJFDnMZm+KQUTJsM9Ozkt1Bw9fgiIdOW0vvOmwaAcYaCKIcrI+w7QZc
 B9AKOKX2oJ6TSu7CNLFba++I6jtAi/w=
X-Proofpoint-GUID: VcmRYXghQ6GAo9k1zQLMvtOBiORLwEvJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609300068
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_104011_653547_E4EBBB94 
X-CRM114-Status: GOOD (  16.03  )
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

Use kvm_s390_is_migration_mode() instead of kvm.arch->migration_mode.
The function is independent of the actual kvm_arch implementation which
is different for the second parallel KVM module..

Signed-off-by: Steffen Eiden <seiden@linux.ibm.com>
---
 arch/s390/kvm/gmap/kvm_mmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/s390/kvm/gmap/kvm_mmu.c b/arch/s390/kvm/gmap/kvm_mmu.c
index c2ffb5e59ec6..24e618f77be1 100644
--- a/arch/s390/kvm/gmap/kvm_mmu.c
+++ b/arch/s390/kvm/gmap/kvm_mmu.c
@@ -76,7 +76,7 @@ int s390_kvm_mmu_prepare_memory_region(struct kvm *kvm,
 			return -EINVAL;
 	}
 
-	if (kvm->arch.migration_mode) {
+	if (kvm_s390_is_migration_mode(kvm)) {
 		/*
 		 * Turn off migration mode when:
 		 * - userspace creates a new memslot with dirty logging off,
-- 
2.53.0


