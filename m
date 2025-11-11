Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4D6CCCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 20:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tQPrjfOJryg1yeIlN5oGy2keEf6Apy8EGqn1zuj02SA=; b=xksoNXerjBaD1bRblQ6xjnF1zf
	gh128asldRLI/Wlo6GotpCf8o+WjlGpms64xliHvUPgoPsFgrY6CugCXDFhkBokQee9V8QsFd8jYW
	2Ap0cV2JGDPaWWFVhIF+pbna7obWHFraBDQgd4XGZlZCCEE/dcsuvXF5qVkgVkeVL5iGS7uLWneRI
	sY93Dd5RedgkErBFASSKGMe4mcX1PD9YNexRjB6xOaxgv6gu2vGibwyXRCcIFQAp7kE3yWnesqUfH
	n3eYQ9ecGteCHWHMLKO6C6EV7p3z4OEYLmWhKP6P6whHtAiLnCFWSZiIPt3ld1FrIWpAogeLYOj0l
	SlO3IP7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIunh-00000007j7Y-2oTT;
	Tue, 11 Nov 2025 20:17:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIunb-00000007j6i-1UDl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 20:17:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id ACDED446B9;
	Tue, 11 Nov 2025 20:17:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42DE3C116D0;
	Tue, 11 Nov 2025 20:17:04 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-efi@vger.kernel.org,
	Ard Biesheuvel <ardb+git@google.com>
Cc: Will Deacon <will@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Ard Biesheuvel <ardb@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Mark Brown <broonie@kernel.org>,
	Pierre Gondois <Pierre.Gondois@arm.com>,
	Sami Mujawar <Sami.Mujawar@arm.com>
Subject: Re: [PATCH v4 resend 0/7] arm64: Make EFI calls preemptible
Date: Tue, 11 Nov 2025 20:16:57 +0000
Message-ID: <176289221699.1642210.3941806984449479719.b4-ty@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251015205634.3820870-9-ardb+git@google.com>
References: <20251015205634.3820870-9-ardb+git@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_121707_423029_1A633ACB 
X-CRM114-Status: UNSURE (   9.50  )
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

On Wed, 15 Oct 2025 22:56:35 +0200, Ard Biesheuvel wrote:
> The arm64 port permits the use of the baseline FP/SIMD register file in
> kernel mode, and no longer requires preemption to be disabled. Now that
> the EFI spec is being clarified to state that EFI runtime services may
> only use baseline FP/SIMD, the fact that EFI may code may use FP/SIMD
> registers (while executing at the same privilege level as the kernel) is
> no longer a reason to disable preemption when invoking them.
> 
> [...]

Applied to arm64 (for-next/efi-preempt), thanks!

[1/7] efi: Add missing static initializer for efi_mm::cpus_allowed_lock
      https://git.kernel.org/arm64/c/40374d308e4e
[2/7] efi/runtime-wrappers: Keep track of the efi_runtime_lock owner
      https://git.kernel.org/arm64/c/a2860501203c
[3/7] arm64/fpsimd: Don't warn when EFI execution context is preemptible
      https://git.kernel.org/arm64/c/1d038e801833
[4/7] arm64/fpsimd: Permit kernel mode NEON with IRQs off
      https://git.kernel.org/arm64/c/7137a203b251
[5/7] arm64/efi: Drop efi_rt_lock spinlock from EFI arch wrapper
      https://git.kernel.org/arm64/c/1068cb52e8ef
[6/7] arm64/efi: Move uaccess en/disable out of efi_set_pgd()
      https://git.kernel.org/arm64/c/6b9c98e65755
[7/7] arm64/efi: Call EFI runtime services without disabling preemption
      https://git.kernel.org/arm64/c/a5baf582f4c0

-- 
Catalin


