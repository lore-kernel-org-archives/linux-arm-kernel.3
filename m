Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18244E6F095
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 15:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8yJY8kd69tc7nNmZhj/AWb+BwQZUtdfMzpFRn7v2mj4=; b=JuVok2pqAR9O49etZMCloFP97z
	7608vve6y/g+u2wRaMJnH/vVVlqqrq9EavFEwOpIQBHP9H0UOPet1FDs2mAKpE0RX5FmWELLXVxNz
	r1hLufchiIUThwuBruJJ0ZbfVoLiNhEc07bGsJuMUxLmfcx5X3pBKl+B/bRJ2xrcdCtQ5xDrfXR3U
	oSqJz8DDMFOCgLeFT5TQEdixotKcW2R5Zti08KRvQ+An6UgYR/XsteTrsqdMfPxbZ+MXzomuFp/p8
	GWf02FchBogh4hPyJT3op0PFVMUlPRBG5h7s4UAxtdngZ3wxtEr/d8xWZ1hQME846cJOWE/wdYTer
	KMTYgXrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY4Gf-0000000FgON-2q4e;
	Tue, 23 Dec 2025 15:25:45 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY4Gc-0000000FgLL-174M
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 15:25:44 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN935kt2747194
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 15:25:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=8yJY8kd69tc7nNmZhj/AWb+BwQZUtdfMzpF
	Rn7v2mj4=; b=cgqsHLPBznggp4/sSPr5y8CgdDH9lUh6vEaDZ+/pCkVwX78CI8b
	sNhwMeWzi/nwW80DvYBjKRQiqqdRmOrYr1lklhxwyXAA4uxRiTMsHYb5LaM6KQBD
	5pmHKq8lE2KIKiud9pNV+0i+ioAGAzgX0Eb7JBWgvwotmdd5K9CMlqLmBzTI88dZ
	cmqt71uXfQW/1Ms+sqy9qQg/ivJeExt3VEEv70Elvbcz5OylFTAuxPwLv0SFFC2r
	/0q+tRdWxaA0qnaNSlnqecgJNzeVq7ddw5AKHaJNGIbdHDZP7oev1RCjKfW6+4SI
	cMPa9iO6ytYBLZpAORnjT6v6KBqQGD+5Mog==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7h5cths7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 15:25:41 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b234bae2a7so1203786385a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 07:25:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766503541; x=1767108341; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8yJY8kd69tc7nNmZhj/AWb+BwQZUtdfMzpFRn7v2mj4=;
        b=GfwwuaQDJwt7mTP4uJMh6V72kryQDp0aTakrRBzCqrbmIdDWYHO0U3U2Fx0+8wRSBq
         71tRPAMpOAYY91C0OHallWPjzw8ed75veK/yRsq7V15yyilTiMnao/NROkrYR8X5h/lH
         frGo/VOEev2lBJrTL7B26YwL24IF6aBYLURtFyuteKExz7ry9iT2U+uPNDhMHQwXH4F/
         bXU8tQMiGIU1f28sOdBbK32jSkZltvO+rmPNcj1hZ9PnkWmvw9zeFMfCPmAsIB//QG6M
         qYE/b4Khho4oarQzH18Pv41gN8JtrkzRS6W37xAZ95z3Ga1iEVj/vYfaFlxXckUpkIAd
         8ktA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766503541; x=1767108341;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8yJY8kd69tc7nNmZhj/AWb+BwQZUtdfMzpFRn7v2mj4=;
        b=Snm1arcNS+HESC/Xgn9trFxSRYcyK/XIZM0b/pLqFKPuc7FKwFhRJemza3dKzdzogi
         UG7YghF9oCQZ3ygcLP1p1mJKGFksWOttgel4s04hfYgkND33cYwADRtqTsAzA/lemRxs
         L6Z9FlPIMPCC0DUFzOcvorDgB5eAEQC75NqqHimuILFzLA4CAqjSX/jF5kMSLbQydk8I
         hwEM5+bTbGE9kzN389QFVJYtIZ48Et25Ks0HUkWzYZh1plsE2W7jyim/KeeeVFdzeHct
         tSG8t939v/wBmR/BKV6QG3MN1VQC3rOcXlxxZS375OcXXEBdNgG9D9V8AC1ZNun3TD9+
         VU+A==
X-Forwarded-Encrypted: i=1; AJvYcCXeBL2RediihjWJGxDyZIxCzNpOFDJii+if1nOyiy73gixcOCTKsEtqz8Q6ac3n+/H57ZBTVMeaMCBbDjo46PcY@lists.infradead.org
X-Gm-Message-State: AOJu0Yymp8oqsywPD+Hqt9f8FdAu42jBiNl1HV4117hr1BcqqyFFxGBz
	c8mPlwFuANBWQ6qI0rTxv2N4kFQkNA3l+BmCZwVBXuA54UfcTNdjvlyqkw96JmqibgF5mCgOghC
	A9yUG6IbI9CKznGL2nxu5uXd2VJzAHOQHB/HeEIUmuKsuH3UG5CD/Y1E+iRgMf5GR0dTnxsblZG
	l/Xw==
X-Gm-Gg: AY/fxX7PT6Iu7XfJvz4sUtu8ZJdCMQylaXqbIJC2Qy+D5U8C7egCbjV3q3jIFHAB41S
	eNJOothvAdih+0v5/evJuEQ3mi1C5ME6HWot/CEaJXZvNEWBUydaCGjVxvn04zVeAeZyaKzarES
	zHBmTdcd/I/k/2/OjLYmtrUwSyMMmwxY2NY3P2G8/Ag7Q/oDp/6iDK833naqtCg4tBzruqZsLfU
	mYqQhqpbKlwIF9j7uaJThpgIAjEnYlDtp6aKJbu1wlsPRA+eTrXq4kyvz90zLXXBgkNLNo6FMPv
	ILkfIDN91YTmTk/axWYqCqYXTbLa/Vn135aaYJ/Vj8KG3CBfzllj6leYd2bHiQaREPzA8mSHhoK
	kGwe3qAuuGZJ2gZBfuq47tOaRKXKnROTawEnKjJOyDMjtI+atNJYRDTQP9nLGURv0taI=
X-Received: by 2002:a05:622a:1206:b0:4ee:4709:8515 with SMTP id d75a77b69052e-4f4abd9971bmr190817001cf.50.1766503540143;
        Tue, 23 Dec 2025 07:25:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IES6sH9DjtghbKbhn6HXGsqOGJgNv8+Kf7bzZH18If35oQGO3yjA7o5iAGOO0/0T3dMMWI5wQ==
X-Received: by 2002:a05:622a:1206:b0:4ee:4709:8515 with SMTP id d75a77b69052e-4f4abd9971bmr190816431cf.50.1766503539499;
        Tue, 23 Dec 2025 07:25:39 -0800 (PST)
Received: from quoll.home (83.31.98.88.ipv4.supernova.orange.pl. [83.31.98.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037de142csm1411511966b.38.2025.12.23.07.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 07:25:39 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/2] arm64: dts: ti: Minor whitespace cleanup
Date: Tue, 23 Dec 2025 16:25:36 +0100
Message-ID: <20251223152535.155571-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1508; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=09v/F977NfxhXdG9Op6gySwyepTv0APhi7pPXOH3z3Q=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpSrRvJwwxClnKehgWViXRsrhCwXjngt4GtImw7
 +qjhBQKy5+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUq0bwAKCRDBN2bmhouD
 16iuD/0X1g1obOd03YP7uU2sKurWnUbcDbo4wNVBFIGvEXo+OsBubZxR/KhslvrZoKb+mLf2xFu
 +DS9zDOex7U8GAhw8yXY9PRmnEjKAQDRbk3M61HRoAOKZjhWB7cxoXzYULZ0RH9pPSgIdo/44LB
 BjQphnvyJwGyU3OPO92PxA5BYACTt58b84fr54uQ+XJTU4ISm6zmEAwbUCwQd8Hll/wQorVGWts
 fGYRTsEFTcDCugrwfX0OdNiCTQUqwdOkE1MYbcM1sIJ8u6GODXmwAIwS4UJ0Um2ppznhf6zMtlq
 +1muHzdwL1Etpg7BL775aqZXlfvkRvUZrkr9lZ/QTbWWn/rxfaOn3ZKaLxNRIe/nQVUw5cq2uYo
 1SvvT8P54fR2IrUj4F9d6jqB0mrpmYKygIZW7lYjZcS5H2rAQuGSobh8BpwbeGdKuQLEoUbN6AE
 jlHssxYTpcXogbqEmUJsMmjwqCnoGsM9Vwslk77imAIX4XWv7wARnuv1CTwxkJZ//8PrpljUCzZ
 z89Fsfb54u1tpjX0DHgIN5a7CNnQrgakABUO7F7E+OBh7YHY5c4Rc7D+HFhf7QcflIWIrn8XEzv
 zgPLmz/MhavJ0UT6/2s/a9NoHqsdAkAOQmrae//qpGcxA7tgEf2cX5Kbs2KKcg4mp4D9HHsiPsb po7BUBrH4FyIuDQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDEyNyBTYWx0ZWRfX6XMaaao1xa/v
 VXcYTG95W+fuLw+2sKbEwvY4O0dbBxKDEubvi2KWB1jZj9IDXlvpKc4XtJu2UpyhhlQhLwyRtID
 vL4mQg6zySNwshNuYoxbXIPin6lsM0JxVLE8e4CFupjXuQ4m0a04oyfuNtAP59+ClWjv/sw+7qv
 LUmd+Qv6j2f/kqCAzKDqIpvMsiCx/oMNHNoDpKf9C0cpcf+GWs30wnsVO9KHqd3G+YdbnoprC/Y
 PS1c7dJ/yANCuhbGqgDGcAORqeNJQKgBr9pHEfIgfHBxenJaRs9VG5tLMNFSyE0mcXo3LkEQsEi
 TtQxZjgr0eEplaILL2prH4mwtWtdXYiF9kBn3hOpoAE0PAueexXn1FwvSHDWqoJF1mDMevJxtkP
 W/FROCD/YQxrJ3qCYDVzy9tjzmYcYDDrrGaflKcJCvOzvAUDdy4acXTEfX811b//MOMj0rrbtng
 uRCPGa099OSUG/bQkbQ==
X-Proofpoint-ORIG-GUID: c9RN4UQ89JISqZU3GDciEQNwVWh-yskk
X-Authority-Analysis: v=2.4 cv=LeUxKzfi c=1 sm=1 tr=0 ts=694ab475 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=qe4J/qXhiWkb1JZGYKbLYA==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=uOgXmjhQpuobMY5VB7cA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: c9RN4UQ89JISqZU3GDciEQNwVWh-yskk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_072543_188030_12DA4057 
X-CRM114-Status: GOOD (  14.34  )
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

The DTS code coding style expects exactly one space around '=' and
before '{' characters.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Patches done with sed, verified with comparing unflattened DTB and
dtx_diff.
---
 arch/arm64/boot/dts/ti/k3-am62d2-evm.dts              | 2 +-
 arch/arm64/boot/dts/ti/k3-am62p5-var-som-symphony.dts | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
index 2b233bc0323d..a5d5dc0a7bec 100644
--- a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
@@ -669,7 +669,7 @@ &ospi0 {
 	pinctrl-0 = <&ospi0_pins_default>;
 	status = "okay";
 
-	flash@0{
+	flash@0 {
 		compatible = "jedec,spi-nor";
 		reg = <0x0>;
 		spi-tx-bus-width = <8>;
diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-var-som-symphony.dts b/arch/arm64/boot/dts/ti/k3-am62p5-var-som-symphony.dts
index 4bb92fde6ab8..5ba4ed56755b 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p5-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-var-som-symphony.dts
@@ -224,7 +224,7 @@ &dphy0 {
 	status = "okay";
 };
 
-&main_i2c0{
+&main_i2c0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_i2c0>;
 	clock-frequency = <400000>;
@@ -466,7 +466,7 @@ &sdhci1 {
 	pinctrl-0 = <&pinctrl_mmc1>;
 	disable-wp;
 	bootph-all;
-	status="okay";
+	status = "okay";
 };
 
 &ti_csi2rx0 {
-- 
2.51.0


