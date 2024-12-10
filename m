Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33003E77180
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 18:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e7y5nijsN7QOYpBIR5zfUUfHImd+E38HLQFEBW5UBb4=; b=A+zuLnCIxefqXGv2Yse/4e8sa6
	1czdIBX6evlpwSNbofRcOItz5iC3O3lp5sPPf6VKqrGFIdPPfNgqZQBS27wdHn44v9f/vlgdPB4GV
	UsbZp9lTs8xJxnZucfEJXaErnIhcCmtHnxyWtjzYpp83ECsVsYZGQlFdFERN3ys0zAyQ2/1dHl58M
	IlnNPuvIFiHhaL2LLx1i8DFDsWadD1fdTCZkg+23XQZiz6Lw22LhqA55XRCHoDPFYbETPfv6oCFjW
	lWZRligA8AqwVJezQabFUntXO6qGt80sVqIQgCW0oGsJYiE1ho3Q2XBCTKSVxhH1dvL2LTTwvvfwP
	hUHKXL2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL55U-0000000CPZq-3lgW;
	Tue, 10 Dec 2024 18:36:00 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL54R-0000000CPJA-0MnE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 18:34:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F10215C5CC0;
	Tue, 10 Dec 2024 18:34:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 686A5C4CED6;
	Tue, 10 Dec 2024 18:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733855694;
	bh=W2EytOZUNFBcFr6wPRLGScngdEtL5uKBSlZGtpDx5MA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=R2igFiKoEFGJjO2IU6T9ZuXETz0TThtI7QA/V2lIGqO9KhIbxxOGSqDI4Y/TwzVHA
	 jlLxjG6XvVvIGKZD11slF3jBW+DflsOTWB3muaZ6eibJq5vNoWIVR+BQ4fgJV3JZCu
	 mc5N9synyh23XVcwFjsuftLiYLbtm9E8MgYn8Sh1mCTb3JJv229Por5vPi4d9mxpdG
	 0d+BbBXSo6XneeS7379XVhNmNRPl3Jte25FnRKFNxqzUPsROE7NbjvFIZBVDgfCtrt
	 kN0ZWhbGhZpnq0GS2+Lxt/cPLe1yPAKoL3x/NVvfHkwFflHpgmSKp19ZRgt0p8/buG
	 O/7Rmj18w3iDg==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	Anshuman Khandual <anshuman.khandual@arm.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64/mm: Drop INIT_MM_CONTEXT()
Date: Tue, 10 Dec 2024 18:34:42 +0000
Message-Id: <173383034723.3807515.1598046188677105190.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20241202043553.29592-1-anshuman.khandual@arm.com>
References: <20241202043553.29592-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_103455_166301_35B3291A 
X-CRM114-Status: UNSURE (   8.91  )
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

On Mon, 02 Dec 2024 10:05:53 +0530, Anshuman Khandual wrote:
> Platform override for INIT_MM_CONTEXT() is redundant because swapper_pg_dir
> always gets assigned as the pgd during init_mm initialization. So just drop
> this override on arm64.
> 
> Originally this override was added via the 'commit 2b5548b68199 ("arm64/mm:
> Separate boot-time page tables from swapper_pg_dir")' because non standard
> init_pg_dir was assigned as the pgd. Subsequently it was changed as default
> swapper_pg_dir by the 'commit ba5b0333a847 ("arm64: mm: omit redundant
> remap of kernel image")', which might have also just dropped this override.
> 
> [...]

Applied to arm64 (for-next/misc), thanks!

[1/1] arm64/mm: Drop INIT_MM_CONTEXT()
      https://git.kernel.org/arm64/c/5f882f4aa8aa

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

