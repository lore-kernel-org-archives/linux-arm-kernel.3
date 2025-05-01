Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C26D1C3ABA9
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 03:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xu+Kf0+DFCNXRO2ndZGA8xUx9TD/werA57XUeiFDww0=; b=otFyTbP+DZPH+gx4C6T0x0SvqS
	H52cl5PvDQjsOE3Kg4SL8l5mTixjtEcCysJQ9X3shuDGu94jNYN9p3jNz346MFSUkDLgRQTOuEKcx
	c6bwTj5LECBYhlSC54TL0a0rB10DVkXIq4NyqFv8oeLSASnTeZvqQ9P2QpucDD7BUwvwQurfq4qce
	zccqvpbfUxQqy7NVaM9BPb4DtKt5ShOqbPwAMJAe5FGGBMbqwIawo7VkP+1Qp4nYa/QwEOkD3i9aa
	j6CcY4SUn6RsiNaC1EkMKzMA4oUs4G5zq/XLI/5lyaf33BUBXC7OmPV6JNXkOZIKrYCRaNhKYm9z0
	SlJfbaBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAL04-0000000EdrN-2njN;
	Thu, 01 May 2025 03:54:16 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAKwf-0000000EdXF-42yT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 03:50:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746071444;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xu+Kf0+DFCNXRO2ndZGA8xUx9TD/werA57XUeiFDww0=;
	b=IQWibwIcdfF/tz6XEWtD69Y1E/jrvkb0eq6SmtQgm9vHB40Dx3kTY6bgi/7VmTXnLwLtdX
	O5EnP7FCTnfsFxF38MrkTFgB0XNUmimQMjEia4geXwnjptjzG9yGqQ6ns15Jej8fjhOHhY
	Lagw9xCQvOAg30I/L/5WGh3xgWRkNFU=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-655-Fszd5-foPW2qzyNtElcjFA-1; Wed, 30 Apr 2025 23:50:41 -0400
X-MC-Unique: Fszd5-foPW2qzyNtElcjFA-1
X-Mimecast-MFC-AGG-ID: Fszd5-foPW2qzyNtElcjFA_1746071441
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-736b431ee0dso520533b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Apr 2025 20:50:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746071441; x=1746676241;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xu+Kf0+DFCNXRO2ndZGA8xUx9TD/werA57XUeiFDww0=;
        b=P+49FqS0/MF/gyDuS6LYf/rhQWRinNzyJSpL6gvWcjwkbnvlTwPyYx1ppZqvydyI/3
         Krdgor1gLWOHFbi2fQQ7Vh07PVq7Gz+SkO24HeVlgWr33fpBq2UznjUydYqxZlPAmdTg
         I7iTqdI83/KQNgj6c7tb32jcnNUAPPYH6uLjFOyrYtw9ezrm22nVOfcDygB40c8MrA4o
         Ej7BvBUvq2j08k9eSlH2AfNSpLfJeu0BbSSppYSWNJJ42GPdaFnrUx1vh22cepReDG3W
         zD9DjWXpReJQTZWjrPrZFEgI5+hDItJTV7egh7QTSI6/uWN+4kzApoe+liYLLewZmoDB
         ZT4g==
X-Forwarded-Encrypted: i=1; AJvYcCVaP+JzFYjPotzZgj2S8JH29lnW9Qf5HBXTMsrAnou0hmltR8+SSW81llyEmdxWLQFb+UmxBNYSB49WtI5KKHbt@lists.infradead.org
X-Gm-Message-State: AOJu0YzCcFG3tnBOEsAjGU2WGIWIpc8jbHMH1CudaJKdjmL1RR5IswiW
	bE/Crl9yFTVe0/uV5TEHft7Plb2Nx8AuX9trcn3ivIvMIeL/915cWAxsKHYKiRqLNm+N1u817gU
	JOYK272MQ4QaaF2c8NAGU8lkMYQ1IqVcvA4WJdn9kOIMMdRl8MPx8KixZVFGzwCsAuyaPyZ9j
X-Gm-Gg: ASbGnct3LZasi02D5gwq9OWxYyQt1kr7bHv6snBx2RWH5wYovJ16RLVR9h7YDPhwb1b
	LwCgZbaC5z+MmfZSqaJep0QDvAxjtQHwWnKDo+mbQ/4CELIaj3XEfhfq6GiC9asX8JxHaL7Ijw0
	Yzrp2aHEvmxZpfMyfEHa1WbbulGyOcgwTkWokvAmRrqMTveI7j5GLHrYIBPLVDr9ZPBUv5pqu6r
	n2e19/qN8uXq5R9Dl8gO+isyrM2sPAekckjhc4U/Lc9LCPuHT3Wo7/05MiG68DQJl50iAPtMSrw
	FGeetPTjCL6f
X-Received: by 2002:a05:6a00:2da3:b0:736:a82a:58ad with SMTP id d2e1a72fcca58-7404923a33dmr1298191b3a.15.1746071440945;
        Wed, 30 Apr 2025 20:50:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+2TUVWiAQRNStfJKlXXyrEy8i+Rkh7KlouLhbtQWVsBfOICdI6sUfx8nwE+QueIaBYA6F7Q==
X-Received: by 2002:a05:6a00:2da3:b0:736:a82a:58ad with SMTP id d2e1a72fcca58-7404923a33dmr1298168b3a.15.1746071440658;
        Wed, 30 Apr 2025 20:50:40 -0700 (PDT)
Received: from [192.168.68.51] ([180.233.125.65])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74039a2e5ccsm2541439b3a.110.2025.04.30.20.50.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 20:50:40 -0700 (PDT)
Message-ID: <87f40de1-dd3b-43e2-aa67-8d7b6288acf8@redhat.com>
Date: Thu, 1 May 2025 13:50:31 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 38/43] arm64: RME: Configure max SVE vector length for
 a Realm
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
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
References: <20250416134208.383984-1-steven.price@arm.com>
 <20250416134208.383984-39-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250416134208.383984-39-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dOCcr-UivIr1SEAsoDV4ndhiGORtwsV_0m4qKJ3brrc_1746071441
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_205046_095278_7BA82BC2 
X-CRM114-Status: GOOD (  12.29  )
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

On 4/16/25 11:42 PM, Steven Price wrote:
> From: Jean-Philippe Brucker <jean-philippe@linaro.org>
> 
> Obtain the max vector length configured by userspace on the vCPUs, and
> write it into the Realm parameters. By default the vCPU is configured
> with the max vector length reported by RMM, and userspace can reduce it
> with a write to KVM_REG_ARM64_SVE_VLS.
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> Changes since v6:
>   * Rename max_vl/realm_max_vl to vl/last_vl - there is nothing "maximum"
>     about them, we're just checking that all realms have the same vector
>     length
> ---
>   arch/arm64/kvm/guest.c |  3 ++-
>   arch/arm64/kvm/rme.c   | 42 ++++++++++++++++++++++++++++++++++++++++++
>   2 files changed, 44 insertions(+), 1 deletion(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


