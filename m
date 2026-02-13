Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FE34EF48C4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Feb 2026 03:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7YK1s6nibyKo27GAnbfXZsctsN1A9Kf63hwLhuxLVA4=; b=MgzG89iPl5Tiv+7RzDSPJd2UBb
	AMtdWDIUuB2Pue30yyZMTNKBXyBNFFTY6UDmYnsKbmF3vvVHGKzmwPUWFs0NFIqUfXCDQdRdfz+1B
	LttGxffNJrBS4pWMn0ZccCc7RITKFaJoMu211SZYVEDhgLtCk9P7TvTldXDkAjBgve8oKr0J5UHDr
	ONCImpDRvoHoW23r55D/PmqUPdc/tIix66QZtgrOww1pYdJ5A60J+KVlmrxTeHXcNLO6ypmYdcVGQ
	ZMBZRK97Fvx61yMJRDQGfY2yZ01YjcqJQCgcLhgaj/0QEDevxb1XukzQ0UOPXEMyKCBIzPWFHLA79
	pBTrCBnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqjZS-00000002tOV-1081;
	Fri, 13 Feb 2026 03:10:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqjZR-00000002tOO-19Zi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Feb 2026 03:10:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 53F7B60018;
	Fri, 13 Feb 2026 03:10:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 016B5C4CEF7;
	Fri, 13 Feb 2026 03:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770952216;
	bh=SaYAiSTeda0ott75Qw/mkaQ0eig9Sx4NgiZBMmqTLJ4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=fQ3ZIBY7kwRlay/f9mzgwK9Itz+fs6pasAFohKdK0zoK805HlYzcZ6No36FGfBYR1
	 7pDl2Hq93v8isMtMBL1dqg4cMfDoF55jci28YvsoUh0rUuhdPcrQbbRZDamUL1jjAV
	 tUfuwn0CNyey7KCLoeWt6/oWZseOlzwQcDGZjAcpWAOqAVpvNhYIYTHV1+OewOZBmC
	 JOKtcg2RfLVyEEjvJqirWnIZWY4hPSgp4CB3lY1/2u5KdzeuDxxh6MreKctcW7gFea
	 bDZnL/VedniXmQsHRalVGT2dNo/TCF7UzyLItxJlLJRrl6Q+x1Mx6iyAhbzoST2QpC
	 JLqe5Bjt7GD7g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 481483931093;
	Fri, 13 Feb 2026 03:10:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: sparx5/lan969x: fix DWRR cost max to match
 hardware register width
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177095220983.1827286.14396517672847717184.git-patchwork-notify@kernel.org>
Date: Fri, 13 Feb 2026 03:10:09 +0000
References: <20260210-sparx5-fix-dwrr-cost-max-v1-1-58fbdbc25652@microchip.com>
In-Reply-To: <20260210-sparx5-fix-dwrr-cost-max-v1-1-58fbdbc25652@microchip.com>
To: Daniel Machon <daniel.machon@microchip.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, Steen.Hegelund@microchip.com,
 UNGLinuxDriver@microchip.com, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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

On Tue, 10 Feb 2026 14:44:01 +0100 you wrote:
> DWRR (Deficit Weighted Round Robin) scheduling distributes bandwidth
> across traffic classes based on per-queue cost values, where lower cost
> means higher bandwidth share.
> 
> The SPX5_DWRR_COST_MAX constant is 63 (6 bits) but the hardware
> register field HSCH_DWRR_ENTRY_DWRR_COST is GENMASK(24, 20), only
> 5 bits wide (max 31). This causes sparx5_weight_to_hw_cost() to
> compute cost values that silently overflow via FIELD_PREP, resulting
> in incorrect scheduling weights.
> 
> [...]

Here is the summary with links:
  - [net] net: sparx5/lan969x: fix DWRR cost max to match hardware register width
    https://git.kernel.org/netdev/net/c/6c28aa8dfdf2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



