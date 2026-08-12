Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61253C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 18:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B9s21OZwuHn7qsHzphu5vs1xZb2IpqddTQ8MCpBT1Hc=; b=n2NOgO3QbTENrDvDo+vMgHSLP0
	V5KLicWQCZ6jXwpA+SQhAFwRBCyGtFnHOSbwvLqk5gb5MP/shyB3Pmj8ibpTtkMidGpPkM5SsE5h4
	mhnP5ff93AoIi+tjeUp3wVh88gxcBtCj3o6GGuRNghlA1cFiDBybfarzpFkUokCUdHzmBZsLBM2cq
	8pj1aAaVEGPCiiHJ0dH9OCm6W43iD3xtkRgmxGyMksES27p3IqOZO5pD3EAbDDhGehLIU5PxIN2jF
	H6Hc6DD9CQ0bFL+VbMeeXQf/WQB6Tpcy0fqk4QcPv3QLm7CRogyoAQocsTVAerlzezfrcSqOnsWqs
	lLptxunw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuDzt-0000000GpDk-2LfG;
	Wed, 12 Aug 2026 18:48:17 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuDzq-0000000GpCu-47un
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 18:48:16 +0000
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CH1dxZ4120438;
	Wed, 12 Aug 2026 18:48:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=B9s21O
	ZwuHn7qsHzphu5vs1xZb2IpqddTQ8MCpBT1Hc=; b=AF4pRSYdPC/a1Kx08GLEpP
	C4aI2faN2XSbc+3PajRhO2uK7SRqn034PSbup/3MwGA5jte3Bl1JsXS5sFnfrtSF
	L3K6z0wi2WKeP/vZ4AoD/jqdgz8uCEUrHV2H2FT3eK8ef5/SMAFr/VHKBNlNWYO0
	KOG1TnYvsfyTass33SAr0DiEiuADRy1S6+8FhrOV5pVrBxREbZ+Rgvqx/sMCsizc
	7fM4/9CxjO3j6xVSzSNM4sJCodz4EmnTC7mopQ9fThAyDOlfur0+7rvpuXlv/b9a
	2knKm7GKvLxRVne7cvJjpxUqmetX/QZNWjHm7NBHgcQXbGaDRguyPGUVsrAp9tNw
	==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4fwvnwb8fg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Aug 2026 18:48:02 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 67CIfLQn009310;
	Wed, 12 Aug 2026 18:48:01 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4fxfsjyfu2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Aug 2026 18:48:01 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 67CIlvsP42140034
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Aug 2026 18:47:57 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 441B620040;
	Wed, 12 Aug 2026 18:47:57 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 280F720049;
	Wed, 12 Aug 2026 18:47:56 +0000 (GMT)
Received: from [9.87.128.143] (unknown [9.87.128.143])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 12 Aug 2026 18:47:56 +0000 (GMT)
Message-ID: <677fe1ce-17c9-4f6b-bdc6-60c34453f8a1@linux.ibm.com>
Date: Wed, 12 Aug 2026 20:47:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 17/33] KVM: s390: Move PGM code definitions to
 asm/kvm_host.h
To: Steffen Eiden <seiden@linux.ibm.com>, kvm@vger.kernel.org,
        kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org
Cc: Alexander Gordeev <agordeev@linux.ibm.com>,
        Andreas Grapentin <gra@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        David Hildenbrand <david@kernel.org>,
        Friedrich Welter
 <fritz@linux.ibm.com>, Fuad Tabba <tabba@google.com>,
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
        Vasily Gorbik
 <gor@linux.ibm.com>, Will Deacon <will@kernel.org>,
        Zenghui Yu <yuzenghui@huawei.com>
References: <20260812153631.3376090-1-seiden@linux.ibm.com>
 <20260812153631.3376090-18-seiden@linux.ibm.com>
Content-Language: en-US
From: Christian Borntraeger <borntraeger@linux.ibm.com>
In-Reply-To: <20260812153631.3376090-18-seiden@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=RsP16imK c=1 sm=1 tr=0 ts=6a7cbfe2 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=RzCfie-kr_QcCd8fBx8p:22 a=VnNF1IyMAAAA:8
 a=RYzP9iL54Ol3iwj30fUA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 4d2N9M56DqJlK0d6xcI5aANx9aGBz6EC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDE0OSBTYWx0ZWRfX5efu8lcXn34Y
 gsPe5zUu3IUNNGPXZv75684MY0T99zWMNG+SkZeoksVYg6+SBRKpvZxPIpNUhtzU5H6rMikBm+O
 d2BMLVYiXsXjoO+/5mrZy7QGTwe3Km8PRwUpkr8mHIL5EhzJ9mOhugv8S/J8rlmUbKouqsXUXPg
 /w3Nz++aKWvx7dHBOfrtAyUUjxeYMJAwFubnhI60yl139e8/Fe2Y8ph3UnxnGrnvzM4JfULkaeM
 1Wl2zUf0fLWtHoWCe6YsuLPcQjEM9Hx2ZylXeGHTPqVcfyF/bOotVkHl2ByD2IZDVrVtAj65ril
 pHF7/YmPLptxwZwSbvfADcDwTEYNBVLK5pEmZNP2+4QbGkNoaQXeqYYLNfJzWHfrdpIze3fciil
 LE2olaivNf+gf8gWQpoT7kRSetnUl9+I34lILvCLCxzMTYuB0SBjyyvYIfkeKq5HYV8zucUP2zJ
 Iv73pwmGV0EfOW6Il4w==
X-Proofpoint-ORIG-GUID: Z3HeYohtmWMvPUTza24a0xrLm73byAaz
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDE0OSBTYWx0ZWRfX0eQAW9TgmzbI
 F084dpi9dbcKnMuKNNeYiY3glclXQSgxA6T2BhZLFvuPgLWPknJS/bYOjSS0y9yGBJbTGyj6QnC
 z+UUGhNHqZvm6QmUIJ0T7mJEGk7wLIM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120149
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_114815_147527_088B90BB 
X-CRM114-Status: GOOD (  13.56  )
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

Am 12.08.26 um 17:36 schrieb Steffen Eiden:
> Move PGM code definitions from kvm_host_s390.h (back) to the generic
> kvm_host.h. These definitions are needed by multiple KVM implementations
> and should be in a shared location.
> 
> No functional change.
> 
> Signed-off-by: Steffen Eiden <seiden@linux.ibm.com>
> ---
>   arch/s390/include/asm/kvm_host.h      | 57 +++++++++++++++++++++++++++
>   arch/s390/include/asm/kvm_host_s390.h | 57 ---------------------------
>   2 files changed, 57 insertions(+), 57 deletions(-)

Can look weird from a first glance, but this helped to reduce the overall
patch size and for rename detection and easier review.

Reviewed-by: Christian Borntraeger <borntraeger@linux.ibm.com>

