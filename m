Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D035CD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 01:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R9vTs/JHnHpc6BmzGsq91wlnVhg5cqc1lx/XeBVEZpQ=; b=FYNqGJHLH6Ce31XCc5ApLwjGkH
	AwL2tGCjiI3cft+VdjM3BFVuO1PJvps3q8EL7oVVpCZiTWNDcVmNzzGkhTyDkt2ASad1jbp9r2dFm
	r3GmGEct2d2M7eSBZxRhKEJHKjd46J4fe9dGxaBHL8dq4fc+ny2qhth5lmKvyL2ZvtALr3VJq7gcf
	TBpy0N0MvH18Di2RErR/oIrgnZpGshi8ifHHEdr41wvbCdQ4oswQfazqXwLXBXF+aVwmgjNXVQVhQ
	xZ46eJzNudOJxIBRLsKNiiiJcM44ISvbxaLuA93cNDPaJeaab+9lILnGJxDPJYRIVwUYpFt2N3cml
	WCGNmVlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUxCj-0000000G0wn-1EpA;
	Thu, 04 Jun 2026 01:49:05 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUxCg-0000000G0vW-27IV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 01:49:03 +0000
Received: by mail-pf1-x444.google.com with SMTP id d2e1a72fcca58-84226d0f1d2so114635b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 18:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780537741; x=1781142541; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R9vTs/JHnHpc6BmzGsq91wlnVhg5cqc1lx/XeBVEZpQ=;
        b=L4XKFYKONzxQnpbJmaajbcoZwf2Mb1ccFOtp52+V8Ox4dNkaqq+iZOgJnRViqZn82F
         d7h2bvhnSeMQqeQSFRprqdf4VfAF2+gRj4UdVOMaVTR+pqc8Du4gGuA68ty634It7mu7
         Oi1vjIjvEceEnxmEqEmE34BPY6sOpRoV1CkYvgBzEUFsH0yXGQ3wL653VQaOoksfQ0C/
         jOWTA1gImpf9aRTI86kS4HGC2RXBAUIbV3MHsPR/7DwfhHdS8duI/wc/NRol5zcRUvIa
         j/TrOdlXC+Eu7Y2yYsx32BgGfmxtlk5VOo/T0iTW5Fia6SLD7oOt8DKWQPq+pN8M/UEE
         EJTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780537741; x=1781142541;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R9vTs/JHnHpc6BmzGsq91wlnVhg5cqc1lx/XeBVEZpQ=;
        b=lObTlN2zIO4Ua1Ro52WRNKvlywBexJBr+46bMlLRpYuK9HOE00q5NrS858qQt1UB0K
         sYsTmOTshtLzhi2Zkc5dtITZi3MiAHlfsN4dTRha/GU8Cv+w0jHFTjxDrZd+05gYhk+z
         a/+4LZBogYtwGnfTu7AHS6a4mqThsvwNl6Fhxbg4qERvXUWXZoroZVRnSbOCXe9RFi/O
         pg+eYg4eBrGa2CJ1iPdl9+kgSaySjFbR2lVpBod8faP5Tj8fKHI7397VrFoxhjDsJ/MC
         o9ENfSdrYcQMFZJXztb7NEiYGFJukz4a+VGYNM0I6LdoIPO0YW866qzpW1YwBILPANM4
         yVjQ==
X-Gm-Message-State: AOJu0Yy1B2PL/TGegZAKulZjm/j6UJE9kaHGkWSrKtrpIOLTpk8gcruG
	7f3lyU0tp0Kw1XeLKD8EMNjZFda9lPSYJ8bAZ5BgV5p9CvF7F6Em3D3y
X-Gm-Gg: Acq92OGhHqB919O2DfAavdMY9LaNQoXny1dnQt6/5ubWc58Hj65TnA38hyF90rgiBh9
	sRhtRQdyn3VLDRFz/DAVkad6ykjKxiq2wQBdVEbbgYca1nuSgJLr8rMqpK0KSCl6ESMeOlI2UiK
	3P2X0wLoZbK9xfWEPkLNsKFaZA2Niva8tC98iByH6LYNgEQzUPBiR/BbwsdKwFfHYVoukrHkFuE
	zKRrqgLlR6YijtwQ8kgUGiXhsJ+OWVDLZ8gPskcSVUtii1p3ukxI8Ajb5S/pF9+KrrirtytkwUW
	4XWWIeeS6WbPfsE3nyTWCuciXv4qEcsOKcFzX/fKOgNumv/yegeabOs04rjGbFN4Ag2/48Gmsiw
	dFgDOoeIrzt+njjbMHD+9ykeAcAHkxhvGTQGkZX/B6f6dETGsAsYL3vsDQ3Mg5Im/7OY912rE+7
	7TCwR73nBHWxTLjOcv/rZIwcdt2F+1kj0EuzL8xlYoxg==
X-Received: by 2002:aa7:8882:0:b0:842:38d2:a35f with SMTP id d2e1a72fcca58-84284e8dc75mr6032800b3a.31.1780537741272;
        Wed, 03 Jun 2026 18:49:01 -0700 (PDT)
Received: from [10.125.112.20] ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282350f8csm4439444b3a.14.2026.06.03.18.48.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 18:49:00 -0700 (PDT)
Message-ID: <8e088395-c22d-4bc8-9e58-84235af1e56b@gmail.com>
Date: Thu, 4 Jun 2026 09:48:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/11] of: reserved_mem: avoid post-init UAF when
 alloc_reserved_mem_array() fails
To: Rob Herring <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, kexec@lists.infradead.org,
 iommu@lists.linux.dev, zhaomeijing@lixiang.com, catalin.marinas@arm.com,
 will@kernel.org, chenhuacai@kernel.org, kernel@xen0n.name, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 saravanak@kernel.org, akpm@linux-foundation.org, bhe@redhat.com,
 rppt@kernel.org, pasha.tatashin@soleen.com, pratyush@kernel.org,
 ruirui.yang@linux.dev, m.szyprowski@samsung.com, robin.murphy@arm.com,
 quic_obabatun@quicinc.com
References: <20260527032917.3385849-1-chenwandun1@gmail.com>
 <20260527032917.3385849-4-chenwandun1@gmail.com>
 <20260602162450.GA442759-robh@kernel.org>
 <79932afc-2e91-4a54-aff9-f550be784c36@gmail.com>
 <CAL_JsqJOC1ko1Len3Dyc5SNKrHmhQn9uiDAkFfVbYa2wAfFUTg@mail.gmail.com>
Content-Language: en-US
From: Wandun <chenwandun1@gmail.com>
In-Reply-To: <CAL_JsqJOC1ko1Len3Dyc5SNKrHmhQn9uiDAkFfVbYa2wAfFUTg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_184902_550130_8FAA4AA3 
X-CRM114-Status: GOOD (  21.26  )
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



On 6/4/26 01:44, Rob Herring wrote:
> On Wed, Jun 3, 2026 at 1:44 AM Wandun <chenwandun1@gmail.com> wrote:
>>
>>
>> On 6/3/26 00:24, Rob Herring wrote:
>>> On Wed, May 27, 2026 at 11:29:09AM +0800, Wandun Chen wrote:
>>>> From: Wandun Chen <chenwandun@lixiang.com>
>>>>
>>>> The global pointer 'reserved_mem' continues to reference the
>>>> reserved_mem_array which lives in __initdata if
>>>> alloc_reserved_mem_array() fails. of_reserved_mem_lookup() is
>>>> exported for post-init use, that would dereference freed memory
>>>> and trigger a use-after-free.
>>>>
>>>> So reset reserved_mem_count to 0 when alloc_reserved_mem_array()
>>>> fails.
>>>>
>>>> Fixes: 00c9a452a235 ("of: reserved_mem: Add code to dynamically allocate reserved_mem array")
>>> Fixes should come first in a series.
>> Understood, will do in future submissions.
>>>> Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
>>>> ---
>>>>    drivers/of/of_reserved_mem.c | 20 ++++++++++++++------
>>>>    1 file changed, 14 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
>>>> index 313cbc57aa45..6d479381ff1f 100644
>>>> --- a/drivers/of/of_reserved_mem.c
>>>> +++ b/drivers/of/of_reserved_mem.c
>>>> @@ -69,29 +69,31 @@ static int __init early_init_dt_alloc_reserved_memory_arch(phys_addr_t size,
>>>>     * the initial static array is copied over to this new array and
>>>>     * the new array is used from this point on.
>>>>     */
>>>> -static void __init alloc_reserved_mem_array(void)
>>>> +static bool __init alloc_reserved_mem_array(void)
>>>>    {
>>>>       struct reserved_mem *new_array;
>>>>       size_t alloc_size, copy_size, memset_size;
>>>>
>>>> +    if (!total_reserved_mem_cnt)
>>>> +            return true;
>>>> +
>>>>       alloc_size = array_size(total_reserved_mem_cnt, sizeof(*new_array));
>>>>       if (alloc_size == SIZE_MAX) {
>>>>               pr_err("Failed to allocate memory for reserved_mem array with err: %d", -EOVERFLOW);
>>>> -            return;
>>>> +            goto fail;
>>>>       }
>>>>
>>>>       new_array = memblock_alloc(alloc_size, SMP_CACHE_BYTES);
>>>>       if (!new_array) {
>>>>               pr_err("Failed to allocate memory for reserved_mem array with err: %d", -ENOMEM);
>>>> -            return;
>>>> +            goto fail;
>>>>       }
>>>>
>>>>       copy_size = array_size(reserved_mem_count, sizeof(*new_array));
>>>>       if (copy_size == SIZE_MAX) {
>>>>               memblock_free(new_array, alloc_size);
>>>> -            total_reserved_mem_cnt = MAX_RESERVED_REGIONS;
>>>>               pr_err("Failed to allocate memory for reserved_mem array with err: %d", -EOVERFLOW);
>>> These prints could be moved to 'fail'. Perhaps instead of just printing
>>> an error value, you can return the error value instead of boolean.
>> Will do, consolidating pr_err() under 'fail' and changing the return type
>> to int.
>>> If you respin just this patch, I can pick it up for 7.2.
>> Before I respin, I'd like to flag a dependency:
>> patch 05/07 in this series build on the signature change introduced by this
>> patch ("the void -> bool return type change of alloc_reserved_mem_array()")
>>
>> Could you let me know which of the following you'd prefer:
>> a) Take patch 03 alone via your tree as you suggested, after it lands, I'll
>>      respin the remaining patches of this series.
> I would go with this option. AIUI, this series isn't going to land in
> 7.2, so ultimately you will rebase on v7.2-rc1 which will have the
> fix.
OK, will send v4.

Best regards,
Wandun
>
>> b) Keep patch 03 in the v4 respin of the full series, reordered to the front
>>      per your earlier comment.
>
> Rob


