Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E80AC3DA7A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 17:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VUTKJhglxE8pHX1y0kvzNoAmDP4GyknR7MB+BWwLf98=; b=zarR+f+xV3/QN0aR85M1E2lGZ2
	eR4yMU1uY4A5UgERs8QJO9i4OxkBQ12CRuPQ3Vkcp2kE5xNZK2e4j1X4bIR/X2WEl6hdVerN7Zd7i
	0D9OfFFdbYTz5AJI+bAdXTgg9+KN6RW9M/DzNrYHA5Ukwtg+PVFXFpmMATuxB07+kiRXVS5M4hx3I
	1sLH96bWdeLyEGI+5Ahgdh1xw44b7qPSTxMY1cDzGLqMbABm/9kLhWGt79V3j9moL0XOj4NBF0fLq
	F5p4e57CdSWFMhXNiK7144LuKPeBVj1+qf4nyRz8DJrIgbw4MKLt/6OFKSYNm4D7vUy5fEF4AXkub
	pI5ZGdnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH2rl-0000000G5KF-1gAc;
	Wed, 14 Oct 2026 17:34:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH2ri-0000000G5Jr-3yXF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 17:34:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3B4DE14BF;
	Wed, 14 Oct 2026 10:34:06 -0700 (PDT)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 16DC53F7B4;
	Wed, 14 Oct 2026 10:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791999249; bh=NGSw4NWLY063IsbQ9QcsQyvRWG4TvjeFoEgi4ckRgJQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ed9jzPVKD3Dbf+j/w2apV1LaDclbJKRz0kBoWUhXRN9eJSO09G91De2imrD6sUPx1
	 JSlYbIUtyXLfsCeP7zUci5nVyLEjhVYFfCh893B7fNXSJf5qGjg4Eeqr7cAnPeC8bS
	 57NmYQOS/uHDkP1Do9OYAyhcwtXpfipVaDXkUFiM=
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@kernel.org>,
	Ben Horgan <ben.horgan@arm.com>,
	=?UTF-8?q?=C8=98tefania=20Ion?= <stefion@google.com>,
	Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
	Borislav Petkov <bp@alien8.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Tarun Sahu <tarunsahu@google.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Peter Zijlstra <peterz@infradead.org>,
	Marc Zyngier <maz@kernel.org>
Subject: Re: (subset) [PATCH v2 00/23] arm64: Implement parallel CPU onlining with PSCI v0.2+
Date: Wed, 14 Oct 2026 18:33:59 +0100
Message-ID: <179199923896.3163732.3197497767996202998.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261009100738.31288-1-will@kernel.org>
References: <20261009100738.31288-1-will@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_103411_024906_2B4470B4 
X-CRM114-Status: GOOD (  10.50  )
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

On Fri, 09 Oct 2026 11:07:11 +0100, Will Deacon wrote:
> This is version two of the patches I previously posted here:
> 
>   https://lore.kernel.org/all/20260907164024.17164-1-will@kernel.org/
> 
> There have been quite a few changes since last time, thanks to all the
> feedback from humans and robots alike. These include:
> 
> [...]

Applied to arm64 (for-next/secondary-boot-prep), thanks!

[05/23] arm64: cpufeature: Check arm64_ftr_regs[] before the first store
        https://git.kernel.org/arm64/c/72add8bf4d57
[06/23] arm64: cpufeature: Add read_cpuid_with_overrides()
        https://git.kernel.org/arm64/c/cd9df8b01977
[07/23] arm64: cpufeature: Read MPAMIDR_EL1 in __cpuinfo_store_cpu()
        https://git.kernel.org/arm64/c/342e62ded77c
[08/23] arm64: cpufeature: Store every ID register with its overrides applied
        https://git.kernel.org/arm64/c/fbb6e5708311
[09/23] arm64: smp: Tidy up smp_prepare_cpus()
        https://git.kernel.org/arm64/c/9ddba588450f
[10/23] arm64: smp: Tidy up cpuinfo init and cpufeature updates
        https://git.kernel.org/arm64/c/f0a14972b5b5
[11/23] arm64: smp: Defer update of secondary CPU capabilities
        https://git.kernel.org/arm64/c/c8491bbf35e5
[12/23] arm64: smp: Don't bother printing the I-cache policy for each CPU
        https://git.kernel.org/arm64/c/6a52689f698a
[13/23] arm64: smp: Defer RCU registration during secondary CPU bringup
        https://git.kernel.org/arm64/c/e21f4de88aca

