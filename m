Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A759C79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 17:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=grZRbCrhUTXUpPXRAbYcUzgWXcibgwB86fQUfCCSFf0=; b=ECEfpQnpuv9TF8DXKRHILuUrYW
	1RvEPvbzpbTS0ePt6Ii8ALQ7qkXqDZfjdgj5RGY/Ulxd9kylUHGik4UnLhNsdNB51TANl3XZ3L8UX
	lVDRaNdl9YTQSZhaYy+4gamrn4MH5k90+1A8+xlCOUiFZJ+2jMXX4bRwaATyA7jbG+WGJ1QLrY6HQ
	DYtwn32VTI4QUSmT5GLHvPvqaZcooVYUbGW+WfwB19UndYv3LTFdctcVa4W91KOudN3cv83rjJkd6
	oHRoXP7TqGY/BU9X/jdPt0kbOkO6W4ukpHQX5N5PqEWGuwWDv9yIlY8PPhB0Lu6MqbBQP7TPg1hVs
	KlWdCDzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4ipk-0000000F5wg-3Zrq;
	Thu, 10 Sep 2026 17:45:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4ipi-0000000F5vn-1uKO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 17:45:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CAFC4237B;
	Thu, 10 Sep 2026 10:45:03 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6CE533F59E;
	Thu, 10 Sep 2026 10:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789062307; bh=lQQkO6iZXqi0Y8a4ze7AN9SoD32y+6oFDlGAoHjbyWM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZrUxtQllsN28zYKXkkk3IqRKzVHUtFYqVDaNn5BTdoE46m6pFaNHLm2iQ7TheaNid
	 /ac3HDUb3O60bLD7dBYjM36MNMRCNDS5zA9UZQle/VLwVrcGmpTcyXBrlDWT18u5s9
	 EKEuy4XThJnYTB/SWuZ4ZiQbnXzQbEs4+0I4Y+8M=
Date: Thu, 10 Sep 2026 18:45:02 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, will@kernel.org,
	linux-kernel@vger.kernel.org, maz@kernel.org,
	pavan.kondeti@oss.qualcomm.com, tabba@google.com,
	aneesh.kumar@kernel.org, mark.rutland@arm.com,
	sdonthineni@nvidia.com, steven.price@arm.com, gshan@redhat.com,
	yuzenghui@huawei.com, kvmarm@lists.linux.dev
Subject: Re: [PATCH v17 1/1] arm64: mm: Handle Granule Protection Faults
 (GPFs)
Message-ID: <aqLsnngKRbMRu211@arm.com>
References: <20260907162204.1479401-1-suzuki.poulose@arm.com>
 <20260907162204.1479401-2-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907162204.1479401-2-suzuki.poulose@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_104510_538488_313A8EE0 
X-CRM114-Status: GOOD (  15.05  )
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

On Mon, Sep 07, 2026 at 05:22:04PM +0100, Suzuki K Poulose wrote:
> diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
> index 0b52557652be6..ad00997b1a873 100644
> --- a/arch/arm64/mm/fault.c
> +++ b/arch/arm64/mm/fault.c
> @@ -910,6 +910,22 @@ static int do_tag_check_fault(unsigned long far, unsigned long esr,
>  	return 0;
>  }
>  
> +static int do_gpf_ptw(unsigned long far, unsigned long esr, struct pt_regs *regs)
> +{
> +	const struct fault_info *inf = esr_to_fault_info(esr);
> +
> +	die_kernel_fault(inf->name, far, esr, regs);
> +	return 0;
> +}
> +
> +static int do_gpf(unsigned long far, unsigned long esr, struct pt_regs *regs)
> +{
> +	if (!is_el1_instruction_abort(esr) && fixup_exception(regs, esr))
> +		return 0;
> +
> +	return 1;
> +}

If we end up with a user PC here, we correctly return 1 but only because
fixup_exception() won't find the PC. I'd rather have this explicit with
a user_mode() check.

> +
>  static const struct fault_info fault_info[] = {
>  	{ do_bad,		SIGKILL, SI_KERNEL,	"ttbr address size fault"	},
>  	{ do_bad,		SIGKILL, SI_KERNEL,	"level 1 address size fault"	},
> @@ -946,12 +962,12 @@ static const struct fault_info fault_info[] = {
>  	{ do_bad,		SIGKILL, SI_KERNEL,	"unknown 32"			},
>  	{ do_alignment_fault,	SIGBUS,  BUS_ADRALN,	"alignment fault"		},
>  	{ do_bad,		SIGKILL, SI_KERNEL,	"unknown 34"			},
> -	{ do_bad,		SIGKILL, SI_KERNEL,	"unknown 35"			},
> -	{ do_bad,		SIGKILL, SI_KERNEL,	"unknown 36"			},
> -	{ do_bad,		SIGKILL, SI_KERNEL,	"unknown 37"			},
> -	{ do_bad,		SIGKILL, SI_KERNEL,	"unknown 38"			},
> -	{ do_bad,		SIGKILL, SI_KERNEL,	"unknown 39"			},
> -	{ do_bad,		SIGKILL, SI_KERNEL,	"unknown 40"			},
> +	{ do_gpf_ptw,		SIGKILL, SI_KERNEL,	"level -1 granule protection fault (translation table walk)" },
> +	{ do_gpf_ptw,		SIGKILL, SI_KERNEL,	"level 0 granule protection fault (translation table walk)" },
> +	{ do_gpf_ptw,		SIGKILL, SI_KERNEL,	"level 1 granule protection fault (translation table walk)" },
> +	{ do_gpf_ptw,		SIGKILL, SI_KERNEL,	"level 2 granule protection fault (translation table walk)" },
> +	{ do_gpf_ptw,		SIGKILL, SI_KERNEL,	"level 3 granule protection fault (translation table walk)" },
> +	{ do_gpf,		SIGBUS,  SI_KERNEL,	"granule protection fault" },

For SIGBUS, we should use BUS_OBJERR like we do for do_sea().

Otherwise it looks fine to me.

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

