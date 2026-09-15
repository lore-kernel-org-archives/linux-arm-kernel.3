Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52C10C88E53
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 07:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3ATNw/rTlAf7RUOzSgyQZetgiqkf6IsOoJFplso21Xs=; b=P+xMdi2nm13yusqx9Way8nrhnJ
	kp8z4XREP5lEX8bV/KDbvSWIZ0g28Vj+mgfDfwr1z/4ySxkv5mos+tVlPQHxhOa6GyNL4vLfQxF02
	gPIRWY1t4vUyDHPi7ew6hLQ/0V5xza3S6YwxAX+ZabaCk+/z4W65ybgeqJ9TQg3ch78qHY2ylGc36
	QhgcZJDBSBQfMEX2S6AWKHaA0c4MtEYb0Q9t+gbwkbri2klxC3Y3hlPPtZ1MwqS9tOx2E2/VHYWGm
	wOLwg4e6e0eJQuqRfzfCphq5MOg1iUx5g522behmSbOBKwAbTUqfDn5+M3H+CNBGr0qrzGLyvkhZz
	1xvVJrgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6NVi-00000005SkV-0woh;
	Tue, 15 Sep 2026 07:23:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6NVf-00000005Sk6-41sO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 07:23:21 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6ZBBB2983652
	for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 07:23:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=3ATNw/rTlAf7RUOzSgyQZetgiqkf6IsOoJF
	plso21Xs=; b=GBvNlURHys0JKR9lSkOpSc3CedUF3nzxz0c/Qr9yV/tXmwRWGEf
	OK+FnCXK70zkftAUk8mV+CCt4NM0LhRTd5dRxB158Cb+/jBKJpDf5hGSj1ByOm1p
	J73U7C+XY/Hs0gFfiVuvi+uEO1HMGIQG5BHWpd2qPQQcaT21Js8z7TKbumjIrKSW
	J9Hi7FibSnJAr3DcJsNvpeqzxMzgM95S0ACpwvoeRnczC12Rf2zBNUqX/vfyfrSQ
	EJ7SBWd0GTMcFDX/FnUUmiCgAq9tFXT0yPpYWkDFCV5UmKPzHpKy7eFRaM6ToHDb
	eEnPFJm9fHn/Is70FfvP/q42n/I1OSm+VDw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpnet2ynm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 07:23:19 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-939f3426a7cso739628685a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 00:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789456998; x=1790061798; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3ATNw/rTlAf7RUOzSgyQZetgiqkf6IsOoJFplso21Xs=;
        b=Di3NDDBBHxlDUAeSfrirfmyLUhOBSvzebcVq/v+99vNhPqhP1C9arGc8MF+A6LjdZw
         cQeIsuCPUMJAKJ6JgQ3pjpPAU+O3MZd7H5blC9enn/Ytcs/zNGGld/cHqtK7Y5NlApnG
         52Bl+Xgfe72d+5ROu483bMc3J0I2FjKKw+Qr2cB5mfkAIu2SaS7XxvM13bWcvNAkQaOo
         I6D8Towidz5xGwvIsvmTfOe90JWaH/f7dXKJTtO0boEBXUt6MaZ7IpUcnk3LgjHKAqXs
         RdpX8bRozOFTKKSlxSUt53PxJcKHVNePwiJLURIyyL8YTIm842ToCZa/2tNQx5IJbpiW
         JBzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789456998; x=1790061798;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3ATNw/rTlAf7RUOzSgyQZetgiqkf6IsOoJFplso21Xs=;
        b=xz6UQ3oYw3v8Ry2A3Dgl/1uXri6YL7d7quuSzob2HWBUEbG8CptZS87bHvoCWgtWL5
         I3rius9d/Vz14G0hPnNB3U6X9xLdznwtj0/bZzD0YSrc2RXXbyoDHshnVjTmj76bEKtS
         1dKHQo/REOatOCGEi48lS/EYMHBmgVgP7AUHU98HkZHJZyihsIarJO0gmuWu5W+jzyLc
         D0nRaSEYI+Ul0Fdj8BVEvo0WLY6jtAZbfM3tUa65evhnE8BAwBDVpyxHbkMi9EtimdJ2
         HYHwtYSwOzybKyPgmw2j9W6hlOHEzH4Z8irC24qsYFBGkGMij5oV3kgEUpH+wlYwNpMp
         h2OQ==
X-Forwarded-Encrypted: i=1; AKwUvBzO0ozZViJTd+h9pPr139VR55qQB+UzVO0X2ghiMRQUmgRmVOXPIMBCOhmBwjgUQ1gT7XvK4m6nKn1vmL3VQSP9@lists.infradead.org
X-Gm-Message-State: AFuF++neGT4dd/854HBg/dPYfFC1sVGIx3YUPXFLQbiCevwSvhpW3Eab
	6mxlLGW86fkWouzJALptZXsA2wDqqFOtCk+0FaB2kUQgTGKSJZlfCvMB87WRacw9RrntOyHPWlD
	ZESIwKiK0xkcEl+OcAsn2ZazgsUp0lA1Z2SKLkNO7kKpyFaWslRwTPaasblq2Dey+Orn7aJd6Hv
	a6zQ==
X-Gm-Gg: AYBFou1yobl9iLW7wp23X3z2m2NXmHFNg3wFdHmNhkDd2HgcDcFGtVMRrexaySsJpCm
	D5hMwzjCNOyhSg5ILa4hZE1BM9KJ4svKszcoefBz5yFqHtRyI2c/kBSumAnid4totXo80kqc2J9
	020p83UsDd6CUWhw3zRXDmGAMACQi8WtsmUMPSMsWatbbuz258dUqNFMRLHOLnFNSSOp9nNksnK
	k8RXF5FSNU7AET2erH/PK00D3jsS7uJ80IuLEDw+HzMM9nVYExdi1pnKt/r36MQOlN60iekk+WP
	SsFA/7fbYOprOkxlH9J8cQ0jJW7HunzPohtBU0jdg1/L+H+BlPVlsJ7M6Gld8X7CsoPmfKQpziK
	8bFnAoBAySioE6Jc=
X-Received: by 2002:a05:620a:2548:b0:939:78ab:3c5f with SMTP id af79cd13be357-93a297c8d1cmr870013185a.9.1789456998298;
        Tue, 15 Sep 2026 00:23:18 -0700 (PDT)
X-Received: by 2002:a05:620a:2548:b0:939:78ab:3c5f with SMTP id af79cd13be357-93a297c8d1cmr869984785a.9.1789456993090;
        Tue, 15 Sep 2026 00:23:13 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7ef2e117sm43920095e9.1.2026.09.15.00.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 00:23:12 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: imx95: Drop unsupported opp-hz-real in OPP tables
Date: Tue, 15 Sep 2026 09:23:09 +0200
Message-ID: <20260915072308.64047-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1987; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=1CwEh8Q/rE1NnBMoNQNfgUNpKNcbygdha/9UWzt5FEA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqqPJcJRY2BJd+T88jYlFk1GheN4sqq8i4Wa973
 jvqfy7SQ0qJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqjyXAAKCRDBN2bmhouD
 104gD/wNqgSpuFjJGccDgJI+wE97JAS7/eb4tNGBVw27ynWMA5AqDYYnvK5X3/F0roozimR8qs8
 hDvcWCNNqHU4PBXYCOoZ5jQwYNgxs9wv//rwxKzJ5N0AfAEXebev57u30T5bc8JK5KpYeQU6RII
 RFDIPpsdytPmUNKkZ4n5llMHmoPJlasIGEzldd/SJkwV9vB35E/gIPLXlFyJtcow0uh/eB+BnY3
 bJSs8g5xZcwsRfAnwlv829d5OjgV5FvQuXUsLAuHyo0athGI64upCpApkhDeAKeap54Aot40cIR
 yfRcXxCz23sw4rw5OTQHvP4TfU9r9m/dSIPvir3kLQ5uYqJxeVnRubV7iaxukhTATBafHTZAI8O
 iAWLQinDVXqRnIm4lEDubTnN04cHVaXqmtUfdqHXm6m3v45rOwQkjB7LRRwybInr7LoqXvt2bhV
 Hf0SLRU1rHcx+lGbNCo6SKD+N0oyKqIv0jprhs0Gtxs9hPTfina9cD5+10Pnqh2Yw7g0nK9DyqY
 BBDuOUrfd/4FdUjjlPb979qdlPRLjXqlwI45/pjwvvt/8pe0P9957yxMk5ljlpzClRua4ILx08F
 5PtakefXHXbQBBpRwKLD4bguq5rEnqRW3djJQAkzymjQIQwGHO3k/IVsJ8XE0cwM1pqvufUd4Pj U3wEzs/QFSi4K0g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDEwNCBTYWx0ZWRfX1ij9KWFQMb/G
 UJnVrXvDmOlKyA43zRAzv7Op2PLnSt365OIViwwQLeBiqMUid0ZjDzOcM2f5Tng68nmTPCTbFKl
 kRabeqqJLJ0qD9m/LFy3DlnDhGudjpo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDEwNCBTYWx0ZWRfXxkXC/2LsYRa+
 WJFNsJqBY/HgPmD1naIS0q2aHzSrOFOEitaiDDOe55dl0WCpbe6PvaWguAMNb9r1wWRuq+3doPx
 J99TurwS5i+AqMGcWoXPftU7mfv6vTnS3XHJMv123wGS0aJJqZl5EOZX9qIwuGBKVoY77IZh3eD
 yI/u8o/2jhcd106JR2iVfnp6/I7m8ODc91C5pl3se+DlrON17as1t2hp2Mpqestwl7h1GrVwFDR
 AvUqo4DBxQaKGh+4JM9jXW0Ao9z5IxNL/rkYPxQScxdMv7wR3xAxaqwN2SzoXxKJUue+b6vNTqn
 KWQxwgLJoNqLFBwunNT/Bx1T/QYMwHGSzdBDjpig6lngr+KYOlRoPfKCEraw7abTIRn3APkE5JW
 u+caeS/1su73rzZiERa1uOnAbGSE6Pr5tx7zPuntu0RVpWz8i5G9J7pCqamTdOw35jF6wreCjXY
 B/egtI+8JEAuXjhyTpQ==
X-Authority-Analysis: v=2.4 cv=PKKaavqC c=1 sm=1 tr=0 ts=6aa8f267 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=LIxWyly_AihzR3FwyFQA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: swhyouoq4gJjJTJukBuvhb7uQJGq9dIQ
X-Proofpoint-ORIG-GUID: swhyouoq4gJjJTJukBuvhb7uQJGq9dIQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 malwarescore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150104
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_002320_008269_CD6BFD42 
X-CRM114-Status: GOOD (  14.51  )
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

There is no "opp-hz-real" property at all defined in the bindings and
new DTS is not allowed to bring undocumented properties.  Fix dtbs_check
warnings like:

  imx95-15x15-evk-pcie0-ep.dtb: opp-500000000: opp-hz-real: b'\x00\x00\x00\x00\x1d\xcde\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/freescale/imx95.dtsi  | 3 ---
 arch/arm64/boot/dts/freescale/imx952.dtsi | 3 ---
 2 files changed, 6 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index 1cb8eb15e5c7..99c72d5cd125 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -255,19 +255,16 @@ gpu_opp_table: opp-table {
 
 		opp-500000000 {
 			opp-hz = /bits/ 64 <500000000>;
-			opp-hz-real = /bits/ 64 <500000000>;
 			opp-microvolt = <920000>;
 		};
 
 		opp-800000000 {
 			opp-hz = /bits/ 64 <800000000>;
-			opp-hz-real = /bits/ 64 <800000000>;
 			opp-microvolt = <920000>;
 		};
 
 		opp-1000000000 {
 			opp-hz = /bits/ 64 <1000000000>;
-			opp-hz-real = /bits/ 64 <1000000000>;
 			opp-microvolt = <920000>;
 		};
 	};
diff --git a/arch/arm64/boot/dts/freescale/imx952.dtsi b/arch/arm64/boot/dts/freescale/imx952.dtsi
index 887abb1c4784..306239de096e 100644
--- a/arch/arm64/boot/dts/freescale/imx952.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx952.dtsi
@@ -323,19 +323,16 @@ gpu_opp_table: opp-table {
 
 		opp-500000000 {
 			opp-hz = /bits/ 64 <500000000>;
-			opp-hz-real = /bits/ 64 <500000000>;
 			opp-microvolt = <920000>;
 		};
 
 		opp-800000000 {
 			opp-hz = /bits/ 64 <800000000>;
-			opp-hz-real = /bits/ 64 <800000000>;
 			opp-microvolt = <920000>;
 		};
 
 		opp-1000000000 {
 			opp-hz = /bits/ 64 <1000000000>;
-			opp-hz-real = /bits/ 64 <1000000000>;
 			opp-microvolt = <920000>;
 		};
 	};
-- 
2.53.0


