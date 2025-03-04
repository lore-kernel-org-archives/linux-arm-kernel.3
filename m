Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E7ACC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 06:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hbTXak4fZZgmEd0OOFQqdTCiZzdYnXYZunDKpr8m1kE=; b=VGGxQDj3j/5HPWE/Xbe5GTSgO5
	DEqeiwAeGRpYjBAHaynLXS6vSFxoiAFLXUix9J5t1w90bsFwzVNAQfKebypO9Roz5sfO4EfyTRP/I
	TWO+FjlY4Bvym5atxVDVXvclKbUiCZfvh3TmFL8voasuIg1YpvwTf3HcQeE5iHxMmrre5+IUGI6Pr
	LCUlHymcFojTD41fQfa1/8UnnvVsvym9C2CMD11IjYelpzhAFI1Q1MKvmhVuFVhWo6wjThQ5zpzXb
	5Zhqa5OfP3Z9wCF2D9EAW1A0tzXkT33urZuancqDD4PtmPVPVm0A57FxJmOs33Zgxy07dZZ4yqI5X
	lpmswWXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpMFe-00000003NGM-3yay;
	Tue, 04 Mar 2025 06:59:38 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpL32-000000039mA-2Azx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 05:42:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741066951;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hbTXak4fZZgmEd0OOFQqdTCiZzdYnXYZunDKpr8m1kE=;
	b=EIi4eFhepeOjmAxiwmZv7Pd7FJJgu0kNcQzhNCi0eZDZ5wPQ/0Jrngp+r4qsZlXRqI+615
	VAWuGZdZiERLFeBnUohek0ArYaDCGfu8xXqx7XBIu8VRaoWLlTQ6JdsAE9gR7PrMGFmdvM
	mArm4CSmrQ2aXezhSWJg5LYkjEEr0mA=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-277-8DqdtoySMoqC36aWYbE66g-1; Tue, 04 Mar 2025 00:42:20 -0500
X-MC-Unique: 8DqdtoySMoqC36aWYbE66g-1
X-Mimecast-MFC-AGG-ID: 8DqdtoySMoqC36aWYbE66g_1741066939
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2fe86c01e2bso10114190a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 21:42:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741066939; x=1741671739;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hbTXak4fZZgmEd0OOFQqdTCiZzdYnXYZunDKpr8m1kE=;
        b=KEtF36fBAC9UdhDbSpOGLpj3BXyEspuEXrhKw8rhvgjrQ1dFrb5+Uhb6ZWc9f9f6CT
         hGvVxpz5uEtw+YX/+Na0vWmdjQleUHyyIisjbaB3i8Tj5KNmAJxwSaj184dnIhhyjYKu
         gyVdNZGDEnqBjbRGOo3yHEkHTnLSLD7zCsbApyUubPNLXSKNF/2eboMEJGxf1wE94YX4
         JS4mMB3g9g9IrMEr6OU06jehdZtC4x6EaA6TD9vbhZOIAKkdWOZLHYLwCKg9Kh7n6I4n
         5tsTESNisyNDvoxyWvj3mC5lLamxnrhxdr1uvT9RknskeKNtMtme9CWxMz34oRRYHGnT
         RYDg==
X-Forwarded-Encrypted: i=1; AJvYcCXH8bntMPOaIBxHgT7JRbwnH/ZhULis11Bz8FIoCFYGiJ6nlnm2QS8z0fgTRgDn+g4FcVN0EIBIBRy6miM/KZdu@lists.infradead.org
X-Gm-Message-State: AOJu0YwPZIBXK3UEkeNMRTlmFRl17PwGDHESFpHQBLxV5kgiazCrNWsY
	Em+EO74585bmpp8fJT1ouidKF6Zvb1n53nMeF6KcStyg/0lC/Kys7LBw2QoUmheEW3+jvcO7VZb
	dcKAUnnwBgAAjmlUAmpE/KwWNtNhnJYIKr40fRysB4tG8E3/Kd3rc916l9+rQqUZhJOrSOgNw
X-Gm-Gg: ASbGncvd7XxTU2N85uKg2S11CahWgWX1igq5wsv7N9gUsBPFYAP/rU2CLlbEV4FGZ3j
	meFOcITp/jpoo9/oVhJJw9dnEHxaXPobiozqI0Ak7GSzMakBrPbmJ3fElxe1XkbhGP+xQooh9rM
	jmEy26wCwAE3N8dXVN6dhQga+7taggDwuwOWpQhK27NqKYmx/BH0wNaTg3+niYzGiNGLb80MQDh
	RyaX1J2MHxkzptNhKU1sy5o2mQTb1S5u1KBzP2mplFUmdi/I5NLJUbktxbF4kzuA7VU+0hi14tH
	7whvgSpG51JKNehFtQ==
X-Received: by 2002:a05:6a20:c781:b0:1ee:e8c4:e1b6 with SMTP id adf61e73a8af0-1f2f4e01578mr26530452637.33.1741066939185;
        Mon, 03 Mar 2025 21:42:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHurZweDDClFEM+EDFVGKyToeXZSnslvrdiIY31gYPFZM1mfyMjnp3vImA6Ky+0fKgY2QYszg==
X-Received: by 2002:a05:6a20:c781:b0:1ee:e8c4:e1b6 with SMTP id adf61e73a8af0-1f2f4e01578mr26530433637.33.1741066938923;
        Mon, 03 Mar 2025 21:42:18 -0800 (PST)
Received: from [192.168.68.55] ([180.233.125.164])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af075209ba3sm5804806a12.29.2025.03.03.21.42.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Mar 2025 21:42:18 -0800 (PST)
Message-ID: <ecf15da0-49ff-4cc3-9e4e-5c47f79acc06@redhat.com>
Date: Tue, 4 Mar 2025 15:42:10 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 26/45] arm64: Don't expose stolen time for realm guests
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
 <20250213161426.102987-27-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250213161426.102987-27-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: sB_uB4y-4zf1cZ8cQmsAZ4xgc8awWh__16ghia_z9lU_1741066939
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_214232_634260_B80BAA68 
X-CRM114-Status: GOOD (  15.88  )
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
> It doesn't make much sense as a realm guest wouldn't want to trust the
> host. It will also need some extra work to ensure that KVM will only
> attempt to write into a shared memory region. So for now just disable
> it.
> 
> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
>   arch/arm64/kvm/arm.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 

With Documentation/virt/kvm/api.rst updated:

Reviewed-by: Gavin Shan <gshan@redhat.com>

> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index a6718dec00c9..79d541c95bfb 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -403,7 +403,10 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>   		r = system_supports_mte();
>   		break;
>   	case KVM_CAP_STEAL_TIME:
> -		r = kvm_arm_pvtime_supported();
> +		if (kvm_is_realm(kvm))
> +			r = 0;
> +		else
> +			r = kvm_arm_pvtime_supported();
>   		break;
>   	case KVM_CAP_ARM_EL1_32BIT:
>   		r = cpus_have_final_cap(ARM64_HAS_32BIT_EL1);


