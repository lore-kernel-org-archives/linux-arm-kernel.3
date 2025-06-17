Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 522C9C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 14:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=89/nHRshE07g8PGVzck1LHJg7+MRXhwcPTIC6yQECsY=; b=SxGQp/3V22T9mNY8vw1s8TUdDY
	TNfAlk1w/DrMFZpNZDeRrwQGq+quGr5VJ+i5ZjK7AAD5GHIx0BzM2d19ge59kvRAKpAJOxkzXma2V
	onqTN4NA4J4+9cPaHQWs3QkNXzfysaaBenrosNYEjA8sPTVWWoOk1gCAdIz5P8iQ4//QXBEFNYD7D
	nVst/BJgcgLGsOEAwSlbNM2bcNf8c5idjUiyXQlgDEoRcYHiAmiiDX6hR034G06Zqq46CO6k0YE6S
	wPMSD3VxMxPHVA5LUim2p9UJiGMjWynI9GD/HnCey/7dd7vlSWiAxNZZ2QDMrTTifCQREqtEo8ChU
	TP+P59rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRXaU-00000007crk-3BVw;
	Tue, 17 Jun 2025 14:46:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRWMD-00000007MQ4-2aLF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 13:28:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B0672629FA;
	Tue, 17 Jun 2025 13:28:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88CA8C4CEF0;
	Tue, 17 Jun 2025 13:28:06 +0000 (UTC)
Date: Tue, 17 Jun 2025 14:28:04 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Song Liu <song@kernel.org>
Cc: Will Deacon <will@kernel.org>, Dylan Hatch <dylanbhatch@google.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Toshiyuki Sato <fj6611ie@aa.jp.fujitsu.com>
Subject: Re: [PATCH v7] arm64/module: Use text-poke API for late relocations.
Message-ID: <aFFtZHixBfFDHv6m@arm.com>
References: <20250603223417.3700218-1-dylanbhatch@google.com>
 <20250612151859.GD12912@willie-the-truck>
 <CAPhsuW5jhwxcd01XBwLJxsP46a+P2sPLcZwtxAX3h7U1=JV_tA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPhsuW5jhwxcd01XBwLJxsP46a+P2sPLcZwtxAX3h7U1=JV_tA@mail.gmail.com>
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

On Mon, Jun 16, 2025 at 03:35:14PM -0700, Song Liu wrote:
> What's our plan with this set and [1]? Once we land these two sets, I
> will respin [2] which enables livepatch for arm64. We (Meta) are hoping
> to land these in linux-next soon, and back port them to our kernels.
[...] 
> [1] https://lore.kernel.org/linux-arm-kernel/20250521111000.2237470-1-mark.rutland@arm.com/
> [2] https://lore.kernel.org/linux-arm-kernel/20250320171559.3423224-3-song@kernel.org/

I plan to queue (for 6.17) this patch and Mark's reliable stacktrace
series sometime this week.

-- 
Catalin

