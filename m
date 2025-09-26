Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 801E9CAC5B9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Sep 2025 09:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UCoMwItGIylGWwlKsEn7FzcN5hFQicL4AUyg+IBkyIE=; b=wwp7menj64CjHXKDx4esHdCJ7i
	MRZ3pUOEBfueHqFh4XI2RfmCZfqQ+5AV0SJ2Mow0DCGMRXG5J1WW/nELxvcdkqCBemhIuTDZ5hUhK
	/qMDq2Um6kYzoKIdgselJcfyRx5L2BM/NbIw3QOgVpMYXC5oP3q6DvBrtabgHSJCBiiGVwaX6upDr
	oJdCoB3BKS7K7Qse4AT1yIYtshQq7VHFDv6xhs9SjCO7RlF+UXpKRHAUUzTP77tft70hx5ENdNGOu
	Zz27lFNFHkDXIYj37k0BRULq9l1DFfjegWgO/EtENBFVzuOxf5jEKSdrM5GkRuwQEKtVle/48AjPJ
	JDJez7SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v24JY-0000000HMdW-0GBL;
	Fri, 26 Sep 2025 09:00:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v24JV-0000000HMc2-0Lqe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Sep 2025 09:00:26 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58Q8vf68014653;
	Fri, 26 Sep 2025 09:00:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=UCoMwItGIyl
	GWwlKsEn7FzcN5hFQicL4AUyg+IBkyIE=; b=Tw5Xfq8onbozBoceq42aulLZLFE
	UGYozTwaGkmg0TD+WTgISNTRXCLZy9FfIkRY9hXC+4O4HW1QQjivaLWoq+aDMJBG
	I9e0MhQ6HfToT4d4A5cMLmswt0ijOPQGP3UKV1GbDqg3d9rCCd+FyE/1g2qOnhuw
	pkrdySWpBGzMk5y1rIrSwsKDmRgq3QEDRX0ZJ66rX07bx3rirrHh9XBoLfkKuIfP
	E6nPh94+ywRbCz/DZ5r1pUdL+6hIqIquIiyFYvVx7u3olN0xrumvWoFz4tn6Eurz
	YESY3LHIety1IXRv/HBNyzx8MEMUdsYW5bIM9HoY5tZ4c9Iy2OgHkoNjXRA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db34j642-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Sep 2025 09:00:15 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 58Q90AAo008598;
	Fri, 26 Sep 2025 09:00:11 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 499nbmgtnx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Sep 2025 09:00:11 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 58Q90A09008576;
	Fri, 26 Sep 2025 09:00:10 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-mkuntuma-hyd.qualcomm.com [10.213.97.145])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 58Q90AVG008572
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Sep 2025 09:00:10 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4582077)
	id 946FF588; Fri, 26 Sep 2025 14:30:09 +0530 (+0530)
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
        quic_riteshk@quicnic.com, quic_amitsi@quicnic.com
Subject: [PATCH 3/4] arm64: dts: qcom: lemans-ride: Enable dispcc1
Date: Fri, 26 Sep 2025 14:29:55 +0530
Message-Id: <20250926085956.2346179-4-quic_mkuntuma@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250926085956.2346179-1-quic_mkuntuma@quicinc.com>
References: <20250926085956.2346179-1-quic_mkuntuma@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MiBTYWx0ZWRfX5QtksjJfS2dc
 CJpSXCAGrAkuEkyzdYaIy3zvAPDcTcH3R00jZUdsVZZlX2TkRosGEXxizukV/ESV6J34m6SZ/sL
 c8/5qigHL5IHlP9OAXYO6Dxrxl042lVtBlaa5VX9P0UjWPG9Aw2ARMOflvGPP6TFjcOFE1alo9t
 QSSHKRb2Oll3EE1wmVhOwWk3tgl1ajUCH9VqF1RCjGi7VG3DJhur+67c5FZ6WLglgUfQSqt15Ab
 DAu78i2W/qI5ShrUJAJG/3WnbWuXeewuVP8B7HFV1mLzXurdV2dnsFms4unnRxYn8YTivkmqdYc
 JOdwTgBOHt8t74DHUz025fftQ4z35YRvvgfXM0TLCawTj18TuQfer2itPDAxd+pUSk1GcVCcpNE
 Hz+iMbGBsZo2kRoiRomHlLOLQ71rvg==
X-Authority-Analysis: v=2.4 cv=Hb0ZjyE8 c=1 sm=1 tr=0 ts=68d6561f cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=SSmSCUx-GXNnXgCnb98A:9
 a=TjNXssC_j7lpFel5tvFf:22 a=nl4s5V0KI7Kw-pW0DWrs:22 a=pHzHmUro8NiASowvMSCR:22
 a=xoEH_sTeL_Rfw54TyV31:22
X-Proofpoint-ORIG-GUID: iOZubqZOJaGjGu0keub6oo1tIV4FZbi8
X-Proofpoint-GUID: iOZubqZOJaGjGu0keub6oo1tIV4FZbi8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_02,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 bulkscore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250172
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_020025_247392_759EDA78 
X-CRM114-Status: GOOD (  10.79  )
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

This change enables display1 clock controller.

Signed-off-by: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
---
 arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
index c69aa2f41ce2..d4436bc473ba 100644
--- a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
@@ -436,6 +436,10 @@ vreg_l8e: ldo8 {
 	};
 };
 
+&dispcc1 {
+	status = "okay";
+};
+
 &i2c11 {
 	clock-frequency = <400000>;
 	status = "okay";
-- 
2.34.1


