Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BE0FCD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 23:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2q/iUZHmzQJ2DtmNMtcn+7efYWlaZTLUNoV8eMxuMoI=; b=u0Y7mdIZB6fUDGJCD5OUn6UdPu
	txibb9Ugg0JA/jgfHWWbKlMEE2ftaJY8HnbEyBdz/NJ3SwWFom+TaHgTRfLDmnIkVSCVtZ6sQyWkI
	W3siWqCSFlcoENoI/8fG8Q8VvENQZmaDwPsxeAttJYjUTu6Fam3q2kwQar4VWQUUV5OU0plAz20BK
	6RnfJOGYACI0cpeBcVPexSOofNsO/4RqiSsvH97PxQ0wObjyI5PfXqwtHCOU9TRwm/G/M+dqrV53u
	78G7Ik8Ch/ByLnfko6wgM3hVoXaf1jYaAE79Hr0dJ79G9YYWCU6TyJX+A4m4vGY9hSgpAH3FUsK1C
	sTxHt74Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYXUV-0000000CbZJ-0PUP;
	Sat, 13 Jun 2026 23:10:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYXUU-0000000CbZC-16xZ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Jun 2026 23:10:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5FB746008A;
	Sat, 13 Jun 2026 23:10:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 122741F000E9;
	Sat, 13 Jun 2026 23:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781392213;
	bh=2q/iUZHmzQJ2DtmNMtcn+7efYWlaZTLUNoV8eMxuMoI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=dSYMmOtKsCxoiSxOvLoSHdYRssn1le0ynrgX79A9xb2JkxdSS3dN37bID7oTZwlsE
	 syuFBg2CNBQ2Wbdafq7x3RKeXQs9xkyE5YIh3+HSNJXYbJTDUxDMsksDgzyeVmr/LA
	 svs2tDYEE24ivI0Qx1JHnJEbY0xnt9SZBhfe+Y0ti7EzTCCJPopzdZpXgKukSlKQ5w
	 qJQ5j3PLAMK9sDh5CsQuV/Po+Jo9Qm8OPKGU8AnD0SoNRzLSMrmPm6vAXCPv2eIAAy
	 PU1u8ZkiQ/LxPd0vpnFscWdLYH57yDnJze2GUavg8aULtiea7CxB4TIjnKDDSjz5x6
	 Ni2YwmUmLjL/A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 569ED3A54A32;
	Sat, 13 Jun 2026 23:10:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net 0/2] net/stmmac: Fixes for maximum TX/RX queues to use
 by driver
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178139220914.1621428.9980668998947938804.git-patchwork-notify@kernel.org>
Date: Sat, 13 Jun 2026 23:10:09 +0000
References: <20260611113358.3379518-1-j.raczynski@samsung.com>
In-Reply-To: <20260611113358.3379518-1-j.raczynski@samsung.com>
To: Jakub Raczynski <j.raczynski@samsung.com>
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 k.domagalski@samsung.com, k.tegowski@samsung.com
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
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 11 Jun 2026 13:33:56 +0200 you wrote:
> When contributing other changes preparing functions for new XGMAC hardware
> https://lore.kernel.org/netdev/20260601162537.553512-1-j.raczynski@samsung.com/
> there have been reports by Sashiko AI review about pre-existing issues
> in the code. These problems are non-insignificant and are 'net' material fixes,
> rather than net-next features.
> One issue in this patchset was reported by Sashiko AI, while other
> technically part of new patchset, but is reasonable related fix.
> All of issues are wrong DTS configuration, but kernel needs to handle it.
> 
> [...]

Here is the summary with links:
  - [net,1/2] net/stmmac: Apply TBS config only to used queues
    https://git.kernel.org/netdev/net-next/c/8b10877d9d6c
  - [net,2/2] net/stmmac: Apply MTL_MAX queue limit if config missing
    https://git.kernel.org/netdev/net-next/c/8a7bca6de6de

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



