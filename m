Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BDA8C5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 07:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F8O34Xc16ur4O9EtunTdCdf0boIbkU6LPLycJBfuzuA=; b=d3/KXSuDW3tRDNzS2c0BlfCiPI
	GhwBMZ+9iUULuuMWjfYorDxmw6oLpPnY8N6n5GszondMXQmtUG+rXxslxImRMmti03ASp+iqt1OCQ
	K6tkykcVhhvhgto3V+QnAsfUyFDr9W/CXd1ZZ5Ap5SZ+W5Nqt6N2nQBySyNtO7iegSxKy7ai30BC+
	4JxcpEkpUqFvBEYpm6HI6Bu2EjqaZXhux6BBETh5IJlGrVC5qeAH7qRq0gy5+Wa3wKOeksWmdkZra
	L5h1ElLkLTE/M7EHRSXPYTsME+s5iXEPrleBtC0IIGkBCV4DsSKN8+UzF4LqKVnp4vaiuK3dQm37N
	4o/l1Xgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wumpB-00000002EbI-3brc;
	Fri, 14 Aug 2026 07:59:33 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wumpA-00000002EaB-00t4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 07:59:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786694371;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F8O34Xc16ur4O9EtunTdCdf0boIbkU6LPLycJBfuzuA=;
	b=MfclU3smZ4ERVkOLuce7oR3QjmB1q4gDRmZPRnRejJvif50rxWqDCGlSjV8LBBjCa8ZA/M
	r90jkstzdAgnA8uvPfWq7JPCKYAbTgOZuUg14HdivGsbEHnsQO9kz3ZwMFl3DDO3jfwiem
	/DLZfsOTUckdcnZy4GkZIoVdJbRy2Q8=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-167-hrlwvzU3Oa6mE4FE2-X6Tw-1; Fri, 14 Aug 2026 03:59:24 -0400
X-MC-Unique: hrlwvzU3Oa6mE4FE2-X6Tw-1
X-Mimecast-MFC-AGG-ID: hrlwvzU3Oa6mE4FE2-X6Tw_1786694363
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8485b7e18b4so1006651b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 00:59:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786694363; x=1787299163;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F8O34Xc16ur4O9EtunTdCdf0boIbkU6LPLycJBfuzuA=;
        b=hMZOEk5lbUuh4OXLfR7/wkinYTgoB7D5don4h57ySAdn6dBuyez7JGqelYysr93DnR
         0VUg15of/kse1NiAIKC5HJx6dPizYR/yTgcxFezYgiuhF4C4D0i6lcHWcp+qYCWWpZ1X
         Qq/cUs7G2REDM3H6n8XkFo9wE+uyEPzoutVvRJ6fwa1v19ZVDX33TpdokxAjXtJQ+XL5
         5u1HJTOcfzzUFP+wTTudXVpfU6sWGQLu0nSdMrdL5maHwqg2G24joHFoiDZLvytOZeZC
         Umy0q75hv+GyycHX9XuvD6H/QWaU3xflT4JoRVlcaOw6uW1a/dZyGAzwuwtX10+o/EH2
         cz7g==
X-Forwarded-Encrypted: i=1; AHgh+RpnEpUvsbLG5eUk97zgyDJIJKAr0YM7OeEVr5/h4ikBQUXCUYQxEav7As41bmqgWPF8WgB3kCiHTJ8FFqF2Ogsw@lists.infradead.org
X-Gm-Message-State: AOJu0YzbQQ3CnfdVLD6MUup23PRA0SgfFmYPpxC+uWbosvtiK/LdcRkL
	dT8Fa9jd2Rkke5BCGjPlGV8ZhgT7Dy+nSP0ST1oVfd4ZBmclYQFijcRaHhAtvARzJoaiaYh3kzX
	advz8CQ4EeV0eh93/ueL1HeL0GvmldALRH144Nyl/ES7zujoFLIQlyIK+kThRsVNui1fEpzNzsN
	mL
X-Gm-Gg: AR+sD13bzNuwOHqNrzlLJu1BcgcXDqioAjpDC98ayX9gqMyW1LqlsDBoVUC0wh6tIkk
	Sl4T88MiWFbVJM4jaADn9I0GUa+A9nzjxU0TJCc++KD9jn7W1DQBQ9RKzZe3wskLu8mj6GyMimf
	z6GPFiJEpbGE0estZ1b4dyi2Urax3rHLbPG0pj+aVCrrnR2ZI0UEQjMpGZnkrLs2r4VK6R9IQKx
	2G6R6aevc7sxA/btloA7ed+/Hxtx/DhC8XMCmRH4Wr1rwwTxp3rV5zU95EZNNA+22kAqenEV85t
	4HcEQ6CQ6djP4km7sVMLO7rT/5dwjGh2m/kD8i696+/9tyIfVeTyP30m1GbkZXO2ToR2xt7rFUL
	hDLWNO5g50oEVUEq5kQ==
X-Received: by 2002:a05:6a00:2d98:b0:84a:646f:193 with SMTP id d2e1a72fcca58-84fdde42b9bmr3951008b3a.0.1786694363296;
        Fri, 14 Aug 2026 00:59:23 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d98:b0:84a:646f:193 with SMTP id d2e1a72fcca58-84fdde42b9bmr3950974b3a.0.1786694362810;
        Fri, 14 Aug 2026 00:59:22 -0700 (PDT)
Received: from [192.168.1.2] ([122.171.16.134])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8517d249b26sm121142b3a.43.2026.08.14.00.59.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2026 00:59:22 -0700 (PDT)
Message-ID: <81cb568c-e65f-4359-9c6f-f994f910f2f1@redhat.com>
Date: Fri, 14 Aug 2026 13:29:15 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kexec: return -ENOEXEC from image probe functions on
 mismatch
To: Philipp Rudo <prudo@redhat.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Andrew Morton <akpm@linux-foundation.org>,
 Baoquan He <baoquan.he@linux.dev>, Mike Rapoport <rppt@kernel.org>,
 Pasha Tatashin <pasha.tatashin@soleen.com>,
 Pratyush Yadav <pratyush@kernel.org>, Tao Liu <ltao@redhat.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 kexec@lists.infradead.org
References: <20260813-mpilaniy-v1-1-777d4d0e30f7@redhat.com>
 <20260813151350.6b511155@rotkaeppchen>
From: Mukesh Pilaniya <mpilaniy@redhat.com>
In-Reply-To: <20260813151350.6b511155@rotkaeppchen>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: HENZrUbjR2avvi-odl4nTmXHbvVmRK8pVrOGMMT2g9o_1786694363
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_005932_121457_13F82165 
X-CRM114-Status: GOOD (  23.95  )
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


Hi Philipp,

On 13/08/26 6:43 pm, Philipp Rudo wrote:
> Hi Mukesh,
> 
> the patch looks good to me.
> 
> There is also a corresponding kexec-tools patch, which was accidentally
> opened as a Github PR (https://github.com/horms/kexec-tools/pull/12).
> It will be sent to kexec@lists.infradead.org shortly.
> 
> Thanks
> 
> Reviewed-by: Philipp Rudo <prudo@redhat.com>
> 
The kexec-tools patch has now been posted to the mailing list.
It can be found here:
https://lore.kernel.org/all/20260814075329.30203-1-mpilaniy@redhat.com/

> On Thu, 13 Aug 2026 12:36:29 +0530
> Mukesh Pilaniya <mpilaniy@redhat.com> wrote:
> 
>> Several kexec_file_load() image probe functions return -EINVAL when
>> they do not recognize the image format.  A probe function that rejects
>> an image should return -ENOEXEC to indicate that the image is not a
>> recognized executable format.  -EINVAL implies a problem with the
>> syscall parameters, not with image recognition.
>>
>> kexec_image_probe_default() iterates through registered loaders and
>> returns the last probe's error code to the caller.  That error
>> propagates as the kexec_file_load() return value to userspace.
>> Returning -EINVAL from a probe when no loader matches is semantically
>> incorrect and misleads userspace about the nature of the failure.
>>
>> Return -ENOEXEC from all probe functions and their helpers when the
>> image format is not recognized.
>>
>> Signed-off-by: Mukesh Pilaniya <mpilaniy@redhat.com>
>> ---
>> branch: next-20260812
>> base commit: 28d012efb4327f9c75d5e042a7c91e9a542efa98
>> ---
>>   arch/arm64/kernel/kexec_image.c   | 4 ++--
>>   arch/loongarch/kernel/kexec_efi.c | 4 ++--
>>   arch/riscv/kernel/kexec_image.c   | 4 ++--
>>   kernel/kexec_elf.c                | 4 ++--
>>   4 files changed, 8 insertions(+), 8 deletions(-)
>>
>> diff --git a/arch/arm64/kernel/kexec_image.c b/arch/arm64/kernel/kexec_image.c
>> index b70f4df15a1a..101259874d44 100644
>> --- a/arch/arm64/kernel/kexec_image.c
>> +++ b/arch/arm64/kernel/kexec_image.c
>> @@ -25,10 +25,10 @@ static int image_probe(const char *kernel_buf, unsigned long kernel_len)
>>   		(const struct arm64_image_header *)(kernel_buf);
>>   
>>   	if (!h || (kernel_len < sizeof(*h)))
>> -		return -EINVAL;
>> +		return -ENOEXEC;
>>   
>>   	if (memcmp(&h->magic, ARM64_IMAGE_MAGIC, sizeof(h->magic)))
>> -		return -EINVAL;
>> +		return -ENOEXEC;
>>   
>>   	return 0;
>>   }
>> diff --git a/arch/loongarch/kernel/kexec_efi.c b/arch/loongarch/kernel/kexec_efi.c
>> index 5ee78ebb1546..28a1d0420ba3 100644
>> --- a/arch/loongarch/kernel/kexec_efi.c
>> +++ b/arch/loongarch/kernel/kexec_efi.c
>> @@ -24,12 +24,12 @@ static int efi_kexec_probe(const char *kernel_buf, unsigned long kernel_len)
>>   
>>   	if (!h || (kernel_len < sizeof(*h))) {
>>   		kexec_dprintk("No LoongArch image header.\n");
>> -		return -EINVAL;
>> +		return -ENOEXEC;
>>   	}
>>   
>>   	if (!loongarch_header_check_dos_sig(h)) {
>>   		kexec_dprintk("No LoongArch PE image header.\n");
>> -		return -EINVAL;
>> +		return -ENOEXEC;
>>   	}
>>   
>>   	return 0;
>> diff --git a/arch/riscv/kernel/kexec_image.c b/arch/riscv/kernel/kexec_image.c
>> index 51dc89259f16..963a25f5b55b 100644
>> --- a/arch/riscv/kernel/kexec_image.c
>> +++ b/arch/riscv/kernel/kexec_image.c
>> @@ -20,7 +20,7 @@ static int image_probe(const char *kernel_buf, unsigned long kernel_len)
>>   	const struct riscv_image_header *h = (const struct riscv_image_header *)kernel_buf;
>>   
>>   	if (!h || kernel_len < sizeof(*h))
>> -		return -EINVAL;
>> +		return -ENOEXEC;
>>   
>>   	/* According to Documentation/arch/riscv/boot-image-header.rst,
>>   	 * use "magic2" field to check when version >= 0.2.
>> @@ -28,7 +28,7 @@ static int image_probe(const char *kernel_buf, unsigned long kernel_len)
>>   
>>   	if (h->version >= RISCV_HEADER_VERSION &&
>>   	    memcmp(&h->magic2, RISCV_IMAGE_MAGIC2, sizeof(h->magic2)))
>> -		return -EINVAL;
>> +		return -ENOEXEC;
>>   
>>   	return 0;
>>   }
>> diff --git a/kernel/kexec_elf.c b/kernel/kexec_elf.c
>> index 3a5c25b2adc9..89a444a00693 100644
>> --- a/kernel/kexec_elf.c
>> +++ b/kernel/kexec_elf.c
>> @@ -172,7 +172,7 @@ static int elf_read_ehdr(const char *buf, size_t len, struct elfhdr *ehdr)
>>   
>>   	default:
>>   		pr_debug("Unknown ELF class.\n");
>> -		return -EINVAL;
>> +		return -ENOEXEC;
>>   	}
>>   
>>   	return elf_is_ehdr_sane(ehdr, len) ? 0 : -ENOEXEC;
>> @@ -236,7 +236,7 @@ static int elf_read_phdr(const char *buf, size_t len,
>>   
>>   	default:
>>   		pr_debug("Unknown ELF class.\n");
>> -		return -EINVAL;
>> +		return -ENOEXEC;
>>   	}
>>   
>>   	return elf_is_phdr_sane(phdr, len) ? 0 : -ENOEXEC;
>>
>> ---
>> base-commit: 28d012efb4327f9c75d5e042a7c91e9a542efa98
>> change-id: 20260813-mpilaniy-ffb0cc92c313
>>
>> Best regards,
>> --
>> Mukesh Pilaniya <mpilaniy@redhat.com>
>>
> 


