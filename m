Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66A89CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 19:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fvEaZQvi82SxaGEnMSzH5YpUg8QLUYBGz0XPExRQPFs=; b=Z8VHOmAJ6ZRaKKbuh4Z5PvsGJY
	FE0CVtJ+KSAo9lwOeTJRlZIHSoNWTfopEAe5ul6IdRxvsq1k14UtFBIBLpwmWFHqLlHe0aa10FcwJ
	A6oCnh7vk1edCsj0im4XlYcPwX2Wq3LGO5yXtPNfPMzBblu1rVWFtR2dk73u1mNzZtRlYy25vm5bf
	h6/XZsyTUMzUr7eC0h8Ub5wu1Z7REP0vgG11E8q+s6k+fRyiRhCU99sMvnZdB6cKrxb4w/1t5/05S
	7/+D487WdYiwkIdEdX1Z7CQMEfH1miIt36pvpCoR7PdzVi4SDp8enMTeJMLKoxBwx3tpLLGh1MFHf
	4Y+sGcww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP3xZ-0000000Gmfl-0vRg;
	Mon, 18 May 2026 19:49:05 +0000
Received: from smtp.forwardemail.net ([121.127.44.66])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP3xM-0000000GmFS-0fnE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 19:48:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1779133731; bh=fvEaZQvi82SxaGEnMSzH5YpUg8QLUYBGz0XPExRQPFs=;
 b=WYrZGCyDXFAQq0rpy0fKcZhTpin+KCUcDSFi+hzDvkG8JLKHCG0Ew8lTeRWGX98IUf8ED6ri5
 NQxDhsUxowlP97Qxa3x76oPi8+YKo9KnNXwVwbMasFYXpyg62/1LEilH0eQAEgjQYzsh1QDVJjq
 qk1cqczDC4VmDwkf7xfCTovXCGngPghZXm5q4zB2WW7+4u7wffVyikK8R1tRH044hd0J4DAVmTA
 kJmY1tc87jY96nHMD5ZG25kuC3TDuDXQdrQk2yW8Y3MlXhrZbL/ZnoQHuW8CA6/ROsvti5AXYxp
 25lsmyvSoE9yYJdB8sohcy7yKFxkI1URhVn7Et5l4CeA==
X-Forward-Email-ID: 6a0b6d18b74b0ebd362eef4d
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.66
X-Forward-Email-Version: 2.8.12
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	dri-devel@lists.freedesktop.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH 11/13] drm/bridge: dw-hdmi: Export dw_hdmi_schedule_hpd_work() helper
Date: Mon, 18 May 2026 19:47:39 +0000
Message-ID: <20260518194744.2483580-12-jonas@kwiboo.se>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260518194744.2483580-1-jonas@kwiboo.se>
References: <20260518194744.2483580-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_124852_299504_ED8FEACE 
X-CRM114-Status: GOOD (  11.46  )
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

Export a dw_hdmi_schedule_hpd_work() helper that schedule the HPD
delayed work. Primarily to be used by the meson dw-hdmi driver.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 11 +++++++++--
 include/drm/bridge/dw_hdmi.h              |  2 ++
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 99dd62b6becf..54d75317ce9c 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -3014,8 +3014,7 @@ static irqreturn_t dw_hdmi_hardirq(int irq, void *dev_id)
 			status == connector_status_connected ?
 			"plugin" : "plugout");
 
-		mod_delayed_work(system_percpu_wq, &hdmi->hpd_work,
-				 msecs_to_jiffies(HOTPLUG_DEBOUNCE_MS));
+		dw_hdmi_schedule_hpd_work(hdmi);
 
 		hdmi_writeb(hdmi, intr_stat, HDMI_IH_PHY_STAT0);
 		hdmi_writeb(hdmi, ~HDMI_IH_PHY_STAT0_HPD, HDMI_IH_MUTE_PHY_STAT0);
@@ -3025,6 +3024,14 @@ static irqreturn_t dw_hdmi_hardirq(int irq, void *dev_id)
 	return ret;
 }
 
+void dw_hdmi_schedule_hpd_work(struct dw_hdmi *hdmi)
+{
+	if (!IS_ERR_OR_NULL(hdmi))
+		mod_delayed_work(system_percpu_wq, &hdmi->hpd_work,
+				 msecs_to_jiffies(HOTPLUG_DEBOUNCE_MS));
+}
+EXPORT_SYMBOL_GPL(dw_hdmi_schedule_hpd_work);
+
 static void dw_hdmi_hpd_work(struct work_struct *work)
 {
 	struct dw_hdmi *hdmi = container_of(work, struct dw_hdmi, hpd_work.work);
diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.h
index 10013b8d3adb..c56d1775f04a 100644
--- a/include/drm/bridge/dw_hdmi.h
+++ b/include/drm/bridge/dw_hdmi.h
@@ -184,6 +184,8 @@ struct dw_hdmi *dw_hdmi_bind(struct platform_device *pdev,
 
 void dw_hdmi_resume(struct dw_hdmi *hdmi);
 
+void dw_hdmi_schedule_hpd_work(struct dw_hdmi *hdmi);
+
 int dw_hdmi_set_plugged_cb(struct dw_hdmi *hdmi, hdmi_codec_plugged_cb fn,
 			   struct device *codec_dev);
 void dw_hdmi_set_sample_non_pcm(struct dw_hdmi *hdmi, unsigned int non_pcm);
-- 
2.54.0


