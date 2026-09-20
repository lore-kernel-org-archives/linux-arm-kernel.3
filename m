Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51B45C982D0
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 08:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t8CTYyRXY2aAud9otm1AgJf6WMdrU7YgSbJhEbsEEJg=; b=vfQqrHdbucK7mg28dOaGf0gdic
	XSzJSEg3dDA5lC2gBAP7UhqIUHmcqPG+xkQc0UdhHb5uJfmdUrq8DgZcjPldpJSFLck/ZDHiE7oCD
	lDWHxLicuNEMZLhfKdBZRoj4RU30xQTbNrRr0Nc7EHlLcNx+ivpTnzoIdp+aJVYt9Vdm3mOtY8GbF
	x7rr+rPdaCrk0yiLbqPL/ALI6H6ryMvo3RzvSDKZ3B/a8XWQA/j6g4OY0E7CVJ5CPcnccDa7q1gEE
	amUOxIpIGH6ZKGZmJCq9VpqvGma6Hta8A4s5O7EwrBkGKXbhIQWnOmaQhO9BSI2Zdw8KRuvRNcsYx
	48Fyz8lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8CTs-0000000H4lI-2Fqp;
	Sun, 20 Sep 2026 08:01:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8CTr-0000000H4jd-08Aq
	for linux-arm-kernel@bombadil.infradead.org;
	Sun, 20 Sep 2026 08:00:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=t8CTYyRXY2aAud9otm1AgJf6WMdrU7YgSbJhEbsEEJg=; b=RqPpf1Mbl8hpBVfac0fgX/4uqW
	SwUjMuzm1O+60N9yTLa6cum59+awjcmkknw16awzjhl85OSuvJwcTo0Ue7Ij1atmBTZT/XKVSxTpv
	36jiIsFvjhvPyURfr6C1u6mCOMKjXw5LQg8PPCJp6kX1haxrnjeKa1CAjav1aZm5nPmg79zpfqoHb
	upCz+aNbE55PmcNAzEp14Yiwo1aPtQnqapxVJBi6iHCAztsx7XCpTs92oUDNHsK444Eu79Ow2DKFC
	vEfDGrtQnhIFRLdnbFbq/w1QouiXW4nr66yFC17fo1QlEL7ZeLZfne4dAruJM+jx2ajfFRaW7ENJB
	4lnQt5FQ==;
Received: from mail-pj2-x03.google.com ([2607:f8b0:4864:39::3])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8CTm-0000000BGJL-13ra
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 08:00:57 +0000
Received: by mail-pj2-x03.google.com with SMTP id 98e67ed59e1d1-3859292bb51so199534a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Sep 2026 01:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789891251; x=1790496051; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t8CTYyRXY2aAud9otm1AgJf6WMdrU7YgSbJhEbsEEJg=;
        b=UEe7jbfthxw2A+D6/MgwTFOk0tiTKD42Yr43bITfe/EgKyLe1p4WMvte6tMuG4FkFH
         XHMWRBojJzRPQb172aRuGl2WTA5J7WKjOXe7929R+IuC6Oys+8O6iL3AatTA1kd+g4E7
         /BUe8/CwCXzKZ2sjQYgusn60JDnMp0c0MdH82S7qypUDsTpt0iS9gNlu9++RpOUQqc5M
         i8mTqbVTXm4v/MqkSi0lCxHFAhvcx4yhJVCUjlg5/f30S00eVmmOWFMfhwLJkAg3cwwD
         1klFNkzXXlRON9n9M4sNZ6T6OXDzzvdd4UYun0wxdCNEsDhrffausGjA2XS3bL8g0AcO
         CKGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789891251; x=1790496051;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t8CTYyRXY2aAud9otm1AgJf6WMdrU7YgSbJhEbsEEJg=;
        b=RdGjCZnNJ7Eg4gwUmy9bKy+WZgKU1ni6DFhvQcIbYmE+Cpwv/oCdf0Q5azKBFXgg6o
         LlSEJ8JbTaW7lc/r5UM0EK7YFEtYzlQIzfimD6vJH8Aonc0C71solGUL7+0FsJjHZuJn
         NecNyHAxRnOt9OGVpOLBU5Kka83J8iXip4fvM5WfgqOK/3X75NejBgVEIgyuwXVYP5J0
         omftCTvrHNCdTbUEqpJZWKfK+9J1jyXqA0YW/7FZCEEBITQmCzgMTU3jU/7MnN6GTdcl
         ETey3SFrbPCLnC4ulQX6g/R7P9h8VTYEebXjpP109BnXK9roF2HFM2D1hpqP+qTVgh37
         sAsQ==
X-Forwarded-Encrypted: i=1; AKwUvBwM2kbbaMFmRTippuC5Qrd7qysbLnTy5ccVgHniENUbUn+xrSxbGjosVZ+QAIntC5/Csn40AoLlWpDRqf3KkVds@lists.infradead.org
X-Gm-Message-State: AFuF++kCqOft0up2NP5uP0Apk6IHnihCHo5t4ePO/CiJ4YSqGMEs6AeG
	449hBq+hQ8E7ZQdUHADK2bH9bsVsQm1kWMUjnp9YHIwStFZY+2vWTFZw
X-Gm-Gg: AYBFou2d1BoOx3azIYXGhNZqekgeLdqIywvepxwzdqa40+HOXzpOZJ3LXRdg+CgqJE4
	czl8csozw4h6DU1LcqcwEflHFc9CbdNIIWd9Vb07awO2rqO8Wk2CpMZ5FjLyxecTFsZBhkBCwfE
	SfN1OGd+jmGVj6ZWsrZpHWOQmmyXVoQI9v3kl7dmqemvXXzm871B3VNuFwSbdj6jpwk2NK+lxum
	p7S01/eSCbDLYkjWqGyP3QvMKKfRV2KFVa2HonVvtuJAPHRyrbx3dixazKUf+x8ffQLsmiD7L2Z
	Ratwuwp9QuPUAssCtmX95Cl7IZUX9+cufELC2rfmGREbdIBUp76M7I57AHIbCxES8CkWweiHDwC
	eynfVG8p9umDN/WLNtU1482ErGoUrdvMduPIE/5BNJo+SKMe0gqG9n1fpgfz0zSzwukoPY0i+YQ
	+Xe+L/YetMlL6wQvC1bRiQHlaYv2iqPAI6U5auZdSV8Dlh/v+Y+pR65ABmoSNRhlPEzXsGoizy3
	WNoiQ==
X-Received: by 2002:a17:90a:fc4b:b0:3a0:2900:f55e with SMTP id 98e67ed59e1d1-3a02900f85dmr2402815a91.29.1789891251509;
        Sun, 20 Sep 2026 01:00:51 -0700 (PDT)
Received: from [10.125.112.20] ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6cae997csm7876986a91.11.2026.09.20.01.00.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Sep 2026 01:00:49 -0700 (PDT)
Message-ID: <32b00102-0961-49e3-b780-74d6db182809@gmail.com>
Date: Sun, 20 Sep 2026 16:00:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 06/10] memblock: introduce MEMBLOCK_NODUMP flag
To: Baoquan He <baoquan.he@linux.dev>, Mike Rapoport <rppt@kernel.org>
Cc: catalin.marinas@arm.com, will@kernel.org, chenhuacai@kernel.org,
 pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, tglx@kernel.org,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
 robh@kernel.org, saravanak@kernel.org, akpm@linux-foundation.org,
 pasha.tatashin@soleen.com, pratyush@kernel.org, m.szyprowski@samsung.com,
 mark.rutland@arm.com, kernel@xen0n.name, alex@ghiti.fr, hpa@zytor.com,
 ruirui.yang@linux.dev, robin.murphy@arm.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, kexec@lists.infradead.org, linux-mm@kvack.org,
 iommu@lists.linux.dev
References: <20260902073116.802752-1-chenwandun1@gmail.com>
 <20260902073116.802752-7-chenwandun1@gmail.com> <aqzxavL91icLw-Xv@fedora>
 <aq41nFRPtRWTQ7cK@kernel.org> <aq9UGXeqmCfuPHdD@fedora>
Content-Language: en-US
From: Wandun <chenwandun1@gmail.com>
In-Reply-To: <aq9UGXeqmCfuPHdD@fedora>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_090054_552074_010EE23F 
X-CRM114-Status: GOOD (  18.96  )
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



On 9/20/26 11:33, Baoquan He wrote:
> On 09/19/26 at 10:11am, Mike Rapoport wrote:
>> On Fri, Sep 18, 2026 at 04:08:10PM +0800, Baoquan He wrote:
>>> On 09/02/26 at 03:31pm, Wandun Chen wrote:
> ...snip... 
>>>> +/**
>>>> + * memblock_mark_nodump - Mark a memory region with flag MEMBLOCK_NODUMP.
>>>> + * @base: the base phys addr of the region
>>>> + * @size: the size of the region
>>>> + *
>>>> + * Mark the region as not to be included in crash dumps.
>>>> + *
>>>> + * Return: 0 on success, -errno on failure.
>>>> + */
>>>> +int __init_memblock memblock_mark_nodump(phys_addr_t base, phys_addr_t size)
>>>       ~~~~~~~~~~~~~~^
>>> Is it impossible to use at runtime even thought it claims to be generic?
>>
>> This should only happen at boot.
>>
>> Allowing modifications of memblock properties in runtime is a can of worms
>> I don't want to open.
> 
> Thank you. This is why I said this can't be claimed as a generic way to
> mark memory region as no dump. The generic way I'd like to see is
> at any time of system we can mark any unwanted memory region as no dump.
> And it won't impact the behaviour of the current system.

Thanks Mike for the explanation and Baoquan for the suggestion.
I'll drop the "generic" related description in the next version.


Baoquan, by the way, patch 2 is still awaiting review. It rewrites
the riscv side of the code that patch 3 (which you've acked) then
folds into the weak defaults, if you could take a look at it too,
that would be very helpful.

Best regards,
Wandun


> 
>>  
>>>> +{
>>>> +	return memblock_setclr_flag(&memblock.memory, base, size, 1,
>>>> +				    MEMBLOCK_NODUMP);
>>>> +}
>>>> +
>>>>  static bool should_skip_region(struct memblock_type *type,
>>>>  			       struct memblock_region *m,
>>>>  			       int nid, int flags)
>>>> @@ -2887,6 +2902,7 @@ static const char * const flagname[] = {
>>>>  	[ilog2(MEMBLOCK_RSRV_KERN)] = "RSV_KERN",
>>>>  	[ilog2(MEMBLOCK_KHO_SCRATCH)] = "KHO_SCRATCH",
>>>>  	[ilog2(MEMBLOCK_RSRV_HUGETLB)] = "RSV_HUGETLB",
>>>> +	[ilog2(MEMBLOCK_NODUMP)] = "NODUMP",
>>>>  };
>>>>  
>>>>  static int memblock_debug_show(struct seq_file *m, void *private)
>>>> -- 
>>>> 2.43.0
>>>>
>>
>> -- 
>> Sincerely yours,
>> Mike.


