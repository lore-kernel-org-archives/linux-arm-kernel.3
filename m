Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C7DCC4452B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 17:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=us4G0IB7q6IaNMP2tCrHfvsb8LP3csCgpb8aQf0m144=; b=t7/U/9ENEb1TBfLIvH6eUCiu/L
	HMzCjykuD2kwEH82pMeHGB7wb+TLIwRyesNLyxrTXrBtO+1p1IYJC0HTWBILNOfmjGHcpSENUzP7f
	k4EBd/TxIRVMnERkXJvhL5lKxVw/U6JlBZlbvZF1M/31cJjIV6RBWaLdO9jQsn0EXERpj7BaoTdkP
	qeBf7uxAe1vNsTYnp/3XsyoTuhaWzL7AkLZKH+oH2ErHrgf+w0IqEDmZWXYnOvNrbvtLBN18Q2na/
	W1bTy0DQ1ya+nA7TdjJDWPnY463ykXnQYimLC/AHXJk3WiaNNLsuO+Wgn3jVHU8xVNujupZbu6Xi0
	OT7ZBj2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmE7h-0000000A2ND-05Lc;
	Tue, 21 Jul 2026 17:19:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmE7T-0000000A2LQ-1nbC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 17:19:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6264343C2C;
	Tue, 21 Jul 2026 17:19:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A7291F00A3D;
	Tue, 21 Jul 2026 17:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784654342;
	bh=us4G0IB7q6IaNMP2tCrHfvsb8LP3csCgpb8aQf0m144=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=K0YfaOQsvESh/pcapGMeMEzsZi9a9arnWcs3napUlXQ8pFaXcBUb/ASh0PmADxqsq
	 iWXmQ13cuWB0j8iIsCuBDWSvU10qZNQPDekKwPDWlr9mOuyP6f96d7ZWkZBWYGZvgj
	 KoJSj3FrFdy3d9ifi3bcgxvNK5nYo0mi8HMlYQx8IygQVIqiS24dq0QwS5pT7ZFW6S
	 ZD+1yXz9Cinvn28Ltso6XAZOZBKHeRgk5cHPNHg9TK1i5ZH6W0UNzRor2mN5ETzjNw
	 vx/Nd0WUOrWGKMQDenYZW41cIf5zl8cI7GmxxX4pCOsuOTWHN8sTEQOKAVoImfGyjy
	 lI/49m3k2ScaQ==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Steven Price <steven.price@arm.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Subject: Re: [PATCH] arm64: Correct value returned by ESR_ELx_FSC_ADDRSZ_nL()
Date: Tue, 21 Jul 2026 18:18:40 +0100
Message-ID: <178464679057.1301757.10802293963711589823.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260703134837.100109-1-steven.price@arm.com>
References: <20260703134837.100109-1-steven.price@arm.com>
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

On Fri, 03 Jul 2026 14:48:35 +0100, Steven Price wrote:
> Address size fault, level -1 is encoded as 0b101001 or 0x29 according to
> the Arm ARM. Correct the value to match the spec. This also matches the
> offset of "level -1 address size fault" in the fault_info array in
> fault.c.
> 
> 

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm64: Correct value returned by ESR_ELx_FSC_ADDRSZ_nL()
      https://git.kernel.org/arm64/c/b877075d0baa2

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

