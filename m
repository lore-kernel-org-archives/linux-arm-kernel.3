Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47117D0E6C6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 10:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RFEdqmwxv4pOJsiiFhS4oAK1y8+i/9/7lIO/EJIcd/A=; b=lytM4YHxbWjpbj+8xJx/S1zRvR
	0lMz2g5DNqQJ0Np6b6X0J/vgFhmVsOaidYby3l2JiB520UhOXrUStvNzmU+wD80OZj255c0n3OfjD
	J+ZPlaJorywlpqtPM+WHoEn8pMv/XHKBQEFNbYkSrbs1q/Dv3QDXeKsPCwTSq9X8WWwwZtj9iz5gr
	Dtlz51JqM1WmxH0WVtyRO+RGnVwJXG0ORMQycxDd5L43nRhqgJzmyznkuEu2EZPhf3AAa4umeMZCB
	vM5zgaBnmt535lrgaBqA970NyQHLnl5MpUsUE5xQ7H8Oo+mUdGDcD7YcwWIbyhPjEEqRA6ditbttd
	5VVGyaZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNqj7-0000000DA8F-0vQz;
	Tue, 25 Nov 2025 10:56:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNqiv-0000000DA3Z-0rLL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Nov 2025 10:56:45 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AP9xXnm2651096;
	Tue, 25 Nov 2025 10:56:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=RFEdqmwxv4p
	OJsiiFhS4oAK1y8+i/9/7lIO/EJIcd/A=; b=O1tWbg8Ln5JwscVqaKERyp8PB+I
	Fzgl7JDW2ohpLChB6u5VjpT/fXIT2PuNCiayRkkn1BgTPvHSa5XbqDNhVOD8H0J5
	lL0vBk8eV3t1O+FXCOtbie9T5PJGDwIP8MMcj3QOkoSdCG1cnrhmWIKo+gLqbPs0
	jfJnqsTK8B84zRRyV5yp/uHXTcOivTWak5VYqRGNn7QRJIySnDFgTSdL5YRg94X2
	ydjUuwHRO/1d8cErVV4yBf08AC7GknxOL9dhsY15PeGqmXl8jMy1ccsFlOzGqqSN
	EExin4D/UPID9U/s7mrkVB+rit86g4ZFsuDbErY8dabwzXYX4WWq9YZwPYw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anaabr4v9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Nov 2025 10:56:31 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5APAuSHw009129;
	Tue, 25 Nov 2025 10:56:28 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4ak68n435r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Nov 2025 10:56:28 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5APAuRfk009097;
	Tue, 25 Nov 2025 10:56:27 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-mkuntuma-hyd.qualcomm.com [10.213.97.145])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 5APAuRVp009092
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Nov 2025 10:56:27 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4582077)
	id D45FC3B1; Tue, 25 Nov 2025 16:26:26 +0530 (+0530)
From: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
To: dmitry.baryshkov@oss.qualcomm.com, marijn.suijten@somainline.org,
        swboyd@chromium.org, mripard@kernel.org, abel.vesa@linaro.org,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, robin.clark@oss.qualcomm.com,
        jessica.zhang@oss.qualcomm.com, abhinav.kumar@linux.dev,
        sean@poorly.run, airlied@gmail.com, simona@ffwll.ch,
        alex.vinarskis@gmail.com
Cc: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
        quic_riteshk@quicinc.com, quic_amitsi@quicinc.com
Subject: [PATCH v2 1/3] drm/msm/dp: Update msm_dp_controller IDs for sa8775p
Date: Tue, 25 Nov 2025 16:26:20 +0530
Message-Id: <20251125105622.1755651-2-quic_mkuntuma@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251125105622.1755651-1-quic_mkuntuma@quicinc.com>
References: <20251125105622.1755651-1-quic_mkuntuma@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=Vd36/Vp9 c=1 sm=1 tr=0 ts=69258b5f cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8
 a=aneus3DpQx8xEqIVSrsA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: uMRC55gf7VdBJjuZnqPfyX9lPrUf3wm1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDA4OSBTYWx0ZWRfX4qno6D/zhBFw
 WGXlcz+5sX680TJbfHd1GYwzkRjStbcpenwu5x2FqnHgOnoAGrY8MRXk13M9HMxIxS5R0Poub5V
 XEPZ4mI/9JZRgZiqXQX/YxgeFQPRQPWklvLx6sANUaZOT8xs9X3Fj/FxRQrSYWGS6E6TvuD92VZ
 ZL5eL2eChUmrFGETA63yotVfdspQH++IMkGFPIXplMPS5hqVInB1I5SQLRfPaoSH9Ur86iEYN1H
 NLTKlJ/qooATx/q7ZoO4RNTeRmExAnYvjwoYFmqOCy4Wjq8xUVbbHw6xlVGQaFGLKVBB+Fkru33
 RwP2Gi4sW4cj5zlV0YZKK4Rt05neLjN+sEQgPnGmgRmElqj4DQZGEqu8GOcOWq9GmJK5oSixEVR
 JaZRGH0ONbnEtKy2AjvmGCPFcWPddg==
X-Proofpoint-GUID: uMRC55gf7VdBJjuZnqPfyX9lPrUf3wm1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 adultscore=0 phishscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511250089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_025641_274071_F734AAA4 
X-CRM114-Status: GOOD (  13.95  )
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

The Qualcomm SA8775P platform comes with 2 DisplayPort controllers
for each mdss. Update controller id for DPTX0 and DPTX1 of mdss1.

Fixes: dcb380d19e58 ("drm/msm/dp: Add DisplayPort controller for SA8775P")
Signed-off-by: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 9bd9cd5c1e03..a082f4d3ebe2 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -141,8 +141,8 @@ static const struct msm_dp_desc msm_dp_desc_glymur[] = {
 static const struct msm_dp_desc msm_dp_desc_sa8775p[] = {
 	{ .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
 	{ .io_start = 0x0af5c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
-	{ .io_start = 0x22154000, .id = MSM_DP_CONTROLLER_2, .wide_bus_supported = true },
-	{ .io_start = 0x2215c000, .id = MSM_DP_CONTROLLER_3, .wide_bus_supported = true },
+	{ .io_start = 0x22154000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
+	{ .io_start = 0x2215c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
 	{}
 };
 
-- 
2.34.1


