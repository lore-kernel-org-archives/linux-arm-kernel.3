Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEA71D5AE79
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 09:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QfLhfzclAKzK4qI0kEKhOeHTfA7oiXCvlD5MtUOHlY8=; b=nV2QBL/80oxrPxPc9/gpYs1eIJ
	hULb0vfJQwpnUHBNMVNKI4WarIzQ4ccRJ7+uupMPvCYmjC3znWlUiEl3IqWRPqIfIk6oTWNxf5AGq
	8Ge33eOK8ir0F+yRkEXJLiabWA7ol78nl+zFpHbbrk5DkSDUVNZfzj4B/Sr3nILKB1jrmPmWk4kb7
	VND8nTJqvXZoPrpTv86l+OHWBJfVvX3rqxoZjj7XgoXyLC/+pDozi8IMXMQOVmfbPor9dFRPGQ3Te
	oWRn3VvdCedxKAfBZANuU9MnVWHErAaRLtORKV3i+z8ngVy3SmPOdPH5fo7AqbuR1sYcdcgV0vFcW
	F/fsZhpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8yiW-00000006Hfl-0lJ9;
	Thu, 07 Nov 2024 09:22:16 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8ygf-00000006H3Y-1onu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 09:20:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5FB12A430E2;
	Thu,  7 Nov 2024 09:18:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4A5EC4CECC;
	Thu,  7 Nov 2024 09:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730971219;
	bh=MzAtMnBa36cvwhj9J6ISxKGN8qWAOmIs4UqZoAWc1x8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=nzZ/lzqqzJaLDXBN1l74ys9/c85Yaqeq3wvmQOwXthEaMxW+9whlB0DxNEKfhS2fx
	 Vq5nIVqJvNG7wFBdfgljy4080TwcTq9XYX64WLEjrTDhB8vLb81A05E/KD/KyKjYA9
	 Gox8Ev5qFK10ejsUSEHp3Wh7yQ8pKaCDzCIP+vC+wU2yI94zyDnkOzf7JWV9utuV8a
	 XxtMQgat1ye6FLYP15oXodBdo8X4OoSx3bBHxXTTkUVgDxkuY5A5i/7BcScgSjfoiI
	 kdVCjfqM/Y305cuisfX0+snkjIdg0VqzT7nKpwBLJcbsZBwDpKFsOtYMG4AjJaE69o
	 rK41u5M2ZWQfQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 34EE13809A80;
	Thu,  7 Nov 2024 09:20:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net: stmmac: Fix unbalanced IRQ wake disable warning on
 single irq case
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173097122904.1579640.5010342385326557978.git-patchwork-notify@kernel.org>
Date: Thu, 07 Nov 2024 09:20:29 +0000
References: <20241101-stmmac-unbalanced-wake-single-fix-v1-1-5952524c97f0@collabora.com>
In-Reply-To: <20241101-stmmac-unbalanced-wake-single-fix-v1-1-5952524c97f0@collabora.com>
To: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado_=3Cnfraprado=40collabora=2Ecom?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org,
	=?utf-8?q?=3E?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: alexandre.torgue@foss.st.com, joabreu@synopsys.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, horms@kernel.org, maqianga@uniontech.com,
 kernel@collabora.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 angelogioacchino.delregno@collabora.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_012021_555419_E760CB7F 
X-CRM114-Status: UNSURE (   7.92  )
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

This patch was applied to netdev/net.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Fri, 01 Nov 2024 17:17:29 -0400 you wrote:
> Commit a23aa0404218 ("net: stmmac: ethtool: Fixed calltrace caused by
> unbalanced disable_irq_wake calls") introduced checks to prevent
> unbalanced enable and disable IRQ wake calls. However it only
> initialized the auxiliary variable on one of the paths,
> stmmac_request_irq_multi_msi(), missing the other,
> stmmac_request_irq_single().
> 
> [...]

Here is the summary with links:
  - net: stmmac: Fix unbalanced IRQ wake disable warning on single irq case
    https://git.kernel.org/netdev/net/c/25d70702142a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



