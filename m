Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31E18D2AB1D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 11:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JOyvibcOFBBghQETH1E9UlBGRpX63HBgro1ttk4bLfc=; b=Pcnc5xs6cHzYyaY+FuRic9WTgw
	Oxbklro3kE2SaP5Iw/ku4LSbWoarUyloMIJUCWjXXGClBcSIImcyQlpHcakxrxgVLgdlALUWk/96c
	ntVd2Ua503Izg02P49TRn2f3Jw8ySfq0NN0R9oaDq1Xi2uR+mkvQRf1gIP4vVZfisIj/Qyq9v7QHp
	D5TpzUu/cS0HRMhkum6kXYN/Tm4KVPEn1KyplSMpp80iMOj4bhwvqPCtCc6UeRcH8i8Fd8WnDBzgL
	zxkA2/3GDYCyRTp5MIJ8kQ9RC30lB0/de9dDExI8SLI/6YKtDa9S7SJxpa096K7vvqLdxEiULF914
	EN82zyIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5k3n-0000000EAvq-3XlF;
	Tue, 29 Oct 2024 11:06:51 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5jeC-0000000E4LN-3Ydd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 10:40:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3F8755C58E0;
	Tue, 29 Oct 2024 10:39:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED3A9C4CEE3;
	Tue, 29 Oct 2024 10:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730198424;
	bh=GKQOic+Iow43xdBlnF2TJONS4WKrXxqdtwInlxWhQUs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=JVYVQ2L//XHfQqT9rYVWZdJK4YWnkUdMRkHJP+H1nd01+Yilf8tQmUeI8ZV92SoXD
	 NUjCpC2yxYENqspHMXVneu2J6vqfjChP1Kw7jB1P6tE5ZVgpp9qzH2u07cOKFt00ds
	 nWOSkidF4goOnTMDiubY+NZr9FvONLa6fSapF4mE7kMzrOONK7FUX1lIddZVIi7h1m
	 dIHvGXFP/aYGs3RCg5oGHbKcH20zu9aYhmVSns5Uf4z1/IriYHSno/NpRfN1JKjS9j
	 dYupPKoPkjukp5C71nNmkf1hCFCvHJSrUaXkuVGiIY7cW2DSowwN6JYIFBZRRAZnmI
	 hWiVhsIeTW//w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADD1D380AC00;
	Tue, 29 Oct 2024 10:40:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v1] net: stmmac: TSO: Fix unbalanced DMA map/unmap for
 non-paged SKB data
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173019843151.651132.13756275797117288059.git-patchwork-notify@kernel.org>
Date: Tue, 29 Oct 2024 10:40:31 +0000
References: <20241021061023.2162701-1-0x1207@gmail.com>
In-Reply-To: <20241021061023.2162701-1-0x1207@gmail.com>
To: Furong Xu <0x1207@gmail.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 alexandre.torgue@foss.st.com, joabreu@synopsys.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, xfr@outlook.com, quic_jsuraj@quicinc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_034024_966347_873F98AF 
X-CRM114-Status: GOOD (  10.12  )
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

On Mon, 21 Oct 2024 14:10:23 +0800 you wrote:
> In case the non-paged data of a SKB carries protocol header and protocol
> payload to be transmitted on a certain platform that the DMA AXI address
> width is configured to 40-bit/48-bit, or the size of the non-paged data
> is bigger than TSO_MAX_BUFF_SIZE on a certain platform that the DMA AXI
> address width is configured to 32-bit, then this SKB requires at least
> two DMA transmit descriptors to serve it.
> 
> [...]

Here is the summary with links:
  - [net,v1] net: stmmac: TSO: Fix unbalanced DMA map/unmap for non-paged SKB data
    https://git.kernel.org/netdev/net/c/66600fac7a98

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



