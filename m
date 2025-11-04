Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84F4ACCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 08:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gAkv7LcxBGkDllNLZTVNnfv6WbtJ7up7wJAyLH80Me8=; b=MmgwUrVVDJMklgjP136bHiCpNw
	6Ub9bfxDqQG35ME/z61tvaO+GwEQVwv914u2AVNHhDSvvPzpgdvqPvgFQB2jUGd5kDLBi3i/JTWY8
	X8DtMjIU0Ra9bgucvjqikFYCzahpZebfHHv/zjUrNTgAHaq/O1mn53iOu/Ow6pNkFqgSGSZ4BAe/A
	m+T5CG2uQxjjQ+aEmY1rd500ho0G6RMdgPOXVzVD96nxwdwyTI90slBRaGGWJ856zSJ6bqEAU6pPH
	H8ccaUoMJrcdkdok/znjYkezyrFhQqCHCrnRGLjbTCw5zDoM/MkaHJMBU5mwenwwHW9E9xBoybzh+
	V7IRnM/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGC8J-0000000BOHL-1tPc;
	Tue, 04 Nov 2025 08:11:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGC8G-0000000BOGl-3jqZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 08:11:14 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A42QaiL3682801
	for <linux-arm-kernel@lists.infradead.org>; Tue, 4 Nov 2025 08:11:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gAkv7LcxBGkDllNLZTVNnfv6WbtJ7up7wJAyLH80Me8=; b=gUFL/NGmUGX6amoh
	qXatiQlIEcr/LhO2E7XDMzs4BnFTPyjoag6P6bYtatM4g19QDZ7tkH1lNVRIoPn4
	K7ot9/6qvv1naWZcsOEbE5RBn4mgAxguAtbREofuCYT8VaFbOdkVBmjP7QScL5o0
	31OIqpZQmJ7xRB6CGzZaUTPMeWTsZJDcC09YC3KhxFwup54lDIm9Y07rzUVjpVRY
	YVNt7Y/xaaJFXjMD/LV73HdcJac9oCbst/9u6R3qxbTqnwGDppAdB1mPqYTl69Q/
	JIwujgROYkZE2oiNGXuBo/gWILtkMqtTYcOlhM1bEG5FvseuKY3BMDFC5vu1lAFP
	j6ITjA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a6xjqtmvu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 08:11:11 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-294ecd3fdd4so62024675ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 00:11:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762243871; x=1762848671; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gAkv7LcxBGkDllNLZTVNnfv6WbtJ7up7wJAyLH80Me8=;
        b=PECukBQunYQuh2JgYFvFl1aXY4p/7N8pVVmY8Pd48Mq3eRnXq1ht9zalE8EFOMqT2B
         0dgnMQJRUnwus/OIU8a70MnvILcOkcEaMylEosSAgUgLMc8xbC5OLOsiZ8vNsK9qL/yF
         mYLusbveDXaBFVGddsHfUzHtPjhkOl5H4+hB6DpAC9JDRHFJkurh+JV+ISRyzIT2lbLI
         k9wCpVfOR1P/EsXeFpBe06L0c95AWuTkVFqNHOPWXa7yv9/RW4Ck9l/QDZVqJJ2N5m4p
         rsxTuDCM3kdvNxkqQ6u+8jeLEHvRg+lC/wLmO3L+34dwohlz1WgqSbHZcjFGbbadUvS9
         ieag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762243871; x=1762848671;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gAkv7LcxBGkDllNLZTVNnfv6WbtJ7up7wJAyLH80Me8=;
        b=IPHfEPq8m9w3R5NkqAIVZYj4SYomJh8zjNk7ACEa2IypMGGxCiENv5sy6WbcimCtQw
         DvHZJQczQZ9dVk4KANgX97VRo96yzrlthoigmRkLYihmDBlpbuXkzSY+nBAB4Uo+6XGp
         w67oP72KCXSbtbBHrtch7BQVKeXDV3YWdf4EPDVCpgdrKYQHlyPoTCBl0HuamIW/dXA1
         kt03oEHijFLYJMXPmIkAf/9vI7JGKdl/CplKny7BjxVuT4LfI/ePxtf0BB1CvNyX1Qse
         uz263i5BL3sekFUYY1Waz4PKK1Yqt02RBmhOuU0HKEMNjCyUEMH/K8e6zBqd2ibdgMRt
         naYA==
X-Forwarded-Encrypted: i=1; AJvYcCUMcj2ZL2fkhJk/dZiC0mRHilVnBp9d9m2Kl8Y21E98kcDPCQ/TOb7vBy6Fk0UOrAFg3/iROS89WfHBAwJoRuJa@lists.infradead.org
X-Gm-Message-State: AOJu0YxBB0Su5t25MoTUE24W0ADdWO0nOn9TUZbYZTKO3y+rnpysiKGS
	QjWUs+y4SWf7YEtlz9ao+aPspiOWLTNirlTkiOIQLyI7idyhGEVYjJKf5hZaU9on1af2+/eu7le
	GL7/fmDCgf+w5juLq25M5phzXDImmENyYSu4Faj9+3GVi2uWSfetwH8eTrI7YMmrv22X2WcQCeV
	x/gw==
X-Gm-Gg: ASbGnctpjaW/7SHMHKXD5fSLpQ55qi6nT0OchZ2ZKQOKLbEuJBoIHcITsRIsnK3IzUo
	BcJ6oXwDJ1JL/fXg0rQKY0vEdJoW0Zrveo1SOjviF+3S2was4eBqvfvchpYXjmA+TssUKjMxmFQ
	wjuAQTBDANrnDCgUsatuqEpsWeH7vKWrKldqPz2x9uqbh/b54duT/poaheNd5MDHYYofN8qNxaX
	FbpX/8U5yFzzM1EfHSbFjfzogD1AYCSXgOK8hY/D4HwKh2CyDnLXB6sXHEGi6kRnHAsF/bgfMQL
	rZq3wOFo8DwWFna+7IfNI8QaD4047IjqrGWuns0j6yqd2E+v7S2Bcl+200OehUKvVQHPH3MkXdQ
	0KB9AXJ06M3cvZ/qjWsD6gx+krxr/6zFpzFQPbxzaNSPbZ7JhJ5zNo4X69DKMgw==
X-Received: by 2002:a17:902:da8c:b0:27e:f018:d312 with SMTP id d9443c01a7336-2951a34cc1emr212417435ad.1.1762243870825;
        Tue, 04 Nov 2025 00:11:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGXY6zDdyrmbIgczl2U0WQJakaEyR/XD+xu3IwyJv46EHXkuQZDiUvH19PkFadmgv6DKCJ0jQ==
X-Received: by 2002:a17:902:da8c:b0:27e:f018:d312 with SMTP id d9443c01a7336-2951a34cc1emr212416885ad.1.1762243870139;
        Tue, 04 Nov 2025 00:11:10 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29601a7afe3sm16755885ad.110.2025.11.04.00.11.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 00:11:09 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 04 Nov 2025 16:10:18 +0800
Subject: [PATCH 2/2] arm64: dts: qcom: hamoa: enable ETR and CTCU devices
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251104-enable-etr-and-ctcu-for-hamoa-v1-2-af552cfb902c@oss.qualcomm.com>
References: <20251104-enable-etr-and-ctcu-for-hamoa-v1-0-af552cfb902c@oss.qualcomm.com>
In-Reply-To: <20251104-enable-etr-and-ctcu-for-hamoa-v1-0-af552cfb902c@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762243855; l=4142;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=OHJv8f5AUdCdaBksnNXi7tvGi4OzSaOYQOx0PkiUqxU=;
 b=xuIwb79gX38qzdbP67hlDxW0sL2EBAugZiZ5e0ZvLV/gWvlgeSSnRQ1k2jvP+dKq6T1tfUNKA
 UCR9U9MklacAU5XtIO2fOeDCfwvz78gw0frWdCuya66BdRYuSnmnfjA
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: -O-WysJEZKUrtsJIFiuf0UT_P5wNqkhL
X-Proofpoint-ORIG-GUID: -O-WysJEZKUrtsJIFiuf0UT_P5wNqkhL
X-Authority-Analysis: v=2.4 cv=criWUl4i c=1 sm=1 tr=0 ts=6909b51f cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=IA447Ct8CvcyBBeIGyIA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDA2NiBTYWx0ZWRfX+ba5122cZgAz
 LqEo1rJgAFl2CYB+2g8DxptdVyBbK5X+T5L8DBxOjhg6UAUGRv7SyMQe1zO20k/2ogab6XtA/z9
 X4VTI73bl9KjadNioJw+A/8+yL6uhPf7SA/dC0qfar9cDSC75bZonZnWDQqsbMgGFq6peOdYkQC
 8W6F/JiERrI83cPn+Dlz3rfMPEJV6B5AWb4xyvAn4qfKO7LpDIfGe9ipmfBJuGANoZqjX/2a9FV
 hI+cBB2nc80y8Amkg+blXQSQ6cQOqb02oHXhNp/eolCsIc4/lAtImh38XZQ0K9eZ2UacOSWJnjE
 2eIG3WntMTU5bo9NNop1wxSTLCGiOtZbQwqMBeutSwp0DfoDAYODM6WtUWvx5dsA0rYFnUTArol
 37ier643wWKFgnKQIuddaedkuMRNnQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 impostorscore=0 clxscore=1015 spamscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511040066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_001113_060029_3515B22F 
X-CRM114-Status: GOOD (  14.97  )
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
tracing data from source device.

The CTCU serves as the control unit for the ETR device, managing its
behavior to determine how trace data is collected.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 160 +++++++++++++++++++++++++++++++++++-
 1 file changed, 159 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index a17900eacb20..ca4a473614ee 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -6713,6 +6713,35 @@ data-pins {
 			};
 		};
 
+		ctcu@10001000 {
+			compatible = "qcom,hamoa-ctcu","qcom,sa8775p-ctcu";
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
@@ -6927,6 +6956,122 @@ qdss_funnel_out: endpoint {
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
+		tmc_etr: tmc@10048000 {
+			compatible = "arm,coresight-tmc", "arm,primecell";
+			reg = <0x0 0x10048000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			iommus = <&apps_smmu 0x04e0 0x0>;
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
+			iommus = <&apps_smmu 0x0500 0x0>;
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
 		tpdm@10800000 {
 			compatible = "qcom,coresight-tpdm", "arm,primecell";
 			reg = <0x0 0x10800000 0x0 0x1000>;
@@ -7240,7 +7385,20 @@ swao_rep_in: endpoint {
 			};
 
 			out-ports {
-				port {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					swao_rep_out0: endpoint {
+						remote-endpoint = <&qdss_rep_in>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
 					swao_rep_out1: endpoint {
 						remote-endpoint = <&eud_in>;
 					};

-- 
2.34.1


