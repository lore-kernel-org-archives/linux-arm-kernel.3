Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0F0BCD4855
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 22:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R7Frk5q2FbrccyAZoFFWXLc+MXICjLS7DMiAdsGdoHA=; b=LIRcG/bwYiu2Ph9xR5WH85H3sb
	ohUWYqz4ctTP9F3WgGolbv3nXAYdufNFBsqtiyEZuWmuA9aZ7GUrQMQHDXXDP7njNPGwuN7t8uqAT
	88JPAv2AX6lCbbBn+NCoAfiKiNFf6POWXaziAUghl2syVwtDpb7gueOq11CH2Oon5CymJHGfqli7w
	vi/ZReWqdP5eHylK/AMhnm0wo4D3qNRo1xQcs7+OcJd+yaSs82g074+9MA/TnX4eDfPiOxkVPaaUI
	lF4nqX4ipIl+eTrKTItYGX4oZW4uNh3fggmXGaIF5qNyMx09kmy65BaJkpXwJOCbX6+2iBGBygIuD
	xNkBBENQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMZ2q-0000000Eub1-24SN;
	Mon, 11 May 2026 22:24:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMZ2n-0000000EuZA-10Vm
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 11 May 2026 22:24:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=R7Frk5q2FbrccyAZoFFWXLc+MXICjLS7DMiAdsGdoHA=; b=a2s8llH1oDVlaqNYLkswKC2hS/
	lMAeAX9gbtxWbb3gdrA5aXItAvrsokxxeAVMudumgeE8P8ZKLWnqnMENF6L67qqqMvvJ9Emoy8HZM
	MwJYPGVsZJQX9er+mTUy1F+4lFVTdXQVl3/rQV3tMPpX9J5pD6PJjY0UFigPuca59I+jEn21A+mpQ
	t73JJw6KXckn9evL7C0JX+/Bt1PUY3JaLwl0IQAXnJ1DZCFGF7dthSoQZmE0De8U10DqSiQ6/0qwM
	4X40c+QiGgXSmmotNIpayeHWwCSY9FauVlDS3DLjtJuqPerTzUXki0i2xu94sK3calsK7cCMD656f
	W1x2Kepg==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMZ2i-0000000D4gd-1L8w
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 22:24:08 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BK6v0S3444973
	for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 22:23:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R7Frk5q2FbrccyAZoFFWXLc+MXICjLS7DMiAdsGdoHA=; b=b3DMw+w+N/9GxBUS
	1NB5SWDv4tBz7QN0HA/VcqtKp0QGd1l9LFbuooFJCjvq9aMt98zzNa5Abs68fRA+
	cLQZTb+XaFkeRQxPHcl4NdKM210kU8S0xUZ4iJEssut9MJQ628Gew+i4YvfoDjeM
	Y8EJdSoIkd30D5tJWHr183dw8Wvr6CqUWrvfcMHiK/E9uMHeiONFwi3QWlDh+Is7
	Eymm1a3jPTpHYJOJA29abjOuEOcrMjFA6lXrYeacIi7oDfzfsLnyNKItau6eynO5
	QtFHv8YxboWx1SDVOQCM3rhHqieAqBbbmf5sX+ooEkBXBvzprMos1nFXtRGcA+ig
	vL1a4g==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv0gf9y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 22:23:59 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c70f19f0f37so2882804a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 15:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778538239; x=1779143039; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R7Frk5q2FbrccyAZoFFWXLc+MXICjLS7DMiAdsGdoHA=;
        b=hQrLnof7h7NbneHi1Dm+ZpORS+lpT86f8UOX0Orspv5pldJqzzGev95jj67lcHvK0H
         1cVJS90cKMGfOhUuIp+UCcBuWH20LjMigyp3C4kN7tg7GF1SAD6oMf2MQarNahq22OGp
         GEGg/uiOsS1N4xyRbM/Eo3NPhPYEVQ7khqgBLkYOpFeGELafXz8mK3ANzFTN7q5ahhHH
         95G29qq0Anwej/yaQTC8nm72PMyA/TODPxx5cS0Vuapw/58g09UNTvCHwmx+gCyyyVSg
         6DWsX/KGk3KPjsTxuICErDYMoyWAhw/T7DDC0L+tGz++NYbj9Xk18oZqsFf9ohH61K+J
         3M8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778538239; x=1779143039;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R7Frk5q2FbrccyAZoFFWXLc+MXICjLS7DMiAdsGdoHA=;
        b=oAHCOdZe4o2GKBsJZi2Pn/sEg5oPowTMjocJoOkOyxKV2b/1Gx2YNVGQbC4+nWajOz
         3JYahTz6wgUh4gX6Muj+r3VrNpGXjRT18oachTkMBHj6pHPEoFXGCDA5tq3+X8ZocwcL
         bOa/86QPBdM1LSS/cTNTDzBXiHHt9ono+9Wq2mIW8x0WZTabOWIS5ZJ9Mq+o4Kj3rUaV
         CyudoFtuCF1ahfWUFv+LHZZlbFv6jVn1OYUaOFs13dWmQ4cqfK8eBlKnP+pT1VOsITy4
         1L0FqSO8/zLdXpPj2dMhBbzl4nj4revKqdFuCikONiM6Z91SwWJslTzxcL2yX7ltRxSZ
         jdjg==
X-Forwarded-Encrypted: i=1; AFNElJ/PiL3yhFImmQV91ae6I6xCLEOJAVXnJKiaunHk2iWCUsxCW3jTJxh6youHw2kKVUQpiQhSPhEWSgdv4cJ9RFGA@lists.infradead.org
X-Gm-Message-State: AOJu0YyHBE99bKGHIJdYMV0oQlDxYf0F8BnTHNY2jleLQbhwzvUMgcp+
	XWfzO4EkL0bb3mE5sC+NlAsavhShcQh2x506PsIsfU+M7IGnTONYZlRapZMnwk7dB5nEixiVhTF
	3wujfVdZmwUL0rETSHloxmfw85oWgoWeFscs3EeZLjRboL/1L72Kuj2p0Swfu+v4w/891AuahJt
	r205zo0yBH+A==
X-Gm-Gg: Acq92OEvGaKYZPotYx5w/EybWQ97RuvZdl2/mM8sECCvw/78IZkNYG6eFZUckhgitEm
	eoRTRfSKGz9dgZ/TFa+vU8FHYd6WXonAzVUmH7mbKlFRYsqOYh97mI4HKMRkehgBawD/fuuRRSA
	1y4KxDemXUwU2mcvVhNTHWnJm7MIR63pExWw6zu80eM1H9jEw6rRNpEOz9RwOSsataBDS7mWeTu
	7JriXAxMJhGEdNUGms/Mu8U2ESmJ6j0AWPPV20pJ/IsBRmP5MevMnCnZ8sb+shczzGxKsbEvScM
	6xHtn3ozCfd3CE6E5xtfHo4jYhE6W960cqKFWW93pUR8JiMTmg5KdJrj5Jiy7nj1ze4gY9Xqaal
	hSVJPz5mQFy8gkbBbXiw7rIM7F75is1wCuHPzkoLq45tQOg==
X-Received: by 2002:a05:6a20:9144:b0:39f:c93e:c7f7 with SMTP id adf61e73a8af0-3acc3538b93mr1274546637.0.1778538238644;
        Mon, 11 May 2026 15:23:58 -0700 (PDT)
X-Received: by 2002:a05:6a20:9144:b0:39f:c93e:c7f7 with SMTP id adf61e73a8af0-3acc3538b93mr1274515637.0.1778538238163;
        Mon, 11 May 2026 15:23:58 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965946543sm27028110b3a.16.2026.05.11.15.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 15:23:57 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 12 May 2026 03:53:17 +0530
Subject: [PATCH 3/8] arm64: dts: qcom: kaanapali: add the GPU SMMU node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-kaana-gpu-dt-v1-3-13e1c07c2050@oss.qualcomm.com>
References: <20260512-kaana-gpu-dt-v1-0-13e1c07c2050@oss.qualcomm.com>
In-Reply-To: <20260512-kaana-gpu-dt-v1-0-13e1c07c2050@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Qingqing Zhou <quic_qqzhou@quicinc.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778538205; l=2262;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=rscpl8C0bBlWpsGZRfQr8cfwna3yHTFswaa+FyKvunw=;
 b=coHh6zS2m9SCj16Gzyz7t9BkZ8HEBuHE4W4uPRbQpDal5KptphD8Sputqj9jokSZ2d48QX9E4
 JAbZtSW1QrVCU4M5AZnST+pgHSljyAF0noTa/1EOUAF/8SwP5RojBAi
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=V+xNF+ni c=1 sm=1 tr=0 ts=6a0256ff cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=XZrIUYhEBg08vmH-lqUA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: n1IwQHPadPFyZ1i9wn_rzbqpcCDboVd-
X-Proofpoint-ORIG-GUID: n1IwQHPadPFyZ1i9wn_rzbqpcCDboVd-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDIzNiBTYWx0ZWRfXzhj84Mbdw6wc
 xooqn7HZyUSUYJY9ihLGGgzZ0GClKQqGRwKc2alUqAMGrcPMkLRA/xNT2sqKM/EcBr1vghbsv2b
 AY+PY2cp8Lpg0v8EDuzKhZrWMc8NuwrJAKGzit1wui8bFXAQ2vjzusoKzLx47JMY4vv1sgd/cYg
 B3HOT80XC7uVX6CvvRdN/lHJKoG0RZPgfL/B95+Xz2E0dddBytqFvR8YE+kekYU12vF4BlcUdRK
 7x6P2glOAZuZh1iey6v61d1sWKKKqWws6lZDikEX5355oveCeoXgLf4Pnx3tckf80RgsGQxulY/
 o0KpbyNY48YRLLJ3Y3PCQKeRC8X2a2IR4MsKJR6+3gLvRJp4GvQEGtONN1Dz1daSEDOq61DMDkw
 3vRSrdzSVLVhkBmnjWvBNjNaPP+YhQX2zFnZGoRrVRNpFzjwiXsUwxle9mHbEv5Rp0LjWg0LMY6
 x8g2bkaPFPxLtfIIvug==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605110236
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_232405_077358_2DC14C1E 
X-CRM114-Status: GOOD (  12.16  )
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

From: Qingqing Zhou <quic_qqzhou@quicinc.com>

Add the Adreno GPU SMMU node for kaanapali platform.

Signed-off-by: Qingqing Zhou <quic_qqzhou@quicinc.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 41 +++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index bab654bbd6d0..26a4de9c8d45 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -2597,6 +2597,47 @@ gpucc: clock-controller@3d90000 {
 			#power-domain-cells = <1>;
 		};
 
+		adreno_smmu: iommu@3da0000 {
+			compatible = "qcom,kaanapali-smmu-500", "qcom,adreno-smmu",
+					"qcom,smmu-500", "arm,mmu-500";
+			reg = <0x0 0x3da0000 0x0 0x40000>;
+			#iommu-cells = <2>;
+			#global-interrupts = <1>;
+			dma-coherent;
+
+			power-domains = <&gpucc GPU_CC_CX_GDSC>;
+
+			clocks = <&gpucc GPU_CC_GPU_SMMU_VOTE_CLK>;
+			clock-names = "hlos";
+
+			interrupts = <GIC_SPI 674 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 678 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 679 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 680 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 681 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 682 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 683 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 684 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 685 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 686 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 687 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 688 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 476 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 574 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 575 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 576 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 577 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 660 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 662 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 665 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 666 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 667 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 669 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 670 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 700 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
 		remoteproc_adsp: remoteproc@6800000 {
 			compatible = "qcom,kaanapali-adsp-pas", "qcom,sm8550-adsp-pas";
 			reg = <0x0 0x06800000 0x0 0x10000>;

-- 
2.51.0


