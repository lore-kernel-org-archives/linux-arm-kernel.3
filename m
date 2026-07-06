Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA18DC43602
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 10:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=P9jpAlBCiiA3kawvpT/XdJ+8Y/o47jPbktRYliMwimA=; b=OkCK8HBCaC6W/Y3Bm2JP1k1pzx
	GO929RJGUoLooDg5LplABamP9Z2v8nWmsObh+D5/CyzJHJi99T0q6jWWj+ddJo2U0Hiu2twjASDhi
	GicfbYS2aS7/ITJa78qIEjxJExznf4+YogsWOv4cbDA9xIWJVfW8v2qlGqDWBcLPHPr5YvGgQOZqj
	4ZuuVCMAts5J89XVQ3y3gNhZuYX091UyIb6UD20KTFlZTnPF8hbTrcQWknsjV5xfVq0kiwodmlsWh
	74j8bXZ+cxaexmhcdFeh7D2gkGtJfkUR3A0JDGw14Za/4OX0d+0Nw8p5QoyaOZkZ34rKbJpXVMOhp
	sfdgF78Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wggPx-0000000CBQu-1BM9;
	Mon, 06 Jul 2026 10:19:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wggPs-0000000CBMe-0Iho
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 10:19:09 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6669Gxu7160086
	for <linux-arm-kernel@lists.infradead.org>; Mon, 6 Jul 2026 10:19:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=P9jpAlBCiiA3kawvpT/XdJ+8Y/o47jPbktR
	YliMwimA=; b=SpHgYMMaKwqxKEa9F6nu86/EEqJqpWcY4p+1YGFaTjhqZmFVU5a
	cOBjmzHqvyJI/Ae/gyDqbAgvTJuv8qjVsiGUYkW/50Kq+AkiClPlYLog6rINIzna
	024JDp62yZEmxgMoFKUA5c/V03eqMTr4zPzpLXq8Tue6h/rqMYgbmOF3Ah0LK5cE
	OeaSxXMtBX1op8UGkeCI7m3SbPFBYpKTZk+1yP1JaaoFy5qYCABQSjEvlegINhP3
	5bKw4I9gBSb0hI4/6IoTzM7zgJRrA3GxwzCOpf5qELdtbHL38kEZp9J+E49ftH/O
	dTdr3HRJY1nF2eSQp/D1wZ2/uAvoI5ccOng==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f89kgr83n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 10:19:07 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e6ed4fe99so485417385a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 03:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783333146; x=1783937946; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=P9jpAlBCiiA3kawvpT/XdJ+8Y/o47jPbktRYliMwimA=;
        b=QQXAvvfDLlohFXhtpSoc/84toMitOT0Yu3lGB9ROabIheFYuxrVRjYrU8wpGDv6Azc
         f3pKfqDXeId5bOE9+RrBdHUXrMYu4+S7+5XhDyjxr2iAUepbkfeoqceP5EvKxVW/L3mK
         cNUxELVpmnJuURio5xSF7P2hHFZqe1psPgbpQm/ndugyXFl4vH/RA5q4Hmt+CAnqv6gb
         FgWCfffM0+iu7v5Fiko/f22Ej4FkOP5rgphI+xusn8cDboLWhUvd9HxFY+5QDq0Becf+
         dgVLOw19k/HADcvNIeCLedX3IyTObBm+EKYKTl8RcAGTw3VZcbRLvXphSxTEAi+Aba72
         wYSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783333146; x=1783937946;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P9jpAlBCiiA3kawvpT/XdJ+8Y/o47jPbktRYliMwimA=;
        b=MPPM6n09dUjmC98ndg9TH99kC4cs3IjoXsRsIhxhpAZic52VkCQxzRLJvujVmS4nGx
         +wCDMfHT0B6e/OvOGxOtrbrrDKnlQWTHrYco5uhsZTJgo+YouVy03dn2Zozxyw1GMcvX
         HTKS79fLIlv6+DsF7p2kKMTPruk6a41M/E1fNCqZHrf9EnUCHNpj/LWtYWhbxLCwZoxY
         pBVpxGeLIkLFdsAKl8T6++rVBrM37iuYgKPSDi9eUT0MJRsKPvzNcmq5bWgjU8riN+ND
         VyR52qvrDdVx+rpJWDGyoxIm7370IgUPBy8oNAkw+KAN1yxVNLR8qWWGHXp2eimb8LAo
         DgiA==
X-Forwarded-Encrypted: i=1; AHgh+RpLfO6+eabqGr0iV4XQ+03EWmxMRw6ratjfRRHIxxqDwS34T1wTtI776EZuPpPX6kg4laSrZ+2x3VwwHatLN/oA@lists.infradead.org
X-Gm-Message-State: AOJu0YwgYE6ZG+ZFpUeSn8sgT43D1huCJrqkPaCOxw8SIOimCGOxEDnS
	CeyBoomnqEWLlkTu/xIf+gm4Qi8xrSF4t+zjqvgAi4F29WLVhen619D8A4h/RwyVHaKRVcE6jT3
	0E2tK1bnxzKe+rrGodaCUpHt2IiPZd5BAn3QLknYDJFYBc27a1vzpXbN2ibgxV5l40hN/eYs4hT
	eBnA==
X-Gm-Gg: AfdE7cmAV4TCtmZldzSjbBAYKR/lqJv8pY2D+F1ivX1FtV0gVifI381Lfl1P7CUU77l
	D6voDYbxgw+YVnqq/niHQNHDjfkK+oEDCvU5rNUUU0R4ZKYE2BtNUb6u5loXN1Ip81DIYU3z/r3
	t8U3DZY37ieptEHotDu+eNejkYuA8HU5+r6amsm8PIbpc1EiYiFWUaVD0GrHUf1xcoiyv8jnbag
	pBjMXHNWDemorI7X0Ihce/eMQe0TlV18DpHvM5BKQGcMt3cbyz63vz1H2VkYUogOya2QN+W04mI
	YN+8mAcEL35dknGvXkyAhS0EWIqSKGi9thxNsWXZalpOYV9+52H/Ua6+PdCtt/9s38CbAgdXthJ
	1r8xXLINf9HSoIxLy88aF8/fMMqc=
X-Received: by 2002:a05:620a:2987:b0:923:5e7:1664 with SMTP id af79cd13be357-92e9a422eefmr1265729085a.45.1783333146150;
        Mon, 06 Jul 2026 03:19:06 -0700 (PDT)
X-Received: by 2002:a05:620a:2987:b0:923:5e7:1664 with SMTP id af79cd13be357-92e9a422eefmr1265726285a.45.1783333145754;
        Mon, 06 Jul 2026 03:19:05 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47ad69519c2sm24506340f8f.37.2026.07.06.03.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 03:19:04 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/3] ARM: dts: marvell: armada: Correct indentation
Date: Mon,  6 Jul 2026 12:19:00 +0200
Message-ID: <20260706101859.341467-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2974; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=wxqlQgOFlxU9wtZFIj+bxUB6IUCGyKInUDvrV2eduxM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqS4ET7/9xR+re4ch/w/EUA21oeJ2J8KO0WF/GC
 1JgRkgO492JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakuBEwAKCRDBN2bmhouD
 1wnJD/0YJUwkHrb/pForF3bknos/A7hVNR0sFQOvWqWJKB4Fk8IJHyn3C9b2+XdMyNeHTaSwiIx
 dPDEoDP6YOPmvqS17obIK9OJjU7e4zgBBLo7o/nbNc18FzD5GKwi7J/YduzsRwE9nWpFMba6Itl
 16ra3Gp2XU6FN7EouKYFwSh9mWCfZ+MyNGO619Ilc4qb1HoJ7kzOwIuR1Z/iw70+keMAXmeMBCi
 /zwEBcplh60H8okS72wQWnLiRlZNPvDtVXaeaapz1Fe3q2nsJgE57u8GGZZZf9kU2QnULOVeRHe
 zqAPvLzUZzl65Z0zJgfZXFtxbtdXm3NxCePRfXD/vrDJR+CPdBCPgvo3br2PzbXaHk3YR/PiX6o
 P7DL1/+4B2RtSmkkC087e6Tdp2mUco2ZMDbKCYOy5cXKZdGKdVp9STqWCEvoLMil4PmrBCG3/4/
 ZW+xcUClbtlNI40sEQj5XYNiIqOtQxUbf8XjBLJDssm1Svo74+G7xX0gnbGSUM0wjVMtcnY83wE
 4Mwx73jkfJ1h3a2oD61hQVXdsMJeIjhBHT8TN5pFTc2yO+srw7BPDwXsQzoch8Ow1zqiDsIDGfB
 sq/hbw5Xfr/1b18hVxP8mD4f3OGYmLoaCFA/mzXueLnpBoChiiO7c0CScGbONBX2+grH/am5Ok7 nvTAa/HJbNycXqw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: OEKuokAuUMkSTSr7CLYLKuIR_tqTI0JF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEwNCBTYWx0ZWRfXznjfUj0vT5Ml
 mANx7AwgQBNg2KHNGC32SFhw8jxWbniXUClUDrrBI82SrgblPrdTzL81iXQg2afD9eLfGTpqury
 gWEdV/v+93fXLOEdwHh5vt/Pm7aQd8TAx0ZICHYBEkhuGrv8Rt3AlzQGDJRU0y5Xqv9/Qj3QUcQ
 Ncb6Qb03HJe6pdrKMq00WJJULLY2xmA6DcKDOd6us7oYy/621Y6Wu8/miRsO8V0eTyML5BFTmhL
 xGvSkps9OTPKHHD7evITFeNmkisV2zQBVfzx0RE/CYKYc+Wlv3zSUK0qimQ0ndxsgIFCTHqY8K3
 f+JUS8Ij3nwFJ2lG4DzXm5SSZu3QFgnYxlxZ7MKsZZA6wFQuUIFCSxsiHkzzxtDQ7bcg/Penuoi
 o6XYniCTboDkquAdgVzwfX9qdwfHoQWAafmwnOroanPYv5/WmkOozJDMPRnBK+GLdTmBD7b8LYx
 90ptPhtlhk9TSGRhlKg==
X-Proofpoint-ORIG-GUID: OEKuokAuUMkSTSr7CLYLKuIR_tqTI0JF
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEwNCBTYWx0ZWRfXz0DjYYXcH64y
 RKy3BSeCIm4PKVFkqS42UrWd9pabb7fyNegSDFgwCAxF6L/76omLSVFSVj1R1/dGlZkWkgTxz2e
 oUZOXDMElvwYgifuAfBXH5f2N74QYYQ=
X-Authority-Analysis: v=2.4 cv=c6Sbhx9l c=1 sm=1 tr=0 ts=6a4b811b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=YZ7BP_YtM1ypoUlq3ucA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060104
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_031908_121970_6B0A87B3 
X-CRM114-Status: GOOD (  17.29  )
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

Correct spaces or mix of tabs+spaces into proper tab-indented lines.
No functional impact (same DTB).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Ongoing bigger work for all bindings and DTS with built-in checker (dt-check-style).
---
 arch/arm/boot/dts/marvell/armada-370.dtsi  |  8 ++++----
 arch/arm/boot/dts/marvell/armada-xp-gp.dts | 14 +++++++-------
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/arm/boot/dts/marvell/armada-370.dtsi b/arch/arm/boot/dts/marvell/armada-370.dtsi
index 2013a5ccecd3..cf73287501da 100644
--- a/arch/arm/boot/dts/marvell/armada-370.dtsi
+++ b/arch/arm/boot/dts/marvell/armada-370.dtsi
@@ -63,8 +63,8 @@ pcie0: pcie@1,0 {
 				interrupt-names = "intx";
 				interrupts-extended = <&mpic 58>;
 				#interrupt-cells = <1>;
-                                ranges = <0x82000000 0 0 0x82000000 0x1 0 1 0
-                                          0x81000000 0 0 0x81000000 0x1 0 1 0>;
+				ranges = <0x82000000 0 0 0x82000000 0x1 0 1 0
+					  0x81000000 0 0 0x81000000 0x1 0 1 0>;
 				bus-range = <0x00 0xff>;
 				interrupt-map-mask = <0 0 0 7>;
 				interrupt-map = <0 0 0 1 &pcie0_intc 0>,
@@ -91,8 +91,8 @@ pcie2: pcie@2,0 {
 				interrupt-names = "intx";
 				interrupts-extended = <&mpic 62>;
 				#interrupt-cells = <1>;
-                                ranges = <0x82000000 0 0 0x82000000 0x2 0 1 0
-                                          0x81000000 0 0 0x81000000 0x2 0 1 0>;
+				ranges = <0x82000000 0 0 0x82000000 0x2 0 1 0
+					  0x81000000 0 0 0x81000000 0x2 0 1 0>;
 				bus-range = <0x00 0xff>;
 				interrupt-map-mask = <0 0 0 7>;
 				interrupt-map = <0 0 0 1 &pcie2_intc 0>,
diff --git a/arch/arm/boot/dts/marvell/armada-xp-gp.dts b/arch/arm/boot/dts/marvell/armada-xp-gp.dts
index d1d348b91c0a..65cc0373fe04 100644
--- a/arch/arm/boot/dts/marvell/armada-xp-gp.dts
+++ b/arch/arm/boot/dts/marvell/armada-xp-gp.dts
@@ -34,13 +34,13 @@ chosen {
 	memory@0 {
 		device_type = "memory";
 		/*
-                 * 8 GB of plug-in RAM modules by default.The amount
-                 * of memory available can be changed by the
-                 * bootloader according the size of the module
-                 * actually plugged. However, memory between
-                 * 0xF0000000 to 0xFFFFFFFF cannot be used, as it is
-                 * the address range used for I/O (internal registers,
-                 * MBus windows).
+		 * 8 GB of plug-in RAM modules by default.The amount
+		 * of memory available can be changed by the
+		 * bootloader according the size of the module
+		 * actually plugged. However, memory between
+		 * 0xF0000000 to 0xFFFFFFFF cannot be used, as it is
+		 * the address range used for I/O (internal registers,
+		 * MBus windows).
 		 */
 		reg = <0x00000000 0x00000000 0x00000000 0xf0000000>,
 		      <0x00000001 0x00000000 0x00000001 0x00000000>;
-- 
2.53.0


