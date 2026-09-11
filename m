Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68A0FC88E4C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 10:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jicLiHulI0Qi4WisA0oe5cE/i/hgaolPexl2O5z3244=; b=QGPvj0SZ2rNTGavNnq0UJHmc8L
	j7K4YWNKC9m0BOKTmNdP0jE8zL9sFRlx6YBx0hTBdH47+d6OzzUhw6/YUgLogZmClXEPEm+z9UdOw
	wB8qJ0x774uuShLBpkrlSLz3y4Dbhz66k9bkSHQaTbc1I1tec5qpb6ZKntmAhYjig313tErDnJVn+
	b65z5PbGO+xlV0E1W1fW22/p2XTwVzrxPRsrcqg5sZwDQ9aeGhp9q1W3mp30FuEyYy0+frlLsHiMc
	Yk0CvLb0C2jCCB2pEszSCAvrSgbzjUeIDk7CDPJj1ha6qYM6Kn7LIwVaUshhiKjclH6sxPUUTz96x
	n7Kt9YDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4yMd-0000000GMMt-17DN;
	Fri, 11 Sep 2026 10:20:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4yMM-0000000GMCN-1vP5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 10:19:56 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B7kr3x143925
	for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 10:19:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jicLiHulI0Qi4WisA0oe5cE/i/hgaolPexl2O5z3244=; b=kQJ+sWMB07nFB+pF
	yPbP+lvVrLftyjfZHfHHoPM99VXR56V4uz4UBbKOGk6CmG/+9u4FNTaoCD6fjBI/
	L0dSohYcxe1j47VB79cZsnACRkgDuiH/TidP7iTKgdYH3LHvf2ElXXhQxtLlHLN4
	FPEXqkQkgkBu97WyNNce0Qskn61PPV+cWd0e2uqJDPkI2NkyQHVyfLnH6FQr10qQ
	57ILwUZ5vGOT9FFtnUxx904BpXaRStgi0535JZ2kXFwLcl8e0nGAA74lr69SDaAL
	ARpMPMeWRDLhJhL4duDqu0JBUtI7unFFdU4735JvBjZsQhTsGyM0XDxUtqONqYIv
	FUzWeQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmbd395ss-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 10:19:53 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9375d92d8cdso140719785a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 03:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789121993; x=1789726793; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jicLiHulI0Qi4WisA0oe5cE/i/hgaolPexl2O5z3244=;
        b=QSnjT615sWLYQ5ekYLKlDBRu/BKiQ/KIsFd+i5/3itdymSU7J5tUWAK7DYitzNtt2y
         AWf6LRuLxr9+PyY+6I1GFCGWB7uvAcyQATr7tHkcG25I0avh1ID5L3n/xkW9e4MfEqMD
         3fDrVqytl+SzJo5yuSIVN9CeNPYe9qDNiceTBAHmDBMtoqvygdNe1UESOH3/YGW6iXSu
         ijAC7k4U6anR3QPECgXNNtWvprLSDwfsifZwFlih9k5AxgNQ3sHhdwqnAbluyu4+DdKy
         YFgUDfMREogdhoR2oc72AvTRfSMPtufKRKjsXfThSqwQiYFinWQRIfgIVuckPCzLYFMl
         z/pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789121993; x=1789726793;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jicLiHulI0Qi4WisA0oe5cE/i/hgaolPexl2O5z3244=;
        b=jAsQKopmlbCbcZI2ql69UJFoWxiZa8ORR0aqdi/lEbFYGF0lnmlzSagAHOhTOcUI1f
         sPNws1TdT/LVTjsHVMxpj7aGiMqSjgvYDJ1FbxzKaKQx3TMbIDR8IBqq/m/mcQ+iYExS
         rC8vsYwZ/1IcInd4ZPClr0ePvyVx9jit8z6EvEyeC2vShha1GdY/GL6elh//3F1nDqf5
         pstQ4QtJsqRLd8hutndAtbBeGKSoKW3MZNQkdEvcjzo1j9zjelDvJe4q3p4MxFRvEgTW
         eJlk5SvHBrf9pxSjDAzHPYQNF7/RTW+Ty2zaCR8+hJu9wmRo003wFAUJUccfS3ap5le3
         FAhA==
X-Gm-Message-State: AFuF++l/LcRwgd2fpMI7EtflvJmMYpk9OLr0Z4w/W+UnkLrSj0xOlU4a
	z6SgVg3vEg+Li/EXfoj+rZNnb5ZDjEqBFDBw4pNjauVoVCeMN0WmpneymnRjhwnEaFi+OgWurZx
	bAZ6FWm3w4E7Dvd82geEU/DK0TpLWDLljQAZg/6w8nTeihRfGh1H+/imVwVlnxQt9NzZqDaPTU4
	Z9e8LQatzvAQ==
X-Gm-Gg: AYBFou0RnIl6tCL7QQqeAB8Qych0sEpK7Xygdjcc4Am+jGZk3QBNpvAnvvI+x9tCOXQ
	0CATtomctZPY8DxAfN6R7qcBbT2dGHeznfN8SkmkFV7tk2dGQH2MTtxADDjMcKQQ8/jCYUQX98U
	ZhSDlx7rcZ0gYnGm6/bxmxb9LurFkMDoeJoG7USiDGjUZ2LuDPYTMHjWFnaEJ0+J53GWAaNx1eE
	lGQ3An/IpapM2fzfzeQyJzBFvNGbFEyJuLPlP/0KPk+DCenrHAAgAZBRoth26RRFbaGJsMLmKj9
	5vngDYg8Hvdm314Tz9cNmHMsBCucaDVKgOovfI5FJ/S7wEk+EvJ+fB52fLRN8+4bjJPt6CjdoFK
	xuwGRkmswbj3ksb6+zQsE9qw=
X-Received: by 2002:a05:622a:64a:b0:52c:dde9:5cd5 with SMTP id d75a77b69052e-530c8555856mr52765241cf.21.1789121992564;
        Fri, 11 Sep 2026 03:19:52 -0700 (PDT)
X-Received: by 2002:a05:622a:64a:b0:52c:dde9:5cd5 with SMTP id d75a77b69052e-530c8555856mr52764711cf.21.1789121992005;
        Fri, 11 Sep 2026 03:19:52 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6576122bsm41989585e9.2.2026.09.11.03.19.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 03:19:51 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 12:19:17 +0200
Subject: [PATCH 09/10] arm64: dts: exynos5433: Re-order properties to match
 coding style
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-b4-dts-samsung-cleanup-strict-continued-v1-9-9aa55051c42b@oss.qualcomm.com>
References: <20260911-b4-dts-samsung-cleanup-strict-continued-v1-0-9aa55051c42b@oss.qualcomm.com>
In-Reply-To: <20260911-b4-dts-samsung-cleanup-strict-continued-v1-0-9aa55051c42b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=22783;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=EGjt6MACDy/wiOdwaGjm3E393m8sMOnGC2KfHZFTcY0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqo9WuO4zYyTRPSCs7uzyhNYTPpElj77gt8Ba2Z
 PneGFLkm9CJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqPVrgAKCRDBN2bmhouD
 13vND/0a7qiOZ0QY52idHKMqwsjet/8ZyZABFfwGCvvWCeanOLyoU68++fiNQESU7KOhrS+tVHC
 bslZWTCyhGGXy7yxfBKqolGOgga7lRppDFRHwVzEpTx4nlz9zTye6ZpCUUvb4P5JEmUpJvbGIp9
 NDDaxczs4cEcomcBLzaHed9Bcu4oxwrwM+wOq6RstxvX61PCwU1jRfL3N5l+HIQwCnQ4NCsSKXC
 BskrFbOVN7wRUpr/Sl5WmsWwnXH91fiO534j+Fej/oLRAbXIL2WSeWjCNff097fWIJMZhmlMsai
 7ilJCrG6ieh1Q4jTlBkoC0kEWfRk+V2BQMaz2/pQTz6BQzbzUnyJSOE97ISyk5ApiRCy3hl50XD
 /hxRzBqg+qeZkNtI3TE7GqIWF37vt1ZU7zQoAXaZP3NJG4CYEA2IbJfhhVOUpZimTO0yrcVMPFE
 IeFM4xYDCV+MvWA0OSkUiUQYRFoaNtWilISvSWHAqJFKL0X9B4W5/xsXMSVZjaUi1plvOB4hK0r
 udy5IpqxeOtu1RDzt9/NzIxq/xSw4lj88YQ0f9bEcuwplGJmg7C1WHpHzu0KM4we9rhdJ4jHB3R
 uTSzwucFlUsDPRqE/NQ8j3ciGCXet/LGCaYRBAsm33ObmWm0bi36O4/W0KcZM3hn3LDVdzMAgli
 A1A64E8I215qsdA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=Bv8IUoX5 c=1 sm=1 tr=0 ts=6aa3d5c9 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=DKt2B8I4-1mJb4lmaz8A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: BvgyF1AF5_MBWdv_EHEoBWB9XKapd_Mk
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDE0MyBTYWx0ZWRfX6m52MogrUCLQ
 dBnCt8gprBvD6m0vubS6lsmNcjfE7M9Bleh/L7w+i/347obCLhftP4TorJ7wRqg/+rn+HO/gT+4
 +6cvRQa3QgpmgWOV7jPAK+fkXwxQ/Nc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDE0MyBTYWx0ZWRfX35Aw+N6GgoJJ
 HyQwBIBwv5zRD4b4q6voXkNTeCxg2TjmUdiAGgGd0JB23KMk4N6P21SPevJ0eGE5/DthiaUi8bs
 dT9cauywA7dCeFzNFX+cC3BAEwVxF+Wh6YVqnGfyrKiWr5ZbD2IgZDa3bD7IosvXHtfNNWhLBqD
 49+HP5aWOV9bvqgk2NZLBFCzIuZ8yPOztMlX8OHK+O8zVmsjrY9cLJCR6eRf2AX7Q6vh7T6ALYS
 04T8Q/DRsn12QtblBjw01IlsF517A/t/Gj15qH0ksUz/1utVjH8a7/n3KbNqkJUUBnnD+f9ZCnz
 mjUZU9z1ZWq8wj6Vod5ofyK0I5pzvxmIhDgdjFf+5rm3kJTFfhuHowAn+g9n9K+p7FShofVYt1F
 EqI7ld9IFKa+RUocZz6BxrYgrSLNFLYZV+y/hRXfTLdggCyalW7g0pYo8t6d0EkGUjLGpMSg1Sc
 9jZcxcr+43YdEZCWRKg==
X-Proofpoint-ORIG-GUID: BvgyF1AF5_MBWdv_EHEoBWB9XKapd_Mk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_031954_547678_E97BB894 
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

Re-order a few properties to match coding style, as pointed out by
dt-check-style, e.g.:

  exynos5433.dtsi:1008: [property-order] property 'interrupt-names' must be placed after 'interrupts'
  exynos5433.dtsi:1013: [property-order] property 'iommus' out of canonical order (should sort before 'samsung,disp-sysreg')

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../boot/dts/exynos/exynos5433-tm2-common.dtsi     |  65 +++++++-------
 arch/arm64/boot/dts/exynos/exynos5433.dtsi         | 100 ++++++++++-----------
 2 files changed, 84 insertions(+), 81 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
index a85afdde9c41..a17a7d063212 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
@@ -65,23 +65,23 @@ homepage-key {
 
 		power-key {
 			gpios = <&gpa2 7 GPIO_ACTIVE_LOW>;
-			linux,code = <KEY_POWER>;
 			label = "power key";
 			debounce-interval = <10>;
+			linux,code = <KEY_POWER>;
 		};
 
 		volume-up-key {
 			gpios = <&gpa2 0 GPIO_ACTIVE_LOW>;
-			linux,code = <KEY_VOLUMEUP>;
 			label = "volume-up key";
 			debounce-interval = <10>;
+			linux,code = <KEY_VOLUMEUP>;
 		};
 
 		volume-down-key {
 			gpios = <&gpa2 1 GPIO_ACTIVE_LOW>;
-			linux,code = <KEY_VOLUMEDOWN>;
 			label = "volume-down key";
 			debounce-interval = <10>;
+			linux,code = <KEY_VOLUMEDOWN>;
 		};
 	};
 
@@ -358,11 +358,12 @@ tv_to_hdmi: endpoint {
 &dsi {
 	vddcore-supply = <&ldo6_reg>;
 	vddio-supply = <&ldo7_reg>;
+	pinctrl-0 = <&te_irq>;
+	pinctrl-names = "default";
+
 	samsung,burst-clock-frequency = <512000000>;
 	samsung,esc-clock-frequency = <16000000>;
 	samsung,pll-clock-frequency = <24000000>;
-	pinctrl-names = "default";
-	pinctrl-0 = <&te_irq>;
 
 	status = "okay";
 };
@@ -410,11 +411,11 @@ &hsi2c_0 {
 
 	pmic@66 {
 		compatible = "samsung,s2mps13-pmic";
+		reg = <0x66>;
 		interrupt-parent = <&gpa0>;
 		interrupts = <7 IRQ_TYPE_LEVEL_LOW>;
-		reg = <0x66>;
-		samsung,s2mps11-wrstbi-ground;
 		wakeup-source;
+		samsung,s2mps11-wrstbi-ground;
 
 		s2mps13_osc: clocks {
 			compatible = "samsung,s2mps13-clk";
@@ -859,8 +860,8 @@ &hsi2c_7 {
 	status = "okay";
 
 	bridge@39 {
-		reg = <0x39>;
 		compatible = "sil,sii8620";
+		reg = <0x39>;
 		cvcc10-supply = <&ldo36_reg>;
 		iovcc18-supply = <&ldo34_reg>;
 		interrupt-parent = <&gpf0>;
@@ -897,9 +898,9 @@ &hsi2c_8 {
 
 	pmic@66 {
 		compatible = "maxim,max77843";
+		reg = <0x66>;
 		interrupt-parent = <&gpa1>;
 		interrupts = <5 IRQ_TYPE_EDGE_FALLING>;
-		reg = <0x66>;
 
 		muic: extcon {
 			compatible = "maxim,max77843-muic";
@@ -997,18 +998,19 @@ &mshc_0 {
 	cap-mmc-highspeed;
 	non-removable;
 	card-detect-delay = <200>;
+	fifo-depth = <0x80>;
+	pinctrl-0 = <&sd0_clk &sd0_cmd &sd0_qrdy &sd0_bus1 &sd0_bus4
+		     &sd0_bus8 &sd0_rdqs>;
+	pinctrl-names = "default";
+	bus-width = <8>;
+	assigned-clocks = <&cmu_top CLK_SCLK_MMC0_FSYS>;
+	assigned-clock-rates = <800000000>;
+
 	samsung,dw-mshc-ciu-div = <3>;
 	samsung,dw-mshc-sdr-timing = <0 4>;
 	samsung,dw-mshc-ddr-timing = <0 2>;
 	samsung,dw-mshc-hs400-timing = <0 3>;
 	samsung,read-strobe-delay = <90>;
-	fifo-depth = <0x80>;
-	pinctrl-names = "default";
-	pinctrl-0 = <&sd0_clk &sd0_cmd &sd0_qrdy &sd0_bus1 &sd0_bus4
-		     &sd0_bus8 &sd0_rdqs>;
-	bus-width = <8>;
-	assigned-clocks = <&cmu_top CLK_SCLK_MMC0_FSYS>;
-	assigned-clock-rates = <800000000>;
 
 	status = "okay";
 };
@@ -1018,20 +1020,21 @@ &mshc_2 {
 	disable-wp;
 	cd-gpios = <&gpa2 4 GPIO_ACTIVE_LOW>;
 	card-detect-delay = <200>;
+	fifo-depth = <0x80>;
+	pinctrl-0 = <&sd2_clk &sd2_cmd &sd2_bus1 &sd2_bus4>;
+	pinctrl-names = "default";
+	bus-width = <4>;
+
 	samsung,dw-mshc-ciu-div = <3>;
 	samsung,dw-mshc-sdr-timing = <0 4>;
 	samsung,dw-mshc-ddr-timing = <0 2>;
-	fifo-depth = <0x80>;
-	pinctrl-names = "default";
-	pinctrl-0 = <&sd2_clk &sd2_cmd &sd2_bus1 &sd2_bus4>;
-	bus-width = <4>;
 
 	status = "okay";
 };
 
 &pcie {
-	pinctrl-names = "default";
 	pinctrl-0 = <&pcie_bus &pcie_wlanen>;
+	pinctrl-names = "default";
 	vdd10-supply = <&ldo6_reg>;
 	vdd18-supply = <&ldo7_reg>;
 	assigned-clocks = <&cmu_fsys CLK_MOUT_SCLK_PCIE_100_USER>,
@@ -1064,14 +1067,14 @@ &ppmu_d1_general {
 
 	events {
 		ppmu_event0_d1_general: ppmu-event0-d1-general {
-		       event-name = "ppmu-event0-d1-general";
-	       };
+			event-name = "ppmu-event0-d1-general";
+		};
 	};
 };
 
 &pinctrl_alive {
-	pinctrl-names = "default";
 	pinctrl-0 = <&initial_alive>;
+	pinctrl-names = "default";
 
 	initial_alive: initial-state {
 		PIN_IN(gpa0-0, DOWN, FAST_SR1);
@@ -1154,8 +1157,8 @@ te_irq: te-irq-pins {
 };
 
 &pinctrl_cpif {
-	pinctrl-names = "default";
 	pinctrl-0 = <&initial_cpif>;
+	pinctrl-names = "default";
 
 	initial_cpif: initial-state {
 		PIN_IN(gpv6-0, DOWN, FAST_SR1);
@@ -1164,8 +1167,8 @@ initial_cpif: initial-state {
 };
 
 &pinctrl_ese {
-	pinctrl-names = "default";
 	pinctrl-0 = <&initial_ese>;
+	pinctrl-names = "default";
 
 	pcie_wlanen: pcie-wlanen-pins {
 		samsung,pins = "gpj2-0";
@@ -1181,8 +1184,8 @@ initial_ese: initial-state {
 };
 
 &pinctrl_fsys {
-	pinctrl-names = "default";
 	pinctrl-0 = <&initial_fsys>;
+	pinctrl-names = "default";
 
 	initial_fsys: initial-state {
 		PIN_IN(gpr3-0, NONE, FAST_SR1);
@@ -1194,8 +1197,8 @@ initial_fsys: initial-state {
 };
 
 &pinctrl_imem {
-	pinctrl-names = "default";
 	pinctrl-0 = <&initial_imem>;
+	pinctrl-names = "default";
 
 	initial_imem: initial-state {
 		PIN_IN(gpf0-0, UP, FAST_SR1);
@@ -1210,8 +1213,8 @@ initial_imem: initial-state {
 };
 
 &pinctrl_nfc {
-	pinctrl-names = "default";
 	pinctrl-0 = <&initial_nfc>;
+	pinctrl-names = "default";
 
 	initial_nfc: initial-state {
 		PIN_IN(gpj0-2, DOWN, FAST_SR1);
@@ -1219,8 +1222,8 @@ initial_nfc: initial-state {
 };
 
 &pinctrl_peric {
-	pinctrl-names = "default";
 	pinctrl-0 = <&initial_peric>;
+	pinctrl-names = "default";
 
 	initial_peric: initial-state {
 		PIN_IN(gpv7-0, DOWN, FAST_SR1);
@@ -1274,8 +1277,8 @@ initial_peric: initial-state {
 };
 
 &pinctrl_touch {
-	pinctrl-names = "default";
 	pinctrl-0 = <&initial_touch>;
+	pinctrl-names = "default";
 
 	initial_touch: initial-state {
 		PIN_IN(gpj1-2, DOWN, FAST_SR1);
diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
index 3e67d9091a19..0e89f4b814a7 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
@@ -93,8 +93,8 @@ core3 {
 		cpu4: cpu@0 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a57";
-			enable-method = "psci";
 			reg = <0x0>;
+			enable-method = "psci";
 			clocks = <&cmu_atlas CLK_SCLK_ATLAS>;
 			clock-names = "atlasclk";
 			operating-points-v2 = <&cluster_a57_opp_table>;
@@ -111,8 +111,8 @@ cpu4: cpu@0 {
 		cpu5: cpu@1 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a57";
-			enable-method = "psci";
 			reg = <0x1>;
+			enable-method = "psci";
 			operating-points-v2 = <&cluster_a57_opp_table>;
 			#cooling-cells = <2>;
 			i-cache-size = <0xc000>;
@@ -127,8 +127,8 @@ cpu5: cpu@1 {
 		cpu6: cpu@2 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a57";
-			enable-method = "psci";
 			reg = <0x2>;
+			enable-method = "psci";
 			operating-points-v2 = <&cluster_a57_opp_table>;
 			#cooling-cells = <2>;
 			i-cache-size = <0xc000>;
@@ -143,8 +143,8 @@ cpu6: cpu@2 {
 		cpu7: cpu@3 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a57";
-			enable-method = "psci";
 			reg = <0x3>;
+			enable-method = "psci";
 			operating-points-v2 = <&cluster_a57_opp_table>;
 			#cooling-cells = <2>;
 			i-cache-size = <0xc000>;
@@ -385,9 +385,9 @@ psci {
 
 	soc: soc@0 {
 		compatible = "simple-bus";
+		ranges = <0x0 0x0 0x0 0x18000000>;
 		#address-cells = <1>;
 		#size-cells = <1>;
-		ranges = <0x0 0x0 0x0 0x18000000>;
 
 		chipid@10000000 {
 			compatible = "samsung,exynos5433-chipid",
@@ -1005,13 +1005,13 @@ decon: decon@13800000 {
 				      "pclk_smmu_decon1x", "sclk_decon_vclk",
 				      "sclk_decon_eclk", "dsd";
 			power-domains = <&pd_disp>;
-			interrupt-names = "fifo", "vsync", "lcd_sys";
 			interrupts = <GIC_SPI 201 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 203 IRQ_TYPE_LEVEL_HIGH>;
-			samsung,disp-sysreg = <&syscon_disp>;
+			interrupt-names = "fifo", "vsync", "lcd_sys";
 			iommus = <&sysmmu_decon0x>, <&sysmmu_decon1x>;
 			iommu-names = "m0", "m1";
+			samsung,disp-sysreg = <&syscon_disp>;
 
 			status = "disabled";
 
@@ -1049,14 +1049,14 @@ decon_tv: decon@13880000 {
 				      "aclk_smmu_decon1x", "aclk_xiu_decon1x",
 				      "pclk_smmu_decon1x", "sclk_decon_vclk",
 				      "sclk_decon_eclk", "dsd";
-			samsung,disp-sysreg = <&syscon_disp>;
 			power-domains = <&pd_disp>;
-			interrupt-names = "fifo", "vsync", "lcd_sys";
 			interrupts = <GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 211 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "fifo", "vsync", "lcd_sys";
 			iommus = <&sysmmu_tv0x>, <&sysmmu_tv1x>;
 			iommu-names = "m0", "m1";
+			samsung,disp-sysreg = <&syscon_disp>;
 
 			status = "disabled";
 		};
@@ -1151,9 +1151,9 @@ hdmi: hdmi@13970000 {
 				      "oscclk", "i_spdif_clk";
 			phy = <&hdmiphy>;
 			ddc = <&hsi2c_11>;
+			#sound-dai-cells = <0>;
 			samsung,syscon-phandle = <&pmu_system_controller>;
 			samsung,sysreg-phandle = <&syscon_disp>;
-			#sound-dai-cells = <0>;
 
 			status = "disabled";
 		};
@@ -1479,8 +1479,8 @@ serial_0: serial@14c10000 {
 			clocks = <&cmu_peric CLK_PCLK_UART0>,
 				 <&cmu_peric CLK_SCLK_UART0>;
 			clock-names = "uart", "clk_uart_baud0";
-			pinctrl-names = "default";
 			pinctrl-0 = <&uart0_bus>;
+			pinctrl-names = "default";
 
 			status = "disabled";
 		};
@@ -1492,8 +1492,8 @@ serial_1: serial@14c20000 {
 			clocks = <&cmu_peric CLK_PCLK_UART1>,
 				 <&cmu_peric CLK_SCLK_UART1>;
 			clock-names = "uart", "clk_uart_baud0";
-			pinctrl-names = "default";
 			pinctrl-0 = <&uart1_bus>;
+			pinctrl-names = "default";
 
 			status = "disabled";
 		};
@@ -1505,8 +1505,8 @@ serial_2: serial@14c30000 {
 			clocks = <&cmu_peric CLK_PCLK_UART2>,
 				 <&cmu_peric CLK_SCLK_UART2>;
 			clock-names = "uart", "clk_uart_baud0";
-			pinctrl-names = "default";
 			pinctrl-0 = <&uart2_bus>;
+			pinctrl-names = "default";
 
 			status = "disabled";
 		};
@@ -1523,11 +1523,11 @@ spi_0: spi@14d20000 {
 				 <&cmu_peric CLK_SCLK_SPI0>,
 				 <&cmu_peric CLK_SCLK_IOCLK_SPI0>;
 			clock-names = "spi", "spi_busclk0", "spi_ioclk";
-			samsung,spi-src-clk = <0>;
-			pinctrl-names = "default";
 			pinctrl-0 = <&spi0_bus>;
+			pinctrl-names = "default";
 			num-cs = <1>;
 			fifo-depth = <256>;
+			samsung,spi-src-clk = <0>;
 
 			status = "disabled";
 		};
@@ -1544,11 +1544,11 @@ spi_1: spi@14d30000 {
 				 <&cmu_peric CLK_SCLK_SPI1>,
 				 <&cmu_peric CLK_SCLK_IOCLK_SPI1>;
 			clock-names = "spi", "spi_busclk0", "spi_ioclk";
-			samsung,spi-src-clk = <0>;
-			pinctrl-names = "default";
 			pinctrl-0 = <&spi1_bus>;
+			pinctrl-names = "default";
 			num-cs = <1>;
 			fifo-depth = <64>;
+			samsung,spi-src-clk = <0>;
 
 			status = "disabled";
 		};
@@ -1565,11 +1565,11 @@ spi_2: spi@14d40000 {
 				 <&cmu_peric CLK_SCLK_SPI2>,
 				 <&cmu_peric CLK_SCLK_IOCLK_SPI2>;
 			clock-names = "spi", "spi_busclk0", "spi_ioclk";
-			samsung,spi-src-clk = <0>;
-			pinctrl-names = "default";
 			pinctrl-0 = <&spi2_bus>;
+			pinctrl-names = "default";
 			num-cs = <1>;
 			fifo-depth = <64>;
+			samsung,spi-src-clk = <0>;
 
 			status = "disabled";
 		};
@@ -1586,11 +1586,11 @@ spi_3: spi@14d50000 {
 				 <&cmu_peric CLK_SCLK_SPI3>,
 				 <&cmu_peric CLK_SCLK_IOCLK_SPI3>;
 			clock-names = "spi", "spi_busclk0", "spi_ioclk";
-			samsung,spi-src-clk = <0>;
-			pinctrl-names = "default";
 			pinctrl-0 = <&spi3_bus>;
+			pinctrl-names = "default";
 			num-cs = <1>;
 			fifo-depth = <64>;
+			samsung,spi-src-clk = <0>;
 
 			status = "disabled";
 		};
@@ -1607,11 +1607,11 @@ spi_4: spi@14d00000 {
 				 <&cmu_peric CLK_SCLK_SPI4>,
 				 <&cmu_peric CLK_SCLK_IOCLK_SPI4>;
 			clock-names = "spi", "spi_busclk0", "spi_ioclk";
-			samsung,spi-src-clk = <0>;
-			pinctrl-names = "default";
 			pinctrl-0 = <&spi4_bus>;
+			pinctrl-names = "default";
 			num-cs = <1>;
 			fifo-depth = <64>;
+			samsung,spi-src-clk = <0>;
 
 			status = "disabled";
 		};
@@ -1651,10 +1651,10 @@ pwm: pwm@14dd0000 {
 				     <GIC_SPI 418 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 419 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 420 IRQ_TYPE_LEVEL_HIGH>;
-			samsung,pwm-outputs = <0>, <1>, <2>, <3>;
 			clocks = <&cmu_peric CLK_PCLK_PWM>;
 			clock-names = "timers";
 			#pwm-cells = <3>;
+			samsung,pwm-outputs = <0>, <1>, <2>, <3>;
 
 			status = "disabled";
 		};
@@ -1666,8 +1666,8 @@ hsi2c_0: i2c@14e40000 {
 			interrupts = <GIC_SPI 428 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
 			#size-cells = <0>;
-			pinctrl-names = "default";
 			pinctrl-0 = <&hs_i2c0_bus>;
+			pinctrl-names = "default";
 			clocks = <&cmu_peric CLK_PCLK_HSI2C0>;
 			clock-names = "hsi2c";
 
@@ -1681,8 +1681,8 @@ hsi2c_1: i2c@14e50000 {
 			interrupts = <GIC_SPI 429 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
 			#size-cells = <0>;
-			pinctrl-names = "default";
 			pinctrl-0 = <&hs_i2c1_bus>;
+			pinctrl-names = "default";
 			clocks = <&cmu_peric CLK_PCLK_HSI2C1>;
 			clock-names = "hsi2c";
 
@@ -1696,8 +1696,8 @@ hsi2c_2: i2c@14e60000 {
 			interrupts = <GIC_SPI 430 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
 			#size-cells = <0>;
-			pinctrl-names = "default";
 			pinctrl-0 = <&hs_i2c2_bus>;
+			pinctrl-names = "default";
 			clocks = <&cmu_peric CLK_PCLK_HSI2C2>;
 			clock-names = "hsi2c";
 
@@ -1711,8 +1711,8 @@ hsi2c_3: i2c@14e70000 {
 			interrupts = <GIC_SPI 431 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
 			#size-cells = <0>;
-			pinctrl-names = "default";
 			pinctrl-0 = <&hs_i2c3_bus>;
+			pinctrl-names = "default";
 			clocks = <&cmu_peric CLK_PCLK_HSI2C3>;
 			clock-names = "hsi2c";
 
@@ -1726,8 +1726,8 @@ hsi2c_4: i2c@14ec0000 {
 			interrupts = <GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
 			#size-cells = <0>;
-			pinctrl-names = "default";
 			pinctrl-0 = <&hs_i2c4_bus>;
+			pinctrl-names = "default";
 			clocks = <&cmu_peric CLK_PCLK_HSI2C4>;
 			clock-names = "hsi2c";
 
@@ -1741,8 +1741,8 @@ hsi2c_5: i2c@14ed0000 {
 			interrupts = <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
 			#size-cells = <0>;
-			pinctrl-names = "default";
 			pinctrl-0 = <&hs_i2c5_bus>;
+			pinctrl-names = "default";
 			clocks = <&cmu_peric CLK_PCLK_HSI2C5>;
 			clock-names = "hsi2c";
 
@@ -1756,8 +1756,8 @@ hsi2c_6: i2c@14ee0000 {
 			interrupts = <GIC_SPI 426 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
 			#size-cells = <0>;
-			pinctrl-names = "default";
 			pinctrl-0 = <&hs_i2c6_bus>;
+			pinctrl-names = "default";
 			clocks = <&cmu_peric CLK_PCLK_HSI2C6>;
 			clock-names = "hsi2c";
 
@@ -1771,8 +1771,8 @@ hsi2c_7: i2c@14ef0000 {
 			interrupts = <GIC_SPI 427 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
 			#size-cells = <0>;
-			pinctrl-names = "default";
 			pinctrl-0 = <&hs_i2c7_bus>;
+			pinctrl-names = "default";
 			clocks = <&cmu_peric CLK_PCLK_HSI2C7>;
 			clock-names = "hsi2c";
 
@@ -1786,8 +1786,8 @@ hsi2c_8: i2c@14d90000 {
 			interrupts = <GIC_SPI 443 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
 			#size-cells = <0>;
-			pinctrl-names = "default";
 			pinctrl-0 = <&hs_i2c8_bus>;
+			pinctrl-names = "default";
 			clocks = <&cmu_peric CLK_PCLK_HSI2C8>;
 			clock-names = "hsi2c";
 
@@ -1801,8 +1801,8 @@ hsi2c_9: i2c@14da0000 {
 			interrupts = <GIC_SPI 444 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
 			#size-cells = <0>;
-			pinctrl-names = "default";
 			pinctrl-0 = <&hs_i2c9_bus>;
+			pinctrl-names = "default";
 			clocks = <&cmu_peric CLK_PCLK_HSI2C9>;
 			clock-names = "hsi2c";
 
@@ -1816,8 +1816,8 @@ hsi2c_10: i2c@14de0000 {
 			interrupts = <GIC_SPI 445 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
 			#size-cells = <0>;
-			pinctrl-names = "default";
 			pinctrl-0 = <&hs_i2c10_bus>;
+			pinctrl-names = "default";
 			clocks = <&cmu_peric CLK_PCLK_HSI2C10>;
 			clock-names = "hsi2c";
 
@@ -1831,8 +1831,8 @@ hsi2c_11: i2c@14df0000 {
 			interrupts = <GIC_SPI 446 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
 			#size-cells = <0>;
-			pinctrl-names = "default";
 			pinctrl-0 = <&hs_i2c11_bus>;
+			pinctrl-names = "default";
 			clocks = <&cmu_peric CLK_PCLK_HSI2C11>;
 			clock-names = "hsi2c";
 
@@ -1841,6 +1841,7 @@ hsi2c_11: i2c@14df0000 {
 
 		usbdrd30: usb@15400000 {
 			compatible = "samsung,exynos5433-dwusb3";
+			ranges = <0x0 0x15400000 0x10000>;
 			clocks = <&cmu_fsys CLK_ACLK_USBDRD30>,
 				 <&cmu_fsys CLK_SCLK_USBDRD30>,
 				 <&cmu_fsys CLK_PHYCLK_USBDRD30_UDRD30_PHYCLOCK>,
@@ -1848,17 +1849,16 @@ usbdrd30: usb@15400000 {
 			clock-names = "aclk", "susp_clk", "phyclk", "pipe_pclk";
 			#address-cells = <1>;
 			#size-cells = <1>;
-			ranges = <0x0 0x15400000 0x10000>;
 
 			status = "disabled";
 
 			usbdrd_dwc3: usb@0 {
 				compatible = "snps,dwc3";
+				reg = <0x0 0x10000>;
 				clocks = <&cmu_fsys CLK_SCLK_USBDRD30>,
 					 <&cmu_fsys CLK_ACLK_USBDRD30>,
 					 <&cmu_fsys CLK_SCLK_USBDRD30>;
 				clock-names = "ref", "bus_early", "suspend";
-				reg = <0x0 0x10000>;
 				interrupts = <GIC_SPI 231 IRQ_TYPE_LEVEL_HIGH>;
 				phys = <&usbdrd30_phy 0>, <&usbdrd30_phy 1>;
 				phy-names = "usb2-phy", "usb3-phy";
@@ -1895,6 +1895,7 @@ usbhost30_phy: phy@15580000 {
 
 		usbhost30: usb@15a00000 {
 			compatible = "samsung,exynos5433-dwusb3";
+			ranges = <0x0 0x15a00000 0x10000>;
 			clocks = <&cmu_fsys CLK_ACLK_USBHOST30>,
 				 <&cmu_fsys CLK_SCLK_USBHOST30>,
 				 <&cmu_fsys CLK_PHYCLK_USBHOST30_UHOST30_PHYCLOCK>,
@@ -1902,17 +1903,16 @@ usbhost30: usb@15a00000 {
 			clock-names = "aclk", "susp_clk", "phyclk", "pipe_pclk";
 			#address-cells = <1>;
 			#size-cells = <1>;
-			ranges = <0x0 0x15a00000 0x10000>;
 
 			status = "disabled";
 
 			usbhost_dwc3: usb@0 {
 				compatible = "snps,dwc3";
+				reg = <0x0 0x10000>;
 				clocks = <&cmu_fsys CLK_SCLK_USBHOST30>,
 					 <&cmu_fsys CLK_ACLK_USBHOST30>,
 					 <&cmu_fsys CLK_SCLK_USBHOST30>;
 				clock-names = "ref", "bus_early", "suspend";
-				reg = <0x0 0x10000>;
 				interrupts = <GIC_SPI 244 IRQ_TYPE_LEVEL_HIGH>;
 				phys = <&usbhost30_phy 0>, <&usbhost30_phy 1>;
 				phy-names = "usb2-phy", "usb3-phy";
@@ -1922,10 +1922,10 @@ usbhost_dwc3: usb@0 {
 		mshc_0: mmc@15540000 {
 			compatible = "samsung,exynos5433-dw-mshc-smu",
 				     "samsung,exynos7-dw-mshc-smu";
+			reg = <0x15540000 0x2000>;
 			interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
 			#size-cells = <0>;
-			reg = <0x15540000 0x2000>;
 			clocks = <&cmu_fsys CLK_ACLK_MMC0>,
 				 <&cmu_fsys CLK_SCLK_MMC0>;
 			clock-names = "biu", "ciu";
@@ -1937,10 +1937,10 @@ mshc_0: mmc@15540000 {
 		mshc_1: mmc@15550000 {
 			compatible = "samsung,exynos5433-dw-mshc-smu",
 				     "samsung,exynos7-dw-mshc-smu";
+			reg = <0x15550000 0x2000>;
 			interrupts = <GIC_SPI 226 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
 			#size-cells = <0>;
-			reg = <0x15550000 0x2000>;
 			clocks = <&cmu_fsys CLK_ACLK_MMC1>,
 				 <&cmu_fsys CLK_SCLK_MMC1>;
 			clock-names = "biu", "ciu";
@@ -1952,10 +1952,10 @@ mshc_1: mmc@15550000 {
 		mshc_2: mmc@15560000 {
 			compatible = "samsung,exynos5433-dw-mshc-smu",
 				     "samsung,exynos7-dw-mshc-smu";
+			reg = <0x15560000 0x2000>;
 			interrupts = <GIC_SPI 227 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
 			#size-cells = <0>;
-			reg = <0x15560000 0x2000>;
 			clocks = <&cmu_fsys CLK_ACLK_MMC2>,
 				 <&cmu_fsys CLK_SCLK_MMC2>;
 			clock-names = "biu", "ciu";
@@ -1985,12 +1985,12 @@ pdma1: dma-controller@15600000 {
 		audio-subsystem@11400000 {
 			compatible = "samsung,exynos5433-lpass";
 			reg = <0x11400000 0x100>, <0x11500000 0x08>;
+			ranges;
 			clocks = <&cmu_aud CLK_PCLK_SFR0_CTRL>;
 			clock-names = "sfr0_ctrl";
 			power-domains = <&pd_aud>;
 			#address-cells = <1>;
 			#size-cells = <1>;
-			ranges;
 
 			adma: dma-controller@11420000 {
 				compatible = "arm,pl330", "arm,primecell";
@@ -2016,8 +2016,8 @@ i2s0: i2s@11440000 {
 					 <&cmu_aud CLK_SCLK_I2S_BCLK>;
 				clock-names = "iis", "i2s_opclk0", "i2s_opclk1";
 				#clock-cells = <1>;
-				pinctrl-names = "default";
 				pinctrl-0 = <&i2s0_bus>;
+				pinctrl-names = "default";
 				power-domains = <&pd_aud>;
 				#sound-dai-cells = <1>;
 
@@ -2031,8 +2031,8 @@ serial_3: serial@11460000 {
 				clocks = <&cmu_aud CLK_PCLK_AUD_UART>,
 					 <&cmu_aud CLK_SCLK_AUD_UART>;
 				clock-names = "uart", "clk_uart_baud0";
-				pinctrl-names = "default";
 				pinctrl-0 = <&uart_aud_bus>;
+				pinctrl-names = "default";
 				power-domains = <&pd_aud>;
 
 				status = "disabled";
@@ -2042,22 +2042,24 @@ serial_3: serial@11460000 {
 		pcie_phy: pcie-phy@15680000 {
 			compatible = "samsung,exynos5433-pcie-phy";
 			reg = <0x15680000 0x1000>;
+			#phy-cells = <0>;
 			samsung,pmu-syscon = <&pmu_system_controller>;
 			samsung,fsys-sysreg = <&syscon_fsys>;
-			#phy-cells = <0>;
 
 			status = "disabled";
 		};
 
 		pcie: pcie@15700000 {
+			device_type = "pci";
 			compatible = "samsung,exynos5433-pcie";
 			reg = <0x15700000 0x1000>, <0x156b0000 0x1000>,
 			      <0x0c000000 0x1000>;
 			reg-names = "dbi", "elbi", "config";
+			ranges = <0x81000000 0 0	  0x0c001000 0 0x00010000>,
+				 <0x82000000 0 0x0c011000 0x0c011000 0 0x03feefff>;
 			#address-cells = <3>;
 			#size-cells = <2>;
 			#interrupt-cells = <1>;
-			device_type = "pci";
 			interrupts = <GIC_SPI 245 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cmu_fsys CLK_PCIE>,
 				 <&cmu_fsys CLK_PCLK_PCIE_PHY>;
@@ -2066,8 +2068,6 @@ pcie: pcie@15700000 {
 			num-viewport = <3>;
 			bus-range = <0x00 0xff>;
 			phys = <&pcie_phy>;
-			ranges = <0x81000000 0 0	  0x0c001000 0 0x00010000>,
-				 <0x82000000 0 0x0c011000 0x0c011000 0 0x03feefff>;
 
 			status = "disabled";
 		};

-- 
2.53.0


