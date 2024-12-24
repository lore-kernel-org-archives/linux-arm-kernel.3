Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7733CE77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Dec 2024 15:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lf6gcnM3g8lkBnLKp4mgwxo/DiXFRE58WlvSLJBWyqs=; b=CfMSgcNiIt50+krvX0ryk0RBu5
	C9eKd9ben0Z8MxsQLGiN/P9cHCkShAxJ0XXypiuuDYiHayubGptyQiseyCbD3nkCmLpeoGNnRs8lN
	MsHFyIOBbbIbWHXCASUpEmn0vK+D3EzMt5CYxpGfTJ4Xjzu2XEk8Brth/V2BchxlVdIm5UWlf9EJz
	DmI2Rr+PAthnn7+Sci9UMcdthxTR4/PA5W5YEVT9OCA8+BrjTGEnMIEEIe6XZKvTfIQBnoTP17Mlm
	1ZaDxSoijV39R5ElhxMOLcoi1/sQnYF1rEnPBxSPaHkNQa7hs+GhRrsGEbttje375vV/d7HnLh4NG
	khIf2mdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ6kW-0000000CCn4-2RSL;
	Tue, 24 Dec 2024 15:23:08 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ6jJ-0000000CCf4-1O8t;
	Tue, 24 Dec 2024 15:21:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 535B7A4136F;
	Tue, 24 Dec 2024 15:20:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF058C4CED4;
	Tue, 24 Dec 2024 15:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735053712;
	bh=yvTwjcPFCXziWoCEwTpDuRjia4TlhnWYZlHomyZyD3U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=syy2uPPSD382zy5qOsps++x06T4mrQH7DQIBBO/sJcSiGIwYwl0LX4FG4Jk4NRRuq
	 5stayDWxJrqpP+rwCKcqsNS302Jgsb05Iez/tT6NFqwaffH8zXyLBjERgyGNmx+FYw
	 SE0y2+eGeWwfUcLKMYk6hrEpZ7OiUJmz+0MoZHrJ9FXeVDBBpOTK1QBUspqxHWBYsO
	 IPR3EgDaMDvZ1dtOMIMD3H89Br8eFfH6bLgCnR3Jd4VCU9htvgZ1TWcIR+D7+3Vb1S
	 kSy9m13ctPRLD1a8OiATUublr0OaZDT31ofxM9aYheTeEb3UaMsbOjEJErMcXNAazo
	 SOVNoCzMoteNQ==
From: Vinod Koul <vkoul@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Phi-bang Nguyen <pnguyen@baylibre.com>, 
 Jacob Keller <jacob.e.keller@intel.com>, 
 Daniel Golle <daniel@makrotopia.org>, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20241213083056.2596499-1-arnd@kernel.org>
References: <20241213083056.2596499-1-arnd@kernel.org>
Subject: Re: [PATCH] phy: mediatek: phy-mtk-hdmi: add regulator dependency
Message-Id: <173505370834.939749.17404501549961037412.b4-ty@kernel.org>
Date: Tue, 24 Dec 2024 20:51:48 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_072153_446947_4F105F06 
X-CRM114-Status: UNSURE (   5.09  )
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


On Fri, 13 Dec 2024 09:30:51 +0100, Arnd Bergmann wrote:
> The driver no longer builds when regulator support is unavailable:
> 
> arm-linux-gnueabi-ld: drivers/phy/mediatek/phy-mtk-hdmi.o: in function `mtk_hdmi_phy_register_regulators':
> phy-mtk-hdmi.c:(.text.unlikely+0x3e): undefined reference to `devm_regulator_register'
> arm-linux-gnueabi-ld: drivers/phy/mediatek/phy-mtk-hdmi-mt8195.o: in function `mtk_hdmi_phy_pwr5v_is_enabled':
> phy-mtk-hdmi-mt8195.c:(.text+0x326): undefined reference to `rdev_get_drvdata'
> arm-linux-gnueabi-ld: drivers/phy/mediatek/phy-mtk-hdmi-mt8195.o: in function `mtk_hdmi_phy_pwr5v_disable':
> phy-mtk-hdmi-mt8195.c:(.text+0x346): undefined reference to `rdev_get_drvdata'
> arm-linux-gnueabi-ld: drivers/phy/mediatek/phy-mtk-hdmi-mt8195.o: in function `mtk_hdmi_phy_pwr5v_enable':
> 
> [...]

Applied, thanks!

[1/1] phy: mediatek: phy-mtk-hdmi: add regulator dependency
      commit: 17194c2998d39ab366a2ecbc4d1f3281e00d6a05

Best regards,
-- 
~Vinod



