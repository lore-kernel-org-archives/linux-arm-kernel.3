Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6202ED0E6C4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 10:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=37RRWhWvxz6mmCraG+qSG55VsHuZOALnVv22qCpauS0=; b=2+ABj/8Uwh3DoYeOeNAzs8QisD
	lB2sSu0XKQWsjPGtOFvycfSqJ1xGGBO8/5FFDPrwvQMu0i2phhzwZX5fMWRK7xU93Z8eoVXBG8CV6
	XAyksYLPzy+bDaE2LGYkti8zMXd2ZHOGWZJf/Z+MfmA2J8briz18mFIPqzMYDLxJzcDpjgoTNB1px
	1A2ulfD97ghQIbZFA79MBQ5w8eDAKYXvgmhgnH+FJ2B8VB/7DCHfqzUkNhuH+JCLT+hfRU9UelUeD
	iw/kWIwdF/4fDi3plbTO5Nyuht/+iFfDjrc2mdaNItlcj9WBBIBVoKJ09jPPibRGnJ6yvhsgAP/0b
	MbetZmpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNqiw-0000000DA54-3NLF;
	Tue, 25 Nov 2025 10:56:45 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNqiu-0000000DA3I-2TW7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Nov 2025 10:56:42 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AP9ePiq1741109;
	Tue, 25 Nov 2025 10:56:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=37RRWhWvxz6mmCraG+qSG55VsHuZOALnVv2
	2qCpauS0=; b=C2cAxbGnnrUJbzQ/E4MGwx1s0a80cS+5ZTWcTiEDTgillIedn53
	eBnmNiJNbkwka8kPOrNije8iM3fewdHUDY/YFWERVo7AImkzp1+X3nbS5DxECiRJ
	KBUNgIYbjKSNGwW/vjMsaVXookPfAPIyzxiySj6KGiUeI2CydmXB7789NDEENDSt
	uS6ZOJ8y7XJrZiQhFAOmAYJWm3CudKrSDHViwZ1lpJY/emRqcoskmoGGtWA7Vr4E
	s1I5sWcuruqGJDRUb5Mj1SitG11KRMyBT7QBBmYYhLKw25/WMZJwnJDQnA4KGSKK
	2eQUh3JWeMja562/Ld96kzBzCQLLMli2BFA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4amtebb1xv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Nov 2025 10:56:31 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5APAuSdr009130;
	Tue, 25 Nov 2025 10:56:28 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4ak68n435q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Nov 2025 10:56:28 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5APAuRFf009098;
	Tue, 25 Nov 2025 10:56:27 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-mkuntuma-hyd.qualcomm.com [10.213.97.145])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 5APAuR6e009095
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Nov 2025 10:56:27 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4582077)
	id D1416465; Tue, 25 Nov 2025 16:26:26 +0530 (+0530)
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
Subject: [PATCH v2 0/3] Enable mdss1 Display Port for Qualcomm lemans-ride platform
Date: Tue, 25 Nov 2025 16:26:19 +0530
Message-Id: <20251125105622.1755651-1-quic_mkuntuma@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Rdln7rj5V51-nygwn-P2VNvBd-uIzk9o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDA4OSBTYWx0ZWRfXy3Dpd9kIp2TZ
 m4XB0xm4/Yy7UB7hj8BWCZ7mlFUhDgqxQSG16vWXRYcqvRq5De2CS5dpw+9mkBkYkRxWCPGSrXB
 hG5d4lDegPWQDfF6kFVYqtFwI5nrwPZuB3YOIuMGpayx1Kqxy9XPPDSFRTatkqkTBOV+gtOAje2
 9/zoh+v+9qTknrFXF5bwRmE4Atiu2X1culMGgQFVypDUGDZRuO/ZWe4CXPU3sVDZ7AWTqtx72wy
 rwQsy579EtvtrHzPTY3GMIrUpqbzPV7YfVHY0tYFu+15Gq/DC1CLPtXFfc/9cW4fBBi+eINKmt1
 8DVtxejYFNzqnbqrFn3fjzotyIQ2GOnFKMsmxFYTv90e/GgGF8oUFKz6JT7TQLIf4TGYbKWF3Tb
 2ZDcfn/+n6xXzbDRjeC1R0912luh9w==
X-Proofpoint-ORIG-GUID: Rdln7rj5V51-nygwn-P2VNvBd-uIzk9o
X-Authority-Analysis: v=2.4 cv=d7f4CBjE c=1 sm=1 tr=0 ts=69258b5f cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=kpoA4S6LcSF1uKdZkzAA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 adultscore=0 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511250089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_025640_686423_650E223A 
X-CRM114-Status: GOOD (  12.32  )
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

This series adds the DPTX0 and DPTX1 nodes, as a part of mdss1
on Qualcomm lemans SoC. It also enables Display Port on Qualcomm
lemans-ride platform.

---
This series is dependent on below series:
https://lore.kernel.org/all/20251104114327.27842-1-riteshk@qti.qualcomm.com/

Change in v2:
- Added fixes tag for the DP driver patch [Dmitry]
- Included below patch in this series after addressing comments [Dmitry and Konrad]
  https://lore.kernel.org/all/20250925-lemans_dual-v1-1-9c371803198d@oss.qualcomm.com/
	- Removed the misleading comment: "same path used twice" [Konrad]
	- Removed unused label in 'display-controller' [Dmitry]
- Removed extra zeroes in dispcc1 node [Konrad]
- Enbaled dispcc1 by default in main dtsi file [Dmitry]
- Added EDP ref clock and updated dependency series.
- Link to v1: https://lore.kernel.org/all/20250926085956.2346179-1-quic_mkuntuma@quicinc.com/

---
Mani Chandana Ballary Kuntumalla (3):
  drm/msm/dp: Update msm_dp_controller IDs for sa8775p
  arm64: dts: qcom: lemans: add mdss1 display device nodes
  arm64: dts: qcom: lemans-ride: Enable mdss1 display Port

 .../boot/dts/qcom/lemans-ride-common.dtsi     |  80 +++++
 arch/arm64/boot/dts/qcom/lemans.dtsi          | 338 +++++++++++++++++-
 drivers/gpu/drm/msm/dp/dp_display.c           |   4 +-
 3 files changed, 418 insertions(+), 4 deletions(-)

-- 
2.34.1


