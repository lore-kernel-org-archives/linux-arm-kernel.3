Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4658C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 18:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tNwdoezLd9lXu+fVMv66mCLJtIP+zxcXceVB+awIDFs=; b=RvMwXApKpC+WBwFVfrSbq0qifx
	xZF7PWX9FpqobMRHuF6LxMGElloh7mThe3BIzBYvdWCALrU4v2VkIM+B6eRFtPAIYD8+rmYuamQyy
	HfOQNhMVVEiMgcvwC92sMeAErVonOIzHKtQ5g+AdgaKgFuYQ/Esf7p7HAjY1RVLguiKsFD7ClFjpN
	d4gKluksTEg288UTQEWHBYTJN9QzwnUNYa4zXNtSABJTFgkNxfHLIIQQD9puCb9+89UegkLYsMid4
	AGJiIywmyeZIjk24EXl1TogaH2lUZMuSuTTmlb6m9KRYpA4Ph6u04mRdYNaCCOwUpmA+uQWwi+Y+Y
	+TkcTg5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXl1N-0000000FCPW-4AD4;
	Fri, 04 Jul 2025 18:20:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXkSz-0000000F8Ht-1nzH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 17:44:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EEA115C6A5E;
	Fri,  4 Jul 2025 17:44:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2AFBC4CEE3;
	Fri,  4 Jul 2025 17:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751651092;
	bh=RCqv3apiRAvADrsUAeAhC/3SwamOTFDAyQI+WX1ky1k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BXQampagQ81AV6XCk+tbU0dYcvaI4k/MH0kZqgbomKxodofh3H+eCxJOGexWHMIvm
	 CPl1bbb+qMNZa1+jYKcvJ79soojk3Q6sySUxt1s+kgeygQZCL5LllTeWA8Dy30sM+M
	 WnsMtG05bz6G5xVJde/SanPyKaKyxXHJcGCVgyNXeKvvN8QO2L1XxTKahH6WHCFND9
	 b//KgZ9Uajndlx5wXgFslexbwrjRaMuxKx/rn/MyD4S2Y7NxNld7U8J0+AfYWs50j8
	 yD2IpE+1n0vOe4mauFzHLYEuaGGWCG43G+NEBP2ZlJtzQlI+HVthXKyODQ0zLyB6Jl
	 oz0ofdwMqvteg==
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	mark.rutland@arm.com,
	ilkka@os.amperecomputing.com,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH] perf/arm-cmn: Reduce stack usage during discovery
Date: Fri,  4 Jul 2025 18:44:19 +0100
Message-Id: <175164881621.4004183.13139163312474667678.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <e7dd41bf0f1b098e2e4b01ef91318a4b272abff8.1751046159.git.robin.murphy@arm.com>
References: <e7dd41bf0f1b098e2e4b01ef91318a4b272abff8.1751046159.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_104453_509961_7F93DE03 
X-CRM114-Status: GOOD (  12.09  )
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

On Fri, 27 Jun 2025 18:42:39 +0100, Robin Murphy wrote:
> Arnd reports that Clang's aggressive inlining of arm_cmn_discover() can
> lead to stack frame size warnings, and while we could simply prevent
> such inlining to hide the issue, it seems more productive to actually
> heed the warning and do something about the overall stack footprint.
> The xp_region array is already rather large, and CMN_MAX_XPS might only
> grow larger in future, however it only serves as a convenience to save
> repeating the first level's worth of register reads in the second pass
> of discovery. There's no performance concern here, and it only takes a
> small tweak to the flow to re-extract the offsets instead of stashing
> them, so let's just do that and save several hundred bytes of stack.
> 
> [...]

Applied to will (for-next/perf), thanks!

[1/1] perf/arm-cmn: Reduce stack usage during discovery
      https://git.kernel.org/will/c/a7bfae21457c

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

