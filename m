Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9C57C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 22:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3J+Y3qFDHro/ofj9RaFrKGahhFH3oBBHZcDF842RuqY=; b=d4iqqpVKo2aiLg/wdx/5ou+69f
	48GAsXm2PZZCgaau+cHMSVPaTD7muWetI/E+mIssimxDft8Gfz0vka6fN7erhRkrI4c6eqKXaYf7A
	baXg3HE/7oSnvcsxvW2OIewUiOlLfslmasjSlCuH61oWp3OhO6dj3BrJ7reRtLemr5YZfwrSZI8tq
	w7iKF7TN6fAUXH7JzubSK52/S/WdBHzb0JDJSpbPBZXwGStx53pI2Ktp7IHVpvcXhBN/HoAcyVnw+
	Lfql2assQ7OkzTV2j8ztyYCxctgOE/at6+OoYlpQpMBewe9XCI8h71AuewSz9Pk/04aHBDzKkU0dE
	ACXUGFdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x98ll-00000006fSq-3Rp7;
	Tue, 22 Sep 2026 22:15:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x98li-00000006fSV-3CTW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 22:15:20 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI71bd1153620
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 22:15:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3J+Y3qFDHro/ofj9RaFrKGahhFH3oBBHZcDF842RuqY=; b=LUIg3yqi9TH9y9gg
	F/mIr66JscemBMTu6ta06KCd3tUQmpN94F8XDNu2Egp5ULhY9mPCicRZtFxQgTPd
	HGWoa3EhlM3QVW+9XNz2U1tdp77dEZ64XmmdcwCnIPWNS8kMKkGmaS/Skqccsero
	ZInCQfVzqdZdF6ngjyH+Lsf4v/G0j7PHPaIMQIDuXKK+RYV3dTQ+QE3CsiYEa3b0
	BocityRN+JBLonLjGZKk7WPacf64e9IPfnE9NpzTgFwsb8D0R87Ii7AqmXA78xqy
	6qwoFni+9GOvuAsazk/Dr435tBhsXyyNAEHOW9B54SD34831GriuIr8E0HdmbVGo
	2zdD0w==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guvw7hvd5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 22:15:17 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3282d5302ffso282642eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 15:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790115316; x=1790720116; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=3J+Y3qFDHro/ofj9RaFrKGahhFH3oBBHZcDF842RuqY=;
        b=aO5dgspHEcVAsr4Whtoe5mThoz9AXe5sEtRYqPqWhAbJsbSggY1TPEr0eE4TM4u7IN
         b+y27QSeQZhbp7523nbDGH48Yhjn1M7O/N3JxvG8n2CspD630Tzc1DT5z8fpjFWJWXsD
         jezJJnKYqBAZLOkDXU7ajD/DOTQD1O7/ENEmJEUO6sDIhTlFxwIBnO5OdJ7QJM86GZcd
         U86N26sIss9/VzUfrvG+lecCLhH1Qw2fmQP288gveboAQC8WbB+2SGN/FiD+1w8G5iv7
         umoKv0sTw/6cjd0exDQkXkHbT9xlV2e5EgUodOxuqHo6/cpueZtlOPRdRHhjT16udVz0
         pJ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790115316; x=1790720116;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3J+Y3qFDHro/ofj9RaFrKGahhFH3oBBHZcDF842RuqY=;
        b=bq9im/zBUrgcy4CzR/GKByh/cvXZBigHofck3izioPr4Gk8FQ4r7tqzD7bjKnadVJ8
         YR6ZCtLbUxXMh1K0XB+6lEMjKrW19Y8wZ5C+4SRz4hiltv315KTnVCbWsgY/bqWVbT9B
         kWy9bh/np3+yNm4urkNo7U6R4YNhNpjHQc6vh5kTeU+Vyb3EMiap2ucCu4Q2FxUjHrHy
         bYeVAY3Ek3ZVpYBfOuCC1cv6AEXCLRkv4jndmLbgFN0d5uNLueYMhxYZNNQVuijkAwlW
         trMyXSLdxjsm1yzdetCmDkQQN1L1t9FYfccb46NFpiJqdW1tuY8n759CnG7RICKGXY5N
         4yug==
X-Forwarded-Encrypted: i=1; AKwUvBxHvO4Wn4EPJf3T9Lhk2u89Cj3epQikGQsZ4+O5TC3StQzYBOikh4xyZC6Y8sM11uGE473Zurk03RjGa6xEZ1gk@lists.infradead.org
X-Gm-Message-State: AFuF++kS66UQdstrWWjJc3zckzz3iSv64G4X+5lKZIVRTK+vtNPGVw1K
	7hMvfpWqIvEquFW4HMHvDRXp814Yzp388HRNwCwkH044OW80dLmOsD4LGliySJL+6DeL6sLEOGx
	f8Rl01860byFWVevssVcdRVqV55Lj1kB5WoMLhNlWvUlErYmZ6asSUHELVIOZ0/jL0I/QbfLslB
	QKeA==
X-Gm-Gg: AYBFou2InWxih3ZCmBxWA5PcZu1APkIeA666SgxxvMl/dvsWSouhoIzjQypM6Ajx3Uu
	eLNJNHhJ9PaxVLSxKeSkW2KFTh5WcsDm5LpRCcYrymjZ5LULvm6G8PX+2t4T7IT0fVCh09JxTHh
	/TovBtyZEGWdARbhf8Ir5pg3ErZeV+FM1Oqck54WvtNIUIpmyYmzHVqxLRu9UnjwSKvEknA2Aul
	/U/hCYJpCBe3gL8nY19SSRyNjRSJn/qD/2fzagUxt9M68HSXNsaUJeQlhQjnMsof2+cOgo20wK7
	C9Ex6PloeXstIoSfz8F1IiHTe8JJCCHGmGVGzm4YEHq/s2W0BeZClRCvcBkCI0rSoLNBpAlJJkQ
	NJLdEmxoOoKQPkhg3EbNS/8nn5Btl6m8lQrXmEzzUtlFno+7hMr8eag==
X-Received: by 2002:a05:7300:e9ce:10b0:33e:6c5a:37c3 with SMTP id 5a478bee46e88-33e6c5a3aeamr850803eec.1.1790115315794;
        Tue, 22 Sep 2026 15:15:15 -0700 (PDT)
X-Received: by 2002:a05:7300:e9ce:10b0:33e:6c5a:37c3 with SMTP id 5a478bee46e88-33e6c5a3aeamr850779eec.1.1790115315280;
        Tue, 22 Sep 2026 15:15:15 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e9625825asm1072047eec.13.2026.09.22.15.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 15:15:14 -0700 (PDT)
Date: Tue, 22 Sep 2026 15:15:10 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org,
        will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
        aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
        joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
        linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
        sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
        WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
        Fuad
 Tabba <fuad.tabba@linux.dev>
Subject: Re: [PATCH v19 08/20] KVM: arm64: Reuse kvm_stage2_unmap_range in
 kvm_unmap_gfn_range
Message-ID: <20260922151510.00003c76@oss.qualcomm.com>
In-Reply-To: <20260920212845.707-9-suzuki.poulose@arm.com>
References: <20260920212845.707-1-suzuki.poulose@arm.com>
	<20260920212845.707-9-suzuki.poulose@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDMwMSBTYWx0ZWRfX4wXD5/z5v/fd
 FOJPdp1xPzVHb1BbPyvjj0sZJgwbLl0yVrpXl1ZSF5K/4zwFsIrXVvK3RQ1l8lfo/lX3ktRKQWk
 9gSWGj3Zb9fwAy09oALZeZxsjR2U8tw=
X-Authority-Analysis: v=2.4 cv=ZYqIpcVA c=1 sm=1 tr=0 ts=6ab2fdf5 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=kMqVnm4xDtAkP_aMvZEA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: vx6njlUBy3Aqk-JtJyicLB5rYKj3LKRO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDMwMSBTYWx0ZWRfX8S26QHuiSvUi
 Pns8kHJZVpWPQbBkoQdkG12Xht1u6uEHyJ0ZDeo8o6g42+l40fnkHSdwfHtgmXPYgqZejAJAnOx
 jSNuFeo3wrzhmj4R88AlXKQvMnP5/O8jvfpBRZ5+hb435AkUf6YnkyEr6IaSEtVZPhkU59NnryA
 AwirEZMaa1yFSXCB3KlCfUwxoJBT8duS6EzQl1fb1T3dmxp7l3PBhlZX37+72aQoOGq2b4kfDQQ
 yCsJhxjiJkMt0XUNslOJqCZ0zYZgKmK7WyjNqM16YwmzXwxF2ne2/t2QwMWmrF9fUH0i4QoCrKE
 LITt5mDxBCkjHUSUXVXz4sYIl3X9Lq6kdu7rWsMPGzPhFjswsCdX1DDPNSssls5ar2a6GPZsWZR
 er7dwTK025UiLRWY0i/w2T6IqWk77RRNyMFs4gMdBESd+11hh74VY42Q7UAgCPWYG0tVmjIP/G3
 mTt0RyvtFHREEP3zWoA==
X-Proofpoint-GUID: vx6njlUBy3Aqk-JtJyicLB5rYKj3LKRO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220301
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_151518_948453_53825C37 
X-CRM114-Status: GOOD (  19.46  )
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

On Sun, 20 Sep 2026 22:28:33 +0100
Suzuki K Poulose <suzuki.poulose@arm.com> wrote:

> In preparation for adding VM specific backends for stage2 operation,
> switch to kvm_stage2_unmap_range() instead of __unmap_stage2_range()
> from the kvm_unmap_gfn_range(). Drop the bail out check for protected
> VMs and defer that to the one in kvm_stage2_unmap_range(). Later we
> would replace the logic in kvm_stage2_unmap_range() with VM specific
> backends.
> 
> No functional changes intended.
> 
> Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>

Trivial thing inline. Otherwise this is fine.

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

> ---
>  arch/arm64/kvm/mmu.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 0f4e8b71fa85d..03f2017a7404a 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -2436,12 +2436,12 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
>  
>  bool kvm_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range)
>  {
> -	if (!kvm->arch.mmu.pgt || kvm_vm_is_protected(kvm))
> +	if (!kvm->arch.mmu.pgt)
>  		return false;
>  
> -	__unmap_stage2_range(&kvm->arch.mmu, range->start << PAGE_SHIFT,
> -			     (range->end - range->start) << PAGE_SHIFT,
> -			     range->may_block);
> +	kvm_stage2_unmap_range(&kvm->arch.mmu, range->start << PAGE_SHIFT,
> +				(range->end - range->start) << PAGE_SHIFT,

Looks like indent is 1 too many space.

> +				range->may_block);
>  
>  	kvm_nested_s2_unmap(kvm, range->may_block);
>  	return false;


