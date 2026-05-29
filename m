Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3C36CD5BD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 09:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zxl6Ey6qd+lYAyYyKfczcY0qgz4/Fk1YmlKWFoTKgFg=; b=vEKJbKYnNo7eT5VEEIRNMb7pL4
	YUDfGoVxAi+w6IuVY+94J8QVj4mRLlF2vM5gYYBGDDtbA30mC41HwrKGJlzJSFcT4Rce1OtQiPWQu
	vfzZraJuMtl+2DbCUj6JWZeI8j/n23WJGSyObD7HUcpfFq2vCv5YgH/7Tji2MdSK9iRVcO7GaHXxz
	hUw5H4DwdU45tZNEFA2RMpqlyisHA22foSEDiIA32gdbA0e3OC4KO3OYhXnO5sshLLTdUvM3W8kz5
	IzVyG5e84dJCrF/omUoNm6dtt4dLNAc17E2+uAuEbsEH+uEqgXpEbjl+1tyvNMH47fZJG8z8WebgH
	37I27HbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wStps-0000000766p-0i3a;
	Fri, 29 May 2026 09:49:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wStpp-0000000766T-0skl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 09:48:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C71B522D7;
	Fri, 29 May 2026 02:48:50 -0700 (PDT)
Received: from [10.1.26.144] (unknown [10.1.26.144])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6383E3F905;
	Fri, 29 May 2026 02:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780048135; bh=qKE6RQY1UL6Ybj3788N+Q9/GGE1pDRhS2NExwAdXI2w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cQaQiU/3TMMYGtz80c6+gDs99X62nTZ9L/jwG3KvNLEcvv9+2tXKnk0Ils8YfH3Ls
	 sNroJDRQWXsTTcEQylqOXkkvQm7/Qum1b2icYrRKg3xXTf04JQ4JWoVs5d2h8dETdY
	 5NqMTeqk0K2h3W9B5y0+09Wxrgg9gOMHLjT3G61Y=
Message-ID: <dd52bbf6-3ac2-4387-99ac-d5b913e5df48@arm.com>
Date: Fri, 29 May 2026 10:48:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BOOTWRAPPER PATCH v2 2/2] Add support for GICv5
To: Sascha Bischoff <Sascha.Bischoff@arm.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Cc: "maz@kernel.org" <maz@kernel.org>, Joey Gouly <Joey.Gouly@arm.com>,
 Mark Rutland <Mark.Rutland@arm.com>, nd <nd@arm.com>
References: <20260324125906.67012-1-vladimir.murzin@arm.com>
 <20260324125906.67012-3-vladimir.murzin@arm.com>
 <090fcbae5a217f84fc182f0697d9d9f27556d7a3.camel@arm.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <090fcbae5a217f84fc182f0697d9d9f27556d7a3.camel@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_024857_939371_065E40FF 
X-CRM114-Status: GOOD (  35.89  )
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

Hi Sascha,

On 5/28/26 16:10, Sascha Bischoff wrote:
> Hi Vladimir,
> 
> This looks good overall. There are a few nits around comments and one
> incorrect comment, but the code itself looks good to me and matches the
> spec as far as I can tell.
> 
> I've gone and tested this, and it works as advertised to boot Linux
> (and run KVM) on a GICv5-enabled FVP. Hence:
> 
> Tested-by: Sascha Bischoff <sascha.bischoff@arm.com>
> 

Happy to hear it works not only in my setup :) 

> On Tue, 2026-03-24 at 12:59 +0000, Vladimir Murzin wrote:
>> Performs the minimal initialization required for GICv5 support. GICv5
>> support can be requested with --with-gic=v5.
>>
>> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
>> ---
>>  Makefile.am                    |   7 ++
>>  arch/aarch64/include/asm/cpu.h |  11 +++
>>  common/gic-v5.c                | 134
>> +++++++++++++++++++++++++++++++++
>>  configure.ac                   |   7 +-
>>  scripts/FDT.pm                 |  16 ++++
>>  scripts/findbase-by-regname.pl |  44 +++++++++++
>>  6 files changed, 216 insertions(+), 3 deletions(-)
>>  create mode 100644 common/gic-v5.c
>>  create mode 100755 scripts/findbase-by-regname.pl
>>
>> diff --git a/Makefile.am b/Makefile.am
>> index 2710494..aacd639 100644
>> --- a/Makefile.am
>> +++ b/Makefile.am
>> @@ -82,6 +82,13 @@ PSCI_NODE	:=
>>  CPU_NODES	:=
>>  endif
>>  
>> +if GICV5
>> +GIC_IRS_BASE	:= $(shell perl -I $(SCRIPT_DIR)
>> $(SCRIPT_DIR)/findbase-by-regname.pl $(KERNEL_DTB) "el3-config"
>> 'arm,gic-v5-irs')
>> +GIC_IWB_BASE	:= $(shell perl -I $(SCRIPT_DIR)
>> $(SCRIPT_DIR)/findbase.pl $(KERNEL_DTB) 0 'arm,gic-v5-iwb')
>> +DEFINES		+= -DGIC_IRS_BASE=$(GIC_IRS_BASE)
>> +DEFINES		+= -DGIC_IWB_BASE=$(GIC_IWB_BASE)
>> +endif
>> +
>>  if GICV3
>>  GIC_DIST_BASE	:= $(shell perl -I $(SCRIPT_DIR)
>> $(SCRIPT_DIR)/findbase.pl $(KERNEL_DTB) 0 'arm,gic-v3')
>>  GIC_RDIST_BASE	:= $(shell perl -I $(SCRIPT_DIR)
>> $(SCRIPT_DIR)/findbase.pl $(KERNEL_DTB) 1 'arm,gic-v3')
>> diff --git a/arch/aarch64/include/asm/cpu.h
>> b/arch/aarch64/include/asm/cpu.h
>> index ac50474..af4191c 100644
>> --- a/arch/aarch64/include/asm/cpu.h
>> +++ b/arch/aarch64/include/asm/cpu.h
>> @@ -128,6 +128,7 @@
>>  #define ID_AA64PFR1_EL1_THE		BITS(51, 48)
>>  
>>  #define ID_AA64PFR2_EL1			s3_0_c0_c4_2
>> +#define ID_AA64PFR2_EL1_GCIE		BITS(15, 12)
>>  #define ID_AA64PFR2_EL1_FPMR		BITS(35, 32)
>>  
>>  #define ID_AA64SMFR0_EL1		s3_0_c0_c4_5
>> @@ -169,6 +170,11 @@
>>  #define ICC_CTLR_EL3		S3_6_C12_C12_4
>>  #define ICC_PMR_EL1		S3_0_C4_C6_0
>>  
>> +#define ICC_PPI_DOMAINR0_EL3	S3_6_C12_C8_4
>> +#define ICC_PPI_DOMAINR1_EL3	S3_6_C12_C8_5
>> +#define ICC_PPI_DOMAINR2_EL3	S3_6_C12_C8_6
>> +#define ICC_PPI_DOMAINR3_EL3	S3_6_C12_C8_7
>> +
>>  #define VSTCR_EL2		s3_4_c2_c6_2
>>  #define VSCTLR_EL2		s3_4_c2_c0_0
>>  
>> @@ -245,6 +251,11 @@ static inline int has_gicv3_sysreg(void)
>>  	return !!mrs_field(ID_AA64PFR0_EL1, GIC);
>>  }
>>  
>> +static inline int has_gicv5_sysreg(void)
>> +{
>> +	return !!mrs_field(ID_AA64PFR2_EL1, GCIE);
>> +}
>> +
>>  #endif /* !__ASSEMBLY__ */
>>  
>>  #endif
>> diff --git a/common/gic-v5.c b/common/gic-v5.c
>> new file mode 100644
>> index 0000000..cef2ece
>> --- /dev/null
>> +++ b/common/gic-v5.c
>> @@ -0,0 +1,134 @@
>> +/*
>> + * gic-v5.c
>> + *
>> + * Copyright (C) 2025 ARM Limited. All rights reserved.
>> + *
>> + * Use of this source code is governed by a BSD-style license that
>> can be
>> + * found in the LICENSE.txt file.
>> + */
>> +
>> +#include <stdint.h>
>> +
>> +#include <cpu.h>
>> +#include <gic.h>
>> +#include <asm/io.h>
>> +
>> +#define IWB_IDR0			0x0
>> +#define IWB_IDR0_IW_RANGE_SHIFT		0x0
>> +#define IWB_IDR0_IW_RANGE_MASK		0x7ff
>> +
>> +#define IWB_CR0				0x80
>> +#define IWB_CR0_IWBEN			(1 << 0)
>> +#define IWB_CR0_IDLE			(1 << 1)
>> +
>> +#define IWB_WENABLE_STATUSR		0xc0
>> +#define IWB_WENABLE_STATUSR_IDLE	(1 << 0)
>> +
>> +#define IWB_WDOMAIN_STATUSR		0xc4
>> +#define IWB_WDOMAIN_STATUSR_IDLE	(1 << 0)
>> +
>> +#define IWB_WENABLER			0x2000
>> +#define IWB_WDOMAINR			0x8000
>> +
>> +#define IRS_IDR6			0x0018
>> +#define IRS_IDR6_SPI_IRS_RANGE_MASK	0x1ffffff
>> +
>> +#define IRS_IDR7			0x001c
>> +#define IRS_IDR7_SPI_BASE_MASK		0xffffff
>> +
>> +#define IRS_SPI_SELR			0x108
>> +#define IRS_SPI_DOMAINR			0x10c
>> +
>> +#define IRS_SPI_STATUSR			0x0118
>> +#define IRS_SPI_STATUSR_IDLE		(1 << 0)
>> +
>> +
> nit: extra newline
> 
>> +static void gic_iwb_init(void) {
>> +	void *iwb_ptr = (void *)GIC_IWB_BASE;
>> +	unsigned int num;
>> +	unsigned int i;
>> +
>> +	/* Get number of implemented wires */
> This comment is wrong. This isn't getting the number of wires. It is
> getting the number of wire control registers, which is
> number_of_wires/32.
> 
>> +	num = ((raw_readl(iwb_ptr + IWB_IDR0) >>
>> IWB_IDR0_IW_RANGE_SHIFT) & IWB_IDR0_IW_RANGE_MASK) + 1;
>> +
>> +	/* Disable all wires */
>> +	for (i = 0; i < num; i++)
>> +		raw_writel(0, iwb_ptr + IWB_WENABLER + i * 4);
>> +
>> +
> Extra newline
> 
>> +	while (!(raw_readl(iwb_ptr + IWB_WENABLE_STATUSR) &
>> IWB_WENABLE_STATUSR_IDLE));
>> +
>> +	/* Asign all wires to Non-Secure domain */
> nit: Assign
> 
>> +	for (i = 0; i < num * 2; i++)
>> +		raw_writel(0x55555555, iwb_ptr + IWB_WDOMAINR + i *
>> 4);
>> +
>> +	while (!(raw_readl(iwb_ptr + IWB_WDOMAIN_STATUSR) &
>> IWB_WDOMAIN_STATUSR_IDLE));
>> +
>> +	/* Enable IWB */
>> +	raw_writel(IWB_CR0_IWBEN, iwb_ptr + IWB_CR0);
>> +
>> +	while (!(raw_readl(iwb_ptr + IWB_CR0) & IWB_CR0_IDLE));
>> +}
>> +
>> +static void gic_irs_init(void) {
>> +	void *irs_ptr = (void *)GIC_IRS_BASE;
>> +	unsigned int range;
>> +	unsigned int base;
>> +	unsigned int i;
>> +
>> +	/* Get the range of implemented SPI's ids */
> nit: SPI IDs (or just SPIs)
> 
>> +	base = raw_readl(irs_ptr + IRS_IDR7) &
>> IRS_IDR7_SPI_BASE_MASK;
>> +	range = raw_readl(irs_ptr + IRS_IDR6) &
>> IRS_IDR6_SPI_IRS_RANGE_MASK;
>> +
>> +	for (i = base; i < base + range; i++) {
>> +		/* Select SPI */
>> +		raw_writel(i, irs_ptr + IRS_SPI_SELR);
>> +		while (!(raw_readl(irs_ptr + IRS_SPI_STATUSR) &
>> IRS_SPI_STATUSR_IDLE));
>> +
>> +		/* Asign SPI to Non-Secure domain */
>> +		raw_writel(1, irs_ptr + IRS_SPI_DOMAINR);
>> +		while (!(raw_readl(irs_ptr + IRS_SPI_STATUSR) &
>> IRS_SPI_STATUSR_IDLE));
>> +	}
>> +}
>> +
>> +static void gic_ppi_init(void) {
>> +	uint64_t val = 0;
>> +
>> +	val |= 1UL << (2 * 31); // Trace Buffer Unit
>> +	val |= 1UL << (2 * 30); // EL1 Physical Timer
>> +	val |= 1UL << (2 * 28); // Non-secure EL2 Virtual Timer
>> +	val |= 1UL << (2 * 27); // EL1 Virtual Timer
>> +	val |= 1UL << (2 * 26); // Non-secure EL2 Physical Timer
>> +	val |= 1UL << (2 * 25); // GIC maintenance interrupt
>> +	val |= 1UL << (2 * 24); // Generic CTI interrupt trigger
>> event
>> +	val |= 1UL << (2 * 23); // PMU overflow interrupt request
>> +	val |= 1UL << (2 * 22); // Debug communication channel
>> +	val |= 1UL << (2 * 21); // Profiling Buffer management
>> interrupt request
>> +	val |= 1UL << (2 * 15); // Hardware accelerator for cleaning
>> Dirty state interrupt
>> +	val |= 1UL << (2 * 3);  // Reserved for software usage
>> +
>> +	/* Asign PPI to Non-Secure domain */
> nit: Assign PPIs
> 
>> +	msr(ICC_PPI_DOMAINR0_EL3, val);
>> +	isb();
>> +}
>> +
>> +void gic_secure_init(void)
>> +{
>> +	/*
>> +	 * If GICv5 is not available, skip initialisation. The OS
>> will probably
>> +	 * fail with a warning, but this should be easier to debug
>> than a
>> +	 * failure within the boot wrapper.
>> +	 */
>> +	if (!has_gicv5_sysreg())
>> +		return;
>> +
>> +	if (this_cpu_logical_id() == 0) {
>> +		gic_iwb_init();
>> +		gic_irs_init();
>> +	}
>> +
>> +	gic_ppi_init();
>> +
>> +	return;
>> +}
>> +
>> diff --git a/configure.ac b/configure.ac
>> index 6f486c4..f4faff7 100644
>> --- a/configure.ac
>> +++ b/configure.ac
>> @@ -141,18 +141,19 @@ AC_SUBST([XEN_CMDLINE], [$X_CMDLINE])
>>  
>>  
>>  AC_ARG_WITH([gic],
>> -  AS_HELP_STRING([--with-gic={v2|v3}], [select GIC version]),
>> +  AS_HELP_STRING([--with-gic={v2|v3|v5}], [select GIC version]),
>>    [GIC_VERSION=$withval],
>>    [GIC_VERSION=v2])
>>  
>>  AS_CASE([$GIC_VERSION],
>> -  [v2|v3], [],
>> -  [AC_MSG_ERROR([Invalid GIC version: $GIC_VERSION (use v2 or
>> v3)])])
>> +  [v2|v3|v5], [],
>> +  [AC_MSG_ERROR([Invalid GIC version: $GIC_VERSION (use v2, v3, or
>> v5)])])
>>  
>>  AC_SUBST([GIC_VERSION], [$GIC_VERSION])
>>  
>>  AM_CONDITIONAL([GICV2], [test "x$GIC_VERSION" = "xv2"])
>>  AM_CONDITIONAL([GICV3], [test "x$GIC_VERSION" = "xv3"])
>> +AM_CONDITIONAL([GICV5], [test "x$GIC_VERSION" = "xv5"])
>>  
>>  
>>  # Ensure that we have all the needed programs
>> diff --git a/scripts/FDT.pm b/scripts/FDT.pm
>> index 9adf70b..3f49ba6 100755
>> --- a/scripts/FDT.pm
>> +++ b/scripts/FDT.pm
>> @@ -322,6 +322,22 @@ sub get_num_reg_cells
>>  	return ($ac, $sc);
>>  }
>>  
>> +sub get_regname_idx
>> +{
>> +    my $self = shift;
>> +    my $regname = shift;
>> +
>> +    my $prop = $self->get_property("reg-names");
>> +
>> +    return undef if (not defined($prop));
>> +
>> +    my @names = $prop->read_strings();
>> +
>> +    my ($idx) = grep { $names[$_] eq $regname } 0 .. $#names;
>> +
>> +    return $idx;
>> +}
>> +
>>  sub translate_address
>>  {
>>  	my $self = shift;
>> diff --git a/scripts/findbase-by-regname.pl b/scripts/findbase-by-
>> regname.pl
>> new file mode 100755
>> index 0000000..49cd0ce
>> --- /dev/null
>> +++ b/scripts/findbase-by-regname.pl
>> @@ -0,0 +1,44 @@
>> +#!/usr/bin/perl -w
>> +# Find device register base addresses.
>> +#
>> +# Usage: ./$0 <DTB> <regname> <compatible ...>
>> +#
>> +# Copyright (C) 2026 ARM Limited. All rights reserved.
>> +#
>> +# Use of this source code is governed by a BSD-style license that
>> can be
>> +# found in the LICENSE.txt file.
>> +
>> +use warnings;
>> +use strict;
>> +
>> +use FDT;
>> +
>> +my $filename = shift;
>> +die("No filename provided") unless defined($filename);
>> +
>> +my $regname = shift;
>> +die("no reg regname provided") unless defined($regname);
>> +
>> +my @compats = shift;
>> +
>> +open (my $fh, "<:raw", $filename) or die("Unable to open file
>> '$filename'");
>> +
>> +my $fdt = FDT->parse($fh) or die("Unable to parse DTB");
>> +
>> +my $root = $fdt->get_root();
>> +
>> +my @devs = ();
>> +for my $compat (@compats) {
>> +	push @devs, $root->find_compatible($compat);
>> +}
>> +
>> +# We only care about finding the first matching device
>> +my $dev = shift @devs;
>> +die("No matching devices found") if (not defined($dev));
>> +
>> +my $idx = $dev->get_regname_idx($regname);
>> +die("Cannot find reg name $regname") if (not defined($idx));
>> +my ($addr, $size) = $dev->get_translated_reg($idx);
>> +die("Cannot find reg entry $idx") if (not defined($addr) or not
>> defined($size));
>> +
>> +printf("0x%016x\n", $addr);
> Thanks,
> Sascha
> 

Thanks Sascha, all fixed locally.

Cheers
Vladimir

