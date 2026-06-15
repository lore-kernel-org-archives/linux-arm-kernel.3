Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73A63CD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 07:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XeXuSTBUDtUckVxvoOvS+dfvJD3DA/ozz/evToIu/as=; b=z/w/oopOC1uZHhdSZyJMRDRYXu
	VrwkeVZzNC4TY/CfwCDjmqTNed7f+1uDKOuVwEKzYpvS6U/p2zd2zVRq2DYuGntgrkq6i+VmJFu1q
	QgbfNfq+mT37xqtxGUsZyrHVBcN62fW8UxJ8Kjzs1rknnSKDrZciClt4hbErlgsCTSjXq6RUaqGkW
	Bj7sLrsTg0wwldOj+rDan6dkEepeGrQy2YUmhPra79fTKvkFPfduX+jwTN3E6JVsJC5SsPJPst67v
	Yw7x3r2kcQUN8rtmuwB1RS46Sktng8IMTzSocQnfO/5Fkj0GAutJi7Jh8jsa5DR4FkhP9JAFTSewM
	BIsVZJRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ1VB-0000000DkHw-44A2;
	Mon, 15 Jun 2026 07:12:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ1VA-0000000DkH7-0Htg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 07:12:57 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F6K9sD3692439
	for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 07:12:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XeXuSTBUDtUckVxvoOvS+dfvJD3DA/ozz/evToIu/as=; b=Iemi6Q5S+B1d3D4z
	UlUHeB+3DZ8h0eKj3YCeH7Yjx4D0c1CsTmaPKtLow2aucdVz+8W41Ps+o3+94PQZ
	r/fjqlSOOOO356AiNKX7wGDD3QUwERwZp4CAQwtXyZOqDoRKj/aHyKJpyoAULFDz
	9XM4dKtQPrzHu/1OsNRQDCipJc9yzwTkVqJF+PkgWQlTCdMGMrH2eQqKuSRAn6YT
	IgQZWPNPBiLPnSAkAq4V0ZxC7BcRyg8TRnm57cjVMAWBRws6M0gxClWZu/EY3v1b
	Tl1oeMopQqlL/Cb4wdCnXoRnyW08DEb5lvmCOsXXVv5nI60AMU8Ocyru1HEvmmdw
	uENgqw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eryk6e29n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 07:12:54 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3773f1eaf91so2115068a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 00:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781507574; x=1782112374; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XeXuSTBUDtUckVxvoOvS+dfvJD3DA/ozz/evToIu/as=;
        b=R3OFU+qFaBVDRyHLGxcnEs2XbFSCEQq0pFSB7kRJoCH44caC7RPDV9d+VrWdYCvv3y
         vEQczJKRSo/9KdVxZUwLtvskHhB3ozPn1sAoDheqXueuL279teAC/sJq5EmQcma7i820
         G5Cj4V9YA+G0t4LqwPMgMuzy/r9v6X2Ns+7NCc0fmCzLFl6gLivLxyYYaZSJuurHrhvP
         XTvCaqGa8h4Tn5XO31emlbvDn+CRa/f0kq6oxluSUseEV/zA5y+JdFGkL9I0AO69bNXG
         3pB0XGtwuku4bNfKFM+FMLTFDES4pG7LMgsdBpb1Csq5YzC7zmd7H8Sx9flzR6d0JAWz
         bIuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781507574; x=1782112374;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XeXuSTBUDtUckVxvoOvS+dfvJD3DA/ozz/evToIu/as=;
        b=EcrqLRFPjytKcy6FLTjuYtfcpFfIm6M+MUZ+gg1/+8a466ArOV9kwSXsQEHLlTMcbp
         XSnfUWEkhz8/q6Yb4gLteBAQQv3Wb3z1TwbZBDCirja3kW2LHArZpHlOB9ooFGWzD5XV
         WxtjbVrmA1aY7FwY+fWX4YWxlV3uFhk04DX/EWWLafVgg7q0hRDLXktaIz/k7tjfRU63
         VwgZNbEl3PBoCwSoEMYvCB6rK9DNBkPMzDq1UNJd8Hl/YaRXjr2eTJIQdl1Gp4GBu0ay
         zFETFKefsXgUxXqkzX0RFdIl0Tgc3211nYCil0XrUhpfaX3VXHJ+HGdDKZkU+3t7Taph
         Q39Q==
X-Forwarded-Encrypted: i=1; AFNElJ8f9FFE1rInmThMZXfEb7w3+8Llw0ciKKT69XcLEriapVlEG6KW9Ayoh1yDwWOzsPsKjCbVjSGDEBqu4BLCB9HU@lists.infradead.org
X-Gm-Message-State: AOJu0YzfHjX3xpzz+mir/6tyx7ALQYet/Y+WyFsRS2qecY2iT8C51Miu
	Ae2drQ9JLpINgTxtgY0r4vx4j/STuTL1w7haeEiI55PKHrwc/GlES9767uXloxS+1rv14NJtEPy
	N9nDG7HPXQ5D0AYCsAxUCCO5bMnJiXBr+ylbLsColwjrMLox9dUOmQ6zljVRfC33kAKbDVGm8qh
	IxbQ==
X-Gm-Gg: Acq92OHXvFIQ2GQL1PjXZ32NFTcL3P5S/vV3676DydIupKJhEdzXTah6sfwKzcd3TrH
	z348KQRAC9EF5wrKczxPxrpOCUMDcK/cuKfdMO/A5IbxH6b+GpqfC0MVG0Hk9NqVVuVJVv58unX
	NmMUM4NwcYKsSiKMEhfaTIlTZX8N1p9ItwW9UO5Ja2MBo0bdss2gxLtOGWgqPOxVJn2wGvUo60J
	sXHn4DsxK+trlAiHE07V5aN3qBPCbeIoivRMLo/Yqm6mzXXvkC3O1gemnGiD4iosjYxj1npFjkp
	Gj7CglO5XT7UVfZlgeO1LPO5X7p7+gEUGTkaP0JL1YaTYFYkHlRxW8DSLPEEPlnBRc9X2gC6mAd
	DpkbRUcNx/d41uchdTTZ9DLuBvM/RmueStGPKKMg0nwUd+2Kw/yqP
X-Received: by 2002:a17:90b:1c09:b0:366:2e1f:393 with SMTP id 98e67ed59e1d1-37a03ebe902mr12846055a91.21.1781507573930;
        Mon, 15 Jun 2026 00:12:53 -0700 (PDT)
X-Received: by 2002:a17:90b:1c09:b0:366:2e1f:393 with SMTP id 98e67ed59e1d1-37a03ebe902mr12846012a91.21.1781507573427;
        Mon, 15 Jun 2026 00:12:53 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a2668cce5sm14867474a91.16.2026.06.15.00.12.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 00:12:53 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 12:42:13 +0530
Subject: [PATCH v3 2/6] arm64: dts: qcom: shikra: Add CAMSS node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-shikra-camss-review-v3-2-8183481f48d0@oss.qualcomm.com>
References: <20260615-shikra-camss-review-v3-0-8183481f48d0@oss.qualcomm.com>
In-Reply-To: <20260615-shikra-camss-review-v3-0-8183481f48d0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781507551; l=3937;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=FD/YYzeYflttpFETR8KNzzuysuLGEKsTDke9rdJBgPs=;
 b=jcVZCP4apBgm09J+irO0tk1USXAmLXj/HWvbeobqVoyNCmVhZiorPB1J0WVNlRDLgp6ed+K43
 229TT5//GvtAKt3puMJbFWAriZwG18b0AiWjEqIl/DiiyBe76O/CtoE
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA3MyBTYWx0ZWRfX+4UUEHojkjjx
 AyIB7u5Xo0Q4ECR2Ii5aV/s8zk6Wn2s7JemylH2nzbrhqAHaucAYfFtEPjvY6996ods0wNc4Qic
 IN/GtHjRM3FqLtMfi6yUnqEEHAdYn9I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA3MyBTYWx0ZWRfX2Sjq4K5L7IBF
 Ja8XSZhD9AU6HXb6ZX4dyd26x0pStb1r+DHpH5WcHVBOIqmnY+tGr7R7xT+hkipVXJwWy9fDgXV
 5oR4Wqe7ONOK+Jzv7K9QJ2BmYRTc5iSvYg8nZTGBypP7B4GUJweqHdqIdzd4UaZUk5PT9x5oPSW
 kBeqkRw1EVRgnVPnKlQa4+193ur8NSHeGwepLw/HZZwuoP9KiIQSp+hb4M83rRszVqWrDSSnhfU
 Upy0NPeqA4tzlJv1BOSU3PNan5LM7ei+ovHMZkaIPdR9ZjCwhBvEo/uSEDi50Zq8a/8H3VfL0yX
 BqvW5gh0x+ORCgi+HqozpaQm7VtNgiKkbyjNsOOPS6Gs2W17yoRN7xk0NHhT2VwE6OS9ODlLteZ
 SOAjeEBhsE1814QuugJVFlf1KWi9s108LqmsGKlzBelJ0201oOENdf/NQh/YQg8PsVGw3mpT3X7
 14dOW+jL+Q+R9+1JbaQ==
X-Authority-Analysis: v=2.4 cv=NrThtcdJ c=1 sm=1 tr=0 ts=6a2fa5f6 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=ahKksh3eZu5pIVwncigA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: Gu-bTn-iCmykbzb70m1IkC34pY7Cpu0J
X-Proofpoint-ORIG-GUID: Gu-bTn-iCmykbzb70m1IkC34pY7Cpu0J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_001256_230360_20BE8835 
X-CRM114-Status: GOOD (  12.70  )
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
index a4334d99c1f35ee851ca8266ec37d4a200a07ee5..f0e827996609dab2c09834857a1bffd9560155a6 100644
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


