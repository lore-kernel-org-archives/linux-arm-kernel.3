Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 047F2CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 18:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VQPWdD3NKte7MIWpNZT6tTU+qnP4czxo85F3s3b84XI=; b=CEukNPVFi5FYuyiupYjRLlBUcb
	Dg2xia3hX3unkPj+AERAsMicu8dh7oIEBX0VcOpNpxaxy2vrsVZcFz+gamZBNa9N4ff02etWtX3Ll
	/23/cSU5jnQhKHWPiZWTU5NHvt2fAcSlALoHPKmUlVCc3JlOwjsIU2/CbGjbNoH46slHqGtE5Kf1v
	Saf/ddKd9xy5aLt/OmDIdEYvobrcBTAiVoG4XVLdQME0UKbPcskmM2IWFYJ6x4TgiZA1hv3JXViUd
	C0gahhFVxArPMSGodweVZpp4UFHR0D8hGKgKnQkfGbOutXvXDxGqsFTFJtteuxtmH5D2Uq/3CjR8r
	15K7m4zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vItNO-00000007dAZ-1QSf;
	Tue, 11 Nov 2025 18:45:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vItNL-00000007d9l-2sKM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 18:45:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6C2B740503;
	Tue, 11 Nov 2025 18:45:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB170C4CEFB;
	Tue, 11 Nov 2025 18:45:51 +0000 (UTC)
Date: Tue, 11 Nov 2025 18:45:49 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Ard Biesheuvel <ardb@kernel.org>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Mark Brown <broonie@kernel.org>,
	Pierre Gondois <Pierre.Gondois@arm.com>,
	Sami Mujawar <Sami.Mujawar@arm.com>
Subject: Re: [PATCH v4 resend 0/7] arm64: Make EFI calls preemptible
Message-ID: <aROEXadFWdJoQEzx@arm.com>
References: <20251015205634.3820870-9-ardb+git@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251015205634.3820870-9-ardb+git@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_104555_765581_2C77C819 
X-CRM114-Status: UNSURE (   9.76  )
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

On Wed, Oct 15, 2025 at 10:56:35PM +0200, Ard Biesheuvel wrote:
> Ard Biesheuvel (7):
>   efi: Add missing static initializer for efi_mm::cpus_allowed_lock
>   efi/runtime-wrappers: Keep track of the efi_runtime_lock owner
>   arm64/fpsimd: Don't warn when EFI execution context is preemptible
>   arm64/fpsimd: Permit kernel mode NEON with IRQs off
>   arm64/efi: Drop efi_rt_lock spinlock from EFI arch wrapper
>   arm64/efi: Move uaccess en/disable out of efi_set_pgd()
>   arm64/efi: Call EFI runtime services without disabling preemption

The series looks fine to me:

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

What do you plan to do with this, merge via the EFI tree? Are there any
dependencies?

-- 
Catalin

