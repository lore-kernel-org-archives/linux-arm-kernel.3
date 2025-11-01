Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52500CCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Nov 2025 04:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rEmntNzIgvbd3ZfuZ5iUUv+8+XvQ/yURzasHSY5J4tk=; b=35WnGVInI5PKlZ+MVPwV0ef574
	aK4HXePvT28BWb2YUqyptk4n/tzSqhWzlHgf/CapGnTb7wLUGdyDh8kgpp4d8vas6uLdYoDATVJwK
	9F0qSmCyqjk/x4lmu4Cgb4kM9r1pElFhCHDTuPTT93hG6pa6a5qJkV2utYziXmDpmJZn91SnIWn3q
	asZudQ4EjF+spX9ERpAM6brq05rE8i5/Bz2K9/AKw2IrRwPywQMu16JC0FlnIExFYSu7EIDXUzZ/y
	MT1No5v2sw9ODteb0lmUevtySpZNgGhgmsJpotLU0sE8eo9T4qOyeu3fXTFxE7PrgP1dtk/eTPl1a
	T0tx7PAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vF3Fo-00000007437-2vB1;
	Sat, 01 Nov 2025 04:30:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vF3Fk-0000000740z-3AqV
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Nov 2025 04:30:15 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A13VCva591318
	for <linux-arm-kernel@lists.infradead.org>; Sat, 1 Nov 2025 04:30:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rEmntNzIgvbd3ZfuZ5iUUv+8+XvQ/yURzasHSY5J4tk=; b=QpfW27k6/ts5uivf
	O0Jv5hlAtu0EzN6j07MkZDDnO/qtug/EcMJcALOCtmKE2IASg9lvaeOtddlQMScD
	kiATUwyQTn1msT/NGI57gx0/PQbk8RK8/BYpKS55Xbht5Im/pKu6bwVMMJC5lbEi
	dcLtnvXFJewtbMhH741KAzTA7IWWI9aViLmGAMY6rAyzty8bPliBy0DZ//kpjoLg
	iObSQwVU4uQSS/FK2Q45jW6V0SpXS6AnHufPSvzAEjLAAOTIpQnHdi3JStnoQRKm
	8pTKt2Kw9Z17uNqRxbB0BRiiDXWU6quRtoAzYRvOBWcp5JAbVx1+kq8SayX72wPE
	D7zKWg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a57jn09rd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Nov 2025 04:30:11 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-29526a0d1afso17468635ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 21:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761971411; x=1762576211; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rEmntNzIgvbd3ZfuZ5iUUv+8+XvQ/yURzasHSY5J4tk=;
        b=DJrdQgrpY+zofNdRfreguz0CcabY0rnCop8x0rwVadlybzl9OhQFTaCGR+8Ybik2lv
         xBq7gh7Rv0D8MB4ciRjEmyjnXBRutffgEeROYkFLoBxabD8OMaL5rO9k/Nr+a/tbTYrz
         4h8FSWdmapKN6jIFGWSz3COsjLuOwEdTmPitr9gDrWoAieEQ7HkrtgVsWY1BtwBB8V3K
         si1tEc9th8NEePuSbQbEEBIHeGUPSiGyJSp5WM3o0Z5jiJZqnd1FtBGjw2nJkX3Pxmh0
         SNuRuQBHyiUj131IZRjc+3HJ+qKwDMFcjBjfuNsINVtTMROkAbWA7mzAXoL7Om3aDV3O
         zEVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761971411; x=1762576211;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rEmntNzIgvbd3ZfuZ5iUUv+8+XvQ/yURzasHSY5J4tk=;
        b=xB80mjHDNLKkjfGA5QZ0ypNJkX95gIxW/hL/3HYXqfeMJW7YFuMHbMbjV8VFOFx6ff
         EGJ5M9FYKxd9xXsPoj09eZnmqCGn6kmZDBWe/yKWkVhGo0s9EO+Ve/p4iEnAFYY6I+WH
         So25VGZC/wdYGZalI9y5XhYCNfJ+fCnbsUJNbFLYRTYVbhDWfzJH2eRVcICbSL4BPgq8
         SgLBVwSrf4CWZImZrjGUQvZ2TUbYtEoGbswV8IUNftysYV7fGW4VQBtvSN5OoU7D88MJ
         Pcj/iCb2Ngd7g2IknKpftOKfOW12hnnKEO06zrpL+48wJH9sK0mYo+V45cxZBQi+OPnc
         NDAA==
X-Forwarded-Encrypted: i=1; AJvYcCUjCkxomZrgiD59DqhkmS5bz8H8PLjJfvy282vPEl8w8HjhmwK7JnCi/y4znBeMKB8VkzOVSQzHeA26uEm7J0qs@lists.infradead.org
X-Gm-Message-State: AOJu0YxbqUEAw3BRN3Z096KR0KcoVRMjiM61z+9+fRN8+p6lCW2qqbXu
	z+qqXkNdA8m9plzfILvmsuzuGj8Pe5sSiZgv2By6t4AxvhmkiZdsx03hrgYNTePD3bzxtGyZdn+
	c2BnGtpd2ivl2gTo6qJtDkhYhlo4zwawkZeqSVUsgmolcV9zpuT6N+WiJnULAvv36qrflwLd/WK
	6ZFw==
X-Gm-Gg: ASbGncuxqbrZB5OsKfIll3CsNR8a+Lxq9d9bGi7XX+ju8rcJDGyCgpNPowcIg6IhM41
	IlqcBRbre2kUSPS7Vkm2eFqphiV2XD2L7+n1qsKGufwAPWsx2TfTcW92PdYnWM8xaRceIIudmGK
	Scq8VSrNZQNxgUa3NpuxJGfrzFLnJ4ugu/lGgvrF+4G+5+yD41tuqj7GBpABiOOWZc/QjZeMP+G
	FGDfvA1P5YdpqgsL90SDxrF5gCMZ+rxRWh/KedqqJ+/6XSN/Dz6G3HLNfcPyUZvR/c89VKCNYXc
	PlJdqZEFPViJDM/IaITeeSr+3CKyT1ou96VmiQsaSsmbLK5YswzpghMOtkKN9sUn7VQnENs+gkH
	HqSGxiOecCwKHPQE82SbIY4c8
X-Received: by 2002:a17:902:f602:b0:295:28a4:f0c6 with SMTP id d9443c01a7336-29528a4f5admr55695875ad.0.1761971409388;
        Fri, 31 Oct 2025 21:30:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVwZ+kekou+fixvG0M2Vz/vgve/y1Kvl47T2KxfST7IaCXT0xX2tM2WuyIGokWq2NTuaVOZQ==
X-Received: by 2002:a17:902:f602:b0:295:28a4:f0c6 with SMTP id d9443c01a7336-29528a4f5admr55695065ad.0.1761971408819;
        Fri, 31 Oct 2025 21:30:08 -0700 (PDT)
Received: from work.lan ([2409:4091:a0f4:6806:9857:f290:6ecf:344f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-295268717ffsm42273285ad.2.2025.10.31.21.30.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 21:30:08 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Date: Sat, 01 Nov 2025 09:59:41 +0530
Subject: [PATCH RESEND 2/3] arm64: dts: amlogic: Fix the register name of
 the 'DBI' region
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251101-pci-meson-fix-v1-2-c50dcc56ed6a@oss.qualcomm.com>
References: <20251101-pci-meson-fix-v1-0-c50dcc56ed6a@oss.qualcomm.com>
In-Reply-To: <20251101-pci-meson-fix-v1-0-c50dcc56ed6a@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Hanjie Lin <hanjie.lin@amlogic.com>, Yue Wang <yue.wang@amlogic.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Andrew Murray <amurray@thegoodpenguin.co.uk>,
        Jingoo Han <jingoohan1@gmail.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        stable+noautosel@kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2433;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=VrcDCZTTzA+LINiKOMWUnoZKZnxjToLdODEk4F9zscM=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBpBYy9XwQb731Bpv0QhX79igT+SZRYiSopEBiJ4
 W2XERk5uCGJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaQWMvQAKCRBVnxHm/pHO
 9Zh/B/9owuOX+V5eWryUwchPVToFhqEvoXpFH2c5lRHxiSrUbe1aaJoP2pPhP1t0wqK49vmI5o7
 UVb8r+OdIcFl+ZF7Kn0gr4dOv3xXCbYKb0+vgmdMxHFTZUUhzt5EMnZd0S1oobqV2hJvmpbMWEn
 bx1QA9Xu9f9Al2l0hUZQm2SrCJPKqW3c2qQbEetzF5MVp4isGqYffd4VI0Tm9vyS73l+60be+2I
 +bnZiDs4mYAkGHM79aBXBZUizbn2qYhm4dP/kPatxE9ipGiiTivqjIfiXR7s8X5mwSSyqM/fvaa
 AjG9aS8O3ekS4FGuOqfCEscfcTNjaHgzg2ieFHftf+S8v6Sb
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Authority-Analysis: v=2.4 cv=StidKfO0 c=1 sm=1 tr=0 ts=69058cd3 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=_UaV9RfZZwOaPWMAg4wA:9
 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: vhx6eCRDBr5hDcpH3qRlUQZPgPJ0vwEi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAxMDAzNSBTYWx0ZWRfX8bieBFmi/wuO
 Abf5J0iNtLbPNwWLXcEUFZXUVtbUXDGtl1dFmDhWo/xa5wUsa5vW5ETPwI1VQrOuSEi7M0DiLni
 BMcLcwMVeIsA8v+r7y/u5npNGaxcRxy2SQFkyQVveI2nS/oSr9XPt50DDTGkbiwhkqqNN/1m64a
 AXWT0LYvaSlLFZKCWbmRrDiVqbNOhbK4KuL/GZKFAz9/uCm7hAYJCdQMCWaaCJugSXDkr/ItOOo
 sqO70PQQhM1Dej+OSbM0L34dFc8W8kEDXZozWRMwpaMNtBMHw3iZmwKjZBrEOoxKUfG14QgKRpQ
 oEIloZJDhAApwO5fE6X5+139fXwPucCGMLbZEW5mR62ZpkTuL2H2r3M6GQnnoHVSuSCCdLqoJLx
 RnrLhzSTTHmB4K13NULgDMoIkok7dA==
X-Proofpoint-ORIG-GUID: vhx6eCRDBr5hDcpH3qRlUQZPgPJ0vwEi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_08,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 malwarescore=0 impostorscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511010035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_213014_056039_4FB69866 
X-CRM114-Status: GOOD (  14.11  )
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

DT incorrectly specifies the 'DBI' region as 'ELBI'. DBI is a must have
region for DWC controllers as it has the Root Port and controller specific
registers, while ELBI has optional registers.

Hence, fix the DT for both Meson platforms.

Cc: stable+noautosel@kernel.org # Driver dependency
Fixes: 5b3a9c20926e ("arm64: dts: meson-axg: add PCIe nodes")
Fixes: 1f8607d59763 ("arm64: dts: meson-g12a: Add PCIe node")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi        | 4 ++--
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index 04fb130ac7c6a498f7e8029aeaa7e511cbfe815d..e95c91894968b2c8b3b8e96a5f5e85cd60f3e085 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -208,7 +208,7 @@ pcieA: pcie@f9800000 {
 			reg = <0x0 0xf9800000 0x0 0x400000>,
 			      <0x0 0xff646000 0x0 0x2000>,
 			      <0x0 0xf9f00000 0x0 0x100000>;
-			reg-names = "elbi", "cfg", "config";
+			reg-names = "dbi", "cfg", "config";
 			interrupts = <GIC_SPI 177 IRQ_TYPE_EDGE_RISING>;
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 0>;
@@ -234,7 +234,7 @@ pcieB: pcie@fa000000 {
 			reg = <0x0 0xfa000000 0x0 0x400000>,
 			      <0x0 0xff648000 0x0 0x2000>,
 			      <0x0 0xfa400000 0x0 0x100000>;
-			reg-names = "elbi", "cfg", "config";
+			reg-names = "dbi", "cfg", "config";
 			interrupts = <GIC_SPI 167 IRQ_TYPE_EDGE_RISING>;
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 0>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index dcc927a9da80246da43391f9f90049c3570f10d2..ca455f634834b5a52db8ff4e6ebca35a87ea17b7 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -138,7 +138,7 @@ pcie: pcie@fc000000 {
 			reg = <0x0 0xfc000000 0x0 0x400000>,
 			      <0x0 0xff648000 0x0 0x2000>,
 			      <0x0 0xfc400000 0x0 0x200000>;
-			reg-names = "elbi", "cfg", "config";
+			reg-names = "dbi", "cfg", "config";
 			interrupts = <GIC_SPI 221 IRQ_TYPE_LEVEL_HIGH>;
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 0>;

-- 
2.48.1


