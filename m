Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 110C5F588E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 15:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=li1QTXDLKUg9Sb2Wzb5S3vgbZrLxrrKq59N8rWxZa0g=; b=LU1mtblJXJ6Qb7uOIiuu4Ko06e
	2h3ku6Oes/TK1tHcV3Wcx75MdbpRvBYEx7ZR1ODPrcH37Mg801SIYT4MlFLVDdcnamqCzBvzGTWtr
	zoIah2QVhVxze3uzE3Epyb77RWQhRo6qfh1+3A5MefPC1ducsHlBPcdruB2vs1hhyjrhPqH7zwdVX
	1mHIsUQckXrj7mpgimM2GhDwwCdpIHTb+LqlnYV5VZyUiPhUT80fBfxahAizipSrnndUyh8xeGGUG
	SPygspt/9MoVZpGHR1KP9GqxzVu9LBH5M447W/hkrQeIHsId6azy7XNkLRacgpYMS27gyZ6uc98kI
	yWvGyofQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEqbZ-00000007ITI-1TpZ;
	Mon, 20 Apr 2026 15:32:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEqbL-00000007I8X-0xLv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 15:31:56 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K9mQQl3925591
	for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 15:31:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	li1QTXDLKUg9Sb2Wzb5S3vgbZrLxrrKq59N8rWxZa0g=; b=RmkyS6fnhb+Kw7Cz
	CHA3bm4xEZvLa67Sc7VaByoq1777MMO32UoiFTCX9OWYl84bQUYSUt5oiuxal4+t
	Y5EjaMT5Dl60Zqc9cnFtdpSqrrXt/Hq1Q1gJ2ZTj5efhBlyqCoDmo6GXDGMI7Ly1
	wF+BUTYzGoj2FvjH6kNVWk2Zwuf0aIRQjO4vHjmTZjJjwQsYHQCJIkwWUgK64xhY
	AAaJIEKog00iwU+sBfnxn0QYK9FacFb+525cT8XdaTQ2UxU7Gze2/JgUjJaxX/EO
	nzWgfUvOT7pye2NzxlbQvMiL6wc0h/titHO5Dy0JcW+JIEu5tAw3o/AyaFwaJJxs
	gK0rlw==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnhu9s6vc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 15:31:54 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-40f09403c56so7513672fac.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 08:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776699114; x=1777303914; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=li1QTXDLKUg9Sb2Wzb5S3vgbZrLxrrKq59N8rWxZa0g=;
        b=OyC5U/sXmFnXChsFBspcS+wT26GYz/rILB6lSb3ItYqisk9hKY+eVCVs+w4pFSaAy4
         mUCjbbSdFRXVXSevQLCb2HN9QPSXpSlZc3adN6GHGsYqnF2jTrEp2ZPSx4hMry9vMsji
         xdL3gc/+7HIqNEYWKfILP08K95n1Qp5HdusLcPjC9XJhGMpU24jWJd6JJZOnwpTd3X1q
         ZjuGm8UCUGHxHp+3jjYC7od06IerN5SYNLlED+38+JzkHOAUoJLh0XOc1paU7h+vIWaR
         hc5aJFr/DasWJnMJ/NzKKmY9HW6ol1o7C7EMTAJqFYj7B+TzraV6dPzTJk0UjhCMNPtF
         kutA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776699114; x=1777303914;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=li1QTXDLKUg9Sb2Wzb5S3vgbZrLxrrKq59N8rWxZa0g=;
        b=kdXmH94rayW0L69Ni/CdWpZfMhXKANA6+RtslWR/yA0JC9/g6j+Y0FbprPIyq+ju3h
         Q/jjmjXzUoRBiuWwLxe9aTnZdLQnZRNgSjDyo+daQXcdhksJzpzV5J3OwPYUmihnobtz
         v2c9m+dVEE36Mh3XGbcqzA3E91+Ndl/8CgaYI65xI5PWJ8jnJqTRATgzA1+brGzWXUGO
         OZGNWWM9am2/wgHFG/kkru9pMd/NH/dcMZBFc4s6CuScQZc85sDas3YMJZs/kUFsUvT1
         t5VJp07VSClXvOpy3vDsKUcdnygb5orPUBEhGI5FmpkqT46xkYO+m3mJYLrKmXuOeauJ
         bYKw==
X-Forwarded-Encrypted: i=1; AFNElJ/69y/Tk6+hftBggztXfqwUpmLCVpBtE6cNOuPBUwKyMNjgiBtVxW+Flx85xbQtLBYVmBHLYWPUvSsTcVpKZis9@lists.infradead.org
X-Gm-Message-State: AOJu0YzWUFbqpakmMyIopJvSKl6cay7e/qtUeaUkF5SLGI0QCMvUETwE
	/mMtH/2gcadiizmSfpZyXOhynCOhANB2lvL+s/JrEykHhiVhWfUZAaGXj50YEaQ3JAsYsgyC7aL
	k6afxl6HY/Br7DffZEeISbES8vMVZVOMNLY3H4vdRNMm6pHAsX/jdeqeweqzkh4bHUm03z9hk2/
	iyzA==
X-Gm-Gg: AeBDiesbLFIf06nNu+gz0wfT63aW33SVGigRQmQg8wO3mdY27x5gXkZ8uK/wf2l95hm
	/o/eE+nRvihTPeI1LvaxHN7dibXxH2bgz2kh3vzaier5rcotmiui+0uYpiftIX4hKbxTNfXz2KC
	Mmq+fh/8Ud7IoSv1eQb2WOMmy6/plPgMvJxIKsM68PYGxvfNIArNFh8BgYqEMI6RD3zwiUiZzg+
	jqWowUvl9jX3bX4saRkXw4r68zqkb4q99XMpDS/5jVNoB2W54uUS7CaWOaP4ejsk3wo8Dd1uWZq
	zkcI8nlCLBZ3HAGX18YzLlJYiSDT5dbe7rQ2CFjLpJnfvLUKbffh21kUX8TKbD/sVLy7+8P2sc0
	4kIfdWNZx7xiPn7xYs+xvfQ+2GYrIuHEsHj5ccZX667nPEcV9NAcgeTDjKtl42jNQodPu6izzJq
	duXlLvhc37frMyJkqAh3zk4vgf3TpxhnaI5a9MO26VZgOzQQ==
X-Received: by 2002:a05:6808:130e:b0:45c:85fa:5a3e with SMTP id 5614622812f47-4799bfdd9c8mr6136764b6e.25.1776699113596;
        Mon, 20 Apr 2026 08:31:53 -0700 (PDT)
X-Received: by 2002:a05:6808:130e:b0:45c:85fa:5a3e with SMTP id 5614622812f47-4799bfdd9c8mr6136710b6e.25.1776699113069;
        Mon, 20 Apr 2026 08:31:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185bc31dsm3071171e87.22.2026.04.20.08.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 08:31:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 18:31:44 +0300
Subject: [PATCH v2 6/6] usb: typec: ucsi: huawei-gaokun: pass down HPD_IRQ
 events
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-hpd-irq-events-v2-6-402ffe27e9e9@oss.qualcomm.com>
References: <20260420-hpd-irq-events-v2-0-402ffe27e9e9@oss.qualcomm.com>
In-Reply-To: <20260420-hpd-irq-events-v2-0-402ffe27e9e9@oss.qualcomm.com>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp5kbdKgPye7XiAeoSoakScVMUMjCOu46HRvpZ/
 8qrEonxwheJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaeZG3QAKCRCLPIo+Aiko
 1Un6B/9Xc/mQPkkBXKR61XdHwQ1fxJIryoBdS++LX1KT0pEEYteBKqRJ/XSYQUrc+EPfqLU9PMe
 H5fUvSJHLdqvfoBUCUEQk1YTcGI7SpMzLE8TkrLZ01bkDNnf5fF1nWJ2jeH0js+HhXpHXNYwq6+
 eMkODvtWK6jOOzLJVIWNEp1Jf/1Qo6CBDpX7f6O8hgnOauDvYkX3G4NrCVHZbGnvqgxwfoT2Fmz
 XfzV/uRG9TPUQ007KR6NG8ovnQVsBtzYYjzGiMZtRYlCbgMnemhbOxWRCAYGadr/D7zvREJKKaC
 /KB3r6hKi8dNIA7osaCTEBo1CdUrJ6ljvRhahpB9mb6AkOwp
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDE1MSBTYWx0ZWRfXy0fWF0mmzHDi
 NkW5Bv6jnNVliBACdiXDRR5PRE2IzP9ixKiD+AbHREjgL9aOIsliA1lWYjaGUzv+C+xSmHfe5fw
 T4Aqd5CallGxuEw+S6wHRbCNIe2IhnvH3mCW37YOApgQ+u4OZl13OzySs+4CieyqhvULW65tUDs
 HRCx7ms9XhefpRQHaXTDZQk7XKyppbGe5+wF0GIOQxm0qmNKb7GmnFkvq//WXY0O+aeYVfZkbRa
 w78KPMjlz+WroSn4P/3Y7qkGSKebnFcR463qL02Vi3GkkDggT2PvfXYfbrzaUZ2V+7XKSV5efVd
 8POHC9s8Frho95SVPNA8O0vaPpDyOyAWAR+1RRJGI99U4DOkahm1TAOZKqFRsM3BHbITEUA7HT3
 Ac3JTnIHW8a5uhMEOK/jmwK21UDmNObpxnaZ9LzbHKu1yawVTsuqcOtGGvU7ulP+vSunOKNfxOS
 XamluLxncbmn3OviGRA==
X-Authority-Analysis: v=2.4 cv=IIoyzAvG c=1 sm=1 tr=0 ts=69e646ea cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=pGLkceISAAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=xNxaoOyMFJLcTYWjjPMA:9 a=QEXdDO2ut3YA:10
 a=y8BKWJGFn5sdPF1Y92-H:22
X-Proofpoint-GUID: oxwDf2ukm7pLmb3kprMLbVT9od978xqk
X-Proofpoint-ORIG-GUID: oxwDf2ukm7pLmb3kprMLbVT9od978xqk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_03,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604200151
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_083155_346162_55566FE0 
X-CRM114-Status: GOOD (  12.74  )
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


