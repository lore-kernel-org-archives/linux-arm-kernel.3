Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FDFBC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 20:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zWILCRBRMlcswiaSS4mWu9pHIxqkjmUGGnsCSHknuEQ=; b=moW3O+4AgrZSfXp4GEFN5haMtu
	JsSM3zz7KQz78LT3VzdBeux3dyIIsUsSOPUGtMh7PmW3y9rGgrw1CdatnWedSR4vL9sjBLZ+xeMci
	jKU0CzP88C/rABtiPfpDTtTVWkXLONr4/oItCX+j6gfC729oNnJDSK6CGIIXIDzxnFCa9CTOhJFw7
	/wXrBiF1JUlEkgT8FCPfMA9Ze8gYk0GEFr8EPcvLpYYfVnP054s7uu3EmCCRxyUZhzxJVubCZoBkB
	VdEkarwZ3BRD6vT3hO2anJX+xJU3bX1A/JPo+zw1tZXDxchzbRRobYsVteLhdxLuwaxDgVtSynIn3
	V8KRCXcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9raa-0000000AknW-45D0;
	Tue, 29 Apr 2025 20:30:00 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9rYe-0000000AkRD-1atW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 20:28:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CFB8EA4C0BA;
	Tue, 29 Apr 2025 20:22:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9751CC4CEE3;
	Tue, 29 Apr 2025 20:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745958479;
	bh=9J1ANQqn1yr9mnX6xHnNtgfw3Q2ObOUMWnL3aippGSQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=P7MDiaRgybpohQjp4GjO4Z39TgzTvlzoBdx2vATKvlSSjzuV0h2hykX+DoYsLGQD0
	 ic66/LYBCgWDZt8ffk3Y8nMDxP5g6foKaA6BvrE4xwUurCS5QT9LmyVc6ry/RJWOi/
	 Cgz5SGH8175/2Zq1NIHRaLl9e1qhuBnO6kFISMz7AxxKS4+t8wNFqJnTgZdyv+3NAm
	 E1y4b8x5P85gmoxoRGCMK5bl7meF0G3RBsuVoA3U207BOOYKDPzZvbKPNCiHsOs3/c
	 z5SD1cQQUZHxnxpX+oEd6CmUHpCwiYGs0j8YxmDUFV67ieB0wL9AjUam3TiVARRvaw
	 6V9jwVhglm7VQ==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	Ard Biesheuvel <ardb+git@google.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-efi@vger.kernel.org,
	mark.rutland@arm.com,
	broonie@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH] arm64/fpsimd: Avoid unnecessary per-CPU buffers for EFI runtime calls
Date: Tue, 29 Apr 2025 21:27:42 +0100
Message-Id: <174592883277.423204.10036906731229945415.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250318132421.3155799-2-ardb+git@google.com>
References: <20250318132421.3155799-2-ardb+git@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_132800_479996_23201322 
X-CRM114-Status: UNSURE (   9.60  )
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

On Tue, 18 Mar 2025 14:24:22 +0100, Ard Biesheuvel wrote:
> The EFI specification has some elaborate rules about which runtime
> services may be called while another runtime service call is already in
> progress. In Linux, however, for simplicity, all EFI runtime service
> invocations are serialized via the efi_runtime_lock semaphore.
> 
> This implies that calls to the helper pair arch_efi_call_virt_setup()
> and arch_efi_call_virt_teardown() are serialized too, and are guaranteed
> not to nest.  Furthermore, the arm64 arch code has its own spinlock to
> serialize use of the EFI runtime stack, of which only a single instance
> exists.
> 
> [...]

Applied to arm64 (for-next/efi), thanks!

[1/1] arm64/fpsimd: Avoid unnecessary per-CPU buffers for EFI runtime calls
      https://git.kernel.org/arm64/c/e04796c8b598

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

