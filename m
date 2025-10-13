Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E1E1CCA476
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 06:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rbH3h4P4XxNpCmGDtdwz6GDKeAh4p4S3SJJjZvahGmI=; b=wtpHhxfiTPErIdnhA/9/HiI/Dk
	QKCwHQvUcmoTlJhiQ3mbV6XQYu4xyPIgK8TvAbaXg3m/84pamtD3pFpxhxqRMstOa73pBLY1NCw4F
	ByjNTw8AXMNRCl+xEVxohglSFicb3t6rCSxa6SC0ALfHTDBxxpvOk6JIydnsDW77oWMDJEIKHSHZy
	AP6zBJ+Xm9FaSSFPZUhr6lNW6jtkmcdCk/nb6DCajLQjQuTOTF5XG2n6FuHnjj9uKQIJZzynjJ8HQ
	jAwRk0rrYmSM2Ry821IrAU+buF2K5KcnFtjgGisqg8ASrV2l48fj6y9JK0iULLjrP1UckXC9C16HE
	66ZCOLSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8CQe-0000000CQzR-0Zhq;
	Mon, 13 Oct 2025 06:53:08 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8CQb-0000000CQyZ-3DPL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 06:53:07 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-46e37d10ed2so34527185e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Oct 2025 23:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1760338383; x=1760943183; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rbH3h4P4XxNpCmGDtdwz6GDKeAh4p4S3SJJjZvahGmI=;
        b=NwgakJIP+40pc85j4PuP5r6md79u+xaC7rg0W1YYlI6PfIIhBnfeHvafvxwYqGRIbK
         JCNrfoGDM/tPibgKhiI2xs9W/zjjFbv98ti/AoP/+uI3blux6cX4kZy49I2E0s9LaMKG
         p0zpv49ohktHihrV9mEQMJEwLM2mFTT6Qi9Dz5FFYClnJES0TzbHUpiUJ6hzDOFVSWPs
         txF0JqiTxXZF+AzawGbLzjsauXJdino+xvRj6gc+wXldvgJF8EK0CYgR+NwIsEMorsLk
         91roqU+jT2hXp8SkOfMhRSz5LHpOyeNpT5Om/yCuvemUVW1iUoeXJaqc1NbaZAQev+Jn
         3Vfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760338383; x=1760943183;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rbH3h4P4XxNpCmGDtdwz6GDKeAh4p4S3SJJjZvahGmI=;
        b=QcJzODJhtFV3iIawnkdUUolcJUNJUJABKI2jjlvyvFyXZVG4eXxv1fKlLJOArX4CJO
         WhF+uXa8WvUGqhcEQq6V/U7PTafO3LZqbjrVmLiEjDqm5egHMTivb+lHBNl18J+maGGc
         K0FJ18pqDgqlmnB/jlqka3Tz1cZNQ2QuC0PnHZFjErn8knkA0PxTYu6HL8DMOmx1zsMH
         y9YkaVScDGfkq8FqEVxbcQlt/WS12rkz6oxPTSb4iHDMGpth2hf1i30dvDxOMRKbUAXO
         K0MF0RjySBo22BHJMssKeZLbnbIt0H0gDzIqSUwNMG8v4yPu9VJrEsyxfthJ9EOsV9C8
         3hPA==
X-Forwarded-Encrypted: i=1; AJvYcCV/ZOsJW5SIx6DLiPR//oTOZX9XPv59gd+PvkXv0q2CIYZlK1QSJxc0gy5T2rQ9PoeZxL64+DnT0w8DIKM44u7c@lists.infradead.org
X-Gm-Message-State: AOJu0YzqT4EWtYOPjHTG4C5p6ifcn85N957T9Idl28nXmRNNXLPe7sKf
	nHYJ0FYhlV4XhE0fL25r70GG2xPShBegW/8aEwRlb244Ajw0J1A+lPaVNuid/VgvXuI=
X-Gm-Gg: ASbGnctLzysNmb4xER4QwpiosZ9Cj0kcT1Yc0szrNrJQxl61XvSRdz/dr99DBaRDfLC
	zvPFSgwU40IRgS+rmt8o/MO38dRW/Uxg2i9D5B/I9ubi4aLmMBkcHMKOk83YySa8PkS9ICq2bRm
	AORDNPh19Oemi4sXxj5Me7tkFA9vStSze5KWOXCDT2LIJzibRBVAIqYKCrxXDqISd8202S28+lX
	qF6hwfKQts40Fb+SChlN4T64M3L0/lp/2A3SCNiSqlwHIMas+xi4mn1pgXtlRDxD7Me8G5YP4n0
	/9pJbCo/frFe2Gimg408iqToMTEC6Oo/X5pFmurK2m0uh+6VXSx0tG2lUoyG2NR6V4RJIxZRXMC
	4qnb9EUlCyVMhIOiYTxqGFHatI0rPlfX0XO0rEXOsM5xCPhUnBSXT05ehDSgdo8FxPECA5FD03E
	9HVT4K4kADgw==
X-Google-Smtp-Source: AGHT+IHS+mxS8XXsx5JY+2orAFN0Rw3+Bxz5ihy+z4tH7rBV7ImQGUUGN7GgYYiyXdTqtgFgFgyyAw==
X-Received: by 2002:a05:600c:1d1b:b0:46f:b32e:4f3e with SMTP id 5b1f17b1804b1-46fb32e4fa5mr108548385e9.37.1760338383336;
        Sun, 12 Oct 2025 23:53:03 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce589a21sm17022180f8f.23.2025.10.12.23.53.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Oct 2025 23:53:02 -0700 (PDT)
Message-ID: <628d357c-f462-4dc8-92f2-99006b73e0c7@rivosinc.com>
Date: Mon, 13 Oct 2025 08:53:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/5] riscv: add support for SBI Supervisor Software
 Events
To: Paul Walmsley <pjw@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Himanshu Chauhan <hchauhan@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>, Xu Lu <luxu.kernel@bytedance.com>,
 Atish Patra <atishp@atishpatra.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>, Yunhui Cui <cuiyunhui@bytedance.com>
References: <20250908181717.1997461-1-cleger@rivosinc.com>
 <86817f9a-c601-81e8-b95b-0f2396275f95@kernel.org>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <86817f9a-c601-81e8-b95b-0f2396275f95@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_235305_892789_1927EBD9 
X-CRM114-Status: GOOD (  33.71  )
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

Hi Paul,

Thanks for caring about this series ;)

On 10/10/2025 03:32, Paul Walmsley wrote:
> Hi Clément, 
> 
> On Mon, 8 Sep 2025, Clément Léger wrote:
> 
>> The SBI Supervisor Software Events (SSE) extensions provides a mechanism
>> to inject software events from an SBI implementation to supervisor
>> software such that it preempts all other supervisor level traps and
>> interrupts. This extension is introduced by the SBI v3.0 specification[1].
>>
>> Various events are defined and can be send asynchronously to supervisor
>> software (RAS, PMU, DEBUG, Asynchronous page fault) from SBI as well
>> as platform specific events. Events can be either local (per-hart) or
>> global. Events can be nested on top of each other based on priority and
>> can interrupt the kernel at any time.
>>
>> First patch adds the SSE definitions. Second one adds support for SSE
>> at arch level (entry code and stack allocations) and third one at driver
>> level. Finally, the last patch add support for SSE events in the SBI PMU
>> driver. Additional testing for that part is highly welcomed since there
>> are a lot of possible path that needs to be exercised.
>>
>> Amongst the specific points that needs to be handle is the interruption
>> at any point of the kernel execution and more specifically at the
>> beginning of exception handling. Due to the fact that the exception entry
>> implementation uses the SCRATCH CSR as both the current task struct and
>> as the temporary register to switch the stack and save register, it is
>> difficult to reliably get the current task struct if we get interrupted
>> at this specific moment (ie, it might contain 0, the task pointer or tp).
>> A fixup-like mechanism is not possible due to the nested nature of SSE
>> which makes it really hard to obtain the original interruption site. In
>> order to retrieve the task in a reliable manner, add an additional
>> __sse_entry_task per_cpu array which stores the current task. Ideally,
>> we would need to modify the way we retrieve/store the current task in
>> exception handling so that it does not depend on the place where it's
>> interrupted.
>>
>> Contrary to pseudo NMI [2], SSE does not modifies the way interrupts are
>> handled and does not adds any overhead to existing code. Moreover, it
>> provides "true" NMI-like interrupts which can interrupt the kernel at
>> any time (even in exception handling). This is particularly crucial for
>> RAS errors which needs to be handled as fast as possible to avoid any
>> fault propagation.
>>
>> A test suite is available as a separate kselftest module. In order to
>> build it, you can use the following command:
>>
>> $ KDIR=<build_dir> make O=build TARGETS="riscv/sse"-j $(($(nproc)-1)) -C tools/testing/selftests
>>
>> Then load the module using:
>>
>> $ sh run_sse_test.sh
>>
>> A KVM SBI SSE extension implementation is available at [2].
>>
>> Link: https://github.com/riscv-non-isa/riscv-sbi-doc/releases/download/v3.0-rc7/riscv-sbi.pdf [1]
>> Link: https://github.com/rivosinc/linux/tree/dev/cleger/sse_kvm [2]
> 
> I updated these to apply on Linus' current master, commit 5472d60c129f, 
> cleaned up the checkpatch.pl --strict issues, applied Anup's pr_info() 
> suggestion, and pushed them up here to make it convenient for folks to 
> integrate and test:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/pjw/riscv.git/?h=riscv-experimental-for-v6.18
> 
> Am assuming you didn't have other changes that you wanted to make; let me 
> know if that's not the case.

Indeed, I do not have pending modification for this series. The KVM SBI
SSE support will be submitted later that year.

> 
> I noticed that you asked for folks to do additional testing, particularly 
> of the SBI PMU driver integration, but didn't notice any additional 
> Tested-by:s.  It would be great if other folks on the list could do some 
> focused testing now, particularly since we're on v7 of this series, and 
> I'm sure others care about this.

 I would have prefer a bit more reviews and testing before going through
since SSE can be quite intrusive at execution time (even though the
classic IRQ path should not be impacted, I expect mostly feedback/bugs
from the SSE handling path itself). We'll see in a few days if people
find such problems.

Thanks,

Clément


> 
> 
> thanks,
> 
> - Paul
> 


