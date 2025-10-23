Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A6FDCCD1BC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 09:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QlPj07c1tuo6xmCfdYNIdUpxfVil6ynTDn9Tr4o4XP8=; b=mrbFzvYFZX35MZGOl/tC+Z1Xh5
	+8xoqzNOpfjqTbe48d6DEq1x+WX+IEFgAVVodnZALLvQSz5potfmry8WkykJKQOP+myIry7ovaiN5
	ar2gK+VB0F7v1GcTHIohWZLzSMc7hKIhe1yw3/j3pHDlev+6VqZHxdKEwyhaVkJoJsjrsK7JhpdlM
	Etizq8fWG3PPO4LA6We6TyPP9MsP0EdkKgjI0JT6KKELBdFM2hlx5DlVnGktlDh5HcZPLFN4V0+ea
	IlCp3Cbh+bRPwe2NUyailUUhC+0ZJPzmOizPb7/zg8QuhVOQ7mHA72UQhuZX8+dkiBHeV2QuGQmyn
	jVAbVXQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBroI-00000005lJN-24JB;
	Thu, 23 Oct 2025 09:40:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBro2-00000005l3u-1dZd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 09:40:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CF0504ABC1;
	Thu, 23 Oct 2025 09:40:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF390C4AF09;
	Thu, 23 Oct 2025 09:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761212425;
	bh=nJOnAXX5sRVFOgviHjMHBI/zr4WV3fKNmsk5kSsFjtQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=T4D2XouKlTdAaJXNLAB2DTxUcIAy1Cxw740vuAlenlseHGSG1GHpyuA+vpYtNq05o
	 QOIhWRRvk49Gizl2n1iwQYmVDql5KMYNRpwDkiOAk0XB+5PaMZCh6gixKFX41f1b3x
	 eODq72LXUIWDoN7rWi4S2N4WY9yhhfISiOR2iFbkUOjbJxzHX/iLBOBRJlp4AFjhLN
	 eZ3JLdLA8Nblb5Gsu7RPUWIrbatsgEzzq29Ye55KOTu90oJ4zjnpgtyDvUZ0t92T0c
	 o3Zh0M1mEbbPoW3PcdwzEKINGFwUzeq2gR/vbowKuEcS3VmNbT8y+Kg2IfsNCbIMK4
	 xPAtuVQwubTwA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70D063809A2D;
	Thu, 23 Oct 2025 09:40:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: ti: icssg-prueth: Omit a variable
 reassignment
 in prueth_netdev_init()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176121240626.2969431.4409960503973897261.git-patchwork-notify@kernel.org>
Date: Thu, 23 Oct 2025 09:40:06 +0000
References: <71f7daa3-d4f4-4753-aae8-67040fc8297d@web.de>
In-Reply-To: <71f7daa3-d4f4-4753-aae8-67040fc8297d@web.de>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 andrew+netdev@lunn.ch, byungchul@sk.com, davem@davemloft.net,
 diogo.ivo@siemens.com, edumazet@google.com, grygorii.strashko@ti.com,
 h-mittal1@ti.com, kuba@kernel.org, jan.kiszka@siemens.com,
 krzysztof.kozlowski@linaro.org, danishanwar@ti.com, m-malladi@ti.com,
 pabeni@redhat.com, r-gunasekaran@ti.com, rogerq@kernel.org, horms@kernel.org,
 vigneshr@ti.com, linux-kernel@vger.kernel.org, linux.amoon@gmail.com,
 christophe.jaillet@wanadoo.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_024026_458538_E6189B75 
X-CRM114-Status: GOOD (  10.09  )
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
by Paolo Abeni <pabeni@redhat.com>:

On Mon, 20 Oct 2025 16:02:56 +0200 you wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Mon, 20 Oct 2025 15:46:11 +0200
> 
> An error code was assigned to a variable and checked accordingly.
> This value was passed to a dev_err_probe() call in an if branch.
> This function is documented in the way that the same value is returned.
> Thus delete two redundant variable reassignments.
> 
> [...]

Here is the summary with links:
  - [net-next] net: ti: icssg-prueth: Omit a variable reassignment in prueth_netdev_init()
    https://git.kernel.org/netdev/net-next/c/e0665df8c501

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



