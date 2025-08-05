Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBE77C87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 09:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+jSRcozQ16UWwmDlYI7fBrDTYBCwlnFhrCUXJ87XM+w=; b=nZRDiLCsXWnKaJn+QSISxvWznt
	PVhMFlP9TmFR2jcRD8euaAuDpzfacpyKykeL0WeGgOkCyMG3ULSaUfBpMK47p74+uJaN8G1ejb1H5
	jzKU2jGS1re0gTtbOb9tjMQ7/cy4f8hQBYHT96GnKaPYjhhMBeRn07lXa3nXpWEFgBKXUvtR3VLrZ
	kG7pVht/ocxYz8xwtWulWW0FxgFFclTGCvW7NAfS52qB78gzxVL1cdcpq6qGrKYZjYl+19D5ObFyF
	A6u/UIrWeDmDkm3e61cbqL7ZB6CrhpnJoLPbN2bm1OyYtMQQPSOmwl7g47hQCX5yQDiVJueWdOCbP
	1iQK8pmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujDXa-0000000CHtv-0F1p;
	Tue, 05 Aug 2025 09:01:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujCqb-0000000C7wG-3YZT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 08:16:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4D6601424;
	Tue,  5 Aug 2025 01:16:29 -0700 (PDT)
Received: from [10.57.87.210] (unknown [10.57.87.210])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4C65A3F673;
	Tue,  5 Aug 2025 01:16:33 -0700 (PDT)
Message-ID: <985f9d53-ea5e-4da0-9427-106a58be7f26@arm.com>
Date: Tue, 5 Aug 2025 09:16:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v6 0/4] arm64: support FEAT_BBM level 2 and large
 block mapping when rodata=full
Content-Language: en-GB
To: Yang Shi <yang@os.amperecomputing.com>, will@kernel.org,
 catalin.marinas@arm.com, akpm@linux-foundation.org, Miko.Lenczewski@arm.com,
 dev.jain@arm.com, scott@os.amperecomputing.com, cl@gentwo.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250805081350.3854670-1-ryan.roberts@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20250805081350.3854670-1-ryan.roberts@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_011637_970867_E9B35130 
X-CRM114-Status: GOOD (  22.10  )
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

On 05/08/2025 09:13, Ryan Roberts wrote:
> Hi All,
> 
> This is a new version built on top of Yang Shi's work at [1]. Yang and I have
> been discussing (disagreeing?) about the best way to implement the last 2
> patches. So I've reworked them and am posting as RFC to illustrate how I think
> this feature should be implemented, but I've retained Yang as primary author
> since it is all based on his work. I'd appreciate feedback from Catalin and/or
> Will on whether this is the right approach, so that hopefully we can get this
> into shape for 6.18.

I forgot to mention that it applies on Linus's current master (it depends upon
mm and arm64 changes that will first appear in v6.17-rc1 and are already merged
in master). I'm using 89748acdf226 as the base.

> 
> The first 2 patches are unchanged from Yang's v5; the first patch comes from Dev
> and the rest of the series depends upon it.
> 
> I've tested this on an AmpereOne system (a VM with 12G RAM) in all 3 possible
> modes by hacking the BBML2 feature detection code:
> 
>   - mode 1: All CPUs support BBML2 so the linear map uses large mappings
>   - mode 2: Boot CPU does not support BBML2 so linear map uses pte mappings
>   - mode 3: Boot CPU supports BBML2 but secondaries do not so linear map
>     initially uses large mappings but is then repainted to use pte mappings
> 
> In all cases, mm selftests run and no regressions are observed. In all cases,
> ptdump of linear map is as expected:
> 
> Mode 1:
> =======
> ---[ Linear Mapping start ]---
> 0xffff000000000000-0xffff000000200000           2M PMD       RW NX SHD AF        BLK UXN    MEM/NORMAL-TAGGED
> 0xffff000000200000-0xffff000000210000          64K PTE       RW NX SHD AF    CON     UXN    MEM/NORMAL-TAGGED
> 0xffff000000210000-0xffff000000400000        1984K PTE       ro NX SHD AF            UXN    MEM/NORMAL
> 0xffff000000400000-0xffff000002400000          32M PMD       ro NX SHD AF        BLK UXN    MEM/NORMAL
> 0xffff000002400000-0xffff000002550000        1344K PTE       ro NX SHD AF            UXN    MEM/NORMAL
> 0xffff000002550000-0xffff000002600000         704K PTE       RW NX SHD AF    CON     UXN    MEM/NORMAL-TAGGED
> 0xffff000002600000-0xffff000004000000          26M PMD       RW NX SHD AF        BLK UXN    MEM/NORMAL-TAGGED
> 0xffff000004000000-0xffff000040000000         960M PMD       RW NX SHD AF    CON BLK UXN    MEM/NORMAL-TAGGED
> 0xffff000040000000-0xffff000140000000           4G PUD       RW NX SHD AF        BLK UXN    MEM/NORMAL-TAGGED
> 0xffff000140000000-0xffff000142000000          32M PMD       RW NX SHD AF    CON BLK UXN    MEM/NORMAL-TAGGED
> 0xffff000142000000-0xffff000142120000        1152K PTE       RW NX SHD AF    CON     UXN    MEM/NORMAL-TAGGED
> 0xffff000142120000-0xffff000142128000          32K PTE       RW NX SHD AF            UXN    MEM/NORMAL-TAGGED
> 0xffff000142128000-0xffff000142159000         196K PTE       ro NX SHD AF            UXN    MEM/NORMAL-TAGGED
> 0xffff000142159000-0xffff000142160000          28K PTE       RW NX SHD AF            UXN    MEM/NORMAL-TAGGED
> 0xffff000142160000-0xffff000142240000         896K PTE       RW NX SHD AF    CON     UXN    MEM/NORMAL-TAGGED
> 0xffff000142240000-0xffff00014224e000          56K PTE       RW NX SHD AF            UXN    MEM/NORMAL-TAGGED
> 0xffff00014224e000-0xffff000142250000           8K PTE       ro NX SHD AF            UXN    MEM/NORMAL-TAGGED
> 0xffff000142250000-0xffff000142260000          64K PTE       RW NX SHD AF            UXN    MEM/NORMAL-TAGGED
> 0xffff000142260000-0xffff000142280000         128K PTE       RW NX SHD AF    CON     UXN    MEM/NORMAL-TAGGED
> 0xffff000142280000-0xffff000142288000          32K PTE       RW NX SHD AF            UXN    MEM/NORMAL-TAGGED
> 0xffff000142288000-0xffff000142290000          32K PTE       ro NX SHD AF            UXN    MEM/NORMAL-TAGGED
> 0xffff000142290000-0xffff0001422a0000          64K PTE       RW NX SHD AF            UXN    MEM/NORMAL-TAGGED
> 0xffff0001422a0000-0xffff000142465000        1812K PTE       ro NX SHD AF            UXN    MEM/NORMAL-TAGGED
> 0xffff000142465000-0xffff000142470000          44K PTE       RW NX SHD AF            UXN    MEM/NORMAL-TAGGED
> 0xffff000142470000-0xffff000142600000        1600K PTE       RW NX SHD AF    CON     UXN    MEM/NORMAL-TAGGED
> 0xffff000142600000-0xffff000144000000          26M PMD       RW NX SHD AF        BLK UXN    MEM/NORMAL-TAGGED
> 0xffff000144000000-0xffff000180000000         960M PMD       RW NX SHD AF    CON BLK UXN    MEM/NORMAL-TAGGED
> 0xffff000180000000-0xffff000181a00000          26M PMD       RW NX SHD AF        BLK UXN    MEM/NORMAL-TAGGED
> 0xffff000181a00000-0xffff000181b90000        1600K PTE       RW NX SHD AF    CON     UXN    MEM/NORMAL-TAGGED
> 0xffff000181b90000-0xffff000181b9d000          52K PTE       RW NX SHD AF            UXN    MEM/NORMAL-TAGGED
> 0xffff000181b9d000-0xffff000181c80000         908K PTE       ro NX SHD AF            UXN    MEM/NORMAL-TAGGED
> 0xffff000181c80000-0xffff000181c90000          64K PTE       RW NX SHD AF            UXN    MEM/NORMAL-TAGGED
> 0xffff000181c90000-0xffff000181ca0000          64K PTE       RW NX SHD AF    CON     UXN    MEM/NORMAL-TAGGED
> 0xffff000181ca0000-0xffff000181dbd000        1140K PTE       ro NX SHD AF            UXN    MEM/NORMAL-TAGGED
> 0xffff000181dbd000-0xffff000181dc0000          12K PTE       RW NX SHD AF            UXN    MEM/NORMAL-TAGGED
> 0xffff000181dc0000-0xffff000181e00000         256K PTE       RW NX SHD AF    CON     UXN    MEM/NORMAL-TAGGED
> 0xffff000181e00000-0xffff000182000000           2M PMD       RW NX SHD AF        BLK UXN    MEM/NORMAL-TAGGED
> 0xffff000182000000-0xffff0001c0000000         992M PMD       RW NX SHD AF    CON BLK UXN    MEM/NORMAL-TAGGED
> 0xffff0001c0000000-0xffff000300000000           5G PUD       RW NX SHD AF        BLK UXN    MEM/NORMAL-TAGGED
> 0xffff000300000000-0xffff008000000000         500G PUD
> 0xffff008000000000-0xffff800000000000      130560G PGD
> ---[ Linear Mapping end ]---
> 
> Mode 3:
> =======
> ---[ Linear Mapping start ]---
> 0xffff000000000000-0xffff000000210000        2112K PTE       RW NX SHD AF            UXN    MEM/NORMAL-TAGGED
> 0xffff000000210000-0xffff000000400000        1984K PTE       ro NX SHD AF            UXN    MEM/NORMAL
> 0xffff000000400000-0xffff000002400000          32M PMD       ro NX SHD AF        BLK UXN    MEM/NORMAL
> 0xffff000002400000-0xffff000002550000        1344K PTE       ro NX SHD AF            UXN    MEM/NORMAL
> 0xffff000002550000-0xffff000143a61000     5264452K PTE       RW NX SHD AF            UXN    MEM/NORMAL-TAGGED
> 0xffff000143a61000-0xffff000143c61000           2M PTE       ro NX SHD AF            UXN    MEM/NORMAL-TAGGED
> 0xffff000143c61000-0xffff000181b9a000     1015012K PTE       RW NX SHD AF            UXN    MEM/NORMAL-TAGGED
> 0xffff000181b9a000-0xffff000181d9a000           2M PTE       ro NX SHD AF            UXN    MEM/NORMAL-TAGGED
> 0xffff000181d9a000-0xffff000300000000     6261144K PTE       RW NX SHD AF            UXN    MEM/NORMAL-TAGGED
> 0xffff000300000000-0xffff008000000000         500G PUD
> 0xffff008000000000-0xffff800000000000      130560G PGD
> ---[ Linear Mapping end ]---
> 
> [1] https://lore.kernel.org/linux-arm-kernel/20250724221216.1998696-1-yang@os.amperecomputing.com/
> 
> Thanks,
> Ryan
> 
> Dev Jain (1):
>   arm64: Enable permission change on arm64 kernel block mappings
> 
> Yang Shi (3):
>   arm64: cpufeature: add AmpereOne to BBML2 allow list
>   arm64: mm: support large block mapping when rodata=full
>   arm64: mm: split linear mapping if BBML2 unsupported on secondary CPUs
> 
>  arch/arm64/include/asm/cpufeature.h |   2 +
>  arch/arm64/include/asm/mmu.h        |   4 +
>  arch/arm64/include/asm/pgtable.h    |   5 +
>  arch/arm64/kernel/cpufeature.c      |  17 +-
>  arch/arm64/mm/mmu.c                 | 368 +++++++++++++++++++++++++++-
>  arch/arm64/mm/pageattr.c            | 161 +++++++++---
>  arch/arm64/mm/proc.S                |  25 +-
>  include/linux/pagewalk.h            |   3 +
>  mm/pagewalk.c                       |  24 ++
>  9 files changed, 566 insertions(+), 43 deletions(-)
> 
> --
> 2.43.0
> 


