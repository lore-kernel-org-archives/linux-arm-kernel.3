Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 325DFC54F54
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 10:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uuRw5hJ2mftHt1u3eDzEgfPNP6kuHelSAGaazRJn7TM=; b=zzbdeHMOf9QEydztq+d6U8FqGX
	LpkFgPZd8KWg38Nlh1se0c9bFKkUjKO103fPX0TXAiI82ZIe8WNTQ2lCM3bwMpzYEDO+BDuQP9OTW
	0AtCqBc80HS5/TsjWth/GDBaG6Y5klrYvHn3GDe8dU35j45iXyXsY27yplr0PPuROsZUlrRAGDGsb
	44YdZ/qPyxdBDssxPk7Xpxjdk1IdBrVWeLpkt/TlT/JTDzZE/Fc1TwpLFAe3p+zRh2acb9xuQh/5+
	gH5QTPlU9mdXlRV6S4iy3cOQchdfaGT5WogNXNYZkYQZVy3kIiqZPrBvVs837PuMKWPb7aSMF77iM
	OD+K0poA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpkXw-0000000CK6G-3BAg;
	Fri, 31 Jul 2026 10:32:56 +0000
Received: from out-172.mta0.migadu.com ([2001:41d0:1004:224b::ac])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpkXt-0000000CK5k-1oWv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 10:32:55 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow-tech.com;
	s=key1; t=1785493969;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uuRw5hJ2mftHt1u3eDzEgfPNP6kuHelSAGaazRJn7TM=;
	b=Lv4Fq626JJBk/C3kc8zkrhqDPdUjL6bzyFEeyMQaBLrw1+uxbdtBz7qhsf/5sU16eP0lkl
	sM7bvwh9C1aeBzNbIXFTt9X3TnZu40JdLyC9Q5OpkjaSjZxxAyhKr/8wlGfnlN+6mAESl9
	wTJnhv5EtsG/+7LZloPJteLS28VJCfPSHqy33X6SSMvRAzL7oLixWdrV+X7RCEmC3p0AR0
	Y91AxOxqQR1FezH9v33+gOEDQZoTSWfnpSp7iFWcdB+igEBKy8L82X9wlQBmVOUvUP4r5V
	NWV9oS45FLj6cawfvdMEcckv+bN9jkZkD0ribPfYbdINDH08cF3zfKcZ/bjsBA==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 31 Jul 2026 12:32:44 +0200
Message-Id: <DKCOSBPTPW3J.IG1FJHK4C2OY@cknow-tech.com>
Cc: <linux-phy@lists.infradead.org>, <linux-rockchip@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 0/2] phy: rockchip: inno-hdmi: Change TMDS rate
 handling to configure() ops
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <diederik@cknow-tech.com>
To: "Jonas Karlman" <jonas@kwiboo.se>, "Vinod Koul" <vkoul@kernel.org>,
 "Neil Armstrong" <neil.armstrong@linaro.org>, "Heiko Stuebner"
 <heiko@sntech.de>
References: <20260518180722.2480799-1-jonas@kwiboo.se>
In-Reply-To: <20260518180722.2480799-1-jonas@kwiboo.se>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_033254_121763_48F1BCA2 
X-CRM114-Status: GOOD (  17.86  )
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

On Mon May 18, 2026 at 8:07 PM CEST, Jonas Karlman wrote:
> This series adds support for using phy_validate() and phy_configure()
> with this HDMI PHY as an alternative to current in-tree unused way of
> using PHY bus width to configure the TMDS character rate.
>
> The only known users that calls phy_set_bus_width() on this PHY are my
> out-of-tree HDMI 2.0 patches for Rockchip RK3228/RK3328, i.e. those
> originating from LibreELEC (also carried by other distros), the
> downstream vendor kernel uses a different implementation that also calls
> phy_set_bus_width() on this PHY.

Tested-by: Diederik de Haas <diederik@cknow-tech.com>  # Rock64

> Patch "drm/rockchip: dw_hdmi: Configure HDMI PHY in atomic_mode_set()"
> that calls phy_validate() and phy_configure() on this PHY can be found
> at [1].
>
> [1] https://lore.kernel.org/dri-devel/20260510183114.1248840-10-jonas@kwi=
boo.se/
>
> This series is part of a larger multi series effort to:
> - phy: rockchip: inno-hdmi: Change TMDS rate handling to configure() ops =
[v4]
> - drm/rockchip: dw_hdmi: Misc cleanup and propagate bus format [v2]
> - drm: bridge: dw_hdmi: Misc enable/disable, CEC and EDID cleanup [v7]
> - drm/bridge: dw-hdmi: Improve input/output bus format handling
> - drm/bridge: dw-hdmi: Convert to a HDMI bridge and use of bridge connect=
or
> - drm/bridge: dw-hdmi: Add and use tmds_char_rate_valid() plat data ops
> - drm/meson: hdmi: Misc cleanup and use CEC notifier helpers [v1]
> - drm/rockchip: dw_hdmi: Enable YCbCr and Deep Color modes
> Link to snapshot: https://github.com/Kwiboo/linux-rockchip/commits/next-2=
0260518-rk-hdmi-v5/
>
> Changes in v4:
> - Add NULL opts check in validate()
> - Only store the opts->hdmi.tmds_char_rate value for later use
> - Move comments about expected consumer usage from inline to above the
>   functions
> Link to v3: https://lore.kernel.org/linux-phy/20260515195512.1757363-1-jo=
nas@kwiboo.se/
>
> Changes in v3:
> - Change validate() ops to only validate tmdsclock
> - Add comments about expected consumer usage
> - Update commit message with a typical call chain
> Link to v2: https://lore.kernel.org/linux-phy/20260510095731.1222705-1-jo=
nas@kwiboo.se/
>
> Changes in v2:
> - Split into two patches, one that adds new ops and a second that remove
>   the old and unused workaround
> - Add validate() ops to validate that the TMDS rate is supported
> Link to v1: https://lore.kernel.org/linux-phy/20260503172936.194003-1-jon=
as@kwiboo.se/
>
> Jonas Karlman (2):
>   phy: rockchip: inno-hdmi: Add configure() and validate() ops
>   phy: rockchip: inno-hdmi: Remove deprecated way to configure TMDS rate
>
>  drivers/phy/rockchip/phy-rockchip-inno-hdmi.c | 71 +++++++++++++++----
>  1 file changed, 58 insertions(+), 13 deletions(-)


