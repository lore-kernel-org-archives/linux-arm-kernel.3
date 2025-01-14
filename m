Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF3DFC02180
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 03:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8603rSvWpfcQnEM0mFscRefHuifHY3rlCWHeoRXLb+0=; b=OX+/I/OzfIltHsEx2Vs530aYZl
	qcCjM5iXfX98gfnRGtFo24dMEGmzqOsUfak8r9g5XY3PyunG4FgOn8MDcMz7nXNDxGdp0m4iyBPLv
	p9tSW9bkDGgOMjIS6DXM77GfkXSjA2yoH45du0A+Oc0ZqfTYIK34Z4wNngTbWdhxwrWjJO3OK28Om
	+pXvpb75jwgwDKi54ns8MC7sPz1Ll0yjdkjrsAORZnBXKI/M6xcYebpap9QOYCaM5iVoVs9LPkKMN
	hpunPvRhHn3Es8Bc+M88EU5MkKHkDLbSaCfZBCTVwB6GEFDogwrNnFdqw3bh+1nMs5to7qx29mOvt
	yMCrIrvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXXL5-00000007JaJ-47Xd;
	Tue, 14 Jan 2025 03:11:35 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXXJo-00000007JL9-42Ex
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 03:10:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5A226A400D3;
	Tue, 14 Jan 2025 03:08:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A19AC4CEDF;
	Tue, 14 Jan 2025 03:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736824215;
	bh=CVj7TdloU+gXG15A51Peimye0OPTDRYZodtEP33PreQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=cgGCAKYt4Z8Bvt5yPHuzRjwgq66Qk+KX8Rk1orS5F9+AyZx8Y7udllHQcsV6Y4UkM
	 aMEkvnIv9bI6OdLNQwy8Mti+10ZMuQ3mbnfoYN8kV5ueFTtyn3OyoUIBkez6kVfMbJ
	 A8y2CVvIWyQR88uEcmUfXXk1GclAdwRGWhBgPrnCyyoEUKV/3GTgftoC95MYoMmPrF
	 178ZXRLME6ijIQ5jckBIxzWigi+RMn88oBWLsnbAy7m7BpY+hHpW28i8ze2c8wtuDH
	 tR4GN6MBBQyjBrXdqmSrYd9rama6K/kAUAQICON9xHOUbTH/fkuBNeyEuCaBaVzC7q
	 xH5OkE+ybhUDg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 34B0E380AA5F;
	Tue, 14 Jan 2025 03:10:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] net: stmmac: sti: Switch from CONFIG_PM_SLEEP guards to
 pm_sleep_ptr()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173682423774.3717681.2700579800997856759.git-patchwork-notify@kernel.org>
Date: Tue, 14 Jan 2025 03:10:37 +0000
References: <20250109155842.60798-1-rgallaispou@gmail.com>
In-Reply-To: <20250109155842.60798-1-rgallaispou@gmail.com>
To: =?utf-8?q?Rapha=C3=ABl_Gallais-Pou_=3Crgallaispou=40gmail=2Ecom=3E?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: alexandre.torgue@foss.st.com, joabreu@synopsys.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_191017_067851_13549159 
X-CRM114-Status: UNSURE (   9.86  )
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

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu,  9 Jan 2025 16:58:42 +0100 you wrote:
> Letting the compiler remove these functions when the kernel is built
> without CONFIG_PM_SLEEP support is simpler and less error prone than the
> use of #ifdef based kernel configuration guards.
> 
> Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
> ---
> Changes in v2:
>   - Split serie in single patches
>   - Remove irrelevant 'Link:' from commit log
>   - Link to v1: https://lore.kernel.org/r/20241229-update_pm_macro-v1-5-c7d4c4856336@gmail.com
> 
> [...]

Here is the summary with links:
  - [v2] net: stmmac: sti: Switch from CONFIG_PM_SLEEP guards to pm_sleep_ptr()
    https://git.kernel.org/netdev/net-next/c/6e702e6aba84

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



