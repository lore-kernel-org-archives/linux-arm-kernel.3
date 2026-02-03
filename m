Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0729E8305F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 08:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/8BteOiMQUQIF65nTYBAYVzMPaKDyNONfq59RhKWQ6k=; b=gIx8kAPIm9y+ey4yAJXlRyEhad
	5PZgvcQXAPTAwXk5YBI9h6ir/Qei8u2P06eenke0i59E9dfyNo5HOnmhtvTOpctZPNJ13VRJmK7WI
	rMhundh+4x0r6X5AKbL3UIVlJ474JjNlmOQmTx5hjKqoGjBCIy5fOoSmCVjtK4oH2g63PvgCrmzsi
	We8JjHwC72+LFshl2nccW6kMAmSUoeaG1CE163G5LHYViM+SmoLycZacxoUmXFFL1lOMscjB9jgiQ
	0VwvTTbcnlH27QRx8kc2vUolf7ezitON/uoP/4tyU1GknNqm4fJ3kzMoF3Jt1nPmfl1EcXuOxz3Lp
	csl0Zo3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnBT5-00000006Hhx-0EvY;
	Tue, 03 Feb 2026 08:09:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnBT0-00000006Hg3-44NY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 08:09:01 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6136DSsw2848579
	for <linux-arm-kernel@lists.infradead.org>; Tue, 3 Feb 2026 08:08:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/8BteOiMQUQIF65nTYBAYVzMPaKDyNONfq59RhKWQ6k=; b=ofmQk2d9sujhHeln
	XGR7XTN0v2Wk25d8ucoOLTkjW2ONc1GGuoA2dw/Ujm5IboQolhh0NVDuioDh13Vj
	Lh+VkO0+5d/Ke+owdkVSyHh6Uu1o2NqVXDXo5VvBg67Wrgb9QX9IfO2RYBeMDyBN
	X2BmHpCTYVRNVQHl/jfXy7r2FfqgRlFiWix20wFIqEOl82a1BOEISxi5dogeZxFR
	x499iALL8HKaS6ky5W69RT5+IZNm8b3TdRB8GdE8O/r5POgkcbPXtsRri8bZPYBR
	EVA7MhVj8cX3Fa22q8d76/q6A6G2gkrpfDF29gv0YTCU0Du5gDTAZahvK5xFZL5D
	0cpRzA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2tqtkjf3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Feb 2026 08:08:58 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a8f8c81d02so27534305ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Feb 2026 00:08:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770106138; x=1770710938; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/8BteOiMQUQIF65nTYBAYVzMPaKDyNONfq59RhKWQ6k=;
        b=S4uwLBPeUs/kodf/NJwHtIKC+0M6jZCPLkV67lqr0x0eOe9lMqYwzlz8ATEou3ZSsU
         fvTOaSDBjPk1wKqhlC9nPMsDFZRQROAIQf+pkQ29pMHs+gTlZTPFpwjZerDvcLHryE7c
         fk4QkDifcGfssNYHWD34LLRMsMVHFEKZ8/Dj9DEuQz4FsGHfVPPz8gTL3spNYMIdoyzu
         a+KDTnR3O1pPWRPe70RR96z3Mz9VZ8QN2ikfyPuEmNqpZmsg1eF7+L8sRd8Wi7fYBtoN
         x2P+GF4ecpF4anBSOkhfHKqQqAzH7o+VNgBiut6PMxgwLsWBIP5WjS51bpoNPJrxQY5C
         uqaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770106138; x=1770710938;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/8BteOiMQUQIF65nTYBAYVzMPaKDyNONfq59RhKWQ6k=;
        b=gI/uwYolVSOkOYoZyns6fDbvaoEHLo2hPbQnfVcj+kgadWYeuc5rZsbsb+o5N5OY3w
         PXXaBLzrctfg1fryuXWPqVwD8HYMAcnosohUIYo2L2iJr0UJLNwAq1Mx9/0mIkVqJrH4
         2tzHjsWxKCrAIOM62t864bYwLrMb7vAsVzPVKPAOQn87ihulogMcPV/k5T0jM1cnodZb
         etvxYFdGrToUbm1ulktjFB3CiXxzqGeQu+tYRqfROVszRVIgzuu3QbXFO/80aYMLFm2p
         u3Wh4GhvS5OsJdG2gUVmWwgzBacnuxXEkcDg5lbMfZ+cs8UX0vaurLyyzvicmqlqs5rM
         OK5w==
X-Forwarded-Encrypted: i=1; AJvYcCWmN4oq5+nt+wjAeW9b+JHra42w3siwE6+YSjfU1wqtdZCJx0EdeIrOPoH45ocHVJyfZOU9DFSzXE1FpOwdmT57@lists.infradead.org
X-Gm-Message-State: AOJu0YyoU5ehPClHhNEdEiAFjbMhfaW3aM7Y3gqVqKvlgXeeHcFgPBvg
	2zXA9Cu3dSBWOaCjdECi0SzixfbKN5Ht3MHvki60uxhw1UiPb1PwSbS0/Jm1F17PxL55aLwXpGc
	tdd/WjTR5eh2kIFxzQvA7tn+iMJ641xr3+okSYXbAeNa6mhnvG3wy+HWsqbbWWCThDiudpaJkOU
	GKRQ==
X-Gm-Gg: AZuq6aIOcY9DftI5hq7IfxaQSZAJUcPjkwXXk1RwsOxa1zRTlSiGyR3kg9Z40Ul7cpA
	VlnTgT5W4JL6kimCVoQVbpGm8jk0XgTVCGwIQVfvb/xBPjE1h+nr6UEWAEz36ofHN40fkFAYhU9
	lGlWIC98QbrFumdN1oKo73m6IgvE5Oqhafjtu+Y/Bwn5/Sf/R2VzSrAP0mjLwXgV9fI4TTV9Hsn
	NH2Xh1F0EUfQvAk1QOFA9fy3s6UADKS8dqzeCE3pQSK5OYITQqxecO8C57BkBQKC4SIi1J2uwKX
	hDCDVdSZUNHuohhpsVbVtoh3VYNgt55Bf59qfeKHbtFtWFYJAyvVDzoxLUvaID5e6S4Ttru+qn6
	GS48SMLchFLjqOVBolliUweOpek9vx3Zb5mLeW+cjsugEsD3hreD5x/D4O+fn8euhwvub1d5p
X-Received: by 2002:a17:902:e810:b0:2a8:7814:47cc with SMTP id d9443c01a7336-2a8d96a2ba4mr132671185ad.16.1770106137735;
        Tue, 03 Feb 2026 00:08:57 -0800 (PST)
X-Received: by 2002:a17:902:e810:b0:2a8:7814:47cc with SMTP id d9443c01a7336-2a8d96a2ba4mr132670965ad.16.1770106137245;
        Tue, 03 Feb 2026 00:08:57 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a8e512bc2asm103144485ad.100.2026.02.03.00.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 00:08:56 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 03 Feb 2026 16:08:26 +0800
Subject: [PATCH 3/3] arm64: dts: qcom: pakala: enable ETR and CTCU devices
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260203-enable-ctcu-and-etr-v1-3-a5371a2ec2b8@oss.qualcomm.com>
References: <20260203-enable-ctcu-and-etr-v1-0-a5371a2ec2b8@oss.qualcomm.com>
In-Reply-To: <20260203-enable-ctcu-and-etr-v1-0-a5371a2ec2b8@oss.qualcomm.com>
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
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770106119; l=4424;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=jlz2/IuYwpwugUkJK8inilpdrM/O+cK7IPZqI00q7tc=;
 b=PcFxVB+XYy87wJxG+AWxfBdsvE4KvdwHczaqCOjVODxZdubTvQ7JHxLVIm188H8LlZHHEE4B2
 +mLfXWPtdZdBIp+8AsjXiGdYIRRWWwT98pdS9JmUpupzhGFngm2FKcT
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=XP89iAhE c=1 sm=1 tr=0 ts=6981ad1a cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=kFQAvpsttJVeTngcj60A:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: G22bOwafh4TQXb9bfmeszE6UD9vle9BP
X-Proofpoint-ORIG-GUID: G22bOwafh4TQXb9bfmeszE6UD9vle9BP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA2NCBTYWx0ZWRfX7rGDkXHNxTjj
 uZycN9McSCby/Tc9UkGB71biGIZea+Nhog8ts1PDwn4ejTh4C8fzGi6qG1X7QBCEqtvMzxLFBjk
 7B2RM/CNAG6qlVvQaZZOqchJlfIqANooI0y3gteiCVaQhoYCXkuOzX3uc+38H9E1WDKubDVKlK0
 k58NkdLnQ+PqQZJeFbSMRit0/8XGsXm7b/IDmF37n8fLQhxn5K7CpnaVMo6N0f7ffGsYbjRY6If
 7UEHiCZIIx5jEaj2/UXwRUCvKSByhCf5HekCW4qQ5+HDXFMR1vbLMmlPVfTHJHXrX2a8SyeckqY
 qeqYDbaX9uPT9tFv8iTdFaz1M5vHUXarknpTX8DdkVt3zr42pU408f/jpkEy7mQXc8SbY28wMW5
 Yt70xA0GKmCJMHMDS2AXFGlTyEFNBoNoqNcUYlzpnHv4QcY1ZMGGuieVk+x9bhimxPpzpwC9TWL
 fJox5k2bI64npxUIWjA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_02,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602030064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_000859_026641_D1D01342 
X-CRM114-Status: GOOD (  13.48  )
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

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 177 +++++++++++++++++++++++++++++++++++
 1 file changed, 177 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index f56b1f889b85..1e39503360ef 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -3574,6 +3574,35 @@ tcsrcc: clock-controller@f204008 {
 			#reset-cells = <1>;
 		};
 
+		ctcu@10001000 {
+			compatible = "qcom,pakala-ctcu", "qcom,sa8775p-ctcu";
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


