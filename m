Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AD91CD8C90
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Jun 2026 21:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HhevlY6dk/ftxvio6CBL6QbAFSSp/a5ngu9s7xr+zgc=; b=37xa3REONpSJXttECkkFb5Zzhl
	UWEFepUmMktJFp+wsKniPhsuWWsLU1t2zlha+Jr4C5/CqpiHn60n22LD2+5IqVumLuWWUTCsRBIms
	67OdyezyRs2T04Syx1UePwkCHt5pLom9C5m5ng8JdNbjmCvUIdAHfd9Fs3K6xeqQ6YdNWsNA6954U
	36j35urcig7pUGlIP8Tc2vTjEZegMgGGQhZDap6UPT8jGD/a+DGEQNqAK+mbeaSpwjsTh53NM2iob
	YGi4YdtPLnBGupKJ8cz4RcVwx2YsbivtRZWmmz1TMYa9ilXAcxDMObp3aVF50G4se7GVuAAb8kNts
	hHCD/bMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWL7h-00000002Vh7-3PP4;
	Sun, 07 Jun 2026 21:33:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWL7f-00000002VdI-1tty
	for linux-arm-kernel@lists.infradead.org;
	Sun, 07 Jun 2026 21:33:37 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657Ek8jD399161
	for <linux-arm-kernel@lists.infradead.org>; Sun, 7 Jun 2026 21:33:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HhevlY6dk/ftxvio6CBL6QbAFSSp/a5ngu9s7xr+zgc=; b=ed2MZhcPR3ZJGhm5
	+YO16MmNxuN+dCsrIyoX0dbNtKYdE+mXIeUFaI5m4tL/8sC4JDvTHIF+iI/ZKfTy
	5tuPR0kjUDFAN4M/bj01EFAbZmD1vXgW33IHtqdLaKD8+Og9HFpTiEPk6p2rhC3e
	k2QsiU8LYLCa3Uh52T1+5W09iLZykr+H/ckInlthHNkXhnAD7TMu95/MsU7TO+2H
	ka6I5kIsqe4BprbPkA3vl05DmALsf5IyHe1zEyVd6pK1cyEgQY1P1P2Obs57PNDE
	f0NkV/UYxpwp29Ibe4Qt7TgTH/q1wyqQb7nmlqPwWrefKljAe2zwI+rDAhy4Fzcl
	VjPJvg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emagrd42j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 07 Jun 2026 21:33:34 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5177bddf6e0so92550211cf.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 07 Jun 2026 14:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780868014; x=1781472814; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HhevlY6dk/ftxvio6CBL6QbAFSSp/a5ngu9s7xr+zgc=;
        b=JGt/6wgoGtdGUBpHuNAg6dTDni/TUX0tcmpzwlKqV8KDQfR61xDJNyuQuzD42vqAQ7
         48xA9/NIzTepmbey8PiZgVyAqddWsia8SQJ0VPjM+nthrLGdMBD5jpMUQGaksJsroiKa
         JXChgiPkMe0hiE2GcPpsMkqjqYDFVmHUpzSD0wUm5cmb8qUioR4/JAf6gObO7feneCVX
         i/vWKiCVj3NKOXCHwTHfxJoqLco2HqCTNIt/YRbhdaxrmuaqxFaJTyZmlx70iKQgrrhC
         p3t7Ug9PvySMllkj/3doVMhoYPFBins2J9SNh2Gu2QFUkZoTdn90cxZRFkwlslVn3pU/
         KcHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780868014; x=1781472814;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HhevlY6dk/ftxvio6CBL6QbAFSSp/a5ngu9s7xr+zgc=;
        b=Mo55SYoq7wKo9iDKmbuqMce2Gd6RQcbgaEjMl4M+JqXfaSQIE1h/Ic4WnCy0y7QCll
         L9oe54jP0pBsH544BGq3Ga6CJZuLs0fJgaJYqIzGk5rWhbtW8gL8yiTYs4+ET9ZOBQbx
         sAo2Yof+c2MFESXwxrrLHF2W0wL94tFFqEqykIoKDYMGhUkZpVO8mznKNZn0l4g9k1lL
         /2QDjdncTU4ArGSdye4r93GWdwmzROLpOZJ/sKNL6qzvXsRoNVtQAB69JoWJHEiRmhRZ
         BszcjQoExjRZ9rN0Ggx10H7VSnJHJiY5+/k8tkQfSTw2a5xI04gHlb4XFftI2UlY4T0a
         KE6A==
X-Forwarded-Encrypted: i=1; AFNElJ/UsCKkC1zDS0KLmPjX3X8cPRXXgX0g65ytsjAcm0NZGqYkO4706aa39dl6qGMVrn74MCEUO0HSoY1uae1PoLUd@lists.infradead.org
X-Gm-Message-State: AOJu0YzTjeRuh7E1OPo0maHYp2/XE8al0mOV5dZeJwOc7fVJguQspKZC
	YGnhvqdP8QNrgGaK22ikAvozqd3SogF84GdodsFxV5yN7Wl88YHDvkx5jEK0qSXP1iqBDprMJ/L
	W/883kNJYE1vgFBAX+Es/b3wyfGD1C3WaG/9MiRdhezsqAxS4saFb1TL5kEC49Y19C9u8SLyIqb
	B9ew==
X-Gm-Gg: Acq92OGqrmWWdWks1l8sAiuxV12PpQi9ZZal078w8SXOd4+1g/rWz/q2mSUcviQpF3H
	ZkFc+nAOyOuwurzRONpWlVqgezO7Ek+rgxWmJYwmVdoj3pOKGCtNL9aiFjxz0YUqq1wDYrDNng3
	9N4STyoKaX7BO09jHfgAkiZgmOMpYGO2EUHzQQGaMpXozpgnQnReKqMT75RgZCPnjaQnksbwWB1
	Jg7h0uw0Gorn6ltt0lw0E/wFuQDKfdXmYL9tS9HqqLYRcRUn+hBoY1Y2q3u/D84x0PcoVDCU5da
	HLJbpK0obsdYwy3zumqTi1KuVkFRsJp2lfAAo+4jviDmDJxLuDW6Si3V0g0XpwmUBPAD5+vrJMD
	h/XMzC80dCINu3xd/2tKtH65vvS+1fbyz+0X/vv+PwT3OStbh3S1qVZ6QCcbq5YOZdbxTw/HdKo
	oWgbq6uWQ2CjcyY5IE1/Gw8Xcu9CJvt2rE1wRZKrq9d2G2+g==
X-Received: by 2002:ac8:5d8d:0:b0:517:5879:1e2f with SMTP id d75a77b69052e-517987df585mr128694811cf.27.1780868014043;
        Sun, 07 Jun 2026 14:33:34 -0700 (PDT)
X-Received: by 2002:ac8:5d8d:0:b0:517:5879:1e2f with SMTP id d75a77b69052e-517987df585mr128694481cf.27.1780868013602;
        Sun, 07 Jun 2026 14:33:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2d5ea9sm40374041fa.32.2026.06.07.14.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 14:33:32 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 00:33:08 +0300
Subject: [PATCH v4 7/8] soc: qcom: pmic-glink-altmode: pass down HPD_IRQ
 events
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-hpd-irq-events-v4-7-30b62b335487@oss.qualcomm.com>
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
        freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1367;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=RMohNnP615sOpE6ZWKg1trb/KrvgErHGs2zP2ZkYPtM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqJeOQI5tl/0XcA3tgWGBDfparpRR7p6oX7Tvus
 qwjrqzb+oOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaiXjkAAKCRCLPIo+Aiko
 1XWXCACmNj3CHr4O+YRbKUG+T11qRjlO3v5XH4k0gj9GScSSKB/i++PNRfIVaB3JOvEoD/AYHrm
 YFUwGw2fBFT2Jv2Fhyilg176SDLOp8RsHVt0LQrKTd3iVzD84bkfPw5YQRsnoC0q2NNOeteuu4P
 oNZgIAB39IsrY1AUoXDu87QaI9/TPgg/T4uL/reYnY2d84fLwma0S1+Jh2/lbnZ1SDxBsBxpeSE
 e6BfBudjneZilPPKvQDNmThuUz1M8q6khvqmx+48G+tdedZN45pveTW7QE0GhFJ4QlRiFxRstqG
 Gz/WYDvc1HTnwPXv2iuBiwsSXHMYqAaiEHZoR0/q/qODETsN
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDIxNyBTYWx0ZWRfX+mz5FWN2UZGu
 uk42WSAhKOT9s+K/VqdYrVhlMVyVdpTvPnNeQF6sdtEFacPJGoCwOk+X6ufd/coYBUl18vON6tL
 IPV9Dbf/7uwuPCl0NG4cZ3rjjrGzvPZX8bUQkmHBhIuzCRGbu2V+sOj8SxcHQPhQ9b2/W9FqFGF
 jSda9kt2FIiR26i0TJq+MIls3rDngRjkTZyLvEWC5/7se5ZUDpbnACi+A6iWHzvZg5lZAB8WDay
 43+fs5svJ7AbVhv/uNODlisguwV/J5k1ADD8R75wXmuy3we/w+6uX2NtNY7ZxtWG1AJ6H0AbcUV
 hykigejcMJy0Z0mPyYh5r5UNTDjTeEIoOOPE0aYRQ/gpB6lgu7U7ywQY3R5kOTRr4jlzbaVzITs
 2xy6kGGglnHSxsiNQ04Wt2DXsxzrjcWLkGS2s928puiFK0YAi96xNlfcwKtd1oTXKkbOZnpDmp4
 UtzZ5HHuRZxM67SmKFQ==
X-Authority-Analysis: v=2.4 cv=G/4s1dk5 c=1 sm=1 tr=0 ts=6a25e3ae cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=Wdvqb4HS36tEXOME5F0A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: fg-o461graT25nTkJoXX1AXkFyl0_mEI
X-Proofpoint-GUID: fg-o461graT25nTkJoXX1AXkFyl0_mEI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606070217
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_143335_512500_3E3E7218 
X-CRM114-Status: GOOD (  14.34  )
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

Pass IRQ_HPD events from the firmware to the HPD bridge, letting those
to be delivered to the DisplayPort driver.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Acked-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/soc/qcom/pmic_glink_altmode.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/pmic_glink_altmode.c b/drivers/soc/qcom/pmic_glink_altmode.c
index 619bad2c27ee..946eb20b8f83 100644
--- a/drivers/soc/qcom/pmic_glink_altmode.c
+++ b/drivers/soc/qcom/pmic_glink_altmode.c
@@ -373,7 +373,11 @@ static void pmic_glink_altmode_worker(struct work_struct *work)
 		else
 			conn_status = connector_status_disconnected;
 
-		drm_aux_hpd_bridge_notify(&alt_port->bridge->dev, conn_status);
+		drm_aux_hpd_bridge_notify_extra(&alt_port->bridge->dev,
+						conn_status,
+						alt_port->hpd_irq ?
+						DRM_CONNECTOR_DP_IRQ_HPD :
+						DRM_CONNECTOR_NO_EXTRA_STATUS);
 	} else if (alt_port->mux_ctrl == MUX_CTRL_STATE_TUNNELING) {
 		if (alt_port->svid == USB_TYPEC_TBT_SID)
 			pmic_glink_altmode_enable_tbt(altmode, alt_port);

-- 
2.47.3


