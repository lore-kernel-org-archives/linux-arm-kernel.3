Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 585D1C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 19:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HUtP8gZS7mUdNTmGKRVTRqwBLzSs/e6JxBjqfdBad88=; b=LKLMzh6xaPgbD4lDZBqAyIs6RI
	Zj/sWV8+2cfcVfYU16yHklzOqntMEppP7+udEF0d2W65l9g6NwXPeOCAh3+Vd+06W4U1zVWmhDM7L
	aO93wSOawnh7NzBLJsajvZOgJ7CF02i4S0JzLShN5/99LtM8/iaUqIUgqxkvw2PM4t7kjHhRp/atj
	SleiruNJg0Oh4eY5dOeepDpGyiKQUTxFpDoh+TfiYKZtpOnp7tEFuF7Z7/CSVo8v5nv1RxgRSYWgF
	SW0diVYdl96Wz7x14KbnO/sRxUZByMNIsfgQhTWTOKTLLuBxcKjylG8mF2MUISrxCILcN1bzYe7d5
	+026lNGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubPG6-00000003Aa1-0yQS;
	Mon, 14 Jul 2025 19:54:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubPDf-00000003AT1-0Bs1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 19:52:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1067B460D0;
	Mon, 14 Jul 2025 19:52:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 785DCC4CEED;
	Mon, 14 Jul 2025 19:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752522729;
	bh=HUtP8gZS7mUdNTmGKRVTRqwBLzSs/e6JxBjqfdBad88=;
	h=Date:From:To:Cc:Subject:From;
	b=RCdDoOD76oKDvqD1z5tCEcHd5SFXZWaZck1rxcNK5Y1HGMh9LnQFFylwETZljG5kU
	 yGtzphiGMsOXxilcINrkUZAe8xPd/wPiWktqf+1FYNjVgTbBiA6Ty9XWSdOlpZ0Gk/
	 G7LyXWMdGE+Dj7m6/t+1+t61sJq697Ge8BCyu/GCfX01s8kbiqUd65IR7MhhmKJf+0
	 acUZOx+nMCbR4NFCS0H+g6OzpQ1HeBkl5N554BiwKOeFkzb4Y7qAi9DsHWiavxYr3t
	 Ep36XK//QNdTK1mVuvefWGA+BdTZkDmaDfKMZSWg0xEHzylo1G8SAUMCXy226O+fi2
	 LFpkA8It9zPnA==
Date: Mon, 14 Jul 2025 12:52:05 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	D Scott Phillips <scott@os.amperecomputing.com>,
	Mark Brown <broonie@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Subject: Revisiting c0a454b9044f
Message-ID: <20250714195205.GA3723043@ax162>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_125211_104126_0F40AADA 
X-CRM114-Status: UNSURE (   8.56  )
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

Hi all,

I am looking to potentially bump the minimum version of LLVM for
building the kernel to 15.0.0 after the next merge window. In my quest
to look for workarounds that can be dropped, I noticed that
CONFIG_ARM64_BTI_KERNEL was disabled unconditionally for GCC in commit
c0a454b9044f ("arm64/bti: Disable in kernel BTI when cross section
thunks are broken") as a result of [1]. Looking at that GCC report, it
seems like the AArch64 ABI now documents [2] the GNU toolchain's
behavior as expected and LLVM has been adjusted [3][4][5] to match. Do I
need to block CONFIG_ARM64_BTI_KERNEL from being selected with LLVM
21.0.0? Or should the kernel adjust its expectations now that the ABI
and toolchains all agree?

Cheers,
Nathan

[1]: https://gcc.gnu.org/pr106671
[2]: https://github.com/ARM-software/abi-aa/commit/606ce44fe4d3419c15cd9ed598f18fb5d520fcfc
[3]: https://github.com/llvm/llvm-project/commit/7af2b51e761f49974a64c3009882239cea618f2a
[4]: https://github.com/llvm/llvm-project/commit/edf21314c98a4fe05d48f83dfab2b201ed8bfe9c
[5]: https://github.com/llvm/llvm-project/commit/098b0d18add97dea94e16006486b2fded65e228d

