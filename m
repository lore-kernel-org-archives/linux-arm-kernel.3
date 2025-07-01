Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D238FC8302F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 07:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nh2uVd7pRoUTCK6irPkfWlzRluxl2PTNeAPLCnx0f8I=; b=r61nsqPElyrSlNOA03dQdSv6ul
	p2z87wo2wKwOsJc3x9j+sn5sPYiXl+u/19D8+9pawT1N6qc8uKIvy6BnNDbOWobj/Au6U48/S2H9T
	WGMRQgcRApq/7AQ8LdqRVUV+cIS5yC90tQc13yykWpcIa0xSKiKaB6kVdTzFEtzhLxn3S9SIVlbMF
	7ngvQTG+ac47fTYZHdJcWRfuCKY24748vRhxExbcqb18qSkyfYSR2jbN+569GcQwk+ja6EA2pzfDu
	douzyPwPg2GvT/n1FSUCCjnKY0ycp8ufKbvMfr7fywys04c9TS0BUj0lc7OJwE/PR/Sddg5prXvaH
	9Ec7kjvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWVQN-00000004GrR-3H4c;
	Tue, 01 Jul 2025 07:29:03 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWUh9-00000004BGC-0NJF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 06:42:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751352138;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nh2uVd7pRoUTCK6irPkfWlzRluxl2PTNeAPLCnx0f8I=;
	b=Tet3ugo9UlS1WJGm4LsW3g+HFDbcQpOWxsHKguD91f7ASiluLY04umERmV9EeOLxVpQQ9q
	R20u0dLQFiDxyRDoORk39PbYEGf669nP18Om3HYYNwXW6MGyezu3kvFy8hc8akPJCTdp8d
	O17Jh9g82wSH5UREIAbx2a+ppxWBzjQ=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-473-IALJ_pxIMQ-EXxkULhztSg-1; Tue, 01 Jul 2025 02:42:15 -0400
X-MC-Unique: IALJ_pxIMQ-EXxkULhztSg-1
X-Mimecast-MFC-AGG-ID: IALJ_pxIMQ-EXxkULhztSg_1751352134
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-235e3f93687so42868215ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Jun 2025 23:42:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751352134; x=1751956934;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nh2uVd7pRoUTCK6irPkfWlzRluxl2PTNeAPLCnx0f8I=;
        b=LbZzLVmtQw27K7TKPtgQF/5qRZa4K92bA+UFalw4pQYUi5eWj5/Fgm1WnCmQWkSPWz
         DJ+rHpk8brBHei663VQjgwDpdQ7hHXJkYhT+V5z4J2P+XOs62msaz0QFdOc4jnsCHDkC
         EcgRibvy+1maDDqP0j5FMA5uN+WUlSAfoG5nmBbusgDBe+lXAMLV89Jv4o5/tImHR0U8
         T4kcLOljP+YtUxvTsUstugqTukPkL0/weXu35mYNN0tPvxpVRdXVfzt2SbiFAeI+b1Sb
         R/QqXZs9Aap9v42/rN6sZaYUfTRmFUwCe8NLPWexIhXKo5rlbmhBDS6bzsRSLI29V/oV
         WKhw==
X-Forwarded-Encrypted: i=1; AJvYcCVswgXKYvu8Xcb2YC3xHCqsptabtIIeUPAb9FMK2zWOGGg5LfVgDvmXNhuGprhDaNHYnPp6SfBYZ2WhO7caZjB4@lists.infradead.org
X-Gm-Message-State: AOJu0YyBVYdkUpRKIr/VBip9xn3i2/kRGUYLfROCDMX+IrK+IduIcWH7
	Fwj2nFW/Vr+TlOFDa0ENkQoogR02IkYr0GPOt5lVPpcri+20wt/QwtRP3l0K8fLS8roov66GJMB
	zPWED2roamXR8exdb2wgBLsTqMnfc5QronYPmp0B7gOXytZoV+LDQ4YwBQre6aafZ20BjGlAw8l
	K1
X-Gm-Gg: ASbGnctxtoecIXuMxorFfBlVN1dvU1bydbF13fP8/wGFqKtdSVXt2snbXv8giZuZzIB
	4FApTRz8b+lMyRt/sA3jb+g0oCc3OnnHo4hFmOqoAtQ1Y5ZuLprfCeYlixtsMzKRBXkZjlEd4Rt
	SmPJyIE0C7/g5UbYivJGivBS1xBwYlWb+EYcCfZbS4BSJXPkgarE1QwVjApEa7Ohqutgb7YiBUM
	36whwVwraokwnTVDbN2T1pNXiQkUW+2S+xEAp5rNZNlIPgJyUrnpHscLgEKkNgOQKAZSTTk9JDE
	LR2nKHf+Ri5+1JHSgOcJDv6Vmbe0q9hY4qVBOBpPEX90K4GnShwT/r7VCkKZ1A==
X-Received: by 2002:a17:903:1aab:b0:235:eefe:68f4 with SMTP id d9443c01a7336-23ac46066bcmr278419785ad.29.1751352134042;
        Mon, 30 Jun 2025 23:42:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHl2aE+m8eiWUtPLXKvS7q68VAQ4UGGYsv/Yl574znsMqgsWf8nwxSoY/4U5XcisW0xX3aQWQ==
X-Received: by 2002:a17:903:1aab:b0:235:eefe:68f4 with SMTP id d9443c01a7336-23ac46066bcmr278419475ad.29.1751352133719;
        Mon, 30 Jun 2025 23:42:13 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-62-5.mrk21.qld.optusnet.com.au. [175.34.62.5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3c689bsm97301335ad.224.2025.06.30.23.42.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 23:42:10 -0700 (PDT)
Message-ID: <5d520f90-f49d-4926-bc04-80979531aa11@redhat.com>
Date: Tue, 1 Jul 2025 16:42:01 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 14/43] KVM: arm64: Support timers in realm RECs
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
 <alpergun@google.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
 Emi Kisanuki <fj0570is@fujitsu.com>
References: <20250611104844.245235-1-steven.price@arm.com>
 <20250611104844.245235-15-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250611104844.245235-15-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: V1Db6nRI1I6C8_tYnhxn_SWqUBldEaax3WEV53A36bc_1751352134
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_234219_213790_F4D302A3 
X-CRM114-Status: GOOD (  14.10  )
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

On 6/11/25 8:48 PM, Steven Price wrote:
> The RMM keeps track of the timer while the realm REC is running, but on
> exit to the normal world KVM is responsible for handling the timers.
> 
> The RMM doesn't provide a mechanism to set the counter offset, so don't
> expose KVM_CAP_COUNTER_OFFSET for a realm VM.
> 
> A later patch adds the support for propagating the timer values from the
> exit data structure and calling kvm_realm_timers_update().
> 
> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> Changes since v7:
>   * Hide KVM_CAP_COUNTER_OFFSET for realm guests.
> ---
>   arch/arm64/kvm/arch_timer.c  | 48 +++++++++++++++++++++++++++++++++---
>   arch/arm64/kvm/arm.c         |  2 +-
>   include/kvm/arm_arch_timer.h |  2 ++
>   3 files changed, 47 insertions(+), 5 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


