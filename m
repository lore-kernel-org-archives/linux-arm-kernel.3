Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E077F1061B2E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 11:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b/XZWFlsxzM+0lZxykfSK1STJKtwotZ7hmQM6Y2ONMU=; b=mMg2Dz6bcCQnEfZhQ8prK1+7W6
	1EVshb1A2EItbcxOr0HKwoTaK6j7Kd5QRlxkI7r3q8845Dxm1WoUwGMRpsewkDvlX5+xjTyK/eYos
	TO5xvm+fPEcDMTbMk/MHPC+hhheRo1jGtvpSUXL9CCEELixfztkcJrsy9qrNF0nx4A9MdfjFdnDb2
	xa2lSFcK2kPUpEb3CGVS8oKtxLh/3YZXzouktkL5m9fmukClAp/JDgGjsoxGv6d5/kpcmicNEOP4/
	Gl9COOKTx39zMbVopYDCvZj1Au7E4B3l345cWmMOGQj5BuHqC1t+xLVIu87kUVB4BNDx7CeHYIXhW
	K9yBEsSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7XH6-0000000CrKm-3vuk;
	Tue, 31 Mar 2026 11:28:48 +0000
Received: from mail-westeuropeazon11010040.outbound.protection.outlook.com ([52.101.69.40] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7XGz-0000000CrIB-0e9z
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 11:28:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wsrG2kP5T5VXbMU31C43ZFknccYNXSwXEcVOJtjz6J1EQ/1G/5UMsjEWXFSlUL77gKzhd6cNiWMqe/Av+xV9ffS/FvZId2ZeNvUTByAFMjCLeROSj4O46T7qCrEwXn1pUw2pGR+FZH51ovTNk6BuXDBanSCj2VDWaT453Yw8EFJRDB/E+uYO2wdlZhxJrh61ii8EHaGqLA0naqve6eqCkhUa5kGse8scjpqNEzAURZzJqTZqNfdW11kHKM9B3504Riw/W/t+W0M+UtNZ3k5dGTpnXpzNauPH53xjeJe1jhR8vnJYrHydp7Vf0jU+OeV/ipk3Wgfn4vxOuBozPU3raQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b/XZWFlsxzM+0lZxykfSK1STJKtwotZ7hmQM6Y2ONMU=;
 b=boAQp2gw9/Q6qWslXKfT2ek3f9t6VjB8x8CgWK7CB7wM5uvk2u0jzb3iVtvYbHyGToS2/wODDTD2jPvFil/Gj6z88GcGjUMmc6SFfveu08hzZNBaw6xJbHYjVJGBCTEekD/yjA9pe7lRpdT6wx5AhQGn6ez6s9yMwjFo5eWEVMWARCyPt/jgQBxZCpirvWOsVgepPl7j1zKJjIKbjKqyP2n5PC2OHPQUFucBl/G+LYnRvBZ6cKw1L5w34oQrbZo4NIKR/7TLEyhbdea0ZHfGvp/rlbzjg+/2v/iDGIuBsx6zSZi9tOcy8FDloDRHjfji7deJR+WGgWv0TihvGTAcpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b/XZWFlsxzM+0lZxykfSK1STJKtwotZ7hmQM6Y2ONMU=;
 b=JHYA3vabjBC8kjFY8CrFlglWuMEoHzkVHAL7Ulpe4WT6SE2+oeblYu3GFnbUZtyFpVIk4f8fJX87gSlvWtsA9rYnOWGNxrO1tfTeV1HfFYR3M018OM8C3Kr6xhRr5r413zWZ9Z6MCTwlixE16mrQ8q0NylxPNUzdw88iXacIeMR8sDDlIqBFQ5Fklagldb7PakCupJTo1GmyeuUFvAzU/G4CMDPJNFfrcJAUVOXpK5BA83OPeaeWCAuwSMVpFXSh3H1AG9a0w8tP7rRE9PwckT0xPr+lYWxMS1emct5DYt1AVztWqHCg/leveF48End6tL29/VNUsagLnn4i8RdBKQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM8PR04MB7284.eurprd04.prod.outlook.com (2603:10a6:20b:1dc::8)
 by PA1PR04MB11406.eurprd04.prod.outlook.com (2603:10a6:102:4f1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Tue, 31 Mar
 2026 11:28:37 +0000
Received: from AM8PR04MB7284.eurprd04.prod.outlook.com
 ([fe80::9cd6:51bd:82b:98dc]) by AM8PR04MB7284.eurprd04.prod.outlook.com
 ([fe80::9cd6:51bd:82b:98dc%5]) with mapi id 15.20.9745.027; Tue, 31 Mar 2026
 11:28:37 +0000
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
	linux@armlinux.org.uk,
	andrew@lunn.ch
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev
Subject: [PATCH v4 net-next 01/14] dt-bindings: net: dsa: update the description of 'dsa,member' property
Date: Tue, 31 Mar 2026 19:30:12 +0800
Message-Id: <20260331113025.1566878-2-wei.fang@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260331113025.1566878-1-wei.fang@nxp.com>
References: <20260331113025.1566878-1-wei.fang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5P287CA0151.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d7::14) To AM8PR04MB7284.eurprd04.prod.outlook.com
 (2603:10a6:20b:1dc::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7284:EE_|PA1PR04MB11406:EE_
X-MS-Office365-Filtering-Correlation-Id: 699348f9-d19b-4067-0de8-08de8f18a474
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|376014|52116014|366016|7416014|1800799024|18002099003|56012099003|22082099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info: ic1szvQjiPROdUF1mzRcK3hDJ9uIa9V2y7z4E/0OBzpCoKxnPL7auQsnvZjwhm4ENJOXRIQ1HtVgnq0zNb5qWIx/cs+59+av0oZxbZJAAtQ+qF32C2rUNEaY3e47Ky2MdCCeRziZ+eXEYu0zYPk6tvPmYVbZDyuRWP6HuHQ6S26XQ/1/JU4SQY5z319CDumFceRuXFlQtZf/eXIxUkkffr3aNkocY+J3YBn0UKb4n6L7kaW/eFGRpL8nhW4Wp0V5A+GIMK/vhYr6DsEfFvJn//vrSssLHEdGQLy+06zJyzbeP2ion1oaQxQEQ0d2zxuy4RyNkM9xntrbyh9fgN83dJGY1LyZPQ3A1sVywwiz7f6Aznd4HfYsNUFxVc4u1ufuojk4zfFZNeiBbcOodT++0eEAS3dcbqVu0sXMdK0m39VM5l3upJkNUb7m5G1DZW+QlDu9SyKAGZ2lOPY8Vhluq+QBVsuhZY41iXEV8sZEtWVG9mjMDsY3pDglIjLsFu3UZAtMzM6fYlYzV+3dVRmKunhy6zFrRA3bpmYAf+DqaSqj/uXImLsT6AKEgSRKllOe7X4cd8QvubtvxaxjOtLc4MoyTGfU4Bmyb5yY7rZMrAqxxxTpGJUheri4afJTVLkwgFNsWw/016EwBTzyovLzMQP0+QpjFBxoUNaiSC/mGRVPZKd/1wsb9+sdh2ZUe3VMB0rpDfefyG3AGOd65eCchNukatPZ0TAw4/YVU/MZDr9nbTanE/+7deNj5YlZLIaBoCswX/Y89SGEmLSr7aRFPnngzjhURFzteoNPbU5d6RBedtqH6c/RYPhLOgBXMOUn
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7284.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(52116014)(366016)(7416014)(1800799024)(18002099003)(56012099003)(22082099003)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EkaFy9cFsnxnLcIGuBI1hx6ZbCFDVt30eevP9CfosK8OK96fyxfbBQJN30a9?=
 =?us-ascii?Q?0RtGya+EmLU1byj/El2Sbsb3QJNL4JQGpJw/0MxYtu8qeJyVtbFig9UrIYWC?=
 =?us-ascii?Q?FUfvZcpciCr1LsL9YQgNgpXPgAjY3LYgoY7xm6381ewROsHaBxoij4Nhx6Xa?=
 =?us-ascii?Q?CDx3D4z97DkR+QntocG2HWN79u20es0W3vRw/7P/pKgcwdE38W+vlI3Cd5eO?=
 =?us-ascii?Q?1QeYUmX4Zmy30d3Z1YyzxqqMcY5EzCsTlL6QbOsqUFd2v78TsW7dBFNprExF?=
 =?us-ascii?Q?Fkz9LiiypssjcebE48BN1A2RqS612apqm7QTB4JFnWVJ5oateD1W7FVaVpmi?=
 =?us-ascii?Q?LzC8v3eDKefMOpGvo5k3Hy/T+49GtyBoImsRurtcT/bel+QaEXh+qUwIBvbd?=
 =?us-ascii?Q?5BkNmqzx1Q2xYbsWdnmygGfEGp1wZ0d68w5pk3D+wzup4e7y4GUKLBJnTT1J?=
 =?us-ascii?Q?6UQ1jYjukLDXZ/2fPRBTjja6939/6t5+3wU+l6SowidqNpH2Tuox5l8lv2lA?=
 =?us-ascii?Q?R+nZClVPNOAs0RmHMrUD3Z9rvgxEeIb07ezK3X3OqQ3E6SozP1/K7/P6wpeD?=
 =?us-ascii?Q?r3Czg3DoMMYxphh/Pp+QgsKh4/DyKuy0mUkBkT5WEBWgnSG/AJbFyCx9rWd/?=
 =?us-ascii?Q?iv3l32sayPJNl3gEYGsneNQa/ghibW5JvIFSKPIdwdEGwwe0PZ22zg9x8oTV?=
 =?us-ascii?Q?fk+9a8ppykQditViQNxOeiu4hGFfOhdBS5Ivtm2gN3zczdUJwuQ8RSA2rIOr?=
 =?us-ascii?Q?a3fH/wk75mG/zW2RT/15FkZMvN780aZUsgDMGcqntGxELo8pL/fQ/ELjTQBb?=
 =?us-ascii?Q?BcG94lPSFNSVBT/z+7Hv4Mg6ws5wTQ8aygZyxRTRlF0vG8ck3G4htsPQLSi9?=
 =?us-ascii?Q?Y9x1Kz73nOFhKX4aPm5w1A9p9GvBC62CxvrsLzQrSmTJTxsdrOfakP3fiakV?=
 =?us-ascii?Q?DaInOgJD9GE3hEnW1dPvFfiit4DZjZBksyLixn/lR0QR1Zywlw/OaZjoLusF?=
 =?us-ascii?Q?qui9AjzaQmlrHO1U/wSTuJKU0yxG4fuvUAl8k5RIRdlpUSlwLdmUe4dx48Ey?=
 =?us-ascii?Q?K0zAN9jemd6f8eYA7SQ/xlQy2QaJ/ThJYqyu4O6FWbnnglKY0CRv9Z1+PLCx?=
 =?us-ascii?Q?HF9dSPgrz05se/1sLuQPo+M893v2O3WI0VYcUiq5wiEk2HPwblASd3n5JBwN?=
 =?us-ascii?Q?Ci+zzaBi7JQMi06CKwW0ZzxMd/eHqZA0qrLN17VToWs5aPNSEJdta93y2Xac?=
 =?us-ascii?Q?quuE10z9OFY5VGJF+1n6yuDfj54JrXWdlHRdXv9+XUEEmMXIjPDZkERboXxs?=
 =?us-ascii?Q?zXdRRujYvfPgXz6suBqzWBzghouFnicVluLgD75ioZr9TwArow6y1dHH1HHq?=
 =?us-ascii?Q?3+TtWERDBIG+EPBSKi491vWwubCCxPrco6UcKf+Eloujsd0qeHlea4hPkXJ8?=
 =?us-ascii?Q?hKGRFW45BitSvvOuCUWoW7PF3Zeldxv2Wj3XQqZNfFNRGgSGY04Y2Wl1em5o?=
 =?us-ascii?Q?3OzBO+DvmcbE5kuXAZK12wxURL60ifGlVtVP7CiTFZlXqh3F0EJ96SWs9M8Y?=
 =?us-ascii?Q?nMy9f11s65EqQQkiy/dGsMgcTV6uO6ZoXFBjoIGrL1LT5qU/IrVaDAGypOvL?=
 =?us-ascii?Q?+gaJB2Mh/Db1J9ltyXv+TIpR6RJ/h7V3pZu7NbojlAQPFMsT32wLis6JrjMl?=
 =?us-ascii?Q?1ujNXT8t9M3al5lDuY0pZ+DRjWOmxfnZhaCIiZE9dHUjdHt9K8xyMlE6Ofac?=
 =?us-ascii?Q?tvqK1R9xaw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 699348f9-d19b-4067-0de8-08de8f18a474
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7284.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 11:28:37.3375
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yt1Ep+oo/lW8DTeYOGJvAg6kQKp5iik2hrh8CI6BiAt2+/L17Mxkrjtvk0CP9gph7CnM2gmZC8Dwhvb2Hv4w4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11406
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_042841_201122_1DA5B5E1 
X-CRM114-Status: GOOD (  14.64  )
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

The current description indicates that the 'dsa,member' property cannot
be set for a switch that is not part of any cluster. Vladimir thinks
that this is a case where the actual technical limitation was poorly
transposed into words when this restriction was first documented, in
commit 8c5ad1d6179d ("net: dsa: Document new binding").

The true technical limitation is that many DSA tagging protocols are
topology-unaware, and always call dsa_conduit_find_user() with a
switch_id of 0. Specifying a custom "dsa,member" property with a
non-zero switch_id would break them.

Therefore, for topology-aware switches, it is fine to specify this
property for them, even if they are not part of any cluster. Our NETC
switch is a good example which is topology-aware, the switch_id is
carried in the switch tag, but the switch_id 0 is reserved for VEPA
switch and cannot be used, so we need to use this property to assign
a non-zero switch_id for it.

Suggested-by: Vladimir Oltean <vladimir.oltean@nxp.com>
Signed-off-by: Wei Fang <wei.fang@nxp.com>
---
 Documentation/devicetree/bindings/net/dsa/dsa.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/dsa/dsa.yaml b/Documentation/devicetree/bindings/net/dsa/dsa.yaml
index 2abd036578d1..801e1411e5c2 100644
--- a/Documentation/devicetree/bindings/net/dsa/dsa.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/dsa.yaml
@@ -28,7 +28,11 @@ properties:
       A two element list indicates which DSA cluster, and position within the
       cluster a switch takes. <0 0> is cluster 0, switch 0. <0 1> is cluster 0,
       switch 1. <1 0> is cluster 1, switch 0. A switch not part of any cluster
-      (single device hanging off a CPU port) must not specify this property
+      (single device hanging off a CPU port) does not usually need to specify
+      this property, and then it becomes cluster 0, switch 0. For a topology
+      aware switch, its switch index can be specified through this property,
+      even if it is not part of any cluster. Also, topology-unaware switches
+      must always be defined as index 0 of their cluster.
     $ref: /schemas/types.yaml#/definitions/uint32-array
 
 additionalProperties: true
-- 
2.34.1


