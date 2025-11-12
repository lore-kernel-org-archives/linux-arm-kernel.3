Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D70DCD3425
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 17:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eIW1B9JBmQy7E5kEV9N/sQ4eD/rXS5EcIvoAg2y73QY=; b=uu6sy8FhwxJaynsirVwKGtaokZ
	LCktXVwYcoNZhCH8OJpDXvbEFigwxXchij4ji/r1Mvl1CbIypZHlZiWBFPIvLBLzOzNCLqhi4uVyK
	FxWEXZDWC4xdcbPkqz56IrW7xPyTFEt3yOPr/7qZ3UM1/iaChExzjXrkEVdacqBe9EB3hDQLUGwdl
	1lI2bIALThvKYgZhRHoVAoYHnVCufcv0ipUpuY9Mi1GWpcCzIeUpTq4wmEkesVvKzutUdMSo6K595
	jLYBNzWUddrhyR/fsGpYDZGFAdcpcjEuYEAI3jGi4QltaHqdaho95o4tRtFSdHfI+y+Z41ES0C8nR
	JlqlFc4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJEWQ-00000009Enc-0rND;
	Wed, 12 Nov 2025 17:20:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJEWO-00000009EnS-3wph
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 17:20:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F081D601E6;
	Wed, 12 Nov 2025 17:20:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94686C19422;
	Wed, 12 Nov 2025 17:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762968039;
	bh=4SXvqIUmralZtLxvLSfsaFD6hCMsoBtvKsE9dz+t0iQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=f5fDthr4D93MJprus9XGBNxhwvWbMF5ZmbrLKRtBIz7PjbdRnsnHHKVQvwUS6P2gh
	 CgAW3obRWsyB8px1i0FbxMnUPtXolt4dULoquCEIRiCstZ9a1Ldzsx8bzfG/OLHk6l
	 CnjEUZxrGr43u5pa2RWJ9ZImxI6hShIX8FXyJptCcnrn/DP104e4lIj9VKMCR7wKkn
	 orJ5NB67+m+RBtZooZmZXwCewNCXcjk1+Brep4FeWshlfdNTXP39G9QRU4iQa6fHDA
	 GEpnMPwEjz3m1K18WIaBAPU0syw/F9jvFrSJS1X3Ejsy4ZpsBZqNoXmtGhlxb7GNT7
	 6A9S9Nmr1evHQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70D3139EFA62;
	Wed, 12 Nov 2025 17:20:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: stmmac: improve ndev->max_mtu setup
 readability
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176296800900.91007.2385891703778454442.git-patchwork-notify@kernel.org>
Date: Wed, 12 Nov 2025 17:20:09 +0000
References: <E1vImWA-0000000DrIl-1HZY@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1vImWA-0000000DrIl-1HZY@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, alexandre.torgue@foss.st.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, pabeni@redhat.com
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

On Tue, 11 Nov 2025 11:26:34 +0000 you wrote:
> Improve the readibility of the code setting ndev->max_mtu. This depends
> on the hardware specific maximum defined by the MAC core, and also a
> platform provided maximum.
> 
> The code was originally checking that the platform specific maximum was
> between ndev->min_mtu..MAC core maximum before reducing ndev->max_mtu,
> otherwise if the platform specific maximum was less than ndev->min_mtu,
> issuing a warning.
> 
> [...]

Here is the summary with links:
  - [net-next] net: stmmac: improve ndev->max_mtu setup readability
    https://git.kernel.org/netdev/net-next/c/7e975caa0f7b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



