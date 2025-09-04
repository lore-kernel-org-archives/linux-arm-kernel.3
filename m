Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB1C3CA1015
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 03:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kfnAuNfWsJc+IadIndhRR4WN/ntjc35wKFqXWpsnBRA=; b=nRtXWNlRfkm9h6ETiTzGQ2B3bL
	ZRPQ5tDzHcKsZD35Fuu+Wpx/mPltpca8oEcQRDi038yBiWiiNyMO+bZ9E9lhbc9YqzOp8fyn4rEoA
	9xWwWCVUvq+AbaqhPFE+UXYNlsq4OP25kQZyqbyp8s6p5EsJUu2gX6IF7HgJ2zf+PjeaJzdZ4wzpu
	91VMbEDYUqXzaaLjUHwAmC07zWgIoQFrHs1gRYq5jcOPWCqWqTZth6dG5FZJbRDuNBbJqeFeaQxMI
	5jafCuaUsRUHW+0DRXyCa+PSVP17SgbVejgi2d1yaQfWdfqdt+IAXZb4vCPd6V9bxXfDRYkbDWihD
	tdk4DbUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu0bk-00000008fLt-1lON;
	Thu, 04 Sep 2025 03:25:56 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utxOX-00000007wYB-3khi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 00:00:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8F55444C47;
	Thu,  4 Sep 2025 00:00:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A781C4CEF4;
	Thu,  4 Sep 2025 00:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756944005;
	bh=DRn/T96ZauTISpOvyVlFnzPXqF4MbW+TUHmU2JkpBcc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Nt/5iSHrYmYHaW3ojNZqy+nuI5h6/D5g3EXem8YQjIIINlV069GkTutXemDiV3vtH
	 xgp2ZgRbdHwDJoDsMIiaAVYRZgaGv4H1vEhZBgh7ZzpBwAsc1A7W2nPv+P9o+Zl5AX
	 eyKQJEtppzYVaTChwb7mv4WOU7TXpOFteSCX7536F/5DlBvDC303foePUctwJi6RtE
	 yFOGwNHDf9R8Kqsgmj/Eqzcf00HpziKtn8sr2Ffftbpahzi7t9Z4we17G9l3Z5sBH5
	 6gkn3nw3sm+GaKiCGOZgAr0tklpJ3ml3erIy7j9PQVmhT7v26c3Q+YXBLRRhx9d7ju
	 iKkT7qcRio2sw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADB6F383C259;
	Thu,  4 Sep 2025 00:00:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: thunder_bgx: decrement cleanup index before use
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175694401025.1242165.3852519134905149120.git-patchwork-notify@kernel.org>
Date: Thu, 04 Sep 2025 00:00:10 +0000
References: <20250901213314.48599-1-rosenp@gmail.com>
In-Reply-To: <20250901213314.48599-1-rosenp@gmail.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: netdev@vger.kernel.org, sgoutham@marvell.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 david.daney@cavium.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_170005_959616_C20C4416 
X-CRM114-Status: UNSURE (   9.85  )
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

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon,  1 Sep 2025 14:33:14 -0700 you wrote:
> All paths in probe that call goto defer do so before assigning phydev
> and thus it makes sense to cleanup the prior index. It also fixes a bug
> where index 0 does not get cleaned up.
> 
> Fixes: b7d3e3d3d21a ("net: thunderx: Don't leak phy device references on -EPROBE_DEFER condition.")
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> 
> [...]

Here is the summary with links:
  - [net] net: thunder_bgx: decrement cleanup index before use
    https://git.kernel.org/netdev/net/c/9e3d71a92e56

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



