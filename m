Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B5D3CA0FFD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 11:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xQ13RtQXcOJ2uH2zCJ7znewAIBCut7iLFAuXUt3fArU=; b=ABUzlGOzRYW2hfwgmkfDVko95C
	EqxvZ1Ft/ouu3sduFS9VHz7ZJdVgxj/hwlGvbrE7UsVXxjIybtev8uyXFcYyiDLLCkNZuHQPrn4MH
	kLhkTtieIm8A+qEluGB0KHdTZGYelkhxVRO5IhtVW68OpPYnnLQPnM3Yuxqyqn1CZMfxrtiHdwvi3
	r08lzQA+I5NfqkdtdpPTpZyEgSw+qj4JZW1VQfyUhETjW0upcAW+b1kZmP8hbLPqNwRU7Ngoj2WdF
	y7V/J8GC6/A/NGZg007fgpp63NigZsMFUC9DDVK1xTwa0VNa227DhP9i2nKFfT7vLJjuJi1de9XJZ
	OXI3Jk3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usJNI-00000007mG5-1V0w;
	Sat, 30 Aug 2025 11:04:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usIzd-00000007kt3-2z9h
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Aug 2025 10:39:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D0C43441A9;
	Sat, 30 Aug 2025 10:39:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61259C4CEEB;
	Sat, 30 Aug 2025 10:39:30 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Mark Brown <broonie@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kselftest/arm64: Don't open code SVE_PT_SIZE() in fp-ptrace
Date: Sat, 30 Aug 2025 11:39:19 +0100
Message-ID: <175655035973.1114907.5360306706910307227.b4-ty@arm.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250812-arm64-fp-trace-macro-v1-1-317cfff986a5@kernel.org>
References: <20250812-arm64-fp-trace-macro-v1-1-317cfff986a5@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_033933_770243_DBC00C3B 
X-CRM114-Status: UNSURE (   9.45  )
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

On Tue, 12 Aug 2025 15:49:27 +0100, Mark Brown wrote:
> In fp-trace when allocating a buffer to write SVE register data we open
> code the addition of the header size to the VL depeendent register data
> size, which lead to an underallocation bug when we cut'n'pasted the code
> for FPSIMD format writes. Use the SVE_PT_SIZE() macro that the kernel
> UAPI provides for this.
> 
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/1] kselftest/arm64: Don't open code SVE_PT_SIZE() in fp-ptrace
      https://git.kernel.org/arm64/c/d82aa5d3501b

-- 
Catalin


