Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40676C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jul 2026 08:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=StFTKdXZGdZFi7CbJzvKqi8zQb82h4UxLwN1tS4qKbU=; b=QpEVnNbPZQ0O2o4PgUbd0PEj6L
	0lHZ6boyJT+qVHp9QQenLeEY1Xrbesret3EKOESn+QhjkyxI7okEwdgiY72KJnU3NkswGKJ4si8zC
	PstYMZBwEpuK2zDaCDWswhXuqOm7CxrcYzA4mwJAoedXEcWhGii05+mpdQnE/HCMO6Q5oj98IOnYQ
	MyxjiFLgPHQOFuNqB87R0craFr0sYOE5CDmJYNgD0SFUu2JNBjnOHlh6LffneIxFSk1gzcSpNC7pE
	4hPz/NVSz274+Re+dv3CX+Rvw5tdmF1PyQNI/N9BntBnfmgKuO3XzOZE0n2aZkZczXH3hPTg7xc38
	QeppwnaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgHmw-000000094zF-1RE7;
	Sun, 05 Jul 2026 08:01:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgHmt-000000094xo-3ohf
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jul 2026 08:01:17 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 664N16wb4101283
	for <linux-arm-kernel@lists.infradead.org>; Sun, 5 Jul 2026 08:01:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	StFTKdXZGdZFi7CbJzvKqi8zQb82h4UxLwN1tS4qKbU=; b=F8GfDW9B4t3o2Ow7
	mSFrZM8hZj1xH486Ik8lcZU3sm2KfRxIrl+rQEv7RzYxBCgIxJ+n34qiA6D/rQvF
	xzEVZamXH8bwZ/zTSKtDygn++pp4JQy8svP6OwYl41aJ3nIZA7SS4qo9fazTtq2z
	N+wQZyf/FGtAOEDILB9L5Vv0njN3slMLQ19gkGitGsVq5Pb9aRLCA3PbSzxpuT9X
	88rrgTDM28pUD0QkGPwyq/7tS0ZkEuPVDx66hN0rf5QIPGWjUhxRU4PQBgcHlfgd
	YLO+NNb/WDMLXeU/dip7rvBAa5XDpIjaAOKSkMp5+b7esCZuR/VV+7Xm4eNAtbI0
	FpkaZw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6tj8j8ue-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jul 2026 08:01:14 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3855a987c0aso188702a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jul 2026 01:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783238474; x=1783843274; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=StFTKdXZGdZFi7CbJzvKqi8zQb82h4UxLwN1tS4qKbU=;
        b=e1sm98eOeIK5K5BrJT2bwrw+JZKQmVSapB4D++hPTtUwl4GIcEkSnVEKsfsBcox/A6
         GVx7TbdCV6rLYSqgZKGNN7Qh3I4cAHIu8Q8COkAsURyjfwhaKP1+mVWkl1Lwp8ku8EXc
         fmk9/TKYrdA0vy8vq2pG98hexU+Sqvlhlk/2ngXuXSCdF/CiNJVMwL/YnVKHAyYsHzi1
         H/va2tWFH8379wHO/BiEXUpV+NuiWMdV2T/BtNcRl8bkQbiNgOjsPujNZfvPwUjriPpB
         tfBa0jKAYn7S+pCosSL9y6SZsZ2njOHIFvd4LhfGjxeNt2aGLsSfGIknFBviDoHf3eai
         H1kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783238474; x=1783843274;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=StFTKdXZGdZFi7CbJzvKqi8zQb82h4UxLwN1tS4qKbU=;
        b=jK+XQzaBpeMrnUQKXyxPGrijplSltqHNUOhhGgdBuRxWUkqg0AVIMlSPnDs73g0jGU
         Kni07IQ+85OoB9TQFzR3B70VszrIvNHrbqcwMSghGJkvFVc/SZxfYJOqS3/T9MN97rE2
         YVyFf+PeTd/zw2JeeDkZ1dRrUAmaCfNcRHb1hOUbasWsVDBGTsn09dEn+myfTbKIRxF8
         vWltASo+IHesfwfNpAeWtQx7Xog2GJd2o1/FPMOu9KJ4zyl1/lRtxCdRypPq0WFeWPOy
         RWnBtD+z9owrSEPD3mjUanE/NYbDR5GQeafgsl1mJ/mmlA7ojNHpoyB7H+qdYjTSNSi3
         tbhQ==
X-Forwarded-Encrypted: i=1; AHgh+RpW5x3Ji7AnaC+CggZ01sMMLwrpUDVdcE2rzD286NjtDxe6h0lqNGkZ6UocTIO0HYmRigmcec8eC1HUifQzw/RG@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0yA3nolFtjFxDRhFahz0AiE8szsCX3NnBIP5FsBsc7+tLu1ms
	upEQsYI1F5ncUJ4U/t+nPlvKuuamxjChywmmWDAPoJ93iHBsbpLZpzccDfUZyOs84nO+QNGzJ9X
	lc0xVBERooqaa/liOdkdlOLVJWVyFNl7PdyRpN6sElOkt745UzVJi8aomU9DVCh1l2GSBew9l4A
	XATw==
X-Gm-Gg: AfdE7cnQnGETlula/yjC2bOGQS7spza1bCjqjaqnFC/JB1CMytX9DcpVFUf9EyGHQkT
	msWPCpbbeeT/oEBvJr4/jEQWF0hv57lSV7OnBR6ZP6z01RndGJtinmKa8g1v7xqGITnB94e+qwr
	LdpEYuKG9fyRxN41pSe69TPbMwjlcYyOJVWngnWlcoB/w5cY4r37ZjwGsInabog2jwOFwziB//O
	tD5cikgKL5kmCPXlLFFP9XTS9NLazIj/tyNfBYJv/CkJhjOVMihjb4BtbJAxPg3Vfm0max3+o+g
	GlscnY7pWq9YeHu+LDCiSk+3RTFB3Dzh5Sl/dRA6Nd8WqDgT/W5YsNOriSQEe1Ja8EZXAfIHTmW
	4W9i4rt9mvpMraz+yyBWWqPXin4NirRshiH8=
X-Received: by 2002:a17:90b:4b06:b0:368:ed26:15b2 with SMTP id 98e67ed59e1d1-382807af3c4mr6120299a91.8.1783238473285;
        Sun, 05 Jul 2026 01:01:13 -0700 (PDT)
X-Received: by 2002:a17:90b:4b06:b0:368:ed26:15b2 with SMTP id 98e67ed59e1d1-382807af3c4mr6120271a91.8.1783238472790;
        Sun, 05 Jul 2026 01:01:12 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3113c88041fsm7759179eec.15.2026.07.05.01.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 01:01:12 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sun, 05 Jul 2026 13:30:07 +0530
Subject: [PATCH v2 3/8] arm64: dts: qcom: kaanapali: add the GPU SMMU node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-kaana-gpu-dt-v2-3-6ac53de56314@oss.qualcomm.com>
References: <20260705-kaana-gpu-dt-v2-0-6ac53de56314@oss.qualcomm.com>
In-Reply-To: <20260705-kaana-gpu-dt-v2-0-6ac53de56314@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783238440; l=2414;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=2J3wxVNsY4ppAiRVvLGUwPpm/Kmj8pqOhBbdF4kY2vw=;
 b=k578A5/54ikUDp8kLnqQMv2fOTlVQ7Xm5nrGCJ4mzGkT7xA6MAy/zLB9vcpg4v5kTvgvtBoGk
 96g1g8ZDfYUBT5FeUIfmS4ddkZABbHayBtPZcgQ7p3K7fwb6+/tGgcM
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDA4MSBTYWx0ZWRfX70pKYTtZ2UM9
 oa1JXMRgTI/HpXe6e9C5Ygzt583c3CNAEW92GvpO04Ttmmmt1pYqtJcjhJgBxPeRhQFgcrvUKNg
 DFKJ5n6+hToAcxB7SvSWg6FpUdnX4oTKt9oW6W+LatY13rFgaJaaZs19H1aGIovChp3Yt4ZdXym
 WVs3t2re+Fv/EiZs+OnLeoY6+MXaz2YTGaSJCaIqzPdxmDYf+54Euig7xP9kD9dowuVqTVQT8tG
 mpczFw7wPREGF4gxeiJuVIbXs+GdZ3szeJ6wzUkkf0T7RzeouoLc4YtrYjPEZmfvA/Lv7nsjITj
 jLEscld+tJBQQbAIiI/ZHPsqZHFGuOZGBlqbOTXnsExTQE5t/kniFhVjok02/0FuB362M/scVs9
 s7uVa6jFsFsFc/tlfmgqtmPkfTLGkizQP6HEk5BFgw+SwzOzwSbNa9f3QxLHHsG7qIpRou9fIjd
 1JZmIBC+A37GPxAs/Rw==
X-Proofpoint-ORIG-GUID: RoSGj12EfKnQN3_hC-Oy7i-MO8oHku3J
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDA4MSBTYWx0ZWRfX8Dx09P0FMMXh
 jThV0x2/0y02OMCt+OlGSU9K6iZKtwhMkuvxRffMwDI5ifswAm0nfGsYlflnxxXvtfgV++DMDkq
 gEdLUUAWro7b+P5GTFRMuY2XyTRvC6o=
X-Proofpoint-GUID: RoSGj12EfKnQN3_hC-Oy7i-MO8oHku3J
X-Authority-Analysis: v=2.4 cv=H6TrBeYi c=1 sm=1 tr=0 ts=6a4a0f4a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=XZrIUYhEBg08vmH-lqUA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-04_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607050081
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_010116_069610_0988555E 
X-CRM114-Status: GOOD (  12.15  )
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
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 43 +++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 7aa9653bd456..19eceecc2a19 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -2601,6 +2601,49 @@ gpucc: clock-controller@3d90000 {
 			#power-domain-cells = <1>;
 		};
 
+		adreno_smmu: iommu@3da0000 {
+			compatible = "qcom,kaanapali-smmu-500",
+				     "qcom,adreno-smmu",
+				     "qcom,smmu-500",
+				     "arm,mmu-500";
+			reg = <0x0 0x03da0000 0x0 0x40000>;
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
+				     <GIC_SPI 678 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 679 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 680 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 681 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 682 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 683 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 684 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 685 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 686 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 687 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 688 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 476 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 574 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 575 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 576 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 577 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 660 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 662 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 665 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 666 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 667 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 669 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 670 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 700 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
 		remoteproc_adsp: remoteproc@6800000 {
 			compatible = "qcom,kaanapali-adsp-pas", "qcom,sm8550-adsp-pas";
 			reg = <0x0 0x06800000 0x0 0x10000>;

-- 
2.54.0


