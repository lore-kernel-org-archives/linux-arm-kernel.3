Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 801D6CA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 00:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=80NStMTAnoFzXJOwtQHaY7xhRYT5mvFsRO93ITTF4OA=; b=Gf+DmlB/5uHb2CJy+nx5otBTE6
	tal6F6kaTS455ui4JjscKm3bxJIS16LkcLAYIaiv3teUa879by6aah0mwLUQDylZQN4m91QWQJhVh
	rANZJ6gPOcE+EGfVvqJangg81mn6srMNuxuUJkbZ1oPLoG1IifeaQWHo3Sy18eEx02UkBEFfYgIQa
	m80F4C4yT5hGKrnWNn0lNjp6tEyDU/N/zoOkHyi1gh8B9LZCAUk1eoV7cdV4baSL6UZU7NLiSLK4s
	eJ+GzuuG9ILw5m0zYPncuOsspY+r9vHmyWUh18KMFcRnAAowX3IIi4B7xD/AECO9tgLuAE7TQuUAE
	wCAOgeXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us9qO-00000007Elb-1k04;
	Sat, 30 Aug 2025 00:53:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us9ND-000000074ZA-1j5x
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Aug 2025 00:23:16 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57TFbAZ1031855
	for <linux-arm-kernel@lists.infradead.org>; Sat, 30 Aug 2025 00:23:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	80NStMTAnoFzXJOwtQHaY7xhRYT5mvFsRO93ITTF4OA=; b=ZOYgwC5TrQ70qNtJ
	CBwSeTXLH9UxQ0I5/N8gmk5xlZGUknURoGkAZOHF0rQOsIShKBj5CgBbtNZmf3/T
	dQTkXPx6tVzO2LxWReTSyHfJ+KUdHkyQ0o3n7wBSuO0YF9lT2cCrxAgdRjS68k7j
	+4snMAB9R5JfHWAE+Q9s8E3hmK7DatYDCbWCIu6sM5JbGYbYj8Eio/kUhKjWKBvn
	uDbr3Pd7L3GyKSXCgJPKSosCd3+GkP94Ifrqme375twmU8ar6m3NVyRGD6u34ll0
	Q1p76xCrTJSoRc/aKpiTMSxg0UBwrTlzIo/82Ydm4gxqOJrwzTAPqP/rIWX7GIYi
	10ITvg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48tbpgpvk1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 30 Aug 2025 00:23:14 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b109ae72caso52612341cf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 Aug 2025 17:23:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756513394; x=1757118194;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=80NStMTAnoFzXJOwtQHaY7xhRYT5mvFsRO93ITTF4OA=;
        b=bEBH18NAdlFARspSoBG6vWlsQL/Rr5vi3iF81cl0emEGP/E/fHMMI4Nt7BWmV9AlEf
         ckbnHsFe9MXTMlIIKu1XjJ3sM3Haae3vh/GI5lAywyxYPH7AaOU4eEv9/LtdrsFoiyGv
         Ym01RSITXBL/pZ1R1csu9sCK3G2r2oYqxeLPk89m0mwkC3PLPe2h7xsqnN6kXvxuz4vm
         sVXw/10P3fa003jncM16idIK7mv847phHuXwAbOZ1taZ9VjVoNVYpbPIhn1eBI/md+yI
         wJF85/j0G2c2ZtNj9CO+naLFE80ebfEQDOR8SnYw58BtePE4QEOAFH4N9dXbmN+KZ27X
         Xe4g==
X-Forwarded-Encrypted: i=1; AJvYcCVKCZVEJSpfNSicWwE/blYSI/MXdbKWj4afTEawuS9BsKRq1rt8/FlqebVpbqTaC0OvzZeuPe6xPApIYFUXr62z@lists.infradead.org
X-Gm-Message-State: AOJu0YxrupuEhncp5wP98b5qFxvEZfMIj2vFYB3PWW2POk1tmirdSvj9
	P5qxyIKrYsZlsGuEJZesFgZdL6M3q3U1s3nN59qXGA+rEF3KbCcnFHrhdesnjddBHYQZlhC9mbU
	InbN1jlGANySuVL2QoTt0ukX6IbQzsbbFGx1JLdgWf9jVly9hUWOC1jy5MBhkmiT15qQu6Nr4uJ
	pZxg==
X-Gm-Gg: ASbGncv+aoI9GKjKZRDu/QXyR1MWbJoMqWDVJOuA+noFFMFGNuLwDbrdo9h9QY2TgDx
	9eIIRfOurGxvHLJFyBCLzqqTK1iKfRzstUgTUb/MjTRHJiISKMqkDt0AQvX8qjMWAdHVMXvZtaz
	nKU7um9czn6+gHbjVVoqk0oEDXXe3K9YYNTXcDHX1PCvJ9ag6NsHddC5VfodDl3iTnlxmb1v7wL
	bD5ApeiQi6bllVaddBPvnByXhJLLbLjlUuOgvwU/iTFZQZX2Vz9hf+6sLSePZwDg4AQAJdjg/Cy
	Cq++d91ttPwSOzt+48ciiYTqIdWOtJbN/FERqIjoPi7hbZdTugCdahQCryxEpEuGN9eKoj32ZYg
	bpYCKlaI5NmQUt56zPRUBwuOVqcuSaJKy9FPN9Uh3HldbimVZ56Ql
X-Received: by 2002:a05:622a:50b:b0:4b2:fdda:f7be with SMTP id d75a77b69052e-4b31d80cb39mr5664391cf.3.1756513393490;
        Fri, 29 Aug 2025 17:23:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+ECcTfEmyA0oDw/SDMAaP2b289wQGB6V4nJyogvFjeCA0Q82zJiolJtrAbz+rOP9mbXYTVw==
X-Received: by 2002:a05:622a:50b:b0:4b2:fdda:f7be with SMTP id d75a77b69052e-4b31d80cb39mr5664051cf.3.1756513393037;
        Fri, 29 Aug 2025 17:23:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f676dc52esm1019907e87.8.2025.08.29.17.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 17:23:11 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 30 Aug 2025 03:23:01 +0300
Subject: [PATCH v3 05/11] drm/bridge: synopsys/dw-hdmi-qp: declare
 supported infoframes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250830-drm-limit-infoframes-v3-5-32fcbec4634e@oss.qualcomm.com>
References: <20250830-drm-limit-infoframes-v3-0-32fcbec4634e@oss.qualcomm.com>
In-Reply-To: <20250830-drm-limit-infoframes-v3-0-32fcbec4634e@oss.qualcomm.com>
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
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1488;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=HvKx0pHrlJPU20odLzHqAGtdiIb1kp87Z3cgJaG6Apo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoskRjn135tRCfVJNBGz8sCeDhP5tCOP7aR8o5A
 t4feOQqmQyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaLJEYwAKCRCLPIo+Aiko
 1cklB/9ld799npnBEVzpUVL6B/MsuL/WFKALm72JXuja0Df8R5L61ialziPIDOQhwqS7m/CUarR
 BbAyiqXzuPuzqlJe7l8x8oNPMkfoFKSUh6v1bzsao08IUfOpraVdo/cUzHZpRHD+e4Z8qQa+lZD
 wBf0Q4KqCCTPDQVK81CqKt2s49dUX1K3msOCLP+Q9qTWEUhYcipODy0q5i1LOOzeK3q+W79iNMm
 lnkrosjeoE9iQEOOniqNI0p9r7yqKeHQL8lZ+0xiGmqvPd0sbBDmohgkxJhwxe2chOX/N92hTH9
 wpH7XHyXSQPZRmESVQdN7E5BRH3RguYmbQ9At1pUFu6xJ3VQ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: nODDv1-4_ShRKz-tmHl7-aP5DCGh-E2T
X-Proofpoint-ORIG-GUID: nODDv1-4_ShRKz-tmHl7-aP5DCGh-E2T
X-Authority-Analysis: v=2.4 cv=G7gcE8k5 c=1 sm=1 tr=0 ts=68b24472 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=vfAEGMZ_7ZOHtlG3iVcA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI3MDE5OSBTYWx0ZWRfX7wWzCLAmrKcl
 gPzL2Yr6tcKTK23ICaYntxXXQMruYtqY8cu4fWVj1OMpUpYfbUogBmgMjk3E0wC/BmAzjD50Ltl
 0gCFBebFNc78su7diQjl9Ub8Hqr0N0fBxo0KPfZHWO1WCcpb5HLqhdDxXB6CjknyPTUQS7SUzzj
 HmVtZsRe5BbnJR5SjviaxffV0+k7g/Q7Z6pgiX7PNfrGtbnmFK+m9t2RTIZgTZv2Loq5R1jm/DV
 QV7NDpliwAAUA3qMyJaeDmHyvsc2G1bFpy0tlOJ0XEPGIuN+iGF+A4KvXt8sC+iTjED6m0gzIYA
 s2/cJZ+mA0nOimUiu3FSStZHBMhSVYTMECFnGTikdcrmZVZIXNPu+z6TCEqOPuMc7rjs4lls7+k
 O4lQsULS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-29_07,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508270199
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_172315_559155_80B4B62B 
X-CRM114-Status: GOOD (  14.68  )
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
interface.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
index 39332c57f2c54296f39e27612544f4fbf923863f..5320641cb6907a98cbc311a80755f09b88a27ff6 100644
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
+	hdmi->bridge.software_infoframes =
+		DRM_CONNECTOR_INFOFRAME_AUDIO |
+		DRM_CONNECTOR_INFOFRAME_AVI |
+		DRM_CONNECTOR_INFOFRAME_DRM;
 
 	hdmi->bridge.ddc = dw_hdmi_qp_i2c_adapter(hdmi);
 	if (IS_ERR(hdmi->bridge.ddc))

-- 
2.47.2


