Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84487CD5BAC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 15:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wtn0UwEl4J7Vj041kcdziTWEDMgflLI4v+Focw+/W18=; b=lyIcRb1Nmxn8Wj1J9Sihu8HhZo
	h026G5kdpfC4d2Bj8WSXP57U1uq191eOfxk4YwnbeeJE9NTC2jzH5RA0htblY2ot5NpSMilFM0L6J
	I2vvnDTkBVmHkZgaE1Y2mLOD9lulZGs0yQMd+NVlbhjLkAeBWch3D5UCt3GrSvF0eD2a4DQhKmBfw
	081W+H+bAFqC8OYr1jK+TBQIZ57M4LxYu0BUJOr7Q6vPpJecCFFdLvEeaWkuN4j2tmfID9E9nT8pv
	ojYJhrlg0WaJmo1q71lCTIgUDmj+JyxskBpjl6nqPAisUPagHPlZLFkUAA2OvfkoVM8jV//9Zr53c
	6roDoWng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ5Dv-00000008IDN-1mAL;
	Thu, 21 May 2026 15:22:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ5Dr-00000008ICO-43bJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 15:22:09 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64LF6evw3449816
	for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 15:22:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=wtn0UwEl4J7Vj041kcdziTWEDMgflLI4v+F
	ocw+/W18=; b=POI/BBOvf2V1GcJCpvelaK29BrHRtxRnCZV3MVOnG0jORW1QNOS
	3Uwyj7aXSgYpZ8ymqzoqyAyI1UfBysySPcUYKmu5MnnHJrxRxv+qqND1ZocyvqKR
	ETIaPbrVFPNwAySv8RbeGuGNuKLysbjYYNxOE1hovt9o8+7alylHIuzb3lnjJ7Hk
	ipwOoyVnCacZJm3CQJ4XvoRbYUdAJ/z9kQzrmcRYnBO6ULce+Czzsdpwt1tB1tRA
	6YwaGpt62k+vHltsgVE1DxRGSNq4u7hcpM3biyDIUb550orwUE82jdpXpGyAdIvp
	98WMaJuzY1bY6dUN3CPet/TwNEXE/fmmtUw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea4dc0262-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 15:22:06 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6314d30fcd2so1874573137.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 08:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779376926; x=1779981726; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wtn0UwEl4J7Vj041kcdziTWEDMgflLI4v+Focw+/W18=;
        b=iL2nuBW2h9qy/o08n59aRfExaOKbeUPB/b2KDHzdT3WJmj8DLxO2GmmHRrp3jg99Mp
         OTw5Tn0l2Y2XTEEigiuJD2k6NvFJrsFxcF12Ykb/44zLDqTS1pE/M8800dC+xRItbVsi
         ybVsDq7OWEZ3hZISHG8y2ASPNQZaru2ocyE5AQ5RusrmhaZeK/lZx2iHMuplQG0boTNY
         xg47M2QO5CJVievykxldmCJESVIhU13605dSrQUtabXpYaXGm+1bCf0UH4JR9KZkSiRT
         NAOAxTtg5EPrkllKnRCF9AXh1fhcO7Ct+xtaTIZCe7K1IC21MKrUoYu8dTVprUF5tYeJ
         /ICA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779376926; x=1779981726;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wtn0UwEl4J7Vj041kcdziTWEDMgflLI4v+Focw+/W18=;
        b=jQw2JFwF8jbHf2KKWu8xX+utH10mbDbW/TCBoyOO+s/9XICRM7WAUwZzJ6H/qWtqLm
         1cRFra5lT1YSBbrmm4sDql5tlX3S3Bnwfa2Ts86yZasodAISChLmiEWYveJu/risbUAV
         k0v+6bmkbdcwvKEgD5xVxjlwgEzQyQwYDWvcSmCd0Rbv8qNPcRiMOzitiwFpRbxy+LfJ
         3kCXG67jU5Rv8ZZRFJxkA9nUuPYICRRrDNIBeMvE8Kf+sj1I4d8xxBdLDsb2w/lkBO9N
         y5qrDkHyOTPOFaECjbBA75u9GquHT2QmR1qNx7weycVoCBX7ntXd2KwtnWcJQUqDDSg1
         +99Q==
X-Forwarded-Encrypted: i=1; AFNElJ+k6Do/XGKSwZuXDGqwDaVUwe+TwpZnFq+ZyIg9FV42nl73X1aNp8tVxEjLCdO3v0j86FyzxEjQwNkmsU+9SPtK@lists.infradead.org
X-Gm-Message-State: AOJu0YxX42/jl2nlVXtapsBAkH6bbyq1FR14CzrcD+erp9STTmMy2zQp
	aCMAp+dsVfWpxVNjUC2zeHhxBB9UBctOZjgq13W4jtD8rTkbby7d2lpaOo/09DWAPXdZgfkEjmr
	sNvD/8GgPaHgYLISHnbxoz2gpLCbIfsrEqm+GFd4B4AwmrphNbIRAv4QQ8suNQwySwVIl6ILCll
	aKiA==
X-Gm-Gg: Acq92OFQo/xlzDbD8b9HQJnfihLLOCiZLIPBash6zthaMkS6h1bqV23dzdfdTBswMyI
	cnyldlWFmTJFkjHug5i2EfrF5thRgDf50uj0zWpbBi0JC5Slcsyc21jXXyPb69XkLA+y57GjcnR
	EMXhSdcwAykPu1A56LHTzApdYEn9VEgNLZ2IUqjLpGFCTKF7ngitzF4fnrBmwz66jWMlPyoydc/
	lIJU7hgr8v0A6TPyOFHFMNu4QWYo19K2sIXiWUBFsSP/d38pXhkMGsysvpEWSzRgaZWr6+lSmY8
	osCcr0qpRFHu4NIdX+GL79YPPu9kTzphT2xl6+mJOexbtF43gwD5k/aUeEHHd6dyyeshLAdArSJ
	0CrOKoacT9S9fuRMjj2xBxSRYxIpuZ0JKMTRBMV71O+xCFkA=
X-Received: by 2002:a05:6102:dc8:b0:62f:522f:5b2a with SMTP id ada2fe7eead31-6739b4ff142mr1955236137.22.1779376925689;
        Thu, 21 May 2026 08:22:05 -0700 (PDT)
X-Received: by 2002:a05:6102:dc8:b0:62f:522f:5b2a with SMTP id ada2fe7eead31-6739b4ff142mr1955195137.22.1779376925290;
        Thu, 21 May 2026 08:22:05 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eaa93d29csm3848191f8f.37.2026.05.21.08.22.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 08:22:04 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>,
        linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Peter Chen <peter.chen@cixtech.com>
Subject: [PATCH] arm64: defconfig: Drop non-existing (yet) PCI_SKY1_HOST
Date: Thu, 21 May 2026 17:21:59 +0200
Message-ID: <20260521152158.425895-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1121; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=fgnlWbgsaZzFYCXJtiG/h4Vlk+arY4lXZp9jyDZusNc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqDyMWEQYxhCog8K9oR4uNVnaybXvnRrFpyQJj8
 LZzv0LNI7aJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCag8jFgAKCRDBN2bmhouD
 11+HD/wN/ryT/aj5ZfxoVRkRc6V+t9wQyi0b41oLpDkjKfjCbyPv/KHm+5powI2ouHp2CMvhf8z
 3Ez6ynnkr73eqDuX7dP2XMhAdKWuvQTNq2+xzARSpVSO1rxkXuJKbsRBRgyuMOXoRhQW2Ixinp7
 Q+v4hOdIbXO5UznX+Az0jOouywVXgCnPSKOnuaTf7DVHe/xh4BoxxdRfFJFHCfyi4ziWIG8QwVS
 IX45mhAAhhXip2MoB+i4OrkksZGXa0MTcAZJKG7AIoAb/0vQOJcr8bKxS7DHvxj2HK2FmTonOii
 qLW7EKN61ihXb6j1D17FQXCgbREJIma5ttCNDWZn+P7l81e9EExNeGfccHiRM8s69Mu6jbhlEmY
 DW8qMj5FzPjDPVxqyGbyDYEzSo8tfDZ6+iyV73XHQNwhm9xcfjnXon1f/Ud8B+nriO4PcE5nTu4
 u55HbADdho4FpqtpO5tGAXdXRB9a6f0OX2Yk/47551+yiXqNqLnd3xE90EMBkCsZRoDLVrTOWzV
 t5d2CBF0GtAVYePZ2nWUH9hHiwHwQ/aBG2gFicTd+S3SNoIdZmgtm+wMTswYdKSTgC0gP+G8vkq
 3FhKhCeg1K+xQow5UwtE7SN8cigD6Pna7UIXQTqmGfuSdVoFAFbDHbz3JUvxZGne9Rr9QUbmOvS nllgx1Dmy38D4+A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=VefH+lp9 c=1 sm=1 tr=0 ts=6a0f231e cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=TAThrSAKAAAA:8 a=EUspDBNiAAAA:8 a=WSa9cALPJrNn3eHyELcA:9
 a=crWF4MFLhNY0qMRaF8an:22 a=8BaDVV8zVhUtoWX9exhy:22
X-Proofpoint-GUID: Z_wUZTXsymR8WBmW3ws9qrtCxNcu1n1W
X-Proofpoint-ORIG-GUID: Z_wUZTXsymR8WBmW3ws9qrtCxNcu1n1W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDE1NCBTYWx0ZWRfXyz5hakSmLja4
 vp9DtOq+41DoYzTdvuYS6cebj68TLfdWdBSfJ4+cVvF2A/x+yXaFTdD/e77aZ9Uzv5L2oPl57rE
 BBhB/UK/AT+Q7/TDbifiMcdh8ATq5VvCpAYXQ2hujEj/sc31wWowGaUnKEuUq46B/cYBnPx118S
 udzAwsqaayR4JTw3HO/KP5/1TdKlacJzklzCUPSDVM9cmmjI0H/+pPfqiSDhmO+/X8IR+2MZ9+c
 n0NYCjko6AtSY4XIJd+ZY+rUDn8GAbQT0qHJSBHJZJwTntuj60+h1apCQmJvo5zeDPO6W3bDpDY
 O+gmBWY0fQyEeikXq5it/GZXDrsWHkAJMkg1XECdDtsPOOwsYWnRsTUBfd5B4Rjcp/9dMkWkt2z
 Z43dAFLpQ7/qIVx4JYnB6+1tKbRHcYh36z+UVLgzovkHktSy2BQIR0HebZXdD+WHrOPHON6mYMn
 wbgteSWzLJJvEjztpUg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 spamscore=0 malwarescore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605210154
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_082208_010553_1E6F2A5D 
X-CRM114-Status: GOOD (  13.96  )
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

The source patch for commit f54f7979ff88 ("arm64: defconfig: Move
entries to match savedefconfig") included reorganizing around
PCI_SKY1_HOST, which is only in next at that time and was not merged to
soc tree.  Applying that patch caused some conflicts which were not
really resolved correctly and PCI_SKY1_HOST was added.

Cc: Peter Chen <peter.chen@cixtech.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

This should go to soc/defconfig branch.

The PCI_SKY1_HOST will come later with:
https://lore.kernel.org/all/20260327114628.3800886-1-peter.chen@cixtech.com/
---
 arch/arm64/configs/defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 094bb9cd8764..4ed684efbbba 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -232,7 +232,6 @@ CONFIG_PCIE_XILINX=y
 CONFIG_PCIE_XILINX_DMA_PL=y
 CONFIG_PCIE_XILINX_NWL=y
 CONFIG_PCIE_XILINX_CPM=y
-CONFIG_PCI_SKY1_HOST=m
 CONFIG_PCI_J721E_HOST=m
 CONFIG_PCI_IMX6_HOST=y
 CONFIG_PCI_LAYERSCAPE=y
-- 
2.53.0


