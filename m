Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C85B7C35FFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 11:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2XjuEqbxb70zWO25+d3tN3N8uLlo3z0B0itj0TevOYE=; b=OvY0JbRxsdlUzsgIY4rBJvnLIb
	CoCvQQFl8px0I4RAQcFTxFSEizU4EOrbFOcK30TyPDVG6efpRJkRXpRSw8QREDnA1dpyoTKuwN+k+
	xkeL68CUX97RTYYVq/T3W2yDj6XqEL/jLMqphDJFbMRbbhrS3Ag0hXwwX5enNr1lydkQY/lJWy1rz
	pbjHw0TsJNum24U6AujBVDvE2HImqsYrAy4RRHeb95yRkPNHzoylEjawc17pGtLzFR7SLP8kQQmgs
	CE50VBONqtfrg6aGD0PfZzunm8e3On6ihqNqtl26OYgdzXDQr20oUPBpsqDtmD4gqXpCWIozg+J+e
	kkejl8Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1turyy-00000008t5b-1Mf5;
	Wed, 19 Mar 2025 11:53:12 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1turxH-00000008stb-08fi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 11:51:28 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2ff784dc055so7386280a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Mar 2025 04:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1742385086; x=1742989886; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2XjuEqbxb70zWO25+d3tN3N8uLlo3z0B0itj0TevOYE=;
        b=Ak50Q6J3CkJJeY6trnUpNn/bIuksCZg3oEOfoqfh3R3ED99Oo09aKozr9M5exY8an2
         3GSrxeFkQB1iRE/Bj0MO8VTjSurn5ZhN6laxigSVBK4NCmjMAYORDI38jHqPK4QAcSJB
         ysoHOYM11ME0vOhPj1uk+WAhU3Qq+cBx30/b+YtC7BR/3JqduyfAhPOSi7cYmrNsEjV+
         wLEotzo9BIcJ7RH8/kIl+eNp5R1h6rop6cyevKxcdok38WAT7qoUzVCaGSF+Y0t2Y07U
         FuRtMN8BpWS87+Pb+SzdK9C0CFBLGdUHucJZ6f9Is0k1mgOOMexvgaoP5WAzX6GTlglp
         vtRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742385086; x=1742989886;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2XjuEqbxb70zWO25+d3tN3N8uLlo3z0B0itj0TevOYE=;
        b=KRWRs6IckMxAyRxqwN9vN/ar1DpDruflE4P9gKXkahhjXS8S20xTTRmlIDiGkTswcX
         /cAkf3B9ufX0rGvUaeqfIxJyKdT2rqFTmzQp1CvxS5BsfUkcbYwnWCMAR6/s/Bvg2vpK
         DfCksDQZGiyC30rYL1gOfBtQ2LaZLHXS+VZJEFwB91+DmJoO89KGrSgBHay6ikWxi004
         iCMK5iDLbift2BAxe5xhd/82f62DudYWKfpmeuK//Jtado92WLPcndhc33tvDvMGGT2R
         b3pUu9xRXNyKZM71dFTImqYJswOMwXWiQebkgaX3MBBHqWkRVWGqUMuyXu5KaflK3Uu0
         8aaA==
X-Forwarded-Encrypted: i=1; AJvYcCUHgPD1MytbB+zMuc0Cyd/KnFLsNAGddZaG58QjiLYkXx+or8SUP2hcNxH5fX4A9HeK4EPy9evkXpt9KPHy8r9m@lists.infradead.org
X-Gm-Message-State: AOJu0YwP5Y22aChFXNyKWKrgVPrIP66lLIU1SFJk6ZZjz+S69m6adoRy
	u5bUFLneqhH+26aCzPLG59IhPjo/0PSlVAS1EExMB+LbGVwV9Qll06AVE2RbKtc=
X-Gm-Gg: ASbGnctvItbi2blI1DafPz+fukYGBQIj3pIBeYGgyxrHZYZYHZev0P/6OvJg/J4Vqs3
	QPncG/PiOwh6/MAQJYDcTeHlv9679SqMSm6oRl6t+7w03J7e4DeGzXbK9xOBv9H6flH/60WDQ8G
	YEv6XjoIq/3OJE2x8WUZUO0ZW2XAOrlHRvWsfHwT1TmJmbxM42vMUBQNou1kJlgSY22B36UOLjB
	zH4mJRb9ruyB6CLUDGlYnHhBxLF8kGdzgbD/LQJVq439xe9/e89qpVYx2fnF96sCIC3UsE7/G9c
	Dxr3zaBlQ8LdrmKGw+4Udi20zwXIw0SKUmwd2it4A8eKO6ZYSGqf4kuwgYgItG+zawYy
X-Google-Smtp-Source: AGHT+IGhjZrvNsCHZE3eGjx1ElWi189KImICdnFKn/7uc1+V/eDwoskYfYeRmlItwFCzuuJKYXSmdQ==
X-Received: by 2002:a17:90b:4a47:b0:2fe:84d6:cdf9 with SMTP id 98e67ed59e1d1-301be200c7bmr3227168a91.26.1742385086353;
        Wed, 19 Mar 2025 04:51:26 -0700 (PDT)
Received: from [157.82.207.107] ([157.82.207.107])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301bf5b799dsm1336508a91.31.2025.03.19.04.51.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Mar 2025 04:51:25 -0700 (PDT)
Message-ID: <cd7b4528-34a3-4d87-9711-acc2c2e6f6e1@daynix.com>
Date: Wed, 19 Mar 2025 20:51:21 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] KVM: arm64: PMU: Use multiple host PMUs
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
 devel@daynix.com
References: <20250319-hybrid-v1-1-4d1ada10e705@daynix.com>
 <Z9pze3J2_zrTk_yC@linux.dev>
 <e8324d9d-3756-41cf-a102-28572e302368@daynix.com>
 <86plidmjwh.wl-maz@kernel.org>
 <bd681ec6-0b4c-47d9-8a4a-b7324c0883a6@daynix.com>
 <86o6xxmg87.wl-maz@kernel.org>
 <aabd71eb-286b-475c-a30e-d5cf5c4f2769@daynix.com>
 <86msdhmemw.wl-maz@kernel.org>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <86msdhmemw.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_045127_074091_79FC567C 
X-CRM114-Status: GOOD (  19.90  )
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

On 2025/03/19 20:41, Marc Zyngier wrote:
> On Wed, 19 Mar 2025 11:26:18 +0000,
> Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
>>
>> On 2025/03/19 20:07, Marc Zyngier wrote:
>>> On Wed, 19 Mar 2025 10:26:57 +0000,
>>>>
>>> But that'd be a new ABI, which again would require buy-in from
>>> userspace.  Maybe there is scope for an all CPUs, cycle-counter only
>>> PMUv3 exposed to the guest, but that cannot be set automatically, as
>>> we would otherwise regress existing setups.
>>>
>>> At this stage, and given that you need to change userspace, I'm not
>>> sure what the best course of action is.
>>
>> Having an explicit flag for the userspace is fine for QEMU, which I
>> care. It can flip the flag if and only if threads are not pinned to
>> one PMU and the machine is a new setup.
>>
>> I also wonder what regression you think setting it automatically causes.
> 
> The current behaviour is that if you don't specify anything other than
> creating a PMUv3 (without KVM_ARM_VCPU_PMU_V3_SET_PMU), you get *some*
> PMU, and userspace is responsible for running the vcpu on CPUs that
> will implement that PMU. When if does, all the counters, all the
> events are valid. If it doesn't, nothing counts, but the
> counters/events are still valid.
> 
> If you now add this flag automatically, the guest doesn't see the full
> PMU anymore. Only the cycle counter. That's the regression.

What about setting the flag automatically when a user fails to pin vCPUs 
to CPUs that are covered by one PMU? There would be no change if a user 
correctly pins vCPUs as it is. Otherwise, they will see a correct 
feature set advertised to the guest and the cycle counter working.

Regards,
Akihiko Odaki

> 
> Thanks,
> 
> 	M.
> 


