Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC48AC982C3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 15:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:Cc:
	To:In-Reply-To:Message-Id:Content-Transfer-Encoding:MIME-Version:Subject:Date
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wBtYFL7Kwh/AbWkuFD4cnzdIXUhpc1coZlgIzXoyZCE=; b=BPvZU4MvSTqooLNJYXFG9v1Im3
	4BEkFo5DDPtN3NqfcyjXZGRXkvidgTBlBxbfHTxHw+WIUC5RpVzF2AbZYVQHZ9x0VpQJlONHNF864
	ewG9wSuayMvMMbBkr7nBwXhQLLtolFkuYq1pd7GhrKt+vA2+T6DWpVXF7UwvlO0Nc0JnXSqpDpdjC
	fnzdXD8Rs9DeBN1IuLSLTNyucKAFyO4VlArDa4sJS01uUENNjQcmO/9AvgAz+TdIULRX+o6as1ta7
	0wsjIXUcCoUt8emIeB2UX6zAMI/IfknRYDX/VW4iwOP323BHRX+9WjEeV0J3r6ygN/7zIjnVPbx1l
	Lo1Q3X0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6V9s-00000007Bu5-21uD;
	Tue, 15 Sep 2026 15:33:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6V9A-00000007Aop-3pHC;
	Tue, 15 Sep 2026 15:32:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=References:Content-Type:Cc:To:
	In-Reply-To:Message-Id:Content-Transfer-Encoding:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=wBtYFL7Kwh/AbWkuFD4cnzdIXUhpc1coZlgIzXoyZCE=; b=QArmnyT689fhinQNkZ+3tTv7/U
	uSTii5TZC/HN0CgZULw+tE/6HbNkv9kkYdZLCeQT+n1+Ebky3pYVDfVu7obMWSD4UjC7LBnD3qRPf
	Mp3vxnYg+e+JBvRHQ8rl4n3s73ILYU6vrzhxw19HI2Dzxi5+DvWCu0BZXxm6m/hYlUtzUNCqTj+1A
	n4LkykbJFCns/YD934lrbixF+u6Vntx5SA6qKfHbDUNDgmXY03SIQjxAtvo/WVHqtIwWYBsOvHE6G
	JBpNMBWL8EX8o5KBgckpIDZNeOxBQB+GzgdbnOZGzqF+cXdkjp3Cd3/9i1Tao12sVIBcEelm4knF8
	l6Lif8Fw==;
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6V98-00000006wZs-0MWv;
	Tue, 15 Sep 2026 15:32:35 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260915153233euoutp0259e286e9af0cf0d264a1c1e31ac813b8~ViFtz4m1G0392703927euoutp02f;
	Tue, 15 Sep 2026 15:32:33 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260915153233euoutp0259e286e9af0cf0d264a1c1e31ac813b8~ViFtz4m1G0392703927euoutp02f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1789486353;
	bh=wBtYFL7Kwh/AbWkuFD4cnzdIXUhpc1coZlgIzXoyZCE=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=ocfrQhyKMWqfPqUCqCUm/qU0dZHDc4Qz5esQj5h4UZpnVumDskYMo/K8UcdPEBiB0
	 s+lZbkP50jAqCBJslsLZ+IrsUkPOfNM8mFuHK18fIaTvziMjQ+ZygszENY+bE4j9X1
	 caLSgd2U3Iff5Ywv2XSbVR9FSgiM4udMdDgK9MAo=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260915153233eucas1p2e26a6953a31c5f836aeaed03a4ae325e~ViFtkl1xC1214912149eucas1p2e;
	Tue, 15 Sep 2026 15:32:33 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260915153231eusmtip19a6ca86b35c8d62c1324b24637525198~ViFr-1w1n0336503365eusmtip1x;
	Tue, 15 Sep 2026 15:32:31 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Tue, 15 Sep 2026 17:32:19 +0200
Subject: [PATCH v4 11/20] drm/bridge: inno-hdmi: Make the PHY configuration
 table optional
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-jh7110-clean-send-v4-11-f0e4fd6f2cc8@samsung.com>
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
X-CMS-MailID: 20260915153233eucas1p2e26a6953a31c5f836aeaed03a4ae325e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260915153233eucas1p2e26a6953a31c5f836aeaed03a4ae325e
X-EPHeader: CA
X-CMS-RootMailID: 20260915153233eucas1p2e26a6953a31c5f836aeaed03a4ae325e
References: <20260915-jh7110-clean-send-v4-0-f0e4fd6f2cc8@samsung.com>
	<CGME20260915153233eucas1p2e26a6953a31c5f836aeaed03a4ae325e@eucas1p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_163234_226132_2D40186F 
X-CRM114-Status: GOOD (  14.97  )
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

The pre-emphasis and drive-strength values in inno_hdmi_phy_config, and
the registers they are written to, belong to the PHY integrated into the
controller. A platform whose PHY is a separate device has neither, and
its own .mode_valid already validates the pixel clock against the real
PHY, so the table only bounds the generic check.

Let such a platform omit the table: skip the integrated-PHY register
writes in the power-up path and the table lookup in .mode_valid when it
is absent. Platforms that supply one are unaffected.

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 drivers/gpu/drm/bridge/inno-hdmi.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/bridge/inno-hdmi.c b/drivers/gpu/drm/bridge/inno-hdmi.c
index 00450250336adb9530894af767034572d775a8df..0988775e7e4881a84f59efda8465ad4d5e61b4cd 100644
--- a/drivers/gpu/drm/bridge/inno-hdmi.c
+++ b/drivers/gpu/drm/bridge/inno-hdmi.c
@@ -538,8 +538,14 @@ static void inno_hdmi_power_up(struct inno_hdmi *hdmi,
 			       unsigned long mpixelclock)
 {
 	struct inno_hdmi_phy_config *phy_config;
-	int ret = inno_hdmi_find_phy_config(hdmi, mpixelclock);
+	int ret;
+
+	inno_hdmi_sys_power(hdmi, false);
+
+	if (!hdmi->plat_data->phy_configs)
+		goto out;
 
+	ret = inno_hdmi_find_phy_config(hdmi, mpixelclock);
 	if (ret < 0) {
 		phy_config = hdmi->plat_data->default_phy_config;
 		DRM_DEV_ERROR(hdmi->dev,
@@ -549,8 +555,6 @@ static void inno_hdmi_power_up(struct inno_hdmi *hdmi,
 		phy_config = &hdmi->plat_data->phy_configs[ret];
 	}
 
-	inno_hdmi_sys_power(hdmi, false);
-
 	hdmi_writeb(hdmi, HDMI_PHY_PRE_EMPHASIS, phy_config->pre_emphasis);
 	hdmi_writeb(hdmi, HDMI_PHY_DRIVER, phy_config->voltage_level_control);
 	hdmi_writeb(hdmi, HDMI_PHY_SYS_CTL, 0x15);
@@ -560,6 +564,7 @@ static void inno_hdmi_power_up(struct inno_hdmi *hdmi,
 	hdmi_writeb(hdmi, HDMI_PHY_SYNC, 0x00);
 	hdmi_writeb(hdmi, HDMI_PHY_SYNC, 0x01);
 
+out:
 	inno_hdmi_sys_power(hdmi, true);
 };
 
@@ -836,7 +841,8 @@ static enum drm_mode_status inno_hdmi_bridge_mode_valid(struct drm_bridge *bridg
 	if (mpixelclk < HDMI_TMDS_CHAR_RATE_MIN_HZ)
 		return MODE_CLOCK_LOW;
 
-	if (inno_hdmi_find_phy_config(hdmi, mpixelclk) < 0)
+	if (hdmi->plat_data->phy_configs &&
+	    inno_hdmi_find_phy_config(hdmi, mpixelclk) < 0)
 		return MODE_CLOCK_HIGH;
 
 	if (plat_ops && plat_ops->mode_valid) {
@@ -1118,11 +1124,6 @@ struct inno_hdmi *inno_hdmi_probe(struct platform_device *pdev,
 	int irq;
 	int ret;
 
-	if (!plat_data->phy_configs || !plat_data->default_phy_config) {
-		dev_err(dev, "Missing platform PHY ops\n");
-		return ERR_PTR(-ENODEV);
-	}
-
 	hdmi = devm_drm_bridge_alloc(dev, struct inno_hdmi, bridge, &inno_hdmi_bridge_funcs);
 	if (IS_ERR(hdmi))
 		return ERR_CAST(hdmi);

-- 
2.34.1


