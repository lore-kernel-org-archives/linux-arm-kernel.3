Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0237CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 00:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K2iyy0bndyVfIo/l5h1EmF5byJvdXSsULUMj/YdoEZU=; b=QTlLRqvy/NCuEcwDtbehS8r67H
	hw1ZUo/RoT4ufa0maAu3WkZBlAEkJBeTgdOyI6EGHcJDx09WXB2W99HQNZFEvF3H8IMV8uHFnV3hC
	1QnGU62daRLmo9rnkdGy/qeRRXGFhge79ZMRAluW5tG7A1tnsyk1ExgGhRFY2whPQlsUzvUOBR/RE
	VL6roYiS+AZnPDFICQ61BoTJ7Y7Od0vhbBcF3Npe0GNKdUBEdSpx0GOddnCnOqj4d7tCYYL9M5QAy
	lYDHggSOP/INExXZap9vViRWlCqHhWedoe7Z2291CS1hT2HUljnpQdFA+ViNfjJGvuH9gNZBEmBUq
	CDIJ5fxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBhth-00000004nRc-2UOt;
	Wed, 30 Sep 2026 00:10:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBhtf-00000004nRS-1Hs2;
	Wed, 30 Sep 2026 00:10:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A3E2743FB2;
	Wed, 30 Sep 2026 00:10:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 838491F00893;
	Wed, 30 Sep 2026 00:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790727006;
	bh=K2iyy0bndyVfIo/l5h1EmF5byJvdXSsULUMj/YdoEZU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=H+XW6g7Cp/FuHIuWcfQ25h+zkUZ4aDZaCyeTlgkFFwIaQCLYGipBFXR8Vwu2uhNFk
	 YlD7gvgY5tFPcYPL5rW/staR1j8mrsTrIXfpUpzrw6MVuSSc6RP7rjYBeTmccol+bX
	 y365kIcOe+CEEmwmw4WCRnlbz3+lhSII1Asd8T+Wjf5TztsB9SuDndQ2I65DbhJsx6
	 axWpS2PefEXlqEoYw1ZCrPhmVBuzJDPMWkPOxSk4AdYYPkBe8PQNdxkR7vzpWaxfxg
	 OqfOgI2q8bvxMb1HE3A8BrV8Oc9gtmFS6C/B3dmozFbvBnTSzdPg3Yv+CKAWhH/Cm5
	 dbpZQSMSypqkg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7743B3808209;
	Wed, 30 Sep 2026 00:10:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net: dsa: use regmap_assign_bits() for conditional
 set/clear
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <179072700504.1174822.271135710444572357.git-patchwork-notify@kernel.org>
Date: Wed, 30 Sep 2026 00:10:05 +0000
References: <20260924083538.461887-1-peng.fan@oss.nxp.com>
In-Reply-To: <20260924083538.461887-1-peng.fan@oss.nxp.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: hauke@hauke-m.de, andrew@lunn.ch, olteanv@gmail.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 chester.a.unal@arinc9.com, daniel@makrotopia.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, ansuelsmth@gmail.com,
 linux-kernel@vger.kernel.org, peng.fan@nxp.com, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
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

On Thu, 24 Sep 2026 16:35:37 +0800 you wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Replace if/else blocks using regmap_set_bits()/regmap_clear_bits() with
> the simpler regmap_assign_bits() calls in the lantiq gswip, mt7530 and
> qca8k drivers.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> 
> [...]

Here is the summary with links:
  - net: dsa: use regmap_assign_bits() for conditional set/clear
    https://git.kernel.org/netdev/net-next/c/679950fedec7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



