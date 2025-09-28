Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0794CCA468
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Sep 2025 08:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cNLPzEmk5Y/+u5lMsfcmn579j/z4LwU9YC3n7o4pksg=; b=wR7EZ1c2QNNgo2ws1R28g3UXdg
	edhpXKSJNgfsQgaTqmVgU/nLtKWVo6BofCo3JYhYPfZeOH0ZwZ5mTD06P/WCiTCM65SXo7D++JcFV
	mTKHdRbRYkbKyB2JEYe83m4kZCwr66JvvNwAMbJLbFLLW7kQj4ZpOs7O0yQ/D9LJfRz+aQoAuaM19
	iSoWFM+bC65lUhmpfz6DsH3K6fkWmgsNyufLzSp0k11M3CBhLddEYJHEeWxdxycm+hvNtm+XO7XJN
	vEs/+CB5lL7BLNfrtMHzaO55a2/CNApQw+THO4JQ/TwGeADSr/FIG4yCe+07e/UwGKlhtuojSWisR
	ZICBTvrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2mj0-0000000EJvW-3E2M;
	Sun, 28 Sep 2025 08:25:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2min-0000000EJem-0nUh
	for linux-arm-kernel@bombadil.infradead.org;
	Sun, 28 Sep 2025 08:25:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=cNLPzEmk5Y/+u5lMsfcmn579j/z4LwU9YC3n7o4pksg=; b=DI/vtK7B21Ak3n4l4ejTupbpBR
	kf5VMSAYE5P1mOm4t+t/krLqEr2mvz1ERsYrZXuko3yIK0VGbv3Mvy7SF26+DxuBK/4ZgW9NX4Msk
	CDIhetx1dS079nmdCUnyV6W8diksn0RhJqH0SoTnI4lrGbPTXKuQGAr59O6e9M8k7sOpLWShxdCGH
	mDdaS8Feu6cH4UMF6dYIyaX356WtfBqHRtOHGDWznLwqFp+FWnddo79GrQhlaYzGm5AED4mde8/8N
	3TPUAGEAI0d8N+LghJCCrr/dd3eqM3EXsN4EudAmM/I7ae17B+OcAk3wB/Hwj19vREg7PuAWeY9Y2
	5b9I0XQQ==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2mig-0000000BAIZ-2msA
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Sep 2025 08:25:26 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58S4wYZp018292
	for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Sep 2025 08:25:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cNLPzEmk5Y/+u5lMsfcmn579j/z4LwU9YC3n7o4pksg=; b=bi83zbQB9R2tgYEF
	wirUexUwjhpFfFY0UQk2OKbg0pVMZFaIrb99grgYfcAzxPSvuS60r2S4jS79P6ew
	0R/VReOT7NbN0H3G1n3K7mpCYL+XKXrWwaN3rzMQOEU8IBcy8wn7MmFRFJX0prEd
	yS8hCBa6zwhUIsrUKBIL26uwcTuQNcTJPuPlXnjQUPd/nL12+gJjIvhchXBf4MfS
	qQ2r+8Pm/T+XAhF1qOHAjhPKHEz2xKzcVJ3sh1GJVFCkugr41iXG51LxFmyjQcOW
	lhG8pk855rGtpRkxEJgf7NhWlCLGoaMPr6nXyhD/uF/3yDLw725E7DkNHD0p5Ecu
	88fO4Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e78ftfk9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Sep 2025 08:25:18 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4e0e7caf22eso1951611cf.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Sep 2025 01:25:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759047912; x=1759652712;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cNLPzEmk5Y/+u5lMsfcmn579j/z4LwU9YC3n7o4pksg=;
        b=vPqb++Bp/7TJMxtPkw72YCt0VeIxWYn7nH42oeGwg9q+t6K3yZJacLsCP/Up8ziY/9
         n4mAIpsnXSJ7ZUoXdkqh+ppWuTQ1bNPiO9n3ywLD03zBYTjZ6Yu+uNTr+FPPj/XOu04h
         VFgwxugZCPp1FiecfJzCPm0oQdDdVJgn3PLTVl9jx87gGiQkbX3ilLvnzuU3pPPW1GLE
         xtW8/etGN2ttnypx3L/3pmd9AcpdbUqgZoUOVYpLD5zKdKQdU7fTzet0mC8bB6qUg1U8
         cfAjc8oOlcwkxspRazW2jyTktaznlWuBbPEzKvBQkwkGtbQi1fOheGVjjoJrdH33O3Lt
         IZnw==
X-Forwarded-Encrypted: i=1; AJvYcCXEbYHW7+9FeFYS/vQvn6I+FNa6zD/kfw9t3+xrKHpqIKAEi4D1ljGnnTujJvhk9UapT3IurFB7HflJDyyZHXy2@lists.infradead.org
X-Gm-Message-State: AOJu0YyHL8IMKxJw1Z0Q3X8rUtfPaWVHl9o80nYL2Kd+yjrLJ0+KPyaI
	D3wbAhqwh8mzPq4p7RwbmGNXtZkn7lZqWMwR0EGS07GcuLTpNmF+GkOfKCErDv1IJN4YysRZsVS
	A34K/NZDnE0NtoW8m5zRZWCJnkBRfyhoUh1cvjMaVKDu+sIHx/bllJHqJixupvP2BJeaVfLCnsF
	tYOg==
X-Gm-Gg: ASbGncsv9K4wScAW8oMCABX7yUoB8dce1pMRPps2HRBGhV0mIN5/Gb6mbYagNUKQzb9
	OSut8Zovu1pBxfCLPR0d3l4jbAh1lC6EQXjwSjIsfI401Y3lnyL51x3p9MX3P1c4JnB1C9Dxsvr
	umoxsr5ph4WhmvEq8/giOZ+kqiv8W4xhL10mIAmlDze09OvHG5rv/fx54N7cpwxSap1tQ03bAPR
	WODcmrg3c+u1vmETyTUoOw22FTMws7N/LK+3vbt63aFJanAjuY5xq3/hmLZuI5rARqjbhAiYeLO
	kAzYMexLqzPpcQpor1Kq2OMgVvqhN/cBJZljN3bf52GvODOpl0CtoCi5Fza8UsMWAgoZxeRdiVY
	tdymtsOfm8KoflLLGCiy5SrurShoC2d4N7FimvIW+6JqemjY2WZgW
X-Received: by 2002:a05:622a:258c:b0:4b5:f7d4:39fa with SMTP id d75a77b69052e-4da4735507fmr196313891cf.12.1759047912072;
        Sun, 28 Sep 2025 01:25:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEXsNIqfoWB2H+g3E1uE7PflKn+OGU11bpC3EG4TSX+tOi58fQrR/+PvIxxQkzsDoINK0iC3A==
X-Received: by 2002:a05:622a:258c:b0:4b5:f7d4:39fa with SMTP id d75a77b69052e-4da4735507fmr196313521cf.12.1759047911446;
        Sun, 28 Sep 2025 01:25:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-583166561c0sm3244298e87.81.2025.09.28.01.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Sep 2025 01:25:09 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 28 Sep 2025 11:24:50 +0300
Subject: [PATCH v2 5/9] drm/bridge: synopsys/dw-hdmi-qp: handle unsupported
 InfoFrames
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250928-limit-infoframes-2-v2-5-6f8f5fd04214@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2012;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=iR5U12JmTHXUQwMeh7Ktc2ZVP6MtOB7VE/y4QxY7Pgo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBo2PDUEX9koGGtFlB4dr8wsaZ3M2TeNtH/F0ivG
 Ao7oOkToBCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaNjw1AAKCRCLPIo+Aiko
 1TBzB/9xRTCFLc/ONNr3oj8OOXRouw+QTYNOU5f3JvtCOChceyttupikcLtdeTwZUNnQ+LumCqT
 ile+f40xQ5vMYzvLlUmK/fUbPKvvn1ia9+k2z7R68rQDaok1yArO5t2M2U/Uf8yPEAqoHzA8EUz
 6YqzPUCnwBfY9zmldmLJfigddiCMVTu62ZV8uV2xtDXmlrDncAvjqgJb0swzc0biTVWhFqJVjmu
 oxMVUv5+94HI2TQnr6d/PdGBO0hh13mD/NANYX6ZDy6I0Mj3/W2mz2godBTL/jMTCBGzKQUI/62
 fzmbq0BI1/SRZVAezrileWo2gMjGLedsHYZbKl8m09Hph8sE
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=DZAaa/tW c=1 sm=1 tr=0 ts=68d8f0ee cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=w15x51AS-uJJn6dZ_iAA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAyMiBTYWx0ZWRfX8K7FEusqaf/t
 74RDejYQ9Hh5GHHhvUKsOCwbAiun+a1XVIrlm5z7l9doEYjsFW52LgjjcFTEPyAXE1N5GjesL3B
 nD575P31wIP0FUza4xa1AVu6NvStz/ypKKkC/jPXMl8TJKzBtogxgzaq4aeMfOJhqhfBzL+vnUj
 GrOhcbmzcPz+E6q9z8jFMBDxRUyv5C4qWm1+/QBb0121ltAcj+hBAof+8HuTFjVK5Xda7jcUAII
 JahI/JpS5HIywbLnH+oohtXt+hGKkxhQVzOKFIVL64vEVnyyf9NB0z0aEuDZAF1p/Nw7UOqoIXM
 oN6tu8U8XAnEfNIqbxI6btFbQjXPBzHdIzYfGfF2e4sHE9QS+s6GGVHd1QRYDs+wCiM6qC610Ba
 Fy7FTfR96vw7+OnoArPoYdtg/GfO9w==
X-Proofpoint-GUID: MCw3b_LxNxe48zHxip0s5LBrO8kbBbSq
X-Proofpoint-ORIG-GUID: MCw3b_LxNxe48zHxip0s5LBrO8kbBbSq
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
X-CRM114-CacheID: sfid-20250928_092523_872456_413C1083 
X-CRM114-Status: GOOD (  15.35  )
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
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
index 39332c57f2c54296f39e27612544f4fbf923863f..9a77e880b7f58403691338ee8c22d24af570acbf 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
@@ -935,7 +935,7 @@ static int dw_hdmi_qp_bridge_clear_infoframe(struct drm_bridge *bridge,
 			       PKTSCHED_PKT_EN);
 		break;
 	default:
-		dev_dbg(hdmi->dev, "Unsupported infoframe type %x\n", type);
+		return -EOPNOTSUPP;
 	}
 
 	return 0;
@@ -960,12 +960,26 @@ static int dw_hdmi_qp_bridge_write_infoframe(struct drm_bridge *bridge,
 		return dw_hdmi_qp_config_audio_infoframe(hdmi, buffer, len);
 
 	default:
-		dev_dbg(hdmi->dev, "Unsupported infoframe type %x\n", type);
-		return 0;
+		return -EOPNOTSUPP;
 	}
 }
 
+static int dw_hdmi_qp_bridge_atomic_check(struct drm_bridge *bridge,
+					  struct drm_bridge_state *bridge_state,
+					  struct drm_crtc_state *crtc_state,
+					  struct drm_connector_state *conn_state)
+{
+	/* not supported by the driver */
+	conn_state->hdmi.infoframes.spd.set = false;
+
+	/* FIXME: not supported by the driver */
+	conn_state->hdmi.infoframes.hdmi.set = false;
+
+	return 0;
+}
+
 static const struct drm_bridge_funcs dw_hdmi_qp_bridge_funcs = {
+	.atomic_check = dw_hdmi_qp_bridge_atomic_check,
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
 	.atomic_reset = drm_atomic_helper_bridge_reset,

-- 
2.47.3


