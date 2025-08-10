Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91194C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 Aug 2025 21:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7c46tEVFOcvkAXmTd/SfptzkiuJDg8oNacZearrL2qU=; b=oaVIsfkW0oqNGHRShA/gT28d8p
	gZpaitGnPTDErCLUjytlBDbsBy/pHLJ0EEAjmnfIbDr/wdybNPfKUjXoUWsyC5jhNjqRsrEMgIkHe
	4LtYPu80AidrgVxyZVnvM7Yc6nveYX1aN9SA2SHOB97oEKQujhmhtH4CQLTcGP/Nb4HY+aOkIbQNT
	MXwSdPqP1cyOrNE7+I1HiYrd+rtW5dHEEh6vwenv1R4kcySBewFxyG4oOegZt7V72dNVuM0QPxrWr
	PCBmBVApLY4DT+tm7tB5veRk9Y3qfeKD/6IaG7uoL4aji82KeNJPxx1rlQOER+TBt2SKGUZlMzxhE
	dGO/IeGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulDSW-000000061Qq-3sBd;
	Sun, 10 Aug 2025 21:20:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulDKw-00000005zaP-0uIF;
	Sun, 10 Aug 2025 21:12:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id ECAA94470C;
	Sun, 10 Aug 2025 21:12:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2752C4CEEB;
	Sun, 10 Aug 2025 21:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754860333;
	bh=q6uQBP3ytVwY6Xa0bc7ANWecbKEHgjOcdNbvPZv33Lk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Wf3MJIUha+tL0qtzl5Xf6xljjvs+i5UNLAoJ/pUEkJv27IMfKaWGuIXYUnccTV8lu
	 4osP+GVHUZPCF4H7EpfE+/sASevvtCay7yT0WV2OQWZwF1oYCCXq7L44lWCr9wV2Iq
	 /CH6JRm1eFDYNfX9gpbUk8layqijyn9I3/iZ0rCgIKraHTzIEqFwkfYabLlGJZCQnz
	 XgrA2HMScZbJ9Kw2bPTQeQu06I/gHMONMQw5KKtdKdj5YOsDYAsurp7Zyj0exMXQCf
	 nX+MRQb0244NMTke6zPThALZixE0KJtKSh2zA3y17EAm8PQ9HfaF5/dOzdssGMYDR+
	 HTudqeXY+X3wA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADDAD39D0C2B;
	Sun, 10 Aug 2025 21:12:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/8] pwm: Drop local locking in several drivers
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <175486034649.1221929.797683482600200009.git-patchwork-notify@kernel.org>
Date: Sun, 10 Aug 2025 21:12:26 +0000
References: <cover.1750788649.git.u.kleine-koenig@baylibre.com>
In-Reply-To: <cover.1750788649.git.u.kleine-koenig@baylibre.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig_=3Cu=2Ekleine-koenig=40baylibre=2Ecom=3E?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: linux-riscv@lists.infradead.org, linux-pwm@vger.kernel.org,
 claudiu.beznea@tuxon.dev, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, linux-arm-kernel@lists.infradead.org,
 vz@mleia.com, conor.dooley@microchip.com, daire.mcnamara@microchip.com,
 wens@csie.org, jernej.skrabec@gmail.com, samuel@sholland.org,
 linux-sunxi@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250810_141214_275641_11912056 
X-CRM114-Status: UNSURE (   8.51  )
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

This patch was applied to riscv/linux.git (fixes)
by Uwe Kleine-König <ukleinek@kernel.org>:

On Tue, 24 Jun 2025 20:15:36 +0200 you wrote:
> Hello,
> 
> some time ago the pwm core implemented additional locking to protect
> lowlevel driver callbacks against driver removal. A side effect is that
> .apply() and .get_state() are serialized. This allows to drop some
> locking that is now superfluous due to the core's locking.
> 
> [...]

Here is the summary with links:
  - [5/8] pwm: microchip-core: Drop driver local locking
    https://git.kernel.org/riscv/c/9470e7d11fe2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



