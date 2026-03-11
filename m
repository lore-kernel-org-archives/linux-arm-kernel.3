Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB591112584F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 16:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RWuLFkC+W8N6pgB1r3mjP/feOeH0KAiskDiUSNrILSI=; b=u+9QAFzniDgDQfIzoL14rKusjv
	EPNOb6jwg/9otMqmvSWrboh9xWsFUMWa5gE3sqzsGDzo+sIK4w0m8s0fZ04Di/73KocOQS0xrYY8+
	q29bl2/+m+OVphMRXefDKFm7XpWq69yEuafDHbRqnK0/Zd/sCtOX0xSdkygg7eSH8dY7eTDaCvOOO
	qWRPlb8HtkjeywVoQrFdGP+8Q0dPU8nESrpfcqrbmqpJ1WIGrEETEweF/kiq/jCfxxWZvRc/cVdLT
	PJeI2qmOl3nWQs2Og9ZvkfyFMuq2Ud624RgG8a+BYYAQFUwm5bMR3Wcl17kcWGunBEM8ShMjnhCz6
	8R3ZUOoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0M6m-0000000BsLo-2gNJ;
	Wed, 11 Mar 2026 16:08:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0M6k-0000000BsKN-1Hb4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 16:08:27 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BCxnJ52031244
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 16:08:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RWuLFkC+W8N6pgB1r3mjP/feOeH0KAiskDiUSNrILSI=; b=m7H7NwFDnXM019P6
	2S9wmIOsJ/bmZdy90AC0VFn6tuAzrpqk4d86WDdkzu5GQcrvRFcNI74aTa3ez3+c
	BleN/kqZNn4Y6HfrgeRMG5g0R+/nsugtdPvhajfy8+cKkZdq25c5xLCnxutt8Bpp
	7Ot9xeyAnVvOtKLRmtN6ib4QjlyEhVvZQt0P9ood9vtIIOoONVa5KgW9q9mpjTyU
	j2k3PM1HZoUd0vhiSqOeo1RR8lIjTowg4VTjJdOScJpyEnqsstnIHVim2QCScCr/
	s9LMNxnla9s3QKBH4YhDTSmvH/bsHsc6670QJMOhPHjTOrr1K9k3oIXOtMXjl5pl
	3OaalQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cu40h207h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 16:08:25 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-94d6c5433a0so151482186241.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 09:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773245304; x=1773850104; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RWuLFkC+W8N6pgB1r3mjP/feOeH0KAiskDiUSNrILSI=;
        b=jpSFw0jGYqtBlJ/Etf2tvYb/qwVIt7ZSCk15lisht9O3sAK5D6JeOmmbS3O3SAvA7b
         j2q6pk1H/FrhoCAuO0e9ttACkhc5VuemPfadPYRTCkm9RXKQSlr+UXCmJNGsSXn5urmo
         DSMcjjg/fn53p47G/9ZRk0I62+1ejSiL7TRDGL9zGb/h19lbAm+4emp/a2KugKiE45la
         UU/XBxOHa8CcSUzhAjfMgIaOxu3lNiXMCj6ZJ5/D/t7Vfg0IoIyQHdq7yocr8kzUMdpw
         sA4OaNm1qVQ38X+AZBSUF9xlgRKUWYk7iu80DSQDlt+hi1BFkOT9PJ/kttqpA1m1LZKE
         UyKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773245304; x=1773850104;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RWuLFkC+W8N6pgB1r3mjP/feOeH0KAiskDiUSNrILSI=;
        b=MnvW371u+0IkagNGaECw4GbKLi+pfDOmQb15keqF+tXDE8BBuoqL45pue2Pzp0Vh5a
         aviQRv3UrIhtU5hcxgsowx9Z6Q/I060mTE8v6NFkha1DFB0kkZRtt2g65R0L0jv1aa2A
         gQPLDs+E3kVofjOQoD9UIV5OD1/3bdgoH93NaOTcOvelA0WMIoNjfxPryydtGYT8DEVZ
         6KmmmNNRMmMvMEpV92Gh4ERnEFSKuoC7CVjSvGN72Qt1+cby+3979Alnr5ZXYorYSVru
         xo1jksZB3rUpRErMNTt4VvcioEkLCntNVEMO5GKRlqEoMtXP/jWF/Pz4E+uJF+OCABN/
         Bqzg==
X-Forwarded-Encrypted: i=1; AJvYcCUER/6jXni2gQGnu6iCrY9tnfw13VSYBj0dvC7qpkPmuAT3zqb8DtkSTbpxAL1t0mIUkfdv+C82Nohl29u+BtKz@lists.infradead.org
X-Gm-Message-State: AOJu0YxOGYQziVSkO74oXpjsMObgO56gGCIhsBTCIl2bbOPSUOVVpvrm
	1yAnC1CU8aHZ4zAYun97321ImBTwhnj15VuTTIX7Mr+95M2aPHaNQJqrZyFkWhMQNEBzGt16GL4
	OvXMM5Hf/OCyaFJjyrMmuoIgLif5nHT7keKcGDkrfkWfg0OpyTgIkxQMg/kI4EL2ai1yYaKobVu
	VKzA==
X-Gm-Gg: ATEYQzz7xl7Cc79yUc5EHtqm9nz+JgZ7HQDqimwdqFT3eTWhPY4SvXEThtcXYnJcxLt
	t2tki+MH+HbmNkmSjkqIhTxI5yAihnaWQ0jUmFdfW57JrKicy+Qxk1aqHgGq4xDdsG+7UCflg/w
	jaCE7p9CKruK44XQrelpap0C7ao49lJWC/NiAO9s7nXcpMjY8jY1l8SF2hIhJEudwBUgC1ERz40
	Sl6QRSXx//IuESLeBCAsaf42U7hGWIr7C7LnTntBG24aakxt53HQ4o130uAIPP6bO8GNsivuchv
	Vw8zzogdfgibYHhEoVYmR68lWuLc/VK5ZoKK5f81SFVYcFluqHKefffKOafMxbgRO33WO2C+LMv
	2evhGwvW9URDRWygW2GPPj95bf3RIqH78ygMZO3UySM7k
X-Received: by 2002:a05:6102:3ed0:b0:5f8:e54c:2f72 with SMTP id ada2fe7eead31-601def30fd0mr1283718137.20.1773245304375;
        Wed, 11 Mar 2026 09:08:24 -0700 (PDT)
X-Received: by 2002:a05:6102:3ed0:b0:5f8:e54c:2f72 with SMTP id ada2fe7eead31-601def30fd0mr1283693137.20.1773245303846;
        Wed, 11 Mar 2026 09:08:23 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe1aa2c3sm184711f8f.13.2026.03.11.09.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 09:08:22 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 17:07:59 +0100
Subject: [PATCH 03/12] ARM: dts: imx6qdl: Use undeprecated reset-gpios
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-dts-snps-reset-gpios-v1-3-ea1cc09fba84@oss.qualcomm.com>
References: <20260311-dts-snps-reset-gpios-v1-0-ea1cc09fba84@oss.qualcomm.com>
In-Reply-To: <20260311-dts-snps-reset-gpios-v1-0-ea1cc09fba84@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=17359;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=mgJychgJJSvJb5EPQ/SrXwpl21HswNU2SRWUeliofAc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpsZNh/o4+c0j4ts7EAA2/0l7N3rDNVcAZIs/d7
 waOhWeowSqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabGTYQAKCRDBN2bmhouD
 1ybcD/9HZP+St8ZNRhRrYIOpMwOVQmrDPlPcwhGQtwWZXhCD2DtZDqaSMp9G8ON3GJPyYuguSU2
 PDBGW43OiXLLxsACFtP2ejZQbpxWRk7NGjGmNOQdRlQe+ZGUtjyXKfYHDK7utQ/+/s8M5+fJkkT
 fu7iz4A7yM1Lgb/H7IOCUOXtvNmFrm5Hlsc7WPjbcTuOoi24n6NN/+0YbmR3wa+K/IyEVVxnf24
 TZbM/w1yfdPlFKIzizfN/p8MuB9+ZEmmL/GJ9+WvfKIMCEjgUjB5PeIWouJH5Hwu6sClANjGCgm
 7R9rSAygR+B2NWsdZbeIboDwymmkZt4DK2JDW6AfzwE4EMOWNwRfcu0OMKRkqo/H8F0K+CrNAVs
 Eip+0fMVV0W036iPcs1+KHhHB8oX29/NOOEz/sUfeL3OUCqVKOcYtFIdZ7OMnTYdX89/L13eT1c
 r981tzJ2NaQbrxRBUGkJ/bX0aJa62I03xkMN/tbFtLOtrm3hH6sAC7VbBJf7nTTOt1iDxV470Mx
 TxfAr4OZkqomcvShZWymjNysLyVoMJIDFjrcm9JKOIp7z33t8TJd1tzmS1EapYiAj9G0KW31yMF
 PF8IVAHds3ND48F9jTKa+72AU9XYC5XkteUK1M2HAfXW0cj+EudgwwCcyOX2hvM99hxe+JxGfoB
 Hw0Pz5umXqndaMw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDEzNiBTYWx0ZWRfX96rwZ6S40t5F
 9HKoMUBJESrYEj/KXDONbpb+CYilWS/LQwcvjTGVVgrSb/9eqGzvHkJipJipu9lkaVk77mVA18S
 OHDduOmaSz6v0CKthaWPeE1cIQ1e1Mgov7GtVBO7QDwVCK0idp5+1M7TzULlFw8RzCXX/tjga4p
 SGD2r/6aFn9yyQ5e0Byk5hxU6xBIT9taik8lC2OQCnWvatRET5ccJBYS515setgU/aUXE94Fq1m
 TJHHWy9rtjfZpDliv1xFPtFkpnJIZmR3b5Ud+mMmmSRF3b8TjQWQtFIOjkW7i7Q8PuTx3EiYSwp
 ZugY8vdzk4vpAT7hcQ3K8KvXNUaGZnyzInZ0p+S9fJAWzyI7IFpd9OnuNl8ciLe0m1+EfLTk1HT
 85JexxALqjDKjjdcWjjMA7Q1+4JRsm5xlEjpJRDZAHWwR3jAx6ZvXRa163Dii7EkAzx+dDjNiIN
 5oCQ8tfU/rauCObC70w==
X-Proofpoint-ORIG-GUID: 5bd9k5eYwAkUuTSXJvyj6pFqT0njmpBW
X-Authority-Analysis: v=2.4 cv=YJ+SCBGx c=1 sm=1 tr=0 ts=69b19379 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=50GlOtY98KW9GriB_zcA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: 5bd9k5eYwAkUuTSXJvyj6pFqT0njmpBW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_090826_363088_D10AFC8B 
X-CRM114-Status: GOOD (  14.62  )
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

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm/boot/dts/nxp/imx/imx6qdl-apf6dev.dtsi        | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-aristainetos2.dtsi  | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-pdk2.dtsi     | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-emcon.dtsi          | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw51xx.dtsi         | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw52xx.dtsi         | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw53xx.dtsi         | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw54xx.dtsi         | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw551x.dtsi         | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw552x.dtsi         | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw553x.dtsi         | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw560x.dtsi         | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw5904.dtsi         | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw5907.dtsi         | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw5910.dtsi         | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw5912.dtsi         | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw5913.dtsi         | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-hummingboard.dtsi   | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-hummingboard2.dtsi  | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-icore-rqs.dtsi      | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-kontron-samx6i.dtsi | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-mba6.dtsi           | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-nitrogen6_max.dtsi  | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-nitrogen6_som2.dtsi | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-mira.dtsi    | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-pfla02.dtsi  | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-pico.dtsi           | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi        | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-var-dart.dtsi       | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-zii-rdu2.dtsi       | 2 +-
 30 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-apf6dev.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-apf6dev.dtsi
index 9e97ef5e43f2..5e33164e5005 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-apf6dev.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-apf6dev.dtsi
@@ -212,7 +212,7 @@ &ipu1_di0_disp0 {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie>;
-	reset-gpio = <&gpio6 2 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio6 2 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-aristainetos2.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-aristainetos2.dtsi
index 01d4ea20b13d..4faa7b9c50ff 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-aristainetos2.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-aristainetos2.dtsi
@@ -308,7 +308,7 @@ &gpmi {
 };
 
 &pcie {
-	reset-gpio = <&gpio2 16 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio2 16 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-pdk2.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-pdk2.dtsi
index d7c2b30aecfd..1dc4732bd3fe 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-pdk2.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-pdk2.dtsi
@@ -270,7 +270,7 @@ &ipu1_di0_disp0 {
 
 &pcie {
 	pinctrl-0 = <&pinctrl_pcie &pinctrl_dhcom_j>;
-	reset-gpio = <&gpio6 14 GPIO_ACTIVE_LOW>; /* GPIO J */
+	reset-gpios = <&gpio6 14 GPIO_ACTIVE_LOW>; /* GPIO J */
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-emcon.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-emcon.dtsi
index 9f4e746beb2d..511b3b6dc5e3 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-emcon.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-emcon.dtsi
@@ -732,7 +732,7 @@ &ipu1_di0_disp0 {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie_ctrl>;
-	reset-gpio = <&gpio7 12 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio7 12 GPIO_ACTIVE_LOW>;
 	disable-gpio = <&gpio2 22 GPIO_ACTIVE_LOW>;
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw51xx.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw51xx.dtsi
index beff5a0f58ab..1d4899f8aec4 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw51xx.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw51xx.dtsi
@@ -400,7 +400,7 @@ &ipu1_csi0 {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie>;
-	reset-gpio = <&gpio1 0 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio1 0 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw52xx.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw52xx.dtsi
index 9d3ba4083216..46e3b2b18aee 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw52xx.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw52xx.dtsi
@@ -504,7 +504,7 @@ timing0: timing-hsd100pxn1 {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie>;
-	reset-gpio = <&gpio1 29 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio1 29 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw53xx.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw53xx.dtsi
index 7e84e0a52ef3..dd1201b628f5 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw53xx.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw53xx.dtsi
@@ -501,7 +501,7 @@ timing0: timing-hsd100pxn1 {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie>;
-	reset-gpio = <&gpio1 29 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio1 29 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw54xx.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw54xx.dtsi
index 81394d47dd68..b8a1e47d1d3b 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw54xx.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw54xx.dtsi
@@ -547,7 +547,7 @@ timing0: timing-hsd100pxn1 {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie>;
-	reset-gpio = <&gpio1 29 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio1 29 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw551x.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw551x.dtsi
index 6136a95b9259..57b0d635bdab 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw551x.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw551x.dtsi
@@ -456,7 +456,7 @@ &ipu1_csi0 {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie>;
-	reset-gpio = <&gpio1 0 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio1 0 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw552x.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw552x.dtsi
index 9c822ca23130..b29c26b729fa 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw552x.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw552x.dtsi
@@ -359,7 +359,7 @@ &i2c3 {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie>;
-	reset-gpio = <&gpio1 29 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio1 29 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw553x.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw553x.dtsi
index 552114a69f5b..198af79b5490 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw553x.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw553x.dtsi
@@ -413,7 +413,7 @@ &ipu1_csi0 {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie>;
-	reset-gpio = <&gpio1 0 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio1 0 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw560x.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw560x.dtsi
index e9d5bbb43145..4dafd225a34e 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw560x.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw560x.dtsi
@@ -560,7 +560,7 @@ timing0: timing-hsd100pxn1 {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie>;
-	reset-gpio = <&gpio4 31 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio4 31 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw5904.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw5904.dtsi
index 3df4d345da98..a03f422d9a8d 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw5904.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw5904.dtsi
@@ -528,7 +528,7 @@ timing0: timing-hsd100pxn1 {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie>;
-	reset-gpio = <&gpio1 0 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio1 0 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw5907.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw5907.dtsi
index 87fdc9e2a727..862f44967c71 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw5907.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw5907.dtsi
@@ -326,7 +326,7 @@ channel@6 {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie>;
-	reset-gpio = <&gpio1 0 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio1 0 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw5910.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw5910.dtsi
index 099ed2f94d61..8564eb8e7cc0 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw5910.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw5910.dtsi
@@ -333,7 +333,7 @@ accel@19 {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie>;
-	reset-gpio = <&gpio3 20 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio3 20 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw5912.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw5912.dtsi
index cbca5e58e812..0a2a9b9db1fa 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw5912.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw5912.dtsi
@@ -313,7 +313,7 @@ accel@19 {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie>;
-	reset-gpio = <&gpio1 29 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio1 29 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw5913.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw5913.dtsi
index 4e4dce5adc15..37f7e15d65ae 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw5913.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw5913.dtsi
@@ -292,7 +292,7 @@ &i2c3 {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie>;
-	reset-gpio = <&gpio1 0 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio1 0 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-hummingboard.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-hummingboard.dtsi
index 6b737360a532..4755bf2bc65e 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-hummingboard.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-hummingboard.dtsi
@@ -321,7 +321,7 @@ MX6QDL_PAD_DISP0_DAT9__GPIO4_IO30 0x1b0b0
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_hummingboard_pcie_reset>;
-	reset-gpio = <&gpio3 4 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio3 4 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-hummingboard2.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-hummingboard2.dtsi
index 3069e1738ba2..d113130c1770 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-hummingboard2.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-hummingboard2.dtsi
@@ -517,7 +517,7 @@ MX6QDL_PAD_EIM_D24__UART3_RX_DATA	0x40013000
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_hummingboard2_pcie_reset>;
-	reset-gpio = <&gpio2 11 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio2 11 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-icore-rqs.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-icore-rqs.dtsi
index dff184a119f3..396b621487ce 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-icore-rqs.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-icore-rqs.dtsi
@@ -220,7 +220,7 @@ sgtl5000: codec@a {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie>;
-	reset-gpio = <&gpio3 29 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio3 29 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-kontron-samx6i.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-kontron-samx6i.dtsi
index c771f87b10df..bdc8dc6731e0 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-kontron-samx6i.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-kontron-samx6i.dtsi
@@ -743,7 +743,7 @@ &mipi_csi {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie>;
-	reset-gpio = <&gpio3 13 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio3 13 GPIO_ACTIVE_LOW>;
 };
 
 /* LCD_BKLT_PWM */
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-mba6.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-mba6.dtsi
index ee2c6bec92e8..a492bf4f49d9 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-mba6.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-mba6.dtsi
@@ -240,7 +240,7 @@ &i2c2 {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie>;
-	reset-gpio = <&gpio6 7 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio6 7 GPIO_ACTIVE_LOW>;
 	vpcie-supply = <&reg_pcie>;
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-nitrogen6_max.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-nitrogen6_max.dtsi
index ef0c26688446..bbdb77e6fec8 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-nitrogen6_max.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-nitrogen6_max.dtsi
@@ -731,7 +731,7 @@ lvds1_out: endpoint {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie>;
-	reset-gpio = <&gpio6 31 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio6 31 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-nitrogen6_som2.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-nitrogen6_som2.dtsi
index 03fe053880ca..25e6cc3e9ff5 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-nitrogen6_som2.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-nitrogen6_som2.dtsi
@@ -639,7 +639,7 @@ lvds1_out: endpoint {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie>;
-	reset-gpio = <&gpio3 0 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio3 0 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-mira.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-mira.dtsi
index a3c2811e9c6f..661f96fa3990 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-mira.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-mira.dtsi
@@ -218,7 +218,7 @@ lvds0_out: endpoint {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie>;
-	reset-gpio = <&gpio2 25 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio2 25 GPIO_ACTIVE_LOW>;
 	vpcie-supply = <&reg_pcie>;
 	status = "disabled";
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-pfla02.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-pfla02.dtsi
index 6f3becd33a5b..33ebb9320395 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-pfla02.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-pfla02.dtsi
@@ -399,7 +399,7 @@ MX6QDL_PAD_DISP0_DAT19__AUD5_RXD	0x130b0
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie>;
-	reset-gpio = <&gpio4 17 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio4 17 GPIO_ACTIVE_LOW>;
 	status = "disabled";
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-pico.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-pico.dtsi
index c39a9ebdaba1..f18652b2f6ca 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-pico.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-pico.dtsi
@@ -277,7 +277,7 @@ mipi_csi2_in: endpoint {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie_reset>;
-	reset-gpio = <&gpio5 21 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio5 21 GPIO_ACTIVE_LOW>;
 };
 
 &pwm1 {
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi
index ba29720e3f72..5d379b98d74f 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi
@@ -754,7 +754,7 @@ lvds0_out: endpoint {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie>;
-	reset-gpio = <&gpio7 12 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio7 12 GPIO_ACTIVE_LOW>;
 	vpcie-supply = <&reg_pcie>;
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-var-dart.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-var-dart.dtsi
index 7749074e438d..13d092cb9961 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-var-dart.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-var-dart.dtsi
@@ -394,7 +394,7 @@ MX6QDL_PAD_SD3_DAT3__SD3_DATA3	0x17059
 &pcie {
 	fsl,tx-swing-full = <103>;
 	fsl,tx-swing-low = <103>;
-	reset-gpio = <&gpio4 11 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio4 11 GPIO_ACTIVE_LOW>;
 	status = "disabled";
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-zii-rdu2.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-zii-rdu2.dtsi
index 9ff183e4e069..1860e5a525ee 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-zii-rdu2.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-zii-rdu2.dtsi
@@ -651,7 +651,7 @@ &ipu1_di0_disp0 {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie>;
-	reset-gpio = <&gpio7 12 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio7 12 GPIO_ACTIVE_LOW>;
 	status = "okay";
 
 	host@0 {

-- 
2.51.0


