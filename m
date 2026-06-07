Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDE69CD8CA7
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Jun 2026 21:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SCoT97Q5hVm4j6zlVv2MwuqAb+a0wwmxj8TjVN/oHI8=; b=nYP5RhkDXPBKfWIzbK7QPNi78h
	f6FVE2gLT9VwwZR03/jApv1ZeStj80Q/Jg5r7ceT7v+0e3dH1BEsvMlhG0G2D6PryWrdfGSBYCRml
	a25B2ssc0Ys3L9b6xV1BpQ0NYEy9hcQ7lZ6akinLB0aJcd5JEMtSeyhYjKB3vgsrybZ2hzgwUQa+y
	Nx+l3kfcDyXcMRoIVrgKkxxLwz5EL4FRca5BekUKcLjGBdENtokS5iecWAJC+GBRq/SCS/GbmRWyr
	3QwadIC+E3DsKxX874kN7yJn2MbphUjaw33ZwqPKV2uWjFGk1Q42/EjwEk0G+0UmdWe98NzlpGnii
	TnNHLoKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWL7R-00000002VOo-10or;
	Sun, 07 Jun 2026 21:33:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWL7O-00000002VN4-14Vc
	for linux-arm-kernel@lists.infradead.org;
	Sun, 07 Jun 2026 21:33:19 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657EkmW4846978
	for <linux-arm-kernel@lists.infradead.org>; Sun, 7 Jun 2026 21:33:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SCoT97Q5hVm4j6zlVv2MwuqAb+a0wwmxj8TjVN/oHI8=; b=lgf/vqiQvwidXX+J
	H3u0Hg+bm/YbqD90L3k8SZI/n3ibPQNlDNkNDvBLEr64+i6fWp/V5U5XpRMpQR2F
	odM24vycGfIYPw3s60L2/A+/3QKHA6fxU9wgzMQfRsitxyYxItsY2UySoJr2DnPU
	03QHC9EGoT8XIVoRj+k+Pg3hPud+QIt/ZW02lwQ1AAGV1uJLosZiP6kWv2qoaeCh
	De5+wRgj7FIMkfONdSCG6cls9Bsftkis27VLuwXgZ4gqr8+rI2CwFz+UzeSTkLGR
	DHHlFLjopbK8nfjbWPgBBvJKRiGuSEkT7lePsMNWxQIuoIv7E40uRIoTHGccEJCT
	P/HFdA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4em9k3n71m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 07 Jun 2026 21:33:17 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-517878a92c5so85634131cf.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 07 Jun 2026 14:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780867997; x=1781472797; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SCoT97Q5hVm4j6zlVv2MwuqAb+a0wwmxj8TjVN/oHI8=;
        b=AVYKwsD8ybfCJyniI5Ektyx9IR3OX8oZqdwIz2ea2m0jle+fSAnCwL63k8LJNI+98f
         XA1JNFqwbC61L/r35oaY3SvgRQwEhhvS2wDskoFWEJ5aPJw+P7sCv2fhCDt8oM7v9qdJ
         8f8x/XS7y26YvlWbic6Ygb+KsyCrNJahmdUT25dsDrj5nA42pL/6Ut/Ze7Jt9CADY5pM
         GALlYfDxFgiujuI1jMAouw/2x7AMRwpTthHqqipcje3HJFOshqq/G7o+J1OCPgkUmZUU
         WTGwC2TJaeJh6GIzklh7JcDUZn+O+wbQHjH3u61RFAQ0ZI/U7Ws2D+TmOteoN/UJKmUg
         khAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780867997; x=1781472797;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SCoT97Q5hVm4j6zlVv2MwuqAb+a0wwmxj8TjVN/oHI8=;
        b=LG/hcvxRYSbec4Nyrlicr7E0L49VtWj6+AEM/2YziModIPW8pRwFpVS1vf1R2iwXx6
         M827JGy5g4O+VeFAdDAFa14sq1o0U6OnRGsH89sqRy75K4cXxsjf5Qc2Mf7hYvWRmm9z
         kaPrq240tDoRqZWUcZzJVwLAEROzgjSVhn3R8yGsGPztWMHXJ1KlK2nQQO9uGXnr5C4d
         qc47FPleQEiLrUcf6q55tPjL+Mo8Jedx970fO00228cap9ECPo2VxSZ8XSdSqpSOR9gC
         GcWlk2Is8vZK+Is2W1OYrnGXQ4H25ZrivE7REHFODH3z0QrA7GSCquhgffSjIC77yCzS
         guTg==
X-Forwarded-Encrypted: i=1; AFNElJ/niZqksiTKnT4pUel9euJ6yryJocUOsLKZNEGa6bDdw1C5l1FP2fuzfdF4+ken++7nYp8DUmA5k4vKdRUrsDq5@lists.infradead.org
X-Gm-Message-State: AOJu0YzDkvomtXj72jY+mT+Aao9P6Q+UdIL0Ml0h9iYnBfxkkYsEDUsn
	4YDt1FUQSKMzgrhsIrqwZ2RfmdqFk3qE/qR0BPTaS6S0rrsDi9QEm6/9186keGY5ua+NVfzyYQu
	boPNyjcX6cm3KBdDRAVHsFqLdI1Wu8/5antZ7+Opt3RHv6VCnJtM0XJ98l4nrWSVoQsVIfKniLp
	SAgA==
X-Gm-Gg: Acq92OGsLmQzZgZ/XMGD5kXiVddcKBR1opNVkSqwge7KEyv92NC+kunWxCN6DALmEDh
	oNnTsn7pJ9YYTZWBRQNydNObft5YEeavudlzJ29ngSvAkjsYAHoO5SeH8Z5X1P/oxgRSWUXYL1W
	c07S5kyXPxTvvG+DDw0aNZi923yRMeXJ4J/0LoL5mhkk3GZDXdXukr0+Z4U37KB2ozP9XLAXPnM
	hHCvWa0KG3U+OmJNCg6vlp2hLOhfT7C89T0rBzoSMkxZCssukmwRBE6DPnTA+Iw9+86rradX5o4
	Qg9pmEVwVxQj8DJUvYvaXSe6R5p9iQtDN/P2tgycR8lJH2jT/DwiNZNKRs1OzhnEQEMhnN3as+L
	hWx6uK0/rjklkYtg0BUvJMKzPIN9IZzybPcjdot9W4SU48ZYLJFVHzmNc+lez56kRrsqYObMaVc
	YXAfQb+3sH+RdaMlM/lhtMHV4LGGOXiBjSNaAForoINyCNwQ==
X-Received: by 2002:ac8:6109:0:b0:517:8a19:a461 with SMTP id d75a77b69052e-51795c56d21mr173338701cf.42.1780867996764;
        Sun, 07 Jun 2026 14:33:16 -0700 (PDT)
X-Received: by 2002:ac8:6109:0:b0:517:8a19:a461 with SMTP id d75a77b69052e-51795c56d21mr173338131cf.42.1780867996264;
        Sun, 07 Jun 2026 14:33:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2d5ea9sm40374041fa.32.2026.06.07.14.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 14:33:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 00:33:03 +0300
Subject: [PATCH v4 2/8] drm/connector: pass down IRQ_HPD to the drivers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-hpd-irq-events-v4-2-30b62b335487@oss.qualcomm.com>
References: <20260608-hpd-irq-events-v4-0-30b62b335487@oss.qualcomm.com>
In-Reply-To: <20260608-hpd-irq-events-v4-0-30b62b335487@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Adrien Grassein <adrien.grassein@gmail.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Tvrtko Ursulin <tursulin@ursulin.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Pengyu Luo <mitltlatltl@gmail.com>, Nikita Travkin <nikita@trvn.ru>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Francesco Dolcini <francesco@dolcini.it>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5290;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=A2PPAf8RIZIumN5Va/to+GsP1RDHctHNlwnN5DWn79k=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqJeOPllDTwWwMp1vESqk1j4UB0AHP5j7B5bL5X
 uq2IPLISouJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaiXjjwAKCRCLPIo+Aiko
 1VlqB/sGaQ+sksjZm1e69F9eT9jxsXnLzH5/YZqYUPV74YSWdt5FApSzNf7tmIphhpE0fUE4LWH
 YozHAGahdOxwneinArqneGoOTQvp1aS5h+di+zQZRzeWHqayX0N7EXOGpaohwBQ4lC+hoBv/c8U
 YLVwGvblsq7oFWaEfoE8yeFhSDBDDkIGhIPAeyPRq5ZThVvChLMwD6AbWU6i+EtF/dr6t42Lvhz
 mHngSlPxsh/S1AoVsH3HstphanM+aA+WlDkXPZdW7t2CKF4cAZX7QfbWK3QPNP/frLMhRl0ND6W
 xAWtiViB82XxNOvQFNCDI+lH9MaGzXCY3tiEVgH4V2bJFjLa
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDIxNyBTYWx0ZWRfX8T6szxy+3GYE
 AWlIC1TJrlrySDzX/ZhLhVyvOviuOs6Dqw0QgjoDQojCgF49hnpDavkg6vIBC3rVW7XMSijho6N
 jNSRoJIythBLDK/szw8XQ1fx230nywwsQeJEnzQ8cZtDQ2SbI8s8vuSPYJM3LD1cKjC4GiUc6pF
 jlxkOzYuArqIOXnU5gJYT49X3p4Y964sOdmKG9Hd/qasVZpOdBPf22qdEEY39IRX5iQZNGWDcnP
 cjGuOI0uLeebekyvkUbrS5R1PZpFqdIpcEsbY1FVPWJ0vG9gGjZVO+QJtU9iN7H+1NFvOX46eay
 rCSGdUyBIChNNJQ5Z9Fve35d7xHasW8qUjDCsfz+U8SbgboQXEnpc2Asc1SBTOTwU4DsvU8r3Kx
 QTiwi+xY21cBFp8prxX8zS2kxvt8kQntt0yTQcU7ZDwkpb6L3A7pfI4wQTC7p+rGYbgMj77TAdK
 P9WcKiWw07en8d9kxng==
X-Proofpoint-ORIG-GUID: zmtSvs5U512tB6VjoRBg_Lw5Khw-Coqm
X-Proofpoint-GUID: zmtSvs5U512tB6VjoRBg_Lw5Khw-Coqm
X-Authority-Analysis: v=2.4 cv=TIB1jVla c=1 sm=1 tr=0 ts=6a25e39d cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=Uld_eVi5zExU9UbbJsYA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606070217
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_143318_419895_3F01307A 
X-CRM114-Status: GOOD (  18.10  )
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

The DisplayPort standard defines a special kind of HPD events called
IRQ_HPD. These events are used to notify DP Source about the events on
the Sink side.

Extend drm_connector_funcs::oob_hotplug_event() to pass the
notifications about the IRQ_HPD events down to the individual drivers,
letting them handle those as required.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 17 ++++++++++-------
 drivers/gpu/drm/drm_connector.c                |  2 +-
 drivers/gpu/drm/i915/display/intel_dp.c        |  3 ++-
 include/drm/drm_connector.h                    |  3 ++-
 4 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 649969fca141..046efd913064 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -141,7 +141,8 @@ struct drm_bridge_connector {
  */
 
 static void drm_bridge_connector_hpd_notify(struct drm_connector *connector,
-					    enum drm_connector_status status)
+					    enum drm_connector_status status,
+					    enum drm_connector_status_extra extra_status)
 {
 	struct drm_bridge_connector *bridge_connector =
 		to_drm_bridge_connector(connector);
@@ -154,7 +155,8 @@ static void drm_bridge_connector_hpd_notify(struct drm_connector *connector,
 }
 
 static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *drm_bridge_connector,
-					    enum drm_connector_status status)
+					    enum drm_connector_status status,
+					    enum drm_connector_status_extra extra_status)
 {
 	struct drm_connector *connector = &drm_bridge_connector->base;
 	struct drm_device *dev = connector->dev;
@@ -163,7 +165,7 @@ static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *drm_bri
 	connector->status = status;
 	mutex_unlock(&dev->mode_config.mutex);
 
-	drm_bridge_connector_hpd_notify(connector, status);
+	drm_bridge_connector_hpd_notify(connector, status, extra_status);
 
 	drm_kms_helper_connector_hotplug_event(connector);
 }
@@ -171,16 +173,17 @@ static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *drm_bri
 static void drm_bridge_connector_hpd_cb(void *cb_data,
 					enum drm_connector_status status)
 {
-	drm_bridge_connector_handle_hpd(cb_data, status);
+	drm_bridge_connector_handle_hpd(cb_data, status, DRM_CONNECTOR_NO_EXTRA_STATUS);
 }
 
 static void drm_bridge_connector_oob_hotplug_event(struct drm_connector *connector,
-						   enum drm_connector_status status)
+						   enum drm_connector_status status,
+						   enum drm_connector_status_extra extra_status)
 {
 	struct drm_bridge_connector *bridge_connector =
 		to_drm_bridge_connector(connector);
 
-	drm_bridge_connector_handle_hpd(bridge_connector, status);
+	drm_bridge_connector_handle_hpd(bridge_connector, status, extra_status);
 }
 
 static void drm_bridge_connector_enable_hpd(struct drm_connector *connector)
@@ -223,7 +226,7 @@ drm_bridge_connector_detect(struct drm_connector *connector, bool force)
 		if (hdmi)
 			drm_atomic_helper_connector_hdmi_hotplug(connector, status);
 
-		drm_bridge_connector_hpd_notify(connector, status);
+		drm_bridge_connector_hpd_notify(connector, status, DRM_CONNECTOR_NO_EXTRA_STATUS);
 	} else {
 		switch (connector->connector_type) {
 		case DRM_MODE_CONNECTOR_DPI:
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index bb128dd0263a..d99019fdea9c 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -3528,7 +3528,7 @@ void drm_connector_dp_oob_status(struct fwnode_handle *connector_fwnode,
 		return;
 
 	if (connector->funcs->oob_hotplug_event)
-		connector->funcs->oob_hotplug_event(connector, status);
+		connector->funcs->oob_hotplug_event(connector, status, extra_status);
 
 	drm_connector_put(connector);
 }
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 85d3aa3b9894..31acb3129723 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -6990,7 +6990,8 @@ static int intel_dp_connector_atomic_check(struct drm_connector *_connector,
 }
 
 static void intel_dp_oob_hotplug_event(struct drm_connector *_connector,
-				       enum drm_connector_status hpd_state)
+				       enum drm_connector_status hpd_state,
+				       enum drm_connector_status_extra extra_status)
 {
 	struct intel_connector *connector = to_intel_connector(_connector);
 	struct intel_display *display = to_intel_display(connector);
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 105da7c94910..5784bb9c4021 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1720,7 +1720,8 @@ struct drm_connector_funcs {
 	 * has been received from a source outside the display driver / device.
 	 */
 	void (*oob_hotplug_event)(struct drm_connector *connector,
-				  enum drm_connector_status status);
+				  enum drm_connector_status status,
+				  enum drm_connector_status_extra extra_status);
 
 	/**
 	 * @debugfs_init:

-- 
2.47.3


