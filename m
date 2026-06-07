Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38E43CD8C90
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Jun 2026 21:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3FB7VsGWBD03rpwArJX/noldaF7TiU950Nm2TSbfvyU=; b=PUuDNLBR53AzHy2pYqk2NxXpzv
	lH8cH7FEkpQ9bUWAf1FlexKPXJQ2TslWgJucaXWwDVFoWnS+yznXLYMW/a91HiLKlM7B+Rqx9h6Y0
	dkzyTNLKDQImG0NxBJA70+9MITipHfgWbJuJs3w8MyrZZofe8X5bYixvb3mSKSrnTy72vgdJKCLPt
	JAE77CPtgqYQoUfahCfCAz6oRnj68U62s9/qGap4PkoaTdX4DFZ7IOcvAoEA08yey5bVStaeqxao6
	ihn8kRdx6UGT+AV/3EP6KtcFkYum2FQRUzvMzto4wqpSFKb1MdyqSkumJVetPxOLjdTNJrbV+hIA+
	6cm9dIcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWL8T-00000002W5s-1wEc;
	Sun, 07 Jun 2026 21:34:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWL8R-00000002W4v-2fmp
	for linux-arm-kernel@bombadil.infradead.org;
	Sun, 07 Jun 2026 21:34:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=3FB7VsGWBD03rpwArJX/noldaF7TiU950Nm2TSbfvyU=; b=Zv4psOJYjhbpRmMeobk7sUqsw8
	lQcW1GMdsvpTG0xTUyzhTDzgbmYoJ/Ky1bY9Dapf1nN7tRZfSQJ1tZD70JX+9ZmzoC9zrGsbHcP1q
	RGCfzijMIZwtjyP4q6UvJnvKgWjnb19WGLgeViSiU8zeiET/Hi8bomzsuufzT8Lonr9GuCtCTsfRi
	IRv+3X+K1jNEEzKW5u2EfNpSCtlJ8ES+hBsZHAeA0sVPwre7s39aR2Dc54rRADfopM30EKO0SHRFw
	u54x8QMmWpMw9ZdmEyoeD0sB+1aQuDOFzTf/Lgc+w7759N7DpfAQq+mEPqnI1Xnio/uRjZ5MFknIK
	mbhTWnuQ==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wWL7o-00000000DBn-45Ed
	for linux-arm-kernel@lists.infradead.org;
	Sun, 07 Jun 2026 21:34:18 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657ElMj9866578
	for <linux-arm-kernel@lists.infradead.org>; Sun, 7 Jun 2026 21:33:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3FB7VsGWBD03rpwArJX/noldaF7TiU950Nm2TSbfvyU=; b=EiVvTbWMNddLSWaX
	m3G9rugq0EFbtLfwWqsRQ3hFgDPCVYJysVU7USetWURk2Wuq306mU05XNloSioDW
	jcsrziM9VNVsqT8zM4nuiL99YeswMiGt/cBhD/5Ose//4pxfRa7cPiBA+2a1SyDN
	+q3U49r1JRYSaK875YDBzAylCpDWi+xrsj1jXbNdJS1i8JWKIUaNzNki86Ky4ahB
	BWtjMrua70BmHtF4shrL32VKmvGOviGHCrb+UuPkdZvshfA5ml2l0oCTfwBwuzgl
	Q+GZbCfbRiPXyolSgympyGUcISNKDocU+ul3Bdmzao2loCOm/mFaVhfiWhgxhjCF
	34NSUQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emb4w4w1v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 07 Jun 2026 21:33:39 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5178bcab15bso79089871cf.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 07 Jun 2026 14:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780868018; x=1781472818; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3FB7VsGWBD03rpwArJX/noldaF7TiU950Nm2TSbfvyU=;
        b=P76RpIloJzp0yC4wLFJhkHcvm1nL2ceTX/yF2GChplt0X6avd7fBMA+dmkAxryxgWe
         oJ30nFtjHoLt90TPZRfMem+B0b+JivKbLpsb6cRCwIvOTC+v8i4Ko6MJl4xn8WPjGgV6
         U3gg4eNxWdIwNFI4aFdbyyOMhN7JK01Q8Iu+cPgqk1iscbSrKDCgHNp+3Ap9hwxfXpxi
         TxntdakKVOWKQKC1PT0GPHhKS7J2ZJCWddgtKpimejeqk/3YUerZEw5N3hAwE4J0VM14
         p21+/CRfyJ/jILA0ar9H/vhT1fLaLGVMfm/3rvf0aSPjqsGBQN6cM8K9p5OaKFInrd7U
         e9ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780868018; x=1781472818;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3FB7VsGWBD03rpwArJX/noldaF7TiU950Nm2TSbfvyU=;
        b=jJSyXdg/BL0B7B1h0cStcVBsotFlmzRXX9/zogbH0A1adLjTEmJ7A8MiHnt8pVeLVa
         39pfThLWoLmzPOp+Vptwn/5Wi3m4cQYzQmqY/gZhfr9OCXw3PImb/L6D1KgFPqW7uTuv
         s/KOo/vplEnxmyI8XaYtZudBLqG2mF/JS4RBZbRxwwlw2LPH5a7wCu7eyEzz3VLehYVw
         wQOK2pHAcO/8kG+eqHMN484vzd3RINV6HpGrJ1R/CyZYRVxTF05d+CpvFGleV2W+GqbD
         5LmvVwpw0A7plUjjtI2uK4CT/ONsbvl7/Mm5IFQNsrr9v5Y5THskQHOxYDH+8SYTESv8
         hbXw==
X-Forwarded-Encrypted: i=1; AFNElJ+4yQ4vDuYk1d8HRDfHtzIi+LEAoT5x0bek6XoQzwpm0I8G4OHgqlh4/eGbJssuFkoOPpAPzHRZF+NXwBd7S+E5@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8YX0tssTdW8l0H1PCMhcdG2e0TRwbuQq/qquRieB9Aonto0KX
	uHw02x2ZPGNyRnZhoN5OZNdFpRMMbzxQSnipYiWEWNhRoO8V9RkuU2N+qRELZgwyw80AwpJpz6i
	ea2EEAKjtL65xz2IZXH10FnpVHlFtUUzG+dOGOwl4UCTbt5af20T5/1u3BGZmquFafU5IedTGqN
	qLpQ==
X-Gm-Gg: Acq92OH5pewt4Up6r4HdY+cIiUy9RWXiRN4TcfWxXkw+2IwTtloPoTPKUuMKlKcwFMR
	ZrnB4reGuHNKqQ9MJQLBeDxHmI8zt9LARCi7S9F8SIAvz+3C9/Sq4lNg30E4MolBMWluVQTKiYA
	IHj7M7HzkPnPG3xniTxeHmiqiazn5f/fDu4ImKU006FjUH6QhMQpKJUzLUuGyQ3yexaCW4NMqHu
	CUsGtOm+7eLG9KPKhV4GEHVQpOt85aver74VtGTad48c3m1JY6A7kV69a0YOzUsWSitiQDmN34y
	/pYiNKNd1TtoGnp24J9oXHkEei3GGkcPGGxfalHavLGyS9kvvEqjAnZYvOAEtnmBZ7zBbOzHarB
	pW9OGeF+w3YVF51TNxlXWlyjYzd0iikIUW+y8Dlg18yy0XacM3uH9NW/7sQ6dNos1pGIDmr+50o
	Wovt0cPdriEYVG99Caxy40b4zFQPVXPwdnLUVyL11t9D5lfA==
X-Received: by 2002:a05:622a:7d92:b0:517:b68a:8d8f with SMTP id d75a77b69052e-517b699d7d4mr24581111cf.19.1780868018454;
        Sun, 07 Jun 2026 14:33:38 -0700 (PDT)
X-Received: by 2002:a05:622a:7d92:b0:517:b68a:8d8f with SMTP id d75a77b69052e-517b699d7d4mr24580671cf.19.1780868017994;
        Sun, 07 Jun 2026 14:33:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2d5ea9sm40374041fa.32.2026.06.07.14.33.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 14:33:35 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 00:33:09 +0300
Subject: [PATCH v4 8/8] usb: typec: ucsi: huawei-gaokun: pass down HPD_IRQ
 events
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-hpd-irq-events-v4-8-30b62b335487@oss.qualcomm.com>
References: <20260608-hpd-irq-events-v4-0-30b62b335487@oss.qualcomm.com>
In-Reply-To: <20260608-hpd-irq-events-v4-0-30b62b335487@oss.qualcomm.com>
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
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Francesco Dolcini <francesco@dolcini.it>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1481;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=3SjZ31inNFNocQI2RmpCu4Tw/qg0rtSCt0SZ5oE3dI8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqJeOQ0bhQoOsJj857BdAUiqH5pox278y0oAyGy
 RFMbu1dyjqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaiXjkAAKCRCLPIo+Aiko
 1adXB/9gLuR7QGRjAk+HXqf2b8R0PyE0WvdRPYlehmbvDdwTKUxzBuDzzuiV0kTay/bmwkqLoYP
 eSEgECp1mqSpjvxIbCTbpUNLT81GFFEDtjKOgp0EizyaOAmRWZF431B/LHJEqBNRywGDAMR6g28
 XBko5Ih990ex9CIhpqFhfLNy8a/OK0J8+WGQPmWoxwIt9PsO976mFy3iFyD5v4yPJ19GDBS9g1L
 mBGAh4TQw1r6fDBZ0z7VjlgWvcKT0EJs+3W6Mwh/6R/5YhL3raA9bpt8HLs1yUxKd/64FRiW39e
 4xRBwvcrgMfsxCVs47NwyImiptqBmFZy7rW5+/2YVxJAwuCc
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: HdU8B9Y6A0_mJYdoPx3qiHX6a53cfz1S
X-Proofpoint-GUID: HdU8B9Y6A0_mJYdoPx3qiHX6a53cfz1S
X-Authority-Analysis: v=2.4 cv=YIWvDxGx c=1 sm=1 tr=0 ts=6a25e3b3 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=pGLkceISAAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=HJ0TMOZLSqZlwYNULgAA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDIxNyBTYWx0ZWRfX9THqEAPzi5CX
 PWqcJ1sdPhPUOM/lP1PUOkd6kAGMAElYxrePaV+gEmXhn4JdemS2Cd11NtfnNxzckDMHXN1I4pH
 ng3yhFuEFhZOBlxxUTDhO/39WK160guCiT8qbjQ+MEEJI2Uft6At87CUrdXmFAElWZlZvfoJqac
 4uc1IrYZEBO60ONZCKdn4AQtKZ8wkTDYZJiNyJ8MQutE1BdZ1oXsOljSPAeZEcRP1FILIt9mvGZ
 Xo9X4SUFGEkufc4lEYEYIabeDdALvdiZs9CuZT/qrJW9d2GFPxIbVaArt/9ti6MrEk8szLEWfWR
 YXNb5YPy9YHZ6sGglpldRanvIUdZZ1AGfS4lqNMuR0aSX70nQMuSJJ/VtY9pVs+SnrE9WBHFzBv
 xy+taw0Q9RGZmIMcMZUIMIgQwmZoPchuvOmtgRxeft8F+mk6J8XlXPQrgrfPDmMmVmvsfbR8bP3
 59yLbuusMAbW3nG8/iw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606070217
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_223410_215192_3A653E2D 
X-CRM114-Status: GOOD (  13.63  )
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

The DisplayPort standard defines a special kind of HPD events called
IRQ_HPD. These events are used to notify DP Source about the events on
the Sink side.

Pass IRQ_HPD events from the EC to the HPD bridge, letting those
to be delivered to the DisplayPort driver.

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


