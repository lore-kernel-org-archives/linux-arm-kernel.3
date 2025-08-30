Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C87DBCA0FF9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 00:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tMGCzwi7iMqpBSIwuiogi39ZPNmDZ+NlaUaBUi0ePrI=; b=MKCAwANbfZU2z2HFVsPcyhnlr7
	VCWgW41vSbzKcwhTGB1g1MpUQS4XNGj2kyw5JC5V/QO65S3p79RtMArIS08QeqiJ+keFd4Pu4trKt
	m9D+NjKu/9PrMa2kPvu2mfIcUU0CRb8CLctI16HpmFZmMrb6lu2dRQykvGrBEGFVasq2c8l96opUp
	xllFBJnOkjd6S9cRJ3/cy9AE0xhnjTNqgwqvLqblCyz0Re2wVCYO1541kURMwtZ5dcdi+WNhFxwTA
	HZblFNRAarVQdCeku77/YWUo0w2sXyYpq/4MMEaTsTBSNrYwegR9fXd8Kb4shlxm9tUtus54O/vb3
	eoRH66zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us9wX-00000007GQu-1XMw;
	Sat, 30 Aug 2025 00:59:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us9NN-000000074gc-1qSR
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Aug 2025 00:23:26 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57TMnPEK002745
	for <linux-arm-kernel@lists.infradead.org>; Sat, 30 Aug 2025 00:23:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tMGCzwi7iMqpBSIwuiogi39ZPNmDZ+NlaUaBUi0ePrI=; b=Q+5mmYj+n/VSVLYh
	QoJEjJoCvH+Des/LL/ULV2D2nLttafyPPr2QA4sl2XtTaYHJCq4T+bPQyVJ7CsSl
	sSIV7foFigiuEhSUTP84O9+acizE7obyfGN6k/EJXvjRHRa4ypkFCbTpjHaiezd5
	5/bZ1AL/17zWQfZl/v2+oBXPoChXDOnv+u0eoZuBSqp6g/dxVhNIrzxuMXhbbJl6
	fTzqNL9CiDglo0WwZ8bP60aHCVi1zi9fSMFc+4MZh2Fou+OjxvYFhw5cWxX++xa6
	1zwL/DRLfGpnoltZyvB8GSnx6Nt1crfT9tXJyRD4u4fCaxdXUwXxTe4NEg+ftutX
	1IayYA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q615w3u4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 30 Aug 2025 00:23:24 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b2ecb8e64bso33281581cf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 Aug 2025 17:23:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756513404; x=1757118204;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tMGCzwi7iMqpBSIwuiogi39ZPNmDZ+NlaUaBUi0ePrI=;
        b=w52IDb4FQJPn9BHK8ykXTRWCg7tEdVhzdOvA3ozhgqB/rf+G5eMwckR7dc/JT2h7XU
         L77Jnt5RFXQx1toker83bhu1TDltjRG9yJltKibwLRD8VZHovMdHGWae73AiPsFwiY+3
         77iemynzVFZLpzbmsx0DXl8FIwqcIYHnt6YhmqPFJsTZ7CO6zDUgrfmWSqadMMn6JP5T
         UsALlGyJXb972d78rQNhH7FPKPXF4KWTNSo4WcI20iy8yvQM8fHr+xy7NQUlalxHeCB8
         5ruvuehuX8t7gf9BqnSXRPjM8Dq/2sN+mmcQc5c/UzYqeRoBvwlOIk/slZvoU40HetzQ
         U0Jw==
X-Forwarded-Encrypted: i=1; AJvYcCWHz/pukSomLUgomgo5P9QrZ15SBuuSEPZu0mNRo53g+B6kgl5suiz8PdBbw4GmpcR/097T3buTE9WdAu46sLpD@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+GtsTK4QByc/XJfhQdpfzsm8LnWchB03jSzl551mOiZMuWJrC
	afGgRTpsmujLwzx4PKNSxIjmi95zutx+NVzSZ758c8/cbBCBJ+DKfMSz7yZQ6EyJdOD1iECVpvd
	STsK6d/KLI7pW/EmnOFzy5b1ZwHXrZet2ExLW6nzBViOMZK7MzT6URSs5PHBpeYKeaZLLGaqoAT
	bQgQ==
X-Gm-Gg: ASbGncs1e89FeMmkxfInbjfDSkCJu9fI9qesuz9A6ghePUAuogheEhRPmhKZnbafZKY
	zPQkzrg328TzAGJ5jE608S/Zac5FNPVwvYX1VEvOkiANwwDeEH6wGMWJc684+xlV9h6aiski5+M
	aSV0WR45oGQnP8O2CnZNy+xNZB4GzIZ+vqj8uGOUvg5GczPl7y5bhiqQilPX0tlnIX570X1w+qv
	42UdG2TDNO73pwZEmesTOQFPpgqHJC149AHOHZvJOANbPJqQfiJIp13kjmnnIDehawdZ6C0sh8D
	FQKrJNPLXumYTADOEyqZxy8BSjqilRkTG77PDmlxpF3RDSdLLwkDNnCb8fJQB685uFlzCuoF1uP
	fZbq4m26OKlt8vKtn7Q0yFX5HLVJ+HzL2gXVNg5WcXtWiXWxRXB1L
X-Received: by 2002:ac8:7dd0:0:b0:4b2:8ac4:ef8e with SMTP id d75a77b69052e-4b31dca7d9bmr6262311cf.73.1756513403702;
        Fri, 29 Aug 2025 17:23:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQbp4HnJW53TtgpH4goLIxU1betKvFXJivt7Yk4w2HXWAhfhSte/bjtbH3ZPMA/GFEM5dqMA==
X-Received: by 2002:ac8:7dd0:0:b0:4b2:8ac4:ef8e with SMTP id d75a77b69052e-4b31dca7d9bmr6262001cf.73.1756513403243;
        Fri, 29 Aug 2025 17:23:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f676dc52esm1019907e87.8.2025.08.29.17.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 17:23:22 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 30 Aug 2025 03:23:07 +0300
Subject: [PATCH v3 11/11] drm/bridge: lontium-lt9611uxc: switch to HDMI
 audio helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250830-drm-limit-infoframes-v3-11-32fcbec4634e@oss.qualcomm.com>
References: <20250830-drm-limit-infoframes-v3-0-32fcbec4634e@oss.qualcomm.com>
In-Reply-To: <20250830-drm-limit-infoframes-v3-0-32fcbec4634e@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sandy Huang <hjc@rock-chips.com>,
        =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>,
        Samuel Holland <samuel@sholland.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Liu Ying <victor.liu@nxp.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6539;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=VIOVx9ZFQcN8aP7U3+DXeUs0Ba2NJyVyJ0ONqbKAcgU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoskRk4mO/Wae/aVjMwFDeIGRIwNht1W8+SnIgW
 mGWDw77GSyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaLJEZAAKCRCLPIo+Aiko
 1aiuB/wLjBle4c8EUZFBkZrH+ITKfuu9NiqqEEnbh20zp5cP/q6DGCXvqn7JiotAYk/2OWe+TgZ
 wibQ6J9oaQdsYHdWszWTqJ+VckceGts93XDX83DH6MjkZl+U8ZmQazE2GM4X8phxTGZUpwrsT7Z
 PDXS9mKbl+23uOJ1Os8+rhOL1tKuMqFeIZEo+ChO/XJwS8pxmNET5bhSBFls35KXWLrGYP9NYV4
 J5+ZfT8+UntW/s1gQvPQB3LefV4pCOhcu9Kw9AWBxi2ScS9jJ0Zzh3XvewVtxknFkFz6JndPqqP
 ZQ0mPlZZl8Gb4f76AWhB8eGhy2KizaEN1C0CmHbU7wwbx3+Q
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzNCBTYWx0ZWRfX6J1I+crNxcrA
 QTOAUNCei+R5vNBUUN0m/YGd5XDksfGhRCjJ5Get1gf1G1QLMrlsznkjh9WsieDXHvynvb3Fm4u
 dlsjCI8LHRyOSy7dKEDQMHMxPRP+Zdpj5smn1hXqHTKw7GkmSQxlvJV6AKy7cMiV31NzqiKsm50
 auxOkq6NPNSm5N+Ro54CYy/0WAz++h3JU3xPAlNcCLmCjdPKSUQoov7a0h0p+fFgJPZrTTZyq0T
 sj9c3CH0xbWG88i5MRVP9TkQFab+Cnj1yxkzgZL7O+4AzJ5UxFKJa9Ozxy0cDctm3jqcn6WcVQW
 2I5KbhJFlSzoVaYyaUwd/IZ04YdcN1NGgxwcI1r5uXKuWh1S8mmDYmLbTYYMIwn03ZRvBXnJfuQ
 jyCA7fvP
X-Proofpoint-GUID: auGh2vdTIauhcQ1YIpCK3rfB0WuDNc4d
X-Authority-Analysis: v=2.4 cv=K+AiHzWI c=1 sm=1 tr=0 ts=68b2447c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=l1vpWyVUGYkh7_PGMaYA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: auGh2vdTIauhcQ1YIpCK3rfB0WuDNc4d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-29_07,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_172325_604934_4C7044F1 
X-CRM114-Status: GOOD (  20.96  )
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

While LT9611UXC is a DSI-to-HDMI bridge, it implements all HDMI-related
functions internally, in the firmware. Implement DRM_BRIDGE_OP_HDMI and
DRM_BRIDGE_OP_HDMI_AUDIO by providing necessary stubs, streamlining HDMI
and HDMI audio plumbing (which includes plugged notifications and ELD
handling).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 130 ++++++++++++-----------------
 1 file changed, 54 insertions(+), 76 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
index 38fb8776c0f441ae433c60a7680aaa6501a8956e..df4661986423a871c006af2a36d85d8103935f93 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
@@ -17,8 +17,6 @@
 #include <linux/wait.h>
 #include <linux/workqueue.h>
 
-#include <sound/hdmi-codec.h>
-
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_edid.h>
@@ -27,6 +25,8 @@
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
+#include <drm/display/drm_hdmi_audio_helper.h>
+
 #define EDID_BLOCK_SIZE	128
 #define EDID_NUM_BLOCKS	2
 
@@ -48,7 +48,6 @@ struct lt9611uxc {
 	struct device_node *dsi1_node;
 	struct mipi_dsi_device *dsi0;
 	struct mipi_dsi_device *dsi1;
-	struct platform_device *audio_pdev;
 
 	struct gpio_desc *reset_gpio;
 	struct gpio_desc *enable_gpio;
@@ -429,12 +428,50 @@ static const struct drm_edid *lt9611uxc_bridge_edid_read(struct drm_bridge *brid
 	return drm_edid_read_custom(connector, lt9611uxc_get_edid_block, lt9611uxc);
 }
 
+static int lt9611uxc_hdmi_clear_infoframe(struct drm_bridge *bridge,
+					 enum hdmi_infoframe_type type)
+{
+	/* LT9611UXC managed infoframes in the firmware, provide an empty stub */
+	return 0;
+}
+
+static int lt9611uxc_hdmi_write_infoframe(struct drm_bridge *bridge,
+					  enum hdmi_infoframe_type type,
+					  const u8 *buffer, size_t len)
+{
+	/* LT9611UXC managed infoframes in the firmware, provide an empty stub */
+	return 0;
+}
+
+static int lt9611uxc_hdmi_audio_prepare(struct drm_bridge *bridge,
+					struct drm_connector *connector,
+					struct hdmi_codec_daifmt *fmt,
+					struct hdmi_codec_params *hparms)
+{
+	/*
+	 * LT9611UXC will automatically detect rate and sample size, so no need
+	 * to setup anything here.
+	 */
+	return 0;
+}
+
+static void lt9611uxc_hdmi_audio_shutdown(struct drm_bridge *bridge,
+					  struct drm_connector *connector)
+{
+}
+
 static const struct drm_bridge_funcs lt9611uxc_bridge_funcs = {
 	.attach = lt9611uxc_bridge_attach,
 	.mode_valid = lt9611uxc_bridge_mode_valid,
 	.mode_set = lt9611uxc_bridge_mode_set,
 	.detect = lt9611uxc_bridge_detect,
 	.edid_read = lt9611uxc_bridge_edid_read,
+
+	.hdmi_write_infoframe = lt9611uxc_hdmi_write_infoframe,
+	.hdmi_clear_infoframe = lt9611uxc_hdmi_clear_infoframe,
+
+	.hdmi_audio_prepare = lt9611uxc_hdmi_audio_prepare,
+	.hdmi_audio_shutdown = lt9611uxc_hdmi_audio_shutdown,
 };
 
 static int lt9611uxc_parse_dt(struct device *dev,
@@ -508,73 +545,6 @@ static int lt9611uxc_read_version(struct lt9611uxc *lt9611uxc)
 	return ret < 0 ? ret : rev;
 }
 
-static int lt9611uxc_hdmi_hw_params(struct device *dev, void *data,
-				    struct hdmi_codec_daifmt *fmt,
-				    struct hdmi_codec_params *hparms)
-{
-	/*
-	 * LT9611UXC will automatically detect rate and sample size, so no need
-	 * to setup anything here.
-	 */
-	return 0;
-}
-
-static void lt9611uxc_audio_shutdown(struct device *dev, void *data)
-{
-}
-
-static int lt9611uxc_hdmi_i2s_get_dai_id(struct snd_soc_component *component,
-					 struct device_node *endpoint,
-					 void *data)
-{
-	struct of_endpoint of_ep;
-	int ret;
-
-	ret = of_graph_parse_endpoint(endpoint, &of_ep);
-	if (ret < 0)
-		return ret;
-
-	/*
-	 * HDMI sound should be located as reg = <2>
-	 * Then, it is sound port 0
-	 */
-	if (of_ep.port == 2)
-		return 0;
-
-	return -EINVAL;
-}
-
-static const struct hdmi_codec_ops lt9611uxc_codec_ops = {
-	.hw_params	= lt9611uxc_hdmi_hw_params,
-	.audio_shutdown = lt9611uxc_audio_shutdown,
-	.get_dai_id	= lt9611uxc_hdmi_i2s_get_dai_id,
-};
-
-static int lt9611uxc_audio_init(struct device *dev, struct lt9611uxc *lt9611uxc)
-{
-	struct hdmi_codec_pdata codec_data = {
-		.ops = &lt9611uxc_codec_ops,
-		.max_i2s_channels = 2,
-		.i2s = 1,
-		.data = lt9611uxc,
-	};
-
-	lt9611uxc->audio_pdev =
-		platform_device_register_data(dev, HDMI_CODEC_DRV_NAME,
-					      PLATFORM_DEVID_AUTO,
-					      &codec_data, sizeof(codec_data));
-
-	return PTR_ERR_OR_ZERO(lt9611uxc->audio_pdev);
-}
-
-static void lt9611uxc_audio_exit(struct lt9611uxc *lt9611uxc)
-{
-	if (lt9611uxc->audio_pdev) {
-		platform_device_unregister(lt9611uxc->audio_pdev);
-		lt9611uxc->audio_pdev = NULL;
-	}
-}
-
 #define LT9611UXC_FW_PAGE_SIZE 32
 static void lt9611uxc_firmware_write_page(struct lt9611uxc *lt9611uxc, u16 addr, const u8 *buf)
 {
@@ -858,11 +828,24 @@ static int lt9611uxc_probe(struct i2c_client *client)
 	i2c_set_clientdata(client, lt9611uxc);
 
 	lt9611uxc->bridge.of_node = client->dev.of_node;
-	lt9611uxc->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID;
+	lt9611uxc->bridge.ops = DRM_BRIDGE_OP_DETECT |
+		DRM_BRIDGE_OP_EDID |
+		DRM_BRIDGE_OP_HDMI |
+		DRM_BRIDGE_OP_HDMI_AUDIO;
 	if (lt9611uxc->hpd_supported)
 		lt9611uxc->bridge.ops |= DRM_BRIDGE_OP_HPD;
 	lt9611uxc->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 
+	lt9611uxc->bridge.vendor = "Lontium";
+	lt9611uxc->bridge.product = "LT9611UXC";
+	lt9611uxc->bridge.autogenerated_infoframes =
+		DRM_CONNECTOR_INFOFRAME_AUDIO |
+		DRM_CONNECTOR_INFOFRAME_AVI;
+
+	lt9611uxc->bridge.hdmi_audio_dev = dev;
+	lt9611uxc->bridge.hdmi_audio_max_i2s_playback_channels = 2;
+	lt9611uxc->bridge.hdmi_audio_dai_port = 2;
+
 	drm_bridge_add(&lt9611uxc->bridge);
 
 	/* Attach primary DSI */
@@ -881,10 +864,6 @@ static int lt9611uxc_probe(struct i2c_client *client)
 		}
 	}
 
-	ret = lt9611uxc_audio_init(dev, lt9611uxc);
-	if (ret)
-		goto err_remove_bridge;
-
 	return 0;
 
 err_remove_bridge:
@@ -908,7 +887,6 @@ static void lt9611uxc_remove(struct i2c_client *client)
 
 	free_irq(client->irq, lt9611uxc);
 	cancel_work_sync(&lt9611uxc->work);
-	lt9611uxc_audio_exit(lt9611uxc);
 	drm_bridge_remove(&lt9611uxc->bridge);
 
 	mutex_destroy(&lt9611uxc->ocm_lock);

-- 
2.47.2


