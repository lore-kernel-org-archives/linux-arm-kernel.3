Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 702E8C982C9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 15:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:Cc:
	To:In-Reply-To:Message-Id:Content-Transfer-Encoding:MIME-Version:Subject:Date
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nXZgelnNzGUrF2EXNePQXIahF9E5vFNeqohz/w8zOho=; b=dgWWdoJ59/V0bZqC4NyHF76k6z
	h67+GieoEKidHiLym9RdE9wfNFNOf092kl51ew/JP+o/ycQ4so8VwyWchFtPZ6wpCAPNuv4N39V8N
	c/mTC5vE+Y1u5QHaMiutET4tdNK9mUSGr80xdklF5DxNPe4ldp5nDHHEWnlDh36bNyv4gRRYhiMC6
	JxKQiB3zpE8/Wr4oXDQoLb4z3fHxKi6V3W/uAwa9qrpPwVJY3zGQmRfPhJSu8af49vYXgx3SZjKok
	jJ4NgUpRLEV3yzs3ld+9J7WSxX1C5VbZkbly7wI9DXp+6QuekRwBr0uxMhGxU08WEhmcBVnsNVqUR
	Hec6VhGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6V9j-00000007Bbq-3fay;
	Tue, 15 Sep 2026 15:33:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6V9A-00000007An8-0zeG;
	Tue, 15 Sep 2026 15:32:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=References:Content-Type:Cc:To:
	In-Reply-To:Message-Id:Content-Transfer-Encoding:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=nXZgelnNzGUrF2EXNePQXIahF9E5vFNeqohz/w8zOho=; b=ZA3O4u9E/iO+1mkJcF6qUS+7bC
	kntjEwojl+onwa6f8bM8zDqfxujXgwCzAJp0KvnoPhUSxFu93E8xapff4d4bkszkEJGXXfI2vmTSC
	DN1oiw/uIfOMiv3YYbaRblo1JHnI4bmHtC/EIAtYncKKdOIn7Ua23l1coWh7FGGMVtiGRjfgspvpz
	pdYZpoZH3VcM982nNQJDS+Tc84OKQK4eyflqEtrMoYxH0iBijN4motd0i76CIPSMCMU+iEF5uzQkA
	0jHLoH8hrwo/eeI4rs7PmJGZNqOqHwqO42Oq8SVuKxxy5YvqnZa6qsrUnpjfAvuWNNu33QoHJzIhT
	2AQD5DHw==;
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6V97-00000006wZd-1cW3;
	Tue, 15 Sep 2026 15:32:35 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260915153232euoutp01f4930296186b2645e39fd5e3e859c991~ViFtEyF8V0794407944euoutp01S;
	Tue, 15 Sep 2026 15:32:32 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260915153232euoutp01f4930296186b2645e39fd5e3e859c991~ViFtEyF8V0794407944euoutp01S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1789486352;
	bh=nXZgelnNzGUrF2EXNePQXIahF9E5vFNeqohz/w8zOho=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=jc/ZUlIg4HTF2p8JCNN3vddFqrI0tBuJoufFr4vD6lhTOFOURDZR3RhjdAZCyzxCp
	 pl2zrFZRwCiDMvoTkuysiEI8YsiLiHR2J7KpgknDqQEAByfogc3TulJH7g7eteqBcN
	 BI+H+kQH3CzVW01Lxx1OtaJEL9iT0cWUjc7uT79I=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260915153231eucas1p1e106fee2d6f7db2aa8bb93d18d0f5dc1~ViFr7_A351220612206eucas1p1O;
	Tue, 15 Sep 2026 15:32:31 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260915153229eusmtip195a81a7500ab28abebd77ec7de0ee7a6~ViFqXgBIs0604306043eusmtip1j;
	Tue, 15 Sep 2026 15:32:29 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Tue, 15 Sep 2026 17:32:18 +0200
Subject: [PATCH v4 10/20] drm/bridge: inno-hdmi: Add .mode_valid platform
 operation
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-jh7110-clean-send-v4-10-f0e4fd6f2cc8@samsung.com>
In-Reply-To: <20260915-jh7110-clean-send-v4-0-f0e4fd6f2cc8@samsung.com>
To: Vinod Koul <vkoul@kernel.org>,  Neil Armstrong
	<neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,  Krzysztof
	Kozlowski <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>, Andrzej
	Hajda <andrzej.hajda@intel.com>,  Robert Foss <rfoss@kernel.org>,  Laurent
	Pinchart <Laurent.pinchart@ideasonboard.com>,  Jonas Karlman
	<jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,  Luca Ceresoli
	<luca.ceresoli@bootlin.com>,  Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,  Lee Jones <lee@kernel.org>, Andy
	Yan <andy.yan@rock-chips.com>,  Philipp Zabel <p.zabel@pengutronix.de>, 
	Emil Renner Berthing <kernel@esmil.dk>,  Hal Feng
	<hal.feng@starfivetech.com>,  Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Heiko Stuebner <heiko@sntech.de>,  Paul
	Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,  Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,  Dominique
	Belhachemi <db@domibel.de>, Brian Masney <bmasney+clk@redhat.com>,  Jerome
	Brunet <jbrunet+clk@baylibre.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	mfd@lists.linux.dev, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-riscv@lists.infradead.org,  Marek Szyprowski
	<m.szyprowski@samsung.com>,  Maud Spierings <maud_spierings@murena.io>, 
	Graham Markall <hello@big-grey.co.uk>,  Icenowy Zheng
	<zhengxingda@iscas.ac.cn>,  Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
	Joshua Peisach <jpeisach@ubuntu.com>,  =?utf-8?q?Uwe_Kleine-K=C3=B6nig?=
	<u.kleine-koenig@baylibre.com>,  Michal Wilczynski
	<m.wilczynski@samsung.com>
X-Mailer: b4 0.15-dev
X-CMS-MailID: 20260915153231eucas1p1e106fee2d6f7db2aa8bb93d18d0f5dc1
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260915153231eucas1p1e106fee2d6f7db2aa8bb93d18d0f5dc1
X-EPHeader: CA
X-CMS-RootMailID: 20260915153231eucas1p1e106fee2d6f7db2aa8bb93d18d0f5dc1
References: <20260915-jh7110-clean-send-v4-0-f0e4fd6f2cc8@samsung.com>
	<CGME20260915153231eucas1p1e106fee2d6f7db2aa8bb93d18d0f5dc1@eucas1p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_163233_564506_ABDB3A0A 
X-CRM114-Status: GOOD (  17.48  )
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

inno_hdmi_bridge_mode_valid() validates the pixel clock against
hdmi->refclk, but that clock is optional and is only present on
platforms that describe a "ref" clock. Platforms where the pixel clock
is produced by a separate device - such as the StarFive JH7110, whose
PHY is both the clock and the PHY provider - have no "ref" clock, so
the check is skipped entirely and every mode is reported as valid.

A mode the platform cannot generate is then advertised to userspace.
The subsequent modeset appears to succeed, since the atomic enable path
cannot fail, and the display silently stays blank.

Add a .mode_valid platform operation so platforms can reject modes they
are unable to drive. Platforms that do not implement it are unaffected.

Reviewed-by: Joshua Peisach <jpeisach@ubuntu.com>
Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 drivers/gpu/drm/bridge/inno-hdmi.c | 9 +++++++++
 include/drm/bridge/inno_hdmi.h     | 5 ++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/inno-hdmi.c b/drivers/gpu/drm/bridge/inno-hdmi.c
index 06917e83c5e530d158a06ae2a877e78e22ed842d..00450250336adb9530894af767034572d775a8df 100644
--- a/drivers/gpu/drm/bridge/inno-hdmi.c
+++ b/drivers/gpu/drm/bridge/inno-hdmi.c
@@ -823,6 +823,7 @@ static enum drm_mode_status inno_hdmi_bridge_mode_valid(struct drm_bridge *bridg
 							const struct drm_display_mode *mode)
 {
 	struct inno_hdmi *hdmi = bridge_to_inno_hdmi(bridge);
+	const struct inno_hdmi_plat_ops *plat_ops = hdmi->plat_data->ops;
 	unsigned long mpixelclk, max_tolerance;
 	long rounded_refclk;
 
@@ -838,6 +839,14 @@ static enum drm_mode_status inno_hdmi_bridge_mode_valid(struct drm_bridge *bridg
 	if (inno_hdmi_find_phy_config(hdmi, mpixelclk) < 0)
 		return MODE_CLOCK_HIGH;
 
+	if (plat_ops && plat_ops->mode_valid) {
+		enum drm_mode_status status;
+
+		status = plat_ops->mode_valid(hdmi->dev, mode);
+		if (status != MODE_OK)
+			return status;
+	}
+
 	if (hdmi->refclk) {
 		rounded_refclk = clk_round_rate(hdmi->refclk, mpixelclk);
 		if (rounded_refclk < 0)
diff --git a/include/drm/bridge/inno_hdmi.h b/include/drm/bridge/inno_hdmi.h
index 5fca651c56b056d814124aa9c7e91aa7fd7ed1cd..1e9974401c39e3773bb339eaec0b45ff1dd9c975 100644
--- a/include/drm/bridge/inno_hdmi.h
+++ b/include/drm/bridge/inno_hdmi.h
@@ -8,15 +8,18 @@
 
 #include <linux/types.h>
 
+#include <drm/drm_modes.h>
+
 struct device;
 struct drm_encoder;
-struct drm_display_mode;
 struct inno_hdmi;
 struct platform_device;
 
 struct inno_hdmi_plat_ops {
 	void (*enable)(struct device *pdev, struct drm_display_mode *mode);
 	void (*disable)(struct device *pdev);
+	enum drm_mode_status (*mode_valid)(struct device *pdev,
+					   const struct drm_display_mode *mode);
 };
 
 struct inno_hdmi_phy_config {

-- 
2.34.1


