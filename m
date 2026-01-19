Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F176FD29C2E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 14:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PsIX3u4w9+httQ+LGpB1LDno1ynrqB16GAnr0HIddWg=; b=QHiqNdR12z23HcZC0tg+taYzio
	w9tenx6DOiXMDRPsx6O1x8SlESiRNHhFM1tdwA/CvfSZ+sj94eikuJm/AzGUMws9l3EElbiEccC/C
	ni2qX/VV89PM0UI9iQWPaRUiODsqxNGCX05c5wY56tIlUlotg3gTd320OSZ++biNg7PUKUzlRhCZO
	1WwqLuYZMUjHyU7b4xPPOe0+pDzaRTZupEvRUeBnc+shg78Nbx2OJYDitJirIjK5Ig7LMsJzBV12W
	sVv8+R0pAg7Gy03mLxjyV4Bi3/gEp/E5axOm7784ExxyGc+UdRQUwX6i57JANAUBgCgVv1icsF34a
	XgB2NMbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhq9g-00000002F4r-1TGv;
	Mon, 19 Jan 2026 14:22:56 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhq9b-00000002F43-2oHJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 14:22:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C38C46014E;
	Mon, 19 Jan 2026 14:22:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77E53C116C6;
	Mon, 19 Jan 2026 14:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768832570;
	bh=iel0DGd+o7YdAm/0CQY6DbLhXg4Ch8q2C+sIyw5cVsc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=pmUW/8TuBqOMdEh45Xlya+A5LFhiUXZft+YkLYZz4MX4TTLLgBukSekW26UUGCdkX
	 qfIn6ICpmnU59KzLoU2ByoGuW6poqy/zlv/SpaKB4T0Um/6RZ9vdGfFy5EeZQD0JhP
	 mm9x6VxltaUS7QnJ8v++HTqT8EYHEMKgxuMLsGbYTAyrI0mYLU91wXq89X1VzT3/LE
	 fcjZ/XowaofkMOrgURSQlr6CRWBHZq5GRuAGsADPX9WvlvKAgKu763o3oQ4TPM8twP
	 rQ+ziX0YQ2wCJh7uFYWF4sQM0U2ybqAFvhr5TpmUDL+cSustp0arkyYD81hX7RJUMo
	 Vo5eGNM5rFnVA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7891E3A55FAF;
	Mon, 19 Jan 2026 14:19:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: stmmac: fix dwmac4 transmit performance
 regression
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176883236002.1426077.3751892963025257662.git-patchwork-notify@kernel.org>
Date: Mon, 19 Jan 2026 14:19:20 +0000
References: <E1vgY1k-00000003vOC-0Z1H@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1vgY1k-00000003vOC-0Z1H@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, alexandre.torgue@foss.st.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, pabeni@redhat.com
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

On Fri, 16 Jan 2026 00:49:24 +0000 you wrote:
> dwmac4's transmit performance dropped by a factor of four due to an
> incorrect assumption about which definitions are for what. This
> highlights the need for sane register macros.
> 
> Commit 8409495bf6c9 ("net: stmmac: cores: remove many xxx_SHIFT
> definitions") changed the way the txpbl value is merged into the
> register:
> 
> [...]

Here is the summary with links:
  - [net-next] net: stmmac: fix dwmac4 transmit performance regression
    https://git.kernel.org/netdev/net-next/c/5ccde4c81e84

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



