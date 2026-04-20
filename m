Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 814A4F5A8CE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 23:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sZrnMsT7jt/4L++ru9IvAvxyFjbRkLz2gfqjnGiw80s=; b=X5d9+1ys7JLzS6H4DDwfPZuCVk
	5AntIpdTMifGWDHE4wCqZ8oKLJmqfpCEJHGX/r9/A2B7syS1m0BI2eOy1kRhBPbWlhq+aLdPxRwlm
	rJHp7LKbTsF6Cl6xEyQDvAPoipvDmABEIKdLQ9t1Q5fw+2AJNF3fAQauuBIMkP1OthSEG8ERkP7XT
	IuYYqFZR+fko8MJ0ZN/k6XtQy+y3dAPi5aE8xKoviwHOYO/SipbSsJS1varYq4rLcehzUlmwntiPR
	GmkhAo8ma1qUTIPr4iWL39azacGMw7k1JHRBMyG1VY9GhrJpT2nFLM/liJKZG9SV1zyLgdxHoPlEU
	3P7kxpNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEy7p-00000007p5D-19J7;
	Mon, 20 Apr 2026 23:33:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEy7m-00000007p2x-47YH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 23:33:56 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KIoLSQ1532135
	for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 23:33:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sZrnMsT7jt/4L++ru9IvAvxyFjbRkLz2gfqjnGiw80s=; b=nwrsUnmIe2W0tHvx
	qv+K2ykbluRxeMpFT2z5cR47aB+Ai4q84jOYOhzLWiEQvlTwZ/Ylxc+oJFZDHF2P
	XG9H9qtHUt5eWPtgbsahyI1rREj+jUJxMhKrdGcGQ3gNJXQzyVL8kqJsjZ8V6oO5
	GeFWtC6x5dEAU1JgG5Wkc2S3YgFC1THHWx0rpt6rGyYLPXlWC5MF882vlxVzwyKf
	+bZkCAz+JmswKLySVaHyin6V3uyZvMUz2dNSl2j6oXN68cfxLKkGqjgMox6wwGRd
	ES6mjX9b8rflNFCMSazlxbI5Q4os86OmKU2IQR9C17ryB7+2Uaga4/iYzo/s3fuA
	kK5Jcw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnfus3j9q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 23:33:54 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50fae95c82cso32660971cf.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 16:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776728033; x=1777332833; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sZrnMsT7jt/4L++ru9IvAvxyFjbRkLz2gfqjnGiw80s=;
        b=S3Je8JxcczMqN6lDNAW8UxRra6BF9d4dW5NtqC1T/4UZmJmmNtdrdboYakNFLuMo6F
         khtMRjeJo2518KL09K/KQiqrSRFYAtS2K+c+1GcUGn9ysqGg8j2ax6NaQbY9pwCVpG6s
         ctKIp1Pb9m8ueGHAktaP6zxoCm/EAwsnqiDwtNchddtvz8B3xjvG5MH8r02w/eGdRDDv
         Vq17e0QutwTxHf3DqM/1rfdUCIPL0sARZSl2K+jTW97zRY5vQsX1XauHJ/8cYvl5Uoan
         BJjVVf0OfzrAqOJMHoBITuUlYgZRFKZpa2XzbDLXarYusEg7opb7b8xEN8qQhOBsMDPZ
         zpyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776728033; x=1777332833;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sZrnMsT7jt/4L++ru9IvAvxyFjbRkLz2gfqjnGiw80s=;
        b=YhWlKqrUOeWrSoG2L7MWRxl6p9TcZjTwI+xOSs64MMmwSfgjX7GuC/6qZQK7lvXRi5
         0yi+ZZajssoMtOcC8QqkVJgOoIPT2MMle/spxMr37WVyF5pK5LKBzWikycz3D2AZC6ad
         u80Oi/VQSWeFFsTJ/2Irox1jtHGhIEYED2yDua8HP8+L0G3qaVMIccoZ2QdGOXmZ+hAQ
         JKxpZX909AEKfEv8nSbMMqGXUdQ4TJN32IKwB3CyRUxLKcXp8ozjpj4FllfWjr/dHFa4
         6vklRjIWS6xAIbFJ5HsGyhn2uhzi42DSUH992JlKwyunb+ihbokZlLogsbeHsre3GHp1
         jlrw==
X-Forwarded-Encrypted: i=1; AFNElJ/thRI3jIw/bLcN4wVgibaQ2G7rgjoxrm4ggRemS+32OacQJW7M4dx+mG8bipNpS/txhVGO4Vtczzw25Y/YSFBR@lists.infradead.org
X-Gm-Message-State: AOJu0YwmYCyMwkQoS5rNaxuhZAyJT1kXbwi3Zig/cD4GfwIAwIRkyIRa
	2bB+efff6LdiFetZGnajrPwuNlTYBdrw2Hj111lq48roryDphAaYsvkfTpgKTjOZqhRjjJA6G+N
	nprwDnHCMkbKMUEZy8H2FJb+XX5xgqMugpbk8twQQFs0KyGHniTlE8FAauKq6PHNgHHKWizy2aG
	zI0A==
X-Gm-Gg: AeBDieuWt4sGNsJJPn4OeZhqm8hZYyZHRUt74RgZfHOD2ZqwIT1nw0o2LSTnHGWNPmY
	dYQFN7u7C0dRtoV9wX7BrPZCmsfRMpX7/HBqhKBjllLiMJwVpJmPvteHfH4EI4UwSQhEzT0v7BL
	YqHuAi5TJ9xIKNWYxdC06tNBixxStcN7WYI90InsiV6SNGQgYWOZvM5L/vqZ66agc/0Sq/TOC+c
	V8WvhFvtSn1vUVDr4iZH82F1ETsWNSdMO8svy2NJRzdae7aY0sXTfYSOtULZsMRoHzQ5+1s7pGl
	JS/sC0NVc9RDaUmGJt4ntisEbSIl2GNSUkEN9RyyGNdfzGrr+FcugA42NAtb5xmBEMkOzHSq9rA
	7xxrPyaJR7vAcRHkf6DRTdBr6f9kpGvNtW6+AMSAreBmx1fvQciNvbWChfjxdPXoL1EGpoj1ymM
	iqWzr4aNecu5BvJfQpAL9H+dAiFdXy7QfLuM2DjlmLrqYGug==
X-Received: by 2002:a05:622a:84:b0:50d:912c:c2cb with SMTP id d75a77b69052e-50e36c4d835mr229844571cf.42.1776728033448;
        Mon, 20 Apr 2026 16:33:53 -0700 (PDT)
X-Received: by 2002:a05:622a:84:b0:50d:912c:c2cb with SMTP id d75a77b69052e-50e36c4d835mr229844161cf.42.1776728033013;
        Mon, 20 Apr 2026 16:33:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185bc627sm3320714e87.29.2026.04.20.16.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 16:33:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 21 Apr 2026 02:33:34 +0300
Subject: [PATCH v3 4/6] drm/msm: dp: handle the IRQ_HPD events reported by
 USB-C
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260421-hpd-irq-events-v3-4-44d2bf40dfc2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=891;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=+/ILvBuGhqekKhSlkO02babbVbDbrJeHq8l4XOhAwlU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp5rfNyjFzL4b8IkwF/PF49lz1EuPnWyS8Qxlcr
 U5qoTUzCLWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaea3zQAKCRCLPIo+Aiko
 1ScGCACJMMnjpi9t0iULUWpszlSsI4q7iJwWHegcsGM/iwQvHCyLVAcm8trSNMycKBpkdlIpjgi
 qutScdnn74VcxSgGoQBusOE4JTtC3EwpKjWOu6D9oiMf+ATGfMVtVxG+hErUzl8iWh9g3t9V/j1
 PwQwbR9Iftr5kNio91MsoXuBkTudXywYpgVCcJ37u1V/th8NcezRjcQE1ww78mBhhXwEc6hpKj1
 SgtTJImlf0dgsumqITASw/7XwPheCid49bfS54ITNHRvaeGrnWr/ls0GnSNCyIoD5HBWS5/eeif
 nkxyVQkoGqHHpBIjjlXqa0CLa+2io1+jotp1uhof45783PSW
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDIzMCBTYWx0ZWRfX0ExPk5bhxrM3
 nwNXlT+bXY976AuICnjzd+A19bwLCTM31qmZ94qtZfvIaMn/OhF1ByXGMjCRuYojDP68GAMm0Mk
 q+S8np4NLruFlEI6VdfHNQ0KfMZxBru9cIIeoy8kTHrwrATWbA0GulbyLTFqutteuMBtq5MErtQ
 p0KSM/5Zm1o3EU4XEp/m3t6hJvm3UG/mcps1hhoRKkljAuYA8tsx1LYt/wqo3fLOySJ6Xw94Out
 u44XCrsZ6K480zCGT84iI6N5ozAp4NdAcIuWSl6P7sd+wOMwH5Htv5IAFgNz+2T0DRoRvgWfpn4
 VCqcT/uUqoKBbmmqoHKEkevG8q2olFPgNLn6IzgBgLHRgz765MtyX1th4gxPUcCeQLW9X5d/ra3
 uJLQwk6wfNZyzomkaf/LDrIJHK78L0JTM5g0JKMyqsq0CMXeaQnopYpyyP4vQ08VotmNKeLiXzG
 P2G39xsNGVUfzz7E8Mw==
X-Proofpoint-GUID: pwB4H0ak_WmrFCj8Pszivms4wYFcjCUb
X-Authority-Analysis: v=2.4 cv=PMQ/P/qC c=1 sm=1 tr=0 ts=69e6b7e2 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=3ML_fINe3tzxlWvVV4AA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: pwB4H0ak_WmrFCj8Pszivms4wYFcjCUb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_04,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200230
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_163355_053848_B0E448E7 
X-CRM114-Status: GOOD (  13.62  )
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

Let the MSM DisplayPort driver properly track and handle IRQ_HPD
delivered over the OOB events (e.g. from the USB-C AltMode handler).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 7a0623fdbd8e..8df579bb320a 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1800,4 +1800,7 @@ void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
 		msm_dp_add_event(dp, EV_HPD_PLUG_INT, 0, 0);
 	else if (msm_dp_display->link_ready && status == connector_status_disconnected)
 		msm_dp_add_event(dp, EV_HPD_UNPLUG_INT, 0, 0);
+
+	if (extra_status == DRM_CONNECTOR_DP_IRQ_HPD)
+		msm_dp_add_event(dp, EV_IRQ_HPD_INT, 0, 0);
 }

-- 
2.47.3


