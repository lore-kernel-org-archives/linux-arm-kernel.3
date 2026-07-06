Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AC5EC44502
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 18:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=P9jpAlBCiiA3kawvpT/XdJ+8Y/o47jPbktRYliMwimA=; b=1VzrCtQVZfsHrIk0sX3x1HfVv8
	nyjfQ5arrcdLClc8hhkJjJ65TVeO0hiQe/k873qN8LzNZ04Gi1j4Ols0oo/kRmxOlZk9eIS7c8Lrh
	x/Ns6yzD5xGuwTDXEbIx8KBezJIBheURUfa/uDapS3O5OdiF1+W7p1SgQpatiCsjiSM6bxG+nKScc
	YnEInx34vdUm1uR74313xy44Bt2whwZbvqignG46/2Zb+DUqqsNR9IHrlUPZVtg14feebgq/RIym5
	9FWYhdV2QucvvgngEwo0T2HWFwPXGYOdyOCgtU1TChEvHtRkYskNXgTXP+57qpHCj6Cf4TUsruTmN
	leSinHFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgnfa-0000000DHyj-2wGl;
	Mon, 06 Jul 2026 18:03:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgnfY-0000000DHxl-2G8f
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 18:03:49 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FFCnf972267
	for <linux-arm-kernel@lists.infradead.org>; Mon, 6 Jul 2026 18:03:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=P9jpAlBCiiA3kawvpT/XdJ+8Y/o47jPbktR
	YliMwimA=; b=nKh5ZZxBa3kB7iPP8aqSOk2ssnjxifUKfLbHryOXna9ZcjjqbXC
	4vLkZ7S7It3+6kus+AOhjqSLq8SwdrjTxbEJuGHihS8GYXSlm294SKplOO7DMIT8
	6eSQ5f5tRUVGgOBYTU1Ki6w9+fnOui7CQZMOG2D5wQTMIT+e9b9L+e/vWZmwX9jc
	gJpayWxUaTTIjFHSjZ5NT4lXHBmCpEPxQx2rn/Igk9FvceanpPxcAuOL7b7Aj5p1
	V9kr5KwpJMpcSFuOeXVI6hzYKbCaD5ngLBDlDlLrbiTWNgbFka1msxPtiO6H+xK8
	LOFK86iBroLz8e0LDWsXD7dM3AufEI9X4Dw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3r26n7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 18:03:47 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5bbd4255f46so610619e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 11:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783361027; x=1783965827; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P9jpAlBCiiA3kawvpT/XdJ+8Y/o47jPbktRYliMwimA=;
        b=TmjSi+EqPiFXTh2FM9cfYX/v+RROuz+r+8WCb9wJ2JvucBYwV/FZXVL6W79WIlz3oY
         Q9nDiFQ3aYAJ4Rc5Y7P7b1HjEque1sGv9G0qSCUGD79Uv2gaHDwoa4sEO43IaXhwdDS2
         G6uPwSmSAqEp2BUppOyWWVst2iGww+bRPmiXRluth/SPoPr78vCPcae5isEjnbubtcti
         /MdyTVeaGsSAzJqY4MhN6ZTBavyNJUCco1LPcLeI6FYj0Go/KSHLQ678DI1Mo5CUkg0V
         49Es9sCsvth3CfRflaeONBp3+d1CjKLZ3XqXyHcBNYhzWnOkwaim8eBZ9zwHDdU6Y4qW
         FtlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783361027; x=1783965827;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P9jpAlBCiiA3kawvpT/XdJ+8Y/o47jPbktRYliMwimA=;
        b=c9hf9OHMCjV61Yg0DvkjA6IZkDCoIvnAKfFpj1Wr3sU60AzIP9dzxMBK2b3q05Qvag
         qEQDEwyP0NR+fFsEcnoRFXURfxhVLK8ZGKiUswCZHzMq26QSiJHgGdyo7zhP+Fx1APXv
         rm4tZS70UmzkD924NMB9kvwOIWjIi5WPIUxy7BCNp6Nihlis8fgx28f8lmwizISw1hr4
         RScRYvVU1m622KjZfSb6ryNsASqKFKV/ldkPBHgkHAGFxbvGZ6riFQhygupDs6XQHfpI
         NrveLAwAilrlIkbc2EDw99r57/IaSMSc6IXtFUiEEwGYTbaqKJLaDsHwAo+4QeJCtK3P
         nTsg==
X-Forwarded-Encrypted: i=1; AHgh+Rq/pOJLaRAv8uY1Sm2tiGEdmF8cwwRrr9ZMmVBBYqFTNKSUg3Vqszsnot33YyYMBGRf6NcWW98pdptLQzVPcfnS@lists.infradead.org
X-Gm-Message-State: AOJu0YxJ7tZVz2Z/hyCZacBKvTyLcKmwShUgL9EKnV2XOsxqtEx84q5P
	+5ppMMHWAw9VRR/H7BhqhK2MpVkJV1xWjoDYTOandV3XgCw1if9kNc2izlZbnNJBB1ftd5nYz3g
	NIY1D6uekwA2E1vkmoMC2KqlaGTa54hmf5vMUgcmhDdT5r1Yf3KEvFGHkAAWBIx3yat3yOAwczR
	zYGutNCZpmhg==
X-Gm-Gg: AfdE7cm+Yofe0wOHpQNwXJuJcAUdqNo5P6pPc5u96JQPgOVOU/IsXKgtWpT+1LmFvRn
	CZIIGelRLwUFD4kJ7xBmKMGUijVMx67Y6pr2nS+3CyEXkXyl1QfzT5zDsv2q2U/KNdRs4ECNggU
	2p4GyjJL9zMKkshAf37AtoW6a0gw6Ycif0p7K1IrPhHDBrxGwwhY2wMz6CkhgYWvjjF2FXlhmJO
	W9loc2Mbz+kppUTMVkz5RUXPbwBLUvgMHdMSNg3Km5GL5go253UxvOCZMKgNLD0jyBSs853ivDF
	A9sdjeXHqgDb0aB44EVUd/zP3Dphn2ZdCwZeO6lvVYFrAqw5HcYXza53m0fOVsOySpLXMTnzXEJ
	A4w1hMtzB6xMKH89MfOzfCcgXz80=
X-Received: by 2002:a05:6122:6e0f:b0:5bd:71b1:d5c6 with SMTP id 71dfb90a1353d-5be9071c985mr891908e0c.4.1783361026903;
        Mon, 06 Jul 2026 11:03:46 -0700 (PDT)
X-Received: by 2002:a05:6122:6e0f:b0:5bd:71b1:d5c6 with SMTP id 71dfb90a1353d-5be9071c985mr891880e0c.4.1783361026425;
        Mon, 06 Jul 2026 11:03:46 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e00b769asm1108555e9.14.2026.07.06.11.03.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 11:03:45 -0700 (PDT)
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
Subject: [PATCH v2 1/3] ARM: dts: marvell: armada: Correct indentation
Date: Mon,  6 Jul 2026 20:03:34 +0200
Message-ID: <20260706180333.648401-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2974; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=wxqlQgOFlxU9wtZFIj+bxUB6IUCGyKInUDvrV2eduxM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqS+317/9xR+re4ch/w/EUA21oeJ2J8KO0WF/GC
 1JgRkgO492JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakvt9QAKCRDBN2bmhouD
 1zacD/0euTfB+3Dq0X80/dtVuLMT0xR4YOJa6nhiLZyH2OOeGEPx+IDWJ91aMGvxBpsG70IINbQ
 EqDpzCpbW5q4GafLxAQiYMrjZbn8quhJ6aIHX5NfQmrSGPyNC27rFLyyBwJcFeWmFJzqocnf6v7
 YuGb82x/clursl5UmJbcOmOynJLXrpFW7XxPheAnLrnHhb/iWkJhGwcWmODnM5pbDDYQLATdwuz
 CE/LtiZPe5W0tA1VLiwL9x9WfGceIsZ2aoSChLJuKbPA7HCCOx6S9N5b/i0OL1k0ywmtWFZt/eD
 f7eoRsnC2sEhS0rJZxUVa0He6E8sTcTC3HjpjSANIkQPtQgUsU3fhbZeoDZIUWCm0es4r0QGdWr
 yZyyy6h8rODECWvwJ/bqHvmAEepfY5pBS8Wil6UgmWzG8A5Wbylaw/jt4Ow+U11eut3XWhIe/km
 itdAOVnJOWZjQdD51YkNzEt9zgCtm3XFuB1+qxjAvbmsjqS58GjYJ8r1YBozkUIfl2OvtSAf6GR
 07pcOXQdxKjn7fKd97V8NMECdz+dhYK4lmP2uJd85P/6QLiudEj5bBp5/ppPvTwDr4sssK5Hs/7
 Ku2qAmmdq5c/f2uxyjiXiIozDVUjDg5TwaG+pSp2jLxBm80JC2HA4hlFEjka7fht30ELYLUzGtc a8oBr08wpi1uZsw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE4MiBTYWx0ZWRfX+Cb3AYGnyQ9K
 QBstVlM0zb+OENXKjj0ZDs3IqRFOg2EFOwyoinsEgd2y4/auLWtOKzhQFW6jO4UpOc/6WkpMLEB
 xflJsfyO0L7fCbXCs+fEX544eje4uS0GKJ8EM3hR9Uxl0pca1iEOvOHJ/PxTprh/reS1mt2Op5c
 kpX8HVkZ4mDYXYYHKG7SEiinHqXA6DPUw3Fh1eev+AMNp+rmQiefDSC76cKkO+JESLf8jEBluvq
 uCNmUJ7shj34i1X9+gP2PgeTVyefbLZ5/2j/aJFkmmJjDHNiItW/ekRtRw+tXJ5X/mskwGxfIRt
 hNIj+iGCn6LZpxrNsEKsnUrJ7YmJBbLM/hCK6d+OzoDbs1XPQtQBQYCNKtfnlBmXJH2o2UgVYly
 Y7v9fDwNQSw44cqZk8BQk+vZEgHGe02pZ5ZmZagusFlmXPdJQyOkeqtBN4UYvcbrlGxISizh0DL
 0ZpGa9cu39VBdNSaSow==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE4MiBTYWx0ZWRfXwd0sBoNUjNnK
 7hogWSS4rktKeuL/5EDjLJf3WrfcIESj1ksb2XHXisLwELCcsGvd0Rw6W4nNJFBebHlVE7EslEP
 /Nq3u2T8F3ysd6jhWDBLT7Sp7vDJBw4=
X-Proofpoint-GUID: EbN4IwjxFcOfpY4f_F0Ard5qH-rYfhtH
X-Proofpoint-ORIG-GUID: EbN4IwjxFcOfpY4f_F0Ard5qH-rYfhtH
X-Authority-Analysis: v=2.4 cv=OKcXGyaB c=1 sm=1 tr=0 ts=6a4bee03 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=YZ7BP_YtM1ypoUlq3ucA:9 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060182
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_110348_686534_04D146A9 
X-CRM114-Status: GOOD (  17.99  )
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


