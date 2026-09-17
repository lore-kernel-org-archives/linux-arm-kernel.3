Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10436C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 11:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZecxAZHHCtR8vBT/I5lYYisvcmBfN43svb3hSSFCwGQ=; b=r+0FDOmq/ZLooDSmqms4fzrGwc
	1+gaSgxuJMTvQP9PTvjOVNWxUn/Djw7WvcW5lWW5VWLZDRaulvV8wTYbRGtr6sUgiL/K5LPIJ4Guq
	X48f1pvRlkxN0ICvsZldDENOP/jWkgBC3bV0HWh5C7rg2SuJIDYGhgs0lWLXOTwXSSmcxtdoAYTrD
	XEL/Wi2T4RoiQO19KobQ+1AcZhuaGT/zvOLxjFO+Ve7UNvomeAJLxM9sSHCodQX+R6SLsWV/4e/GQ
	7xlFMCJedXZ0MMre3xYOJPjjxI5v2kyjzvKg2oZCIhg0U8KGaVb4liKoTQG5r9tiCJmPyygfufny7
	oJtA1NWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7AUp-0000000BCqq-3npc;
	Thu, 17 Sep 2026 11:41:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7AUj-0000000BCoR-2Mr0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 11:41:38 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9Zkl81520219
	for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 11:41:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZecxAZHHCtR8vBT/I5lYYisvcmBfN43svb3hSSFCwGQ=; b=oSF2AOlti7hnaEUl
	LJjZ64ooCgg7CcQyHp/1SHBViXqUX+LluPxpeO4mmUG8ERXc3Ip3Bp9ym8RsxXv5
	GOXXSLffY8WROWMpm/i+BiLsWbIeLXTJmVUm8TRZ+GUugDJuHrp1D526/GzxpLCQ
	TP0qNT6KB0fKIkAahjEhxF6AKfhRDN9IBbMa8SQZMBAvj2nKoWoLlpJR04vAkdB5
	nQCDZn1TL+XAGOeU3fkbbAskT700o/G84WwXlDG0DXAqkJfsoDYq8e+WyJBzckCl
	ZGL/p33x5byVp7kRf/Ezb3qgUbZUQ3BUd3EdincEYhOIQY81KmGaHh2eNCe+arMl
	EEmG5w==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqy7hc24v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 11:41:36 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-85f1f3620bcso742537b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 04:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789645295; x=1790250095; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZecxAZHHCtR8vBT/I5lYYisvcmBfN43svb3hSSFCwGQ=;
        b=PgUVnbSUfK25mbCCYfP/m+FY3zUp8C+OTmJu+pEYKjHb+s9m/gNaR4hfFZNFNuovmm
         iifpV0TRRSRqiqzVZXiLx9XROHdDs5+eY/isPy8s+ImVXUddrmM9Z3aTlmYcN72E02U+
         tQ8k8UEVHCsYeZ+phFPLRjoYlQZh+/nZQ4AUEAoU/PTPmIKstzqsnZuJmjiLUaC9s7oU
         a6AdiHH4wAg0d55H9XjiHns7EQ0LJDR3vm8zXH2Kdhe9E1m0qILfpg0RNANXMg514lZb
         nIQtOSVqCiIFobJfbt2HsOOhwXw7Y17JO8sn0ODlUrr9lrhaebXeS4IMCsgjN26ZeP1c
         eJ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789645295; x=1790250095;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZecxAZHHCtR8vBT/I5lYYisvcmBfN43svb3hSSFCwGQ=;
        b=DWdqH9QpRW3OZu/QgVNVjbOyC0fmetR8sHgi3u9DGximpl8KrZyUH62n5J5obL0tFk
         UEYAFeM22vYxTesLUkniaJD8I6TYfy4aYzYNphjDgIXH0FK6WoUlL1rG4kEiK6rpo6Rs
         b90lYKL/AveCsT20vq+3+D0k4ThNZclvUcZ859V6PZJY5zn2MYt3Ox18duS5x5QlZotH
         xDWaOu09/yRs7FCZJbYgKDgkbQQnx8F19kWjGwvuphgPoJjBfPkE1bCyjpaJinGPDIG8
         7DTMDmsX0Ud3AD6JEJTdJK74Geym6oBMofKZ/mPeYBN+xEuRQ8VbyNOcjzOFUTcCLO86
         H0xQ==
X-Forwarded-Encrypted: i=1; AKwUvBzdgGIaMt1C1xPvnvu6/WcarAINywO6O+fPP3nrwsV/A6ZPPjFLe4IYlnjr43e9c94lUt0Os8McBUtp9bhK/p72@lists.infradead.org
X-Gm-Message-State: AFuF++mcAFhHLRtlwxGMOlIoiyWkCJ+5X5D7i2gcocUD65cETiU5CAbA
	cLwbm3mEMpdBPGlqgrAFz7mbCEJjoTuBNLE+33/XZqxogyQf7MSawVzAPSNNOIGgftKPvYTxcUw
	YDikV2fcawv+NhdRNe2zc6cZOCzVtNzkmcHyuB8fTyfIFlW97ZInzpO1a+QgRTelxcw9D5tFhGA
	yfqA==
X-Gm-Gg: AYBFou3os/U6LElj2c9M7+5rnBEWg5V38YSoCcDLXAeSuG6hPLxl6hxYOUiDNhaj2yu
	5JQFix3M+esMni3f1fCtJ9TBD9VwSahu8Rxdx6/6YifabAZKKstkymFoVfrvRZOWHCbGrDwAJ0W
	VaTG81GVJC0v9AtE0g92Rm+zf+2uODo4vMICTTLq4DVsakVzVehQi5WhHoOzfDm6Ekml9iN64Dl
	rFNsH4a3fUfP83ZyYj0k3arr2jNoAJTiA76eN2lWCI6qoTO2BRgV4gTfxi3QXttQVBerEmnV5sv
	I/7Dt1QRkMvHmyWTn/8qQ4C7aY1HTYrTBqRMIPYhJZdt6FaenZk+/6CqLw/Wiprudpiqr++Pgos
	U4BibO4v7VkvewbJgn8GEuzo/L6GaFg==
X-Received: by 2002:a05:6a20:d528:b0:3db:131b:8d8 with SMTP id adf61e73a8af0-3dd72665d28mr5070595637.14.1789645295176;
        Thu, 17 Sep 2026 04:41:35 -0700 (PDT)
X-Received: by 2002:a05:6a20:d528:b0:3db:131b:8d8 with SMTP id adf61e73a8af0-3dd72665d28mr5070531637.14.1789645294657;
        Thu, 17 Sep 2026 04:41:34 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc50acc1178sm3066557a12.30.2026.09.17.04.41.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 04:41:34 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 17:11:02 +0530
Subject: [PATCH v8 3/5] arm64: dts: qcom: shikra: Add mclks pin
 configuration for Shikra
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-shikra-camss-review-v8-3-9b9596221cfa@oss.qualcomm.com>
References: <20260917-shikra-camss-review-v8-0-9b9596221cfa@oss.qualcomm.com>
In-Reply-To: <20260917-shikra-camss-review-v8-0-9b9596221cfa@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789645263; l=1547;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=C29tX4FRzcgmif33GVTX6zsYFWffRjwZBgWZudoP01E=;
 b=+ThXIethSpr4dc1t7AXKnXGlk8O7tt/aAN7e5eHJMwBsFjAbYHKM0hdc9zbVJy/q9yDhXgnYz
 NN02I8qmQYJBSrtIlA6mpaV2cl2V2LH1in1X7AwS42iGACGyt9ozb2L
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE2MiBTYWx0ZWRfXzbiOq/0DfNBQ
 zWpXllZuJaIaF4zjmZRiPzInmL2OAHLUWYeVyNAFV57PNEbE9FdKTpIaij5tWCYySzi5EzC6S6j
 YBGdWyFII/0JCluGtQwGvg3Vpm4NXv9d+7hMdsiP4NuNBPsDdfp4watWlOGCdNtCz9tTKjhchoM
 8wqZfvZjYcEqFlF/8y9InCM/98vYvN+hiNc7Dfaa53r9l/apiyJGQuuuZC0H3L7EekGbe/LMr/i
 D9CDKtEtiyLgddpvQmTY4Xym4Gh7luHC/5urPTF2WCLzKtneQOcpP4Jvr31wA4kEvXqLRla35Ai
 FMZf33Q1tsSkMTZZa62UPQTLJoJBGdL3VBFJZdFkFa0B+oQfsKDP/rA6LQvEVh8e0pRFgnIcKrk
 vmwpdypUfWh+mZhM5Rx0rasV6SWO0MWKEzPLG8FICYDeiKRQMkRa9zr+AcrCRxa9/ygbdxTQV6c
 60xJ2/Z6g+65Sx/Tdwg==
X-Authority-Analysis: v=2.4 cv=L8aI0OT8 c=1 sm=1 tr=0 ts=6aabd1f0 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=PMLJDkNcKfHmOO-cHakA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: NgxiioQuwZ-0-kUExB7_iCFlJdvBXlxb
X-Proofpoint-ORIG-GUID: NgxiioQuwZ-0-kUExB7_iCFlJdvBXlxb
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE2MiBTYWx0ZWRfXywz9cA1y5wHN
 k/nC8Ban54C+ZLHbOTM+BelsOKyrni7iXhOFrmhe1TtiWkEyDarFuUNIhxFiucwQbK7u8crUGXe
 KRj33PjYNj95pnpMxduZW/nR/wrna5o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170162
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_044137_723810_B814FFF9 
X-CRM114-Status: GOOD (  12.33  )
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

Add pinctrl configuration for the four available camera master clocks.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 5f64b4e50967d61846b7b0c565380a58e4ba3210..682f2c933c3ae76282cc399f8bcaeac3a3cdd654 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -924,6 +924,34 @@ cci_i2c1_sleep: cci-i2c1-sleep-state {
 				bias-pull-down;
 			};
 
+			cam_mclk0_default: cam-mclk0-default-state {
+				pins = "gpio34";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk1_default: cam-mclk1-default-state {
+				pins = "gpio35";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk2_default: cam-mclk2-default-state {
+				pins = "gpio96";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk3_default: cam-mclk3-default-state {
+				pins = "gpio98";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			sdc1_state_on: sdc1-on-state {
 				clk-pins {
 					pins = "sdc1_clk";

-- 
2.34.1


