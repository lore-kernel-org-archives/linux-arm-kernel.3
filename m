Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95C6FCCA476
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 08:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UY4Hh6glklh6ZR+c8fzW6JMMCANxpzh2RiegBxLS/MQ=; b=uvo/Q4Z2EeFsIyGIkSgBjTC8Xe
	UtkM5s7o01TP9jIf5xEU1O5ha7jBaiDNdfKfgTd4hjlQuhX5vvBNk9fwYejzyauT5gokzMuaCRRn/
	sDyOnmQ16AfC/6ymwyuvrSYj7eT3L6R8Osy10ZPBIIDQCP28bz7/st7sj+EDEPHqh3i2p4dWzObJI
	LXu2BTFbFuE2OaKNMrQ1ihlokolK6Tkhf15QrFC0GZDkmplRehY5KJ7hKhlCBhqNy0avTy+Hb14Qo
	N6vhb2KPNjz0E/VvI1swJ9Ja/RsGlLz+FAuUv5IpEpp2+99biJ6DcMmEc1zrP0o75MoJnblGd8NvX
	Y41iZthw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8E1O-0000000CcYb-1oLP;
	Mon, 13 Oct 2025 08:35:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8E1L-0000000CcW7-2GTw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 08:35:08 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59D2ncvt018177
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 08:35:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UY4Hh6glklh6ZR+c8fzW6JMMCANxpzh2RiegBxLS/MQ=; b=SDBV1CE7A9mZ1ygo
	LVD1BbWDUKFIosn7lBq+FFqkQ4N9QBIka9Ztlw/Vydq158SGuXzTsk8OiMn1mO/Q
	78+YbSFQwX9T2xWG2qQCPtc7x9vrG/WjCtTkdgzF5PLWtPlmvG4xD0Cikbvyoivy
	SZIbI5P6JPg5W34h132SDQ1iM4+o5p3aEiqJWEaofib1TNelWo1TxDAicbvbXLRd
	WlHgVBiIcnuU3h62KaidIu7V2pRIFzJS41LejDFKH4gmB3k4yhC5HWrzQpa/AP60
	AwVOCAoqS75QzUPPWATyV3+oYS8H2vO7eSKfXoAziNoI+EdNnQ3HgWh36cNXNv6w
	Pd+XQA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfdk3vmr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 08:35:06 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7810e5a22f3so14308352b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 01:35:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760344505; x=1760949305;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UY4Hh6glklh6ZR+c8fzW6JMMCANxpzh2RiegBxLS/MQ=;
        b=bc6EHzXD03kofXP50LBVjj2YIZ1JhIn4768KH4vy+2ekcWAxicI4UdI38UIHfH410r
         yYDV57+E7n+gK20pC2JrSImHP6U7Wcf5dZrQkoIJ+AB46O/9CYEyoDp0SLVUlah1Dru9
         R0k6V1USInNeMjAgcibuWMVh/DCpFNpYNWCVXAYBUT6W1q4H+A92QcvCUzZLDpuhaqrA
         Lmfke4TuTO7xNiPdmw97QhPot4ef5FWQSMpoasofSRpe1SNhfZ7BB2BSFjIkM7k1CAjW
         /IS5d4L9/Zgz0CKlfL5INdou2fQJRhTTbvlAbnKDvYKWzeLJEYw2rWDa6LbGGoqIescZ
         +yjw==
X-Forwarded-Encrypted: i=1; AJvYcCXN2pmWITa7yGc1ZaAc7a4brYUotYQue8cKdGZcapErCj+H6BhEWDeqChF0dBeka+oKyZII+nDXHhCEQJ2TzDr6@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6EckzCxfReasc1gvVVKnMPt3JT6AN+Tkm5B3wy2hMkGZixQDq
	ytYWxLRRAVtjJPgGRcvP5SKyrIK5heOE0N1gbj+gezq6pJ2HOtuwucqqseOWz0ecGT1KFZRR78I
	ywaUO3HJf2nxdgA4vg8vDOZDITEAZUak8nT/4strWJ8FSsKsCyAK5UiH/1RbmvF1YKSxy/meaf2
	Qqpw==
X-Gm-Gg: ASbGncuHiho7J91wX6dNXzBYNeSi01RWzjyLpR4DPZVlr85lnYJgoMqAvP9tf4SLvtz
	6j46CnK8I4llkES3cRvTPAB8G1r5BrmnuoygKwH5uDs3Tv3QStYoF2Cn7MWgOOXdv+Wpu6vwu/2
	7GvrvZiNVCMu6ELcQJZUeKIERdBvpJwlS7OZCnVYiMz/mClr0RuBd5lHkj9pXQxsGbRoTDgi8/Z
	BUsnOzoVdStm628TaOXVzsLccbjdv3xUmTyv67FLr6QUy1chhb9pWhItBqGihuSSv6JwiaTCHhr
	mjWtGvYkvrA4bSAd8IKpyNmc8JTmXlHvquFBt2i71fbJICOM22VY0K3PYhXlIeFm5rl8nBOfru9
	zHr2P/ioy1aWQOu4jTeZUmLhOK8E=
X-Received: by 2002:a05:6a00:2d28:b0:78c:995b:4e9d with SMTP id d2e1a72fcca58-793858fb69amr23378799b3a.10.1760344504920;
        Mon, 13 Oct 2025 01:35:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGh6IE+z6Ub8yJL9ZLSqcTG59UK+YvYS9gtt6RTA329tg9HSehVJOP/AHPsZrMLp0ZgesAV2A==
X-Received: by 2002:a05:6a00:2d28:b0:78c:995b:4e9d with SMTP id d2e1a72fcca58-793858fb69amr23378768b3a.10.1760344504459;
        Mon, 13 Oct 2025 01:35:04 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d09a87asm10773251b3a.46.2025.10.13.01.34.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 01:35:04 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 13 Oct 2025 16:34:38 +0800
Subject: [PATCH v3 2/2] arm64: dts: qcom: qcs8300: Add CTCU and ETR nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-enable-ctcu-for-qcs8300-v3-2-611e6e0d3085@oss.qualcomm.com>
References: <20251013-enable-ctcu-for-qcs8300-v3-0-611e6e0d3085@oss.qualcomm.com>
In-Reply-To: <20251013-enable-ctcu-for-qcs8300-v3-0-611e6e0d3085@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Jie Gan <quic_jiegan@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760344488; l=3935;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=Z4+oQgS3Jbl9cg4D0kgGb6/AOBj9sZjjizm/su2bu80=;
 b=+tHHXYONYDyeaQOL4Oq0D+PjKS9t/mdKnreAlUlLeIDMJ77IIj+8e3wWWK2/T3DxYKV/aR8nM
 KosnCPeugclDke6uOYU1reFxkMEaiBOnpFJ6anQoUVs0vc7wOkG0XdZ
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: BNRfxk4wIwnXammLZ8xCNcBYyV4FafAd
X-Authority-Analysis: v=2.4 cv=MrNfKmae c=1 sm=1 tr=0 ts=68ecb9ba cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=xJyy5nzPNu-aANFJA0oA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: BNRfxk4wIwnXammLZ8xCNcBYyV4FafAd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfXw8c3zyBaPQPU
 7v1joHlPzl3rt+9GtkQGpLQWmwNn73fQHI1vPIk+myOgIn2rXGP5dwYHuePSPIbM6EDT30EJXj7
 CQ5imWQJGsbqB4aLW92NYWOgwZt+/bKfLEuEvng2iRN7xHfSlU93U/D3W6rlWgdVyExw8B1u7Az
 eIlLRfCQjTC8HYeNEzYe0D+3oSdvJzMlS3N6WIN1UW/BpJvNO8OcvnMRp1++BHC4I35AVjupRw7
 zRI1VgQxYqw0/XbG8xkUfN59GNIWZPSGrpWZctAk9ouZTbJr+N+QkITuxtIsZESi0C/r8Gbczix
 AG+BE814Fvty0pv70AADI1tNPsZulPZ2i3xG2c5KmJ0Lpio5wk1NmX4GFInzOZGrflpyj59jcU/
 of88HRSeDmzOqAjBg3K34nixuvW2mg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_013507_723866_18F5DEE6 
X-CRM114-Status: GOOD (  13.05  )
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
 arch/arm64/boot/dts/qcom/qcs8300.dtsi | 153 ++++++++++++++++++++++++++++++++++
 1 file changed, 153 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
index 8d78ccac411e..74ae32bfec93 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
@@ -2482,6 +2482,35 @@ lpass_ag_noc: interconnect@3c40000 {
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
@@ -2676,6 +2705,122 @@ qdss_funnel_out: endpoint {
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
@@ -3105,6 +3250,14 @@ out-ports {
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


