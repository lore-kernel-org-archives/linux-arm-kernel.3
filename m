Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9651D35660
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 01:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oJ/pfxuw/bZnke4RUPLyfp1WkqeHbN2JlKRQQBqZqCk=; b=Gd7gClJQ1miKDN1u4NQ4h5RDhP
	XpW8ux8LuMMxp5wGdZpdFvbsWaFleVDuJ8nJy0ApJ7QHwGIiBG0Zb1JGqSdWKcarm2dZS9VL9WB8K
	NVZnSIVGPI6C6lbSPkW2Kbi/johXFMY05uBWr/hgLie4h5QNv2gmQo+VXIcmEwj2JNHoM/UgEvWCv
	CIEnohxnNrtL48RqRqwhvkvMtH7vBSeuYL3KRJnItPT05+Ed4X/nSB9vM1LiESWwEMP+kfF6U8CQ+
	X+hN0ukYtFu0JpptkB+W5el7W1INh+BmEV2tiGjYfxzfs8j4O6ul0qQFK6ePiCOMi95VxTx+pB0Y6
	c7DWspeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkuXq-0000000FGLy-3MOC;
	Wed, 28 Jan 2026 01:40:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkuXn-0000000FGLa-306h
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 01:40:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B2776444C1;
	Wed, 28 Jan 2026 01:40:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F482C116C6;
	Wed, 28 Jan 2026 01:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769564430;
	bh=BRV3NNMHXtFN28QG1LlieA/z4NRLoXX16Hu52ceP2zI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=WHjFUmwgQPYSpaiLwlRr+oDhcgvtV85LuysWTTawWtHliueaNPchxBbx1YiBDBNA9
	 79Q3gfNNXtPRsD9ZXv0VfX6hfmkOp6O66cvH58i6U/+ES7Q5sDrfTlLbanjNM9d5AK
	 i1Td/5w9L7Liq6NVvQAddqRWgUac4gEoJUxUDSr8rnd5OQ4ASoS15zxvBqIhPFNQKR
	 iPh8w3YSJ2MCQ8+mmPx4Yl/ulwN5SpmbE/knJrbDhwhYeeDOvKAnlh2pX/phIGcHt2
	 9p4pUWYavRaL3f+I2KocUE7c0Bi4tIcBWt5AWmG1zAlBxeIhO2UtQQktO9DX65oC7w
	 DG3YrILver3Cg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 8BC3C380AA76;
	Wed, 28 Jan 2026 01:40:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: stmmac: don't pass ioaddr to
 fix_soc_reset()
 method
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176956442434.1470424.17241812328293968709.git-patchwork-notify@kernel.org>
Date: Wed, 28 Jan 2026 01:40:24 +0000
References: <E1vkLmM-00000005vE1-0nop@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1vkLmM-00000005vE1-0nop@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: andrew@lunn.ch, alexandre.torgue@foss.st.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, imx@lists.linux.dev,
 kuba@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
 pabeni@redhat.com, kernel@pengutronix.de, s.hauer@pengutronix.de,
 shawnguo@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_174031_796270_5CA05D2E 
X-CRM114-Status: GOOD (  11.27  )
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

On Mon, 26 Jan 2026 12:33:14 +0000 you wrote:
> As the stmmac_priv struct is passed to the fix_soc_reset() method which
> has the ioaddr, there is no need to pass ioaddr separately. Pass just
> the stmmac_priv struct. Fix up the glues that use it.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c      | 8 +++++---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c | 6 ++++--
>  drivers/net/ethernet/stmicro/stmmac/hwif.c           | 2 +-
>  include/linux/stmmac.h                               | 2 +-
>  4 files changed, 11 insertions(+), 7 deletions(-)

Here is the summary with links:
  - [net-next] net: stmmac: don't pass ioaddr to fix_soc_reset() method
    https://git.kernel.org/netdev/net-next/c/d64f761dbfda

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



