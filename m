Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A5F7C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 11:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f4bSX8P8uhf8R9Ebg4i33O9RJeY6pJIJnHw8HgmLtDk=; b=DRC99T+sd3A9J18L/OUO2slnKJ
	SirYOohq4Fcx2vyaE4sbTxh6jHUreuClaMGh7cy8Bu7qY1LnCuRTk6PQnuytAE5XWTbSWsSYfkeEe
	g/KoDCXpw8XyZ2DA4slCXGPBx09uI1p+DilMzS3xHbkh4nk4HhJozERTmXq0MAwQmarfslplf5Gw5
	0iRgTk3HTpr+XrR5LvinjgE/D1iFDNg3yjb1USvycx/8gUk0UclNS5GrS3yO9x1ihxV/p3UE2uXo9
	X3FtN0+Wy6h2GnTFGDY17vH+JGJa8luGNiPJbCBSjI45vSZRQ4BTY3o9QA+7omHBZHjatIPJUk5XD
	i9qjuY5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7AUY-0000000BCjO-0vU3;
	Thu, 17 Sep 2026 11:41:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7AUS-0000000BCi9-290w
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 11:41:25 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9Zc5k2410467
	for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 11:41:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f4bSX8P8uhf8R9Ebg4i33O9RJeY6pJIJnHw8HgmLtDk=; b=P+sY6nxZQH6ph5td
	xQbbVxRHBKrm+5h7/zl3asrE/8z+KIyRpPqrK1nqSUyhqyoZ9x19l+cutPqlnVdF
	Jfsn8L5gcqG9I/j1Nr9MHNdAqOdKZzRPsFdoh5RxqFqVdTofR2s81bWVUWlxBtMO
	sXD9O1Oo6169GpnKI6YGzsw5XjZcbd+NidpPQbFyXwHMd7cL5SSVukzB4c9Fpk1e
	ppceYuNYL78GWRQTa7jJ76Mn1Go94J36uYjXKIti8OdsuBs9u1ullJ25TayIGyD3
	puL4hBX0tCQT1t9VnTX8Y7RzWbc7Nu281tymfRAW95VHO8ghinSGouuI8BaP56iX
	FrpY6w==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grdd6gjwb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 11:41:19 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc4e496e5c3so630606a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 04:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789645279; x=1790250079; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f4bSX8P8uhf8R9Ebg4i33O9RJeY6pJIJnHw8HgmLtDk=;
        b=QktPmqmbFmoKihrMxgJf1l/Fk5JK2qLfCgDC6JyBiJpXTsih8keIO59llqr2gkVuGN
         wDn7BQgRawrsP/rHzkxETyM1diVpWKMuDKlTMb7Iq7sJLq6U3OoeLx4751+QCZJcJNnO
         3S31iynmM1ihhbp8J4Rbr9JxGIxIPFDNGA2bbe719Xejt0/t6pT2QfTJBkqMFnYcP82F
         Ajk3p7tI/K3kcVVBamhL1YkUhnr3AR4Wx6CMWDp82LQnHo93I+fRLC0bmdY9bsRjCTrL
         4K7Y0ta9QRpdsIgZYNr0psAjNrMzv+8n84avVbSiw41GlqeFMUaii/JYzJqRcxk0wJTS
         YNEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789645279; x=1790250079;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f4bSX8P8uhf8R9Ebg4i33O9RJeY6pJIJnHw8HgmLtDk=;
        b=xZKKS/vhupq4kFYJmcrD267qlNcVRVMXGmbW4hSchgR/Z4dRlJCkyIIdKY9I5y3vKz
         7iu6VRbg5mxffTPn8zvLmsKAAWy5VCvjbPZQFFlxVCFp+Qf3bWzbcA8EXgZoT0xiGHEm
         9uu7GGwgDWf5OF4sI3+Lpm2nSIfyc41lbnT3e75YP7psTa8cKkbKAvKuxpYyhtVQQSLS
         ozi+OBirDZlqDKkJ1wgb6ER1/Y4t70s9CfmTtkMOMgwbFjZV6cQFK11xQKxb+gcauYY2
         Jqh8s8hOgeLLN0N63v5koqBU2KuTPHoPpCKGTD0pdx+u65AYFSzhlQFK2x9bH2a0mOmB
         xCtQ==
X-Forwarded-Encrypted: i=1; AKwUvByh56TWY9AzUlmEzrX2VGTFfnutXir5uMgtmQxDgez0RTpQTdPfNy03On9mTWtJL9ANCgCyFvKc22+PDQ97BweP@lists.infradead.org
X-Gm-Message-State: AFuF++lF5VKsYSe5xB4Drmqos91RLp97yThy+5EkGxjAougionZInfKj
	EdJ3ldkLbO1hAl8kJy/aF+vkzDX99RtJbOkSRyM1o1j3kyjKVOwOUn1DhGssONrED2Bua/YRC15
	TT3+zPcwWScHg/kjWywmwIOjIVIC1m3kvIkKJ1sMy3PJgpt3Zib/MLq9TIAeCmz0CRT22yB6oAM
	iJqg==
X-Gm-Gg: AYBFou0rUW7PAYb5kJTHcMsytYlH4k/QXOVu0Ex2IExrJnwS8rDbxnhgjDgU2nvtkI1
	zef60Xy3DC/vy6b8YoboOrs0yLjmTPCS1RWjmrv1CZibO+PhUnA/+9UdQH0cXTi+vngsgc7AHJC
	PMbWO4uBD5Fgg4Nhm3euc5O5Z3SXU/0MMZ1cJK6W1HDR1S/WmhQu0yVq0HmBwVyuYX55yyT+EuE
	RJhx03KPDkhuQ7iScTHAWiSBRdTLvxecD5oVfiht5ZrrutcDWc6qz3zB2H+JqU/MuKUPKgwzWDP
	J07pRoEZ33gnZh9hq23fSNVQUZz0TevKaZFnmg7x4MrDDePL5hqVb2j3CeuRtMVWAkj7Fcb6xxj
	qdyJYXb/SwnXwclsp+LoEHC4iqMxv1w==
X-Received: by 2002:a05:6300:83:b0:3cd:9dea:2be1 with SMTP id adf61e73a8af0-3dd5f094c91mr17001556637.0.1789645279290;
        Thu, 17 Sep 2026 04:41:19 -0700 (PDT)
X-Received: by 2002:a05:6300:83:b0:3cd:9dea:2be1 with SMTP id adf61e73a8af0-3dd5f094c91mr17001479637.0.1789645278808;
        Thu, 17 Sep 2026 04:41:18 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc50acc1178sm3066557a12.30.2026.09.17.04.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 04:41:18 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 17:11:00 +0530
Subject: [PATCH v8 1/5] arm64: dts: qcom: shikra: Add CAMSS node for Shikra
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-shikra-camss-review-v8-1-9b9596221cfa@oss.qualcomm.com>
References: <20260917-shikra-camss-review-v8-0-9b9596221cfa@oss.qualcomm.com>
In-Reply-To: <20260917-shikra-camss-review-v8-0-9b9596221cfa@oss.qualcomm.com>
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
        Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789645263; l=3981;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=dBquW3rrzw2wP52nzgHqCW3FsrfEce/mwiNkRbVPbBA=;
 b=Qap2UKN5qySFqJIJgVmmNhqnIKlPZ8yKkSGkzupva+aFr3aRApiiB9137Tc9heI4DQu5xQFDD
 Ulwt+BIGaZqCKULaOkIk94a/JkrTVk6aYiOWeyOOTmIzdx9iyVhDvAp
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-GUID: WKUgxJiDKUISgPBki7F9YtpAJHX3BPeU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE2MiBTYWx0ZWRfX3BXkQsEP9az0
 9cQS8/+GvrQLvVJQEcH4Dsfle2jaoAPRxrS8XA2864xTW0Ljpq/R+28tG97HxKQEGP21h/x45eH
 09KcMh+HfUbouaky9mY5R/ZjlpK10FvaldjQ/7HkQkXgnPGjN+196cLDsp23xMtuZwgbaeuJFPR
 cZU9rejBwoJxTR1pe3vkbcOR7agzsNGy06lzh8kaDUQSbi+doF15zK2cX33y22AJkjad8C1x3Z1
 /Fio9QBivuF4dSe26dLGmhg3ZteGcrJ6nAJ/lDCWyUc0RH9BmwlqKCgF0CaloeW+XAUeou0ETAJ
 kVAKd9AJUvH+hLNKUAsQU2vqT2Xr2TcbE6HlezPyicRytbiJzlm9X3MjPInOdDNhinj6OrcZPAa
 CZnh8cBbAsGHmU+57LlZ+zkFoeiBIUypJ6Q4l86pjJygDspheVOqsIzPqUtmxSDOilL/o7m2qzK
 YUDzbAr6o2usDHY9O0Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE2MiBTYWx0ZWRfX/NZLGTQrhBBf
 7xx2+/QM7Kxaj/cQ3rXs/LDzS+9knV2FkY7DLk3Nhioob0S7nM3iiaJnUQlZcQB19IOTIkzdpIU
 IpaiC8tkfNu4dCV1PAgkxnU+RNFI2EU=
X-Authority-Analysis: v=2.4 cv=GeOCDgXL c=1 sm=1 tr=0 ts=6aabd1df cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=ahKksh3eZu5pIVwncigA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: WKUgxJiDKUISgPBki7F9YtpAJHX3BPeU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170162
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_044120_565288_CCA02E1A 
X-CRM114-Status: GOOD (  12.46  )
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
index c1f06f692f66452c6ee1b10f3ef12c20e201b5ce..faa1f02c01957b8ed86b5e8fc659c856d574a8ee 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -1977,6 +1977,106 @@ &clk_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
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
 		remoteproc_mpss: remoteproc@6080000 {
 			compatible = "qcom,shikra-mpss-pas";
 			reg = <0x0 0x06080000 0x0 0x100>;

-- 
2.34.1


