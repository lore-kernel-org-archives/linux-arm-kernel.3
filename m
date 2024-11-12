Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBE89D42BA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 16:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VSlBYicvsQMGcBMeeXPawWxzKDHnC5589rrIdXTXOTk=; b=pkDntBkW2AvycI/eJ1443QZCXK
	BLhixKlCArST+wptftQPMaCB+xsKJjmRPgG85qp8LrTvpA8goEKFDXmMU0O44jh65CAVLUSYHz/fS
	MrRVbrmcibpOGKAblIKYzXl8q3EQ0aFCNrXP9VJZUcgA8b9d9V8dofcobz1viXmgIIMeL8BcmbxvG
	b0+kDfD3kC+xc3jX2t6GX/34zeRAa5l9kJBkszuN95kwlEDf4zgC2Asd0vync+8vGhE6Qww7QfgiB
	SvZxDQDs8q2d5F/EOdg3RzUl+u0tXMhW6g0ikjj8S8lcaE14pwqShe767gxt2pyg5UZFC66TF2p8O
	cu/h7TWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAteF-000000047bD-0tEp;
	Tue, 12 Nov 2024 16:21:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAtQu-0000000451d-4AOy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 16:08:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 92AD55C5816;
	Tue, 12 Nov 2024 16:07:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2262C4CED0;
	Tue, 12 Nov 2024 16:07:57 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: (subset) [PATCH 0/4] kselftest/arm64: Fix compilation warnings/errors in the arm64 tests
Date: Tue, 12 Nov 2024 16:07:36 +0000
Message-Id: <173142698241.893467.3612331724915508204.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241108134920.1233992-1-catalin.marinas@arm.com>
References: <20241108134920.1233992-1-catalin.marinas@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_080801_158846_E521C8B3 
X-CRM114-Status: UNSURE (   8.79  )
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

On Fri, 08 Nov 2024 13:49:16 +0000, Catalin Marinas wrote:
> It looks like people started ignoring the compiler warnings (or even
> errors) when building the arm64-specific kselftests. The first three
> patches are printf() arguments adjustment. The last one adds
> ".arch_extension sme", otherwise they fail to build (with my toolchain
> versions at least).
> 
> Note for future kselftest contributors - try to keep them warning-free.
> 
> [...]

Applied to arm64 (for-next/kselftest), thanks!

[1/4] kselftest/arm64: Fix printf() compiler warnings in the arm64 fp tests
      https://git.kernel.org/arm64/c/b6bd50dd3b56
[2/4] kselftest/arm64: Fix printf() warning in the arm64 MTE prctl() test
      https://git.kernel.org/arm64/c/0cc6b94a445c
[3/4] kselftest/arm64: Fix printf() compiler warnings in the arm64 syscall-abi.c tests
      https://git.kernel.org/arm64/c/694e2803fece

-- 
Catalin


