Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 753E7112584E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 16:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4MxioX+VhP5R1yYBziCk4kJlmeiQxJ9F1sgQjfVbVKU=; b=MUeOAm/rt5zdS20fPa0mh/0Fhe
	rJi9kqdP4naNq+czzchDlns7qYOE7Po2qBVyGNe0sIoWHb9bFWcaPkuAq6rX7lQeecFQg01k5Ak3F
	/PjqkPdZv+Fj9ne13wPpFTK5M1kMdj8TU4adlkNgrsffyJdqcg6053N0THuJ3FefnOzOnqAMvo+zZ
	s/IJIyJFIa7gsA/lm0cD5FX2x3mtdBRoxOvZleH7V8x3043YXi9BfOFtAbgY0DrGiiLp4tKUGZj8x
	LOYWFYiX6K/naKUntNFQ/EH4OkZRD71e+JhtnTknhnKZ1ePzj9QTnQjtlPqwoPB3PJ7z2Fvt0HCpw
	ac4UOk5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0M71-0000000BsZ0-1fcZ;
	Wed, 11 Mar 2026 16:08:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0M6w-0000000BsSr-1Rm4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 16:08:39 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BCR2891439686
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 16:08:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4MxioX+VhP5R1yYBziCk4kJlmeiQxJ9F1sgQjfVbVKU=; b=e4Jh9EC/bniBUb7j
	1dhSNvuiwr3o8RcnSgXw97XHYH9kMDjA0KBbuHKS8KXTqIeG6HJIkMQt9yQqYVB/
	2PHgg4vZXtg9Rx0KjiU3eMRsjViLyrQw4pTg/8nDsrUZ8ThaBpGpXTPaylHbOz6z
	QUc3iq7A2iqokv38MJairsPAd2zsAZdAfN1GUajweU52T8nW2sKws2ODihIvuXHj
	fidToV+jgKjLurSZFso9f5otO5xx9ZSILA+kN87ZOJCAuBVi912JjWmqj+/suaKj
	T4iSfbjs6uCqLi+UsI+JBmYEpTFtskTEKynEWFqWqRMA0eyL7yhDh8KiHj0pdC/b
	GC/OlA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cu38yj3pj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 16:08:37 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50921f7da6dso449041cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 09:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773245317; x=1773850117; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4MxioX+VhP5R1yYBziCk4kJlmeiQxJ9F1sgQjfVbVKU=;
        b=DEyJqOigYbhKivQ/wudAnrS7ccwvyFV8Xdige3EQWFmg8BhO/8qEjAu8VFaCi0Mgyo
         OY/QM1/TIgCS9XdiWVpznWAaP+UuaYfuDL97etj1sfZWjAIGZzstgUIPhSUW+f8AUm3/
         RAzs3Ypb7/EbSu4OoFM2vGkRNnkEXuRXNBsDWSo4aczNL6jGLvBmHK+W7NI42N89V4Qw
         MXbEAv8jhqW6r04z7OBP82+JQoY1M7AZaZwP16J1QlqpJYrxKLKzNImZQ87XjlxbWozJ
         20UPhHE+SIxfBr19WY9PhUdUJrs04/1GpJ9d+HO0k4NBOHHLJAqOAb42kp0hlV6M7/Qt
         b3+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773245317; x=1773850117;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4MxioX+VhP5R1yYBziCk4kJlmeiQxJ9F1sgQjfVbVKU=;
        b=Ni1tXyeOxsk675eDrUbiXco2w0UtSEa6GS1cvmg/SrGW/IEagMLUf8iJF7eKZCEJkO
         LC8oZ0nKRJ1jqymty/9CTiFQUgXXbwjAef1hxbtiFGS/nCem/AoQULgtLRX3I/P8XZJb
         JX3LkEYMkaiEWHoWVxmeTYiMv1RqcmZnFBI9+4RibvBhNEfIF65EIYy5nPhdwXB4lAnz
         j3zgnVQT18xpw9C4iOLeesUaAnbiVyrXq8CoNHPCsUk/ISGC+v1TFutjsYQ/PHZOGI4Y
         BDdvVM0wAmQW9gQshnnlQmLE750SHCuO3bG4xHB6MyDmr26Z3bw60bVWQdA9Kcq8qAqa
         GMew==
X-Forwarded-Encrypted: i=1; AJvYcCWbdRgxhSzcSFIv6H6/Ir5XJjw+TspzLnOjlgBlzPKI1KFYF0LtfeFsOdWrkcJljZzCSALvi+7oErh5LN1NR0xB@lists.infradead.org
X-Gm-Message-State: AOJu0YwBw5SRYFZEC3n/2mmFSwQ49EDgy2NPZmfpSMcpqSSOeSaE9q9y
	HJl3ML3IjihVEXHlbBYuznXwBLKSTWA5g6yWrExT8SyW34PSSy4es2Tzq5laPoc5SzjEAa2N0zJ
	6OH5OtyZE+z2MqVDuPqi7WWOceXnsEB6AhUhXdguuoQ6h4WuiVd2xcKlWoJ8gTO7BSQrH1PeuVw
	2V0g==
X-Gm-Gg: ATEYQzwcOBIzT4SfCdeb4eHJ8WNynVFZFTYyJpTcFw1OJNSIG+2tEmxeTb8srEyv4sY
	G108lMBH6oYZFLrn2hkmqVr3uENimbPrTxlvcOhd7z8KT0z6klBnXJHoYxlpJKfiTSVYYrWpR0v
	Q8miqQOng8FrOaGKyxxUt49jcCZfKece3kOpVsNiFtraa33ETGs9YZoJlDP6U+QsIu2rheDm7wt
	NyhDfCkzluAmstqWVUSIN6wbN92RVFvDxCZEqpO8GdNxssFxh2Xd9E8x6hBqFSQpP6kKCcsU+s6
	7hsUJJ7PCBF+k1Zv5EKpwoUJntDv/pu8/HHVdTCxCA8R5jUPBU+KTLlHLuPhuus7fY5snvIYruC
	1nYn0BAVeIO5Hf7RoL6OzdjAAJb+KuhCR1JzcCrpWKG+4
X-Received: by 2002:a05:620a:294a:b0:8cd:95b4:c523 with SMTP id af79cd13be357-8cda1a2d933mr338459885a.37.1773245316482;
        Wed, 11 Mar 2026 09:08:36 -0700 (PDT)
X-Received: by 2002:a05:620a:294a:b0:8cd:95b4:c523 with SMTP id af79cd13be357-8cda1a2d933mr338454385a.37.1773245315887;
        Wed, 11 Mar 2026 09:08:35 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe1aa2c3sm184711f8f.13.2026.03.11.09.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 09:08:34 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 17:08:04 +0100
Subject: [PATCH 08/12] arm64: dts: imx8mm: Use undeprecated reset-gpios
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-dts-snps-reset-gpios-v1-8-ea1cc09fba84@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=11906;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=aCTo7qYWKpC/S8WIFzwlUyvg97RNYhHTiuaNHSogOHE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpsZNlhq6V2EWU3sta6PKKGGb0xMqfYQn+ZwkJr
 I8PP05dvl6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabGTZQAKCRDBN2bmhouD
 1xvoD/9V7qgL5AXnvDWXF3gjlopbF+vNIOBY/Lx+jYQqa8eN9fL0Tbq9s4pOVpWixfxLHBwF+Mo
 tQx639Orfsj+YzXtlN41LJppNkMZI6MsE/08WGUQOChT9M0sMGJ0252JPENY4cH1+3K8vbP7SRu
 pByzYq+n0H0wRxvcc3X9lTAuxpIsHRgPr8MSBe2gprJAfJx7ySz60JV9xY8rAF8xB5vjaAf94nZ
 QxsMGy5mdWv0Itd2w0gxHhighfypg62L+W2Jy7SpvzFyOtYBdwhhM+fJ8g1mSVDYNzdKi9ERCkS
 NfbVFqbMjxmNfOHaJ3tS29AiscHw3c5TvakVW41ETrq6VxYEb9RA6eWLFXpvNT9aLgFPWDsHtUy
 sz1SgIPQgo4kUMUCGbshZROcI9nwXsZRhmg1FAaGIXQ/cITCbl11tWyAoGfFxGv3DL9A5fbxAlm
 uTRsYk1oUG5YERD0ulJ6qE5ibyi1C9SyEwpJyu5zN2RONiXCg+jAJCDnu+WGJDAJ0lsBxcrYwtI
 J/Z1VjDx2Dv6xlr9VfOr0sFgHZj84EDrJyl7shJXB9oX7Tuvs3sq+uLThcIyPgg2UimZIMevEaf
 0RAGrPzE3xgmAWvzqSX9XiAYcb2ZdsoNtK++eq147bxidc1SWJLZ8WAOTZ1zwNtRWlhNa5V7Q8O
 3Q1UkLn5qS7uWNA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDEzNiBTYWx0ZWRfX46IHBKmyuOeZ
 QJLPFfKNQMPkIrwSMuLFGfka+dVSNeK9XwosnCU+xKIQbLwUFKF97N9g48SpILacBq0vNyWTyZN
 NE7o+SLThVs28p7t3XP60aBn3x6hyoB5C9vfj4nDlx5O395vYaKxCIU93vv3NlA+/MppTyA/T4T
 U8ApvkGRVbsdEz7ZgTWtDrVS2lQn0qL0lBSwgLXfrq/0W6U1BocBtSGPY/B6aQHjGK8gJDC/aO3
 e6PZliYsImsDxVXD8FQB6DqkbSDiFOq6m3uKkhpMa58AV6Vu1Qk1yOZVYs2t3+/FFOaxv12MQXI
 s/QvjdYo2ADuQB97R0u1FPx6yiXXvHqBcpUVc/OtZ2Cjux7Fog4YpwUgby+4w9p1ID4s5m7i0hq
 YU6oa7tLWQU1Ju3BcSCNPMjbuRJJJfi3hgQttD5YIEKR3GwpqqVAx1Y8lLrFCjqbjJqFj7TNbfq
 Gi5eqMsPT6NW/FWEAxw==
X-Proofpoint-GUID: XmjJ7aKGCX5VmcxaU_pb1NxNzyRyDxzQ
X-Proofpoint-ORIG-GUID: XmjJ7aKGCX5VmcxaU_pb1NxNzyRyDxzQ
X-Authority-Analysis: v=2.4 cv=Cq+ys34D c=1 sm=1 tr=0 ts=69b19385 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=n23Nhokuvftmpjnmux0A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_090838_534903_F7A66736 
X-CRM114-Status: GOOD (  13.57  )
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
 arch/arm64/boot/dts/freescale/imx8mm-beacon-baseboard.dtsi  | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dts | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi               | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm-innocomm-wb15.dtsi     | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm-iot-gateway.dts        | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-rdk.dts | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l.dts    | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx.dts   | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm-venice-gw71xx.dtsi     | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx.dtsi     | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx.dtsi     | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm-venice-gw75xx.dtsi     | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm-venice-gw7901.dts      | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm-venice-gw7902.dts      | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm-venice-gw7903.dts      | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm-venice-gw7904.dts      | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi            | 2 +-
 17 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-beacon-baseboard.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-beacon-baseboard.dtsi
index ea1d5b9c6bae..5642139ebaec 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-beacon-baseboard.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-beacon-baseboard.dtsi
@@ -301,7 +301,7 @@ &pcie_phy {
 &pcie0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie0>;
-	reset-gpio = <&gpio4 21 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio4 21 GPIO_ACTIVE_LOW>;
 	clocks = <&clk IMX8MM_CLK_PCIE1_ROOT>, <&pcie0_refclk_gated>,
 		 <&clk IMX8MM_CLK_PCIE1_AUX>;
 	assigned-clocks = <&clk IMX8MM_CLK_PCIE1_AUX>,
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dts b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dts
index 472c584fb3bd..6a874f3ec22a 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dts
@@ -919,7 +919,7 @@ &pcie_phy {
 &pcie0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie0>;
-	reset-gpio = <&gpio1 5 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio1 5 GPIO_ACTIVE_LOW>;
 	clocks = <&clk IMX8MM_CLK_PCIE1_ROOT>, <&pcieclk 0>,
 		 <&clk IMX8MM_CLK_PCIE1_AUX>;
 	assigned-clocks = <&clk IMX8MM_CLK_PCIE1_AUX>,
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
index 8be44eaf4e1e..31052ca1971e 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
@@ -533,7 +533,7 @@ &pcie_phy {
 &pcie0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie0>;
-	reset-gpio = <&gpio4 21 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio4 21 GPIO_ACTIVE_LOW>;
 	clocks = <&clk IMX8MM_CLK_PCIE1_ROOT>, <&pcie0_refclk>,
 		 <&clk IMX8MM_CLK_PCIE1_AUX>;
 	assigned-clocks = <&clk IMX8MM_CLK_PCIE1_AUX>,
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-innocomm-wb15.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-innocomm-wb15.dtsi
index 299752aa8277..7eca9127bb9e 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-innocomm-wb15.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-innocomm-wb15.dtsi
@@ -209,7 +209,7 @@ &pcie_phy {
 &pcie0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie0>;
-	reset-gpio = <&gpio5 21 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio5 21 GPIO_ACTIVE_LOW>;
 	fsl,max-link-speed = <1>;
 	assigned-clocks = <&clk IMX8MM_CLK_PCIE1_AUX>, <&clk IMX8MM_CLK_PCIE1_CTRL>;
 	assigned-clock-rates = <10000000>, <250000000>;
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-iot-gateway.dts b/arch/arm64/boot/dts/freescale/imx8mm-iot-gateway.dts
index 370558a8ba46..e5b8415dbe0f 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-iot-gateway.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-iot-gateway.dts
@@ -137,7 +137,7 @@ &pcie_phy {
 &pcie0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie0>;
-	reset-gpio = <&gpio3 20 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio3 20 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-rdk.dts b/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-rdk.dts
index 6043e7d16306..0165ae04c6ae 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-rdk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-rdk.dts
@@ -205,7 +205,7 @@ &pcie0 {
 	assigned-clock-rates = <10000000>, <250000000>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie>;
-	reset-gpio = <&gpio4 9 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio4 9 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l.dts b/arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l.dts
index 2ecc8b3c67da..a5f3dfe06a4a 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l.dts
@@ -182,7 +182,7 @@ &pcie0 {
 	assigned-clock-rates = <10000000>, <100000000>, <250000000>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie>;
-	reset-gpio = <&gpio3 22 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio3 22 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx.dts b/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx.dts
index 8dcc5cbcb8f6..ce785b103a57 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx.dts
@@ -90,7 +90,7 @@ &pcie_phy {
 
 /* PCIe slot on X36 */
 &pcie0 {
-	reset-gpio = <&expander0 14 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&expander0 14 GPIO_ACTIVE_LOW>;
 	clocks = <&clk IMX8MM_CLK_PCIE1_ROOT>, <&pcieclk 3>,
 		 <&clk IMX8MM_CLK_PCIE1_AUX>;
 	assigned-clocks = <&clk IMX8MM_CLK_PCIE1_AUX>,
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw71xx.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw71xx.dtsi
index 320806d3d073..bb441fd4aa23 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw71xx.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw71xx.dtsi
@@ -122,7 +122,7 @@ &pcie_phy {
 &pcie0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie0>;
-	reset-gpio = <&gpio4 6 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio4 6 GPIO_ACTIVE_LOW>;
 	clocks = <&clk IMX8MM_CLK_PCIE1_ROOT>, <&pcie0_refclk>,
 		 <&clk IMX8MM_CLK_PCIE1_AUX>;
 	assigned-clocks = <&clk IMX8MM_CLK_PCIE1_AUX>,
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx.dtsi
index 266038fbbef9..184fdfb26cd5 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx.dtsi
@@ -147,7 +147,7 @@ &pcie_phy {
 &pcie0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie0>;
-	reset-gpio = <&gpio4 6 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio4 6 GPIO_ACTIVE_LOW>;
 	clocks = <&clk IMX8MM_CLK_PCIE1_ROOT>, <&pcie0_refclk>,
 		 <&clk IMX8MM_CLK_PCIE1_AUX>;
 	assigned-clocks = <&clk IMX8MM_CLK_PCIE1_AUX>,
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx.dtsi
index 2aa6c1090fc7..1e84c365b2cf 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx.dtsi
@@ -167,7 +167,7 @@ &pcie_phy {
 &pcie0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie0>;
-	reset-gpio = <&gpio4 6 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio4 6 GPIO_ACTIVE_LOW>;
 	clocks = <&clk IMX8MM_CLK_PCIE1_ROOT>, <&pcie0_refclk>,
 		 <&clk IMX8MM_CLK_PCIE1_AUX>;
 	assigned-clocks = <&clk IMX8MM_CLK_PCIE1_AUX>,
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw75xx.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw75xx.dtsi
index 53004c4a13aa..e0982b4cb663 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw75xx.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw75xx.dtsi
@@ -152,7 +152,7 @@ &pcie_phy {
 &pcie0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie0>;
-	reset-gpio = <&gpio4 6 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio4 6 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7901.dts b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7901.dts
index 272c2b223d16..a31bd864c022 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7901.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7901.dts
@@ -726,7 +726,7 @@ &pcie_phy {
 &pcie0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie0>;
-	reset-gpio = <&gpio5 2 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio5 2 GPIO_ACTIVE_LOW>;
 	clocks = <&clk IMX8MM_CLK_PCIE1_ROOT>, <&pcie0_refclk>,
 		 <&clk IMX8MM_CLK_PCIE1_AUX>;
 	assigned-clocks = <&clk IMX8MM_CLK_PCIE1_AUX>,
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7902.dts b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7902.dts
index 468c7e993c52..4c839dfa3ce0 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7902.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7902.dts
@@ -626,7 +626,7 @@ &pcie_phy {
 &pcie0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie0>;
-	reset-gpio = <&gpio4 5 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio4 5 GPIO_ACTIVE_LOW>;
 	clocks = <&clk IMX8MM_CLK_PCIE1_ROOT>, <&pcie0_refclk>,
 		 <&clk IMX8MM_CLK_PCIE1_AUX>;
 	assigned-clocks = <&clk IMX8MM_CLK_PCIE1_AUX>,
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7903.dts b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7903.dts
index 636daa3d6ca2..ea67654c9ded 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7903.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7903.dts
@@ -559,7 +559,7 @@ &pcie_phy {
 &pcie0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie0>;
-	reset-gpio = <&gpio5 11 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio5 11 GPIO_ACTIVE_LOW>;
 	clocks = <&clk IMX8MM_CLK_PCIE1_ROOT>, <&pcie0_refclk>,
 		 <&clk IMX8MM_CLK_PCIE1_AUX>;
 	assigned-clocks = <&clk IMX8MM_CLK_PCIE1_AUX>,
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7904.dts b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7904.dts
index 99572961d9e1..7028d028657a 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7904.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7904.dts
@@ -623,7 +623,7 @@ &pcie_phy {
 &pcie0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie0>;
-	reset-gpio = <&gpio5 11 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio5 11 GPIO_ACTIVE_LOW>;
 	clocks = <&clk IMX8MM_CLK_PCIE1_ROOT>, <&pcie0_refclk>,
 		 <&clk IMX8MM_CLK_PCIE1_AUX>;
 	assigned-clocks = <&clk IMX8MM_CLK_PCIE1_AUX>,
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
index 1594ce9182a5..3b656f8a81b6 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
@@ -672,7 +672,7 @@ &pcie0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie0>;
 	/* PCIE_1_RESET# (SODIMM 244) */
-	reset-gpio = <&gpio3 19 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio3 19 GPIO_ACTIVE_LOW>;
 };
 
 &pcie_phy {

-- 
2.51.0


