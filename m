Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C317CCD4F58
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 18:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TqxUGOZ/wYWUIPRP7I4imgaVseGh4sccLBoBDfsF2Lc=; b=cQOvCRMR2y3F5MgdrU0tbsPqFw
	4/eBwkw8u+D4L4ij3gCWqfB/ZWTLAgL3F1m+Hk0Ki4w54MrXqQlArTXI5YbJdqqbIKBhtRf29F43k
	UDfFtcttGso8Dmg2B2/6r9dSC8ueewqukO9B0ZlrNy53DOB45t5xwxLMc5lTeUtuhCMrfj+lxY+n8
	rooPB1MTRAb5sxbTcnxsZsk/ee+UYXDH/6pQl7MTmHpPZU+BGK/fileV30o6XR+iOPYWb/dT7AnXF
	c3bYuqWxhRYkqd7Rq6AiHFMLFrL9mkNrMyNUeS52WikVDO6DcHenG5d2vuEeehmUql80N2LeQvXIi
	TTZG28ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP2NQ-0000000GW7V-3wcG;
	Mon, 18 May 2026 18:07:40 +0000
Received: from smtp.forwardemail.net ([121.127.44.66])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP2NK-0000000GW1u-3Dwp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 18:07:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: Message-ID: Date: Subject: Cc:
 To: From; q=dns/txt; s=fe-e1b5cab7be; t=1779127650;
 bh=TqxUGOZ/wYWUIPRP7I4imgaVseGh4sccLBoBDfsF2Lc=;
 b=kQNpQsUG/xLWfHAGaEbuG0DbBfkllNwrGTMJsAwKzexJt/XZsdpT4ITS1875gST6Lsq4vZWUR
 3xy1bSu6lEZBpiyfy0KSzqRKX1KyW3WnqTcGhoJAORnL3lyt/cxO0VUBbH7lqf4JQ6ceAI0svyz
 mtdR6MXd/Fv1baXzGhVfQWT309SvTQin2ADLv38tvElDb8VO79xFWSX+9enGdZz7il0XwRciAMg
 RjMt10PqNK6lyBYX6GYsDSElT02bGwow7QLg4gPF3m4C3ZPaBTMvdoDDHUseVdRa1UmhWmx930f
 bzswNn+XcvOJbUi/10M4XVdxGW8exRxGiY9NLfmnBX3A==
X-Forward-Email-ID: 6a0b5560b74b0ebd362ee045
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.66
X-Forward-Email-Version: 2.8.12
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: linux-phy@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH v4 0/2] phy: rockchip: inno-hdmi: Change TMDS rate handling to configure() ops
Date: Mon, 18 May 2026 18:07:19 +0000
Message-ID: <20260518180722.2480799-1-jonas@kwiboo.se>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_110737_655697_A98A6840 
X-CRM114-Status: UNSURE (   9.95  )
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

This series adds support for using phy_validate() and phy_configure()
with this HDMI PHY as an alternative to current in-tree unused way of
using PHY bus width to configure the TMDS character rate.

The only known users that calls phy_set_bus_width() on this PHY are my
out-of-tree HDMI 2.0 patches for Rockchip RK3228/RK3328, i.e. those
originating from LibreELEC (also carried by other distros), the
downstream vendor kernel uses a different implementation that also calls
phy_set_bus_width() on this PHY.

Patch "drm/rockchip: dw_hdmi: Configure HDMI PHY in atomic_mode_set()"
that calls phy_validate() and phy_configure() on this PHY can be found
at [1].

[1] https://lore.kernel.org/dri-devel/20260510183114.1248840-10-jonas@kwiboo.se/

This series is part of a larger multi series effort to:
- phy: rockchip: inno-hdmi: Change TMDS rate handling to configure() ops [v4]
- drm/rockchip: dw_hdmi: Misc cleanup and propagate bus format [v2]
- drm: bridge: dw_hdmi: Misc enable/disable, CEC and EDID cleanup [v7]
- drm/bridge: dw-hdmi: Improve input/output bus format handling
- drm/bridge: dw-hdmi: Convert to a HDMI bridge and use of bridge connector
- drm/bridge: dw-hdmi: Add and use tmds_char_rate_valid() plat data ops
- drm/meson: hdmi: Misc cleanup and use CEC notifier helpers [v1]
- drm/rockchip: dw_hdmi: Enable YCbCr and Deep Color modes
Link to snapshot: https://github.com/Kwiboo/linux-rockchip/commits/next-20260518-rk-hdmi-v5/

Changes in v4:
- Add NULL opts check in validate()
- Only store the opts->hdmi.tmds_char_rate value for later use
- Move comments about expected consumer usage from inline to above the
  functions
Link to v3: https://lore.kernel.org/linux-phy/20260515195512.1757363-1-jonas@kwiboo.se/

Changes in v3:
- Change validate() ops to only validate tmdsclock
- Add comments about expected consumer usage
- Update commit message with a typical call chain
Link to v2: https://lore.kernel.org/linux-phy/20260510095731.1222705-1-jonas@kwiboo.se/

Changes in v2:
- Split into two patches, one that adds new ops and a second that remove
  the old and unused workaround
- Add validate() ops to validate that the TMDS rate is supported
Link to v1: https://lore.kernel.org/linux-phy/20260503172936.194003-1-jonas@kwiboo.se/

Jonas Karlman (2):
  phy: rockchip: inno-hdmi: Add configure() and validate() ops
  phy: rockchip: inno-hdmi: Remove deprecated way to configure TMDS rate

 drivers/phy/rockchip/phy-rockchip-inno-hdmi.c | 71 +++++++++++++++----
 1 file changed, 58 insertions(+), 13 deletions(-)

-- 
2.54.0


