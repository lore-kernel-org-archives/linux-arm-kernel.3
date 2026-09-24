Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B52BC98318
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 18:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3b7s0TZCouRV+fANKyon2fgb5XJsJs6Z3Co+PZgaJH0=; b=F4qtjm2xUo7xEfHHjH8Zc4VIKw
	Kin2bh8zrSwEW8Tq8rxQ/aM7s9rKh+5pbJLYPAOeopqYZU84I+2Jj/NqydwepNePcTDnuIi70aUgS
	uk90/HBRrlOzIcoO2Kn2wkKh/ysn6N6fG4QJekeFghc2xakxNMJgVNzmxhIt2wqS5XXftvi56p6L0
	ZcEQu30VvJOi3Q0nxn8pCSXpF1E77XvOAQ/pBm0jFL/CZ9jCCUd+zxyZCPaGFyaLL5SYbRkWcpMeI
	eXhNL7vqmEkh1Sg4TgX8IKhUmFaxaoENKqDc6DJHtZ8s2HHhIAPtOqeEoU73Vd8TJiFek4jcKvfcy
	j3/ETZJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9nl4-0000000BrLh-1MFl;
	Thu, 24 Sep 2026 18:01:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9nl2-0000000BrLG-3PgG;
	Thu, 24 Sep 2026 18:01:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4F89F42DEE;
	Thu, 24 Sep 2026 18:01:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 329B61F00893;
	Thu, 24 Sep 2026 18:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790272880;
	bh=3b7s0TZCouRV+fANKyon2fgb5XJsJs6Z3Co+PZgaJH0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=iJsasJCeYcma1r+urKfOz0k8MclnTql/D1yVdZRNt6KeUQFwBy4IYdzChbWGVpUgC
	 +m1YjISlr9tTMgCG899hV+yLjNlALOFMET9kxqPlyp8wXKbEboH0D0hLqJGnosXYbD
	 n+jvB7849l/+p3ecltU8JlbFJrJAvCEsTznzdkIrYkVmFSFW3+zX8X6NjvWAdiGHQw
	 lwwaapzE1FapwSoJ2H2a9rQqqetku6tCKb7DziCdCP5/0fgoIePhdZOZyuQ67IggFt
	 Ed0+3r13bhWufGoDv2dm9/Hcj8vh2KnFyrzesy4OL3D1dQNX7tEOCMK2qZXdhzhrL/
	 6bxE/sx8eTlKQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 568C43A566DD;
	Thu, 24 Sep 2026 18:00:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v2] net: ethernet: stmmac: dwmac-rk: fix bulk clock
 leak
 when the PHY clock fails
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <179027280889.1685480.8117520252597627875.git-patchwork-notify@kernel.org>
Date: Thu, 24 Sep 2026 18:00:08 +0000
References: <20260923123713.3137146-1-coiaprant@gmail.com>
In-Reply-To: <20260923123713.3137146-1-coiaprant@gmail.com>
To: Coia Prant <coiaprant@gmail.com>
Cc: heiko@sntech.de, maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 sebastian.reichel@collabora.com, netdev@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, lorenzo.bianconi@oss.qualcomm.com
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

On Wed, 23 Sep 2026 20:37:13 +0800 you wrote:
> gmac_clk_enable() enables the bulk clocks first and then the optional
> PHY clock. If clk_prepare_enable() on the PHY clock fails, the function
> returns without rolling back the bulk clocks, and bsp_priv->clk_enabled
> stays false, so the later gmac_clk_enable(bsp_priv, false) becomes a
> no-op and the bulk clock references are leaked.
> 
> Add the missing clk_bulk_disable_unprepare() on that failure path.
> 
> [...]

Here is the summary with links:
  - [net,v2] net: ethernet: stmmac: dwmac-rk: fix bulk clock leak when the PHY clock fails
    https://git.kernel.org/netdev/net/c/8db67bb6a1ff

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



