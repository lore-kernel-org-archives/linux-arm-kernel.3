Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AD1FC55838
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 07:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iAA6AR4Qa5OwiZACrTqpvVVaUaRfGGENSJvkJ2dCBlM=; b=RC5KK3SvTMyMKO3+RDNzCcySpC
	X5cHTrAo7eVjztTsiektoe+SA7dVa44bPLyVc0uyWyJxQgCUsA96bifMopf8/DaibP9l2nvqouI5M
	+Qp34cT/2Wp0wvCIsLu1Wvzy2MuaWK1fxo3/YoOfrREbL4D2SykIiVvBZlxfpZ8GyM9x5TDsPL7jf
	3BjCZi4Ezxe/sYvnAa56wzWTvkZvOxKW4OXgbKgSKGaVWZaep4ntKT83NF4LEJNklAEdKrTuE4FAc
	+op2oQM6dfmEk6lr9skyMgho8g2TqXd8R7bwzZX6zOkyN/ZbIH1jHpbnvOvsoBee7Jbk9H+2rbVxU
	7Cw8vTHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrs81-000000056Ou-2mGp;
	Thu, 06 Aug 2026 07:02:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrs7z-000000056OZ-1aMp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 07:02:56 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6763wiVj1070733
	for <linux-arm-kernel@lists.infradead.org>; Thu, 6 Aug 2026 07:02:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=iAA6AR4Qa5OwiZACrTqpvVVaUaRfGGENSJv
	kJ2dCBlM=; b=JEJVdvCpn7TSo/tUb7DQ2mugV4MPchZp66kKpTaR+YYheHHouqx
	WXeG4U7PXDElh0L08utPqMWCSWMr8ErkUGfRtuGlgZ4z5ilXBM4qwl6gKAUfePIv
	dFWptz8VRN6hgNye32Hs2n0JbTINN5WNb6ET5UEq7hyrV4qUdnKR48sfO4FzvD+Z
	7Ktfx9h+Ltcw8sGQgNbKnsxJZTJOryckhdLekxKXK9KwTEvxhFM1ss0yaQl4vYYQ
	kMSC2kqxjqabfO/IbUBX1CB4Vucj5UdwyNyBK06SjotOWibesQWtLVfASq6sfiXy
	y1/Qd/2QgnRtWfg16C/EcmrZks27Vfg7OJA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvjucgny8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 07:02:54 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51a8db414c7so23266231cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 00:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785999774; x=1786604574; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iAA6AR4Qa5OwiZACrTqpvVVaUaRfGGENSJvkJ2dCBlM=;
        b=EUua/jaG6RKZK8ddP7v8TLzeJMq4BBauVPkNfl4r48mbCU4A2VS+y/SK6FEu1Lbsyg
         d4ENxEW0OfdxBiDBdgzNgJTLLsGhN7kl4aVI2Btfn+5hty+T6hCcE4pmvfO2HO8wNS05
         mqev07XVIuJTLV4vTvEG8U7Ng5qbpsqXfh0KjLr30/wYuvYZ1HOy5RxxJh4hTTfbzV+4
         LY5c1nkLB7E8u8WFfHMp/ZH9ioNCPA82SHaxLmq+QIlzrZHu8dDyARFCpQhaqI3BeNYu
         Erb/Qr/Tw1rbB4iBA00DgDqDn52lc2Kh2t/YA3C6XIGN4cCo+8SPtfcEW8wiPS/EHUW7
         TFUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785999774; x=1786604574;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iAA6AR4Qa5OwiZACrTqpvVVaUaRfGGENSJvkJ2dCBlM=;
        b=CVcmobCfeonMrVrA/xRsGEkhdKn9D+j2/Su1qvTdlG0Z4EyqW7vKil8jiOYq18vlIR
         la6b/cvHT+mCFYB7r70y35+hVhSQd80RQkFOD5hdckZ4HDIGYs+dfhJBG/GGqV99jXIz
         hUmvETFZxAaWE6LXzVcWsxcf/7o4xqMNUN/IC7j3r4HT0arG9+oadzaaE50IMP3pmZ2l
         Za8GevlTM2xrmCpXWmbxKbKZTo9gCMVEQNxWhRl8Ya5Lo5h0jQpPOY2Ehtgo11Unt/zn
         L02RQfKdsy0znAfX9cLJlYofx1E1rZi5SPOk2WqxZ2isIljGtw1tdWDmvHnu0eLJM7i3
         m8ZA==
X-Forwarded-Encrypted: i=1; AHgh+Rp8L8iwUFZItN9NZfSJZ/XOmrdVnvKGWc7TLiEFVPPoFdZ3xyKAdS0pjpRhGvySnePqpNz/ZRtaBZ6pYpJecNvT@lists.infradead.org
X-Gm-Message-State: AOJu0YxX98j4HSBlb87AqXTRUPx6J20/vx3CVodC6BluRJsjh30eqtqn
	FogCJ1wcsf3rzK4Hs1BiZNLulppMM0VqrpZE3MsEXJyqIfXfezSWEmjQpgBsKUQgvyxMgUIJQ7y
	S7FTGKlAlcKWQnjzTSLri0GN7nKFLg065d5N/fHPf4icuOivkC8+oftjpiKXFZkB5st8OqZRk5y
	sNSA==
X-Gm-Gg: AR+sD13umMHOaeRA9heRBDOGOIcvHG3F/zRaiqZhRdOfjJ6xRZRK0nZM8acGjapQypH
	QfK0WMfgAf3YYOMvky/pVul6XRrPNEGq87VmQVcg5gko1pQP0kokdpORzjSR1yZwnULJFR4dcfI
	D1SQd+mhe080OyJizIOX6Dj/MD1YHVRVc9oK9jf9Zy4ZzMzs2dIZI0uEiqr5dsQaKqbWnLPFBwq
	nEvNVrB5ugfruig4fY4U+dfy5byUzEdSQfaV1DcVmAFJQms/3mug+USXapy53yRjDM1awvuyYyA
	W51yF7N3aX9f5R3oRuN8Q19W57Jhs5TFDjy51WXpFHXzaC3mGaV+8tv14UOtZAIQg+ehG1gZdCt
	3fVAqw1tdFhDckbCj
X-Received: by 2002:a05:622a:145:b0:528:32c0:8237 with SMTP id d75a77b69052e-52ce620a9ecmr125296091cf.44.1785999773580;
        Thu, 06 Aug 2026 00:02:53 -0700 (PDT)
X-Received: by 2002:a05:622a:145:b0:528:32c0:8237 with SMTP id d75a77b69052e-52ce620a9ecmr125295721cf.44.1785999773144;
        Thu, 06 Aug 2026 00:02:53 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49954246f9dsm45206285e9.15.2026.08.06.00.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 00:02:51 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 1/2] arm64: dts: ti: Correct white-space style
Date: Thu,  6 Aug 2026 09:02:46 +0200
Message-ID: <20260806070245.40219-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2041; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=a9Uuvxnh6ZCSM3JKuUBmksfHVLpBRtAfPN4ynlQ/SVE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqdDGV8ba2URPZj9v49PxHB2Btr1v5mqRTq53wU
 lOFbLEjMNGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCanQxlQAKCRDBN2bmhouD
 14PZD/0c3PX8joGERiBJyVusn2EQNn1c80M1UefIck1b/DgmJc5WbM+DL49HqXDa+LqQRBOYYDR
 NRd7JC6lPlvQBsuaZUN9snsIfeilXLx8JzlPZDDwyBwS1jBJvH2TE8g7cA98IrUoJFXnsTjiTik
 QZXwerivwU9ki2GogZ9eQ8PC1VNo2cCQFha71JTj5GmSxcz/9F9ODyAM20b+lzqVXDJROZt9ekK
 q093A175pVudRUAV47yub1D+sNa/UsNx8e62WJeEplF0UczZTN9QNuYUd31sLN/KdlyfzFEASuF
 zpEOCSprZP5i9lD4K94Vmb1X3oaxAzobUXhqZq7Dy2v3wkQTRlaroUcGWAp867rpgQJ4EYcWI3i
 La23/9UvgmIAXpZovKk8RuisNTWmVc92B2kYUOwnbIBRcVWn5Lau+XFmdFisFXOAoxJtgbtdGyY
 WDnOuHJuLssH2inyoy0MPj57+O+NJuaNRxdYhPOOFMv/1vIKhE/jlS6NuKlClSPUWDS/OkvSK4y
 kUVW6dvzbwsJMH8zD3qu9X6XdlaPj9/uLuqX6rXx/C6OD57LK1VN4FleZV0wWbSHsC1UrOeL5sb
 gl+2kmQ2YDFipa9k52MD0bG+/ouViSD14fWQ6PaIk10rNTENJDFASbVJ1pqng1JhZdDMDaXfU1w JXbK6V0CD0TaBZA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA1MiBTYWx0ZWRfX/dxQfV/H52y5
 JBP6SZWEdCq5cNjvHW0qVI9oaVqvl2B0PYC5YMPt3X5fPFB489REaC40XZ7XyZRtHhAS14LbJRA
 fsR3pySm1JPqQeGnOB0gYemlvOpCuXQ=
X-Proofpoint-GUID: s0IFEvYS3uuQ7_HL9vu8YcNKFYZGC8sb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA1MiBTYWx0ZWRfXzYcxIXfDo0DA
 hryx8pkhwmJ8OANsL2yeLw8QzlF80oo9it4kluFfT/afCee8BsOpzQIqyLusTYbqL8cQt+dPBDs
 5xAj+l5ithNRWcr6d8lK4c5k4POKx1anUuqzSJV1PThDmolnMEuXH2ZhaqtK77IwIifWMzabLqo
 TQZaQ4BsWnjQXykfXfKpG2gorG4fUAg773lo5jMygdtWX867nHUIRVb1WZeHsWRJaL+zzQqvVx2
 nlPZnhZDjpvmJ9Ih1JfWYATrCw07+xXOBFwU1kkORmy9CVYc1NisziLcZfhoRFxr8csSiSOv7+s
 OZ8aFhIBFv0X2L+y0ABhaEALJPmtgtaStj/51Cs4MwLxt4M804DnVhAY5THu6YOJ7NZzvpdH6Z6
 QGnwuLvw4EwwVeSMsd66JzXGLO9kYAqsWBKglAyxdxUlCNstwgDXyaVwd2IYWAkemBDPdC2fmvt
 mbxrNAf4osZeH638FTg==
X-Authority-Analysis: v=2.4 cv=Mo1iLWae c=1 sm=1 tr=0 ts=6a74319e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=4E_048dy4KWIn0a4eT8A:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: s0IFEvYS3uuQ7_HL9vu8YcNKFYZGC8sb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608060052
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_000255_555754_E0D344C0 
X-CRM114-Status: GOOD (  14.66  )
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

Correct a few white-space issues, like missing space before bracket '{'
character or spurious space, which will be flagged by dt-check-style
("redundant-whitespace" warning).  No functional changes.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. None
---
 arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-sm.dts | 2 +-
 arch/arm64/boot/dts/ti/k3-am69-aquila-clover.dts         | 2 +-
 arch/arm64/boot/dts/ti/k3-j721e-sk.dts                   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-sm.dts b/arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-sm.dts
index adf4da7dfa2d..a1a878d88e96 100644
--- a/arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-sm.dts
+++ b/arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-sm.dts
@@ -54,7 +54,7 @@ AM65X_IOPAD(0x01d8, PIN_OUTPUT, 7)  /* (AH12) GPIO1_22 */
 		>;
 	};
 
-	main_spi0_pins: main-spi0-default-pins  {
+	main_spi0_pins: main-spi0-default-pins {
 		pinctrl-single,pins = <
 			AM65X_IOPAD(0x01c4, PIN_INPUT, 0) /* (AH13) SPI0_CLK */
 			AM65X_IOPAD(0x01c8, PIN_INPUT, 0) /* (AE13) SPI0_D0 */
diff --git a/arch/arm64/boot/dts/ti/k3-am69-aquila-clover.dts b/arch/arm64/boot/dts/ti/k3-am69-aquila-clover.dts
index dc0d3cf2f985..3e2377160d82 100644
--- a/arch/arm64/boot/dts/ti/k3-am69-aquila-clover.dts
+++ b/arch/arm64/boot/dts/ti/k3-am69-aquila-clover.dts
@@ -143,7 +143,7 @@ &main_cpsw0 {
 };
 
 /* Aquila ETH_2 SGMII PHY */
-&main_cpsw0_port8  {
+&main_cpsw0_port8 {
 	phy-handle = <&cpsw0_port8_phy4>;
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/ti/k3-j721e-sk.dts b/arch/arm64/boot/dts/ti/k3-j721e-sk.dts
index 689ba2ff81f7..d66e71db4697 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-j721e-sk.dts
@@ -1068,7 +1068,7 @@ &dss_ports {
 	#address-cells = <1>;
 	#size-cells = <0>;
 
-	port@0  {
+	port@0 {
 		reg = <0>;
 
 		dpi0_out: endpoint {
-- 
2.53.0


