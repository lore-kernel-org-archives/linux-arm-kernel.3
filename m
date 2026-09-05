Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FD89C624D3
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Sep 2026 10:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3fB3/oFUiPdNbZRmKDrxxmki7FgIcXOoLkC9JCNJWpA=; b=uA3KOivcXKY/yRKQb+r7p7A3uK
	Pdbm0sRh36vJcG5fQErWX4vPoGwnS+kMhyUqpbo900TP1xdxAM5Tsw3BJ5SPYNwIAGy+Uc/yncKwq
	k53BJa04x3sxSAAJ4K8aXaTW7bRiXmdRO0OYfxtf2mNjTMFs0JXXx14aPywDGoHDNVYHAFG7B7FEA
	eIB/o0WpqJdLGDFpL1RZUgOMVOFqo55zXl+4l2sJxb62bTbTLmkwUX56tfWwuR6iQhPb0MRAhwvhb
	+/zaby0xw8+sa2cEfSOa8/8wgAG9fNjN+JYpZoQc/V6vsjLUizX04R49ymNzZCKIZozRRlJFbJ2LB
	eEhtC72Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2nt6-00000003ziO-2Cil;
	Sat, 05 Sep 2026 10:44:44 +0000
Received: from mail-sh0chn02on2132.outbound.protection.partner.outlook.cn ([139.219.146.132] helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2nt2-00000003zgV-2qn7
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Sep 2026 10:44:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hDGl7HpjngTHihlm3MLlWJc3uRBRPTkPyemwYgd2B9sSL9U75ELtzUjyV6uTOGG6F5n1Q9ne8eVMIOmmEjtWkpYT8IAWTtKMWWH29dprbKFoWbZZU7pmSYhj/cpoGc6iwRVKA7Tf2bJ0bKnwGCWthgjbiOX4TyhfQItu6eIwhS5eFwJPeilC4LC826TPf1ptK0hn7uwCoR86TD1wyqqJd4bK1Puam4yMXuYCJCXEzKmk6zJ6GiM0b2B68wUB7ZSGM8d7I0j++CLUAo18WUztkywTN/MsSxOhg9hvQNie3Or+lNJfjg83OdL+G+CNFKyDzyy5kIp7HTCnPQaW9r6RXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3fB3/oFUiPdNbZRmKDrxxmki7FgIcXOoLkC9JCNJWpA=;
 b=WLMDhM8RNlIqG47QZUdu8dHk+pbIQl0DGmVF8bG0TzKsJi0sRtLvI+z701NDfli0EKP7hE2qFDrmgxWZOtMcgA7yE1EWE7MABFAGCGMzwFaG9CGlc5dhdsd7KlnGjNYkDpLHSqEuTwT4RoHqLcYAxhoUMogIS3RlExerLV7ITPaFvgFKUfjlXHv/ksascCYhU4H6fxGZDVtGg7clhbye0IJJ6aO1XIjHQf+I+Odim42MRjKoLNmQp2TUAIlbVO5iT9gWW0pylGWo6+7tfkIrCMRz83AJpKBmKRz3TxMlNjshXSiDES/rM2Jbk4dIiw0UVw3jBtSTl1PsnMsPWtWUBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1329.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Sat, 5 Sep
 2026 10:29:23 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0315.011; Sat, 5 Sep 2026 10:29:23 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Chia-Wei Wang <chiawei_wang@aspeedtech.com>,
	Oskar Senft <osk@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Changhuang Liang <changhuang.liang@starfivetech.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Jani Nikula <jani.nikula@intel.com>,
	Vitaly Lubart <lubvital@gmail.com>,
	Hanjun Guo <guohanjun@huawei.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alexander Usyskin <alexander.usyskin@intel.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Breno Leitao <leitao@debian.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	James Morse <james.morse@arm.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Stephen Hemminger <stephen@networkplumber.org>,
	Dave Penkler <dpenkler@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Dan Williams <djbw@kernel.org>,
	Mukesh Rathor <mrathor@linux.microsoft.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Alexandra Winter <wintera@linux.ibm.com>,
	Julian Braha <julianbraha@gmail.com>,
	Karthikeyan KS <karthiproffesional@gmail.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	openbmc@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org
Subject: [PATCH v2 3/4] dt-bindings: uart-routing: Add binding for StarFive JHB100 UART routing
Date: Sat,  5 Sep 2026 03:29:00 -0700
Message-Id: <20260905102901.126035-4-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260905102901.126035-1-changhuang.liang@starfivetech.com>
References: <20260905102901.126035-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: NT0PR01CA0032.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:c::6) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1329:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d854a5f-0d46-49ab-d473-08df0b388d6a
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|52116014|7416014|1800799024|23010399003|38350700014|10067099003|56012099006|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: KhwJR5bgD6sFqaFdZ6brp/QTstw8JZyU3Gkfe5NDIvie9CtKpsSTFsZx3/Qq740oUxH9QZVM5PEhkUAyqHa1beGftauYNwxUHvr3fRRSBryZlBb/SWYG0qmqjX+hQIlflBzq7rEi6BlxF1tIzL/WyVBJJ3Ifd7eaxymYSVGq4cIEvosMeaSCFkc5ZRDuhspz3jQGlTLO8SzyOe1rKbcSEEvIFC3z+KaLuu/tYW2xcUwEwDg0wjcjOR7Lhydf8Y2+G7B2oz5OYfVcDXPfvYwCHKf/ykVpWpzYalGgdU6+n5bfX7H3+t7C3R8rm5RiHG/4/SgzCNRv7flKy1NEPQepnr/PQs6fPU8Pzdps9PlHCJFhunyiYpo/kWNSO3tDX2NFwWevACOR8z8lmmRPwAXj9/acI29krkRu/cWBvJKELXGgAhQJbsyrNHIXgwDOntiYyDrhsqOaxKPcxFq2Q6QP1Es9EIBbJ1mrNcl+4wRap7bjRFhIxJx0LI4M89GLorhjEcA+vp0AtvJ2B9d6qv5dFYERgpUlIXTaUXoHHJj8+0jh1aPFNvb+0h3eOJm2gGqu
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(7416014)(1800799024)(23010399003)(38350700014)(10067099003)(56012099006)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GHK+t1Ymfnl/ijawcbM6x61uDKMoXr3ljApQQgmb6v32WYEC5j4ysWAQcGZi?=
 =?us-ascii?Q?AkfrcO4hoz3qPTBJeo/GtA13papnyHx7mroaOoiRZGDKj9VitGzGb1k4xDQB?=
 =?us-ascii?Q?LqN19yavRV/m/DHYftI5Js8AtHz8jsrIiQcGhQZBK17ryRYT/Q+zznedzkyV?=
 =?us-ascii?Q?zO3zEhgaXZMbSRuP8q4lRdUt8ehBtAYaIe/Pw5bK7karMiwAKksPsSPjai5Q?=
 =?us-ascii?Q?e5RqFjkGtH0iZC5/sSxhK2r6s5wvdWSXP+bZ7Gj1huNqVE0TjvMacM0pxOwl?=
 =?us-ascii?Q?6QAk55oFytskQEZ117nGR+cdLwgag35SIvp3XDTF9I289HO/zdgBuOaLXJ7p?=
 =?us-ascii?Q?+ib5vA0urqkEj0huR2/HdqE3TUzhh3YBrKez9v/glJdFc3tvB6k0ithCPQd/?=
 =?us-ascii?Q?7JW9EvIrkmltzT4DzVjvrNfxTWsD/FSNhpg81aWk0liGWjugIWM8X23jdRPC?=
 =?us-ascii?Q?FYJBd/GvqTPV2kHAVBJINm9uFeYikj0z6pQ3wfFmZZzXbM3jdB8sYoWljQ/l?=
 =?us-ascii?Q?s4RjOxwp8CpnWgIr+wLfaxqbO3U5iqSjW57/99L0NW4opD9pSfPxNtt8TcQF?=
 =?us-ascii?Q?HOA6g8FxEuVZfFMozUwmnEN3NQ+QL73QDwfLDgf78dDxGu/6dCcyRmOcjf7X?=
 =?us-ascii?Q?+3Xs6uev28sNEOX1DQC5ffx3L0FikKUQLXxNohVCHLvwqOOmXB+XZ2+rOcn7?=
 =?us-ascii?Q?OTbuD9MNd+KhmGmQbf8XbcjrXRjIepFDefmZ4xJTaffZ9u9UB+wKjxa/G35p?=
 =?us-ascii?Q?8EhrVo28SCMV4V5AleypJYMOFsmsV5STpfUi84ZoyXKhC3ocVZqBcGZo3WPc?=
 =?us-ascii?Q?HaXMXujJMEElHZ4xmTlcitP3bDRpPfa0o1wwjGpOZVIshdBILJU9+0FLQmtv?=
 =?us-ascii?Q?xCfhq+MzWS65Pqgc6KwTY4PHB+TVfd5kPDBMtusccf2Vz5AyWJ/f7One9eXY?=
 =?us-ascii?Q?2LzQvYa2Dc3IQ5PpbStZUCpBK8fyDoSh/LE9BoHMaZlbMjRE/zAuQe8ajXOc?=
 =?us-ascii?Q?xBzlfXHHRrR/zHalm1pO2seBgHItK7tlr0Jn5xeWiqKBTXwGgl7CBUVbxTC0?=
 =?us-ascii?Q?uiFS4edYGdlbVcRKqUdM0ruS5kSje/7ra7vjbffRmpkMBYmoAvkxHVyld5IQ?=
 =?us-ascii?Q?E7pcqxGIKGzSK0KduvH03vzlMb1zEW9dSlj2fE0xJ0OWIXhM/n0PhQR23mWT?=
 =?us-ascii?Q?wLe6kPHZi+5Ln6UvOqWJOFgykdQAQUAwEwsrDwp/ezSYBh7UwXk6naQnQTCn?=
 =?us-ascii?Q?Q+JNq1N4MMwAVvB9/lsdE3ihWvQyDbWeMatMNd5gKi/wLCBdcVhb7mCkTMgX?=
 =?us-ascii?Q?4Wh5blnRgKkfNElmKgxOcDgToH9Ih0i48buT3QOzvcHJudVyTwnp8z4PCmKz?=
 =?us-ascii?Q?e2CWFEqrJ54nqtwpobu6zH9sgeiD73bj8IQD3AcKa/s62fbtKeHIrOSzNLI2?=
 =?us-ascii?Q?7nqUapPuXwwJ8DJ9s4R4yAzTrCVynyMRXl4EDzqVoGJq/Ls9KVu6blMiqcBl?=
 =?us-ascii?Q?ml6VG0JTr5D8l4T0iezqBmVg76/tvx7EVYIqa22BfLRWvdmh9DqkYvXgqIoN?=
 =?us-ascii?Q?Q9dDSeBQDXsrh4vmFXEo415QCnPnPeXqVWiJWu+Bt8M0y6KeGTng9lUvx8Sr?=
 =?us-ascii?Q?1ngjJN+swTIKmmS5mSY8+yCfF9CKI1l7JnwW9WEmBb8gD3eBiMrLhwZVqK0F?=
 =?us-ascii?Q?spMrDCWfFXz0kVUdgPf1x4zavRn88NlssO3IViiEpJ6x7loLA7NF0ri3YnCw?=
 =?us-ascii?Q?DkEi4xgADkJFcj1w7McnofuLyITD9xIGXzwGCdaoqLZMySnoCJux?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d854a5f-0d46-49ab-d473-08df0b388d6a
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2026 10:29:22.9563
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S5OL1iUfifNxP2kGJaQ1XQsizjoE6CyijukUXfs5frO5zjfaLp2HCQTxWrMyYqmPakWW7zWOUEtdSAMWRIIniFqW+eSvJhklio2yE6VOh7aLdo4gY5le58Ep3BS1i6yp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1329
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_034440_714815_28B3C91B 
X-CRM114-Status: GOOD (  15.77  )
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

Add device tree binding for the StarFive JHB100 UART routing controller.
This controller allows dynamic routing of inputs between built-in UARTs
and physical serial I/O ports, enabling use cases such as Host <-> BMC
communication via UARTs.

The clocks property exists in the hardware, but the driver does not use
it.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 .../uart-routing/starfive,uart-routing.yaml   | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/uart-routing/starfive,uart-routing.yaml

diff --git a/Documentation/devicetree/bindings/uart-routing/starfive,uart-routing.yaml b/Documentation/devicetree/bindings/uart-routing/starfive,uart-routing.yaml
new file mode 100644
index 000000000000..1977f2ed20a6
--- /dev/null
+++ b/Documentation/devicetree/bindings/uart-routing/starfive,uart-routing.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/uart-routing/starfive,uart-routing.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JHB100 UART Routing Controller
+
+maintainers:
+  - Changhuang Liang <changhuang.liang@starfivetech.com>
+
+description: |
+  The StarFive JHB100 UART routing controller allows dynamic routing of the
+  inputs for the built-in UARTs and the physical serial I/O ports.
+
+  This allows, for example, connecting the output of one UART to another
+  UART, which can be used to enable Host <-> BMC communication over UARTs,
+  e.g. to give the BMC access to the Host's serial console.
+
+properties:
+  compatible:
+    const: starfive,jhb100-uart-routing
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - resets
+
+additionalProperties: false
+
+examples:
+  - |
+    uart-routing@11a42a00 {
+        compatible = "starfive,jhb100-uart-routing";
+        reg = <0x11a42a00 0x100>;
+        resets = <&per0crg 74>;
+    };
-- 
2.25.1


