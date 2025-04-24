Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 339A0C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 10:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UkI85Zo251zVIOF6DPNuyGzyKY1mftT+GWjEVyv81X4=; b=FKjdHiuRfTCkGA1Ew4FQHmdiQ6
	jyUjiYsWxwShTzHAMC1ZW9d1COCFLRiNwmGGjkECdddNbg3PeGPZzn7xrbTVgcba9MGEieKJVV74C
	eqfPvCjWVl4LRrgDTE9xO5QxUz0LN4nQQyuMww6VooPXkGAEjZzsroTVXBc80wPHuSJLnyxbxKvVZ
	/35e1voxnYYXXJdn1KXjRoO3buE8PuZlxezyvu9u5roiCk1/a59AnHBnNeT+aGKuoYy6nNhbt0ska
	2Ni99/IXAbDphmjr8Q8d2ehRGg6iYClqK64X8PDOF9iikt+2suLrlIZs/F7yjaFDrXXEHcieR6bIe
	fFXmI43g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7uAV-0000000DkgO-3c5m;
	Thu, 24 Apr 2025 10:50:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7tN3-0000000Db1N-22WY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 09:59:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1F04F68455;
	Thu, 24 Apr 2025 09:59:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 926ADC4CEE3;
	Thu, 24 Apr 2025 09:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745488792;
	bh=0tvvSnk8ULXJWC8UVXdj328qfDMVzDjjl0icK/+r8Pg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=h1zDvKUJt1IfwS1/Fel+frXyQnAD1Gj5eHUh89C36XTplozRDivahhNeTqKdzqEPa
	 ZSjVpW6cWkBwey63ozOw7bxm/Ym/CcE0GOkIyEX4q7d/0wYugu3WDN1uu0+2hXoxN+
	 M99VZ5T2p2OAJp1oscN7ckbOZTB2TY/HcQByBv/zICFNxwPKv+kk0EooORq3+jmRdZ
	 H7e7R53US23RIlqOTCpV5xV8MOYhRTvgzVTnNPDOULdZ6BzYEaUQPlrNPv2xxyF5dT
	 TPzn3rlGq/wKOurcyXUweMyCbHcoMvLrqSw9sZxP0WiFtdSnb5jczuAZ7dyJD9Hrhk
	 n1fNf1vds2BYw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70EC5380CFD9;
	Thu, 24 Apr 2025 10:00:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v2 0/2] net: stmmac: fix timestamp snapshots on
 dwmac1000
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174548883125.3289294.6660302727268151005.git-patchwork-notify@kernel.org>
Date: Thu, 24 Apr 2025 10:00:31 +0000
References: <20250423-stmmac_ts-v2-0-e2cf2bbd61b1@bootlin.com>
In-Reply-To: <20250423-stmmac_ts-v2-0-e2cf2bbd61b1@bootlin.com>
To: =?utf-8?q?Alexis_Lothor=C3=A9_=3Calexis=2Elothore=40bootlin=2Ecom=3E?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, richardcochran@gmail.com,
 daniel.machon@microchip.com, maxime.chevallier@bootlin.com,
 thomas.petazzoni@bootlin.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux@armlinux.org.uk
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

This series was applied to netdev/net.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Wed, 23 Apr 2025 09:12:08 +0200 you wrote:
> Hello,
> 
> this is the v2 of a small series containing two small fixes for the
> timestamp snapshot feature on stmmac, especially on dwmac1000 version.
> Those issues have been detected on a socfpga (Cyclone V) platform. They
> kind of follow the big rework sent by Maxime at the end of last year to
> properly split this feature support between different versions of the
> DWMAC IP.
> 
> [...]

Here is the summary with links:
  - [net,v2,1/2] net: stmmac: fix dwmac1000 ptp timestamp status offset
    https://git.kernel.org/netdev/net/c/73fa4597bdc0
  - [net,v2,2/2] net: stmmac: fix multiplication overflow when reading timestamp
    https://git.kernel.org/netdev/net/c/7b7491372f8e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



