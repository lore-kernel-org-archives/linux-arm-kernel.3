Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12A4AD1037B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 10:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bxza/3SKXHd409Aa8RQXPAQ4jTblvmLnATZt2Kv56vA=; b=cnbZtfRXJ8AqZ1bFKAdTpY6AEW
	QIpu1ahsZ2ap7k7NnCdAGTsVczyynW3I0ubTLscpdVWOvnY9lXS2+hGksmB1DHR+scpbl0sSBTTMU
	seBgsu61a/2n/QaIOKXBCHHr4/Qzs2RA7mg1MX2AxYSMuQ8osgYF45glZbjoauyheFrlRvmHpRzSR
	DWgg5iAur/wL1xXO9KczK6OZ/ogngUREwlyQ3IzLryG0FAF8OPXJW2lNs+eNqG5ZBBdb1YFr+RDVK
	FcMnD+Vsq0ggkb3LJ9wtAZA7HbJqzVaDA867ygllc8p3vOLxiVn3rLNQbycoES2b0YGPzx2aMbJvd
	b9zYLaVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOCwD-0000000EoxS-1rWx;
	Wed, 26 Nov 2025 10:39:53 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOCwB-0000000Eox5-0BZ0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 10:39:52 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-477770019e4so54372325e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 02:39:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764153589; x=1764758389; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bxza/3SKXHd409Aa8RQXPAQ4jTblvmLnATZt2Kv56vA=;
        b=wQDd5shIz4UyK7/vOYmtcbYN6ewKoDWxtJPW8XIf+wkU1tL//5W7KT9F5SHR8RmYZD
         DtvKQ4leefoyeM1hINCdIUVpucMKYoMwv6xliwsyEBGQTtcyQ6rXKCUkVnvHoViOaE/n
         ONcTGcYGoXsuuHu956rXJyazauTU3/0+WkzPseXm5lCrAUkBLNcn0Vd1T+NOOdGMI1f7
         Q4P8QDSrQGe6ATW/bFvV0eJ3SBciW2cyTQwomlfBsj1LZBeSuA2BegglrTfXM46WkmUv
         +g10ObNxkOWRC+FUlYhphAPAJWymOOcKdiufQyeZmrdMY7Rl40Pa/uzniW+5x4haRNhE
         QNKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764153589; x=1764758389;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bxza/3SKXHd409Aa8RQXPAQ4jTblvmLnATZt2Kv56vA=;
        b=NYamdb9HcsoouFIsGf+o20Oir//CtiNdEKnr7y334JN3Wc+UIq+qJUVHKJsOoZPySM
         rIy+gRucLii5V5KivaqKsWxJzfu/GyiFPwVBcDIvGzUQFCC6Qm6EZJhxQsl4mvOxrIli
         hPVIIscc/IJc1a/UInG0oOd05I42igP1kb0Rz7U88lq/aAe0yp3sC6CVOPY5NGPLpgn2
         wdWB7GESbNN9qEmwcEf7BQ7Q68uOzzN6CEjU1YGapTiorOic8WtzCUpPMevGSwwWxPE8
         gCLfKto0mrCIb8wPGCOoZAHE5l3ZU8w8gnlGEN2KVOwAEgCOzba/b/i0QQ31UplrYErY
         RsfA==
X-Forwarded-Encrypted: i=1; AJvYcCV9U4YbirZrM4lsLMOdU0AoP9lvEkV5aSdw2Ntmnwmm7K/l/9poqzq9oXhm0KI6V9zDBRgQY+ftwrNp0hATtRnU@lists.infradead.org
X-Gm-Message-State: AOJu0YwAe9fEP8FUFJr6/sXXACO/E3ZbaYMEXrsxSDew7MF1wFH9rJzL
	kz7amPcis6xvfJTs7wiFXd2BBrB1ih+vm5NLfVBtWu06pNU9F3UYpxzFQnaboLYRiqU=
X-Gm-Gg: ASbGncuCU7Yg5xBBtYeYoPRGZMcbC6fNLbW4An8NhohF+m/0NOT7UzyEjAiqx7XbDDd
	JU2p1J6xqO2zEBqQkWiIkwHnQhnBgwpqAB+H4f8bjcbcj5ndEDL2xH6QxNGjETWVJCu3M4jY15L
	XuVixTbAD8G25RqHeR0gpomG5a9PFMqVd+9ek8rECNKXanWVWKu6AQ7EYK00skQBJaxMKQJbHI0
	8C78rAHvk9fSNaQu3fJPrwukMXjvvfIqwEv58cCCJv9gY1zbuLU41k+eDDB2EwdNtnFg8Oh7yes
	XSp4eQOSGULt+DA+CsbGZO05JYCovEIjPbiAuUA3cj+TAY9xZ5nGho3Dshsg7m06EZHHx7Zm5b6
	voEQGccFE7UzLjjoi1k0wwq716bLR3Vd5uWsbMxnnoi6JVnS3IbWHZuI1dz5Ra5n1Ul8C8604Vc
	DKU4TlxVpcCnlZsT8w
X-Google-Smtp-Source: AGHT+IGKtExUbJnxcGGKvR36YLY3OWpg08hT9iriQX5fOK8lXGwfEtyh/qpXmy0knkF82WWk+yo2sw==
X-Received: by 2002:a05:600c:3112:b0:475:e09c:960e with SMTP id 5b1f17b1804b1-47904b2c36emr61263295e9.32.1764153589036;
        Wed, 26 Nov 2025 02:39:49 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fd8baesm40011380f8f.39.2025.11.26.02.39.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Nov 2025 02:39:48 -0800 (PST)
Message-ID: <2809e0bd-59ce-4b80-b8ce-d1c1c9234b81@linaro.org>
Date: Wed, 26 Nov 2025 10:39:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/9] KVM: arm64: Fix Trace Buffer trap polarity for
 protected VMs
To: Fuad Tabba <tabba@google.com>
Cc: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, oliver.upton@linux.dev,
 will@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com,
 yuzenghui@huawei.com, catalin.marinas@arm.com, vladimir.murzin@arm.com
References: <20251118103807.707500-1-tabba@google.com>
 <20251118103807.707500-3-tabba@google.com> <868qftqehe.wl-maz@kernel.org>
 <d94e17d3-41db-42f8-8039-e1d6a694788c@linaro.org>
 <CA+EHjTzizVuHXeULzyiV8cetcGMXHro=-UeqWb=cFKf1tR0aZw@mail.gmail.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <CA+EHjTzizVuHXeULzyiV8cetcGMXHro=-UeqWb=cFKf1tR0aZw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_023951_142491_442F06EE 
X-CRM114-Status: GOOD (  17.03  )
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



On 26/11/2025 10:36 am, Fuad Tabba wrote:
> Hi James,
> 
> On Wed, 26 Nov 2025 at 10:29, James Clark <james.clark@linaro.org> wrote:
>>
>>
>>
>> On 26/11/2025 10:23 am, Marc Zyngier wrote:
>>> On Tue, 18 Nov 2025 10:37:59 +0000,
>>> Fuad Tabba <tabba@google.com> wrote:
>>>>
>>>> The E2TB bits in MDCR_EL2 control trapping of Trace Buffer system
>>>> register accesses. These accesses are trapped to EL2 when the bits are
>>>> clear.
>>>>
>>>> The trap initialization logic for protected VMs in pvm_init_traps_mdcr()
>>>> had the polarity inverted. When a guest did not support the Trace Buffer
>>>> feature, the code was setting E2TB. This incorrectly disabled the trap,
>>>> potentially allowing a protected guest to access registers for a feature
>>>> it was not given.
>>>>
>>>> Fix this by inverting the operation.
>>>>
>>>> Fixes: f50758260bff ("KVM: arm64: Group setting traps for protected VMs by control register")
>>>> Signed-off-by: Fuad Tabba <tabba@google.com>
>>>> ---
>>>>    arch/arm64/kvm/hyp/nvhe/pkvm.c | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
>>>> index 8d06a246dfd1..f6f8996c4f97 100644
>>>> --- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
>>>> +++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
>>>> @@ -118,7 +118,7 @@ static void pvm_init_traps_mdcr(struct kvm_vcpu *vcpu)
>>>>               val |= MDCR_EL2_TTRF;
>>>>
>>>>       if (!kvm_has_feat(kvm, ID_AA64DFR0_EL1, TraceBuffer, IMP))
>>>> -            val |= MDCR_EL2_E2TB_MASK;
>>>> +            val &= ~MDCR_EL2_E2TB_MASK;
>>>
>>> This does not only change the trapping logic (bit 24). It also change
>>> the ownership of the buffer (bit 25). I wonder whether you should do
>>> something for that, maybe by clearing TRBLIMITR_EL1.E, because
>>> otherwise, you keep tracing, but using an EL2 VA. What could possibly
>>> go wrong?
>>>
>>> Overall, I'm very uneasy about TRBE in the context of pKVM.
>>>
>>> Thanks,
>>>
>>>        M.
>>>
>>
>> Don't we already clear TRBLIMITR_EL1.E in __trace_needs_drain() for pKVM
>> when switching to the guest?
> 
> I don't think so:
> https://elixir.bootlin.com/linux/v6.18-rc7/source/arch/arm64/kvm/hyp/nvhe/debug-sr.c#L60
> 
> Cheers,
> /fuad
>> James
>>

Oh yeah I glanced over the TRBLIMITR_EL1_E and thought that was clearing 
it, but it's just checking if it's enabled or not.

We actually disable trace by setting the filters to 0 in 
__trace_do_switch() and leave TRBLIMITR_EL1.E enabled.


