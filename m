Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F7ACC0218D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jan 2025 23:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SBorovLxISpQxReRWbAY3IawlYtW7E9RhIDIPvbSmv4=; b=yWJpMYs1rwKaqYAeWsUaxDBLpo
	6P0LMpzYCNpHirKM5nuxDWOjYQcrBoSPCxkUUA5dsbIUMZcvty+Ne49//T0sa5EziIWuivPzlBcen
	RwmTFMJ3p4GunfVUgekAfzPXJn+FeIIUy4JgoAkmlYWZgQjIDXIqIWri05r/Gt8utA/t+Ra0P/IfU
	vDDyD3KCO73vMTqLAW/Qjqh6hUOHxsdb1cm4Iw6rDHDW/8F2j9AWBmTL5LbBuPaYT3Z2WmD9hCH5k
	N2Hy8msBQHnMo5F+9eU1HIGKADuqpsV6O9A+82SmL9zIFCCzm24uPXMpIjbW3FxXZ9wR7Wcm/qkO/
	Ac5VzN/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdHZj-00000007xwj-0hfp;
	Wed, 29 Jan 2025 23:34:27 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdHX9-00000007xis-3kL0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jan 2025 23:31:49 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2166360285dso2933805ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jan 2025 15:31:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1738193507; x=1738798307; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SBorovLxISpQxReRWbAY3IawlYtW7E9RhIDIPvbSmv4=;
        b=M0ouZ7AZ8jKIbS684e7YFztJ1WFxu+3wCt570uiSy4RVdqL72h/qtOShrYgZGkQOMq
         +6jFoN+OJNov5GTH3pXBDE5qk3UeqlZfekR5BxJwTUWrgoQSrv5uEYohbewO9YSi/nAt
         efnmyxRbD9nAfR9pZUCjUgVbia51nDJ1XfdcI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738193507; x=1738798307;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SBorovLxISpQxReRWbAY3IawlYtW7E9RhIDIPvbSmv4=;
        b=A2MQ9aOeijg3HHZQyDpmREqIUi6UBbiPrtnL8XK4ylOHaISzkrI0xVfeFnJgyGnctW
         LwhOqR/JN0xzpKgkxC4allh5cdNzEu7yzWiLi9ksWNmLgucV9bKBLeNOUeBzzSr8I+1D
         6UCugLHkexGwbpRiBAeuWVQBG0VCe9zqOnqOOlw+hbFfyPPe3RCvrkTvJbdfTAAKelXj
         SGrZVIv7f0gKSSgUXFunT894yJ+FocDsbnNrbqJar1SNJA3LANc6IfVicJGdOtqHuOgp
         CWLZ7dCa6nc5z782GUhjssKL8aFmdt4KfL6yKkqNudFkUxGQzQ4Zur1xVV4W32jOp6Db
         nU7A==
X-Forwarded-Encrypted: i=1; AJvYcCXb4BiYYrcpOVUj/5d79vpOAIQAmZJb+Ovj92yknFw4KP5902edjxenOOoZCDv2NwIJUstQRSrswILd4/r6khek@lists.infradead.org
X-Gm-Message-State: AOJu0Yy38s7xOqoZM3aHck4P18bMO7mJoTjTW3gkoaDz/KXx0TqNnCzW
	M/DldcrJrpm4C4P52gokiyDpCT9dDxtTnmVevLsPdsS7VxOGP7iVJEdD35wifw==
X-Gm-Gg: ASbGncsvJnkQowmWMMctfOL7PmWo6mnzUPU3D2QGGgO487S4G7f1Q9a4awTKlU4Eksg
	ppk9EVsN8dwZwQP9sMfGHkETnPo8ECaT6CIPx7x9GmhMJ9yZqmiDr8kNHhyvMIzgqK8EEtIH6J/
	nzsGz3HO37XUoCuDKLZQUQiH1aMBzH1I8+wLeClrtQjVm6Nz5K5cJ+m0X5Ga1liGmdzfcAJZsO2
	cqXvZ16BZ4VMmEiMEzb9KfrenqQuPZDSDT3cGfKvkF1ZR+tiL1Irx+hcQdV6URwmC3Zcut+5Mb/
	96dcmx4pYoJ8eWXc5azNnMWPHmlkDxYbbY7eI7cLSvVr69NmtfEDzY8=
X-Google-Smtp-Source: AGHT+IFoX3f/KqkRzhPCJukJxXKDS1QIoLOImU8F/rN6UPjtfSTa550gLEFAuRbStb7vmSKrNvKshw==
X-Received: by 2002:a05:6a20:7fa8:b0:1e1:ae4a:1d48 with SMTP id adf61e73a8af0-1ed7a6e1696mr8610257637.40.1738193506894;
        Wed, 29 Jan 2025 15:31:46 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe69cdf76sm33681b3a.129.2025.01.29.15.31.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 15:31:45 -0800 (PST)
Message-ID: <8994e7c5-812c-4605-9bdf-18a5b402196a@broadcom.com>
Date: Wed, 29 Jan 2025 15:31:40 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: mm: account for hotplug memory when randomizing
 the linear region
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Greg KH <gregkh@linuxfoundation.org>, stable@vger.kernel.org,
 Anshuman Khandual <anshuman.khandual@arm.com>, Will Deacon
 <will@kernel.org>, Steven Price <steven.price@arm.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Baruch Siach <baruch@tkos.co.il>,
 Petr Tesarik <ptesarik@suse.com>, Mark Rutland <mark.rutland@arm.com>,
 Joey Gouly <joey.gouly@arm.com>, "Mike Rapoport (IBM)" <rppt@kernel.org>,
 Yang Shi <yang@os.amperecomputing.com>,
 "moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20250109165419.1623683-1-florian.fainelli@broadcom.com>
 <20250109165419.1623683-2-florian.fainelli@broadcom.com>
 <62786457-d4a1-4861-8bec-7e478626f4db@broadcom.com>
 <2025011247-enable-freezing-ffa2@gregkh>
 <27bbea11-61fa-4f41-8b39-8508f2d2e385@broadcom.com>
 <2025012002-tactics-murky-aaab@gregkh>
 <41550c7f-1313-41b4-aa2e-cb4809ad68c2@broadcom.com>
 <2025012938-abreast-explain-f5f7@gregkh>
 <1fc6d5c8-80ec-4d6b-bc14-c584d89c15b4@broadcom.com>
 <CAMj1kXHheRQYHddgehLbZot6o-xAxkbeHBUq7nS8npyB9A0FvQ@mail.gmail.com>
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
In-Reply-To: <CAMj1kXHheRQYHddgehLbZot6o-xAxkbeHBUq7nS8npyB9A0FvQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_153147_990260_423DE485 
X-CRM114-Status: GOOD (  31.35  )
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

On 1/29/25 14:15, Ard Biesheuvel wrote:
> On Wed, 29 Jan 2025 at 18:45, Florian Fainelli
> <florian.fainelli@broadcom.com> wrote:
>>
>> On 1/29/25 01:17, Greg KH wrote:
>>> On Mon, Jan 20, 2025 at 08:33:12AM -0800, Florian Fainelli wrote:
>>>>
>>>>
>>>> On 1/20/2025 5:59 AM, Greg KH wrote:
>>>>> On Mon, Jan 13, 2025 at 07:44:50AM -0800, Florian Fainelli wrote:
>>>>>>
>>>>>>
>>>>>> On 1/12/2025 3:54 AM, Greg KH wrote:
>>>>>>> On Thu, Jan 09, 2025 at 09:01:13AM -0800, Florian Fainelli wrote:
>>>>>>>> On 1/9/25 08:54, Florian Fainelli wrote:
>>>>>>>>> From: Ard Biesheuvel <ardb@kernel.org>
>>>>>>>>>
>>>>>>>>> commit 97d6786e0669daa5c2f2d07a057f574e849dfd3e upstream
>>>>>>>>>
>>>>>>>>> As a hardening measure, we currently randomize the placement of
>>>>>>>>> physical memory inside the linear region when KASLR is in effect.
>>>>>>>>> Since the random offset at which to place the available physical
>>>>>>>>> memory inside the linear region is chosen early at boot, it is
>>>>>>>>> based on the memblock description of memory, which does not cover
>>>>>>>>> hotplug memory. The consequence of this is that the randomization
>>>>>>>>> offset may be chosen such that any hotplugged memory located above
>>>>>>>>> memblock_end_of_DRAM() that appears later is pushed off the end of
>>>>>>>>> the linear region, where it cannot be accessed.
>>>>>>>>>
>>>>>>>>> So let's limit this randomization of the linear region to ensure
>>>>>>>>> that this can no longer happen, by using the CPU's addressable PA
>>>>>>>>> range instead. As it is guaranteed that no hotpluggable memory will
>>>>>>>>> appear that falls outside of that range, we can safely put this PA
>>>>>>>>> range sized window anywhere in the linear region.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
>>>>>>>>> Cc: Anshuman Khandual <anshuman.khandual@arm.com>
>>>>>>>>> Cc: Will Deacon <will@kernel.org>
>>>>>>>>> Cc: Steven Price <steven.price@arm.com>
>>>>>>>>> Cc: Robin Murphy <robin.murphy@arm.com>
>>>>>>>>> Link: https://lore.kernel.org/r/20201014081857.3288-1-ardb@kernel.org
>>>>>>>>> Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
>>>>>>>>> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
>>>>>>>>
>>>>>>>> Forgot to update the patch subject, but this one is for 5.10.
>>>>>>>
>>>>>>> You also forgot to tell us _why_ this is needed :(
>>>>>>
>>>>>> This is explained in the second part of the first paragraph:
>>>>>>
>>>>>> The consequence of this is that the randomization offset may be chosen such
>>>>>> that any hotplugged memory located above memblock_end_of_DRAM() that appears
>>>>>> later is pushed off the end of the linear region, where it cannot be
>>>>>> accessed.
>>>>>>
>>>>>> We use both memory hotplug and KASLR on our systems and that's how we
>>>>>> eventually found out about the bug.
>>>>>
>>>>> And you still have 5.10.y ARM64 systems that need this?  Why not move to
>>>>> a newer kernel version already?
>>>>
>>>> We still have ARM64 systems running 5.4 that need this, and the same bug
>>>> applies to 5.10 that we used to support but dropped in favor of 5.15/6.1.
>>>> Those are the kernel versions used by Android, and Android TV in particular,
>>>> so it's kind of the way it goes for us.
>>>>
>>>>>
>>>>> Anyway, I need an ack from the ARM64 maintainers that this is ok to
>>>>> apply here before I can take it.
>>>>
>>>> Just out of curiosity, the change is pretty innocuous and simple to review,
>>>> why the extra scrutiny needed here?
>>>
>>> Why shouldn't the maintainers review a proposed backport patch for core
>>> kernel code that affects everyone who uses that arch?
>>
>> They should, but they are not, we can keep sending messages like those
>> in the hope that someone does, but clearly that is not working at the
>> moment.
>>
>> This patch cherry picked cleanly into 5.4 and 5.10 maybe they just trust
>> whoever submit stable bugfixes to have done their due diligence, too, I
>> don't know how to get that moving now but it fixes a real problem we
>> observed.
>>
> 
> FWIW, I understand why this might be useful when running under a
> non-KVM hypervisor that relies on memory hotplug to perform resource
> balancing between VMs. But the upshot of this change is that existing
> systems that do not rely on memory hotplug at all will suddenly lose
> any randomization of the linear map if its CPU happens to be able to
> address more than ~40 bits of physical memory. So I'm not convinced
> this is a change we should make for these older kernels.

Are there other patches that we could backport in order not to lose the 
randomization in the linear range?
-- 
Florian

