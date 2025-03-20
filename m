Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B24D2C36000
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 10:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zd101JCkKJR3+JdWTHsQ/QQXYJx2J08ATYXb4wMEqGI=; b=yqlzqfAkCg6qE2SvNn6ejaWQc4
	0aSkkU8+f7nX2HneBHv6EAcw9hRxVVdhT35xE9gGCMi2wnubvpvU5Ma6MWt9qlrAxuntE3kjDcwr/
	lUbM8CS3W1qUmyWzfTMHiDK9yYbSNOTTxH0lDu/N0ChgXL7rAlnadyPhe+lhCQKfTlORJQYZTXx2Y
	LjTZrJ7iL6Ju3hyErJyyQVzSoz9gUDNCBgjZRH2sAY9lNQyC87gy0ZiUPboQDWe6UP1x19CcsgN8k
	CtGQRbssgyLcNR21sDibF0NJy0A5y4vGEXMDuSi5SmoY16OgyazliZufYP3TOraFlOxle9QcVb2XF
	kFZTWMVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvDBl-0000000Boon-0zfu;
	Thu, 20 Mar 2025 10:31:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvDA2-0000000BoZW-3Dvn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Mar 2025 10:30:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CB06043EE2;
	Thu, 20 Mar 2025 10:30:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E81BC4CEEA;
	Thu, 20 Mar 2025 10:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742466602;
	bh=HvW+yK+cfSz6X1+LbzCfZ79HknqBLpkWp03giIKD3lo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=YsHtC2gFw73GoQ7d8h636mMRm5qXhy50XrWpjyZFb32cbwS/f4sMiaTasUEp3IQ3p
	 feG+2DJUaNtHsP55K4RGVHHEzFFpeuqoNOvunDskEWkP9HArA3JxhQKWMd2nJrkxJ0
	 Ey1JEkFUCVhm9dlnpjQTImugB7jaKoZcPpGX0HDztesGA7ikFjz11BLlLKZu6qiXPw
	 PVuav+LUnV866RmApjyO54Isx5Q21VeDSDA/VBOEL5MrlyLDVLZKTCX7uDvHHCoI+G
	 jdozQPt+wwYKUkrO3F1danStATATMEqB8gvDW3JUB7b+Yl7TP1Y95o5/FzhOgBZMkv
	 /nlh2/KeB4wtw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33DB43806654;
	Thu, 20 Mar 2025 10:30:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: ti: icssg-prueth: Add lock to stats
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174246663785.1712233.14659376394563532017.git-patchwork-notify@kernel.org>
Date: Thu, 20 Mar 2025 10:30:37 +0000
References: <20250314102721.1394366-1-danishanwar@ti.com>
In-Reply-To: <20250314102721.1394366-1-danishanwar@ti.com>
To: MD Danish Anwar <danishanwar@ti.com>
Cc: saikrishnag@marvell.com, m-malladi@ti.com, diogo.ivo@siemens.com,
 pabeni@redhat.com, kuba@kernel.org, edumazet@google.com, davem@davemloft.net,
 andrew+netdev@lunn.ch, linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, srk@ti.com, vigneshr@ti.com,
 rogerq@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_033002_825011_8E7D6C67 
X-CRM114-Status: UNSURE (   8.36  )
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

On Fri, 14 Mar 2025 15:57:21 +0530 you wrote:
> Currently the API emac_update_hardware_stats() reads different ICSSG
> stats without any lock protection.
> 
> This API gets called by .ndo_get_stats64() which is only under RCU
> protection and nothing else. Add lock to this API so that the reading of
> statistics happens during lock.
> 
> [...]

Here is the summary with links:
  - [net] net: ti: icssg-prueth: Add lock to stats
    https://git.kernel.org/netdev/net/c/47a9b5e52abd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



