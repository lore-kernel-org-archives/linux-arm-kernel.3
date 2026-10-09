Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1542CA6015
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 03:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VQsn8GCAkc+Fjk7cjueF0Q+F75bLtKGbd7nIMwjKPVw=; b=YfwKJY6sOYvVz7gEOFrUgll8iX
	UqQotqkjCFPzY13wZYkWDvAvAGF4wUZqWPOe5Z+7CBth8OeCmziN4W2VgSoS47HHEl/IIjykLniBo
	P4tktBnmtC/rNBYSRFj+W8s2CrSpz9xktOPRJoLKQAX+QtUUNI+eZlK8sSaPIdCMt76lABYazNCcR
	I0VAjfw796Au6m1KaH5uEyKZMb067aFaN6lPpL0Kd8UkpnfBzF4x3eAMZMikSyl1PPeyV1k0ydfbI
	jwTsnlT42Wn75iowDBlCK67lQDEPiRAUTtXQkZ98wQ9yaNV3rv3P7zoZ+2w3ElBXOaESZhEhLubMc
	CfI6FO9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF18C-00000005KYg-42qI;
	Fri, 09 Oct 2026 03:18:48 +0000
Received: from bg1.exmail.qq.com ([114.132.67.179])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF18A-00000005KVg-2ZDd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 03:18:48 +0000
X-QQ-mid: zesmtpip2t1791515846teda7ddcf
X-QQ-Originating-IP: ll4UOsQI2GjH/rTZmdJovT7JYtS+9/6bQa8Au5skvjI=
Received: from [192.168.30.32] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 09 Oct 2026 11:17:23 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7874777080659291572
EX-QQ-RecipientCnt: 29
From: Xilin Wu <sophon@radxa.com>
Date: Fri, 09 Oct 2026 11:15:58 +0800
Subject: [PATCH v2 06/20] drm/msm/dp: Keep runtime PM calls outside the
 connection lock
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-msm-dp-hdr10-v2-6-1835d4966da3@radxa.com>
References: <20261009-msm-dp-hdr10-v2-0-1835d4966da3@radxa.com>
In-Reply-To: <20261009-msm-dp-hdr10-v2-0-1835d4966da3@radxa.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 dragon@radxa.com, Xilin Wu <sophon@radxa.com>, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3743; i=sophon@radxa.com;
 h=from:subject:message-id; bh=4U9Nmsy1uYb82VMp2QQ+dOjRfnyMbjdVCFQc3Q/Ljg8=;
 b=owGbwMvMwCVmdFg0fe08Iz/G02pJDFknYlboR7QsYLp/rCH9tMCZ358nr7acvqXxG5Nf0/+dq
 Tk3qvbnd5SyMIhxMciKKbIoxDPMZa/MvfZUrFQPZg4rE8gQBi5OAZjIDSGG/z4L2o+xeM+OuDOl
 wLV9dfJFJwe+33P3TCmf8HWhrZrMRCWGf9ZSonba3/dd7HRafVlE+rezWv/7DSo2n+TlWrdmz5K
 24AAA
X-Developer-Key: i=sophon@radxa.com; a=openpgp;
 fpr=205F009D07796DD6E516752E32C31567AD9E324E
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: MKD6Cx7ZSeC2phAlQiAQXN7JYVEdoqLp0D+nWPF0uid0WnPOuBZIo1AK
	J+Bdg24IH6T23Ttgyh1DX6ImwBAnJ6UTQJ2+HfD1aGzMBpiRDMLdd0lnpGEPI1XDR9LE0Dg
	q4M5i4oXfIoK0qgFGuOviXsRmNiqhKixCXH9XCiHIRBwmoNGqaOwL48esqDJA5tCtkGiNQo
	jj1ij+PwMYNJzH1QmOhyRaBI3zhDQ9IJip1LkjeIvwlJtTV0GElii/jo7OMktDJwOdDBJrl
	tFcPriZafcE9ft+O/CzNVfZCzyonvvz2edZoaT35mA6oT2X0/Top0yMsQzPlHib1X4yArX7
	EOYyZonyUtLpub9zOfImKwBNl3Ir5ff+SZSkAALcf1OC07rPMp3C1am6EH8ealYlcuqpzc/
	yCdO0cTdaN+bif3UPEJRL1//AimWPcHeu6LzoCTfUOPV0R41S9/DHo1JFGUocv2jG2sgU4w
	O/AnwKZT3/xtKlnuJ9OKInRMW7Vm7wVwu3cAZCRiH4s7NF/7yeHuiUHIYpw168QJ5ZY+m2N
	W1TJ6IaL9/0CDCZv7enN8m/lmkBDy6SiV1R0EZ8jIO5ZaI1nERpfajBgPhIiwaWl+SurO0p
	1qWkWTwdaflhPQ/V0HsNe4d9fXRSfViAS8z4cwll4xVX1d/29JVrYcliBa8mmhyLhYtHcVL
	VhcgO6qGVufPtsmyiQv7hTji6fj3KMRYM0ENy3ZoiHL+9i4I2WTR3bBifCPvySMKFxb3jIo
	Na6t4aNHwFAQ1JirF7zLVnkhF5sSeYoT35hWjPPUpJH2giqXcqmg9KbG7ytnObVjUyUJsiO
	2WzW9uxVQKipHG6Zh+EopYYta+LjCX5dKSJAJ3WhzmcUuEPFU8vSZ7mn4KjzjwDVNDq50kN
	dJqcwbMQ80KjG/dhQrj3lJxKlH2srtnuQVs7Qc5IKXr+v6ozQMY5eUMC08TnXtYHkHOs7wl
	xvdpVgDz2Tzz1TSyIbIC+iY5go2MF+IvknyT1TBUsHLfTy0SNDB1Cmzq8fQin+LZlfAOARZ
	h3oYBq5hyPJixW28FKKT3zGyJJfD3+Tnv5tgNolgF12QokeAW0AgF8ERs+bdqLNUFqnnqaX
	A==
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_201847_011092_9B90BB64 
X-CRM114-Status: GOOD (  11.56  )
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

Runtime suspend disables the display IRQ synchronously. Calling it while
holding plugged_lock can wait for an HPD IRQ thread that needs the same
lock. Acquiring a runtime PM reference under that lock can also wait for
an in-progress suspend with the same dependency.

Acquire runtime PM references before taking plugged_lock in plug and
detect handling, and release them after unlocking in unplug and detect
handling. Keep connection state and PHY operations protected while the
runtime PM reference holds the controller active.

This prepares for serializing stream operations with HPD processing
without extending the connection lock over synchronous runtime PM calls.

Assisted-by: LLM
Signed-off-by: Xilin Wu <sophon@radxa.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 30 ++++++++++++++++++++----------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 3ca039ff57b8..32a2ac89d8ed 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -409,14 +409,14 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp)
 			dp->msm_dp_display.connector_type,
 			dp->link->sink_count);
 
-	guard(mutex)(&dp->plugged_lock);
-
 	ret = pm_runtime_resume_and_get(&pdev->dev);
 	if (ret) {
 		DRM_ERROR("failed to pm_runtime_resume\n");
 		return ret;
 	}
 
+	mutex_lock(&dp->plugged_lock);
+
 	msm_dp_aux_enable_xfers(dp->aux, true);
 
 	msm_dp_display_host_phy_init(dp);
@@ -428,6 +428,7 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp)
 			dp->link->sink_count);
 
 	dp->plugged = true;
+	mutex_unlock(&dp->plugged_lock);
 
 	return ret;
 };
@@ -450,7 +451,7 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp)
 {
 	struct platform_device *pdev = dp->msm_dp_display.pdev;
 
-	guard(mutex)(&dp->plugged_lock);
+	mutex_lock(&dp->plugged_lock);
 
 	dp->panel->video_test = false;
 
@@ -460,8 +461,10 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp)
 			dp->msm_dp_display.connector_type,
 			dp->link->sink_count);
 
-	if (!dp->plugged)
+	if (!dp->plugged) {
+		mutex_unlock(&dp->plugged_lock);
 		return 0;
+	}
 
 	/* Don't forget modes for eDP */
 	if (!dp->msm_dp_display.is_edp)
@@ -488,10 +491,10 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp)
 			dp->msm_dp_display.connector_type,
 			dp->link->sink_count);
 
-	if (dp->plugged) {
-		pm_runtime_put_sync(&pdev->dev);
-		dp->plugged = false;
-	}
+	dp->plugged = false;
+	mutex_unlock(&dp->plugged_lock);
+
+	pm_runtime_put_sync(&pdev->dev);
 
 	return 0;
 }
@@ -899,19 +902,22 @@ enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge,
 	u8 dpcd[DP_RECEIVER_CAP_SIZE];
 	struct drm_dp_desc desc;
 	bool phy_deinit;
+	bool put;
 	int ret;
 
 	dp = to_dp_bridge(bridge)->msm_dp_display;
 
 	priv = container_of(dp, struct msm_dp_display_private, msm_dp_display);
 
-	guard(mutex)(&priv->plugged_lock);
 	ret = pm_runtime_resume_and_get(&dp->pdev->dev);
 	if (ret) {
 		DRM_ERROR("failed to pm_runtime_resume\n");
 		return status;
 	}
 
+	mutex_lock(&priv->plugged_lock);
+	put = false;
+
 	phy_deinit = msm_dp_display_host_phy_init(priv);
 
 	msm_dp_aux_enable_xfers(priv->aux, true);
@@ -961,8 +967,12 @@ enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge,
 			msm_dp_display_host_phy_exit(priv);
 		}
 
-		pm_runtime_put_sync(&dp->pdev->dev);
+		put = true;
 	}
+	mutex_unlock(&priv->plugged_lock);
+
+	if (put)
+		pm_runtime_put_sync(&dp->pdev->dev);
 
 	return status;
 }

-- 
2.56.0


