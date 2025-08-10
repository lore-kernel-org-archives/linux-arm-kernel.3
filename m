Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9731C87FDA
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 Aug 2025 21:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=52DDp7pEVpvfG7RZjpWosmeunTzGEp4OvOLs6+XVwNk=; b=OPQntqltR7yGeHfd19LnYCnXbW
	pqLDbJEJFCrOb20KlnysYplvIarz0GMHczQmJ29u9DWrdPsyBUVqPZC5UWRF2JyqrZ19PVN5r4ZoX
	ar47E9sQdXb3xPj72WruXhy3mdwJphgxpZKbP5tnq7IyGCKGGWvX3LH1kYSOh5zW6tFLMtbb5Jr/5
	mrLr2vQ31EGK5uj+zo5ZTsFI1GpCTNZWyuV//Ug4/UR85I8mBvF4HDV2/poL/9SRGsykMy5jIOASW
	3+HYJIOb4mnTdH3eW0AcchsRpjQILLuutx5VR4psmSrcjADYLeeFEIjCTTgwk4JqpyDftgCfmb3lB
	MWgkMQig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulDV6-000000061kq-0NVn;
	Sun, 10 Aug 2025 21:22:44 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulDKy-00000005zc5-1pzL;
	Sun, 10 Aug 2025 21:12:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BD844A568C8;
	Sun, 10 Aug 2025 21:12:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61AB4C4CEF8;
	Sun, 10 Aug 2025 21:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754860335;
	bh=6qZtmYPtQt6UwAsXJ30diF7OIT7IeXGDZboQy/POMhY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Osf4jbmhAA6UtiHphDxnXbpyWNtr3NtPHo5Orbi0VcusCvyEN9ju4ZjusP9njFz0y
	 BEkKw4L9d2HggMgUg7UxPMaJCZcFjxD/l1aEeiE88jk/Z9s6h8G7jsyj0R6w8PRtOW
	 Q45wlJ8ga//bPDscDGu5K/FJj0cygWL75l6w91Y7G71cWNVO7AzOk1LkNr6grMkJUq
	 mFQc3Fl9RDiCcv0j+VvneBDn7JCeUX1nDthOy733XoPFAo2bOeHoYi0oadwLSTC+KY
	 DiOT9Kp/cteJ2xGwnIAzNOpXuBDjuXNkLxi9V4Wvv2cvfoJOgqwCUBnCGnyEyRb3GR
	 jDjiXPYViAJDQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33D4339D0C2B;
	Sun, 10 Aug 2025 21:12:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 08/21] cpuidle: riscv-sbi: Opt-out from genpd's common
 ->sync_state() support
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <175486034774.1221929.3623715142191297628.git-patchwork-notify@kernel.org>
Date: Sun, 10 Aug 2025 21:12:27 +0000
References: <20250523134025.75130-9-ulf.hansson@linaro.org>
In-Reply-To: <20250523134025.75130-9-ulf.hansson@linaro.org>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-riscv@lists.infradead.org, saravanak@google.com, sboyd@kernel.org,
 linux-pm@vger.kernel.org, rafael@kernel.org, gregkh@linuxfoundation.org,
 m.grzeschik@pengutronix.de, andersson@kernel.org, abel.vesa@linaro.org,
 peng.fan@oss.nxp.com, tomi.valkeinen@ideasonboard.com, johan@kernel.org,
 maulik.shah@oss.qualcomm.com, michal.simek@amd.com, konradybcio@kernel.org,
 thierry.reding@gmail.com, jonathanh@nvidia.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 anup@brainfault.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250810_141216_539981_1E6507D2 
X-CRM114-Status: UNSURE (   7.80  )
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

On Fri, 23 May 2025 15:40:05 +0200 you wrote:
> The riscv-sbi-domain implements its own specific ->sync_state() callback.
> Let's set the GENPD_FLAG_NO_SYNC_STATE to inform genpd about it.
> 
> Moreover, let's call of_genpd_sync_state() to make sure genpd tries to
> power off unused PM domains.
> 
> Cc: Anup Patel <anup@brainfault.org>
> Cc: linux-riscv@lists.infradead.org
> Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
> 
> [...]

Here is the summary with links:
  - [v2,08/21] cpuidle: riscv-sbi: Opt-out from genpd's common ->sync_state() support
    https://git.kernel.org/riscv/c/ee766b017586
  - [v2,21/21] cpuidle: riscv-sbi: Drop redundant sync_state support
    https://git.kernel.org/riscv/c/eb34a0b5fee7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



