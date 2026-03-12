Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3465D106ACE2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 19:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NoYJ8smrLE12hDZjhZ28ISQ4B1LbfLzlcdD/Jf3yZlY=; b=CjS6US2Dw71SOUStUNORZJRGKe
	ZMsSfeE2uVG5dWtxx0jyoXt+xIWsdabOedk5R4bWu+tkabLpfNVmgS8jteAX60cgfuioT9pnwRjgB
	EQP0kTY5XwWjHsVMIR26hNb2vDlKk0sNO79NYXXEOnNqL5BG7U5i1qXq+0BRUPKRaQTGwfxb2Ehgc
	vOuS+vCTp/p0jMOpWks5ulQ04qbZL+BbuFQW82XB38muq+0KxsYfrkkQXtPhnrSJvjC8xgELxocwz
	3Pn/Z4GMWxJH9LxufVcoAl/yKrrQUm8P6WLZatFoCOXo+Pg6O1jLRzHqrimIo9I3HXtLAxV2CpKPL
	tHcUy9JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0lYE-0000000F36n-2EAb;
	Thu, 12 Mar 2026 19:18:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0lYA-0000000F2y5-0ey3
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 12 Mar 2026 19:18:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=NoYJ8smrLE12hDZjhZ28ISQ4B1LbfLzlcdD/Jf3yZlY=; b=eVqLLIbI9mEkeMX4hBn1UMi+gQ
	WfPT4K3OfSa51raLNAteQ03SXBZbbrxIJ5sjl+IzVtLehJ6SAuZ9owOo2hxPMGRCwSaXho6ScWDHM
	Q8ZgxPHZ9NB0ifziOV1QHjVFYu/+N770ffT4Hhm8K2b/raYsrHmfFG234lAyTb9SR9jKPH6b0Wt8k
	d1W+EbCBdLolnSc6eT3U1/tM/MtRq0hyO00MfExQwRTWxt9UBJvBPAm1xD3+M1HIfTaJzzyPUJHdW
	hX5ScxHGFaLuzr+bReQ7ufcsHL4EWJAAY5Sc9b8iBPuoaKOZcphz8Bkgc0yTn80C/IDlmX9ZZOXVZ
	+IoFuxnA==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0lY6-00000001quk-0853
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 19:18:24 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62CHnxQ94025952
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 19:18:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NoYJ8smrLE12hDZjhZ28ISQ4B1LbfLzlcdD/Jf3yZlY=; b=iriMTp0sjX2QxC4s
	mHKwN/iOBmEGRlInxaVTSsMZYe1X+CybqlnilwmvTUVBbsPya2kdNJ4JN+W388Dd
	XgOgvoH5D+J5peqOC3LRXJFSfSZsP4PUwsiFPMAxajsWTPTec43qkdMTxxzvK7Ms
	8ptqNO+m0a1t+ls/W7xbvNXnSOxme7gRycp/8RTohossOgOp1Ac4WEBgxYxS3e60
	rqdyedpNPI+Dpregb1ZSqtw57OaWuihaY0JODGvg9P8nfoOEgz4Y86dd4nzYBwcM
	HfSK36FN4EjET750bRIl2XBy94Y6ky8DxCnLpUTSM2Qw4t6EZxfT+XAosUUgKiRc
	4wgcsA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh50u8y5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 19:18:19 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd80bea54dso775884185a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 12:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773343098; x=1773947898; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NoYJ8smrLE12hDZjhZ28ISQ4B1LbfLzlcdD/Jf3yZlY=;
        b=RwshgSlxXhtvoiBhbVi8D+94ht9Oh4hUdB/AK1b5AuHkfWnCnkoO4kxAZYkZCo4ltJ
         TAAxQ2EOuinTwa7N5AepezgBDCeGQhzH3VlNqXJ9EqaABUzNICusfZ8Jh73xivpZKSUV
         SMvwnLUfR9lFHz8MTINJCvALtfHygd5rg1oQ5wgKZjlEOkjQb3lIVWssOG3kESuXHavo
         AqVOjByAcBuRjFkRwANKGg4xb9AfLs1IdNwGZZbvdQglqdQwDeIYJdNCIPmqbD6uIVrI
         qsYcRUmOO9Q4macnzaiQob8iLd2dLVovlAlltXs6e5Ckw1Uyr+j71TLL9vi36KWBakE8
         qCuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773343098; x=1773947898;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NoYJ8smrLE12hDZjhZ28ISQ4B1LbfLzlcdD/Jf3yZlY=;
        b=Xh1VQQVtFjBPXIpVjfd2PzwreMvDz0azYnyOEtHDAwDyKQAMEl+Js+bPHb6tfDxEw3
         FA6Li88gmAhrkvg316awp67U/UF5pmAPzy2f6PWIlqW3j5e9HHPFctpzT9ssE6u7C9Fk
         3ZEhgctOSePQHe7vNFnfEys8L2GJNNfjRaD5QbFFysq7tTUoWe945MzlafFsufkfcwgL
         Myg8GF8xJ35UiPoQRiLJhOXHoOaeS99hhQFbAsKVYuuHQPTEXGW7iSCjiKpV2elokrdF
         LmYXuiWyCYyjQ6Yh0Jyr/VgmR+v6Qnklzi8yl+N7d41vCNjihtMpMwTgUab/IvUttFHR
         fgtg==
X-Forwarded-Encrypted: i=1; AJvYcCUC4wBCyN6jAyv24iSSaFYkiqR68+OXJi3pN+f7watzEOnduciwpMnCjoPyivRNY5kcllYHh8yqeKi6RojQdp98@lists.infradead.org
X-Gm-Message-State: AOJu0YxKP0Jj9ldLsi881pDpNPeul8HgpkUcFn3I1kG2QZH6SQhG5xFZ
	teaDGp3LHmg2jMzbaZJ0gmX89oHnUoF7TWkIIN48ec6Oc/EUu7KBhk44KpuqG6b8Lkk3ap3Dcmn
	4T4cnjtKmlATk1Qz/4bOFQp8fadqHKtrwOpevGYzyysTg6+etLYogBGUgtQobZj5M1C95RqZL8G
	tE3w==
X-Gm-Gg: ATEYQzyMkWDjat0d9ytnE1noNv7hJZjPEOBofuHmc3cq1U+VoYZL6jLQGm1zC53K5vc
	uryf7BIPoBO3K3w+IoEizOFaqhkOIyrxcTllKkl08aTAXCdGxGY3/b1qrlgXMmtQOt0gVJBVqLg
	kIqXs6HA3krXlU01Iw7BbkHpZKdM+/iPblYJIUkM9U5NtkHhZ7DV+43W3hSfkHaq8VCw8ZsGIG+
	oLOBU1IS4K54eIsvl3w7OA/nt58GH/nV0dRDl7fKA8YCK596aNVvEWOLORQa39EzvYMRNXYEp1F
	XZrk1F75pXnHUXacK3O72mETSce5YdJRAVQ2o40x2RAXQpe5M5YJzk/tSXyjEEzWSnYDBtHsdv3
	HQXaXbYp1r7T0H0ir8BbPk1wLA3a89muctLpqM+A5q8mT
X-Received: by 2002:a05:620a:4041:b0:8cd:8e07:46a7 with SMTP id af79cd13be357-8cdb5a6b403mr120169185a.23.1773343098546;
        Thu, 12 Mar 2026 12:18:18 -0700 (PDT)
X-Received: by 2002:a05:620a:4041:b0:8cd:8e07:46a7 with SMTP id af79cd13be357-8cdb5a6b403mr120164285a.23.1773343097995;
        Thu, 12 Mar 2026 12:18:17 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485577835ebsm1874935e9.7.2026.03.12.12.18.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 12:18:17 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 12 Mar 2026 20:17:51 +0100
Subject: [PATCH v2 04/12] ARM: dts: imx7d: Use undeprecated reset-gpios
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260312-dts-snps-reset-gpios-v2-4-0d5040eb4a1e@oss.qualcomm.com>
References: <20260312-dts-snps-reset-gpios-v2-0-0d5040eb4a1e@oss.qualcomm.com>
In-Reply-To: <20260312-dts-snps-reset-gpios-v2-0-0d5040eb4a1e@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Christoph Niedermaier <cniedermaier@dh-electronics.com>,
        Marek Vasut <marex@denx.de>, Russell King <linux@armlinux.org.uk>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel@dh-electronics.com, linux@ew.tq-group.com,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1562;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=1JhUw/+k2HghIFw2rLURIxN1E0BaOLd/s4QvkRP9/jo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpsxFkqcWLZ7eeKfW52uQ191tN4KQHtZS5AFTNA
 RUVL379c0yJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabMRZAAKCRDBN2bmhouD
 1zLQD/0e5Y6Cn547ZI034CLSim+/I/VP95hWXYBnHBC5t1ov+7ttLaUZDLarzpaKB8ge5Qf8iIC
 EnncVAyKnmCkC68qMWArmeG2yRG1S6qDC0E7UNLV8Y7zox8OCPv+y7XXkZqnZXqO6bHSCJLOZcE
 glabsRRCGIREYUBRH1asYvekrklBIaKSsxezsHivW0nO6n7ky54bmoCOeDZASCSNp3uzkJMxDQ6
 MBypzNDhm17ZYaUU5+DaCRgXqaOW4TtofARj/iBmtgva7BXObzK21aAONA0E8vvdhGl8c8qAzae
 3Xnu9/9KfAAJzrjZ/rtP1adak1BCte6gRaWpXF2dYLDEi05yecMyYXQp3I9KGj+inbklh7VTyW5
 RY03vwySvbNFEbED8hr9vRy/mzzBzB+ECoyGCfpWApREXy1ugGbB5REqzXl3mI2M/yl4fJbpFlr
 lUcN1ly24ogZGOhqu3yfvM7QOxa8rQr8/vroOUq2EAAuESsrgqSdG0y/r1PtkZuRaeaiFoSCNPN
 n8kPQfb4YrqVIrY7S/M6dWhU01YCQYoyti2u215IFvTgiVGepyaCzxkXK/z4XYUfdU5oDkdK+MS
 nOZ6qKkwBKtzSO6GSbg3B6gyOK0OaJv+75JXkVj0gwYvTzX1DOKTLCD8dFaMKj+maHGFJ5tlJgZ
 6rnCbKptUC7Ml8g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: JfV_YlMNu0uz2Kuj4PW7YkNH_RUY_3Ch
X-Authority-Analysis: v=2.4 cv=LvKfC3dc c=1 sm=1 tr=0 ts=69b3117b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=8f9FM25-AAAA:8 a=EUspDBNiAAAA:8 a=ZEd_D3wCKC4SqcO1QeYA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=uSNRK0Bqq4PXrUp6LDpb:22
X-Proofpoint-ORIG-GUID: JfV_YlMNu0uz2Kuj4PW7YkNH_RUY_3Ch
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDE1NiBTYWx0ZWRfXyZ0A9SH/Cs5u
 A7NAs2qt0zCD6N2TwyFPlBNFcb0E4Om6IaskDDj+LINVxVc4iib0EB+f+pDRa7cACOrmbjiNHuN
 M9knjNGIHjXUnaaX8TSb67Vyr6+QFnCVYBPFXpQYiLkal0xUY6LGtYxsFR+MKwYZr1htmnSG0Mt
 97Xm99597ooc2Q1yTYvmQs3cO9d9NfgMW7H2T3OIrJkSoldiXL0h7OLM0Y+VWFw9V2t3lEwpegH
 WRrgS1jBGIfRrIK8ESIrZKEibwS6da4wP2l5yitDY0ElPiciZ4eymGY8oRVxiBWIsRb1EHfxNHx
 EdPXkiv26wU36a83uHdeHyq+yYLncF8LiyJEX01C/gao0Q5XjSBTa0cG4AgFZdRy18QKrcB8QJU
 Fhf2kbSdp6yYxMoZV5m3HzghRaYWcp4EoFg6AD+0uCkfWHNwVoUSePTGOe/AO3yWUVEMsaKLmOv
 s6uCFVS6vNZwMoNCWgg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_02,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603120156
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_191822_935787_7EB07D92 
X-CRM114-Status: GOOD (  16.41  )
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

Freescale i.MX7 PCIe host controller bindings, through referenced
snps,dw-pcie-common.yaml schema, already document "reset-gpios", just
like Linux kernel did for a long time.  Use the preferred form over
"reset-gpio" which is deprecated since commit 42694f9f6407
("dt-bindings: PCI: add snps,dw-pcie.yaml") in 2021.

Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm/boot/dts/nxp/imx/imx7d-mba7.dts | 2 +-
 arch/arm/boot/dts/nxp/imx/imx7d-sdb.dts  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-mba7.dts b/arch/arm/boot/dts/nxp/imx/imx7d-mba7.dts
index e3ee16f1aaa9..a5fc7f80f651 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7d-mba7.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx7d-mba7.dts
@@ -122,7 +122,7 @@ &pcie {
 	/* 1.5V logically from 3.3V */
 	/* probe deferral not supported */
 	/* pcie-bus-supply = <&reg_mpcie_1v5>; */
-	reset-gpio = <&gpio5 12 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio5 12 GPIO_ACTIVE_LOW>;
 	status = "disabled";
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-sdb.dts b/arch/arm/boot/dts/nxp/imx/imx7d-sdb.dts
index a370e868cafe..ab7cabe5552d 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7d-sdb.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx7d-sdb.dts
@@ -456,7 +456,7 @@ display_out: endpoint {
 };
 
 &pcie {
-	reset-gpio = <&extended_io 1 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&extended_io 1 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 

-- 
2.51.0


