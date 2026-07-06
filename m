Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A157C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 09:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Sq1VYR8QdKW5RsRumCdfXDEFCCXjk7aw1b4GqYiBAHs=; b=A9bvO3ZNVAYNuX2AbsxQVCQ89z
	SKJ/0XlS7ddaG6ZUdELoLCZ/2176Jk41D9TrTTzEFXuhp1aarNEu+Us+wz3OHVNQtnmqx610ty8MA
	zHhThHvkXr3JcEV9aPKtekrLw9IC/ja0GY80nNzbEkPyRz0IPRbqGC72Uf/bW9OYpdy7uNst4OE2o
	UxbzkFFkYoq2LOLjMi7MOkrjVsXAB17hWFHcQNyBmhXWLv9y/D+ZKWPc32sPbBME1A0TxAQ8cdvrN
	aHpzw6IF+Za+5x9HFT2pYUXXZlkvG89rkuq+K3E8rN6WhtbOGAVgVODGadu3s/hd8UuD3LoDZiP9H
	TAghrMpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfjy-0000000C4Bu-1lJ8;
	Mon, 06 Jul 2026 09:35:50 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfjX-0000000C3e1-0JsR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 09:35:24 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66694GU4142727
	for <linux-arm-kernel@lists.infradead.org>; Mon, 6 Jul 2026 09:35:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Sq1VYR8QdKW5RsRumCdfXDEFCCXjk7aw1b4
	GqYiBAHs=; b=I/fOS7IlgjnHg9OS4LvfruJbJyxMS48/9BfouuJaWp023okk2rr
	vFKA/8JPRnoG/SU55vl6u2fpzTZotJvyNoANmTG5Nwk05mnxgIuM1G5WEB0Ef78Y
	7r9v3z1yLg7o8uGKMDOdz4t6XI3bGVQFjHJ83ey0298FdLirVtljqpxxiS08l23h
	w4B41+m3ZcNc+zkFSL/dNMj9EzODPWhYMVneP3T5/Tnqn57tYx45oayo/U2hRMUr
	sOxcb/W0QwpoPYYfFiJg9YW5p4daF5kb3KvJMgYFD/0EVYWQUFAVuOAmphR1Fbzm
	XocodlUCiveYEvf/3Hn8d4zPhbGopJ/c1ww==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6s4swpb5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 09:35:22 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e4f27f49bso212899685a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 02:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783330522; x=1783935322; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Sq1VYR8QdKW5RsRumCdfXDEFCCXjk7aw1b4GqYiBAHs=;
        b=W9lC5GSIHYWo97MiFtreOBpWRbQhgkyBQvKWMyKFUEj/9wyqTa2f3+Wmnt+VR8nYK6
         djOQQP8x1woZSshnjShS7iYLRgqb1gZ2JlRfzFHUowRz2lGgGZbj/YMuiIY1tvFLsYHy
         PEzY0hDzumzOIIyjHvlrcAMFVWCOOkq5cYXTJgVAPElpD0snqtjEBHtU3VhbB3N2FwnX
         HPfOsuMKI/1dF/dOfa0atQ1u4HR4JgRRt8kNsF+d7dR47bvEa1tAhT4artURN1dSawh9
         FL58WJnwTfQe//QC4+p52nEz6yDxxQ25VpygXOvoNCONDcw8hmszwnd1SsqagTDHlUPe
         hrOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330522; x=1783935322;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sq1VYR8QdKW5RsRumCdfXDEFCCXjk7aw1b4GqYiBAHs=;
        b=ZfPLT14mZem5RNBL05Uy3Xc0Dq62aRL40th6wbsj8Tg9y6K3d4OHl64TWJlovvP/zF
         cQH9OsYd9lZ4XI7VIcvX1CMfU87o9+JyHEiqiewSE8GH6ZkvHPlfMsvbXTO9Km5lJR/L
         D9nAvIKMwz795tNg0c0PE/9ibl9583zcY6rJPLIpI+lTkh9Nb+QGDL4/0fihjHgZQ0x0
         9kTZWwmFsCQBHXxylcNxQHnEfGyVrNXVTWQySaOUPnQhw3uI/XLOa+jTMYD+U/WRTs2n
         MuN+/21s19CZUUuRI7M1kwyCZpcGpxwyDJbf+1AB3UKmVXqzmpv4dGYJLc4NewtZyIzq
         Wufg==
X-Forwarded-Encrypted: i=1; AHgh+Rr0TyXo/HahC9X0/TfvMDnW6gD/8WA3gpuq9lZKQX1bOn0PeVGy1KDZP+hbpQ7FlL/JR6RGKb/07A9rQeWpE5uf@lists.infradead.org
X-Gm-Message-State: AOJu0YygbduP0CJPmSFsODZBq01ZygxtZLlpjLWmJKGuu12RKoJBS0Ug
	kRFbMHoU71dYrfkRz5pYaLMVWx4/Al/MYRi99XyLSNqzCpKF7VMH5dfBcqzt8r9Hi/CCfOi5IJE
	29kvGeRpbr+n2cJ8kzFafFsuh0HEQf1v0rTpOqA8t3zhyUxsyR8HjsaTRp6HT1l030VMNTWX4y4
	/wSg==
X-Gm-Gg: AfdE7ckJfZGFCtEndbqVHvqkTXwLzuj8VyTwolnvF61LXxjZi5QUtzkZ0hnIBZHClYf
	xa6kwN/46ST+EA4B1vijQNIB0Jb60C5YvWTUK58IpqHcV4DWNmnhxYR3+/+GBWtSQujya2saF8h
	nSiuWuds1PPaNcYoqIAf3GSsgaUV6idCBe7VqTLSvBySvNabn8E/dCn022bp6+iseL8qkjJq6ag
	DpolMTrmUe8TRzwIrWHx9Hle1L+QGcKzaWa5RZTiBpqCopRV/CEF7Eudv7bIvb/S6WXEUTUGetp
	YKHe2y9QFRgrUQJuaey2aD/u14an1CgzkELou7AobNQuOZZhNuC6bOH7MlJUIklvP9lI1kZCDRK
	D4rvFEPaT9e9ih5AIDo4WvE8aAf8=
X-Received: by 2002:a05:620a:4147:b0:92e:61f7:5689 with SMTP id af79cd13be357-92e9a4cb130mr1279218785a.58.1783330521066;
        Mon, 06 Jul 2026 02:35:21 -0700 (PDT)
X-Received: by 2002:a05:620a:4147:b0:92e:61f7:5689 with SMTP id af79cd13be357-92e9a4cb130mr1279216085a.58.1783330520590;
        Mon, 06 Jul 2026 02:35:20 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1d910sm22617247f8f.6.2026.07.06.02.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:35:19 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: mediatek: Correct indentation and whitespace
Date: Mon,  6 Jul 2026 11:35:16 +0200
Message-ID: <20260706093515.274013-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2456; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=Gu2Qec0Cn8DBi5/qAoJJnBoS4AYcVox7BuSwo0xqLZM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqS3bTE0sRZsosY8Pg+hWL2hzWUh4qO4z1kjx3N
 D63xTaeqJyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakt20wAKCRDBN2bmhouD
 12ldD/9XA8/SNVf77cSeM7jZjnFX+aZRuKcZO6CGCd12ecOe1wezd/sW96N0RLOJJqkukXApRr7
 GQ73TULuem21DP2O+ATMlWUOdAY+Hfc2qnRAPSdwa+TwzsTAlEHj4IWV3jcRbVIEsvc97uMykF8
 Y8jP2/YN+JSAGXeuNHyyvEVqjZJfviYah0ucfUGDN3DOtpmyCpSqee5yQad6mR9rM+snc1wweui
 iaaO9QFI7JaaGSyTKijb1G9OshV5wlaJE8Z7awW0M3xkJqV/WSOOq6M9z93LOfO+9coOBdGhbbx
 fgkWyEysWsFiqJVNNsLe0g5fCLyQiP1+bBxQkujVoT529SmtCqlYESRjzMgfcBqaT2WcpU4FD2K
 cvAjG3b+gVJD8bAxj6mMV+ywMfTFH310oQchxMz1KWiF/AdenKk1+b//bvAmA8hh8TiKInmqH2D
 BXB481uPSOVKDN/k+dwZnTwXk+lbgddmpmM1YXOVoyS9dMtGwSpt7Z6QqpE4azAe4wLOSHd1b2A
 /9/p8VmIhL5e0X1BR56quhzrUU3Qj2yuBqb1Qq+iW7NTrwFlDRr66AnQ0IT+098ifZwa2m4ZKPT
 afLkoPvMnwjaZmnNWWiYoxqFBuVSt04MSWbyPvBtkPDGVr3UbwKH9joBGigcUtwkXwc0UyGf9yS SCE+ACOybxX99Dg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA5NiBTYWx0ZWRfX5F48flhvBQXJ
 Jyk3kTQXUz72aldkPqs5hZQOacf+njoRNPFhSzAXMAicdx5wQBts+/rriaa9W10UQwuKNNT6LAX
 J9KujAmnXQxOn4XXQykbFZwmtMHn7zE=
X-Proofpoint-ORIG-GUID: bX_JCWUuqIPrv2U4EKB_TBayPVhoV1vn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA5NiBTYWx0ZWRfXzGFyMvL26Rt9
 ykvDlXM01Cl8PtxlTtLH97mgFXaJTMHVkKxBIg8GZBdhFaEi6RQAiuhjftiiYWgua7b4UjFk8x7
 W3wx6Y+5zbUzp8xuTs5DU09Y0HtZvYsmHAxJJlSF572KRtveV7N+HSt65zVoG5ESXtfezQXnDja
 xzTMI6D1WBv/IZZEUSwZjmxBm/P70PVzpTxxaei5G49f8BOu/2FOdSXSdI1eX+48chyNLpFo0T+
 57cMwa0pamLiuF2i3KbmrSYkU+5SzddS4vR9V/5miyLHbQfhsM6GT01aWv9GMYTW2QGJtdoNTBe
 zzwkRExtz8ZPGlF2iGjC96TRDtTD0tUZIjULLQ6sl6cULbGUjmNphUiiwrwzwWDp16Lqr4lK44S
 q4VGlL64dju8Io7oD1o/NxDTcdvLFe65Yafd0Mf6qtaddloAxxBG6mglb50IhHyfRj/U+/Qm9Xe
 E3LSNvlF7kUGoTr8mmQ==
X-Proofpoint-GUID: bX_JCWUuqIPrv2U4EKB_TBayPVhoV1vn
X-Authority-Analysis: v=2.4 cv=ZfQt8MVA c=1 sm=1 tr=0 ts=6a4b76da cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=QX4gbG5DAAAA:8 a=xiN1gQym_Li_Z0aoeM4A:9 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060096
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_023523_136195_87202CCB 
X-CRM114-Status: GOOD (  15.84  )
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

Correct spaces or mix of tabs+spaces into proper tab-indented lines and
remove other whitespace violations.  No functional impact (same DTB).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi      | 6 +++---
 arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dts | 4 ++--
 arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi      | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi
index b702ff066636..b210845277e1 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi
@@ -86,7 +86,7 @@ touchscreen: touchscreen@10 {
 };
 
 &i2c2 {
-        pinctrl-names = "default";
+	pinctrl-names = "default";
 	pinctrl-0 = <&i2c2_pins>;
 	status = "okay";
 	clock-frequency = <400000>;
@@ -101,7 +101,7 @@ eeprom@58 {
 };
 
 &i2c4 {
-        pinctrl-names = "default";
+	pinctrl-names = "default";
 	pinctrl-0 = <&i2c4_pins>;
 	status = "okay";
 	clock-frequency = <400000>;
@@ -381,5 +381,5 @@ &qca_wifi {
 };
 
 &i2c_tunnel {
-        google,remote-bus = <2>;
+	google,remote-bus = <2>;
 };
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dts
index 095279e55d50..cc8c913d2763 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dts
@@ -19,6 +19,6 @@ / {
 };
 
 &panel {
-        status = "okay";
-        compatible = "boe,tv101wum-nl6";
+	status = "okay";
+	compatible = "boe,tv101wum-nl6";
 };
diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
index b0c97930a0e6..ce27f314d19d 100644
--- a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
@@ -7,7 +7,7 @@
  *
  * Copyright (C) 2025 Collabora Ltd.
  *                    Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
- *                    AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>   
+ *                    AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
  */
 
 #include "mt6365.dtsi"
-- 
2.53.0


