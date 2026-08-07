Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81A9EC5AC7C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 07:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aMXlhNjfgEVVavursvLkrVBWqQ3YchqAgG6nIZuSJdI=; b=qq5z8pQkvOVdAh8VlIL+kFOr8I
	UuXxB5qeZZn28KZYJs1b1YJ2GmqF3odw605FrF1UBRmrTVYKcUrCnclrzF8uYGEqv9Lmscn5AX00T
	Ee3At5xtYtEeFgPYRaFb78BGEKelK6ro71ifFd7LG3IA6sbtUdYJwqHQQ4GKthS8Iqq+COcIInPnw
	0AsSXFBzxpS8k/zsmmcXWv9+PSoEAkLyjUfMMtE3yfpP9vFE8QTqLWInwFttvQRpA4mdg6PWeUGoV
	oD9pjr3X/LFhRTRJvhXd9MzfEcFnswf+CEVD6uh3J2PYp1Ee8NJVIb8UmYxKIeIKCLdXC5T977bh9
	f3b5HAnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFFh-00000007I0I-0h1s;
	Fri, 07 Aug 2026 07:44:25 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFFe-00000007HyP-2jcq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 07:44:23 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-493b966dd74so18579595e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 00:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osyx-tech.20251104.gappssmtp.com; s=20251104; t=1786088661; x=1786693461; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aMXlhNjfgEVVavursvLkrVBWqQ3YchqAgG6nIZuSJdI=;
        b=VY7EtagmMcKtcpyKfKmQLLZTjfVKefWpJVzfr+mBm7ksTD/4cCKu0mLdJycOWvD5xz
         W9yC/qCqlImyqk1v/Y48kOo6VZC/UGnUtrHZRAeyheHGeorUSIIV4H37kx7hLe5YuDUY
         8233xCTdV6H2H7CrEPZrqhYouFl7K9EZpmZrJEyDvG65Qx2Y3yuz15zY4nzjDQmfPsaM
         nCTW9cf+HPqTK+rhxZ25xodyp7Z45z3WkGjsBSHy9lb9maFtkCj8EGoSVBF6Ua/EZ5YX
         wr82mlateN90zqueXBNoAWJKQyL6x2EtscCXNtc/DXRWVD9FVOvwdNtczMCJ/M2fwtHp
         7VoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786088661; x=1786693461;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aMXlhNjfgEVVavursvLkrVBWqQ3YchqAgG6nIZuSJdI=;
        b=il1sOsjS2wxG7lkYvQvdeVMUsxJDxm91pjy4objlhZmj2EwyfyGYcnUZk+X3N4jQ5y
         jgNqDUBqxfgNA38O5pYTb3Fglp8r6LE8WYBEKoflLNTbARvPmQBAC/ATLJHOMDwB+KE0
         p/U8tAga0mXCAmgaO9tRKdVi4NcOdQLZemKAnuSIqZU8hUvP8VVvDt83TerWUdHNP8ux
         FWRKgc3KvEWYQScakS2X0qhqzsaPYrpdSbXlI7fuE7eBU8EkaBqw+cAtCGvynhXWKKV3
         M59Mi4zGiYvjUfEA5ZZyKofHnJDisGcsukFDhuXuHmZV3lg3PzpboOTC6Bw2/+0cUQq4
         KU6g==
X-Forwarded-Encrypted: i=1; AHgh+Robed0cS6BHjr03wjDOEuh05lJpkjydb9RSdxldQEUPOTDV4XjqCOrN3IVZf37z2XPdAXen2nv8qS97vg88swbr@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5cpGqoiTThnUPYzUNPFKew+RaOh7Ftj2nbWu3ulPEin4HOvv4
	ZtUYnfmv+584KXxpmw3XTabgM8jZirYRue3mjFyOS+uUltZdqOaj9A4n5sHa1nqIn/xd
X-Gm-Gg: AR+sD127L/9DpOZ/Eja+zayo3x+dfcmE6J1OKcx/5JeujcUkQC3RadPNCxFRympjAWH
	h3InqcnjZj7yLZtje0jK2OWxrjHKqRsULCgqdl0UnnLP9XHeFxkjutIPCRpZbkR55Dn8DtivBRq
	Qa29SiiGbzpIUcYWJxbqFbL7o6Ie5GnSaoJkkpUao8HDfddoFuAdDl8gP2a4CLY93MQU935SAZi
	p9dGijh2KyYxT6cb9ofZBJlfXMNG47mDGSVEbx5tEmIpcapD/k+18CS1CKm5D0SU12sc0IXtn7V
	Bs+t/pyQIRm9jBZNyQW+zvyQjJbegxnXsqDRRfXyb6zerBrYLsNnz1R/hFrnVPIzZOWuS+K17So
	S+fe9TLokMGDLoF/PkaJh6mv8QOLpalxCaPrRmKL65oUCf1BNB54mvTLclUno2LJhEePE6jgJs9
	SlcZiD6/nXJH/m3pfOfwnvbrALuN4ixSljQkMCiISeMUqQR8xkaMyxUtaNP5/m/eOZMb98AfhFQ
	xZCHAqr5BJSxUPjrbWcJVO7gADZpAIydA==
X-Received: by 2002:a7b:ca4d:0:b0:495:6134:6d61 with SMTP id 5b1f17b1804b1-4994e7eb2d2mr211693395e9.19.1786088660739;
        Fri, 07 Aug 2026 00:44:20 -0700 (PDT)
Received: from ?IPV6:2001:8a0:f59c:a900:2600:fba1:8d1e:1692? ([2001:8a0:f59c:a900:2600:fba1:8d1e:1692])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995e9eb1a0sm17092015e9.5.2026.08.07.00.43.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2026 00:43:31 -0700 (PDT)
Message-ID: <c4c81fcd-fc3c-4133-bad8-fed256617fc0@osyx.tech>
Date: Fri, 7 Aug 2026 08:43:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: =?UTF-8?Q?Jo=C3=A3o_Peixoto?= <jpeixoto@osyx.tech>
Subject: Re: [PATCH 5/6] virt: bao: Move BAO_IPCSHMEM_HYPERCALL_ID to common
 header
To: Greg KH <gregkh@linuxfoundation.org>, joaopeixoto@osyx.tech
Cc: linux-kernel@vger.kernel.org, ajd@linux.ibm.com, alex@ghiti.fr,
 aou@eecs.berkeley.edu, bagasdotme@gmail.com, catalin.marinas@arm.com,
 conor+dt@kernel.org, corbet@lwn.net, dan.j.williams@intel.com,
 davidmcerdeira@osyx.tech, devicetree@vger.kernel.org, dev@kael-k.io,
 haren@linux.ibm.com, heiko@sntech.de, jose@osyx.tech,
 kever.yang@rock-chips.com, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, maddy@linux.ibm.com, mani@kernel.org,
 nathan@kernel.org, neil.armstrong@linaro.org, palmer@dabbelt.com,
 pjw@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, robh@kernel.org,
 will@kernel.org
References: <20251224135217.25350-1-joaopeixoto@osyx.tech>
 <20260107162829.416885-1-joaopeixoto@osyx.tech>
 <20260107162829.416885-6-joaopeixoto@osyx.tech>
 <2026010704-heaviness-quality-f543@gregkh>
Content-Language: en-US
In-Reply-To: <2026010704-heaviness-quality-f543@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_004422_707530_5EED0FE8 
X-CRM114-Status: GOOD (  16.13  )
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


On 1/7/26 19:36, Greg KH wrote:
> On Wed, Jan 07, 2026 at 04:28:28PM +0000,joaopeixoto@osyx.tech wrote:
>> From: João Peixoto<joaopeixoto@osyx.tech>
>>
>> Move the IPC shared-memory hypercall ID from architecture-specific
>> headers into include/linux/bao.h.
> That says _what_ you did, but not why you did it :(
>
> I have no idea why this is needed at all, sorry.
>
>> Signed-off-by: João Peixoto<joaopeixoto@osyx.tech>
>> ---
>>   arch/arm/include/asm/bao.h           | 5 ++---
>>   arch/arm64/include/asm/bao.h         | 5 ++---
>>   arch/riscv/include/asm/bao.h         | 7 +++----
>>   drivers/virt/bao/ipcshmem/ipcshmem.c | 5 +----
>>   include/linux/bao.h                  | 3 +++
>>   5 files changed, 11 insertions(+), 14 deletions(-)
>>
>> diff --git a/arch/arm/include/asm/bao.h b/arch/arm/include/asm/bao.h
>> index 5ece9ecb1455..7d13591fe669 100644
>> --- a/arch/arm/include/asm/bao.h
>> +++ b/arch/arm/include/asm/bao.h
>> @@ -16,14 +16,13 @@
>>   #include <linux/arm-smccc.h>
>>   #include <linux/bao.h>
>>   
>> -static inline unsigned long bao_ipcshmem_hypercall(unsigned long hypercall_id,
>> -						   unsigned long ipcshmem_id)
>> +static inline unsigned long bao_ipcshmem_hypercall(unsigned long ipcshmem_id)
> This does not match what you said you were doing in the changelog :(
You are right on both counts; the message now explains the why and no longer
hides the signature change:

   virt: bao: consolidate the IPC hypercall ID in include/linux/bao.h

   The IPC shared-memory hypercall ID was passed as a parameter through each
   architecture's bao_ipcshmem_hypercall() and defined locally in 
ipcshmem.c.
   Define it once in include/linux/bao.h, next to the Remote I/O 
hypercall ID,
   and reference it directly from the arch helpers. As there is only one IPC
   hypercall, this also lets bao_ipcshmem_hypercall() drop its hypercall_id
   parameter.

See also my reply to Andrew on this patch re: whether to keep it standalone
or fold it into the earlier patches.

