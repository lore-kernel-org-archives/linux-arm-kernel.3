Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E064CAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Sep 2025 01:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cNLPzEmk5Y/+u5lMsfcmn579j/z4LwU9YC3n7o4pksg=; b=wmT0O63eqB/2pgsrQVNSQWgB3o
	fvoYKvOfjTsMkGu6TJtUJiFnsI/o42IGzpbPtaTP9CySLAYts9ru81WsLjTCSN5A45zpDoAgfBQ1Q
	rlbKx4wC1dOSpDUt4QbGQ7ZI7XHz0vt8I5QDZduZK4D8mFX0pHnHeVmGHJ3Jrim7nAZ/uvm/hSF5G
	Fg+sD/niOjCdaMUQB10xBsHOAz6Tr59fHXLL7nRzFsNb6TWv8cXf0BG4MmIStnDe46qaxKLoQjjDf
	nLsuRmrFFJIw3Uu4bJ4Z3Pw54e7/XjIMcdF2lf8DPIuSm7897cWS+MhhXqBk4GEwJJI3ZLBaGCgXr
	+LEBe75g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2JNB-00000005t5g-3cb0;
	Sat, 27 Sep 2025 01:05:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2JMw-00000005sjL-1zd6
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Sep 2025 01:05:01 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58QEWpRp006728
	for <linux-arm-kernel@lists.infradead.org>; Sat, 27 Sep 2025 01:04:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cNLPzEmk5Y/+u5lMsfcmn579j/z4LwU9YC3n7o4pksg=; b=AlMqdStSStQQHIYJ
	UOpVCKX4Xrkd7ZUAxVWtGuAANsXFaMCmBCuEedLARqiO43lX5qBNa88asiWxc8ak
	54clqShnHMdCMZLkGgov4+miLwsejZDIYBP+eAA+PbpvuBzW6Wlud+VXxbcg9XVY
	b681QUXzeLvVOGaIQlw+JqnnfPXD3JjjGvRPup1qKo23Ro+jjkPJT9HVTDgvy5DD
	kIeQSyRUi62iBEVRj2j9/wZxXiDep39scjlPD4Izhotle2BaQ7ugyI7EcOlJI1P4
	pLM2dS/kt2H+p1nIZu8Q1LLFAokWZ8ykyLLrlx2i59XB2l8WjfVFvex+430ssR9k
	x5mgkw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0qvh4c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 27 Sep 2025 01:04:58 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4de2c597a6eso35834101cf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Sep 2025 18:04:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758935097; x=1759539897;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cNLPzEmk5Y/+u5lMsfcmn579j/z4LwU9YC3n7o4pksg=;
        b=H1V8r+MyNAJZCu9818Ei1bkPoTCDFGLC9fzBq/gs3yPLIPXD+a8RTiRBCj5Ue89AaS
         5DihsKaK2hPk3+aTb/UaQ4XB9OPiRRl4qBE2UJBaOEPkStgPEaH60QxRBw8Uxq1lsC6Z
         jMqGNgTv8I69wIz7Wl5KP5kv5QUxAvFg2uBBDeeJWP0kFmge2QElmNoRWEtu7/rx3Nq1
         6/Gcv7jQsg+dNlH6MrK9uAGrhv1nHovhntE/mdcuyAk/neTnVipzMBrzoZ1vS25p+JIB
         RIbeRb/atRmNQpe9SnPcC2K63QgTNj2hkQfuMTP7tklWQRD8AtziGelQa04cpJ4ILTeG
         3ZjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWl3GCqjXaHj4ZwuIszAcAX6pPspoy1WIyXRCfKQtW5HfLii//MUqSZkHt2K6TvuT4Uk1CQ0Ot12fvDg+AGHWvM@lists.infradead.org
X-Gm-Message-State: AOJu0Yy50Hk1Wm6CPVqhJBefYCIkpUM1c3UIcc1W0kJpLAEMP5icSAVC
	qApd/IRUfy93b0oZwqeiF+wBYCu4rjx46Ac5wYt5RmvBEdwggdcVhwLvLWYKu8iOB2VzG+Ax1/w
	5APHC1l0n+/ohWWGTOykWsToNsi/MVUToGH8y4WyQ6xnXO5cTyQElnv+QMrboNfDG/MIby1qr3B
	ClcA==
X-Gm-Gg: ASbGncvbeqOUTjYWg3x4Vwmd8Xss5yQnQ0BaOsexx3I75Eef6UJ/F+uI+QEqBA6280I
	0CvT5FtT5Lda0HgDt4v4ceu+kY8sSuf0cfG0mVyt7Bpdpvb+zqBwTTapqjSCCm0kBR74ukjD9ri
	oGywJPOxoFCPvonJKuQ4U/aqSZ2EYnIAuMqYnXoTC608xTf9Dl4zR++Mco/JzhDDdn2ifeB9Cmi
	5FFfB1OfVkMpX8l79SEjhniGlGrI8ibD1cGiWXYkEvJCh+u0UQFfpiQ8Lzkqr8bQ3snWDxaIKSh
	dVQUqq9ernH8jxuI2I3dvC7oiv4QBH7kALPJnI/gK/YIXNYvaDqyiSL55YmaHhZedNcc70IqCUm
	8vm7E6F8oppZ9sg0BDe2GVcKtCs21FKIEQ3Sf0353ptFezQIaq90O
X-Received: by 2002:ac8:5f0a:0:b0:4d8:afdb:1261 with SMTP id d75a77b69052e-4da4b808863mr135723491cf.44.1758935096621;
        Fri, 26 Sep 2025 18:04:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6/5/R3KCR4cljnetr7e3q1AUT92B8s6CxvnRXv0hsqXuU0evXlfVfuak/45jJZf6PNML+aA==
X-Received: by 2002:ac8:5f0a:0:b0:4d8:afdb:1261 with SMTP id d75a77b69052e-4da4b808863mr135723001cf.44.1758935096130;
        Fri, 26 Sep 2025 18:04:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-583139f99c1sm2156143e87.35.2025.09.26.18.04.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 18:04:54 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 27 Sep 2025 04:04:34 +0300
Subject: [PATCH 5/9] drm/bridge: synopsys/dw-hdmi-qp: handle unsupported
 InfoFrames
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250927-limit-infoframes-2-v1-5-697511bd050b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2012;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=iR5U12JmTHXUQwMeh7Ktc2ZVP6MtOB7VE/y4QxY7Pgo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBo1zggNIldS9JOxwBNJBBO53Nrz/u36O69dPF6H
 H6nvUzECrSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaNc4IAAKCRCLPIo+Aiko
 1dFOB/0VjmmhzCSGfqQ5k/1+FNgEfQHtI2+JI8ViQlZDdUs2D5H5dWvZyr4BGllpLHJX5AvRyc8
 3oVTrlbiHcWYARBX/z+3/LIvB49bl1V9nqbKa2iiLLm7jeEoEFUkRHY3LX6W6TG3yGCsyBDYthI
 KoZRck75s9gIhMaMIl6Q8cLtyUWEjpJK/bIDENll22GGKe2wR2d98eXe4IV5jD5I0QwGfGXdgx3
 T4wl1EDAw1ICP8YbOs0svPI0MPiwirFHCpfjHz9PfDMJHqq8jDrD6Ogu5qvue8cly4O2XqTbcMS
 qVqd5LNwIHYUyhVax1WQnC+vkvKnnHSsD8F2nZejU51/auL3
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: sdYBGMAY3-e0qnHuKkz8lfSbRcligJME
X-Proofpoint-ORIG-GUID: sdYBGMAY3-e0qnHuKkz8lfSbRcligJME
X-Authority-Analysis: v=2.4 cv=api/yCZV c=1 sm=1 tr=0 ts=68d7383a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=w15x51AS-uJJn6dZ_iAA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfXzI7DrTEs1Z45
 be6PXB78+5bDDG71V+t4Ha0QKC+p0o+PXTWJzHCKzywBeCgCWsFa/W4WFz8T30oRgXN59QY3wcz
 WNkMgzHNImsSrLoCC+5Ttd7wZW/mPT5uNw4LExn0PblM+7oGhK4zJvH4ZosJ5bm/ZWnmzS/Pidd
 4YxgMHSYfbyJ+2wa7XJSMpLUo4ua1BWa/poWsmhjF/sv3ZclwldHa3pfJW+KTyAuL0PdK+hn8ao
 y2uiRbGzGzDtTp8T7RbAEv64cjNSWkzXQA2oBmSaaAnBirSo1uqei8pmArUCjTK4kx8zcd1Y2hZ
 jx8RH2fZ/gBKudEU2WvNNlijE9izS+nWhJ80cNfnfRL7+M56l+VG7BNaiDrMNOszt6x6hnpG0dE
 MSVfGn0Xdv6Tez5GNLyMqmCz+ryMfA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_08,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_180458_600352_0FB062AB 
X-CRM114-Status: GOOD (  15.49  )
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


