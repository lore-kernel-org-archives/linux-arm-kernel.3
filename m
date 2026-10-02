Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74725CA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 09:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f59O9B08QCHTGNeuypp2tZ1+0HGrGXSxHAzKegE8o18=; b=XlXd7LY9ulMOWW/cAusqqt5c68
	t9MJ82DeJOJApnnXOzxCWVlqnJgLqSiXLcpo374E/Nz8g5ariogLZoaiHWhMiuNtWdm5wtGfdZrbf
	auwBe3B5p7i97dXdXB0+1CzFAtWkGe1uIkY8usCaB5v7rU+TZpQQhs9Nq50fQnyUN0f/n4bwUU3Tf
	BVdh9JwdQ/Fyt5ojkRkUnjWl+n2MxC9nn2EaJxYwp3k/n+tNxhGXk+Jf77R9whj1HuTRQXEfGpC2+
	vA6LY5QAVa/8QFTp1YXJqvkf6p95n0CM8NCo53NRsVo6gL6SBW5oJddPHO0K9Ft9Bds1hvF3UjROU
	OlezWasQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCZkN-0000000BBE9-0pCE;
	Fri, 02 Oct 2026 09:40:07 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCZkM-0000000BBDl-3e5i
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 09:40:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9D98F447D4;
	Fri,  2 Oct 2026 09:40:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 822F81F0089E;
	Fri,  2 Oct 2026 09:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790934006;
	bh=f59O9B08QCHTGNeuypp2tZ1+0HGrGXSxHAzKegE8o18=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=kJMTCRpOOxsGv4lHIB7Vh6uHdcqO+b+Umva4UYt5Be6sMuaTwoHlFLTWEhiuDY2Tw
	 x+VX6+p4l0nEAhoWWn1JahMeO3cdePphcjbSxPdfYlYbdlLdDFEfPiFs/dbShwq0Sw
	 EduUby5vXKpTOxKe1uHQ9YRn8TKU/5umgEUzdHdYWj6xG/HCpSJHSKxxTc44ssjCRB
	 h7OrDnJVWjxc6YVG6m8Tn5rsdI0UuVRM71eePoay/hIfHOvkpqeWP7LqAtKZhUz2oC
	 dLd141LPpSnrRfpDnEn8xsvmcqoDjtn9w6/aPj7+aTflZK6A5w9wagTXZH2XLQwdkS
	 4w8LBq+QVmdeA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 772D038119DE;
	Fri,  2 Oct 2026 09:40:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v3] net: stmmac: propagate PTP addend and system time
 programming errors
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <179093400503.3321157.8480086535803997023.git-patchwork-notify@kernel.org>
Date: Fri, 02 Oct 2026 09:40:05 +0000
References: <20260929-stmmac-ptp-added-systime-error-v3-1-ddd6afe936b4@oss.qualcomm.com>
In-Reply-To: <20260929-stmmac-ptp-added-systime-error-v3-1-ddd6afe936b4@oss.qualcomm.com>
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 richardcochran@gmail.com, Jose.Abreu@synopsys.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
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
by David S. Miller <davem@davemloft.net>:

On Tue, 29 Sep 2026 15:10:11 +0200 you wrote:
> stmmac_update_subsecond_increment() ignores the error returned by
> stmmac_config_addend(), and stmmac_init_tstamp_counter() discards the
> addend and system time programming errors, always returning success. A
> failure to program the addend (PTP_TCR_TSADDREG) or to initialize the
> system time counter (PTP_TCR_TSINIT) is therefore silently swallowed,
> leaving the hardware timestamp counter in a non-running or partially
> configured state while the driver keeps operating as if timestamping
> were up. This matters for TAPRIO/EST offloading, which derives the gate
> base time from the hardware timestamp counter.
> 
> [...]

Here is the summary with links:
  - [net,v3] net: stmmac: propagate PTP addend and system time programming errors
    https://git.kernel.org/netdev/net/c/232d49dd4b40

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



