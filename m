Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 597D5F4487B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 11:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cGNuEHkArBiNiNVxwIRGSAzaCURMpjmGdsqqc7Hqft0=; b=NM0JXjpV+3R4rVguxk2eDAZ/Xb
	hocnCdzu1sYzDwPBPnBX91539F0k4lDRgktBv6FC/NSh2+5n4ZxochkG77m4NDkfyeQLy0yw2a8S/
	t2znBHCXhHH1mrAl0FmA46vK4kdmMwfcctgM86PK1CwTCseKR8y1r7CkFDjjykKep8EjOGFS2j64/
	IMf3tCtF+/umQ0fgHf/lifaV0P15nmijw/Yrnh4e2dP71vAWHusHNZdkY91OY8TroiGjOSu7NRchX
	c8c1SPxKsWs7gdCBUtm7vDD8ZziZVIVnRTFy+EnGPswUcO+0W62n48cZpbYlb8blNXfsUnkeSfvQE
	3I52O9uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCFiX-0000000Fac3-1UuY;
	Mon, 13 Apr 2026 11:44:37 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCFiU-0000000FabZ-35km;
	Mon, 13 Apr 2026 11:44:35 +0000
Received: from [192.168.0.106] (unknown [49.205.253.198])
	by linux.microsoft.com (Postfix) with ESMTPSA id ED2F320B7128;
	Mon, 13 Apr 2026 04:44:21 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com ED2F320B7128
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1776080668;
	bh=cGNuEHkArBiNiNVxwIRGSAzaCURMpjmGdsqqc7Hqft0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GdpGvPY6u6Kxlr3Gwj9vd3P3c+ECIc35+EwWAEp1VNH4UT26kmYkva+RZR3iv/Msg
	 uMIxbkofXzjxjwMRBnOSfMzfdKXz8nqUEP5WL2mOZ0gf2qqY16we/vfeRP9v29dxnY
	 GSqaZM25iXA12FMSgbcU8MrMWBs5cmsQkREpOLoM=
Message-ID: <7c6e721e-d8e1-45b5-99a3-a8104c212983@linux.microsoft.com>
Date: Mon, 13 Apr 2026 17:14:16 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/11] arch: arm64: Export arch_smp_send_reschedule for
 mshv_vtl module
To: Michael Kelley <mhklinux@outlook.com>,
 "K . Y . Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "x86@kernel.org" <x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>,
 Arnd Bergmann <arnd@arndb.de>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Marc Zyngier <maz@kernel.org>, Timothy Hayes <timothy.hayes@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 mrigendrachaubey <mrigendra.chaubey@gmail.com>,
 "ssengar@linux.microsoft.com" <ssengar@linux.microsoft.com>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
References: <20260316121241.910764-1-namjain@linux.microsoft.com>
 <20260316121241.910764-2-namjain@linux.microsoft.com>
 <SN6PR02MB41570A9050B3EB6A905DFF56D450A@SN6PR02MB4157.namprd02.prod.outlook.com>
Content-Language: en-US
From: Naman Jain <namjain@linux.microsoft.com>
In-Reply-To: <SN6PR02MB41570A9050B3EB6A905DFF56D450A@SN6PR02MB4157.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_044434_818311_8E7B545A 
X-CRM114-Status: GOOD (  15.78  )
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



On 4/1/2026 10:24 PM, Michael Kelley wrote:
> From: Naman Jain <namjain@linux.microsoft.com> Sent: Monday, March 16, 2026 5:13 AM
>>
> 
> Nit: For the patch "Subject", the most common prefix for the file
> arch/arm64/kernel/smp.c is "arm64: smp:".  I'd suggest using that
> prefix for historical consistency.

Acked. Will change in v2.

> 
>> mshv_vtl_main.c calls smp_send_reschedule() which expands to
>> arch_smp_send_reschedule(). When CONFIG_MSHV_VTL=m, the module cannot
>> access this symbol since it is not exported on arm64.
>>
>> smp_send_reschedule() is used in mshv_vtl_cancel() to interrupt a vCPU
>> thread running on another CPU. When a vCPU is looping in
>> mshv_vtl_ioctl_return_to_lower_vtl(), it checks a per-CPU cancel flag
>> before each VTL0 entry. Setting cancel=1 alone is not enough if the
>> target CPU thread is sleeping - the IPI from smp_send_reschedule() kicks
>> the remote CPU out of idle/sleep so it re-checks the cancel flag and
>> exits the loop promptly.
>>
>> Other architectures (riscv, loongarch, powerpc) already export this
>> symbol. Add the same EXPORT_SYMBOL_GPL for arm64. This is required
>> for adding arm64 support in MSHV_VTL.
>>
>> Signed-off-by: Naman Jain <namjain@linux.microsoft.com>
>> ---
>>   arch/arm64/kernel/smp.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
>> index 1aa324104afb..26b1a4456ceb 100644
>> --- a/arch/arm64/kernel/smp.c
>> +++ b/arch/arm64/kernel/smp.c
>> @@ -1152,6 +1152,7 @@ void arch_smp_send_reschedule(int cpu)
>>   {
>>   	smp_cross_call(cpumask_of(cpu), IPI_RESCHEDULE);
>>   }
>> +EXPORT_SYMBOL_GPL(arch_smp_send_reschedule);
>>
>>   #ifdef CONFIG_ARM64_ACPI_PARKING_PROTOCOL
>>   void arch_send_wakeup_ipi(unsigned int cpu)
>> --
>> 2.43.0
>>
> 
> The "Subject" nit notwithstanding,
> 
> Reviewed-by: Michael Kelley <mhklinux@outlook.com>

Thanks,
Naman

