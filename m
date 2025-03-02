Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 363B7C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Mar 2025 23:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nYg5YEi6qBDiPq4yW7kt5bdYtpCwTDMo82ocwV6poUo=; b=Dk2uMI+tbyRts0vt6guPQ4N8OY
	xEBidG3LbHiWEkM4699h11Oul+fPHJ96mF025fK9A3BRpyA6hThPJ9OAVG6fhNNo996CXP/tnL23S
	2/KezLuuw9ORrAfNeWOUesXF1HuC0psGSw6usVOzPDhpJCgIk0BgjHUEej7moE/uEwlpMM7dniT7a
	ZAacj49dOVS6VzEt6DqkKvjqnwybq/nPp0+Tv4yNqM76v7dzvjneHWn/p3q7lv7ZsBbRiwC3USHPO
	+d2lttWaHYCwqFhoux95E5MaScAu8V4pEAgHmJFfhank8Rkaqan+ALi37Pb3O+mYT+ZUdFcQGj+/2
	KIVg/NWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tot8I-0000000GpIc-0t61;
	Sun, 02 Mar 2025 23:54:06 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tot6i-0000000GpD9-1i6G
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Mar 2025 23:52:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740959547;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nYg5YEi6qBDiPq4yW7kt5bdYtpCwTDMo82ocwV6poUo=;
	b=dy/Kf97uRckBcae/SmD+JJol8QkB4+JsFRAR7ljNZFja8BteoLqBmWJOHz+FgYOsjbodLr
	l0i6YPhGaeSn+oPjOx8no2MsLL0LJXcPgXYc77HMlh9MXF+oilKLlg8LGCUhhUVbCThNlH
	Kzz66cURFp77xBi6y57nUpKgO5rvXro=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-138-c8SEZdPqMd6iZPhlKHCKjA-1; Sun, 02 Mar 2025 18:52:15 -0500
X-MC-Unique: c8SEZdPqMd6iZPhlKHCKjA-1
X-Mimecast-MFC-AGG-ID: c8SEZdPqMd6iZPhlKHCKjA_1740959534
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2feb4648d4dso10756374a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Mar 2025 15:52:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740959534; x=1741564334;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nYg5YEi6qBDiPq4yW7kt5bdYtpCwTDMo82ocwV6poUo=;
        b=mbv892O84hVkpaKmZ1ljiqd8Uwcnkt4QsJz0v/bRncOLgiuJZRur1U6X75Gj0F7ona
         mquG8xmblaQ3hCz5P4uTSyKVBepLqzl5G4cNaXxFD7Sjne/Mhdi/G+mrYiVkaYqFhN2/
         pNF2s/04zEZd5rLUszPjfd2NeF3nRXN5qJ6+xmUO/z/+8/SUuvoWbke8w13RShfNP7tc
         FbQBX2UZPlLHITvqO6+mYXuko1MFG+9RLjW1OUAYe8xhwiNIYYKNYk50qEf7PoCUBaAN
         ZcZ5dFMo70tCTN8Qf/o4Pyi0AnleeBsr8XVfIjQGNOeqxionse9Sjwbui/q7ZL8RzE9U
         dQLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZUCkQXnJL8etYlB8sGMNMiAKa55pchRczH9UmVF6ic9x0gNCLneZtHa8i2HbWzww2CRwGtNYUqaIkOHSW5I44@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2HEvsJbIC0tftZ9yq93v++NFA2dfa5CuOQ+wQmlV9KER08JW+
	cP4ia1tMJWGraw1zgJWhokjqS0gAhpoEpoa+t6OvrJoGY9mvQSX7O+wnggpo6lvAaAK8ib50fer
	Eioy9zJsPGBEkTea8lW7Gqbl50O412Wf+hdJmFZjafV0WdvCJkMdfPtJxpun715Ue/8z7g31R
X-Gm-Gg: ASbGncuM/8nixaptxkeZO8wDmkZfk4tL8Bw3mi93B7oYoMMWX81Vtb596ISpiLsIvgg
	NO5mPLJ+k3q08gH188N/+GcmrTePHfu7ByF6ElcxpL0laAtAAJZC2QxuV+46rPzrHMk/mQ3vX1r
	SjlEsUilKoZKCcIntMnF2aJYO+ndQbB8bUU/mRk0FdWQFlkrcCx5Jc8256FymoWR27nePP9DYbR
	1wc0HKvG0BFN1klmGONqjjflPlz/wXlra4CFKcnhEdclNyPTZGiIoQMN/U7bSC+AMuQdXk3bZY7
	/ZIsFL3MWo9neU8w/g==
X-Received: by 2002:aa7:8589:0:b0:736:2f20:9d1 with SMTP id d2e1a72fcca58-7362f200c33mr9917262b3a.23.1740959534555;
        Sun, 02 Mar 2025 15:52:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGKlHkk3X/xMjFSbabboBMi1iDhPso9R9B1xGAoC3vDIC/hJIAYOgl7Zpu+TUw2ZN+RUI7UGA==
X-Received: by 2002:aa7:8589:0:b0:736:2f20:9d1 with SMTP id d2e1a72fcca58-7362f200c33mr9917245b3a.23.1740959534256;
        Sun, 02 Mar 2025 15:52:14 -0800 (PST)
Received: from [192.168.68.55] ([180.233.125.164])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-734a003ec7esm7554622b3a.153.2025.03.02.15.52.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Mar 2025 15:52:13 -0800 (PST)
Message-ID: <7c217ce9-588e-4e4a-b395-2cd5d014487e@redhat.com>
Date: Mon, 3 Mar 2025 09:52:05 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 04/45] arm64: RME: Add SMC definitions for calling the
 RMM
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
 <20250213161426.102987-5-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250213161426.102987-5-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: gK2i1edwi_V5f7yLHjb55GGFFo4NdZV5zbDBEIg9d3s_1740959534
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250302_155228_527773_A08A2B9F 
X-CRM114-Status: GOOD (  21.45  )
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

On 2/14/25 2:13 AM, Steven Price wrote:
> The RMM (Realm Management Monitor) provides functionality that can be
> accessed by SMC calls from the host.
> 
> The SMC definitions are based on DEN0137[1] version 1.0-rel0
> 
> [1] https://developer.arm.com/documentation/den0137/1-0rel0/
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> Changes since v6:
>   * Renamed REC_ENTER_xxx defines to include 'FLAG' to make it obvious
>     these are flag values.
> Changes since v5:
>   * Sorted the SMC #defines by value.
>   * Renamed SMI_RxI_CALL to SMI_RMI_CALL since the macro is only used for
>     RMI calls.
>   * Renamed REC_GIC_NUM_LRS to REC_MAX_GIC_NUM_LRS since the actual
>     number of available list registers could be lower.
>   * Provided a define for the reserved fields of FeatureRegister0.
>   * Fix inconsistent names for padding fields.
> Changes since v4:
>   * Update to point to final released RMM spec.
>   * Minor rearrangements.
> Changes since v3:
>   * Update to match RMM spec v1.0-rel0-rc1.
> Changes since v2:
>   * Fix specification link.
>   * Rename rec_entry->rec_enter to match spec.
>   * Fix size of pmu_ovf_status to match spec.
> ---
>   arch/arm64/include/asm/rmi_smc.h | 259 +++++++++++++++++++++++++++++++
>   1 file changed, 259 insertions(+)
>   create mode 100644 arch/arm64/include/asm/rmi_smc.h
> 

One nitpick below, with it addressed:

Reviewed-by: Gavin Shan <gshan@redhat.com>

> diff --git a/arch/arm64/include/asm/rmi_smc.h b/arch/arm64/include/asm/rmi_smc.h
> new file mode 100644
> index 000000000000..f85a82072337
> --- /dev/null
> +++ b/arch/arm64/include/asm/rmi_smc.h
> @@ -0,0 +1,259 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2023-2024 ARM Ltd.
> + *
> + * The values and structures in this file are from the Realm Management Monitor
> + * specification (DEN0137) version 1.0-rel0:
> + * https://developer.arm.com/documentation/den0137/1-0rel0/
> + */
> +
> +#ifndef __ASM_RME_SMC_H
> +#define __ASM_RME_SMC_H
> +

#ifndef __ASM_RMI_SMC_H
#define __ASM_RMI_SMC_H


[...]

> +
> +struct rec_run {
> +	struct rec_enter enter;
> +	struct rec_exit exit;
> +};
> +
> +#endif

#endif /* __ASM_RMI_SMC_H */


