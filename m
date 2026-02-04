Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D9AFE8B38B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 02:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4D/Pyik39IZpQuC0TtLzzBzYfy21GJ9iHitYHpNajzQ=; b=YmsW3Mi8Mx6t+dTfNwulhjDbSM
	qauHuglDpZLEtYZNJBTYlYClC5uGGZpqlq3/3DmcZxoAG8AicrB0ZaAzfsRLFXV+DJ7tCY2RkjWqZ
	zBtO755pOzUWCyIjWYRFwnHCs6MT2Ebp+Ejp8NJPt4iI0KfaMXTjD+pWy9GJT100yysCJJ4pubREE
	TkhwdCchx8jFlu4drl2wgS0mmlMtvqZySuv0l1bNLCrwGAlHEGs8Uz/pyXEKyW/3qEk656oHRvPPN
	zi2y/p4pMWtJmqcpWz1XTvl4ncBf93Me68vhJPRlfvvGEUitGezInnZGWOmv36/mg1eT9xH2ZA0Ve
	+JajYRUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnSXc-00000007lVG-0QDE;
	Wed, 04 Feb 2026 02:22:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnSXZ-00000007lTf-19OZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 02:22:50 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 613IlkoT4122714
	for <linux-arm-kernel@lists.infradead.org>; Wed, 4 Feb 2026 02:22:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4D/Pyik39IZpQuC0TtLzzBzYfy21GJ9iHitYHpNajzQ=; b=fIBuDiUpHxybXRkh
	txqyh6SigEhX+B/b+RK/9a35brTWwFFWs0R0opeFZ533JrsHwRagWVA6xXBuKUK3
	oHYEP/Y1M0dzn/QmaNY0K94Nhb3V4RpW8cllWbISg2+R5SIPdbONMnzR7YQcxZy9
	AghXCE6K3ZncTazImtA8k1lCASyJ8lwXnNVGm4FEO8NsFYwwP6cZ1l0mzvDZRp6s
	7oQpYDSXIDPhuNau1Y1JrCLcL0URBsNIEJy4SYy9yPXJR5DGe7dBi2GeElojQe+f
	FuCxug71YVF+jHqivWyQO+32ZG5JSsiKoFHd/zImqCJVXJBteb6HBqjSm+ppOtE3
	ZpOd+g==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3kbkj5r7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Feb 2026 02:22:48 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82371886e58so223552b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Feb 2026 18:22:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770171768; x=1770776568; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4D/Pyik39IZpQuC0TtLzzBzYfy21GJ9iHitYHpNajzQ=;
        b=f4tQECXr10WlSyI23tdzk09Bl/tgQVrSoHSbU1ty67IAVUFGHp86NCawTxdof+ePLj
         qNcCB3RcHQlIt97+jozYs/1J5EeCnGYDt6iNi5ZbnseXBqstD8oGE8if86oIDq+bIha3
         CvybvAVM8E7hw501CqL7+be17tsI/3ClfjRgsNyc7fXXsWOaTkbQO+MlWsg4txc2218I
         ntMdJOiU9TgN1hSnxx5QxLXS8rmtjbQACPYP4+9R+12NxosOY1WSitw3O8CmcAYKtDVs
         6Reytaz2Oe6U+t69cm2iD8lWMMk3cxDXA+NW+MhPnL0UlvGyqiNbIu2E8bU/N2FM13gK
         4puA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770171768; x=1770776568;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4D/Pyik39IZpQuC0TtLzzBzYfy21GJ9iHitYHpNajzQ=;
        b=qdQurkmNBhvN82yoljMieQ+bGdyH6VHs3U1xKpn4p3n/IOm6k7rxFLlmMkuYPiYIcZ
         kLrTDg+zYlb6l05ojUu+oOnrklMOoCFqt9kmVL+PRBiJ6uBn5s7SpX2uU9zvLOF1zHQQ
         Rqh8yL5AuUSJy9BO5TeKQyvzdgVgsuhYUMU8o0HWoGWS2Pg72dIclIJiIHnkn1eb+F2b
         3moBZRBrbeUlw073BnN0UZ5vafV0rwMBu6sEe00HdBjbGIhGacgFqM5BFe8YbURSG9oI
         n7nHyuCkAKqRwAVhDaPu6erUG8AQ5arwY6sLkj9Dw11HvCOkDPy57Nqo5Z1r1IBIrVq/
         rLpA==
X-Forwarded-Encrypted: i=1; AJvYcCUkUXgJPyAJVSYlZZvBkeNE/9zcxjjX+3a0s2suUFU/OW01at3CmBy9y2r1in53bB/bROcUTMVK7DjPCJmVuAMh@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4aQ9ckc0rCp0WSi3j7kZqzMm7+GItPjrCkE3zGvM4GU6YqGuU
	EHNZCiJNxD4oqmHzZLr1UfHMT1LxLwT4xqi7BD2z5Rpt68TrJgEn1uc2qe/n4VQ5cw5PAYr07vz
	SEHpJIa0pCJUPQQTMfJpC8fr4Ce43UDPoj5DFtU49/GuppAIHzp1RKTtyNR/3yT1W+fMbkfmd0l
	tQgQ==
X-Gm-Gg: AZuq6aIITccXttvQFt3JXSSSxdTM+sYbZCqG3mdu7fAYbvVPE9g0MBDxUFq92AGCLZJ
	nf3NReKI/s4GpeekZfAZSUHK5sSNA1XyTweG/osILSmGlJyhayEHin7w5l48nz2V32zpA9Kfjfy
	/d5i8xcHXwDaK1yo9+YKDHrqseSpeaYQW2tnDDM1b/NNnT0k5nrUWj5NvIZEeQLxxJr9POx1zM7
	u2yMjKwCs/5xn1Eel08pHbi3wa0fjnGaoWMuD9k5rNFY1OUp9XRplztX0AYzYOtWykS+GRg28OF
	UyZumHESSYJ4DI5W/tk51cc3D7c7ndecRrR/O072XgGADJ3lRy8/BqUUOXuHVfiVhkmT89sNdE5
	/kDeozP5d7dgQF8mzMWSKtEAKxd6rxI6Hq+10BD2GZZdCS3smkrAIdsCJBdBoVXrZIJfbCPIY
X-Received: by 2002:a05:6a00:3c84:b0:81e:8e66:38dd with SMTP id d2e1a72fcca58-8241c79d696mr1600597b3a.33.1770171768185;
        Tue, 03 Feb 2026 18:22:48 -0800 (PST)
X-Received: by 2002:a05:6a00:3c84:b0:81e:8e66:38dd with SMTP id d2e1a72fcca58-8241c79d696mr1600570b3a.33.1770171767656;
        Tue, 03 Feb 2026 18:22:47 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8241d4a5c28sm695598b3a.62.2026.02.03.18.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 18:22:47 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Wed, 04 Feb 2026 10:22:03 +0800
Subject: [PATCH v3 3/3] arm64: dts: qcom: sm8750: enable ETR and CTCU
 devices
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260204-enable-ctcu-and-etr-v3-3-0bb95c590ae1@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770171750; l=4485;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=001o5XY3+w2paDpYRNSmK49wmzg7ECB60KxXLrmgSlk=;
 b=LRSAYL0rhvhIu47BE21bf2cZ137WV7u+QOHDidV1GRooXE9nQAvJRCPymhmWbJF97qfJ9oeVQ
 sdVNwbIW7oQBmzFUGCdUGpZDbVNe3RgYGpbF7B11EWxYVY0wkAB+MMt
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: bZgAWow5nEZEM0GmvNfPZeD9op9z8VGG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDAxNCBTYWx0ZWRfXyLqp5609ZYan
 bCkGsa39oa9KDgn6xLDhYkMyI/4xeloJFGoB7ME7kfBsynVhUyQXSYkdBVGAK+RGszcNkpKuP3H
 boo+rQuQyq3DrbJKZ4Q05D6J4i5vowLOTiAgTTUng1qhg4PEAcX4BomxGwR64toKwurLmjl7M40
 k7sP89Cernb/H+rN2nyuP6OHjzFe25tA0c1N75+QA9oh1RbXEsgDNhXfbxkO1HcwNoI0dR44Ipi
 tE7xL+x1uXiyW8eRkWFljdj9/l5+HUqcgohVx3d5xLMORzDIZbLLK9zpDOTlhjHheK+eMF9gZF/
 ccBaB3+quA61htP2w6/tTjUgBMeD3+YJDA4gl+XE54BVuWCqbv/aAxPaE0Cj+vuuk5mvv9O21+/
 QQEg/48lF8yQhlu7quah3TSpIPaMPALGJpoSsOS2GMHzUhfjHe9gRGO2jdhxSaDaylsdhXXBkLn
 nAtzrZtiIlcXAoT8YuQ==
X-Authority-Analysis: v=2.4 cv=BKy+bVQG c=1 sm=1 tr=0 ts=6982ad78 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=kFQAvpsttJVeTngcj60A:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: bZgAWow5nEZEM0GmvNfPZeD9op9z8VGG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_07,2026-02-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 bulkscore=0 spamscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602040014
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_182249_314375_89BB275C 
X-CRM114-Status: GOOD (  13.96  )
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


