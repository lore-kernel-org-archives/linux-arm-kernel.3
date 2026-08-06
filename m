Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0CBAC5ACD7
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 17:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=odTEfNsmXoGm4W4bPgJaFH27g+y/ths2rCpQamWor1Q=; b=Y0J5aBh6IcwR5Mg5ClB3NSV4hB
	hNlkBIpy4k8/pJqrDHKjxtnGqAAE17k2db92dgvLEYdMOk1EHOunGv2sI83UmmO/Is7PI6N4Usvyz
	DrinNT5CVjok2CYxlHd7JilZZdp3iFZj6lmGHBKjWvtscycZK/hL/gJSARFl67SikkcmIcVc1gYDb
	yOGJLjMY18va9w7WMRxd9+vg6CdoPzFBgM+SGd45Q9dKd0JZO2roBJdBtCRvCN3pdR/jsz6NhP7FG
	XYmB2lDVSuya/TA6TOSPZyVfUWoH4NVoe4rVIx02RIUBWLFkI772q9/jFNSuQT/K0foZWtqV1mdLH
	RRKl56OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws1UI-00000006HTT-3mhx;
	Thu, 06 Aug 2026 17:02:34 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws1UC-00000006HKj-11Ie;
	Thu, 06 Aug 2026 17:02:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1786035745;
	bh=rc2RzDgpPH5o2b0zMeMdVVBwWMU2wvQAig61MwLzEiI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=b3U4Nl6c+AeRUP/1MKzyrGBPaqcmq8XgT5CbHXpys4p1fgsUCUg9GWxEsoWo/9TpQ
	 W6T4lMIY/AosQH5WbvMHpxlCAVakxxTakPzAgEXn9dT6fplV74iBi9TJv9pBv8zPQt
	 mzxEb84hnl58f8t4GB/rgHf5spRja5w0ToApQgNRNQqGWN1N7ZNMF8aW9wkhYDYvjx
	 fQDl5+6bJJ/FbQ4bRkZLmS7FCCezsv3BB9eTu8+u5RfFiWyQwVL5zFS1OQp9RFvSw9
	 yxLV3sJK6oMLF9dhgkCS6YVPVe6czdz6akD+yntzOvWAgLroL3mIVXRqRdemg/BiwW
	 rqjITrI/hftBA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 482E517E0F83;
	Thu, 06 Aug 2026 19:02:25 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id F1B02480030; Thu, 06 Aug 2026 19:02:24 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 06 Aug 2026 19:02:10 +0200
Subject: [PATCH v11 04/21] drm/bridge: synopsys: dw-dp: Document missing
 reset line deassert
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-synopsys-dw-dp-improvements-v11-4-0d508505f383@collabora.com>
References: <20260806-synopsys-dw-dp-improvements-v11-0-0d508505f383@collabora.com>
In-Reply-To: <20260806-synopsys-dw-dp-improvements-v11-0-0d508505f383@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
 Damon Ding <damon.ding@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Alexey Charkov <alchark@flipper.net>, dri-devel@lists.freedesktop.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@collabora.com, 
 linux-arm-kernel@lists.infradead.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1609;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=rc2RzDgpPH5o2b0zMeMdVVBwWMU2wvQAig61MwLzEiI=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGp0viDr4+NxDx8KwqSZwqspKCl31BaCO23/t
 GBa3Dx6nqomkokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqdL4gAAoJENju1/PI
 O/qaj+sP/2YoP9r+VyQViNtrzlwAZePbVge3GnDl6TfX2LdjmQUJ/FxLiiH/Wjdwax/dGHeSVC/
 KjxWit02cp8y2bO9DF1zEbwxM+2Cc/Q/mlFbw/NIvTyyrfw+vFVfgLokxqJn+7B+8MURkPQL9TV
 mkTRpMj44BIY9dO0Q5GHGE1TFWBhTaE7W14uHwOKq5EwtxdHBzO/EKoBzxgrk+HidPZSdyXzZwb
 87rro5R2kg6oTwJtiacbALGJ/7cFnML2Pacyd/mYK1ih3ooglx2wq3yxxduYDGTPNisFKVV2nJ4
 fFW1CNTRdASdxcvxhdWS2fw0FbCEeQID+SChYCTlHxawFLO+Bt9Qcd8cDRmxiouWjS4UBQb7lJD
 pJWxg0QaGNc0DclD6bZmQ62WYQGoB11UQO9hzG5BOGVoHNzoQQN/C+SqlcaZ8HTHRucZr88sOuB
 Ssp8qApgCQNftyk7tiIovux01RwMoEqVS+Xfjt73uhJa4utEfQegDBWNtiBWbisQAc6NHlXltG2
 cG9+ruj3ILFkoGI8DhoUaXRSpgwFzdJ8ajFAMKJY1Keoik44+Pn1hY2CL6eLZ5Wc2w97Y5B8chm
 6shYSyyN5coP3MIe/NAOw4nGikCpyFYQxRCL3HZkpEiavXWBBj+ULbtK5qVRyj3sx2PGTwh8Smr
 SYPMOxptmxLLbWUYixysqPQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_100228_450689_41C46653 
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

If the driver uses devm_reset_control_get_exclusive_deasserted() instead
of devm_reset_control_get() and thus automatically deasserts during
probe, the SoC will hang when the device is unbound.

This does not happen, when runtime PM is being used (not yet supported
in mainline), which suggests the power-domain involved requires this reset
line to be deasserted.

Even with runtime PM there is no gurantee that the power-domain is
disabled as it is shared. Considering the power-domain does not have
the reset dependency described in DT, document the problem but leave
things in the current state until a better solution is found as the
reset line is deasserted by default on all supported platforms.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-dp.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
index 21d60e89126f..52e3b37259a6 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
@@ -2090,6 +2090,10 @@ struct dw_dp *dw_dp_probe(struct platform_device *pdev, const struct dw_dp_plat_
 		return ERR_CAST(dp->hdcp_clk);
 	}
 
+	/*
+	 * This reset line is deasserted by default; asserting it hangs the SoC if the
+	 * related power-domain is still active.
+	 */
 	dp->rstc = devm_reset_control_get(dev, NULL);
 	if (IS_ERR(dp->rstc)) {
 		dev_err_probe(dev, PTR_ERR(dp->rstc), "failed to get reset control\n");

-- 
2.53.0


