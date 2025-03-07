Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6F81C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 00:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=53dc8KCtgrVy3f7DB5Y8qDpa77xGhyKHpyGKs68Zw0A=; b=FSNsalODR4lFGYh/G+TXPQhnR6
	g9X5yNBDJuTd0z1Abx8h/UbYUBE1hcYMWFXei9c9bH/BDql/8vzMrwuBRsT0SV/lG7kS3+Q+QDx0k
	RjeWjvFj92pF/WVh9Oq9mxOr0gAbVoNja+lypL3PwWtiVG5hcvjw9+VdjptzYH01sGHyIW0XoVyJy
	ZhWPcWXhpElyGSVTKoLmZDkNshA40Tz/S7dx+1HU2ddqJ+nfOflF5IBHMTnwyokq9PLDTASUrhAgU
	0EW84HWuvZB4WoLPJGoup30W7vfSSLnEviDdktih5VnfIaIF7QP7RX62Hg4Qb/uZIZcQi0p/9yczW
	nf/TbMag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqM2F-0000000Ci2v-2tP1;
	Fri, 07 Mar 2025 00:57:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqLuh-0000000CgVh-32Nq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 00:50:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3FB075C569F;
	Fri,  7 Mar 2025 00:47:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D42C9C4CEE5;
	Fri,  7 Mar 2025 00:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741308606;
	bh=5E7QrRtVE031fm+0oQBlEfIWLHzTajXqxBcwX74S8Q4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=frIgPf6wI9fVxTERiWPafyss4uNcBrf+ieJqOGr/EklkxPj8AM+kQ+DlxgC4qnXxK
	 F32IvEiXGrSp7TH99vvRvJ83UoD2CQgUwoBld7Gs1nrNQS53jO+MBJhoir1dhh/XKT
	 6y7BHdLmtpl9X9y6rfM1T/f5uC3japAQ267W0fkIysS3yGBP0W4BsYQLB9ItFZN2RS
	 pzG/9Uzc3Urxk5Fo2wxHUJi33DxXsWRvtzLGZhrFkJOmGfzQ003C/Tv+6xBBze5dPG
	 xMRI3t3jSd4oAFITDWyqjdzrqBmO4zd0/J7pZo4NPKI9+iTsQPP3N/rdknhgpomLAi
	 3xOBZ8PEp+dZw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70BD1380CFF6;
	Fri,  7 Mar 2025 00:50:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: stmmac: avoid shadowing global buf_sz
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174130864025.1835493.2395705293072394933.git-patchwork-notify@kernel.org>
Date: Fri, 07 Mar 2025 00:50:40 +0000
References: <E1tpswi-005U6C-Py@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1tpswi-005U6C-Py@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, alexandre.torgue@foss.st.com,
 ast@kernel.org, andrew+netdev@lunn.ch, bpf@vger.kernel.org,
 daniel@iogearbox.net, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, hawk@kernel.org, john.fastabend@gmail.com,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, pabeni@redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_165007_812985_53510684 
X-CRM114-Status: GOOD (  10.93  )
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

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 05 Mar 2025 17:54:16 +0000 you wrote:
> stmmac_rx() declares a local variable named "buf_sz" but there is also
> a global variable for a module parameter which is called the same. To
> avoid confusion, rename the local variable.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Here is the summary with links:
  - [net-next] net: stmmac: avoid shadowing global buf_sz
    https://git.kernel.org/netdev/net-next/c/876cfb20e889

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



