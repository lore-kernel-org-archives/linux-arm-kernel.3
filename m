Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBA08C5AC7C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 07:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ubKtK2cT3F7Eeuk7KUajYtaFkIOEcFfT6C7ChKCXeuI=; b=HAMH1GE85ezPdKlAqT3CQnAumF
	1yHVkYwqn3qJswI2wjJJqffcT8KT2ups9TfEQ35Z/NR6fR5qfjJEVyU/taCwaJHS8rVFH2I34aPUM
	MzmIYheEhPdhT5P9yf0+/ezEZe+fMCx/E+4K2vjUlwp6kcD0p2El3XaTY2441+U6lzzNZTaLyG1Ky
	lNDjkhgcMGEDyopfMMTLsiSaGdtau0urclBz5Vc63z/7agfM4uhIu1hp4ebhXw9PoPaPLJSwR8KhG
	tbITPrq4Al+G/FV/4L71jStlsypI1yUSV5MpBnwZ2HLWeSYTLMGXizZWFCsV73eqMUltTmYUx+7tx
	wPWedtHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFEK-00000007HGh-1PdT;
	Fri, 07 Aug 2026 07:43:00 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFEH-00000007HFY-3V7E
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 07:42:58 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-47db714766aso1033340f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 00:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osyx-tech.20251104.gappssmtp.com; s=20251104; t=1786088576; x=1786693376; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ubKtK2cT3F7Eeuk7KUajYtaFkIOEcFfT6C7ChKCXeuI=;
        b=CetAnwrsFMrKHFvjkA+fjBR0CkRiQ8rWmljCfxDSnneUtS22QqupMHgiZz7sumOH14
         jNKNFldOKimXTS5qOMLSt1oGKB+kLHlXMz0BSz5448YfuD/M6wkmUdJKAMR1A62Nbl9h
         0pHEGHKwtfU0iNAtGh/Pm3GROTHqB6llwZpNm7GpXNnIG/Bvzf8dOqWfHj6zaYSFkCBF
         nDbCKK9Ud6EWFkL/ve37bIWcQ3pZ4m/H4s0e/VdMFEHC2S9Ziy9fhlO0PDSlnLnJzKbE
         /3ccc7sZq5Bz3Z6yAsP+3/fFNPtnFShja8N1y02gpGbX7XWLMcQ3GH73WXbDZZ5Tn3zS
         yV5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786088576; x=1786693376;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ubKtK2cT3F7Eeuk7KUajYtaFkIOEcFfT6C7ChKCXeuI=;
        b=HuP6r7GJqpNMFLnXaD0XyLCmJ6TPjg+NgboW8ETz7pxC3cSK3DH8D4iVroJTOWB5zy
         kp4K1KBuW6h8Q3Z3NIAEKz5FLUvvlujXy+Wr5Q9X/A+NXDTL6FyPidx37CntDRfizIn8
         l2A8ki63FUNU7KN+8DK9lYcDhevVt68kvYE05r9HYp0+PHWzVmmkzw9e0NGmko/SyBg4
         sOW4D9dCX2XM/mfIg74aoqgCaCKKHS/CTSr9KF52kfFGXVX0R94wa+gPGLl7xUNW0YNe
         ZouALnJswvtwGsWRtyjSU5HKdPuBSx0cohnK/Ex6ah0UYzQ4n36gRC6fn85ai1kYf7/N
         blZw==
X-Forwarded-Encrypted: i=1; AHgh+RpHNA9QCEr+Wjo2+DF27wAmTSs2eSms167+SP+mbXMra5RBUCNIgOeS6UABghAAgrgNE8t9iRZpqWKZO2JWo0l/@lists.infradead.org
X-Gm-Message-State: AOJu0YymmMCq9DMLrJIE4l9px558bzFKOTJgaeyFtoc7obLr8erHWeJ3
	wgGiixxfRS0SMv9iwp1dGkLQOKUCP9MhYwJelHSibAOj8qq0+HDiiTIL4jGR5X076bOv
X-Gm-Gg: AR+sD12yDX2fpQCdr2n3VB7VIBgSO7p//MaXLhbgyVihyBAKbGkMnqTHQy/piASs6IC
	9WKXghfIU18n/U6rtSAX0ugAJkwGzHEN432EAw6bhOraPjyX/iNBNjj3KkqceNblckSF9EdN47i
	1DhMPNmKgXqKjkn66xGltyqgYN/Z8xDd0h7Ck8JNA1hDE8AJ7EDvXbL8jnYuxE+Ox7Qwqlift3u
	FvlSMOh36el8R48Fv/jb2EpwVAcmo1ux84keGDLdH42EaE1QMXndtZCJ32Uro9RgMYxuGVsbwHH
	VkVYcOcrEKnu94aXGocq3UArhTEgQsp+ya4LL3Tp4h3H71T/c+s051DqfbWLUVAoFx6imul0lPV
	zAUvKRLc0GKaitzIImCx/pq/VBzIz/9qxzrT5SuSM6Fh/vBqLV+CGRYfk0WZ+Vlf+1PhHr3QQec
	DE+9OckqG+ZzCJKABiQgdQ3xidGCuGuSmBAr1QoVEpkr6V3nKGbusiLwAVqenWmRMP+fFZhVIwu
	bmKyg9jgIeo14G1+jlUIUIO99cRj2bZQQ==
X-Received: by 2002:a05:6000:2889:b0:47f:f002:3656 with SMTP id ffacd0b85a97d-47ff86d5b33mr14529837f8f.12.1786088576046;
        Fri, 07 Aug 2026 00:42:56 -0700 (PDT)
Received: from ?IPV6:2001:8a0:f59c:a900:2600:fba1:8d1e:1692? ([2001:8a0:f59c:a900:2600:fba1:8d1e:1692])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021506c0sm3100099f8f.11.2026.08.07.00.42.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2026 00:42:55 -0700 (PDT)
Message-ID: <ba698035-28a3-4b63-b1c9-5393c840d3f3@osyx.tech>
Date: Fri, 7 Aug 2026 08:42:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: =?UTF-8?Q?Jo=C3=A3o_Peixoto?= <jpeixoto@osyx.tech>
Subject: Re: [PATCH 2/6] virt: bao: Add Bao IPC shared memory driver
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
 <20260107162829.416885-3-joaopeixoto@osyx.tech>
 <lpocmy3nmdcudoewe6uxal4srnd2acvb4fi73fthbruyb3wpo6@ky5cpwirm2vm>
Content-Language: en-US
In-Reply-To: <lpocmy3nmdcudoewe6uxal4srnd2acvb4fi73fthbruyb3wpo6@ky5cpwirm2vm>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_004257_890915_C95CA19A 
X-CRM114-Status: GOOD (  12.01  )
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


On 1/14/26 20:37, Andrew Jones wrote:
> On Wed, Jan 07, 2026 at 04:28:25PM +0000,joaopeixoto@osyx.tech wrote:
> ...
>> diff --git a/arch/riscv/include/asm/bao.h b/arch/riscv/include/asm/bao.h
>> new file mode 100644
>> index 000000000000..35658f37e1bd
>> --- /dev/null
>> +++ b/arch/riscv/include/asm/bao.h
>> @@ -0,0 +1,31 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * Bao Hypervisor Hypercall Interface
>> + *
>> + * Copyright (c) Bao Project and Contributors. All rights reserved.
>> + *
>> + * Authors:
>> + *	João Peixoto<joaopeixoto@osyx.tech>
>> + *	José Martins<jose@osyx.tech>
>> + *	David Cerdeira<davidmcerdeira@osyx.tech>
>> + */
>> +
>> +#ifndef __ASM_RISCV_BAO_H
>> +#define __ASM_RISCV_BAO_H
>> +
>> +#include <asm/sbi.h>
>> +
>> +#define BAO_SBI_EXT_ID 0x08000ba0
>> +
>> +static inline unsigned long bao_ipcshmem_hypercall(unsigned long hypercall_id,
>> +						   unsigned long ipcshmem_id)
>> +{
>> +	struct sbiret ret;
>> +
>> +	ret = sbi_ecall(BAO_SBI_EXT_ID, hypercall_id, ipcshmem_id, 0, 0, 0, 0,
>> +			0);
> Just let lines like these stick out. We have up to 100 chars and these
> types of few-char wraps are the most annoying.
>
> Thanks,
> drew
Agreed. In v3 the IPC hypercall ID is a shared constant, so
bao_ipcshmem_hypercall() now takes a single argument and its declaration
fits on one line, and I unwrapped the remaining few-char wraps. For example
the RISC-V ecall is now a single line:

     ret = sbi_ecall(BAO_SBI_EXT_ID, BAO_IPCSHMEM_HYPERCALL_ID, 
ipcshmem_id, 0, 0, 0, 0, 0);

Thanks.

