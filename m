Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 682CCC02190
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Feb 2025 06:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O9bc7QlURY2KqxOqSdcgXWV1nxuIWVaexteEdP17afs=; b=K4mExQ2wjZz71hoAoDTBvg3yqX
	F+xJw9hOEOMG7onv9oezyC0Zlb2dCMzxaBVM5fc0933cVWx1w0H3jxIb19PmMgXvTUpw+Ncm8TYVb
	uKVlNeb0vhu1EvcQ/wAThaJpQPFSdPP2QrhIpMO2C3b1vZGllpjGsssvmWBq9rIzxGPJP4luRFwgm
	FT0i9qyuGkjuDC2WnDftZnOM4Q0WOWhcfpyek2xbHn1AFDoef58z633S6dQfyQ6gognlC/DruUnNM
	sBlLuKfOIZJUiLbJdV3OgXfEDERtltYVJ3x6UeHCpyNEiJ0UBW2fzyEiG62x59WN8SluJoq0t0Uf3
	p02AjcLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teThP-0000000DReL-2COM;
	Sun, 02 Feb 2025 06:43:19 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teTg4-0000000DRYC-28Pz
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Feb 2025 06:41:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738478514;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O9bc7QlURY2KqxOqSdcgXWV1nxuIWVaexteEdP17afs=;
	b=E7dXItFtOeCyqZlZTZEnNlzp7jPw5T5UTC/U22qHv38dWkbJUUbnHJs3KrWKZ6DNRYFtGa
	mUH0gzJyn9pcaD38DYpgxT+PVsljrccBwyEeQDNvkhtI/h34O3eeTtWqu5cDEalCoVu2WH
	S6hZAvl4pk3/DDbv0NrXTpYUTVlDXLU=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-670-5q0HNi-LNWu7gtUGqKVJww-1; Sun, 02 Feb 2025 01:41:51 -0500
X-MC-Unique: 5q0HNi-LNWu7gtUGqKVJww-1
X-Mimecast-MFC-AGG-ID: 5q0HNi-LNWu7gtUGqKVJww
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2161d185f04so48331425ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Feb 2025 22:41:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738478510; x=1739083310;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O9bc7QlURY2KqxOqSdcgXWV1nxuIWVaexteEdP17afs=;
        b=YyrmAjndxCbzXwkhO2WVrIPOJeFQTXDm/A4evCjzrSqcSfRWKLF5STx4KzSYrLJV7v
         Up34rvp92TJ24kUUPdsSujK0/JX3vI3ApwTjUwXymuPJnemfU5YCVd2JlVDDoyJpmTWo
         iDFHQGwb7cD1b6b2H3RtmIR2Ifxx20kdassy4DxGlrGE+s4ydMNrUeipj5zHP3hdNQs7
         kos3LGPdXQdm5eF/Y5DFK6U3ipanmDnjDHA60V7BrqhTI92gxSPLETa5OKqAja14kJj6
         sx9FWFG03lxSfqk4P0vBUqSdFZaIZFEVesFhYGG8rdQc+rdjjeM3hYb28I+IcziSi/fF
         J2Yw==
X-Forwarded-Encrypted: i=1; AJvYcCVs/pdTGGWNKPdkI2WNDlBBAKIsmXgfjFvKwAqNPBQQKERaqpe6LHVRQOL/+BMCSwvq+UD/HjumhXkSJjVDvVI8@lists.infradead.org
X-Gm-Message-State: AOJu0Yxb+7rPB6xlncc0dPKJWyjnmQorJCIO2rsb7+sRn/XkAOGmgNtf
	v3LkTwij6OnsYupkzhGB0OlbRpCvesoPxg4QFpFFKQknC6Y2pUz+iRmuqmdACAjX6o3YrPfdH+S
	XA0nppACrS08VI8loBdMRusd9n+k3FJXtJlCkBlXL9jQmtVLv8y0THWBPdf2HEfTQykJn3jcE
X-Gm-Gg: ASbGncstHAMd1beCfpmbzo2gDexcjKsser6I+e5pDuAeSgpohD+gFBuVxSikxSRz4+q
	1+KeYWxov6LANQqDVkQk7eIF0erxLPxdPZwW5IokwwnHvQm02N2Wv2aLrEs7T1oGJMUTSYMSEVQ
	Bldc/ZhYAWi5yvZkEYsSaSrtuhvp6KVOPM6HJt5/3hzx0jsEjsjnHTNoifYL0ffPHcNN+1FqoWT
	oTeEK/lwgP8g2vvlYcx2A5ZaO39Nk0vcvHCg+d3SK5xz94UiGTG94K4PI5thGSMwiVlacVSYKDN
	X7ixHw==
X-Received: by 2002:a17:902:e742:b0:215:a97a:c6bb with SMTP id d9443c01a7336-21dd7c65891mr279349175ad.12.1738478509966;
        Sat, 01 Feb 2025 22:41:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEgiNqSMRe7eOLK7UU7yfr7SRk/XUpHiWVSGyN9DA4ZXFp8THxJ4DGREQDo0HNpjoMWa/PKyw==
X-Received: by 2002:a17:902:e742:b0:215:a97a:c6bb with SMTP id d9443c01a7336-21dd7c65891mr279349065ad.12.1738478509619;
        Sat, 01 Feb 2025 22:41:49 -0800 (PST)
Received: from [192.168.68.55] ([180.233.125.64])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de32efa0csm53772495ad.116.2025.02.01.22.41.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Feb 2025 22:41:49 -0800 (PST)
Message-ID: <69a424e0-1350-484c-9ce7-b40c4fcacd8e@redhat.com>
Date: Sun, 2 Feb 2025 16:41:40 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 27/43] arm64: rme: support RSI_HOST_CALL
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: Joey Gouly <joey.gouly@arm.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Alexandru Elisei <alexandru.elisei@arm.com>,
 Christoffer Dall <christoffer.dall@arm.com>, Fuad Tabba <tabba@google.com>,
 linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun
 <alpergun@google.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>
References: <20241212155610.76522-1-steven.price@arm.com>
 <20241212155610.76522-28-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20241212155610.76522-28-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: tI3-HGsiaVGjZzMPuuX1jeZtpbHnyyQZCFaELZyiybE_1738478510
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250201_224156_632940_50D082C0 
X-CRM114-Status: GOOD (  22.86  )
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

On 12/13/24 1:55 AM, Steven Price wrote:
> From: Joey Gouly <joey.gouly@arm.com>
> 
> Forward RSI_HOST_CALLS to KVM's HVC handler.
> 
> Signed-off-by: Joey Gouly <joey.gouly@arm.com>
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> Changes since v4:
>   * Setting GPRS is now done by kvm_rec_enter() rather than
>     rec_exit_host_call() (see previous patch - arm64: RME: Handle realm
>     enter/exit). This fixes a bug where the registers set by user space
>     were being ignored.
> ---
>   arch/arm64/kvm/rme-exit.c | 22 ++++++++++++++++++++++
>   1 file changed, 22 insertions(+)
> 
> diff --git a/arch/arm64/kvm/rme-exit.c b/arch/arm64/kvm/rme-exit.c
> index 8f0f9ab57f28..b2a367474d74 100644
> --- a/arch/arm64/kvm/rme-exit.c
> +++ b/arch/arm64/kvm/rme-exit.c
> @@ -103,6 +103,26 @@ static int rec_exit_ripas_change(struct kvm_vcpu *vcpu)
>   	return 0;
>   }
>   
> +static int rec_exit_host_call(struct kvm_vcpu *vcpu)
> +{
> +	int ret, i;
> +	struct realm_rec *rec = &vcpu->arch.rec;
> +
> +	vcpu->stat.hvc_exit_stat++;
> +
> +	for (i = 0; i < REC_RUN_GPRS; i++)
> +		vcpu_set_reg(vcpu, i, rec->run->exit.gprs[i]);
> +
> +	ret = kvm_smccc_call_handler(vcpu);
> +
> +	if (ret < 0) {
> +		vcpu_set_reg(vcpu, 0, ~0UL);
> +		ret = 1;
> +	}
> +
> +	return ret;
> +}
> +

It seems that the return value from kvm_smccc_call() won't be negative. Besides,
the host call requests are currently handled by kvm_psci_call(), which isn't
what we want. So I think a new helper is needed and called in kvm_smccc_call_handler().
The new helper simply push the error (NOT_SUPPORTED) to x0. Otherwise, a unexpected
return value will be seen by guest.

handle_rec_exit
   rec_exit_host_call
     kvm_smccc_call_handler

>   static void update_arch_timer_irq_lines(struct kvm_vcpu *vcpu)
>   {
>   	struct realm_rec *rec = &vcpu->arch.rec;
> @@ -164,6 +184,8 @@ int handle_rec_exit(struct kvm_vcpu *vcpu, int rec_run_ret)
>   		return rec_exit_psci(vcpu);
>   	case RMI_EXIT_RIPAS_CHANGE:
>   		return rec_exit_ripas_change(vcpu);
> +	case RMI_EXIT_HOST_CALL:
> +		return rec_exit_host_call(vcpu);
>   	}
>   
>   	kvm_pr_unimpl("Unsupported exit reason: %u\n",

Thanks,
Gavin


