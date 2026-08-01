Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF30CC55172
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Aug 2026 21:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Mjw0rPRNJ7YWCH2TCdmizIy/jPBX2dyQfXCaC6SFm1M=; b=fTtNRmmFP0nx6FL7OEVj+H1xfR
	5xe6bWAM+rxvkmFCsBjKwVeqIJVCnxULfZqg7FDKIfjhRlFky6e3CDnw9YoXavE9tz6i09YK5Suxp
	JZcu4X9K26e91lR4Ms4EXegd4cNi02Wqhn+pihiGn4jCGotOCUePLRxp4cCF6F3orY6bcJjJ7tt7I
	77zFnzNrPc7dFdidxb/Sl7VQqFHpRz65yVJwfJh7xbCSP/HpKr7CsNdajg2DAcEPXiKccnKdt5ldw
	sQ5xC0ivp3wZBZUb7MhwJHN9pR+vDbO/MeohlXw0NCSaTnzu9viWxZNcA2OLV59SpuEe2LMZlNYQv
	w6ctmKuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqGtB-0000000F5AY-09S0;
	Sat, 01 Aug 2026 21:05:01 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqGt8-0000000F58j-1cvu
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Aug 2026 21:04:59 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 671IxnlE041656
	for <linux-arm-kernel@lists.infradead.org>; Sat, 1 Aug 2026 21:04:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Mjw0rPRNJ7YWCH2TCdmizIy/jPBX2dyQfXC
	aC6SFm1M=; b=RPqUZg56g0t/tqd5ZFJ0XqMbV3cGp/sNHphkSRbSOAfhBo+6RMA
	7nQ1hfGFa3fx5UHoNIn3gl5l8GNL9u2PnR8O3ShJhbAXg//jYsk3yLERwZYL6elg
	3Xz8w850Ft2k0n/t31IKcRkjo4TfYkQ4t3B0eHwcB7eEHnfAxi3cQIKbBifoT2cL
	NXqO9lHsPsHaRXfXMH+6TiZhEgfY+Q7dNgr1NKPjnyE/hkHXL+o4tjBPGJ097tRm
	f+Ck3iotjW5cYgLspne6bsgbjhYJGzQDrKBJiuh/8Mf2Jyc5VZ/3t93T4nTI96z5
	RDHFNQlV5rlLC8QA+ayFZi1veaFM3aHDYng==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8qpsnts-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Aug 2026 21:04:57 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51bec738909so16330591cf.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Aug 2026 14:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785618297; x=1786223097; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mjw0rPRNJ7YWCH2TCdmizIy/jPBX2dyQfXCaC6SFm1M=;
        b=MR7zq9dcbrkOkKhQWPoXCm//dD/JuybQdQrF7FeMLexbzMiKEHarIQ94wNoOyfwbwt
         QcKXvVqmUtcsHH2cc+3TugxXUPbfRxqtowM6UGfYkiIROcBCO/jXvQMNSMCPv9xtmMmd
         pbWwwHYCSS5R+3iqsX7136Ou3iH7Zi3BlwuiirTrUaBDn6qHvvw6ftrwOlkk0jVep9RQ
         rNJkdaM849Jc2+FMfhDtn+oOPq8zlCMz3ZW6HYe23Y5JjsIQVxkz8Rj5SoXz5ReNY8aC
         W5OnVdruKDqosbVvGjL2waW88ACPAhBFdixb90uKUJNODYMLbFjXFBjPDM3afam2z2XI
         UnyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785618297; x=1786223097;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mjw0rPRNJ7YWCH2TCdmizIy/jPBX2dyQfXCaC6SFm1M=;
        b=FL9Z4TonItKqrjDFGD+zubftNGy7NqWo6tyRsB2wQjV/j+ioGtg4njSHh/9Nrza84q
         FjLtarH1aMLv1bD1jXRpsLu2EHUJfrVuJLdD+GrK37nYtqcVU1k4HZcvEeGhMVBWRQ2E
         8W+IuRUXZL7Mw9s3ql8boDKCC8ODtGOn4BO9FjPi5Z131hKtobl1f5lanICpa8KdsBpH
         ODuYXH/ES95VI52KGBzn9qkkGwIILvRcZyAMHi7o6d3F93UDv2AM2FyZdERt+pcC66gw
         8ZoIa6rlCdI3sdsfeQhIPb5WvIt/PeDdlsrqAShxLLOHlAppE1g2x/+hFKLigAB8jQL6
         MqvA==
X-Forwarded-Encrypted: i=1; AHgh+RpLBaAr2dgnPGE5sr0Gm1AV6Qh0VEtyrWGjIlKnZsCU7EBu3GFwarhI0OUNm+tl3XS4lLJi3ax+LVzPbGWqo7KD@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7wcQCcVvPb3I/pdFVi1rA2V/3yF0kF3K5BXYhQOuowFaPVT2P
	P8lJfs7oMvwiLcY3N7bbNgV0M0WpUishvSBES7H5/arcJ8gQU00QoUvBe5nL+t3xWatNUBQrR63
	bE1+HClg59j50M5gfSft+6AzZ7i021yzoenvRNytSHCds4jyIbmc8HxySef5lfiHu4w7zFxm3nO
	QtvA==
X-Gm-Gg: AR+sD11a6HScRK7YpYrwKjfluSe16K/XrFjsetsaF4afj7mhQE7oc1M7DoezErGeoYq
	6fCLGaW4Qv+k6ygwMWfXh1vED7YloTep/BkxA+xpVGfBprGcZ5qjASpDCYAWDj7d2woPeGqUnRI
	iLeQvDGYojE4NG52oT1axHgqBkr5vdZlev41cKRrDNaOsDuLwnWkYRIe2gUKDn6VGOCCn2mKQef
	O1Er4WALDpEN3jG8rf3dLFYhKQPBtGVUsstdEpRVDD7hLw/5hpiaeubMD3W7zC6A+v0AbjDzdrU
	I+HlRlBUS5SB+DN6CfIFQ/K2/j2JiekF1luHSmyrFBHzCIgiqliGdXepxRcXIw9ouIAWl9UrHaw
	DbRVqXpgm9lpu1jW/
X-Received: by 2002:a05:622a:4187:b0:52b:4c5a:5844 with SMTP id d75a77b69052e-52b567522a1mr94261621cf.20.1785618296885;
        Sat, 01 Aug 2026 14:04:56 -0700 (PDT)
X-Received: by 2002:a05:622a:4187:b0:52b:4c5a:5844 with SMTP id d75a77b69052e-52b567522a1mr94261201cf.20.1785618296403;
        Sat, 01 Aug 2026 14:04:56 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41d0064sm18005029f8f.5.2026.08.01.14.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 14:04:55 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/2] ARM: dts: allwinner: Correct white-space style
Date: Sat,  1 Aug 2026 23:04:51 +0200
Message-ID: <20260801210450.384087-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2070; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=3CurP6Q1yOQe9HokOz7eMUg0cch1/yisckTbAm0+V1k=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqbl9yyQd8ZqW3XnTVmyPTJ7r12+7L+wcBkQEii
 uvg4TXU6I2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCam5fcgAKCRDBN2bmhouD
 15l7D/9EbP0TmISATgeXTLxkBY7vw+Fax3qcQGK4u4gwqqJ+9soxQH3aGwJ9O6Xy7a64Bugnyt8
 Cu1iJkfH3b4Il+T6F7NOGMJ5JwashOgyMBKUsc92z/jaL3WsrBxGPgwCgducJHeTq0+jjAWZB88
 DBszIku5RSmPWW/uUgRVULqC14vX4WsfqYrttdgjgfOne0uwNpD6kFcQ+D3vuVdz4T4fwGrB9kM
 Xx0n5avaK3EHb6w0Ion/+2ULnpo1ijQOORdASNbb6DJDwus3xcw8ZL/xUAqo2J/cOSbyDpthnvY
 Pg3HdULbAeUkuzM8OfD+ZCWMv0IgK++3wfxldop0+QLhQuOXJsaHoXByTFUlZMkb4eevXpb80NS
 CJDVVHA564/qBZgSkjgUIDNiwCk0v28AnmeIcq7igyV5gk37z+AZxIH7QRzKyDIR1nyt0TkJ2Fv
 CFi5uGun0m5g4bA3KsynU8tvEJ39XiyfWgBwCurOrJhCiLSs5exL5xx22/aF0Vl8ODTO69aA3sG
 +aJ+lBmNqkKjIJvi354kk36vPdllOljvihIqaBb2LUuanTS+5W8EoaLNXG0eRxTlysWif8zfC+D
 bnMr+VWYiY8PtaQO53hPxcalYe5vJux+fOFNUugpH5NUiEMfEIWHUkvPHoUtoJNecoaIfs6dqxh l/85RPFqbG8oWfA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDE2OSBTYWx0ZWRfXy9len3Q2nMBy
 Z9Rn6/PlyuHvEM4/COk4YgqvSt6mfoz1S6JGeimtGtCrEDeXYCNAKYio50LT+HTZPLSzzuPbz6e
 RNU85Lfz6dBnWltAGN6IBA354IQhz+gWxiXT0vyQT+eYiW6LH5eE38+DxcTwUOI6ASbnB4OWHV+
 lbfNQLvFmkLDFk9xK2LqLDQLc+U57wFLXa+8X/BCerFaWGGMEami5H/HJPrqE/+ddEvr2mvRW0+
 seeybrrbLLQu5RzNv1h9N4mHwJ3iRMOz4slkFXX2VhdL8X4a8wdkFSlyBF3847w1fGbsnARplNB
 l/L90fLmTKCeUNL2qkNIf8CughH/DFQp+bfXWhoAuKpeBoViNSYmY4UzlrfT6/vi+i49G+I44Bk
 slpqhXjYktXy59sOhBB+wCuN28nuBDvkDDqJn4ZvufKGPIGtSPtrX7dwKR3l8nPCGQVdzq4U84E
 +D45HtG1Hemd1l1idjA==
X-Proofpoint-GUID: 0gzSOPYmBGByOcHwaLIgUcadrRBZiT0O
X-Authority-Analysis: v=2.4 cv=MpViLWae c=1 sm=1 tr=0 ts=6a6e5f79 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=d0dntzSpW-aAEgfTmdkA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: 0gzSOPYmBGByOcHwaLIgUcadrRBZiT0O
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDE2OSBTYWx0ZWRfX2QDXehlef4HV
 KRv1kYs6FxTtVjxVL49yIBS4HpUhBJJvapaD4xI5LXOVJp62djAEq1CVvYJTihDboRjBjdUm0PM
 +ogea2ps1iaZAajEb7xbC/0lfmydNM8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-01_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608010169
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260801_140458_436849_862819E0 
X-CRM114-Status: GOOD (  15.25  )
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

Correct a few white-space issues, like double before bracket '{'
character, which will be flagged by dt-check-style
("redundant-whitespace" warning).  No functional changes.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm/boot/dts/allwinner/sun4i-a10-gemei-g9.dts          | 2 +-
 arch/arm/boot/dts/allwinner/sun4i-a10-inet1.dts             | 4 ++--
 arch/arm/boot/dts/allwinner/sun8i-t113s-netcube-nagami.dtsi | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/allwinner/sun4i-a10-gemei-g9.dts b/arch/arm/boot/dts/allwinner/sun4i-a10-gemei-g9.dts
index ea7a59dcf8f9..f6d4babe6c1c 100644
--- a/arch/arm/boot/dts/allwinner/sun4i-a10-gemei-g9.dts
+++ b/arch/arm/boot/dts/allwinner/sun4i-a10-gemei-g9.dts
@@ -179,7 +179,7 @@ &reg_usb2_vbus {
 };
 
 
-&uart0  {
+&uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_pb_pins>;
 	status = "okay";
diff --git a/arch/arm/boot/dts/allwinner/sun4i-a10-inet1.dts b/arch/arm/boot/dts/allwinner/sun4i-a10-inet1.dts
index 60e432a0ef1c..408d1f01412f 100644
--- a/arch/arm/boot/dts/allwinner/sun4i-a10-inet1.dts
+++ b/arch/arm/boot/dts/allwinner/sun4i-a10-inet1.dts
@@ -78,7 +78,7 @@ &cpu0 {
 	cpu-supply = <&reg_dcdc2>;
 };
 
-&ehci0  {
+&ehci0 {
 	status = "okay";
 };
 
@@ -157,7 +157,7 @@ &mmc0 {
 	status = "okay";
 };
 
-&ohci0  {
+&ohci0 {
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/allwinner/sun8i-t113s-netcube-nagami.dtsi b/arch/arm/boot/dts/allwinner/sun8i-t113s-netcube-nagami.dtsi
index 544d60cfc32e..4879a437f415 100644
--- a/arch/arm/boot/dts/allwinner/sun8i-t113s-netcube-nagami.dtsi
+++ b/arch/arm/boot/dts/allwinner/sun8i-t113s-netcube-nagami.dtsi
@@ -42,7 +42,7 @@ reg_vcc_core: regulator-core {
 	};
 
 	/* USB0 MUX to switch connect to Card-Edge only after BootROM */
-	usb0_sec_mux: mux-controller{
+	usb0_sec_mux: mux-controller {
 		compatible = "gpio-mux";
 		#mux-control-cells = <0>;
 		mux-gpios = <&pio 3 9 GPIO_ACTIVE_HIGH>; /* PD9 */
-- 
2.53.0


