Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F9E7C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 14:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pGo/5QrDdfxiANvWb9SZU7IDsVaiyQTfgNBJvwQOBzI=; b=DdCHl9gn6HJq3yKLZ9eL3fQDM4
	Rr85nntaVZ9IUFc99tcqDgesuqsizc1yxxHPcF01+PNYfpR+sOvG+FJQTlfxXnhwikSmEx/iVLZMS
	2Rd8k/Qio1g0byWSpzXkoOjrcOq6pI79j9h/rksACP3sgu2pbDZt+4u5uVr3dPrPMc4Ape9q6un3E
	307Tgp5a478b5Y9ZBkSHzVaJVJ0tSWFmeIE+iZYbzrqmYlpiru+X76n5WWYrNFoABYVcecFD/LlA0
	p89PFFXI1XLYvimvHGnjynCunZAR9+Jz1TfQ0/ACCjSODOlnufBy7hu2vbD2jM4RdRpkgn/Ag6PPT
	iELNKiwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAUVX-0000000FuEG-3moj;
	Thu, 01 May 2025 14:03:23 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAUTf-0000000Fu5q-2sV0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 14:01:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 843F95C5466;
	Thu,  1 May 2025 13:59:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6304BC4CEE3;
	Thu,  1 May 2025 14:01:24 +0000 (UTC)
Date: Thu, 1 May 2025 15:01:22 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Zorro Lang <zlang@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, Will Deacon <will@kernel.org>,
	dianders@chromium.org
Subject: Re: BUG: KASAN: global-out-of-bounds in
 is_midr_in_range_list+0x29c/0x2e0
Message-ID: <aBN-smRV0G5nVPlB@arm.com>
References: <20250427141540.yyh4lht6tzg2l4is@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250427141540.yyh4lht6tzg2l4is@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_070127_772983_7D5273FE 
X-CRM114-Status: UNSURE (   9.96  )
X-CRM114-Notice: Please train this message.
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

On Sun, Apr 27, 2025 at 10:15:40PM +0800, Zorro Lang wrote:
> I'm from fstests@ maillist, my latest fstests [2] regression test on
> mainline linux v6.15-rc3+ (HEAD=f1a3944c860b0615d0513110d8cf62bb94adbb41)
> sometimes hit below KASAN bug [1] on aarch64 by running generic/650 [3].
> So report this issue to arm64 list to get review :)
> 
> Thanks,
> Zorro
> 
> 
> [1]
> [16982.135841] run fstests generic/650 at 2025-04-26 15:57:03
> [16983.655106] evm: overlay not supported
> [16983.838316] psci: CPU114 killed (polled 0 ms)
> [16984.610264] psci: CPU32 killed (polled 0 ms)
> [16985.855711] psci: CPU19 killed (polled 0 ms)
> [16986.578909] psci: CPU48 killed (polled 0 ms)
> [16987.329376] psci: CPU1 killed (polled 0 ms)
> [16988.071610] psci: CPU0 killed (polled 0 ms)
> [16989.675527] XFS (sda5): Unmounting Filesystem 73595b5c-b0eb-4f47-9d60-41cba8eb626c
> [16989.894868] XFS (sda5): Mounting V5 Filesystem 73595b5c-b0eb-4f47-9d60-41cba8eb626c
> [16989.935608] XFS (sda5): Ending clean mount
> [16990.913789] psci: CPU98 killed (polled 0 ms)
> [16991.624018] psci: CPU94 killed (polled 0 ms)
> [16992.334849] ==================================================================
> [16992.334865] BUG: KASAN: global-out-of-bounds in is_midr_in_range_list+0x29c/0x2e0
> [16992.334888] Read of size 4 at addr ffffd4ca56f8fb18 by task swapper/94/0
> 
> [16992.334905] CPU: 94 UID: 0 PID: 0 Comm: swapper/94 Kdump: loaded Tainted: G        W           6.15.0-rc3+ #1 PREEMPT(voluntary) 
> [16992.334922] Tainted: [W]=WARN
> [16992.334926] Hardware name: GIGABYTE R152-P31-00/MP32-AR1-00, BIOS F31n (SCP: 2.10.20220810) 09/30/2022
> [16992.334932] Call trace:
> [16992.334937]  show_stack+0x34/0x98 (C)
> [16992.334952]  dump_stack_lvl+0xa8/0xe8
> [16992.334965]  print_address_description.constprop.0+0x90/0x370
> [16992.334983]  print_report+0x108/0x1f8
> [16992.334996]  kasan_report+0x8c/0x1b0
> [16992.335007]  __asan_report_load4_noabort+0x20/0x30
> [16992.335019]  is_midr_in_range_list+0x29c/0x2e0
> [16992.335034]  spectre_bhb_loop_affected+0x28/0xa0
> [16992.335047]  is_spectre_bhb_affected+0x128/0x160
> [16992.335060]  verify_local_cpu_caps+0x140/0x358
> [16992.335070]  verify_local_cpu_capabilities+0x20/0x2a8
> [16992.335081]  check_local_cpu_capabilities+0x28/0x58
> [16992.335092]  secondary_start_kernel+0x80/0x180
> [16992.335104]  __secondary_switched+0xc0/0xc8
> 
> [16992.335120] The buggy address belongs to the variable:
> [16992.335124]  spectre_bhb_k132_list.10+0x18/0x40
> 
> [16992.335339] The buggy address belongs to the virtual mapping at
>                 [ffffd4ca56f70000, ffffd4ca57df0000) created by:
>                 paging_init+0x3b4/0x480

Hopefully this fixes it (found independently):

https://lore.kernel.org/all/20250501104747.28431-1-will@kernel.org/

-- 
Catalin

