Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63F3CC87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 16:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6dI/UEdZE3FtSsjuVJfei/OFko2k61noqX/75XrISnQ=; b=x7qGoqi6VqMe0e
	lVrZNH1TSZwU7EYVAYGejkTAjZ3uNykTiTO6lQubEf/lHoUxA/TNtHCPt0T8C4t973kR6HtYIhP7M
	BDlfiGmW5oGJAOYeEqFWOoGp2np2exlsXXoIfVaMO3P/5Y7fFFmPmuJetvFRyQVapKrZXYEpmW6u0
	K5anEliUH/Aw89PxKTmty5y8OgZqJ9BtdETiV1dgxW8vHiG2czWd4h8bDFbKLCcadlYrSLPu87/g4
	aOfknVfMpkEH8j1L4ZdoQYjbwudpybubldGOMDwuMy+02gmgzJQ5H9VTepQNjEQALt5C2h636BQjA
	d8sX2tcjA++sVBCOl2OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujKT4-0000000DHEv-2tYI;
	Tue, 05 Aug 2025 16:24:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujJHE-0000000D6Y4-1Iit
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 15:08:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6C1652BCE;
	Tue,  5 Aug 2025 08:08:23 -0700 (PDT)
Received: from [10.1.29.177] (e137867.arm.com [10.1.29.177])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1A5AA3F673;
	Tue,  5 Aug 2025 08:08:26 -0700 (PDT)
Message-ID: <6bd09b5b-9830-42b4-ad9e-9ad1e153e564@arm.com>
Date: Tue, 5 Aug 2025 16:08:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next v7 0/7] arm64: entry: Convert to generic irq entry
To: Jinjie Ruan <ruanjinjie@huawei.com>
References: <20250729015456.3411143-1-ruanjinjie@huawei.com>
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Content-Language: en-US
Organization: Arm Ltd.
In-Reply-To: <20250729015456.3411143-1-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_080832_395156_D475A724 
X-CRM114-Status: GOOD (  19.84  )
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
Cc: mark.rutland@arm.com, sstabellini@kernel.org, puranjay@kernel.org, anshuman.khandual@arm.com, catalin.marinas@arm.com, liaochang1@huawei.com, oleg@redhat.com, kristina.martsenko@arm.com, linux-kernel@vger.kernel.org, broonie@kernel.org, chenl311@chinatelecom.cn, xen-devel@lists.xenproject.org, leitao@debian.org, ryan.roberts@arm.com, akpm@linux-foundation.org, mbenes@suse.cz, will@kernel.org, ardb@kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi Jinjie,

On 29/07/2025 02:54, Jinjie Ruan wrote:

> Since commit a70e9f647f50 ("entry: Split generic entry into generic
> exception and syscall entry") split the generic entry into generic irq
> entry and generic syscall entry, it is time to convert arm64 to use
> the generic irq entry. And ARM64 will be completely converted to generic
> entry in the upcoming patch series.
Note : I had to manually cherry-pick a70e9f647f50 when pulling the series
on top of the Linux Arm Kernel for-next/core branch, but there might be
something I'm missing here.
>
> The main convert steps are as follows:
> - Split generic entry into generic irq entry and generic syscall to
>    make the single patch more concentrated in switching to one thing.
> - Make arm64 easier to use irqentry_enter/exit().
> - Make arm64 closer to the PREEMPT_DYNAMIC code of generic entry.
> - Switch to generic irq entry.

I reviewed the whole series and as expected it looks good ! Just a few nits
here and there and some clarifications that I think could be useful.

I'm not sure about the generic implementation of 
`arch_irqentry_exit_need_resched()`
in patch 5, I would be tempted to move it to patch 7. I detail my 
thoughts more
on the relevant patches, but I might be wrong and that feels like details :
I don't think the code itself has issues.
> It was tested ok with following test cases on QEMU virt platform:
>   - Perf tests.
>   - Different `dynamic preempt` mode switch.
>   - Pseudo NMI tests.
>   - Stress-ng CPU stress test.
>   - MTE test case in Documentation/arch/arm64/memory-tagging-extension.rst
>     and all test cases in tools/testing/selftests/arm64/mte/*.
>
> The test QEMU configuration is as follows:
>
> 	qemu-system-aarch64 \
> 		-M virt,gic-version=3,virtualization=on,mte=on \
> 		-cpu max,pauth-impdef=on \
> 		-kernel Image \
> 		-smp 8,sockets=1,cores=4,threads=2 \
> 		-m 512m \
> 		-nographic \
> 		-no-reboot \
> 		-device virtio-rng-pci \
> 		-append "root=/dev/vda rw console=ttyAMA0 kgdboc=ttyAMA0,115200 \
> 			earlycon preempt=voluntary irqchip.gicv3_pseudo_nmi=1" \
> 		-drive if=none,file=images/rootfs.ext4,format=raw,id=hd0 \
> 		-device virtio-blk-device,drive=hd0 \
>
I'll spend some time testing the series now, specifically given patch 6's
changes, but other than that everything I saw made sense and didn't look
like it would be of concern to me.

Thanks,
Ada

