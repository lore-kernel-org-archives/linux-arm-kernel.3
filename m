Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C93CDC61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 19:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=y4GQNUdFpM/8BYhKoU+zM8ck7QIDVhdC1WuJTqHJ6sc=; b=QRAaC6Js+rEy18
	4utOecF95fEyC8x9mK8hY4uoFWIXawpZyugJO9MiFGCMCq+ZVFV94OoDOs9qEY8S7B9XzIqkP2+2i
	SKQ2z7+05Wo59tC/UTgmV9JDwScmCXvn2sItK5Ldl8vjiNJzY+tGwNuONqPWuu6zDLaezwGyS9E4Z
	gfKqRP/Gdh5k1/2cTVTAGffZO6Xgbgwp+7tg0iuaP8TM+tkVdksC66tlEbgaYRSR7I8knYBGRvdP1
	lF2aagNmcYDF1A8DjYf4K1bx5i7bEzEZGnO/irvFtNgmzCvYZJBJOrSsZZeq4bAqNn6o+3VXWghqN
	tupsJyBNPSI0/RG2Yr6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Ubr-0000000DGqt-45R6;
	Tue, 01 Sep 2026 19:57:31 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Ubp-0000000DGmo-0cyC;
	Tue, 01 Sep 2026 19:57:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788292643;
	bh=c2iPczLtPVzAMlawjRT1iQ+YfNBlqk2yLxQ0fD8HXv8=;
	h=From:Subject:Date:To:Cc:From;
	b=JVLkvuIiBYqlD8jXgnDZxYeLJZVp44FOH97rQwVJezq4g3p3cq3Vskm3vfhuU7YRn
	 FpGKkdffe7inS1riASp3ckgbTOto2+saVAbB35sfF5ZdwE9NZebiPP0v5OzI+o/SBy
	 hshlsCSg/XzhlTttyUU2DvWRvVSVgGSYE0qKBj2ph0Ok3NjNcT0yuvukAAT0EGDboM
	 utu1QIlNiFZ7VUrA8WZjlzA4DbS92v6vHAb036VbrUuXQHn3yvkHCyTGdt5Q0sKsxv
	 Ht088ufTchxzS6dkl9FKCgopWGlHtfI0G6s1zErOspyp8LpxKnXq/2IfN2HhCgRZGL
	 rHEWCDaShwygg==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0B23D17E0260;
	Tue, 01 Sep 2026 21:57:23 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: [PATCH v2 0/3] phy: hdmi: Add FRL TxFFE level control
Date: Tue, 01 Sep 2026 22:55:12 +0300
Message-Id: <20260901-hdptx-ffe-v2-0-3a5922c76fc5@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22NQQ7CIBQFr9L8tRhKhbSuvIfpgsKvkNRSAUlNw
 93FunDjciYv8zYI6C0GOFcbeEw2WDcXYIcKlJHzDYnVhYFRJmjDWmL0Elcyjkhk2yleoxAdPUH
 ZLx5Hu+6ta/9lj49nScafNDZE51/7X6o/9l861YQS3uCguUbJqLwoN01ycF4elbtDn3N+Azwd5
 yq7AAAA
X-Change-ID: 20260328-hdptx-ffe-a89c51e66904
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>
Cc: kernel@collabora.com, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_125729_343275_44B35CC4 
X-CRM114-Status: UNSURE (   9.59  )
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

During HDMI 2.1 Fixed Rate Link training, the source and sink may
negotiate a Transmitter Feed Forward Equalizer (TxFFE) level to
compensate for signal quality degradation on the physical channel.  The
source starts at level 0 and may increment it up to a maximum agreed
upon during LTS3 in response to persistent link failures reported by the
sink.  TxFFE adjustment is optional and entirely independent of the FRL
rate and lane count selection.

Patch 1 extends the HDMI PHY configuration API with two new fields in
the frl sub-struct: ffe_level to carry the requested level, and a
set_ffe_level flag that switches the semantics of a phy_configure() call
to a pure equalizer update, leaving all other fields ignored.

Patch 2 addresses an issue with the PHY/PLL configuration after
reloading the samsung-hdptx kernel module.

Patch 3 implements the new interface in the Rockchip Samsung HDPTX PHY
driver.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
Changes in v2:
- Added a new patch to fix samsung-hdptx PHY config after module reload
- Rebased series onto v7.3-rc1 and dropped the dependency on the "Clock
  fixes and API transition cleanups" PHY series which already landed
- Link to v1: https://lore.kernel.org/r/20260328-hdptx-ffe-v1-0-53ebd5dea20a@collabora.com

---
Cristian Ciocaltea (3):
      phy: hdmi: Add optional FRL TxFFE config options
      phy: rockchip: samsung-hdptx: Handle PHY config after module reload
      phy: rockchip: samsung-hdptx: Add support for FRL TxFFE level control

 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 80 +++++++++++++++++++++--
 include/linux/phy/phy-hdmi.h                      |  6 ++
 2 files changed, 79 insertions(+), 7 deletions(-)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260328-hdptx-ffe-a89c51e66904


