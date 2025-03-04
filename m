Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB04BC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 06:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nYQ+hp2BxThyEpl72nHuJbwMjHhQjin3JtMynxdNsGU=; b=Wn/uPHwjsYinXAFwDEB3FoXaF7
	DTJybosy+j7WZj7eFOkeWilr6K9T8IxCPU8sPPx5jXFih2LYFYa3R0FA4pBBgCGKOS5ehoF+j4+JE
	y6UNY0HyUBDVWSWuN3A4ABiQyblUjkFqsn2iW7pLujzeqdhLNtvGpUJTo8Kp+9uvSnphsCMyhcJzQ
	67mKm7Ddgl0eCJjbLcBGlAKnDvwY2di869mnRqH4cd5IOay3lfdZlZKd9ZEy/H7GGaWAw9oiM8lwp
	HQb2RanIDQrrpOn8YblDlzObByIdvuv9HZZyKHArEqJOPV2CzZevkrozGrtbjX00gCDCGUdu5XN37
	zE/+M65g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpLOc-00000003BMi-2FoM;
	Tue, 04 Mar 2025 06:04:50 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpLN3-00000003B8j-1lTm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 06:03:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741068192;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nYQ+hp2BxThyEpl72nHuJbwMjHhQjin3JtMynxdNsGU=;
	b=fjilDK6rpNLhV/RWYpt0iRngQQ8/EnALK5FMUhLQp9tSHl4EAFVCwQDjfwZUV3wVgwDvf3
	Ow9o7Haypd9hQoyyjy0En5Hs7hlPI28EJrFjUSpYl5lkh78lAyrcLy9pKZrlin0zWc5Ia+
	yz4OloLN2wD51mqu9LJANUSlDFN9ZAM=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-79-MaaQuEYDNgqswH_XIJcjKQ-1; Tue, 04 Mar 2025 01:02:55 -0500
X-MC-Unique: MaaQuEYDNgqswH_XIJcjKQ-1
X-Mimecast-MFC-AGG-ID: MaaQuEYDNgqswH_XIJcjKQ_1741068174
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-22368fafed1so103201415ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 22:02:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741068174; x=1741672974;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nYQ+hp2BxThyEpl72nHuJbwMjHhQjin3JtMynxdNsGU=;
        b=oofb2EvfO1i2XgcWEje27n2Po5ttcE6qZNbefapr97j1l8KiF+3zZOizLKVBDMm4qH
         bP2celIZbD5wM0+3/DL66+TkOGFJ50N+CxEggMy11//U5WdlLFYgjzMW8xpFXR2tgCdT
         d8izR7ACeharz6L0M96HDWHP07USPiGy2DatnD7zq3humcjR0P8MTZiz1R2ct72UMMaA
         XVQKyQiM9FjCGVY3EtGKvhMA3GM9+7CLWVlZIQ6ERs2UvWoDX0VyEes8sIjC857wmmq8
         6ocofC8FFHrHpMGlWMQcnHY44hf1eRPmhqrhAEkXfQxsB6hp6HjBtb9kC4vo4cxLLtp5
         GHRw==
X-Forwarded-Encrypted: i=1; AJvYcCXDA9NkLp+PkK5iGq+LyTIJAZd+892ivkgNpVSPAyk74TdzbxVQ8U+rEUuL3H1f6d7UsfIxmYm0Dt8pUBH3+5aw@lists.infradead.org
X-Gm-Message-State: AOJu0YzOIr4/eeak93vAxWtX4rD2Eid4lTNo8XFNCOpdY00TfbUfxxVP
	uwgCFCrkUpnVU1R2EbC66o2Qp+Fo/l0IoCdz0LGumNWcEbiX7t5KFK35zAWsqxSS7NcFX1hXdCy
	tO57Xkcog1UfPigflwQuxoS5hsqVhxU87hGKyWU4suZ/vSPfEi1AsBWgAXfoA+Mkcbxx8En7W
X-Gm-Gg: ASbGncv8C5zT5f8f+pEbLhzYwGsgdq5l3c4l/dO/EuvSPBI/x2CiepgLd2Gnsan8TLU
	tEMo/SMqUN7Eqsuv+s9KW870VwXVk7BLajFcrTJe+eeDXtPu02v3Jsm+czNuIRZWmaZA1EObvu/
	HF5CJdu4N4txGdxm4diZbAnL89HAs0h3ve2zA0Tqx28e4D7VDUbBAdwH5hFMQdNCH3y4AgvcYvL
	GrVvxybtr/6V7F91WsCcuFt+VL68kBNulDlsqKYXVW/mUHVev8rBcFAPgPBrz9FfA7PpQZWiu2C
	8+vCP/YqLAEtp2C2Gg==
X-Received: by 2002:a17:902:e84a:b0:220:c143:90a0 with SMTP id d9443c01a7336-223690e0257mr268865305ad.24.1741068174597;
        Mon, 03 Mar 2025 22:02:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF17jp+SvVB8oKouybsWd/JrJXK2VcB5np1hjZzRt0dKWL0IvRPywYjYwGiuuPFEXE57B3yZw==
X-Received: by 2002:a17:902:e84a:b0:220:c143:90a0 with SMTP id d9443c01a7336-223690e0257mr268864905ad.24.1741068174278;
        Mon, 03 Mar 2025 22:02:54 -0800 (PST)
Received: from [192.168.68.55] ([180.233.125.164])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2234fdb5b02sm87962675ad.0.2025.03.03.22.02.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Mar 2025 22:02:53 -0800 (PST)
Message-ID: <5587ca83-bb19-42ae-8297-676588502e5e@redhat.com>
Date: Tue, 4 Mar 2025 16:02:45 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 29/45] arm64: rme: Allow checking SVE on VM instance
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>, Zenghui Yu <yuzenghui@huawei.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Joey Gouly <joey.gouly@arm.com>, Alexandru Elisei
 <alexandru.elisei@arm.com>, Christoffer Dall <christoffer.dall@arm.com>,
 Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun
 <alpergun@google.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>
References: <20250213161426.102987-1-steven.price@arm.com>
 <20250213161426.102987-30-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250213161426.102987-30-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2YY-E2vymPymlahAJ4OrbnXltzrzPYekwu8zZ5m0hic_1741068174
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_220313_538065_5A2B30A8 
X-CRM114-Status: GOOD (  12.06  )
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
> From: Suzuki K Poulose <suzuki.poulose@arm.com>
> 
> Given we have different types of VMs supported, check the
> support for SVE for the given instance of the VM to accurately
> report the status.
> 
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
>   arch/arm64/include/asm/kvm_rme.h | 2 ++
>   arch/arm64/kvm/arm.c             | 5 ++++-
>   arch/arm64/kvm/rme.c             | 5 +++++
>   3 files changed, 11 insertions(+), 1 deletion(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


