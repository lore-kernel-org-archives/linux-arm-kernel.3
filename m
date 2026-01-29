Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03FD5D358F6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 10:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=asMYvR4+8fIWZ4M/HFcAyNsDPqE2Xel47V6LP6IGUhQ=; b=RuJpxWoOaSqUIWVDt5dv8u04qu
	zGN3m10S1D6qXPSIo84nxIMH0eSGrjHlBBTlCqxE+5VpK0c4xcvwRK9mWOHtg0zo7FNXodHfXLUGP
	+kjGDVgzsIMDwPXehYT6b28XD3cC49NqXy71DEYbj56pio1kR96Q2IChIby1JuKnqTtaNRkm+JmlQ
	mYbA8roWtVUUXQi3cT8vj7CJJpbtedCm8u+Kf/bE9eLUGHSY4W+EQFGAddq+/UCOGXRTL4J7Yw836
	5UTe55nrFFqWKUR/BoNZ9BD7adfZ56/vm9Dt8nurQyMHDySJDr5sbk09ZfzBD7f9zHKorR6sTKapG
	0qOAoXyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlPWr-000000000PH-0Uns;
	Thu, 29 Jan 2026 10:45:37 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlPWn-000000000OH-1Vkk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 10:45:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769683528;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=asMYvR4+8fIWZ4M/HFcAyNsDPqE2Xel47V6LP6IGUhQ=;
	b=PxbBmVCkBq7qenLF4pvlx+aSOr/cdjJkIqj36A8nc06m8l7MMTGWYS1KIrd1FDocxugPQt
	xS13ow5fd3Iu4lDzGf9v6O2T4H/jDLPIGK+yG/b368lPHEymlgxH6p1C4ewEfbLqQu5t+6
	kCw9qfhaT2YJs41ivXzuMwTpluaZspE=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-110-GLGRJE9fORSC_AqTR2Rdkw-1; Thu, 29 Jan 2026 05:45:27 -0500
X-MC-Unique: GLGRJE9fORSC_AqTR2Rdkw-1
X-Mimecast-MFC-AGG-ID: GLGRJE9fORSC_AqTR2Rdkw_1769683526
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a755a780caso13599935ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Jan 2026 02:45:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769683526; x=1770288326;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=asMYvR4+8fIWZ4M/HFcAyNsDPqE2Xel47V6LP6IGUhQ=;
        b=h7LDWLhDVn6W2YOAS/M5ZTDuEriPHqVchKF8WGfH41X+SlL5cEXGhRX2c5dePJZi6J
         uHSVeK5Jmx70iGYWKi8Dn91fBzqajvfLn4gpTwlFQvRCi3DzAlA3SpwYE1/wGa8WB6s2
         ecxIQuncovXpgKPibx3nxOC6WT3iN1NFWrCoW89XEOOYyfpg6Pe+hboP1pAJAsVqigho
         qsNrjAj835fc3objk/BgLz6IDreern0baL8Lnn9NbAvx7i48T0nuw4asgQGNR+lHbsen
         1NP7d8WoSO0aoaxDbCvM0jwUqAWpQ8ytprpO3yPGO8UKbgOUZrlut7aToi3UBqs3Awo7
         /mbg==
X-Forwarded-Encrypted: i=1; AJvYcCV6IjEkObeLWMwTgPjKpOp9KQj2XTmShRuFsdOUyRP99M5afKrp/4IjV9OWfidnWVY9YGRsCUbjTV/U13x81Vz5@lists.infradead.org
X-Gm-Message-State: AOJu0YzkakrHYJKcCskg08VmFODK1WgzpedD5WnLvJpxshD837ybeA+x
	DU39iXAdJ9LEbXCI1eQWkebL4eJYshND3m425qYzrbfpmX/Ykf7lgvGDvFImFfjbvob+aGuabzo
	kvP2890/mza7n9O35yq+NfXjNwv2nYK8JKN16eTsY276V2xfYFpKqLX48Ype4KZe0Id+315ldbF
	gXpmSPeKIhg2A=
X-Gm-Gg: AZuq6aJQWHxSC1Nwdub+Gub5OM3RfXscLkRezc98FpYsgJFcXctx/BltkV0K4rrLBHw
	InBpDgD6iNVF5UgK+119w7SNUrpt4Zb/FzP4NmkTEntshQ/6tLGEBKf7lgb2QWh3CygQKC5hxGN
	uXne1TwnLijVKiMbS6OXFjLT/EULI9Sa0SsMna0UreNSf3TW2QOvRaBYtrak5OTvxWfV3LF930q
	9YzqdFrWfq5Fm70bz1WTWziLtz511DNCUVo2VBHf8rRJ1vVcIssev+z1oEEDGdLiFzVkcpeyT5q
	guRJivYycnZ6/hPN3no8Aeem1exARqizWYkK/FlCZGsEonIGW9qQbS1uBtPWKmfipBwOOBom+27
	g
X-Received: by 2002:a17:902:e743:b0:2a0:f0e5:74eb with SMTP id d9443c01a7336-2a8bd51481cmr28168205ad.28.1769683525949;
        Thu, 29 Jan 2026 02:45:25 -0800 (PST)
X-Received: by 2002:a17:902:e743:b0:2a0:f0e5:74eb with SMTP id d9443c01a7336-2a8bd51481cmr28167925ad.28.1769683525347;
        Thu, 29 Jan 2026 02:45:25 -0800 (PST)
Received: from localhost ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b426ae4sm46205555ad.43.2026.01.29.02.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 02:45:24 -0800 (PST)
Date: Thu, 29 Jan 2026 18:40:23 +0800
From: Coiby Xu <coxu@redhat.com>
To: Will Deacon <will@kernel.org>
Cc: kexec@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	Arnaud Lefebvre <arnaud.lefebvre@clever-cloud.com>, Baoquan he <bhe@redhat.com>, Dave Young <dyoung@redhat.com>, 
	Kairui Song <ryncsn@gmail.com>, Pingfan Liu <kernelfans@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Rob Herring <robh@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Saravana Kannan <saravanak@kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v3] arm64/kdump: pass dm-crypt keys to kdump kernel
Message-ID: <aXs0UnFE1fEa8Yxu@Rk>
References: <20260123081326.1362666-1-coxu@redhat.com>
 <aXd72PcvvFsIFXO2@willie-the-truck>
MIME-Version: 1.0
In-Reply-To: <aXd72PcvvFsIFXO2@willie-the-truck>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: EOlTJ_JrC-fwm9a4jaxyIqNLQBdo3JNKxhjZMgLBpq8_1769683526
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_024533_463906_987180E4 
X-CRM114-Status: GOOD (  27.58  )
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

On Mon, Jan 26, 2026 at 02:36:08PM +0000, Will Deacon wrote:
>On Fri, Jan 23, 2026 at 04:13:25PM +0800, Coiby Xu wrote:
>> CONFIG_CRASH_DM_CRYPT has been introduced to support LUKS-encrypted
>> device dump target by addressing two challenges [1],
>>  - Kdump kernel may not be able to decrypt the LUKS partition. For some
>>    machines, a system administrator may not have a chance to enter the
>>    password to decrypt the device in kdump initramfs after the 1st kernel
>>    crashes
>>
>>  - LUKS2 by default use the memory-hard Argon2 key derivation function
>>    which is quite memory-consuming compared to the limited memory reserved
>>    for kdump.
>>
>> To also enable this feature for ARM64, we only need to add device tree
>> property dmcryptkeys [2] as similar to elfcorehdr to pass the memory
>> address of the stored info of dm-crypt keys to the kdump kernel. Since
>> this property is only needed by the kdump kenrel, it won't be exposed to
>> user space.
>>
>> [1] https://lore.kernel.org/all/20250502011246.99238-1-coxu@redhat.com/
>> [2] https://github.com/devicetree-org/dt-schema/pull/181
>>
>> Cc: Arnaud Lefebvre <arnaud.lefebvre@clever-cloud.com>
>> Cc: Baoquan he <bhe@redhat.com>
>> Cc: Dave Young <dyoung@redhat.com>
>> Cc: Kairui Song <ryncsn@gmail.com>
>> Cc: Pingfan Liu <kernelfans@gmail.com>
>> Cc: Andrew Morton <akpm@linux-foundation.org>
>> Cc: Krzysztof Kozlowski <krzk@kernel.org>
>> Cc: Rob Herring <robh@kernel.org>
>> Signed-off-by: Coiby Xu <coxu@redhat.com>
>> ---
>> v3
>> - Delete the property after reading it [Rob Herring]
>>
>> v2
>> - Krzysztof
>>   - Use imperative mood for commit message
>>   - Add dt-schema ABI Documentation
>>     https://github.com/devicetree-org/dt-schema/pull/181
>> - Don't print dm-crypt keys address via pr_debug
>>
>>
>>  arch/arm64/kernel/machine_kexec_file.c |  9 +++++++++
>>  drivers/of/fdt.c                       | 21 +++++++++++++++++++++
>>  drivers/of/kexec.c                     | 19 +++++++++++++++++++
>>  3 files changed, 49 insertions(+)
>>
>> diff --git a/arch/arm64/kernel/machine_kexec_file.c b/arch/arm64/kernel/machine_kexec_file.c
>> index 410060ebd86d..5f3bad8ca96d 100644
>> --- a/arch/arm64/kernel/machine_kexec_file.c
>> +++ b/arch/arm64/kernel/machine_kexec_file.c
>> @@ -134,6 +134,15 @@ int load_other_segments(struct kimage *image,
>>
>>  		kexec_dprintk("Loaded elf core header at 0x%lx bufsz=0x%lx memsz=0x%lx\n",
>>  			      image->elf_load_addr, kbuf.bufsz, kbuf.memsz);
>> +
>> +		ret = crash_load_dm_crypt_keys(image);
>> +
>> +		if (ret == -ENOENT) {
>> +			kexec_dprintk("No dm crypt key to load\n");
>> +		} else if (ret) {
>> +			pr_err("Failed to load dm crypt keys\n");
>> +			goto out_err;
>> +		}
>
>This looks like an unusual mixture of kexec_dprintk() and pr_err().
>
>Stepping back a second, why do we need to print anything from the arch
>code at all? It looks like crash_load_dm_crypt_keys() already prints for
>the -ENOENT case so I'd be inclined just to do:
>
>	ret = crash_load_dm_crypt_keys(image);
>	if (ret)
>		goto out_err;
>
>Will
>

Hi Will,

Thanks for carefully reviewing the patch! Yeah, crash_load_dm_crypt_keys
already prints for the -ENOTENT case, good catch! And it's also a good
idea to not let the arch code print anything since
crash_load_dm_crypt_keys is a better place. I'll make
crash_load_dm_crypt_keys print more logs and also return 0 for the case
of -ENOENT. This can make the arch code more succinct.


-- 
Best regards,
Coiby


