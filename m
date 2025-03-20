Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA2A5C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 09:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m7D4rqlmtfwr1EgAb/lUYH/aHJeqF4FrFxKoiXcpfuI=; b=tjuQ/a6xZbEtcAoNPXqMSvUU37
	QOPGgKWsPtA7fQlWFo9/JkhvE+XI2ovOsb51prf0DTVO0ZgVWKadPYByPJ4imMaWluV5zwM9FTbN1
	wbfY72YkrN8rWzXi1XO1FchykW0fG46FFbZ2tUdIaUAPY1HsPcu2TH4iypGHXww6SVQEAfgROSY70
	9hJiISQq7OM0QkhWMGihNglJBzehnpTQIWaSIyWiy3eELdflOJec9j6F3p1VP5FJMLYSFhmt5zLr4
	gGIJY2Nh3fWAtmBDfNtKRE6Jt30yw0j8r+n+aIQsKdJu/Ffq2Vt0Hw9VsjRx94loCXQ9IsSTE3OeM
	vMiVw2Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvCby-0000000Bki8-2r97;
	Thu, 20 Mar 2025 09:54:50 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvCaG-0000000Bkai-2t5s
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Mar 2025 09:53:06 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-223fd89d036so7944485ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Mar 2025 02:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1742464383; x=1743069183; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m7D4rqlmtfwr1EgAb/lUYH/aHJeqF4FrFxKoiXcpfuI=;
        b=IsgHgUIH0waiP1C4Eawxs9sRi6p2CeF730S0lh7leacL/hJahSOadh+8PnVa2Pj7Xo
         V7EeyEJWgMlT1T1dmhk3mDLW1/odNmQt+OmJFcEimslJu+V0jJNYmSxfHCHIt5soYI/H
         pFfGcj4VtIP7le/It+P3/mc1waa7isMBPtA1kr8Fd4uuu9NdU2nSAN1GukwivSSukOFv
         yg9vwsI72izqT1dH2kQRUE57f/IsvTz9lMmF6nRUfsbz5uq74hVTI3ecjjvdu6sa7v9D
         2Sd0cPV79VvMUGHTskNF31OTZsPbyO4MkeLR7XeBkgsihoUJwQ98HQSBMrzeGHmTnCha
         OWhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742464383; x=1743069183;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m7D4rqlmtfwr1EgAb/lUYH/aHJeqF4FrFxKoiXcpfuI=;
        b=voiOBm2SC7i1PedCYRwDFVqrlnXhDDQ+uWLfKLPFCZ+Dg0VR3QTospg+MD6k4tfE0h
         eDm8SOtC2JMlgQJOPZ59fGk/TD8CYya/Lc9MGnVwOT1FIKHeXMWLPoXioxUSh1XMBLi7
         unRkDJ9BEMxBX/fC46uLCzwvJRwVZH91HONWa0kKYr4NBK3TJeCMcupJTwmH7ROzcAtb
         ejBuFJtSqlq2ieBsFHuXxPgSMt57NxrU7ufTaGAEzapDQSWCZydAhwUrT5w05k98JNLp
         mnR3mZLOcjh+ePDZDv68D629Qm99F+4YYijZYHy5w8sO91z94BB2lQ7MnSVrOc1maMXY
         gZDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwQiIu46cXrO+44HmMreCnM92EmAgrDE1QjLLxSDwBgdwiz7EE3WCCpLDWXf0/n05O4DnCXDhnjw/xjy6URLi/@lists.infradead.org
X-Gm-Message-State: AOJu0YzwzcHh+WX+ElPeeFbTyrRsmbwdaurDufiH4kOpsBy07TUpWmPk
	07yVV/3d5u4tVsOGNh4k/xr8lA1qDVsL8OELQ05fakddMaC744LzEGb3ulF5+cx3mi62/ulEpqi
	mjHg=
X-Gm-Gg: ASbGnctQaGREdBsXrJ66rfzXtrFruV9KG+3l/adiOugIum8f5G4H/skK/bqCEnmzhUw
	wzFxyRqzwOH6SkJ+WbKUjvfwWdV4rEZ62XQ33+M/F4sqUyWu4MvAYkerA3M9gchkdNCtKH77WLg
	6TD7477t8LLNxZmCa3AL0o2O9uNLU3l5XRbhf5NwS7mN2dkb6xPrRMG7ki1fun6R1E0BHjswdEd
	V6eM/5FxAlvrUaDtzIQqfCkIjmn7ijpzl2t2NBVPcnL73MTNYnK09UJ9+V0vSYMS0anTyPuQV9B
	foAMbIIXGPbqTsgLEPMl4maPkCE9G6lQPCZRCgprnSYHHUu55MkP3GSOBQ==
X-Google-Smtp-Source: AGHT+IE3mIGDRFikUIqZ1qqXpt2WAHzRmavgaURSEY1rWIOdBI4jZWh2D1HIB2Ty4Cr8ew7b4T+ofQ==
X-Received: by 2002:a17:902:e810:b0:223:88af:2c30 with SMTP id d9443c01a7336-22649a30485mr90872845ad.16.1742464383534;
        Thu, 20 Mar 2025 02:53:03 -0700 (PDT)
Received: from [157.82.207.107] ([157.82.207.107])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6ba6d52sm130630135ad.116.2025.03.20.02.53.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Mar 2025 02:53:03 -0700 (PDT)
Message-ID: <ba9cd6d2-1ee5-478a-8102-42b4dac411ce@daynix.com>
Date: Thu, 20 Mar 2025 18:52:59 +0900
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
 <cd7b4528-34a3-4d87-9711-acc2c2e6f6e1@daynix.com>
 <86ldt0n9w1.wl-maz@kernel.org> <Z9sSMJAlf7cQ5viu@linux.dev>
 <0d84bc94-1c65-4737-a2eb-aa7f96a7d1e0@daynix.com>
 <86iko4m5i4.wl-maz@kernel.org>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <86iko4m5i4.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_025304_900799_661B0992 
X-CRM114-Status: GOOD (  21.47  )
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

On 2025/03/20 18:10, Marc Zyngier wrote:
> On Thu, 20 Mar 2025 06:03:35 +0000,
> Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
>>
>> On 2025/03/20 3:51, Oliver Upton wrote:
>>> On Wed, Mar 19, 2025 at 06:38:38PM +0000, Marc Zyngier wrote:
>>>> On Wed, 19 Mar 2025 11:51:21 +0000, Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
>>>>> What about setting the flag automatically when a user fails to pin
>>>>> vCPUs to CPUs that are covered by one PMU? There would be no change if
>>>>> a user correctly pins vCPUs as it is. Otherwise, they will see a
>>>>> correct feature set advertised to the guest and the cycle counter
>>>>> working.
>>>>
>>>> How do you know that the affinity is "correct"? VCPU affinity can be
>>>> changed at any time. I, for one, do not want my VMs to change
>>>> behaviour because I let the vcpus bounce around as the scheduler sees
>>>> fit.
>>
>> Checking the affinity when picking the default PMU; the vCPU affinity
>> is the only thing that rules the choice of the default PMU even now.
>>
>> Perhaps we may model the API as follows: introduce another "composite"
>> PMU that works on any core but only exposes the cycle counter. Robust
>> VMMs will choose it or one of hardware PMUs with
>> KVM_ARM_VCPU_PMU_V3_SET_PMU. KVM will choose the default PMU according
>> to the vCPU affinity at the point of KVM_ARM_VCPU_INIT otherwise. If
>> the affinity is covered by one hardware PMU, that PMU will be chosen
>> as the default. The "composite" PMU will be the default otherwise.
> 
> This makes no sense to me. A VCPU is always affine to a PMU, because
> we do not support configurations where only some CPUs have a PMU. This
> is an all-or-nothing situation.

At least isn't it fine to have the composite PMU with a new value for 
KVM_ARM_VCPU_PMU_V3_SET_PMU?

> 
> More importantly, you keep suggesting the same "new default", and I
> keep saying NO.
> 
> My position is clear: if you want a *new* behaviour, you *must* add a
> new flag that the VMM explicitly provides to enable this CC-only PMU.
> No change in default behaviour at all.
> 
> I'm not going to move from that.

Why not? It will not break anything guaranteed to work in the past.

Currently KVM only guarantees that the emulated PMU correctly counts 
only when
1) the vCPU affinity is contained by one PMU and
2) it will not expand

Breaking these conditions will make the behavior of the emulated PMU 
undefined. Now I'm proposing to remove 1).

Regards,
Akihiko Odaki

> 
> 	M.
> 


