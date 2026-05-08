Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95894CD3447
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 11:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ghOFHSQuRa6Ho3W8UeptFZ9B3PI3azR3W1imEZjn6dA=; b=wcWlKw4CShdo//kfmJpiL4Gsfd
	YVEgM9aMMiSjfGxtII4YGitDLMZ65DZljdJbiuKIrCwikm2yhgFCVnVPEnTCJK5mESAP8ESWF4vH+
	6HDjnpjhTStTDAgbjBy2TUG819EqQJ7eqgzr15AjWHIVkjtrLhKLUKNm1dE9t0kb1kCguDpZ0ro7Z
	bXdv5+VBfFmttj5gYduf0mfwyYNEwywGMyPFM1w79skQXhsX4pSYwEoFkMH8r+E8YdgXoCG4dOW5/
	rgC5PEweGwWboqtPrrU03Ew/5b6i/Qm+NE5wQxHj96WYihpHhmhnp4WweoXXEKAfSGj6k9XpiY1fX
	UGg4rsiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLJa2-00000006Mm6-1uC5;
	Fri, 08 May 2026 11:41:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLJZz-00000006MkB-1yhV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 11:41:16 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6486jG2u257852
	for <linux-arm-kernel@lists.infradead.org>; Fri, 8 May 2026 11:41:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ghOFHSQuRa6Ho3W8UeptFZ9B3PI3azR3W1imEZjn6dA=; b=FNyOayMQZgekDSWV
	wwu553aUT2EqbAY+oCGT9hGUfsG1DdscEMmYi/ew6eTYyRF9kEiHGev+XaUfYxwc
	9mZXX6ICNv8w+crVOl3XUK2WIw4rZhEcSe02aCLdbdeTQ6BHp8D3pJcUCMWRgtP1
	UIuXmEoKk856ccQtD9SeT6FsRoO7I0i5zA5Y50IqDh40Cmo/3YY9eaDkZDToOL7I
	7yES11RmInFD4u58t06y49/i59R4ch8JqIubO1Wh9KY62EfJ1OCxLBpzLEeQqhGu
	0X7VwUtxmMNSkSBWkrrFuaHNSkTHzQnn+jQjZaas3JD6TX3spymmAWDN17K85uB+
	B8DX0g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1aueh3gq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 11:41:14 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8d60fca52b9so341880885a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 04:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778240474; x=1778845274; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ghOFHSQuRa6Ho3W8UeptFZ9B3PI3azR3W1imEZjn6dA=;
        b=cs+CExQ12Vw7DTjvOJn+XLcJ5Jam0lzFdwVDF/ELRE8Lqif6e5DAzhNIKx6yVaC1jI
         M8Gyb9ZZ+FwHfCn4Hb67hrq9D3BvVRF6Z469jXLS2YrD7X7jl7rhYULv4IkBjSv+CurK
         PjYgdOIirB3zabgVPTWrKzOprWLXCqxXSn8DdzcYXDbIX+EPHZme94dfwBTYq6c2tcFs
         1Bsv9+ipm5oMYerxbrSSxC275E0bmKJIiOmf1YsIGe5fZm+BW+lob4kDOPWBdDmyWS/o
         YM2I6G511viOQjlj2qVer5/cnWaWT9k+N+u/HbtFbvnbXa5nj8tlmnLzR9AWR7X9scP0
         bijg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778240474; x=1778845274;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ghOFHSQuRa6Ho3W8UeptFZ9B3PI3azR3W1imEZjn6dA=;
        b=AySLON/cgz6MbhIjdcYU4E142WvZox5DYmg1DI+ojaiYY9gSlsA7x4MgJTgXqcLL0H
         dcY0/YOD2NmQHLtAQS11UIEhbLaSbBhU844UrmZsbXRA/qz0CQQYHU3lCA9YdYMWwadu
         VKLRE9nKbucjejdt4/jJJ/al/LMMDM/QuOJQoE5LHQvr5DP5HlUo+RbFm2Mi6EHUQ4EB
         0PzxxDZuS95NdSImk8MBb6cNozL/tWZUXCUjatyxXdTa/gM9PqDuEevYd/3kT84Plarm
         dugXQG3/bxIj9xkOtauqytqNtYcG0jGtx872W9gdhw8t6qtvQLwGilXhKjFhclTCA7nU
         uYDw==
X-Forwarded-Encrypted: i=1; AFNElJ/V67V84G/BYDjTHCcnY88LNwi+mRJGzPq6rM+4ceol8Xh10iiGC17Ue+bo4DKYM92iakIbkmhsRJsH2MXPFJOg@lists.infradead.org
X-Gm-Message-State: AOJu0YysJo8tnAZ9Tv2gsdi2Dc2GaQEY91zliQy3wpv6Q4R4J1H8chRO
	uzeliSjS7I1WVZVIRnHaCwy6rCXBRVKm9x6rstGSdqPxKzQayOqhea0TQ7wnfOx/gTcW9fI7C2A
	rOPTmquWuSoUxQWNHeuKsq+v5OJNuvH/hBN14REeD7CcI6NppsD8jnzSNkBN9Q0p6amKTieRp0/
	G7iw==
X-Gm-Gg: AeBDies6ME6WNzyR+rCmqdElNpq4Y1STGZYwUYaF0qyVJkbURgyAqhly14iQmqQXVyr
	xdFPcLsjxYGIh5586sWuXsQnFaqK0Jhvh9snxV9nAtlqjgSYXz1jlLX7+aTjvxjaaa5kkkHBOkX
	AGvJQONyshcGeQFR4fN4Qagk0+gLi65GKPIoIiYOFojFkZLX23C0tbqlabJK+GL4kcIZXSrqD8V
	bl3BzMiNJDga0ufF2mu+gZEQ4HWOKvYta8kPCC4DPsZbgRPEuLRGdT7XAVOQonbmhPjeLzp8Vhf
	vNyHubRtA6o9FbZQuMmCD22c+JiPAnuTPVmYKpwsR8b0ZXKjEwYIX/KCCPiFNgysz5I8ezAfYpI
	D9ASg4Dc3Xjr37kC/LM2HKvSozHVksmS5yLcDdE/DqnuCrAXupEwVkFra5fjOxmVhe3v4tifrC9
	8orn7QZ2X4iBtL
X-Received: by 2002:a05:620a:f06:b0:8ef:b8ea:ef21 with SMTP id af79cd13be357-907bbcb5509mr301028685a.55.1778240473853;
        Fri, 08 May 2026 04:41:13 -0700 (PDT)
X-Received: by 2002:a05:620a:f06:b0:8ef:b8ea:ef21 with SMTP id af79cd13be357-907bbcb5509mr301023985a.55.1778240473393;
        Fri, 08 May 2026 04:41:13 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-907b8d9eed0sm179193885a.19.2026.05.08.04.41.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 04:41:12 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Fri, 08 May 2026 19:39:58 +0800
Subject: [PATCH v2 2/7] dt-bindings: media: qcom: x1e80100-camss: drop src
 clock
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-hamoa_evk-v2-2-3ebdca3e4ae2@oss.qualcomm.com>
References: <20260508-hamoa_evk-v2-0-3ebdca3e4ae2@oss.qualcomm.com>
In-Reply-To: <20260508-hamoa_evk-v2-0-3ebdca3e4ae2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778240451; l=1837;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=UpO0rU0mi9erTIQVebp4pdEk7Xnc5TEa+Cg/sUI09nw=;
 b=1N5m7IXU4vcqQJsxsnYsp0BMpMjLjRx9B4fnHZosjGScLcw5C0SgfrQ/U1KxDULZ1OQulzVc8
 1guV2e05li3BYyqi9EsJrtel3LOtrNg7iR+Lh3fDZ3JiPLyMK1MR64f
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDEyMSBTYWx0ZWRfX6SyxAX9CGOOU
 g1SkTSOPV96s3B0EFyba+eYwM+P7yzslQN429ZDTCdEyB6ghVHoDSu9gDp1tzUXj8kLJw87iXyA
 W/XpGIO/mJWfBN2Lj0FRzWG05jCARuSjMocXCVaDLbT+93azU8xDCm0MmJD1hVWr4gOvCfwFuAS
 IOfGZFWnoK/uqNO9GX8c7JdTXWxCxx5IZqr0uxU3v5EFBPtSY63dOZC3KjXJw6bfShWDmDnaxnA
 qF0yH9gKTw1rRJa+AlynHfGdg8+LdhirVn9LsBAGr0JqbnnKVe6yaWoon3zUmc4LpHaTS8U7WfA
 25bObGYGmXTWd1gtpgwhLLQ8Va1eQ5FH8fQ0bH/3O/Pp8lzYOmElJrNz2GY6tfwN8jpO7BMgDo7
 rjwKyKK11rT3bwt1jJQcWDU/24Qlw8XMdrYf09Ujd+GMfvYZAmVu9MmREMQQMivlYrrY7HgnXtR
 voUQ9zFtBnr8uPFLOdg==
X-Proofpoint-GUID: s9mFI-srnBJ2PiPSeP1UM1iT98OZEQx1
X-Proofpoint-ORIG-GUID: s9mFI-srnBJ2PiPSeP1UM1iT98OZEQx1
X-Authority-Analysis: v=2.4 cv=fcydDUQF c=1 sm=1 tr=0 ts=69fdcbda cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=5wa7HSqufaon_BCSTwQA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_044115_639240_ADA3351F 
X-CRM114-Status: GOOD (  12.55  )
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

The src clocks are always-on parent clocks and do not need to be
explicitly listed for CAMSS consumers. Drop cphy rx src clk.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
index 126400772d028811c9efbb1443144ff4f264fcad..afb659b6105f018214a5eaac4dea7fd51c0d42bc 100644
--- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
@@ -40,7 +40,7 @@ properties:
       - const: vfe_lite1
 
   clocks:
-    maxItems: 29
+    maxItems: 28
 
   clock-names:
     items:
@@ -52,7 +52,6 @@ properties:
       - const: cpas_vfe0
       - const: cpas_vfe1
       - const: cpas_vfe_lite
-      - const: cphy_rx_clk_src
       - const: csid
       - const: csid_csiphy_rx
       - const: csiphy0
@@ -252,7 +251,6 @@ examples:
                      <&camcc CAM_CC_CPAS_IFE_0_CLK>,
                      <&camcc CAM_CC_CPAS_IFE_1_CLK>,
                      <&camcc CAM_CC_CPAS_IFE_LITE_CLK>,
-                     <&camcc CAM_CC_CPHY_RX_CLK_SRC>,
                      <&camcc CAM_CC_CSID_CLK>,
                      <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
                      <&camcc CAM_CC_CSIPHY0_CLK>,
@@ -282,7 +280,6 @@ examples:
                           "cpas_vfe0",
                           "cpas_vfe1",
                           "cpas_vfe_lite",
-                          "cphy_rx_clk_src",
                           "csid",
                           "csid_csiphy_rx",
                           "csiphy0",

-- 
2.34.1


