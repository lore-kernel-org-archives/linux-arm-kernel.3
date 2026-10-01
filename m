Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D26DCA5FCB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 13:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qye0fZ9/oXrjtWkqgYLZM/u0xYJmnA34DM3msArRE3s=; b=CAUHrSUc9IgSJAuqdcVPJujx3p
	fFHk03iIkynqNOExiKDz+OPcrvX6efI8EuPSnh/2fv4CYkJuwGiIuBXd+ImMSbgFSvLy3Hf3pR+CE
	kVbawuYu1wmVxZs+fUJTVPm1xgsggoaF5IKG5D4Q8tON2Maz5rHKbTw77A0xdjTUhOq7hhsNLFKrt
	RNcdtPFYMp2iPk5rW0/v3PN8YFy3puiGxfTzDhZ9dlIcmScEkXGSapDJZNZMJvMYQYySz/1F90ZSH
	FREFb4dQ/692RngFp+OHKlF4ZnEklOSO4I+Towi6IWiYnODM5WmxHJ0M8xNOmtI+5jlg4cZ1D9PpW
	wQTZZk6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCGu6-00000009FF2-0BRH;
	Thu, 01 Oct 2026 13:32:54 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCGu0-00000009FDk-2xkf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 13:32:53 +0000
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69175asG4040804;
	Thu, 1 Oct 2026 13:27:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=qye0fZ9/oXrjtWkqgYLZM/u0xYJmnA
	34DM3msArRE3s=; b=Qh6DSSugZ8937s0F4FO4cYmzBdv8A7v7oMZFAmyilRcmj4
	n2c2bJNDSRVbpj8bk3TrIiDB0R/X4fpxt3rKh5/tFB+2P7KBKpjdxzxxb+o20VWF
	V/KDiSD4XgwJAK+Ct+PKSMbuuJ9nTTqh5xHLUr0S4jib5bZ88k2aW2Y8AFQ4cosV
	Ufv8rseFQcqZ2UEjbpyeBp8FK58ibbrl4d/8aTF1oYwRVQu9HwuG95/kdomde8G7
	xveBM8yxDg1fC/wypQP0/gyc+mRt4jsa+dEk8cvzBqYjPBtXSwxmsKgK3Zx1uHuK
	lvjCVvCyjlM3c1aM1Ogwh5Kls8oLBJUCEoph7cRg==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gx4fej9vr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 01 Oct 2026 13:27:22 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 691BIDLQ3460482;
	Thu, 1 Oct 2026 13:27:21 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4h0q4pfk0s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Oct 2026 13:27:21 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 691DRHHH52101448
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 1 Oct 2026 13:27:17 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 08A7020043;
	Thu,  1 Oct 2026 13:27:17 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A157820040;
	Thu,  1 Oct 2026 13:27:16 +0000 (GMT)
Received: from osiris (unknown [9.224.76.185])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu,  1 Oct 2026 13:27:16 +0000 (GMT)
Date: Thu, 1 Oct 2026 15:27:15 +0200
From: Steffen Eiden <seiden@linux.ibm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-s390@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
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
        Nico Boehr <nrb@linux.ibm.com>,
        Nina Schoetterl-Glausch <oss@nina.schoetterlglausch.eu>,
        Oliver Upton <oupton@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
        Sean Christopherson <seanjc@google.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Ulrich Weigand <Ulrich.Weigand@de.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>, Will Deacon <will@kernel.org>,
        Zenghui Yu <yuzenghui@huawei.com>, Fuad Tabba <fuad.tabba@linux.dev>
Subject: Re: (subset) [PATCH v9 00/24] KVM: s390: Introduce arm64 KVM
Message-ID: <20261001132715.108643-A-seiden@linux.ibm.com>
References: <20260930173441.66762-1-seiden@linux.ibm.com>
 <179085262878.3865846.5787241839391727949.b4-ty@b4>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179085262878.3865846.5787241839391727949.b4-ty@b4>
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=FYWiV5+6 c=1 sm=1 tr=0 ts=6abe5fbb cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=V8glGbnc2Ofi9Qvn3v5h:22 a=vgvFcsfBxiakeqZJiIEA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA1MiBTYWx0ZWRfX/4jmrRgPtRMf
 rUzDnVualLMwsejQVgBTRsTRb9jwbAoV2YAHBpO7GBSBTZdKjAnKQjzZvxNHjn/GP6O8GD3B3A7
 y2h2mWQ4EXx6Jlq/zLZ+bg9VLFsLPWw=
X-Proofpoint-ORIG-GUID: na2JBkj_-7NtHfoAaz6enZDk4asqF0MV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA1MiBTYWx0ZWRfX+tQUPvPqFkLs
 AxPLpp+vTlGclCT/RN4DDb8/lz7uNMT2UPOYwwJQU9X/m7JlK5jKO8hB+rs21rSYFLgyB3AVsJZ
 4UfjV+vEgcON9tpHXrYPnRg6zaL5qs6j88vZQKa4p4s5S57d0W0Jlgn5ehwLDT3j1pKh+QEGtlJ
 ksYCVkfgBw7fh92yOC9y/JYyTCMEd13vg8LFI4YgiGTTjIzOmEbDOvNWGp21GJIyZMNJxlsFPLg
 Lx8yGVqIk3L2BLGqdR5ixDWODH/NL2/1pHbeYQe8AtWAsW3tk7Vhic2AvYfB5soOxIQaY09AyfX
 TC4Ah8Eow0EFuhSduaeHVNpYmaalCa8E1Re5TtWadxZzYCCu2N47yeQnkchEXMSEmZ4vdDA9A7q
 H9e73FVMBgod0OFoM+lpQuZCD6sypPiZqGGJDSNTdzGNTz9YZpQ44aeqCVKeuNF6PbjQl0QGJdm
 x4Z8VoPgvcwKwunpmRA==
X-Proofpoint-GUID: qdanDbQvzywyI7kpvTWk9E-Rn77KAJsN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610010052
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_063248_875139_4887222C 
X-CRM114-Status: GOOD (  19.96  )
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

On Thu, Oct 01, 2026 at 12:04:51PM +0100, Marc Zyngier wrote:
> On Wed, 30 Sep 2026 19:34:15 +0200, Steffen Eiden wrote:
> > Introduce arm-on-s390. Enable KVM-accelerated ARM CPU virtualisation on s390.
> > 
> > The new KVM functionally depends on KVM/vfio: Use file-based reference
> > counting for KVM [5] The series itself should apply w/o those.
> > 
> > For the original, now partially outdated, cover letter, have a look at versions
> > one to three [1].
> > 
> > [...]
> 
> Applied to next, thanks!
> 
> [05/24] arm64: ptrace: Use constants for compat register numbers
>         commit: 295d3df9b1e425099a4eb37954a02c4a08fdb496
> [06/24] arm64: sysreg: Convert SPSR_ELx to automatic register generation
>         commit: d3d78520068779779e1ed7aa0dd8a3ce63e1ca43
> [07/24] KVM: arm64: Access elements of vcpu_gp_regs individually
>         commit: 29d92585ab987bb80b1e78d811aaea2a8db86e62
> [08/24] KVM: arm64: Use accessor functions for core regs
>         commit: 89ed62818f10e38e64fea46d43ee6455a1beb647
> [09/24] arm64: Prepare sharing arm64 headers with s390
>         commit: df6a70516adec8b7f5fa49e1755d8ee33d980d9c
> [10/24] arm64: Share arm64 headers with s390
>         commit: c7e18ba462536e870b0ff4deca581babcac9135b
> [11/24] KVM: arm64: Share arm64 code with s390
>         commit: dcb776bfcccc9662001a75b99dbfbef55f46eb31
> 
> Note that there were a few conflicts. Please check that I resolved
> them correctly.


After rebasing on those the arm-on-s390 part does not build anymore :( 

We are missing the definition of
static __always_inline bool esr_abt_is_s1ptw(unsigned long esr)


quick fix: 

on top of [10/24]  arm64: Share arm64 headers with s390

diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
index bf35cbe8ddcb..0708f792c631 100644
--- a/arch/arm64/include/asm/kvm_emulate.h
+++ b/arch/arm64/include/asm/kvm_emulate.h
@@ -367,10 +367,13 @@ static __always_inline u64 kvm_vcpu_get_esr(const struct kvm_vcpu *vcpu)
        return vcpu->arch.fault.esr_el2;
 }

+#if ARM64_S390_COMMON == 1
 static __always_inline bool esr_abt_is_s1ptw(unsigned long esr)
 {
        return esr & ESR_ELx_S1PTW;
 }
+
+#endif /* ARM64_S390_COMMON == 1 */

 static __always_inline bool esr_abt_is_exec_fault(unsigned long esr)
 {



A cleaner solution it to move this defenition just below  
void kvm_vcpu_wfi(struct kvm_vcpu *vcpu) in 
[09/24] arm64: Prepare sharing arm64 headers with s390
and expand the shared region in the following patch.

I can send the two fixup patches as a reply here for this tomorrow or later today if you want. 


	Steffen

