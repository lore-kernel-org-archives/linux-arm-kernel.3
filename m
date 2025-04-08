Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 096AEC369A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 16:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QlxEL9VL5GBxv0J9u6K3DMLa5NYfTy2VRFDYnyudgvo=; b=K0k31SYpQKsZXp0RxPHQCOHjnW
	5fuRZHtmoN3q388pwch9I4NAwyiDyVKZIJXbvIHi8SQcgMLyy6KmUFDE0vJTfbbVKOBT0lJDOiekV
	S0e3nNRtrwsftUfdsmyvJq3n248r+2UmpLq5D8jzgMWkaCCysRWtsIelgMtYgsAq8aHjn8JEbh+EB
	jWJXFDfD/lf/3f0wpMcp2ddLs7jhbp5s3p6e0jmYI98yJYWyKLucym5l8/tVAK8/k21bjz6ea4Pm7
	Xf7Zz8FCs/Ug1V7M4fWrKTJ9sZTZCt0kz7tMMU5wfj8Ok69vIa/J/BqkGZRqG3SLShX/rMqXW/AST
	ouj8ofAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2BfC-00000004n0h-05da;
	Tue, 08 Apr 2025 16:19:02 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2BcY-00000004mTV-2x94
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 16:16:19 +0000
Received: from [10.137.184.60] (unknown [131.107.160.188])
	by linux.microsoft.com (Postfix) with ESMTPSA id 0A6912027DEF;
	Tue,  8 Apr 2025 09:16:17 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 0A6912027DEF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1744128977;
	bh=QlxEL9VL5GBxv0J9u6K3DMLa5NYfTy2VRFDYnyudgvo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=j1ES0ym5sbrgD3pdb0PoqBafFIEPGdc0EYOnjXVL+OYKUrGI2Q1Y40bDZZ+1kq+y8
	 kTo/HsxUdggQ5dhmHYSDjbs/eS47iNdNi+LcisiFu2Bnp0CUSqsDg3kJrhJGChUqNv
	 L7NnLJBQ7avTM3huC+oyN74Y7Q7XMlUJQFpTZvtw=
Message-ID: <c9bea07c-3a0e-41bb-a8d8-12d9f8776e07@linux.microsoft.com>
Date: Tue, 8 Apr 2025 09:16:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH hyperv-next v7 01/11] arm64: kvm, smccc: Introduce and use
 API for getting hypervisor UUID
To: Marc Zyngier <maz@kernel.org>
Cc: arnd@arndb.de, bhelgaas@google.com, bp@alien8.de,
 catalin.marinas@arm.com, conor+dt@kernel.org, dan.carpenter@linaro.org,
 dave.hansen@linux.intel.com, decui@microsoft.com, haiyangz@microsoft.com,
 hpa@zytor.com, joey.gouly@arm.com, krzk+dt@kernel.org, kw@linux.com,
 kys@microsoft.com, lenb@kernel.org, lpieralisi@kernel.org,
 manivannan.sadhasivam@linaro.org, mark.rutland@arm.com, mingo@redhat.com,
 oliver.upton@linux.dev, rafael@kernel.org, robh@kernel.org,
 rafael.j.wysocki@intel.com, ssengar@linux.microsoft.com,
 sudeep.holla@arm.com, suzuki.poulose@arm.com, tglx@linutronix.de,
 wei.liu@kernel.org, will@kernel.org, yuzenghui@huawei.com,
 devicetree@vger.kernel.org, kvmarm@lists.linux.dev,
 linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-hyperv@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, x86@kernel.org,
 apais@microsoft.com, benhill@microsoft.com, bperkins@microsoft.com,
 sunilmut@microsoft.com
References: <20250407201336.66913-1-romank@linux.microsoft.com>
 <20250407201336.66913-2-romank@linux.microsoft.com>
 <86semjku7x.wl-maz@kernel.org>
Content-Language: en-US
From: Roman Kisel <romank@linux.microsoft.com>
In-Reply-To: <86semjku7x.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_091618_783619_08971113 
X-CRM114-Status: GOOD (  10.63  )
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



On 4/8/2025 12:06 AM, Marc Zyngier wrote:
> On Mon, 07 Apr 2025 21:13:26 +0100,
> Roman Kisel <romank@linux.microsoft.com> wrote:

[...]

>>   
>>   #include <linux/args.h>
>>   #include <linux/init.h>
>> +
>> +#ifndef __ASSEMBLER__
>> +#include <linux/uuid.h>
>> +#endif
> 
> That's a pretty unusual guard in arm64 land. Looking at the current
> state of the kernel:
> 
> $ git grep -w __ASSEMBLER__ arch/arm64/ | wc -l
> 2
> $ git grep -w __ASSEMBLY__ arch/arm64/ | wc -l
> 122
> 
> I'd suggest the later rather than the former.

Thanks for catching this! I'll be sure to change this to use the arm64
coding conventions in the next version.

> 
> Thanks,
> 
> 	M.
> 

-- 
Thank you,
Roman


