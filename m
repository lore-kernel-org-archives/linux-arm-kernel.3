Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82BFAC56205
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 16:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PBEtqG00000qoISTSaDJxW7MrMY/3zlJT71r5NNxhjE=; b=fovf8XYvn3GbAl5kcZVJz5Zlpq
	5nGw3gBvxbtPj1oT8uqvIBExWjD9sJgIM1vkajotK4HlBjntHXTBIGeRVlzZtnPwEcDBdnCc9a53S
	goLaBidPoc137bFV3lr9x6yn9o9qIRr+HbQ12SGn2ebSv24tOJiNV0/xm6+rqWv19Dg/PrPeweI6M
	u44ajJmIF7Y5Ws2+bGsZtnQbokzEeAiCbKd+J2iEjs+bMEtWE2yyYTY9YGbX9z1s3BQN5nq4RYayJ
	IbElSQ8WrDfEPHn6qtQ57OZkdUZm6vtpvNe0/ip5ZvaD9j8/4islVZL4uj/iA3+IY+VT+pm31gg5T
	Y4VE14xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws0vU-00000006Cqm-0p5a;
	Thu, 06 Aug 2026 16:26:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws0vS-00000006Cpe-3EJH;
	Thu, 06 Aug 2026 16:26:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 770B240F05;
	Thu,  6 Aug 2026 16:26:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FA4C1F000E9;
	Thu,  6 Aug 2026 16:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786033594;
	bh=PBEtqG00000qoISTSaDJxW7MrMY/3zlJT71r5NNxhjE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=UAjhaszyTlpwcrCSp64jNeawOWAiAOHtaAliAFD/1VXoGHP/Ov1PP6b/J2wLrhucW
	 hlIFGf3k8jFSyxJPyN+rxAmC0s2LCZEEeUWm0H2j8C7jOlDO7Vw0hzLJHrtUAQMMQZ
	 C+mjE+wykgrgcrK3EZtzsZyXaNMIT6kQgv13z4zDB2iWGKO5sDTJYGRbUIUlLpSd6k
	 1JxiL2oTnESU/cGtZ356Y32wtFZnB2lGxUgpPoVD1UBpSg7t0PkN1N+4avT1gZikL1
	 oizMvlprgjH5rnjZT/GJv0nRgN0yIVICv1CU009MX4Dv7SC6OH3en3w9p+jVKRAVSn
	 CWdopAUysl3jQ==
From: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Jonas Karlman <jonas@kwiboo.se>
Cc: linux-phy@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260518180722.2480799-1-jonas@kwiboo.se>
References: <20260518180722.2480799-1-jonas@kwiboo.se>
Subject: Re: [PATCH v4 0/2] phy: rockchip: inno-hdmi: Change TMDS rate
 handling to configure() ops
Message-Id: <178603359190.674490.7659482264928277784.b4-ty@kernel.org>
Date: Thu, 06 Aug 2026 21:56:31 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
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


On Mon, 18 May 2026 18:07:19 +0000, Jonas Karlman wrote:
> This series adds support for using phy_validate() and phy_configure()
> with this HDMI PHY as an alternative to current in-tree unused way of
> using PHY bus width to configure the TMDS character rate.
> 
> The only known users that calls phy_set_bus_width() on this PHY are my
> out-of-tree HDMI 2.0 patches for Rockchip RK3228/RK3328, i.e. those
> originating from LibreELEC (also carried by other distros), the
> downstream vendor kernel uses a different implementation that also calls
> phy_set_bus_width() on this PHY.
> 
> [...]

Applied, thanks!

[1/2] phy: rockchip: inno-hdmi: Add configure() and validate() ops
      commit: 58ca6ff31f6e9f5edf2879b5d7dc7485e92a4931
[2/2] phy: rockchip: inno-hdmi: Remove deprecated way to configure TMDS rate
      commit: 4ba747d3d69b12d1221cea23eec9f468ff221cd6

Best regards,
-- 
~Vinod



