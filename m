Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A40CC02196
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 11:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XVkv3FJw0Huk8eEX+8GmpGpaVNq6Tf8UnWi/ll22M8Q=; b=t7E/ptTT/adSITySLexFoTA3/u
	jCM4QQX30MK9iJ3ZJi0NvdoNCsFf6yr//o2Yh6pXlVMOjEICZetu+nEobjJJtIfvJbr8X8M9vCFCF
	t9N5NQ8XOnQwv2MYhbAPFZUxc/Wtmq7H+466iVVToqhkKnayRdON613GMZAGodN6IX+ZPNeJBs1+F
	gWCPNaCt5YSCim9l3QhNZSlMAPq9kLS6tBXsAbI9epMel/CWk4M1WakMEZyb3qoBY+QA9ZrPZ5LsJ
	l3tygdVgNQXdOuOQg7uD+04y5pmdUWGTWncvjjCQoKDwAF/bhJtVOgis6JdeMUnPmN+12yWh9nlce
	FmOHTLdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgMhU-00000009NZq-1Pm5;
	Fri, 07 Feb 2025 11:39:12 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgMg7-00000009NOV-0IYz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 11:37:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E83F5A42D47;
	Fri,  7 Feb 2025 11:35:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB11CC4CED1;
	Fri,  7 Feb 2025 11:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738928265;
	bh=PW0sMWesSWW0COshS2HtpPEqlkHX2KN+bsrSyyccYLY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gVl4Krz3+XnL1SeqcqHb81BW0B/ih8XsjD3jG5Bh2NMdzG/6Zo4fxNBSduiSnyFLr
	 tYtE/ub84yX7LBFyPK9XXHYPMJxNXYOxzRwtMXTG1Td9h7Q41BNWWUY7O2YGmMqd22
	 jKmrEENZbMwjj/ouxfl15EbqSFa0x+URrW8mkFi+s1R+I4yLD9iRIjqYPFBMyGooSz
	 GMVc6nuUiu6BcjTx/q3hTh5D5tO21MtgfrdxGW3YJLa6Pe+3Y8/nergtaL13ePLxz4
	 RwROxzhp5cXAIBXnLv4g4m9ao/giO4Roy2LVr6CqgB2dgPktNN2l1m7xYsgq+ksv0T
	 w1styqH4xol8Q==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Nathan Chancellor <nathan@kernel.org>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	stable@vger.kernel.org
Subject: Re: [PATCH v3] arm64: Handle .ARM.attributes section in linker scripts
Date: Fri,  7 Feb 2025 11:37:39 +0000
Message-Id: <173892221767.1467001.15470830254553080217.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250206-arm64-handle-arm-attributes-in-linker-script-v3-1-d53d169913eb@kernel.org>
References: <20250206-arm64-handle-arm-attributes-in-linker-script-v3-1-d53d169913eb@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_033747_179141_5C7C0CC4 
X-CRM114-Status: UNSURE (   7.96  )
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

On Thu, 06 Feb 2025 10:21:38 -0700, Nathan Chancellor wrote:
> A recent LLVM commit [1] started generating an .ARM.attributes section
> similar to the one that exists for 32-bit, which results in orphan
> section warnings (or errors if CONFIG_WERROR is enabled) from the linker
> because it is not handled in the arm64 linker scripts.
> 
>   ld.lld: error: arch/arm64/kernel/vdso/vgettimeofday.o:(.ARM.attributes) is being placed in '.ARM.attributes'
>   ld.lld: error: arch/arm64/kernel/vdso/vgetrandom.o:(.ARM.attributes) is being placed in '.ARM.attributes'
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm64: Handle .ARM.attributes section in linker scripts
      https://git.kernel.org/arm64/c/ca0f4fe7cf71

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

