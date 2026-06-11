Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1D0FCD98CC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 11:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jt/4CoziO1pfujnzGp8Dx/334/iuWrZI1G8H43vKVzU=; b=X23YjrO2kG5m+/S/xmmo8GEtUU
	wC+/0nObX0e/ery1BF0XT0EtwJccCZY6oMK9xkNQ8xtd6AZKpxJeTdAHFJGA5Bf9ufjuXNGj+REzV
	aVd0cuoOL+u4L2EZMEsC/+Yx5llRcTXUaucixwgmC0c5G7fgjXc3xyd3biQpUxpAibpsybN0s2oSJ
	D5M6QM62huLLzHqWo1pNPeedFQ5OvGMr/8m1nZeLcZGF9Vl2rjMCjAXtXNersu/xtKumLcIQidlI1
	/Zw1pQCZGERceKao5zkbb+GxS0XRzsgb6eIA1KgjodJ/ES4MZ47DOe3De0g8RDRYWWgD7+l6QGg+G
	SEWiUmkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXdYM-00000009J5a-2EJR;
	Thu, 11 Jun 2026 11:26:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXdYK-00000009J5L-45Jj;
	Thu, 11 Jun 2026 11:26:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E69D760098;
	Thu, 11 Jun 2026 11:26:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDE651F00893;
	Thu, 11 Jun 2026 11:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781177187;
	bh=jt/4CoziO1pfujnzGp8Dx/334/iuWrZI1G8H43vKVzU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=byfHpEwlcUt9heMsyrQH4N9eBo6mUbveEBwEpCRSBIcZrJBykhJLF8NObO9WSzETZ
	 zWQLO1lolxvUZcl/j7ihhMOrCAs/BYEvbNeHnh3PGDn3efBgBY/Pff2IK2xU+AhV7t
	 uZMVrWESFygYvONgEEssIB6/sUTxtTyrAaXuLW4Jqa+FhzWHkTiweMvz8KbVsza9Dk
	 BmjWNsH5I9VoCTfQEuG9PO3KpM+TnVms0LXGSXYyC9WJjLps7uTvsQQ0LfLEvMpO8H
	 afgm85GUgv8xLs3HqszPJTP5Rp7CyVMngjHVr3eAksR4TJ+O/zdz3tsEmghAasKPXp
	 08Cg2GCtl2nUQ==
Date: Thu, 11 Jun 2026 16:56:23 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Algea Cao <algea.cao@rock-chips.com>,
	Dmitry Baryshkov <lumag@kernel.org>, kernel@collabora.com,
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	Thomas =?iso-8859-1?Q?Niederpr=FCm?= <dubito@online.de>,
	Simon Wright <simon@symple.nz>
Subject: Re: [PATCH v2 0/6] phy: rockchip: samsung-hdptx: Clock fixes and API
 transition cleanups
Message-ID: <aiqbX8kon8HtiSEl@vaman>
References: <20260511-hdptx-clk-fixes-v2-0-664e41379cab@collabora.com>
 <e0eeb794-11b9-4ba6-bee2-f6cc607d3a16@collabora.com>
 <ebcad67e-e14a-4d0e-b3e0-79ae1d146eaf@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ebcad67e-e14a-4d0e-b3e0-79ae1d146eaf@collabora.com>
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

On 03-06-26, 13:27, Cristian Ciocaltea wrote:
> On 5/20/26 10:05 PM, Cristian Ciocaltea wrote:
> > Hi Vinod,
> > 
> > On 5/11/26 9:21 PM, Cristian Ciocaltea wrote:
> >> This series provides a set of bug fixes and cleanups for the Rockchip
> >> Samsung HDPTX PHY driver.
> >>
> >> The first part of the series (i.e. PATCH 1 & 2) addresses clock rate
> >> calculation and synchronization issues.  Specifically, it fixes edge
> >> cases where the PHY PLL is pre-programmed by an external component (like
> >> a bootloader) or when changing the color depth (bpc) while keeping the
> >> modeline constant.  Because the Common Clock Framework .set_rate()
> >> callback might not be invoked if the pixel clock remains unchanged, this
> >> previously led to out-of-sync states between CCF and the actual HDMI PHY
> >> configuration.
> >>
> >> The second part focuses on code cleanups and modernizing the register
> >> access.  Now that dw_hdmi_qp driver has fully switched to using
> >> phy_configure(), we can drop the deprecated TMDS rate setup workarounds
> >> and the restrict_rate_change flag logic.  Finally, it refactors the
> >> driver to consistently use standard bitfield macros.
> >>
> >> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> >> ---
> >> Changes in v2:
> >> - Collected Tested-by tags from Thomas and Simon
> >> - Fixed a typo in commit description of patch 1
> >> - Added a comment in patch 2 explaining why PLL config errors are
> >>   ignored for rk_hdptx_phy_consumer_get()
> >> - Added a missed FIELD_GET conversion for lcpll_hw.pms_sdiv in patch 6
> >> - Rebased onto latest phy/fixes
> >> - Link to v1: https://lore.kernel.org/r/20260227-hdptx-clk-fixes-v1-0-f998f2762d0f@collabora.com
> > 
> > In case you missed my comments from last week on the Sashiko AI review findings
> > - in short, I don't think there is anything to worry about and the series should
> > be fine to apply as-is.  Please let me know if you would still prefer a new
> > revision.
> Kind reminder..

Please post a new revision based on phy/next

Thanks
-- 
~Vinod

