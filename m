Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B04F6C5DF9C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 16:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wc5pscdOK3Sp2EQDKLU6qxBkk7bheypGM8xhdP3iy4Q=; b=AMw3DSIZxWaPU+cznB6lX2t3dN
	gbNGnAI8/XE3soyhCia+y/LSwpmyO/ZI2eMfFrZl2fKBTT6EvQ3OiokqaQPaFh+c5t5yZopz/TXIy
	/e2eTDXEfGOOJDSZN5FAnjjCKvSRbbpS0gpWi80YrAqrQaNvEHnpwNkfzVbxKs2yw5m4M6jyF9l4r
	aq2dp/whCBha67Aq+IaGAT1kpM+yzHXhtgP0mrGQjjUzoeeGURHf+2BtDnxEYlTXMFFGnMcloc0Ol
	bgFa50tHQ36WDi4/wiP5J/KsOyPduU3I8yYKc2cyRneFdmnPaFb4e/R7V7yMcVVez5GC6TyTDaGfi
	Ldq8PSiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyX7m-0000000GzYS-3A22;
	Mon, 24 Aug 2026 16:02:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyX7l-0000000GzXs-1a5O
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 16:02:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A6C8D438DC;
	Mon, 24 Aug 2026 16:02:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3672E1F000E9;
	Mon, 24 Aug 2026 16:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787587332;
	bh=wc5pscdOK3Sp2EQDKLU6qxBkk7bheypGM8xhdP3iy4Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bskdzPRK5ViugfuX3ndeavpiBshIQfJjJr5glVfvds3xSsmXQozHnEsI2zx5eCHC0
	 XxPqLqHoU+WcJBugrUpLI89eVM255GFpIKJk+Q+gzA4hhkiz7R4yssxYIP0V7xKmff
	 hm3SZ0aGnDrZVpy1aYZJEKG/IZujkIDKO3DOq8FnxEO6NDIb79Xdz+p+GjqbPDa6LP
	 qwiG5w+MVqAiZSRBwNCwCWs5/i+OyCl8v2vxUA2WM9X6y+i8msc7cklRKkyWjhYCoK
	 Lt1N4OXfjml9g35BstPOrRdL/hPJqaBrHUoJOfxprkpk350OBfzhnm4aDB38GL7ihV
	 V337sUu9Xbkeg==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	Vladimir Murzin <vladimir.murzin@arm.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	yeoreum.yun@arm.com
Subject: Re: [PATCH] arm64: process: Fix context switching MTE store-only tag check
Date: Mon, 24 Aug 2026 17:01:54 +0100
Message-ID: <178758068582.178214.11707569585909854031.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260819144859.5447-1-vladimir.murzin@arm.com>
References: <20260819144859.5447-1-vladimir.murzin@arm.com>
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

On Wed, 19 Aug 2026 15:48:59 +0100, Vladimir Murzin wrote:
> SCTLR_EL1.TCSO0 is set when user opt-in for MTE store-only tag check
> mode. However, it is not part of SCTLR_USER_MASK which imply that on
> context switch we never clear SCTLR_EL1.TCSO0, so we are leaking that
> setting into another task.
> 
> Fix that by including SCTLR_EL1_TCSO0_MASK into SCTLR_USER_MASK
> 
> [...]

Applied to arm64 (for-next/core), thanks!

[1/1] arm64: process: Fix context switching MTE store-only tag check
      https://git.kernel.org/arm64/c/b8f070ac3167

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

