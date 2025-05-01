Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2E05C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 02:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O0f0P0r46I4wQ1N14Wr4dQIPr/ky0+9o8c+Aikg6Uic=; b=ds0ipdAWDGMcsJoH7VsyLoXt1h
	SbPCTYZQ5jy8uTqQhwLoSNU4jLfWEBgGUw/eC2SDEat3KKNN1VDpKd3tcQb9HetDEKbWd31pefA6C
	VocdIoR0zxOOB8LsSwbu31L8batrTD1OIY8ZSodB95AkyTQmFUSnWJA5n63OOu4UiGC5Ky89/KSH2
	0sbEqUD2u4Oqv+Rp1GuykuBo7DnKYS/v02AeeQ7IOB2q5q9Sg39d6sBc/PuD0sSjO68p4ZCUaLL2l
	ollYoiuLmlblCs2UnU+QAbGsFE9EwAEvI01pLva2eb0CYiDMQcUmj6GtDFnxZ2/zuY/UUuAEEgUaJ
	hrz9gu/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAK6s-0000000EZgG-2Quw;
	Thu, 01 May 2025 02:57:14 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAK4v-0000000EZYt-1OAO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 02:55:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746068111;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O0f0P0r46I4wQ1N14Wr4dQIPr/ky0+9o8c+Aikg6Uic=;
	b=LgKxJBlVJEzOSMcyBt3gOG1eYBY3oWbjf9b55cBqgfly6gqec6XPDppZ8GOB62fA4i2i2j
	maqRDc9tjcD/ejF8TI7KSUHD/J4ThTHpWrgogK/2AqEkBSc6FfRUtHgXARXXOqEHBd4f09
	eQ4n6x+hLhw4218IbC9PWyAl4cf4h+A=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-439-ztV0BxVWOD6BzQ-wS-_Zbw-1; Wed, 30 Apr 2025 22:55:09 -0400
X-MC-Unique: ztV0BxVWOD6BzQ-wS-_Zbw-1
X-Mimecast-MFC-AGG-ID: ztV0BxVWOD6BzQ-wS-_Zbw_1746068109
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-739764217ecso526337b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Apr 2025 19:55:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746068109; x=1746672909;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O0f0P0r46I4wQ1N14Wr4dQIPr/ky0+9o8c+Aikg6Uic=;
        b=NXuxf0iM3jGM4upAN49wbl4tU/BCS5k9QNgyxdRccqbQ69iRGBMNS3bVQU0GqyK3ZI
         FQxgqL1ERfjLs5t6Y1BJ/BDGPVMU1ntxipAqeYEDHqRtzh2O6xn3ecroNH5MIi70Ug06
         P+f8hYCAZnveEtSAirTebcRjwxaDVNRNYRAZLeFKzpgznOwkkFZwmZMqGo6nfe5Ys4RO
         2ijWVWXlwBeyeb8jBvt/Z5vunk9iHQHHx22MDAdl9KMqz0584G8KOJpUTg7FZZLYUAt4
         lVVnkquzs4v9yqNrhwipsftEaWWwki1KjOHYx6rXhBoA3a8wYOkIdYatU/ATQM+6O99/
         eWhQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXLCDG+YlX4lrwMEyfO98Mwkp1gdxQILEDs1PfGhb5dU1c7y2lQVWKF1gNYI366RX343d99tcHsChbt5xL/VWT@lists.infradead.org
X-Gm-Message-State: AOJu0YzPV1bk9LRVELE8+sNuLqxxVON0khFXXVc2A593SAaH0PHQcrna
	QYpwm9aRiIlgY+MCN1+HS7cOVW0VoAtcVXuAIo1FrnT+MzWPSsPrC2dyHIsMmLEoL8dEHD9G2fC
	QVZZLOFgfoklET9pwxcUnb3E40S/ByU5U1rpg8JUDtQ2sRJsJV6QB6JlICtxb7nKUi80QsyAA
X-Gm-Gg: ASbGncvQEbgJZlODz055G80A0NRqOonfpdqRsrafnyk5v0WPELIzztVTkaQDo8BbNj/
	nhD7HsuJqA3AHGC/4DA+LzIi1A8CyWhfPtA2wAUzsQTA8NVZBRDHQLc59LYE+lCpm2wILBcZGtK
	lSQKXLJe0nSIXoZP2/e6gxgCDefyWN5npkO3GUv6GRau9rcRKjnEUpGsAmwhpJ8ltOBh1ZuNa3R
	dX6Zq3IZn5sJk9LfUSPsln9iSPBLgxBIzFf3yty7XRR/xGWM6Di1FtMNtnZvZqO+VSiQ15iruwh
	RIzzIqJwsY6d
X-Received: by 2002:a05:6a00:35c8:b0:736:bced:f4cf with SMTP id d2e1a72fcca58-7404927930fmr1396639b3a.0.1746068108748;
        Wed, 30 Apr 2025 19:55:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFylzKnp6diohi3udmCDZ47tP/kvpo9wyUKWLV/9Fl+cS6PnVhqYmglGK+RzeWLQDfWNo9YJQ==
X-Received: by 2002:a05:6a00:35c8:b0:736:bced:f4cf with SMTP id d2e1a72fcca58-7404927930fmr1396611b3a.0.1746068108438;
        Wed, 30 Apr 2025 19:55:08 -0700 (PDT)
Received: from [192.168.68.51] ([180.233.125.65])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74039a60016sm2536538b3a.133.2025.04.30.19.55.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 19:55:07 -0700 (PDT)
Message-ID: <770205d5-8c08-497d-b862-1be4852ae665@redhat.com>
Date: Thu, 1 May 2025 12:54:59 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 22/43] KVM: arm64: Validate register access for a Realm
 VM
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
References: <20250416134208.383984-1-steven.price@arm.com>
 <20250416134208.383984-23-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250416134208.383984-23-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6LNCCD3xZ26-lfvA04fKwHEYSDZgTCJb_YMtQ7_QrsY_1746068109
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_195513_465133_DB95AF60 
X-CRM114-Status: GOOD (  14.68  )
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

On 4/16/25 11:41 PM, Steven Price wrote:
> The RMM only allows setting the GPRS (x0-x30) and PC for a realm
> guest. Check this in kvm_arm_set_reg() so that the VMM can receive a
> suitable error return if other registers are written to.
> 
> The RMM makes similar restrictions for reading of the guest's registers
> (this is *confidential* compute after all), however we don't impose the
> restriction here. This allows the VMM to read (stale) values from the
> registers which might be useful to read back the initial values even if
> the RMM doesn't provide the latest version. For migration of a realm VM,
> a new interface will be needed so that the VMM can receive an
> (encrypted) blob of the VM's state.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> Changes since v5:
>   * Upper GPRS can be set as part of a HOST_CALL return, so fix up the
>     test to allow them.
> ---
>   arch/arm64/kvm/guest.c | 40 ++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 40 insertions(+)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


