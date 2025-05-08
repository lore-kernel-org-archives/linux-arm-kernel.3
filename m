Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F8FBC3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 00:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9HgcA+GEZvObAcEh2COOJwVolQxRQjimAkm+36NZ3tU=; b=Moxdyp6gYlvPDdj5cVueP5bAHl
	AD1dFvmfh5BjjFLvlGg/eKJItEx2DT/qeCC1XZUKY01O5Xbsx+4BQ4LSREygaamyhtDgi5kl7oQ3K
	rTERiCXI/n1XLADRjFNV7LTSygyySbuyMjLQXCm5It4/i/1q+tHBjkHkB0XQCc9rqeQuMYvR1+0tk
	LDSNSoUZArmLcg+iB8+l6TwUoVFEnSld0YNfs4q/W9fnImIau3D7e6baDH1B7BJX6DiPqAjBhY5hX
	FvtRfpL+9Fgj0pjNyndmwkZjjeqCqmywyaEsicaQeNRztAkqnAfQSOdR68UXd3SgyhWsN5SesiTY5
	vWOPw0bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCp7t-0000000H27h-2eZ7;
	Thu, 08 May 2025 00:28:37 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCp4K-0000000H1hR-0xG2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 00:24:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746663893;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9HgcA+GEZvObAcEh2COOJwVolQxRQjimAkm+36NZ3tU=;
	b=dxcTpko4InSG7VWKO1Me1A8+Yv+OhaQhhZUtkpR2YasEGEEbN5pHFFGoDatkgCKkIvJJoO
	HwX6cuk3KpSbk4iXTcZACnn5e1azcCBgzfFf5xfKYwRB1bwEcR5Fu0Udz04LJNRamiOlwk
	xqHWoHHmEtD2iqN9XSxuL50rT6vRDJ0=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-668-KjwoIPoSNqCxy3P7uHsvRg-1; Wed, 07 May 2025 20:24:50 -0400
X-MC-Unique: KjwoIPoSNqCxy3P7uHsvRg-1
X-Mimecast-MFC-AGG-ID: KjwoIPoSNqCxy3P7uHsvRg_1746663890
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b090c7c2c6aso220128a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 May 2025 17:24:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746663890; x=1747268690;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9HgcA+GEZvObAcEh2COOJwVolQxRQjimAkm+36NZ3tU=;
        b=oNGqDuhCoaZ9nA9r5h3tp9Yutpeodmf7fdNdYzFsFgeQ2niSPYLr5iDesAX5kMU/FH
         2qWkED76HiBhvdv58zn0MRPghGmlsxdsYRYw70NVDXmI06mEy4iCv6lW7CBy5YliUFDE
         8NIiOqFZjEbmwEtjfI1urMTcNw1jgm3rmZ3qZtte3TIOwRUTaquiIahrFJslpDcJDrdi
         QireGdM+BhwKilL6C9UzNMTgADHgBsa4DSigddgtVk9kSUWGagOWhdT6BHgjK2yUe1Hi
         XA0XbC1RNvxK4HSIWhEUL4j2/zwcZ1QVSz6prZOH7e3I5m3juj2UnW7vNQaLZxZxUXVA
         ojvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWIwxfdpAK1WEabYW5OuIhWlbzqpKHtj1bkW5xoGat8aDo/Ni45buPMDHdmEr3iGtA3G7KiQ6ncvdpwbRgc/2U@lists.infradead.org
X-Gm-Message-State: AOJu0YwVCtLrz7JE75NvJovhQc+1rEkQa9fR2na9m83qOKdIlqiv8Z95
	kGUvKG6Fp7PX3fh8pIqLeRBNvkqmk587jTzXl38TV6WAflt1SzvzryEn9wc1nJNFTelkxspMWPy
	mFQHM51bRZZlicYgQna9FzwKp78xcu6wporiQ68r2JZwtohUcIVlq9qfLOG/LA2cDXwiVFEcX
X-Gm-Gg: ASbGnct7IlLMWpzl3NQMnxG/5DnMRen0ek4IMRsT15YDui71B7JqYWbZhpmvcsV/dFy
	867y7M8t0CJDU2mxtslxWi90++XqpL1obCjv4JWc0FuHg5WA7fv2FuvppQZkDLKinMmHU5Ko2zN
	lzB5J8TIV3ain8JJdMkEl6W/lz765tz1vxYgOzQCNq6s8WgZG4GCnGrsF01FY/qwMitIKJWm4ni
	Hz2W+J6n4YCyB+MmiwzdQArnginXUt+yn3vwVO8IAJenls3lJEa0Zu3QpYLPEN7sIRTzEdiBMHr
	NB8r4wuMC4P4
X-Received: by 2002:a05:6a20:ce47:b0:1f5:8153:93fb with SMTP id adf61e73a8af0-2148bc11565mr7275556637.10.1746663889870;
        Wed, 07 May 2025 17:24:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHkSEc0BIT0XhNYV17IYbaP5fkwntd9qeYQtp9PZH0RGNmeuFUv+jl9d36QtCKWb7HSgaLewg==
X-Received: by 2002:a05:6a20:ce47:b0:1f5:8153:93fb with SMTP id adf61e73a8af0-2148bc11565mr7275523637.10.1746663889500;
        Wed, 07 May 2025 17:24:49 -0700 (PDT)
Received: from [192.168.68.51] ([180.233.125.65])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fb3c697a6sm10158269a12.63.2025.05.07.17.24.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 May 2025 17:24:48 -0700 (PDT)
Message-ID: <5b8ea515-788e-44b8-b7d3-a85329b584dc@redhat.com>
Date: Thu, 8 May 2025 10:24:42 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] firmware: SDEI: Allow sdei initialization without
 ACPI_APEI_GHES
To: Huang Yiwei <quic_hyiwei@quicinc.com>, will@kernel.org,
 rafael@kernel.org, lenb@kernel.org, james.morse@arm.com,
 tony.luck@intel.com, bp@alien8.de
Cc: xueshuai@linux.alibaba.com, quic_aiquny@quicinc.com,
 quic_satyap@quicinc.com, linux-acpi@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@quicinc.com, kernel@oss.qualcomm.com
References: <20250507045757.2658795-1-quic_hyiwei@quicinc.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250507045757.2658795-1-quic_hyiwei@quicinc.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: fBo2UpH9yu2U3O_VyDDW9HlgF-4tBCcpbflbqKGCs7E_1746663890
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_172456_343101_3637E303 
X-CRM114-Status: GOOD (  17.01  )
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

On 5/7/25 2:57 PM, Huang Yiwei wrote:
> SDEI usually initialize with the ACPI table, but on platforms where
> ACPI is not used, the SDEI feature can still be used to handle
> specific firmware calls or other customized purposes. Therefore, it
> is not necessary for ARM_SDE_INTERFACE to depend on ACPI_APEI_GHES.
> 
> In commit dc4e8c07e9e2 ("ACPI: APEI: explicit init of HEST and GHES
> in acpi_init()"), to make APEI ready earlier, sdei_init was moved
> into acpi_ghes_init instead of being a standalone initcall, adding
> ACPI_APEI_GHES dependency to ARM_SDE_INTERFACE. This restricts the
> flexibility and usability of SDEI.
> 
> This patch corrects the dependency in Kconfig and splits sdei_init()
> into two separate functions: sdei_init() and acpi_sdei_init().
> sdei_init() will be called by arch_initcall and will only initialize
> the platform driver, while acpi_sdei_init() will initialize the
> device from acpi_ghes_init() when ACPI is ready. This allows the
> initialization of SDEI without ACPI_APEI_GHES enabled.
> 
> Fixes: dc4e8c07e9e2 ("ACPI: APEI: explicit init of HEST and GHES in apci_init()")
> Cc: Shuai Xue <xueshuai@linux.alibaba.com>
> Signed-off-by: Huang Yiwei <quic_hyiwei@quicinc.com>
> ---
>   drivers/acpi/apei/Kconfig   |  1 +
>   drivers/acpi/apei/ghes.c    |  2 +-
>   drivers/firmware/Kconfig    |  1 -
>   drivers/firmware/arm_sdei.c | 11 ++++++++---
>   include/linux/arm_sdei.h    |  4 ++--
>   5 files changed, 12 insertions(+), 7 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


