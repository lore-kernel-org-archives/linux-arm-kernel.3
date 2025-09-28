Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 211E9CCA468
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Sep 2025 08:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MFhUEfSaFwySRMaGJYEpZSOFWlmnLOv+5YWLz9EcBTE=; b=Usdo8BmrOFZf9N96EA41ezKfWL
	Ko2dRcENQzAtPY/9Uy680SbxKFy+kk6ZlJHrUb3v2aW+sxis7UOAViDlid5sgCifkX35AfDGgTHTl
	rPIzp2gFPUJODaptDnGYdrABkRlywm9VWjXLzYP8+RFVe9B9dlNkQirWTfSeVTFZq1kDLGOqUVqcX
	HsfyGqVqh3kizx4WL0+VdMLyCKYpcpxb2dfqTLZJfiLjihPLCeBwPC64yCXwzZwh7L8POnvBhRime
	6smhPxMnRCsyxedguBleooQkcKUdCnP+MF6LD+8n0eolmprmrHhNvcHxwJd6plALfnGdowMb/fKG4
	8PW3q3Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2mjJ-0000000EKDg-2pLi;
	Sun, 28 Sep 2025 08:26:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2mip-0000000EJhe-1v79
	for linux-arm-kernel@bombadil.infradead.org;
	Sun, 28 Sep 2025 08:25:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=MFhUEfSaFwySRMaGJYEpZSOFWlmnLOv+5YWLz9EcBTE=; b=Pf4giyIRzrJcppOTV8LWcKsjEP
	ozi6k1r+WKqpmD8pSnmHlvpE006pK1hkQKCEgQR8/taOtqXzmGlcifhNQFH1PpVpmKYeBfC7KGfrb
	/I9nI1aELgS+b2z635urGv4s546FfwMcWDjelaXN1SZxe1sinXOtbvJeoAEkd1Au14o7Ur9G/Mxvk
	KXB9nbETTudcEVAtWCDRoTHpz6EEbAKoXqJCzDWqtX4kBhGLWdLauCD8tSXAqp2W/kVR5AQ1IyaS3
	H0wKseTUusVHuczo9Mce9xH62nAZd81i9i7sDrRsixCrajCdiXxlLCnZY5PBsHjpRP3lR+qgwKodI
	dM99OhRQ==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2mil-0000000BAIX-3SDm
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Sep 2025 08:25:30 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58S5fvDf003878
	for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Sep 2025 08:25:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MFhUEfSaFwySRMaGJYEpZSOFWlmnLOv+5YWLz9EcBTE=; b=Nyi1TU8AJHWkgYCm
	Mgv7R0ZVX0wOcPUovl7wG0Xnz37w+/sVSXo2xOnDA5fZLQfNP04uFmi3XqhnHER8
	V27tyCm1WzBckV7iYoSaOnrk/9YuFhzSuVVh9vBFpnPy2rDlKrJfAxar4Lmw+TxC
	hf30s2KhImMkUW6QTYYpMaE0tmdL2OqqzOGIEVw8wAeaczRpiDMg0RG3NLdhxtM6
	7zSIX4sVPABYEYHGD3xWrebTn236Du6TKM95MHV8ClPVw4dNHlIMU/HorlOlxhX9
	8gl+QObKHjE+BhIiMu44UtsDfk90OACEMIvL3uv7PAfya2vBjsGj+MPB9Dt+uJ57
	a0vPfw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e6x5jfrp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Sep 2025 08:25:17 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b302991816so70043881cf.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Sep 2025 01:25:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759047914; x=1759652714;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MFhUEfSaFwySRMaGJYEpZSOFWlmnLOv+5YWLz9EcBTE=;
        b=GlNbPo5eKa683jehBIAa+gpjsFp1DjBi3rF1MqWiNa29Ac3KB5X0I1cvKO333/trlZ
         PrCZODVMXdEJ4crWnzzIIqpSBZxfNiepT1TKCtxwTGtNFltgXiziwVzNPwkPBj+cZwPF
         iP3XVnygjQ2tFgxSxFRKySEbEeuFuriQsefAHn/aB4jGgrktXioWV6jENPsApLJZfPeO
         XDfP1WxmHbOsOHFSJOz0+cX1+QDS07jTNjsa8VqtxzOBWLLRjoOFqQhvk3cLBjEOhevG
         6x3zxLZpLYfChcvIZPWU8+rIsuFBbVyZ5f35efxI9NmLNcSRsmvMY1iCNgd5cIksP3kI
         7Z3g==
X-Forwarded-Encrypted: i=1; AJvYcCWpI1bSkCxItSxGh9EqoDPUt4aWbtUSAO6aGKy7KvJ4ugBUjIhS4XVMwKMdBiLNRkjrl32x/MdHU1k2XgNOIdF7@lists.infradead.org
X-Gm-Message-State: AOJu0YzF4//RCpqNgRg2P8Xw0ZZrCPL59W8Pc0x4+paEuCyYSbeeCoZq
	SbbeAuuMaEtC3pX6K0C57ME6zicOwQmnQHlXQIx4rtI6DNlvc4NSmjh3+oriQV8hO9pD29qybxB
	AVhR5kLmbt1OLeqkPVZVXynuoqlNUoXOPMEd1MxfNZUPSyxZNyg3Jt1k05PHXIJImTyR0yBBOQU
	Fm+w==
X-Gm-Gg: ASbGncsV5XfYVandABzVZHhh0DrHVBCuv6tIW+9E/sBcWdcyIvhyI6P6OvXDEMqYTwk
	kF7zVBZbPMwv1k6aL705AcvFVo3b9PAv0u7R6Xwb0jx6zMTqk8m5MUI2n7690Nhu8jSst8B6exD
	iXepFVpqqsq2tvhvVYWALMQyxPDUcwswuvyjkSgTkVHJSdgiuTtk+P2/v7NhWUO41N8QUU2w/0s
	cAaQe2Lhxl1bK7jor7Cans5lszF84DGjsb3Lp1+4konKrbPLIEAlB5kH+aMHxYPhgszvWey0LwH
	9onxD8hK4Q8JVp6lQ5sfCx4T1a+X1jYr2ovdtESlVpm4DylQAUrIdukoPa16xmbEvfgiaO1NTH+
	sszLtbfW5GQ0grWKI9WdKN9Y9VM2tRak0TTqFFwSNpEl/dVpkWRrn
X-Received: by 2002:a05:622a:47c5:b0:4dd:584:1429 with SMTP id d75a77b69052e-4dd05841fd0mr134553521cf.81.1759047914472;
        Sun, 28 Sep 2025 01:25:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHwfsS0Q7LOoaRPfQeD9zvDgobB31SXOr4kE+JJnvQnCOXD4rZ+uP+6M8YxXGzoygRLIGjIwA==
X-Received: by 2002:a05:622a:47c5:b0:4dd:584:1429 with SMTP id d75a77b69052e-4dd05841fd0mr134553161cf.81.1759047914018;
        Sun, 28 Sep 2025 01:25:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-583166561c0sm3244298e87.81.2025.09.28.01.25.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Sep 2025 01:25:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 28 Sep 2025 11:24:51 +0300
Subject: [PATCH v2 6/9] drm/msm: hdmi: handle unsupported InfoFrames
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250928-limit-infoframes-2-v2-6-6f8f5fd04214@oss.qualcomm.com>
References: <20250928-limit-infoframes-2-v2-0-6f8f5fd04214@oss.qualcomm.com>
In-Reply-To: <20250928-limit-infoframes-2-v2-0-6f8f5fd04214@oss.qualcomm.com>
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
        Andy Yan <andy.yan@rock-chips.com>,
        Samuel Holland <samuel@sholland.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2210;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=vJ6MP4HtyLt5a75BuYCv3CbEFdh6+KuelPeaDQZ+OQQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBo2PDUyU7rCSa5YzapriRO9eRiYkhaqCHGmx40e
 u2QgQMrjL+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaNjw1AAKCRCLPIo+Aiko
 1c1+B/48g8XIA1mGiOfBerCYJp2Fs5T0zJCKW9Jx4v3PO9b+8QxLYHib6tzym0IumYyly/k7z4p
 aUIpTczb+3zc4DGKfWFnoVBBcTbT+7bBq4805NeNbG7sEYGN5sH64Dx1u+jhfGRODdGJ/E+hDt3
 JpTbshDXWQN/kpzysIXBESgmxv1QN9TZLzCY36KK8KZcY2UZJZ3BuJ+BsHvTwvqrBLm+DD9MXZw
 vI3gknUTNjHrk5YskzwrvFAzYF9tGB9mA9SHw9SegZAAmf7YWzW8SJldbp4vPyMDTLmT6TOGA4F
 JXeghLBFIPITZh4fDuHuLiz5X/nbdlBhKMJwMBQJqDnFjqqw
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: bCxlEwY3cJwxU14tWIYcJaaAE-Ezslh9
X-Proofpoint-ORIG-GUID: bCxlEwY3cJwxU14tWIYcJaaAE-Ezslh9
X-Authority-Analysis: v=2.4 cv=ZtPg6t7G c=1 sm=1 tr=0 ts=68d8f0ed cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=B-oVSsyST8MYkDpc_wEA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAxOCBTYWx0ZWRfX/faQzsLTrS0r
 Fx7kReoMjEHVqHWFYgWRYD3VRxNm/iidMn2jJIMP3lN+A8MnDLDVNuqJNR6+97UEoYK9eHN48b4
 QbTOlORpdA5J0tcK8LLLYtspUBackrg//ZoeB7COy9doWL12tvzUGrzFyDE7H2mFy16l1QSB41L
 dyKFhbdLC7X2CcX8uOLi6u9V6Xt1TpOGxc9hpUUoo88e7oL6I7aQKekfeGXP/bdXqBZ+QiwU2MN
 PMAWhfHMb3apq2qIJb4PfnEQOBeOG3Wy5odjzOeP23WkI9Dh4RYC8Ub6wQe6dPt+SJrpRKJM1rA
 A+W5LfE6Y99EiF47EEX9igWsma1Gf2nswChCCtNWMEsLt1mbJlRAg2Tys9+vaW2QYUqHWLYRVTT
 poZD35+ETt8sa6clCURTiY8f9L49kA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-28_04,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250928_092528_475157_2DF432A5 
X-CRM114-Status: GOOD (  15.39  )
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


