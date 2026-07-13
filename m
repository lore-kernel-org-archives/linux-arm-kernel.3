Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 485C1C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 09:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ut4KOCe/6QCkbZVxR+fuKzOonTDjyvlhOXIbY6Oo+2A=; b=iKlHFiU6NUzM7Sk5ChY/bqXMUy
	znDhHv2l82eHZISuuK7svdSAH+hHyDm1mRCnkDeZ5nlQRF0ZBOikqYdnSeGgCGBHtkPCtVse5GAgh
	iJ0wibYWaaXkHKc9n6p9lIUYsmUatrHsGxy1/NCntwlnxi9J/cizOWqMVEsKYQt2e2/cNgg3vfgWI
	D+Q9LCagVOl8ACPfpV2m2sdT+e8vkMYkMVgXp1fq5JzydzrbOI1zNTJSg2cqCR70XMSkwSDHfPctY
	myiHCGoEMScoCfQeWsC69NRJChkERhIPqzJL5EIMVmuCQFgKu++vfmouq1ycNdifrL3/2uMltqKrx
	aQ2dfzOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjCyH-00000008jEz-1z9a;
	Mon, 13 Jul 2026 09:29:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjCyF-00000008jDt-0Geh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 09:29:04 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6Nf98469272
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 09:29:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ut4KOCe/6QCkbZVxR+fuKzOonTDjyvlhOXIbY6Oo+2A=; b=jTCrrdwzM7yV8DwL
	A59FJdHwl7m/4IMpC5V4jAtKgKbHbm/1w1YXzxMLjYce/VuikHJdsd173Zl53q6k
	8s9Mq2zLk4pCd0NVB3AYJjN+nINSdGB7hFhlkCjSPXehrpDXAJKHwsSDsQilB68B
	UulyMqIzHUEXL7ja1yVmaDIhXDC8/AmP5Wn11CRUpXODBc0Yk8iM+/hmSaZg59VT
	FsVgau60jwfv/Jij3NvaYvIN9LvsSa940QSY+PPWiC9S+4qIbkdVpivkWghg3l3/
	t6W7UWAtYSveMskhE2F/bVM65uDsrjpWqCBYdf5J/b71WJ1AaPkTUxXqsCxfQ4j2
	p5FYMA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbf485dru-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 09:29:02 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38dbe39ce62so2311338a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 02:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783934942; x=1784539742; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ut4KOCe/6QCkbZVxR+fuKzOonTDjyvlhOXIbY6Oo+2A=;
        b=Uuh0O5BCcrVZToChH9QxSymdqvW+mO9qPEG9AE/cHfNhUyy2lOKyWAy+jtQOp2A8l/
         8FuL8l3nKG9sekZ8fAPekrkqTtFkXVfoQ0jq99LxVibTe7oOfc3ygQuDbRJxKnDMOG9w
         lvuzpoMJ13KMipEXhDKgjnX/cNrkLQeZ5vc4/cUqDG6ujhXYK7UglT8uII0gpyhtS2H2
         bGErfng9sKc1GFx4oY+CSIRi3edldmN9QJnm6gbd7mJi7SUBdOKLas8Czd7cxhkU/oWR
         //B+CMBkVLaOAsTp6TMKzAfl2o3d+rYvE77TxIE3ka1unZA92phwh+DQQfPnnqMv+00A
         8p1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783934942; x=1784539742;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ut4KOCe/6QCkbZVxR+fuKzOonTDjyvlhOXIbY6Oo+2A=;
        b=OtwH/XLlomaPIfxRTg0a7xjXkscR6eVWnQnBB93OHcNoymypM8xgUwEgfjSojk9wBK
         aKboVA3pTn5QzOx2Z7Fhb8K8pu8/nuQ4r/JU1I0j0t687PHOBERHb/R1pyC8hQfr/Edd
         Quvg4gnIO02brYvp7VkNqWuyZR+K46fHNUOI80+9xesY03XYmt8dSdUWYdS29TvyG401
         zznpQ7/yL2Rj9y03s7iJnN9LeYW11I6ZJQOVoLzuSl/WYGuVPoqKeFM0VWpRaPhKlGOS
         qyd2ze9qMqFYAgo9NkOZKYhzCIQWpH0GROkMJyivKiznJvrCc3QRxEykCmDTiAV5TU9P
         ns+A==
X-Forwarded-Encrypted: i=1; AHgh+RoCtcXzezPhfRGm84lyMDRbi2VJkT4daheboUYeYdpx9+TFGSVa/fz9A9uPViyvOUYDDz/ifB/I1lamfHwuA5cD@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6RfXOKP9D+LSQFFDw+MsL9xrVTMRMN5+T+OX9D+s61RWYF0Q4
	6hlK5ksyQkNzYOpbM7tQAIF7sU7ehz4qU+zLWdh/tj85UyCC0XSnrZdLmTfXNLs98YTmuagFkM1
	nkiKln1CxunX930JPKGrtb4m8Ii/XqfgM0FzMAHakD8s5stzHUtRte22JfluPSAiYcGVyd+ABZw
	/LYQ==
X-Gm-Gg: AfdE7cn8z4UvahaAUFXKbHrx2mtk9ua7TyGo7lXRQ1uNBvm+r3uFInNNJ4wQY9whheH
	ZEx0MDxLyjx4gKh+PhOJM8PLoQwCusqWmwRpg+bhr+vslAtztAhCPceK/lV4NNNii88F82xqCN5
	zyqYAGzaec1n1M0sloZUa2g8/CUyzdcAG1Ll2dONSMOSFuAbbuF5UCUGreykNZtwpWaj9+lKvl6
	1IKbd2QNf1wmxcoMN7gb08UH7A9qUp8cpHQPQoK72bDn/JhBQFdWL3F2ZiaCsbF+/poYIWELOw6
	MjyHl0JWi8TPUyDiiB6BqeF/sSGA9/6Uq7JLVgpQTBtn/sPXRvy7qdd+4oQJN+iVC5g7zPdnpY2
	uVxbSjglSDTHBnDj0ULiIe4N3T+uHZWhSiZ3u3wq9zg==
X-Received: by 2002:a17:90a:e70f:b0:37f:fda5:8d98 with SMTP id 98e67ed59e1d1-38dc7e28254mr5920226a91.0.1783934941812;
        Mon, 13 Jul 2026 02:29:01 -0700 (PDT)
X-Received: by 2002:a17:90a:e70f:b0:37f:fda5:8d98 with SMTP id 98e67ed59e1d1-38dc7e28254mr5920205a91.0.1783934941389;
        Mon, 13 Jul 2026 02:29:01 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311935fd091sm47495569eec.24.2026.07.13.02.28.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 02:29:01 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 14:58:33 +0530
Subject: [PATCH v5 2/6] arm64: dts: qcom: shikra: Add CAMSS node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-shikra-camss-review-v5-2-db53be15dc4f@oss.qualcomm.com>
References: <20260713-shikra-camss-review-v5-0-db53be15dc4f@oss.qualcomm.com>
In-Reply-To: <20260713-shikra-camss-review-v5-0-db53be15dc4f@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783934917; l=3937;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=sJSdnjQ8F9thY4CJ2jAN6HxsC8VOY915E4kKmKwM0aY=;
 b=ExFXa4TwS4p+Rvq4zfW1IXT0AAGbxMEnwbUW7xnnh/d6w+npzuOOhBiCrxSUD2EqJgB5h/BMV
 fnHIzCQvvCWDxJkkjK+Jp1iZmGkEPftJMA3LHQu5V7XmifTM55C49uD
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA5OCBTYWx0ZWRfX0IUSrIPuSNdD
 5Ixq/en4dEtfbl+IgE6MBuKwt2NBzIQKTiBJHHDZw4vDNnTwhGD2vcnv8mdJx1gXviGhPOBer8D
 q/2pljTlrihivUQDqmP4E6GXa/b/01k=
X-Authority-Analysis: v=2.4 cv=OsJ/DS/t c=1 sm=1 tr=0 ts=6a54afde cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=ahKksh3eZu5pIVwncigA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA5OCBTYWx0ZWRfX4UHGnlcxMXzX
 xn/BouzORnTXVsHlzea2WQGuC5whDmjXslbJ8390bsVr3YExYPYKSgxZhG5vzP3e0LQg7nZk6t1
 7NwFNeGHVGoGURnw4MdZKv+6wmNrds6fqNDwU1GQyzFTA1tr5sBTfHAgnwCTx2qONxwGD9gRlD7
 AoyZsqdjZAIzihN7M4YKadbSzVZX7OtwVXC2abqMttUs5ylRYl682eGuq+1tbr272qawm4zIYXU
 jfMPQm4lRFJCxCNH5b4r5ghWXz5WmNnmYaa3n1uIoITIVWJRvbXNwzMI2lfWBCZfvjAUIyryBqg
 XcAmMQDmjvmxYC3L5iCzTNpVAkxfDswAs7YG7NNANZyp3qdShHOvNxJo9m3wZODpitEa7kLa3ZE
 tPw0fAlXNNnSSait3avqaG1U6SdLDMLsYdipywOgFsT6JAEvERRLEGhDkINmgsfpWK2yq6ipJR/
 69vcSNr1/u4lMsejeLA==
X-Proofpoint-GUID: VlDnp82XYNbFshtq7AfteJdzp1GzpK8d
X-Proofpoint-ORIG-GUID: VlDnp82XYNbFshtq7AfteJdzp1GzpK8d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130098
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_022903_115540_2CDD0610 
X-CRM114-Status: GOOD (  12.96  )
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

Add the Camera Subsystem node. Shikra shares the same IP as QCM2290
with two CSIPHYs, two CSIDs and two VFEs, but does not include CDM
and OPE blocks, so only a single IOMMU context bank is needed.

Co-developed-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Signed-off-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 100 +++++++++++++++++++++++++++++++++++
 1 file changed, 100 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 4e5bc9e17c8ed8914733ac9fdc9b69128b40216e..6335caca329808ee04d9067f1f95e8075e2fc3ed 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -604,6 +604,106 @@ opp-384000000 {
 			};
 		};
 
+		camss: camss@5c11000 {
+			compatible = "qcom,shikra-camss", "qcom,qcm2290-camss";
+
+			reg = <0x0 0x05c11000 0x0 0x1000>,
+			      <0x0 0x05c6e000 0x0 0x1000>,
+			      <0x0 0x05c75000 0x0 0x1000>,
+			      <0x0 0x05c52000 0x0 0x1000>,
+			      <0x0 0x05c53000 0x0 0x1000>,
+			      <0x0 0x05c66000 0x0 0x400>,
+			      <0x0 0x05c68000 0x0 0x400>,
+			      <0x0 0x05c6f000 0x0 0x4000>,
+			      <0x0 0x05c76000 0x0 0x4000>;
+			reg-names = "top",
+				    "csid0",
+				    "csid1",
+				    "csiphy0",
+				    "csiphy1",
+				    "csitpg0",
+				    "csitpg1",
+				    "vfe0",
+				    "vfe1";
+
+			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
+				 <&gcc GCC_CAMSS_AXI_CLK>,
+				 <&gcc GCC_CAMSS_NRT_AXI_CLK>,
+				 <&gcc GCC_CAMSS_RT_AXI_CLK>,
+				 <&gcc GCC_CAMSS_TFE_0_CSID_CLK>,
+				 <&gcc GCC_CAMSS_TFE_1_CSID_CLK>,
+				 <&gcc GCC_CAMSS_CPHY_0_CLK>,
+				 <&gcc GCC_CAMSS_CSI0PHYTIMER_CLK>,
+				 <&gcc GCC_CAMSS_CPHY_1_CLK>,
+				 <&gcc GCC_CAMSS_CSI1PHYTIMER_CLK>,
+				 <&gcc GCC_CAMSS_TOP_AHB_CLK>,
+				 <&gcc GCC_CAMSS_TFE_0_CLK>,
+				 <&gcc GCC_CAMSS_TFE_0_CPHY_RX_CLK>,
+				 <&gcc GCC_CAMSS_TFE_1_CLK>,
+				 <&gcc GCC_CAMSS_TFE_1_CPHY_RX_CLK>;
+			clock-names = "ahb",
+				      "axi",
+				      "camnoc_nrt_axi",
+				      "camnoc_rt_axi",
+				      "csi0",
+				      "csi1",
+				      "csiphy0",
+				      "csiphy0_timer",
+				      "csiphy1",
+				      "csiphy1_timer",
+				      "top_ahb",
+				      "vfe0",
+				      "vfe0_cphy_rx",
+				      "vfe1",
+				      "vfe1_cphy_rx";
+
+			interrupts = <GIC_SPI 210 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 212 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 72 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 73 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 309 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 310 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 211 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 213 IRQ_TYPE_EDGE_RISING 0>;
+			interrupt-names = "csid0",
+					  "csid1",
+					  "csiphy0",
+					  "csiphy1",
+					  "csitpg0",
+					  "csitpg1",
+					  "vfe0",
+					  "vfe1";
+
+			interconnects = <&mem_noc MASTER_AMPSS_M0 RPM_ACTIVE_TAG
+					 &config_noc SLAVE_CAMERA_CFG RPM_ACTIVE_TAG>,
+					<&mmrt_virt MASTER_CAMNOC_HF RPM_ALWAYS_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>,
+					<&mmnrt_virt MASTER_CAMNOC_SF RPM_ALWAYS_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>;
+			interconnect-names = "ahb",
+					     "hf_mnoc",
+					     "sf_mnoc";
+
+			iommus = <&apps_smmu 0x400 0x0>;
+
+			power-domains = <&gcc GCC_CAMSS_TOP_GDSC>;
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+				};
+			};
+		};
+
 		qupv3_0: geniqup@4ac0000 {
 			compatible = "qcom,geni-se-qup";
 			reg = <0x0 0x04ac0000 0x0 0x2000>;

-- 
2.34.1


