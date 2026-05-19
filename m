Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BB6ECD4F5B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 15:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QQw9KVq2Wo20TYR5e+WUoPs/X7z8ev6KGm+PmoPdbHk=; b=vPl40yaw9/PkrYKAKHtakp87Rk
	EurzPiYTisC+DhE4CFOzKlwcKqJ8XeUBTrmYboTF/CAiok6IQk0b/4MkTWaM7bXaE0ctr5+160ocz
	xd3ZUjqU1pgvZ7/gXodPICsQeX987YrJf61122TAFn9P9zK9kaqXEMvehId7bvixSkqFGzYbYMtpc
	CM1+dPg/j/hrpDvb4npw32mmhbmJytxMPmj5hzezENQd5npeEZCL3vfsyLGmXJkoMcVJQp/1v8VQi
	Kx830YIb+gazVtnKTyWJ1ePfIPjCzs71Kqp/y/xMeS3Fvrm172tIi603o1UNsVOjJgHlx9gkau8Mc
	5HxmMb/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPMIa-000000020n0-2YgM;
	Tue, 19 May 2026 15:24:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPMIK-000000020fS-48LG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 15:23:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 71A6F6020B;
	Tue, 19 May 2026 15:23:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4179C2BCB3;
	Tue, 19 May 2026 15:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779204224;
	bh=wo/3Jalj0wbPPgCmEC3L3xx//A6I77FAZexucPTvbsE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AkZ7ZEs8Z5er6t/kB84kfHTHVCgvVQVDxn93QHWruNNpgX8QLO18vQG3+/TqfIndk
	 S35OG3Q/bztl2PXQvJa8/lZdDKJaTggDhK4pJxXg31Ej1dPFMqujmRj3BJyqd52S7r
	 Nj1EH1BKsCljJ+BE5u0jaDWFc9ONu7RRhhw5luKcxwQfpKTiCNFwb3mmbKjSqsN7ZR
	 f8NCSkDyyjkPea3IYch+JcmHS6aWw2jsX23N8efBrdRZoUpWPnn6omimDAtdRdY7Vi
	 RsBOhiU0ikDXLVG8lQyDcOaK8R5XS/Pm9b+jNpFDr5WEJTZlxgJNwPPnypYhyPG6kb
	 akuGC5D21RxWg==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Marco Elver <elver@google.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Thomas Huth <thuth@redhat.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Harry Yoo <harry@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com
Subject: Re: [PATCH] arm64: Implement _THIS_IP_ using inline asm
Date: Tue, 19 May 2026 16:22:56 +0100
Message-ID: <177919212155.821738.445805330517950360.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260511201711.3249121-2-elver@google.com>
References: <20260511201711.3249121-2-elver@google.com>
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

On Mon, 11 May 2026 22:16:59 +0200, Marco Elver wrote:
> Both GCC [1] and Clang [2] consider the generic version of _THIS_IP_ to
> be broken:
> 
> 	#define _THIS_IP_  ({ __label__ __here; __here: (unsigned long)&&__here; })
> 
> In particular, the address of a label is only expected to be used with a
> computed goto.
> 
> [...]

Applied to arm64 (for-next/misc), thanks!

[1/1] arm64: Implement _THIS_IP_ using inline asm
      https://git.kernel.org/arm64/c/d54e4fde9de2

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

