Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C686CA0EE9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 06:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NsIfrvTLDxKj7MQKwmdBE+vbOboHExWTllcv4P/M3bA=; b=By2GxrbomsvumhixhQ59h1h4l8
	nxFvipgajSCtl7XP0QuNX8P3GWypNCBP/phPG8hNIeTmELXysqHj2X9wkSbbRlZGTBTZegYQOQlV9
	aFqmGl+U2lpsyszFniJET2b+Iw8hr8zneLgnE9+yVMl50MYT0bUK5DVynQU1jEKGoog0CgV8Yqd+U
	5AyhiEuxFG1bJzqLw9TMxwX3PfHCOUQEBkthnYkDWX9caGNF5WnEbFAJsy5MFZhtO+teNbWCEvGyX
	gJzlnf4vGwHjDhXmqiPD/JnAEcVCImnRPemezlLpsBcQj8rItx+ZJywjyyqJ+BeNErsfkvxz7EvbU
	BgQ9gBHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoGAt-00000009a42-14xL;
	Tue, 19 Aug 2025 06:50:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoFxn-00000009YL2-4Aw5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 06:36:57 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57INpMO9026407
	for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 06:36:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NsIfrvTLDxKj7MQKwmdBE+vbOboHExWTllcv4P/M3bA=; b=c+JMjzgEcVFmcxER
	v3JF67q6FOkC376kvXdUcyupeLy+T1ZB7CInbTGMcmOqLH9pfIQJBW36EzhEpaBq
	DbrcoBs2lK955IEMidOTVzVyfT5r2YUqIRQ7qj6CO6diaagvPNHPsKGyML2HGMEv
	D2gzTc+lJMlCGsx8pbAtcoLHnJZyyTGWfK1a+H63aMZXvVqNOaLQGv64d1Thl/s5
	r//HcGmwGHFurajZqtmQHu4O0bsO/9P9ludM8U95If+lfO5bRdsdwjbVF7nve8cI
	sW7vTww3IVzI5faDIxEYcFwv5e/lDUQaHRioSqn+w4sCntTJn+Ks/YWsYccxhSrs
	pBIyVQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48kyunupkg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 06:36:55 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-24457f440f0so54700445ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Aug 2025 23:36:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755585414; x=1756190214;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NsIfrvTLDxKj7MQKwmdBE+vbOboHExWTllcv4P/M3bA=;
        b=cOtumYWd+vVRT8baBTWsHRUL1hH/6Q8Ay8cOkLrPUC7NOJ6q7XtGb3fjhRGDhHd4da
         v+6Kq9kD4OacY5o5fsd61t8B9/PKn3cdKsJxFnnWs1Kg8vy9jtHvUt7nrrD5P5MhGxsw
         zdIh8S2XwSicDLZ3yAqI8SZnAPLM5aAM5MBSCClUOb8dHnGmMv7KRERFks3/ppIYJulQ
         pBShpRsGC/UJngX6ZWMZG5HtY/NfKIlLisDIjeepN0PzAwlzHKlhtL+VYaxb0XaHkomP
         VUhvchJiJ2qBZzH0UsakDHkfOFBArQuQpprjCq3FyVVkSUe3U0M23LuVsUVVwED9qjIr
         rWVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXS5TBwjhRCx5kB66jtaudA9DqvFScEIWcTkZe61WA1IONdb+hmgwBFS5YJlpCVAmQdVnZdwKZXwIdLSlvvnNEB@lists.infradead.org
X-Gm-Message-State: AOJu0YztcpV5Cs+QD2AXr32Wgk2PhYZRVcDF3cfdkfwrU31YsnGXyko7
	/3OwBylXVgL7XmC5XITu+j3Jn0dZtwxCTylexFxzPbpYun8m8tgOkaJGoNNv9b9OjQdDZx+X2ob
	KAiO9QDNdbhCOm94yYxvYljdrPpuXSiBJughq3L0yEEmK3M/V15QEC5udHRqj0ZaAJDr0b+2lOu
	DN1w==
X-Gm-Gg: ASbGncvNlYf1NtrYUTDv1nzY9Rwab4QspJonE9Ns299ZuEhz4N2JUDKBzExpnZ6v5GD
	4KelAcVxfztGb5VgXHXQvj+AqhDaWFPuz+c82ckip97nji1vOpdqnK5IWSO3YUPVYaxOhzBS4U6
	w4l7021E/7SYa4tcCM1fVkbomh2c9I1LF+sNGkASZr7aU1/sOMxGEZkF5KUy6QET/PpErQWVC9I
	Dd+yFfj6VowW9f9hnwF+yBZf0J4ZgWTBVPagV94e9CIv0+JYslY7w6Q3vFeTsKl7n2eBgjmUMoN
	E/+esGIjPLVZA4r++vREKdXcKY2NY1+Epa7VrEjEbNh3HoO4Nt5AsLIDns9+PDI+2+R6P2q2302
	PvXLfiSI/YfxisaGGpTwUlAGSWrIYYQIQJA==
X-Received: by 2002:a17:902:fc50:b0:234:a734:4ab1 with SMTP id d9443c01a7336-245e02c1277mr16956095ad.3.1755585413790;
        Mon, 18 Aug 2025 23:36:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOco999Bi1j/ttDYbCi3adNC02Vim++BGoj+wK9RJiQcjLfwcPNu9Sf7OenyvPy4yfGschLQ==
X-Received: by 2002:a17:902:fc50:b0:234:a734:4ab1 with SMTP id d9443c01a7336-245e02c1277mr16955945ad.3.1755585413364;
        Mon, 18 Aug 2025 23:36:53 -0700 (PDT)
Received: from yijiyang-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d54fe38sm98120455ad.135.2025.08.18.23.36.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 23:36:53 -0700 (PDT)
From: YijieYang <yijie.yang@oss.qualcomm.com>
Date: Tue, 19 Aug 2025 14:35:58 +0800
Subject: [PATCH v4 3/6] arm64: dts: qcom: qcs615: add ethernet node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-qcs615_eth-v4-3-5050ed3402cb@oss.qualcomm.com>
References: <20250819-qcs615_eth-v4-0-5050ed3402cb@oss.qualcomm.com>
In-Reply-To: <20250819-qcs615_eth-v4-0-5050ed3402cb@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, stable+noautosel@kernel.org,
        Yijie Yang <yijie.yang@oss.qualcomm.com>,
        Yijie Yang <quic_yijiyang@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-5bbf5
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755585388; l=1620;
 i=yijie.yang@oss.qualcomm.com; s=20240408; h=from:subject:message-id;
 bh=esGpkrp578FqjkRZx/3YPPX9onv/FUSUV77hdcvh6nw=;
 b=SUGbTSGQ410eDz8ELdraMbuF+QvX9Z7EjnQVSHXQrih713dfkqJqB0VRBBkKfxTattHHcRdCV
 LC73TCyJ5V5CFuy5wSYE3kML7+6fQj/5Yhsi4kHtiXSyscOKAuX5Nlo
X-Developer-Key: i=yijie.yang@oss.qualcomm.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-Proofpoint-GUID: Y1YgG2TM2y9mmwz5ZoXhPRwj8oSzhSh8
X-Authority-Analysis: v=2.4 cv=N6UpF39B c=1 sm=1 tr=0 ts=68a41b87 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=ufJ1yBTjRq6Z22V5Zn0A:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE4MDA3MSBTYWx0ZWRfX0pV4LuPDxpDA
 1+/nOMe/k6xhsdOOJ1Cm7EYYhQPvdjDh8mG79eHawQh/e+km/vz90tYpuHqFsS5ejHH8l8Sr0Ct
 WiHA2qBfOzMnSRcUPwKLqDFxoln74C6rQ6D7e/RiAWouvQYa22usZjRk3TEp30K/310Ky8p/kzZ
 OHEFfu1BqZsHtcEYDbUwtzbtBazkc2gyn9YHlYI0eU6+Odk81jhBUTU/XgizuLMOgrFpiO9BwLh
 bwjXxK16Xxs274zWBulQ/p7hTirSjAATx95bEdlQmJ+s4+V6SW9aRaAAiXgHtqlWqfEbRHOUVTo
 BlENNf4v5CiDbwUrO+f2AchiQSOao4v1ZspGtOq9ArEebfELcjrwShZsGHQKvkjSOGHfJurSgBm
 4kuyKhNJ
X-Proofpoint-ORIG-GUID: Y1YgG2TM2y9mmwz5ZoXhPRwj8oSzhSh8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508180071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_233656_260674_87643C77 
X-CRM114-Status: GOOD (  13.08  )
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

From: Yijie Yang <quic_yijiyang@quicinc.com>

Add an ethernet controller node for QCS615 SoC to enable ethernet
functionality.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sm6150.dtsi | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6150.dtsi b/arch/arm64/boot/dts/qcom/sm6150.dtsi
index 591fcb740259..8ec97532911c 100644
--- a/arch/arm64/boot/dts/qcom/sm6150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6150.dtsi
@@ -491,6 +491,39 @@ soc: soc@0 {
 		dma-ranges = <0 0 0 0 0x10 0>;
 		#address-cells = <2>;
 		#size-cells = <2>;
+		ethernet: ethernet@20000 {
+			compatible = "qcom,qcs615-ethqos", "qcom,qcs404-ethqos";
+			reg = <0x0 0x00020000 0x0 0x10000>,
+			      <0x0 0x00036000 0x0 0x100>;
+			reg-names = "stmmaceth",
+				    "rgmii";
+
+			clocks = <&gcc GCC_EMAC_AXI_CLK>,
+				 <&gcc GCC_EMAC_SLV_AHB_CLK>,
+				 <&gcc GCC_EMAC_PTP_CLK>,
+				 <&gcc GCC_EMAC_RGMII_CLK>;
+			clock-names = "stmmaceth",
+				      "pclk",
+				      "ptp_ref",
+				      "rgmii";
+
+			interrupts = <GIC_SPI 660 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 661 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq",
+					  "eth_lpi";
+
+			power-domains = <&gcc EMAC_GDSC>;
+			resets = <&gcc GCC_EMAC_BCR>;
+
+			iommus = <&apps_smmu 0x1c0 0x0>;
+
+			snps,tso;
+			snps,pbl = <32>;
+			rx-fifo-depth = <16384>;
+			tx-fifo-depth = <20480>;
+
+			status = "disabled";
+		};
 
 		gcc: clock-controller@100000 {
 			compatible = "qcom,qcs615-gcc";

-- 
2.34.1


