Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4E8ECA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5XcVN4la18BIwaO+Gw7JIQ9/7PnLHljWUo62csPu7Ys=; b=bfVm+DP204O7n6l0Mnr5ilh1BN
	9KxW+4jOY7VmBCxF7W4B7mRshiafr7RBNM62w97257AaYYeND9haKsx30RMkz3UJyzlX7Ev8t3qIc
	xSB1ZfafzMQZyo9f+69ThKr7PEi5EuOYU+BzdxIj+KMnSw8dupC9RItSsvXs9EFJsRqxbCuxoJr5s
	XmvzNRj+C0QYovA+fAa5SzE0OsjxdzYRDuBOl2Y4QUZLhi7SdkUcJse+N1//pfGsbOinDIvV0txFJ
	lOAi8kA/d/igxKxZ1C6RfbUwV6L58ARdJhWIN6fJ3CX4c6bJcPHTxqb+wMo53Cfdxri2bs+QRhdio
	FzkoqXuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw22N-00000008yVm-0zQX;
	Tue, 09 Sep 2025 17:21:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvzhq-00000007sGl-1SMy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 14:52:27 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899M3Rm002332
	for <linux-arm-kernel@lists.infradead.org>; Tue, 9 Sep 2025 14:52:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5XcVN4la18BIwaO+Gw7JIQ9/7PnLHljWUo62csPu7Ys=; b=izj5++eI83OeW3j+
	lV+SOwHzoLSPiRWmCo73yMg0KmZZPc8mkwAtdeiIcizeR8nnTYEd2RCNYsY/w0+G
	aAbUTV6DA0kcfHdnH2UDbpkG34PYV22/AuSu/mbo8coycZW4c7NUqKbRO/rnNACl
	CG7leAvrXzxEjqhBJpxcryG0hhQ6J0wl9UHv4aZxALseIugZuSuT/BFqk9fYy0/a
	DXFeOxIGBEunloPcgtLbqavURcRDcM9NqmXGDo54C1b+A+0XornFwhs3rZpw5cXN
	KbV+HL6lCeDkQjbBw4q7CNWJ65kO0fspWQdy/tUmfgh9OsDJrGKnA7mfFSoMJwAx
	elV0Hg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490dqg0dyf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 14:52:25 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-7211f13bc24so119851916d6.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 07:52:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757429544; x=1758034344;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5XcVN4la18BIwaO+Gw7JIQ9/7PnLHljWUo62csPu7Ys=;
        b=PmQTsWGwS54lH95Ez5jrcWCvjS11N9J3A+s1qcdSjKXXEucEovjYiXFicvz2bO50g3
         9wOaDfrOmCfq5j+yHB2TuH4yBQnz16X2tAySEuHcz04WN2wNLy31WoUE2Or7nTXZ5UnJ
         na6XRwe5z3x/43p61iT8htWbJ48PYwt/9aGLveFlv8nCwk7HNyuQfteQeDSk5LlOBZdF
         sY8JAd4f30UrrCguJZkZtHVeRynJ71i0bMmV34Bq8vpmG3qf57AfQwj9UmJw0Dla7yUW
         NYqSKCg+ja+M5Vg6yRlxNjceK8CaETf8n1xrZOlJ5JnFSJh0GxwMtRIBQo4MsLeXLR9N
         SGxg==
X-Forwarded-Encrypted: i=1; AJvYcCWd4NmRfqM2leP7ZAvRKJo+DnfwtHUANIoztraTY1/Yo1KQvnVpHA+sYcVfW7q1MexcMLQ0mAyi8RdsOjDT/1q9@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7VixKx1flChkKaxPMP01M3StrOExPocRLRfozFMM5IYcSa5DL
	CP+1n7wlB2wgtu/Zg4wC2GIUTle6+GD0uyfjIobevKPun5ayAbI1uHxGmp0+NvVe5UARR3BW2YT
	SdxDdjGn0awl0esP1xYUpe+3TwUIatzzRHdz86uKfNZ/+knlmE5stSoUmzPInW/YLh+xdQmx9Ux
	yeLg==
X-Gm-Gg: ASbGncu6yRATAoRCwrYREz2p2RfHPnj4TAQdvb+1PIsid2x2rGWF6BwFqb+U3PWNxwe
	beb4CH8r4HHbz5xpYkqorZmvapYHdgOCub99fY/uXJd60wf8Z5s2N/Ddpl3ur0Ss4Mcv6fcymgK
	/gde8H4Im3SGrQ08qWNC2c6kUTJgSRkA8MyVj42SgycbnfL/4vpKjv96UvciRz138KMRyJ/vwLc
	8rOeXkd1iqaHu848hM+hTzW4miQvDviJSKw2uxgYGO07nEb/u9vJCKIbSLRqu1eYj6PxUacPBZw
	3a5UBzb548pTmtWN8HRBQN9CLPLb7q2pDZ1xILTMjNIayeoLBjrTPlGDrIfzYoG9ubINdWpWzDp
	nKFO8htAMQL30WMhXoX9aaoQ/EIC55XccVvpxWR6MtTJgfpdCkFr8
X-Received: by 2002:a05:6214:448d:b0:741:12df:785b with SMTP id 6a1803df08f44-74112df7c16mr114471466d6.43.1757429544085;
        Tue, 09 Sep 2025 07:52:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE3qcUmc5HWgaItJBSMTFOPrjz9C1oV8lSQudH4aunMS3xSVXsDfkPrjvpJJ3ZzD90MSTY/GQ==
X-Received: by 2002:a05:6214:448d:b0:741:12df:785b with SMTP id 6a1803df08f44-74112df7c16mr114470966d6.43.1757429543548;
        Tue, 09 Sep 2025 07:52:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-337f4c90eb9sm38735781fa.22.2025.09.09.07.52.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 07:52:22 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 09 Sep 2025 17:52:02 +0300
Subject: [PATCH v4 04/10] drm/bridge: lontium-lt9611: declare supported
 infoframes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-drm-limit-infoframes-v4-4-53fd0a65a4a2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1743;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=UHf2bwt1HahWYSjc39yV+lZLDN/VOziYH17k6fxHegA=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ8YBe6mOiGmmn935q5ct0cr/1pS1u83FZ5P13mkK/k89p
 azua//tZDRmYWDkYpAVU2TxKWiZGrMpOezDjqn1MINYmUCmMHBxCsBEAuTZ/2fxTphaase6a52x
 1oaTii/vV/TfvytiaMfGldjbGWgZYH9IRNfivDu7klVbM69V5pWcToEHezsZP0/Ke8Hklx9XWGF
 U1DXfrp+78se8z+v/SU+zv7VzBWOSMmtrQ39OtLml+TUW0xclu5P0Rbnfbeq4Ulpy75r6FrNT//
 V2rdsewHFOepogxx6zj3PP9zLlhZXMUJPPvBa6tJz147wmyy5XQ0OHuEkCc+5a2om/3/Z4sXH5r
 pczrnzn1GcPfpmruPKrveGz0mcMv9qvrWzr/V4kzrPWtsBw+oHIu9LLN15OlGXwdD8mHFBWveqM
 UK1S4KQ6xZUsB/Y/zVnW88I622/h77iPW1/HpF8J5NsMAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: YDRdVnhdKU6SdiXbkYBBVYtsN1NVGHUq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzNSBTYWx0ZWRfXzavbO5mNDPVG
 RzLrPjkGf+yFN0ZpsfyoS/tJ8vWQRz7JgkF4kmzC3C0GcF6e3rDpgUgfwBypbAXLDdAKc/+ueQL
 gsgaz3melXVu5GoXABR49gZZE6U31HYCcyKFP+yrAHS6wPXSvtmLiLLaR7ypwXzqjHLjHMqFg8Z
 BSQJJf5ze/s+OBvIuZKUa/I8TfRIHhRo0XAD2fHMoVjdpQ/4Bf4duRCcwxT4YjuAGdZJ2DmlM5d
 7rGGzO65YgZADSvrfTSEjDEOs/sxmwq4BBQSyirlVRz1Hvgkwn9nxK03NjXcU8xLXkClU18rb+L
 SzPvy4C6zNz+IqSWxXMeri1wJC50Q65jy5XVuqcMMYs4WoczPs3q25vDvvvEwYiQDZHMDDuI00m
 TO1Pa7Tg
X-Proofpoint-GUID: YDRdVnhdKU6SdiXbkYBBVYtsN1NVGHUq
X-Authority-Analysis: v=2.4 cv=N8UpF39B c=1 sm=1 tr=0 ts=68c03f29 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8 a=AMvF8s34Jxw15HKoVo4A:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_02,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_075226_382413_8BFD3CB4 
X-CRM114-Status: GOOD (  15.19  )
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

Declare which infoframes are supported via the .hdmi_write_infoframe()
interface. Return -EOPNOTSUPP if the driver is asked to write or clear
the unsupported InfoFrame.

Acked-by: Daniel Stone <daniels@collabora.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/lontium-lt9611.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index a2d032ee4744715b88eb66883edf69bab4c274b0..019114eb343764dbc3da36ab02d53ece11f46adc 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -870,8 +870,7 @@ static int lt9611_hdmi_clear_infoframe(struct drm_bridge *bridge,
 
 	default:
 		drm_dbg_driver(lt9611->bridge.dev, "Unsupported HDMI InfoFrame %x\n", type);
-		mask = 0;
-		break;
+		return -EOPNOTSUPP;
 	}
 
 	if (mask)
@@ -911,8 +910,7 @@ static int lt9611_hdmi_write_infoframe(struct drm_bridge *bridge,
 
 	default:
 		drm_dbg_driver(lt9611->bridge.dev, "Unsupported HDMI InfoFrame %x\n", type);
-		mask = 0;
-		break;
+		return -EOPNOTSUPP;
 	}
 
 	if (mask) {
@@ -1136,6 +1134,11 @@ static int lt9611_probe(struct i2c_client *client)
 	lt9611->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 	lt9611->bridge.vendor = "Lontium";
 	lt9611->bridge.product = "LT9611";
+	lt9611->bridge.supported_infoframes =
+		DRM_CONNECTOR_INFOFRAME_AUDIO |
+		DRM_CONNECTOR_INFOFRAME_AVI |
+		DRM_CONNECTOR_INFOFRAME_SPD |
+		DRM_CONNECTOR_INFOFRAME_VENDOR;
 	lt9611->bridge.hdmi_audio_dev = dev;
 	lt9611->bridge.hdmi_audio_max_i2s_playback_channels = 8;
 	lt9611->bridge.hdmi_audio_dai_port = 2;

-- 
2.47.3


