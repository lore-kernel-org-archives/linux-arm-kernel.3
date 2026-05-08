Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D86ACD3436
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 07:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HRT2n3cz0qKvrVWVKQJHUhkbp6wv3wSFOGnbkHHYBUY=; b=ELV9Jc/yi5SHFNHwagaSmDLtBG
	9OT7GvcUqbNx8JB7Y+k4KgluByDeQNaLKSfW9SpmiPuNKsERHrYrmHWZhJgEXHDKc0FLPFA5IacIr
	nWaMHRip0DH06HYOwK+etHeShzUqm50Z2MxfgXholVqb4FDSrU5mBd36MAwLmCXKJNMUS8exA5N9l
	1LUVHk8khFr+nEG7KRsqrYsCgcTHvEWwcyrjdB0MXTPhnZOQUAU0fUtDMHuASaUHKzUjkUOmcFe79
	x3T5X2RNLGuXrd9f5uZwqkaMBdiH1TUf1s9loHVkiZVLsv78xTUzNsNI+yHzmRqqSTK+rBuFmfn3N
	AVqS/caQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLFZf-00000005pTy-0XFl;
	Fri, 08 May 2026 07:24:39 +0000
Received: from mail.loongson.cn ([114.242.206.163])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLFZY-00000005pSj-2fMX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 07:24:37 +0000
Received: from loongson.cn (unknown [10.20.42.62])
	by gateway (Coremail) with SMTP id _____8CxRXipj_1ph84HAA--.393S3;
	Fri, 08 May 2026 15:24:25 +0800 (CST)
Received: from [10.20.42.62] (unknown [10.20.42.62])
	by front1 (Coremail) with SMTP id qMiowJDxTMKoj_1pUcZ8AA--.38271S3;
	Fri, 08 May 2026 15:24:24 +0800 (CST)
Subject: Re: [PATCH 2/5] KVM: loongarch: Grab MMU lock in
 kvm_arch_flush_shadow_all()
To: James Houghton <jthoughton@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Zenghui Yu <yuzenghui@huawei.com>, Sean Christopherson <seanjc@google.com>,
 Gavin Shan <gshan@redhat.com>, Shaoqin Huang <shahuang@redhat.com>,
 Ricardo Koller <ricarkol@google.com>, Tianrui Zhao
 <zhaotianrui@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>,
 James Hogan <jhogan@kernel.org>, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260504224213.1049426-1-jthoughton@google.com>
 <20260504224213.1049426-3-jthoughton@google.com>
From: Bibo Mao <maobibo@loongson.cn>
Message-ID: <f47ec704-813e-e6a2-687b-7076be465a1b@loongson.cn>
Date: Fri, 8 May 2026 15:21:28 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20260504224213.1049426-3-jthoughton@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qMiowJDxTMKoj_1pUcZ8AA--.38271S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj9xXoW7XFWrCw1UZrW7Kw4rAr13Awc_yoWkCrc_AF
	12yw10grWxJa93X3Wkt3W3tF9Iyw1rCFsavrn7Xr97J3s8t3sakr4jgan3Cr90grWxWFW3
	ArWDZrZ5Zr4avosvyTuYvTs0mTUanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbqkYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
	xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y
	6r17McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr4
	1lc7I2V7IY0VAS07AlzVAYIcxG8wCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0EwIxG
	rwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUXVWUAwC20s026c02F40E14
	v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkG
	c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4U
	MIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07j7189UUU
	UU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_002433_026966_03445BBB 
X-CRM114-Status: GOOD (  14.11  )
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



On 2026/5/5 上午6:42, James Houghton wrote:
> kvm_arch_flush_shadow_all() may be called concurrently on the same
> `kvm`. This could at least result in accounting mistakes (e.g.
> underflows on `kvm->stat.*pages`).
> 
> Cc: stable@vger.kernel.org
> Fixes: 752e2cd7b4fb ("LoongArch: KVM: Implement kvm mmu operations")
> Signed-off-by: James Houghton <jthoughton@google.com>
> ---
> Note: This is compile-tested only!
> 
>   arch/loongarch/kvm/mmu.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/loongarch/kvm/mmu.c b/arch/loongarch/kvm/mmu.c
> index a7fa458e3360..5dbce9b18e1c 100644
> --- a/arch/loongarch/kvm/mmu.c
> +++ b/arch/loongarch/kvm/mmu.c
> @@ -486,7 +486,7 @@ void kvm_arch_commit_memory_region(struct kvm *kvm,
>   
>   void kvm_arch_flush_shadow_all(struct kvm *kvm)
>   {
> -	kvm_flush_range(kvm, 0, kvm->arch.gpa_size >> PAGE_SHIFT, 0);
> +	kvm_flush_range(kvm, 0, kvm->arch.gpa_size >> PAGE_SHIFT, 1);
>   }
>   
>   void kvm_arch_flush_shadow_memslot(struct kvm *kvm, struct kvm_memory_slot *slot)
> 
Reviewed-by: Bibo Mao <maobibo@loongson.cn>


