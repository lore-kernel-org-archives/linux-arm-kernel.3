Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D85EBFF887E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 02:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J4S3ZvU6MLtbzW4f1ysU0lB+6POh1JrbKtbGwAooYlM=; b=P2pHcSi6K8PmBPsOpJ2MnfTngI
	KqItHeYPBTxu2navk88nNsG35yCjM56vou5yMZpEA5GFPKe0PxOohgJWhaATTcqcWxI0nT3tuDjGZ
	e+BTUOf1d0xh30IVdkVvrWv7PHqcJLTVR9J8Kgwb36n77TdAyltl1eFXedSoc+jEJvcNMwCiY+XU1
	0+BTj6vNaHMZxUh3TSkoiri5Byak8MlJ4dUAuUlD9GFWJleBnFuZwivsZ8Rh76RB0M2psosPeFiHK
	acWYBZwSyRXDQBCCJSEtUFrPytSrjDsLS2ea5PUVZNPGhan+wnFw4vhRHBPoy67Md810SsyijzjGS
	g7GcXg6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIHRG-00000004T7D-1BpK;
	Thu, 30 Apr 2026 02:47:42 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIHRE-00000004T5Q-0Wuy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 02:47:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CZ8R4fuIuuU3IEcJLJG4Xj8TRDtmxrkpFxG9eKlbjOMiv2QehuJ32eOAAtY63aEDkqTVmJFladF/LGd6WK3foxXO0Wy14htuSBFksW6bvdp6foqr8u7wucgfTduVPhinxUU+iBE7D4pfm87V7RTBG0asXn9CS3Pk4Jcr1h4KaC7w//CHPDI9gl2zG7X1lcUeMXjyJM810QU3O+eiy3AAx+YLsRT04vcRsskti8pyfopf0j2+kCi8mMux/hvFGEIEEp8a0WUO7J4QSp3OM9pFjB42wu6bNcopvVOrahphmPmpGsZ47qtOKj8qC7fMDYN+P2yqwN45Z/wCxeplvm0xqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J4S3ZvU6MLtbzW4f1ysU0lB+6POh1JrbKtbGwAooYlM=;
 b=kCUuoQC7uJGmkI6vtuwrvsqgwEzzo3tKhYitJuTHhtWHWi9/vl4sDfYBf0lxAxkfEc+MLjccEgMcdzAqQtBbSq0g6YR+mn1YFxH1zdIdGCy8BzljzrWjm0Y3/g/W4Ng3LvsnCS+4HiZseENugNqmizEzY0T0pjJY3S4Rw/D744ezt1fbL2cfpp48h2hgffrJyjVNX+TDdIcEAcqE2i/9/Kh8EJ3Hm2Zqg8m14UfqWB54BhGenPyQS0pMseVfsnZil46DixNQ1WqoLmIWm/NQTGnLpeB3N4OQDgbSc8tRpuj2/51qM+pEFULfZf3QTCQvyBWJptpyqEUw/Ez61D5v5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J4S3ZvU6MLtbzW4f1ysU0lB+6POh1JrbKtbGwAooYlM=;
 b=kZ6/J8/5GqBKvpWOpvPHWy74AASMg31OPdnpXa0pKoI2K1CQ1xPQcoBeLXlDlWX6wd3IEsjWqCguE2t101EVBkKlFtkKhRn/FZ+TM+ljVxL2qljaq/hKLMOHSLB3JGRuQn1qKvfW66Qykw0efcO5KD1aQGLRq5M27d+E3AMEfrnZwNr5cACFde24DJnFt/lJem+2ORMeBo2IxfJucN1MjszJB5XV1JECYWzkQyIaY5pLwmhNjKcnBUnfsvV62EeX6H7U5ClVQTZXI4zAsLps6zAGOn+D1CNyXodjdYnkcd/rk6s1Eg0Ypl4HvqkgCh5XsdTVZW4wycLnBJK5MaYTLw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DBBPR04MB7500.eurprd04.prod.outlook.com (2603:10a6:10:1f4::16)
 by PAXPR04MB8608.eurprd04.prod.outlook.com (2603:10a6:102:21b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.18; Thu, 30 Apr
 2026 02:47:37 +0000
Received: from DBBPR04MB7500.eurprd04.prod.outlook.com
 ([fe80::c291:543b:4bde:cee7]) by DBBPR04MB7500.eurprd04.prod.outlook.com
 ([fe80::c291:543b:4bde:cee7%6]) with mapi id 15.20.9870.020; Thu, 30 Apr 2026
 02:47:37 +0000
From: Wei Fang <wei.fang@nxp.com>
To: claudiu.manoil@nxp.com,
	vladimir.oltean@nxp.com,
	xiaoning.wang@nxp.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	f.fainelli@gmail.com,
	frank.li@nxp.com,
	chleroy@kernel.org,
	horms@kernel.org,
	linux@armlinux.org.uk
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev
Subject: [PATCH v5 net-next 02/15] dt-bindings: net: dsa: add NETC switch
Date: Thu, 30 Apr 2026 10:49:32 +0800
Message-Id: <20260430024945.3413973-3-wei.fang@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260430024945.3413973-1-wei.fang@nxp.com>
References: <20260430024945.3413973-1-wei.fang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0133.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::13) To DBBPR04MB7500.eurprd04.prod.outlook.com
 (2603:10a6:10:1f4::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7500:EE_|PAXPR04MB8608:EE_
X-MS-Office365-Filtering-Correlation-Id: 013c84c1-939a-443a-5f9a-08dea662d6aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|19092799006|7416014|52116014|376014|38350700014|921020|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: CYzK9xdxCSUnkDWtzhg/Q/GbFDyt9vYvQnqV0jUT1B+XSABuuniRFfWS3WfxsffObiGBF8C2h9dojIvkfGKZRsNspWFxPuxqM2oW/MFFBHKDtjYq8XSLzRpDdTsx38TMYoDvtIKQVfqa/IIoMKaDn48Lz7g8Duxi6+3k2O6pGDpl/FsSepeW/W8pH4duvxaqMS6k6SaQu4OkaQylyHDlPbI6W9DbyevIjEKYdLGN3iWspF8q3uRuDYOEngzHPDUl6KkDafl+gKJf39YB+Pem5WM3w4APnf8uqmYV44Gtur72TIDgOFmWyRPuPThL8vwfXb0+CpGIsaSsn9KYnUdiMWCOBhjp31pWLeMkmPJRfJRz4JmB7gWtaOkXLqO6iaVdAEe0SPVF7DEeYGcERzFs/oKcvOx/5LavK584z4k72H5+qTr0sg2Mc5x2aRC1nF2YrxhWu4x3pFQtlTGz2Xn7jfTRU9TldIn+6Oo60o1b/8fqtEdz6TTjJ9H6QQlQH8WvW10PhpqVAc0nEZkzNJMpzXcXgGcOV/6z9b8FktUt1IRtFXKr6Jsd/hG9/9+FNBt7S9ilV87hIPDCcjBMZzml1Ec4iLNQUCU2ZcLRNtwlXHvlcDQCQgQI6cnK3KuC8sYM9H9gIkpF7b2AwdwZGpBuWCQKpkVam2wFpjNeG1KtUt8vSgc7uGb63Naw6zMz7FfXR7XHUBHdl5Uz+kVXAVyry5jRAdAqxbE0hEBbO6h9IMTskWu3p848JnhbnEL0Vt9FliEXuI9GXsLAueSeKVDNaw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7500.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(7416014)(52116014)(376014)(38350700014)(921020)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?63zm8y68gR7GwbVyCFhiIXNYCjixGjxF6IhYlOSCkkvMbxG9YOttLOhgcY/H?=
 =?us-ascii?Q?hWcVX0hEZR2S1BKZb7NtALf+Fc6no3VRZh77kaa1UByg8AR2msQTh5Zk0uK6?=
 =?us-ascii?Q?ImbI3CuBsEL1Rr5VtyKhqagwOSCNzOOsvTJOn2yQtJq9mNeFbef+/S4Z3RM/?=
 =?us-ascii?Q?3szNGRJwrt04i/tr5dtP8C0nxmDB8pDD7qQvuoYG1sWlhB34hsTdC3Abx0Zv?=
 =?us-ascii?Q?tZnU/yjFB1W0SB1e+RCsua2F6aW7mbQXEubrXUD8lW0c9rgQUmRI6t6V/Gme?=
 =?us-ascii?Q?cncM5SeKpLHtXT9zcOBROa/QLwNxCj1jz4XMHqTapoxiWmHCzpwyCJoMJyIQ?=
 =?us-ascii?Q?GklrjWUhgYtbAaMo8+8mJmG0yXGrfXCGRYuHVPuoRW8tMPBSHx8rYu96ygMV?=
 =?us-ascii?Q?21TZHMWhKYdZbok2agPqdxuwWHF4zXesgQmtCEIYMD/boFJ3uh6lZL9jqPwx?=
 =?us-ascii?Q?/l3IaSl6SyrLKvvnsY+iVB2lq5d6hDH3zHS2LS1qi15bTptUSeURQiYZMvvB?=
 =?us-ascii?Q?QL726RjcOeCyy3a+JMGzsuBEXv3wa7VbCdCdxZkhtxOY+xhVIya/yhtqB9NB?=
 =?us-ascii?Q?DuN1voL5fP35NKP4arFu3MwTbUbAt/iMvkDBb0gRvyqNTOo6Y4l6UZUk5Ny2?=
 =?us-ascii?Q?wcm3vtNHujFQSiVxsyrKBBjTYsCbX7L7iTfkkS4RZKT+M4GilgAiJnqPDh3J?=
 =?us-ascii?Q?ijDPBA5zOiEPDAYjP71WsTr28qXuTDlL8pqLQZaJC+LQfbn6k1UVlMhPQze9?=
 =?us-ascii?Q?8sEbgskSJ625RuqCJ3eergP9kunEX8Nr1TaLFsYCJ4HNhiTTPIi06mnjQknL?=
 =?us-ascii?Q?f63AVglyU2ZFV23jVFY/NAQnY0O4d93jMeX54n83z4VpTJxlL4iwqTORNDIx?=
 =?us-ascii?Q?oXwPu293ChbXPOO6qnPj83xaIZelDeLLsN4MuSfu5TmNJLiKzRz6ysWYiVZu?=
 =?us-ascii?Q?X8ywm5PM4ckxzLJ5k1lWHPZJxUkwVqv2vuAGJndzFcFb3KImiPG5JLkFPMxO?=
 =?us-ascii?Q?dy5cJSskGPQc2jqOSimgyk3sSt0lJTZMxaRRZB/FqtvmlQuEiTMZKd3sydaV?=
 =?us-ascii?Q?7uj9BF4LqSFS+mwr5/CCK7TpCGTL18IeDMyTCCGp/p3lCM19StOrv2TqLs9q?=
 =?us-ascii?Q?Ru/x7rZyueRA2Y1MVNdJlmtLO4Gz5uxgBT92r0SLyS12qkQjitSzc//fTNdV?=
 =?us-ascii?Q?4PIbBb3F9pL2WMZp1mC2VKvhGnGSMYntjcLCJXKw0w2IhaRPT2OD36TdA81D?=
 =?us-ascii?Q?0+Ce9lSwlIz5E5tFdQ3rjr853YcWy61yn7GRZJAOyIDMlv+80DMbecW8K8aR?=
 =?us-ascii?Q?Le55FCpV+sTkwXMEBOsYaD519lYzYrsP3HEjyTBLeSJ422+JL5viiCODM7Xp?=
 =?us-ascii?Q?H4PahBoVQ5KpnbHKWAe86N3bT1ruLD6Z+Lf0RsYV/pka6upFHCO+BLCr21qc?=
 =?us-ascii?Q?IJGQrPNEFcnzXaq2wJTcy/3qePAWKwkWeL5bLbuO4gVSWZ0E7ecNP6lNJvlM?=
 =?us-ascii?Q?Ts5gA7Nl7YVuNkkso0Dp71u2hBG4MKn19UAiYPswichygkynvm7kvkIKhhYQ?=
 =?us-ascii?Q?2PrDHdSbY2JsOpg85l7AA58ZY+ADiOzWoBYtqECC6yu6dWycIonk5C+7PbYA?=
 =?us-ascii?Q?fxC1co2M4l6UxeJN+KFBrVVDhVWPxUy5shDBByJo6OLjCeP3E+Msi5pD5nWj?=
 =?us-ascii?Q?TyZteonb+uc5Wy0mJnd1hbJJ+fCJA3zye1FNZABhCn/PauTrsP8OIxOeg5aL?=
 =?us-ascii?Q?5FSmlDkYvQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 013c84c1-939a-443a-5f9a-08dea662d6aa
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7500.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 02:47:37.3125
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r4J53Rh9vf+eDg3hrZk448vmPgOefWFkcYrQ3La6vAo31WxdQr8KBIOf7Ovo/dPMGuX+iDLaKXhIkBP37BBn1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8608
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_194740_180372_304FBF99 
X-CRM114-Status: GOOD (  15.88  )
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

Add bindings for NETC switch. This switch is a PCIe function of NETC IP,
it supports advanced QoS with 8 traffic classes and 4 drop resilience
levels, and a full range of TSN standards capabilities. The switch CPU
port connects to an internal ENETC port, which is also a PCIe function
of NETC IP. So these two ports use a light-weight "pseudo MAC" instead
of a back-to-back MAC, because the "pseudo MAC" provides the delineation
between switch and ENETC, this translates to lower power (less logic and
memory) and lower delay (as there is no serialization delay across this
link).

Signed-off-by: Wei Fang <wei.fang@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 .../bindings/net/dsa/nxp,netc-switch.yaml     | 127 ++++++++++++++++++
 1 file changed, 127 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/dsa/nxp,netc-switch.yaml

diff --git a/Documentation/devicetree/bindings/net/dsa/nxp,netc-switch.yaml b/Documentation/devicetree/bindings/net/dsa/nxp,netc-switch.yaml
new file mode 100644
index 000000000000..988688bf4467
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/dsa/nxp,netc-switch.yaml
@@ -0,0 +1,127 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/dsa/nxp,netc-switch.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NETC Switch family
+
+description: >
+  The NETC presents itself as a multi-function PCIe Root Complex Integrated
+  Endpoint (RCiEP) and provides full 802.1Q Ethernet switch functionality,
+  advanced QoS with 8 traffic classes and 4 drop resilience levels, and a
+  full range of TSN standards capabilities.
+
+  The CPU port of the switch connects to an internal ENETC. The switch and
+  the internal ENETC are fully integrated into the NETC IP, a back-to-back
+  MAC is not required. Instead, a light-weight "pseudo MAC" provides the
+  delineation between the switch and ENETC. This translates to lower power
+  (less logic and memory) and lower delay (as there is no serialization
+  delay across this link).
+
+maintainers:
+  - Wei Fang <wei.fang@nxp.com>
+
+properties:
+  compatible:
+    enum:
+      - pci1131,eef2
+
+  reg:
+    maxItems: 1
+
+  dsa,member:
+    description: >
+      The property indicates DSA cluster and switch index. For NETC switch,
+      the valid range of the switch index is 1 ~ 7, the index is reflected
+      in the switch tag as an indication of the switch ID where the frame
+      originated. The value 0 is reserved for ENETC VEPA switch, whose ID
+      is hardwired to zero.
+
+  ethernet-ports:
+    type: object
+    patternProperties:
+      "^ethernet-port@[0-9a-f]$":
+        type: object
+        $ref: dsa-port.yaml#
+
+        properties:
+          clocks:
+            items:
+              - description: MAC transmit/receive reference clock.
+
+          clock-names:
+            items:
+              - const: ref
+
+          mdio:
+            $ref: /schemas/net/mdio.yaml#
+            unevaluatedProperties: false
+            description:
+              Optional child node for switch port, otherwise use NETC EMDIO.
+
+        unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - dsa,member
+  - ethernet-ports
+
+allOf:
+  - $ref: /schemas/pci/pci-device.yaml
+  - $ref: dsa.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    pcie {
+        #address-cells = <3>;
+        #size-cells = <2>;
+
+        ethernet-switch@0,2 {
+            compatible = "pci1131,eef2";
+            reg = <0x200 0 0 0 0>;
+            dsa,member = <0 1>;
+            pinctrl-names = "default";
+            pinctrl-0 = <&pinctrl_switch>;
+
+            ethernet-ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                ethernet-port@0 {
+                    reg = <0>;
+                    phy-handle = <&ethphy0>;
+                    phy-mode = "mii";
+                };
+
+                ethernet-port@1 {
+                    reg = <1>;
+                    phy-handle = <&ethphy1>;
+                    phy-mode = "mii";
+                };
+
+                ethernet-port@2 {
+                    reg = <2>;
+                    clocks = <&scmi_clk 103>;
+                    clock-names = "ref";
+                    phy-handle = <&ethphy2>;
+                    phy-mode = "rgmii-id";
+                };
+
+                ethernet-port@3 {
+                    reg = <3>;
+                    ethernet = <&enetc3>;
+                    phy-mode = "internal";
+
+                    fixed-link {
+                        speed = <2500>;
+                        full-duplex;
+                        pause;
+                    };
+                };
+            };
+        };
+    };
-- 
2.34.1


