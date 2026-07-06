Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBCEBC44500
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 16:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IvXc0//BOtPwrceNXqPLWm6VM7eQI+cAM0eRpWoytQs=; b=So1fEBJCTr2bck0Gkyx/h512pQ
	//OwJ5voqD+sJKr0iXnGYNBhSl4QbTWeLLYDRgRRWmc2Pzw1qIb/QbJDu618hj2lnoaNyeRkLZrUe
	nBpPStBx8ZFVXvykWxf07MgCDg3ba98fKK3/M0G+eBZv2tUZxGVqw54nz7gGTiJvJAB6cCQG7BygS
	3NeUOwp5diEMZ0ee77+xTaHR2NF03bHD1s2EAs2LIZomtU5ZwXBQJc6f62oGTN5lyBP6j9deVQZ3A
	5amepYE4pGJY1+DgCA9NKyt/6hjNlToeMOQdcBkfAHgItgEq0Kn+3h7GmOq5qIBRx6lCFY0mCow0W
	JfX2dZTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgmdC-0000000D86h-2m1X;
	Mon, 06 Jul 2026 16:57:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgmd9-0000000D84P-0DH9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 16:57:16 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FF8rF990257
	for <linux-arm-kernel@lists.infradead.org>; Mon, 6 Jul 2026 16:57:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IvXc0//BOtPwrceNXqPLWm6VM7eQI+cAM0eRpWoytQs=; b=NIwo0nFgjVYs78GI
	/xbEprZ2h/6NoCvaGe+APXZxcYLiTxHwSc9U84Y9vleZ0Q3wUIyckLMPG13KlSNP
	GRdJS8f+Uh8m/qV0Ucjboql6keAxSsL2OmRAGSEqUUsYHDC0ixqAaam6UH+2DWoH
	tzr9zq46NZoMilu4w6yUCLgbvGbV2/sKkjGGZEbJq9MQed9KKDmXVbj/WdNqfb9h
	ii4tG/UQwvukIeLJ2VACNXk0B8rtSIJQ+QIrHn8JlwGPZ+CS3/ItwEBGgl3MqMSE
	zK4u99GOFBZwUShmxllvKDVoM1x7doYcPSjnNem9iD1FmOkoJZ9K2j7ea9v8TDDH
	1VxIaA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3gsyq3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 16:57:14 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-847b8d76e3dso5406108b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 09:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783357034; x=1783961834; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IvXc0//BOtPwrceNXqPLWm6VM7eQI+cAM0eRpWoytQs=;
        b=GrelMAEIXptWvjH+zIviRIAaKKaYwYSWp8eroSNUEBnjYaCPNu+mE0nbfu4Y1kpYsq
         ThG6HMvDsnGxvKl7fGAzv9fqYLjgcXiWTlCTewfmQyw9vZ1USflosMtFJJmx16w25I09
         5BN10cz54X6gF3yjkzw5Wp70FPc3Le1PIGCkQpIDLpePml3JzvUTlnP9ozn3sOaGVusJ
         B8aPRW61fvN1r6G9uQ1gVPqTZVkn7j0Ht1qnSkjvkOLW6dQHzYXg0Vp3Kx9pTin0TQLG
         3PKAN8MrCuaK2EnsUgsOqrLDXbfn8vMajOWPkSv3h/cqR4ekTjNiqlajWJtKdwo4naxa
         IHgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783357034; x=1783961834;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IvXc0//BOtPwrceNXqPLWm6VM7eQI+cAM0eRpWoytQs=;
        b=mkvcZ9YMC5+STa0JA6NWdiriBnLfN8hPI7/UzC758dv/lsKEWErShYaKKuu2N6TfGJ
         /zXu1DH56NrM6gz1BjhWXozbhFh/CGwzU2PZ7f8St+3EAhaJ4x5EykyZdAWR/taB9fr4
         6AgXcs6QTMR/D02iksK6/2LZe7CbfBXd96/pnbaNlazOFCPXXcn65uOEC1egkzJzR6vJ
         lz55uH5NCR6flkaYAEH32Dm18wcL2D96Xf2C8gO6PZigsozSeHrWZCBUTr4mx7AqiZEa
         hVDKyGlXk0lWdLw7AejW9f0BiwVy0+bt4Bph3WTivpW8Av0i6e7PlpK+Yc7693PaNG8z
         ZkBg==
X-Gm-Message-State: AOJu0YyYCOmITyl2HZN3DD9GMbM0hKCZLVPZgunPNyGfqSaIkLg142Pv
	I+pdUO8I0U9Z0i9fs4PxpBa9X20WzD7LNLl6Aq7HmXiO1ckXNq7IzuAzo+uhHWR45ifuqkhygy7
	INSb3wQiNhEGYf9S0vY9egW3tqQhnPp/ZGQ3bwAp36QvvwAQdyDMsVL9y3D1sXvSEEErWCzMzjo
	SIvQ==
X-Gm-Gg: AfdE7cntxyM54o47mTzbxUm+pdjVSOYMAtWusQSd9vyvj3r7V9fcPCZayU6OmWeDMZA
	jsFLKQXoVO24SsjtL4qqPkYnHE13Ko/xmdK0EBuVKuew0mKSgVJ6p750/viechMYDdnXb7hJHto
	woWgBGZSWHv8+z8AHUCuupWvgEi3QSF9SGnUqDbyYc8VeCmYWioJDKasq2Mn27LMcFIpgBWSjoQ
	c07TYEh+aFPMtkzgOuFpT1pIITYNNIjg9BFiOJvAsjflHiHKgrrzlC398GpLGFyrWbtJSIHA/sf
	GoPzijmgWxOSzOTRuvX+ZfTOvJjs4qQ01JMJm/513Q6CdVKlEIMdT8PEq18OkSfW5oDZgAxZjY/
	UIqSZ0LJi/kYIPh2+jgpqqpTrz2TJ4RhnHlw6t4CM7w==
X-Received: by 2002:a05:6a00:2381:b0:845:dffa:3740 with SMTP id d2e1a72fcca58-84826d1260bmr1409288b3a.4.1783357033999;
        Mon, 06 Jul 2026 09:57:13 -0700 (PDT)
X-Received: by 2002:a05:6a00:2381:b0:845:dffa:3740 with SMTP id d2e1a72fcca58-84826d1260bmr1409261b3a.4.1783357033583;
        Mon, 06 Jul 2026 09:57:13 -0700 (PDT)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9e8eb0efc8sm6960604a12.5.2026.07.06.09.57.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 09:57:13 -0700 (PDT)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 22:26:38 +0530
Subject: [PATCH v3 5/6] arm64: dts: qcom: monaco: Add GEM_NOC interconnect
 for adreno SMMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-smmu_interconnect_addition-v3-5-afdca0125a65@oss.qualcomm.com>
References: <20260706-smmu_interconnect_addition-v3-0-afdca0125a65@oss.qualcomm.com>
In-Reply-To: <20260706-smmu_interconnect_addition-v3-0-afdca0125a65@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783357002; l=1018;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=08vr6cxy5ZZ+9RWNCtExcFI/JcQWlwcxowK+x8XsFaM=;
 b=xbqyKoHGYi2uTsIV/EYwj/ozpnriCZVKxtUa+xnUuWnwLuW5YiEE5ZRyyGolLyLSafYzSELC/
 dnYQyfyM39DD93cT2B+RyV3GBdtoOFIAmn2dbH9tad4yH++VMXsVxlp
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-GUID: nbaOBIuMZtavsXClemnTpoXJyS-Y0VHR
X-Proofpoint-ORIG-GUID: nbaOBIuMZtavsXClemnTpoXJyS-Y0VHR
X-Authority-Analysis: v=2.4 cv=CPYamxrD c=1 sm=1 tr=0 ts=6a4bde6a cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Jjng17ChVe8r-G2aFk8A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE3MCBTYWx0ZWRfX0uZH7F/aWgmG
 3z1A9vCnmytXDvzblmVwtv8QgFcza9aHCA2yleHZR/LdgN/1uzOSUrgYK6iczrEYl3GPYmUdTKo
 qspjc1WIEm4e5JPe8nTFGa6buhqXmioz5Vl06+13KkOCTGs5VzV+WMXaQsy7Iw8fEEUNMw2el3d
 CtYGulUP7iJp1xnwrXSIMAMtcm5D5qpDrxrCN+yKttybxsXBpYvElddGYdV/dbh5KY7/9lz+N39
 h39mULuKwyJKahhbeyH/oixNxDu/TxNIS26uOepGW/2B7x8fokbaQvrTyLS3IDClDlQuR0TwgbY
 ziJ4Ee+FgXEysh6q35W9smITklaD7qIUvlc2wGp7oHB0LyAuHwckU8v/F4lSi77qN+xzDbUi+ZK
 Knv/BUT/GpMswzlBIwWqv+N2SN/O3UUVdzeDVlpefmLo7cWcdp3bA23Q3X2TtZyKU4zmUulm4O9
 /87ctxBdJyTlAiBnJLw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE3MCBTYWx0ZWRfX0uFyFxrSFSGh
 +F6ZTIXua810UdpDFcSGY5h2Cqe3ShipZDIHTj1zrW1tttHNRO24v6K64DB+zUPTJQECy6FZ7ax
 goOah3q3N61jvYjnQZslr4IOE0qwRec=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060170
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_095715_115731_885AD48F 
X-CRM114-Status: GOOD (  13.32  )
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

On Monaco platforms, the Adreno SMMU requires a bandwidth vote on
the GEM_NOC path (MASTER_GPU_TCU -> SLAVE_EBI1) before its registers
are accessible. Without this vote, the SMMU may become unreachable,
leading to intermittent probe failures and runtime issues.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 400c75437978..e3713c2b6236 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -5117,6 +5117,8 @@ adreno_smmu: iommu@3da0000 {
 				      "gpu_cc_hub_aon_clk";
 			power-domains = <&gpucc GPU_CC_CX_GDSC>;
 			dma-coherent;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		pmu@9091000 {

-- 
2.34.1


