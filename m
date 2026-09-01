Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B86ECC624D6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 18:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cvAPigrfMnmxu/EPdsxbVN0y+Pp811oemm+XtiI3nNc=; b=0twilmevzKbSR4wyAQY8UC56D1
	WkTfyAqrt4Jc3PMgRMMnQKR0f2Pl2nk0Qr7EwOiw4sc7Jbj/Sx3f7FE5GWdwXRi93Cqb5RzPpv6T8
	JSrjG0nFCD5TqVCEQr6etz01EwPjhcHSJAKH2lw9Ys8R7nICAEnyOTUqazmoQ1ZH4dcatalQ77LVC
	2olpPcX2OBSIjJ6G6GbRM2lppOEgOCxhte7Tgg9q7jl26y1iz8HymUhi4bGsLjHhVCGiB/B0Ii0k9
	3obxp4w7U1XsKymzCQVgr3L0a3n28i3DqyqlLThJCltdRhGMLDJ4PasgCrL2I9aImVRHwSPqpr4HS
	Zfl8Apeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Tay-0000000D3QS-2r3F;
	Tue, 01 Sep 2026 18:52:34 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1TZW-0000000D0rV-1Rdq;
	Tue, 01 Sep 2026 18:51:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788288660;
	bh=Np7wpAYZLHRt1c9crOqakHGhI+KoSOWphtz4jQaYs5Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JR+grpfvhJdyZRSqjI1L5Q/515KONS70bTEa1h5vxrNspDVf0zlUyN1Zlsc3RQfmT
	 x5CGZiH5ZQfOuAUqLXPaimcWxT7+VXaRCzE1PWdvi/PsrwXFK8zubDyTrpInyAkgzp
	 YLO57D1oCv5ZLmdfNKDzSKtXraBIqSCAdZjZR4Ny9mB1bhiCtP/oHihaPimXriuFWa
	 2KiZnLBL+PC40wHA51pzsNgGFZ5XQWwwyJDABzGuJXcJJXzUeYNF4wrK4s7pK7lt7o
	 OgW9oZptMGxmSoN4pQvYuavaKqc6Z2BL0XZ0ZpSyYALECgrEPLkZhv9/y76bJJo1my
	 XaZOjm8rg+FWw==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5D5DC17E3976;
	Tue, 01 Sep 2026 20:51:00 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 01 Sep 2026 21:50:50 +0300
Subject: [PATCH v11 26/74] drm/bridge: dw-hdmi-qp: Rate limit i2c read
 error messages
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-dw-hdmi-qp-scramb-v11-26-bc12954a0688@collabora.com>
References: <20260901-dw-hdmi-qp-scramb-v11-0-bc12954a0688@collabora.com>
In-Reply-To: <20260901-dw-hdmi-qp-scramb-v11-0-bc12954a0688@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Algea Cao <algea.cao@rock-chips.com>, 
 Daniel Stone <daniels@collabora.com>, Liu Ying <victor.liu@nxp.com>, 
 Phong LE <ple@baylibre.com>, Helge Deller <deller@gmx.de>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org, 
 linux-fbdev@vger.kernel.org, Maud Spierings <maud_spierings@hotmail.com>, 
 Diederik de Haas <diederik@cknow-tech.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_115102_587602_727D2EBC 
X-CRM114-Status: GOOD (  10.82  )
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

During EDID reads, repeated i2c errors can flood the kernel log:

[   25.361716] dwhdmiqp-rockchip fde80000.hdmi: i2c read error
[   25.363376] dwhdmiqp-rockchip fde80000.hdmi: i2c read error
...
[   25.368671] dwhdmiqp-rockchip fde80000.hdmi: i2c read error
[   25.369440] dwhdmiqp-rockchip fde80000.hdmi: failed to get edid

Switch to dev_err_ratelimited() in dw_hdmi_qp_i2c_read() to reduce log
spam while still reporting the condition.

Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Tested-by: Maud Spierings <maud_spierings@hotmail.com>
Tested-by: Diederik de Haas <diederik@cknow-tech.com>  # NanoPC-T6 LTS, Rock 5B
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
index cfd1b18c06e6..7475b6b71836 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
@@ -561,7 +561,7 @@ static int dw_hdmi_qp_i2c_read(struct dw_hdmi_qp *hdmi,
 				dev_dbg_ratelimited(hdmi->dev,
 						    "i2c read timed out\n");
 			else
-				dev_err(hdmi->dev, "i2c read timed out\n");
+				dev_err_ratelimited(hdmi->dev, "i2c read timed out\n");
 			dw_hdmi_qp_write(hdmi, 0x01, I2CM_CONTROL0);
 			return -EAGAIN;
 		}
@@ -572,7 +572,7 @@ static int dw_hdmi_qp_i2c_read(struct dw_hdmi_qp *hdmi,
 				dev_dbg_ratelimited(hdmi->dev,
 						    "i2c read error\n");
 			else
-				dev_err(hdmi->dev, "i2c read error\n");
+				dev_err_ratelimited(hdmi->dev, "i2c read error\n");
 			dw_hdmi_qp_write(hdmi, 0x01, I2CM_CONTROL0);
 			return -EIO;
 		}

-- 
2.55.0


