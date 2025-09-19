Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D631FCAC592
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 11:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vuR2jmJQuKVV42xd6EVRK/S3hOFKHU9J/iP20we35pI=; b=xVWFKfL30S68eLgVWaKRQy7n/U
	JGAdSTH/LlcqF0FNZ+Hk2+lnnfdv4i0HI6WSWhoFjSmkMD1vLCUxHP4MAPiw8mKf4WEVOdY3Obv5z
	asrt7CVbT1YPU22jZnu3RBe6QKFll+Ve1FSoYWVDqNsEnaFrd4zxi9djwIFF50WtsYBh/iCAChlB/
	rCSrf1vZ+/mPVi2YI1JicbsYE4lwYRsq5AOi4sQTAOEzF6ZAKb9Fk7Mz5KGk+eecBKVDAqZci5ods
	ouDAdflwFcmMMbrHNUhsEuEg0Pd3Qv8Nt+6xK2px0BZ6jMZXllRSynvMhHGbE2LCe+PpJp/f1Wbui
	I6J83txQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzZPv-00000002iiC-0p9h;
	Fri, 19 Sep 2025 11:36:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzZPu-00000002ihx-0wxR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 11:36:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A1D8F6013A;
	Fri, 19 Sep 2025 11:36:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68E50C4CEF0;
	Fri, 19 Sep 2025 11:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758281801;
	bh=aiHRSi2sgT1TTHPVybbacLprkapoa6VCAYD5hiEonZA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r19G0a9gkhqmOXeB7G+TiC/trwpAeYCdCIZ58xHavoqn1eHY7YLc1he4hvrVa+fud
	 KHyFLc+EVAJeWx+7q6qdEH9+LNRmM+MeR6j3uZHzRFMm6SGoQg6a0J0ba0QZfuiOcY
	 kipkXakw5JR0FloaSSQPEjosJsPmkMfwE31rgfnQ2P47H/RWKB9DcLKiqv8EGxhblY
	 05XsbNqDEu2Qx5zK8CzBRBJ96vt0lkw/Ort6RR30wOCghcrYkG8haDfpgVkwY7/ctC
	 7L+K/R9pf+JsHIbnEbtDd3FaG2dNbISxHAHXt0M15TogP5pPHd6K89/zTeluLt/sNT
	 ugZ9Bo1udErqg==
Date: Fri, 19 Sep 2025 12:36:36 +0100
From: Will Deacon <will@kernel.org>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Ard Biesheuvel <ardb@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3 8/8] arm64/efi: Call EFI runtime services without
 disabling preemption
Message-ID: <aM1ARCYGhVvts_p7@willie-the-truck>
References: <20250918103010.2973462-10-ardb+git@google.com>
 <20250918103010.2973462-18-ardb+git@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250918103010.2973462-18-ardb+git@google.com>
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

On Thu, Sep 18, 2025 at 12:30:19PM +0200, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> The only remaining reason why EFI runtime services are invoked with
> preemption disabled is the fact that the mm is swapped out behind the
> back of the context switching code.
> 
> The kernel no longer disables preemption in kernel_neon_begin().
> Furthermore, the EFI spec is being clarified to explicitly state that
> only baseline FP/SIMD is permitted in EFI runtime service
> implementations, and so the existing kernel mode NEON context switching
> code is sufficient to preserve and restore the execution context of an
> in-progress EFI runtime service call.
> 
> Most EFI calls are made from the efi_rts_wq, which is serviced by a
> kthread. As kthreads never return to user space, they usually don't have
> an mm, and so we can use the existing infrastructure to swap in the
> efi_mm while the EFI call is in progress. This is visible to the
> scheduler, which will therefore reactivate the selected mm when
> switching out the kthread and back in again.
> 
> Given that the EFI spec explicitly permits runtime services to be called
> with interrupts enabled, firmware code is already required to tolerate
> interruptions. So rather than disable preemption, disable only migration
> so that EFI runtime services are less likely to cause scheduling delays.
> To avoid potential issues where runtime services are interrupted while
> polling the secure firmware for async completions, keep migration
> disabled so that a runtime service invocation does not resume on a
> different CPU from the one it was started on.
> 
> Note, though, that the firmware executes at the same privilege level as
> the kernel, and is therefore able to disable interrupts altogether.
> 
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  arch/arm64/kernel/efi.c | 23 ++++++++++++++++++--
>  1 file changed, 21 insertions(+), 2 deletions(-)

Acked-by: Will Deacon <will@kernel.org>

Will

