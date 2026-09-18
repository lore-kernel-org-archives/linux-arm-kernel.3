Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C69AC982DA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 13:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zg61270tTkGqKKJ4JDj4mB3Ld40GCP4fvHt1fZMrxp0=; b=3GLz/7jdGTINWIbCLqZnnSt/Cw
	2bfrwaRTCfNoDv9hJXrTE1TIhDjy1bN2psu7GzUO1mB472ZQLCX4cb/uyDC9wl+Tb+gBhAwpSFBUW
	XNN+KAMhZGEd8988X4mReZ0K4UcD1455N4kf4CSN00dPEs6wkCuxrTsnRR8GXy47Myof3geEy/exr
	Czw8v0Jn7iHGTvtQnlDgyL3P0IWG46IVag1p1UTpSi5s7WUyxsLLY1Bj7C8qxk1W4BH/9Y3IWgJUV
	r8Epw96VaTfHb6DeWbzVWX1xygFvklVRc/RwPR6oLVQn8gV6gRkcvY7qPEwXj2nNbw4DrrUG++c2A
	mjh0MxJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Yo4-0000000EaBi-3Gom;
	Fri, 18 Sep 2026 13:39:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Yo3-0000000EaB5-1nF8
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 18 Sep 2026 13:39:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Zg61270tTkGqKKJ4JDj4mB3Ld40GCP4fvHt1fZMrxp0=; b=leBuQpdNI8+EDfyKXoY0f7s59Q
	56dHN19jhHOnKaGjvyS+uPhy7MieWMseN5W4wZw5B2eQQS1MrnwlsAcgxd+xplVYv8SbaGZHIQZCY
	iacBBzyO5fbw+4of2yiaA+YQ6FS9zr+pkBlhJimopQi0aveXLalhhUyIxKXAI+VwsqK/rPW/QFen4
	D+e+IX0IKbCK+5lh4TQx4VCNo2J5dIdLaUCP6ZovL4g0ewLb9B8axsFPOtwak2m2btO52ehgOz5zJ
	hs9oaEhLfxbDj2Vhm+mUVomdc+mDsmECIXEvXZHnfLSIiTJAe6U+aDnNiLhzV4cngVB1gQQBd2x9n
	8C7TkQtw==;
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x7Yo0-0000000A9J1-24qB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 13:39:10 +0000
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68IDVW4o217069;
	Fri, 18 Sep 2026 13:38:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=Zg61270tTkGqKKJ4JDj4mB3Ld40GCP
	4fvHt1fZMrxp0=; b=hjI6uadR0ijaodzmA4kzryzl8Z/+0tu3OY00hFk769Wpmi
	Wk0GZqDwusrlINtZHrta3dP5bJr69KxBASMz5bUDBsj2bVhJjb5aH8iEAjQcVqFI
	QVfFLsyifgEPvlGdN/JGZfs49zteZJZxCNeIcHQviEQr19eFTxjVkX8PjzZzuWZQ
	YaaMsGudMwVJp6oYdu97NcGOuM+aX2PXpTcdpVtyBrNrIvWsSj2iHlpIv0Hz1xcY
	5diEI6tnHu2MfETckfAY+8HzYyXjMMt9cMaPi+PV1xo6hgl8dIisBVBOPXKFIGG/
	0Mc7bIoB2KrKrYGt+YbsCVLXinqEjb8ToZNQ0dtw==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gmw5efv2g-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 18 Sep 2026 13:38:52 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 68IDNtqJ695598;
	Fri, 18 Sep 2026 13:38:51 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4gra3fem78-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Sep 2026 13:38:51 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 68IDceSe27722194
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 18 Sep 2026 13:38:40 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1EFCC2004E;
	Fri, 18 Sep 2026 13:38:40 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2E9C320043;
	Fri, 18 Sep 2026 13:38:39 +0000 (GMT)
Received: from osiris (unknown [9.111.4.88])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Fri, 18 Sep 2026 13:38:39 +0000 (GMT)
Date: Fri, 18 Sep 2026 15:38:37 +0200
From: Steffen Eiden <seiden@linux.ibm.com>
To: Steffen Eiden <seiden@linux.ibm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-s390@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
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
Subject: Re: [PATCH v8 00/29] KVM: s390: Introduce arm64 KVM
Message-ID: <20260918133837.84754-A-seiden@linux.ibm.com>
References: <20260918133107.1042730-1-seiden@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918133107.1042730-1-seiden@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE5MiBTYWx0ZWRfX8NOiLounXJV3
 p4ksMi+kacIKw6TqakTSOWUZIjsH2DBZucRYVsqR+C0f+TOO43S45ZXwBcY6K1/Qd2q8DKEW1eu
 QrBPzt74AVs+tqgzffd90bN/heuvGcsUXjF/l8Zmvbxe1kfWh+moMOGAAPs4eCK9pbGpfvJXzd+
 RhQIfW3O3xyFLIXqVbX7EQJ5jCdA3OEiBr3+kfwzLXbxwgWzJKhX1qu2MH4j7+yeebTBnVl5oUX
 ScjFiIWRQmltqq31pShmheu+2L17BGoyROyfMzLAYryD9/LigRfFa0xe0n4EGT9RUYDOokB+kvr
 QX5xm34Nys6Ulv1noKx+U2zTJBFGfzZ1EiQq70azxz7PV22vupBQ1BZ9F5EhEPLM4+R7sDejhLq
 1Fd0lXRTi3dOV5+Lz/pYUS7i9pzuP7GfzqGar3+5nNWKo86sJ9mSnUDuPBUDtXyAeiHT4PTGRcX
 2sQPP30nzlUmVZHDRwQ==
X-Authority-Analysis: v=2.4 cv=E/NYNqdl c=1 sm=1 tr=0 ts=6aad3eec cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=V8glGbnc2Ofi9Qvn3v5h:22 a=HQ_ZLx768mUr4WH56XwA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: yj9WjxwmCZmDszY55CZnhGcPKW1x8ZIB
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE5MiBTYWx0ZWRfXwBa5tmX9Zui/
 5FEAMNIa/C7zCAuqUZ505lFt9Er8ruJIiz5lWDQq4U1WX8LIo3/FCvOn/E5QvQ2XhI5wD1EOoYN
 wx38zl2LIwJnoR4aMry/I7e4pu8gzuk=
X-Proofpoint-GUID: 0oxN8qpLp3I7KaiEFna4SOFT743i7NUu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609180192
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_143908_832471_D46A3851 
X-CRM114-Status: GOOD (  14.40  )
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

On Fri, Sep 18, 2026 at 03:30:37PM +0200, Steffen Eiden wrote:
> Introduce arm-on-s390. Enable KVM-accelerated ARM CPU virtualisation on s390.
> 

...

> 
> Hendrik Brueckner (1):
>   s390/hwcaps: Report SAE support as hwcap
> 
> Steffen Eiden (28):
>   KVM: Introduce file_to_kvm_<arch>() infrastructure
>   KVM: Add file back-pointer to struct kvm
>   KVM: x86: Use file_to_kvm_x86() in SEV
>   KVM/vfio: Use file-based reference counting for KVM
>   KVM: Restrict kvm_get_kvm/kvm_put_kvm export to internal KVM modules

@Sean: I think yo udeserve Co-authorshiop for those 4
(if not already there)

If you think the same please give me your signoff

	Steffen

>   KVM: Move export symbol check macros to Makefile.kvm
>   KVM: Make device name configurable
>   KVM: Move architecture capability Kconfigs to header defines
>   KVM: Replace CONFIG_KVM_MMIO with KVM_NO_MMIO
>   arm64: Use proper include variant
>   arm64: ptrace: Use constants for compat register numbers
>   arm64: sysreg: Convert SPSR_ELx to automatic register generation
>   KVM: arm64: Access elements of vcpu_gp_regs individually
>   KVM: arm64: Use accessor functions for core regs
>   arm64: Prepare sharing arm64 headers with s390
>   arm64: Share arm64 headers with s390
>   KVM: arm64: Share arm64 code with s390
>   s390/tools: Use arm64 headers
>   KVM: s390: Use arm64 code
>   s390: Introduce Start Arm Execution instruction
>   KVM: s390: arm64: Introduce host definitions
>   KVM: s390: Add basic arm64 kvm module
>   KVM: s390: arm64: Implement required functions
>   KVM: s390: arm64: Implement vm/vcpu create destroy.
>   KVM: s390: arm64: Implement vCPU IOCTLs
>   KVM: s390: arm64: Implement basic page fault handler
>   KVM: s390: arm64: Integrate arm on s390
>   KVM: s390: Enforce no unexpected external symbol exports in s390 KVM

...

