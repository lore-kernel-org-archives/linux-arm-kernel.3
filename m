Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55247C79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 14:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9sR4iCDNmPmuLycqrtaPoXOdVxq9vF8KjjQ+eF2z45Y=; b=m6rNEJVQSTPakvvp30CeF5vFzs
	EJTUBag2RC8TMreKuZ+HK913dfFmGPwvhseKoKoC/Kt4Eha3bnurGjyy4lvSdlnvqeTFHD4xo+sz3
	B7cRRHiQdRStqNzUn+90VRiKFf400KmzO1r5AYPjhiVyOnl42ewzi/QNCjwvdxOmdoleYHDKbTi8q
	rofRoLwnNBDApaAFyL8/RJ5+PIqqsbfPwbD7DQY21MbluscLaShA9dWLrHagWOaVGp79qCKHLxLM+
	LVH7rlpT7BJ1dD3c0kcoTy3bzUqvIVFv3Ml0fzgrYTqPhNrctif7nBErX0P1eSVj2Fx3U4n1C+ifR
	guRYnoww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4fU6-0000000EaSY-1SEK;
	Thu, 10 Sep 2026 14:10:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4fU4-0000000EaSL-3hMZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 14:10:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0922E60213;
	Thu, 10 Sep 2026 14:10:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A62FC1F000FF;
	Thu, 10 Sep 2026 14:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789049435;
	bh=9sR4iCDNmPmuLycqrtaPoXOdVxq9vF8KjjQ+eF2z45Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=WOEp4x1++BsXDfyTPXTDS4gmVFX7J2ksk9lukdERrQLJxB2SKNofdAWP9wGSvBEhO
	 tC3006JjZtardegEGy/OALXz/UR69TACxhMazYNtw7lbQIKz8dlbIU71FndxUDL4p0
	 ixr1puTbO/JgAXIAScwYvUVOSuARgamABHJqdNGNgcvJzNXK4tmDvb/0ng2b3dy2Pi
	 v/ll+G0ZwlY/SweT7j1HKshx0ckV+E4JzVL2pXyvgVilgz5qfRbFPGz04Gbc7Wb/A4
	 mpnQYfbefzYMV8A8IthZxOBWhS98UqiJC+jmceoouDnnNmDcwDNVKaJ0j1UXx9SI+R
	 xp7jmkf/jq3ow==
From: Vinod Koul <vkoul@kernel.org>
To: dmaengine@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>, 
 Frank Li <Frank.Li@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260908212607.590224-1-rosenp@gmail.com>
References: <20260908212607.590224-1-rosenp@gmail.com>
Subject: Re: [PATCH] dmaengine: at_hdmac: use devm_clk_get_enabled()
Message-Id: <178904943321.118320.1490189042723625622.b4-ty@kernel.org>
Date: Thu, 10 Sep 2026 19:40:33 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
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


On Tue, 08 Sep 2026 14:26:07 -0700, Rosen Penev wrote:
> Replace the devm_clk_get() + clk_prepare_enable() pair with
> devm_clk_get_enabled(), which handles enable/disable and the
> unprepare on driver detach automatically.  This lets us drop the
> err_irq cleanup label and the clk_disable_unprepare() calls in
> probe error paths and at_dma_remove().
> 
> 
> [...]

Applied, thanks!

[1/1] dmaengine: at_hdmac: use devm_clk_get_enabled()
      commit: d882935a2ca4457f6f446b02d7d08134cd9d4582

Best regards,
-- 
~Vinod



