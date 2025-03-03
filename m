Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10EF8C282C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 03:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IEDc5a+qaJ461fEOorI0aPSdSVAqOPF0WWp/svcyhEc=; b=CG5s5JljzC4w/evt3TnBuyoZ6G
	tHHKN8SkZOqVMcGvXpw8UZheoah2Qff4AB/6U+Y9P/w8H6z9loDGIVyq1bSX8JTryxyco4M9P/lzY
	WWNPIPasGCxzWHVcqNFzX1hGMKDIH0JsjHAFYdCmqKMqYkGgxGIm8U0D4Lf9yUKpVNUv0FvovY6lQ
	pcs7wYq5hp+/vcpQjuj7Yepb472qlPDTb2sEdi2DAivJYW4goko3El6Jctm6VWAhZ1PqDP4JDTPkD
	8Ni+z8YiGuOtQS/QD47+k++yBnw7bLAje9ly0kER3KXH5VDSVHftXerM/jE7ZfVZ+slG1KFDKftcT
	bWVQxgdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1towo0-0000000H6uq-2KDC;
	Mon, 03 Mar 2025 03:49:24 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1towhX-0000000H5i6-21Gx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 03:42:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740973361;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IEDc5a+qaJ461fEOorI0aPSdSVAqOPF0WWp/svcyhEc=;
	b=DJsj5rx8ZbDQsSTTP/4aBlOaErwxdWkBa3o1ySXbKx33ZQ7/I/NLXAAyt1mYlZycikg0Sa
	Dnz7bRmtB0QkVQglo3GYDyIJ4T6I6IOcyCQgG33/4GOp08yubCtU9XaBuRG/uNzBNvTlEU
	2jUnaAx5IuXTivuRzrX4injBpJnfhoY=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-266-Qsscg5eSOIeBHdF5obUP8A-1; Sun, 02 Mar 2025 22:42:39 -0500
X-MC-Unique: Qsscg5eSOIeBHdF5obUP8A-1
X-Mimecast-MFC-AGG-ID: Qsscg5eSOIeBHdF5obUP8A_1740973358
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2fec3e38b60so4247053a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Mar 2025 19:42:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740973358; x=1741578158;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IEDc5a+qaJ461fEOorI0aPSdSVAqOPF0WWp/svcyhEc=;
        b=fh6flN87WgyQOJkiBMPInjKsdo5EAtRfl665AUqPJwkGsSqhXsRaiaR7VR5Cid8H3g
         Q7j4yGcf3wCQsZfO7s+pbvRW8cCz1G0zZDLKwOMXRewWH1VYsl4HxowHCMAKgH2IudXa
         UCV2QlvD+v4Zi1od+8CKoA+4adLPg9lHZ/jpf7I8AQT3YyUWazycfoEtgRNcD3sFkjzD
         YUw+8pcIHjcWC25CqQim/5mQM7zPSiM46/+tr0YxXcObGA+4jig/OKStbqoKN2LQcGeo
         EPEVfM9B0YujCj5Yd9etChXPFh1m80ZcwqkK8iRnqFlNU4uJo9HC3bzC71TO4i3/DSkx
         frLg==
X-Forwarded-Encrypted: i=1; AJvYcCU2TFaFVN/FtFooybcvVHievu68YdceeiObTTULo6KQbE1mZNRAGS4SDpTIgeflNoLd9IzhfMPl7dYUVThx+jzz@lists.infradead.org
X-Gm-Message-State: AOJu0Yy//klOycce4rKrBIRY8XbPdhMUVe+ZoMGykfFbnkAtpE/aFtNb
	Ll1xKGB9fQ21ADZkjtMzjY9A0rFqzfy/jqb6p0cv/9Q12G/Jr/msXd1Tt8ThnuleWhlm9B+IPQb
	qvgVDzqWOwYpr0JH2zYhm/66DHDNdD4iEmLDxPrzFVGpt/mGY6y0pyFBHf00Xrb12s6f+N+DB
X-Gm-Gg: ASbGncuwEJQhbAaLyyC5KxTSE8TabgC44ZUXDAlxkmggzKYthl7/r3/4pNpiBwIf0OL
	Ww4B3FLGjsxrNUM95qSD9A7i4eUEhcPEI+nFRsfBaD4Fr5VNYZ/gNoAvfIw6GQO+8+9bqa2KWip
	iV1Q/2ZzaNALWq/fb0d8yTgd9tFQkUDZ5AJkrR6AjUy7I+NA0jhkXtuW90DwfPL5Jh5KcEe2g/V
	hYL2okqxzDD4wrTi4eoQZ1FHkhYdZPv0tI34iLpSJaH8+uKnfNa2OmPJxgloZb4e6LLyxgSIUzn
	O1LG26xhvuYUVUMuIg==
X-Received: by 2002:a05:6a20:1585:b0:1f0:e708:56e2 with SMTP id adf61e73a8af0-1f2f4cffa11mr18287096637.22.1740973358568;
        Sun, 02 Mar 2025 19:42:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF5c7Qc3VVFcg30Esq5DIzJh6RfeW5P5eI8KFXRrs6oJHF3s/m+eXSunL5iyzYk2nV2q0PqZA==
X-Received: by 2002:a05:6a20:1585:b0:1f0:e708:56e2 with SMTP id adf61e73a8af0-1f2f4cffa11mr18287060637.22.1740973358238;
        Sun, 02 Mar 2025 19:42:38 -0800 (PST)
Received: from [192.168.68.55] ([180.233.125.164])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7362e3b1c61sm4421335b3a.22.2025.03.02.19.42.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Mar 2025 19:42:37 -0800 (PST)
Message-ID: <8f08b96b-8219-4d51-8f46-bc367bbf2031@redhat.com>
Date: Mon, 3 Mar 2025 13:42:29 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 05/45] arm64: RME: Add wrappers for RMI calls
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
 <20250213161426.102987-6-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250213161426.102987-6-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: KrJ6znx-40RR9gGQtCKaY5FDUPuvEVlVYc-4_g3s93M_1740973358
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250302_194243_612743_1132E99F 
X-CRM114-Status: GOOD (  22.73  )
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
> The wrappers make the call sites easier to read and deal with the
> boiler plate of handling the error codes from the RMM.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> Changes from v5:
>   * Further improve comments
> Changes from v4:
>   * Improve comments
> Changes from v2:
>   * Make output arguments optional.
>   * Mask RIPAS value rmi_rtt_read_entry()
>   * Drop unused rmi_rtt_get_phys()
> ---
>   arch/arm64/include/asm/rmi_cmds.h | 508 ++++++++++++++++++++++++++++++
>   1 file changed, 508 insertions(+)
>   create mode 100644 arch/arm64/include/asm/rmi_cmds.h
> 

With the following nitpicks addressed:

Reviewed-by: Gavin Shan <gshan@redhat.com>

> diff --git a/arch/arm64/include/asm/rmi_cmds.h b/arch/arm64/include/asm/rmi_cmds.h
> new file mode 100644
> index 000000000000..043b7ff278ee
> --- /dev/null
> +++ b/arch/arm64/include/asm/rmi_cmds.h
> @@ -0,0 +1,508 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2023 ARM Ltd.
> + */
> +
> +#ifndef __ASM_RMI_CMDS_H
> +#define __ASM_RMI_CMDS_H
> +

[...]

> +
> +/**
> + * rmi_rec_aux_count() - Get number of auxiliary granules required
> + * @rd: PA of the RD
> + * @aux_count: Number of pages written to this pointer
                   ^^^^^^^^^^^^^^^
                   Number of granules
> + *
> + * A REC may require extra auxiliary pages to be delegated for the RMM to
                                         ^^^^^
                                         granules

> + * store metadata (not visible to the normal world) in. This function provides
> + * the number of pages that are required.
                     ^^^^^
                     granules
> + *
> + * Return: RMI return code
> + */
> +static inline int rmi_rec_aux_count(unsigned long rd, unsigned long *aux_count)
> +{
> +	struct arm_smccc_res res;
> +
> +	arm_smccc_1_1_invoke(SMC_RMI_REC_AUX_COUNT, rd, &res);
> +
> +	if (aux_count)
> +		*aux_count = res.a1;
> +	return res.a0;
> +}
> +
> +/**
> + * rmi_rec_create() - Create a REC
> + * @rd: PA of the RD
> + * @rec: PA of the target REC
> + * @params_ptr: PA of REC parameters
> + *
> + * Create a REC using the parameters specified in the struct rec_params pointed
> + * to by @params_ptr.
> + *
> + * Return: RMI return code
> + */
> +static inline int rmi_rec_create(unsigned long rd, unsigned long rec,
> +				 unsigned long params_ptr)
> +{
> +	struct arm_smccc_res res;
> +
> +	arm_smccc_1_1_invoke(SMC_RMI_REC_CREATE, rd, rec, params_ptr, &res);
> +
> +	return res.a0;
> +}
> +

'params_ptr' may be renamed to 'params'.


[...]
> +#endif /* __ASM_RMI_CMDS_H */

Thanks,
Gavin


