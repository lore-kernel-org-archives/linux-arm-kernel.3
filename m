Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30048C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 01:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bnm2BczQeE+oTxQUkTu0mGWgYbP3KRiI/EZBYxWyGBw=; b=FUU3a9ez5vhKjs/+Z4WD14Lkfs
	VXcE/2oH18XI/yfHEIfeQsVATGrWpx+hFvGjNK1rb/yijAMwCLZ3GRVA9AE3fkg5XFq6SUiEHBAUV
	635cVwphofiIOdad3WxQCO+xSoFuqAmM0+e3hHwPmSNzZfdT/ubKHkfUw6cuXgXYPnrpdgiou/bFs
	rAArxbez4mjC2uksTau3UZPrJ0eURECl/VXSFSzqOreO0SQ3mKiHgpylHTOJHh849isXiZg7/g1CQ
	uq0SRKIGqhx6iy1CgQo+u+6JlaE9DnxE+aRM3jDHH2i6jYAKfTPxejBcpYRYrd/J5HFAuNtzVJU/v
	0ivwYoNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpGik-00000002itg-1yew;
	Tue, 04 Mar 2025 01:05:18 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpGh7-00000002iiV-3CrA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 01:03:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741050216;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bnm2BczQeE+oTxQUkTu0mGWgYbP3KRiI/EZBYxWyGBw=;
	b=E3gd43gT3HWq6LpqPb0Ge4U5+bokg2ld+ROxIZprq/iMHQuJdggwQpep6cNEO/UVsF8i5l
	c+RrHOAitu+9YJBkXmisCvBZdbjD/9CYq4dp8m+8aPlPxoqN6HhY/2g90qrpGrHM7OcIXK
	Dhx5sYnobzH3MRIzrnI7kwbufQ5Wi+I=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-441-osPxg6TgOtqgV0b4mGc7eg-1; Mon, 03 Mar 2025 20:03:33 -0500
X-MC-Unique: osPxg6TgOtqgV0b4mGc7eg-1
X-Mimecast-MFC-AGG-ID: osPxg6TgOtqgV0b4mGc7eg_1741050212
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2fe8fdfdd94so9920444a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 17:03:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741050212; x=1741655012;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bnm2BczQeE+oTxQUkTu0mGWgYbP3KRiI/EZBYxWyGBw=;
        b=ZQug7nQ30R0odQnvhWaN7sjZjXb7G91b8adr4SIUyCCLAICshMSIK2+4pH65MzjHUn
         jS7r2/3p8Nz0kVWm8X8X1SxM4tKLigEHanfCv4v6C61TZ//EmXNjzcdVZf12tgwGPjV+
         bm5eCl9VVbLUPO2sZypGrKmIbFmRaEB09e3hrmphJmqsi9sONUVM7gSpAx6VgkVLCfDf
         G0kNnZYmEourdz5hnbWMDZG1W1rhOAuX4rZXZKTwNkp/sqYCXao1pPZ7Fven4GFoPRhg
         X2Jf7Q513+dnARK7EF2Q20aS0MDPILOM/ox589zOdJYbsV90H2em9oOHkASyDoLKltw/
         C38A==
X-Forwarded-Encrypted: i=1; AJvYcCUM4UJDx5uot4yGKF+MW7tz0pDyWGsLg9X+dXFg7UHMTOj8DuAGT5mHiD0sVDzqnu0HhF4o9SCwWOvCkqxuVkuu@lists.infradead.org
X-Gm-Message-State: AOJu0YyeOd5p7UeEnP5dB88uYw1zLkuf/dQLWmurnZX24HVaS8jPOlyF
	AwF5YbZdAYw24fbaXJrwJQL5mtLQjuN7wN6tMiO3H425GwKI8Ht4D+eknyzYt8VgY9qIHEsyEpb
	W7uiBcIixHkkyTtWIpZYwEIZ7t8XfSyi4R491fTTZmVhOGkwIcFHKk84v2+/PFLGQgEOBI016
X-Gm-Gg: ASbGncujSyYoDBGMatjyCiDXvpI4Jegs0xCBYwreWgPQxmb26zoHHD66EwlUNqD/Zl+
	G0NFSyzA7o5GO/jO5DiAk2aNDJ0pPt3VhPXA+xjDEfuQjQIsp00K8HHfkMF2yOTQ9ikWFOJCjRA
	XoMAQP3/cdQRPyHW+8ZSe+gKTK6T3HQLt4CIV2JxD9KXtxoF+6XqbORWunlme91udIUHyOhqVmg
	mNN/B9BXxVhzr+4Kiid8VNHqeXYeHffHWFgRDBjalWtqEQjr6+znZhZpCuD87R4G0YdbD0uOx7B
	Rp/RcGAjyWRY+Io9Gg==
X-Received: by 2002:a05:6a20:1594:b0:1ee:650b:ac22 with SMTP id adf61e73a8af0-1f2f4e4c8e2mr29503600637.40.1741050211923;
        Mon, 03 Mar 2025 17:03:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEh6O0/XBxWNy8f6zQpOsX8TWQ/teZrvIDTKOnq0U3+AlSWoqSQsK295l3GALc1XNoc+vUz9w==
X-Received: by 2002:a05:6a20:1594:b0:1ee:650b:ac22 with SMTP id adf61e73a8af0-1f2f4e4c8e2mr29503541637.40.1741050211560;
        Mon, 03 Mar 2025 17:03:31 -0800 (PST)
Received: from [192.168.68.55] ([180.233.125.164])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-aee7ddf2444sm9001374a12.3.2025.03.03.17.03.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Mar 2025 17:03:30 -0800 (PST)
Message-ID: <80983793-5df7-4828-96e8-90540e7d9183@redhat.com>
Date: Tue, 4 Mar 2025 11:03:21 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 17/45] arm64: RME: Handle realm enter/exit
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
 <20250213161426.102987-18-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250213161426.102987-18-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: UbcAN2kmGT5FJANiTYPDqXGBtTM6f6HG_1-Zkw0JAPo_1741050212
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_170337_896193_D78C7351 
X-CRM114-Status: GOOD (  28.54  )
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
> Entering a realm is done using a SMC call to the RMM. On exit the
> exit-codes need to be handled slightly differently to the normal KVM
> path so define our own functions for realm enter/exit and hook them
> in if the guest is a realm guest.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> Changes since v6:
>   * Use vcpu_err() rather than pr_err/kvm_err when there is an associated
>     vcpu to the error.
>   * Return -EFAULT for KVM_EXIT_MEMORY_FAULT as per the documentation for
>     this exit type.
>   * Split code handling a RIPAS change triggered by the guest to the
>     following patch.
> Changes since v5:
>   * For a RIPAS_CHANGE request from the guest perform the actual RIPAS
>     change on next entry rather than immediately on the exit. This allows
>     the VMM to 'reject' a RIPAS change by refusing to continue
>     scheduling.
> Changes since v4:
>   * Rename handle_rme_exit() to handle_rec_exit()
>   * Move the loop to copy registers into the REC enter structure from the
>     to rec_exit_handlers callbacks to kvm_rec_enter(). This fixes a bug
>     where the handler exits to user space and user space wants to modify
>     the GPRS.
>   * Some code rearrangement in rec_exit_ripas_change().
> Changes since v2:
>   * realm_set_ipa_state() now provides an output parameter for the
>     top_iap that was changed. Use this to signal the VMM with the correct
>     range that has been transitioned.
>   * Adapt to previous patch changes.
> ---
>   arch/arm64/include/asm/kvm_rme.h |   3 +
>   arch/arm64/kvm/Makefile          |   2 +-
>   arch/arm64/kvm/arm.c             |  19 +++-
>   arch/arm64/kvm/rme-exit.c        | 171 +++++++++++++++++++++++++++++++
>   arch/arm64/kvm/rme.c             |  19 ++++
>   5 files changed, 208 insertions(+), 6 deletions(-)
>   create mode 100644 arch/arm64/kvm/rme-exit.c
> 

With below nitpicks addressed:

Reviewed-by: Gavin Shan <gshan@redhat.com>

[...]

> diff --git a/arch/arm64/kvm/rme-exit.c b/arch/arm64/kvm/rme-exit.c
> new file mode 100644
> index 000000000000..aae1adefe1a3
> --- /dev/null
> +++ b/arch/arm64/kvm/rme-exit.c
> @@ -0,0 +1,171 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2023 ARM Ltd.
> + */
> +
> +#include <linux/kvm_host.h>
> +#include <kvm/arm_hypercalls.h>
> +#include <kvm/arm_psci.h>
> +
> +#include <asm/rmi_smc.h>
> +#include <asm/kvm_emulate.h>
> +#include <asm/kvm_rme.h>
> +#include <asm/kvm_mmu.h>
> +
> +typedef int (*exit_handler_fn)(struct kvm_vcpu *vcpu);
> +

Duplicated to exit_handler_fn, defined in handle_exit.c, need move the
definition to header file.

> +static int rec_exit_reason_notimpl(struct kvm_vcpu *vcpu)
> +{
> +	struct realm_rec *rec = &vcpu->arch.rec;
> +
> +	vcpu_err(vcpu, "Unhandled exit reason from realm (ESR: %#llx)\n",
> +		 rec->run->exit.esr);
> +	return -ENXIO;
> +}
> +
> +static int rec_exit_sync_dabt(struct kvm_vcpu *vcpu)
> +{
> +	return kvm_handle_guest_abort(vcpu);
> +}
> +
> +static int rec_exit_sync_iabt(struct kvm_vcpu *vcpu)
> +{
> +	struct realm_rec *rec = &vcpu->arch.rec;
> +
> +	vcpu_err(vcpu, "Unhandled instruction abort (ESR: %#llx).\n",
> +		 rec->run->exit.esr);
> +	return -ENXIO;
> +}
> +
> +static int rec_exit_sys_reg(struct kvm_vcpu *vcpu)
> +{
> +	struct realm_rec *rec = &vcpu->arch.rec;
> +	unsigned long esr = kvm_vcpu_get_esr(vcpu);
> +	int rt = kvm_vcpu_sys_get_rt(vcpu);
> +	bool is_write = !(esr & 1);
> +	int ret;
> +
> +	if (is_write)
> +		vcpu_set_reg(vcpu, rt, rec->run->exit.gprs[0]);
> +
> +	ret = kvm_handle_sys_reg(vcpu);
> +
> +	if (ret >= 0 && !is_write)
> +		rec->run->enter.gprs[0] = vcpu_get_reg(vcpu, rt);
> +

Unncessary blank line and the conditon isn't completely correct: kvm_handle_sys_reg()
should return 0 if the requested emulation fails, even it always returns 1 for now.

	ret = kvm_handle_sys_reg(vcpu);
	if (ret > 0 && !is_write)
		rec->run->enter.gprs[0] = vcpu_get_reg(vcpu, rt);

> +	return ret;
> +}
> +

[...]

Thanks,
Gavin


