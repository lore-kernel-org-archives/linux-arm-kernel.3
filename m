Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C3C3C44500
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 21:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2d5kwEQJ4zj6pWZ0cwELlzSxpmKyMsiG0qTFS7qufTg=; b=JU2hSFiV9bpDSVKLkuPVqf6jo4
	p2+S+/9RxfdwbjJpTSfL7KgwCNgW499kSgWHbwKhjr39kOGeiiv6fHJ5jtPcWbjFfrXALQZBPn3LD
	/oBhJpECBqNO1SSE/NPIprIikHvg+TMvq5jDA1MyOE05ytr4JnAtQ4gGrqrLdiPiEUqInvDv5qH0i
	ILFbaeUUZBnEhklbRkw9H/e3oIW3dShQ3l1CXWgBNyE9sIMNdmmaVt6eRwpmTvkJ6jQymqmgdCUZs
	fsLFfykXQl/alQwP4GLH3wwKb0d6TqaqztIXxfuH0kKzcbBMs82QSs3m+RpXQJ3J5cAY7zyXNVwXb
	5Bbd7rJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgqVZ-0000000DbCH-3w9x;
	Mon, 06 Jul 2026 21:05:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgqVX-0000000DbAr-34C3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 21:05:41 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666KDvgm1566470
	for <linux-arm-kernel@lists.infradead.org>; Mon, 6 Jul 2026 21:05:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2d5kwEQJ4zj6pWZ0cwELlzSxpmKyMsiG0qTFS7qufTg=; b=P9Jj8TM6cAcq3H7r
	wjqj6sSGBm4x3syZlkv6YdPpN+WR7zgnw8sn8rttUqC8w+Ux5lTJdlrWiOwLZX60
	soJUYBVsW1d5qsqErak8xliv9nP4I8vAD1rIpJIuNhCyPGc9Brsy8UORhWme5eFt
	cjV2JXrvgTo+VOMZUQkf6VWG0ZWG2W6ZLDWGCx5C8pUYiYY2qsTASxr0pqN53xxh
	EAsijqCklh8y9tobAaph0fesmhXZeKYNeRpUybL8eGSWyxeD9Yl/VTnFccc3ZmvD
	jm3ONgl0G53kRZR9UK5x7XfLhyHivpPsOyBPqM8pmanF7CZFYvyqTpQIVK3jpED7
	wGIoUA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87q7kh5f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 21:05:38 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c88cfe287e1so2547639a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 14:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783371938; x=1783976738; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2d5kwEQJ4zj6pWZ0cwELlzSxpmKyMsiG0qTFS7qufTg=;
        b=IzdGGFXYUluYQz7lQC81ogyHhW85nntzUx8wjSYx9HTi++6BD7XQIvag4Z3zLgQzeX
         6LG2ZTVK6ien9GHaKoTg3bZUOT+1VK0ZbNQzg2tGL8XegBfBw3AaRUSrP77dW/ED/1FB
         4SZFYXUoEyvCOP6DPyz6traCQA95q2/XPr7TXEI6JUPds1qRa0AgwIwsEqb0UBOwGMCH
         ZhK68rxawgwl914LVCPPYI2mAXgVvHiGQOlMS7eHCpZkm6HVRtgRRc++MdRHHycuHzdB
         YCzQPrhSaNUQk+voYSPLYC57zTUgJB0l3AAAEFZyT9LVmZgtqHuwUbBfOLTcbt8orVHR
         VlMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783371938; x=1783976738;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2d5kwEQJ4zj6pWZ0cwELlzSxpmKyMsiG0qTFS7qufTg=;
        b=GgFwiuCytvLhGUNFwf5XRfKJ8o5DJ0Dle61/Jn+xGsCCv2uzXsMJ0uJMJADZV5rLwC
         OGw+jf1iv475cg/TvbxxJVPLGYk+v0dbrcl83hD7xXnIQeqNPX4G3uN+f2D7RQHkPYdR
         qHorzI0NC2+r02dyuWXZEhZVirSW/3gBthWgUACd4eyBa8fJuEKxmt+cvBmrq+RzeWgI
         lWJQzDDQ8Ia6jiCNvPNoHiaY+h3eP1vYBsteW4W3hOCUAql33UsHmkhabKutnAYm4JWv
         7wXLvt1fogTQLEPMj1heo5JvAwDpMRy5MyWKTuWZWKNkXSlGC8Hf4wTzv3vn3SHXStaU
         0Wsg==
X-Forwarded-Encrypted: i=1; AHgh+RqfkfGwNZj62SbnLv6CH2y5B3utRiakxx9EJhe0FgaLq7wLNL8kpmIzsSPL06t+mEz5MxrU+Z3v/xl70yfFC/1B@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5DbSxwQWaPqawinCPby/0n+yTfykHJwWRVglUvRVdI9kFfHxx
	L3qypfXqyBcU8sjP6Tsb1tpJOuI5pMWyDnYu6oLu88Xr+eFgnY0Url7XEcrSZprCDl1jZMfTC7c
	+KF4YVx8NzvT2qAfSH4iEU5AyGzmfwF28hJd5lrZo8HhH+Ib6JOCxofJOcmEbKpNFDJOYhXzkiP
	yDhA==
X-Gm-Gg: AfdE7cnJY8jtgPtffI5tZE6hF/91Lt6yhxmGDGVFEzOmO0zdUTHNWKMrrT+BKWwMbmJ
	ur2yGMC5IrXE2+ZiN72fGyKkCWohe0zNRjl69R5TpgxPqXxDhAdte97OXGrnA+ucf40d/CBxxce
	Ffm6XeFMADk/sbmAE6Y74DHPYevucy3G5F1T9cOqqPaOBNEfdyKxNHj8wthf1Xh4uYlhGi2ypBh
	TUifOc4MNA/TWHq/xTZxUwRUb/e0hC3RiICczLNEjt0wuQfW0Cf2dkpZlbu+lv1i82HvOWZAmdH
	HZKbhGChoKu84L+SLBqtXI1QrYhBBj3NWP8MfXt3ijOcwq9zVzIR1AZ2eVAErsFIG6iPlVWq1a0
	kg1OpctoCMECHOfI3oWi7J1JEPk7DjGpCw+E=
X-Received: by 2002:a05:6a20:6a07:b0:3bf:9e25:1a13 with SMTP id adf61e73a8af0-3c08ed5762amr2779322637.15.1783371937719;
        Mon, 06 Jul 2026 14:05:37 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a07:b0:3bf:9e25:1a13 with SMTP id adf61e73a8af0-3c08ed5762amr2779159637.15.1783371935725;
        Mon, 06 Jul 2026 14:05:35 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659fa13bsm305031c88.15.2026.07.06.14.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 14:05:35 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 02:34:36 +0530
Subject: [PATCH v5 4/7] arm64: dts: qcom: shikra: Add Adreno SMMU node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-shikra-gpu-v5-4-d2f373912d3f@oss.qualcomm.com>
References: <20260707-shikra-gpu-v5-0-d2f373912d3f@oss.qualcomm.com>
In-Reply-To: <20260707-shikra-gpu-v5-0-d2f373912d3f@oss.qualcomm.com>
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783371890; l=1898;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=EYNcq3OFs2Ql/wREKtEM5ji0GMxwTnKnJ9RpGAjMe6E=;
 b=DsMZ8weeC1FJ28PI4GwkWbJKDNIUqDgYuPQPbdoJatJcqoYjN0mvkvVRCXgkFLpEvRW9GGIIr
 imbpv+kai9SDEKXMg7NTAHIPZgWtHd9Y91kx+N0s6PgP2ncPgsQzm6p
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDIxMyBTYWx0ZWRfX9Cr40TkDDrBX
 bf2dnahGa2CgreeJYZ8akvODolSzHuxMUo2JPqhYfxdtbLm0Gat/0EAft3DyC8uGVhWQxY1s+46
 Sli9ZzTWxqaH5d2SxFf9BX8i5vrX1ztVn03yYo5BQRHxa1KABF1ehlQLilmyz6AbUgGfSm+U9dE
 0IjFmqA70hQLYA0q5U4awyntxUYT9Dz+DR7+OgYcUxTT2Ies1OguVNiBvrYdS6140L2dKzfCLPj
 H7l8mv+MsDoY5yJTifacIqvGPt2dSVlzYXnUTI/J1rlzD7+A078z9voMWF1gK3RJ13/ENIJTiEO
 7a1XqcPmxdmuLz07OpmU6JhzT2VzqY1Iw04MggdCZHFHjwuZTCm8A8guAt66fn/uGfvxTMkd1uH
 aIsUd3jkOFkHeLxzzQLrZH4gg1G2c4IMDBTuWrL0FwOS8tS4zU/FIOZ0TsH1Wnq8IF95ZScL++4
 mNRabsLE4F+3N59qM5Q==
X-Proofpoint-ORIG-GUID: tNNXWpbRRCG2OROUxgwNV0LGL4wQkw3y
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDIxMyBTYWx0ZWRfX/5zjEt0Oy1NK
 PV7mkl5z/lXrFH8++FMd1QJtIuFhi12O3XhUMXS8aaL1ldoqdkhbInetgGIOqKoy+7svJdUeWxt
 OJ+gx/iXBFjv2UxYu4tf8BWivczccjc=
X-Proofpoint-GUID: tNNXWpbRRCG2OROUxgwNV0LGL4wQkw3y
X-Authority-Analysis: v=2.4 cv=f9N4wuyM c=1 sm=1 tr=0 ts=6a4c18a2 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=zTWU315qYGxAnKAOPQ0A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060213
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_140539_902939_4A6AFAC1 
X-CRM114-Status: GOOD (  11.79  )
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
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index be443b362576..bb11e832d9a6 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -2005,6 +2005,35 @@ gpucc: clock-controller@5990000 {
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
2.54.0


