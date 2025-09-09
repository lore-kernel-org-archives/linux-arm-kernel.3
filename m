Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0EE9CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kdVSeIKuXTDzsb1f8YtSPNgLNA0VYyyck2+ZYEf3zp4=; b=x1ClKUwmC+9cHN10jqdqgdKqMI
	P7FahWxy2ASsToXPxRe+2lhDqDC8g76tLWD3usZ5lmaC0zFLc9lqOFs/aOQ7Pqhoo4D33nRWOLWDG
	vHg4fSjM8utIZE3qlPkflzpaoNMF2j7QRc6yNHTNzcFzN1/iqiTqsoQF+amoxy8vABL8fqW773q7U
	Vx4AE+PfMG33Tr6Bm4+kK6GYKgWlmgyfqcznEGunf9WzP5LLwyQHBFBEgyRN3Ncm+a0DisTyyLdxg
	mcJFzLam4SzqiviBINuU/85VxCqjsGz6e3rg9fYw+LImad3QBif90NRdIblSXnArh8YlTVRQl+9mU
	aiE7pDxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw22S-00000008ydK-0LfB;
	Tue, 09 Sep 2025 17:21:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvzhs-00000007sJO-2tQL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 14:52:29 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899LQWc009097
	for <linux-arm-kernel@lists.infradead.org>; Tue, 9 Sep 2025 14:52:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kdVSeIKuXTDzsb1f8YtSPNgLNA0VYyyck2+ZYEf3zp4=; b=KguWA7JRiHwdSubP
	gIgUX5U8rJR9evqjY/OTKPWycFLytfleVbA3JGx05fJeSXD3vvydeTWKz22i+pBd
	JuYFQbNhLbrnJZnDJjMkqNtTMOxstH+8A92uqWWw3Vs79nIlSufsK50wv/MGonH7
	MNKOUI/ayf5VG0UijxTtaTt7KxTJ5j0IN3FvF4gW2x0GIiL9jffURHxo+WmeMCWb
	p6kbZqrnQj1H3NOT1ARpzJ5mFYj8KZwPyPUaGB0GXAqEv3FIAOc2cDjtp0OnBZXe
	/rMUikho++7PUVS/Ajssxzic3MbohvRDyedLi1TGyRxB6EWqv75/SrFaYrL0OFqX
	Ws/yFg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491qhdwcep-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 14:52:28 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-718c2590e94so157521796d6.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 07:52:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757429546; x=1758034346;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kdVSeIKuXTDzsb1f8YtSPNgLNA0VYyyck2+ZYEf3zp4=;
        b=qN9iVeCQc7SeyG2iNLNREFCyZnYlJnA9TP06d0RjGMwkItzjsDFqSSR+UABwnT77nW
         Rp8cE/ZJcf1cgJwdfzHY3fGaNJP/43XOn6egCSaOP57ooJBwBGUHjbNuNaA0TEtva0wH
         K96IN0MK77n+cdRCFD8ZxuramiGHOxLKqDZeVFbgkUC63QbhIendDKKRB1KBAZXVj0mZ
         O537d4uAEG8ypKxEwFY7WSlWGiohoZsdGfMev1aU9cJTui1q4NQo9I5DDEFLJkUJXgKg
         QP5tl/+77JAYdfNXwNDL+cu4PklG5P9Tu4yGVcaGJtol+bhqn5AL0nO4egdnkGuCooTG
         CuHg==
X-Forwarded-Encrypted: i=1; AJvYcCUeZWg/NV6HcRfBolYSZkoeuC/fLgsws6mORuRxUJcGROLt8qMqpk44M9GPSJQC2GDDPtawkYebydNd6k+59UqH@lists.infradead.org
X-Gm-Message-State: AOJu0YzafzzVq1m90TzRC5MWFeRSzoHrbBBtn9XLbmer9PsYWVWREA4R
	3R1Z74/ULieN3yiIRAJCy0nkSNUKMjBeCJw0rxJbM5y5wN+0l+ly/+A+/jdoeHS4EuuuDZDs0Q9
	KLnogaBZEDPUMv4nHNB91YD4ILRyeJ9wH1DE6T+MjclgWDQFjwqt0QDsh7yCIanVQRzbJuXUOPT
	D+CA==
X-Gm-Gg: ASbGncuudOw2swNNIGc57SFwb4i3ITqGEm98NudDu4o26mQxWFHOfe9BHYG4s4fw4DB
	rfEO/6qzHSx0xrtROYC8d57gOK26eIBb0TVoqCdalwW8mFvtFpXWKM/Uj2Hwqrg6WhHfyKCLvsR
	vaWFO85N8bE9CLdVHi/au6aMAMn1tmqKFJr7NATSG9checbfELH3A7NFQAwARSnBQynW1PIQCQv
	E6pG0wmtGhYctAko0F5Z6d3Ndhyqje7w2wOCpMgmqV69GecH/ofXvC3jty3eMkmMDHUCQvDaXLu
	vV617GWVIGr1LjrEUKJj8ZKSSzo+2KAUMWJ5zrHLmIDvrvsn9tTUhqO1tR6qg8L2CPGCFF9C/2C
	UosxtE/2ELlN8A1TQ6XjF7N65TBBhDh35E3PIXcxfZiijVb8SAr8q
X-Received: by 2002:ad4:5fc5:0:b0:707:6cf8:5963 with SMTP id 6a1803df08f44-72bbf3fb0b1mr158064496d6.9.1757429545951;
        Tue, 09 Sep 2025 07:52:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+0czZpNTxq9KgOE3QwkI3s44ERVHWu12W7OPI2XDlhVfpfdH+nJD0CIFl4aY+6gycdCccrw==
X-Received: by 2002:ad4:5fc5:0:b0:707:6cf8:5963 with SMTP id 6a1803df08f44-72bbf3fb0b1mr158063976d6.9.1757429545199;
        Tue, 09 Sep 2025 07:52:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-337f4c90eb9sm38735781fa.22.2025.09.09.07.52.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 07:52:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 09 Sep 2025 17:52:03 +0300
Subject: [PATCH v4 05/10] drm/bridge: synopsys/dw-hdmi-qp: declare
 supported infoframes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-drm-limit-infoframes-v4-5-53fd0a65a4a2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1676;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Aq2mDEHmgp1SiIn37OLqW93okHrHKspB826EOGNpiU8=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ8YBe+mkx4yTHKo7u9dMr8stfj3H6f7aW3MzQnfyHjz6Y
 d670FTJTkZjFgZGLgZZMUUWn4KWqTGbksM+7JhaDzOIlQlkCgMXpwBMxI6J/X+ugGhLp7fzDxHn
 IluFvF35U3R8m2zjXqrUcp+8eGctR8zvKoEMv2huvaqa0C7Gmw8y9KayMcf+b54ZxjJ9U0rci6M
 HOQP7WjLUmt1lLnvpam+r5YpQLJ2Xc31u+95Tl7bdPdhbN5ujXq7RXfdt383Ud3UfbCZtXb/O+C
 b34cavM9/O9Z2vF+Dte+1uS2qCitekI3N5K9f3KzX1h4d9U5ALsLZjvPhW3X7rwx1CC3UX998Ov
 5zOOMFx5oavPjJGdaZuJ914O63uJvJ3lNx85rzc8VzqX9ljM6/n2OsfEI+5E7Xhyq7lFyXrIufZ
 Xc6y/mFx495BzWAPF8GyjP+euh73dzUVJq1vuf97SkUoAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: kCp8aw6tftsf6O4AJFxzUMcPsQqKCw-w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDAzNCBTYWx0ZWRfXwIppMFXTDObG
 aL0NFhvs9GJkc2uroyE6rKSYr1BknY2wT6QTdGHy6lHzuKayRZG+zspMo2xuiSSkdm+Xfb43LBS
 FLp1tBeRW7ow/IcN2luzK1ZRL0VLoGZzr3chDzVfy+2BKRKBhwb2S8SI4QZpjNvBrmLDkWD/YgQ
 78XUXbd0pd8ZQaCbFYK0Vpl2l+jl3kAp7qdta9FNpatVDnI9I67zjKtIK5pPtTlgePgBPj04e9j
 Gdxd1EQQXjEZ8jp9yZqT4zrkScxeuJlAsDWnQr0izhMv2vBd4c2JdntNJiLRqr9o4bvpkiXvMX3
 ORxOQArDxnPsGfGPDesPKhxtJ66OykSJfl+RLpVGh0Y6rtJpMn+qocmXVWLzOZvF4q/G+lDe6x8
 Rb9lMvLX
X-Authority-Analysis: v=2.4 cv=YOCfyQGx c=1 sm=1 tr=0 ts=68c03f2c cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8 a=vfAEGMZ_7ZOHtlG3iVcA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: kCp8aw6tftsf6O4AJFxzUMcPsQqKCw-w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_02,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_075228_729252_B01495FD 
X-CRM114-Status: GOOD (  15.92  )
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

Reviewed-by: Daniel Stone <daniels@collabora.com>
Acked-by: Daniel Stone <daniels@collabora.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
index 39332c57f2c54296f39e27612544f4fbf923863f..9a195c479bcaf112f67b6a2f085402d0e33896de 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
@@ -936,6 +936,7 @@ static int dw_hdmi_qp_bridge_clear_infoframe(struct drm_bridge *bridge,
 		break;
 	default:
 		dev_dbg(hdmi->dev, "Unsupported infoframe type %x\n", type);
+		return -EOPNOTSUPP;
 	}
 
 	return 0;
@@ -961,7 +962,7 @@ static int dw_hdmi_qp_bridge_write_infoframe(struct drm_bridge *bridge,
 
 	default:
 		dev_dbg(hdmi->dev, "Unsupported infoframe type %x\n", type);
-		return 0;
+		return -EOPNOTSUPP;
 	}
 }
 
@@ -1084,6 +1085,10 @@ struct dw_hdmi_qp *dw_hdmi_qp_bind(struct platform_device *pdev,
 	hdmi->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 	hdmi->bridge.vendor = "Synopsys";
 	hdmi->bridge.product = "DW HDMI QP TX";
+	hdmi->bridge.supported_infoframes =
+		DRM_CONNECTOR_INFOFRAME_AUDIO |
+		DRM_CONNECTOR_INFOFRAME_AVI |
+		DRM_CONNECTOR_INFOFRAME_DRM;
 
 	hdmi->bridge.ddc = dw_hdmi_qp_i2c_adapter(hdmi);
 	if (IS_ERR(hdmi->bridge.ddc))

-- 
2.47.3


