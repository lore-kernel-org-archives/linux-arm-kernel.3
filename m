Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34748C98302
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 17:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KwQN7WVhANwtG21qRW2cXhG1KlqZnmnqp3LyL8PiblQ=; b=SUEEhhv80t9/UIXFgOSBDwrcZT
	hQkyMIpK1uiBHY3WlSlSArJdZllsqbDbEcOmEGe0TWW9BNibFKGJ+0dGeVJy0+1Un06C/7lmm4R2R
	BR5QDpo2IZCJrKRrS0FSo3Ah26yjCUGyGjXiwV8WrwOLyD+0bEdCiOSAfvHIdQAUAj2Ace+MrpllN
	7ZD5sR754i7fx39UQB6Sqw0EWDZD93QgG7pv4NSXJ8u09ySSin1tww31Qt2G1cwQ1Fn72DKodhe3T
	wWDdeU4H3qJeabZ2fGJtimM4j3CRTs7j0dczHdP2xe3xFMS1CEfdh5c06GcyT49mV3UPZjwNeOe5r
	vACzmeCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x945p-00000006AdT-2WPb;
	Tue, 22 Sep 2026 17:15:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x945n-00000006Ad0-3CJs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 17:15:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E2BCA6022A;
	Tue, 22 Sep 2026 17:15:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 904A21F00893;
	Tue, 22 Sep 2026 17:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790097342;
	bh=KwQN7WVhANwtG21qRW2cXhG1KlqZnmnqp3LyL8PiblQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MGRoPx0gFeoZ620M+h6hVml1cmstZ36RtqWY65JVSsUD5TMarzlFWrri8h+HdC4fV
	 tb3O2T8Z9k0tiACSeV/L/YdcNDoDkcmo5S6d+2gsXo1v7ZuLSr6xYIWNvegc6TufBK
	 eg5RUuFKBcIK0G2An7KcyBk/RLadzP4pFEQw7yeQhdN3ofhyFPBi93dJvIyWDpuwMP
	 BcOeNuR4b1fXl7ZVbsnBNPnyMtaoynBi4uhbqvKUdD5haCJvQJoEPoyLcnb3iFhxCW
	 iU1VzelR+8iiGNSduR4hDUo+gQfKMHArnhh/H9uEoLVkrxlwAexfAEyPfNAZrT7A4z
	 VbqQwSaYdEhQQ==
Date: Tue, 22 Sep 2026 18:15:34 +0100
From: Will Deacon <will@kernel.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org,
	catalin.marinas@arm.com, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
	aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
	joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
	linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
	sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
	WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com
Subject: Re: [PATCH v18] arm64: mm: Handle Granule Protection Faults (GPFs)
Message-ID: <arK3tsTV6EDhI-nt@willie-the-truck>
References: <20260913070459.2547407-1-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260913070459.2547407-1-suzuki.poulose@arm.com>
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

On Sun, Sep 13, 2026 at 08:04:58AM +0100, Suzuki K Poulose wrote:
> From: Steven Price <steven.price@arm.com>
> 
> If the host attempts to access granules that have been delegated for use
> in a realm these accesses will be caught and will trigger a Granule
> Protection Fault (GPF).
> 
> A fault during a page walk signals a bug in the kernel and is handled by
> oopsing the kernel. A non-page walk fault could be caused by user space
> having access to a page which has been delegated to the kernel and will
> trigger a SIGBUS to allow debugging why user space is trying to access a
> delegated page.
> 
> There is work in progress to unmap the guest_memfd backed private pages from the
> linear map. Until we get that support, we could get spurious GPFs from within
> the kernel, e.g., load_unaligned_zeropad(). So, try to fix them up for now.
> 
> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> Signed-off-by: Steven Price <steven.price@arm.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
> Changes since v17:
>  * Pass untagged address to die_kernel_fault() - Sashiko
>  * Explicitly check !user_mode() for fixups - Catalin
>  * Switch to BUS_OBJERR for si_code from SI_KERNEL - Catalin
>  * Clarify the commit description about the upcoming work on
>    unmapping guest_memfd backed pages from linear map
> Changes since v16:
>  * Update the commit description to indicate why we try to fixup GPFs
> Changes since v10:
>  * Don't call arm64_notify_die() in do_gpf() but simply return 1.
> Changes since v2:
>  * Include missing "Granule Protection Fault at level -1"
> ---
>  arch/arm64/mm/fault.c | 30 ++++++++++++++++++++++++------
>  1 file changed, 24 insertions(+), 6 deletions(-)

I still don't think we should do this, given that the plan is to unmap
the memory from the linear map. If this thing fires, it's a kernel bug
and it should be fatal.

Will

