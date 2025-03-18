Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B385C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 13:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rV1IlqnHQ/o0RgJA1eBMQdA9vXcN4qMsDFTtrI79Z6Y=; b=SJLO4oc/SIJipYXRslboA/Ppls
	jCa+exx4hrmZGZtV6xG7Oh8c/cZcL5fSPVGr326Zm/zAyiUfF/zAGnKmmBhPUoarhad2sjaV3lG1O
	MmVEjhhNhUGT09YMS5TY077ijxbnuJhwDk2iUNKr/Nzz+VQFvvFr+9vgyrDofNSL+Ax85aqKwN4FM
	iM1R17HYPuLa6JqqADHTFhONUAKcsC5xtjnl8YgqaRbskAnRs9viEyGHUV2X8IHxqT4i7eRFvrmBm
	I79vuWnsOSUB7Su/+6BN18NeQb50XmHwFR7cLyLefJIAlhGltjXeTTQPBlkNjql8G/SVTwBLGMzpO
	ux4aLMWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuXAP-0000000631z-1h8I;
	Tue, 18 Mar 2025 13:39:37 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuWtl-000000060P8-2QDA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 13:22:27 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52I99hGW031964
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 13:22:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rV1IlqnHQ/o0RgJA1eBMQdA9vXcN4qMsDFTtrI79Z6Y=; b=ljnAu7txJ66WqqTM
	V0qJfcvAC9VpkTlWfI8L5i02WfpMIBN8s7eBwzNHS/Kmj7nKO5XfdQCseY6+C75Q
	oICWB3uuFf/ufluwrbzF40xFhilu2pCi9X+xo/Xi+4IgnLsxBuWJUcZbWKkfoupZ
	y22q4gMCRgOztpmOgUKlN20cV6/HSFcjMCJiofKCOtoS4nHX0kNXAqN0vqu0XzpP
	/TMmmkzA5SmSUR/UacTi2qWfRZ4ATT7nD7CUnPylQ273KZweVi/j02MJui8wc3nj
	pxtK7WaQrGe6/PvOXC3MNQQZzn+VKY0jZv8pR2XCXh/+ZUWYt5mKJo7NeTcVHqgC
	ExabAw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d1tx8awt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 13:22:24 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6e91054ea4eso93069736d6.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 06:22:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742304144; x=1742908944;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rV1IlqnHQ/o0RgJA1eBMQdA9vXcN4qMsDFTtrI79Z6Y=;
        b=k0U8yFid3f4oCLksDhJOaevICS1kaO9FQlSRLFf2UPPrCCTAGla/bW1sQdhkBdnMd/
         ca17v92hL0EKDDOzv6mxoeaGqeMP7Pu1y52QS/9YMgjqOdaRAHegSkIb2T98zd1nN3xj
         eS2duEGj17W95iyY81+FKbBaBz0L0tFOFWxXyv9Ws7PAkDkSlLf4r0xMWiBW3J5OWr1T
         hAMh3LTPjNAateU0uT+4P99Ya8n6W3N7kmEhAtXPwHUPe9XDsHj7kxpfmIdIVCHvVF3+
         UnPBAMNglLUNOrMxNA2V/OcvhhSgCZmW3dm6ScP8bVla1gV/sMgsCGeU3w2NDnWRq7w9
         ZTEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWNiyFvd1aK2idO8o/OzpARTjmK3k6pjAyE6Gs0gXNwMAbEN7AHpAIrnF8UXaKwFceJk7USe56hZ8yRY1kcx0k@lists.infradead.org
X-Gm-Message-State: AOJu0YwzPeC4V8OYrTuYas6DJGkqjhFsSAxGuzDw8PcwrjFiTWH2op3s
	GEfclucW9zlIWLGN+24f0T/W7VDibpnABc7RSEY9dBotjV0Umah5z/fjJtoXEldthhIwdtzGbBf
	tflmhWVEfC8why6srS9vRL56jMOw0n9eQH3TyNfG/jZJijg9SBRgxVuVDdOKNDZu41xUKWXPCPg
	==
X-Gm-Gg: ASbGncuBcgEcuzkaWAfkbAHlUt68mR34PjJNQvDOoCbkmVOdqVWkDyXOTK+m9y5EUa1
	xDEI1uhl5hByQoFsFIUTqjAiNwH1x5Qd2qZZUzFESIcYbqwT9yD6pNQpeBPd/KDw7DVwQ58i2Z6
	ITeqLwTvhkM/6NZGDa46xB59jBxhZ9tNA6+5oANhxXmu3PbaYcoIEK14/K8sF42Rn7kePnmKe8m
	uG5kJ17o6kWdMU2sDJuZrmw+TwvGq/u1+pqWM+jvW0ab98l7fBdwC2ybN/shV0IurJl6Wd63wsb
	y0qL0uIXVOQ7z4efJOQl/1umQDotiaJCCY92DYs9uvgc9prSuixMIIcv3eumTj5hoQ/1wN/KC3V
	aFgZpdPvKwpB1nRbwIVEjbowiSQhd
X-Received: by 2002:a05:6214:f28:b0:6e8:e828:820d with SMTP id 6a1803df08f44-6eb1b923b9bmr61022636d6.36.1742304143823;
        Tue, 18 Mar 2025 06:22:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFT29uNdkPTC8hLiSVJtVNM0J6OKkSWUgcwgv9PhSfYfcfwdVm+rFQt8CN7Y3i8guabZwOiLw==
X-Received: by 2002:a05:6214:f28:b0:6e8:e828:820d with SMTP id 6a1803df08f44-6eb1b923b9bmr61022136d6.36.1742304143454;
        Tue, 18 Mar 2025 06:22:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba8a79c4sm1664831e87.226.2025.03.18.06.22.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 06:22:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 18 Mar 2025 15:22:03 +0200
Subject: [PATCH v2 10/10] ARM: dts: qcom: apq8064: move replicator out of
 soc node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250318-fix-nexus-4-v2-10-bcedd1406790@oss.qualcomm.com>
References: <20250318-fix-nexus-4-v2-0-bcedd1406790@oss.qualcomm.com>
In-Reply-To: <20250318-fix-nexus-4-v2-0-bcedd1406790@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Lee Jones <lee@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan <leo.yan@linux.dev>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2350;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=YYmo07roKcW7ib7dlxEqOnCz38XSWKk8QyvkfSaIp/I=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ/rN4rJlBtasApm/mjKF2LnuXGs4qqIg9kD3B++9H/NTh
 TI7ztl2MhqzMDByMciKKbL4FLRMjdmUHPZhx9R6mEGsTCBTGLg4BWAi13XY/0dW7P1w8e7+Ovf/
 ek8PxHXZybRLznNQdPzAsKfs4O6o/dJC2q1KC7j2sjc+eVTZs2Se+R6tt9nT3JIDTgQwB3cWO4g
 HngxSOO73x4xlQtnq+qmzU0RZjPZvlLm1YwtLmxfrm9nVzNrlEryTFblrP5XyV0yJ6RCbb8ZWPV
 E42dX+xT7eM8nhMfbyL7m2Gt7MKJ2t+yGCR1bR8RTrb643Xea5Zwt2bg90VRTaERjpK+3dN3NuX
 NiNL/frDnlrtJgf+uX78n4E3znpEP+lslGzFh65wSq489v8+Nbs7IBkxmsdKzIN/DYfK1yzaJ6E
 3xK99EtqpyewbE626Nhy4ppY8bX/uxc4iK+Zs2H/jFuhAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=W/I4VQWk c=1 sm=1 tr=0 ts=67d97390 cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=LFh-nz-jDHZ_m6HcgWkA:9 a=QEXdDO2ut3YA:10 a=B72P2sQ2WZ64KWKWCyzG:22
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: Exs1dz7ShWDXGmoc6qIhtSsQIZyPGtdS
X-Proofpoint-ORIG-GUID: Exs1dz7ShWDXGmoc6qIhtSsQIZyPGtdS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_06,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 impostorscore=0 adultscore=0 spamscore=0 mlxlogscore=968 mlxscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503180099
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_062225_742218_508A8124 
X-CRM114-Status: GOOD (  14.74  )
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

The CoreSight static replicator device isn't a part of the system MMIO
bus, as such it should not be a part of the soc node. Follow the example
of other platforms and move it out of the soc bus to the top-level (and
reoder ports to follow alphabetic order).

Fixes: 7a5c275fd821 ("ARM: dts: qcom: Add apq8064 CoreSight components")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi | 67 ++++++++++++++++----------------
 1 file changed, 34 insertions(+), 33 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
index b6533630e347c8fc5e3f0791778cd05760b3f3c8..b02e6739ccb20a287095d8c3e212040e4ac50fdd 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
@@ -278,6 +278,40 @@ scm {
 		};
 	};
 
+	replicator {
+		compatible = "arm,coresight-static-replicator";
+
+		clocks = <&rpmcc RPM_QDSS_CLK>;
+		clock-names = "apb_pclk";
+
+		in-ports {
+			port {
+				replicator_in: endpoint {
+					remote-endpoint = <&funnel_out>;
+				};
+			};
+		};
+
+		out-ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				replicator_out0: endpoint {
+					remote-endpoint = <&etb_in>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				replicator_out1: endpoint {
+					remote-endpoint = <&tpiu_in>;
+				};
+			};
+		};
+	};
+
 	soc: soc {
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -1529,39 +1563,6 @@ tpiu_in: endpoint {
 			};
 		};
 
-		replicator {
-			compatible = "arm,coresight-static-replicator";
-
-			clocks = <&rpmcc RPM_QDSS_CLK>;
-			clock-names = "apb_pclk";
-
-			out-ports {
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				port@0 {
-					reg = <0>;
-					replicator_out0: endpoint {
-						remote-endpoint = <&etb_in>;
-					};
-				};
-				port@1 {
-					reg = <1>;
-					replicator_out1: endpoint {
-						remote-endpoint = <&tpiu_in>;
-					};
-				};
-			};
-
-			in-ports {
-				port {
-					replicator_in: endpoint {
-						remote-endpoint = <&funnel_out>;
-					};
-				};
-			};
-		};
-
 		funnel@1a04000 {
 			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
 			reg = <0x1a04000 0x1000>;

-- 
2.39.5


