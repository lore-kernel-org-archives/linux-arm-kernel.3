Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30187CD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 18:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=li1QTXDLKUg9Sb2Wzb5S3vgbZrLxrrKq59N8rWxZa0g=; b=Cq4yZ/UOZSIpWkrH3PJ4IqJLFl
	ya0wuqP2W/lLfWowesuXKUWJ4iNrrWxKbr4lZl0ebo/fyvca5Le5scyMgo6Roop+Y8wSorebxgiEN
	nY2dFIC7+qj4WGKQNW/FELWdROJV0/Njv+cykyt0xzrrXWdw0PKBgBTq3HcLwxbBrWhKRFfpGFSuK
	BpdAeqm3050Oh5QFnbK1msbEbnYoXvk5HBvcAinwGhoZTb+u0B2qxbpYJe02jRIq8oSWQUWhEt7zH
	oQTgT7uum0PegqfoFQW70Bnpf5lH8QWT/c3uFbetjZEBSJCt+lX7QN+YMCvuME8V2V9hIt1OO+Txr
	wRi8fLNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNEFi-00000003SZx-2ARx;
	Wed, 13 May 2026 18:24:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNEFe-00000003ST1-2D9O
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 13 May 2026 18:24:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=li1QTXDLKUg9Sb2Wzb5S3vgbZrLxrrKq59N8rWxZa0g=; b=QwCv2QwN1f1BTOcIX5IxgZ4b2n
	oPGuzw/KgJN5t2SPA1gCsV9Y4GznqJE4GXSc9PKtVQlfzHiFPIb/MZr1r6doY/POoa8ujrW+UJXYt
	RgDh8rtmIjAgpvPbseAVbfRn6Mnb9GDt4CR7B1socM3ZLS4Nox2/NPoC8RxVxA1s7YgBi5MpX/Wb8
	3OJSY0q4fxgr4l+w/yggL2uaQVJ7dre1z4hgdjaeTyjyJBlbzy/XzH0c+/jboz0OpMkRdyOK/kAn3
	kaN+GQLjbVGSx/6h2nZQ05y3QiQBzprmD6ig6zdAMO5kvS3eNPVoxQ/Y577okHXRCTvKwpuei756T
	ACaQzSrg==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNEFa-00000000q9X-328G
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 18:24:09 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DCVBMZ2965625
	for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 18:24:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	li1QTXDLKUg9Sb2Wzb5S3vgbZrLxrrKq59N8rWxZa0g=; b=Xs5+o8is26i9TDoz
	y3y7X36LjlcrVNTHGo46xIwoGiWfsMdLrS54s/66GDd4akyYZMGQR05NxojrB/R+
	x/9om5EnZ9cPMwmqjxdXO1GVzf+uLhKU5CcYtgZP3w1wETTy2UpkHnSCy0lTgFNF
	ha1pCTN8J/of06OBBF50O1zZWQNiYO0LjxltuBQ4cad3lD3n9Lbl5sffy0vcEfCL
	IoOHFVq8f5zOfv2bTths8NCpQ2GK04suj0VD8Xy6mhDvF5bNx4+W9zSZqTgl2C2M
	hBBxbdFwO6cc+uphD7iBz/MXTLPdYOgJZa1BHoEcpYdI1axmH16oOGw+BayBf7hp
	B5Hjqw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4ma5as1u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 18:24:05 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-63142e4ba6cso2596526137.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 11:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778696644; x=1779301444; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=li1QTXDLKUg9Sb2Wzb5S3vgbZrLxrrKq59N8rWxZa0g=;
        b=h50pR/DMjSX5pm9d+0YRSZKDNdPAPuh/O4QGJUGXHs6Kfb+HTu5BS4KV5VbxDOMvH4
         XOO2aNmhNZwrVaCKk+/A/K5RW163vq+SEPWhrSarOr922Zl2Px4qv7Tr8cMTB5+QhvPw
         zuiVWJ3xXUHkNZxl3HKsVvKoufIoMuTL49rJHSF+S2v9wQkICcwSSNZJg5uQRRWQJmcr
         dF/AT5UYg5HUdQUKAjAIULwBn0Mp8p1Lq0V4iheulWectNLiskdLiK5+3OggFl0Vic1o
         y1rh/BqMvRbXCsSPC1uA8iHrzR7KLl9ZQ3Ir2PuT5S5nxL0ANTR8oBmNQo78JFLPswAA
         rBuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778696644; x=1779301444;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=li1QTXDLKUg9Sb2Wzb5S3vgbZrLxrrKq59N8rWxZa0g=;
        b=r+JjC1SNjGlynnzebCZlpBxzfiynBKZTmg3oUsnMI6caDdwSyVquUDLZKtB4jfQs2v
         AxMOsAjT4xhcc7xVt4Za7BGZfOKCB4qD1cGpV2hsTleWxTEBV6s0ZTAPgQq+rPL6s9WL
         ZEHEXop7CAokpTzsLCspL7BkEPRwMSUNRpbnR6+j4i9/cCGMx/1D25AbO+DLrVTY8ZXC
         X9LbLlpt3H5R+odvC81hzCGvnGDQ8FM8Y2Iv+O1GOVgBOSqqMe226MS9iI5XgIhI4b3A
         k1aWNZMMAKVysiecLHqwmovG2IL+i81dAjiluyRccdy421eU0QvNqvaigbLScfe7Fc1b
         moXg==
X-Forwarded-Encrypted: i=1; AFNElJ9Yca4+1UbduYMQuX7QMlN7XAOaXD1RrbgopO1UodUM59+7qWO0PQXC+zgiYmEysyv0LvZm03LgVBkRXDGYYN80@lists.infradead.org
X-Gm-Message-State: AOJu0YwjXJz3J8HxASBkSKXdNpcTWnyAQCHeNcwtQdaMzgtmOxb/g4+H
	EmGVj2xafdMOyg7ku4jndoYlcRno0SVImdMoU7WYt0IpqN7eshbUp+RGAMmeQVcTdI8/dq+441S
	ZzXldwEOJY0jFi/XkZwdsI/JrEtVC/+//eqpG9k32hWzLi8i0BB4ppMUm6NA17kMGoQCjY+3F8T
	nPMg==
X-Gm-Gg: Acq92OGCFGl6N0/9jbdtqN/Con0KmVROr2XiBmiD8Iw7PZT8tghVK6l0cUE7062jR0I
	SMkeoP31bkv+B0ZiRoHNELi1F/hicGD3Rex4ajHJ3luCzUF0UCY0LsGgau3U6eQ63WFclPLgYfH
	pgF/ubC5zHVZnTny3qBVLNUDMzGrzsT1+gFunEQy6ToOftNWnzlVNCl3vyhq6lqT80WIH6zJBM/
	h0Ylo4dqk9473AzGtUK7gxSM2ZY1G2Tlym2rQ+mqaCSB2XoRBWxHmYmL+LNFZ8BnrUpXO2YFEVm
	UEMZQxnzkFwGcd6zzoHGD++EacsrgYCeNTBycVKrKtak+QZAbviYcYOtUYmILceHedYM57wd9ru
	KA7Lv0+NqEwzCPqYWSqcEBgmXc+qGb/zp12/RfOkFMtJgsDpYa0ETbvQkYPC8rwgm4g8iOqYtM0
	WBcE5ATBQ5Q1NKr90b9sdStbru2XUWaicE4gDmsq3sMrnpPw==
X-Received: by 2002:a05:6102:4a95:b0:631:2a80:e492 with SMTP id ada2fe7eead31-63774777cf0mr2754220137.30.1778696644196;
        Wed, 13 May 2026 11:24:04 -0700 (PDT)
X-Received: by 2002:a05:6102:4a95:b0:631:2a80:e492 with SMTP id ada2fe7eead31-63774777cf0mr2754191137.30.1778696643647;
        Wed, 13 May 2026 11:24:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a951d1f6sm4212851e87.23.2026.05.13.11.24.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 11:24:02 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 13 May 2026 21:23:26 +0300
Subject: [PATCH RESEND v3 6/6] usb: typec: ucsi: huawei-gaokun: pass down
 HPD_IRQ events
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-hpd-irq-events-v3-6-086857017f16@oss.qualcomm.com>
References: <20260513-hpd-irq-events-v3-0-086857017f16@oss.qualcomm.com>
In-Reply-To: <20260513-hpd-irq-events-v3-0-086857017f16@oss.qualcomm.com>
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
        freedreno@lists.freedesktop.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1309;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=mxGolAt7ROQ681cKNciUMVefMdiRDsSwC5zox5THv9w=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqBMG0hilhJ2gGkZQQxe/0GBPH0fFPTqqZlimMt
 5EPtgQGMWaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagTBtAAKCRCLPIo+Aiko
 1UfqB/sEB1F2WFxCMTR2F1PIB/yP08QefwUon51gJHLQXhYRVsVZgMzGsE56RR40iDFtt0PCNNR
 e8/bhQUFNOGrzI8yy7h2fUumtwY6WquWhqqhJdrMaos/EEi0wqo92efWacjzI8ohK4UFbJt5bjN
 ffYm9hQw7mZu7rzFKn0nk5m4neMOewWtG2qMy4tDxV+FcYWNWYNdbOIiroBSVTXPvibDr1zfc6B
 lWhGMFxqUSjlgv/QMEhFapwgacJOv8N956Zein+/YYHUDvNrrMCD25WxF9YwwoRqVq6nRJacaJq
 0UUW8vbtRRRMty0+1dZCHZVxEpa+Qw3X4pIkBQ/WmrrFhFvO
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE4MyBTYWx0ZWRfX5fKjH5Rf7c9i
 OjcBeF7kTqTRYM7rsGFzo3N9IJhQZuiTJ5xuHa6/0OCNr4EMRp1GeQhsc9nOFbAkomyRJgwrrL+
 Xm8zJJNr5H0Mkrozzune3CfC8enqGm8fz/rJq/xMFuvjNRiyUFbRMoctPUpcmGwvJ8ekBr+j7SZ
 vwx/HUaPo8QU+5zHptpCBuzvGLUoEWp9PpVnElLR3I0FV5Zw4KqtxNbPZSfglgcCXL6oZYoNjQ5
 DsIwpsUjyAsVerNLywmTnfoNIXUmLkr+efafPNdKIP+RyByEwLLYVawQVhQ6ydSkclIwzJGkNf8
 bQ5+AHhFYe4QVYtaLb8fRiJzG2VE/ROlC89f1wR6HF/LfdX+wkKYyij8nWBm0cwzW5/lu91QsQV
 XKs38cpnc7MyvqzPUxEvwacE6oryYJ6ELtEFiM09kOki6CkSrbwvhIuJW0gCXj1MFC36nGcpBKa
 Sg7/8G3RaWhclOy4zxg==
X-Proofpoint-ORIG-GUID: 54aGjYaM5EJu1Hg1k0CCNX8v2Jw-DZzI
X-Authority-Analysis: v=2.4 cv=TJZ1jVla c=1 sm=1 tr=0 ts=6a04c1c5 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=pGLkceISAAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=xNxaoOyMFJLcTYWjjPMA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: 54aGjYaM5EJu1Hg1k0CCNX8v2Jw-DZzI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_192407_492494_F2B0427A 
X-CRM114-Status: GOOD (  12.76  )
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


