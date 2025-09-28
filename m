Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A453CAC5BC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Sep 2025 08:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3RNoMb86TETM38fjgm0MR4bIq5hfRNj//M20P1hCu3M=; b=iij2tChYHdKOv2RutAJu7i+UGs
	5mS1N4nR4PwPV2cn3JrDKTXHsOWzSjjyIxMjBPRNmF7mO2ux4+fTLMVlfUmmlFRpGzFmLXnMTvKvd
	hWwSFyUnxp8RlabeZSuyQuRFGvx7lDkx8pmO7A+vHiYDJGHUVGDuu2hl+wP3fxo7v58cnmBRfJhwc
	OK58JLeDMa3/1OiKJ2x/3SAvYmXTtsoEdTXObPBF3IJCwtqI4pQ9OTv3BjX56TnN3wdyRL3O2kuKy
	X4iHHNh5dbEIs7hbTxyDYdiRU0sULJ0w+vYSzrEZU7hD4KMs3yLQQHlEGbx+/oUIi4s3l4kFwjM7S
	XjAppxhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2miZ-0000000EJKG-3Pjb;
	Sun, 28 Sep 2025 08:25:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2miK-0000000EJ6O-0lQc
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Sep 2025 08:25:01 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58S5UulM001006
	for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Sep 2025 08:24:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3RNoMb86TETM38fjgm0MR4bIq5hfRNj//M20P1hCu3M=; b=d25S158dbMUwLxBm
	R785Dd80o16MVQY7oYklF1CygQd2zDKI/89YN/PSnPdDxigAtHQ7Uu7x6WndWr6Y
	kbnXr2nNoIbbRQ6W7paF+hgHR7FHm2rmGqCQaJp85xHd/e3KdwdjVacZRZUMs6TR
	xF+52srTpnRuniTacA7SjovxmMP63S1tgIu+2A340QmTOjSCL2A8gWvBGHq+2Hrm
	sUva607nq+00q+upnoxqpvnyGZi+/9p+wb66S20GXn+euiMH2ra9MNcA25Gen5P/
	RfUwB7JBbgmRIa0li9JMoKJbjPlfc++6gn/ZNtP1XW6g8UU1WXnKpFTwTWtKDi22
	nbWfSA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e7gxjdnd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Sep 2025 08:24:59 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4de23c3b40aso49490321cf.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Sep 2025 01:24:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759047898; x=1759652698;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3RNoMb86TETM38fjgm0MR4bIq5hfRNj//M20P1hCu3M=;
        b=q8G4kwh9VqZMyhBBzaQ08tFBdGdu234gHPDmVrF66XVEHXx5EW21gJ7tx9g9AE8Yie
         M8ytjpkpV0SD8ghPZzdJ/tKBVgFQLKH55XkNnrLdDvQai0R8AD0tSESsjZgEKocFuvuF
         4gZgtxnCtm41e1t+nKJDOo4ye12DmNKq3lkpqK6400cAakcKtHFXtLYM3eqe9AsXSEZE
         DIErm5QhGeaJqnqMBdLozSo4MnNaJVIv+DHd2+zRdqenJK6lVhjPckG0iBoT4b0vKHde
         Qq8B8rbr1J0wgDUSVcfUOd06wdKx4EufQzpo+bSxl8NbUIgqX2HIPO/QPXpjuI39FLm5
         qa4A==
X-Forwarded-Encrypted: i=1; AJvYcCUrHc35BZo7t3SqJncEOay7KvketQUyRADmQtiu3YX0Frz00vz8NNqys94mh3I30Z8OMsBrs/Ku5bdErGRr9Mg2@lists.infradead.org
X-Gm-Message-State: AOJu0Ywoo4IPSjjTECsl15x0o1H/FrdAsFBlh1N8TN5f1pkvgrjFbIc4
	wCFtf0e2jt3LgPjjvrUJD4eqv15fTK0z29fIVJxmHdiQVwbLqJ5LC8BAfDrxD2ixFmVVW85gsAt
	UlBZwHCXNvpwntvA2tCHXkFnO5FNYK1oKzs1fuRUZofAHilDUQurKlGKga65PysOnKYGOFQu9kV
	nd4A==
X-Gm-Gg: ASbGncvqVcKTXHmrKLzFzU3PqSy5y0v5H3Nm3sW6Z8ldROij6NOzBYC/qarDicX7T7P
	8wAQraQOdWjpmertXyfVPn3ibC+eVpqfgn496WR8AJ+rcBikAEWbwjk8uypzbWMUDq6Iv8RLWY5
	d9Pw0cV/fD1xoEkZpGQjGD2urGKDQ3swR7JsH4PeE7UxPqrolPQonxt3iqJMo/9yr1kGRSdrc3B
	fLuZzJEqpOrKfoVAAwGM9MCx82Oq3O0SPSfnQal2XqGAuzoPifd+f8JUGK2lLS8Kmae/LKRg5x4
	s/TEF3xul/uVwExgeAIWjtTyxtjmz5/OkOc5aLdtvYR3XkVTJRAentQtgK21Xl47OufG2xOGx8O
	W3tQSO12ZR8UwNs/3JVkOYQKTTciGaqKgxi49oO3bv2QnIvXBW4ad
X-Received: by 2002:a05:622a:4185:b0:4dd:d5ad:a0b0 with SMTP id d75a77b69052e-4ddd5ada161mr94504311cf.72.1759047898457;
        Sun, 28 Sep 2025 01:24:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGT1kPr+SGAov5dmZPG5ScdAxxwbVTr7us/Vb/QdaIyPAfJXzB+Vh1Hhl5wl5GH8A9R5uXnVw==
X-Received: by 2002:a05:622a:4185:b0:4dd:d5ad:a0b0 with SMTP id d75a77b69052e-4ddd5ada161mr94504081cf.72.1759047897951;
        Sun, 28 Sep 2025 01:24:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-583166561c0sm3244298e87.81.2025.09.28.01.24.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Sep 2025 01:24:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 28 Sep 2025 11:24:46 +0300
Subject: [PATCH v2 1/9] drm/display: hdmi-state-helpers: warn on
 unsupported InfoFrame types
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250928-limit-infoframes-2-v2-1-6f8f5fd04214@oss.qualcomm.com>
References: <20250928-limit-infoframes-2-v2-0-6f8f5fd04214@oss.qualcomm.com>
In-Reply-To: <20250928-limit-infoframes-2-v2-0-6f8f5fd04214@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sandy Huang <hjc@rock-chips.com>,
        =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>,
        Samuel Holland <samuel@sholland.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1404;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=R1Bpa6Fvy73+xL3P7L887ElbwPPq4/fFwLVlkuQV7Qc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBo2PDTlnZoYPxDU4Z3gTveisyzt0XXcXxDuN/YH
 mhxi8pIdgOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaNjw0wAKCRCLPIo+Aiko
 1UePB/9divEoptM9vQNCxc18kAVQN3qANEu3nhMR3r4BSfaNzPAgUOW2mNme52A/q2gPVBSnzf9
 ebr/ZjBmks2wcDwW2G2cOA8QHgDbJNdyGZxYRZb10FWI9lZPabLiArqIAFpeeVWK5qKPILTipmO
 3Yg9yyurABK8qpLUIxoUTtfJYwP42ZT33yO2Qy/cSCznvwZNq72XvTwYh09swLDXM0wv+7kRUUY
 z7Gb5CR8PPJKhkq7Vv/X3+HA/zwAvqplPHATfkcNdqltowoMh71+IS5wuGYtpTqaQsZp1deBanC
 xEmQoHpcBTmRcZ1XwWEMUFPeTHNgFqBQHTbf0WXLyu1mQUou
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: Sr7KoeT5iQpDSDN2E71iLDOOsNCNbDQT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAyNSBTYWx0ZWRfX/KeZ9bYrroL9
 +4ar8ET+NsEblggA8nE3DJv2iWCllZfMLnQuMjQtM0X/s/pb3kjhzZik+0X+GUaaC2TKegRR1Jg
 UwMq1Ueoj+GPk05zJRam2W9CMipzwK2qPPJKeK1mQAlexoDbQmG0DVtdgKFZgV9zEKSmjpN6E/8
 Ui2xOeUdinuatyPu0/WDrZ+arclS6w/RN7KCGuss6MMT2y47rAIvp4o6qFe/YRtLqwgLipExEA9
 bUyfqdDBpOBuVnmqtCL1100hj7DmFMCFaJH/I3PKgAKCTncViyAxBtaAdyTEnhH1cXPprU51/F/
 iMFtYR6txRfGO1vN2UuMNt8BhstshOYehP2IR9/Tv5yTJlo9JOhaK0WiWgpLKkZVnNLPzQdi1ib
 ljnpo6lUcZLm4Gdm4MJImTLBwGIwsA==
X-Proofpoint-GUID: Sr7KoeT5iQpDSDN2E71iLDOOsNCNbDQT
X-Authority-Analysis: v=2.4 cv=dP6rWeZb c=1 sm=1 tr=0 ts=68d8f0db cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=9qaGXxVFTICEpRVd4z0A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-28_04,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270025
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250928_012500_380750_0CD5FFD5 
X-CRM114-Status: GOOD (  14.06  )
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

In preparation to tightening driver control over generated InfoFrames,
make sure to warn the user if the driver rejects the InfoFrames on the
grounds of it being unsupported.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index a561f124be99a0cd4259dbacf5f5f6651ff8a0ea..e85a6cf6e67232528861521bb21251bfdce6f8b9 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -920,6 +920,9 @@ static int clear_infoframe(struct drm_connector *connector,
 	int ret;
 
 	ret = clear_device_infoframe(connector, old_frame->data.any.type);
+	if (ret == -EOPNOTSUPP)
+		drm_warn_once(connector->dev, "unsupported HDMI infoframe 0x%x\n",
+			      old_frame->data.any.type);
 	if (ret)
 		return ret;
 
@@ -947,6 +950,9 @@ static int write_device_infoframe(struct drm_connector *connector,
 		return len;
 
 	ret = funcs->write_infoframe(connector, frame->any.type, buffer, len);
+	if (ret == -EOPNOTSUPP)
+		drm_warn_once(connector->dev, "unsupported HDMI infoframe 0x%x\n",
+			      frame->any.type);
 	if (ret) {
 		drm_dbg_kms(dev, "Call failed: %d\n", ret);
 		return ret;

-- 
2.47.3


