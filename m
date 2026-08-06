Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C43A7C56208
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 11:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U2MIMRqehmFvc+78YizqisNLFadQWbLRQtbUArfigiw=; b=oMtTVh1REE4vc/C59mCJam7CL1
	sBcEySbnqFPZyaXlNVIzHaOjHZ9eXvhnAnflzgdIf8qSNcTHLWwxwcetDXgS7Q84HJh5KOac0rYze
	taG5bJYA9ZsRSlmWDxmOkkQaYw+82dxpMvE8TXE32cnGXuPhK3OVPnlRJeuOTtJ+R+zr1aJf5b71S
	UIvqoTFm+edbVw+Ctx9eaYS1xuo3fPf38CFY1RJyFsBj3KPtHDjarnIEwW7GVjuGXr+2shtAKBkqk
	cW0aTqyu9Gk6nP8UGxTTB4nXUW3M1vz7bvAOPRsXXWf3oeWCoPLO2bH1NDztpmb3FlgIpnH43uCv3
	3FIxvtlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrwVs-00000005fec-2f1e;
	Thu, 06 Aug 2026 11:43:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrwVq-00000005feB-0hi6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 11:43:51 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769o5D01627565
	for <linux-arm-kernel@lists.infradead.org>; Thu, 6 Aug 2026 11:43:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U2MIMRqehmFvc+78YizqisNLFadQWbLRQtbUArfigiw=; b=lEYFFMjqtNLBmFgF
	1pvcOJScJXyPyLdu2E7s1n2yHeGAORxc9ime9bBJ/R37bWwFaoschs9EE6P79zS8
	nxxYS3yWP73v6jfZG0COmRrhuQwsXoIPuDqV5UDHzpw2uVSMRpyvntjlhd9xtyiH
	zhkq9q27y7Y17SBik0weelT+OU4/11bQyKxxH1ZX3H0+Sgk9ebDl19KQHCmHxhEU
	MGtVL3FaIpnJ0B46/2dHHhm2QOXvENpSnGojYLrW8mwiGzC0k1NuHFxb6WgdQfei
	qR6/szRpaeRJrJlae/tcB3EAqPR3LVF1cgXC+1yOSYvGb4GAkexwNVkUzjocBPZm
	3YJuAw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvntnh428-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 11:43:49 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84842381150so3460276b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 04:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786016629; x=1786621429; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U2MIMRqehmFvc+78YizqisNLFadQWbLRQtbUArfigiw=;
        b=R6dfe+k0Uzjbas48XaMVjuhknIBJ4hIp0g8jeqK5TgvGrCuncdQg37/FOVQctTNjiy
         OeagaxWVH2SrNnaE76unSM2cy8JxzQG4hqykGPLdnOyc2TJWmAdTLT1WKMLEt1/juf1J
         M2eovEjykocG/r1UkbU/C7HI/dvow8SgGkSsZnnnbdRM2UediBjoWG9+f/V4jyztdzmB
         uneo91KQrf3CyUriFgC2BtQwkodltVzf/4B6cqDBIn+j4wUu9c6653+2PkuPgqjx+EZe
         WBEoeEbdXZx/ez659JCA9XRdm6Cua4AqBrEaCWGC3ZKs6uwOQ8dLRsf6bpOj98BipIws
         ZuVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786016629; x=1786621429;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U2MIMRqehmFvc+78YizqisNLFadQWbLRQtbUArfigiw=;
        b=cqO+LeHYGZbw1o/Gp5eerwIQgmAW97q/j0qOpM1f/HUaGx9UZoeEWcJvnwo3zg8ojm
         Tw2ivGgcKpezGUYNB04bUwrjAQScozefLhfuk2WX9Njx1VKD4WwmmQlsraZlg9yFqwVs
         NctOxJyn8PfYwfnoKVGR+AKTdtQw8W1zzFF/ZTaxcaoJRQWWqvoWkYO/DYoE5izBIt0V
         gh9/r9hqBr8TYI3ULC5qzmEs9qaXqUhJxf0Tavmk8H6BeqxMtLy9ZOqFwSXSFFzKUmCU
         IqmCIS4A0d06KRq33r6IWO+F9WtEBfKRUYmh+/2ruQZn8J5zYlFpELipub6ZWz4nHjAD
         YnBQ==
X-Forwarded-Encrypted: i=1; AHgh+RobwPkmgumY2ePBA33MvdIMiC1neId10b/LZzyvYEchsld1v2XOJI0t6zb9GjDrR2/pjJRI693UVLo+kJzRIC9L@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+wHDvO+0wOxw8yAbk/+NOKJUV70zhY65na7fJmQCAhI66cG3E
	zR/HQhmro9cBntB/34oMLbxM5PE1vnDOsvTa7DpHSTN71DnAx9lEyrp8SDFNw4bx6f9OAqQjq4i
	pTs1zuxuvmjxmduL3EtszmfMuQ8a3/mxbl2iJU0nEByS22rGBYDAuCK2his1dE3Oo9SquY698tQ
	I1Sg==
X-Gm-Gg: AR+sD12eEqtSvm7Xv2K7KWGEh+f02hq561UX3vONNz34FeyizDD3OkFfbufMcgXCFhn
	HtoE31rx5sPM0hkmqhsKEA4a/RaIFVgWF36+NRwVP1tSfVxrnhCOGyWI65GdYiLc2vqcaPSwPPF
	xgyWcGs3R1GuBvci096JuTwQrFEaYmWDsolCF/F43XqaeVG0bPEOjGEvR19c4RIA7NoP0TN08Kw
	r4OevHAvFNoSL+dqxHP6a+xpnWYuQxoQA1ewxgapp9wIJ1Yk0EGwzGY+bsmyFeUltA9vF71TtK6
	PVzuMJfj5I6E3GWIlpEbeo8/bK36PTeN8wnBcduPvfMGoUqwJQ4Z2Zs+BpCERR/sM9PFK05JnHa
	4Z3vjix13bTBCYeDy9F0RlcqS5llfwcU=
X-Received: by 2002:a05:6a00:bd0e:b0:847:8b0f:2508 with SMTP id d2e1a72fcca58-84f2dfc8c37mr17374705b3a.13.1786016628912;
        Thu, 06 Aug 2026 04:43:48 -0700 (PDT)
X-Received: by 2002:a05:6a00:bd0e:b0:847:8b0f:2508 with SMTP id d2e1a72fcca58-84f2dfc8c37mr17374646b3a.13.1786016628446;
        Thu, 06 Aug 2026 04:43:48 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f456b75dcsm1234756b3a.34.2026.08.06.04.43.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 04:43:48 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Thu, 06 Aug 2026 17:13:26 +0530
Subject: [PATCH v7 1/5] arm64: dts: qcom: shikra: Add CAMSS node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-shikra-camss-review-v7-1-c7360fd6a5ac@oss.qualcomm.com>
References: <20260806-shikra-camss-review-v7-0-c7360fd6a5ac@oss.qualcomm.com>
In-Reply-To: <20260806-shikra-camss-review-v7-0-c7360fd6a5ac@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786016613; l=3981;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=jR7x1n9Ni0IjykjrPq7iZ4t9AnZhxIdi6ZN5eUm87wA=;
 b=bHYhxfZnvqDzDazJnWVgQDOgo4rTIU/pucHvm9v4OMBEghd5zLPcrKX22CZiAZFm7EyPsClbh
 nxHepwVtPcqBqLxLaMJvpZF0YbvKRsDAbWXaVpB5oziE044QF7VNsa1
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA5MiBTYWx0ZWRfXwmtVhZ8VFnVp
 kDoOl4tE1yQwrE6S91Hd3Se4St7JlK3HHh15Nu+/xlT6L8u3ogSIWN0jdFyRDYc3aWDDBzASF8g
 JCEVf2LnKRNoJpPEmU22REmuQmgdYhVhiFAiC0eJm9ybhAte+kowYfGQzunfQaCJKg6/cMu87GB
 ADHqAIW9joT1tNJ8sqJr+MggBeCW92AKlig7qu4VYKFewXsYXT5tK+A8HPCTuy+i7eefg8XNcaz
 W01OfDhwJ8su16Wt/G95WJI8BNzaEspBTJjMFe/Dd1kM0ZzgRLDm8kxzAAfThEth4FeRF/FGSQc
 p8AQG8T/IZe1vMd0rBjLuSToK4Hvjt4BxUCB4a9vsvhEzDFtaUbuGGlo3Xa4FBLIy3GcCOllqRq
 KHjLq0gs4u/6WBv5llgTQhJevIJPP3gk2kn2+VLMKjvh5XqRdIiFOfMrsLpITklFZnyOztgJmGm
 9Y72qXjuG+4ht+t3T7Q==
X-Proofpoint-ORIG-GUID: YjTakiNd00PLFiO1YFN51p0XOFbVxjTe
X-Proofpoint-GUID: YjTakiNd00PLFiO1YFN51p0XOFbVxjTe
X-Authority-Analysis: v=2.4 cv=LpKiDHdc c=1 sm=1 tr=0 ts=6a747375 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=ahKksh3eZu5pIVwncigA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA5MiBTYWx0ZWRfX8R1uTXOsqE6V
 xKGPNsC/p04mlgBKF6PiUJozI/ZBAWOccByP0PtCsMDjRP2/wQJLYeOe+vRqlULyWscqtf/IoLO
 s5CWokARKQCyh3QMOu9Sq64FFYyzHLk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 bulkscore=0 spamscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060092
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_044350_221729_E94E24F7 
X-CRM114-Status: GOOD (  12.35  )
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
index 92d22e3b6931cf49f213d1807f78fc1a261f290d..44e1a333e97f1c88a672c77579fbe987d4285693 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -1828,6 +1828,106 @@ &clk_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
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


