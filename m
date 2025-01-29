Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AB37C0218D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jan 2025 18:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DrCQOuFa6l/xRX2rnecr/gRUO/M95pHUhfJz5UMBqm4=; b=Ap9aUNwnD3IgBOjV5fRAt2Cv9z
	ehYueJCBhOmjhx5RNjFDfhpYcZ+3X5dT015Vd/ByCkg7sJQ946nqYvWliwB36TzuiefnHoYeuKCcb
	nUOc3ZpzLminOaHN0bXMPfUgCpxsxcsy6yw5x0kMNQuo2vON0l3LwFxsJxOGsEsG77V6pW0Pi6uNi
	sxiVIbwz0FeDj1dtxYk0vzfkQ7hCyCSH8nACyrdxk4muYUcM1/JE+CxIOmIJwPVVx6S9FUAue7uEE
	xSGeQR/1XAyVyYbQNGTaOQCkHVPSDZOZSP72dfOLEgs+gwMNX3A63DhWzppVrBYtb+ade4zd0z6FS
	qGkeRT0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdCSs-00000007Zh5-44t6;
	Wed, 29 Jan 2025 18:07:02 +0000
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdCRU-00000007ZWA-1Uj3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jan 2025 18:05:42 +0000
Received: by mail-oi1-x22d.google.com with SMTP id 5614622812f47-3eb8accbde3so565375b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jan 2025 10:05:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1738173935; x=1738778735; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DrCQOuFa6l/xRX2rnecr/gRUO/M95pHUhfJz5UMBqm4=;
        b=GaXEJHrjbVidbDlM9Zivf5xvlxR24sasMg/kuFgX0o4DFnO3dSkehI9/4AhBLEzbOu
         /SxeQm+MeHiSfhvsYLM554RFaTeE8vJpXyYGnoVKGSRDIgWy6ogSVXJIlgNvVBMDfFZ9
         nK/mySHWe4VWo33CZvDLa8kn+b428iyd0Mzro=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738173935; x=1738778735;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DrCQOuFa6l/xRX2rnecr/gRUO/M95pHUhfJz5UMBqm4=;
        b=rNJAAPk/YqaAsJ1fQXAmDDqiIPydWIrLyQu+HzxkI/tboTVF9cQAqDfces0N0+XkxB
         ZlXeTJOmSbnYOD4PiWrivXfiu1rLqjffyv2WOkR0rYoJ3q69WzpHZBqC9EOxx9v8osoC
         h/SfvG3SCfoZx3Y+dhfN1USJBkBJKVONYWVYjBJlMG1ybYwzXLQwFLL46YVK6i0AhS1x
         SQl70gVbmgIUc0Gi9mEN3XrzMFrsNSy26AcCBrWvm4vmtjv83yn4mJZxCalaEIt9iLI7
         ptVlZDM/dEu/1VXBk9AIuVVVsrHHfl0/L9GEDzDt++afImYLgOGkJcNPm/qjprXurKig
         vq5g==
X-Forwarded-Encrypted: i=1; AJvYcCXNj6TqoMVQYzR9mI1/vcGLyXAoJpeqLpMIM2iJXbkDmHv4s6HPjp4YBvwb6TF0RuUzMV+rKvve/A1vaWvK5orl@lists.infradead.org
X-Gm-Message-State: AOJu0YzgGzQJihmh2plS5QdbnRNUfxJKw1xJSPSj3ZHPzL0hg2jWhepb
	BuIO96d3mecEzkDms5zmrp01TyZ1mFexVctcLbNWOXrADvLYPrU8LG730t1rgw==
X-Gm-Gg: ASbGncvqV8FAq/QJiWoiAf/PQzsoeyT/I3/QbPXI5PxasbFpfUQJs21BbxQzwd395vM
	5xJq4UKMDxmjsVn6/Oe6KIaGDK0+2p1H+68MVXWBt9nrH2rVvxUEoALir5qk2ZmSKt21xfUS86X
	k5vXJYPX4i5xUicBZUnaK/gBg08+SSrFAPqS0cEUEdgeOgDVgAU1A1JBQkWSD4iZw4ocN8fMQnl
	vnQfkuJypy/hWkKmyo8rOsTIPNGVCAN8WDDEeP+Gh458qXFt7N1pfz6yrdTul6xXPayjuCqIkUv
	vmgyEOFOdF5tpEeDoOhK6Zc7CS8d+aWVGDpVSUEMPRjW1JwdMkJIofU=
X-Google-Smtp-Source: AGHT+IHK6s97CUwK+kadE59Hks/0lrOCzfa2i8Af29kyMeDIF8LB0pBhMRxIhpWy17frQ5IaPxmD8g==
X-Received: by 2002:a05:6808:1a1c:b0:3ea:4b5c:60a8 with SMTP id 5614622812f47-3f330e930e6mr167264b6e.17.1738173934845;
        Wed, 29 Jan 2025 10:05:34 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3f1f09bc270sm3930646b6e.44.2025.01.29.10.05.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 10:05:33 -0800 (PST)
Message-ID: <213f28ff-2034-467e-8269-58b6e6f578df@broadcom.com>
Date: Wed, 29 Jan 2025 10:05:29 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH stable 5.4] arm64: mm: account for hotplug memory when
 randomizing the linear region
To: Greg KH <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>, Will Deacon
 <will@kernel.org>, Steven Price <steven.price@arm.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Baruch Siach <baruch@tkos.co.il>,
 Petr Tesarik <ptesarik@suse.com>, Joey Gouly <joey.gouly@arm.com>,
 "Mike Rapoport (IBM)" <rppt@kernel.org>, Baoquan He <bhe@redhat.com>,
 Yang Shi <yang@os.amperecomputing.com>,
 "moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20250109165419.1623683-1-florian.fainelli@broadcom.com>
 <2025011217-swizzle-unusual-dd7b@gregkh>
Content-Language: en-US
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <2025011217-swizzle-unusual-dd7b@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_100536_447932_398ED771 
X-CRM114-Status: GOOD (  29.58  )
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

On 1/12/25 03:53, Greg KH wrote:
> On Thu, Jan 09, 2025 at 08:54:16AM -0800, Florian Fainelli wrote:
>> From: Ard Biesheuvel <ardb@kernel.org>
>>
>> commit 97d6786e0669daa5c2f2d07a057f574e849dfd3e upstream
>>
>> As a hardening measure, we currently randomize the placement of
>> physical memory inside the linear region when KASLR is in effect.
>> Since the random offset at which to place the available physical
>> memory inside the linear region is chosen early at boot, it is
>> based on the memblock description of memory, which does not cover
>> hotplug memory. The consequence of this is that the randomization
>> offset may be chosen such that any hotplugged memory located above
>> memblock_end_of_DRAM() that appears later is pushed off the end of
>> the linear region, where it cannot be accessed.
>>
>> So let's limit this randomization of the linear region to ensure
>> that this can no longer happen, by using the CPU's addressable PA
>> range instead. As it is guaranteed that no hotpluggable memory will
>> appear that falls outside of that range, we can safely put this PA
>> range sized window anywhere in the linear region.
>>
>> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
>> Cc: Anshuman Khandual <anshuman.khandual@arm.com>
>> Cc: Will Deacon <will@kernel.org>
>> Cc: Steven Price <steven.price@arm.com>
>> Cc: Robin Murphy <robin.murphy@arm.com>
>> Link: https://lore.kernel.org/r/20201014081857.3288-1-ardb@kernel.org
>> Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
>> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
>> ---
>>   arch/arm64/mm/init.c | 13 ++++++++-----
>>   1 file changed, 8 insertions(+), 5 deletions(-)
>>
>> diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
>> index cbcac03c0e0d..a6034645d6f7 100644
>> --- a/arch/arm64/mm/init.c
>> +++ b/arch/arm64/mm/init.c
>> @@ -392,15 +392,18 @@ void __init arm64_memblock_init(void)
>>   
>>   	if (IS_ENABLED(CONFIG_RANDOMIZE_BASE)) {
>>   		extern u16 memstart_offset_seed;
>> -		u64 range = linear_region_size -
>> -			    (memblock_end_of_DRAM() - memblock_start_of_DRAM());
>> +		u64 mmfr0 = read_cpuid(ID_AA64MMFR0_EL1);
>> +		int parange = cpuid_feature_extract_unsigned_field(
>> +					mmfr0, ID_AA64MMFR0_PARANGE_SHIFT);
>> +		s64 range = linear_region_size -
>> +			    BIT(id_aa64mmfr0_parange_to_phys_shift(parange));
>>   
>>   		/*
>>   		 * If the size of the linear region exceeds, by a sufficient
>> -		 * margin, the size of the region that the available physical
>> -		 * memory spans, randomize the linear region as well.
>> +		 * margin, the size of the region that the physical memory can
>> +		 * span, randomize the linear region as well.
>>   		 */
>> -		if (memstart_offset_seed > 0 && range >= ARM64_MEMSTART_ALIGN) {
>> +		if (memstart_offset_seed > 0 && range >= (s64)ARM64_MEMSTART_ALIGN) {
>>   			range /= ARM64_MEMSTART_ALIGN;
>>   			memstart_addr -= ARM64_MEMSTART_ALIGN *
>>   					 ((range * memstart_offset_seed) >> 16);
>> -- 
>> 2.43.0
>>
>>
> 
> You are not providing any information as to WHY this is needed in stable
> kernels at all.  It just looks like an unsolicted backport with no
> changes from upstream, yet no hint as to any bug it fixes.

See the response in the other thread.

> 
> And you all really have hotpluggable memory on systems that are running
> th is old kernel?  Why are they not using newer kernels if they need
> this?  Surely lots of other bugs they need are resolved there, right?

Believe it or not, but memory hotplug works really well for us, in a 
somewhat limited configuration on the 5.4 kernel whereby we simply plug 
memory, and never unplug it thereafter, but still, we have not had to 
carry hotplug related patches other than this one.

Trying to be a good citizen here: one of my colleague has identified an 
upstream fix that works, that we got tested, cherry picked cleanly into 
both 5.4 and 5.10, so it's not even like there was any fuzz.

I was sort of hoping that giving my history of regularly testing stable 
kernels for the past years, as well as submitting a fair amount of 
targeted bug fixes to the stable branches that there would be some level 
of trust here.

Thanks
-- 
Florian

