Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AD54C44500
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 08:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zp2qWRI51xbo0sDAFBj60LHtZKOMxrKZwpCffwrL/bA=; b=QE1zRq/ROUzyZOH6G3P1lLQxjD
	RzRrvBDNMYB3DBHlb7+gcU1PUL6ba2K7/bo6E5WnrwOoqEJmLtWJ1aLpexjI/tBFYJn2t3lUDTpIe
	uOGu79ARTzyCQVtgAs2FY1LTZgPW4Hhr+7NuKCbcwG5hFHiPPVH7mbB0uml+oJ7dZ/rrSgrEhJESL
	psg8kLvjxlH5UluPs57yPqFdM0p8UR/gxZ7cOJ+6ozytmed/fmyLotWhR/EdJtsOAYmJgOk4SwNA8
	d8Gv4AHTKzpufLBR7rFAKF2me2mlGD9AX0+gvD9kFGxeSB70+1Ap3JK7A0xU9oYl25sifZYIi+gxz
	Fx4DduvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgf4e-0000000BuhG-0rL1;
	Mon, 06 Jul 2026 08:53:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgf4V-0000000BuUQ-2WHV
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 06 Jul 2026 08:52:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=zp2qWRI51xbo0sDAFBj60LHtZKOMxrKZwpCffwrL/bA=; b=XC61vy024cz5WPjKUkSoBxEb+h
	ZFuWf8DYfi73vpgba7P/BOAGsufHmH5qE2gTw+MfUMlWbk8pBNWwSfMo/T+7HeCTYxHlOyegom0sQ
	scIqKop4VTDgFMuIHrbOesyLmJuLF5ipQtKvjiuNmxWRbBE8r1gG5MCvAafpmnDKG48F8ndakpiaO
	tCoh+deMQCamFjWdoAXnda84k0UtXUQ0LNQqcI9Q7+5rca7s23EddGA8YMpJuFRCVrvQ7zslMUw04
	fQkURRuN5+NXnK3jpOYEtJIPWbIMNIZn8Rz9OF0yEo3ntUtHO7edfQOmtYncmjzCo4kqt0JpfzvTA
	uk0kx5OA==;
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wgf4R-00000006LFg-2qE0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 08:52:58 +0000
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 665MJ5IC2200370;
	Mon, 6 Jul 2026 08:52:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=zp2qWRI51xbo0sDAF
	Bj60LHtZKOMxrKZwpCffwrL/bA=; b=h+qOQbZRZ7pRyZ2RY6WQr3GG2OL+rFT1r
	GDJ4O/scpa2MF6iZlrRS5xk3QWRnt0LH1gwZefRNprxkTtxlf2uSzklhyvnQDm+U
	iEYehCstaD/02FiIZ92AvDnGak8Xm85NlDI9NKx0dIrSV7mSZWrVYD+MLSLjiKZC
	qGCYiie/9/wMckW7k8phvloyK8CbVVFn8xXrE62yTO2sbvPwt1EB3eFZc+baH/lS
	qy3mzlasumLqRbiMJfvX+WKPzPoV84GGMMdgOQ9XC5N2yyBum5XdN5xrUxqmtDom
	EjsDrvVwSMHb9Db07JwSI7xAlHCrhbmLo1pUaam4I1kUoUF95EfNg==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4f6sw4ghfb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Jul 2026 08:52:44 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 6668ndrr023223;
	Mon, 6 Jul 2026 08:52:43 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4f7cvvvyhh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Jul 2026 08:52:43 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6668qbFS58327496
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 6 Jul 2026 08:52:37 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 90F4C20043;
	Mon,  6 Jul 2026 08:52:37 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 35F3A2004D;
	Mon,  6 Jul 2026 08:52:37 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.87.85.9])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  6 Jul 2026 08:52:37 +0000 (GMT)
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
Subject: [PATCH v4 18/27] KVM: s390: Prepare kvm-s390 for a second kvm module
Date: Mon,  6 Jul 2026 10:52:18 +0200
Message-ID: <20260706085229.979525-19-seiden@linux.ibm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260706085229.979525-1-seiden@linux.ibm.com>
References: <20260706085229.979525-1-seiden@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: QMjEdZ2bbssdu6vflsDIUOqXzoyItmAt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA4OCBTYWx0ZWRfX80TN2/2lLeOT
 NTNcmvI5E5sQk46MZPXg5L4eoQwOBr+K3ydMedBj9VyS9YETHCMPzWEWE+pNbBJquusLlVBmb6W
 t8SdEx0tTA7je9kPhDQUaEh3ayjLzxyzf5ilumccODcmC/TJ5KVroJfpAcQpEFIP3YF87h/oCx8
 /hYV2+XQMuY7hwOaNdgVYHYQ39H4EC9AwYR9CNUzFIjhU3c0JLgXYfhSVXTJMm/6krDNKQ8z6z/
 RxVUAiovwHQnzvoXbUNlDM2Lo26YMkwoNLR1GHO0e1vDwvvB7hPNVmcAZtXxpwPP1xCOGFTKSkM
 Iat095K4OOb6OAA9UdTX13cKdH/jZF1N2CzELws5Ty4Dlz137TrqCv7i0OeDQ+tbgwbIxnB3bPL
 ISgZ2v55y1OpLHlUutK2SNimbQmBSZYoLiEtWXrNlLMMqUsPQNvv47pQHGeVIRrZJoQDmCC/fQS
 +HiFlKSm3PdEZfn37gA==
X-Proofpoint-ORIG-GUID: QMjEdZ2bbssdu6vflsDIUOqXzoyItmAt
X-Authority-Analysis: v=2.4 cv=FqQ1OWrq c=1 sm=1 tr=0 ts=6a4b6cdd cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=U7nrCbtTmkRpXpFmAIza:22 a=VnNF1IyMAAAA:8 a=PZUUAhoRKHYmhUnXTvEA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA4OCBTYWx0ZWRfX2ooPM4sdiPex
 aFREtHdW8iPwKK+EAbbPW4kfp/jypParoj9gWSpzuyz1gWe1qFBHuSyHIfD2VQmU+N3xd8CRVW2
 qpbnchVJcB7gBqZ1fppmK+9hhozJ4/w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_095256_308585_AB225D0C 
X-CRM114-Status: GOOD (  13.67  )
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
the native s390 KVM needs to implement functionality required by the
respective config options. Ensure that s390-KVM will still compile by
implementing a stub for kvm_arch_vcpu_run_pid_change if
CONFIG_HAVE_KVM_VCPU_RUN_PID_CHANGE is enabled.

Signed-off-by: Steffen Eiden <seiden@linux.ibm.com>
---
 arch/s390/kvm/s390/s390.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/s390/kvm/s390/s390.c b/arch/s390/kvm/s390/s390.c
index 30c273f5377e..b560c1e57926 100644
--- a/arch/s390/kvm/s390/s390.c
+++ b/arch/s390/kvm/s390/s390.c
@@ -5808,6 +5808,14 @@ bool kvm_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range)
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
2.53.0


