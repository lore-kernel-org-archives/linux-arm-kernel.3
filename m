Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD5FFC44536
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 01:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XEXpysVN2Cq1RmgHhBcEAoYNQnMTgQ3salknRUMhBIE=; b=4v41P/tuUL/Stjw1rXRUiesc/u
	3m49JPFsURsyvANb3GXziR0zgvckWjx+DilxkadLAuDUpAubyo+R/A58Hdo0eAKqpqqb4gjQLiDOr
	J9Xxj1YT1ZW6ufOFcVKTagTnYZb1qoZwqSphXYz81dR87kHtR7/CPy8vmOYHbxbGxP2hcHJrqLcOt
	UIS4DFs0T6q8wZZhCvlh5tsf2vJ8NSz+e12nXxD7KMflrLBCcUAy0P73mg+NUqoLHsQA1bCUS1eVm
	7ffEWvhV6CC0z8QXT31f9w0lc5OeYmXU4eXcYm6olg0xVscFkua0aiD2aGO+zz1VgRGLzNOyTSDfF
	7ZFBBo7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmiWz-0000000DAHQ-3gvG;
	Thu, 23 Jul 2026 01:47:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmiWl-0000000DA8r-0Kkj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 01:47:12 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N0XTkB2658863
	for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 01:47:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XEXpysVN2Cq1RmgHhBcEAoYNQnMTgQ3salknRUMhBIE=; b=MlmkC3/LNxypJsY3
	eOhk465/rpgP7QKN/FPX0J/nXY6s64+X7OvIobG8S03V9vaUO2EJ7VYx/t4fN0jD
	a3aYjxTQFzCFH/anFOyejIb5xsx4SwLQ694tYeBKptiHNbhz7gNtt9bWFjOxi8U2
	2w5KDHBBXjF05fe3A4MB45RnHJ9zZtDhjtjO2plW8yojplOUrslIUMASqFU74qDp
	OLsDDvhzA6irRPiWmRV79WC2Y06fm0YwgSi8EmIiBt82g4kSYs3jEkTywBqc52/v
	A+WgNIQpIx6lDTTkdnz62sZpxf51GyS1sOUxCPxR7PUVDGYi+ZE1Ez+KDnyHyEQI
	qAPUqA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk7b50bvm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 01:47:10 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cea6a46766so3086495ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 18:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784771230; x=1785376030; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XEXpysVN2Cq1RmgHhBcEAoYNQnMTgQ3salknRUMhBIE=;
        b=eClXhRRXBIRUJ2VbA6fQmZ0+UBKzeABec88aAUQFeZECMlE+qNB4xPRjljzpSfee4d
         ZTniUpv+y/vHWTIiIiCEDKbUDqku4he27nbstYK6kUaOG54CfRl9I43fDlizOt5cdyyC
         9nBOnebIcp782j3vKa0jjIUxpxOuTvRtfhiqD41Hv85zws6TnPh4VHglm29Ahk+n373r
         kQlBWLtms2KCk/4eSSXyxddXFf3mpyY7bpryt0qmCt+fg5mAY+i+jJnbWQlBzctI3TDZ
         dpED5D5cLnKLbndeJ77j1fkje2hFwwVOBOBhqFIHHkxRArDbSLMPfdMioGyKi9SZYk9H
         MPPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784771230; x=1785376030;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XEXpysVN2Cq1RmgHhBcEAoYNQnMTgQ3salknRUMhBIE=;
        b=YvjYt4PLwdZ4+zfX+P1425ESUWgSfjASnG/uAWUV+jMRmtKUAoT6qqe/4ewzqOvqjd
         +eHlsgim0S0gBDEhNgqNp4UMUNx/u5NLAUXay3d14c9OqwfnLvfZmE9yE7unApv8bVPs
         NZj4iTHXHAenDVbJp6NltpS7a8ugUVPeu+b5MVIMjafv8hFHMqUSXUbHMVk/Mq0osFdl
         SsKxwO910CjhWXj4pU1t8RHV0maLSt2js5wHlvSDvJY64ah6+e9e5MScVo/wi6jtPRWP
         T21bc7kRrfJPGhhMomKuOraXoW6/2GzGwAktQUGqQNY+I/9DKPoH+u0h2xmm6j7hvR+t
         GqmA==
X-Forwarded-Encrypted: i=1; AHgh+RrszUwfcWR7QpDFcTpoKD2azd08scMozyWV4sZZJ01VCCrXVi9aFUTabkK3iK8+olvPRlxaiVrpcqBHyf9NrQJa@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0xS0spK5BxPHcOxqpySOlLCd7Pwt3sDfDsfPkG4dNDROwgzvG
	zEWRsk5CpDYOEbPV/GRFqEapqrk4AxT6NLrIxEMG8Mk0SyKcZdxkOpCds+Y5FCY+0J1XPtBF8iF
	G4t5q92um8P9l+qYtintYrmFTfpvzq5SYjPbZ8Tm9U2INvg7+IgMhQJuH7vk5rRGY0kiOEQJUQs
	p5Fw==
X-Gm-Gg: AR+sD12cy7W5MnPkZpUvI6aTHI2FZuUzuxlqh5vG6b7IEu5LyCGJuWSV9hpyyt9mOjd
	+0ms1jURVRAaOusRxOUjb4XteC82D295Pe3A3IRrsn/+nWomUj8ptHrND0FHXIarDQ6zlfIHjTx
	8gi7ZF5vmbvhUtzHAB56kd1sAUxT3PStCXHY8w2PfpPrJEc0YuALYC9xSGqRG3/QERmtgAVnCFL
	YSpMASVxKfOHMXW8fCR56zyDC67PNQlslS49lO5vh5OQ+a6wKFsYenBOBUoaSZEaQMeERmQCVaF
	UEJEvFN6i9U9DNU26uCfMBsoaojXu9mwWCMfu2m5IlN7uAq3ryLydsczF+ooeRwpH/LRee2b62W
	p8WNqDI1E2bTk9PB8CW8KvR7DJhysdz8Zn3fhyg1qCLPdfWM9JU/Q/AXadhbmgD4=
X-Received: by 2002:a17:902:f685:b0:2ca:73aa:b48f with SMTP id d9443c01a7336-2cfa71ab275mr14600135ad.35.1784771229359;
        Wed, 22 Jul 2026 18:47:09 -0700 (PDT)
X-Received: by 2002:a17:902:f685:b0:2ca:73aa:b48f with SMTP id d9443c01a7336-2cfa71ab275mr14599855ad.35.1784771228798;
        Wed, 22 Jul 2026 18:47:08 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8efa39e9sm23389995ad.10.2026.07.22.18.47.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 18:47:08 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 09:46:31 +0800
Subject: [PATCH 2/2] arm64: dts: qcom: shikra: Add coresight nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-add-coresight-nodes-for-shikra-v1-2-992615f9ea15@oss.qualcomm.com>
References: <20260723-add-coresight-nodes-for-shikra-v1-0-992615f9ea15@oss.qualcomm.com>
In-Reply-To: <20260723-add-coresight-nodes-for-shikra-v1-0-992615f9ea15@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784771207; l=27710;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=cnjRfXOGCiLdO/PiqrdR1gHMAwcIDL3Y5bbe8uCeOcs=;
 b=2i5/rx6Bg3d1oMOydJCALBc6G74On17HchlnZpjdX0DcCjVdT5N1tnDLv98PfQe7pmG1KvQsx
 s+26IIi97jEBSHKPLxWhHUAlP1rRibW1KGPwya2aM46EX18HYb0POjY
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDAxNSBTYWx0ZWRfXxFw5X+Pdzi8f
 4LW1exilFvozSsxQQxEvWzkYmtabL8FXbUVZ2aAAn8ctHYwg3pWp9qdvjxhd86Uy5RKNxKzuUBt
 GZHQho9NawcRvKqtn454J5gdOrySNyj1HTR57LaG3lMrUk6EbJdujlQvGq6XXPcVnFO9a7vQnMy
 wlvV1muvA2LkwStcZ9DGbOR7E4HEgmElbxHQwymiDtYX+6g+JTURETpnu/QpitgSd24ngHBnEdT
 fTLF3KQqCU67B9MwsOvg2ansW6EoDrBWVRkPA72NC1PGC3MYI5Le8q8F8mGBal04eZAdLSr20t+
 bxpBIoLw9YWKgon7T3ucw8y4B0sl5opkv6DO3dJwa/aC5BdHIdjyw76AUsDgkQGMW7sf+K3ckXW
 9ytlGHK1FpN7TzYmQWxpb8bL7PEpcbl1nSkS7dy5Gffbi6NiTNwAk6xW57xvlJV5syRZqaLy3MH
 LwF/5hLftqZJRYN5h/A==
X-Proofpoint-GUID: HSoPOAK6pgCjMlATufnvFuD3YJVZ9Veb
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDAxNSBTYWx0ZWRfXz0bSi1/aKvRY
 ijNIpUKov/tb71tbujDvfCissDAnirlAoE+oRcffsy0bQ4GmVILghC72MDdaMXHF4rv3fuZAA0E
 zrtG9c/9nWw+e9Y4ATPjYLNODxXxxWE=
X-Authority-Analysis: v=2.4 cv=btx8wkai c=1 sm=1 tr=0 ts=6a61729e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=cwPG6XMBaqf5cbKo9vYA:9 a=6PrL1bzTSInMHGBt:21
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: HSoPOAK6pgCjMlATufnvFuD3YJVZ9Veb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_184711_255710_89220AC1 
X-CRM114-Status: GOOD (  13.17  )
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

Add DT nodes for the CoreSight debug and trace subsystem on Qualcomm
Shikra SoC.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 1295 ++++++++++++++++++++++++++++++++++
 1 file changed, 1295 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 4e5bc9e17c8e..eb0f3c36068f 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -113,6 +113,88 @@ l3: l3-cache {
 		};
 	};
 
+	dummy-eud {
+		compatible = "arm,coresight-dummy-sink";
+
+		label = "eud";
+
+		in-ports {
+			port {
+				eud_in: endpoint {
+					remote-endpoint = <&replicator_eud_out1>;
+				};
+			};
+		};
+	};
+
+	etm0 {
+		compatible = "arm,coresight-etm4x-sysreg";
+
+		clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+		clock-names = "apb_pclk";
+		cpu = <&cpu0>;
+		qcom,skip-power-up;
+
+		out-ports {
+			port {
+				etm0_out: endpoint {
+					remote-endpoint = <&funnel_cpuss0_in0>;
+				};
+			};
+		};
+	};
+
+	etm1 {
+		compatible = "arm,coresight-etm4x-sysreg";
+
+		clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+		clock-names = "apb_pclk";
+		cpu = <&cpu1>;
+		qcom,skip-power-up;
+
+		out-ports {
+			port {
+				etm1_out: endpoint {
+					remote-endpoint = <&funnel_cpuss0_in1>;
+				};
+			};
+		};
+	};
+
+	etm2 {
+		compatible = "arm,coresight-etm4x-sysreg";
+
+		clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+		clock-names = "apb_pclk";
+		cpu = <&cpu2>;
+		qcom,skip-power-up;
+
+		out-ports {
+			port {
+				etm2_out: endpoint {
+					remote-endpoint = <&funnel_cpuss0_in2>;
+				};
+			};
+		};
+	};
+
+	etm3 {
+		compatible = "arm,coresight-etm4x-sysreg";
+
+		clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+		clock-names = "apb_pclk";
+		cpu = <&cpu3>;
+		qcom,skip-power-up;
+
+		out-ports {
+			port {
+				etm3_out: endpoint {
+					remote-endpoint = <&funnel_cpuss0_in3>;
+				};
+			};
+		};
+	};
+
 	firmware {
 		scm {
 			compatible = "qcom,scm-shikra", "qcom,scm";
@@ -131,6 +213,21 @@ memory@80000000 {
 		reg = <0x0 0x80000000 0x0 0x0>;
 	};
 
+	modem-etm0 {
+		compatible = "arm,coresight-dummy-source";
+
+		label = "modem_etm0";
+		arm,static-trace-id = <36>;
+
+		out-ports {
+			port {
+				modem_etm0_out: endpoint {
+					remote-endpoint = <&funnel_in1_in4>;
+				};
+			};
+		};
+	};
+
 	pmu-a55 {
 		compatible = "arm,cortex-a55-pmu";
 		interrupts = <GIC_PPI 5 IRQ_TYPE_LEVEL_HIGH &ppi_cluster0>;
@@ -640,6 +737,1189 @@ &clk_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
 			};
 		};
 
+		ctcu@8001000 {
+			compatible = "qcom,shikra-ctcu", "qcom,sa8775p-ctcu";
+			reg = <0x0 0x08001000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb";
+
+			in-ports {
+				port {
+					ctcu_in0: endpoint {
+						remote-endpoint = <&etr0_out>;
+					};
+				};
+			};
+		};
+
+		stm@8002000 {
+			compatible = "arm,coresight-stm", "arm,primecell";
+			reg = <0x0 0x08002000 0x0 0x1000>,
+			      <0x0 0x0e280000 0x0 0x180000>;
+			reg-names = "stm-base",
+				    "stm-stimulus-base";
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+
+			out-ports {
+				port {
+					stm_out: endpoint {
+						remote-endpoint = <&funnel_in0_in7>;
+					};
+				};
+			};
+		};
+
+		tpdm@8003000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x08003000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+
+			label = "tpdm_dcc";
+			qcom,cmb-element-bits = <32>;
+
+			out-ports {
+				port {
+					tpdm_dcc_out: endpoint {
+						remote-endpoint = <&tpda_qdss_in0>;
+					};
+				};
+			};
+		};
+
+		tpda@8004000 {
+			compatible = "qcom,coresight-tpda", "arm,primecell";
+			reg = <0x0 0x08004000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					tpda_qdss_in0: endpoint {
+						remote-endpoint = <&tpdm_dcc_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					tpda_qdss_in1: endpoint {
+						remote-endpoint = <&tpdm_spdm_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					tpda_qdss_out: endpoint {
+						remote-endpoint = <&funnel_in0_in6>;
+					};
+				};
+			};
+		};
+
+		tpdm@800f000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x0800f000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+
+			label = "tpdm_spdm";
+			qcom,cmb-element-bits = <32>;
+
+			out-ports {
+				port {
+					tpdm_spdm_out: endpoint {
+						remote-endpoint = <&tpda_qdss_in1>;
+					};
+				};
+			};
+		};
+
+		funnel@8041000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x08041000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@5 {
+					reg = <5>;
+
+					funnel_in0_in5: endpoint {
+						remote-endpoint = <&snoc_out>;
+					};
+				};
+
+				port@6 {
+					reg = <6>;
+
+					funnel_in0_in6: endpoint {
+						remote-endpoint = <&tpda_qdss_out>;
+					};
+				};
+
+				port@7 {
+					reg = <7>;
+
+					funnel_in0_in7: endpoint {
+						remote-endpoint = <&stm_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					funnel_in0_out: endpoint {
+						remote-endpoint = <&funnel_merg_in0>;
+					};
+				};
+			};
+		};
+
+		funnel@8042000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x08042000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@1 {
+					reg = <1>;
+
+					funnel_in1_in1: endpoint {
+						remote-endpoint = <&tpda_aodbg_out>;
+					};
+				};
+
+				port@4 {
+					reg = <4>;
+
+					funnel_in1_in4: endpoint {
+						remote-endpoint = <&modem_etm0_out>;
+					};
+				};
+
+				port@6 {
+					reg = <6>;
+
+					funnel_in1_in6: endpoint {
+						remote-endpoint = <&funnel_cpuss1_out>;
+					};
+				};
+
+				port@7 {
+					reg = <7>;
+
+					funnel_in1_in7: endpoint {
+						remote-endpoint = <&funnel_center_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					funnel_in1_out: endpoint {
+						remote-endpoint = <&funnel_merg_in1>;
+					};
+				};
+			};
+		};
+
+		funnel@8045000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x08045000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					funnel_merg_in0: endpoint {
+						remote-endpoint = <&funnel_in0_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					funnel_merg_in1: endpoint {
+						remote-endpoint = <&funnel_in1_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					funnel_merg_out: endpoint {
+						remote-endpoint = <&tmc_etf_in>;
+					};
+				};
+			};
+		};
+
+		replicator@8046000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x08046000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					replicator_qdss_in: endpoint {
+						remote-endpoint = <&tmc_etf_out>;
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
+					replicator_qdss_out0: endpoint {
+						remote-endpoint = <&etr0_in>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					replicator_qdss_out1: endpoint {
+						remote-endpoint = <&replicator_eud_in>;
+					};
+				};
+			};
+		};
+
+		tmc@8047000 {
+			compatible = "arm,coresight-tmc", "arm,primecell";
+			reg = <0x0 0x08047000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					tmc_etf_in: endpoint {
+						remote-endpoint = <&funnel_merg_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					tmc_etf_out: endpoint {
+						remote-endpoint = <&replicator_qdss_in>;
+					};
+				};
+			};
+		};
+
+		tmc@8048000 {
+			compatible = "arm,coresight-tmc", "arm,primecell";
+			reg = <0x0 0x08048000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+
+			iommus = <&apps_smmu 0x0160 0x0>;
+			arm,scatter-gather;
+
+			in-ports {
+				port {
+					etr0_in: endpoint {
+						remote-endpoint = <&replicator_qdss_out0>;
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
+		replicator@804a000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x0804a000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					replicator_eud_in: endpoint {
+						remote-endpoint = <&replicator_qdss_out1>;
+					};
+				};
+			};
+
+			out-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@1 {
+					reg = <1>;
+
+					replicator_eud_out1: endpoint {
+						remote-endpoint = <&eud_in>;
+					};
+				};
+			};
+		};
+
+		tpdm@8800000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x08800000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+
+			label = "tpdm_cdsp";
+			qcom,dsb-element-bits = <32>;
+			qcom,dsb-msrs-num = <4>;
+
+			out-ports {
+				port {
+					tpdm_cdsp_out: endpoint {
+						remote-endpoint = <&funnel_cdsp_in0>;
+					};
+				};
+			};
+		};
+
+		funnel@8801000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x08801000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					funnel_cdsp_in0: endpoint {
+						remote-endpoint = <&tpdm_cdsp_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					funnel_cdsp_out0: endpoint {
+						remote-endpoint = <&tpda_center_in3>;
+					};
+				};
+			};
+		};
+
+		cti@8807000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x08807000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+			label = "cti_turing_q6";
+		};
+
+		cti@8833000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x08833000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+			label = "cti_mss_q6";
+		};
+
+		tpdm@8840000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x08840000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+
+			label = "tpdm_vsense";
+			qcom,cmb-element-bits = <32>;
+
+			out-ports {
+				port {
+					tpdm_vsense_out: endpoint {
+						remote-endpoint = <&tpda_center_in6>;
+					};
+				};
+			};
+		};
+
+		tpdm@8844000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x08844000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+
+			label = "tpdm_dlct_1";
+			qcom,dsb-element-bits = <32>;
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					tpdm_dlct_1_out: endpoint {
+						remote-endpoint = <&tpda_center_in13>;
+					};
+				};
+			};
+		};
+
+		tpda@8845000 {
+			compatible = "qcom,coresight-tpda", "arm,primecell";
+			reg = <0x0 0x08845000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					tpda_center_in0: endpoint {
+						remote-endpoint = <&funnel_mcu_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					tpda_center_in2: endpoint {
+						remote-endpoint = <&tpdm_dlct_out>;
+					};
+				};
+
+				port@3 {
+					reg = <3>;
+
+					tpda_center_in3: endpoint {
+						remote-endpoint = <&funnel_cdsp_out0>;
+					};
+				};
+
+				port@4 {
+					reg = <4>;
+
+					tpda_center_in4: endpoint {
+						remote-endpoint = <&funnel_ddr_out0>;
+					};
+				};
+
+				port@6 {
+					reg = <6>;
+
+					tpda_center_in6: endpoint {
+						remote-endpoint = <&tpdm_vsense_out>;
+					};
+				};
+
+				port@7 {
+					reg = <7>;
+
+					tpda_center_in7: endpoint {
+						remote-endpoint = <&tpdm_prng_out>;
+					};
+				};
+
+				port@8 {
+					reg = <8>;
+
+					tpda_center_in8: endpoint {
+						remote-endpoint = <&tpdm_west_out>;
+					};
+				};
+
+				port@9 {
+					reg = <9>;
+
+					tpda_center_in9: endpoint {
+						remote-endpoint = <&tpdm_qm_out>;
+					};
+				};
+
+				port@a {
+					reg = <0xa>;
+
+					tpda_center_in10: endpoint {
+						remote-endpoint = <&tpdm_pimem_out>;
+					};
+				};
+
+				port@d {
+					reg = <0xd>;
+
+					tpda_center_in13: endpoint {
+						remote-endpoint = <&tpdm_dlct_1_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					tpda_center_out: endpoint {
+						remote-endpoint = <&funnel_center_in0>;
+					};
+				};
+			};
+		};
+
+		funnel@8846000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x08846000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					funnel_center_in0: endpoint {
+						remote-endpoint = <&tpda_center_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					funnel_center_out: endpoint {
+						remote-endpoint = <&funnel_in1_in7>;
+					};
+				};
+			};
+		};
+
+		tpdm@884c000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x0884c000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+
+			label = "tpdm_prng";
+			qcom,cmb-element-bits = <32>;
+
+			out-ports {
+				port {
+					tpdm_prng_out: endpoint {
+						remote-endpoint = <&tpda_center_in7>;
+					};
+				};
+			};
+		};
+
+		tpdm@8850000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x08850000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+
+			label = "tpdm_pimem";
+			qcom,cmb-element-bits = <64>;
+			qcom,dsb-element-bits = <32>;
+
+			out-ports {
+				port {
+					tpdm_pimem_out: endpoint {
+						remote-endpoint = <&tpda_center_in10>;
+					};
+				};
+			};
+		};
+
+		tpdm@8980000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x08980000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+
+			label = "tpdm_mcu";
+			qcom,dsb-element-bits = <32>;
+			qcom,dsb-msrs-num = <16>;
+
+			out-ports {
+				port {
+					tpdm_mcu_out: endpoint {
+						remote-endpoint = <&funnel_mcu_in0>;
+					};
+				};
+			};
+		};
+
+		funnel@8982000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x08982000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					funnel_mcu_in0: endpoint {
+						remote-endpoint = <&tpdm_mcu_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					funnel_mcu_out: endpoint {
+						remote-endpoint = <&tpda_center_in0>;
+					};
+				};
+			};
+		};
+
+		tpdm@89d0000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x089d0000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+
+			label = "tpdm_qm";
+			qcom,dsb-element-bits = <32>;
+
+			out-ports {
+				port {
+					tpdm_qm_out: endpoint {
+						remote-endpoint = <&tpda_center_in9>;
+					};
+				};
+			};
+		};
+
+		tpdm@8a01000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x08a01000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+
+			label = "tpdm_mapss";
+			qcom,cmb-element-bits = <32>;
+			qcom,dsb-element-bits = <32>;
+			qcom,dsb-msrs-num = <16>;
+
+			out-ports {
+				port {
+					tpdm_mapss_out: endpoint {
+						remote-endpoint = <&tpda_aodbg_in>;
+					};
+				};
+			};
+		};
+
+		cti@8a02000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x08a02000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+			label = "cti_mapss";
+		};
+
+		tpda@8a04000 {
+			compatible = "qcom,coresight-tpda", "arm,primecell";
+			reg = <0x0 0x08a04000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					tpda_aodbg_in: endpoint {
+						remote-endpoint = <&tpdm_mapss_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					tpda_aodbg_out: endpoint {
+						remote-endpoint = <&funnel_in1_in1>;
+					};
+				};
+			};
+		};
+
+		tpdm@8a58000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x08a58000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+
+			label = "tpdm_west";
+			qcom,dsb-element-bits = <32>;
+			qcom,dsb-msrs-num = <16>;
+
+			out-ports {
+				port {
+					tpdm_west_out: endpoint {
+						remote-endpoint = <&tpda_center_in8>;
+					};
+				};
+			};
+		};
+
+		cti@8b30000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x08b30000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+			label = "cti_cortex_m3";
+		};
+
+		tpdm@8b58000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x08b58000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+
+			label = "tpdm_dlct";
+			qcom,dsb-element-bits = <32>;
+			qcom,dsb-msrs-num = <16>;
+
+			out-ports {
+				port {
+					tpdm_dlct_out: endpoint {
+						remote-endpoint = <&tpda_center_in2>;
+					};
+				};
+			};
+		};
+
+		cti@8b59000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x08b59000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+			label = "cti_dlct_0";
+		};
+
+		cti@8b5a000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x08b5a000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+			label = "cti_dlct_1";
+		};
+
+		cti@8b5b000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x08b5b000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+			label = "cti_dlct_2";
+		};
+
+		cti@8b5c000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x08b5c000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+			label = "cti_dlct_3";
+		};
+
+		tpdm@8b60000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x08b60000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+
+			label = "tpdm_ddr";
+			qcom,cmb-element-bits = <32>;
+			qcom,cmb-msrs-num = <1>;
+			qcom,dsb-element-bits = <32>;
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					tpdm_ddr_out: endpoint {
+						remote-endpoint = <&funnel_ddr_in0>;
+					};
+				};
+			};
+		};
+
+		cti@8b62000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x08b62000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+			label = "cti_ddr_dl_0";
+		};
+
+		funnel@8b65000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x08b65000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					funnel_ddr_in0: endpoint {
+						remote-endpoint = <&tpdm_ddr_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					funnel_ddr_out0: endpoint {
+						remote-endpoint = <&tpda_center_in4>;
+					};
+				};
+			};
+		};
+
+		cti@8b70000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x08b70000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+			label = "cti_ddr_dl_0_1";
+		};
+
+		cti@8b71000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x08b71000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+			label = "cti_ddr_dl_1_1";
+		};
+
+		cti@9020000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x09020000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+			label = "cti_apss_pe0";
+		};
+
+		cti@90e0000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x090e0000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+			label = "cti_apss_cluster";
+		};
+
+		cti@9120000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x09120000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+			label = "cti_apss_pe1";
+		};
+
+		cti@9220000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x09220000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+			label = "cti_apss_pe2";
+		};
+
+		cti@9320000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x09320000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+			label = "cti_apss_pe3";
+		};
+
+		funnel@9800000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x09800000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					funnel_cpuss0_in0: endpoint {
+						remote-endpoint = <&etm0_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					funnel_cpuss0_in1: endpoint {
+						remote-endpoint = <&etm1_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					funnel_cpuss0_in2: endpoint {
+						remote-endpoint = <&etm2_out>;
+					};
+				};
+
+				port@3 {
+					reg = <3>;
+
+					funnel_cpuss0_in3: endpoint {
+						remote-endpoint = <&etm3_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					funnel_cpuss0_out: endpoint {
+						remote-endpoint = <&funnel_cpuss1_in0>;
+					};
+				};
+			};
+		};
+
+		funnel@9810000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x09810000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					funnel_cpuss1_in0: endpoint {
+						remote-endpoint = <&funnel_cpuss0_out>;
+					};
+				};
+
+				port@3 {
+					reg = <3>;
+
+					funnel_cpuss1_in3: endpoint {
+						remote-endpoint = <&tpda_apss_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					funnel_cpuss1_out: endpoint {
+						remote-endpoint = <&funnel_in1_in6>;
+					};
+				};
+			};
+		};
+
+		cti@982b000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x0982b000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+			label = "cti_riscv";
+		};
+
+		tpdm@9860000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x09860000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+
+			label = "tpdm_actpm";
+			qcom,cmb-element-bits = <64>;
+			qcom,cmb-msrs-num = <1>;
+
+			out-ports {
+				port {
+					tpdm_actpm_out: endpoint {
+						remote-endpoint = <&tpda_apss_in2>;
+					};
+				};
+			};
+		};
+
+		tpdm@9861000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x09861000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+
+			label = "tpdm_hwe";
+			qcom,dsb-element-bits = <32>;
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					tpdm_hwe_out: endpoint {
+						remote-endpoint = <&tpda_apss_in3>;
+					};
+				};
+			};
+		};
+
+		tpda@9863000 {
+			compatible = "qcom,coresight-tpda", "arm,primecell";
+			reg = <0x0 0x09863000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					tpda_apss_in0: endpoint {
+						remote-endpoint = <&tpdm_llm_silver_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					tpda_apss_in2: endpoint {
+						remote-endpoint = <&tpdm_actpm_out>;
+					};
+				};
+
+				port@3 {
+					reg = <3>;
+
+					tpda_apss_in3: endpoint {
+						remote-endpoint = <&tpdm_hwe_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					tpda_apss_out: endpoint {
+						remote-endpoint = <&funnel_cpuss1_in3>;
+					};
+				};
+			};
+		};
+
+		tpdm@98a0000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x098a0000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+
+			label = "tpdm_llm_silver";
+			qcom,cmb-element-bits = <32>;
+			qcom,cmb-msrs-num = <12>;
+
+			out-ports {
+				port {
+					tpdm_llm_silver_out: endpoint {
+						remote-endpoint = <&tpda_apss_in0>;
+					};
+				};
+			};
+		};
+
+		cti@98e0000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x098e0000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+			label = "cti_apss_0";
+		};
+
+		cti@98f0000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x098f0000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+			label = "cti_apss_1";
+		};
+
+		cti@9900000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x09900000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+			label = "cti_apss_2";
+		};
+
 		sram@c11e000 {
 			compatible = "qcom,shikra-imem", "mmio-sram";
 			reg = <0x0 0x0c11e000 0x0 0x1000>;
@@ -831,6 +2111,21 @@ frame@f42d000 {
 		};
 	};
 
+	snoc {
+		compatible = "arm,coresight-dummy-source";
+
+		label = "snoc";
+		arm,static-trace-id = <18>;
+
+		out-ports {
+			port {
+				snoc_out: endpoint {
+					remote-endpoint = <&funnel_in0_in5>;
+				};
+			};
+		};
+	};
+
 	timer {
 		compatible = "arm,armv8-timer";
 

-- 
2.34.1


