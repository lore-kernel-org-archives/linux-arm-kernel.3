Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AD97CDDE71
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 11:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8rfcjYZptODzf7nQMTdW1N41J94cPXjshHJiOaHntnk=; b=R1pXNZXtZW0O1QuHAy4ZsYqj8H
	ddvBr2iw5WTAmwD6w1MHY+QQ6R9u2x4lPl64U1uxHjMtxRrjUD4ufhejSdot6Lu6zvGJZekGjdhna
	tLp9jv0UspwNzohMt4p8VBzWR41ri34fiRgPNzLyPaHyJ2jDmcMuhBlyNfmMOqnBMnXN+bEEdwJ5v
	CsrginU56yc8bZ2ipZrybyegDgwOxX2PJp129l0T0DssxIfJRVBANLlvg++hlRuKwSgHbn4PNCMnY
	8d6hIg2ktAv6GT3lUh34TdDtcweJrZnUeXQkGULzEdvjNkRAdYyrMmic2ZqcoxcIBBQ77aDjLyNFL
	yJn2z36A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Zqf-0000000EDHr-2QSu;
	Wed, 23 Oct 2024 11:48:21 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ZPQ-0000000E7Ho-0h7t
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 11:20:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DD2E9A44D55;
	Wed, 23 Oct 2024 11:20:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7F02C4CEC6;
	Wed, 23 Oct 2024 11:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729682410;
	bh=tc4l2Y6qujgXL1mb4ojYmiIMvOzve59JJSCmIJ+XW+Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UbUWV9CsjLgcLVxkjj6MbHCxwwkjEhim+kIbovtrZEWf/RUGeALso976xhda5BPbo
	 9YxD+w5Fna8Y+/5of3YUc1eIASxnc+etA5geexLSOPIK5ITCDu0H0+oB+EMtal+vQ/
	 OB5D4b9Sh5CCjtvjTw3e3KnPLScTdIq3bJp29i0lEopFZ1Ex9ZzacapD0+jRc6ESBH
	 sx5wK3pIdOKTy6/QD6TTf/SHNWwlyWUHC/XMaDT0Oyg9qVmlDCcQKxMnuSM+ZlZY6v
	 JskejtRimt+PMwEaUACIpfRke6ImGPuddUW9CB7oEkzGbqOI5bmO9vr6b37UvKt/5p
	 atpLNMYG0qDQQ==
Date: Wed, 23 Oct 2024 12:20:05 +0100
From: Simon Horman <horms@kernel.org>
To: Ley Foon Tan <leyfoon.tan@starfivetech.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	lftan.linux@gmail.com, Andrew Lunn <andrew+netdev@lunn.ch>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Maxime Coquelin <maxime.coquelin@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH net-next, v1 0/3] net: stmmac: dwmac4: Fixes bugs in
 dwmac4
Message-ID: <20241023112005.GN402847@kernel.org>
References: <20241021054849.1801838-1-leyfoon.tan@starfivetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241021054849.1801838-1-leyfoon.tan@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_042012_301893_6E588F6C 
X-CRM114-Status: GOOD (  19.77  )
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

+ Andrew, Giuseppe, Maxime, linux-arm-kernel, linux-stm32

On Mon, Oct 21, 2024 at 01:48:45PM +0800, Ley Foon Tan wrote:
> This patch series fixes the bugs in the dwmac4 drivers.
> 
> Based on the feedback in [1], split the patch series into net and net-next,
> and resubmit these three patches to net-next.
> 
> [1] https://patchwork.kernel.org/project/netdevbpf/cover/20241016031832.3701260-1-leyfoon.tan@starfivetech.com/
> 
> Ley Foon Tan (3):
>   net: stmmac: dwmac4: Fix MTL_OP_MODE_RTC mask and shift macros
>   net: stmmac: dwmac4: Fix the MTL_OP_MODE_*_MASK operation
>   net: stmmac: dwmac4: Receive Watchdog Timeout is not in abnormal
>     interrupt summary
> 
>  drivers/net/ethernet/stmicro/stmmac/dwmac4.h     | 4 ++--
>  drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c | 4 ++--
>  drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c | 6 ++++--
>  3 files changed, 8 insertions(+), 6 deletions(-)

Hi Ley Foon Tan,

Thanks for the updates.

A few more points on process. Sorry for not pointing these out earlier.

* Please base the CC list on the output of get_maintainers.pl FILE.patch.
  b4 can help with this.

* Please do not include Fixes tags in patches for net-next
  (while please do for patches for net).

  If you wish to cite a patch you can use the following form,
  which may be line-wrapped, in the commit message (above the
  Signed-off-and other tags).

    Some text describing things that relate to
    commit 48863ce5940f ("stmmac: add DMA support for GMAC 4.xx")

    Signed-off-by: ...

* Please include some informative text in the cover letter.
  It will form part of git history. E.g.:

  - [PATCH net-next 0/3] net: sysctl: allow dump_cpumask to handle higher numbers of CPUs
    https://lore.kernel.org/all/20241017152422.487406-1-atenart@kernel.org/

  Which became:

  - Merge branch 'net-sysctl-allow-dump_cpumask-to-handle-higher-numbers-of-cpus'
    https://git.kernel.org/netdev/net-next/c/94fa523e20c3

More information on process for Networking patches can be found here:
https://docs.kernel.org/process/maintainer-netdev.html

-- 
pw-bot: changes-requested

