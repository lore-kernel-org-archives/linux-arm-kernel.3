Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFBBCC55172
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Aug 2026 21:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DnsDFsIbpagtEOLuBC2d50Ec3A4f7vPyJNTbbp9e+Ik=; b=mMpjUfeemax8TjBiIRyr7nTZ/u
	Oemu/9DxDS9E9WIFifPuqvYiad7WW5IkMy3OC2qkXZVEi3zAJ6pNVXzDXwBmO/0spgqR6JW7kFZJt
	vVLr+Cf+cvyBX+NUgRMIraDQP30omVxlL0K4b04d2+gbNTpBspXo/CwYDbxAjbu6zKneqf0uZahBg
	hgSbYSePh4s62m8WZJCGW8sLYbs8lk7WIwQzsb7M8NXQ0iUrA0xOh/7uPtYSdfZ+DYAj3xNsCZ6un
	2pBZd7qlR+6JTOfbAGT+kVw0T6+EWgISDi4mrc2d8e2MQO44auaMoxYvgObeRrVO2uXh5kb2jCBlS
	tRuOWRNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqGsk-0000000F4vn-1fNO;
	Sat, 01 Aug 2026 21:04:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqGsf-0000000F4tx-3l7m
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Aug 2026 21:04:33 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 671Jc5G63601258
	for <linux-arm-kernel@lists.infradead.org>; Sat, 1 Aug 2026 21:04:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=DnsDFsIbpagtEOLuBC2d50Ec3A4f7vPyJNT
	bbp9e+Ik=; b=TOkUyhteDAw4kYCNlTTDS98RaAl0hpsJ+4mCxmSPTCQ4zq+k+Ir
	blbSyrAsyNtIKnXsL21GDqBRM5wVyhHoL4ILM3yeEspr9hIyGfv6lhx8EFM/vvdN
	MCINNDNRFf3cqWyQweuQQDBQ/UEyLkdQDgRAlyEpnGwFTR5620wFKJssP4vUcsC5
	mddbpaRjvACQCuHNv0B1NW7LJrzVBN/6JwsgmwNMFuxqQlhFcoVd2SR6DSENJPhG
	Jx7I1riSqDXO1sI0kJMFwZ0Ta1NspYzYMPD8GBwtA4TTgsWpT3jozSpARKC8cqJB
	n3iB8bsiXXWizZB/Ug2MZ9H+J2+wEd0DjCw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fsa381h6f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Aug 2026 21:04:29 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51bff5c7035so43217021cf.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Aug 2026 14:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785618268; x=1786223068; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DnsDFsIbpagtEOLuBC2d50Ec3A4f7vPyJNTbbp9e+Ik=;
        b=By4VuoloJpUrYsvy7SMPjIuJj6qfDoTwMUzCls7Gdh8E0nziU4BA3A1tVzy01O3wYa
         bIaDHZESTChIA0gp4je38j0iET/pKYG5RSUIpIuNgXHKCykaagcIatyNfj2Q+xi8g/Bk
         JOFOmx75+Y0FvnenabjRi5E+IAeK/LapO6FZS8Ju2g84L5e5RoaLD4IPFlPgbSheBxC3
         XjnnVX1l6riMWw0ynbu4pX5Vs+VTT1hr2DS6sqcM4Fvak1KaPyiHvKK7DqF45m8bfgni
         HBhSRd7zlkJNlo7hLXKUsCw8FB/s6cFIpsm2NCSpMzevyxfG8rSptBgWQRLCc0FCnZz1
         DnaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785618268; x=1786223068;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DnsDFsIbpagtEOLuBC2d50Ec3A4f7vPyJNTbbp9e+Ik=;
        b=jDQDHAg54OspnEnXWAs4NycZ6/xuoBrKoc7wScaXSZKqPN7nvypiyV6lkibaJ5jFKy
         Q0d0fIUzSKhJ3oZR6BhK0fI6a9LULu0myK2fPMaIP1xFJzdIaAUoiNcVU7obcUpiMf+O
         R+hLjcjcESvjfFAbsKQcxkExt3843Smbbo13TXaRzKO2iWTP0lnqFlDTZX3Lpobe7/sa
         UJm9xA74s/MoVqXbkffGGe2LgNJXUvAVK5HM3ch9nChJImBc52vk1c2Xa0y3RYpqtKCd
         84ZeOSsRPbkIUkQ9ZyvHFB4XxPfpuL2AJfm7WYwfhemIfo8vy2nG9rbm2JHPMgSrX18T
         zvsA==
X-Forwarded-Encrypted: i=1; AHgh+RobJcegZPImkrcmbeqgsaa3ihFyDWg39lxTdI5sVOT761GzcjEx8NgA5ZYt339l7gsV9nByf2+IE+46EbtqJTBW@lists.infradead.org
X-Gm-Message-State: AOJu0YxYILWkq1IOBo39bqpiob8HeOMTfiCwj0ya3ORuWqMGLpOsYbyT
	LOQMr46s3hkNGHT/SkWxu7pu8aOFfU2JSisfufhEFenwNte3rLgir6HAb1Z3LQiFjNNghiX4p9u
	/MLVv1Uw/Eo+XwTFfSSsnNtPgK8he6YysaQCLN6bdQPp/q0i75Ohj5nEX+rkZgYVUmIEnmzL4nV
	lJMA==
X-Gm-Gg: AR+sD10T8gtzydh4D6QhOuOkoYadxg2f6Z6kTCXrmrylGvRi7AGFj/Fh/4OuV8NUPeI
	0Y7IxefnXG63iqxw6aKByfikyYZPyQy6/OXZSVY+O3cT507U05WoCX6m2oL0xyLRO5d08hqI+lh
	5QBE4QH66B1zmx+hS5QhP3jeDUfMYQIq2d8ynS12S8HGWEhmUeXRAfZoDJcJH9VYBEsgVrDYYji
	bFotTbpqSWp1p/jwCtAKO5QHTIpNc0V7bO1R11hUUoB5YcIjWCGdijn+O5vKJoGLq6p0Zrb9FBK
	z/TpcpP/QH8+idy2nx706/dWYCkna6t6YYQp6Fw8tY/Yrxf/vFX2vaX7JPnvLs8AZ+ABIpYNlj+
	i6pkcl+DEjgISroPB
X-Received: by 2002:a05:622a:1801:b0:51c:f8f:13e with SMTP id d75a77b69052e-52b567f1258mr95146141cf.40.1785618268186;
        Sat, 01 Aug 2026 14:04:28 -0700 (PDT)
X-Received: by 2002:a05:622a:1801:b0:51c:f8f:13e with SMTP id d75a77b69052e-52b567f1258mr95145531cf.40.1785618267661;
        Sat, 01 Aug 2026 14:04:27 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41cfde0sm16911890f8f.3.2026.08.01.14.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 14:04:26 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Chester Lin <chester62515@gmail.com>,
        Matthias Brugger <mbrugger@suse.com>,
        Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
        NXP S32 Linux Team <s32@nxp.com>, devicetree@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux@ew.tq-group.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/2] ARM: dts: nxp: Correct white-space style
Date: Sat,  1 Aug 2026 23:04:21 +0200
Message-ID: <20260801210420.383984-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=8663; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=6vnP9bDIJW1WrcV2zoZ0rjoF5DH+2zrB1ClkTk0Ep2c=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqbl9UIsDcTUcj19PMtP6goGukFpGfayS3nNqa9
 92eXR+YJBmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCam5fVAAKCRDBN2bmhouD
 1xA4EACFImkcSHyyoZAhuonl9ho5GXc2jxJQ6ZuCpgjg/SR4w5iZv4a/GM7YtFD9wIDxZzpsttv
 eXY+GgZrCERYBy73KdNIxsKEtckL8tM7sWLSJSnr/tHKfEM89ZzFWYwlRBrp7upcvdAOCfFB2g4
 z8ns6ktMrCnsYBJYK06eT76HkzesLuswaDwgL/Ljv81hnbZYHNnJU9CuT0zK10UmSVeyvIZ+BIB
 mp+Tk13BEbiTcucxnBxRiKSFS7Fvi3nlQ1QILYwHvtcPYj45y/l/Q/pIqlqsBPiPolVl9yTLd88
 bOwYVmYcgvriNF5bjKSmjIgiTY8cdd+JjnzRnddAeZ9cQwrbQefJeXT+HB2b+ahI5f7nTJufpUb
 c4mfLUwTewnzjNhm2FQLgnjvQSR+K0qDXKh9gXDZodqfZGOLLqmatbQStrnoZUVUBZ9rI6vlkOk
 7Apd6opbrhCZ+oDgdoi+q4FldbcEqyucyycsFSsju9pnewNxkZeSt7BUtiZNlkSdnyHe+/chqOD
 iZOJ8IHv884t0OiANitNbvvG3Op39/d3bUgiuNTx4BsrCNPI5/vC91486yFzQVAkq/rwBUmizbd
 pd8oEugBTx/iHKPs6UweShSx9SxfJh5RonXIv41Fq7fzNfHetarkqjt9Md++MHdcs8pQs3L4Y0S oKY1y/X8TBP0Lrg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KezidwYD c=1 sm=1 tr=0 ts=6a6e5f5d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=AXt24ZvJ6lj9WyOqnD8A:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDE2OSBTYWx0ZWRfX9wRwYYlhK1Wo
 jdIcwNV5Cq/N54iRvNRomgnlxmXugqN+SnYKpOOere5+xkCQ8J3kxTZ48elGinvwk5p1n9gWR5h
 YGF1xRYllXteGNi6sf+GQI7X0XAuqYY=
X-Proofpoint-ORIG-GUID: hv5bdRgRW3-8QOSytV2nQh5JcNpb0loZ
X-Proofpoint-GUID: hv5bdRgRW3-8QOSytV2nQh5JcNpb0loZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDE2OSBTYWx0ZWRfX9xMfHZfuOG7B
 ZwGSbm2wBMpOpKnIPYHzfapn1SGtABJVf8qYux/SVBrNzpvK402C9JJuqxeVL+ApReZjpR/2j3d
 wpogz8eRcD23F2F2aBIgx0r61VYfZYQ7dcVrlj6OyI5Ftrpcm+rN1Z4WeDPW1clQVhF2Htl8ACz
 szMedQUuC+/6mhahgjwCRh7UefN82jUgfzHDdlqaduiIc9JyKTC0bOcL9YoKlH8U3qXJrE8OWCJ
 QwscPi5Nxp/D7GcNpzyvdjPYJVnDNGWC1NvTVBHUVPOZ9FWrgJ0w/Se9qL0TjJP1iwFB2LJrODe
 Xwqgj/l5feGvAYJrJDzj+7hgcqTuG3YzRkp3zmsYmTjAPyu42lSWCalHAZfX4XRX66+53bDVUeD
 u32tcmJIkaCcJqsRuazLpPfgKdC+A2FKb3UssbpnePaljThkvFcstARdjr1yc02hW6YJV4J7Cis
 MWSbkf+3slqWMKrcMUA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-01_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608010169
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260801_140429_953009_DC309E36 
X-CRM114-Status: GOOD (  16.45  )
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
 arch/arm/boot/dts/nxp/imx/e60k02.dtsi                |  8 ++++----
 arch/arm/boot/dts/nxp/imx/e70k02.dtsi                |  8 ++++----
 arch/arm/boot/dts/nxp/imx/imx6dl-mamoj.dts           |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6q-bosch-acc.dts        |  4 ++--
 arch/arm/boot/dts/nxp/imx/imx6sl-kobo-aura2.dts      |  8 ++++----
 arch/arm/boot/dts/nxp/imx/imx6sl-tolino-shine2hd.dts |  8 ++++----
 arch/arm/boot/dts/nxp/imx/imx6sll-evk.dts            |  2 +-
 arch/arm/boot/dts/nxp/imx/imx7s-warp.dts             |  2 +-
 arch/arm/boot/dts/nxp/ls/ls1021a.dtsi                | 10 +++++-----
 9 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/e60k02.dtsi b/arch/arm/boot/dts/nxp/imx/e60k02.dtsi
index aac7b9ef7627..ed59b27834a6 100644
--- a/arch/arm/boot/dts/nxp/imx/e60k02.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/e60k02.dtsi
@@ -240,13 +240,13 @@ regulator-state-mem {
 			};
 
 			/* IR_3V3 */
-			ldo1_reg: LDO1  {
+			ldo1_reg: LDO1 {
 				regulator-name = "LDO1";
 				regulator-boot-on;
 			};
 
 			/* Core1_3V3 */
-			ldo2_reg: LDO2  {
+			ldo2_reg: LDO2 {
 				regulator-name = "LDO2";
 				regulator-always-on;
 				regulator-boot-on;
@@ -259,7 +259,7 @@ regulator-state-mem {
 			};
 
 			/* Core5_1V2 */
-			ldo3_reg: LDO3  {
+			ldo3_reg: LDO3 {
 				regulator-name = "LDO3";
 				regulator-always-on;
 				regulator-boot-on;
@@ -310,7 +310,7 @@ ldo10_reg: LDO10 {
 				regulator-boot-on;
 			};
 
-			ldortc1_reg: LDORTC1  {
+			ldortc1_reg: LDORTC1 {
 				regulator-name = "LDORTC1";
 				regulator-boot-on;
 			};
diff --git a/arch/arm/boot/dts/nxp/imx/e70k02.dtsi b/arch/arm/boot/dts/nxp/imx/e70k02.dtsi
index 3bb11c5a6353..dc7ff108aa85 100644
--- a/arch/arm/boot/dts/nxp/imx/e70k02.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/e70k02.dtsi
@@ -243,13 +243,13 @@ regulator-state-mem {
 				};
 			};
 
-			ldo1_reg: LDO1  {
+			ldo1_reg: LDO1 {
 				regulator-name = "LDO1";
 				regulator-boot-on;
 			};
 
 			/* Core1_3V3 */
-			ldo2_reg: LDO2  {
+			ldo2_reg: LDO2 {
 				regulator-name = "LDO2";
 				regulator-always-on;
 				regulator-boot-on;
@@ -262,7 +262,7 @@ regulator-state-mem {
 			};
 
 			/* Core5_1V2 */
-			ldo3_reg: LDO3  {
+			ldo3_reg: LDO3 {
 				regulator-name = "LDO3";
 				regulator-always-on;
 				regulator-boot-on;
@@ -311,7 +311,7 @@ ldo10_reg: LDO10 {
 				regulator-boot-on;
 			};
 
-			ldortc1_reg: LDORTC1  {
+			ldortc1_reg: LDORTC1 {
 				regulator-name = "LDORTC1";
 				regulator-boot-on;
 			};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-mamoj.dts b/arch/arm/boot/dts/nxp/imx/imx6dl-mamoj.dts
index ec5a9bf40677..30275319902e 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-mamoj.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-mamoj.dts
@@ -151,7 +151,7 @@ reg_usb_host: regulator-usb-vbus {
 		enable-active-high;
 	};
 
-	reg_wl18xx_vmmc:  regulator-wl18xx-vmcc {
+	reg_wl18xx_vmmc: regulator-wl18xx-vmcc {
 		compatible = "regulator-fixed";
 		regulator-name = "vwl1807";
 		pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-bosch-acc.dts b/arch/arm/boot/dts/nxp/imx/imx6q-bosch-acc.dts
index 929def2bb35e..20b6cc74f622 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-bosch-acc.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-bosch-acc.dts
@@ -177,7 +177,7 @@ reg_usb_h2_vbus: regulator-usb-h2-vbus {
 		regulator-name = "usb_h2_vbus";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		vin-supply = <&reg_5p0> ;
+		vin-supply = <&reg_5p0>;
 		regulator-always-on;
 	};
 
@@ -207,7 +207,7 @@ reg_dac: regulator-dac {
 		regulator-name = "vref_dac";
 		regulator-min-microvolt = <20000>;
 		regulator-max-microvolt = <20000>;
-		vin-supply = <&reg_5p0> ;
+		vin-supply = <&reg_5p0>;
 		regulator-boot-on;
 	};
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6sl-kobo-aura2.dts b/arch/arm/boot/dts/nxp/imx/imx6sl-kobo-aura2.dts
index 657d0f1b6115..47b05207574e 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sl-kobo-aura2.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6sl-kobo-aura2.dts
@@ -211,14 +211,14 @@ regulator-state-mem {
 			};
 
 			/* IR_3V3 */
-			ldo1_reg: LDO1  {
+			ldo1_reg: LDO1 {
 				regulator-name = "LDO1";
 				regulator-always-on;
 				regulator-boot-on;
 			};
 
 			/* Core1_3V3 */
-			ldo2_reg: LDO2  {
+			ldo2_reg: LDO2 {
 				regulator-name = "LDO2";
 				regulator-always-on;
 				regulator-boot-on;
@@ -231,7 +231,7 @@ regulator-state-mem {
 			};
 
 			/* Core5_1V2 */
-			ldo3_reg: LDO3  {
+			ldo3_reg: LDO3 {
 				regulator-name = "LDO3";
 				regulator-always-on;
 				regulator-boot-on;
@@ -282,7 +282,7 @@ ldo10_reg: LDO10 {
 				regulator-boot-on;
 			};
 
-			ldortc1_reg: LDORTC1  {
+			ldortc1_reg: LDORTC1 {
 				regulator-name = "LDORTC1";
 				regulator-always-on;
 				regulator-boot-on;
diff --git a/arch/arm/boot/dts/nxp/imx/imx6sl-tolino-shine2hd.dts b/arch/arm/boot/dts/nxp/imx/imx6sl-tolino-shine2hd.dts
index 4c655579f43e..64a74719c216 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sl-tolino-shine2hd.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6sl-tolino-shine2hd.dts
@@ -276,13 +276,13 @@ regulator-state-mem {
 			};
 
 			/* IR_3V3 */
-			ldo1_reg: LDO1  {
+			ldo1_reg: LDO1 {
 				regulator-name = "LDO1";
 				regulator-boot-on;
 			};
 
 			/* Core1_3V3 */
-			ldo2_reg: LDO2  {
+			ldo2_reg: LDO2 {
 				regulator-name = "LDO2";
 				regulator-always-on;
 				regulator-boot-on;
@@ -295,7 +295,7 @@ regulator-state-mem {
 			};
 
 			/* Core5_1V2 */
-			ldo3_reg: LDO3  {
+			ldo3_reg: LDO3 {
 				regulator-name = "LDO3";
 				regulator-always-on;
 				regulator-boot-on;
@@ -346,7 +346,7 @@ ldo10_reg: LDO10 {
 				regulator-boot-on;
 			};
 
-			ldortc1_reg: LDORTC1  {
+			ldortc1_reg: LDORTC1 {
 				regulator-name = "LDORTC1";
 				regulator-always-on;
 				regulator-boot-on;
diff --git a/arch/arm/boot/dts/nxp/imx/imx6sll-evk.dts b/arch/arm/boot/dts/nxp/imx/imx6sll-evk.dts
index 814401486792..d20d2735cab5 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sll-evk.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6sll-evk.dts
@@ -633,7 +633,7 @@ MX6SLL_PAD_PWM1__PWM1_OUT   0x110b0
 		>;
 	};
 
-	pinctrl_wdog1: wdog1grp	{
+	pinctrl_wdog1: wdog1grp {
 		fsl,pins = <
 			MX6SLL_PAD_WDOG_B__WDOG1_B   0x170b0
 		>;
diff --git a/arch/arm/boot/dts/nxp/imx/imx7s-warp.dts b/arch/arm/boot/dts/nxp/imx/imx7s-warp.dts
index 25f38acc5350..b1989013c1a4 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7s-warp.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx7s-warp.dts
@@ -272,7 +272,7 @@ &uart1 {
 	status = "okay";
 };
 
-&uart3  {
+&uart3 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart3>;
 	assigned-clocks = <&clks IMX7D_UART3_ROOT_SRC>;
diff --git a/arch/arm/boot/dts/nxp/ls/ls1021a.dtsi b/arch/arm/boot/dts/nxp/ls/ls1021a.dtsi
index e0b9ea6dd510..af518fc08809 100644
--- a/arch/arm/boot/dts/nxp/ls/ls1021a.dtsi
+++ b/arch/arm/boot/dts/nxp/ls/ls1021a.dtsi
@@ -721,7 +721,7 @@ queue-group@2d10000 {
 					<GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>;
 			};
 
-			queue-group@2d14000  {
+			queue-group@2d14000 {
 				reg = <0x0 0x2d14000 0x0 0x1000>;
 				interrupts = <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>,
 					<GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>,
@@ -740,14 +740,14 @@ enet1: ethernet@2d50000 {
 			ranges;
 			dma-coherent;
 
-			queue-group@2d50000  {
+			queue-group@2d50000 {
 				reg = <0x0 0x2d50000 0x0 0x1000>;
 				interrupts = <GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>,
 					<GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>,
 					<GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>;
 			};
 
-			queue-group@2d54000  {
+			queue-group@2d54000 {
 				reg = <0x0 0x2d54000 0x0 0x1000>;
 				interrupts = <GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH>,
 					<GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>,
@@ -766,14 +766,14 @@ enet2: ethernet@2d90000 {
 			ranges;
 			dma-coherent;
 
-			queue-group@2d90000  {
+			queue-group@2d90000 {
 				reg = <0x0 0x2d90000 0x0 0x1000>;
 				interrupts = <GIC_SPI 157 IRQ_TYPE_LEVEL_HIGH>,
 					<GIC_SPI 158 IRQ_TYPE_LEVEL_HIGH>,
 					<GIC_SPI 159 IRQ_TYPE_LEVEL_HIGH>;
 			};
 
-			queue-group@2d94000  {
+			queue-group@2d94000 {
 				reg = <0x0 0x2d94000 0x0 0x1000>;
 				interrupts = <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>,
 					<GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>,
-- 
2.53.0


