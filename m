Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1253C55172
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Aug 2026 21:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jIfgx7Q8EeKt17b2/yZyZ4fUIWY57X+OxXcI5I3IsDU=; b=Voy9lM2MtkTU/CYUZln1nsyaXS
	qSUSHiLBiV9oJe9fLMt3SzJNFNieObZb3TpGS5LUkQ9ehL05xbR5IoC8df+T5P+3qPjNZmHoIQbl7
	PnE/sOg6KAjHW/4RPJ1qgduDlLF8pMKjG4v8BlB8VzX0im+RFGEIybVdjvmUZcTpVyU/l4PCKhVTK
	WoyliwsNr3ky3/7AKMpCnN1HZXhXyyC+0N7IepA7IKxsz0rn6AQONsGC5snqhz+jHVUoNA38SpleQ
	wjBxqyLsBmJqVBt4IgOozSbMvlkrorMfUmsYVSIl3NxEtDOkYss5dBdR/+tiazeGQnOKxQTYFQhNx
	WYG6YuQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqGsW-0000000F4pl-0oZr;
	Sat, 01 Aug 2026 21:04:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqGsT-0000000F4oV-4AlC
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Aug 2026 21:04:19 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 671J0LMP3739350
	for <linux-arm-kernel@lists.infradead.org>; Sat, 1 Aug 2026 21:04:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=jIfgx7Q8EeK
	t17b2/yZyZ4fUIWY57X+OxXcI5I3IsDU=; b=nspM0Q3vZCUD8UbkiSdPs+bBDIm
	VoY0KG7dzHNJKIILa3TerUlaGCBre/pkjhjNU1unPiJ6XnEyNCLNpytC7sj18Yqk
	s3pAgb9e2kccJpLFrDs0JP71nxqSsTtnjMcZIRylIIuvFIZ6HcDqVSRr7X6pu007
	JztmcYanUNvDflPtmqn8+8OxuqHN7NCXXBllUxq/1L0MzL6MYu+qm2J2s9OpncIn
	WrCkYbMjmjCmcACeqzOtEWk9b6caEa5WLNvGOvDKLO18RyIMTUXfw5M3L+KEUG+Z
	UlZADJ9DyQPjzYxZyArB7epq45Ne13+1qR4tqGK61yZ2cjzPH7pckcDbrpg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8u99pvv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Aug 2026 21:04:16 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52b4f6ac06aso29933261cf.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Aug 2026 14:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785618256; x=1786223056; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jIfgx7Q8EeKt17b2/yZyZ4fUIWY57X+OxXcI5I3IsDU=;
        b=NhDZx/EweEZl5SoXS+ZUSjLbpaxwgrSmG7flYQA/3dyP9OYnq9QJyBXM9NVlvrgz3j
         ZFGZnHvgA2YZxPY0vF8qvNRzMRGD8maQ6bffIhewdMsWjXAH4FUxrpm6AciNWZPt995n
         yaadjlhzYjyX+VM1TvZqHFLXPZm3K0roPTazvnPfTM09v1imJ+JF/uKriqC8/LELhiL8
         i139oLZaPjoYZIz/MdOJTU0ZoSYUDPNytt4IiEzadOMUrwJts1lA5hoybyWfNqQeZgFt
         yNcv7u6sYgn3cokK3UwaAq6AAALoleAVkS+y7z70ZHHcvN6HZ5uWoXa8lZL1g49oML9I
         s20w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785618256; x=1786223056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jIfgx7Q8EeKt17b2/yZyZ4fUIWY57X+OxXcI5I3IsDU=;
        b=MN+jWeKXIXodAqiwugRyi408KOK9j76UmnP/VJy5JnZVbii3DdJ0z/ojmp5yyFDHnN
         ME3PIsc5u+llRcocklqy8KAzgzEiRacgkHo9ljk4nxEZ4OP0IlwI2k1LVhbX33UNTaAx
         kAKdoUYkYAeVJ7aun1nhu/QMKXpCsx5EFoX8edQgYWMDACt018rZMdm2+Hx+z0E2U8j0
         J1QvyYGCXjRtaN4HlZitmnZVEqFM1yD0njf6iNuIO7sHg+TOjX9F4fK22zvmZ2CXrEgT
         v0vqmbM/kpemeDtGKA6/EwBntFUPJfSk+4bHv+3MdPaO6LPJbCgaQaBcSk4T9Rmf2A+B
         fB2A==
X-Forwarded-Encrypted: i=1; AHgh+RrJ8pdr/PQgKicBdp9Tz/nhoh/pThQxzBCm1BZTFAPGeJmp5Bnwi8XurLWJrNSPadRT3m3Gph/vnDxOAg9yGHDz@lists.infradead.org
X-Gm-Message-State: AOJu0YwBrSGE+4ivINYXaAzXtsIJbDDfZf2pob7+SeSslLAazyZnQZ/o
	udpJktuh8vUhkfalJQZjKIW0Z6rFiIwJlt+js0ftfI7PtK9mllNBlXAzp1ErGKsDhy9f0eOmxOW
	d5eP6ndtqND/i8q8xxhjDGbiX7zXIXgwOYh0CQXyIAw4Xd6q6LwaaHDb1zT26nhPCLds7W1MAS6
	fOfA==
X-Gm-Gg: AR+sD12KaLSPYPl2PH8YFombaABPiKmHcbadvrJOncsMAJFH4WJB8SSOALU6waVtuPb
	mF1Y31xfttqTJJJhnuVrHHd5EHn4p0T0i7Zh2EpzinnevKmwPueqGUrBpm7J9p6njH7kZ+/gpRs
	LdUipPmZK91NhUxVyfCujIt4t4ZlL0pmKe2llvXpmVGN1Ufq9i+1c+DyMx5oUZufKk4TbeDkr8M
	KTide6mVWSoVkAB+G+lYVJMVv5X4KCSz233vn0n7HisFsHq5KCgBrWoD4cJPWXoaHGjSsXb7/vT
	yefXLC+XlOHmkb/5QMdd2eWRbR9OHOZ3l7ONejKCWro59GeovvNPzqCIDhcPuY8o7Z5dXiz0viB
	IuJtv0DznnnIDIcnK
X-Received: by 2002:a05:622a:1b07:b0:521:8ef0:b4e1 with SMTP id d75a77b69052e-52b5678f0e0mr108132821cf.29.1785618256246;
        Sat, 01 Aug 2026 14:04:16 -0700 (PDT)
X-Received: by 2002:a05:622a:1b07:b0:521:8ef0:b4e1 with SMTP id d75a77b69052e-52b5678f0e0mr108132111cf.29.1785618255735;
        Sat, 01 Aug 2026 14:04:15 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4980878dcb4sm133984275e9.13.2026.08.01.14.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 14:04:14 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Andreas Kemnade <andreas@kemnade.info>,
        Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/2] arm64: dts: ti: Correct white-space style
Date: Sat,  1 Aug 2026 23:04:06 +0200
Message-ID: <20260801210404.383925-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260801210404.383925-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260801210404.383925-3-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2007; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=0059VLCBe8d2U3qj+cwSpQ1V3ZQ9aPDu9S3NOjZNqG0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqbl9Fa7fUx2WZuvblgSQy2HW6AyO56d3uf53f4
 t5Qh4hP562JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCam5fRQAKCRDBN2bmhouD
 17G/D/9h4CXwe7utzofIKH3rLPVIsIHF8II6KFK0wLpxkzLwM00ko+/bK39jSDwyhXjEiE63MKM
 PTSksYiWEJoAB/bY+P9N/DDGwlsiMDdqgUpY7QU5IzkUHsovj1fhat7gneqmZPa8DQZcVffvF/4
 HJ3iBhXDpGj4MuCWKLL2VEE29+xwRuFjdjczD+gTq4T/FbAHnrkaAzp+o+wUXlTJk5pOT2d0xfD
 D3zsK73d3F1/VeIPjKFZBTulHKMFTrcX+IDJ/bBitgi8qdWN60vHLlwK0eXVNSWrrb/miIvmZ2r
 KdWGUit/4+fKMtrFKDSFZAxw48r0a6XiRE7qBjUdyhMOELpDNsCOo8sWD48ONsJOdkQK0T2oXXV
 mPGm34GUOWoQVBydetE5ZmhDsSpnJP8GWsDcX1q3My0RP+6WPeZ4slHLMuc7ZGgnvZ1/XQS4rGA
 OpwfUaoCwTePFrVOv8KUDzv6FxrvGZAMEEGG84H+nqXan+m2WFYnFk5tcBNNQaoSJAz8krxlrYt
 CA5vIeqezVGC4FsRpFHCtVWVJZkte/9Z8zCSCEvEuBPgoNONX4MtXu9C9+uo5YBP22jCzWnULL1
 G+P9qhtnyv3xPur1vF+qg5cfXkLB0uirEd1oigEQNVvJvIS7RAYdBiLKHL/R+j55Jig1EMiWMfy 8qHasZwss5Otk/g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: FQiXMyTSaTxrhjRQlZ-63S0d2mkqvM_S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDE2OSBTYWx0ZWRfX7Y2isre8WL8M
 4tkawkTccOLKEZ/wS9mwQ7G4wWqI0sLNgixy3knKthZNRdfrfKGGJwu94h8HJqEkKcuJjqQ6//l
 rnkmRVKtxZNXwQA5n+P/Ouh0gVCfG+u4/kaVLxg7bQHWiM/1r/9vYlDhThQBbF01bRNY6qB0hPp
 C4ltdfrQpvKtsQf9L/H5UwsUeAQ0Tb+O/fBNO0Q5LNGmENHsbetMauYGzYA4j7yz3q5iSWKZvYW
 cHgbEAsp/ZEyIdeV24QV+f2ucyamh+et3CTzMg/kAtK9mic+RXbcuU8v6MfDYlSyTW1UOtoQ+2f
 4GQj+EVT6oJaItvZ5t3r+nOISFpayvfBg8gDHwShe5fvIHzvxnDefHOMVb1ngEeVN0Q2zWdgJfg
 6HTrKXt7f/3cVjmORfJiYtDrQgzm8JZOG0Nz84sL04+jEsKkkYY2TiVS54rj8CPuC/cKfpGVqN1
 NxTs8M5OIso3W3lv33g==
X-Authority-Analysis: v=2.4 cv=LsCiDHdc c=1 sm=1 tr=0 ts=6a6e5f51 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=4E_048dy4KWIn0a4eT8A:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDE2OSBTYWx0ZWRfX9PITKh5KXnnC
 rxR/6/5dXG01xMw563AFkxJO+uKxf1v0HMTv+vZRfDQZk7Mgjx2lqUVJVQENPQO03XOc0mQ2KJ6
 SzfG38b+Xb3nYrR86r2bv06wQl0e4kg=
X-Proofpoint-ORIG-GUID: FQiXMyTSaTxrhjRQlZ-63S0d2mkqvM_S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-01_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608010169
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260801_140418_151564_DCFBA131 
X-CRM114-Status: GOOD (  15.08  )
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


