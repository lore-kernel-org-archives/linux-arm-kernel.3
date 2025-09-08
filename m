Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AFE4CAC581
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 19:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=88rIo6vELC32LvJTx8+Gk8qrbM1QYH+yJn5uAujrpoc=; b=THgtPzJULafX5tisqMKcKsy+9o
	yuENEeoGFgZZXKee9vvCi7XNTIhRWNMAVhhTNQ+mR46ZEtfcYK5L0pjAV0Nrkw6d8tXGagj5tzYqq
	0aBFki1JekDGT8xmVDLqeHLotvwyjn1GgnjU/sr9X3WLHAgKpcu6LM1VIM5kiHRtaNsJPneNHnfMk
	qYRmEmOFo7sN/b7qSLp0lVMIsfj53sTzdY+Z9ECR6XUwCKmHZoLD8gRsKappcTnLKASB9k8w/hfrE
	7ajGOzWuTTsVFp/xP1/IPcp/VJ2Zv2FO5z1bNRInQ2QrspICCqRo18nTpQw8mqwemkx3tibaBCIs1
	RpkfK/Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvhIh-00000001oG2-0ptE;
	Mon, 08 Sep 2025 19:13:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uveDc-00000000anq-2MNk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 15:55:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 455C0449BA;
	Mon,  8 Sep 2025 15:55:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D2E6C4CEF5;
	Mon,  8 Sep 2025 15:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757346948;
	bh=ugkOsd8Tovfe1b2/cCJ9AsQbL5PP91uhRU2ifNevKdY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WezdQvLf9cxcGTdiY3msxIaKRJ9B/gBJl0uJUROY91bPAlGWSRIPvkMpP1icHedgO
	 uzpvWZAU80NmCYIP4v7e0ks3EL2QjPxgmIy2ffmMV7LIwZGPsqhYpk4JKQ1iH2v/v2
	 CEJ2qyYq4jOu3zxnQre6Nu+5hW5LpmmwAHEnlSzAkFWC7d2awhh8rA5N4ty5y0VN6x
	 3ZyyiMY6M32UI8HxVOUPEcwJO0CQoBmIty82ffCSA3rAjwI3qkgB+oZvAWg3vm7PsU
	 Tac52Jne1H/KZZuayeEBxrVIswQf4C6D4dA0+BBEQco4vkp+hDtdCK6LNIJJmtcykp
	 bans5EHjlOi1Q==
From: Will Deacon <will@kernel.org>
To: broonie@kernel.org,
	Bala-Vignesh-Reddy <reddybalavignesh9979@gmail.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] selftests: arm64: Check fread return value in exec_target
Date: Mon,  8 Sep 2025 16:55:30 +0100
Message-Id: <175734023581.133744.8096458683777089384.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250808080955.41735-1-reddybalavignesh9979@gmail.com>
References: <a72e8741-a63a-487e-838e-daeed3458c0f@sirena.org.uk> <20250808080955.41735-1-reddybalavignesh9979@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_085548_616798_129E97F8 
X-CRM114-Status: UNSURE (   8.22  )
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

On Fri, 08 Aug 2025 13:38:30 +0530, Bala-Vignesh-Reddy wrote:
> Fix -Wunused-result warning generated when compiled with gcc 13.3.0,
> by checking fread's return value and handling errors, preventing
> potential failures when reading from stdin.
> 
> Fixes compiler warning:
> warning: ignoring return value of 'fread' declared with attribute
> 'warn_unused_result' [-Wunused-result]
> 
> [...]

Applied to arm64 (for-next/selftests), thanks!

[1/1] selftests: arm64: Check fread return value in exec_target
      https://git.kernel.org/arm64/c/a679e5683d3e

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

