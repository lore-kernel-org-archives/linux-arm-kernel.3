Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0B4EC5CFD9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 09:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oJ88OLZKf9QMZYTUIDUM+DdXOTb/AyphVnNJxcq65aI=; b=LgEhb/+BuLwjAmNu/Hlg3JfBwE
	gqwMnZXk4CP83e53ffMhUzK1AkMXDrKs+K+dyztI+yxJUc/PogHUrMYk41aLl1oSum66s/SYQXXnd
	XXNd4JUBzv+EBrw7cXxz9FaPT1/EDybcmRsyxLB+TQD16RCehzIjiXo4MQGkDXFAkPWSzlvtu1FCD
	wvhgS7Clcb6gaeSbeVAWhp3gQB2w8hQgsRpezQE4B8XKBHwOlr2cbEVCL8Mx8vUJPxkWBQ6IzGaM1
	XSQktA5gGR/DDpuw352Dap7S76Gk/e2cJIKdLBAT1i8GmrpvmlKCAZRxu/4dFvP0PtwG0Un4kFgQE
	fNlan2EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtiNn-0000000DgMs-3oDr;
	Tue, 11 Aug 2026 09:02:51 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtiNk-0000000DgJo-0G2D
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 09:02:49 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-47de008b020so432264f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 02:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1786438966; x=1787043766; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oJ88OLZKf9QMZYTUIDUM+DdXOTb/AyphVnNJxcq65aI=;
        b=xyHlGfH5GbjS6CwzwzaSjViu8rioJ4vuKgw6m1ft1pbe7LdIz4tCIUyc1YfNOGxoZg
         CcJZ0if6Ovg45PE701gINiqkwrgxhDzbfWxCxq/rsZO1ijQjrw6aXjr8W2HWOvKyZyZs
         KB2Mg3GtUxF8FIKz68mdovMuYZhNhPlTkK5x2a9qWymghZZborg+Ej5SEtj0gq5i6PkX
         1eXcOHQvJOH/4fEb+m+hJfPf/WBVn4YZaXxs1YihsT920gwljVblpNyunxD5LoeAllYw
         MGt+DQUmTDNxjMY1EuoqX36cLimdRQiH1+jz2vgfWKaqtHU3Y7Gx6ou7xQ6O7KVbC2jE
         wqjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786438966; x=1787043766;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oJ88OLZKf9QMZYTUIDUM+DdXOTb/AyphVnNJxcq65aI=;
        b=I5HnICPDs3fuW29MEfEXEDhk82DPa9cMHbNSim86I89yg4XdY255J7thIFZZ72rRfa
         35Lxu1b2jSkGMJbw/FPsd9ylXoMYoLujJFVOdQ/3fbI+bb2vjjVapmvRXOHP5TdRg3es
         s0Q2LugO2FwkVU4EomCKCpCx7ikBjmaiIZ/SxQaPcUZ7DuMA46LAdp+VaqDkS3bKHb4W
         jCAQmt85BhlLBTkuVifHTYa0aL0HZHO8PdQNb/tKP+adEYaBSHZ4CwO9+ejSMoTbQd2o
         LY6ATOuuR6Xhs/4p1vMgbZMBUdDC3LRBBHvNXGGuFZR4+P+14lhVptXzcsO6f3fOKOYQ
         aEVQ==
X-Forwarded-Encrypted: i=1; AHgh+RpMyH+Uce4Q2shyCLQLE87caMzU79hnKpeN2CiwxtRtxpjAFO/WjX0vwUs19VpLlYGF2LWiGO1HRkhesABYyKNV@lists.infradead.org
X-Gm-Message-State: AOJu0YwAQHn1ILLdIN8PnGwB5JmfesZA5G/LSE32aJejpVKshTEAihAo
	zR/9KGn7OAWq+hTmPWzNc2gwcyTRzQ7uIb3hzVRSCL56bQsW1yYWThKMXKNt8+Ma0N0=
X-Gm-Gg: AR+sD10RqbIpNFErQ68nSsooV3PYVCX2tL0sxZTXBv5CittyL9PvXAfKEplyBV9+uHy
	79/b+B85RUCaXAy7YdIZtHzLMxEKkKIGKDQKE65hPlN4XMYVmFdwKd/uD+9SMZh5gFutKUjRAEF
	Lh/nIRbgX80dCxNDF98xDHkba/YmP7EJ6qJD/+N1nqvN8nb/bW3xlFRXq+jXgYA6EtqTLTGLX/3
	ubos1G332wI//AvnJpM8qWfEqJ100JpPvkPU++vwPqF4NdejNRlory0rU9X3uhrBzUJmHohfoHG
	xReLJnMD7RBq6ALT+NoPmTJRXBuiAX29tBUwEQI1xYAn19chXHAJicIrPZptLMWpcicyXjoeTY4
	MznvuvmoWmKWczGuXAXGqN+9DkiuBst+qKN6tMHehFAuzjf/ragogeLNjhSIUnoJ21h49EpfcoX
	KvyL2AUuLw4qXB0/9mzHoKKlkAcFVQWvgBTWcPvpwoNwyhmUh09Eb2Gy9AYbthjaK3R/I=
X-Received: by 2002:a05:6000:46ce:b0:474:bbbb:bf17 with SMTP id ffacd0b85a97d-4814b54d77bmr1881469f8f.0.1786438965631;
        Tue, 11 Aug 2026 02:02:45 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4814a709624sm3106323f8f.22.2026.08.11.02.02.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2026 02:02:45 -0700 (PDT)
Message-ID: <8c8f6c2a-8fc2-4181-87fa-e64101dfce6f@linaro.org>
Date: Tue, 11 Aug 2026 10:02:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] perf: arm_spe: Prefer large AUX mappings
To: Leo Yan <leo.yan@arm.com>, Will Deacon <will@kernel.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Peter Zijlstra <peterz@infradead.org>, Mike Leach <mike.leach@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Mark Rutland <mark.rutland@arm.com>, Tamas Petz <tamas.petz@arm.com>,
 Tamas Zsoldos <tamas.zsoldos@arm.com>,
 Michiel van Tol <michiel.vantol@arm.com>, Dev Jain <dev.jain@arm.com>,
 David Hildenbrand <david@kernel.org>, Yabin Cui <yabinc@google.com>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org
References: <20260810-perf_aux_trace_large_granule-v1-0-03306c9339e3@arm.com>
 <20260810-perf_aux_trace_large_granule-v1-2-03306c9339e3@arm.com>
 <annp-BdTviQoH6vy@willie-the-truck> <20260810174159.GC15499@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260810174159.GC15499@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_020248_148220_77F020C5 
X-CRM114-Status: GOOD (  25.49  )
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



On 10/08/2026 18:41, Leo Yan wrote:
> On Mon, Aug 10, 2026 at 04:10:48PM +0100, Will Deacon wrote:
>> On Mon, Aug 10, 2026 at 03:44:42PM +0100, Leo Yan wrote:
>>> Commit 18049c8cff9c ("perf/aux: Allocate non-contiguous AUX pages by
>>> default") made the AUX allocator use order-0 pages by default unless a
>>> PMU explicitly asks for contiguous allocations.
>>
>> But that commit specifically calls out SPE as benefitting from
>> non-contiguous pages:
>>
>>    "For instance, ARM SPE and TRBE operate with virtual pages, and
>>     Coresight ETR allocates a separate buffer. For these PMUs,
>>     allocating contiguous AUX pages unnecessarily exacerbates memory
>>     fragmentation. This fragmentation can prevent their use on
>>     long-running devices."
>>
>> so why doesn't passing PERF_PMU_CAP_AUX_PREFER_LARGE reintroduce the
>> problems that 18049c8cff9c was trying to solve?
> 
> The question is how "allocating contiguous AUX pages unnecessarily
> exacerbates memory fragmentation." The relevant information I could find
> is [1]:
> 
>   "On Android, we collect ETM data periodically on internal user devices
>    for AutoFDO optimization (for both userspace libraries and the
>    kernel). Allocating a large chunk of contiguous AUX pages (4M for each
>    CPU) periodically is almost unbearable. The kernel may need to kill
>    many processes to fulfill the request. It affects user experience even
>    after using PMU."
> 

This sounds like it could be an attribute to perf_event_open. We can do 
PREFER_LARGE by default for performance and fewer discontinuities, but 
on Android or small systems users can enable an option to revert back to 
single pages.

Or can this bit be determined at allocation time: "The kernel may need 
to kill many processes to fulfill the request"? If this memory pressure 
exists on allocation then do it one way, if not do it the other way.

> We might have missed chance to clarify how the fragmentation issue
> occurs in the first place. Let's say, a phone with 8 CPUs, allocating
> 4MB per CPU requires 32MB in total, which is a relatively small
> portion of 4GiB or 8GiB of RAM commonly found in phones. Moreover, once
> contiguous pages are freed, the buddy allocator can coalesce them
> again into buddy list. It is not obvious to me that PREFER_LARGE
> directly causes fragmentation.
> 
> One case where AUX allocation could exacerbate fragmentation is when the
> system is already fragmented. If a high-order allocation fails and the
> allocator falls back to smaller-order blocks, those allocations may
> consume free blocks scattered across different buddy regions and make
> subsequent high-order allocations more difficult.
> 
> If this is the main concern, I'd suggest using a smaller AUX buffer
> (e.g. 1MB or even 512KB) for TRBE/SPE to reduce memory pressure.
> Snapshot mode '-S' could also be considered, as it allows the buffer to
> be allocated once and reused for subsequent recordings by signals.
> 
> OTOH, using only order-0 pages can significantly increase TTW overhead
> on the trace path and lead to overflows, we observe this causes huge
> trace discontinuity. In the end, we need to trace-off the fragmentation
> concern against the trace discontinuity.
> 
> Thanks,
> Leo
> 
> [1] https://lore.kernel.org/lkml/CALJ9ZPNLgEBxOmDim-vztUknEETwdL-Z2gJ8K9s44TiPgKZgHg@mail.gmail.com/


