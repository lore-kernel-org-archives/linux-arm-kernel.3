Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BFD1C982C9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 17:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NFZ1EfK0FGBQAwVJnJygf04anMhlc164E2iaPiL0Oo0=; b=L0T7MjhHt+qoXz+aDns5NYaj0j
	OtpzzubDV2VChydr2Il8GuP/roYrKxYcUlbnL3Vm1tNOXifBdk++0z6/sh7fKRxe5e4Kd+xmgsSx3
	d3F55eGBbowD/txG27UmS9l8rdZU27OQK3pJ+BSnn/5Lm5NDP5os4WtUpdfbqYD91nIUqf2vjq7pX
	fTDb26oP87nqoR3lJH4PIqW4xsbUYf7GcCEco3q/iaJwNkc+0YdF7Hpo8dIKi6R+At5pNi2WC9vnu
	CNyiQRGoS7hGP/kEQzUIgGpEZWATyIs+dkCK+x8X/wD+k6eX0XGylaG2c8+sb9yFOPNSNCfDwJ8kb
	XtEPqe2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6t5c-00000009pTe-0xGY;
	Wed, 16 Sep 2026 17:06:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6t5X-00000009pRk-25Ml
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 17:06:28 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GG5Jcq3597307
	for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 17:06:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NFZ1EfK0FGBQAwVJnJygf04anMhlc164E2iaPiL0Oo0=; b=fHrxDMR18j0kIC7Y
	BYZtPmWNEtnUzyF/47E922k9i0vtA8tg13H34QFZ62KC+Nc59DyjN8oZ1pbaD3fg
	C3GDRZ0Hqflegju2bYgp+C2hGiD4oIm5tqOEIxaqIbP6DuSTHOlwMwarYbCJZM/l
	+FTi5GDSeKD2/netj9zdqd6So0pbAPrbdJA1RAXIhoEidWK5Dw0btpsRBABluMZr
	ON06HV3tDW/a/KSaS6WjKBtSQ87DpSHVsNZjeI5SEI7aLUeZ76J5FmdMWsZn9H8i
	a+NwGPpNzz+8AC/XmVPgNX69rBnZ/LKlfxXPEkatKb08gvLWi9o2iY6/F4FXcTKw
	yCSRzg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqxay8bd6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 17:06:26 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c7d2076f8aso2005233e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 10:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789578386; x=1790183186; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NFZ1EfK0FGBQAwVJnJygf04anMhlc164E2iaPiL0Oo0=;
        b=aDFYFFDYijR2ilFiMCxI0UgzwAoz8rrx8wZMvB8jL5Onwq86JSqp8ItzSxUeNDjgYm
         2y8WrmmIr3IZ4WjibL9OZxQkrMt9F33jMEoSlnNS+gWPdyGDu8HTnYhMz/M/+Ei8RNht
         GI0zKcRhZl4P/Wj+pCN/J1ciDkK4sz9jEztkq8BzoHeeZhmvkxZpm1ptuBx+nQnx7InS
         f130TluFPIIBjY1lVqbTDcTUKp1wlVs37nVPxzTm9TgzsQgVQPBLGkWVzDlxoJqXoJCo
         XMisu5BnV/aL2VmK6r+jHZ7ZrdhaAZl1hThbLKnL5Ka1ZOch1RxmlWpuG/7gxG/Rhur+
         YIeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789578386; x=1790183186;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NFZ1EfK0FGBQAwVJnJygf04anMhlc164E2iaPiL0Oo0=;
        b=aB4l1zru4Mbqd6fUHH89DfYlLHjo7f4ZluX+yxwVx6g6jAZdnZEMiLaLx2yC8zbihs
         Kf5W/sU6DUZVkTjvn6O0N1+exqeGQy7HfCHQfklqi8Cd4/MhIsELaFZc5OIDgbOxY6Qc
         c2qNW5AT8gI1vfaxz5VO3ZQyN9Nt0Wp0AsNQa+sMFrnUGO56uzmxnOewnQWfLtGHDTEO
         P26bcqrlnhXc19nH4FPLbcLnpYakzYznG40ui7q3Rvt5KY4fLaK6npG/CPTj2JHaC4Q+
         t3Gbk7+gCTIIFJxjIFrlQ5ZFACjRWz16Cjng/jRKNFwXhzG5iz6qo4c+iOy2Y4/pTikg
         jKFQ==
X-Gm-Message-State: AFuF++kRFX9jc+dw2PsSMLdkVnmT+/MgW436A3vfOaUrH+4sU08It5Ng
	iAsjMXhhbrjgMvFvc04MglZDuxosFLZmOM2c6/eTTKI+7EjbwM/TgR6c1zQB4mYzHgAbj/8f6OB
	BbAJTIqMw8b+o7Bc6VOP+W7u7bHt50aQMaVtwtVQiYOJKNMgLqIcnt0FlOYS/QSUUurJkr3Ak+m
	Im6g==
X-Gm-Gg: AYBFou3RoCAt0y+LsSFMIqEc0UW/alPCf9l6I13rmrD0reADFI8Fg4RM1ZQ0qj2b7X6
	2iboQCFEfqTi4EZcuOxNFCjIDPhK6tnXwSd0+473KM/UDt/75SYQCAfpWX+oXJc/qGtdRmzR5Po
	5Iga8ty7h+xI4rGvKSjaMUnV5wFpy+q3IxHa7SpSbTjYbn+RJAx1GAt3j4IcqIaLsACO5/58ilQ
	UH1yy+qzM/+g+vYEUtCD5JSieYVD6wc+dwUtiUVRRrItHxuRAwz/TpXVDDbjEAFeZI7Vtn1IDON
	07Q4AkT9qnOcXcC3E6nV0/a3KhBh6KeH1DZMSwmFUZPh6Kew+lxXKou/JwC3TS5IgHSBLfvra67
	fsjcWqFXYRzjxX7VigC1pCRk=
X-Received: by 2002:a05:6122:2217:b0:5c7:c898:9817 with SMTP id 71dfb90a1353d-5c9a5728439mr241113e0c.7.1789578385952;
        Wed, 16 Sep 2026 10:06:25 -0700 (PDT)
X-Received: by 2002:a05:6122:2217:b0:5c7:c898:9817 with SMTP id 71dfb90a1353d-5c9a5728439mr241069e0c.7.1789578385558;
        Wed, 16 Sep 2026 10:06:25 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf344bfsm7951293f8f.27.2026.09.16.10.06.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 10:06:24 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 19:06:17 +0200
Subject: [PATCH v2 1/2] arm64: dts: exynos5433: Re-order nodes to match
 coding style
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-b4-dts-samsung-cleanup-strict-continued-v2-1-8e9d534ba5b8@oss.qualcomm.com>
References: <20260916-b4-dts-samsung-cleanup-strict-continued-v2-0-8e9d534ba5b8@oss.qualcomm.com>
In-Reply-To: <20260916-b4-dts-samsung-cleanup-strict-continued-v2-0-8e9d534ba5b8@oss.qualcomm.com>
To: Jesper Nilsson <jesper.nilsson@axis.com>,
        Lars Persson <lars.persson@axis.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@axis.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2394;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Mb0mdeCwrCx7WfqFx2rqbE8d06K2O6jx/ez8mp0KsHg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqqsyLcKHB6+j9cfCHubyy5MmbU0+MO+g05wW8w
 KwhXWJdrcmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqrMiwAKCRDBN2bmhouD
 13OhD/9nFYey08IdmZUVW+F0VbO+X63egt/e/h75gvixeDLQCp3Fk4sZBc7rCiImDgoXYxZ44vp
 s+7XtIuusJP+CsCBpnjn1Hqx0B3qIbwXReE1RSHzlz2OILWmT3Ml3ppq/dkKpoc4F4X8sPTIzON
 C5G4CpeJDCOORTNhlwEA0xnA5aSdtj+1CWF9hcbKCLn6HE4gH0FRFv71Tvt5LzQzuIVb321f0qB
 9v9/ng0awnhoQuCC5zHgB0Fc5X2ew2D6tCmtQWY5DxXtGYBOIGfGILd3xI6A5RGzSCwzGzwJTcC
 I5tu3y/DmmqMnxfkTnmJVaZC6GfBv8f0Am7OjLgwalwH5/TWpbLco5YYflmNnOx6ss+3FMPlPjL
 cdRsOLLg7Qohm7jvxBpYB3sbhvn8SsiPc3W0r25txM9ZP5vZEdpWOCjCojQgSb7VhfVubA+SifW
 xiMTMtkg+tx/y4Z4Ksbog8XPvcD3+YhxkpSCif87lChPun59nFKNg69IXqQ7n9BMXT7A0wQjrH8
 ncgD5ktoYqHlrOfVD3YmUBY6SnZ6GZirJrcQtvQWlKgiMn7S44gS5u4csOc4ljC6XsUKAcbjoke
 GDWtHsRuG+CdofeTD2VISMX2B0qKzq9GS7htKYJaEqoIu061IglA0AIpN5fQOzVPtYkKcQb17sX
 pXzULo61XpIEL4A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDIzNCBTYWx0ZWRfX8h0sEkBO4pmK
 couJw139ZC/1ocryp/1aaONFKakPSAKccqhEluJPzw2mC27vAYBI1h6aMdDtDN+RQvn972HSDEB
 gTZjwz8AjmYucyuM0Agjg85vNg6NmqJFcLAJIlcT/3dkmtIm3HMbqEB96/s0tCpwv6aCYgJ2hRO
 7hhvcchu9Cpijuco+UrMif5jYj/zTmW+c/MG3p+bABqRzgNH/et5bIqZ5S5YjZzBSysAS4xTSAW
 bdLPm/9nieo/jjorqGSDyXyALG/XriE24sr4qBfkMNgpmmwk9VJH+XB7pdzXDfzdWmI/EVklP2R
 uJ2rr20OjBhCjNs0UFbi17ty/b6Bx36jifILsP7dpgsPn+/yEqfULEQr9jECnowac566CA4z0Hg
 lGswr32p2lDhlWKQKGJUcpevi0delUAeWmvwxUh+MAuPDPsktdbVJ44bJMmSVxmYDNsMkkJO7F2
 G7V90gZj63HPSkWpoQw==
X-Proofpoint-GUID: mf9HT3jC83GhD9VDpL8LLHhwIUxqLPK9
X-Authority-Analysis: v=2.4 cv=EoJHPicA c=1 sm=1 tr=0 ts=6aaacc92 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=4tTdy-R9G4y-is6xSP4A:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: mf9HT3jC83GhD9VDpL8LLHhwIUxqLPK9
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDIzNCBTYWx0ZWRfX/SpR1fwELv7f
 kpvvctGk/7h7vaqiySledG869S0hCHe/VxPDQpoMLzlCvfIE8oFaUW9irVzkq7pAC59OqWHFnGB
 wWflZ6Obiucipu+7ofUJg0k8dDcbEWE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609160234
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_100627_680397_5357ECE3 
X-CRM114-Status: GOOD (  14.89  )
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

Re-order a few nodes to match coding style - ordering by the name, as
pointed out by dt-check-style, e.g.:

  gs101.dtsi:476: [child-name-order] child node 'ect' out of name order
  gs101.dtsi:479: [child-name-order] child node 'clock-1' out of name order

While moving the lines, move also linux,code to the end to follow convention.

This is not complete re-ordering of all nodes and children of "soc" node
are left as is.

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../boot/dts/exynos/exynos5433-tm2-common.dtsi     | 28 +++++++++++-----------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
index 0ad02a098765..a85afdde9c41 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
@@ -56,6 +56,13 @@ memory@20000000 {
 	gpio-keys {
 		compatible = "gpio-keys";
 
+		homepage-key {
+			gpios = <&gpa0 3 GPIO_ACTIVE_LOW>;
+			label = "homepage key";
+			debounce-interval = <10>;
+			linux,code = <KEY_MENU>;
+		};
+
 		power-key {
 			gpios = <&gpa2 7 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_POWER>;
@@ -76,13 +83,6 @@ volume-down-key {
 			label = "volume-down key";
 			debounce-interval = <10>;
 		};
-
-		homepage-key {
-			gpios = <&gpa0 3 GPIO_ACTIVE_LOW>;
-			linux,code = <KEY_MENU>;
-			label = "homepage key";
-			debounce-interval = <10>;
-		};
 	};
 
 	i2c_max98504: i2c-13 {
@@ -103,13 +103,6 @@ max98504: amplifier@31 {
 		};
 	};
 
-	vph_pwr_regulator: regulator-vph-pwr {
-		compatible = "regulator-fixed";
-		regulator-name = "VPH_PWR";
-		regulator-min-microvolt = <4200000>;
-		regulator-max-microvolt = <4200000>;
-	};
-
 	irda_regulator: regulator-irda {
 		compatible = "regulator-fixed";
 		enable-active-high;
@@ -117,6 +110,13 @@ irda_regulator: regulator-irda {
 		regulator-name = "irda_regulator";
 	};
 
+	vph_pwr_regulator: regulator-vph-pwr {
+		compatible = "regulator-fixed";
+		regulator-name = "VPH_PWR";
+		regulator-min-microvolt = <4200000>;
+		regulator-max-microvolt = <4200000>;
+	};
+
 	sound {
 		compatible = "samsung,tm2-audio";
 		audio-codec = <&wm5110>, <&hdmi>;

-- 
2.53.0


