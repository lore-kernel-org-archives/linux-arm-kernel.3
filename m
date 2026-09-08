Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 703D8C79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 10:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d0RVUKGzQViRfhpTWiTrG2gQKE1cWfQApfz0Noa/nxQ=; b=YNRgbGL9L2MWgYkIKtuNSiGBHV
	nO1xw2K8HNF1WxsLtPfoSZ+2DEdrvfegr4xTEWgZnoyoRFkQkZcZaY5snGPX0gnWa98fIEKEJMTCO
	N09Y8oBkBx8wtSu4Qu62gRboo4NsRSJ5x4Ek4e/9TB0J1VXOFeb1Ahq3ZSrOZp1dHjDbty8bjUDT6
	Meeru2N1fBdNf5Q1s5VKY3qBHy7/MKVkofIVWXvmbitV7uztH/Sr/ruet7Zogea+hGIVx8W2NTyJF
	fvuV/21ITvyLJWkLq/1CbAoyFERaiVTEykUX0c97lrfTmvGfA1fuBDxipFQHydWESDYKV1SK1k8be
	JShPy8TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3swx-00000008kp9-0ox8;
	Tue, 08 Sep 2026 10:21:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3swt-00000008koK-3KXA;
	Tue, 08 Sep 2026 10:21:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4183643408;
	Tue,  8 Sep 2026 10:21:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22EE11F00A3A;
	Tue,  8 Sep 2026 10:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788862867;
	bh=d0RVUKGzQViRfhpTWiTrG2gQKE1cWfQApfz0Noa/nxQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=FDr4rG1jykxjH42fVaoN3noXPX3ildn87M7q7ySMDJV9Uto2rD25ishapl9v/Tp/S
	 rcrM6B5Uf9+PXJLuvpv9rYpa6YCKVMLHfFaF1lZ4mCDxzo7DnZeMt7ZGbeNe+/Ez7S
	 4WuEKlQZRMWMVvPDi1mb+8JkrqOadPHvtt+x2F/QaGZzkqpp9I7J+BtGRe2hMPMb5V
	 QT2b8qFNojxEp6ZYsN5jlm4v3AYIJ2ps5m8Dwsuf8d+WoWc5FMogEEHlQjBVq1SX+Q
	 nRcekTtBEl5Wm5PQcFkuqfsFOB/OM9Lb9E7Z9nsrbKdNKzR9zGXX19o4jEl0qZ84uu
	 3D0Mp5QpoCqZw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 1983539E9602;
	Tue,  8 Sep 2026 10:20:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2 0/3] net: Make sure clk_init_data is fully
 initialized
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178886280589.3447437.8919325096369252990.git-patchwork-notify@kernel.org>
Date: Tue, 08 Sep 2026 10:20:05 +0000
References: <cover.1788425654.git.geert+renesas@glider.be>
In-Reply-To: <cover.1788425654.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: theo.lebrun@bootlin.com, conor.dooley@microchip.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, hkallweit1@gmail.com,
 linux@armlinux.org.uk, neil.armstrong@linaro.org, khilman@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
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

This series was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Thu,  3 Sep 2026 11:00:38 +0200 you wrote:
> Hi all,
> 
> The clk_init_data structure contains several mutually-exclusive members
> for different methods to specify the possible parents of a clock,
> prompting drivers to initialize only the members they need.  However,
> not initializing all members may cause subtle issues, which are only
> exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> enabled.
> 
> [...]

Here is the summary with links:
  - [net-next,v2,1/3] net: macb: Make sure clk_init_data is fully initialized
    https://git.kernel.org/netdev/net-next/c/83e6bb28644a
  - [net-next,v2,2/3] net: mdio: mux-meson-g12a: Make sure clk_init_data is fully initialized
    https://git.kernel.org/netdev/net-next/c/4bee840c7e43
  - [net-next,v2,3/3] net: phy: air_en8811h: Make sure clk_init_data is fully initialized
    https://git.kernel.org/netdev/net-next/c/64adb67e4568

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



