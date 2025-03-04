Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CD74C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 23:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g6FYqCr6QwRqz7j744DqHTGMlLhF5qSIjaDfjqoangk=; b=K0O/graSxLQU9dlF0P+yTIoQ87
	KegV3QTwKxYSoljxUQI6d0LC1+o8xsHoVerVbdvIqBQs/+nCywa791MHz+gWMRU59nI7KkixSQGvm
	LJv4GHHp+98MPXu8/iQCGEHLDAV4bwZDTNzq3fHfC7yV+O5xsBk5B0CAhht/klO0x0n/MSUxF+zBj
	H9kr0cSjAsPAQK5TR5odhacV2676tAimbaYUEa16WaugAqni3L7rG2roo16eMOqvT6y4D4VT/8oR0
	5RMBkv5Bb5uBhc0Q7YzG88fARhzEHiHQTv5tt/0espuhlc9SfcAjbDZRrK85SdmhO3ElsUFc7cI5e
	/DA6lqSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpc0k-00000006Yuw-0DL0;
	Tue, 04 Mar 2025 23:49:18 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpbyQ-00000006YeT-1fOM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 23:46:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741132013;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g6FYqCr6QwRqz7j744DqHTGMlLhF5qSIjaDfjqoangk=;
	b=QLlzSB8rgXR0/UpCMdkAimuZLuVx1q8B8dAu5zp/zvV6xHXNQl9CNGjQtNOJROJQKDop/s
	hUBL89VP5hS+nNBt+zY0aa8Wmf94sXOcz0W4bJFOLIH5GVLr7Vrkcua6ih13LIIUoF6UBy
	tgpnfeoa+v18rzNPQ69R2UhxcK7Td38=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-107-V6-KPzWONoKs8s59BgnzmA-1; Tue, 04 Mar 2025 18:46:42 -0500
X-MC-Unique: V6-KPzWONoKs8s59BgnzmA-1
X-Mimecast-MFC-AGG-ID: V6-KPzWONoKs8s59BgnzmA_1741132001
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-22339923628so4268845ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 15:46:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741132001; x=1741736801;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g6FYqCr6QwRqz7j744DqHTGMlLhF5qSIjaDfjqoangk=;
        b=X+lVqXoy9qPZjTX63N2ns1qc9agA7RnMJRyJdmdJivnaOTmdeh5zQtv14YqJl6kpco
         rkZLTuQEFdI9VP0miN8ZFedxirVfhqVipT1WpuEVSuiEXD9Exa0JFAegvjD88fG/1Z0b
         nLUxKjvPOxj7Ty4Y7dqt75tWpLvntRmj5b7Kb2xKWRtXpMfTYKfgMsfyWlHdFyhRw50r
         XnmDbk1mivuA/5zX3lPJ/mqrdYf1ihjOAguBDiFbTMiiw3ZsCuw9oJcItV3zBrhiJI7Q
         3eSkezFjjae8oRjFLYcZktID4Iwg5hmrIinhsaxgp4iS6A1EsP+J9jOAo0wyQUZsz2Zm
         2drw==
X-Forwarded-Encrypted: i=1; AJvYcCXHg4crrv9kdDhaYcwEXO2Rsncx6nD2b3EewaiSz22O2vPQ66Arfj+vSTMkRHhG7P9xoTyif0Aey2v/WdfmTLzU@lists.infradead.org
X-Gm-Message-State: AOJu0YwyyH+rzIOu4AVjPutzuskbB8AFXE8uJsl88QmdQxIEB2/g3nLy
	ZbRT0xX0YlwYq2n3PBlw10vnok5m9xTZhdwlhzv5Djy+xqhoTjHP+IhqP105bFlSlPMY6OC2dtY
	NnOJuzsQLSm7rCR//FmAIU+dY0TBZMzzsYRoS7vVcDqRF7RPkCkiXAVmdYEXsOm9fM4cUru58
X-Gm-Gg: ASbGncsCnMhqy6TR1EFcxfNo/YbFgA29QSvCMfnr8VCvwEwWMbrIas6wE1qh/Lnu6s6
	HyJz36RYhbvk3g/Fpfp9e9NnwXctqhRT0WSBsdL5I2gzQIyR/ASoxH/uXTe0adDom0vCc0LCvNI
	njLRrTXTEaUabVjRFmGbwVykYIIY5HofsSonb59hoeRmrsaZdpm69UXC/XzfhHJ9r6zrVMEXLHM
	spyrQB0TLjZhhDE6wmGSEEYnNjqCCMOKQ00mWOtMp+y5lfHTTm27VELNZ3gpF57bdcWQfgN3WiC
	UNVx/enB2Ri9wHA=
X-Received: by 2002:a05:6a00:139c:b0:730:9637:b2ff with SMTP id d2e1a72fcca58-73681ea12f8mr1622600b3a.7.1741132001105;
        Tue, 04 Mar 2025 15:46:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEi8JMyb0mWMUpD1PTtuv+YTTWcm/STeWKBdnRr6BiZi8G3Jvspyz2BgiTf4N+sfAjC+o/22Q==
X-Received: by 2002:a05:6a00:139c:b0:730:9637:b2ff with SMTP id d2e1a72fcca58-73681ea12f8mr1622559b3a.7.1741132000737;
        Tue, 04 Mar 2025 15:46:40 -0800 (PST)
Received: from [192.168.68.55] ([180.233.125.1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7363f2e8a34sm6324254b3a.168.2025.03.04.15.46.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Mar 2025 15:46:40 -0800 (PST)
Message-ID: <f331382f-5747-4837-ae60-42e9cb37ecd4@redhat.com>
Date: Wed, 5 Mar 2025 09:46:31 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 36/45] arm64: RME: Set breakpoint parameters through
 SET_ONE_REG
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
References: <20250213161426.102987-1-steven.price@arm.com>
 <20250213161426.102987-37-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250213161426.102987-37-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: DkoMGBMCXZKtt7iasXiKpAsjmZfOOaS08srCI38NvvM_1741132001
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_154654_512527_E52F24AA 
X-CRM114-Status: GOOD (  12.19  )
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
> From: Jean-Philippe Brucker <jean-philippe@linaro.org>
> 
> Allow userspace to configure the number of breakpoints and watchpoints
> of a Realm VM through KVM_SET_ONE_REG ID_AA64DFR0_EL1.
> 
> The KVM sys_reg handler checks the user value against the maximum value
> given by RMM (arm64_check_features() gets it from the
> read_sanitised_id_aa64dfr0_el1() reset handler).
> 
> Userspace discovers that it can write these fields by issuing a
> KVM_ARM_GET_REG_WRITABLE_MASKS ioctl.
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
>   arch/arm64/kvm/guest.c    |  2 ++
>   arch/arm64/kvm/rme.c      |  3 +++
>   arch/arm64/kvm/sys_regs.c | 17 +++++++++++------
>   3 files changed, 16 insertions(+), 6 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


