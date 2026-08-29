Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAD34C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Aug 2026 19:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kvOjP7H743NqEr4+DNIdZ2XfKWZWa+GVyO0tgJcX8hk=; b=FeAZY8sc4qVoHTj0LwkCPnEuTz
	QamcxHn50D8hph1mo4m9yKcrkQgzrxtqPBxe3jQzamEJBJOSTwTFcKawG5LCTFIhmQWobDN4S7pe8
	mitr7L+ZSj90QBrYaRs6eNie8YgFzdx5kICbfTbrFf8SghWCHGUZ23aQ/83tLiJ/Uu7FZr0HvdFvY
	ZwjhB5aDZe8PdJ5A5VOsiHyUacT3dDWzy1Vs/TLP5oyUuVP0TZ7bCj8cz7eEav/VPrEvy7V0f4/tH
	DdULfWLvTNk78n7rEZp+YZ9hzJK/o3EVe6hwuzLe4ZTXfHImNfhCKC+cm0CNru3Cfqa7wenqKU4G0
	LMo/E4ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0Ous-00000007GF9-1EFz;
	Sat, 29 Aug 2026 19:40:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0Ouq-00000007GER-0ecI
	for linux-arm-kernel@lists.infradead.org;
	Sat, 29 Aug 2026 19:40:37 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67TGx00o1257806
	for <linux-arm-kernel@lists.infradead.org>; Sat, 29 Aug 2026 19:40:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=kvOjP7H743NqEr4+DNIdZ2XfKWZWa+GVyO0
	tgJcX8hk=; b=o0OnX38C3k/YvauvfAwK3mb8/dAO63vHnDfQ/LOs1QymM08RY4P
	Uvag0sK8YMiZcSlDNLDeVj8yIJ0EaAcXFWBo/UY3ev7V6c3XHfqNfKJwwD3cVRJv
	gIYSxaKih9ukks5co3oFuZiQG2VwmIqVIprkIXOkLQWUDuV8R8hZFfXJuZyCg+dm
	SNQg4fPrOqCN2acnn81AiAW88TeUpP3te9NZRWmw1mEgUJpNKZ7bPX8og+Fm5gVk
	zX/WAle14VXy+PLsuhslUanjOz58gUMm6pPCHgdqkS823+v9xbqp0OPNj4DrVxxh
	pJmLkCFm1Bt5ASnP90g0lWLodu4aO8Vz9Pw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbrkgsgsp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 29 Aug 2026 19:40:35 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52fb8f67542so29331991cf.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 29 Aug 2026 12:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788032434; x=1788637234; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kvOjP7H743NqEr4+DNIdZ2XfKWZWa+GVyO0tgJcX8hk=;
        b=ApfMX3nt8URlBJuPtFeOlBfmWQYvvYCj9i5oVbGGItKoxJxP7aEFRacPgr1+8ZiqDR
         2+0NIvSCr8AJzIomFRN0U/VGs3aEYW8t5YXWAehdHfZIU+VSiot0+Tp5PsxuPYeMy8Jj
         iQxdv/bQXtc7/NVtUxhFb2l3N3UCXvxy0NOPx4dsVpUboVGH3AI3XGVfuqAKrq1WTZMJ
         /4ZZww4c0xPtosD6mPkBntFivhjt5VyG7NH/76832GzBSbZk2TAMDw9sy3ubhn/zfmtv
         2+pk4OfxkY4zmhGmaWEe0LjjBKEIJ+Bx3za6T8RAOHL51NbifWgK1FxZlsQsL0dU+lCx
         OV6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788032434; x=1788637234;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kvOjP7H743NqEr4+DNIdZ2XfKWZWa+GVyO0tgJcX8hk=;
        b=oooUxDgfn2MDal2U4o1HANxGI04kOjJMmtcwGFoAUJ2qYVZmAlnKGeDOaj+hIXEMMg
         BIpRqxl/ei7+kUywCCU3jykLmcgA810IX4CIl8bKmKO8E+imRyyVIs8Of7fNgiEEbsVQ
         Dp+wjs1O/uHfGI4MLIdXl6RROFtCiV/y4Q4VCpRZjCHbjKOt3WuhD8jM5BNF1xCaJAWm
         CDZfQNmkpfPAr0/eQVsISM2PmC/zwRh/b2TTTeVTsDqPm7mZB07GtyB+GHxCKFz6wM/G
         YAJVkCuSuYVWL88vLMLGBV5LbxIb62bWiSRhwYycQ3PjMF9QQDM7e9Gw1H0ajJABB37e
         +DiQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpj+doLEXcor7JKjqPrst4wbKXrDIzzu7b69IToeJnyTawXvQZgg3psHamC3eHC7CGtMlGAAb1Dp+tCwFL1OPry@lists.infradead.org
X-Gm-Message-State: AFuF++m3RQp3tJbYql4XKa5wuGGi5r0yjeKQzr61aDuikQqHiDi5aOb4
	vUHUP3vyxImf2ZoC/XDX4lpbh/JErDBuw3Nd6C3jTt2yf0ZIuw66guLx3in2kqqm5x8jn6slqyo
	sj0YJC4a0AJ0PjTppz0kxXikaAlXSP86rXKM1Rh7/zfI3YneD30RVKs0F3wJkdDO55XRWdKbqwD
	GnUw==
X-Gm-Gg: AR+sD13EJl9YPDE2PJhE1/pEDoLOQjuYRPChjdHzj23Z2ful3RzTP6ThSTpQETx4BRV
	bnzlRnCPoBce96gpENIK57rAKosKzz9MWTS3XLwQaUDNRWk61ei8nX5Lj4q/b/DR/P2qfYom1eg
	AAIS2qMTalYkDVIhy96HWFL/OvKUwiQonqk3n0UsZIwXB2sf8xnY5vDltR1BEBaiqSnDy9DZn+X
	pXUVQeoXIaqgOBA0IvlmhBOKUBaq6yo3EGe7QSBpyFPDcrOVnrt8EeDXrzjILxcMumlZOaY3JcK
	DJZJysaCVIX2QbXIgBmh15NHSG/kcXJF69Aj+UU70UcygWJBO3x3oskiA7etnrvvLA1VBl8iMn1
	D09A0sKVY0JTXwnU=
X-Received: by 2002:a05:622a:146:b0:52f:4a76:750d with SMTP id d75a77b69052e-52fb93ac5dbmr196756811cf.9.1788032434419;
        Sat, 29 Aug 2026 12:40:34 -0700 (PDT)
X-Received: by 2002:a05:622a:146:b0:52f:4a76:750d with SMTP id d75a77b69052e-52fb93ac5dbmr196756391cf.9.1788032433933;
        Sat, 29 Aug 2026 12:40:33 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b961820ffsm65736555e9.3.2026.08.29.12.40.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 12:40:33 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/2] ARM: dts: nxp: imx: Replace spaces indentation with tabs
Date: Sat, 29 Aug 2026 21:40:23 +0200
Message-ID: <20260829194022.107807-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6505; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=u03xzcwD9ylZspI7+JnMXgsKtYsbVRW1UUGcA7cj1zA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqkzWm47kpW3I2D3DFQCFh0xyI6sC8Y++0QyaJz
 MjhKolpPECJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCapM1pgAKCRDBN2bmhouD
 19TLD/9hX0jXvuLMesQaoPepH+K53m7ssZ4nXxxQIAkighkylKAbJ+C+2u0UN05vfO39WLiNQLS
 3zZoKNKvxgHBgLsd8Hkh2HL1AGtmwWLmC5GV4IgqWp11IIqzGuZmFpmD1ha4UF4yXWoO2W3cjoM
 TWoXUcvnHTeh3lBWFZSdGr+G4nKsSyxmmfdzLC0+zVj40kXdhSHwkHpYjmV3oSZu+8GICER7N6q
 sV2cezGc78PXyF3UzOSrhZSwhc4rY35+881J7VbsFXCc7+O5RoOi1bIZo5pU0g2SwFM3kR+J4oJ
 47kqLnD6XCaxxkujBO32iuxpSfx3ayp4F6lhQamXUnOf6zSylmHPlvyUv7lkC+OKtAA0CgIMYXH
 GWoVzFp6cZoaxd9LAHkRl9hBtpTkoGZZUqbJME5JLqWUTCvZFxbS5TVaS/i8N09+MZIIJEFvU0+
 tiChhGsiI2HFF6eAP/zz+fI+HAVOu60Jkl04slTTVFMAZ/wSffA/SI7dJmc8S2nHg8SiXH2lmKb
 Q7X1HHVXZU5VbmfjFf7ob8mBcFc7CaCpCUVnxpC+0TuhXVD4Td3I4IL8Hp81UH8PqgAQOGucsMH
 rrozQVa/Tc6KMh+Og+Z4/SVFhSO8d4kKtSrgW4NbR5ht2U6B9+vrplHXZukFgtFwN3vOWVtdQni iS3Y3vjwa0CV75w==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI5MDE3MCBTYWx0ZWRfX0xoiH5IOs1t5
 lTCROZm2bEuDOcouklbUxruCaahHXlqWYu/MtyMpjawZpbvB5SYGdFFzmctZhSWTqYV0jkxRLLM
 D7VOfQRiWv3OPGKOjv9okmwHwmK2dlB2lvrUFmTTuFU/MAK3c3y+3U837w8DjrZxihJewfUZe1h
 IMaZ30EP6TFEb2Ynan/FCq2tbiMnFFN98GfuUuVY+8faOUFJCxjeDW4B61Q1oyQ7EtwVaBaSdTF
 SiBMh12kVNa+abQzjN7xKfxjNv88s1v1DlDgaBWKWbvLzRnSAWdqlY9WGetvJuxpV8XFqHxSf9T
 wamEOOMCuSAaxDRmlPpz4wkS+lqqkxzMmfIEBk5GE+wOio/0ydoy6Z9JI1ysu+4UU38DcWDV82O
 g385lLe/mZSs6gQQQlXr2drvPTLPlZV1AnU36e3Zl8Uo5pLvDzLHEYE6+W5+Hw6xG6zsYmQlsj5
 vG7q74hQd7b3gtSs02A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI5MDE3MCBTYWx0ZWRfX6ql+Sg0Q+nl+
 Brgz+DmFhqbKcu08O2txxDpzFONqH1maChzfaggs/24+KjrE60PASAFJSQws5yb/wLRR9/uVspi
 KK2K41k31ja8+GxZjYUci+SkkEc/ra8=
X-Proofpoint-ORIG-GUID: 4Eze_YYiPGTqYZPADh_FiyhTWmgInlNG
X-Authority-Analysis: v=2.4 cv=Cr6PtH4D c=1 sm=1 tr=0 ts=6a9335b3 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=RjE-yO3A8T5mLwkRmZoA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: 4Eze_YYiPGTqYZPADh_FiyhTWmgInlNG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-29_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 adultscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608290170
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260829_124036_217954_8DA07878 
X-CRM114-Status: GOOD (  15.17  )
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

Also two GPIO values should be really separate <> entries.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm/boot/dts/nxp/imx/imx6dl-plym2m.dts   |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6dl-prtvt7.dts   |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6dl-victgo.dts   |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw560x.dtsi | 20 +++++++++----------
 .../boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi    |  2 +-
 .../boot/dts/nxp/imx/imx6qdl-zii-rdu2.dtsi    | 10 +++++-----
 arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi        | 10 +++++-----
 7 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-plym2m.dts b/arch/arm/boot/dts/nxp/imx/imx6dl-plym2m.dts
index 635c5a1e1fc7..e3496ea9643d 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-plym2m.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-plym2m.dts
@@ -155,7 +155,7 @@ alert {
 	touchscreen {
 		compatible = "resistive-adc-touch";
 		io-channels = <&adc_ts 1>, <&adc_ts 3>, <&adc_ts 4>,
-                              <&adc_ts 5>;
+			      <&adc_ts 5>;
 		io-channel-names = "y", "z1", "z2", "x";
 		touchscreen-min-pressure = <64687>;
 		touchscreen-inverted-x;
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-prtvt7.dts b/arch/arm/boot/dts/nxp/imx/imx6dl-prtvt7.dts
index 353f7097cb7e..09381dc980b2 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-prtvt7.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-prtvt7.dts
@@ -288,7 +288,7 @@ alert {
 	touchscreen {
 		compatible = "resistive-adc-touch";
 		io-channels = <&adc_ts 1>, <&adc_ts 3>, <&adc_ts 4>,
-                              <&adc_ts 5>;
+			      <&adc_ts 5>;
 		io-channel-names = "y", "z1", "z2", "x";
 		touchscreen-min-pressure = <64687>;
 		touchscreen-x-plate-ohms = <300>;
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-victgo.dts b/arch/arm/boot/dts/nxp/imx/imx6dl-victgo.dts
index 18019a6bb3af..f874b2b11114 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-victgo.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-victgo.dts
@@ -116,7 +116,7 @@ alert {
 	touchscreen {
 		compatible = "resistive-adc-touch";
 		io-channels = <&adc_ts 1>, <&adc_ts 3>, <&adc_ts 4>,
-                              <&adc_ts 5>;
+			      <&adc_ts 5>;
 		io-channel-names = "y", "z1", "z2", "x";
 		touchscreen-min-pressure = <64687>;
 		touchscreen-inverted-y;
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw560x.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw560x.dtsi
index e9d5bbb43145..57f1583c74fb 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw560x.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw560x.dtsi
@@ -418,16 +418,16 @@ tca8418: keypad@34 {
 		reg = <0x34>;
 		interrupt-parent = <&gpio5>;
 		interrupts = <11 IRQ_TYPE_EDGE_FALLING>;
-		linux,keymap = < MATRIX_KEY(0x00, 0x01, BTN_0)
-			         MATRIX_KEY(0x00, 0x00, BTN_1)
-			         MATRIX_KEY(0x01, 0x01, BTN_2)
-			         MATRIX_KEY(0x01, 0x00, BTN_3)
-			         MATRIX_KEY(0x02, 0x00, BTN_4)
-			         MATRIX_KEY(0x00, 0x03, BTN_5)
-			         MATRIX_KEY(0x00, 0x02, BTN_6)
-			         MATRIX_KEY(0x01, 0x03, BTN_7)
-			         MATRIX_KEY(0x01, 0x02, BTN_8)
-			         MATRIX_KEY(0x02, 0x02, BTN_9)
+		linux,keymap = <MATRIX_KEY(0x00, 0x01, BTN_0)
+				MATRIX_KEY(0x00, 0x00, BTN_1)
+				MATRIX_KEY(0x01, 0x01, BTN_2)
+				MATRIX_KEY(0x01, 0x00, BTN_3)
+				MATRIX_KEY(0x02, 0x00, BTN_4)
+				MATRIX_KEY(0x00, 0x03, BTN_5)
+				MATRIX_KEY(0x00, 0x02, BTN_6)
+				MATRIX_KEY(0x01, 0x03, BTN_7)
+				MATRIX_KEY(0x01, 0x02, BTN_8)
+				MATRIX_KEY(0x02, 0x02, BTN_9)
 		>;
 		keypad,num-rows = <4>;
 		keypad,num-columns = <4>;
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi
index e2631db798a8..27a73a3361ae 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi
@@ -28,7 +28,7 @@ aliases {
 	iio-hwmon {
 		compatible = "iio-hwmon";
 		io-channels = <&adc 0>, /* 24V */
-		              <&adc 1>; /* temperature */
+			      <&adc 1>; /* temperature */
 	};
 
 	leds {
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-zii-rdu2.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-zii-rdu2.dtsi
index 9ff183e4e069..601733c3c2a9 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-zii-rdu2.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-zii-rdu2.dtsi
@@ -22,8 +22,8 @@ mdio1: mdio {
 		#size-cells = <0>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_mdio1>;
-		gpios = <&gpio6 5 GPIO_ACTIVE_HIGH
-		         &gpio6 4 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio6 5 GPIO_ACTIVE_HIGH>,
+			<&gpio6 4 GPIO_ACTIVE_HIGH>;
 
 		phy: ethernet-phy@0 {
 			pinctrl-0 = <&pinctrl_rmii_phy_irq>;
@@ -218,9 +218,9 @@ edp_refclk: edp-refclk {
 
 &clks {
 	assigned-clocks = <&clks IMX6QDL_CLK_LDB_DI0_SEL>,
-	                  <&clks IMX6QDL_CLK_LDB_DI1_SEL>;
+			  <&clks IMX6QDL_CLK_LDB_DI1_SEL>;
 	assigned-clock-parents = <&clks IMX6QDL_CLK_PLL5_VIDEO_DIV>,
-	                         <&clks IMX6QDL_CLK_PLL5_VIDEO_DIV>;
+				 <&clks IMX6QDL_CLK_PLL5_VIDEO_DIV>;
 };
 
 &cpu0 {
@@ -629,7 +629,7 @@ reg_5p0v_user_usb: charger@32 {
 		pinctrl-0 = <&pinctrl_ucs1002_pins>;
 		reg = <0x32>;
 		interrupts-extended = <&gpio5 2 IRQ_TYPE_EDGE_BOTH>,
-		                      <&gpio3 21 IRQ_TYPE_EDGE_FALLING>;
+				      <&gpio3 21 IRQ_TYPE_EDGE_FALLING>;
 		interrupt-names = "a_det", "alert";
 	};
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi
index 9438862b9927..86c4f7e010d0 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi
@@ -924,11 +924,11 @@ pd_pu: power-domain@1 {
 						#power-domain-cells = <0>;
 						power-supply = <&reg_pu>;
 						clocks = <&clks IMX6QDL_CLK_GPU3D_CORE>,
-						         <&clks IMX6QDL_CLK_GPU3D_SHADER>,
-						         <&clks IMX6QDL_CLK_GPU2D_CORE>,
-						         <&clks IMX6QDL_CLK_GPU2D_AXI>,
-						         <&clks IMX6QDL_CLK_OPENVG_AXI>,
-						         <&clks IMX6QDL_CLK_VPU_AXI>;
+							 <&clks IMX6QDL_CLK_GPU3D_SHADER>,
+							 <&clks IMX6QDL_CLK_GPU2D_CORE>,
+							 <&clks IMX6QDL_CLK_GPU2D_AXI>,
+							 <&clks IMX6QDL_CLK_OPENVG_AXI>,
+							 <&clks IMX6QDL_CLK_VPU_AXI>;
 					};
 				};
 			};
-- 
2.53.0


