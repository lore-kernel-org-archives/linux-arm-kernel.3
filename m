Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A63ACA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 03:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cmIEoaAK9H0I/DObf/8+7Lpe62dBXA5oIjHsrjeoKTg=; b=O5iLoeadxP8bkFOKHB53S9yHdp
	5pCHtCZV5GPLpLMTf7AZKNUk/IfG1qvVK6xwdBqiGihp37McbXjclw3u4Z7Vbdb0mlTuX7M4pB/kO
	ZsgKbGO0aB0GWBdc4HYim8FrfYQyRo7k7HJUjhpfsYbP/HybfNeHnRpC9V1OrTijzLlarJ6yWW40r
	IRI2uZL8RjPV2cH9y+SL6UPeUCMmlJauzmdYrFEERg7ORN+5b/Qk5nqmo23cMTE20aOgxANHnzhOV
	7rtBeGKhmbMQ8xzCRfT6c2Il5Gu9UV+2LGD5zwvXbVUfXmV892PIm51QB3/Kjrt2ZKXS1lUEzKMiX
	Bsu9MenQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDvg5-0000000HYNy-0YRv;
	Tue, 06 Oct 2026 03:17:17 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDvg2-0000000HYNb-1ZiA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 03:17:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791256633;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cmIEoaAK9H0I/DObf/8+7Lpe62dBXA5oIjHsrjeoKTg=;
	b=HJjFDxOYAHbGSiQ5uU7F47zUC0sQXxauedRTys0TZ9du4G5aBDQtBZpbyc+kc7u//1kCdp
	XPnWStHwNySdXIfEuedeD0sgL4tiAFZoeYSX8X5Q1h79JkEzaaWEo/8x6bxHjQ+jRctARZ
	dt9AksVqbUGEPlG/UJcxf+ixEG3I8Nk=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-532-FNDPPcv_Mmu3ldxF8FuLRQ-1; Mon, 05 Oct 2026 23:17:11 -0400
X-MC-Unique: FNDPPcv_Mmu3ldxF8FuLRQ-1
X-Mimecast-MFC-AGG-ID: FNDPPcv_Mmu3ldxF8FuLRQ_1791256630
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3a470ead068so2156442a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 20:17:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791256630; x=1791861430;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cmIEoaAK9H0I/DObf/8+7Lpe62dBXA5oIjHsrjeoKTg=;
        b=2y01DIdTxwAsM5NXXClbZBniry6QyBbIAlV3hzAHzcNwk1uJi4c3EGcFQu4GrJg7EJ
         kBjtPSMB/VeLYCGT+vftBbblJ5xn69vFiaaWHu6MYMvImg+KDzbqLFwSEF95UPX329th
         xP+78YMVIiU6+hUUWnSXKLJr7phPCjq4tX8D50uKq9OG/zxeZqlwGaKxtDhY0P3DUi34
         bXS5VrOmrMFOIQn4mWPZCH1RUIoCB5BUWhfbIn+FJfxkkK8cA99Cpz3LU5tL3TSjqsi9
         ZQwCMQXtVm5TD3pP/ANnH2RzqCf0+jZqkTN86KUL+LoC4rZCECIOQkNbFQA1G832dAda
         EmEg==
X-Forwarded-Encrypted: i=1; AKwUvByfQStoJvYVfUG09hXGB+bT/HulsbW8A47LAOdM0i9HGT5KXhsOwU8fmUhQveXCla8MARtQeZHqiV/snLAvN8Uo@lists.infradead.org
X-Gm-Message-State: AFuF++mvt49Ayf/FOUTzgKhMaxINp3ssZffo73qdHqK0qcd05u9Rsn1I
	t/g36GQyHYTAGxj6wzm1+No4cWaIVWJHt5vGFCTqReKSa6ZcAJowDA7Jd4wiTmEmHSI9R2t++yy
	KrXyEsKUc8JgtlGHZXG7nsBna0Arza77OsAtvusJmHV+VE17T1dJPDdymfGQ0aj49yGTSFSqmE2
	lg
X-Gm-Gg: AYBFou227rg4v28Uw/nsqWMsmzHCer94Sy3mGBXCveSvg2leHH6ATz2XsZ2PvmEs4ZD
	A2T0RaJXhl3ucdiwVo1JYq4YC6iw4kkW1jj4vrPAza73FWAnVTxUU1gk52aMB7ygVrZfQ6TYkRb
	N6HaE//bt+ZPrxdWfdB99wBYV7qf9rd4YI3sqr6pj6T6aoY1i4R4ioHZmk0RaRNGik3rZEaW30B
	jgV/7fc/zfeocsXET4vMZabkb4ax2xeeKF+Ytzxwk8O3400iWgKv/hZMlbJjO3HVoG83s2e5sUg
	aKecgyqc1VtjO98lQxAvQRMJVVDjUsGLQDNttFzoaYq9ZEe6OakWJ+ngwVJmVHfVCoA/Ax9SPnn
	YuOSZbg9DGPMBfJlW3Ctsds3WY3VraeZHdn6zuqkCog==
X-Received: by 2002:a05:6300:6698:b0:3de:7bd5:fb47 with SMTP id adf61e73a8af0-3e12474463bmr68506637.39.1791256630327;
        Mon, 05 Oct 2026 20:17:10 -0700 (PDT)
X-Received: by 2002:a05:6300:6698:b0:3de:7bd5:fb47 with SMTP id adf61e73a8af0-3e12474463bmr68459637.39.1791256629711;
        Mon, 05 Oct 2026 20:17:09 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cce6b358400sm1870050a12.4.2026.10.05.20.17.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 20:17:08 -0700 (PDT)
Message-ID: <fdc81d01-27df-4557-80bf-80d4527e4bf2@redhat.com>
Date: Tue, 6 Oct 2026 13:16:59 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v22 16/23] KVM: arm64: CCA: Add VCPU load/put for Realms
To: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
 sudeep.holla@arm.com, jonathan.cameron@oss.qualcomm.com
References: <20261005090754.2140522-1-suzuki.poulose@arm.com>
 <20261005090754.2140522-17-suzuki.poulose@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20261005090754.2140522-17-suzuki.poulose@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: yjqqPxIYLLim0zHBXXJmweNgaz3CgSoxRGj3I2IcTTA_1791256630
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_201714_523505_C4B11BC8 
X-CRM114-Status: GOOD (  17.76  )
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

On 10/5/26 7:07 PM, Suzuki K Poulose wrote:
> RMM controls the VCPU settings and most are hidden from the KVM, except
> for the VGIC and timer bits.
> 
> A later patch would add syncing the VCPU state into the Realm REC related
> SMC parameters.
> 
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
>   arch/arm64/kvm/arm.c | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
> 
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 6c81fec35ecec..294cea4cc8271 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -802,6 +802,13 @@ static void pkvm_vcpu_load(struct kvm_vcpu *vcpu)
>   			  &vcpu->arch.vgic_cpu.vgic_v3);
>   }
>   
> +static void realm_vcpu_load(struct kvm_vcpu *vcpu)
> +{
> +	kvm_timer_vcpu_load(vcpu);
> +	kvm_vgic_load(vcpu);
> +	vcpu_set_wfx_traps(vcpu);

Why we need to call vcpu_set_wfx_traps(), which updates 'vcpu->arch.hcr_el2'? I don't
see how 'vcpu->arch.hcr_el2' is affects realm in RMM. Could you please explain in the
commit log.

> +}
> +
>   void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
>   {
>   	vcpu->cpu = cpu;
> @@ -854,6 +861,12 @@ static void pkvm_vcpu_put(struct kvm_vcpu *vcpu)
>   	kvm_vcpu_pmu_restore_host(vcpu);
>   }
>   
> +static void realm_vcpu_put(struct kvm_vcpu *vcpu)
> +{
> +	kvm_timer_vcpu_put(vcpu);
> +	kvm_vgic_put(vcpu);
> +}
> +
>   void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
>   {
>   	vcpu->arch.vcpu_ops->vcpu_put(vcpu);
> @@ -2213,6 +2226,11 @@ static const struct kvm_vcpu_ops pkvm_vcpu_ops = {
>   	.vcpu_put = pkvm_vcpu_put,
>   };
>   
> +static const struct kvm_vcpu_ops realm_vcpu_ops = {
> +	.vcpu_load = realm_vcpu_load,
> +	.vcpu_put = realm_vcpu_put,
> +};
> +
>   #define KVM_VCPU_OPS(flavor, ops)		\
>   	[(flavor)] = &(ops)
>   

Thanks,
Gavin


