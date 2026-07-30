Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EF5DC55162
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 10:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4LxfYmHR5L0zBw2a260tAcDoh7shWgndlmIo8JVY22s=; b=DykOEbwLlBqyfTpcm695YT8clK
	f/qbFKLBrgV6WFjQt/DYbG/Lrnq5525hlkCXyAw0C2W3QLApMg+i63M+tj2uWa9BnhnFuoO6c7Bef
	/LwKEScZe0lY+WDLa6cIekRB8i7d7Uv1pOgntJpI+LQkFCtP2Q6iAF4ymNZrLvyoLHE04d08ctHo5
	2+/Xt2x2JVNXHA3R6HePtAnIrTiFODj/urPVAGapnzP7jFt66nu/tXxmWnh5A/NwnZBwM+Fy02+cP
	nRviBNPruwTaMxbpLSPpMeJQyDmJ15QkLITY532dQWwK6Ipv290vtNikjmUXUcpwC2ngDmppNZbwX
	e5uJuPkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpOFS-0000000AFR9-0mUa;
	Thu, 30 Jul 2026 10:44:22 +0000
Received: from mx0b-00622301.pphosted.com ([205.220.175.205])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpOFA-0000000AFJ7-1MEx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 10:44:05 +0000
Received: from pps.filterd (m0241925.ppops.net [127.0.0.1])
	by mx0a-00622301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UA3stW3328748;
	Thu, 30 Jul 2026 10:43:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ambarella.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	com20210415pp; bh=4LxfYmHR5L0zBw2a260tAcDoh7shWgndlmIo8JVY22s=; b=
	I+eJwk2ohZai5wjE5R8jZ6eLR4eTSWvhyVoxviNcnM2/eRjry3up/lKquEFze/in
	G7q4a6m95lA4E/p8wvcQ1AZp7P2BDzcIVL2KUEsUpaWlIbWGVCebmUSJQwVnNulW
	rsa32xhlsuogapxz5PuCr8+yfjPOa8XnfCYpgjAGfCevq6N5Fg7wJp69WsFO6A/W
	4VdajiunOcRG6/s2ll9ax1oP4y2nkC/wMjaC+6JpZddqpRhkwVg70wz21lmbA6iZ
	3D+3SswQHgtjlM4X6Edz8YlD5ddMHTJuiW5ScbhA05rudShSkokhODacctm1gaZI
	19cgYocDHEZ9glwEBQTWZg==
Received: from webmail.ambarella.com ([12.30.244.130])
	by mx0a-00622301.pphosted.com (PPS) with ESMTPS id 4fq8twhnb1-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Jul 2026 10:43:41 +0000 (GMT)
Received: from ambtw-ex-se1.ambarella.net (10.2.5.164) by
 ambus-ex-se1.ambarella.net (10.1.4.9) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 30 Jul 2026 03:43:40 -0700
Received: from ambtw-cas3.ambarella.net (10.2.4.228) by
 ambtw-ex-se1.ambarella.net (10.2.5.164) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 30 Jul 2026 03:43:39 -0700
Received: from shbuild7.ambarella.net (10.4.8.70) by ambtw-cas3.ambarella.net
 (10.2.4.228) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Thu, 30 Jul 2026 18:43:38 +0800
From: Long Zhao <longzhao@ambarella.com>
To: Arnd Bergmann <arnd@arndb.de>,
        Alexandre Belloni
	<alexandre.belloni@bootlin.com>,
        <linux-arm-kernel@lists.infradead.org>, <soc@lists.linux.dev>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
        "Michael
 Turquette" <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, <linux-clk@vger.kernel.org>,
        Linus Walleij <linusw@kernel.org>, <linux-gpio@vger.kernel.org>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, <linux-serial@vger.kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, <linux-kernel@vger.kernel.org>,
        Long Zhao
	<longzhao@ambarella.com>
Subject: [PATCH 02/10] dt-bindings: soc: add Ambarella secure scratchpad
Date: Thu, 30 Jul 2026 18:43:22 +0800
Message-ID: <20260730104330.81367-3-longzhao@ambarella.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260730104330.81367-1-longzhao@ambarella.com>
References: <20260730104330.81367-1-longzhao@ambarella.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Proofpoint-GUID: w0DM6PpSMCrvEJjKZKVss7cCGHSuMjvq
X-Proofpoint-ORIG-GUID: w0DM6PpSMCrvEJjKZKVss7cCGHSuMjvq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA4MCBTYWx0ZWRfX5eO3aDpGcYYy
 BmCX+vFIW/tVcXB27bqAGAqf618xMTBWLS0o+EsxHkRvFICQedSGtSlsDJDkpgRQzJf+ja6nQri
 6i8EndLeWr647ocnln7D7+L8ZeWlsuKo/B+QmpOkOIMIL+4tg1UKjap75Awc3qO30abMd3Zh66r
 vmHqrn7pbP5linBitwVJr7tTBshvWVtFSjuAjOO7kSGe9eLPQHvqwuuGDjhBp81erEjsZohcYsH
 NDyYUN4SxCfZRXHQfABfVVFRRkfPxPOOQqHptszRtVa+1qNO8sIt/RH+c5vHEPawkj33mxrj88y
 c1IX2dIrlyaUDtwU3nTA17PcGM+nRicaAKgIGwhy2l3Ja9jejAUO2XQJmO1Nv2ZvxmXOxDdD7XK
 CEp/V+ZjuafjvdNuOho1KZ0fP6Ne2sccK00OjMP642BFKHIoyz5Lssa+VCX9MPFPSoqPTRaYH8S
 Gv5nSBn3/i2UP33ejzw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA4MCBTYWx0ZWRfX8F8tty7wmKtG
 P/fTtH2HLAv3/eRX0jkQ7swIKwftonN9qEEMjflOy9ujg8aoq87KlC73JYdoP0l2oftfrFd4TYA
 3ashrTRpzUfupZ2Q83hQ4Kc7udlIVEG9K+XykO7XpEUCpc9CjrUN
X-Authority-Analysis: v=2.4 cv=PNE/P/qC c=1 sm=1 tr=0 ts=6a6b2add cx=c_pps
 a=DgnZYc2JwZ3KnY28M5UqXQ==:117 a=DgnZYc2JwZ3KnY28M5UqXQ==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yXVIz-0bn9infC194UBj:22
 a=KblO7da7ppA7TBl3N-nE:22 a=gEfo2CItAAAA:8 a=ppJngBeKAAAA:8
 a=Y7lJEgl3tIs_xKLw27oA:9 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_03,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 malwarescore=0 clxscore=1011
 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_034404_485776_1113A83C 
X-CRM114-Status: GOOD (  12.96  )
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

Document the Ambarella secure scratchpad syscon used by CV75.

Signed-off-by: Long Zhao <longzhao@ambarella.com>
---
 .../ambarella/ambarella,sec-scratchpad.yaml   | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/ambarella/ambarel=
la,sec-scratchpad.yaml

diff --git a/Documentation/devicetree/bindings/soc/ambarella/ambarella,sec-=
scratchpad.yaml b/Documentation/devicetree/bindings/soc/ambarella/ambarella=
,sec-scratchpad.yaml
new file mode 100644
index 000000000000..2cca277674f7
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/ambarella/ambarella,sec-scratch=
pad.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/ambarella/ambarella,sec-scratchpad.=
yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ambarella Secure Scratchpad Registers
+
+maintainers:
+  - Long Zhao <longzhao@ambarella.com>
+
+description:
+  The secure scratchpad block contains shared system registers used by
+  other Ambarella SoC blocks through syscon regmap lookups.
+
+allOf:
+  - $ref: /schemas/mfd/syscon-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: ambarella,cv75-sec-scratchpad
+      - const: ambarella,sec-scratchpad
+      - const: syscon
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    scratchpad@e002e000 {
+        compatible =3D "ambarella,cv75-sec-scratchpad",
+                     "ambarella,sec-scratchpad", "syscon";
+        reg =3D <0xe002e000 0x1000>;
+    };
--
2.34.1

NOTE: This email (including attachments) contain Ambarella Proprietary and/=
or Confidential Information and is intended solely for the use of the indiv=
idual(s) to whom it is addressed. Any unauthorized review, use, disclosure,=
 distribute, copy, or print is prohibited. If you are not an intended recip=
ient, please contact the sender by reply email and destroy all copies of th=
e original message. Thank you.

