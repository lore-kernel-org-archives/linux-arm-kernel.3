Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10DC5CD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 17:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XONe5QpG6DzBvhFVWtsDUR60QTo2WcBMmV2k8RXmilE=; b=OUKfYdmt+7QRno6iCPQ58BZXCD
	7BeXLnIWcQgzFC1H7TptCTJXvE7+leRZKsEgGo4yY3f1DpLqkRxEK5FrLHdmD4Cl0kk0UluDcNRjM
	KCyt0pHg/EV5L4ERGl58/ZVdDyyK2fijNbVzmSYiSa1eIZiQUId2VPai4igAJhuzIxgqCrhV4E/rp
	D4Hq8zBWwZ3U8jjD2UH/0KV+pe5UrIX3ARJHHEJIu22+b9i/gUfeOs3ksu184jM81W0m2EzS1wdxh
	G0BfoiMJdu/OuuKpQzi+acu7cvIUeynd93GxoVyOh5nw4bjS5Q8dtzMoqdPv+ZfMRIo+NyxStsrsv
	HJt0O82Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRvLP-00000002g19-2Ji4;
	Tue, 26 May 2026 17:13:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRvLM-00000002fzD-3vHy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 17:13:30 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QH0usi2022382
	for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 17:13:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XONe5QpG6DzBvhFVWtsDUR60QTo2WcBMmV2k8RXmilE=; b=Q9y+lIH9xCTcKaBW
	AzF0h1oAqTKTvG41lwd4fV3euOSkgHjEZJRZ7G66jdsSFW4Q+E8clAX2f8VGxICZ
	wjbR9qxtgMKoOr+CFmV5ttXt3bQ2OGTheN75GcChbPcZNURn7a2v84vGEfIgcvOh
	1mSd4fAdJpgl+xwriR2yNOB4oLto8lZC+V+wH+Wd/BCKm6slGrYoFn2kyuCG/UhB
	jabnJqljcHXinvRfmy1LS65da2JtHkOXEeWtw1hys8xmY928+f4v880B7JmPI4+m
	wDhi6ivDx0P8u4HUEgAMz2IpBaq+aSKnAGqZwa1uc+dDvaA9xwAPh+Clnkib/B3k
	opyWtQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edefugf4u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 17:13:27 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82f6e6a3a76so12928068b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 10:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779815607; x=1780420407; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XONe5QpG6DzBvhFVWtsDUR60QTo2WcBMmV2k8RXmilE=;
        b=XlzfjCwcP1PA/PlBC3drJlLZRa63TuV11Qt4cBJEudR7FKi6E8TXuRseD0sTHNxBSo
         hWiecURrBSJm1Sd6zP7nVmgl64rDeYhpRx2+rwcAkTvJv+EU8IYRywFyfAWUnC5M/7LG
         EEHk5fd0iLSQ5dn4Epl9eXa4GfqN93nRCc7B6+S5F/ATtXYNZ3b/ng81ePk0he/2WZ4S
         RbaLq7KUwzgulR+birnnWH61/gNU/NDQL1wk9+r6k/wEyxULi0zTJNN7R/XV269Nn8S9
         FmgDvSf+Cgdlt1phCib4k5+jevaEfePKiM8/Kfo+RXHM9qHI9elbRMcUGvYNceJt+huk
         u9yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779815607; x=1780420407;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XONe5QpG6DzBvhFVWtsDUR60QTo2WcBMmV2k8RXmilE=;
        b=MTnl27R6MVjMPUYA6AEshpG3pzek5+QB+tAD4w3bkvVPAIfddwlvIh3kelnCZgLhWu
         5ASzYpy4uJbgqyv77EMa6IA5TnNwCu4Ghx6yARyputzHdcNbULRSQpsb0uj7y3ZHr+dK
         bBqMwTB6dGtx4oxwEF956Om0eSwFh7TmC24KwwEq5FMbZEwhFDrgyvgF5ITMUqdq1W5s
         S0v87EOm27tN7EwFqMDtLpa20jthHBWYwPJ6fwOMXL34852EjDH5r9UzghJqjI8WgGsR
         sJ73FSS1CyloXvH2pm+k2QrDx/efwZ5HgTIcmd8bdQPEwUvsFFgmiKKaTREtRCPeOaqd
         sH2A==
X-Forwarded-Encrypted: i=1; AFNElJ+gVni3gCyWJ5fx2ATbehs+bVKiT8o14O+6mwmgmFnTnMGLqNOORTYHLCKd2R+pBsImLffK91twTmktPRXVyZ3K@lists.infradead.org
X-Gm-Message-State: AOJu0YwwaOuCKmdjKERxaKEnGojiW16tZbbzgZioDe2w72AxXwCK3ONf
	R9LXQMgYFa1wf80G7J4pDxJ7E2G1hWDwXAGKaid2QhC5IsyRS6I5CK5Y6xdiBxTtLG/N85acrCd
	a1zEMUus7ZfYsK+wSt1fuy8FhjAibqjxdbjq+OsOaQAhMEj7I5Pw3kDhy7oHlas2/bOCeVzmAtf
	TF/w==
X-Gm-Gg: Acq92OHB6FivksmtcrYec9pNf6Y9M1e1VdNUKvjDV9asJsBEz9k7CZOjUcJK7S/oWoF
	ZntfQWdbsaJ5ddlWS6NH2JF/iPcm1TN9XlL2yldWRCChlzUOtovgOkWd/hJj170VeuY8sfQNM57
	Yz1Lw+oayURV9UWtU6/ItiATEPaM45ZbNzzZPSLaT6+/uodR72ssKY45LbVaENkA6EJiWhvL9lQ
	Jg1ThWb3agQUSjjz3jSI03skdY+EW8k7gfpkOGIJL9koumBG7BPBTaavaLf2RyC17bKVRQ/eZVx
	tiGpDWEp77dmM5VJ9bsszC5VLC/pFiz7ZA7cOVUiqUqEBNaR8EyvCe7hNW6rRV9TUxQkKcrd2im
	L/p9YVT2hMk9HhpaUgY8dnF0F5KODNKqzXUws18k87THqfyQw+/RoYMz1AdlXMHE=
X-Received: by 2002:a05:6a00:2447:b0:835:424f:6a83 with SMTP id d2e1a72fcca58-8415f65c577mr20365416b3a.41.1779815606901;
        Tue, 26 May 2026 10:13:26 -0700 (PDT)
X-Received: by 2002:a05:6a00:2447:b0:835:424f:6a83 with SMTP id d2e1a72fcca58-8415f65c577mr20365368b3a.41.1779815606442;
        Tue, 26 May 2026 10:13:26 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84165009761sm15736235b3a.60.2026.05.26.10.13.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 10:13:26 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Tue, 26 May 2026 22:42:48 +0530
Subject: [PATCH 4/8] arm64: dts: qcom: shikra: Add CAMSS node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-shikra-camss-review-v1-4-645d2c8c75a7@qti.qualcomm.com>
References: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com>
In-Reply-To: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDE0OSBTYWx0ZWRfX7JumirbsXg8c
 ev7v340XcqW6mv7NHrQha8ZeBYxgwH/QiT1HBWfs39oRYicP6YfYwRAFrwJBsjbf7N+dxSCslGG
 4U8Z7ld6JpkP9TsPRW0MZTKHt2Noraudq+OUUwmEh6gIu2d42weAWYiCxZ59A7dMdD1WaPlNwWA
 o/SR9BKDg0QYpbRwEluURlIH9R2t4raWbporLdXP3NT1Sv0Dshr9Wsdiz4tXirC0kGRGR+05AbK
 HEZsoI+StHSrp+CR/RVYIIIoHls8VyWMJa72JPRN1Cj9TB5IMyUIrTLqQT+BuLiwBwyqBLp08yn
 7WE15IZyZt/FOlVfAAymEOpYyNjtQZKXAnWnLnacAoDxAJXNU/Vtz7QuGzRDosd5j6DfSO6vYKH
 GnSlT4uulgN1VRcQ8BamEtZl0a90rMbJtkel2zLf7qXG3UQ74SO1sEzF1Nr1lHFkRavaFk2UvZq
 4tj3t4g5J50lGEngOfQ==
X-Proofpoint-GUID: FwuQxMINkXQWaEyxp-NB2BhHYmkVeJhV
X-Proofpoint-ORIG-GUID: FwuQxMINkXQWaEyxp-NB2BhHYmkVeJhV
X-Authority-Analysis: v=2.4 cv=cPnQdFeN c=1 sm=1 tr=0 ts=6a15d4b7 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=7JZC8XBhqYczC4Ahd7wA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_04,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260149
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_101328_999084_0D438994 
X-CRM114-Status: GOOD (  13.42  )
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

Add node for the Shikra camera subsystem.

Co-developed-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Signed-off-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 99 ++++++++++++++++++++++++++++++++++++
 1 file changed, 99 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index a4334d99c1f35ee851ca8266ec37d4a200a07ee5..6c47cf2a7ef26b4bb7d7f642a240b435cf5208d8 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -604,6 +604,105 @@ opp-384000000 {
 			};
 		};
 
+		camss: camss@5c11000 {
+			compatible = "qcom,shikra-camss";
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


