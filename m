Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4165DCD5BAC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 10:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9R8ntL8OnsMLmlQawne1YSDG8cqsU2esjJuzaGlaegg=; b=1d3XNRevxHc5FeFzLKbBjzIiSf
	QHqUMNX5/P3RSvFKrsqDNxLs/cj78/fXsbVK1iuJAAVxeWL8FjwlRkPrSFTEW0tkPAPq84uUVw/C7
	dpNpEuLXb6TFZDOsbfVr2zO2nFtSuF8alcgRCprKM9oLDHuN7aCHCyqAiT/hqwSqhfF+p/qKMGZdH
	EXw3lNHrG8uCANPBXeElOsjEroi+SqHeaHtvb79+aJBR43OoOiUJteTxBSTLILCpX2heoU+Pcl5nM
	VdelnleUM6/I8W9qqJVbpMupZD3aYrXy1EzMi8iUA1F+GzAP7y1/P5hjvy6iR8QRqQ0nRXhTvavJ7
	c88g0sDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ0Lu-00000007PYy-3Ln6;
	Thu, 21 May 2026 10:10:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ0Lr-00000007PYI-3MOW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 10:10:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0858D41B19;
	Thu, 21 May 2026 10:10:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D89531F000E9;
	Thu, 21 May 2026 10:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779358202;
	bh=9R8ntL8OnsMLmlQawne1YSDG8cqsU2esjJuzaGlaegg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=Ob366cd/ws5M953MPJx81mAfB5ttBr/S7oma5nDXTGUIZh+9wF2Nx9Tn9Sq/Zx/Vi
	 3O0TXxK4Qqc4S49k9YhuthjpCrDa+JAeCC8p6Lh6D9UjHPVOOvzTjtw0mwp95+ug9A
	 NB0UxO5YXWAUV3b18v9HzLFg4zwFK4l9nCvlwZadTZeOOphmgkF4nF+/6OggMEfTUF
	 SX20DpLXHBoH8L5+egT6L2op0tyAzgZhhZwTPHlujMGqr0bmMljJg2GTyzcjQSTTTg
	 QSc9NenKbvMNEJNL12cf2j0a9/KIeuYO/AJpVWvlxb+q306wyUKDTpm1+9S/9wOp7d
	 xWHSjtdMR7DsQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 198143930D21;
	Thu, 21 May 2026 10:10:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v2 0/5] net: stmmac: eic7700: fix delay calculation
 and
 initialization ordering
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177935821264.4013498.4647676520552839707.git-patchwork-notify@kernel.org>
Date: Thu, 21 May 2026 10:10:12 +0000
References: <20260518021919.404-1-lizhi2@eswincomputing.com>
In-Reply-To: <20260518021919.404-1-lizhi2@eswincomputing.com>
To: =?utf-8?b?5p2O5b+XIDxsaXpoaTJAZXN3aW5jb21wdXRpbmcuY29tPg==?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, rmk+kernel@armlinux.org.uk,
 maxime.chevallier@bootlin.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, ningyu@eswincomputing.com,
 linmin@eswincomputing.com, pinkesh.vaghela@einfochips.com,
 pritesh.patel@einfochips.com, weishangjuan@eswincomputing.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_031003_865176_B5AB9C14 
X-CRM114-Status: GOOD (  11.53  )
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

This series was applied to netdev/net.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Mon, 18 May 2026 10:19:19 +0800 you wrote:
> From: Zhi Li <lizhi2@eswincomputing.com>
> 
> v1 -> v2:
>   - Update eswin,eic7700-eth.yaml:
>     - Limit the binding changes to adding optional TXD and RXD delay register
>       offsets in eswin,hsp-sp-csr.
>     - Restore the original enum-based definitions for rx-internal-delay-ps
>       and tx-internal-delay-ps.
>     - Keep rx-internal-delay-ps and tx-internal-delay-ps as required
>       properties.
>     - Restore the original example content, with only the additional optional
>       TXD and RXD delay register offsets.
>     - Restore Acked-by from Conor Dooley for the binding change, which was
>       temporarily omitted in v1 during series restructuring and has been
>       reinstated now that the change is stable and properly isolated.
> 
> [...]

Here is the summary with links:
  - [net,v2,1/5] dt-bindings: ethernet: eswin: add optional TXD and RXD delay register offsets
    https://git.kernel.org/netdev/net/c/c36069c6f46c
  - [net,v2,2/5] net: stmmac: eswin: fix HSP CSR init ordering after clock enable
    https://git.kernel.org/netdev/net/c/23386defe949
  - [net,v2,3/5] net: stmmac: eswin: clear TXD and RXD delay registers during initialization
    https://git.kernel.org/netdev/net/c/6872fb088edc
  - [net,v2,4/5] net: stmmac: eswin: correct RGMII delay granularity to 20 ps
    https://git.kernel.org/netdev/net/c/6ffcef9bc1fc
  - [net,v2,5/5] net: stmmac: eswin: validate RGMII delay values
    https://git.kernel.org/netdev/net/c/c2e152f7ce32

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



