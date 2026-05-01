Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBA73CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 16:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NAs1rVw9kzTy/RTT8CwNUD5+9WC1++4rwe/W2EwVD/0=; b=Vp/Q5WDvBkI/7YMqU+vglZY37Z
	hRX4J3hGTSQLnhoLGNDpuQ4gUFqTmo6q7Bwu8Ug4ocrYiCAZPnKdxHkTldvJhC0xxm05NSrFPS4zC
	IU9LZZm9phCNl9h2pUqxZ08PDoyDcx6weDgwbzuU4OmafkFWI2MzwwAecq96Q1EP5jQN93GCdHsaj
	756jeBPLhCApKAXs1s1OirSPdu+UqNhNsr2P1J76wsN8AJDPRpu3k8CwMsqXLR1xvN2FSNTvY/xFF
	lNxipdoTreox0DdGaKyR3/8tl2kAun77+MH7zzow17JFAlafahTvSiwyp3eY5zNZb1Y1VAd6zcAZU
	xUe630Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIqZ6-00000007P5D-1b0Q;
	Fri, 01 May 2026 16:18:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIqZ4-00000007P4r-23kI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 16:18:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B0E2E1691;
	Fri,  1 May 2026 09:17:59 -0700 (PDT)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CEFC43F7B4;
	Fri,  1 May 2026 09:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777652285; bh=HD7bPOMUo2u1y6CCnTIsydLCPbfKonkCK4jIfr4mur4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=o53hk9iGSjir8a6652IvljB41qDR0he9cjOp/YnL4RlwQ95OWAebrLXLZaiguSJeM
	 TFXgrPxQbA1PQaTHTpsvAXMn0RotlWYsMe+MT/fJWL9DzD+2TX2NMkZtVI9sHevmgG
	 rnZjHYJqOKeeqxqeUgWjnCQKPoLF/My79LcD3BUU=
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Zhaoyang Huang <huangzhaoyang@gmail.com>,
	steve.kang@unisoc.com,
	"zhaoyang.huang" <zhaoyang.huang@unisoc.com>
Subject: Re: [PATCHv3] arch: arm64: fix KERNEL_SEGMENT_COUNT error
Date: Fri,  1 May 2026 17:18:00 +0100
Message-ID: <177765203731.1029336.10721448133384388706.b4-ty@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260430085808.2951417-1-zhaoyang.huang@unisoc.com>
References: <20260430085808.2951417-1-zhaoyang.huang@unisoc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_091806_581072_75284E4F 
X-CRM114-Status: GOOD (  10.52  )
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

On Thu, 30 Apr 2026 16:58:08 +0800, zhaoyang.huang wrote:
> During debug of a kernel panic, we find that the pte_t of the final
> part of [data, end] segment got overflow to the next page of
> init_pg_end[1] which is the gap page before early_init_stack[2].
> This should be introduced by the KERNEL_SEGMENT_COUNT's value is 5
> which should be 6 as map_segment are called 6 times for the segments
> of (text, stext, rodata, inittext, initdata, data+bss)
> 
> [...]

I tweaked the commit log since KERNEL_SEGMENT_COUNT is correct as 5. I
also changed the code comment a bit in case anyone wonders why the
EARLY_IDMAP_EXTRA_PAGES is like that.

Applied to arm64 (for-next/fixes), thanks!

[1/1] arch: arm64: fix KERNEL_SEGMENT_COUNT error
      https://git.kernel.org/arm64/c/4d8e74ad4585

