Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3658CD98C7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 18:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6iIX6YyczVTNZnfKhOGek1sSjpYCGtZFfO3vE1d1fHE=; b=2Myu6httc4MkK/R1WpBZd/rOPc
	NXloN2ZfLhdUHuui1QbgrMvr/cR9du2UNJimNCEVlyy9y6vycrFhlZiSvk+EG016xBOg0NUSejHcZ
	ce07vs4GBqNC8CiHKHDp/guD4tAvtS7voDveKnWDfGKawtHZBH3SG3o5TcVDQYPzn0cTJIPKqjbnc
	8/9E21P3wo2h9Ch2hiySmRcS9GEfLy2G5rrXomX7jBiSckaeL56RLNfR7LHUiz5ZUxlJkQ+MOiS3q
	MhNUU1cx+aFyTxUsup5EDRWS05sqC426RT8chtphTZxCaCPb/iZt786n8I0TqEiSEhceqfJM3pz+b
	GAbXOSug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXkHt-00000009tam-0oG2;
	Thu, 11 Jun 2026 18:37:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXkHq-00000009tYZ-0Lnf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 18:37:55 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BIQ9d44027743
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 18:37:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6iIX6YyczVTNZnfKhOGek1sSjpYCGtZFfO3vE1d1fHE=; b=LBISvqjrAxNErqiw
	sm9BUhuYLMngvTPRfyRU3n2KbBXwgMlTFAqKvBku17LdMduU/zaqD0iPkDqAIblq
	+IgyYa9PqOyEvUt0A1ByezDcHv9WCIqY2VGjLkFVm7df9ZdA/IXuY1+fiWGSb/sP
	YfJXZBRP2bBeL1qAFFE9Z4/ewiNsKdt/hvPWCumJGsasvJbs+m9PjH+yEp4k9VC7
	RFuoOlWsQZ6JOuVR41KyATDGuB87t5Jy/6FR6NAn3wGFvuUt3q/kdeKdvwGNwsgF
	lQiUE/Tq0pvVkHYq/qV9ryyJgMxWZBJCyqTE/mi0h6+hMPMF39a5pEOCTn1Lb0hm
	4ac+Bg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er014gtdf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 18:37:53 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8421ffff8a3so225124b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 11:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781203073; x=1781807873; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6iIX6YyczVTNZnfKhOGek1sSjpYCGtZFfO3vE1d1fHE=;
        b=CZgGk+/qCtixJnSa/1TGksbLqmW4nClY1WPCXHXVnAFQVFRUewGGWgD2KmrfROHw1v
         wdDQErJwLzZG5je0UqNZRkG92czd+kdcHKV+3R4Lb9LiHeuKA2QfEbl9BHHQwC0uLLwM
         N6k93eko3nqyi6qtcOkXk0Mlgd1btVk9NB2YE5kUm6Ei+WGGcScuXaLDy7f+oHyojcGh
         tCGxDCntEL001PakYbBqx/l0BD8tgpr5zALm7sxnYlIa5mxKRRmvgChZJGhyYiO5q4L4
         3jgj86LiW8kFs5XDwrMcuje8u3Zp9u6/OLoz8Xjwg6w7UkNn1zmg0lyD5ErDbQD4e4VS
         udHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781203073; x=1781807873;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6iIX6YyczVTNZnfKhOGek1sSjpYCGtZFfO3vE1d1fHE=;
        b=qbXwYyS4D6yBA/vqqGniq0RcPVpgYKX18n8KsWbm8V7R4IPWqr8Rl3M+SuSy1a5iHY
         5VgPDq9ShuvRw7wC7DOkfxzg0MOV8tnaT85N1EdR+4tPZQByW1VCkQpXRxGEnhQUq7e6
         Z6Tz+72FOHNmkdyGA5rh53MlA1OVX6C4cfbIgi7QAFU4/IFAKi0ZhYOrAzZSHZU70uKG
         WrXhR5bf0DZEQb5oySJ0L2ntQk79zozh/24niM53yWx8dnJEadlAs+w3ERvXf7lM06HJ
         GmeL2i0jog6bVATKPANUHT8SzBj2HZPJMW59H8EArJhEkXeOcxVcFZtsl5GQLdbKmXVQ
         GweA==
X-Forwarded-Encrypted: i=1; AFNElJ98+v+VPpH32fucX1nyMfnznKEL6OBhJtYsSF6i6C9T2TVCeYOLSRddQn2URw//TemEC69A2UxblnCMJx0RYbKW@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0a9Jzoc4wOqyA77L/+tyZ0YoMI5ZlBU4sjw4LLPbX1tyDDSDV
	th8/+iLsjD8+G7f39xeANKEWfNQo3lQ9c4w6K+jGrG5l9I0kSnMezu6ibwotZL3/+s3UrYAcYPB
	NkziLBuAZHFaug+kNt16jIdROc15GPNKYBw4pEAMRYRXi6IOiRAlTPzcVvUt9EzBooLwVC7Qsb1
	zofw==
X-Gm-Gg: Acq92OEinVK3u8YPTlM5leYEnfuxIojSlQSafGohKdvwia1KZY9B0EvQ3OdbrFg00Qv
	goU3+xU/v2x0PROxKB5WZQvVCjaRsWnMpe589KBtZoIHG+i8GhU3XSqExJghkOX4VAoaAHHAL4/
	8aASnJyMw7QGUEnqw1tR2LgUZKwPhw8eZKXb0xYn2fbbIeAJArDhi0zG2hY9HansPUipd9YdrgJ
	TZqolWk00N0b1RfmeHOgoz+H4sPI29qqZ+7IPa2DVzLJbEWhy6aaqJOU2fwWUMaB9Z3DqhU/kRA
	LTMFJ3U8e8vUmlGGNFIOEsFZOCk5vtFE2n6dgMUjlXR8BYiDcjez+i0NJrv50SZb+lTAEzbG8+B
	ZnLz5KbWwuYSVm7eKiL/bopKDXH5gCuL78QgpOHbayjJ/EKcJrTg=
X-Received: by 2002:aa7:888f:0:b0:82a:17b6:53ca with SMTP id d2e1a72fcca58-84336bb0236mr4556610b3a.38.1781203072951;
        Thu, 11 Jun 2026 11:37:52 -0700 (PDT)
X-Received: by 2002:aa7:888f:0:b0:82a:17b6:53ca with SMTP id d2e1a72fcca58-84336bb0236mr4556584b3a.38.1781203072506;
        Thu, 11 Jun 2026 11:37:52 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84337bbbfacsm2555666b3a.20.2026.06.11.11.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 11:37:52 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 00:07:02 +0530
Subject: [PATCH RFC 6/9] arm64: dts: qcom: shikra: Add ethernet nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-shikra_ethernet-v1-6-f0f4a1d19929@oss.qualcomm.com>
References: <20260612-shikra_ethernet-v1-0-f0f4a1d19929@oss.qualcomm.com>
In-Reply-To: <20260612-shikra_ethernet-v1-0-f0f4a1d19929@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Russell King <linux@armlinux.org.uk>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781203027; l=3434;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=oMO8EvsYcPF9+TMaWUdj9tkVVxeogwjZP8T4RkGhCRQ=;
 b=KroYwCn/3i+MFwy5h43g8syHSEKzKdoXtCPwEvaDoiOtf4wd25RpWtOWNNMR919JjBGGbXbma
 HmGbKLG9YAdASCvawXcOKjCh37wDC4o4t2BxpzwI7B08uNFv+rgwL5A
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-GUID: JKYxHgzWkIA5hdu1kQjL2JDxeEOveDtE
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDE4NiBTYWx0ZWRfX9BFvdGATk55D
 vWGTT7Mg5fK0Xsr+igrLax0OEWZcvM4UeK4CqiY+EcCAfUJnPUpNKhFLUGkebz23qm9Ymh9ugX5
 Cr8ef3Idofp54hytf+2nPYXG5cG1G04=
X-Authority-Analysis: v=2.4 cv=Qp9uG1yd c=1 sm=1 tr=0 ts=6a2b0081 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=z42-wsbaeSSsZQV_GzIA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDE4NiBTYWx0ZWRfX21TsJVOycmFj
 u2nfRPtq9gRAMmRyg2Hwn+ro1tKeRaEAWutYt8yRVjIBmOFEszpSMyKinUsPM0DGGiMT5oLAgD9
 0jvIqVz/lUHvbxd+bXbSG8qwSxl6go5lW7+gwSsKEA0C4gVFIyibYqG58PWbp7fPtFhQo+VjgdQ
 cvsqiqwEUi/h3z7y7+afZUzuylKIeqYjF42upEV/rMigFJmskMIr7Ezc9fJmRnf1GmLyq3E1dws
 vdw5BexGzKL0LYaCfEepbVz6cEIBWEqWbeluYecenFzKhaW7MoQ1GWmq/JUdwxbQ26nH6s8IwVy
 0ZUBpNlDs8Gt6lvREGHPOjHBYpalJYMo/28H7U0Es45mDB8EYIwfvHvFJfs+D8y4T+h6+KlpDAv
 Jy6XtiRC99UPipNoj+SNAvOOsKLRFs+YBLLZ7KYyCkCeneFPaI+qEAqsIfp8BFbPdtbo0jOU6br
 CVRq2kyOSVWQuryFLNg==
X-Proofpoint-ORIG-GUID: JKYxHgzWkIA5hdu1kQjL2JDxeEOveDtE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_04,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110186
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_113754_133747_7626D210 
X-CRM114-Status: GOOD (  12.33  )
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

Add the two Gigabit Ethernet controllers present on Shikra (ethernet0
at 0x5d00000, ethernet1 at 0x5d20000).  Both nodes are left disabled;
board files supply the PHY, pin-control, and queue configuration.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 78 ++++++++++++++++++++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index e67fe047a683aa566b444a847b57b4b47a25aa8a..cac1573e3eec9e52b62f4b4cd7c564c70d0d8f78 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -1990,6 +1990,84 @@ gpucc: clock-controller@5990000 {
 			#power-domain-cells = <1>;
 		};
 
+		ethernet0: ethernet@5d00000 {
+			compatible = "qcom,shikra-ethqos";
+			reg = <0x0 0x05d00000 0x0 0x10000>,
+			      <0x0 0x05d16000 0x0 0x100>;
+			reg-names = "stmmaceth", "rgmii";
+
+			interrupts = <GIC_SPI 478 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq";
+
+			clocks = <&gcc GCC_EMAC0_AXI_CLK>,
+				 <&gcc GCC_EMAC0_AHB_CLK>,
+				 <&gcc GCC_EMAC0_PTP_CLK>,
+				 <&gcc GCC_EMAC0_RGMII_CLK>,
+				 <&gcc GCC_EMAC0_AXI_CLK>,
+				 <&gcc GCC_EMAC0_AXI_SYS_NOC_CLK>,
+				 <&gcc GCC_PCIE_TILE_AXI_SYS_NOC_CLK>;
+			clock-names = "stmmaceth", "pclk", "ptp_ref", "rgmii",
+				      "axi", "axi-noc", "pcie-tile-axi-noc";
+
+			power-domains = <&gcc GCC_EMAC0_GDSC>;
+			resets = <&gcc GCC_EMAC0_BCR>;
+			iommus = <&apps_smmu 0x0380 0x0007>;
+
+			interconnects = <&mem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ALWAYS
+					 &config_noc SLAVE_EMAC0_CFG QCOM_ICC_TAG_ALWAYS>,
+					<&system_noc MASTER_EMAC_0 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "cpu-mac", "mac-mem";
+
+			snps,tso;
+			snps,pbl = <32>;
+			rx-fifo-depth = <8192>;
+			tx-fifo-depth = <8192>;
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		ethernet1: ethernet@5d20000 {
+			compatible = "qcom,shikra-ethqos";
+			reg = <0x0 0x05d20000 0x0 0x10000>,
+			      <0x0 0x05d36000 0x0 0x100>;
+			reg-names = "stmmaceth", "rgmii";
+
+			interrupts = <GIC_SPI 458 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq";
+
+			clocks = <&gcc GCC_EMAC1_AXI_CLK>,
+				 <&gcc GCC_EMAC1_AHB_CLK>,
+				 <&gcc GCC_EMAC1_PTP_CLK>,
+				 <&gcc GCC_EMAC1_RGMII_CLK>,
+				 <&gcc GCC_EMAC1_AXI_CLK>,
+				 <&gcc GCC_EMAC1_AXI_SYS_NOC_CLK>,
+				 <&gcc GCC_PCIE_TILE_AXI_SYS_NOC_CLK>;
+			clock-names = "stmmaceth", "pclk", "ptp_ref", "rgmii",
+				      "axi", "axi-noc", "pcie-tile-axi-noc";
+
+			power-domains = <&gcc GCC_EMAC1_GDSC>;
+			resets = <&gcc GCC_EMAC1_BCR>;
+			iommus = <&apps_smmu 0x03a0 0x0007>;
+
+			interconnects = <&mem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ALWAYS
+					 &config_noc SLAVE_EMAC1_CFG QCOM_ICC_TAG_ALWAYS>,
+					<&system_noc MASTER_EMAC_1 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "cpu-mac", "mac-mem";
+
+			snps,tso;
+			snps,pbl = <32>;
+			rx-fifo-depth = <8192>;
+			tx-fifo-depth = <8192>;
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		dispcc: clock-controller@5f00000 {
 			compatible = "qcom,shikra-dispcc", "qcom,qcm2290-dispcc";
 			reg = <0x0 0x05f00000 0x0 0x20000>;

-- 
2.34.1


