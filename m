Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C429CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 11:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kr7Eu3NZJ8WqMvgMMSje2Y9ajoaF7beBNcZkKrDsW+Q=; b=3CpK7NahWeFiLePBY1XPzUnAjU
	FYWmQ4HEAmdbREi/hJcc8+308A4pUPUmpandMamK83a4VC0N6dRo8y7hcivPx53T6Vcbi4Fg/cMuY
	7UTqli++LSTpFqyVxXP27CiigYUkuPV5hiBzmLk+MufCK2uS+uBOqMYc6VaNrK3fe0hIBl50uR7aI
	3vN404Ym2oFTiusCr8ppJZ8bb2nQ77O5a5IzrnHzbdJSfhIZ5Cx/2VvVyhgQXDtSM88dDgPR+lYCz
	7+1IOZT769lnEly36hyL8hvaGEijemlXGzAkolsiPhhiIVZGiUyUesvlSylbqxg5FBMAkfQn5mBiR
	PQFb7seg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzZPM-00000002iZJ-0wVo;
	Fri, 19 Sep 2025 11:36:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzZPJ-00000002iYb-40b4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 11:36:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A18D244927;
	Fri, 19 Sep 2025 11:36:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E915C4CEF0;
	Fri, 19 Sep 2025 11:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758281765;
	bh=wnyDqESt/ipv898GHeveS4jM+lRj8y6Mhs5r+47EcR4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qz4Ve53mma2E/fOmseIz7hIcDw9Z7wZpbryG+ZEJV3QplSorgNXiOn4BTUSJVlp8Q
	 jCZe7yanDfhQEcEXb3Anl+JUkn29ahTyirG0dR03TeSb9+4Q9fE8TVyAlR+yeA1qaZ
	 MvTtpiejxzhHJDA40Bsmi5NDBl7I7LFF4t6vVLPM4QItqatPi7Z6alKn26MKLjfEFr
	 AnJLGAYJEV1HCIgk/DKz7UabhIcQOEp+bnw/RAqzIT9t6tMzLpYzeIvPJG9eGNWQc/
	 o6PtMDmBSsWkLHTxagF7PePCmtpVpoKTAt1QTlSGChnxzqq/wnLTuJKYLOCJgHG3Bp
	 tmFNl6HqA2X/A==
Date: Fri, 19 Sep 2025 12:36:00 +0100
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
Subject: Re: [PATCH v3 7/8] arm64/efi: Move uaccess en/disable out of
 efi_set_pgd()
Message-ID: <aM1AIPmNGik2fqL3@willie-the-truck>
References: <20250918103010.2973462-10-ardb+git@google.com>
 <20250918103010.2973462-17-ardb+git@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250918103010.2973462-17-ardb+git@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_043606_013575_7318C2C0 
X-CRM114-Status: GOOD (  12.24  )
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

On Thu, Sep 18, 2025 at 12:30:18PM +0200, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> efi_set_pgd() will no longer be called when invoking EFI runtime
> services via the efi_rts_wq work queue, but the uaccess en/disable are
> still needed when using PAN emulation using TTBR0 switching. So move
> these into the callers.
> 
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  arch/arm64/include/asm/efi.h | 13 +++----------
>  arch/arm64/kernel/efi.c      | 18 ++++++++++++++++++
>  2 files changed, 21 insertions(+), 10 deletions(-)

Thanks. This addresses the comment I made last time around:

Acked-by: Will Deacon <will@kernel.org>

Will

