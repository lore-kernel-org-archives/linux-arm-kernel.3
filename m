Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45325CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 21:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k13K1y4W7bk1dVHjpu6PSFA3QeSZb1Ld64NLLZxH3z4=; b=FF8fTvDpabnNuT981t+NZdzirx
	GYX6AcEq3SS89hxfD+7C1P9qi9Q0/y1jsq4QOnE9CioBRPHs/YLAyYLty9K5IrqJU5y4E/0lCRmiY
	6WYftBbi0DYnbUz+xXtGl90w3XGPEte4539yg2Se/ova1pxcbQ4cn738b5b/PBeSFmc6NQosVvfG3
	doQ2WmmVEGHhSKUA9wsjFQ9uLamEjFpSpsBB62aUt9bGZMRVhczsB9cprLcJQgJ2Xgfsv+viIih4/
	LtdyUgvDr8E2jODUB/O6c2CRN37U3LrRqwJtgv8foLMwhINnGPcu5yZBriVddYewq8Ok4QZTnOnwu
	Oe5eJYYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upZc4-00000003YMI-0igL;
	Fri, 22 Aug 2025 21:47:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upP2W-00000002Cix-3ebZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 10:30:34 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M8UMx2011140
	for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Aug 2025 10:30:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=k13K1y4W7bk
	1dVHjpu6PSFA3QeSZb1Ld64NLLZxH3z4=; b=fxZXdlU398nJoHhnBD+wib2T1JM
	+xDw6l/rmrEY/qH5C0NBvJ3mYED0mjVRYXIC+QAq+1YavoNkWfvp0rnsRkf4BQWH
	DROM7bT6kiFZ1ALKbDktAD8EZUw9eP/1nkiM6aWa6amMtsPs8MER/sB3reDVH8li
	HbmMbgzbDGdMoVFUQ84pWn9baxNiYHYC34SSiz27cKugRZIkhKzc7x8RwSTntmUE
	WBv9tNOnOkI7OFgPebc3u5RAoCq8QrKVXhKfFr0lerGWihL3C9T3LZjTMN3Jt5SY
	nUo93SAp6J7OXcqNbrQwJvkmtKR5v5Sbj8KABjyTlQebbl2KBMgEANNY+Fw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ngt8eprt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Aug 2025 10:30:31 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b47253319b8so1574060a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Aug 2025 03:30:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755858631; x=1756463431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k13K1y4W7bk1dVHjpu6PSFA3QeSZb1Ld64NLLZxH3z4=;
        b=GuzUXDjI++PX0l5LRfLihA61EoQMf3+NUNhWdjBkrSzxvTR5yCS4TP4HoJ5SXkaRtr
         P2eWAzbLE/mQ5RIdRiAAVaS6cFQaWeGijewJHbnO5LoxLUpPMRrZpYlxxniFnjngbNa5
         GCrEKz+DoMVlYgNVKT+uangiKx0WZiIBDwVyTwEs85yjz4La5kjlYSx8MlEkbvl60+o8
         6vTB37lppNr+OqCu9w5Y2BnxoU6npnsgFoljlM5mdSDJRDnEtLJx4tJPQnGzsRse7cjR
         4SfuXUOSvVv6njSVhMcuujOF5hIr43tSPNv85pKkD9dVCKBzBmYBirT6F72x8ua0obrD
         qEwQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0+qzjC7X80MSanMugESeOTicDDkA2hVQ7Of7LjeCC2IKNKbP5yBa1N525xJHP56sASs7ABEydb/+qUrM65VDw@lists.infradead.org
X-Gm-Message-State: AOJu0Yyxz3O24WODFFtgSBbNfYiJQ1z//+lZkLaZvwTY/RzhZjKTXvVj
	fs0M9sfoSLJ+oPgQaCBgNF2rddf2eahtIjpH6lpHIJIRX8KySkADIsgdmgUVd3joEMENgapf1lp
	1ePfHjMgwU+4hyA5O2gYUKh6JfyGh6GVxnYSnMxiNIu7+Mrux+rOBzrN6s+XdPNOfHPmybqRFss
	UlwA==
X-Gm-Gg: ASbGncseZTwuczctejNR1ReJZ7asyuFMxY+3Ng858Kr+6FmgppQHScXdy6G7jAZyivI
	dX9YvEC1rb/mqeVeCzzQDJ10DHscgc4SR3moMG3HJQSHVuFWElmZcnElt9jHmNcVAjcE5cKKxor
	5lxBL32wAFr9UypVL6PxdWyNVVtzfVkOqgF4nAcMi8ckxPCc9krxcAI2f3AU4NbtRFZcLSxGhn1
	2W15udzKCICy0quScL1q36c829NZFbbBmOEZaniJa7n3L4DowCMpxjRVJEfQMJOZ71GXx/J3ch5
	nIHfg/0OVuauf8LsRZ0s0oMxeLoJBo3ClInpD8WGQ8RCsflcqLnV+BFhBMm+Pc4KmTBzOrZ1Uvi
	MAWJKBMHgjrysb2ozwo29
X-Received: by 2002:a05:6a20:1594:b0:238:3f54:78ec with SMTP id adf61e73a8af0-24340def5fbmr3825807637.46.1755858630399;
        Fri, 22 Aug 2025 03:30:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFVlMDlU6sV9lQpDsihzPt7GlkamAV4d2zA9RgA04+j3Ibuouglgjezu/LoQBnFhZnLmMuvHg==
X-Received: by 2002:a05:6a20:1594:b0:238:3f54:78ec with SMTP id adf61e73a8af0-24340def5fbmr3825768637.46.1755858629955;
        Fri, 22 Aug 2025 03:30:29 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4763fec0e9sm6825196a12.24.2025.08.22.03.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 03:30:29 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlmao.mao@oss.qualcomm.com>,
        Tao Zhang <quic_taozha@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/3] arm64: dts: qcom: lemans: enable static TPDM
Date: Fri, 22 Aug 2025 18:30:08 +0800
Message-Id: <20250822103008.1029-4-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250822103008.1029-1-jie.gan@oss.qualcomm.com>
References: <20250822103008.1029-1-jie.gan@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDEzNCBTYWx0ZWRfXy8OGoY0qktoj
 90BZ+6NFkNmeA2p1KSdpMpOKumTXKq1gmakyfOFkfyMKReuib+3X8NtClFx36Ew31U7e9HjNLMv
 hggcmPo4Kt90hz2MLjfX8FxCM6m4kkz8zISvDSdN16kNNHSZ/gcCLRW+cBzEYpvVxSjuXJ8z3J3
 49t8bEBYBoRTunz2f/HzVzteLcH24NfIqvvM8Lwqo0BUgP6zQUYq/shGdqaPN3Zysol/xMXlmDB
 DlGwRkXLRe7gVhMQR+8yQNNLCLIVKIf+InYf1kt+ud/D1IyKGJb5UkPAdmyt3HO9EZIBbT8mEnU
 w4z3jhGFYoIGHPJYemKpRqtOVmZJDg6tmpmUR0xpWyiku7IOj6vMXrHTeib+1K6uEsnVWe2+o9X
 Mgvo76b9Dl2BMGSDnLeqlMWYlfHyVw==
X-Authority-Analysis: v=2.4 cv=c/fygR9l c=1 sm=1 tr=0 ts=68a846c8 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=8Krfq1_MhNCW99YIMDUA:9
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: fUBxfJ9LE58uAqidCLtHv65wrWkWAn79
X-Proofpoint-ORIG-GUID: fUBxfJ9LE58uAqidCLtHv65wrWkWAn79
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 phishscore=0 spamscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200134
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_033033_034272_226518C3 
X-CRM114-Status: GOOD (  13.03  )
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

Enable static TPDM device for lemans.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 105 +++++++++++++++++++++++++++
 1 file changed, 105 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 64f5378c6a47..077e22b28279 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -2959,6 +2959,14 @@ funnel1_in4: endpoint {
 						<&apss_funnel1_out>;
 					};
 				};
+
+				port@5 {
+					reg = <5>;
+
+					funnel1_in5: endpoint {
+						remote-endpoint = <&dlct0_funnel_out>;
+					};
+				};
 			};
 		};
 
@@ -3116,6 +3124,60 @@ etr1_out: endpoint {
 			};
 		};
 
+		tpda@4ad3000 {
+			compatible = "qcom,coresight-tpda", "arm,primecell";
+			reg = <0x0 0x4ad3000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@10 {
+					reg = <16>;
+					dlct0_tpda_in16: endpoint {
+						remote-endpoint = <&turing0_funnel_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					dlct0_tpda_out: endpoint {
+						remote-endpoint =
+						<&dlct0_funnel_in0>;
+					};
+				};
+			};
+
+		};
+
+		funnel@4ad4000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x4ad4000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					dlct0_funnel_in0: endpoint {
+						remote-endpoint = <&dlct0_tpda_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					dlct0_funnel_out: endpoint {
+						remote-endpoint = <&funnel1_in5>;
+					};
+				};
+			};
+		};
+
 		funnel@4b04000 {
 			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
 			reg = <0x0 0x4b04000 0x0 0x1000>;
@@ -3388,6 +3450,35 @@ aoss_cti: cti@4b13000 {
 			clock-names = "apb_pclk";
 		};
 
+		funnel@4b83000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x4b83000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@1 {
+					reg = <1>;
+
+					turing0_funnel_in1: endpoint {
+						remote-endpoint = <&turing_llm_tpdm_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					turing0_funnel_out: endpoint {
+						remote-endpoint = <&dlct0_tpda_in16>;
+					};
+				};
+			};
+		};
+
 		etm@6040000 {
 			compatible = "arm,primecell";
 			reg = <0x0 0x6040000 0x0 0x1000>;
@@ -7578,6 +7669,20 @@ arch_timer: timer {
 			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
 	};
 
+	turing-llm-tpdm {
+		compatible = "qcom,coresight-static-tpdm";
+
+		qcom,cmb-element-bits = <32>;
+
+		out-ports {
+			port {
+				turing_llm_tpdm_out: endpoint {
+					remote-endpoint = <&turing0_funnel_in1>;
+				};
+			};
+		};
+	};
+
 	pcie0: pcie@1c00000 {
 		compatible = "qcom,pcie-sa8775p";
 		reg = <0x0 0x01c00000 0x0 0x3000>,
-- 
2.34.1


