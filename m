Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4741CEA8552
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 04:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VcFeIjx/kFPapeVcWBRCbJKEh34txyf1s44oxCrJMLM=; b=I7pOOnZHpeN9AKpYB8YWO+K6Qn
	yyRIfFVdfw0AByTE5O64NtzhBW4lyjgUVOpPw/7Bye/xv6sYMGWSu22udWeM5B3YU0OST59F5kNQR
	Ea1Q0xyFV1IAsOJpSZg8aofQK+BOORkwpHBmEYS8B4jfWak6EVNQRYHB2lk+pKI5eCO/fH7uhEjOA
	0VUERKRP5Ye8QGkuhvRtupDnwMcpvxQbJQiFrO6xaOZQFzytx1fAFOk/Bpae/ShpqAZGFKSrdgHn4
	HfQtYFZozdIBf9a0Bsp6pCAAvmGTMCZxl4BLAyA3LAkAqLoP6QiqmNB/5CPADhILKN5hmsbN1x7PV
	OrqCXq5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzS51-00000006dQA-1RmS;
	Mon, 09 Mar 2026 04:18:55 +0000
Received: from canpmsgout03.his.huawei.com ([113.46.200.218])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzS4y-00000006dPG-30pp;
	Mon, 09 Mar 2026 04:18:54 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=VcFeIjx/kFPapeVcWBRCbJKEh34txyf1s44oxCrJMLM=;
	b=ol8QqwPNIUmxbtyWrgNcNqbEdLIpeRj6Pz/TpU3TDi14gpa7wLJpmDHXFdha5RdCid7NTLtTf
	voC6PheOGh96yK0L9QAS865k3rYsGeK1D/sKryROy0/4JqM66H1zLhU7FxxLd8941ZOL+vMRs0S
	d7tvBLpfx7y6tsXoh01LOjw=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4fTkCQ6yyKzpTXt;
	Mon,  9 Mar 2026 12:13:38 +0800 (CST)
Received: from kwepemk500009.china.huawei.com (unknown [7.202.194.94])
	by mail.maildlp.com (Postfix) with ESMTPS id ACFA420168;
	Mon,  9 Mar 2026 12:18:46 +0800 (CST)
Received: from [10.67.121.161] (10.67.121.161) by
 kwepemk500009.china.huawei.com (7.202.194.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 9 Mar 2026 12:18:45 +0800
Message-ID: <004f0d24-4413-40b2-8e31-392cb7f69523@huawei.com>
Date: Mon, 9 Mar 2026 12:18:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] PCI/TPH: Fix get cpu steer-tag fail on ARM64 platform
To: Jonathan Cameron <jonathan.cameron@huawei.com>
CC: <linux-pci@vger.kernel.org>, <bhelgaas@google.com>, Jonathan Corbet
	<corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Huacai Chen
	<chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Paul Walmsley
	<pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Thomas Gleixner
	<tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
	<bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, <x86@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Sunil V L <sunilvl@ventanamicro.com>, Mark
 Rutland <mark.rutland@arm.com>, Eric Van Tassell <Eric.VanTassell@amd.com>,
	Wei Huang <wei.huang2@amd.com>, Ajit Khaparde <ajit.khaparde@broadcom.com>,
	Andy Gospodarek <andrew.gospodarek@broadcom.com>,
	<linux-acpi@vger.kernel.org>, <wangzhou1@hisilicon.com>,
	<wanghuiqiang@huawei.com>, <liuyonglong@huawei.com>,
	<stable@vger.kernel.org>, <jeremy.linton@arm.com>,
	<sunilvl@oss.qualcomm.com>, <chenhuacai@loongson.cn>,
	<wangliupu@loongson.cn>, Somnath Kotur <somnath.kotur@broadcom.com>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <loongarch@lists.linux.dev>,
	<linux-riscv@lists.infradead.org>, <linux-perf-users@vger.kernel.org>
References: <20260303003625.39035-1-fengchengwen@huawei.com>
 <20260306021920.23233-1-fengchengwen@huawei.com>
 <20260306100150.00003f38@huawei.com>
Content-Language: en-US
From: fengchengwen <fengchengwen@huawei.com>
In-Reply-To: <20260306100150.00003f38@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.161]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemk500009.china.huawei.com (7.202.194.94)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260308_211853_111366_DD5A4B0A 
X-CRM114-Status: GOOD (  20.27  )
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

On 3/6/2026 6:01 PM, Jonathan Cameron wrote:
> On Fri, 6 Mar 2026 10:19:17 +0800
> Chengwen Feng <fengchengwen@huawei.com> wrote:
> 
>> Currently the pcie_tph_get_cpu_st() has an issue on ARM64 platform:
>> 1. The pcie_tph_get_cpu_st() function directly uses cpu_uid as the input
>>    parameter to call the PCI ACPI DSM method. According to the DSM
>>    definition, the input value should be the ACPI Processor UID (see [1]
>>    for details).
>> 2. In the Broadcom driver implementation [2] (which invokes
>>    pcie_tph_get_cpu_st()), cpu_uid is obtained via
>>    cpumask_first(irq->cpu_mask) - this is the logical CPU ID of a CPU
>>    core, generated and managed by kernel (e.g., [0,255] for a system
>>    with 256 logical CPU cores).
>> 3. On ARM64 platforms, ACPI assigns Processor UID to cores listed in the
>>    MADT table, and this UID may not match the kernel's logical CPU ID.
>>    As a result, the current implementation fails to retrieve the correct
>>    CPU steer-tag in such cases.
>> 4. The function works on AMD x86 platforms only because the logical CPU
>>    ID is identical to the ACPI Processor UID on those systems.
>>
>> This commit fixes it by:
>> 1. For ACPI-enabled platforms, unify the CPU ACPI ID retrieval
>>    interface:
>>    - On arm64/riscv/loongarch: Rename existing get_acpi_id_for_cpu() to
>>      acpi_get_cpu_acpi_id().
>>    - On x86: Add new acpi_get_cpu_acpi_id() implementation that wraps
>>      cpu_acpi_id().
>> 2. Update pcie_tph_get_cpu_st() to use acpi_get_cpu_acpi_id(cpu) to get
>>    valid ACPI Processor UID for DSM calls.
>> 3. Renaming pcie_tph_get_cpu_st()'s input parameter cpu_uid to cpu for
>>    clarity, as the parameter now represents a logical CPU ID (not a
>>    UID).
>>
>> [1] According to ECN_TPH-ST_Revision_20200924
>>     (https://members.pcisig.com/wg/PCI-SIG/document/15470), the input
>>     is defined as: "If the target is a processor, then this field
>>     represents the ACPI Processor UID of the processor as specified in
>>     the MADT. If the target is a processor container, then this field
>>     represents the ACPI Processor UID of the processor container as
>>     specified in the PPTT."
>> [2] commit c214410c47d6e ("bnxt_en: Add TPH support in BNXT driver")
>>
>> Fixes: d2e8a34876ce ("PCI/TPH: Add Steering Tag support")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Chengwen Feng <fengchengwen@huawei.com>
>>
>> ---
>> Changes in v3:
>> - Rename existing get_acpi_id_for_cpu() to acpi_get_cpu_acpi_id() other
>>   than add one new API.
> Ah. I wasn't clear around that rename suggestion.  Split this into two patches.
> 1) Rename
> 2) The new stuff plus x86 implementation.

Hi Jonathan,

All fixes are applied in v4. Please review.

Thanks.

> 
>>
>> Changes in v2:
>> - Add ECN _DSM reference doc name and its URL.
>> - Separate implement acpi_get_cpu_acpi_id() in each arch which supports
>>   ACPI.
>> - Refine commit-log.
>>
>> ---
>>  Documentation/PCI/tph.rst          |  4 ++--
>>  arch/arm64/include/asm/acpi.h      |  4 ++--
>>  arch/loongarch/include/asm/acpi.h  |  2 +-
>>  arch/riscv/include/asm/acpi.h      |  2 +-
>>  arch/riscv/kernel/acpi_numa.c      |  2 +-
>>  arch/x86/include/asm/acpi.h        |  2 ++
>>  arch/x86/kernel/cpu/common.c       |  8 ++++++++
>>  drivers/acpi/pptt.c                | 16 ++++++++--------
>>  drivers/acpi/riscv/rhct.c          |  2 +-
>>  drivers/pci/tph.c                  | 11 ++++++-----
>>  drivers/perf/arm_cspmu/arm_cspmu.c |  2 +-
>>  include/linux/pci-tph.h            |  4 ++--
>>  12 files changed, 35 insertions(+), 24 deletions(-)
> 
> 
> 


