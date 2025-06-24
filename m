Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21531C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 10:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Optt2rO6XBQQ9qmEhMi7dr5/Hn4l28mMtAmngi1crsY=; b=rO4g3Gnkjm8S45aQSJfyRyTQPS
	Tsf8RgqtsdnVNd4gTAa1yOSLrRTFz3TzDl6l08d7N7RlforC+GuAvKge78uYUXLK4r2kcs43Ag+SJ
	IH7qnkCtbmuptarK8eGCUn1nXA0bJa/MWA5OAeDtuCa5cW/6ER84IXwjHWqbZ0yaut1TmyrJK9DLv
	hkA2+e0lRX+cb7daB8wtWVD8f8P+fTQLFmK5Y7VlXEH2d48Z6VR8IEBLP356uPIq2SW9gex8R22u7
	J5lBX3rYKw4UDqcfticR9085Fv3zf0LVeRiCJjf9K7SerYnDgk6fKQue7KIPh+XZru8Ys4vCq7dMf
	2Ghxe3sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU0YD-00000005G2r-22wu;
	Tue, 24 Jun 2025 10:06:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU0R0-00000005FII-3yov
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 09:59:24 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55O8rFKt015342
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 09:59:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Optt2rO6XBQ
	Q9qmEhMi7dr5/Hn4l28mMtAmngi1crsY=; b=en+Swl5/w9p2wH8r61K+ARLr7j+
	LfOXviK9hYpZeR12z2sFPU4DjPfV4w/Cd8GuFXWmbqLFNNbGI5ur0fcXqaw5bIK/
	Rz0O49WBeMEmBP5e8GA1RQ9pQOOoN0I6n5EBlAr9rmh5k4kJho1J6QbqPKcX6xQZ
	bK7V00dVGBiVMs9k+j3Z5j6zFSrZHYNOcWubtMej9VgMsyZ2odtZVp8Bh1JfHKzn
	5FcxaKkOSLMyBR/oL4TBUd96Xl2mWR4oUE3ceGCyJwvteavdITD/ZJu2MrrAVetJ
	jRqjnHvaJuMQ6M6jhLi4Fy38GfyA0+jLJ05GkaKv+YXydp2ANLEni2+ZeIA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbhqj44d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 09:59:22 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7491814d6f2so411901b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 02:59:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750759161; x=1751363961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Optt2rO6XBQQ9qmEhMi7dr5/Hn4l28mMtAmngi1crsY=;
        b=f1VLRIU4lrmwAaIo3B/eQGZP8c5XX60l0/HZZl63tMGbnlMbEdZKRtyx5JVZzY87ri
         cj6ITRrd8tIYYwYCX2X0jxCJbJfJHDTrGUIJ1K2MxW63zydOzxIW7y5W7WX4LTemwUvq
         G5i+McFHF6G3SzPDqJhJtonq2/CrqexjTlJX5i1LBXC5efDDOjmY4pxU6oMMGa8UEzRY
         Yih0IeBRn1WQt6vcoNqC5qJithO4OYki+a3ab5MNguvO8TW9xOCJWSmlc734oaNqyi9e
         e1gzdQ53diFGSK7Vmr3eOx+rxzK8xR5szoF7ofzmIfPv20114/i6GsZ1qnZ5uHa64w71
         Qokw==
X-Forwarded-Encrypted: i=1; AJvYcCU1Re4myUK0jDi+ZZqCF0yzrgTXvZxZOK72g8ri0rqaIvNtodJEgsct04Yo3zY9iUVFpT1FlAzDnphIu65T4guY@lists.infradead.org
X-Gm-Message-State: AOJu0YyfQ974ypY4eHM5/+TVJt+7XislcNQly9ZUUdiq2D01U/PBA8tI
	SQA5JshWhRoIHx+NzSuXvkrgaX1eVUdkrxSG8FVPxgM2vHIAybAeTfFxCUbPuH1IHgkHkPUEIIK
	wkWOZaESd0ejgX0g0F8bc56xs6p1zgafVi8Pcw6VXkh4sZ2wQH4XumWSPkf3zNeCdqu4rNnVLzb
	yfrw==
X-Gm-Gg: ASbGnctz2B/gh187Qa0DxveSQtfNwC0AIbZeD7p2o5URViNGuyRVQlIQM5pmdMu2taL
	G6dfb6tKzxoL2XeKHeVb0Ldsg6f/SOzncNKKskHlmj5bah3MdP9jBPjedaEYcJd9KwPBUTvcS/i
	qTG33i6vdtdcMbRgzZTxDGJzsAT4YouhwQj7PB136kjBxYv6ZN1WiVBq2My5R1/OEoTLAHvRsND
	0IKd+H0WaBBVrVXcKPAQ0utUtZqy7qS5Ck7GtcnyQrYus45IaU//4KTkaaxmqzFdHTa/Q5/nYa0
	YckwuEfCuWfH+6vZCpKdnweL1iT1Nlo9gLq+mN5NRe8mh0dYOqgYjE+dZK+ZgGrVFAWQeulTLNW
	a0A==
X-Received: by 2002:a05:6a00:2da0:b0:749:b41:2976 with SMTP id d2e1a72fcca58-7490d47815fmr27481321b3a.3.1750759160882;
        Tue, 24 Jun 2025 02:59:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGFm5LAXLi5rxd+dY2ZkrdXXi6904cVirbcf/nlfRIpnodVbXQw/BL2vCoOboUruU9o4q+2PA==
X-Received: by 2002:a05:6a00:2da0:b0:749:b41:2976 with SMTP id d2e1a72fcca58-7490d47815fmr27481281b3a.3.1750759160492;
        Tue, 24 Jun 2025 02:59:20 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-749b5e08ccfsm1456443b3a.6.2025.06.24.02.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 02:59:20 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, jie.gan@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v2 2/2] arm64: dts: qcom: qcs8300: Add CTCU and ETR nodes
Date: Tue, 24 Jun 2025 17:59:05 +0800
Message-Id: <20250624095905.7609-3-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250624095905.7609-1-jie.gan@oss.qualcomm.com>
References: <20250624095905.7609-1-jie.gan@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 6R5P-SFLanVFbAmj0ge-L4lNw5m9uyvo
X-Authority-Analysis: v=2.4 cv=Id+HWXqa c=1 sm=1 tr=0 ts=685a76fa cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=xJyy5nzPNu-aANFJA0oA:9
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: 6R5P-SFLanVFbAmj0ge-L4lNw5m9uyvo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDA4NCBTYWx0ZWRfXwCBKyHhX1Li6
 HrxDecwyVpVBMG3rB1hW8h4VIaOJxY8Af35lc+l9nRJXyFPxAUT5oUtp64xjrzyWZ9TqHPwFnGi
 cLJJg2RkRKIqKboqR48LgC96lVPSc3QEXRoxquUfObd9UI9pOx3R/2KiFAqreXxVR19QX9XII5I
 +0MKTAikVt9KVgJQeLxCp47VP1RxCX0DZPMfyZsHWhEf8jP3tGz8e17h2ne+L0N82OxJKW8a8gI
 yvHlWU9iVwgI9UC/uuq7iplQXul8WoO6Z4PKf+LkJ1dlTQcFfV1wnGqByueKtzADjFpBcCAzPvn
 fdXPs6l6611iWv3Gi/8wpQC0so38YZBrzN7OOUdZoXnYP5jVFxGCW2cnDt9ubEw3DDSQ5PjiTy2
 D8bBYzurAz2BH9Vy4BNhhpGSbHChqcThsRnfKiGfXOnnumVoJkujYMEZoztIXxhAYbe3oVYu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_03,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 mlxlogscore=999 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506240084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_025923_115741_681BA345 
X-CRM114-Status: GOOD (  12.82  )
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

Add CTCU and ETR nodes in DT to enable expected functionalities.

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs8300.dtsi | 153 ++++++++++++++++++++++++++
 1 file changed, 153 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
index 7ada029c32c1..7c235dc7cbdd 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
@@ -2154,6 +2154,35 @@ lpass_ag_noc: interconnect@3c40000 {
 			qcom,bcm-voters = <&apps_bcm_voter>;
 		};
 
+		ctcu@4001000 {
+			compatible = "qcom,qcs8300-ctcu", "qcom,sa8775p-ctcu";
+			reg = <0x0 0x04001000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					ctcu_in0: endpoint {
+						remote-endpoint = <&etr0_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					ctcu_in1: endpoint {
+						remote-endpoint = <&etr1_out>;
+					};
+				};
+			};
+		};
+
 		stm@4002000 {
 			compatible = "arm,coresight-stm", "arm,primecell";
 			reg = <0x0 0x04002000 0x0 0x1000>,
@@ -2348,6 +2377,122 @@ qdss_funnel_out: endpoint {
 			};
 		};
 
+		replicator@4046000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x04046000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					qdss_rep_in: endpoint {
+						remote-endpoint = <&swao_rep_out0>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					qdss_rep_out0: endpoint {
+						remote-endpoint = <&etr_rep_in>;
+					};
+				};
+			};
+		};
+
+		tmc@4048000 {
+			compatible = "arm,coresight-tmc", "arm,primecell";
+			reg = <0x0 0x04048000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			iommus = <&apps_smmu 0x04c0 0x00>;
+
+			arm,scatter-gather;
+
+			in-ports {
+				port {
+					etr0_in: endpoint {
+						remote-endpoint = <&etr_rep_out0>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					etr0_out: endpoint {
+						remote-endpoint = <&ctcu_in0>;
+					};
+				};
+			};
+		};
+
+		replicator@404e000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x0404e000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					etr_rep_in: endpoint {
+						remote-endpoint = <&qdss_rep_out0>;
+					};
+				};
+			};
+
+			out-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					etr_rep_out0: endpoint {
+						remote-endpoint = <&etr0_in>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					etr_rep_out1: endpoint {
+						remote-endpoint = <&etr1_in>;
+					};
+				};
+			};
+		};
+
+		tmc@404f000 {
+			compatible = "arm,coresight-tmc", "arm,primecell";
+			reg = <0x0 0x0404f000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			iommus = <&apps_smmu 0x04a0 0x40>;
+
+			arm,scatter-gather;
+			arm,buffer-size = <0x400000>;
+
+			in-ports {
+				port {
+					etr1_in: endpoint {
+						remote-endpoint = <&etr_rep_out1>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					etr1_out: endpoint {
+						remote-endpoint = <&ctcu_in1>;
+					};
+				};
+			};
+		};
+
 		tpdm@4841000 {
 			compatible = "qcom,coresight-tpdm", "arm,primecell";
 			reg = <0x0 0x04841000 0x0 0x1000>;
@@ -2777,6 +2922,14 @@ out-ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
 
+				port@0 {
+					reg = <0>;
+
+					swao_rep_out0: endpoint {
+						remote-endpoint = <&qdss_rep_in>;
+					};
+				};
+
 				port@1 {
 					reg = <1>;
 
-- 
2.34.1


