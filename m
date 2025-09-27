Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C342FCAC5BC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Sep 2025 01:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MFhUEfSaFwySRMaGJYEpZSOFWlmnLOv+5YWLz9EcBTE=; b=RQAfaVDNcRdeatgvF+8MvUXi49
	YLYR24BhawqMzYzCt6U+7n4SolNNse4DXN9fjzw3qwd1P0+kRR1Ma8fv6nH22EW4u8M0bAnAA44YB
	R2AJU58Hn0xvEV+a+iGISL3vGwxHPLh4SPj2lhIJQHK8YBw0FEGRhj0ZFnzUPn3XU0iZM67ablv6Y
	2wOLs38IwK219gD+DQHahZmjmmlZb6KXmV2HFs4OE/SmoysJ7D0ZU+44JthjMiAOkRn6U/9464STu
	WY1IImiEPo4ZIJhjZ7Gb2T2DHqddGoPR3CZcER0Cm8HzRn0pkP5EY53fRk3i14U3VJJA6QpsKsajm
	i24KdPIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2JNK-00000005tGl-0aw4;
	Sat, 27 Sep 2025 01:05:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2JN0-00000005spp-1vIm
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Sep 2025 01:05:03 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58QEXIBm013116
	for <linux-arm-kernel@lists.infradead.org>; Sat, 27 Sep 2025 01:05:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MFhUEfSaFwySRMaGJYEpZSOFWlmnLOv+5YWLz9EcBTE=; b=LdIx6sZj+ysPxWs+
	aN8ZqXfUmgPGSOE6GN5IzW+BuvaToG7k1rUG1kxVNaxMSak90s8eOIeyZRGALhtg
	NrXV44rRYOIrzabDeXmEOOplrponsj+F3ZOUZ/TYElX4db5Wv6PYlQbHpi/AuLXA
	wsXfGaIyOhwXJsJnazyCBiqHsIji3scs06UJlu1Pz1ahLz06N2EGBe17F7hf2HW0
	INHvVdGIi7/GolvWKG/FWC4QIFrR5TYDkt36LVIffpTPO4GHBJd6lDZT5xFyMF1R
	mR+E+DsZBd0DCZEL/1FcMlfOhiUHnzOJptbV7xVmO7rRnazUnBteLsSVhcJzEyI2
	C9hfdQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0q4gqw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 27 Sep 2025 01:05:02 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ca8c6ec82eso60478451cf.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Sep 2025 18:05:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758935101; x=1759539901;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MFhUEfSaFwySRMaGJYEpZSOFWlmnLOv+5YWLz9EcBTE=;
        b=gVT47cQsVD+PDV/L+6VaK6q5VP78NrTo6nGK4IV3TizkqFpZkBmimJO8i0Gak9Xllu
         kZJ+7GlwCDhrDjzRqRX9t3VHdJJcwK6Q4oQMv3YzOta3QWI5R32FhgCXSbq7lOTuLX7U
         rt62mfrNPn5wVGF/FWz3NQ+ESqbuUeJLdLi2LlrtdIWbOtEoe0+1RFeA+ScVzphEw7f1
         Sqxj2Y2whsAq6Q3xseWCkzCtpLl+/CJCZb7OgQGjhsnk+xKlpO5I8apZg94G5EeMP6MV
         H1sMmw0GNPIqghf/FpIvLpRIxeSV4XBReLMpgcHaiGQkteF/tTMAs9giJp6WLBI8TD18
         HP8A==
X-Forwarded-Encrypted: i=1; AJvYcCUdmB4Th2RBzZoAwkbH9bHZ6tO34GJj2n7ZK0MIIc6OVP+68JqeFBzWaKm+WnkQvwZ+n/YUYPYjWbsK+CC4TqEZ@lists.infradead.org
X-Gm-Message-State: AOJu0YzeVWNliTyB4m+jmxhRQuRObwvpguW8JWQfBGYwNFO14pak0zrM
	iYA5oRyhX9ZX4jZpFn+upligW7jkyKKGOu7hEH9lZH/qYCmYWoF6JdwoeXuRd+OFJuoDOoZ8GkX
	QEjILBaOXgiAIV8Qn999ZgJ1njBnMBDrtXORyUNEO1msXWUzlKKR16xhfs28Cxu5Djqdqf74dpN
	+3Nw==
X-Gm-Gg: ASbGnctHH5U75oJY2MB9K33Rh2X100oizIIocoL4dENezSWPQMPmfhLRvQ0jGwE60qB
	uTr1Z7QlPgVuonHy+Z0kxkzx5bLCDHlfkQHQgsCh0XT5Yd+ac0v/WnvXPo/7Q0w+AOzgz9+IZ77
	SPHWB46WC252aDKUaBl1HEmXDa7fD1hUtL0Mnc4txj3GNA8DoRdDJDny6hfs/bIdV3LJJy2ZHGb
	mc/Qx4neDKB2obE09IDw+8muAoHFpQWpeSfyO6s/AP4MiIj9VL1nZqDe0Tnp/AXajW4ynyo7PT7
	BllMN5m9zhIN/13MpSvAQ1RUnuNR+0iMnhBEjZArwSeJ5hb3/jKA19hlnssAsauR3tP/3FbhTKj
	wuuJ9wwMZoax4XyUxZ01r5eLYzcKAdat3m5oygHmsswoXK6dS5y7N
X-Received: by 2002:a05:622a:4b05:b0:4c7:35cb:4b8c with SMTP id d75a77b69052e-4da4c39b711mr133232941cf.65.1758935100504;
        Fri, 26 Sep 2025 18:05:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGLqabjcVMfWczs/hM1RvjoXYZ24c8DWutZ4s//N20by1dgwDTIo6bz/phU73Cx2EjElCUJg==
X-Received: by 2002:a05:622a:4b05:b0:4c7:35cb:4b8c with SMTP id d75a77b69052e-4da4c39b711mr133232651cf.65.1758935100057;
        Fri, 26 Sep 2025 18:05:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-583139f99c1sm2156143e87.35.2025.09.26.18.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 18:04:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 27 Sep 2025 04:04:35 +0300
Subject: [PATCH 6/9] drm/msm: hdmi: handle unsupported InfoFrames
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250927-limit-infoframes-2-v1-6-697511bd050b@oss.qualcomm.com>
References: <20250927-limit-infoframes-2-v1-0-697511bd050b@oss.qualcomm.com>
In-Reply-To: <20250927-limit-infoframes-2-v1-0-697511bd050b@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sandy Huang <hjc@rock-chips.com>,
        =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>,
        Samuel Holland <samuel@sholland.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2210;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=vJ6MP4HtyLt5a75BuYCv3CbEFdh6+KuelPeaDQZ+OQQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBo1zggmZpcbiYkQjpVkexHgZEXDSvw0DXxRboAe
 D0A9gHSrqSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaNc4IAAKCRCLPIo+Aiko
 1feTB/0YC+4rnr/Hho6lqvJBXm+BTduk/QVw+LVH6sijEBUHa8/pAnfAaeAOONR4ag7YUWkgqQX
 sgYuRV8cKAwLMlemd/JbVaBZrG/o9/asI/Htr0NYQ7+4VOs05tz6Dsn8KdQyvOYmQAkgK8Iqd4D
 ZcHUMCLjgTxgzcqwaBQ3dPdBKq9WyqgKY0F98RDFCXyVyrihsR8FbdCEv179gCtv1TrW+cUkfaj
 NtZdhMr+XUBpzAWVE7lE+r04YwywRVSUR8Kqq1/TkiOL8Ywc9Er7RyXwyYmKZiLzjDuNA7m6mfK
 lvktPPCBln5IT5K/Oqv+Aj1Qi29ArDZfpGZ0XxlheSJCAr5R
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfXxZYKWNjiRM1O
 3Rs1NTYgUtWRwIW2ZV/ei5NPXZ6NLbnn22nTS5TnzCjwq10Nl3KgyRVvWkVgH7BQM0p8J7WE1pK
 jYkM+kPkVlTVqz2AuA9UOf3KDbavcW8U5F4urUZsVxUTz/5kGvdNN97ffUMJcJtJJigat4DuvKt
 oEI+UA+LfrP7qFpRd07EWOIl9IB9zDafM2u6jb5sJPbWgPJajGzCCOk1d4YSeYMVoNu4k8PX98+
 dFLgsiOthHxu/7vyN6ivIKipKhZn62I0vXYX/CESSi65na5hsStWAldq1Hi8hGHGLMQzKfx5i6v
 AZPbkL7kzrIl7XILNUb7yy2c6FwVx7bX68UstJBbZGPLJotsApw0C9wMzER+GVOjnLPR6Q6qA8O
 LNafZKZ42GR3RqrBt4b6VCBBPFRTHw==
X-Proofpoint-GUID: xeQ8PQRYQs8O4gNeoVrS0siIpb6_AYuK
X-Proofpoint-ORIG-GUID: xeQ8PQRYQs8O4gNeoVrS0siIpb6_AYuK
X-Authority-Analysis: v=2.4 cv=JsX8bc4C c=1 sm=1 tr=0 ts=68d7383e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=B-oVSsyST8MYkDpc_wEA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_08,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_180502_539449_6CC8138A 
X-CRM114-Status: GOOD (  15.71  )
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

Make hdmi_write_hdmi_infoframe() and hdmi_clear_infoframe() callbacks
return -EOPNOTSUPP for unsupported InfoFrames and make sure that
atomic_check() callback doesn't allow unsupported InfoFrames to be
enabled.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index 46fd58646d32fd0611192595826a3aa680bd0d02..121239a01cea334c3e7c789ebfb54df71515db28 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -248,7 +248,7 @@ static int msm_hdmi_bridge_clear_infoframe(struct drm_bridge *bridge,
 		break;
 
 	default:
-		drm_dbg_driver(hdmi_bridge->base.dev, "Unsupported infoframe type %x\n", type);
+		return -EOPNOTSUPP;
 	}
 
 	return 0;
@@ -273,11 +273,23 @@ static int msm_hdmi_bridge_write_infoframe(struct drm_bridge *bridge,
 	case HDMI_INFOFRAME_TYPE_VENDOR:
 		return msm_hdmi_config_hdmi_infoframe(hdmi, buffer, len);
 	default:
-		drm_dbg_driver(hdmi_bridge->base.dev, "Unsupported infoframe type %x\n", type);
-		return 0;
+		return -EOPNOTSUPP;
 	}
 }
 
+static int msm_hdmi_bridge_atomic_check(struct drm_bridge *bridge,
+					struct drm_bridge_state *bridge_state,
+					struct drm_crtc_state *crtc_state,
+					struct drm_connector_state *conn_state)
+{
+	/* should not happen, HDR support not enabled */
+	if (drm_WARN_ON_ONCE(bridge->encoder->dev,
+			     conn_state->hdmi.infoframes.hdr_drm.set))
+		return -EOPNOTSUPP;
+
+	return 0;
+}
+
 static void msm_hdmi_set_timings(struct hdmi *hdmi,
 				 const struct drm_display_mode *mode);
 
@@ -452,6 +464,7 @@ static enum drm_mode_status msm_hdmi_bridge_tmds_char_rate_valid(const struct dr
 }
 
 static const struct drm_bridge_funcs msm_hdmi_bridge_funcs = {
+	.atomic_check = msm_hdmi_bridge_atomic_check,
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
 	.atomic_reset = drm_atomic_helper_bridge_reset,

-- 
2.47.3


