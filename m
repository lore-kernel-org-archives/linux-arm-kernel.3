Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8768C624D6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 13:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0GHlpZjfbjH0Zch5AMd58KrvSY6G7xu6Z9gu+flHuC4=; b=JulD0jyeh1/Uq0sCYtLd5pX6fb
	06e+1rcd9miDleJ/SFLZJhYpd9MuvqdpAz718SNTi+M27ArIeZObmr7mOBlIhoQO9ECF1ydMzx1kN
	DdZcrqhacbi6fUR3846smIpZr4/PvHvkR3PpWSbvKLi4daQr3qTTPwH1OJfTF3Fa4cOpidC1R/0br
	+7fbd2pxlAvYQBdsiV9TRlNwA6ax7Hky4GYlLlZZiry3r4LCwSkGOiMlB4ypH11Bdk3p0i0dsTavI
	bX3XAGgpzjPyJmmgGVmBoxe+qqG2nX+nQ5qdKpjLMFjfRXx6dRhyqB6rECNg0mRjZUKMLDfXp55z3
	oVIffSHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x27ya-0000000HSEq-3fmn;
	Thu, 03 Sep 2026 13:59:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x27yY-0000000HSDn-0Y5L
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 13:59:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 94B066057A;
	Thu,  3 Sep 2026 13:59:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADF701F00AC4;
	Thu,  3 Sep 2026 13:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788443973;
	bh=0GHlpZjfbjH0Zch5AMd58KrvSY6G7xu6Z9gu+flHuC4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fwc6+cOFW4oYHmvSGh/miUqeEF5R/qMCnirDUCEFBrBMqZ9Arcxt0keICcT8cm175
	 heMvQmCN0ltVOKhxX48u65Cf/lOZOl5QzjnqyiabNPNMGrRhrmsB7DVwfNuaZHcJBh
	 NbezFbViBaKrqvXEiIftJbATfp29ScyxeMBfTT1k0jMYmXZhZceV5mKLM0D6vG0HKw
	 QEl7Hb2eyIgWLrixQZZs3AtbntVtJO1Oy+rE2zPXmoS10KYvGyqiqnKwtkabo+dzLO
	 sMH7CeA2mk4/gMZewGzcXNoDPIwUkqjXcxxdvkO0Am9TA2/aLH24lVS2+RxqqJ7x6/
	 3HMjnFjzmFctQ==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Breno Leitao <leitao@debian.org>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [PATCH] arm64: trans_pgd: clone only the linear map that exists at runtime
Date: Thu,  3 Sep 2026 14:59:18 +0100
Message-ID: <178844047586.4162266.2394578462363547662.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260828-b4-arm64-trans-pgd-va52-v1-1-a66644372673@debian.org>
References: <20260828-b4-arm64-trans-pgd-va52-v1-1-a66644372673@debian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Fri, 28 Aug 2026 02:28:18 -0700, Breno Leitao wrote:
> kexec_file_load() fails on arm64 if we have CONFIG_ARM64_VA_BITS_52 but
> it runs on a !FEAT_LPA2 host (such as my loving Grace machine).
> 
> That is because trans_pgd_create_copy() uses the compile time
> PAGE_OFFSET (VA 52) instead of the actual VA size (48 -- due to the lack
> of LPA2). With the fifth level folded, pgd_none() is always false, so
> the walk cannot skip the 15 extra PGDIR_SIZE slots, and they all alias
> back to the same table: the whole kernel page table gets cloned 16
> times, KASAN shadow included. Without KASAN it does not blow up, it just
> wastes ~RAM/32 in page tables.
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm64: trans_pgd: clone only the linear map that exists at runtime
      https://git.kernel.org/arm64/c/1537e55728ec

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

