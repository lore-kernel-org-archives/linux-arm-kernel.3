Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84101C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 01:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OYhWmKK3WxSPtzfylUKK2UiUNGYDraSdFFrlfHKnCEc=; b=sOT12FR9/dpURpuDlNZV9wjmQk
	kwWCb0gTPIsW52jOz2NEfUZaKbVFpgvRsF4lMjAnBYMKfUrSGJQq7TYDdVeufY2yxeY/v+GionD4r
	ZhwUq6+8NIrEty4KE+r9QquIbA/0DO/Up/aqzedU6D1Pebfl8zkp/D9SZAlVnTxFK4QL6ZLNi/5Cx
	44AGSfpmItOayzTHuMzpbxjz98CTzrOtGSV9txBv4YZgEpw2Dizok1l59I2/fSCiNDHHWEUBcKLXT
	B6/WrJTbXq6NiAhgNwoV/p2nWuSIRDNxgFFlVRvoKg8FWbzp51ZlB0vQCRRAyGD7sjF/Bi3qZhvTy
	j24dNzZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB057-0000000H6mH-1amK;
	Mon, 28 Sep 2026 01:23:01 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB054-0000000H6le-2EJC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 01:23:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790558577;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OYhWmKK3WxSPtzfylUKK2UiUNGYDraSdFFrlfHKnCEc=;
	b=QCgtMyu3UvY0lgmcdJXyMWElp36Jt8wA1lkz1z44yOgkNTZNLsO+ZWI3p4aMjYt1Nq9HZz
	DUJBHHLTSc5GgFcTlBQ4nbeyLyOdaPrz7R7/ojNthgALDqCKmwNOp+XA8znHWUkujcxC4g
	+T/FlZUXtNDKbjnz4QpSMgKuhD7aV+E=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-549-r1_7yzYGMHCcuwO1WctS7w-1; Sun, 27 Sep 2026 21:22:55 -0400
X-MC-Unique: r1_7yzYGMHCcuwO1WctS7w-1
X-Mimecast-MFC-AGG-ID: r1_7yzYGMHCcuwO1WctS7w_1790558575
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39e3f521346so2773956a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Sep 2026 18:22:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790558574; x=1791163374;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OYhWmKK3WxSPtzfylUKK2UiUNGYDraSdFFrlfHKnCEc=;
        b=AgG0oOYtisjey8LBTFFSGpzx9v0D//PYgQ+j4oumcWYPlTTIIpxdvcJv/JEXUG8eOE
         XrAXZNj8Gz6EpPvfmtXckaOSfdGy4W57N+9Lp+1MOJ1vU1Xl+HV0jsIr+yoHjnBS59j3
         lcG78dskZ2jpEIGiuQrsWCMUBZjL+obkJxcQLPyxdwhj9YwJ5aJNEmFD2/6lcnH/Hz2c
         MY4dr2T4qrjf4hv9m+gNXBuoutRC0myP8B+PfW7naN+iDaSJiDj79XquWuZ1kRLwrSbX
         edZpIqGX6+vqfen8gcpxcvDKdKjn1XmfrzHaqDmldwi6tW25RUjH2xOX4uTH+4Wu0233
         fWUw==
X-Forwarded-Encrypted: i=1; AKwUvBy6pp+qooCzsyOq3wTLLlEKfIBv2Mm3qqKBNGJPdhiskCgc4GYgDi+G5M5RpM0Kw32vAw6TjzKvW28emAVuA7PU@lists.infradead.org
X-Gm-Message-State: AFq9FYKON6WPzHOoVl8osLGVuymENKpXhNEbI8vvlKLXbrWa+F2d8mWO
	krJA9fcT3DQa7QIsM9VSQWVZva9y/lcKlbgGLYtjwCblYzbw1fFCgeM7dbrxeuCpxZzSY0Jvfg7
	WD3lmQD6mJQuQhrrJY7JJISxb2NKIxNtNuZ+5A2So1Pvsf+VrXUbKSdCzUUYxsz7y9J4rTUNwDj
	A1
X-Gm-Gg: AYBFou3thjTOWqRHDHeotp3KIXI9b9Pntk3ttVPmgYlpg/HI460XjpNkbbjJs/8B2dk
	/NN1dOdVhnAFrssL2iaTTu9d+xJNdN7cKLcffgCqHpzREffn4u98TZ/V7k33vJO3hYXPjsHbar6
	kYvrsb0nl5qllhU8GXEtTT/q/fatKhuaVcMolayaNv171AzWPzWDWkszL9Gc/4nl9DwxaaN93mb
	pthXpZ8RC0fpsWUp2Slol1pOvSc/0qED7MNg/NwYF4NeVGEOmKCehFZo/jVhRqRQ774gpDzwY1E
	oogpqokQxIOlqCsoTFfkqt0MgMkHpbfP8gCx8hu7sn9TNZWKEAUGJxV26R2pBIV1a5smpK6HgHk
	GTnxFg7s83mS6nQdQBot2sfdhPFEfFWXuMS1T17ulIg==
X-Received: by 2002:a17:90b:3c8e:b0:3a0:dec0:c0d2 with SMTP id 98e67ed59e1d1-3a0dec0d44cmr4614953a91.63.1790558574356;
        Sun, 27 Sep 2026 18:22:54 -0700 (PDT)
X-Received: by 2002:a17:90b:3c8e:b0:3a0:dec0:c0d2 with SMTP id 98e67ed59e1d1-3a0dec0d44cmr4614925a91.63.1790558573861;
        Sun, 27 Sep 2026 18:22:53 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0976c8f8dsm24238968a91.12.2026.09.27.18.22.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Sep 2026 18:22:53 -0700 (PDT)
Message-ID: <e63e7972-f099-4e5f-a2cd-9b87b8d6220d@redhat.com>
Date: Mon, 28 Sep 2026 11:22:45 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 13/20] KVM: arm64: CCA: Add VCPU load/put for Realms
To: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com
References: <20260920212845.707-1-suzuki.poulose@arm.com>
 <20260920212845.707-14-suzuki.poulose@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260920212845.707-14-suzuki.poulose@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BXu07vYEbqw7YTgMw3zPzG6Hhv2YufzHtgB5JUBDekQ_1790558575
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_182258_657766_BA5E44D4 
X-CRM114-Status: GOOD (  16.74  )
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

On 9/21/26 7:28 AM, Suzuki K Poulose wrote:
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
> index 0e2ab5311e4d8..bcc274df2a915 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -795,6 +795,13 @@ static void pkvm_vcpu_load(struct kvm_vcpu *vcpu)
>   			  &vcpu->arch.vgic_cpu.vgic_v3);
>   }
>   
> +static void realm_vcpu_load(struct kvm_vcpu *vcpu)
> +{
> +	kvm_timer_vcpu_load(vcpu);
> +	kvm_vgic_load(vcpu);
> +	vcpu_set_wfx_traps(vcpu);

vcpu_set_wfx_traps() is updating HCR_{TWE, TWI} field for vcpu->arch.hcr_el2.
Could you help to clarify those two fields need to be updated here? :-)

> +}
> +
>   void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
>   {
>   	vcpu->cpu = cpu;
> @@ -845,6 +852,12 @@ static void pkvm_vcpu_put(struct kvm_vcpu *vcpu)
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
> @@ -2202,6 +2215,11 @@ static const struct kvm_vcpu_ops pkvm_vcpu_ops = {
>   	.vcpu_put = pkvm_vcpu_put,
>   };
>   
> +static const struct kvm_vcpu_ops realm_vcpu_ops = {
> +	.vcpu_load = realm_vcpu_load,
> +	.vcpu_put = realm_vcpu_put,
> +};
> +
>   #define KVM_VCPU_OPS(flavor, ops)		\
>   	[(flavor)] = (ops)
>   

Thanks,
Gavin


