Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FA13CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 07:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=11c3KbrjHPgiU5BclHH5SfdYsQYYwt21sbw+FWikq08=; b=BT+QyhFxXZuSjyP0AvQEbcgIOj
	uYU0Q11yOXo2XL7hloa6n//24VDhNSIRoM4RB2KDNiy2Y37/OAbK5bNL/e6KH822wnmEhQZWYQkbv
	W2g8yjeLmR4s/KXjySAIoHMnJMzzYxM0chVU0H5/Tz3aaauIdkjy7/PFhRfw+r0x6U4OxozHsBbdP
	m6UXsOndZ9OT7r/L+Zt5XvRBe4hklMlf7kh9koeGObBse9AH7zmdp9BOxhvwMlFcHIDsIoNzVUVap
	ta0md/Kxm5CSYCrcG0XW2w/sswDiFxgvZvPCn2+AnIRQjJ85QCkT3OBXjcwg+F3xGSfaZ64OL2uR1
	ojmRSOsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFoeY-00000009KUZ-1MlK;
	Mon, 03 Nov 2025 07:06:58 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFoeV-00000009KTx-0boB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 07:06:56 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A33Dgk41941400
	for <linux-arm-kernel@lists.infradead.org>; Mon, 3 Nov 2025 07:06:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	11c3KbrjHPgiU5BclHH5SfdYsQYYwt21sbw+FWikq08=; b=FynWYY6fgsE7lM1b
	1yx33gZKolSlLLfQF5/ByEl61T8AoYvPWEKL68uJuu4X4yN+Os/0m0qWfEXNFQLx
	IGzJfIfCy2w6QLBFIHkRbSTf69bbzlXbblRIApme3HchxPUZoESre0SjTNPGJZcd
	78C+7YXwpc3A2K4Ie1CeBNTeOiqJ6v6asekgn2D0WrEu37P2i6nAUn2PaYGMGuhS
	CgzyfoL/Pgbir5yEBiURL2/RBFbxLZDEljUUxeizU96GV6z1/eKQtBJ4pyv8R0aj
	DdbS4KJ6nkcl8vhMINq2j5JCvqGnTAy34KAQrG0jopy99w8GUUI68+IiH6rNdp/Y
	0DzwCg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a6m9w8g2c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Nov 2025 07:06:53 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-33baef12edaso4933708a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Nov 2025 23:06:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762153612; x=1762758412; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=11c3KbrjHPgiU5BclHH5SfdYsQYYwt21sbw+FWikq08=;
        b=h71V70MA/Y6Ap1hXh+dCe7sUwq9cUSPbEeF1AWTwUsM+/Lnno3uLc6dJyIjPtf9Hx4
         pqQ8nZN02x7P+3KvEsSgxAYwg6H4F1uiE7gs63KWV11riG4iHa4pdDhIotDFXRYl/9rG
         MFjUMEya8C0HAR4zk2G7vOVBPByEHRx+y6vLK7Pq4/4R9gTs7gjbqrb2z/6HQq/UFQ5c
         JOV7XEQUAygXENd7IjdVLD381IDI6xDNmJ4LlGsxGmDCRVCQmPRi5QWCOKl1MQ1Kpzv0
         ueBpyCMJZ0jsdpt2C/DTWu/+3E5G/vi7wH6/ndbIPcAfNbxvAnABXcAxeesjMeWzrbUv
         6bFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762153612; x=1762758412;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=11c3KbrjHPgiU5BclHH5SfdYsQYYwt21sbw+FWikq08=;
        b=nihyWxjAvWy3obADAS2mSNyxLJrwOGtbUTaGkaBj7swejumf08ui/WyORNl7/okCv5
         boTAoZLpXRkKrTjtnI4lXdk1zFCdm0JJmHZGSF0TmI6b7FsgHW4SYgiW15x5THEXnaw5
         Kv9wl+zMVMgqmwRiqqGY/q/bSFNG528RznXScZH3ECkWxf+xft/VOGm8YI+myfj+RJ8a
         vikfgy1eyz3OeUFOnAVyssDR1zn+3FX/04VyXk6sXPEzshCbi5ICNXzU0KxXoYimK9Tz
         SZ5iibMNu5fBz0DGjZ2M3UZFOe+2/BBAb9nPCjNy1BRbJRDUYhaMhpwW702szuaGaIRY
         zzHg==
X-Forwarded-Encrypted: i=1; AJvYcCUkMJGY7Rj2L4Ubm8Zm9DiXtjSl5H97KtpKkb2kIN2RPmL2Yfz3mSi9S5JqESr/U7hS0PhItvAbk7dcSEVlOfqG@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8jGU/rinnPImL8cyDAOKX6L3jw12HCyxt69h2EAUji+TTqvA6
	AcT0E5TRAlJtsEsZTu6igON3s125p7DCd3wCaOUjHdejPUpFKZYQihPf6BwJnn/QCVxH/j3qka8
	IzjDOoRhD7r9pFdR4AtCOAA5jNjRvnY2UTL4oljEhroAIAH4wxb9WCqrXzuHdskxhxVWSMQv1Dx
	yO9Q==
X-Gm-Gg: ASbGnctc6jm8q3p9VeuQeC/MjfLqkqoqxX4dxBx1g6smjksKTIOh5zEw6qAjIcCw/3c
	NkLI6LljSZfbJHdkqwZvFGZXkvz0NKk2vXuxpC3Mt5rJggh2BVUVJTE+p/gbDjdrrDtUJe8kqdz
	zMARAcX8fUVP+qSPdsZfoUkLvK2XXSXWuGHJnjA8VCq9Obe2XNEswbsrLYaoKqd2fTfffRU8sJM
	T1wodjW7u8G3OPYwZf7Hy3egw2a8m51jr5+W7Oo3+RsU+YeoIxT3PitVVFN+0h2XTfrImy7JP3Z
	QWXLz8Oo8nceNTZRDuJH1DzXtYj59aogvwkalt46LjkTi2F3Aavaowhk3TZ7twMPYGBXhKMUpCM
	YEvWIUv4D4Mnkynwxus1HApGjQRre91ZGMucC5hTsO1ZN0H7tjfhiA82p4+n6HQ==
X-Received: by 2002:a17:90b:3512:b0:340:ec6f:5ac5 with SMTP id 98e67ed59e1d1-340ec6f5cfcmr4480118a91.2.1762153612384;
        Sun, 02 Nov 2025 23:06:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF0l22Dq0T/IasETveP/YFptHxCxmhpbzcfOxByTl+bEQYHpqub71iYiBm4TLNep6pPcUNFKw==
X-Received: by 2002:a17:90b:3512:b0:340:ec6f:5ac5 with SMTP id 98e67ed59e1d1-340ec6f5cfcmr4480094a91.2.1762153611843;
        Sun, 02 Nov 2025 23:06:51 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3407ef49da8sm5808704a91.1.2025.11.02.23.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Nov 2025 23:06:51 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 03 Nov 2025 15:06:22 +0800
Subject: [PATCH v4 2/2] arm64: dts: qcom: monaco: Add CTCU and ETR nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251103-enable-ctcu-for-monaco-v4-2-92ff83201584@oss.qualcomm.com>
References: <20251103-enable-ctcu-for-monaco-v4-0-92ff83201584@oss.qualcomm.com>
In-Reply-To: <20251103-enable-ctcu-for-monaco-v4-0-92ff83201584@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762153595; l=3931;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=jPRvo8AxN6ZXO7cz0KQaS/sv2ld0a4D/+sFPdm3cEx0=;
 b=UiqqFcnAt021/IodBx0c94um0OoWrMu9IazVSkrxBTI7ECq2bmxESxKNtPy2HBGxA2THKlqzD
 jgtTLzuRmbqB+xdzThilAsdrQR8916cbhK6E8e9YDFn3spYBbQw7eMA
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=P7Q3RyAu c=1 sm=1 tr=0 ts=6908548e cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=xJyy5nzPNu-aANFJA0oA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: 74c9cYJCxpvODweOExNmgrnSR0hctPIN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDA2NSBTYWx0ZWRfX5vljUJLW38UG
 c7UsYKKeDMITcNVXUtReiqgEc9bs/uYKrOCpeiPepDtD2/DpEFsV5SmdZGeW0uJq9qkvnSd8BrH
 wJNn39iFkITZDy4E+y04aUt2c8/8Dh7O04J2k89NiibFvR8rXeCcZYVedbxFzvt7ErTF6qqW3FG
 TNzs9WtXNNiQ34OK+NMaUhPF/um4IB7adnldfdwr03fJTk0nNqPP0W+ATePM18nxFPqGyYUdP0F
 cwa9WkH6dqG+QDINcKIA+ERXCmdkHXipWZiKZzQC//nsy2otjEWof5eQ/bqjIwpmKw3szEO3Mfy
 Fj+hfJ4C4iy4SnCWjCsgPpdho4Mi9wLobU/5d0Z5vAEmQchYd4C0m+jw65lKtmpI4eQPKOFErw5
 LJknQq+QERfsBO+v/V8BNk3m5/15kQ==
X-Proofpoint-ORIG-GUID: 74c9cYJCxpvODweOExNmgrnSR0hctPIN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-02_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0
 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511030065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251102_230655_318377_39FDC0CF 
X-CRM114-Status: GOOD (  12.64  )
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
 arch/arm64/boot/dts/qcom/monaco.dtsi | 153 +++++++++++++++++++++++++++++++++++
 1 file changed, 153 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 816fa2af8a9a..1966dfad2dcc 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -2483,6 +2483,35 @@ lpass_ag_noc: interconnect@3c40000 {
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
@@ -2677,6 +2706,122 @@ qdss_funnel_out: endpoint {
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
@@ -3106,6 +3251,14 @@ out-ports {
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


