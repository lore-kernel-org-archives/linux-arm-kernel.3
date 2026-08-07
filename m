Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0881C5AC7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 07:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7S8dBK6YhaGNGXZXuOaaURDNFzX4xHQ7yoGCrlFysFs=; b=Ow73K2nlrQ/hJ8ko+ADZNHCtp9
	5ihq7HgNW3A3x8Z+lbh7ohbcDeRW5/XXOEuFnWQZuBxM+VsIfdchQqUIIeCI1EkgjeJkcnWz3It8C
	ogteDhVJF2tKZKA4L0iwOzJYDV0n+x8xI9QF/0vHOlq5PA3eJT/IgswQNRPTwQwJktOJ6VuOuyt9M
	ivOXiue+7zLlZH17kiw9XvRW3Ldz5Ae2h2Jofq+md8Nz2CDSd406oOLK7m7kDOP9KsOIj5oUH7jd5
	12tdT28Z20+IVjeh+sKKAhSkIFG5CkRt7ZIA5kCvsWxU0+HQ4eR3D7QiV2FRltIFn1oq9SWzUD+LE
	oSIsh7Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFEn-00000007HXh-1KFE;
	Fri, 07 Aug 2026 07:43:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFEl-00000007HWJ-1f31
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 07 Aug 2026 07:43:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=7S8dBK6YhaGNGXZXuOaaURDNFzX4xHQ7yoGCrlFysFs=; b=YcA+n/qdCCUTZQzB2SO7RSWyYd
	Sqz//OwPq3ItNxLBu4WoD3VPY/D8xeSpo2+NJW4RehTLIl3G9uZxqkGjKfWmrX0ES0g2BER0sTM7D
	w/aQiu8Wu5O78Ch5OC7eY/hcLNbl2izSJdmbTJXQrJ9e0vzw9BbiuFKJadeQdGhxP7BppL0bWTXX3
	7Rf3cfhAoR2pXybmCjgmM1t6KQa58BxbG/rHyaybPKYABdux51RUCj1wzTqg/j9Teyc6wV0SBQ5yJ
	MP09x4cuCSjfEgi6EFGGTrgqy4vHKNkdibzIOitWDWFkImNmS83CxBPKCB8nYJ2obsnVni4j9ZW6r
	rtpkNENw==;
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wsFEi-0000000C9RW-2I1G
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 07:43:26 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-472326ca506so1995869f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 00:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osyx-tech.20251104.gappssmtp.com; s=20251104; t=1786088603; x=1786693403; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7S8dBK6YhaGNGXZXuOaaURDNFzX4xHQ7yoGCrlFysFs=;
        b=i6DyVHB1ZxJ2nIsVGI7vVvtS+JyUymsnTI+k9yintYPkDz1vjmWAcd/hv47dN6uXLz
         KitWX05hDkgDvk3+AKK1b0nl4ghwqGyyHjVZtlv5Pn5CMmrDODeKkqMH5PRaM+TiLz4F
         NrIektZtRIub3mocUu6phus70b64TmNlDefHg3dcNh5hJtsoPNuW73fbP4Y/Y2Axg7gi
         TqVoDmJR9SvYdCeR2LAWKsDboyxDYuJAlUP85TcyoIfHdh/xvsRCGZVBqSZwqXoKBSRB
         srnlnnj3kmg5J48IFntfUNY7yieDCpjMjI6X5f/9/A0BV7BAiepz1Nynz2E0gGMBUF1R
         45vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786088603; x=1786693403;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7S8dBK6YhaGNGXZXuOaaURDNFzX4xHQ7yoGCrlFysFs=;
        b=AslUxfvJyH0Kly9F/6fY8mDgIyiWffxMrhjPehdIsOREdWfXHvyOdijE53mn14HZzf
         rSC3bDTdYdL+85axY1PSTK8UsxxLuHVbaeD2eU0TN8Z4jRAAqJg97S+ETn7LFeo/wNnm
         p/aSaor3MIYh1rdBO7e2DBxVHEtpyZ73LohN5RRGYIysPDg8KY58GsH/SIAO8fQnaJbJ
         pgD1q6T3Ou3yiIuQRwrj/rQHKl6D1uRaYoXGkGENqDax86qxSx1m/70N+KPyWDqBzAp9
         W8o+zjXw2tp0aYDlv0C5HCGXXYGUgnv/gOC7uMOTi4amRbTupdvXWPrZukIJN8oTzK3g
         wtxQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqn+7X2x+xVQrEeFZOdyIWrOSEq/uk02gzr1vGFqvKOCZAyzCXRX35VoL6ggIFAMZbaBROAnGwY6RE3ry0l87J/@lists.infradead.org
X-Gm-Message-State: AOJu0YylA9X+D8Ez7jTwpLsCTk68TnE4ayIslV+6hvRlbVfnXKGBOerR
	yYqXSVYC8mXX8bUM7AuiDvk0oi1QaettFO/YsyY1PncstP5VZph0WeiUY0OY+HkwA4nw
X-Gm-Gg: AR+sD10Oz97vyIgOMIp+DGZqX75mxVV1qiH6vmYO5BlP7broC3CTkiUfkJf50ciDlte
	Yu3T8Br/DBT8QMqc9gd4P5T+h62SJSh1RQ/0C+B4Z5hpDnaEfAO8pTwhKrfxXyxAMikR57HHBFg
	DnfWmjl5DNd/98i2HrfePBjYi+7UFNEwYyGtfhySbGXJDwDt9KqD/363+tF1Bi57tImMfiJwx0C
	iIdkGz00mb/4hnsdwCxEUnvHYd1IcCPFmNppQYrlWxgLMYxNhBGcaKI5EBMNY/Y9kvVIpnL09Ar
	gtNhF+0A6AjJxKTr2NZ1g5UMf0pAv34+HHCpuFY7//WrOSc6hWabxI5+RdTcV2UZ36wQQA9vkmf
	G4R+YyjARraIgD/Ka/YXlSZZRxeHav8h9hED9BcajR3mOnrsHv2aagRJnkBvNdDFAwpC5xqrtKN
	BWWlAVxU+otyjCcxq+20488/wUxOBNA7ye7qigdNBKIuye68mmxJGy65kW5R0kRHdo3Uwq8VFaf
	tsZVkRarhDSPj4QOUzykmx4oqvGALif/SjqikQBrPrx
X-Received: by 2002:a05:6000:290d:b0:47f:f42e:9715 with SMTP id ffacd0b85a97d-47ff42e974fmr20538949f8f.12.1786088603193;
        Fri, 07 Aug 2026 00:43:23 -0700 (PDT)
Received: from ?IPV6:2001:8a0:f59c:a900:2600:fba1:8d1e:1692? ([2001:8a0:f59c:a900:2600:fba1:8d1e:1692])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48002150952sm2814778f8f.15.2026.08.07.00.43.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2026 00:43:22 -0700 (PDT)
Message-ID: <79d79806-ceda-4e79-8e9f-6420265c8efa@osyx.tech>
Date: Fri, 7 Aug 2026 08:43:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: =?UTF-8?Q?Jo=C3=A3o_Peixoto?= <jpeixoto@osyx.tech>
Subject: Re: [PATCH 4/6] virt: bao: Add Bao I/O dispatcher driver
To: Andrew Jones <andrew.jones@oss.qualcomm.com>, joaopeixoto@osyx.tech
Cc: linux-kernel@vger.kernel.org, ajd@linux.ibm.com, alex@ghiti.fr,
 aou@eecs.berkeley.edu, bagasdotme@gmail.com, catalin.marinas@arm.com,
 conor+dt@kernel.org, corbet@lwn.net, dan.j.williams@intel.com,
 davidmcerdeira@osyx.tech, devicetree@vger.kernel.org, dev@kael-k.io,
 gregkh@linuxfoundation.org, haren@linux.ibm.com, heiko@sntech.de,
 jose@osyx.tech, kever.yang@rock-chips.com, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, maddy@linux.ibm.com, mani@kernel.org,
 nathan@kernel.org, neil.armstrong@linaro.org, palmer@dabbelt.com,
 pjw@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, robh@kernel.org,
 will@kernel.org
References: <20251224135217.25350-1-joaopeixoto@osyx.tech>
 <20260107162829.416885-1-joaopeixoto@osyx.tech>
 <20260107162829.416885-5-joaopeixoto@osyx.tech>
 <4rrof4lk2zxut63u7qwxlmygpslvq5owfraatbjq3sbybtac4u@2prxnxijartx>
Content-Language: en-US
In-Reply-To: <4rrof4lk2zxut63u7qwxlmygpslvq5owfraatbjq3sbybtac4u@2prxnxijartx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_084324_759913_59B0ACB4 
X-CRM114-Status: GOOD (  20.86  )
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


On 1/14/26 20:32, Andrew Jones wrote:
> On Wed, Jan 07, 2026 at 04:28:27PM +0000,joaopeixoto@osyx.tech wrote:
> ...
>> diff --git a/arch/riscv/include/asm/bao.h b/arch/riscv/include/asm/bao.h
>> index 35658f37e1bd..f04e6cd33fa9 100644
>> --- a/arch/riscv/include/asm/bao.h
>> +++ b/arch/riscv/include/asm/bao.h
>> @@ -14,6 +14,7 @@
>>   #define __ASM_RISCV_BAO_H
>>   
>>   #include <asm/sbi.h>
>> +#include <linux/bao.h>
>>   
>>   #define BAO_SBI_EXT_ID 0x08000ba0
>>   
>> @@ -28,4 +29,33 @@ static inline unsigned long bao_ipcshmem_hypercall(unsigned long hypercall_id,
>>   	return ret.error;
>>   }
>>   
>> +static inline unsigned long
>> +bao_remio_hypercall(struct bao_remio_hypercall_ctx *ctx)
>> +{
>> +	register uintptr_t a0 asm("a0") = (uintptr_t)(ctx->dm_id);
>> +	register uintptr_t a1 asm("a1") = (uintptr_t)(ctx->addr);
>> +	register uintptr_t a2 asm("a2") = (uintptr_t)(ctx->op);
>> +	register uintptr_t a3 asm("a3") = (uintptr_t)(ctx->value);
>> +	register uintptr_t a4 asm("a4") = (uintptr_t)(ctx->request_id);
>> +	register uintptr_t a5 asm("a5") = (uintptr_t)(0);
>> +	register uintptr_t a6 asm("a6") = (uintptr_t)(BAO_REMIO_HYPERCALL_ID);
>> +	register uintptr_t a7 asm("a7") = (uintptr_t)(0x08000ba0);
>                                                        ^ BAO_SBI_EXT_ID
>
> Using the experimental extension ID space would be fine for an RFC, but
> this can't be merged until an SBI implementation ID for Bao is added to
> the RISC-V SBI spec. Then the Bao EID would be '0xA000000 | <Bao-IMP-ID>'
Understood. For now the RISC-V backend uses the experimental extension 
space,
and I have made that explicit: BAO_SBI_EXT_ID carries a comment noting a
permanent EID must be assigned through the SBI spec before RISC-V can be
considered stable, and I am marking this revision RFC for that reason. I 
will
start the process of getting a Bao implementation ID registered and 
switch to
'0xA000000 | <Bao-IMP-ID>' once it is assigned.
> I think we'll also need to discuss whether or not firmware/hypervisor-
> specific extensions are exempt from all rules in chapter 3 of the SBI
> spec other than a7 being the EID. If not, then this function should
> just call __sbi_ecall() and the Bao hypercalls will not be allowed to
> modify any registers except a0 and a1.
>
>> +
>> +	asm volatile("ecall"
>> +		     : "+r"(a0), "+r"(a1), "+r"(a2), "+r"(a3), "+r"(a4),
>> +		       "+r"(a5), "+r"(a6), "+r"(a7)
>> +		     : "r"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5),
>> +		       "r"(a6), "r"(a7)
>> +		     : "memory");
>> +
>> +	ctx->addr = a2;
>> +	ctx->op = a3;
>> +	ctx->value = a4;
>> +	ctx->access_width = a5;
>> +	ctx->request_id = a6;
>> +	ctx->npend_req = a7;
>> +
>> +	return a0;
>> +}
> Thanks,
> drew
Good point, and I would value your view before I respin the ABI. The Remote
I/O hypercall currently returns several values in a2-a7, which does violate
the calling convention if Bao extensions must follow chapter 3. If they 
must,
I will change the hypervisor-side ABI so the call only returns via a0/a1 and
move the extra results into a shared-memory region, then switch the helper
to __sbi_ecall(). Since that is a hypervisor ABI change I would rather agree
the direction first. Do you know of precedent for hypervisor/firmware
extensions being exempted here, or should I assume the full chapter-3 rules
apply?

(Separately, I removed the redundant input constraints from the ecall asm -
the operands are already "+r", so the extra "r" inputs were unnecessary.)

