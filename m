Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 281BBC5516F
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Aug 2026 21:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dphclf1xDSYc2yeFYhYsyWjbzi4CkfV4D8kKTlZ9hHM=; b=HSXwY4SjnqBm2U9r7xnBy/IdlF
	XmF2gUx6m6XvMcOs08/6emaQ8bW2H1tanHwCHge/AqSJxuuQR20YRK6tWzSUlp/MB0rdSpcFFRJJd
	yO37SLzPIhNSdZqeSv9ET161IQW/IXX4/0EJX2pChe+1eHc3LHuKtHg1Car1DZjaSW01O2Y2vtQMs
	NXaWjvHIYBbConcdKknuK8dYpObQ1PcNkh0X8mJeAOhlodsshnN0OkAPqqbeYshe+WGPZcTJcRgoC
	lvK5g9j7L45lAwpb8GJyWUA74MK7HnJVdOdP1aJDrnWDkPnFEjX3GfR7fJR5FK6Vjo89Kv29fzmyy
	qKCaiQyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqGrF-0000000F4J2-2q7B;
	Sat, 01 Aug 2026 21:03:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqGrC-0000000F4Gi-1RbJ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Aug 2026 21:03:00 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 671J04M33716865
	for <linux-arm-kernel@lists.infradead.org>; Sat, 1 Aug 2026 21:02:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=dphclf1xDSYc2yeFYhYsyWjbzi4CkfV4D8k
	KTlZ9hHM=; b=UHwGE7ibrG7PBHDpforDIIDZ5M0Bij69rxgdYTFX32Q+V0Ne4v+
	BALbai49TwxC9sLk02x+QraX1ErChTh4fnpCBLUTUvtimS9mCdImUncn9iHXtXfj
	JCzJhVcGVKrF9nacaqVOPSh23K8z5eiM8PqOk2D3prDyR9JH3K/wv3FY6DxyS6wI
	mC6asTvhwqApUZiNHLK7UyAPa5lPY4EjSBG9ABq8bps1jF8b0zHqu4VXsIs2MhFZ
	dKfszm9Fmwk4x7nVYhWlFKbmD5rIEGkWqLZVvb+ozF6sSbA+NjM0DlnpsWYlco98
	ZrvGPk3rY9LFOwvbZJ0lWFxO4TfvInHFVyQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8r6hqsc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Aug 2026 21:02:57 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e820609d9so176956085a.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Aug 2026 14:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785618176; x=1786222976; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dphclf1xDSYc2yeFYhYsyWjbzi4CkfV4D8kKTlZ9hHM=;
        b=We1WwWvH6tzkqzgopuN6X4u3BOq89kHAm1dst7aY6xwWeADeFqKbVs9RFq+1l+IvQC
         iPzPphln6cG9bBIyImFXSzbM80Use4ZYqurhXobDqSg7Rrc9MMjy4CJKHqMpZZj8g/uJ
         Ebr47HKZN1t148WJkShqaumxOVt+BEUJhYS6/MGSEsB1f93OtS7IGnA0Z5cksoTHNGpy
         M5C74vLGVxxwhbCkqvrRf0fYLha8amTRv2UyqjyYL7/KIkfeelR4iBuItldm6YZKlcfx
         nNhveVT3ht7shHcqI6a8nsa6RHt27P7adhSyk0og6u9nIGpPfrFkEzuzSD8vsbTqnqJH
         wugw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785618176; x=1786222976;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dphclf1xDSYc2yeFYhYsyWjbzi4CkfV4D8kKTlZ9hHM=;
        b=i0tsnafggzYc5N/LWo0ByFHluRw9fg+x08hBJwieI6V7llOwQkNoPfavMzfjB9BbeT
         Bh1iSKvGbmFFfHPGKBYI/y+6uEazzSJL20IWpm+ex3nMBgOiCCUca89FeDnjGYYMx5ow
         q4V0t25VtDhjjcw+FHIT/2D8+Kmb4GlGCBFuZPvFbRAd4d1V3lv3k4jKzd9q9UeqOjYu
         tm9bQMl0SUJBcX87xsaiqYQMLGYTw8+Gxk1jvwnZYCiyJjEFh8MTtL+j+zsv4U1BS//O
         Ffo5TnnLbYQ4K5wq6n0Y0ENw8ihAZFWe/NrhDkP/qwD9vogm0OajtH0QmeyimK8/wd//
         fx2Q==
X-Forwarded-Encrypted: i=1; AHgh+RoSS69Yaqeh5UppjII2b5gcZZLAbW6OVFUGA8hNXJCTHkqKCPCaJpEGK/4emeO/poATKeF4QywJ+LyMkBKehv8a@lists.infradead.org
X-Gm-Message-State: AOJu0YyI0FGBMOhtf792odY4YssnfC+HjqLNHC+agK6RBASof5qgOs7s
	0pziJeyhnPMgWQdQjkqnkWZF9gS7mu+ScVfsVIMBZWrLln1ErKz0RunFzMIE6kYB52H6tWivR8J
	f4z5jODqrXQqTKA+I4ilXkXhE2rR4zdVKiqv0NGYJaP+zUqRbxrw9mRTgyQY2yIYibp75qk2CrX
	7nug==
X-Gm-Gg: AR+sD13fK19V+wAVUR1a8e9W9TXSkupmFmzYt1gurxLqOl+t8+lnMOGZ0MqoJJn/CsW
	jZD/+tIbZcOs2DyhaOGpGz2tuLRpiRQv7veoXNvUZrLVOoPXyI+OL0+wPq5DHy+SwkVcLcN85D/
	PRHjRYthZMGeP0kAfA+bIMChDKrHCMyeEp83CfyBGgFXzUjofL7HDI/+b7W9NKFS5+k0x19F5Z4
	+lCjAUzTl0hg6MpYThQFa/9Gq5LxQTk9OLYlkOsVpx72OEf732xUljH+/gerG1zMl4ii9GfnJ6o
	ypwe5DU6wXjiotHnjBgzi/oC5OjeN8tLUhYAPTaNZ8yZ4ravRw4jyMoRCKhsw/Ry+uEmnqy5WeG
	q2TXMTM+k30eq4/qE
X-Received: by 2002:a05:622a:400d:b0:517:8470:2d2d with SMTP id d75a77b69052e-52b56794481mr98485141cf.29.1785618176511;
        Sat, 01 Aug 2026 14:02:56 -0700 (PDT)
X-Received: by 2002:a05:622a:400d:b0:517:8470:2d2d with SMTP id d75a77b69052e-52b56794481mr98484711cf.29.1785618176019;
        Sat, 01 Aug 2026 14:02:56 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807ba8032sm66078785e9.15.2026.08.01.14.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 14:02:53 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/2] ARM: dts: rockchip: Correct white-space style
Date: Sat,  1 Aug 2026 23:02:48 +0200
Message-ID: <20260801210247.383632-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4144; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=dGRnJ/ViI7FCUrJ6sPAZE8J3PYCdg5ixZ0vKvqVL7Wg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqbl745zxbEU7ZCsaVoNzwJ5HWAADW7/FHgihyx
 MEUUgB+6uCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCam5e+AAKCRDBN2bmhouD
 18UJD/99QnUFpVKAV3Dzk1lIJ2IVCV8pLbpkSEmlB9OW2HONgG/PcR4nIhc4JWzuOPnWM2YjINo
 iW6w1GdXufVV8bPP//fYfVOOsDMOPEd0tukD9RpD2NN7O47wrSifgl3eoTEhTo1D2xJY1MxH7gC
 SC1N/B3sGQiIyeoC87Tk9RDm4YiBpuy4KmygHsTX1S43aulwoEXYKahIjMOB3KYwMxqm22Jf+Z+
 9Qnm/NWpyOAVR+7y0ynMM6uHLtmGJUzMdwMpjt/LizMfuH8zjSkWzOfWgLAJlc0rcVALO+98w8k
 frDYSEcaSjoEUbDcIxFOLXSB4Zh1rAB77GprIcVlPNz2SnU1ns04xBMLmzVNUf/YQSnYYme/AFB
 VuMrLVse6BKRspl1gr1SkqBtC8srSwQICRB9pdQrB1nV0FCpQPpeR4lIIBih8oMo41hcBWmIBE8
 SOPmHeEmE902Pux0TtALjXNk0wOeUAJ6vjpR2O4+auP1ybD8oNA7I03506aO4TJ45v8t4subBXB
 2d3LVj+MzaYLhT3HlwEAYKVRKRW901BlALbYPIqx0hvK80veSOLhzI83VE55ZBLtsYfGEIXeXbE
 fyDQ0miI4Uk84R7oH3SWbouUgRpxhL6/0jjwqGZ+RB7kKz/VY7QJOwBRNwoD/2gED4r5Cp2eyGz uYBlh/YU5sWLPxQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDE2OSBTYWx0ZWRfX2JluHCfbMFbR
 slSH21uQhHtJL5754aV8xVEDS1x4577zVblDQxaIsyb920F7FUbtKTZcUqt2DPUBXV3i8O3B0Ev
 pfzt1BevAsq1kqQv8V2BCW0btkqP+4s=
X-Proofpoint-GUID: DSdsuUp5Y8iMVPd_Y2zaOtFeuk6H3_D5
X-Proofpoint-ORIG-GUID: DSdsuUp5Y8iMVPd_Y2zaOtFeuk6H3_D5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDE2OSBTYWx0ZWRfX5O7CpcTvR2Ak
 R5cQ+4FZHLYFMrkSmMudwlxlxrCa29kblA/tBUlK9GLxiv9Dgzgpu32EWX7+Q45GeqftqfdCuZt
 8/Trr8SyPW+E4Jc9ukAcThx6ZZfT6IFGOkiru8M8KfDArRmYCwwC+7zQow7HBARp5KdqO7h1NOn
 dnJjO3DES1RZX25B1FLpZ75fRTJakXgkCIcQnvf2KhAHj5x5U0s9L7h12kyY2NRw00UuWlhPjoA
 DZAGhLU2m5nZqVrXqGOWfPnGIf8nNbL/v6wHm0ETWsUNKOoSIPtvXi8rk2clpvSXYANpNcdqnAL
 CzKZ+V8cbshVtpsu1te1dGptPS9sFLxuO/jneyQ+SCInKrgPdDJ3PD1gYRX/NxN6JNtk7JZ49GD
 m3+SSwzt8wgimp/bppYr/ZVO4KNgDYrRsg2Wf6UCUaMsiOHN96E/NLbj7pcpYIpFNxohyg3br8x
 ClxDLMDePoQL0cxMkmA==
X-Authority-Analysis: v=2.4 cv=Q5ziJY2a c=1 sm=1 tr=0 ts=6a6e5f01 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=Hx2NUBF34izpMPi2HQAA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-01_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608010169
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260801_140258_536635_36795665 
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
 arch/arm/boot/dts/rockchip/rk3188-radxarock.dts            | 2 +-
 arch/arm/boot/dts/rockchip/rk3288-evb-act8846.dts          | 2 +-
 arch/arm/boot/dts/rockchip/rk3288-evb.dtsi                 | 2 +-
 arch/arm/boot/dts/rockchip/rk3288-firefly-reload-core.dtsi | 2 +-
 arch/arm/boot/dts/rockchip/rk3288-firefly.dtsi             | 2 +-
 arch/arm/boot/dts/rockchip/rv1103b-omega4-evb.dts          | 2 +-
 arch/arm/boot/dts/rockchip/rv1126.dtsi                     | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/rockchip/rk3188-radxarock.dts b/arch/arm/boot/dts/rockchip/rk3188-radxarock.dts
index 1f31c0a6774f..7ebbf9b932e1 100644
--- a/arch/arm/boot/dts/rockchip/rk3188-radxarock.dts
+++ b/arch/arm/boot/dts/rockchip/rk3188-radxarock.dts
@@ -324,7 +324,7 @@ rtc_int: rtc-int {
 		};
 	};
 
-	lan8720a  {
+	lan8720a {
 		phy_int: phy-int {
 			rockchip,pins = <3 RK_PD2 RK_FUNC_GPIO &pcfg_pull_up>;
 		};
diff --git a/arch/arm/boot/dts/rockchip/rk3288-evb-act8846.dts b/arch/arm/boot/dts/rockchip/rk3288-evb-act8846.dts
index e1821fadbe7a..fb581b505101 100644
--- a/arch/arm/boot/dts/rockchip/rk3288-evb-act8846.dts
+++ b/arch/arm/boot/dts/rockchip/rk3288-evb-act8846.dts
@@ -175,7 +175,7 @@ &panel {
 
 &pinctrl {
 	lcd {
-		lcd_en: lcd-en  {
+		lcd_en: lcd-en {
 			rockchip,pins = <7 RK_PA3 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
diff --git a/arch/arm/boot/dts/rockchip/rk3288-evb.dtsi b/arch/arm/boot/dts/rockchip/rk3288-evb.dtsi
index 11bb970c6112..ffa5a1257341 100644
--- a/arch/arm/boot/dts/rockchip/rk3288-evb.dtsi
+++ b/arch/arm/boot/dts/rockchip/rk3288-evb.dtsi
@@ -40,7 +40,7 @@ button-esc {
 			press-threshold-microvolt = <1000000>;
 		};
 
-		button-home  {
+		button-home {
 			label = "Home";
 			linux,code = <KEY_HOME>;
 			press-threshold-microvolt = <1300000>;
diff --git a/arch/arm/boot/dts/rockchip/rk3288-firefly-reload-core.dtsi b/arch/arm/boot/dts/rockchip/rk3288-firefly-reload-core.dtsi
index 59029483741b..e68bf31e816a 100644
--- a/arch/arm/boot/dts/rockchip/rk3288-firefly-reload-core.dtsi
+++ b/arch/arm/boot/dts/rockchip/rk3288-firefly-reload-core.dtsi
@@ -150,7 +150,7 @@ vdd10_lcd: REG6 {
 				regulator-always-on;
 			};
 
-			vcca_18: REG7  {
+			vcca_18: REG7 {
 				regulator-name = "vcca_18";
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <1800000>;
diff --git a/arch/arm/boot/dts/rockchip/rk3288-firefly.dtsi b/arch/arm/boot/dts/rockchip/rk3288-firefly.dtsi
index 187d4f0a52eb..13060a9ecbb6 100644
--- a/arch/arm/boot/dts/rockchip/rk3288-firefly.dtsi
+++ b/arch/arm/boot/dts/rockchip/rk3288-firefly.dtsi
@@ -79,7 +79,7 @@ power_led: led-1 {
 		};
 	};
 
-	vbat_wl: vcc_sys:  regulator-vsys {
+	vbat_wl: vcc_sys: regulator-vsys {
 		compatible = "regulator-fixed";
 		regulator-name = "vcc_sys";
 		regulator-min-microvolt = <5000000>;
diff --git a/arch/arm/boot/dts/rockchip/rv1103b-omega4-evb.dts b/arch/arm/boot/dts/rockchip/rv1103b-omega4-evb.dts
index c6472f933aa5..b9ec812b4a86 100644
--- a/arch/arm/boot/dts/rockchip/rv1103b-omega4-evb.dts
+++ b/arch/arm/boot/dts/rockchip/rv1103b-omega4-evb.dts
@@ -26,7 +26,7 @@ chosen {
 	leds {
 		compatible = "gpio-leds";
 
-		led-0	{
+		led-0 {
 			color = <LED_COLOR_ID_BLUE>;
 			default-state = "on";
 			function = LED_FUNCTION_STATUS;
diff --git a/arch/arm/boot/dts/rockchip/rv1126.dtsi b/arch/arm/boot/dts/rockchip/rv1126.dtsi
index d0cdc5f74212..74f238e13533 100644
--- a/arch/arm/boot/dts/rockchip/rv1126.dtsi
+++ b/arch/arm/boot/dts/rockchip/rv1126.dtsi
@@ -717,7 +717,7 @@ sdio: mmc@ffc70000 {
 		status = "disabled";
 	};
 
-	sfc: spi@ffc90000  {
+	sfc: spi@ffc90000 {
 		compatible = "rockchip,sfc";
 		reg = <0xffc90000 0x4000>;
 		interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.53.0


