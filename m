Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE8FED5B87C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 07:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PJCA2xXmtdABe9cuOOw6HKVAFYxYWKkv6zuIQkQSiJk=; b=aQGXE+E7+uXkqEBJGeJ7nka86Z
	J9SwkWsENaJP6064s9gmeR6W8R0Irox8Yzpj/JHhMqaoi1I0bsto6sUltGXl+uHz4EzbDD++J77zn
	V3gzckdLSSErkshjnVI74yho9ukol30yl8uatAk/0rRb3yvgNDjwPrTEJSv0L41GwPsOy+Lj4KZHR
	GtmFhEam5TOGtNl3D4fz6CqcJ3sEBnNLM4ojPf0iJHKKa8PQ2HqAVJGoOcN70811rOs/hpmVnhfX/
	1RebI5d8Ns5G6kasxv8UEhSWHF9uGwddtBw40bgm27/FZ9BvgrdU2NoQGGT/eWr4MzHMruTxI2ifH
	Z4LG00DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVPSq-00000004qYo-3X7h;
	Tue, 16 Dec 2025 07:27:20 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVPSo-00000004qYT-1XGw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 07:27:19 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2a0834769f0so29693675ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Dec 2025 23:27:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765870037; x=1766474837; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PJCA2xXmtdABe9cuOOw6HKVAFYxYWKkv6zuIQkQSiJk=;
        b=J4aDxmFPjrDGYNBOvIMw2vq2MgzsAzMyLES//m3yKdDRQB08Ie5enbPDGUCSJMtyca
         B0oSTAByUqvoRumOEkKIMNnqn+3QCfWo8FgyS0qLnLV/jQ3sBqFU+JCqsSPxDtsiE+7R
         S6/9nd7XLOi+f5VtlHsXJFftKeNJsGzBWQBD39EeBLEyqqe+p30tlyxYA8paNRIer4QJ
         Y6bdnXmGizOwWi+M86J3kJgXcs5YPpNHdunNFgX7EjTuFyGlAlkxc7QDcM1wfn56fbgX
         52PWDp4WygDzWXALXAPwKqRKgzs/xXPn4O0x7g+d3GZhQ3pT3WuwsJHlR9fGeoR8tlHT
         MC7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765870037; x=1766474837;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PJCA2xXmtdABe9cuOOw6HKVAFYxYWKkv6zuIQkQSiJk=;
        b=dpY6MLn4JNaCVqrwxOFsftVCY2yPzBfn45LcFcXcQWsSB52i385Ba3UTszrXBgLwIH
         Lc5q3+eC2I1/+glsygzqj6L95Wa/9hE8Uaexymfp57Vgcd+jo4jHT6d5OGDZp+aT0pyt
         7/iFMp1uVgGXdSiD7b8Xi/e6t9l06Xd1ugEZpJuQVBLeic0YBMHRnBR8v6HqIfiWTMX0
         mxn95pjRdZa3oUdKSmeYwF9z0FJHpBYRmCRBMI3kXLjGQcHTm73IRx4MMZKTjQT1SDTh
         zZ3EQCPjoI9ZLWFTHII6iATfZeJmGPIQnSpwR72WqSTKfN2rgKVrscJG58Jz+s0ZW/oo
         1n9w==
X-Forwarded-Encrypted: i=1; AJvYcCWF8ZO/AjyRh9dpAenT/Lv3b9krH3i9SvnKC0MbsOtzbtJ44sk605RHJgl0KQhsXF9QmFMvQo+m5Iehyg5aGTHI@lists.infradead.org
X-Gm-Message-State: AOJu0YyPvArAnSLQ7SsJsFRR5rSmjYGARFmai0ZjapQo3n13cBc8/R9K
	2immhJqdcauvcHZOBHp/SRhrMH1gie0py74vNlinQT0rVWkVZdrkwT9jSntMSx1B1rk=
X-Gm-Gg: AY/fxX4Rcxa199IukQso0rPzSVkfznmoSnW6V0tcIlsnkFt98l9pepLhEaFMzbUIKN+
	W9Ln7DMTFSe74yxIVYa0jFKJV0p8+eXyntoUMr6/Pn6xk7rdUBeszk26KiZPLpz7D+pRyj/3Da+
	UMJ4Gx5llhh9jHtW/tP2GOl5AF9ULvXpc2mAAqMbbylLKjt7t0hXIqhvAKfC+US546hDxSVumGt
	TycA5HuelzW62xNbZOEs/ISAT96vRwT1G/zfLVxvQXwopl8NTe4uaCkFWCAoUWH3ZTSmyWNTN6T
	TrbgFzWEV+TlL/CToYeTJvMOzdM0Sr1mUyQu29BRu0dOPIfuhR0DdnvwPhOzhJn4Hy0Qx5N537w
	SDU86F2Zm3JiAD3emu1k4T1lUdiEbnYEAj0UsHOBxkAW4uxS35f4HGCTAb62tzuIDNmTY9qmHT2
	0WJmXoIrmgRLe4L4Vu7xxgHEf3rd2sMhwZgEGxtHFnw7AJpU6GZyT2qA==
X-Google-Smtp-Source: AGHT+IG0XHPlxrZ19+Thmc35PPwHSeilDW9jn34WiJoQPAtDXf3ILNz55k3pKMcPVzcVte7yg4mphg==
X-Received: by 2002:a17:902:ea0b:b0:297:dabf:9900 with SMTP id d9443c01a7336-29f23bde313mr144794935ad.0.1765870036820;
        Mon, 15 Dec 2025 23:27:16 -0800 (PST)
Received: from [192.168.10.197] (14-201-17-74.static.tpgi.com.au. [14.201.17.74])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29ee9b36a80sm155735495ad.19.2025.12.15.23.27.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Dec 2025 23:27:16 -0800 (PST)
Message-ID: <93297eb0-1ad4-40ba-9438-ac02aa6b1d6b@linaro.org>
Date: Tue, 16 Dec 2025 09:27:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/26] Introduce meminspect
To: Randy Dunlap <rdunlap@infradead.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, tglx@linutronix.de,
 andersson@kernel.org, pmladek@suse.com, corbet@lwn.net, david@redhat.com,
 mhocko@suse.com, linux-debuggers@vger.kernel.org,
 "kees@kernel.org" <kees@kernel.org>
Cc: tudor.ambarus@linaro.org, mukesh.ojha@oss.qualcomm.com,
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org,
 jonechou@google.com, rostedt@goodmis.org, linux-doc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-arch@vger.kernel.org, tony.luck@intel.com, kees@kernel.org,
 Trilok Soni <tsoni@quicinc.com>, Kaushal Kumar <kaushalk@qti.qualcomm.com>,
 Shiraz Hashim <shashim@qti.qualcomm.com>,
 Peter Griffin <peter.griffin@linaro.org>, stephen.s.brennan@oracle.com,
 Will McVicker <willmcvicker@google.com>,
 "stefan.schmidt@linaro.org" <stefan.schmidt@linaro.org>
References: <20251119154427.1033475-1-eugen.hristev@linaro.org>
 <bf00eec5-e9fe-41df-b758-7601815b24a0@linaro.org>
 <5903a8e1-71c6-4546-ac50-35effa078dda@infradead.org>
 <c3db6ccd-dfc7-4a6a-82b7-3d615f8cab4f@linaro.org>
 <b74aef93-9138-413a-8327-36c746d67e10@infradead.org>
 <93682055-4a6d-4098-b74f-afef735d1699@infradead.org>
From: Eugen Hristev <eugen.hristev@linaro.org>
Content-Language: en-US
In-Reply-To: <93682055-4a6d-4098-b74f-afef735d1699@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_232718_420135_639F6C28 
X-CRM114-Status: GOOD (  31.88  )
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



On 12/16/25 09:00, Randy Dunlap wrote:
> 
> 
> On 12/15/25 10:54 PM, Randy Dunlap wrote:
>>
>>
>> On 12/12/25 11:22 PM, Eugen Hristev wrote:
>>>
>>>
>>> On 12/13/25 08:57, Randy Dunlap wrote:
>>>> Hi,
>>>>
>>>> On 12/12/25 10:48 PM, Eugen Hristev wrote:
>>>>>
>>>>>
>>>>> On 11/19/25 17:44, Eugen Hristev wrote:
>>>>>> meminspect is a mechanism which allows the kernel to mark specific memory
>>>>>> areas for memory dumping or specific inspection, statistics, usage.
>>>>>> Once regions are marked, meminspect keeps an internal list with the regions
>>>>>> in a dedicated table.
>>>>>
>>>>> [...]
>>>>>
>>>>>
>>>>>> I will present this version at Plumbers conference in Tokyo on December 13th:
>>>>>> https://lpc.events/event/19/contributions/2080/
>>>>>> I am eager to discuss it there face to face.
>>>>>
>>>>> Summary of the discussions at LPC talk on Dec 13th:
>>>>>
>>>>> One main idea on the static variables annotation was to do some linker
>>>>> magic, to create a list of variables in the tree, that would be parsed
>>>>> by some script, the addresses and sizes would be then stored into the
>>>>> dedicated section at the script level, without having any C code change.
>>>>> Pros: no C code change, Cons: it would be hidden/masked from the code,
>>>>> easy to miss out, which might lead to people's variables being annotated
>>>>> without them knowing
>>>>>
>>>>> Another idea was to have variables directly stored in a dedicated
>>>>> section which would be added to the table.
>>>>> e.g. static int __attribute(section (...)) nr_irqs;
>>>>> Pros: no more meminspect section Cons: have to keep all interesting
>>>>> variables in a separate section, which might not be okay for everyone.
>>>>>
>>>>> On dynamic memory, the memblock flag marking did not receive any obvious
>>>>> NAKs.
>>>>>
>>>>> On dynamic memory that is bigger in size than one page, as the table
>>>>> entries are registered by virtual address, this would be non-contiguous
>>>>> in physical memory. How is this solved?
>>>>> -> At the moment it's left for the consumer drivers to handle this
>>>>> situation. If the region is a VA and the size > PAGE_SIZE, then the
>>>>> driver needs to handle the way it handles it. Maybe the driver that
>>>>> parses the entry needs to convert it into multiple contiguous entries,
>>>>> or just have virtual address is enough. The inspection table does not
>>>>> enforce or limit the entries to contiguous entries only.
>>>>>
>>>>> On the traverse/notifier system, the implementation did not receive any
>>>>> obvious NAKs
>>>>>
>>>>> General comments:
>>>>>
>>>>> Trilok Soni from Qualcomm mentioned they will be using this into their
>>>>> software deliveries in production.
>>>>>
>>>>> Someone suggested to have some mechanism to block specific data from
>>>>> being added to the inspection table as being sensitive non-inspectable
>>>>> data.
>>>>> [Eugen]: Still have to figure out how that could be done. Stuff is not
>>>>> being added to the table by default.
>>>>>
>>>>> Another comment was about what use case there is in mind, is this for
>>>>> servers, or for confidential computing, because each different use case
>>>>> might have different requirements, like ignoring some regions is an
>>>>> option in one case, but bloating the table in another case might not be
>>>>> fine.
>>>>> [Eugen]: The meminspect scenario should cover all cases and not be too
>>>>> specific. If it is generic enough and customizable enough to care for
>>>>> everyone's needs then I consider it being a success. It should not
>>>>> specialize in neither of these two different cases, but rather be
>>>>> tailored by each use case to provide the mandatory requirements for that
>>>>> case.
>>>>>
>>>>> Another comment mentioned that this usecase does not apply to many
>>>>> people due to firmware or specific hardware needed.
>>>>> [Eugen]: one interesting proposed usecase is to have a pstore
>>>>> driver/implementation that would traverse the inspection table at panic
>>>>> handler time, then gather data from there to store in the pstore
>>>>> (ramoops, mtdoops or whatever backend) and have it available to the
>>>>> userspace after reboot. This would be a nice use case that does not
>>>>> require firmware nor specific hardware, just pstore backend support.
>>>>>
>>>>> Ending note was whether this implementation is going in a good direction
>>>>> and what would be the way to having it moving upstream.
>>>>>
>>>>> Thanks everyone who attended and came up with ideas and comments.
>>>>> There are a few comments which I may have missed, so please feel free to
>>>>> reply to this email to start a discussion thread on the topic you are
>>>>> interested in.
>>>>>
>>>>> Eugen
>>>>>
>>>>
>>>> Maybe you or someone else has already mentioned this. If so, sorry I missed it.
>>>>
>>>> How does this compare or contrast to VMCOREINFO?
>>>>
>>>> thanks.
>>>
>>> This inspection table could be created in an VMCOREINFO way, the patch
>>> series here[1] is something that would fit it best .
>>>
>>> The drawbacks are :
>>> some static variables have to be registered to VMCOREINFO in their file
>>> of residence. This means including vmcoreinfo header and adding
>>> functions/code there, and everywhere that would be needed , or , the
>>> variables have to be un-static'ed , which is a no-go.
>>> This received more negative opinions on that particular patch series.
>>> The annotation idea seemed cleaner and simpler, and more generic.
>>>
>>> We could add more and more entries to the vmcoreinfo table, but that
>>> would mean expanding it a lot, which it would maybe defy its purpose,
>>> and be getting too big, especially for the cases where custom drivers
>>> would like to register data.
>>>
>>> How I see it, is that maybe the vmcoreinfo init function, could also
>>> parse the inspection table and create more entries if that is needed.
>>> So somehow memory inspection is a superset or generalization , while
>>> VMCOREINFO is a more particular use case that would fit here.
>>>
>>> Do you think of some better way to integrate the meminspect table into
>>> VMCOREINFO ?
>>
>> No, I just wanted to make sure that you or someone had looked into that.
>> Thanks for your summary.
> 
> Although you copied Stephen Brennan on this, I think it would be a good idea
> to copy the linux-debuggers@vger.kernel.org mailing list also to see if
> there are any other comments about it. [now done]

Thanks . I copied Stephen because we had a discussion at LPC at his talk
and he also attended my talk.

I also had a nice talk with Kees Cook and he was very interested in
having pstore as a backend for meminspect. (copied now as well)

> 
>>> [1]
>>> https://lore.kernel.org/all/20250912150855.2901211-1-eugen.hristev@linaro.org/
>>
> 


