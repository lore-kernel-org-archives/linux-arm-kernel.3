Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AC0D112584F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 16:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=acwQSi846tDeR6L8sBuJBMqOc0a1tZzopD+zdGBMQcM=; b=dXtpSnXC++8YK4
	EwU6wgj4AzlmW0aSY+NFI5u4W0zxnJ9ink2X1DNGfRGYR+49g3zpmffDsExBJicd5uOrg+MK7drIo
	rW7QYtPJNoMa3HLWQ4sdKF/1gD3KJKnQ2ikLJ2KniR8SgHlPn8qWLh3qyYboGwOpBUxBVcIl/ZYB/
	+TOyk8VRE7rPKR2wNl2xzLLXIqkyFbJ5rfcTdXNMxi/sWTaHu0P5W5oqevOvikftsu6cHhchWDMO3
	yVMMOI1Y3raC01vHoj4hd4GVDfAf0SQkmYFCWtQDnBHQIkYyKF20uw9rM4zR06gyY7aFYuSQBD0cd
	stb0xuk56GEZfauPJneQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0M6c-0000000BsHh-0sq1;
	Wed, 11 Mar 2026 16:08:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0M6Z-0000000BsH9-29d1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 16:08:16 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BA5auF294243
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 16:08:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=acwQSi846tDeR6L8sBuJBM
	qOc0a1tZzopD+zdGBMQcM=; b=cT+Msicld3dBTzZaT6CDNLHOLS4TbTwZ1yA0Aw
	5rmBuF1umnq0bZyU11nto70GeN8XagS7yrM6MncKZuHQEHTbHjKZkHDAOcXAdkbc
	MqdE0IrCHdj+waAollpZltvJv+CPde4j3zJtJ5rPh8UwM280ktnmmZ5kq2AgMDxh
	Yd8lULrhNZk2pk69rTYuDE/wAc/N/XAf/1vWZyElqNHX1mm2K8KfekDdNtMUxjvI
	tpkNKcC/k1npqjt6hznhHMeTVTltuZoyzl1zbKL+hE1fWl9uVnwV5ku8zBmXV1zO
	p1xFjOdvFZYTdn0xZetWVVNhK98ubJvqYtyg57805F4z+Kig==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cu6bb9art-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 16:08:14 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-5f58f90f83aso202015137.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 09:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773245293; x=1773850093; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=acwQSi846tDeR6L8sBuJBMqOc0a1tZzopD+zdGBMQcM=;
        b=Dd/5XKbQCSqMjCEn1INs82990TorZBMYmboT/y7WFbP0/MlVa1g3SQilAJ/bSyLdRh
         gPji7t1COsrB6N+VfMvpyTkPhmGTiOOmmwVInBRws7BlJEsEanjwuydQjFcgUKHSHQRZ
         SxwCPuglyTv0dgFqCMdamJt1lyiaE59UxwuTFFKzben7eqFHUl0KWaDrDuIXVkU4Lwcw
         p3TahNveW6BgsEJ0a6NyGW32/HSXx68hzWbUmQrp1/diQf5i2YrWp2iJo47OWaGNyzkL
         bhotnW/6Fgw9gjq9z5DKAxGQoZzx8Pi6Ra93l3wt84EpF9bHXA4CxMJkEU5ZXVUURBko
         /Lvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773245293; x=1773850093;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=acwQSi846tDeR6L8sBuJBMqOc0a1tZzopD+zdGBMQcM=;
        b=GLYoNH4RrbVpGarnjpLurzvJbC6eC9IiWrnr8YAF5asIfoyJkVHbbUfCxIFvR6BelB
         f6wo6rEVdUqBODLeHJUHWwesAZm2ZJ2frUes1CD1qpmKERMmcG7z8r9gh/kIp6Y+HI6W
         UEu8dvGfrRLp3drRXZFnwBA0kew/DitEhjRxE5GdMZuRXDjeGaLnz9Uc01cJMeJP92wH
         /gDbRu5atQn6J00SKzht61EgG/1Bknj78xUwUG2g4eeq+eioYLKLvGRDRVIgEoEVl/vq
         EGlmbNdBYd9MtT/bqlHP8xmH6i4s5LRKupEUYYdhlvQ0OdbGM7+tyoYPyWZukKg7fkTz
         kSBw==
X-Forwarded-Encrypted: i=1; AJvYcCXzXSzuM7/TbgaJeWBsrkDDM6thAWt3RYOJBjxFg1CK9Pyzeo7BPG7oSdYdBN/5KdPP2JwU1RxDYbUnZ0JaBleX@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1F4Zon60KOcX5VEJyP1YRDLIOwYBFEI7Wp4Xfx2aic1EG4lu1
	F7V9TMvTf76mMGQZBUx+UX8WoGkIK2WUFTe+dPtFnWU1AzAToX5vSk+VGshvfXqJgaZUK7sZEe/
	p/VjtQRscUKUPWsH0QcuM5lKdaKAXvZU+BEeRIR7LpMBtvptWPE2N796FASG2KPJ5uMmCdz2bM4
	wv5A==
X-Gm-Gg: ATEYQzwNKsaOFcDDYcAyVkzzzHaNy+PdDCtGLJleTSsoUkZwh1YLmfFvTbzi4jaGZg+
	OfzIcqU2Z/0IjKZu0AYV5rLp3Ao5X6uuHGnxtGh3GyLYRT+FFEq3gckLchrGksAyluq7iR/ohZj
	uNgcc204mk9wd20XjzbrBfYPk+LhAeTB4Mr4bsz/xDfUuuGESpDPJnQOl6ZiqnyX/OLTdoFc0pk
	uGM7YcuymZ56GhQg89yBY4KZThKhjrFQXThLhBraMVtmgGdsRqhKd2wuAmfxXy2Am9IzcTkvrs/
	Fa0ZrX1vCis5/D9AAvryxrtqj3LjtQNfERrExmAtM7U5PKoN9KHYOHHNqzk0gSfWysLq6sfm09U
	zpIPKDUSYqWT8MYpc/l+/aYGXiJ6AwmvcYkWCT98Y4g0f
X-Received: by 2002:a05:6102:390c:b0:600:d0f:bad2 with SMTP id ada2fe7eead31-601deb258cfmr1501630137.2.1773245293338;
        Wed, 11 Mar 2026 09:08:13 -0700 (PDT)
X-Received: by 2002:a05:6102:390c:b0:600:d0f:bad2 with SMTP id ada2fe7eead31-601deb258cfmr1501596137.2.1773245292806;
        Wed, 11 Mar 2026 09:08:12 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe1aa2c3sm184711f8f.13.2026.03.11.09.08.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 09:08:11 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 00/12] arm64: dts: nxp: Use undeprecated reset-gpios
Date: Wed, 11 Mar 2026 17:07:56 +0100
Message-Id: <20260311-dts-snps-reset-gpios-v1-0-ea1cc09fba84@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFyTsWkC/x3MTQqAIBBA4avIrBvwByK6SrSQnGw2Ko5EIN09a
 fkt3usgVJkEVtWh0s3COQ2YScFx+RQJOQyD1XbWzhgMTVBSEawk1DAWzoKBtPPBar84AyMtlU5
 +/u22v+8HlCToq2YAAAA=
X-Change-ID: 20260311-dts-snps-reset-gpios-de03ad20a831
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=9075;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=7wZc9foihLtHxvuom8UQSLuUCqRA15KR99HalA6eYeE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpsZNeBgm6UuQFXIJm0gY5eOWLjeBW1CdohPIiD
 D0MN2Ll4ZaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabGTXgAKCRDBN2bmhouD
 18n/D/92b/Zmdimgv6e8sUr5TlziGq635N5ne+ej4A6FxXmYnaTLAlTGLqyEQv6RKonT7bBDpYd
 OHsLZJ1HGntu6g84DlepRAtPSiz+6cPsiJ6YckI1lBPm0XM2i+ei71liASzXS7AHb6caSlZcWCe
 YxbQy+aH5ou46WpT5TQNO22CDuRY3PpgdKh453OWpiEhFeGySFeD8fevdIwbnbIuJtctmo16k2w
 7kqWYJHuTrlOHPtotncGEmNmZm/iKgpalhh+zbho+mvO1K5dGHxkXDkf6kS8zeU9d2Sy48Thlmn
 PnZAVXPZJcoWh9Fk2E9B5My1aWOsx/TQg4WBZXGCTajtr0vJRCEbR/PuQvozAUYtxmzsLHZN865
 fp0f/Lx4zpY2Jpk/K48/F74CGhfVAcoeMADlLf5mHcScJksHYqbIL43nI/TfUA8033CqbqWrWY6
 gT6930VJOuGXrvYDZZuNmSMWZbe6Vj4MMolM1X4XWDuy8CaMvT9dL7JReQGgGkZhBOgGLoC4auz
 sPry6ko2vLxQsAgSt0wSq16sNmRonismDufygGOO7vCCaZ5AW3m4uQ114N5/hOlbAwfzo5xI8sS
 Y+XeLiO0aR9XhRYi6G89IrfFFKkdomcZ5+XqFGe62MNznQsZ1hcmuii4MudW2NIZvPG/h+ktU7G
 STHHQCCH2R+T6EQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: DWFyXWri4Q0N1oH5LDjS5a6U3grwmYZQ
X-Proofpoint-GUID: DWFyXWri4Q0N1oH5LDjS5a6U3grwmYZQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDEzNiBTYWx0ZWRfX9SFM3dVh+2KF
 b8Yx166SmJS14o6dNAax44dWK39ZuF6VpUscIMMWa0Mo36QT+lQ6aXmjp9z7wsUwQfTpbo0Y7yF
 01ewv+0qPRf2iTedOQuy0fC5sOpdhn3O3wKXz9jOa2ru+oFKvZYTOmh5gvS+l/01qHlthjuUKze
 7oaGaUOKoDJGoBI7pyeHTR5DRF/7c5Ks+Y8gV3SIxEJ1SZcV2LwAEI1roPMBJAQHfmR1uL0ijgN
 2BeRsdt1Z82EEYRHb1VivAFn/5W8BO7Xdd+QnIjbEMq/qcnMiIQdhTAFa3FEZGEDBsHUyOPaPUO
 zGSSs78T20/RpgDbxROKahCL4OU6qRdUhTLQ43xFfXZMqxIc6hFEPqPdXpvc4UR10plF17jTRxj
 hjqktK0+VS82Fg8yRHrCGstdxSx4tg0ci/hiBZSTwCbKv9Cs9yUgHYRUxLAu4eD1ieCt5ExAz+e
 tuaQspMuC7FJPVQ6wBw==
X-Authority-Analysis: v=2.4 cv=CKwnnBrD c=1 sm=1 tr=0 ts=69b1936e cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=_YOUY-ToEASP1VAxC5EA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0 spamscore=0
 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_090815_586003_D0475E84 
X-CRM114-Status: GOOD (  10.14  )
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

Freescale i.MX6 PCIe host controller bindings through referenced
snps,dw-pcie-common.yaml schema already document "reset-gpios", just
like Linux kernel did for a long time.  Use the preferred form over
"reset-gpio" deprecated since commit 42694f9f6407 ("dt-bindings: PCI:
add snps,dw-pcie.yaml") in 2021.

This fixes future warnings expected when this is applied:
https://lore.kernel.org/r/20260311154955.145120-4-krzysztof.kozlowski@oss.qualcomm.com

Best regards,
Krzysztof

---
Krzysztof Kozlowski (12):
      ARM: dts: imx6dl: Use undeprecated reset-gpios
      ARM: dts: imx6q: Use undeprecated reset-gpios
      ARM: dts: imx6qdl: Use undeprecated reset-gpios
      ARM: dts: imx6qp: Use undeprecated reset-gpios
      ARM: dts: imx6xp: Use undeprecated reset-gpios
      ARM: dts: imx7d: Use undeprecated reset-gpios
      arm64: dts: imx8: Use undeprecated reset-gpios
      arm64: dts: imx8mm: Use undeprecated reset-gpios
      arm64: dts: imx8mp: Use undeprecated reset-gpios
      arm64: dts: imx8mq: Use undeprecated reset-gpios
      arm64: dts: imx8qm-mek: Use undeprecated reset-gpios
      arm64: dts: imx95: Use undeprecated reset-gpios

 arch/arm/boot/dts/nxp/imx/imx6-logicpd-baseboard.dtsi               | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6dl-eckelmann-ci4x10.dts               | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6dl-qmx6.dtsi                          | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6dl-yapp4-common.dtsi                  | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval.dtsi                    | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora-v1.2.dts               | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora.dts                    | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6q-ba16.dtsi                           | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6q-cm-fx6.dts                          | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6q-dmo-edmqmx6.dts                     | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6q-gw5400-a.dts                        | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6q-novena.dts                          | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6q-tbs2910.dts                         | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-apf6dev.dtsi                      | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-aristainetos2.dtsi                | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-pdk2.dtsi                   | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-emcon.dtsi                        | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw51xx.dtsi                       | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw52xx.dtsi                       | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw53xx.dtsi                       | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw54xx.dtsi                       | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw551x.dtsi                       | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw552x.dtsi                       | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw553x.dtsi                       | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw560x.dtsi                       | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw5904.dtsi                       | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw5907.dtsi                       | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw5910.dtsi                       | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw5912.dtsi                       | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw5913.dtsi                       | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-hummingboard.dtsi                 | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-hummingboard2.dtsi                | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-icore-rqs.dtsi                    | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-kontron-samx6i.dtsi               | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-mba6.dtsi                         | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-nitrogen6_max.dtsi                | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-nitrogen6_som2.dtsi               | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-mira.dtsi                  | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-pfla02.dtsi                | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-pico.dtsi                         | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi                      | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-var-dart.dtsi                     | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-zii-rdu2.dtsi                     | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qp-sabreauto.dts                      | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6sx-nitrogen6sx.dts                    | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi                           | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6sx-softing-vining-2000.dts            | 2 +-
 arch/arm/boot/dts/nxp/imx/imx7d-mba7.dts                            | 2 +-
 arch/arm/boot/dts/nxp/imx/imx7d-sdb.dts                             | 2 +-
 arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi                 | 4 ++--
 arch/arm64/boot/dts/freescale/imx8dxl-evk.dts                       | 4 ++--
 arch/arm64/boot/dts/freescale/imx8mm-beacon-baseboard.dtsi          | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dts         | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi                       | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm-innocomm-wb15.dtsi             | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm-iot-gateway.dts                | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-rdk.dts         | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l.dts            | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx.dts           | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm-venice-gw71xx.dtsi             | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx.dtsi             | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx.dtsi             | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm-venice-gw75xx.dtsi             | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm-venice-gw7901.dts              | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm-venice-gw7902.dts              | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm-venice-gw7903.dts              | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm-venice-gw7904.dts              | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi                    | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-aristainetos3a-som-v1.dtsi     | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dts                 | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dts         | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2.dts                 | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3.dts                 | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-edm-g.dtsi                     | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts                        | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pro.dts           | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse.dts         | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc-eval-carrier.dts | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc.dts             | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts        | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-venice-gw71xx.dtsi             | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-venice-gw72xx.dtsi             | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-venice-gw73xx.dtsi             | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dts              | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-venice-gw75xx.dtsi             | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-venice-gw82xx.dtsi             | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi                    | 2 +-
 arch/arm64/boot/dts/freescale/imx8mq-evk.dts                        | 4 ++--
 arch/arm64/boot/dts/freescale/imx8mq-kontron-pitx-imx8m.dts         | 2 +-
 arch/arm64/boot/dts/freescale/imx8mq-mnt-reform2.dts                | 2 +-
 arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx.dts             | 2 +-
 arch/arm64/boot/dts/freescale/imx8mq-zii-ultra.dtsi                 | 4 ++--
 arch/arm64/boot/dts/freescale/imx8qm-mek.dts                        | 4 ++--
 arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts                   | 2 +-
 arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts                  | 2 +-
 arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts                   | 4 ++--
 arch/arm64/boot/dts/freescale/imx95-19x19-verdin-evk.dts            | 4 ++--
 arch/arm64/boot/dts/freescale/imx95-libra-rdk-fpsc.dts              | 4 ++--
 arch/arm64/boot/dts/freescale/tqma8xxs.dtsi                         | 2 +-
 99 files changed, 107 insertions(+), 107 deletions(-)
---
base-commit: a111dbdd99557fbaee8c3d376d6b361f96966d7e
change-id: 20260311-dts-snps-reset-gpios-de03ad20a831

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


