Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 020C1C61DCB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Aug 2026 19:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aIEddcMaVEtvM/kP0tRNHftSi/RKbVZ0ZELnu5QLbhs=; b=XwQfy3kGyZtesnDvyL2RqK97GT
	Bj3wqWWG1U0MB552lnzwrrgFRU7R6mczs33tIdKdx2rGEY7iz85wv9KrTJithoXKzym8wkQcf1qM2
	lKx5CZReegy3zeIL8TJFtkmIfC/5bhnH81xnMD7aossaunYL6/PT5wtiQiMb+Qnyv2NxoaRJWNaqI
	PNGQokKTl+BpDgNxC3TatpYf1taCCrV7VtS+IT7yYrNTrJwqN8Es5ArKT7JBHrEkINaEaw+USojTt
	zDWvA3vPPmX0DgE22HIzHOp65Km6G4r7KFoBcYNpLjLX30vSna9deDTHu0LmBbpZ7PXylvy/pVboo
	+tnWTA0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0Ou8-00000007FwU-2hLb;
	Sat, 29 Aug 2026 19:39:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0Ou6-00000007Fve-0GSi
	for linux-arm-kernel@lists.infradead.org;
	Sat, 29 Aug 2026 19:39:51 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67TIF0iE2009307
	for <linux-arm-kernel@lists.infradead.org>; Sat, 29 Aug 2026 19:39:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=aIEddcMaVEtvM/kP0tRNHftSi/RKbVZ0ZEL
	nu5QLbhs=; b=CnBp7+tSe/UvqzdYeytpsNJFAF8gsSVg2Bc30CaibssYfzFsAln
	xC22heBRDcILnMbF18KgxN9bAadR58xegwUoA7FixVCY+zChKiQ/4+hvxL9VchIb
	hJuFxYo46GwLP+xnAFpPo8ADVobkOSOrz8H09mGhzfAwHo86eiex0LQqNyTLIsEc
	JnKP+rsin1wkgjCuFnYBwXjR1RxvC8MzoAxh/MlN/dT/YRzryhICy9au7/7iLtuJ
	MqfL211WQMetqbQ3Sdc44HH2tkMJHfO+1xeKiEURgaLdaUHDD/70WP7Lpau1bKWc
	XP9ZVeGGtGg56u7hqfWG8mRcylvtPQDEgKw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbr6dsj14-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 29 Aug 2026 19:39:49 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52ffe24490bso13894131cf.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 29 Aug 2026 12:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788032389; x=1788637189; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aIEddcMaVEtvM/kP0tRNHftSi/RKbVZ0ZELnu5QLbhs=;
        b=eCjlF981d1FDp7jPlr2QD0C0tiLV/q5zHraiKoJZV0Du7aFcQAWIrtjAjF7PsQK4Zm
         Q6AFUfy3R7aMUn9wBFvnU4t4jxCANK8iUzCFmtWeVXagXRJUQ9hzbVZ0F0MY8s6yO21a
         Zrg64/XxmunaQUuJbznRUxkcDvGd7OCBQW/Opa+b6kVebSe34Nt+QXGh2KmML7SQg0A8
         kB31ppl85jBFcbpZWmEZv0LAk/o9LyaOjQmv66d8aoj2TVk5f3+dOlbqebRLiL4t7wpx
         9qdhFd23/5h8ebQBV9Hg8R3JoPb1cGJjpXxb9VSeoiIir7bgapVaa6Oj2sKVg7Mxi3uT
         VNjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788032389; x=1788637189;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aIEddcMaVEtvM/kP0tRNHftSi/RKbVZ0ZELnu5QLbhs=;
        b=eYewsFwESAxhEiqDImhnYoQjaYpFEGzUM3wT6kJh0vwh9cDW0+8vpT4d4sJRL8wNaB
         uI0y31FmkmJcEXWDlE0Ajq86goLBrHjLIxhMXMOK18FysBU1I2P4kui5wJvIS0nPL9mb
         K0u97JITZRDs+hatz7g9g7KZDSH/adqo4OFwDyEXTouP4xDgTkcC6aFvwHvZ7MBJmBcv
         mTPvGIkhhsOE4brY8Pi/PludjDtCkOTEZZxZ/WXKz8RjhWTMnTvj93ls2rKJ2yxD1P9G
         wSJco6RvwCMP77Y2bJ64GMOaK2oLAnZf7F/xlEui+VzDThjZnFckrjD54m5hB78GhpRP
         Ne1A==
X-Forwarded-Encrypted: i=1; AHgh+Rp7o9BWIY2UOXreBeW1QxHG2SAhOHEiCyi/uvjpZ6xAwFpD/Adl4VmnV6yRFu83nljVuH7gCFvQb3i/SJY7yGRI@lists.infradead.org
X-Gm-Message-State: AFuF++lqmo87YBcdYIHoRk7F9vNsDZOCjMJ7NICfa0QAKcHXOwOgoGIF
	laFIw/Ld1ZcWbJs52fYyBevkcqxweTDsVLDnlI6MTdG5O4G4C/43seZLWAbyD63GbphQRTqAaXM
	CEPEojU/De2tTRGOPuDQ3nFU44VAxG9T9FZUSI+IrUbzHo3f7NLzgoJ3UVusLmunKbjSXuOKih1
	LPZA==
X-Gm-Gg: AR+sD13t0nDyxtPZIAPbBWaXFtT7NaldTH+z+ojLI6Ockd42lYqcZMAkCr+QW/836zX
	N0mxA1f7G7dM37AB86CF2Dh+lDgQmXPqypPqmpntAqDvq8piVitGGUcW9eefk2LQF+2QKAVu4bh
	8mYRxuvOnKwF1FShNIqntibfEGro1M81qbxftSvqrG9L7LvvabF8fe65yKPUuBt8sAlEVhdLBmS
	ZdxTV5k9IIhYjxlwwOum0oL8nK8yWVAGZjqdNVNmTTjY8f2DJ3pgfKJrHXmK+JTbqG0ODCH64w5
	BRWkUhuUlzOAczkXM432oPQ7sHR/xk7r34ojdZCvlQOiII1D2TIu0sqKsLZ5Ls+iWepf87CGopG
	997eb+3QNWHWPVqM=
X-Received: by 2002:a05:622a:c17:b0:52e:f66:f1a4 with SMTP id d75a77b69052e-52fb96bb480mr178780711cf.38.1788032388533;
        Sat, 29 Aug 2026 12:39:48 -0700 (PDT)
X-Received: by 2002:a05:622a:c17:b0:52e:f66:f1a4 with SMTP id d75a77b69052e-52fb96bb480mr178780321cf.38.1788032388074;
        Sat, 29 Aug 2026 12:39:48 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b94dc0f57sm174807485e9.2.2026.08.29.12.39.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 12:39:47 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: amlogic: Replace spaces indentation with tabs
Date: Sat, 29 Aug 2026 21:39:40 +0200
Message-ID: <20260829193939.107564-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2956; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=Bg2i0c/hAjhdv9OIKOQ6pDZgOaY5zMut7G6FhJaYG68=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqkzV77bAJ3qccs3sw500Sm2xe0TUu8z8dDjiW9
 3F1wLWCHuKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCapM1ewAKCRDBN2bmhouD
 10hpD/91mk7c+0AJooUZdmo355ku4hNXWU+jRxVsS0RNOaDWsP8SI9t7BbFTVkk6EROq0bP0iA9
 LH+T3U0CGceCSauGFZbhZX4kgJ/1951Kw09YgYsZFjlAN1rkAZB+wycblUaqRXPkXK3qLR6W2Pi
 GqQsNl3+4JvlH13PdLlWKfUv/3Xrzd0z3UqfI5TbIhAkoR7hWQiOvJ2c269lxpWyUeUFpBa5AqE
 XjWFUBZ+mUvX0ZhTwBNyn3dC19tDevCClfNZ/07gSF1URpp3IuQdA4hj2EksLXFmGR2+HSqNI1i
 m+eivVQYhEB81N673Hcr3/zwuzP0mCVSIRB7AgskTcIag4USB2nnSeyj3pV2ywk/WsbGazRV/4a
 JsXeO6WIps2gE0HK3PWnwo1gIj7WddjZtDhzrRo4VPyiVzWo0OzUAMLkv+r4cakh2XtQw1/ObaC
 ZUtRvl4YzmP0FXA9umY/tDfdpekvvzuAfwDwLCH8nNPCUyF4YxvpLLdzF6n/5VKqUe/8lhq6Hmy
 G2c3gcwlL8+9XhEw09xgGmF5uMvwS+j7qsFChYJkUISElgXnd3jvZPKcugMM9jIc031xSIINGu3
 hasmp1zT/gh2ApbVAOsw6PQcqAmiWJRkW0uPl7iWaCuXcaRK1ccOV7iM90AB3In0onZqcMhk1Y4 3rE1vEQdrLTmphg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI5MDE3MCBTYWx0ZWRfX2un4Q9omymDE
 Z+8xy6PvWFlmHCqU8T+w2svJO7CyAVoePwzeC/WN4bGISP6WNW8Vk8DcM8UooYHRM8vDf9nT2fb
 QgfsrFqrS8bidRmereFInBxy/jVdPVasXVEBrODSasye7ryjrUDmnXYQbarSWu58pIQlMhnsW5w
 mX42fjP3ld6+8wE1/bbS5yOrS+pgMV8aKAE3jGqvokrv+oC0cv1I5E7D8Mo+msB4vrSeBKgIyBA
 AzWFgjzqCe+Ho1rrK8a4dLy/yW6PhxY0eO1XdvXxqir4QYRJGwXuo2+huSS8fq1oVoCakYzYktV
 g1A0Av0SrvDsFR3hjSj1nXgJjiPS6FujNU6tvIV4/jryNIAJRN7dKmoLRo29KxatHRuV6iaOx4o
 ockhKeaZBjSpyteZJSQ0GDu7W6m5W8/oI9uvlEFOP37pDWtEezAN/uLyKRPmiBsLD5GbRBmrplM
 ByaKnAhBK5nFnSoZfmg==
X-Proofpoint-GUID: gRzqg2rsRzQ5gzQHchFkmmv7gkUiNI4_
X-Authority-Analysis: v=2.4 cv=Zakt8MVA c=1 sm=1 tr=0 ts=6a933585 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=2LxfJNKA3dIR6THBljEA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI5MDE3MCBTYWx0ZWRfX9PvBDE7R/ICG
 GGfhRw4q+L7MxoIfsKR/BYTPz/wXSFPGzsGBNyw40UVat0JXyzUJj6efs/COUYx2V5WGCLoMdbh
 4nWkk0RaYAZ3TJdoxrhhixnsy7t7LAI=
X-Proofpoint-ORIG-GUID: gRzqg2rsRzQ5gzQHchFkmmv7gkUiNI4_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-29_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608290170
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260829_123950_109086_7221AD5A 
X-CRM114-Status: GOOD (  13.95  )
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

Replace excessive spaces for aligning indentation into tabs.  This will
be reported by dt-style-check ("[mixed-indent-chars] too many space
characters in indent (more than 7)").

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts | 2 +-
 arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts       | 2 +-
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi                | 2 +-
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi                 | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts
index cac73c59a94f..348baa4e6d84 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts
@@ -608,7 +608,7 @@ &periphs_pinctrl {
 	keypad_gpio_pins: keypad-gpio-state {
 		mux {
 			groups = "GPIOX_0", "GPIOX_1", "GPIOX_2", "GPIOX_3",
-			         "GPIOX_4", "GPIOX_5", "GPIOX_6", "GPIOX_7",
+				 "GPIOX_4", "GPIOX_5", "GPIOX_6", "GPIOX_7",
 				 "GPIOX_8", "GPIOX_9", "GPIOX_10", "GPIOX_11",
 				 "GPIOX_12", "GPIOX_13", "GPIOX_14",  "GPIOX_15",
 				 "GPIOX_16", "GPIOX_17", "GPIOX_18",  "GPIOX_19";
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts
index 5d9ddb814164..e353f0ed2b49 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts
@@ -70,7 +70,7 @@ vddio_tf: regulator-vddio-tf {
 		gpios-states = <0>;
 
 		states = <3300000 0>,
-		         <1800000 1>;
+			 <1800000 1>;
 
 		regulator-settling-time-up-us = <100>;
 		regulator-settling-time-down-us = <5000>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
index a9c830a570cc..5c2fe9dc4f80 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
@@ -781,7 +781,7 @@ &pwrc {
 		      "dvin", "rdma", "venci", "vencp",
 		      "vdac", "vdi6", "vencl", "vid_lock";
 	clocks = <&clkc CLKID_VPU>,
-	         <&clkc CLKID_VAPB>;
+		 <&clkc CLKID_VAPB>;
 	clock-names = "vpu", "vapb";
 	/*
 	 * VPU clocking is provided by two identical clock paths
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
index d5e0f72892f8..f257fe3860f7 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
@@ -851,7 +851,7 @@ &pwrc {
 		      "dvin", "rdma", "venci", "vencp",
 		      "vdac", "vdi6", "vencl", "vid_lock";
 	clocks = <&clkc CLKID_VPU>,
-	         <&clkc CLKID_VAPB>;
+		 <&clkc CLKID_VAPB>;
 	clock-names = "vpu", "vapb";
 	/*
 	 * VPU clocking is provided by two identical clock paths
-- 
2.53.0


