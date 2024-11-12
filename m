Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEBBED41D44
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 01:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0NLasQReOvGvV4wOf+9WsJT2zoa2ocFOk1J5wcxI9e4=; b=bMlWhns4J1up8LsFDeKBdLY8Zi
	RSZoNBpZeiJiwXZjNM8YOfsAwKhC3JXrId7IBkBjP1WtkEGjvtIe2QVZtKLPnfBM7wuqoliFlh8T5
	AJAh7IEjDLLWlIjL+Rwwz9mn0MTOi9XSI0CBbVG8Wgw7dXT4MUZgrH3aZjRb3VD0w4CO42gMERxRO
	ojihLDcnpXxxXshxAukdz78CmOKjmaDJ/IODA+MZTdZX4jDxabgklnfz0Yx5NEoAezSOzLh3WFBLo
	oyBguAya9ofOrTxN7ZE2DZ5sK+OLuGLxWWV6F6ZjV2iEqAO1rOlZ9Txd79IL1IQNfXavImbBYuHKp
	MifKvWPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAfNA-00000001pdY-0huA;
	Tue, 12 Nov 2024 01:07:12 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAfGa-00000001oHg-1eCX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 01:00:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 904945C5E64;
	Tue, 12 Nov 2024 00:59:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5969C4CECF;
	Tue, 12 Nov 2024 01:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731373222;
	bh=5Ly3KTlyGxLxMdfFr4jX9+4qFB8MuIzcMl8Y+2r08GU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=jD3ihzeYm/MAbIy4isBJM1MmRNUzcwsucpzXgKO/fNR0HDtN1wk4pit0UyrV3natq
	 /4l9xghiGQ3os6R24qcWqKOXYqTqveKbsecGFt8G2a5wsRjQMSYpPQpcnO/iENk/Jk
	 kkU9SxNhZE3DottWuaBvCA2f27+GozRRTJZODg//cuszNdt56uvFr4Xf69QZgKt/gc
	 noNUpVGAMH2jvRBxMWbE6ph65wfYL3L0oTYS8x1SNga/iTN9VArWKbfGCh7k3AKZ6k
	 WMJW7eMXjsMJJaQcPBwAI4Ad/E+q3VJR3ASKI3KM5W1prIBt5UnMqTDweM0YLfAImx
	 EwZQ5zUn/Ac5A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB0853809A80;
	Tue, 12 Nov 2024 01:00:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v3 0/3] net: stmmac: dwmac4: Fixes issues in dwmac4
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173137323274.33228.17724047786767970520.git-patchwork-notify@kernel.org>
Date: Tue, 12 Nov 2024 01:00:32 +0000
References: <20241107063637.2122726-1-leyfoon.tan@starfivetech.com>
In-Reply-To: <20241107063637.2122726-1-leyfoon.tan@starfivetech.com>
To: Ley Foon Tan <leyfoon.tan@starfivetech.com>
Cc: alexandre.torgue@foss.st.com, joabreu@synopsys.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 lftan.linux@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_170024_494749_A8AC57DC 
X-CRM114-Status: GOOD (  11.15  )
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

On Thu,  7 Nov 2024 14:36:33 +0800 you wrote:
> This patch series fixes issues in the dwmac4 driver. These three patches
> don't cause any user-visible issues, so they are targeted for net-next.
> 
> Patch #1:
> Corrects the masking logic in the MTL Operation Mode RTC mask and shift
> macros. The current code lacks the use of the ~ operator, which is
> necessary to clear the bits properly.
> 
> [...]

Here is the summary with links:
  - [net-next,v3,1/3] net: stmmac: dwmac4: Fix MTL_OP_MODE_RTC mask and shift macros
    https://git.kernel.org/netdev/net-next/c/6d4a34fe429f
  - [net-next,v3,2/3] net: stmmac: dwmac4: Fix the MTL_OP_MODE_*_MASK operation
    https://git.kernel.org/netdev/net-next/c/3fccba8fdc1b
  - [net-next,v3,3/3] net: stmmac: dwmac4: Receive Watchdog Timeout is not in abnormal interrupt summary
    https://git.kernel.org/netdev/net-next/c/671672977012

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



