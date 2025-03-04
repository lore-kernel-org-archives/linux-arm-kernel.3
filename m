Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5009BC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 05:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lnsiIq7MCp7MkWvaBWDURZ2QmGy76WgJakR0X9oQlAA=; b=bBCfUZJXGLeigRrwXzo3rVi7av
	JT8+s7zhll68Ycl81JDqX6cctaUg3sgq/1D/PZLpNwgDU6pF9nc0HzO51EJvIlg1iBepOLEXZpEIa
	SvDub1LZB0byCpEl8sprcL4uCmCO75ThJsiytNhk81bgyNXBMEmUIeeq7WuqzyR7Pcnib+CoDItOP
	vGT4ikcT2d4t3rYkik745TgiilWCo4qjBeudDi4nwkVCpCJ7dxj4wzW/eLOAx+g+0nOeqecKHonA9
	947tys54Kc0UqY3K02gzz/f8rI/q2AIci0w/HQnbNoMuWLdVGfBshLr/jYP2/oPBTjLZM2xCHjFrB
	RqP11Kgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpL49-000000039va-14of;
	Tue, 04 Mar 2025 05:43:41 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpL0i-000000039RY-1glK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 05:40:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741066807;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lnsiIq7MCp7MkWvaBWDURZ2QmGy76WgJakR0X9oQlAA=;
	b=S8kOvKukWKvBtYXvW+Dgt7doRhe82PkpzuCMFZAaIgNyUxJOAwcw3LReUmAA2+gLNMpMW9
	S+r3GJSydQfiCcflw3yGyD9R2WehIbHEGqRHdK4dG5pFhJUFPprvvTowmhLtQtfAssbdg7
	VdbKBe5brrKobSPf45T/rqQJStQjLvs=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-101-yhHTqAI7NyONjhcgCQrTJQ-1; Tue, 04 Mar 2025 00:40:01 -0500
X-MC-Unique: yhHTqAI7NyONjhcgCQrTJQ-1
X-Mimecast-MFC-AGG-ID: yhHTqAI7NyONjhcgCQrTJQ_1741066800
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2233b154004so98885605ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 21:40:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741066800; x=1741671600;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lnsiIq7MCp7MkWvaBWDURZ2QmGy76WgJakR0X9oQlAA=;
        b=hjfhMt8ch/UqPUUi5VeU6CHzRavyGLaXrqN5XV3IHkDDbO9OcnT5cnIIMCLOb1eYTL
         HwRTpRV0kaSslN2PIKl8igBweGVFErptJgKjAHxIuP8edfRG5P+U6CKNykJgZqmyY/7J
         4eyYYhP+Tbj2cBrIyvsLjNTZcT8bSswSOdgDGVys0cNSvW/jJvQOh+rHBqAA474/kpb0
         pqEcZ3R20a/AiJIj/V/fme0dtOalMC2TUkeNwJMYW4urxYMVZF7CC18Ms0XkHH54Twu4
         3E8ydLMI1kBVE+bWqoVnO1Gju/T7OrF17r9beFH4aMchzwlHrz8WwX0mj97UrIkgw9GF
         cQvw==
X-Forwarded-Encrypted: i=1; AJvYcCW5VYKB4OVo1zGiNAWj35AWIWUbDH4rXMOIKOQ/1YPkr83bDdHvdvVI4N9MkCZpzqvU0I77wWz51A9ExA9qW0J0@lists.infradead.org
X-Gm-Message-State: AOJu0YwWmR5h7VZeeRYNeVnmMrxf1d0UBuGxtLt5lm+AV0e11xsPMwXL
	aL4jaMf+LEFewR4MVrEo+csylQ78GaI+DI78MgMeEZayfm5GMnkFlpZqxVf0NTJD80crK8gCnge
	LZJyA+T+9EE3S7h7ZQ6WmFdzh7Yc1dv5mwnpIlBDCH8NWGyjFqsndo1stYXp0V9kC3nZOW1mS
X-Gm-Gg: ASbGncvr5acKLJUEEcNBhF2CrIeq+lCosYquDATPQyzcjj62gxFFsK+F1DAg683HW2Z
	FDA3iVewVdSoBZQeVUKlzeJcRUbengFrYYaLLYH63s09d2tYddbEoMDSQVgSkw4MOeDbzOPEreN
	dfH5uIlqVsnNeHTXYtoN0eA3MOgh7fJpd16uyUYyS7A3r5+waxMwPHXT+65SQ2GfKvLfgofoGz5
	ZZw4FpATBpfNYtfbU1Da+gNtvjUHa4i4rvBotkhDrKsCCVlAwNMtsEb6eAqyDAiLmT87F3sfNXT
	L5MQCvAcX6C0WBCZZw==
X-Received: by 2002:a05:6a00:1e0f:b0:736:41ec:aaad with SMTP id d2e1a72fcca58-73641ecaf3cmr9917202b3a.14.1741066800341;
        Mon, 03 Mar 2025 21:40:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGLv+2IvaT9lpwd7y3NyeB6C4SRMHYy3586SBjSpdbcGPeX0DUdvbJ57X14h7Gm8kD4TRZ84g==
X-Received: by 2002:a05:6a00:1e0f:b0:736:41ec:aaad with SMTP id d2e1a72fcca58-73641ecaf3cmr9917181b3a.14.1741066799979;
        Mon, 03 Mar 2025 21:39:59 -0800 (PST)
Received: from [192.168.68.55] ([180.233.125.164])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7365bb4090csm2607097b3a.35.2025.03.03.21.39.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Mar 2025 21:39:59 -0800 (PST)
Message-ID: <bf568862-5435-4c88-9364-0190f30a3d9a@redhat.com>
Date: Tue, 4 Mar 2025 15:39:51 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 25/45] KVM: arm64: WARN on injected undef exceptions
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
 <20250213161426.102987-26-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250213161426.102987-26-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: hg7NCjo5F512HgDyt6RkD8XFL_TVdk18ski-QLSLvrM_1741066800
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_214008_517231_355BB0D4 
X-CRM114-Status: GOOD (  10.18  )
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
> The RMM doesn't allow injection of a undefined exception into a realm
> guest. Add a WARN to catch if this ever happens.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> Changes since v6:
>   * if (x) WARN(1, ...) makes no sense, just WARN(x, ...)!
> ---
>   arch/arm64/kvm/inject_fault.c | 1 +
>   1 file changed, 1 insertion(+)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


