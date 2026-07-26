Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98263C531F9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Jul 2026 17:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Wn8q67I1I+LsL5SEV+INoURgvYfG27MLgLrvdaN+UA=; b=p0n2LfBLsBeleJ58FieMCFKqgH
	wnVSExAO+0WFZJpaiLBfksM82RZckXctoeQKuf1r3D7fZnEAtjwbTiLrN9hbRQ5i1U/r6G5TJaINp
	OSMRqBTJw6UOR0L5gnLb0wc+DwzTe5Ay7wCwVeEzOD4IG7oBcrvligyQEeyMO8YhT7f+n/eUt5JBG
	TyZYrE7v599sG3EgyaX+sYVGIhYv4MinrSM9zCZr55oXfGfJpaPfVGqYlclxcNG4vp24UqXiV7xQf
	IQyvC+A4Tbg2gUY6b6xCuhuzEkMJyRr8FWB1ohchCbl3Bc/lFQPdpy6l747RA1Dmqxieivdqh5DuA
	4WVSVpwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo2tX-00000001Qy0-0fof;
	Sun, 26 Jul 2026 17:44:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo2tJ-00000001QsJ-34IN
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Jul 2026 17:43:58 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66QH7QHq1091273
	for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Jul 2026 17:43:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2Wn8q67I1I+LsL5SEV+INoURgvYfG27MLgLrvdaN+UA=; b=E2ZSoLAC6kXdzRJv
	XbUUiw6TJmWeEoU2TVdnAGJqWeMKLYF4jZ6m8d4zkORKoqsPyzi1oZojJSSJrl5V
	v8wkI7tTxyb4JNtzm+x+IHDV2ogiWisbrStmzvB+FvxNNCqooVSTSewwaeClPKak
	CTHkRqpTo+vDjt52Fwb1yE+qHKqpT2TZ4BmMjrAmbLkXmGwnxdCzl75njYpd+HR5
	r736lqE+dJwv1ZV5UrZWwQ624IysaS9UluTer74SXo/DVCXxWZjMk5XoFJ4T1I4I
	suPCsffoxL7MaaCUAnn81Vog294U6sks/dO9AhJ8Yd37wB3m3BQRhpAZNDJVDO6g
	vLfsig==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmnh7ud90-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Jul 2026 17:43:56 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51ebdfceddcso27695501cf.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Jul 2026 10:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785087836; x=1785692636; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2Wn8q67I1I+LsL5SEV+INoURgvYfG27MLgLrvdaN+UA=;
        b=V5raVwM+t7oShktvUXkwNYRmzrN1JP9uZP/BX3f2X7ORIWgcBmFBNzSlcH1SA7c97m
         yv/0L9JZ2Cgm10xfYlOaUxxwMB/1DN+8d6d2ocHBDs8qEkSqyOD5pTdsScRySJ2PQg2v
         bZr4taIXtqB84vqlGGeWt43MUAj97M8pTsmWg3ZwCR7ZUx2yIYsnJE4cRolUcN+MulVR
         2S8L/Hn/rHWm4Hn6ONBrl5LivK2aikG6/cMO4IbfryXFhsGTddHwKH/zO8xDzfjtU32u
         r4CbFoZog9dt6yKVQrhpSnDR887QSau0uFgibxwGz3hpmgPXsEsUWVLAqnv4fN5coI3+
         TmXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785087836; x=1785692636;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2Wn8q67I1I+LsL5SEV+INoURgvYfG27MLgLrvdaN+UA=;
        b=Rm33eXjj+/oc/6xD7yK034VbtUQ+vjp9rBkH30Gzewsf6Y1yWikyObLBl9bkcdxNNQ
         HmlbmZNGvuKbBQvDZibESAkawJPmkwuyC5WjDroH7KVFHpc36D9OAlviU6Pbpr3AO82T
         Xk6prGDAWeZngAJzkWiTV+nfOZOc90JiGvpB+WPI3dYz2KmoD78hbmhXAc2bjtpwyeXu
         VfH+6JPXcv5u4Hw6UoX3E2kQeWvz8LsPtfw0l74T0xD304c030HphyhwbeZzC6gwKtyJ
         pxrlI2UhdpYmAh5W0VrLWCs9L76xzdSHx3v4lQq4+t+xV0om4OzG/nlR/JrEpS8eSreB
         blJg==
X-Gm-Message-State: AOJu0YyAIZ3bs+zkC4R2oiTMRlA4XXxuXa+za2z5Pz+RVWeRoxcRQ9Z2
	cZb4z5hUzXxM+lCgj5fXYvqOgtO3V67G56wa0xPWQpU918gdlbJNpeW1PGfIwrlT1pLgX644rtu
	M+cHJnvrzqAE6lw+DPuqBRu4qDXTYLB3AkkCYSY0ZIH5aBhqf+W3cfRW4LrUaSAvUTSEz4NLruw
	RXVQ==
X-Gm-Gg: AR+sD13iRwcMe6nOyxSygy0RyS82FglzQiPRxc64E0ql3h/CeNN8+DUUyE0K/FchZyL
	h3nlMF18c9QLwpuRr8hS3y80UXmdPvWA98QH/eI9oiBUBzyTlrdi6aAR7u43WbIB98xPEKepLKp
	L6u9gMjA2LktvxoIqZBP2lTeCbDpNilmOhGPtmJbRN4YJcHD+0v2NuymjlMmeR7vYX/GQVBlv8S
	UlgyYrd7yWCJ+9uOppPSc34ZY6NMgUlY13lNL29PPIBStYJaLwRVK9p9uEbKKjE/Ew/13TydJEa
	wiPJNGf4wvvvV/Tozb0WtbhXOQmJX8SQYYIHbjhCLitvAtQszGh6xhFG0uV03xjAqEJ8Zcf3Exz
	QUbHL2X6xWD1ZUKs1Y5Elv1g0
X-Received: by 2002:ac8:7d0b:0:b0:51c:94f:8ce with SMTP id d75a77b69052e-529a83825ecmr59892461cf.34.1785087836212;
        Sun, 26 Jul 2026 10:43:56 -0700 (PDT)
X-Received: by 2002:ac8:7d0b:0:b0:51c:94f:8ce with SMTP id d75a77b69052e-529a83825ecmr59892281cf.34.1785087835761;
        Sun, 26 Jul 2026 10:43:55 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c63bd3sm41576093f8f.27.2026.07.26.10.43.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 10:43:53 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 26 Jul 2026 19:43:36 +0200
Subject: [PATCH 3/8] arm64: dts: exynos5433: Override thermal zones by
 phandle
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260726-b4-dts-coding-style-strict-v1-3-e9e3e9879d05@oss.qualcomm.com>
References: <20260726-b4-dts-coding-style-strict-v1-0-e9e3e9879d05@oss.qualcomm.com>
In-Reply-To: <20260726-b4-dts-coding-style-strict-v1-0-e9e3e9879d05@oss.qualcomm.com>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-fsd@tesla.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1436;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Ghw91m7o5lac5kyAa00WLFIkcbvR+gCx52YsoII8VDE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqZkdKJCrdw5RgOhae3V+ZlW5LCBfKyf23m97JO
 pCCxCEw8sWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCamZHSgAKCRDBN2bmhouD
 1xkMD/0W2GI0NFCSIEjzr6yCzZmhPQHA3qouhz+h2L2NyfikPRGziQerqdXYV3h0RJN6dPOKokb
 eb4fE4EK4iilh16Pstx2+B6M4YcRLimx/kqU1jvlDj9vi7GPHGM6sk4Ee3idwXJZvRUbWwqB5WU
 nOXhBsjR679vhj+T+kJIXX+tDEGXFf60nQV1fA65s5Obtc6AbL3rWVtGyu+5/uTaSRAyjthuIyu
 uiCJMARRY+BprocLsizmVxKgDCQpDu55L15WKsq3anglWXLb/Q6rQiQPYfqN8xNsFDpJPoA7/gz
 kWzY2vIqE/htQCpJ7Z0tVNpf74MDlgnifn6gUDORUHXSwD3pjt4hxri4TkSJ/u+Gl6MMQQz4iXC
 94m/e4wghDVyLT/pix+XgV4rj/1oDI2jwyHj27yRGYy5p5RBLn0a1ywcBrtH7brvsevqqlDm203
 7lag6n8g90x9wLGDQx4SCAgZ0+JAHwcv3bpLJGV7t/4Yqzemkc3MVimJylQ/OnO6aprp6YoxLvD
 sYQabpFJa55ckYAC+9rwccy9o+niyu81eARkfmwHyKu54hxJikwVRa3szYCrjzZFT9ml9fZzD+i
 rBeeVdcX5NBpYNcUbRLfNC2lr5EYzJb9ka3Q/vVjXmkHkiBWZJVICYU0+GSyMp13GS5jzGYGsFa
 5cYPgsgYxIMhG6Q==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: 0FKOAsLLjiCK1J2PzYrHNqTAyesald1c
X-Proofpoint-GUID: 0FKOAsLLjiCK1J2PzYrHNqTAyesald1c
X-Authority-Analysis: v=2.4 cv=f/54wuyM c=1 sm=1 tr=0 ts=6a66475c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=51BPPbBw82Ww1msbaCIA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI2MDE3OSBTYWx0ZWRfX+qQoE54LogzA
 GgcD59fLi0AECvTgQvOMFII9qjWgaFZzehroscSn+r5WGWawPrY1tVSRDJLP7x/8ekqQ1qMgsUH
 SEVv+G4N66hC40TRIXu8/RXDS4vwZa/2PDlWz5SQVajTxf++bXRu7XX+8TEzE5dIKX9RFLMPma4
 LvGHH/BOIi6cS+OliRLAFCwgcOaSPsIx2/ngcSFDtYIidKFWMDx6KSQaedJh/jtpYoX+D8T+e6j
 hYCJLPsKHxqEXQkAaIgYW7TxSsPOcoqR8/eZvkbDz8Mca/ZU0Uyqwcbzn+1yFhDsc/aDzX0TiVK
 AJ2H8hipSexUTYwcKXmhRoKMq6wYpzTrhM8H24apgPEBYnwFdZfGMkvoc/ZqbSJSxRvoQgu0Wh/
 kN4yk5KlfXNvq3O0lJGJe6RNvZaKubImSCdV+vg91s0F8V4kHNVSNGO3kjM0ZIn/LVoLYNDqV1I
 du95w0txpGUvb+XUFOg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI2MDE3OSBTYWx0ZWRfX3MHv0OvzSE0O
 AUxymdG6AwaYBHZsjP98OytLHDt2pywnaXRSVqpM9dGR9BrdJ7Z/0WkkjjAN2SVeNF4d3fI7v4X
 LAuaV3fRWNQq9YY1KPc+W1sP8tuXyMM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-26_05,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607260179
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_104357_889745_3BC19948 
X-CRM114-Status: GOOD (  14.67  )
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

Fix indentation of DTSI file with thermal zones (two opening { brackets,
but only one indent) by using a safer choice of phandle/label override.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/exynos/exynos5433-tmu.dtsi | 4 +---
 arch/arm64/boot/dts/exynos/exynos5433.dtsi     | 3 +++
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tmu.dtsi b/arch/arm64/boot/dts/exynos/exynos5433-tmu.dtsi
index 57b335f579d8..a3ebc49fcd36 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433-tmu.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433-tmu.dtsi
@@ -7,8 +7,7 @@
 
 #include <dt-bindings/thermal/thermal.h>
 
-/ {
-thermal-zones {
+&thermal_zones {
 	atlas0_thermal: atlas0-thermal {
 		thermal-sensors = <&tmu_atlas0>;
 		polling-delay-passive = <0>;
@@ -347,4 +346,3 @@ isp_alert_6: isp-alert-6 {
 		};
 	};
 };
-};
diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
index aa7539d92e8e..875e75759f20 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
@@ -2074,6 +2074,9 @@ pcie: pcie@15700000 {
 		};
 	};
 
+	thermal_zones: thermal-zones {
+	};
+
 	timer: timer {
 		compatible = "arm,armv8-timer";
 		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_HIGH)>,

-- 
2.53.0


