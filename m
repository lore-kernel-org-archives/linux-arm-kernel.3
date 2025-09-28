Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B85ACCAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Sep 2025 08:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=duD+AZtcU7jXcfYcs9q78NTnBJdfETmQFkWPO1aJGZg=; b=tVQAw6gTpFutlt8oCyyeuDqhdw
	jAYHyOtDkJTlJuA5NNK4uB40GjFFSopuBAG6jyY1KRmy0Y0EzyNQ6VTVGPVbxl3/4C5Xtbz6uXHDZ
	1H+zrtdZsZz0ooWTxlNAGo8ij1gu6E0LhtxbY2STRAIIuF3zB0xRt8oqI6VupcR+eXUBQlJ4SbHke
	k3ueLlx6aPXBVO5JMgq9fAv2EWqTQAQDeNVaKgW+ZjBCWL85WXJvDGmFGOAoTktLKS66MWPbwcR6E
	+Fc5kWJHFWDGNZ7S8WyAWg1CvY6IxaeHKaUv/GeqRO0NElpNO3yJAScOm/UXwV8+OVNVSN/NX3Esh
	eNYyZkeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2mjJ-0000000EKDD-1OzC;
	Sun, 28 Sep 2025 08:26:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2mio-0000000EJgR-1hbw
	for linux-arm-kernel@bombadil.infradead.org;
	Sun, 28 Sep 2025 08:25:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=duD+AZtcU7jXcfYcs9q78NTnBJdfETmQFkWPO1aJGZg=; b=Zq5Yf7pEUZeuCGkUTMHwyhqogk
	AG324kzHPqQ0k2dh9WUjm6cCLMlk1QCeOM00qombrIDFINwKncwJ5lEsON5z3XLaXFmDSarstFfqh
	9ilCZevV6YeXyA5wuxjzl4dzyMVCu4ANj+c8M3Xdsa9zfra93mcUbJ/VMtJ1c6itbuc5BSOAfQRlz
	KDWth4Ux8zCfW3iZv2mBn0m62aKgLMDUyMXI/mGoDsSVPR/OUfw6rVLHSj2XtknqMdT2jkYa8mY6p
	3qUTvDdHuGq/QCK9vB9E2JSuRYOChMO4ekZjqP483MQK2/HP7QXtJBFLzBSuXyKbWNzC5fS9n6xeB
	RgTFsbSw==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2mig-0000000BAIa-2pSB
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Sep 2025 08:25:29 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58S4NOm7019182
	for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Sep 2025 08:25:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	duD+AZtcU7jXcfYcs9q78NTnBJdfETmQFkWPO1aJGZg=; b=ZIz9ldXKvoza1vyG
	ANGsG35rbrWvSDEKBZx4T/x4TOfq6xaMBz23GKsPXm2lmhuonqnh8t9C3QEBtdi5
	Y5ehokjmfi0VWgmUS7ZGZsHiDt80n8wihAudBicKlSKLXgqSvtIq0eIDddewkvV1
	/oGw1x9XiikZ9SpykzOG7FBfsfT0ScdLYie1l0/YZDRMBIqATBGhXyNt7VxZR8VJ
	+GqUrM6iUCgAcTqlN5IwB6FUL6hamlb07036I7Z/jO+6eRmpCZrxfa7ntn1biLPG
	TsNjal6N2ANv5GbZHg8s7cDTDh36ltat/Lc1AmwgyX97gGMoiA8VfdT5UHCfak37
	wKCitA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e78ftfjw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Sep 2025 08:25:18 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4d7f90350f3so81161161cf.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Sep 2025 01:25:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759047908; x=1759652708;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=duD+AZtcU7jXcfYcs9q78NTnBJdfETmQFkWPO1aJGZg=;
        b=M7hoDZIn/LQGBag243l/xFp3TNOqY3lm6laBSJ6yZ3ktoDatd4EpcZcxsb5HTukL+w
         zwNZepVD7aTBLGYC3IksvMa1U2A6szczvLnL6+YTokHE6RbMc+qwpqIdWAUP+Kuq+oT0
         B6drPWFtnymr6MAIxSSy5xrG4mO6AKPWBzK0ZrFmuB4KXcszF97RmOMjMe/ObDGS2Ij5
         TBJa3LtjLlqTF3ewlHNHw6CW/7HbNLHnCQ0eVDO7OhJQdPQWa62xP3mCjaXan+ECIgPN
         OmcCzgO82Ukmf6MqlsGhbgDmIG7xHPD7qoyvA5w4ISJQ0UZabjq9mWqxaczTRrNISSYq
         Hy1A==
X-Forwarded-Encrypted: i=1; AJvYcCW/n5moZiEs/uJMm23FlUX0kHCYk1XvZgOZYsxr30zP+GaL+EiP5xVSnIpJ5SNBbU4aFuqvtIIcQCshUD2fb4jq@lists.infradead.org
X-Gm-Message-State: AOJu0YxVV8eFib5LEzw94KY9oNZX3nHE5KfVSZoK3aPp6rDe/TlRm0kx
	zv2msvVSN4Rg6UEzp5TL5iM5WyO6jYE4WTfp5AQENhmwzuOpK+BucmVghpMp6ledPUs9Kt818jx
	XdXH+U9bJQsnjLxQDqeT3eoZzPSwmfp1BWnlrQHYP4AdNp/k5wSSI9+xRwb4oWCVzIlSer3+6n5
	2lBg==
X-Gm-Gg: ASbGncvVbnYfh5d0kEU6URedBYtFsmGWO80mY3KOI/rVY5sYBi4ZAI6aI5toHwDrBqz
	F5PRsP2eu+mhEAQUXAbHr3RqlwB8X5v9ZW+aEfk7hgRVnmVx8SxS/makZVmqJoZnyqbz1j8U3X4
	52iDCPse380yEeTVEDBSNsx5OlVSWguk2odeTRadv/kyW20YzGbhVbbd3x0Rw0cEIgUSt2JpYGH
	Bdb+VnuQqFz07zU+4I8t7fNHU8qrCq4skLao1L0yyCtzWEbPRVQ0BGfHDuLtwenudqAjEfPzhcj
	ue4tYcTNViwxRDZC1szXi6CitWLuzj3zkayudRzHR2KZADpG34U37Ut4r1ND386xY9AAS4NyHMg
	h2C9Q46u49AP3IqfO9AMXbhig9FpXATZ6eSuxJZPY7QsMUTp05dCr
X-Received: by 2002:a05:622a:5b05:b0:4cf:ce43:540e with SMTP id d75a77b69052e-4dacd52b2cbmr147456211cf.27.1759047908220;
        Sun, 28 Sep 2025 01:25:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEN9pzqLrHlVaT4nT/ykEhCfOzipwXQJ0cAoSSpI3n4X55LPnP5fq5+qWz4znjsC4wVWkA+zA==
X-Received: by 2002:a05:622a:5b05:b0:4cf:ce43:540e with SMTP id d75a77b69052e-4dacd52b2cbmr147455941cf.27.1759047907687;
        Sun, 28 Sep 2025 01:25:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-583166561c0sm3244298e87.81.2025.09.28.01.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Sep 2025 01:25:06 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 28 Sep 2025 11:24:49 +0300
Subject: [PATCH v2 4/9] drm/bridge: lontium-lt9611: handle unsupported
 InfoFrames
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250928-limit-infoframes-2-v2-4-6f8f5fd04214@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2288;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=vK8TFXgm/6X3TSi0UvfKUVov+3NPXXiYH1OJryZTxNE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBo2PDUy9QW8cx8zEuP/1bnwMnUwSTpxSXwf562q
 iouLsqfJZ2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaNjw1AAKCRCLPIo+Aiko
 1eqkB/9KIeG/QwkAeQapUIoOZBz8PG1an8ZjgLawL5OLFmRHTAAt/28ma2YWfxkvVXFuHp2gFqB
 6H2nPhVwDQgUsa2WVpeglWwrkYP/1kvjunotI+ERAR+OCw+0OBi2bitZ1wXmSM0IWTuD7DO1Z66
 t5+tIsQQMthkTRVFZfg2Nd/U+zbzV+JEHdzi4IpALFD1O89IF3UwLMzDk+ZYuD4obZXJOW4SSTH
 uG0kMLdfzCJPei04ea9Sqfyotj1bxd2cklXPqxOutI50grHGHYzvKiZ7ak6MxVAojOSlxTtAN+5
 e315w88hSpwX0p8jBaoDtUUgKZyKmjn8DmAEKFJzzOY8eovY
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=DZAaa/tW c=1 sm=1 tr=0 ts=68d8f0ee cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=XNEcMcDYeHr5uxMbIEwA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAyMiBTYWx0ZWRfXzCXeCMK4c07V
 JtUvoFyKwk+1eQS3VO7FUFM2n0P8KuMNAofAenhEKaAg0J87IDUiBhaCS+PzKkUoFJmF7Fwie4A
 4UDjv3tZD9XfSP5UvbFrDOFOIbwxPSji3zWTO3F9nGR5Qs1DYPuiiPSWivt74T+YM/mpM+SAAwK
 sfB2Mb49CaOtfBHttQJISPQA0XemBXIKaF2dVmNJzOgD+aMpLoEIKMtaGnnRlMeJx4UaptIKcHz
 EroJOENn9HKdPEDwAFfTvlqQtFfqxPCFC3vlLrjsc5AYqOovRC5vqTd4jRJ4QIaDDUXDFNdndY1
 gZgaXmRd8WuflER0L7h/qJmMd3lJKo5oQuBnMy6tgkDPtTWFHoNk6OuhK16uMDVQU81tTx3cYs0
 etzpx26INiicPTynmxm++XxiK2QQTQ==
X-Proofpoint-GUID: L7JKr_ISyrKL9ydXxM-0ddwIGChANFI4
X-Proofpoint-ORIG-GUID: L7JKr_ISyrKL9ydXxM-0ddwIGChANFI4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-28_04,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 clxscore=1015 adultscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270022
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250928_092527_462800_5DA1CD41 
X-CRM114-Status: GOOD (  16.27  )
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
 drivers/gpu/drm/bridge/lontium-lt9611.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index a2d032ee4744715b88eb66883edf69bab4c274b0..9c2c9887d2d66968eb1d50544a257d5999bbdded 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -869,9 +869,7 @@ static int lt9611_hdmi_clear_infoframe(struct drm_bridge *bridge,
 		break;
 
 	default:
-		drm_dbg_driver(lt9611->bridge.dev, "Unsupported HDMI InfoFrame %x\n", type);
-		mask = 0;
-		break;
+		return -EOPNOTSUPP;
 	}
 
 	if (mask)
@@ -910,9 +908,7 @@ static int lt9611_hdmi_write_infoframe(struct drm_bridge *bridge,
 		break;
 
 	default:
-		drm_dbg_driver(lt9611->bridge.dev, "Unsupported HDMI InfoFrame %x\n", type);
-		mask = 0;
-		break;
+		return -EOPNOTSUPP;
 	}
 
 	if (mask) {
@@ -925,6 +921,19 @@ static int lt9611_hdmi_write_infoframe(struct drm_bridge *bridge,
 	return 0;
 }
 
+static int lt9611_bridge_atomic_check(struct drm_bridge *bridge,
+				      struct drm_bridge_state *bridge_state,
+				      struct drm_crtc_state *crtc_state,
+				      struct drm_connector_state *conn_state)
+{
+	/* should not happen, HDR support not enabled */
+	if (drm_WARN_ON_ONCE(bridge->encoder->dev,
+			     conn_state->hdmi.infoframes.hdr_drm.set))
+		return -EOPNOTSUPP;
+
+	return 0;
+}
+
 static enum drm_mode_status
 lt9611_hdmi_tmds_char_rate_valid(const struct drm_bridge *bridge,
 				 const struct drm_display_mode *mode,
@@ -993,6 +1002,7 @@ static const struct drm_bridge_funcs lt9611_bridge_funcs = {
 	.edid_read = lt9611_bridge_edid_read,
 	.hpd_enable = lt9611_bridge_hpd_enable,
 
+	.atomic_check = lt9611_bridge_atomic_check,
 	.atomic_pre_enable = lt9611_bridge_atomic_pre_enable,
 	.atomic_enable = lt9611_bridge_atomic_enable,
 	.atomic_disable = lt9611_bridge_atomic_disable,

-- 
2.47.3


