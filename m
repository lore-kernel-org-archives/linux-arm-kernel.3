Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A52DC43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Jun 2026 18:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IbMc4RrsOe+03o+lMwLAkg8XuHYRC2BTwKASC1wJIhk=; b=4SQwkQ0foqOd1IoufmSH7TegK5
	RjteFpzjSb5G9hV00RpwfsEXboMHQODH8nTgPXgHj/S/jvYusxPjICThD/TgQPrwdOdXGhyIAaZYn
	o0fCb4DsO2dQyMnw7isejKJwMsLQpo5bB+/FfOR6C0gjwLLIv9ORfTDidtZFjw3TAkQ5Qga3o4sKm
	kvhjz0l3p5XCYaDsHVIcZf3KZ/tVXbGlQd6e9rntEvGEx1k4Es93z9NWlHZ1wXgbWZh93y/pSdK1D
	akrsVCzSVyECoH2nQnfg70a9L8erfpIbxy8y2PtaqLNlEnH9kPi9SeQXnOcCzFodv3gRWJQ7ku9xm
	0PkunENg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wduBh-0000000DGv9-0KEp;
	Sun, 28 Jun 2026 18:25:01 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wduBe-0000000DGto-32zv
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Jun 2026 18:24:59 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65SHieg0415892
	for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Jun 2026 18:24:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IbMc4RrsOe+03o+lMwLAkg8XuHYRC2BTwKASC1wJIhk=; b=Zg8G6Q8uUhjfLb0o
	vSZ9rn1P2sClR3oBYHSJinWJLHh2+8T/RztbOSNnC2SP9lPyxeLZ4MNt4qxvvEjL
	EP7+gwI5auQ8Pb9RIebe5+pxKFrIfaN7s1PR62XM4DW5MPuBQy/MGkCvRtHEHbpv
	4WBY0SXRDlgDMzdIHUctpX2Cophcr/VSKzTihjpfb7/OFZ/RtXTEK6/0BKnEPWGb
	FKi4xsVDVy0pVXtlgrgMHKhh1EQ12Gp7XH3In3b+6X51t5k5pIxpCRd3TvUK4U0B
	p2qeg+y6Frqsevq7Voxl2i6UQVUsHU5+jjbbTxSItKbCJdN8g/yOr7R4pZPRzQOT
	BZbSjg==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f27t7u9db-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Jun 2026 18:24:58 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-139b62317d0so10802394c88.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Jun 2026 11:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782671097; x=1783275897; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IbMc4RrsOe+03o+lMwLAkg8XuHYRC2BTwKASC1wJIhk=;
        b=Jr1U6ZwFilQft5mwfJUHJW4Z2wUahPhWBIM14zRlm1+X1Sni1m1VFq/nbZCHZdw6kd
         /1lK3epOamwVmlL4FXC6I7gQRq8LVlXJ4AyW03nfdooZ0yDIRT0/DMX2pxSQOJe5drt2
         TRLw4i7S7LHe0oq9qd31oxdUz2tVEevMUHybCSKz5ONlYKjM66a4FC/HSaodCy9+DhFj
         SqMHpRxftAZZkd2F1NmPQyXVKHp29BDgqjH5h1dDbkXUvhv7tArZsPltEQNhlOwnxT/i
         EvCXeKN6XXfwDsf08SZECpVkhUunvs36B92pl1aYM9TwJHqkTAX+x+EScB1TEs3TwA2a
         24Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782671097; x=1783275897;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IbMc4RrsOe+03o+lMwLAkg8XuHYRC2BTwKASC1wJIhk=;
        b=FqDyIC/ZDDa2nu7HwfTTl72l6MHr31zhPmZM2xic9VwtDyBDMeThQ9w95ugi4urFHm
         /fbEpDOcORFcSqPvOrjlFtBOPpphPnTZYJGjTNRhEJr0Gnzrm2xZSUQ4mQ+M70gV4e1j
         wn4v1vJNd3UMKh6RHdhKi/8jvPAyDmKid9VO6w81ovRxN5fAPL/hQZW+Z7ozvq5sollz
         kKeO3wtTpSqSknTrrO6M1V3OlHiBASjj4XFNPMFYVDn6hhLDvNuUcrmnS0MSST/34nfa
         RmIRo9WFAzsCiJzomQBlXBLTc37TaHINSoZwfsIUTWuMR4ipVxU+2rSBeaNdnhzFNL/g
         mCtA==
X-Forwarded-Encrypted: i=1; AHgh+RonUzPTNCVNhPoIDNUtP7uQA8l6/hrA7+/h15d997/d/S6qq5uSsd+z3PnTqRXWvnddFv9fY/dRGP6pCyCMEjAp@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+jUHioNgbAQOkKIhMQ+OqKB9fJxb0scSVtBs3F8knfYab4xMD
	8fSreGvedRPbtJgn+LbrnQW0QpB6/4CVznvoTTQWUriExl93Srd8gA69vmcJkk4W7Nxsrj+scuB
	frIkQvT94/GUKZ0XL9p0Nob8+GCUFRzvBpHPr5RJHIAOE4Zd7zyd8Y59HUMHFxp9tdqsTL+pBV1
	BlJA==
X-Gm-Gg: AfdE7cmHYGFbuvW4ietMeMSjNZWbwu+PB25aonmOAA1dCRM0fngdkkhp/I7CICxyByg
	uFDqMlAuKoUN2U5pq6y/3jDbdMZSvIP6hu3JPmqDyMMwQDQ7M7VZI+l5tlPc4SJms7pi/62kmTt
	nV+vEIsUSCf2pw52T2rW3U23ab1rV6VT8XZ/vCgEh6X0d7odcq+T7eS6n8jRh2ys5o4JpYAyoiY
	u5I1r43Pk5U8Peojb7oAb2WogZ++Z85xqqc0UA9pfFw+jw0+yMehdqRWBQN73TJopGfxBg6BQG1
	ycw7T1gQfgu9dRdd9vyyhp1FcRoj8Hu1nA07rcfKMJ/ZjIENeDsYrm1Um1uYbJxs96SGtL/o2g8
	tVKFXMxgH8ukEmHpiwqCUailoACe5es14ufs=
X-Received: by 2002:a05:7300:5bac:b0:30c:1b22:646b with SMTP id 5a478bee46e88-30c84dad33fmr14207325eec.19.1782671097411;
        Sun, 28 Jun 2026 11:24:57 -0700 (PDT)
X-Received: by 2002:a05:7300:5bac:b0:30c:1b22:646b with SMTP id 5a478bee46e88-30c84dad33fmr14207304eec.19.1782671096877;
        Sun, 28 Jun 2026 11:24:56 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c8b1a75sm37508218eec.19.2026.06.28.11.24.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 11:24:56 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sun, 28 Jun 2026 23:53:57 +0530
Subject: [PATCH v3 4/8] arm64: dts: qcom: shikra: Add Adreno SMMU node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260628-shikra-gpu-v3-4-9b28a3b167e1@oss.qualcomm.com>
References: <20260628-shikra-gpu-v3-0-9b28a3b167e1@oss.qualcomm.com>
In-Reply-To: <20260628-shikra-gpu-v3-0-9b28a3b167e1@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782671052; l=1886;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=G5KnzOKbF9FC9XZVD3H/X6wimGnOXvf0oUqbBl4LZbE=;
 b=tUNf9WGYMJjAdYic1WiMT87XqmIviOCldRCxeamUi7NGV4ape07i3r+B/0zrufi/pAMBdRgfw
 9nDbsKCIYIfCh5m3IYARovqRiiL0W/Bm4G8HRkLexLCQvUv65gCf+n/
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI4MDE2NSBTYWx0ZWRfX7SjhI7qTkkoU
 7jdPWnHPI5pXnBOA2Z0+oqpGSNYOcRG4IQwVo1QBDAOFOpgKZXz+2yDiqsmhSLBDzZup9sJFBD0
 fxqODW017t1m66P5xh63WTc+pDFsfGETcirM/JzOXakVB2rhYnyp+qaiA7CJ9uCdgaBS4TVW9Fg
 ZFafjzNRCVAoVKhLVKEAW2sF3uSnaRGH2WYAElEqUlWKkwMUWZLi7jPXsr60PUJDva6wH3d0ezN
 VZS2snIq/dWBXmfRYXSkDgshq1+PzAoi83X9uFGso0iAuCqRn59qTYV0ZAvg/EC/0YzJDtWbSzo
 raAAjNiERVbYRxsUjQ8VNW0Tyg4c5UN3y1lYDBriR49uHiUISNtmA/kzSNPhio2v0m2ScM5T2k3
 Ba40aqZ5JmnG1YFgKeigrEwS/lMfDotoexfk3xCybEGfIlRwHQ5Hf3m7x+khrbslbTAjNAxRFNc
 aW5SoJrtYpP0TVMHpdw==
X-Proofpoint-GUID: N-1X99Y4K3Y024OVnEmy1WRALDjuyc8Z
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI4MDE2NSBTYWx0ZWRfX7xLb7SPqQjWk
 QpVBTrTiuA/cOSMtydyQGhWO6IkZzlDQGki64aUciI53/XQJ29w4VkH9EXqTxryJpl1iiECjBau
 2v/hf1pYMekST2+2mnqDqehf0fNTARM=
X-Proofpoint-ORIG-GUID: N-1X99Y4K3Y024OVnEmy1WRALDjuyc8Z
X-Authority-Analysis: v=2.4 cv=BdnoFLt2 c=1 sm=1 tr=0 ts=6a4166fa cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=zTWU315qYGxAnKAOPQ0A:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-28_05,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606280165
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_112458_783335_77B030E9 
X-CRM114-Status: GOOD (  11.92  )
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

From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Add the Adreno GPU IOMMU (adreno_smmu) node for the Shikra SoC.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 1ccb0f1419aa..398cb1a4dc86 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -655,6 +655,35 @@ gpucc: clock-controller@5990000 {
 			#power-domain-cells = <1>;
 		};
 
+		adreno_smmu: iommu@59a0000 {
+			compatible = "qcom,shikra-smmu-500", "qcom,adreno-smmu",
+				     "qcom,smmu-500", "arm,mmu-500";
+			reg = <0x0 0x059a0000 0x0 0x10000>;
+			#iommu-cells = <2>;
+			#global-interrupts = <1>;
+
+			interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 171 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 172 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH 0>;
+
+			clocks = <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>,
+				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
+				 <&gcc GCC_GPU_SNOC_DVM_GFX_CLK>,
+				 <&gpucc GPU_CC_AHB_CLK>;
+			clock-names = "hlos",
+				      "bus",
+				      "iface",
+				      "ahb";
+
+			power-domains = <&gpucc GPU_CX_GDSC>;
+		};
+
 		dispcc: clock-controller@5f00000 {
 			compatible = "qcom,shikra-dispcc", "qcom,qcm2290-dispcc";
 			reg = <0x0 0x05f00000 0x0 0x20000>;

-- 
2.51.0


