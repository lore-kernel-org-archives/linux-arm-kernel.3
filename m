Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8713ECD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 13:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yyfn1S+kqiM446gPjFcTdH4PcJ3eABMwrZuUaedQslE=; b=w44Ieni9y8DJIwveWlfN/az+K0
	9Qx7LEGRbzvpjBkMhjuTUBocxGBIqgP3l/rY27VwHnVq3CiVa/6KFHY32jCroQ0e4edh2ot2o9V71
	DeUDlLhEpo8u5rh9ys2TaBQxPOh/DipDPXdZZd8zOk9GoDmqT4sC55Lb+FmcQRSHFBEg6hEd6KSMd
	c+FShuUHRHrr5r4Xtmo3jEPu46wf5W7+5K29fwic5rn+DkpH6CiRk1b7fvTb7GnSReV5tgr63HbSf
	s9ki5V/Qobck75hAjW71Wue2PhkKOcAlYCYI00mEqKSo9QA1ayzul3dEb6Za7qOV4sqpdNer4cKql
	qtD5EoUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN9Tq-00000002drR-1iY5;
	Wed, 13 May 2026 13:18:30 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN9TX-00000002dZT-3Jhc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 13:18:14 +0000
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2B81E2F8A;
	Wed, 13 May 2026 15:18:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778678282;
	bh=wJIwGQWQVF7nXvYZIy7GC96ascev6Pjy2rroRfLoy3Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Z5GVtc6sPp4nMSPPOceSEn1fHcYG0tUlRDZUOPYrPhs+sO9IGoxtrCuhr2zFxAcva
	 V1ATauJlJ4WOGUbT2vw1ZayUQOIwsmmpnAFmJh59aIwYiZ3bi96NDyW0lguysRb+Pt
	 eDbzaEt8Qbdq+y3a52bfDyuUELX62qch42DjR7pg=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 13 May 2026 16:17:35 +0300
Subject: [PATCH v2 13/16] drm/tidss: Add support for AM62P display
 subsystem
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-beagley-ai-display-v2-13-9e9bcefde6bc@ideasonboard.com>
References: <20260513-beagley-ai-display-v2-0-9e9bcefde6bc@ideasonboard.com>
In-Reply-To: <20260513-beagley-ai-display-v2-0-9e9bcefde6bc@ideasonboard.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Aradhya Bhatia <aradhya.bhatia@linux.dev>, Nishanth Menon <nm@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Swamil Jain <s-jain1@ti.com>, 
 Devarsh Thakkar <devarsht@ti.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1574;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=/85nzazta3ZSz2DegZrNcXTx/gK83bzKu5NpUXGKZHo=;
 b=kA0DAAgB+j2qjLyWHvUByyZiAGoEegDI1iz7h/jLtCo1kpGKDATo8OONswRA7dotGmDoL4LJy
 4kCMwQAAQgAHRYhBMQ4DD6WXv2BB5/zp/o9qoy8lh71BQJqBHoAAAoJEPo9qoy8lh71HGAP/jAX
 ACMP1m5RFBSzxnk9ZpgOoTGUyyNKTfPp1XSTBcqyIiu6hBh5jbDQuqqa2YfNUkBJIJxQMeuUMo/
 XBnlcUDY431qrEIorbOwizNQ4oatFBmQCQI6XjlmtpIg7VccLNg7QbuWUakoTse7qfNUgp9vp/i
 B8bj54PAx7o4qYzdb4xI6bOyVVQfucJbNGnQ5kd1rg8La2ndgjCtx4k6K7xel3TYJ5SfvT9amTM
 iwLQLZHLh2D55mlrTLzIytynrm9Q8SMsAyhuijcLl7PDvMrpAg0hSztVy+l85AVAGHT2HMF90rG
 H1Kj+84rOvVtIw9DpIYaAx8eDFjxXkDnctlwDLJSqC2zZJH3EEQEXQvb/VCnYQi9FEOIpoqvPUu
 twUl8yoHLpo2l+U6IltX0jOe+W/JgsANRzh+HsLLX3/Jo5Aklgj+I4QHm7MMrm0dVEiFQBYu+Cb
 0YJRvcpHIrgztJMmvjqm8cxR2vgH+IHd27oKaOIJGk+ZSjKV56tLIh5sYBoB+6wxSMsgfn3WgbA
 GDWMG9lcjOE1Zkr4GTuyYdS7mFZDerbyJKY+0OJQfhXsOGPvcBovRWNgMbAf8lY+WRA7JEPTT3v
 0AR0IJr7tVGWMqEevXMz2wJHQNPwG1L9NTpbHDDa9f9Gtk/0m199N4LQvSn6a8jUIyhOlbF8q+k
 6c6hq
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_061812_028738_70CDBE95 
X-CRM114-Status: GOOD (  10.80  )
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

From: Swamil Jain <s-jain1@ti.com>

The DSS controller on TI's AM62P SoC features two instances of the TI
DSS. Each DSS instance supports two video ports, similar to the DSS
controller found on the TI AM62X SoC. This allows three independent
video streams to be supported: OLDI, DPI, and DSI.

Since the DSS instances on AM62P are architecturally similar to those
on the AM62X DSS controller, the existing dispc_am625_feats
configuration can be reused for the AM62P DSS support.

This commit adds the necessary device tree compatibility entry for
"ti,am62p-dss" in the tidss driver, pointing to dispc_am625_feats,
thereby enabling DSS support on AM62P devices.

Signed-off-by: Swamil Jain <s-jain1@ti.com>
Tested-by: Swamil Jain <s-jain1@ti.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/tidss/tidss_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/tidss/tidss_drv.c b/drivers/gpu/drm/tidss/tidss_drv.c
index aef945101be4..2d056dc1c5ff 100644
--- a/drivers/gpu/drm/tidss/tidss_drv.c
+++ b/drivers/gpu/drm/tidss/tidss_drv.c
@@ -246,6 +246,7 @@ static const struct of_device_id tidss_of_table[] = {
 	{ .compatible = "ti,am625-dss", .data = &dispc_am625_feats, },
 	{ .compatible = "ti,am62a7-dss", .data = &dispc_am62a7_feats, },
 	{ .compatible = "ti,am62l-dss", .data = &dispc_am62l_feats, },
+	{ .compatible = "ti,am62p-dss", .data = &dispc_am625_feats, },
 	{ .compatible = "ti,am65x-dss", .data = &dispc_am65x_feats, },
 	{ .compatible = "ti,j721e-dss", .data = &dispc_j721e_feats, },
 	{ }

-- 
2.43.0


