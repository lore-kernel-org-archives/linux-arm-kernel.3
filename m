Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9676E6F095
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 15:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=X1DWDmOcDxjUqXVftR07Tf/hOGZFmvvZAzsYJSWm4Sg=; b=0aLKjbKm7oHbAugHt8R/j4Nq70
	kEliw+2vA2gbI8mhBHo/pHzgHrGLkSOtNsrLHE5GCEGkgM9taW07IFG8S3CiueGUCsl6wiSXeYkGW
	lUCZXJKrjZqQvgXF0Yv/Inp3/08ruqtkFDWteEPg4qyMT8BBpD/FTxeAcZVNiYRm5LRgp2Lyw6FVE
	LsuXU/C7RHaOhFGLQrg7ASJGOvEfRjCv8T3Ojm04XSjWg/4geG+sJshxtN/BtF+yiesxamIRu+hQ5
	HE/TmBJfA/SzundZw9nGbfR1xGl9RqI2uuiXB9qnXKFVXzudcdz+7Dk8fPH/tO1oAtCcekdCemmC9
	5trgR02Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY4HS-0000000Fgt2-1R7v;
	Tue, 23 Dec 2025 15:26:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY4HQ-0000000Fgrs-0pLJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 15:26:33 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNA9KS81358212
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 15:26:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=X1DWDmOcDxjUqXVftR07Tf/hOGZFmvvZAzs
	YJSWm4Sg=; b=kv/e3bz9AHymfz3+5I/afYekbCVwtoEy851+Xyj9B9zKExAJ1BR
	dNm8oaAN0mc+qXIqI7t09u4qFkXlRDJNhuwAJwQOmnwk3Zbl5ojNRt6MItMDPHVE
	IAo5o+vXQsL05BhPWKkKrYlbtlODbKj2075kU2JcUPdUc6SvQQdMRL4HEVLDhnuN
	sncX7A1tycNjHauaG/a36lqE4hFDItUr4JjF2yiHzuJ1fvQE8vrt7CNVhB6DjsH4
	Bi6VZHMxKmZ7+HPdmTD+JY9nXuPGLGfKP/MSJkPPz0JkkyY//Pp6ftEazYzpep8D
	UwkGS78/kgYAbhHMGXKjw0AHajNhhPO2UCg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b78xc3nr8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 15:26:30 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ed82af96faso101159121cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 07:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766503590; x=1767108390; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X1DWDmOcDxjUqXVftR07Tf/hOGZFmvvZAzsYJSWm4Sg=;
        b=HoQRkhZzt10izaTl9Xgvc5+nggk9Dvav3CHRdiasD0mIm2ZY0k2ghLd/T1xDpq0ChP
         Ta/qJry+VlzEPbAecsdtgRn+bOT54MKi4ZgI67a6awpC8NQR9RvpR33AjnoYKWca6EGm
         ZEn62EF4kdiM035zrKNIuFiGFLsBrPOL2dzCNLAuZiEMEGY7SildKGZOpE1kg3hCFGVV
         mbak1Ux0CLRcRzZk/TwJu1XvjJaGSk9i+Yoqw9JnBLRPLMO0HNw0yofhSnd8OPAsMaEE
         F+a+I4YFKmothV/DUaS+wJRMfSD/HiqyVOEHI7yfKb4ROQj0OYqfRg/SIXRvJOB88oqH
         TZDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766503590; x=1767108390;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X1DWDmOcDxjUqXVftR07Tf/hOGZFmvvZAzsYJSWm4Sg=;
        b=MhvUjYiCPsPEqAxpCcQi5gqnes2LWDsj0RpVi/QZes1cGrGM7rRbvMAxFVzbQ92lIW
         BJRklvB80j6zCBUDvrHWokSYmYCNxIRY2YCuUv2BeYw6ZCWs1IChoa59VLdG9ktvM/3u
         7kAVmjAoJ/eUxILvLmsgMWgLTZN3N/KWCFGF+n6jmUopFl9MKwzxSh7CSqnl+w39MRnQ
         MaS2xaMtfOTbx+e7ne9vN/vojNPhR/CniJ25cMSpcntaJtsw44Xpmk4vecbZaR6B8MJn
         ix2mre73JIjmhYr6ltUjf2z19E0lrE19vW5funv4REPZ4v72/fMvraU9ivADWNV31HYj
         OseA==
X-Forwarded-Encrypted: i=1; AJvYcCXFpqJ+X7U4bqfBvia0w3qTT/ehsIXPZvrRg9dw8O4/GqF98XsMTtraKXvo9tyGyCpK4HI7ez+6EoakFwpoVK7z@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4ukHlI7ds2ArFHErsOxVPzI/gm5wDC+H0NCHQ77WPQMIFrTdq
	4pXPFspGb85+d9uUWLfSpzQ9J2Gs6tVvFx1eWyLBqb0zSIHMjh0215oyhPTgthwnDvHLA6gDG4B
	3Jy1gY6WV+ESsz+nVzMntiKwR5VV4v6A0X7xj7bNpVeutEw+VGtCFIkX3L+jliF5UhoUUUdety2
	Z+lQ==
X-Gm-Gg: AY/fxX5BhTz1PpcUYB+SqM1LEuexhuYkO2kHlwEpOMFZwd0sYBNjoqlBrv02kzdkTXY
	VQJSEFdv4dZUvyIrwoNA+xENUUO29DqKsIDitfoAZsBLPy68A34SRC85I6mx3J/zu98/ALf49jp
	8uixT1L9ToOQIDMcL9+PBgpM2JnmFMomzOK84m+bFhVZXBno3RqnEekAzw38HKQ2LaxOk6kGqKh
	mpFxJ7dQkIP1nDpxO3RpBae3AJl5p2m3obwhud8aTkLlFO2vhgADMydeIXwtTNLNqMhhM1Anp2t
	zz/dkGqR5fTMKh7JWEaYjLpXCLcw8bSuyRdFQBK3VZizPvjaOjm2brFq842IpiYa+gaGzQx2cYK
	8dNF2DBpUdwCodeqaiC4h4Xg/cCocfKgcCPFUiBI3EUrvTDNwq9PM+lOKArr/N3kVvhA=
X-Received: by 2002:a05:622a:5c0e:b0:4ee:2352:1bb1 with SMTP id d75a77b69052e-4f4abcb8c77mr256977491cf.5.1766503590250;
        Tue, 23 Dec 2025 07:26:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGhINT4HlTgCPcN4kDXGyPMqNqL00KSDVH433jvdDmzYeBYGVAIeIz8zba5MebY8zKgAtzRoA==
X-Received: by 2002:a05:622a:5c0e:b0:4ee:2352:1bb1 with SMTP id d75a77b69052e-4f4abcb8c77mr256977011cf.5.1766503589885;
        Tue, 23 Dec 2025 07:26:29 -0800 (PST)
Received: from quoll.home (83.31.98.88.ipv4.supernova.orange.pl. [83.31.98.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1454905266b.60.2025.12.23.07.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 07:26:29 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Chester Lin <chester62515@gmail.com>,
        Matthias Brugger <mbrugger@suse.com>,
        Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
        NXP S32 Linux Team <s32@nxp.com>, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        imx@lists.linux.dev, linux@ew.tq-group.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/3] arm64: dts: freescale: Use hyphen in node names
Date: Tue, 23 Dec 2025 16:26:25 +0100
Message-ID: <20251223152624.155845-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3777; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=AjBqw0LrXSn7PVqsMBzJk5wO5mqfJHNLvVrqozEl9Xo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpSrSgKRXpkMjgze66mvIN7KDsSXjviyw0Ybzt4
 l68cYxR+vmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUq0oAAKCRDBN2bmhouD
 1/v4D/4g3ihOYBcKkCo88QxGxzO8WiWCsDlpTOUkVfmLRkGYVMV/LLkYLX9RcY1RkVjQozHbQkw
 Sp6NGb1Jtz+aOdS5zT76E58/woi4SS52mpCv0hhnuG5mUvHnSawKwYJlMB2Y9taX2Cmoc0LJbiN
 u4Xe07glAv9bOVcRGUcYjQDLNZytTosMtj5RRycygHBAo2NZ8yUuyH13nBQQRVAzra4P7+d3g3K
 HM3mEzVMYFpPF7ufLThUpgBbd6TiyvD2XKbVI2zLEog3gNmcwrRn5edycYBeGfE9WWYrOPAg0zB
 L3I7uxQIoxW0Tu9zseMTurI296Z6FLykxULFo+ZENulG/KxyvB1s4rvUvJR91bWIHbXRJ2E09hD
 ylCnj+ePA+yWOtaCumT1Net8zy2pfJo34hCHgbyIUT0K4aBVkaviyWi91Bzblme90jwbaJ+xK/t
 RHxAVSTSq0819AM6hLZCp4GTP+y9LiNB0NkPXJWeTxDVG0YOPVG1upWK0R4H9hPSy3JWXM4a9QO
 mAxKyZb2ATZq0rszGdcN5RVR9ZIDdjIaKp4SogmHYS8vdQ6Teq2sOQXWtIoeUAn5RbinpJSfmso
 X5OCguwixzAcy/zM1CMRS/73CL4W4i5GPRHAeAnjCjX8f9MTj55V8qT1zGFvjp5g/rETXgK/yMK lkKtdn172eBRx8A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 8etkHWRMraNqnm3cz9-1vYgCvZaE6aXW
X-Proofpoint-ORIG-GUID: 8etkHWRMraNqnm3cz9-1vYgCvZaE6aXW
X-Authority-Analysis: v=2.4 cv=cuKWUl4i c=1 sm=1 tr=0 ts=694ab4a6 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=qe4J/qXhiWkb1JZGYKbLYA==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=FUnLEkIPDp6DTj-5v1EA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDEyNyBTYWx0ZWRfX3tiM07hhW5f+
 NzjJm9vpdQCY47kE8nA9YGOMsDSqlkU5/80QmBvxK++nHDBokhezRyuLNj9kLtq7T4DIUqmUBKC
 eFN0a5IbLAygvBGHk48Tj0Gh3rBCE+AIeh+73k/H3xmr0yl+U0r/6L+ZEdOFYM9h/iV/ncad5R6
 XmKVHenMzvuMImZHxuSi9rP7xgTr7Hzp4oVKH+Jcwd+hdcarYxlOdamcWJaZ6sThIWOPOX1n7B/
 +gdagJel5ulk/3DzJ06d4/B/1BG65qexHyspC9fzwbuHffuFtvuPLGG/e4gvjEh8fZ95O2ni1Ui
 zekC+wPNddDfBx8BO63d2P5iJMaWJ0G2nRXZjiSbWDhn88Ny25JfCY1U9H1u0qIyu8VCfztZDUH
 S1arM1gCi9zAE/hsD5XYuy7MSfdpQijW6ffYYVTdGbhk5BtarSsndmSUOxxfIyl5if/iDUWRG9y
 X3ZWGKyKvNiVlAcmCcg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_072632_363824_16A0D255 
X-CRM114-Status: GOOD (  14.02  )
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

DTS coding style prefers hyphens instead of underscores in the node
names.  Change should be safe, because node names are not considered an
ABI.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Patches done with sed, verified with comparing unflattened DTB and
dtx_diff.
---
 arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi          | 2 +-
 arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi          | 6 +++---
 arch/arm64/boot/dts/freescale/imx8mm-phycore-rpmsg.dtso | 2 +-
 arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts       | 2 +-
 arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi     | 2 +-
 5 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi
index ef80bf6a604f..b07022e3b6d5 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi
@@ -278,7 +278,7 @@ sfp: efuse@1e80000 {
 			clock-names = "sfp";
 		};
 
-		sec_mon: sec_mon@1e90000 {
+		sec_mon: sec-mon@1e90000 {
 			compatible = "fsl,sec-v5.4-mon", "fsl,sec-v5.0-mon",
 				     "fsl,sec-v4.0-mon";
 			reg = <0x0 0x1e90000 0x0 0x10000>;
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
index 22173d69713d..6fefe837f434 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
@@ -851,7 +851,7 @@ pcie1: pcie@3400000 {
 			status = "disabled";
 		};
 
-		pcie_ep1: pcie_ep@3400000 {
+		pcie_ep1: pcie-ep@3400000 {
 			compatible = "fsl,ls1046a-pcie-ep";
 			reg = <0x00 0x03400000 0x0 0x00100000>,
 			      <0x40 0x00000000 0x8 0x00000000>;
@@ -890,7 +890,7 @@ pcie2: pcie@3500000 {
 			status = "disabled";
 		};
 
-		pcie_ep2: pcie_ep@3500000 {
+		pcie_ep2: pcie-ep@3500000 {
 			compatible = "fsl,ls1046a-pcie-ep";
 			reg = <0x00 0x03500000 0x0 0x00100000>,
 			      <0x48 0x00000000 0x8 0x00000000>;
@@ -929,7 +929,7 @@ pcie3: pcie@3600000 {
 			status = "disabled";
 		};
 
-		pcie_ep3: pcie_ep@3600000 {
+		pcie_ep3: pcie-ep@3600000 {
 			compatible = "fsl,ls1046a-pcie-ep";
 			reg = <0x00 0x03600000 0x0 0x00100000>,
 			      <0x50 0x00000000 0x8 0x00000000>;
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-phycore-rpmsg.dtso b/arch/arm64/boot/dts/freescale/imx8mm-phycore-rpmsg.dtso
index 43d5905f3d72..414f44b85564 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-phycore-rpmsg.dtso
+++ b/arch/arm64/boot/dts/freescale/imx8mm-phycore-rpmsg.dtso
@@ -33,7 +33,7 @@ vdev0vring1: vdev0vring1@b8008000 {
 			no-map;
 		};
 
-		rsc_table: rsc_table@b80ff000 {
+		rsc_table: rsc-table@b80ff000 {
 			reg = <0 0xb80ff000 0 0x1000>;
 			no-map;
 		};
diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts b/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
index c1e245ecea9c..ff720c139a7e 100644
--- a/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
@@ -216,7 +216,7 @@ rsc_table: rsc-table@88220000 {
 			no-map;
 		};
 
-		vpu_boot: vpu_boot@a0000000 {
+		vpu_boot: vpu-boot@a0000000 {
 			reg = <0 0xa0000000 0 0x100000>;
 			no-map;
 		};
diff --git a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
index 43418844701b..456129f4a682 100644
--- a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
@@ -40,7 +40,7 @@ linux_cma: linux,cma {
 			linux,cma-default;
 		};
 
-		vpu_boot: vpu_boot@a0000000 {
+		vpu_boot: vpu-boot@a0000000 {
 			reg = <0 0xa0000000 0 0x100000>;
 			no-map;
 		};
-- 
2.51.0


