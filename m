Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99558C87FDA
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 Aug 2025 21:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mca0pY94jd791IhqddVL6YyWoXhjmJDxQKzWsJcd150=; b=F7Qb7Uy13K2G8z4yLQD3rUxBuM
	AycdG7RpBabCOtnULhcyvBEJk8Np1BjwFW+fFcxZlDqhjfIiPkPnGkI65QWo38DKJ6k0EQ43/atrp
	+kEZe7rML8qSUfhPEtXR9rh3f1BHuOojN6o8tl4Pbs246fN7VqIpvYSHjEd81NR+Ir2TBF7MTA9Z0
	AI7/ztS0eo8V3vZfNZ4DX4ejUYYZCiKQlA06M8+Fsn9Omt/X2xva7VJB/hssHQAbG3O2dx4/7rDIM
	MSFENJfa9HX1uZkpa7uOFNWLZ/oHQY0f1bZ3fzkOkm/BiDnjWWPBEQApuMA4BDfjJQh+oNFJHVeJB
	mskT/jww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulDXd-000000061zI-1koS;
	Sun, 10 Aug 2025 21:25:21 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulDKz-00000005zcb-46bn;
	Sun, 10 Aug 2025 21:12:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3ACC4A568DE;
	Sun, 10 Aug 2025 21:12:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAEF6C4CEEB;
	Sun, 10 Aug 2025 21:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754860336;
	bh=9MmiwSbOpn9sJ3k+9vBWQv8oVw1RiwTCpsRy+r+Y3B8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=rMEJ8Gq22UebkrmVDbiKKeRUjqO/BW93ToXRYdfhGef1rLm5v/DuIs+VOmVha52Ua
	 9BqJE4gioTZ7AojQDm04GlNgy5Ux+iDN7tQWmeq5mlfjfFHf66ecZyi8j8MrgHO3mP
	 r9P60YJAIb8m6DeUXFcpWqx7KfojCPpESsduM6p+DwoC3AGuvpVd3muUBsBkK+D7pO
	 67m4Mw9G7jlYvkOrg8CycH89yy9R0nhoBgGvkS/GRnexFMxOcmo6VhXoyF+NfZD6ZU
	 9zOkMONCwi7Tyy277v2z5aOeU8Mny/cEbjQ6xXEa8fW9kqlk2MZuVkIHF729qu1J6u
	 uqTqY/JUOOHVQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADD2139D0C2B;
	Sun, 10 Aug 2025 21:12:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3 11/24] cpuidle: riscv-sbi: Opt-out from genpd's common
 ->sync_state() support
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <175486034925.1221929.6715963825149639363.git-patchwork-notify@kernel.org>
Date: Sun, 10 Aug 2025 21:12:29 +0000
References: <20250701114733.636510-12-ulf.hansson@linaro.org>
In-Reply-To: <20250701114733.636510-12-ulf.hansson@linaro.org>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-riscv@lists.infradead.org, saravanak@google.com, sboyd@kernel.org,
 linux-pm@vger.kernel.org, rafael@kernel.org, gregkh@linuxfoundation.org,
 m.grzeschik@pengutronix.de, andersson@kernel.org, abel.vesa@linaro.org,
 peng.fan@oss.nxp.com, tomi.valkeinen@ideasonboard.com, johan@kernel.org,
 maulik.shah@oss.qualcomm.com, michal.simek@amd.com, konradybcio@kernel.org,
 thierry.reding@gmail.com, jonathanh@nvidia.com, hiago.franco@toradex.com,
 geert@linux-m68k.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, anup@brainfault.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250810_141218_080711_3BF97077 
X-CRM114-Status: UNSURE (   7.64  )
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

This series was applied to riscv/linux.git (fixes)
by Ulf Hansson <ulf.hansson@linaro.org>:

On Tue,  1 Jul 2025 13:47:13 +0200 you wrote:
> The riscv-sbi-domain implements its own specific ->sync_state() callback.
> Let's set the GENPD_FLAG_NO_SYNC_STATE to inform genpd about it.
> 
> Moreover, let's call of_genpd_sync_state() to make sure genpd tries to
> power off unused PM domains.
> 
> Cc: Anup Patel <anup@brainfault.org>
> Cc: linux-riscv@lists.infradead.org
> Tested-by: Hiago De Franco <hiago.franco@toradex.com> # Colibri iMX8X
> Tested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> # TI AM62A,Xilinx ZynqMP ZCU106
> Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
> 
> [...]

Here is the summary with links:
  - [v3,11/24] cpuidle: riscv-sbi: Opt-out from genpd's common ->sync_state() support
    https://git.kernel.org/riscv/c/ee766b017586
  - [v3,24/24] cpuidle: riscv-sbi: Drop redundant sync_state support
    https://git.kernel.org/riscv/c/eb34a0b5fee7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



