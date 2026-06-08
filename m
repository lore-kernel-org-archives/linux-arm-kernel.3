Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FA61CD8C9D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 12:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AQAir/XhNgzln0FRrf8cgFa/spk0WCi7bswkv8ztqtM=; b=BHHgu/HxjROeJH+Vs/A9CO2In8
	1U0oH+IUnT/MQlUo1ZLILQm2c/412a35tsOM3yJ0s/urnDgFs5aZnPrOJYtzN0gOrR3m+/fMtZrXS
	BfT97+Wm9p2z0Zph/ATtiUoAK8iwVMeJwrCAzzbGjY/6JjZUTeVw3t/g4luhygsbh3RNYFW8+zbqk
	kFP72wp7sbfXIdn1Dlt/27lmGGc4kBhOpU4vCj1D99kwjVTcPNgucIc1jabTsuvifJVo9yvJ7o398
	/tdmXFrVdw75Vy2AwhC9+xRXk83nGRUrNQLuye8X+FJecmKg671Kl8u/FUDgiYu1flmSMgJxHsacG
	tDTPCTlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWYeM-00000003Tcm-2Ls7;
	Mon, 08 Jun 2026 12:00:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWYeL-00000003TcU-2ksS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 12:00:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BB5BA600AE;
	Mon,  8 Jun 2026 12:00:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A5A11F00893;
	Mon,  8 Jun 2026 12:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780920012;
	bh=AQAir/XhNgzln0FRrf8cgFa/spk0WCi7bswkv8ztqtM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=VbshWzMbj8MuZE3fQBjIspMvk6Z4L2Uwp7JKBQDi7zG7PNGbjZK3FOiOyMtngTPId
	 CkklEcZg91CINj0HiWVC9Gfc80+yDZibAE9nBvMPSJTfxTDEKqHrb0lb9w8/An9BC3
	 9Xl+UnrxOrfGTQCSmcitJ3pVQ+6LKwQMJfY9ZcsX0XNPtKpQEkuSgjGS1npPm8Yabj
	 zZCHUyW7t0Cx/M5eZPzlXgSExpuE5ueuuJ4zMNjja8Xlq35MjDAuiHyJtDoilmbwy8
	 gC7j2SZOAcubRcT42zNoLs8sKFkCNY8v/D8sxnqGqf1kS1gPjGB+j6ydvtKLiE/0tK
	 p8dcPzmqCGdgA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 938DC3930D69;
	Mon,  8 Jun 2026 12:00:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 bpf-next] arm64: mm: Complete the PTE store in
 ptep_try_set()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178092001114.1007295.14338085080112012433.git-patchwork-notify@kernel.org>
Date: Mon, 08 Jun 2026 12:00:11 +0000
References: <7f5f7c94601312c1a401fb18998291cc@kernel.org>
In-Reply-To: <7f5f7c94601312c1a401fb18998291cc@kernel.org>
To: Tejun Heo <tj@kernel.org>
Cc: catalin.marinas@arm.com, will@kernel.org, ast@kernel.org,
 david@kernel.org, arighi@nvidia.com, memxor@gmail.com,
 akpm@linux-foundation.org, rppt@kernel.org, andrii@kernel.org,
 daniel@iogearbox.net, martin.lau@linux.dev, eddyz87@gmail.com,
 yonghong.song@linux.dev, emil@etsalapatis.com, void@manifault.com,
 changwoo@igalia.com, linux-arm-kernel@lists.infradead.org,
 linux-mm@kvack.org, bpf@vger.kernel.org, linux-kernel@vger.kernel.org
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

Hello:

This patch was applied to bpf/bpf-next.git (master)
by Kumar Kartikeya Dwivedi <memxor@gmail.com>:

On Sun, 07 Jun 2026 21:25:47 -1000 you wrote:
> ptep_try_set() installs a kernel PTE with try_cmpxchg() but, unlike
> __set_pte(), skips the barriers that arm64 requires after writing a valid
> kernel PTE. Without them a subsequent access can fault instead of seeing
> the new mapping.
> 
> Issue them with emit_pte_barriers() rather than __set_pte_complete().
> ptep_try_set() must finish the store before it returns, but
> __set_pte_complete() would defer the barriers when the calling context is in
> lazy MMU mode.
> 
> [...]

Here is the summary with links:
  - [v2,bpf-next] arm64: mm: Complete the PTE store in ptep_try_set()
    https://git.kernel.org/bpf/bpf-next/c/71385b78dbc2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



