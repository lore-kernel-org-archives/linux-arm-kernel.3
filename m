Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B48BCA5FED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 03:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JKJTRALPsmCEQGltDLrjJ9H27p9nkLdR7Rzu6DuSS6M=; b=Hcyty7dW/sdw953GdMGSxXCHHT
	pGSXSgQdn4Fy1Y2bL57JQEetlsYoFi8kojf9Vokg69hIxq+lzZ9ozi60E7A1MuCv7HbE69wt4Ojet
	vmRiEuZAAGtWXrvl4O1BxOX+VQwtqvFLDyj+Wp4cLnONtOcbGrG6rdEYzMi3BaKLa1EOoKhii61aP
	/3LwlUFOAZg7c8YFV0BNp8U2q7JtnzFZqxSiw8OjZlZ6XYNJi4mRUy/XTu2no39oRFhwY/ep2Lxtn
	FZh2fq4B+WD0e1FCVgyOs9YOR1MUYoDiF/YhlAUD72Lu26HtpxX4FQ3fv+xhmwjXwkStevb8bYUBi
	j0LuW5lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF1AA-00000005M0O-0fgO;
	Fri, 09 Oct 2026 03:20:50 +0000
Received: from smtpbgbr1.qq.com ([54.207.19.206])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF1A3-00000005LgE-3cCb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 03:20:45 +0000
X-QQ-mid: zesmtpip2t1791515897t3bb15f3d
X-QQ-Originating-IP: 4IO4EU9rcZ+ALtRpgY5n+TUnjtG5ZsnojYZCSVOLSzQ=
Received: from [192.168.30.32] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 09 Oct 2026 11:18:14 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4378160521373157400
EX-QQ-RecipientCnt: 29
From: Xilin Wu <sophon@radxa.com>
Date: Fri, 09 Oct 2026 11:16:11 +0800
Subject: [PATCH v2 19/20] drm/msm/dp: Serialize video test state changes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-msm-dp-hdr10-v2-19-1835d4966da3@radxa.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=9106; i=sophon@radxa.com;
 h=from:subject:message-id; bh=KHKSAyzs833Ln6l0U/jy+twU04WRde5GQcn9QfB/NEA=;
 b=owGbwMvMwCVmdFg0fe08Iz/G02pJDFknYlbrKIifiN0XwmVUVz5/+hL9zessIxMOnD0R4vuA1
 aa2/6txRykLgxgXg6yYIotCPMNc9srca0/FSvVg5rAygQxh4OIUgIn032P4X7vC3u3MZssTOsuW
 5CUp/r5ueKatSTBR+VyRUs+u3vY1iQz/dOM1H6+Ml3UqKpy5U2rmF80Vho4vtH3N1u4IEpCSfG3
 JCQA=
X-Developer-Key: i=sophon@radxa.com; a=openpgp;
 fpr=205F009D07796DD6E516752E32C31567AD9E324E
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: NCjYbQ0FTrEVqX0J9pOsGL7AFxZ7tlz5VS7qjaLpwl+qXEipONtTtg8j
	P8oWHJCyIFV/OE26wciuwc/3kIv6s/OMM+U06rLQA3/2lbfx2Xdzg/mOtNRHnHV7VzuFg/k
	f5+q/Y6T6C0gVgVkZ9kPCS0IUzCtyQAfFB1JkxcaTkSq117AawMHOAueYdP9MnOoPBOfOXr
	vF/2lTl56DgbwccfV/o28UjDRb8uLbmWCDBiUb2qkRtWlaz0SDEMW8hsKgYc/41/uq1M9Dp
	Cnwy2FBThEkoYOvb/yAcHdP+aN7UEWJv7I++Ee3bRVUaVgna+x2S8c0BD7x02xHZCkN88AE
	1+HOWh4joDF6DS4kj/HY5vRlApy7oLemmH+igDer/ZeTDx1zd08oGvVOLcIQ7cmzFIBrsTF
	BTJRJ8rLD5e6DDCAJR59t1qHgNsyRzTtO25Fs2d1Zp0hJfecJhoy3eL0JaYRyZV6CxmhJEa
	EOCpdj2N7tyFirLALGwJz5wsplcc/SxKvZrjWE/G5aAWvkVjhSEl2bKr4cVrm385kvoDXHo
	BkeOiHPdyNyOwegnA657NftjroCWFL+TWFJ7Uaz3+2h0Lvalj1QPvC3oiJa/B/UCkwzK0fI
	QEWulJHXrbD0UH61Ln2LUPvUbflpZhrwO+DWMIF+gIaL4LCYf4ipDRAadnUiH5NKpcN5Igj
	9wZycpwfmn5RD9v97BDQfcrE1SjNRrljItiW7Zrb2QGKw2UASGz1Cl0g1g2ikiDSa9LCkOL
	Pxo5hXasOgyJWDv7G9Uyrn3WP9XhA2p4lvCgkGAKuR4iwlaMyTSNXtgdSzvxx2/Bx7MWAWG
	vQ46JeyMYj2lG3e8yGTQAcL76BEbuIwCyAAIdL5uAUALNhb7RrLmVTsG1xrip2qtzkBMAIX
	SB/nnXWB1hB3+LN6bNm24t49gj8VUJWoKTC9UvbKAFx4jmbLRgnDjoKeF5J5gNJbqiqKxh6
	kQFDvI24n4kk6aVJS9rTwWDLg6fG5Y0N8JwiqsTuzPZNN1BGCunUXvu1a1zVE1xZ4gP74JA
	nFlFm7CyYJRX2u4V6cMrR0KhfFoJosZKd3th1B18Qiyfa+PUTczIW7GsETbGF1WPzE8BusY
	Q==
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_202044_767247_02536F2C 
X-CRM114-Status: GOOD (  21.21  )
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

The debugfs test control writes video_test directly, racing HPD handling
and mode programming. Reading the test flag and its requested depth in
separate calls also allows those values to change between the reads.

Route test state access through the display and use plugged_lock for both
HPD and debugfs updates. Hold the same lock while selecting the test depth
and installing the mode. Pass the display instance to debugfs for access
to its connector and the serialized test controls.

Preserve the existing SDR test behavior. The shared setter provides the
entry point for rejecting incompatible tests when HDR is added.

Assisted-by: LLM
Signed-off-by: Xilin Wu <sophon@radxa.com>
---
 drivers/gpu/drm/msm/dp/dp_debug.c   | 27 ++++++++++++++-------------
 drivers/gpu/drm/msm/dp/dp_debug.h   |  8 +++++---
 drivers/gpu/drm/msm/dp/dp_display.c | 34 ++++++++++++++++++++++------------
 drivers/gpu/drm/msm/dp/dp_display.h |  2 +-
 4 files changed, 42 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_debug.c b/drivers/gpu/drm/msm/dp/dp_debug.c
index 00fb1a7ba40e..c26b356f998a 100644
--- a/drivers/gpu/drm/msm/dp/dp_debug.c
+++ b/drivers/gpu/drm/msm/dp/dp_debug.c
@@ -21,7 +21,7 @@
 struct msm_dp_debug_private {
 	struct msm_dp_link *link;
 	struct msm_dp_panel *panel;
-	struct drm_connector *connector;
+	struct msm_dp *dp;
 };
 
 static int msm_dp_debug_show(struct seq_file *seq, void *p)
@@ -89,7 +89,7 @@ DEFINE_SHOW_ATTRIBUTE(msm_dp_debug);
 static int msm_dp_test_data_show(struct seq_file *m, void *data)
 {
 	const struct msm_dp_debug_private *debug = m->private;
-	const struct drm_connector *connector = debug->connector;
+	const struct drm_connector *connector = debug->dp->connector;
 	u32 bpc;
 
 	if (connector->status == connector_status_connected) {
@@ -111,7 +111,7 @@ DEFINE_SHOW_ATTRIBUTE(msm_dp_test_data);
 static int msm_dp_test_type_show(struct seq_file *m, void *data)
 {
 	const struct msm_dp_debug_private *debug = m->private;
-	const struct drm_connector *connector = debug->connector;
+	const struct drm_connector *connector = debug->dp->connector;
 
 	if (connector->status == connector_status_connected)
 		seq_printf(m, "%02x", DP_TEST_LINK_VIDEO_PATTERN);
@@ -133,7 +133,7 @@ static ssize_t msm_dp_test_active_write(struct file *file,
 	int val = 0;
 
 	debug = ((struct seq_file *)file->private_data)->private;
-	connector = debug->connector;
+	connector = debug->dp->connector;
 
 	if (len == 0)
 		return 0;
@@ -154,10 +154,11 @@ static ssize_t msm_dp_test_active_write(struct file *file,
 		/* To prevent erroneous activation of the compliance
 		 * testing code, only accept an actual value of 1 here
 		 */
-		if (val == 1)
-			debug->panel->video_test = true;
-		else
-			debug->panel->video_test = false;
+		status = msm_dp_display_set_video_test(debug->dp, val == 1);
+		if (status) {
+			kfree(input_buffer);
+			return status;
+		}
 	}
 	kfree(input_buffer);
 
@@ -168,10 +169,10 @@ static ssize_t msm_dp_test_active_write(struct file *file,
 static int msm_dp_test_active_show(struct seq_file *m, void *data)
 {
 	struct msm_dp_debug_private *debug = m->private;
-	struct drm_connector *connector = debug->connector;
+	struct drm_connector *connector = debug->dp->connector;
 
 	if (connector->status == connector_status_connected) {
-		if (debug->panel->video_test)
+		if (msm_dp_display_check_video_test(debug->dp))
 			seq_puts(m, "1");
 		else
 			seq_puts(m, "0");
@@ -200,12 +201,12 @@ static const struct file_operations test_active_fops = {
 
 int msm_dp_debug_init(struct device *dev, struct msm_dp_panel *panel,
 		  struct msm_dp_link *link,
-		  struct drm_connector *connector,
+		  struct msm_dp *dp,
 		  struct dentry *root, bool is_edp)
 {
 	struct msm_dp_debug_private *debug;
 
-	if (!dev || !panel || !link) {
+	if (!dev || !panel || !link || !dp || !dp->connector) {
 		DRM_ERROR("invalid input\n");
 		return -EINVAL;
 	}
@@ -216,7 +217,7 @@ int msm_dp_debug_init(struct device *dev, struct msm_dp_panel *panel,
 
 	debug->link = link;
 	debug->panel = panel;
-	debug->connector = connector;
+	debug->dp = dp;
 
 	debugfs_create_file("dp_debug", 0444, root,
 			debug, &msm_dp_debug_fops);
diff --git a/drivers/gpu/drm/msm/dp/dp_debug.h b/drivers/gpu/drm/msm/dp/dp_debug.h
index a90083fec856..430891e110fb 100644
--- a/drivers/gpu/drm/msm/dp/dp_debug.h
+++ b/drivers/gpu/drm/msm/dp/dp_debug.h
@@ -9,6 +9,8 @@
 #include "dp_panel.h"
 #include "dp_link.h"
 
+struct msm_dp;
+
 #if defined(CONFIG_DEBUG_FS)
 
 /**
@@ -17,7 +19,7 @@
  * @dev: device instance of the caller
  * @panel: instance of panel module
  * @link: instance of link module
- * @connector: double pointer to display connector
+ * @dp: display instance owning the connector and video test state
  * @root: connector's debugfs root
  * @is_edp: set for eDP connectors / panels
  * return: pointer to allocated debug module data
@@ -27,7 +29,7 @@
  */
 int msm_dp_debug_init(struct device *dev, struct msm_dp_panel *panel,
 		  struct msm_dp_link *link,
-		  struct drm_connector *connector,
+		  struct msm_dp *dp,
 		  struct dentry *root,
 		  bool is_edp);
 
@@ -36,7 +38,7 @@ int msm_dp_debug_init(struct device *dev, struct msm_dp_panel *panel,
 static inline
 int msm_dp_debug_init(struct device *dev, struct msm_dp_panel *panel,
 		  struct msm_dp_link *link,
-		  struct drm_connector *connector,
+		  struct msm_dp *dp,
 		  struct dentry *root,
 		  bool is_edp)
 {
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 34e1c48cdd79..c51d033598a5 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -435,10 +435,20 @@ static void msm_dp_display_host_deinit(struct msm_dp_display_private *dp)
 	dp->core_initialized = false;
 }
 
+static int msm_dp_display_set_video_test_locked(struct msm_dp_display_private *dp,
+						bool enable)
+{
+	lockdep_assert_held(&dp->plugged_lock);
+
+	dp->panel->video_test = enable;
+	return 0;
+}
+
 static void msm_dp_display_handle_video_request(struct msm_dp_display_private *dp)
 {
 	if (dp->link->sink_request & DP_TEST_LINK_VIDEO_PATTERN) {
-		dp->panel->video_test = true;
+		if (msm_dp_display_set_video_test_locked(dp, true))
+			dp->link->test_response = DP_TEST_NAK;
 		msm_dp_link_send_test_response(dp->link);
 	}
 }
@@ -689,8 +699,10 @@ static int msm_dp_display_set_mode(struct msm_dp *msm_dp_display,
 
 	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 
-	if (msm_dp_display_check_video_test(msm_dp_display))
-		bpp = msm_dp_display_get_test_bpp(msm_dp_display);
+	guard(mutex)(&dp->plugged_lock);
+
+	if (dp->panel->video_test)
+		bpp = msm_dp_link_bit_depth_to_bpp(dp->link->test_video.test_bit_depth);
 	else
 		bpp = state->bpp;
 
@@ -974,22 +986,20 @@ bool msm_dp_display_check_video_test(struct msm_dp *dp)
 
 	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
 
+	guard(mutex)(&msm_dp_display->plugged_lock);
+
 	return msm_dp_display->panel->video_test;
 }
 
-int msm_dp_display_get_test_bpp(struct msm_dp *dp)
+int msm_dp_display_set_video_test(struct msm_dp *dp, bool enable)
 {
 	struct msm_dp_display_private *msm_dp_display;
 
-	if (!dp) {
-		DRM_ERROR("invalid params\n");
-		return 0;
-	}
-
 	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
 
-	return msm_dp_link_bit_depth_to_bpp(
-		msm_dp_display->link->test_video.test_bit_depth);
+	guard(mutex)(&msm_dp_display->plugged_lock);
+
+	return msm_dp_display_set_video_test_locked(msm_dp_display, enable);
 }
 
 void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp)
@@ -1604,7 +1614,7 @@ void msm_dp_display_debugfs_init(struct msm_dp *msm_dp_display, struct dentry *r
 	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 	dev = &dp->msm_dp_display.pdev->dev;
 
-	rc = msm_dp_debug_init(dev, dp->panel, dp->link, dp->msm_dp_display.connector, root, is_edp);
+	rc = msm_dp_debug_init(dev, dp->panel, dp->link, msm_dp_display, root, is_edp);
 	if (rc)
 		DRM_ERROR("failed to initialize debug, rc = %d\n", rc);
 }
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 6a77e5952530..ac64c1d3227a 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -30,7 +30,7 @@ struct msm_dp {
 
 int msm_dp_display_get_modes(struct msm_dp *msm_dp_display);
 bool msm_dp_display_check_video_test(struct msm_dp *msm_dp_display);
-int msm_dp_display_get_test_bpp(struct msm_dp *msm_dp_display);
+int msm_dp_display_set_video_test(struct msm_dp *dp, bool enable);
 void msm_dp_display_signal_audio_start(struct msm_dp *msm_dp_display);
 void msm_dp_display_signal_audio_complete(struct msm_dp *msm_dp_display);
 void msm_dp_display_set_psr(struct msm_dp *dp, bool enter);

-- 
2.56.0


