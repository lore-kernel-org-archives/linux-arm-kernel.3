Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21AC5C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 05:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iHp7c8083IblnSkSElkO4q8Pyi74C3j+q7Rd++XFOzQ=; b=A5xWj/HgQEDlEw0q+ZbuymHMSy
	3w+Hm5oXcN4Y+ZZN52020VPxAsDa+EnJsEmNllH1Q87SOc3/0o0Coznu6wd4j/KGC9nlL0nZlnFdx
	WJ52SmEawws0luM3RigHL2bqiOXS4ZkExPSn3zekfeyUVoRSp7jct1bge/Wfo2E23AqNLT3JGI6Vc
	LIQkNn2+jegmqlRkOSOPbdf1mgmE+qXuHD+5fyH25nw8Vr/yCHmde/LcW16hcW3CRxq4nezJ0MqHw
	Xbz4MxOWHESsejqShZXnqmEs5k+rw34ZdUKHx0/R+zMd4MVPJV2U6GybH/7t1v5PM35oYbW33yKOb
	kqBuiUtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpKpM-000000038Q0-1KQ8;
	Tue, 04 Mar 2025 05:28:24 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpKd9-000000036hT-3e03
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 05:15:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741065346;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iHp7c8083IblnSkSElkO4q8Pyi74C3j+q7Rd++XFOzQ=;
	b=bNQ+6bS6gv0r5njYRenf8jQbHex1ABseEWu/fhyRgpg6UOyBQsukUSBTpNNIAm8FNZMydS
	C8oWkroraHS2YC0mxc25TYicpiKTPWrsKRK9Q8UtDujCaV5otWv9Df0dAx29ZJC1q33snp
	CTyu44YvO1GxdrkoOk8l1mqJjzvcXLw=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-92-abwLVEI0Nx-Y6wE62_Ykvg-1; Tue, 04 Mar 2025 00:15:40 -0500
X-MC-Unique: abwLVEI0Nx-Y6wE62_Ykvg-1
X-Mimecast-MFC-AGG-ID: abwLVEI0Nx-Y6wE62_Ykvg_1741065339
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2235a1f8aadso80147035ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 21:15:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741065339; x=1741670139;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iHp7c8083IblnSkSElkO4q8Pyi74C3j+q7Rd++XFOzQ=;
        b=SM5SkVS7S6U+IAtZlARPBSiiOmbVkBg10aNgQGD1Q1b8/hmJ9HDRXvNNpwq1mM7bXI
         +3dygl0Qzs7hh/91l0NtWAdoHcnb7og3RF+fO9pq8ifp+ACxaeUdJsvif9Kjf25Crgnn
         RBzSAYTOSLlSpi8kXgHVJb+Whaut2IHzAVJI1dWfSEcdS7csrZMZISApl/6yCTem5JoV
         IKuy4lKsX8ms1aa8gJgPoEL+PtkZm4Rbu9qlc2d6L1jB+mO/av1CFTbf5YumyyG767A+
         aBL4K3GaW5K9XTOwMGxFxrsA53xczMt0/S0VVIWx/Z7MF7n3L5UoeYJS4Q5zPDZoVOyd
         CJVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQCF5WNGNgcKZM9QAzqxl3nuI9NDlPbmKEb15P1I71rrNtzQ4vkvt80NMnIYjoFjXfDBd4T38GRq4ga25p2vHe@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+CeHFDIahbyJlFvimzFXE2Cn7CiDxLC4P20jt0KDABGiK01cb
	NeCowvy5NbBoA48UM+M5m4sylys4g9L7sWy9ImAUgw7dFBQsvAag5ANnR+Xd9delC8uWkOQQhvX
	9bKy/C6NgzvD4HToNNfwljM0O65YkIv2VIyH492OomsTfnNNAxjnh4t7Y56ZM+CksP6Surf6R
X-Gm-Gg: ASbGnctiRi+qlrpoRXrw66OrOZW5i8LOsR7m6W7zd7sZxcVQ0tOQ+MmyRr/UpGxSqV1
	7P9iIknJmh5z7oO5MvnAGqMS8UdKsD6OMHkCjRcRDcmEbDrSwSC28qdEBT0xyjHyHkQRVv0Ir8w
	dqPWFnTK035ZnZj44+75iLwXtW1QMu9UWajOr1VlANSfwvl6O7xi2J5qcoLNcupaHVhwuk3EAY9
	CUrE8qGe+b0qeHrh5s66NXn60UIMhwmwQ9a7Cwx6C5PmLeaNz2UBT94g6Ndpu4N6aY+K7xQrbKh
	0ffQ4aVPuIcdSVzdTg==
X-Received: by 2002:a17:903:244d:b0:215:9470:7e82 with SMTP id d9443c01a7336-22368f71b7amr213249535ad.4.1741065339580;
        Mon, 03 Mar 2025 21:15:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHwYeNz4BZ5M1mONF0+zOWTYRV5h3Fu8fVqk+GofZ0hdvm3v9bSMtAm5K07jzNGKbCercWDMg==
X-Received: by 2002:a17:903:244d:b0:215:9470:7e82 with SMTP id d9443c01a7336-22368f71b7amr213249125ad.4.1741065339283;
        Mon, 03 Mar 2025 21:15:39 -0800 (PST)
Received: from [192.168.68.55] ([180.233.125.164])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fe825a99a7sm13451855a91.6.2025.03.03.21.15.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Mar 2025 21:15:38 -0800 (PST)
Message-ID: <eb8ea5a0-fe6c-4b96-92da-f9ec0355b4dd@redhat.com>
Date: Tue, 4 Mar 2025 15:15:31 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 22/45] KVM: arm64: Handle realm VCPU load
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Christoffer Dall <christoffer.dall@arm.com>, Fuad Tabba <tabba@google.com>,
 linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun
 <alpergun@google.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>
References: <20250213161426.102987-1-steven.price@arm.com>
 <20250213161426.102987-23-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250213161426.102987-23-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: v0Yzg5FcoHRFZ-due8n_iwE0JBKavQiwpyq6b_8Vxxc_1741065339
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_211547_988344_07AB4664 
X-CRM114-Status: GOOD (  15.89  )
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

On 2/14/25 2:14 AM, Steven Price wrote:
> When loading a realm VCPU much of the work is handled by the RMM so only
> some of the actions are required. Rearrange kvm_arch_vcpu_load()
> slightly so we can bail out early for a realm guest.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
>   arch/arm64/kvm/arm.c | 12 ++++++++----
>   1 file changed, 8 insertions(+), 4 deletions(-)
> 

One nitpick below:

Reviewed-by: Gavin Shan <gshan@redhat.com>

> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 49ad633c5ca5..3e13e3d87ed9 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -633,10 +633,6 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
>   	kvm_vgic_load(vcpu);
>   	kvm_timer_vcpu_load(vcpu);
>   	kvm_vcpu_load_debug(vcpu);
> -	if (has_vhe())
> -		kvm_vcpu_load_vhe(vcpu);
> -	kvm_arch_vcpu_load_fp(vcpu);
> -	kvm_vcpu_pmu_restore_guest(vcpu);
>   	if (kvm_arm_is_pvtime_enabled(&vcpu->arch))
>   		kvm_make_request(KVM_REQ_RECORD_STEAL, vcpu);
>   
> @@ -659,6 +655,14 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
>   		kvm_call_hyp(__vgic_v3_restore_vmcr_aprs,
>   			     &vcpu->arch.vgic_cpu.vgic_v3);
>   	}

A spare line is needed here.

> +	/* No additional state needs to be loaded on Realmed VMs */
> +	if (vcpu_is_rec(vcpu))
> +		return;
> +
> +	if (has_vhe())
> +		kvm_vcpu_load_vhe(vcpu);
> +	kvm_arch_vcpu_load_fp(vcpu);
> +	kvm_vcpu_pmu_restore_guest(vcpu);
>   
>   	if (!cpumask_test_cpu(cpu, vcpu->kvm->arch.supported_cpus))
>   		vcpu_set_on_unsupported_cpu(vcpu);

Thanks,
Gavin


