Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59171CD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 15:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DXcnBexl77Bz72p90omN1kaVPa0hasEJYZymQtUsUTw=; b=aD/Z4Mnei+7FS2+BHM9px0j5D0
	0tYlKF8Z+2tdOLJusKaN26li6k1B+a10PxSaXYyoy1rap8W/LSvL7VtfAgZsXd0iGMpRGYG+TTbbn
	Kq4UZnBPDcNWQo8/9ERcfLB0Tk0Y6w5cD1rfUKsKOVYgAu9GZUSk/1SMJ+6EDbsrEiUstTS9NqP6X
	FOJ3FTWEgZINpIk1NkY2UH8IrTVU6AJtvxTjcjtKx4qEK6zpaG2g84nRg75PgHqu/lRpXBDDBWKuM
	luVEgAOWZkbgqqI0d796YJxfQL+Gg60rEtaVbggcrRLEcLMxDZZRUvykEfTUnJkP59UkPAqQnNpkK
	9S4dGEQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ57a-00000008H9f-23Gw;
	Thu, 21 May 2026 15:15:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ57X-00000008H8z-3QwV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 15:15:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C34523AEC;
	Thu, 21 May 2026 08:15:28 -0700 (PDT)
Received: from [10.1.32.22] (e122027.cambridge.arm.com [10.1.32.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DA9FD3F7B4;
	Thu, 21 May 2026 08:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779376533; bh=3y9ZG7S7MPMGSv9tY2zvWNHcxtxTfvmCabG0wclRyUE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=q1p85n1dcwPlMDtm8GdOza6yOXj63L2mykIMJpBURkQ3sysBkNbyYuFr9BsBKd1OU
	 VB0Uo0SpRNAZADbxgmAphDwkA2FHnTiT+vONs/AL+7JTIcmbyN92nTu0GHcKvJqFl1
	 NSWjOb+jH1lt2GmNYWfXACP1a0vtMHmh86KGQJ3U=
Message-ID: <82e39e69-a344-4330-a8dd-7073b005a6e5@arm.com>
Date: Thu, 21 May 2026 16:15:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 03/44] arm64: RME: Handle Granule Protection Faults
 (GPFs)
To: Marc Zyngier <maz@kernel.org>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 James Morse <james.morse@arm.com>, Oliver Upton <oliver.upton@linux.dev>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Christoffer Dall <christoffer.dall@arm.com>, Fuad Tabba <tabba@google.com>,
 linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Gavin Shan <gshan@redhat.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 Alper Gun <alpergun@google.com>, "Aneesh Kumar K . V"
 <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>,
 Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com,
 Lorenzo.Pieralisi2@arm.com
References: <20260513131757.116630-1-steven.price@arm.com>
 <20260513131757.116630-4-steven.price@arm.com> <86fr3lvtk3.wl-maz@kernel.org>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <86fr3lvtk3.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_081535_943017_DE096981 
X-CRM114-Status: GOOD (  20.83  )
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

On 21/05/2026 13:25, Marc Zyngier wrote:
> On Wed, 13 May 2026 14:17:11 +0100,
> Steven Price <steven.price@arm.com> wrote:
>>
>> If the host attempts to access granules that have been delegated for use
>> in a realm these accesses will be caught and will trigger a Granule
>> Protection Fault (GPF).
>>
>> A fault during a page walk signals a bug in the kernel and is handled by
>> oopsing the kernel. A non-page walk fault could be caused by user space
>> having access to a page which has been delegated to the kernel and will
>> trigger a SIGBUS to allow debugging why user space is trying to access a
>> delegated page.
>>
>> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>> Reviewed-by: Gavin Shan <gshan@redhat.com>
>> Signed-off-by: Steven Price <steven.price@arm.com>
>> ---
>> Changes since v10:
>>  * Don't call arm64_notify_die() in do_gpf() but simply return 1.
>> Changes since v2:
>>  * Include missing "Granule Protection Fault at level -1"
>> ---
>>  arch/arm64/mm/fault.c | 28 ++++++++++++++++++++++------
>>  1 file changed, 22 insertions(+), 6 deletions(-)
>>
>> diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
>> index 0f3c5c7ca054..6358ea4787ba 100644
>> --- a/arch/arm64/mm/fault.c
>> +++ b/arch/arm64/mm/fault.c
>> @@ -905,6 +905,22 @@ static int do_tag_check_fault(unsigned long far, unsigned long esr,
>>  	return 0;
>>  }
>>  
>> +static int do_gpf_ptw(unsigned long far, unsigned long esr, struct pt_regs *regs)
>> +{
>> +	const struct fault_info *inf = esr_to_fault_info(esr);
>> +
>> +	die_kernel_fault(inf->name, far, esr, regs);
>> +	return 0;
>> +}
>> +
>> +static int do_gpf(unsigned long far, unsigned long esr, struct pt_regs *regs)
>> +{
>> +	if (!is_el1_instruction_abort(esr) && fixup_exception(regs, esr))
>> +		return 0;
>> +
>> +	return 1;
>> +}
>> +
>>  static const struct fault_info fault_info[] = {
>>  	{ do_bad,		SIGKILL, SI_KERNEL,	"ttbr address size fault"	},
>>  	{ do_bad,		SIGKILL, SI_KERNEL,	"level 1 address size fault"	},
>> @@ -941,12 +957,12 @@ static const struct fault_info fault_info[] = {
>>  	{ do_bad,		SIGKILL, SI_KERNEL,	"unknown 32"			},
>>  	{ do_alignment_fault,	SIGBUS,  BUS_ADRALN,	"alignment fault"		},
>>  	{ do_bad,		SIGKILL, SI_KERNEL,	"unknown 34"			},
>> -	{ do_bad,		SIGKILL, SI_KERNEL,	"unknown 35"			},
>> -	{ do_bad,		SIGKILL, SI_KERNEL,	"unknown 36"			},
>> -	{ do_bad,		SIGKILL, SI_KERNEL,	"unknown 37"			},
>> -	{ do_bad,		SIGKILL, SI_KERNEL,	"unknown 38"			},
>> -	{ do_bad,		SIGKILL, SI_KERNEL,	"unknown 39"			},
>> -	{ do_bad,		SIGKILL, SI_KERNEL,	"unknown 40"			},
>> +	{ do_gpf_ptw,		SIGKILL, SI_KERNEL,	"Granule Protection Fault at level -1" },
>> +	{ do_gpf_ptw,		SIGKILL, SI_KERNEL,	"Granule Protection Fault at level 0" },
>> +	{ do_gpf_ptw,		SIGKILL, SI_KERNEL,	"Granule Protection Fault at level 1" },
>> +	{ do_gpf_ptw,		SIGKILL, SI_KERNEL,	"Granule Protection Fault at level 2" },
>> +	{ do_gpf_ptw,		SIGKILL, SI_KERNEL,	"Granule Protection Fault at level 3" },
>> +	{ do_gpf,		SIGBUS,  SI_KERNEL,	"Granule Protection Fault not on table walk" },
> 
> It wouldn't hurt to align the textual description with what we have
> for other fault syndromes:
> 
> 	"level X granule protection fault (translation table walk)"
> 
> for the PTW-trigger faults, and
> 
> 	"granule protection fault"
> 
> for the non PTW case.

Sure, no problem.

Thanks,
Steve

> 
> Thanks,
> 
> 	M.
> 


