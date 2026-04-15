Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3DD3F433CD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 23:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QjrAezVeYmMM4Ps1ry3g2HLZr/7V5M12bVqxCDqfRuM=; b=ahG9MAkPfM0qBx
	l4wOYuIDu1Yn6rDgXc2anJ4E4YUgQWSduYrJjKEL0l/Tf8jWwlAwpmx1KEud9HOmdZxXTUIQXplo6
	7p9eg3UBUe7oaAcm28ylRCwZI/h3rXghr8HgHnm/t1ESJN8d6D3VwZYzlnA/MgDe1icR4GpJlvy4i
	kV0xb3SNsI9VTXpn4vkMg/YikG007LoazOdKwg+S8OrJfuwDNYGbBeOrhfaQmy/803ggYjOXXTkMr
	G20lLcLJwFXNF8p7pB9PTez7zUum4t9RUwPbvPqM6XO853ThqlfMJh6tVXmwhvs7NsXFZOHW8FKgP
	v9UkVVIAebJD1m/YxKHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD9ZE-00000001jjL-3bqw;
	Wed, 15 Apr 2026 23:22:44 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD9ZA-00000001jhw-3max
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 23:22:42 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63FF4sEJ862969
	for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Apr 2026 23:22:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=QjrAezVeYmMM4Ps1ry3g2H
	LZr/7V5M12bVqxCDqfRuM=; b=m5D+Jlst7zIrpNFlkcMehTxcctR1022cEwiZvM
	OV/h3ebwTZAAhMMWwAJNnlFxcecuZp+eiZSj7bwThxGkGCjNkf434v8v7zRiq8dK
	V6sHHtJo4FYzSszeuAuUZvonwryKRYdoSzCO24iP/r3LpfzV/QUob/tDgY9gvTpK
	YGvfl1oHuys3HNQn4Ecwn630RdL8023nZ+9I4Y07yKbBHNBTi70yWrlXLo9cm3h9
	2Ow5JQpJMP8zFagj3jwRNsNR4SQ+csPvOS3o3X6BGSz0O3IgQtl5WkFSYek4Bpkv
	WysoB2M2xHJmkCDEBJ0WQ3haLX3EEMmTyWlt4hPLL1CTzaOw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djd0e9f39-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Apr 2026 23:22:38 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50e160d5fd3so48326981cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Apr 2026 16:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776295358; x=1776900158; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QjrAezVeYmMM4Ps1ry3g2HLZr/7V5M12bVqxCDqfRuM=;
        b=PWOahR+iFuNEilSPp3lVhcRJVPUh/RTrUez/iEuFDKs3LAO6HKvcrfByjU2Yz6RA61
         yEzCWBn2spB8bPkjnz4/qr0urMTulCIAZqyM7g+Pa4JdUBh5LHOZ9ObqOdeQF24xt7qp
         HOjf4zimvnRGOdD8BpbLJc5WvUEGUlEaiBgYjoTBGMYFmlKeAUF0sfxz3Spq9iA1GL6O
         jWC5xsWvqdFZ6IXHnEfzzavDCePwkzjO5xiEK4jRjgmCbKRIYOBmF9qI2yY/ZvEOm38R
         ya9nGAe0PaPLiLdUXUzPFQw3eSAK0IlP4+6wnLMXealVmQl4qmilzEOk6wzSYA/EpLIG
         pHtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776295358; x=1776900158;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QjrAezVeYmMM4Ps1ry3g2HLZr/7V5M12bVqxCDqfRuM=;
        b=rhSc+E6gSam8i+qP+Q7PILEOHX1qb4As6m8LB2yt/Snl2YZEKWJCkMEtcGqyPZaccS
         uX4mm4PgX9KV+lcJhNbXjtFeXR1WQRRGFkzEx5AD3ZF6cnfUx0IF+iVqtswiyqeOs06s
         TeekS2x4iBsjYQaLgpHKcLPihm3oyLfoF/7v0+YymQrKyf+KyYjGvnqBTrfKTXfxeGqP
         EGfL5orFO2YOlnlgTs8ILhxAxULZdC/6nDEc2MNKk+/zEJ9oaj1P/V51lNtUi/5Mc7Xr
         7IK5UOiseJOjTwPe2pKjf/lmY5Va8cbUpFEQo99r16jBsVo4FpEysDDFcTyb2Wet0cIW
         9vpg==
X-Forwarded-Encrypted: i=1; AFNElJ+YudJQ0BJtZ/Vz2PSH4++/w2E456uMfulG5iLJR40pBPiMglvM4qxeNYqjL5o+HzuTeBzgUy6EYyXNyH0BP1Fg@lists.infradead.org
X-Gm-Message-State: AOJu0Ywd0OJs3FiNcYRlFgpUW5x3TgckCfpXGj/VlVksS6MvNOLb/0wm
	Jlxu+slUyF5Y0muii9SsPxo5F2HPF42UOOhc4UhmKpkK84Ze1Mi4jWjls8iuhjarbbBKDj3VV3O
	PYp4jxckIjhXXZ1JPEFxSA38EI5TmjloC3aAdXfQFfUYGj5t9oo4CtqR3sW2nSzMHiGzvnW76OR
	b94Q==
X-Gm-Gg: AeBDievCKsj+NsX4t/2HAjGPxIfYSINKznXclNhOEIvG2vQaH2B4A3B48uPWJpJOzWB
	wePeM2cieMV9To/1Yl+YNBnJvXUKB39K6afvCuEKinXNgo+s+D7J3gMTfcai0/xVuHrtypm2RuA
	8rQI/l2HMc3OZTjJ5Ad3L5ZC+Cwv2viQXiL9KD+Gcj00sm4tnl0ERoz6jgibHEk4ow+aOHnMLOU
	JtW+TqtZlYTS1MS6USAnjqBjT+mpaNwxuiAqr9UeGKuwunQmU5Z0HvtMm95kEnM8wNW24/kl1fS
	4u9sFm1thEbvvNoL30a/pdvdOvLhhVvHyDeZxqX/iMi1vxW3SbHkO/aCRyBrnCOVLzf/xXYsmwu
	sLbgPbEgkPQAyW+/7XhEAwfeeypu1QqqgYmQh1Pz2jfAlesofdRso7HuAk2p6CFzgwYbCTrZDIm
	lsiz0zRgfCRNFiVYByjgBjFu6sojkvW51f94utNrZUJMfzDg==
X-Received: by 2002:a05:622a:4a08:b0:50d:9174:cf27 with SMTP id d75a77b69052e-50dd5ada552mr341630001cf.20.1776295357609;
        Wed, 15 Apr 2026 16:22:37 -0700 (PDT)
X-Received: by 2002:a05:622a:4a08:b0:50d:9174:cf27 with SMTP id d75a77b69052e-50dd5ada552mr341629291cf.20.1776295357086;
        Wed, 15 Apr 2026 16:22:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a40a272852sm817054e87.10.2026.04.15.16.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 16:22:35 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/6] drm: handle IRQ_HPD events correctly
Date: Thu, 16 Apr 2026 02:22:31 +0300
Message-Id: <20260416-hpd-irq-events-v1-0-1ab1f1cfb2b2@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALcd4GkC/yXMQQqDMBBG4avIrB1IglXoVcSFxt86XaSaURHEu
 5vq8lu8d5AiCpTe2UERm6j8QoLNM/JjGz5g6ZPJGVeawhY8Tj1LnBkbwqKMynXeVGX7GiylaIo
 YZL+HdfNY1+4Lv/wvdJ4XXIgi2XIAAAA=
X-Change-ID: 20260414-hpd-irq-events-e72bc076a5f1
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2613;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=DGTBlD7qs9HNM7qsl6CaN+vK2gHbwUw1l1hWZUAKoYg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp4B25snfl3bH76DEACoBeVZy/UCHClRy8lnyw3
 uY/zfPUoHSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaeAduQAKCRCLPIo+Aiko
 1aaaB/9c9WKgA+3medunIFAl2CwuoCesh2/joS8gvRUa71/vNjPKRaDwhbLm5jO6MCbLgig4onY
 jF3bCfXqoO2RrZ9cTVrg1MKZqpXlRdW3BQyhT/DOIKfGPRMdoNyCFz/rU3cI4D0WrGSbVX+yC5V
 51IV2z4RVS6XNUX1aZNn+vG1dHT6XeZoCywbYQUMUEG0OJuZotdNHy1CPjDAGr2m/227RZM/vVV
 hlvH8a3N6EX4o+ASH2W4NGzsOS2dg3yKZKRR4CWR8ReMTZqXsj/7qZfOV2nj/S66/Dj+GQzrheb
 QBGq4goO9Y68lpQRcQm999ISp8uPQr9FshsCDN5JCmNeMCo+
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: KY2Su-6rRyt8Bv_F4Zv15XIAxiOOFu_Q
X-Proofpoint-ORIG-GUID: KY2Su-6rRyt8Bv_F4Zv15XIAxiOOFu_Q
X-Authority-Analysis: v=2.4 cv=GP441ONK c=1 sm=1 tr=0 ts=69e01dbe cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=ST8Y6Hw29dmLQzsKkX8A:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDIxOSBTYWx0ZWRfX7FyA30NBQTsI
 RRh6N6HncyuhSItJe9lckf9d8Y1xcTtHWYaA7ZIORo9qp3Hx08BErhz2kckM7lU/tu1mxPuEelA
 G5NZMcL7wcmE4uY+RL0dnBOhGiP02kWprw9kq2WVM+cUhAx8qHD+JwIsfkLl59obdQXpeCK+Vho
 Fo9bvSF1nzmpidpfMtsuws7H3k5ec/Mn9oM5n0s1wjve87c1o44YzpL9iLSiNwV5+Gd9LOvqEw+
 wU70+E2lk0Kaum1HS/fS7hwZ9/NTxx2R4JcU6x2AapKKrulnZB3faFvdTyWe8Fj8L6pq2LS+Odm
 qk3lvHAZfQ8eUmx1Sy9Co3wqf+a/xyPuK2EPZjpVLfyI9xZcYdH5cKaQjBaoPQwDet+ChU4//VS
 /yYqnaTOc9oczWvB6r52//IaZcLrLqn9aqJ0tJ+CdPExeGWQvZ14AJ8+vEPtLrNGk7GPMDTCA0Y
 jtK/0nLFuZiasbLlw2g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-15_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 adultscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604150219
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_162241_059409_48BD70E2 
X-CRM114-Status: GOOD (  15.45  )
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

Both DisplayPort and HDMI standards define a way for the Sink / display
to notify the Source / host about some kinds of events. In case of HDMI
it's as simple as singnalling changes to the EDID. In case of
DisplayPort it's more complicated and requires actual checking of the
DPCD registers.

Currently USB-C drivers don't have a way to deliver the IRQ_HPD
notifications, leading to missing MST notifications. Provide necessary
plumbing to let IRQ_HPD events be passed to the DisplayPort drivers.

Note: the Yoga C630 UCSI driver and Acer Aspire1 EC driver are not yet
enabled to send the IRQ_HPD events. Both of them would need some more
reverse engineering to find out how the event is being reported by the
EC.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (6):
      drm/connector: report IRQ_HPD events to drm_connector_oob_hotplug_event()
      drm/bridge: pass down IRQ_HPD to the drivers
      drm/bridge: aux-hpd: let drivers pass IRQ_HPD events
      drm/msm: dp: handle the IRQ_HPD events reported by USB-C
      soc: qcom: pmic-glink-altmode: pass down HPD_IRQ events
      usb: typec: ucsi: huawei-gaokun: pass down HPD_IRQ events

 drivers/gpu/drm/bridge/aux-hpd-bridge.c        |  9 +++++---
 drivers/gpu/drm/bridge/chrontel-ch7033.c       |  2 +-
 drivers/gpu/drm/bridge/lontium-lt8912b.c       |  2 +-
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c     |  3 ++-
 drivers/gpu/drm/bridge/ti-tfp410.c             |  2 +-
 drivers/gpu/drm/display/drm_bridge_connector.c | 21 ++++++++++--------
 drivers/gpu/drm/drm_bridge.c                   | 18 ++++++++++------
 drivers/gpu/drm/drm_connector.c                |  6 ++++--
 drivers/gpu/drm/i915/display/intel_dp.c        |  3 ++-
 drivers/gpu/drm/meson/meson_encoder_hdmi.c     |  3 ++-
 drivers/gpu/drm/msm/dp/dp_display.c            |  6 +++++-
 drivers/gpu/drm/msm/dp/dp_drm.h                |  3 ++-
 drivers/gpu/drm/omapdrm/dss/hdmi4.c            |  3 ++-
 drivers/soc/qcom/pmic_glink_altmode.c          |  4 +++-
 drivers/usb/typec/altmodes/displayport.c       | 12 +++++++----
 drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c    |  9 ++++----
 include/drm/bridge/aux-bridge.h                | 13 +++++++++--
 include/drm/drm_bridge.h                       | 30 +++++++++++++++++++++-----
 include/drm/drm_connector.h                    |  6 ++++--
 19 files changed, 107 insertions(+), 48 deletions(-)
---
base-commit: 66672af7a095d89f082c5327f3b15bc2f93d558e
change-id: 20260414-hpd-irq-events-e72bc076a5f1

Best regards,
--  
With best wishes
Dmitry


