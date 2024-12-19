Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C00BDE7718A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 07:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=B6bBnhQ+Yihvnob8cdt9x+XWI3cSDJeBWRRdp8mfg8Y=; b=05I197Rjc0KRZNRDRvVFYfUwWy
	PI7lztYxMiYvRbTI3tptdZuiOrbZlgz+dqp93F82+CfHwjzQjSDeKScZ7qBPt4usSRrzLUS77Yik7
	FOM7rfv6v8LMpkgt1C7FyUtW1RCW4N1kTn6ZeX/wtn6Ej5LCzCGYKCgELReEzJslam81Mn5g4hfl2
	YIKUD1y8gaMK7vZhkgbxhHmRSj2oa+PE0FBxZYkcohRBv5KtDeWn5W7soHDkq/2yhbFIlwx6SHnjl
	8QKa/EoJopzLY6ypXLUDaCwxIemgMTdo2yxoRlKvArAzdGa7g7yNYxtsgAXeJsbL3YOWKsolV0+ao
	UcvzJG4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOBGd-000000019Le-2PFS;
	Thu, 19 Dec 2024 07:48:19 +0000
Received: from m16.mail.163.com ([220.197.31.5])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOB8g-000000017Sd-0tzP;
	Thu, 19 Dec 2024 07:40:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=B6bBn
	hQ+Yihvnob8cdt9x+XWI3cSDJeBWRRdp8mfg8Y=; b=hY1Msfr4b51Z/y2FwVrS7
	wAxtMk3NoMueuRYIgmqhDuj4qdsv1mKFbgOUZUTA1YZQDL9A7EFOvnx3MUm38TlS
	ExzFYbVO7P/3cikxyaXF90nOpEFFnSK38PrHQLfoqiOanDrga29DbVEufYm9SCa4
	eo7i0tP2qNjRxuIvIrK6X4=
Received: from ProDesk.. (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wBnUtq0zWNnL5jUAA--.6492S2;
	Thu, 19 Dec 2024 15:39:36 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: hjc@rock-chips.com,
	krzk+dt@kernel.org,
	sebastian.reichel@collabora.com,
	devicetree@vger.kernel.org,
	daniel@fooishbar.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	derek.foreman@collabora.com,
	detlev.casanova@collabora.com,
	Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v7 0/9] VOP Support for rk3576
Date: Thu, 19 Dec 2024 15:39:08 +0800
Message-ID: <20241219073931.3997788-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wBnUtq0zWNnL5jUAA--.6492S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Zr4Dtry3Kw1UJr48uFWrAFb_yoW8KrW5pa
	98CFyrZrWxGFy2qrs7Jw4UCrWrKFnayayxG393K3WfJ342yry7Kr1a9F15Zr9xX3WxZr4j
	93yfCa47KF42vFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UEeHgUUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqQS6XmdjzK8brAAAsZ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_234006_609860_5D9F33C2 
X-CRM114-Status: GOOD (  12.37  )
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

From: Andy Yan <andy.yan@rock-chips.com>


Here is the V7, because I find that I missed sync with Heiko's
dp+dsi maxclk verification patch[0]:

Patches that have already been merged in V6 are dropped.

PATCH 1~7 are preparations for rk3576 support
PATCH 8~9 are real support for rk376

I test it with a 1080P/4K HDMI output with modetest and weston
output.

If there are some one want to have a try, I have a tree based on
Linux 6.13-rc2 here[1]

[0]https://lore.kernel.org/linux-rockchip/20241115151131.416830-1-heiko@sntech.de/
[1]https://github.com/andyshrk/linux/tree/rk3576-vop2-upstream-v6

Changes in v7:
- Fix rk3588 dp+dsi maxclk verification

Changes in v6:
- Add a blank line after hardware version check code
-  More specific explanation about the AXI_BUS_ID register bit of
   cluster window.

Changes in v5:
- Add axi id configuration
- Remove the non-existent CBCR scale register.

Changes in v4:
- Typo fix: selet->select

Changes in v3:
- Add comments for why we should treat rk3566 with special care.
- Add hardware version check
- Add comments for why we should treat rk3566 with special care.
- ordered by soc name
- Add description for newly added interrupt
- Share the alpha setup function with rk3568
- recoder the code block by soc

Changes in v2:
- split it from main patch add support for rk3576
- Add platform specific callback
- Introduce vop hardware version
- Add dt bindings
- Add platform specific callback

Andy Yan (9):
  drm/rockchip: vop2: Support 32x8 superblock afbc
  drm/rockchip: vop2: Add platform specific callback
  drm/rockchip: vop2: Support for different layer select configuration
    between VPs
  drm/rockchip: vop2: Introduce vop hardware version
  drm/rockchip: vop2: Register the primary plane and overlay plane
    separately
  drm/rockchip: vop2: Set plane possible crtcs by possible vp mask
  drm/rockchip: vop2: Add uv swap for cluster window
  dt-bindings: display: vop2: Add rk3576 support
  drm/rockchip: vop2: Add support for rk3576

 .../display/rockchip/rockchip-vop2.yaml       |   13 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c  | 1454 +++----------
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.h  |  271 ++-
 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c  | 1797 ++++++++++++++++-
 4 files changed, 2307 insertions(+), 1228 deletions(-)

-- 
2.34.1


