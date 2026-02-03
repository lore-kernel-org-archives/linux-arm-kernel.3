Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 565B5E8306E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 09:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4D/Pyik39IZpQuC0TtLzzBzYfy21GJ9iHitYHpNajzQ=; b=p8wIlNLowLNbZuBWmb0mZzASfY
	hGA01IFo5K2mfOrOen8Uc3A0rcIJFUud4J0i2aXc/ShyGSAsMpnA/WW1T/bK3lxEtE5nqItY8Wk2H
	FFOHJmPctt4Yl1LhCPbzvSRbCjff0FAmY8E1Lcx1o7Bx1YJF6Pj0ZDNACNY0lt2KAgEhtIg1JTbxp
	8RhIpiIVCYJ8Rl3ZG5BwiHy6xssM6EXLpKhvXrCzHwoGke2v73MuOBT2svBOgKtCeqLId7OrQ76Jx
	2jzc2qfiPL7qlNMh5jCaVJrlmIU0FP+FlvUcbABNEd/KnXE7UhvM34epf2g6YGzJ7FW8CWV2I4S8J
	KujaFnkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnCmo-00000006NgS-3ash;
	Tue, 03 Feb 2026 09:33:30 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnCml-00000006NeQ-344H
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 09:33:29 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6136R32q277310
	for <linux-arm-kernel@lists.infradead.org>; Tue, 3 Feb 2026 09:33:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4D/Pyik39IZpQuC0TtLzzBzYfy21GJ9iHitYHpNajzQ=; b=F7xE4H7Z5NtNFRzO
	f9N70VFTB6HLhgX792bNpZyR0iC+mNrZ332bcdWJFRE56zawc32J/ZQhFnGISScF
	1ammql8JjQaD8xm1wzp0zJJNQMGpy8Aot6ur99D4433Bew9gFhFMIXwAHG985Zd8
	XYmZQrudGNKmzwOc8yPQsZuurv6kBh+iUSElI9o/tEYDk9u1gmJlxIXhAQMQcZ+x
	mXdSJF+b9nYlUeOBi9jDJpQ/nytO82Jo08R6ttSVFz4WM1Ujbe9/lLqH395oXBGQ
	WYEpyM+N/qAqU1KxXRnkUuMUvSMi3fQQMsYR8EDYn4twC801+HDBh5LDL3VVHPTM
	SrKbfA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c32s3a2xr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Feb 2026 09:33:27 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a0a8c465c1so5261135ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Feb 2026 01:33:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770111207; x=1770716007; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4D/Pyik39IZpQuC0TtLzzBzYfy21GJ9iHitYHpNajzQ=;
        b=ceR+o7u4tg7f/VGEEB9AVtrnuvlCWI6cY/gPviRwHiwvFK8E2Tt2tKNk6el/dCkoik
         cxTAw/ce2I9pyUBPeEaWBwbRkQnkxjjdkg7N2O4YjU0agaRPNbhOVbGE1PcDpO2C6fKo
         DJeTe77pJg4B45Qm3Kur5Dxfqk7cS3l7uQtQi9b9ldLuL3s8PfEaocdhH0oLCQU50nSP
         Arb+hOaL74Ui1iQZSvnLnlEX4N5G+g4ahO9YZM4Ds+fKYlNUcsvNdj/veWBo4rDOv0j1
         nMpUSd6OpgjcCb6qOJXtz+wAGzKrK4VNYko+Zjp2FvfM2neNDsCJ20qqZVGZpZT2gx0D
         FJzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770111207; x=1770716007;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4D/Pyik39IZpQuC0TtLzzBzYfy21GJ9iHitYHpNajzQ=;
        b=pCb6lBL6QKIhx5brYSxLc+yYDscDtVC0A8i8pt7A18nNeIHL+hpkguQ2acHj80MLwS
         ZIavaPhnCCzL+sF1nBTufOVOQ58brb6Sr5uzSbz/lEEVCDwZVJvGbxho6w8jRHkDBGV4
         ezqpEvcfKeByOZnlM+yqz4ygqtSj0Q5cKqvTIJ5lCxPQmHJCAoS2BV1eN8o4HD2UBncF
         pPT9o1A43Hl6FpZBceoPfM4bO1bZylyzEOY0d5h8h1KjC552S2Tijo1+JR3yt6uc9xrC
         a0HnnAi+AKSIOVH1rmiy0Dqe65P2jNaxzp94MrYt2+gjnysME7R8ImZkyyVMdgYxx+oi
         4SRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMCLNJ9UN0dH02edcGyRDo+iFGoVk38+0O3CiEbiEyXWJXRw/sx34cMuuXsT5LNa6avwOQFKdTkpMckDAIcItE@lists.infradead.org
X-Gm-Message-State: AOJu0YwG7zGj+IJ5FPnUkODFDWR/T7cpX4O4o43opN/oQMx/bJzMLLuP
	+jIRDTCln6zhJBI6FBjxb8HDrry27OVPw828mo3eFM1wpx1JP/INv+DZb8IlJAYYw6ulXYVCMZU
	kNg3G4wzp9Y+niUuQdNt240ozQ4RwOX2bGV8kZa+DhZwH4CSH8sY7+4a9TYu/PUzTOIXTwhyp67
	ZEvw==
X-Gm-Gg: AZuq6aJrz6ez5S7h68ygbKNIvpldyGYYeqA4eCUHyKKIamnp87gA3oSt4HzhGoS7l3y
	eAwxNe5QzX3oCmDGBmZAP6WfnpsNgj2HU/rQE2MJl75njpXstXpvdrDMNRJNAO2B3/jnOBFMwIT
	Gna1GhWsF9XNt7QrCD9m3ZEkezPYr8S/q8M8AJtqI9b02ekQ+lOgI2XSrqqCZkOrlEO574z7xy8
	XEplgPUCy/PiGw4KlrlikU1rIgsfCY36vpM4afTkpBC/wkA0YRtwgrHoRkB4u6Txy7HfFvNN875
	tlujI+Kbm4AghWZkInuOMYTQcKkmfYHkaeKw31P3iZf6BfZw86BBKT6/0tqB4TIoScxCl2aRPCw
	+pq5ee4kVU+rEklfDe4I/yHGhgiE4xWDt8Y07mhNzj0UilHYL5B606XBMq4RleexrX9zjs4oP
X-Received: by 2002:a17:902:fc87:b0:2a0:9a3b:d2a4 with SMTP id d9443c01a7336-2a9245c1465mr26132605ad.10.1770111206481;
        Tue, 03 Feb 2026 01:33:26 -0800 (PST)
X-Received: by 2002:a17:902:fc87:b0:2a0:9a3b:d2a4 with SMTP id d9443c01a7336-2a9245c1465mr26132245ad.10.1770111205949;
        Tue, 03 Feb 2026 01:33:25 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b3eedd0sm162489155ad.3.2026.02.03.01.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 01:33:25 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 03 Feb 2026 17:32:51 +0800
Subject: [PATCH v2 3/3] arm64: dts: qcom: sm8750: enable ETR and CTCU
 devices
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260203-enable-ctcu-and-etr-v2-3-aacc7bd7eccb@oss.qualcomm.com>
References: <20260203-enable-ctcu-and-etr-v2-0-aacc7bd7eccb@oss.qualcomm.com>
In-Reply-To: <20260203-enable-ctcu-and-etr-v2-0-aacc7bd7eccb@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770111188; l=4485;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=001o5XY3+w2paDpYRNSmK49wmzg7ECB60KxXLrmgSlk=;
 b=PSTOMG87fTvpyqi6o0ia5EnvNjRj43E25AaazgqUn3HjV3FYjLY98xYWyyX1O1HPeUBKBkgKP
 U9OLV4555+CDKCodc2nfIetObbWtzpslO2mKHB4AGWFC9hJt1w+pSQL
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=Zc4Q98VA c=1 sm=1 tr=0 ts=6981c0e7 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=kFQAvpsttJVeTngcj60A:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: SlbJ8fuPaGY2qg54ZYVpQ0ttqMGa0cAJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA3NCBTYWx0ZWRfX42Mlaza3yrW/
 FZVvBCxgKLZ5c4JW3UWKF1mzvCNF0qnNEEITHnRwEIYLisPjEbiZvEyKD4b+PUiTKbyperoatAo
 98QUX7BDvwrS2UjeX4r76pI/RO0Hwd6NUe9vE2bSGWkVu/Bz9o0iG8W/HiS4cn6sr8fwz/ZjBF8
 DiFIw0jaV9JmCAcMiYxE9InVAPb4FFjpy9Kmuom4g457hu1noHmwk5IcYMKrr//9C9IGefeLZMm
 dMY0yRHsLObQ7Ju3t6JKRsAoSXrmfPSVPYd0NnxV/NWsoooDgbSMCsfyENSoouTqdrSvxbDTbve
 QHORz0ie7skgx5AR0Ckvl8ya5Zf+Iwzy+YF/CyzLszCc1J+KKXEiSYnXIz3tBiB/8xPF40IfG76
 UT6cZao5L588JbebiQObNCuq1PdeZga0Os6BPeYJYIxlgd9XtXcHbxKnRoUfYNc+qq2HBqm1Tdc
 fOjb3vNlAQx7QR41uwg==
X-Proofpoint-GUID: SlbJ8fuPaGY2qg54ZYVpQ0ttqMGa0cAJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_03,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602030074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_013327_782362_7A850823 
X-CRM114-Status: GOOD (  14.01  )
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

Embedded Trace Router(ETR) is working as a DDR memory sink to collect
tracing data from source device and the CTCU device serves as the
control unit for the ETR device.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 177 +++++++++++++++++++++++++++++++++++
 1 file changed, 177 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index f56b1f889b85..1781ec95283f 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -3574,6 +3574,35 @@ tcsrcc: clock-controller@f204008 {
 			#reset-cells = <1>;
 		};
 
+		ctcu@10001000 {
+			compatible = "qcom,sm8750-ctcu", "qcom,sa8775p-ctcu";
+			reg = <0x0 0x10001000 0x0 0x1000>;
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
 		stm@10002000 {
 			compatible = "arm,coresight-stm", "arm,primecell";
 			reg = <0x0 0x10002000 0x0 0x1000>,
@@ -3687,6 +3716,122 @@ funnel_in0_out: endpoint {
 			};
 		};
 
+		replicator@10046000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x10046000 0x0 0x1000>;
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
+		tmc@10048000 {
+			compatible = "arm,coresight-tmc", "arm,primecell";
+			reg = <0x0 0x10048000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			iommus = <&apps_smmu 0x04e0 0x0>;
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
+		replicator@1004e000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x1004e000 0x0 0x1000>;
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
+		tmc_etr1: tmc@1004f000 {
+			compatible = "arm,coresight-tmc", "arm,primecell";
+			reg = <0x0 0x1004f000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			iommus = <&apps_smmu 0x0500 0x0>;
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
 		tpdm@10800000 {
 			compatible = "qcom,coresight-tpdm", "arm,primecell";
 			reg = <0x0 0x10800000 0x0 0x1000>;
@@ -4357,6 +4502,38 @@ tmc_etf_in: endpoint {
 					};
 				};
 			};
+
+			out-ports {
+				port {
+					tmc_etf_out: endpoint {
+						remote-endpoint = <&swao_rep_in>;
+					};
+				};
+			};
+		};
+
+		replicator@10b06000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x10b06000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					swao_rep_in: endpoint {
+						remote-endpoint = <&tmc_etf_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					swao_rep_out0: endpoint {
+						remote-endpoint = <&qdss_rep_in>;
+					};
+				};
+			};
 		};
 
 		tpda@10b08000 {

-- 
2.34.1


