Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAF56C982D8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 15:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZeC773TKEYubASujmMTo4cYzyXvzJFRJKmRo+UPd0C4=; b=0f83lTW5DNVg7xNOcqONsXGlz5
	PD/oMUO3DAXPu4B35V8/tmrL/WdhHy1aNi09V8cvlERz4GsUxQnZiv4gF+marhwx2B3g3IkISxHBy
	nmIRCmhUoqjGet0aqfc4kArAoDUoKvj+v7nUXhkSPKWkbAQEFPsotF5v/AuyemX38CuT72ZANC7mf
	O7/a6stdZaC1+ATLOmxBSzluLiOdefCblZY4u9k3x98d8XROXpMm6STD2YsVf04R6wTB2ocMPR1Fb
	gtG57ExgTOE1krQilfhg16NuK1v0Z2+1XgSUvNOMk+KZO6KCaHrBGdVjZDSzK7LKjSb6SlNxbvT4k
	5IT4kA5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8J43-000000001gJ-2MLf;
	Sun, 20 Sep 2026 15:02:47 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8J3y-000000001dk-21on
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 15:02:46 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68KBo4el2287828
	for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Sep 2026 15:02:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZeC773TKEYubASujmMTo4cYzyXvzJFRJKmRo+UPd0C4=; b=LyhU/NIf6khqaz3X
	f2oMgJDFkUIx2VNz5QCZqmwTUJMGy1g2VGuy+Wa7qDxFAGlsE9RXPhiwx5BReQQj
	J8IcQf1B6LrThNm6c1DYOZCJZDP+hh5/P62LijFAbhdFvjHu27egGlxk/nf2Kyb6
	7NC0pAG1EDnjKuuY9+GxG+jDsCehoXoRSk4GGTDvCVjpMeJWckVMgxSHL0ZNj9nJ
	zmsoWAl3OS4X7vNRxGLbkmYVC5JcA4rpMJmhe0sdCQxhppVjQifaeLr78HIjAHXY
	y6zfaK08WIFaGiWEK8VCCsLoJzvHn0fOu2jsFZ22Qg+icvuZkh63AH5r5DvNlYhs
	AdYkuQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gsfrnujmg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Sep 2026 15:02:41 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-78f4d6af128so643812137.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Sep 2026 08:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789916561; x=1790521361; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZeC773TKEYubASujmMTo4cYzyXvzJFRJKmRo+UPd0C4=;
        b=bc6CDjsOLVfG+ZHEs8S+jISytz0v+NgIRfOLDpm7lhhFftj7hXbhXFt/GE8ECaNRk1
         p+Y0lATKaczS05sQ/nYaV9/1NSKQm0/jnh6T3VU5BOFbFV3kDelHgNp+iJIZHBFZSnUj
         zElTFDCjCX3Cbf7pqcvuPajbgpyVWsckQnuC4yy/celeuBo3UepxL9ZFCSoOWzc+DVF8
         F3fDe3nUR7Btq88BAsfBQ6+3OospHqHVQcxWe7IA3WAWhsTwsRP+7yzEYUgb1L9drln1
         g2PCmI3Ehpp3q+LZTfD62Em6Q/QAYXykMiminr1f1w9fdhSvOYATkhYIq158HsND3C0s
         rIyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789916561; x=1790521361;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZeC773TKEYubASujmMTo4cYzyXvzJFRJKmRo+UPd0C4=;
        b=tDi/fwMdmZtf4FONe9RIhTOnyJO90LgWVB/U3e6QdKvwygLbR0Y+XbWIHDDvcGCO+Q
         QSqXTh3bSxYOTfRFcpCRbFtxzh385xY+bR2MLzW7vO7O3osl6LVnA/Qd7Tywm/VcTOJ0
         RcjI1E5L114833wQ3KJWT+E9DwpU8PcFxTttKpcNWiplqUjwYQAijfroYDrbfRTdSPnk
         dwBGF8l6R1J1Oqot4RDII+A095UbWD3kjvIp0/Z/Tzqa/JN0c6dDNS2kR7KIj2B0bPWR
         7VsrHa2fkYM01UL2+kVvElrXk9MhRsqIMSQFXAgxny72UzskKbMK3I/EMU2voyDT3JJ7
         luSQ==
X-Forwarded-Encrypted: i=1; AKwUvBxzwvzcDvFoDLaefVLmixaY41UCGkdlBgJlEORnbGICpph4FwIWw+cxivXi9HsdaWJ1zaV9PpqF0fCAqgc6nyUZ@lists.infradead.org
X-Gm-Message-State: AFuF++ny6omacm56PVuMbpBXUHw+oNFXzs8IcXRTTRwIXj0oB+weG9ko
	PEtWeWOplM0EYeEkuuSPGJXLXpeiyI0G6Rw9h3bxe6TB9rk6+r7lRPdPfysw0rRByQ7gQ/dQtSH
	jNp55E9mVBb7dBMxdg7fbzmt6mtOkZUP4kd0XUCkmO+O5JKAjtT8yEZswuBkLMbTR9/HSVgd9nq
	qoAg==
X-Gm-Gg: AYBFou0l1r1UxTnFLOHW260M7gXYlcoh0fbhJ6M5fBvkyH7tykCaBBEQRAfkFUsKhZy
	CiFsJVsl3TfGq6CiWRJMvxPDQOBvKx/ahkqWp81jCYIVlet85KuXc9rMY7jLwcTzCRMY8abwRve
	inxha2XKo/C0l1kAnXWpRGS4vxolAYkuB1S15VMMza9/JEDEOiQP6OQ8sq0srYzXvMKTQJNvopN
	193KLliFDmDvFSz8qGLe4BEAPVOC5q5nDey8Augaf1cPa7eqlQpom2RMg6sXQqMtSLw1SFXA8vU
	oMUfMBCuBZlaJZp2+qsm+4F5V9+giCqnxnid0PUNJHt4lcPOW24KWghv0KRB8IU21+GmfDIoC6g
	gb8hi+mdYNCs4KkkHGTn57XpcLP8b8xf52uWUFoeajl3M3qbuFRcvQM7+Ww42/dsyjzEeGzKB5/
	uRSLpXxCk/Rhtv
X-Received: by 2002:a05:6102:370c:b0:7a1:f7d2:e80c with SMTP id ada2fe7eead31-7a55ca8a2ffmr2385170137.20.1789916540385;
        Sun, 20 Sep 2026 08:02:20 -0700 (PDT)
X-Received: by 2002:a05:6102:370c:b0:7a1:f7d2:e80c with SMTP id ada2fe7eead31-7a55ca8a2ffmr2383773137.20.1789916512407;
        Sun, 20 Sep 2026 08:01:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a6163d7119sm4090061fa.30.2026.09.20.08.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 08:01:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 20 Sep 2026 18:01:33 +0300
Subject: [PATCH v5 8/8] usb: typec: ucsi: huawei-gaokun: pass down HPD_IRQ
 events
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-hpd-irq-events-v5-8-ff1de0090c72@oss.qualcomm.com>
References: <20260920-hpd-irq-events-v5-0-ff1de0090c72@oss.qualcomm.com>
In-Reply-To: <20260920-hpd-irq-events-v5-0-ff1de0090c72@oss.qualcomm.com>
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
        Francesco Dolcini <francesco@dolcini.it>,
        Abel Vesa <abelvesa@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1516;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=bY5FhyMu3eZPaJc1ltLzH3W13KWzM9lAhGrC22j7pKg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqr/VInUmy8zA1nzNuEwUoOY5JpzmI+vHj6DFGd
 p2t16GjXiyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaq/1SAAKCRCLPIo+Aiko
 1cByB/9kaXaz9ejico38hBPR/nrKnSJ2+GBGrC2HgOUCqVJYVBl+wD1iTcC0lJ1lI1rVVoFb7hl
 On3AdOhJDRB7INjnKzoO/CrkukNQF5hbG/cma2VXE4Wvc3IvWqmYsU2XXYzqzvF/P+iJeVE0Jf0
 EQp/vND7wTm9P84MwrqonVtf5jamrmZc3eVaT3GaV1v2rAkWRDCqWJlnB+G8FmTWc+B+ZxGGfhI
 v3WNe1aScNk+JZC43arleaguKrx55HU4VILKhUhERhcbTnG5cu20D9ZweEcwC/CL1hIBHoF3LdK
 iFd6uyPvdlFK5oHvM8QmmRcWseuO/xY+v5QAxeh6NfTfCBtw
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=W9mtxhWk c=1 sm=1 tr=0 ts=6aaff591 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=pGLkceISAAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=HJ0TMOZLSqZlwYNULgAA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDIxOSBTYWx0ZWRfX3UiwFHEzp8dE
 Tov2brWMSqTUs0JBrKsAovtsbHqRKrpWsUj/0GG8foQj8QXbiTFAg4sSYNPLISWkkcCwT295Zb6
 OK00do7IZiLEHwKU7Z3DyQC7Q2S4zsM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDIxOSBTYWx0ZWRfX3h2iqWd2rWdC
 hpcMJU2qWCCISBwrHvgGFkFuQOB9XKWCjDNxyHDx7kflK59LUo9+DitNnVIekJQwk6xfI41kZ/e
 5pWcC/GwVuaoB86bRxzVjCgtP4XdTNJ7aoEE248xttVp89SlrUc8+giGeuewVYV5Jo1hw+cHWps
 alJuTH+qZF5xgegMemd57gMW+ASB/7ykITOYFym76pQifa18ejKtIUR4IMoeHEwW4y9aQ3daJx7
 K/o+QAN+dGTufU+NKT4XEPOgN+UX9Qb4v/M3jbNzoYdAoMhTWQYTMtRd4ttaIP4oDnSVU1SZCxm
 3nRQTsPAjQXP4JQKpW23tDgSH2y8PCmFlD/nt9e2T/Uj5J37u7PDiQllOhXIoRAx0/Cc0IovBRC
 gZPmzX/ayisykDmYkOPFbcRQGogH4uLL6i3U7v+wBhbA3hMnY9Tb1vDNypPfRfViNyNVNfTBKhq
 /CmlPMa/l3w3tLnKrhQ==
X-Proofpoint-ORIG-GUID: vlTBpi5Qr-RSba1x2tZ7rLVJy1oiZy8g
X-Proofpoint-GUID: vlTBpi5Qr-RSba1x2tZ7rLVJy1oiZy8g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200219
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_080242_643633_A514650A 
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
index 57b37fca150c..cb0312e2b8dc 100644
--- a/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
+++ b/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
@@ -316,10 +316,13 @@ static void gaokun_ucsi_handle_usb_mode(struct gaokun_ucsi_port *port)
 
 	/* UCSI callback .connector_status() have set orientation */
 	if (port->bridge && port->svid == USB_TYPEC_DP_SID)
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


