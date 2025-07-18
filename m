Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C444C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 20:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uXAK2LcN+D1aB2LwqkwZRyXZHRbBhvjT7o6KbAa+ppk=; b=RNVoJuv4TUewczjoj7LEcPuxuC
	/646krS0dr5yTL7B5478ar/kwMbbNvkCApeL9bbqYjc0OLRFwrAPTxCiwbL8yOHSKJcdzwElnXYSr
	IQ4KnoWhOyYNu0QZ7U0DjI+i0sINDGi2/ryhUdTruaT9asqLdS8JTAnULt8qDDUNzVBbpHvHeMkRa
	/zrnxutCjneA6jX8SBlOAxBboFn5sSRhLmkXLMAK/evrDPtJY+mi2EEd0g8hpSwBjQbOAZbLU7PHQ
	zvx5utSxSmQkpd6jSISmLtEP2bTrQhrlm1t+TPREjbv+thHgZ1pw/gyUBBNfk9YfmljTxKdto4BJz
	C2RjA5PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucs0W-0000000DR5H-0Mki;
	Fri, 18 Jul 2025 20:48:40 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucry1-0000000DQxn-11S9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 20:46:09 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-23c8a5053c2so24298785ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Jul 2025 13:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752871564; x=1753476364; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uXAK2LcN+D1aB2LwqkwZRyXZHRbBhvjT7o6KbAa+ppk=;
        b=NSQR7wOaswKPpFEk4IJbrvEg764J+JSnTDoUFYrOO3XH7hOuXZ6gD+DS0jw2mwpyUe
         D3Xl4DDR7ZT6ej7mIN8Swij7KNfNksyAwx5hDdiE/4NteX+xjMqEqXO5qHGSzKCrUpJ1
         JsF/fFmfzm7GQvAoA8u+01xSz57XFu1+4W86fEsQadUKjAh1oZ49EMmAFxLasgwuPuIy
         v4i3AzPfsBVDJ8Yj1wpV6wZxLqz/1anjhvzn/EuDJzoLRs/cw/61m+2vEBCtEE0sFgET
         eO8eGQ1xPw2AnYzvVhpsx/YrZnmRPEX63CF5cn+Gm54YOVRBdu0ecmNisjqzjemH8/HT
         z3pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752871564; x=1753476364;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uXAK2LcN+D1aB2LwqkwZRyXZHRbBhvjT7o6KbAa+ppk=;
        b=tiLc+i7dAIRwU+kjZuWFD0X4RzYNRpOd4WLEk81JtUNGlzhYPe9Opz0ro+kvqHKs4X
         4E4wMbXEERXHiFhrXstDrT7S9jOV35KRb/R4NcM7ds/CyJLkvbuOXlZnYkakcEpSe73t
         uC87y1oN+kTxV2lUdpl4XEbemdVXREFROjlG3fbAglXY2NBsteTanECt6BE5S5KBWZOz
         dULAROFG3WTHYq7KFOL/hp+nxAHj6l61+PmtVC2F0XF4LzBkDS7/hvn/tKPNy7RC+7ln
         SfJ0jxsA7bf8nOsOhLYKFu648J/vYJCNmvWcmRIbDlh8dvaBrlFhwH76K498ouL9uexj
         +mVg==
X-Forwarded-Encrypted: i=1; AJvYcCWpYb/cAwvdTXlg2uI80uMNFWfTsoD10RrctTQQ55ewCSQ1r8ZuNq/k9Id1pJnOheY8zy2Q7MYi3GRDfMMsx9TW@lists.infradead.org
X-Gm-Message-State: AOJu0YymAnUE0+KxzndVmMWw80kQpnKoy3dKIQacrxx9nu9cJB8p0okU
	C46rYTpWW3z1uVMziqREmPxB+GCmv57STVJRwnmc6bzNkjwDCS0tHtmL
X-Gm-Gg: ASbGncuKGrAE0jy+ZYhQeYoOI+2T6AKgwpSk1xEyZYFhsMr3I70ZWFTLZYiD+dGhqUm
	SsK0wG4dnqc2DXDKhmKZKLzScX9UXSE3YU/LADKqPmqwhz4v6tlN+hoik8NgpChz/7Ks8bbPphw
	bkCG6DUhmDW+vGvm5Lc44rNAtZmIa4qMUaks15AGMa0MeoQAsnw2gINAlD9TVD3KK1T3GZwzZLp
	+qPKm21LuwDhK4oS6VvldbOU0d2jUMhHMbdVh8K6HBIF7HCf/W4nRs+mk1MJiEs/Kw81zQSl0pE
	R4aJhL4h6U+DmhRSp16B8cmDDsUQoH85PSCtMPln+cVe1gYLFGJ33LZ6oy7w5gqB15XgaNK5nPK
	CAHdSGtwAfnZIpAD0SjyVoGYvamb6nq3eRTvLVKE7mCZDnTbImlQ8RF+WGTd/Jv4=
X-Google-Smtp-Source: AGHT+IFfAzmfpnYky0WJeFj+PkACVQRkUKSaLnIxhEt/NV8Uzws4ecq5iTsonExxyL5PHW/z3ZTr5A==
X-Received: by 2002:a17:90b:3cc6:b0:30a:4874:5397 with SMTP id 98e67ed59e1d1-31c9e6fbb09mr17031670a91.9.1752871563843;
        Fri, 18 Jul 2025 13:46:03 -0700 (PDT)
Received: from [192.168.0.109] (061092221177.ctinets.com. [61.92.221.177])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b61566bsm17746325ad.81.2025.07.18.13.46.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Jul 2025 13:46:03 -0700 (PDT)
Message-ID: <2b69fbd1-067e-4ff4-8ea4-88e32763209a@gmail.com>
Date: Sat, 19 Jul 2025 04:45:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v7 00/21] drivers/perf: apple_m1: Add Apple A7-A11,
 T2 SoC support
To: Mark Rutland <mark.rutland@arm.com>
Cc: Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Neal Gompa <neal@gompa.dev>, Sven Peter <sven@kernel.org>,
 Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org,
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250616-apple-cpmu-v7-0-df2778a44d5c@gmail.com>
 <aHUeUMmn_19EayL1@willie-the-truck>
 <be327242-ad55-476a-bed4-44c33c263962@gmail.com>
 <aHkRJdAuvhS2mNQj@J2N7QTR9R3>
 <705f1dfb-7e1b-4930-a1a9-c763299a4305@gmail.com>
 <aHph5u4-b6mfggPv@J2N7QTR9R3>
Content-Language: en-US
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <aHph5u4-b6mfggPv@J2N7QTR9R3>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_134605_302945_0F2C9917 
X-CRM114-Status: GOOD (  28.96  )
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


Mark Rutland 於 2025/7/18 夜晚11:01 寫道:
> On Fri, Jul 18, 2025 at 01:00:45AM +0800, Nick Chan wrote:
>> On 17/7/2025 23:05, Mark Rutland wrote:
>>> On Mon, Jul 14, 2025 at 11:59:36PM +0800, Nick Chan wrote:
>>>> Will Deacon 於 2025/7/14 夜晚11:12 寫道:
>>>>> On Mon, Jun 16, 2025 at 09:31:49AM +0800, Nick Chan wrote:
>>>>>> Patch 8-12 adds support for the older SoCs.
>>>>> ... but I'm not sure if anybody actually cares about these older SoCs
>>>>> and, even if they do, what the state of the rest of Linux is on those
>>>>> parts. I recall horror stories about the OS being quietly migrated
>>>>> between CPUs with incompatible features, at which point I think we have
>>>>> to question whether we actually care about supporting this hardware.
>>>> The "horror" story you mentioned is about Apple A10/A10X/T2, which
>>>> has a big little switcher integrated into the cpufreq block, so when the
>>>> cpufreq driver switch between states in the same way as on other
>>>> SoCs, on these SoCs that would silently cause a CPU migration. There
>>>> is only one incompatible feature that I am aware of which is 32-bit EL0
>>>> support.
>>> Surely the MIDR/REVIDR/AIDR also change?
>> They do not change. ID_AA64PFR0_EL1 also does not change (fixed 0x12).
>> What *does* change however is MPIDR. (P-cores has bit 16 set while
>> E-cores do not)
> The MPIDR changing isn't ok either. You might get away with that today,
> but that's not supposed to change behind the back of the kernel.
>
> Is there anything else that can change, or are we absolutley certain
> that *only* MPIDR changes?

Only MPIDR changes, and the state of bit 16 in MPIDR is consistent across all PEs. (At any
given moment, either all PEs are backed by efficiency cores, or all backed by performance
cores)

>
>>>> As mentioned above, it does all work fine when CONFIG_EXPERT is not
>>>> enabled, and if it is enabled, then 32-bit process may crash with illegal
>>>> instruction but everything else will still works fine.
>>> I don't think that's quite true, unless these parts are also violating
>>> the architecture.
>>>
>>> If the CPU doesn't implement AArch32, then an ERET to AArch32 is
>>> illegal. The way illegal exception returns are handled means that this
>>> will result in a (fatal) illegal execution state exception being taken
>>> from the exception return code in the kernel, not an UNDEF being taken
>>> from userspace that would result in a SIGILL.
>> Speaking from experience, when testing with the userspace cpufreq governor,
>> trying to run AArch32 code on the ecores really does result in illegal
>> instruction for that process while everything else remains fine.
>>
>> Referencing ID_AA64PFR0_EL1, the E-cores does claim to support
>> AArch32 EL0, even though they could not execute it for real.
> Ok, so that's a clear violation of the architecture, and doesn't fill me
> with confidence about anything else.

Regarding this, the hardware also needs to handle the case where the PE is already in AArch32
EL0 and migration to E-cores is attempted. In this case there is no exception return happening so
the behavior of the hardware is not as bad as it sounds.


>
>>> I do not think that we should pretend to support hardware with silent
>>> microarchitectural migration. So at the very least, we do not care about
>>> A10/A10X/T2.
>> As explained above, what actually happens on the hardware is different
>> from what you believed, so please do reconsider.
> Different certainly, but still problematic.
>
> I maintain that we should not pretend to support this hardware.
>
> Mark.
>
Nick Chan

