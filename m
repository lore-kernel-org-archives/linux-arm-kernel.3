Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A292EA3C55
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 12:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iRJojx90PbsK5eqwfGxXr5Q9vwOQMRc8MooWzOIPrKU=; b=HBJHF0hAONGBlGkBxvFqxtK6LC
	y766yZUvYtOAez7gAVjQWGo5gPK9mc1gQI8rUkDP3Qcw8aji8jCps92LSnoJyRoYb7p5sh59BI1Tv
	lP3Epg3zkbngROVkXaW1nOBXaMl682ouxIjjCTeEqQOS0RI9HVoMj9lC1yb3H9iqzUiI3R/XG5aP4
	lR84pU7Yl777yWF1oKw5KiaMydR4oqHJ6ZFUlDB8PN/U0deGzSXVfpZAdiwcjUwMe0PbzYhHNpVLB
	MGKHapNmU/oQ5RuVDP9BfmjDUckT1YAedqdfufG6MLSMLJArwu4B/fEvZQkTdyoEvLEGiiuCclHPa
	Q/jHGWCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAoNv-0000000AMrN-1SL1;
	Thu, 09 Apr 2026 12:21:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAoNs-0000000AMqz-2JdJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 12:21:21 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639B4Cs12615182;
	Thu, 9 Apr 2026 12:21:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=iRJojx90PbsK5eqwfGxXr5Q9vwOQMRc8Moo
	WzOIPrKU=; b=Z82JrVhH+IbCyM8WalLWIPT+Ncz0aiQV4Qh+tLKTFv5VY96Ykfu
	zv0/L9yRU5eiEZRnSgIp0O9YCfwSKJRAd4AVZpnHScniP69N3cdzxhm6K+L0iUAr
	n8wbE75FB7heo0PRHJ3h6kobJLOBg8obJlZkVtJp0dYHc1x3KroRKfSpTYPJtYZ4
	O9AgwK6A8zMv6Ft5Nz81YdUgO52HDyUbHXrO1eJX2MIUVNh3fgqV3j9suglBVAZ8
	gQbWzwiGR+FM9bnoBq8E8RUIa0B7Uo8Cxqz4oPe5vmDbX3cmDdxYQkEXCwgd1Xw/
	vVunt+guE1+cskVr1NEEeUGguxtp2X587gA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddt28v1h5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Apr 2026 12:21:16 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 639CLCBl031231;
	Thu, 9 Apr 2026 12:21:12 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4db3u1y6cd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Apr 2026 12:21:12 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 639CLCXh031225;
	Thu, 9 Apr 2026 12:21:12 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-amakhija-hyd.qualcomm.com [10.213.99.91])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 639CLCIx031224
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Apr 2026 12:21:12 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4090850)
	id D56AC5F3; Thu,  9 Apr 2026 17:51:11 +0530 (+0530)
From: Ayushi Makhija <ayushi.makhija@oss.qualcomm.com>
To: andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        dmitry.baryshkov@linaro.org
Cc: Ayushi Makhija <ayushi.makhija@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v1] arm64: dts: qcom: sm8750-mtp: Set sufficient voltage for panel nt37801
Date: Thu,  9 Apr 2026 17:51:09 +0530
Message-Id: <20260409122110.214680-1-ayushi.makhija@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-ORIG-GUID: OXF4xuTpOgYJfK6NUmxtmVEnGPcIUQVo
X-Authority-Analysis: v=2.4 cv=fIIJG5ae c=1 sm=1 tr=0 ts=69d799bc cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=LDVbE-baonJtzDLOTeQA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDExMSBTYWx0ZWRfXwjBS59UIkWK8
 UklVZqTbftY22EAQqx3U/Q4h8D9ivNaIPqCGIiOnsqTZe7BH/6wF3NFLwjkWt0VJA5j3sv8AK6X
 Ww2KueZ115uaDTPTF0IuKhfODH65FNf3o+czc0+1aHmgjOJM5YdVcWkSJZ7OKYf9/LaMeJ44qgH
 iD/ilDkAVQVFzetNdDRsvECB5kMn87jXjlLJID5TQOlzx6S1a8NGkbhc+F5JAhXT9NXJaDh5VTa
 9NTNdOYsH1bxQiNrCASu2i5oyYGQXjeLiu6C2O26cEw7MBvDWhnK0Jh66A/CLABZEM0to5YhV83
 GzCx7H8kOMg84xfXja9D1s1vQbN1fhcj+b1cyYj1ti9SHVdljGlsCJBOfPmJwEreytY+med5Zkl
 aTruR+oMySSRmv/CHnk/6BbkYO8rcoWp4UOh5z+exzyH4883Cu1Ze0hIfQKMXIif/jSHzTnAoTI
 RCgovTYd0lZu/EOSayQ==
X-Proofpoint-GUID: OXF4xuTpOgYJfK6NUmxtmVEnGPcIUQVo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1011 adultscore=0
 bulkscore=0 malwarescore=0 phishscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_052120_597793_23562992 
X-CRM114-Status: GOOD (  12.27  )
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

The NT37801 Sepc V1.0 chapter "5.7.1 Power On Sequence" states
VDDI=1.65V~1.95V, so set sufficient voltage for panel nt37801.

Fixes: 4fca6849864d ("drm/panel: Add Novatek NT37801 panel driver")
Signed-off-by: Ayushi Makhija <ayushi.makhija@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
index 3837f6785320..6ba4e69bf377 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
@@ -462,7 +462,7 @@ vreg_l11b_1p0: ldo11 {
 
 		vreg_l12b_1p8: ldo12 {
 			regulator-name = "vreg_l12b_1p8";
-			regulator-min-microvolt = <1200000>;
+			regulator-min-microvolt = <1650000>;
 			regulator-max-microvolt = <1800000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 			regulator-allow-set-load;
-- 
2.34.1


