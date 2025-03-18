Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CADDFC35FF8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 10:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uPWXl/8RURSQVhDBgDdVe10bQmZPe5kSiQ4uVWsO9Y8=; b=cpzx/uXd31NJhBn8Naxz2VXxrf
	iviyBcht5AgldNuSE8Upj05rMBvmP1EhCUc7PieEY4Kew5fWZNvPnzSpqT2fyyCQN5UeEPi8QY39M
	63ERRsrlpMZ95NLo9uJUqsGcNMsn+5e+rzGp/YCgxAm9omjSVUlZ1HoW4dMPNmsJTTacR5eYK0vXi
	Z/HKJrjKxQm1OdnYGN2lOis7SMa9ZZlvdqMeepmcTwtZJBFtNvzhUUWLwGqGSr5w73dShoWGY6GMS
	QNMZzPUHE9+5PpoX+ig4Xs9xKwUUvo6T5ely2YFDJ3uwa0pmQbspHoHxKh40J1iW3aYyCr+pq1Q+1
	LxoMO5Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuUID-00000005Wpe-0DkO;
	Tue, 18 Mar 2025 10:35:29 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuUCt-00000005VnU-08dO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 10:30:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C49A6A48F38;
	Tue, 18 Mar 2025 10:24:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06808C4CEDD;
	Tue, 18 Mar 2025 10:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742293798;
	bh=GEyWmAuKyt53yQnLXeprXRpXd8Gr1UAJGEAO81CNlf4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=GVGPsRCQwFTEZngbGzaWWnmzTfiuq8UjnKK4UDTZdjXfAsl20tqkt8barAi2UL7Ys
	 /RU7IQ8xNTkjEUpxWLc4C9gJL0DJNUb2JQQrnaj1I2xa56mMx7Fdd/gFFHUgUGAZRb
	 taNX+CJYV2ZWJ/kI+GXpD/nixiDsnALdQ6BQuRM7kedN0epHn+kjXQih0IpYtLVzTR
	 /sXBojLHIjxtpi/SHjFRHhQT4cXXvuGbSEFStQiO52dvS+kBzy2FrMWOnTUR1JBwgd
	 1bDoWdOWmsfbiwfuKu4FpW7oVoEK16ER/YndH5Zm8r6P3dUj0E336n2r7IiRMSQ4yA
	 sv6ERxCxK/1Vw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADFE0380DBE8;
	Tue, 18 Mar 2025 10:30:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v3] net: ethernet: ti: am65-cpsw: Fix NAPI registration
 sequence
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174229383352.4118139.13974344587777019051.git-patchwork-notify@kernel.org>
Date: Tue, 18 Mar 2025 10:30:33 +0000
References: <20250311154259.102865-1-s-vadapalli@ti.com>
In-Reply-To: <20250311154259.102865-1-s-vadapalli@ti.com>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, rogerq@kernel.org, horms@kernel.org,
 alexander.sverdlin@siemens.com, dan.carpenter@linaro.org, c-vankar@ti.com,
 jpanis@baylibre.com, npitre@baylibre.com, vigneshr@ti.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, srk@ti.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_032959_132458_E8E02488 
X-CRM114-Status: UNSURE (   9.82  )
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
by Paolo Abeni <pabeni@redhat.com>:

On Tue, 11 Mar 2025 21:12:59 +0530 you wrote:
> From: Vignesh Raghavendra <vigneshr@ti.com>
> 
> Registering the interrupts for TX or RX DMA Channels prior to registering
> their respective NAPI callbacks can result in a NULL pointer dereference.
> This is seen in practice as a random occurrence since it depends on the
> randomness associated with the generation of traffic by Linux and the
> reception of traffic from the wire.
> 
> [...]

Here is the summary with links:
  - [net,v3] net: ethernet: ti: am65-cpsw: Fix NAPI registration sequence
    https://git.kernel.org/netdev/net/c/5f079290e591

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



