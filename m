Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B45CF5A8D1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 23:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=li1QTXDLKUg9Sb2Wzb5S3vgbZrLxrrKq59N8rWxZa0g=; b=1ARyIqEG5idlkDR1d8Cw8MNBYk
	GY2zgmjXaoE0O9xjG6XYLf9A88oVurZGOYcAzCdSHgdKxdqikTtm27aiROrWDVXCib9pMmKBwcXL8
	+2DzjPwTDB8R4GX3mxzXCt9otaKnvCWHTn7oXVQcc8QevqQOXnnXYL42ULTRWi7vrhBkK/HyqNN41
	pRbb5fgGt6DjG8u/wMhzrFLaQX02CjVqXc/PGR9uDxj7fh2kIO+b6FlO3pUpszA1o/xljSJYT9xUq
	f5D2+Ig0uBZHXPgZkdwC1sLVW1lW+og2v73awAY8FIzxsVzr70DHrJzlBMIZOdlipXGZTg0uTgA/k
	Xa1po+Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEy7z-00000007pFU-2d9V;
	Mon, 20 Apr 2026 23:34:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEy7u-00000007p9l-0cne
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 23:34:04 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KJOU7W1014304
	for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 23:34:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	li1QTXDLKUg9Sb2Wzb5S3vgbZrLxrrKq59N8rWxZa0g=; b=HpvBvE1QLHNxgFMc
	QoUecGt/rJg9vNlE4G4+5je7Lv52Wc44BKL4NREup+GtkJlzefSb9vMblGPkSi07
	ssTeEQHMaSu89LcWDOxAHa/PJL+Yf8BE0ke+O2jJfO0FpawHKOcX1KLkIqHvcn1E
	gBG+0dRkFjFCmb1LR8re7MIJVF4MmVbox0mXkUWK8uWMxtq09/mu9qzVtW9uZkZA
	xv+A/lnE9lVAnDglO/OJuphfp2iKqnhgqrn6HY4ejWe8pYxvZxopCN2STQcdgeP8
	I2cyMh/ZdSD8PqhlianfkMpq4FGHhh37vXF/fTe9/kimWd6Q1USMiJ9QOyLukYDL
	czPPFw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnt900m13-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 23:34:01 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50da529ff48so87837351cf.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 16:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776728040; x=1777332840; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=li1QTXDLKUg9Sb2Wzb5S3vgbZrLxrrKq59N8rWxZa0g=;
        b=kFrKOPS+L5WEYBaBM/zDncOLO0sxLL44IIY0zQBftHPBegrPRZh49QqhvgQE8Cl+t7
         9LATKxoNPzpF0ieaoEXuEZg9JtR01QG1xp+8cRKpQ64lNJPsHW/Qbv1cGGvQMyLDVhNM
         ov4JQxXQ/ADZQug9APVwDFFjoAnXhzw+6bb78qAPTDqShiEUsGWigX+8tBF0LwJ1xeJW
         WAZHgWKXPH9sNsXIo3Hbr7fGThzjVVdA8Bxt9rzViGiuctHI78HIij66c6UCumdEG8GI
         8uaKQEyhH0jlcYxgefn/k3I6FS3qKyxnq1Xzfrhdm+Kcenf9WmiDtXpfJ8B6iEMVW++8
         KlNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776728040; x=1777332840;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=li1QTXDLKUg9Sb2Wzb5S3vgbZrLxrrKq59N8rWxZa0g=;
        b=ENG7QVeIWOT+wfy3FqecCqJ4aFjkCCd5Q54KprpWdbSTIzVjBGxetJ7bzSp7fSBp4c
         ImCfnAaCCHxRdVdpsjQgOhK7HQI9JLkRgf4EwqKN7KbDHZSKSOjU2uzmQIcZGQ1Am0BG
         7JeNU8BqbWUueCimIFzDfit8DYIsoSf4Cc63ISKm7F0fqZaXz+0oeaXAWZygiqRMLHmm
         o0DhGu0zlfGjTOjU9ZUFDc+EBYlGMFCWIKTYi46LLiSjSK2CyNPl7vicoA5lpD0F8E96
         1rd9g62qS4QEmxVcUOVGjIoU7HdWwjrHhaqV9GunVYB9X66LxLF1RLVrqmMIwvuzbeFl
         kWBw==
X-Forwarded-Encrypted: i=1; AFNElJ9w9D97yPCj2IQlIfz41JiT0+eJRhUq1aT9gR09O9wOI667BO/Tfe5HTCh2CFzicnVJTnTcqW9SNfdNRymvjNkN@lists.infradead.org
X-Gm-Message-State: AOJu0YzHj+pw6xHKPlMm+Zwk2eGQCtE1aRK5zvMr0wbnrfDb1UOfxZ3Q
	4XS5gRG5H64Ql84306U46MyJRuYUmC9R3O202St2wauMSWwWZvuf0yl0NzSG0gqLs2AnRI3ZllH
	aGBA/u8q0/Ks3e9cZiEVmeM9ESxIWiUMM7yIYEhwnIj0ex5egW+dU+efwx3CQoD7NeKpopCmz3z
	VnrA==
X-Gm-Gg: AeBDieuBV+5b5IEC/f8WunrOfOExYtrBTF0v4iNHTDmUi02XyylZcLoWQ8i4EXKY+Cv
	TBNyVX14XQreOPpGLuc8BHxPsI0jwXV/xTnAH7FCuD5xv59ggUdAT5JUDYe1twXAlMBW8Zs5MNr
	BuCcq3rFtjMUdIGgjCExEq6xOLjnsoP0uf16VgrE7hrV0S30dKpXWdUcgjPlTt065VjHfi+6o27
	PSPDga1xwe1fH4CNwoFkyBArWdvFlAj18dVeQOn/T5/Lacp2/g3UXW9/9biaoN6/TGj8WENtWwk
	TOgZf4uZPc0tVI2F9pikWakU4Th11BYugk6o6krXS1L5ikkPhResjG0z298pqeNuG8wVBbeHixm
	FlakRgAoihtACg++DGFM6a76JwK/Ie/YO+gc5QPmg/EIpiyJ4mnC87wFPx59yRTsDNhrXBc/HSE
	HWC6Vsxhdg/XOw7pz+cEnhBDpr5RdDeCcIWQvak/unpufx+Q==
X-Received: by 2002:a05:622a:4245:b0:50d:8056:da41 with SMTP id d75a77b69052e-50e36836149mr208590031cf.2.1776728040290;
        Mon, 20 Apr 2026 16:34:00 -0700 (PDT)
X-Received: by 2002:a05:622a:4245:b0:50d:8056:da41 with SMTP id d75a77b69052e-50e36836149mr208589331cf.2.1776728039743;
        Mon, 20 Apr 2026 16:33:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185bc627sm3320714e87.29.2026.04.20.16.33.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 16:33:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 21 Apr 2026 02:33:36 +0300
Subject: [PATCH v3 6/6] usb: typec: ucsi: huawei-gaokun: pass down HPD_IRQ
 events
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260421-hpd-irq-events-v3-6-44d2bf40dfc2@oss.qualcomm.com>
References: <20260421-hpd-irq-events-v3-0-44d2bf40dfc2@oss.qualcomm.com>
In-Reply-To: <20260421-hpd-irq-events-v3-0-44d2bf40dfc2@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Adrien Grassein <adrien.grassein@gmail.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Tvrtko Ursulin <tursulin@ursulin.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Pengyu Luo <mitltlatltl@gmail.com>, Nikita Travkin <nikita@trvn.ru>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1309;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=mxGolAt7ROQ681cKNciUMVefMdiRDsSwC5zox5THv9w=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp5rfNcYA6Kn6vJQasDmoVbhaWkp9oc1LDRkXYb
 fBIXvmCUy2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaea3zQAKCRCLPIo+Aiko
 1R4BB/9GohI0ZFgi+xqrkYGMe/3Udg5Nue1jmSANu/Otqvi7uD155XM2P9LxdiNxtumuSBIOZV0
 ZM2YwJ0094hTPQVf33GGO2TTcvusZV5uQYJ6XLsZYcjreXdNaU7hK/gy3K8J4CDrGah5ai3YG9m
 YPp1Ywnej+ym0q/P04Fko3yj+I+nVVhCJX0grp75+IBHoxlXcN3UQoN52HycYjjeL4oagQReQym
 NR8P+cZwdhtT8RR8dl13lWVTAt92Z7A+IJLUpzga0kyQWAuxOxI4W8RLlO1AGkhOTjPYzfNV+2S
 1iHdUU4TuohfcHIGhYbTI1erKqCzoEvMrcoEnptsZKObh68L
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=KfbidwYD c=1 sm=1 tr=0 ts=69e6b7e9 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=pGLkceISAAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=xNxaoOyMFJLcTYWjjPMA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: r27aPnruXO_P3KtOMXHqPa9w8h1VJfgA
X-Proofpoint-GUID: r27aPnruXO_P3KtOMXHqPa9w8h1VJfgA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDIzMCBTYWx0ZWRfXzUsXScdqj8d/
 gHey9gtTh8J3rL0tz93a35DNqr0Q7p9Eqr9ODijsd8YzQx0Gf7fcbR2LKgCttIuAQBHwycuUFBm
 GnQN5OHjY4/gUP0dOio6ELBmD4WD9IMTlbeoDper2jywKYNa883iODZwg/hCHYBe6yJlSV0RxPq
 /qznUF7/xJ2988hVV2EqePhp6Z7a7LoisI5lFrIGI9cZp08bA2G5NR+5ZhmgcNf0HxZUzeYuKnn
 lQlkucfEzaE55VcVZAsIA5s5Z6kvcaotwBhyI94yWxei410qV8TqTyPZiG/y+mMhc7ow8Tl/EZd
 QLK62oqGU2DTgcPY7OSioYIqn7PcNHKYkAPcM7TqhYFPj9xOlXcy08G8oa+JiqcRLV/sxJ2gYws
 Tpt6WJg6BR1mWoR/Ls4KiQhz1PNG4lUgfV4nd12CqbFdAPTewvRpnNSJc4l8B6KeMrBttgx7g8d
 qJX/P1VQeT8A2hy7quw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_04,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200230
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_163402_191371_D7DAA5A8 
X-CRM114-Status: GOOD (  12.98  )
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

Pass IRQ_HPD events to the HPD bridge, letting those to be delivered to
the DisplayPort driver.

Reviewed-by: Pengyu Luo <mitltlatltl@gmail.com>
Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c b/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
index ca749fde49bd..5e3f887ecbd8 100644
--- a/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
+++ b/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
@@ -299,10 +299,13 @@ static void gaokun_ucsi_handle_altmode(struct gaokun_ucsi_port *port)
 
 	/* UCSI callback .connector_status() have set orientation */
 	if (port->bridge)
-		drm_aux_hpd_bridge_notify(&port->bridge->dev,
-					  port->hpd_state ?
-					  connector_status_connected :
-					  connector_status_disconnected);
+		drm_aux_hpd_bridge_notify_extra(&port->bridge->dev,
+						port->hpd_state ?
+						connector_status_connected :
+						connector_status_disconnected,
+						port->hpd_irq ?
+						DRM_CONNECTOR_DP_IRQ_HPD :
+						DRM_CONNECTOR_NO_EXTRA_STATUS);
 
 	gaokun_ec_ucsi_pan_ack(uec->ec, port->idx);
 }

-- 
2.47.3


