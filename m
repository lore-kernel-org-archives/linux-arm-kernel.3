Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15645F433CD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 23:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uKmkX6HdG5E0XhMW9mQBc2MQ7gsubs6yKCHbbKdVCv0=; b=vSOchM06sOl5ReNkAfKTy5rwDx
	92IQj2NWrjSy6rC5HFO9lVUnYcaTP5cZ81ZrMOXQAcOr2UsYNtYo3+hPl16TUwwHQ79fyd6aJ4tqH
	I5l74REJx60A8R+HI3vw7QKNxYrK9KJCAu6ewHCKLl3EH38e6MbPcOV4ByYT3nsfsvuhw2XunTG7W
	Iu3cUYd5wBmvFGu7V97+nmyKgLTbXGFlxEWV1igaWcJnbBIWFoUzqEquDeq4MRjYGQKQndr3JKbNr
	qxhZuruY6wgzu0v8z9eyev8UIf3CMjM004Tj802KAXoBUB1Wxo8O1WPx9VeqhvqdNUbWTRQ5BCMvR
	sEsaFSBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD9Zc-00000001jz4-3tOc;
	Wed, 15 Apr 2026 23:23:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD9ZM-00000001jnM-0Glp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 23:22:58 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63FGEsQB506954
	for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Apr 2026 23:22:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uKmkX6HdG5E0XhMW9mQBc2MQ7gsubs6yKCHbbKdVCv0=; b=p39owSCcXynLz3bQ
	0sXd2/RZo42YgF4RdkeoB5+bVJ3PHFhmYxYJYrmL6t2MRSnKCo/rGSlP6ZMFJ4Wq
	LsUAeJv6XqrXETI/QujxoW8J9kPmLgs5xoWCjQ+kO9IWKnLqTzPLEHd5TPZUd75I
	BXehNMtw98TF2e5SZcuHaSnRiXT2gq3zk9lWEDIZMPKJBY6R28qx73IYfjDKdA7K
	r8thAcaDUyAuVKzEQGsOP57jdvxX16et6Eyt8jhjGh3LwZcT6VCdewRMT3SUJfPi
	MofNygE6++CzV2U+8HRHdpJBjEABISEt1dZjkP0ATswnidAjP4dKQPUYontB1AOg
	PKlhQA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dje1e170f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Apr 2026 23:22:50 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cfdc479f68so861440885a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Apr 2026 16:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776295370; x=1776900170; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uKmkX6HdG5E0XhMW9mQBc2MQ7gsubs6yKCHbbKdVCv0=;
        b=NQvzVebbel23WwmcHtlBJkXEWob0SFcyd8eBmXPOgj0Ym/IodtPMsotxZSbDlnhlyf
         EeLHlYmhhurUo8LZB/UoNYQMHdxCChp04EHOVMGwIvAGCUwVL6QVdSln4LcrUk3uvcNq
         bGyEDqy6ZftOrrwxkRvkYbsHgO3VUknTQ7onC/mGIcE93xhvAxJZLjDqoa+Kp6M3Rd4X
         wQSfTM0NgdQFkVNyPIBvLs6rQ0G4L6Ng4k2JPIgoFqUecHEbSsJj4Jxkg80Z/9aKZ6+K
         4DcbFagHHQpZKfbVnXekg7NszD/L4cc8i87vgOHewwHUFJfeaTazY1hpsKzzfzqRRXAC
         IftA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776295370; x=1776900170;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uKmkX6HdG5E0XhMW9mQBc2MQ7gsubs6yKCHbbKdVCv0=;
        b=YtIpSD6CksEXc75wRhxpS/4NAoEBhk7EIKp5t7ymZ2EC0RI5eANWT7fTL7xwf5c8h/
         nYVD0Ae8QHa2j54zg2ZR5QEkQ7kqcq2Utl3yFdfZuilPcVz4/wBgrLxK09prQUqCBflq
         +jWTMPuUvHOSMj1gLUozygTyWJ+nmD9OqaDmkB/T0e1V+BrkbLBDpmS9f0XIbc/NCRiP
         RlnROzDWnD13MrrDam1VNsrgyhbxxmTSrHoyCRbxNd8EvX/GsC/6puw43JwFob/qKDzJ
         eH6INAmz0wsuUpkTY0r+ASWPH902wnHvu89Rdhl150XS7lQDuUpziKah3B5DV9W9J/Y/
         8aqg==
X-Forwarded-Encrypted: i=1; AFNElJ905+8A17K1fwd1irObv+j0CMQfS1MddA/a+kFfVG/c7Pw9xZDkmEIan7zfnlbUZfOBWhL604mJsZnapop7VpaP@lists.infradead.org
X-Gm-Message-State: AOJu0YyXQ/JM2IKzwWYWxUqtea0zm/MB6DHrt0yiTPJ8+7LVvxZeEGf5
	4uaYOpynN+D7LNMKevXJPyTv4isxv5DMnnlG/a93iA40OxD2YH838twbdePMU09ZvceD9Pcjyn5
	a7+1OyDHZAQxdCnIFxZVYgpakVDIm+J6XtDJM1F4/LdS24R0sOlVHFCz0V9Vokf0zuCxifuKPP3
	emLQ==
X-Gm-Gg: AeBDieuWXkS2SZ2G8gSPlbU11vENaTCrk1C9ifV6XVu0aaptaLpj/4jsGISRWPRFD4d
	exVyOcwWSewWJLQwvmJICoPL1Qnu7TGouutah+DmbUX3qV2QfcZJYk+Hiv3+pYg4oc2VNjuUXKp
	EzleVkSDxKhpFkZejzVUSUNtEIxU2mTxCHTbp/SsHHw7DtC1k5DCLFiW5U5cfc2r+Js59V+Sm4Y
	YjiFZB9U1rSrDOHphEWr/dP4+wfbLJNrfpyLNlJEGuejuE7duyznfwaETACaTaI0OeuKyro0u8j
	YlDiMcMb6aN9PzEKLyB88GchLwDeyiatgZxqyZ0NkzdG93sZUs9lkjiyN1lTUyHXBgx8Le9Ctm4
	7Yyge16mSvTGUrIAsl/GZue7AwDC1O8+oar2QsxLl248RQJCEQOlvXCiIbGyJPX85fDl1e92HC1
	wnHu1b768ydgvR/6+Jof6gJpauDKCao02qxSFdHFmKePSxxQ==
X-Received: by 2002:a05:622a:2299:b0:4f1:ba0b:90 with SMTP id d75a77b69052e-50dd5a91f78mr350846031cf.8.1776295370113;
        Wed, 15 Apr 2026 16:22:50 -0700 (PDT)
X-Received: by 2002:a05:622a:2299:b0:4f1:ba0b:90 with SMTP id d75a77b69052e-50dd5a91f78mr350845381cf.8.1776295369619;
        Wed, 15 Apr 2026 16:22:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a40a272852sm817054e87.10.2026.04.15.16.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 16:22:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 02:22:35 +0300
Subject: [PATCH 4/6] drm/msm: dp: handle the IRQ_HPD events reported by
 USB-C
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260416-hpd-irq-events-v1-4-1ab1f1cfb2b2@oss.qualcomm.com>
References: <20260416-hpd-irq-events-v1-0-1ab1f1cfb2b2@oss.qualcomm.com>
In-Reply-To: <20260416-hpd-irq-events-v1-0-1ab1f1cfb2b2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=858;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=HBn2IVrDryFscwmmHLMRDSDtMBdYMWmMptzpyjE6O38=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp4B252fbaBj4KSv5jQsAVOrf3j/7BJx59z+n3I
 2IJBSzoVheJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaeAduQAKCRCLPIo+Aiko
 1WgwB/sEuMF29EEIY8rUMvncti+cVVAyI6rgeZiDtGdvlblf3XLLbOaC9cejNALy1z2TbL7VrWh
 96BGbQvXZrHw8bhWepW+KvH6Ejb7YLEoIpTanNPUNrpqbDTi81/xL+Ym7GTB92LnzaGwYKFozsl
 EGu3ok8Wfu3ICWI1jxGzO576N4RtHf6XrFxeyMxQkoAXIuzMFlfFN/yI7+5rs4bwUXRuhj3uBgI
 aJtwdV+Mh4sT4Xny0ZWfjQKfu2V8F2wrGSAvwLpTVcuT+LTQ2bmX19aFpZSE2qOVk1NtRId069g
 qbZxCfPnkPai+rrXVEEsa0rYtqISVnMD87C00uxhQTT6mlPP
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=HZwkiCE8 c=1 sm=1 tr=0 ts=69e01dca cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=3ML_fINe3tzxlWvVV4AA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDIxOSBTYWx0ZWRfXz6pna1gz/LIj
 0oPyRgl1446RNszxz3BPPHkpy9qHT+B+2SBc1l5fs4Va0vXdxeEYRA/W+jYu887G3XZKHRtN2LL
 b5HZ82I+m12SOuQPUqsNjEqTfna4vx/N5/d9UpgRO4bmiPWoJQ9oFhNGCp/N/llT+GtaVvrvqz2
 BnMkrWRK8l1lbPAWuCNbYa4J5qleo/ElyWbdFbVmcUDsxq+x40/IzkK4wMA4t3t0iVe6PiQb1Ao
 3od5fU7MnLfNncnYOsVwgMa6M3O1Vfh5C3HPOHgYEmvnPcFNyFWIJ1d8rp+heB92MwqmK+H9lER
 pH+ENR3sBec1XKoMxpSazH8/FzzLxeY7KS9bMuhdQJsyB56Jrhg4DV0khQjjwNOtkfHn/A8kZEk
 d5ajDcbjef+40MN4KzYa1XKvSwf9CqoUwCf/EaDLXmjfqcohYjL0xqvApek9b0AyzGHTqJoNqiV
 t5qAvNz/JHEqIMg34yA==
X-Proofpoint-ORIG-GUID: Jx0jCaLPvB-8O8I6xc_B1_1mADgz4Mh6
X-Proofpoint-GUID: Jx0jCaLPvB-8O8I6xc_B1_1mADgz4Mh6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-15_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150219
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_162255_212817_6A7EB588 
X-CRM114-Status: GOOD (  13.16  )
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
index 45e14a0010c2..390a967a53f0 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1800,4 +1800,7 @@ void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
 		msm_dp_add_event(dp, EV_HPD_PLUG_INT, 0, 0);
 	else if (msm_dp_display->link_ready && status == connector_status_disconnected)
 		msm_dp_add_event(dp, EV_HPD_UNPLUG_INT, 0, 0);
+
+	if (irq_hpd)
+		msm_dp_add_event(dp, EV_IRQ_HPD_INT, 0, 0);
 }

-- 
2.47.3


