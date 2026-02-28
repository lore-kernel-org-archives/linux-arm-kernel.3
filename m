Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7F631048927
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 00:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m56MCNSdemC7M/yNjQY8R0BzpwpuN6R8qkSkdL3s7N4=; b=ahXYUZogxl9mN4LCryj6v5w1o9
	OuBbFgY8ccmcFMXj5gHIchp8IsygEWovPMlLgom9n5zBEibg3nEMuOXTnrvQUOuhiftQGHc4Tvn8m
	wLjVoliLqQUTU4ZDXuITXvF5vg4E/NsQFA05bJzj/9U+E4r4lOn7TQIE0B65KnfF1ZLDLLpshzb9t
	jmyPav9/EchYUlU3OUGXyjpccE3RGHhx2abKIjlkhdVv0f23i/fdufoibLhdZ57arHlhP5bGaIVm2
	+3SVK9661YR9N7q2ZyOE5kffUt1/tLVVRIA/uLxzCfWeov8tL/Ek2ppXdV4cSHCirw83dDt/oKpwu
	64uJad1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw8cj-00000009MAi-2Vtq;
	Sat, 28 Feb 2026 00:56:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw8ci-00000009M9G-0GhW;
	Sat, 28 Feb 2026 00:56:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CCA1B6057A;
	Sat, 28 Feb 2026 00:55:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE281C116C6;
	Sat, 28 Feb 2026 00:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772240158;
	bh=vrU43BCMFUhI571ZBbWK67TPeRBthBSfjXT1gOjxGvQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=dRJG/cV8UO4EPLOKG0SME4XWTL4z5+/lxOI0LO0x5zNDpR+qZweaw3EUQYWAzB9FT
	 37zQcfCwjx1gG5dRwZp20pzpF4TNkFE5UcmOT4hRk05N1ImyGFMBPXQIcdcuZCcmas
	 dC8O3aVwWe/GhZIG0cUq8VJgxRXIniKxAfZXa7g/2NO9Y4BXlWSg86KbHD5w2PZtr7
	 EE7dPsHb0FyJSR/rEvqBiohBTTyWqg4hJikV+Rnp9QyjIAr1g6GZLFvHHnwuDB8ewn
	 C4Yr7XlOLRxL1OmTNEj/wkzNlWm+/HxDV2UK/fMes811tdjUuzNMlvHLbDjQUiy6ze
	 k367Oe98bd7sg==
Date: Fri, 27 Feb 2026 16:55:56 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David
 S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, netdev@vger.kernel.org, Paolo Abeni
 <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH RESEND2 net-next 0/8] net: stmmac: qcom-ethqos: further
 serdes reorganisation
Message-ID: <20260227165556.5cf9e844@kernel.org>
In-Reply-To: <aaIysVxy-WxbiJz9@shell.armlinux.org.uk>
References: <aaDSJAc-x2-klvHJ@shell.armlinux.org.uk>
	<aaIysVxy-WxbiJz9@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Sat, 28 Feb 2026 00:11:29 +0000 Russell King (Oracle) wrote:
> The AI review for patch 7 says:
> 
>   This commit fixes a bug but lacks a Fixes: tag. The commit modifies
>   behavior introduced in 360000820ae2 ("phy: qcom-sgmii-eth: add
>   .set_mode() and .validate() methods") by making phy_power_on() call
>   qcom_dwmac_sgmii_phy_calibrate() to restore the previous setup, and by
>   making qcom_dwmac_sgmii_phy_set_mode() check if the PHY is powered on
>   before attempting calibration.
> 
>   Should this commit include:
> 
>   Fixes: 360000820ae2 ("phy: qcom-sgmii-eth: add .set_mode() and .validate() methods")
> 
> which is _wrong_, this isn't a bug fix.

Yes, that's what I thought but then I saw the other thread..

> So, in light of AI review being incorrect, my comment about re-sending
> due to the AI review is no longer relevant, and no changes are required.

Okay.

pw-bot: new

> The only thing that's necessary is to have Vinod's ack added to patches
> 4, 5, 6 and 7, as he gave them against the very first posting of these
> on Wednesday. This is despite waiting the required 24h before sending
> the first resend.

