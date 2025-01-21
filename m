Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 099F7C02182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 12:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nLSk5ZAJAdo5mg2a+Ccy08Z+1OH7JcT48I5BUdw9GaE=; b=0PfMAQ+zVYlSylJu8GA79Ld9dC
	poWTN25UX6ZwYEUL070xcxJ+HjdeqY92w5lI6MHOaUgFbgjrpMy9E3DOJ/DYIGxuvLDHEx+UtTrOw
	RPkljNOZrD3rG7bc5FTq+N6a6InG/cem7w2VzXVv1tQJudJWylSTj5YSaMlYHyaHtaFK5eKsE1gwy
	wXgBZqtlHTNSijOEIKYWk2prqLB3vAhXxkqvsaZbD3MfmmOeabl+DiKr9sRw1+csua3coKTpj8VWj
	HsRYWfufaGKY4eG5NntQCCK6VqDaRMGdUVtvS0MEX1Fbal/zdEEO7i2FNBIY9IZPYrbqQtHcr4gvI
	VnrA+fXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taD5v-00000007pFC-1YL3;
	Tue, 21 Jan 2025 12:10:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taD4d-00000007oza-3k8F
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 12:09:41 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50L8Yql6001569;
	Tue, 21 Jan 2025 12:09:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nLSk5ZAJAdo5mg2a+Ccy08Z+1OH7JcT48I5BUdw9GaE=; b=hAqpYlpwsnZPGFei
	2jDgvaKEM5Ifht9yO2hMMKNFXJ/abeKXbNDgnlzOyjvk9EAL3PXGMlwYCOqQ+Shv
	sfSDuDBe7W3DnxHSvRE0UTN0BrTlI+isBBgI3bbMeISMaffHamtsGzshm0w+9/Gj
	FcOgl3t2api1CEwgHnYr0zDdbbWPOB5CahbClW7dkkBC5RBkghzmmO+2CghiP7TB
	EzsINI1bZY3ONayxLZ11GOGWOwkwtRfs8rtwJbeLtDqtvjWV1rrjV6aZWLX4sM7X
	kvb8WD5wvkpS0f/i1O/7wWD0NU6ynrbZO2i8TJH4uhapytkrt5qLTYeY5ZgXT2dg
	ECzh2A==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44a866rsqj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jan 2025 12:09:32 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50LC9VKP015828
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jan 2025 12:09:31 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 21 Jan 2025 04:09:23 -0800
From: Vikram Sharma <quic_vikramsa@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <akapatra@quicinc.com>, <hariramp@quicinc.com>,
        <andersson@kernel.org>, <konradybcio@kernel.org>,
        <hverkuil-cisco@xs4all.nl>, <cros-qcom-dts-watchers@chromium.org>,
        <catalin.marinas@arm.com>, <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <quic_vikramsa@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>
Subject: [PATCH v1 1/2] media: dt-bindings: update clocks for sc7280-camss
Date: Tue, 21 Jan 2025 17:39:00 +0530
Message-ID: <20250121120901.1841142-2-quic_vikramsa@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250121120901.1841142-1-quic_vikramsa@quicinc.com>
References: <20250121120901.1841142-1-quic_vikramsa@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: _2NvF8XRlxURZNgsAqAsCll8lY5s357_
X-Proofpoint-ORIG-GUID: _2NvF8XRlxURZNgsAqAsCll8lY5s357_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-21_05,2025-01-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 mlxlogscore=999 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0
 adultscore=0 suspectscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501210100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_040940_048578_C0CE3704 
X-CRM114-Status: GOOD (  13.69  )
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

This patch change clock names to make it consistent with
existing platforms as gcc_cam_hf_axi -> gcc_axi_hf.
This also adds gcc_axi_sf and remove gcc_camera_ahb.

This change will not break ABI because the ABI hasn't
been cemented yet as the dtsi changes are not merged
yet and there are no users for this driver as of now.

Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
---
 .../devicetree/bindings/media/qcom,sc7280-camss.yaml   | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml
index e11141b812a0..ee35e3bc97ff 100644
--- a/Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml
@@ -55,8 +55,8 @@ properties:
       - const: csiphy3_timer
       - const: csiphy4
       - const: csiphy4_timer
-      - const: gcc_camera_ahb
-      - const: gcc_cam_hf_axi
+      - const: gcc_axi_hf
+      - const: gcc_axi_sf
       - const: icp_ahb
       - const: vfe0
       - const: vfe0_axi
@@ -310,8 +310,8 @@ examples:
                      <&camcc CAM_CC_CSI3PHYTIMER_CLK>,
                      <&camcc CAM_CC_CSIPHY4_CLK>,
                      <&camcc CAM_CC_CSI4PHYTIMER_CLK>,
-                     <&gcc GCC_CAMERA_AHB_CLK>,
                      <&gcc GCC_CAMERA_HF_AXI_CLK>,
+                     <&gcc GCC_CAMERA_SF_AXI_CLK>,
                      <&camcc CAM_CC_ICP_AHB_CLK>,
                      <&camcc CAM_CC_IFE_0_CLK>,
                      <&camcc CAM_CC_IFE_0_AXI_CLK>,
@@ -343,8 +343,8 @@ examples:
                           "csiphy3_timer",
                           "csiphy4",
                           "csiphy4_timer",
-                          "gcc_camera_ahb",
-                          "gcc_cam_hf_axi",
+                          "gcc_axi_hf",
+                          "gcc_axi_sf",
                           "icp_ahb",
                           "vfe0",
                           "vfe0_axi",
-- 
2.25.1


