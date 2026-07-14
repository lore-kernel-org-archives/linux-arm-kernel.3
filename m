Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8666CC44507
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 01:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h9nvPpuACviZ5FLIt1UswJ9sGYlO0hmf0Ng5zekU/zo=; b=sIcR0uNy5xXAwC3wQc1tER7cS3
	48DDNzJd6PzIWwqw46Ea/7PLL1CMCz5rrXsFUPz4IXGSjBsZUjPJp599BX+54BsMVNswXu74wfYeQ
	FqWm6NBpL/YZUs5bSdIFUW1r2Esir70eoYjJaVBUtGa5w8gPlczKv3COVWM0x/xkV2ujDvjHN6d7U
	f8LZYYiFYXb8vNoGpP99SEcwN8JE8HzRz0xtz1vKU2WjIimJrP8aymMTe6BFp4OdFgRtAE3bU1T8n
	xW9iUW53JZEVj89KwpoIrMftsAHXL2zr3+GP/V704NN17FNYmaVCiKb1pOgDCrWYMY2dp8TOZFyFz
	KJCl1sWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjSPL-0000000AhZF-2l0b;
	Tue, 14 Jul 2026 01:58:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjSPG-0000000AhW6-3Gmp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 01:58:00 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DNnXqx3071178
	for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 01:57:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h9nvPpuACviZ5FLIt1UswJ9sGYlO0hmf0Ng5zekU/zo=; b=otCWIbPgFb6LuIY+
	Y14V1Ykusdpb9sWMpaiVvK2zXR+oKLbvfrftuPd8sCXuwTaYt7EKpx0+P52zbTH+
	ziQbNljQ+PC39/8BPGjwmd5AmgGXWDmsBCTbEFkpWIoqzwltibac0VHMP0XT0ZeZ
	P9k5Vf432Y7D4KbAR8f3K2l0h8cn24a7Q3k2GJRHALNmOBMkvcNvIOXCH+6aG14s
	Sz57Relk3lPSSdKWLxxD0NRXhI9/D4ubU1qCI82K5ozymJ9OTu6FajnAHkxHERpX
	esrax+rbkVKakc+XrrTVI3W1tu/zNSkAG3cw/7spp5LEu3ipKZpxWF3Dx812r4ZV
	qHVoJw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd44jsgb0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 01:57:57 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-848568a6f62so6671207b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 18:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783994277; x=1784599077; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h9nvPpuACviZ5FLIt1UswJ9sGYlO0hmf0Ng5zekU/zo=;
        b=CQRHfs1J11pZ1Z+b8V9ASycKq58LTM0ZloLpcPwN1JvnD/rGSbKDoYp2hM8ipXxhnG
         j/NpbAQx1dZGMnb549AEPQZHw2OUScPpA/9xv0sYzgA572ZS2D87D2bAuhxMK6Fsx4jQ
         HMUS++mvYKbKPECTj8Yq3OKdssZqk6vZrKUjPCvXC6z4v6apNWCDjl1aDMLGWa7nnrg9
         Gpvav9bgqw+ZADQHScOuYWj+lNPrmSs+BfdTPzgPUFV32xtaNILOyrP5EmQoF4sz5+gj
         A3us8XPcMGeXM7h6459oYBepz9ipZayOTSZoCcXO0brB5uEsPpiMHut6K/PpZHXo5GIP
         yeAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783994277; x=1784599077;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h9nvPpuACviZ5FLIt1UswJ9sGYlO0hmf0Ng5zekU/zo=;
        b=fASH3yOhKqMEXaHAwEQ16DJbyU3JbH6yh9yldJpuSHWG8wafyzrmS6c0ea2mwi29i6
         Opl4Rvb1Oeah/RlybMe3LOiA5LjgJ0hY8wsNlwuQ8Q8heUd3/sG1xu7ET4sF7B4LF5OA
         qnmsWB7f4aTgf7Rlb5uScDY1500wsjp5Jl+9b9CwUj/OaLjtPqXWUJeENTZv1ESd7L3x
         YgyCLMK2p48zVj5GFgg/vNK8g7n2gomQMvXueyrc6zTDsrUmP7Or4GXt+UK5pBAWVIa1
         V8ZrrHIPhSaQ8/UALUlsVTMj4XD+XHeBY+HU99Sfa4kpFKC9CSJXY31O7oMAnr5LUgr3
         DWUg==
X-Forwarded-Encrypted: i=1; AHgh+RqrhE4O/pz1+nyk8ubYA8KaNw5fmPTcd4szmT6Csf+5Vnrctyl47R4jQyA7sNi9TNtPwv2cH4aAhkj7+5pWHAk2@lists.infradead.org
X-Gm-Message-State: AOJu0YzJbyr7Ii/YM1VYUeNWw/KPe21mDznyQZrrgkxyL1iGm8M5M8ja
	+Cf4bIxbadYUWFzNttEQ7ti5n76dEfcLTiPJVN2ZrTt0DDaZEBfqy9u3J7JpYVTRu97t5a9xjXC
	6PbGJR4Z1yu+D6A/fGRu0yLj91A3VWHGyAqWELW6NXCyUxIpyWQ5nWTbmEgWB8QlaDsImul3Cj3
	MhSg==
X-Gm-Gg: AfdE7cmbn92Etq2/8l1cDpW8Q//hTudlwDBAP2Jnfh9+LVguWkDNeNug8DtFcmoeVg7
	iAI5gBC84mdjp+/PueDEnyVDkreGTdM+71pE/vh/+GAst05LLbu5UZ6povHkEhXCFfnZZ73kwc9
	H3imBObF0QS5IKTXApkxU8HAFCZ9iVCByK4/oAa2zgLlaqwkF3vrOrpgobhKHdPdW96g4oKwWyn
	zeq3tIzsA6U0yKu/f5FJYw3cLAlzwwOSSOXHKKlEA/wELPQ8K1qYNTB39Tqy/L5QhmVrWiSkQjY
	Imq+HPpDSdrYN33Vq3OYo+A/NYEtIbBm3hTrFpRvvPaSiFqAppwIi4fXMlHgEpiCR19BKD/G+K5
	udSu9WdsIpynkZk5CjZVtHQWgi61GPjXwREAyq621T3f3S/D/Q5K6RTBL56yAmqxegpbdtqzCyA
	==
X-Received: by 2002:a05:6a00:21d2:b0:845:4126:222b with SMTP id d2e1a72fcca58-84a55750083mr494214b3a.28.1783994276295;
        Mon, 13 Jul 2026 18:57:56 -0700 (PDT)
X-Received: by 2002:a05:6a00:21d2:b0:845:4126:222b with SMTP id d2e1a72fcca58-84a55750083mr494191b3a.28.1783994275664;
        Mon, 13 Jul 2026 18:57:55 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f29ed3dsm634191b3a.27.2026.07.13.18.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 18:57:55 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 09:57:26 +0800
Subject: [PATCH 2/2] arm64: dts: qcom: shikra: Add coresight nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-add-coresight-nodes-for-shikra-v1-2-b1cf85962455@oss.qualcomm.com>
References: <20260714-add-coresight-nodes-for-shikra-v1-0-b1cf85962455@oss.qualcomm.com>
In-Reply-To: <20260714-add-coresight-nodes-for-shikra-v1-0-b1cf85962455@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783994260; l=27951;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=yjgqlv3QNTHFAGoM9H54PKvSKonzDssY7W96XG/oOiA=;
 b=t5I1Mpk3TXLXVpb4m0JDPw2T/unmUG5UT4VlYEYZ7pItzSY4f7UIoGW3P/sHn4Oswo/EBKVfe
 mhpFvE2wxEaD3ENXd9K631UkaLx4r1535LfF9edma9d7c7uZx9yceGj
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: xgETArjK1hnPGseB-URwZPqx52td0GmL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDAxNyBTYWx0ZWRfX/tLoQjfdV3uB
 E+CYSSK+hKCuvF5L1QbegRGfz/vC4wZKI9fL0KXBU6Z1MU7SCJ/dz6TyCpxxCPFClBgpATqUW1p
 MXHdWK+umaLI9RwtVuT2u9W4hbDuWvzeEK0FHH96gd4uyz/QOVPaB3MWFFo0XkRNxmbm8255bot
 QIwX4bucpz1f85pEm0hjGqkHiWvozHYn2s4SSSt9aKe/fkNx7uSbyY/kySxhgCcNjs0ln5Cd45r
 y8Exr29l96bnZHZaI0I4BmWFfWUBSY/stjNlgE8g2x/Rsnz+dcp9pfzbbxXmOr89Smh4NYm9Ec1
 GCUBUpb+OEU10oiJzdwfljRUTxZO+l+yGztP94LAiJoFxjNn0Kwl36/ls3r0iEvG35YNChLVjDy
 rcMto+SQ5MwQVNiNYcBVmTIMPKCIBjX7qDb+W5oDqE2suuhT1LszbbaAOsZX09CEIsboqnQOuBU
 Ej+GEiz92qs5Nhn49IQ==
X-Authority-Analysis: v=2.4 cv=XonK/1F9 c=1 sm=1 tr=0 ts=6a5597a5 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=cwPG6XMBaqf5cbKo9vYA:9 a=6PrL1bzTSInMHGBt:21
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: xgETArjK1hnPGseB-URwZPqx52td0GmL
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDAxNyBTYWx0ZWRfXyX6vC0AFXrcT
 SIt7htWMtNUgKaRitpbSL9EQLtzPzVnyVPLFuQ8b8uzpJqU0K4mCDc5bkzRHw/H7DYgabRsq6Z+
 i9GbWgJjfNeX9mCeStQjmCKvcMUT0fo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_06,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140017
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_185759_028234_12649E0F 
X-CRM114-Status: GOOD (  12.99  )
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
 arch/arm64/boot/dts/qcom/shikra.dtsi | 1298 ++++++++++++++++++++++++++++++++++
 1 file changed, 1298 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 4e5bc9e17c8e..84c906be16a9 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -113,6 +113,19 @@ l3: l3-cache {
 		};
 	};
 
+	dummy-eud {
+		compatible = "arm,coresight-dummy-sink";
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
 	firmware {
 		scm {
 			compatible = "qcom,scm-shikra", "qcom,scm";
@@ -131,6 +144,21 @@ memory@80000000 {
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
@@ -640,6 +668,1261 @@ &clk_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
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
+		etm@9040000 {
+			compatible = "arm,coresight-etm4x-sysreg";
+			reg = <0x0 0x09040000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+			cpu = <&cpu0>;
+			qcom,skip-power-up;
+
+			out-ports {
+				port {
+					etm0_out: endpoint {
+						remote-endpoint = <&funnel_cpuss0_in0>;
+					};
+				};
+			};
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
+		etm@9140000 {
+			compatible = "arm,coresight-etm4x-sysreg";
+			reg = <0x0 0x09140000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+			cpu = <&cpu1>;
+			qcom,skip-power-up;
+
+			out-ports {
+				port {
+					etm1_out: endpoint {
+						remote-endpoint = <&funnel_cpuss0_in1>;
+					};
+				};
+			};
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
+		etm@9240000 {
+			compatible = "arm,coresight-etm4x-sysreg";
+			reg = <0x0 0x09240000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+			cpu = <&cpu2>;
+			qcom,skip-power-up;
+
+			out-ports {
+				port {
+					etm2_out: endpoint {
+						remote-endpoint = <&funnel_cpuss0_in2>;
+					};
+				};
+			};
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
+		etm@9340000 {
+			compatible = "arm,coresight-etm4x-sysreg";
+			reg = <0x0 0x09340000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+			cpu = <&cpu3>;
+			qcom,skip-power-up;
+
+			out-ports {
+				port {
+					etm3_out: endpoint {
+						remote-endpoint = <&funnel_cpuss0_in3>;
+					};
+				};
+			};
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
@@ -831,6 +2114,21 @@ frame@f42d000 {
 		};
 	};
 
+	snoc {
+		compatible = "arm,coresight-dummy-source";
+		arm,static-trace-id = <18>;
+
+		label = "snoc";
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


