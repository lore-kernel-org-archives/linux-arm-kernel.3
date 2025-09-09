Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED9DACA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rn4+Wi525+F0z3MVcWKrKeV/0wAxSecqgj2MgM3DOG8=; b=MVTVGlcDCTZxf3wWW+gw5LTXwT
	c8HsGjShORJQYT+a7l983onYB+oGNt+0MVSWON/niQImnxL6NItFAaA8jdQ23CdZ+cWQMaV+Qd+x0
	+gWEE/7lFMwK8Kcxn/OBDT8OZDpFxocmy/pqr4S+5ieaX9Dho7kR0u9LDk0yKWXchNYdJWiPLXeuq
	5cuHrFfo1jBOvao+oJ3UHDfmWGDIC4fDs+N149yktFkv3Oim03td/Sj473QOFi2FXum5pdI3niUNC
	IYawSBxfEZJaNS6OG3PhxGYybyhcpUZmKWX8FY0usKTSUS3F8sTFS8//UrvwTRxEiQ/wQQzjg3EhP
	aD3GwF2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw22U-00000008ygy-0n5o;
	Tue, 09 Sep 2025 17:21:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvzhv-00000007sLX-0tjs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 14:52:32 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899LwbA000914
	for <linux-arm-kernel@lists.infradead.org>; Tue, 9 Sep 2025 14:52:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rn4+Wi525+F0z3MVcWKrKeV/0wAxSecqgj2MgM3DOG8=; b=g7JfrdUkeQXpz3WB
	OyCGDQ9wCTBCRS5rGQFEfBzOPiI+/p79Q2bFuHoCn5lQFzB6i4qKOOgDo8O0HqF9
	XoQd/I3lBgRDrZgY5Z7WHV3lxMUZfEJA8rZlr4/DpAjL6Ab205xe7xOQdPI4MQpc
	6VkHDPT8TPU+VHe5J90awHK/zwUMKMuubVcjQtxieSdinEL10JSq0V6kVJmbySt+
	7vtXwdUZtUnI6iQN1BTe7sNWRYGKCTI6n2NKdv8e632lyzitClUIou7e29TEgQEH
	QjcG6raauWUzdsWDvMb1oj+sUUWu2ow2pbXrQXCW4x56/6OhLCoiZW/D5NTVoMuu
	F+GMHg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e4m0f6b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 14:52:30 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-722396b54a1so119500026d6.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 07:52:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757429548; x=1758034348;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rn4+Wi525+F0z3MVcWKrKeV/0wAxSecqgj2MgM3DOG8=;
        b=d/0qBtCG66Te6m4ROdGtsOHmEIH1aKxw65wdI0/DZ7E9FRWtJH8oMbDR594b7Lb1+U
         dueLmt8Ff8Uc9XMpBAhTZk4XjttBPJBffLkUVLQwmAe4m66mZqh4dXyczNALqf7E2UpO
         yWrDp5/6/gH1iV+qnBuPV8FLenxtp4Zxfyzl7zQpQ5KFFkz4S7tCsVHXJ/x/7MVhyeYt
         01exyTFAJZlBBmJ6d8Z3NFQvIoHXrOE13Q6e5wjEBUFvR2/mUD1htwLk5KmwZroQy+yu
         kIFi08c4gNJfj6YgxzJk1IEQ3ioITTQZeHTix5huUbFzwvCAzopEexoQFb/b4DXDBTAD
         KktQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnSZ+v75wKdzxjIclQf3xODNrWDf0chbwyY0x1Z/km1kMDOPMAdtUoqsqWRjrol5HMC9qSLykr4EFnLLUKBnsP@lists.infradead.org
X-Gm-Message-State: AOJu0YwnV/LxWKXk7rnfvPtvkvUFA1OO7uwa5jDYMZo0ltAGB59boHnw
	zpath28nmjsyzDUgXJmyMl963YyNc/v+DZoPYWOC0Jz7AmYNpshjEJWqfwiGkSUC/xtIi840Hdy
	9Anl0hxVhaBjGJw3KmWwaGQP4FnE4XZRHN7/jnk/jxVxj4jUV2RmRAiADeIaNZXjxGUm2nqn+8m
	Oliw==
X-Gm-Gg: ASbGnctmgMH0ZTi8l0P0vwr1s5DuePZx5w4Fad5Wk1aHJdyWpauJxYe412/2fTLuUrv
	uv4F1fLNK2ARfH3alyJ9WxwCJ00uUjfrmPhVzltd69e6NJr/fStKycSlivSmPa9SdG3EP0SRJNE
	lZk6SrV0e03pqpnLuChYepNLwbTJg+cQX1T4NKGx0qvjYR4eM7HQ6rAC4+OqSnlwxRD2uvM0cXD
	6bFa8umf+bKaoUzu72Ck/lWJky52d9kgDBAcILVxn1TcAPDPjpVaXethjOnTGO6atpIiGNbxWN8
	a9GzHRZRbcmumtZL+bApYY1R06buta7GPQ+99XzH16snSGbPXxQxlCyKLaV+mgZUKdlOpvamtE0
	+I7tAhBgj8beLnvkL19ACgrh2i+kTT4qx4QXxRj4MQCpi9dO1G9Ny
X-Received: by 2002:a05:6214:20aa:b0:732:10ae:d55d with SMTP id 6a1803df08f44-73919c9e239mr146164556d6.4.1757429548193;
        Tue, 09 Sep 2025 07:52:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEkZ1SyNAZOKwaZjgWGgZYNxsRKTBuelhQ+O6Fw6gKcHDoTAWyspctjVqKaotztS7CYCn5cWA==
X-Received: by 2002:a05:6214:20aa:b0:732:10ae:d55d with SMTP id 6a1803df08f44-73919c9e239mr146164046d6.4.1757429547463;
        Tue, 09 Sep 2025 07:52:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-337f4c90eb9sm38735781fa.22.2025.09.09.07.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 07:52:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 09 Sep 2025 17:52:04 +0300
Subject: [PATCH v4 06/10] drm/msm: hdmi: declare supported infoframes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-drm-limit-infoframes-v4-6-53fd0a65a4a2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1717;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=IJZghCboJx+n0r036AP0jF7y3adcwBpcry6IF9spRKw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBowD8b8ieAgxj637Sq4ws+QM7LjLkOdE7Yn4gby
 LcXsEN9pQGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaMA/GwAKCRCLPIo+Aiko
 1SNdB/4rCLhDfybuoskGcE1VGyhQHDNRop907iuQ/KfMohI82tNkUxmqn3fcViK1Dvdys80Wyfp
 VAFYFQHBID4DL59qRb5c/LSwkwDodGdGXF6y07zpgxsnTUegD7KDvUX0gzJjwgj9tZzVv/UQOm6
 hFYKV1nXm6oA8QLpbayUSXqTlXnckkVr0Ihc4Za41VQ1aLTz8F/M2jqh+pmgwN9myyOiAZfrt8x
 2+zvee2f6gaeDcRIlcvUKZ1zM/HLgIxJ91eERe2/sZ/wV6xMCw5TMRlCArGjeIHU+4Ha9MmneeG
 bl7XeBkt3LIIaXdjnUXmsUCAPLNsip2K9VKmZWaOQh8k09Hj
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOCBTYWx0ZWRfX3XdWadVKt645
 EpiPEdl6cjDfJRDaDtauFb/cyPMS9DRb6j73dteuhB0n4FD8mKmYjIEVDDBmBEgc5BcFqH+hX0H
 V6l8zzN62G+Yom2esv2ECXNOMRbEO72StY4C7CNwlW/t7vyK6sr+kyZtAZqbDuAvgI+3lLCes35
 o8NDmFgCZ1f+hEWMCUdOT6y/vRsVbk5vLFCsgr5d/3Q6xwuNg2D0675GVRrCwVpgvj8m0+ORrc7
 YBWtk9UOJ5PPKaC6OCl+0bNtP65wtYFm22n5ELdYFFW+8gcaStE9dSve1CVLmAlgSv1sYTw7ZJ9
 Rs/W23Eap113OX5R680UZHHzcWXpYi0MTOwdVdW1Pn6Vt+808Uq8j/tDSr62rQ2wTxzPuShQNDK
 M6TBuRaN
X-Authority-Analysis: v=2.4 cv=J66q7BnS c=1 sm=1 tr=0 ts=68c03f2e cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=8AirrxEcAAAA:8 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8
 a=HI3Jv4oHZFu9xgwai2MA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=ST-jHhOKWsTCqRlWije3:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: Vq5BgwjaTwNmktxWXXjWJf73d2wEdLRM
X-Proofpoint-ORIG-GUID: Vq5BgwjaTwNmktxWXXjWJf73d2wEdLRM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_02,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_075231_251506_F774A6BB 
X-CRM114-Status: GOOD (  15.90  )
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

Reviewed-by: Liu Ying <victor.liu@nxp.com>
Acked-by: Daniel Stone <daniels@collabora.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index 46fd58646d32fd0611192595826a3aa680bd0d02..f6ba8032904187a2f169456052b0e4cbd60ab919 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -249,6 +249,7 @@ static int msm_hdmi_bridge_clear_infoframe(struct drm_bridge *bridge,
 
 	default:
 		drm_dbg_driver(hdmi_bridge->base.dev, "Unsupported infoframe type %x\n", type);
+		return -EOPNOTSUPP;
 	}
 
 	return 0;
@@ -274,7 +275,7 @@ static int msm_hdmi_bridge_write_infoframe(struct drm_bridge *bridge,
 		return msm_hdmi_config_hdmi_infoframe(hdmi, buffer, len);
 	default:
 		drm_dbg_driver(hdmi_bridge->base.dev, "Unsupported infoframe type %x\n", type);
-		return 0;
+		return -EOPNOTSUPP;
 	}
 }
 
@@ -498,6 +499,11 @@ int msm_hdmi_bridge_init(struct hdmi *hdmi)
 	bridge->type = DRM_MODE_CONNECTOR_HDMIA;
 	bridge->vendor = "Qualcomm";
 	bridge->product = "Snapdragon";
+	bridge->supported_infoframes =
+		DRM_CONNECTOR_INFOFRAME_AVI |
+		DRM_CONNECTOR_INFOFRAME_AUDIO |
+		DRM_CONNECTOR_INFOFRAME_SPD |
+		DRM_CONNECTOR_INFOFRAME_VENDOR;
 	bridge->ops = DRM_BRIDGE_OP_HPD |
 		DRM_BRIDGE_OP_DETECT |
 		DRM_BRIDGE_OP_HDMI |

-- 
2.47.3


