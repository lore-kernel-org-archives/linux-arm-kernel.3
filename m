Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3404CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l9Z5uObkfX17ytwtS/hkOYbgTcwQucmA5+CIhqYDVSI=; b=mYrgzD9ZeDwBKvpzuLoVaqYL/l
	L5jERcSIGTHpOjFtKK2qK0VJmV1wEDic+xGAkP2EQXHyo304WYgsTjBIPHVdTWcdT0A4Vf5Mp1qYK
	8ZEfKET9fIZTg1qhyntIQ5YwvWKXuaf0RFCggGjibeh6EjCqcOG4PJgHoEXn/GcjI0hrLiF7sUTuQ
	CkYnQxCCjQnIMUrVBytBICfCNMrFlr5E3mE2I+GB1eSaEs9dsaYiov/Tp1wlVv+huTtOGmZ0uSKqh
	VvRxBHmEKpxCPuFyIOxofCfzuDhJ+9rrePcHeCVtIfAGE/rBTX8TIMl9S+I/4OZYwIb4aWX0MxnZE
	5pVLS+Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw22q-00000008z8O-15K6;
	Tue, 09 Sep 2025 17:22:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvzi2-00000007sRf-3X0t
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 14:52:40 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899LQlg009065
	for <linux-arm-kernel@lists.infradead.org>; Tue, 9 Sep 2025 14:52:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l9Z5uObkfX17ytwtS/hkOYbgTcwQucmA5+CIhqYDVSI=; b=SZw9Owat7M+hPDde
	VLW9jWV25LxsHJnfoY0WWEIgpl/+7gBglGj6T5phhPYTcfVZwEPc/IiBBzNeVnx8
	csnr5Bb18zMPGvmsnGRvV1vnFb49dzTsm04WcUvDxnDmHwoUB8OEdWLNqL19hvtf
	6MXOzwVHtnlyniNHCJWc6gNHXlnYtF1gbMXb8IsaZ2J4lwHDMdti12ekoSkw2DJI
	gVF82yZFmarm4vR5Y6iHgbikS3sNa17WPnLnsk8B3odF09EDzEjWXjfHNxNrQnSn
	O6X5x6KJOV/PIJHC80pZOfwoe6EFvufRqQktUI1DRaFDHmmqsFkqukgYLQ83ocib
	Ab2elA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491qhdwcgj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 14:52:38 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-71fe8dd89c6so133514726d6.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 07:52:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757429557; x=1758034357;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l9Z5uObkfX17ytwtS/hkOYbgTcwQucmA5+CIhqYDVSI=;
        b=n+fT5hZwXD2ntxaIY83OwEKecVS51eCXigT6Uij1BdyX5u8syj/PgvtrmIq/gWojxm
         oeMKUHFmB5jhB+cClAANqLtVc9m+l7R3+2otyZi+3YqZn6SmsBZOpWvZ59yBcwnpFjNk
         GWan5bplr/0SAreWuwNUZqvU1C73XByesbt08peCnCbCfnN8099u3f3dTX+RKPUvdYxH
         s7zjzj4x+zukzXkZqI62iP4oyCN6u0xqD6jWsKd1f9jgXlZPu+AJGjbyWL9IZUqG9TvV
         +o1Hgq6mPHyCLSdyiC4b1Eh5YlQaBvrZcm9JAwtee6OOsYvbMtj7vrTkjOvX/XxgciAM
         ZcMg==
X-Forwarded-Encrypted: i=1; AJvYcCVgaXFXiVbti0ys6i+APOKSkvDVnxR6YFBlIhWQrb6KCSW+yIClfroJT2Fx3Icjqyk1cU+yuzYd23mMoyYMRsSd@lists.infradead.org
X-Gm-Message-State: AOJu0YxbydjIOzrcQebWASM5YQ83dukDQgC9ex3oAvWdSup62QpRe5qR
	JgUtcbwD/E9D+a30nHOJYvSs87v8k69k3+r/JijUClJCI6miuqBe63feWbp3+dX6uQy0h81oiVh
	NedcxhYLknA4ynK2ubR+JjqUgj1ljkxGdxmXfnDRVnp8rODuo6r4ZlEJKU4rfpl/1JXpuKf2SJn
	LQig==
X-Gm-Gg: ASbGnctAGaHgERTjOXDFWm97S++fy/UHo5oWjw7HQPRiX1WG0MgX+nclTw/1syrJBoF
	6zuprrGMPfyaFdtTQT3l5/wzpDgTKKbReDxJObTpvOY6kpj/6Xsfe5gZFEaG2TqNTvg93p0Zq55
	TJ9BAyHT+AFzqmCtzgZovIgO8EFmfLBehss3gxcqlDhUqQzUv8tCNVHjdqUz+VudSIQFoFjKymA
	qLLYeDQRQ1WYg8uEXQ4qR+0YKbJgvNsjfTm8hHNNHOx8aDgTkn7sE14uCgWk2lKmOdjyFU+PiRW
	Yb4XwmeFNHIBn10UsLHV4oc8ocJl0pC1U8YEFIv09b8L+bjH/HoQVDyWfSOO+f8nkpAeVPZL9m/
	FuYXOdcJT5RgQsCD5QWBGZKZENQgJpqo7lQy64ypUQjwJyRskr8fE
X-Received: by 2002:a05:6214:4009:b0:720:4a66:d3ca with SMTP id 6a1803df08f44-73933639a08mr113606506d6.24.1757429556905;
        Tue, 09 Sep 2025 07:52:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGPHL4NfJJ/zE5chnvOJ1HeidR9Kl8e6gYNpoM3SLwwaEavBYImkLXu+5zH8Ed3CkO98L4A0w==
X-Received: by 2002:a05:6214:4009:b0:720:4a66:d3ca with SMTP id 6a1803df08f44-73933639a08mr113606016d6.24.1757429556265;
        Tue, 09 Sep 2025 07:52:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-337f4c90eb9sm38735781fa.22.2025.09.09.07.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 07:52:35 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 09 Sep 2025 17:52:08 +0300
Subject: [PATCH v4 10/10] drm/display: hdmi-audio: warn if HDMI connector
 doesn't support Audio IF
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-drm-limit-infoframes-v4-10-53fd0a65a4a2@oss.qualcomm.com>
References: <20250909-drm-limit-infoframes-v4-0-53fd0a65a4a2@oss.qualcomm.com>
In-Reply-To: <20250909-drm-limit-infoframes-v4-0-53fd0a65a4a2@oss.qualcomm.com>
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
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Daniel Stone <daniels@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1648;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=WvduT1qbRYo9sMATdr0cfogagyWfZym9JAGpyIFdd7M=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBowD8b4ByVcFhNzN6vL9g+i6Xr5Ru20ekBbEAdJ
 +90fSIYze6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaMA/GwAKCRCLPIo+Aiko
 1WdkB/42MgipULdDGBHhJLj9Rn2m9Z+xg8n2+dwVvzMmGYgpA+PltLj7B5uOaXeKjVbIhMn7eYy
 Tzms6FQKTMnjfCE/3nJUZbGUl9kN8NBaJn9uXq14HKdFTcm7/m9nN2XW/f50ds9jrb83lrS+WzG
 1d9IvcNI2kh9ls+VF2uX750NKeykqE9uqnwxU88frDB1V/0wW632N6YQOrfX47F59xl3Xx5H9Mn
 nLXDnZAAIRGfTxDehtuvZo4ncNgOzGciZR6MuZQi0E/gquRXdMuCez2EHR03zdWeJWONeOAx8KL
 XZfA2cwtxgOTNy+164ThuwnMGvRhfMoUF7t/uJwK4H8+Gh+O
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: VgzpD74dMjDmtJZv7hwp7BuVVN8v_AJr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDAzNCBTYWx0ZWRfXx//0APz1Tkbc
 SqSnRECbYr8ov7rE3sphkgwVYEO/0C5ErNItvvXcOENU7FQnR9OWNPfY/h5d8f/YAl7Jht2wsrG
 XasdzDI96xWQ9ux7fzuYbd2bzDClYlhRic04XGXMIVJE/Bw4ESh/an/enOgOKcUy8c/wmRdyw8T
 XcYj5oqmJK5WY+mTPxD11ZyGWuRmZ5teQY4vOMtFU40j+k9IOl5no+8Q5r1apd4i4B+smNXc3Lp
 lXnaxJlkAC7IiAJ4MEO6l2+A98u7x4H6o8smV2zRpQS0N3AUfxxMaArc8acenlVSWbouvNU2Vb/
 1QGo959bwfc5AL3ydDESnVD1tqTi82Dm5SW3l6AhKpOK07HYyaFxqaDgD0lMXr2ayyUlY3vW1wT
 0JxOw5ME
X-Authority-Analysis: v=2.4 cv=YOCfyQGx c=1 sm=1 tr=0 ts=68c03f36 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8
 a=Yc4j0DFJudTMt519TXkA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: VgzpD74dMjDmtJZv7hwp7BuVVN8v_AJr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_02,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_075238_914683_B2ABAF9E 
X-CRM114-Status: GOOD (  16.24  )
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

Sending Audio InfoFrames is mandatory for getting audio to work over the
HDMI link. Warn if the driver requests HDMI audio support for the HDMI
connector, but there is no support for Audio InfoFrames.

Suggested-by: Maxime Ripard <mripard@kernel.org>
Acked-by: Daniel Stone <daniels@collabora.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/display/drm_hdmi_audio_helper.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_hdmi_audio_helper.c b/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
index 7d78b02c144621de528b40b1425f25e465edd1ae..35e0e79cb683a68af813344aa86c154c3a5531fe 100644
--- a/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
@@ -10,6 +10,7 @@
 
 #include <drm/drm_connector.h>
 #include <drm/drm_device.h>
+#include <drm/drm_print.h>
 #include <drm/display/drm_hdmi_audio_helper.h>
 
 #include <sound/hdmi-codec.h>
@@ -178,6 +179,17 @@ int drm_connector_hdmi_audio_init(struct drm_connector *connector,
 	    !funcs->shutdown)
 		return -EINVAL;
 
+	if (connector->connector_type == DRM_MODE_CONNECTOR_HDMIA ||
+	    connector->connector_type == DRM_MODE_CONNECTOR_HDMIB) {
+		unsigned long supported_infoframes =
+			connector->hdmi.supported_infoframes;
+
+		if (supported_infoframes &&
+		    !(supported_infoframes & DRM_CONNECTOR_INFOFRAME_AUDIO))
+			drm_warn(connector->dev, "HDMI Audio with no support for Audio InfoFrames\n");
+	}
+
+
 	connector->hdmi_audio.funcs = funcs;
 	connector->hdmi_audio.dai_port = dai_port;
 

-- 
2.47.3


