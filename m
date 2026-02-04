Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78D4EE8B386
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 02:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R0dHaDvrRvPS5SOe+bzZlfj8TW6nxvnK4LX8wAbwiXs=; b=iXUPFkZA5MBErUfpGJ4kWY+ffy
	oYI8PwVGm+mDkGmi58+VQS+2xOj5ICM1Xr6yGrNXd3tjyHRxVMpG2HOGDwLlnDiZShdyt2NxWSGI3
	m5hwPWdivkBoUTG3tUhqTdTgY5ezHLD/goR7vZJ0u+S4O2mE4HeW3Ggq/y0wkDv7ZjfrxOlnE2Xnx
	KGTeb5aQKJA2CDfUw4lyxl0dMhUtTbJSdvJPaiZblXWC8Rj653VkyqqMC76mQ3TQf+NWCnrsMoVnT
	AWQcd1EwCMwJ3hom2RPRH13N3Ljv8OkN1ZfimjlAaRq5XKNJFK1a7/h/CIgUEa0K8vObujz0MGlea
	6fJAKR/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnSXX-00000007lSX-19RL;
	Wed, 04 Feb 2026 02:22:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnSXV-00000007lRs-0dWG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 02:22:46 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 613LJnv43515189
	for <linux-arm-kernel@lists.infradead.org>; Wed, 4 Feb 2026 02:22:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R0dHaDvrRvPS5SOe+bzZlfj8TW6nxvnK4LX8wAbwiXs=; b=RK2PCf4EsEBaCL19
	AMOZF3IfSvxdZtYA3uM3jVg2alvOP1i5yDPfbn+Yjteu38yIUpwuQ/M68KNQwl9C
	iOy6XDVsdn3r3ozBLTsVN4aR6avqt5V9ZWcqiHLZJDnLyLw/q3lX+9gKTUrnOeVa
	+t6bUv2WEsQtRfwn/NR23GbPw59dYKeqtU0ZThZizOgBgKLnRAcL5Bxe19+af3D/
	Osk8aQbmem1XU14IOzAAUB66jeER7CnNULIOL9/PNuKnYnZIk1Ba8IDBTSD35XbF
	IzfGAmVN4VfmcL3wvTo+ORjPaNXporqE7rDD4CUVNuQw8L8k8EWzROkXkn6+BUky
	kvfQbg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3ru98spe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Feb 2026 02:22:44 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-81efa628efbso6324055b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Feb 2026 18:22:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770171764; x=1770776564; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R0dHaDvrRvPS5SOe+bzZlfj8TW6nxvnK4LX8wAbwiXs=;
        b=e+JYheqoOoNqoIJ5Gv1lVxcXyOrI6iNtG974/bTTwEECoRnCI3IsW7V0gQUUdTlvLP
         Dd/2BpqmU7W6ieDtwFAxD+yELFmSzt0RNoTy4D5TIfiR5DRSYqrvNkt1DMR/fErtlZjG
         G0RxKqpvpCD/ieWQztzKMvJ9iFtCgzKhuV1vleZ7tZlwRC8h722mtaYawXN5DDXkqS8+
         DMIj/GyMNujO/ODUJAcIpzlrj9vzOKE3EU6j2CBDiMD7MKx5LL2sncTNGM6JUAmKKEUP
         ex2VKQHUz2Z7zD7nR3hlNohSPjKvWgZcnyOwQ00L5uG5BlqgSFk1LJE2zWffNZWYjlyX
         ZdeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770171764; x=1770776564;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R0dHaDvrRvPS5SOe+bzZlfj8TW6nxvnK4LX8wAbwiXs=;
        b=R34Vr8lXJrS5pd7MyNabwgARlz/jCOAMSSAApRjMlgPd/PJop7f4V6/hqOYqNUguxO
         xchaAX1Arbgx9H8yNOExswHDMuQzN//dyBiSSbipav8ArNGy+rIHuSsTYJWP7iVSzZod
         Ol1jm3xzq4CpvOsH7XXjiHxqg5X9x9jUWV2fNohcizW/9/tp7am5pSJVoXWiEm+big8C
         qbRttiaJuOGCD5bjE4hh19erw6XYQLbVTqCrGZn4SUunuMMwbo7R0HiFF62nX6HysRVS
         dJGQcD83ANoVRQozML8vjiLlmIcqupAPo3OJfjW8wArQDdLuUdgO1UDbtkxOzhd12n+Z
         IcLg==
X-Forwarded-Encrypted: i=1; AJvYcCU5hR8cqGbPPpMF00XsuYWMFe356UosVb2ueXC58GDJ9S+kK3dHyzX0Woegk3W1xQ8GVhUkwuAsbNzB6EjEXiON@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2b0RFFe2bbNJeDnW8v0nrQP+xaXX9gBC9NgLUKngG/n9f6piG
	09kjJtDGn5F+KLxvQLHshVS9U79dwOJNZ5F5iCc9v/WaaxCfM50yVZmC7W5yn5jaKhUQv5nxoOA
	OQB0+dGuYA4AeFHSyimxa2TjwZAizSx2UYLJuekLrAKkjhn4CAY90axCPIl/PwkSj5PN+q0jDd3
	mx3Uvzw83dOQ==
X-Gm-Gg: AZuq6aIWGEZWxIPLxd9WPZCVi4omL30dPl5Y1gIyrqIgBdwMfwn7IsxJjv4ELIW4lhx
	BVmyyygLEaHQhhF6X7EK2SJsOThJk119FjCyCZwEkEZYfatvDYDmgyJ20os1a9vZPgbEAi7abXP
	dZdOp1MdACPX1I7d1X630p8tJNOD6eiP38Fkj8LJLuSrvWS68MQDgLwwjP5vZxxP/mPiaFy9ghZ
	ny7yTvj0AKzEDaf4n7+DconbWYbJlfRwqLBj7x8rbL711iHgAxirvvVfGonJuwdDh1XRlwVa3D5
	W3kDJ6E5E6CErsVpT9KlI9OANOP2UHNOoTNoFstTx8XvwVi8p0dwDhg6Vj0epGU6JKBRRE0oYGE
	Uo8eGJ+/XeUb5Zx2QHJ9NRl0awGDuRG+8Xxgf8DJ1XziWORTZuDhf0+QOMeyp7V7se6WqzWSB
X-Received: by 2002:a05:6a00:12cd:b0:81d:a1b1:731b with SMTP id d2e1a72fcca58-8241c1f9422mr1517825b3a.19.1770171763710;
        Tue, 03 Feb 2026 18:22:43 -0800 (PST)
X-Received: by 2002:a05:6a00:12cd:b0:81d:a1b1:731b with SMTP id d2e1a72fcca58-8241c1f9422mr1517800b3a.19.1770171763267;
        Tue, 03 Feb 2026 18:22:43 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8241d4a5c28sm695598b3a.62.2026.02.03.18.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 18:22:42 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Wed, 04 Feb 2026 10:22:02 +0800
Subject: [PATCH v3 2/3] arm64: dts: qcom: hamoa: enable ETR and CTCU
 devices
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260204-enable-ctcu-and-etr-v3-2-0bb95c590ae1@oss.qualcomm.com>
References: <20260204-enable-ctcu-and-etr-v3-0-0bb95c590ae1@oss.qualcomm.com>
In-Reply-To: <20260204-enable-ctcu-and-etr-v3-0-0bb95c590ae1@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770171750; l=4207;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=qEpYK/03QWvL3WtM5ez+2Z27n/3QOHCo1LS7lv4T3GQ=;
 b=iowRs9Irvb+6EMSGVRkKm9fO2w1211EanmYUZBzovd0ZenCRSpaIin7lEPpOlTlswFzK+n3ig
 vAC6gh27CMqATLxex5AQkpL3KM+oRIzI4ueJ/ck+LgklPLlvHWnQXom
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDAxNCBTYWx0ZWRfXxUTQbrG1z0E4
 0gSswBeo5Z3+JPZrTIPnfuTxih1byqVzB6utqoST9w0y+ea6Sr90nE8kHcZEl7YDaG3rL+S+sx7
 bgVNZI2g7Ga2uWiR1mDq+FsdQohiQhHpa6zxYJzNWEnj6mpYb/dpwy/szKyOJr93X11c/CllVHH
 txE/Jof2YOAR41jtMzdT0Hg3uiD249wVWn3GqVn/pPj6zjri75NXNrdhb5Kh4bwTz2ipMzt3sUL
 eSMgX3cvyXxqCAY+2OapJ6w4VQImrIM9qskpyCyK5TvPt0RXAPKTXysm7brf0SHXUfRvyK9MnWz
 jSingw+qICoFYm547O1jSe0bKt+4u7QbqfRbFQH7d/q6ABcvZ0RSz/8aFxV/8D3UOc7hTcOOM7b
 07FR2L45D9/oPUKF1HMXHQn+BlRq/+PKqnAH3ikKSc4jIyI3p2ctW3oO/jM+L1jET8CWJepHQxV
 SUgmKyVPFkED55PJ8Uw==
X-Authority-Analysis: v=2.4 cv=IJoPywvG c=1 sm=1 tr=0 ts=6982ad74 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=zg5GTYui_k3rg6aU3KYA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: wh-4SZQiWTKa1JmY9M4ZeOr4cFwYr-1E
X-Proofpoint-ORIG-GUID: wh-4SZQiWTKa1JmY9M4ZeOr4cFwYr-1E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_07,2026-02-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 impostorscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602040014
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_182245_206121_D5C4D93B 
X-CRM114-Status: GOOD (  14.75  )
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

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 160 +++++++++++++++++++++++++++++++++++-
 1 file changed, 159 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index db65c392e618..2601abe002d9 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -6771,6 +6771,35 @@ data-pins {
 			};
 		};
 
+		ctcu@10001000 {
+			compatible = "qcom,x1e80100-ctcu", "qcom,sa8775p-ctcu";
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
@@ -6985,6 +7014,122 @@ qdss_funnel_out: endpoint {
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
@@ -7298,7 +7443,20 @@ swao_rep_in: endpoint {
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


