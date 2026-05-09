Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40A22CD37B2
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 May 2026 10:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1QIpneJD6m/S/80aesbxQwAdUvv860RySfeuq8k7Lt4=; b=iLUtNkfg8B094gYAXO089rgVXe
	ooBb8GGH2PHPoHykMtlr+X9wJhicoi5pdt1F9bLQE2k/LIVxgn4iQgJyuvG9/g/Xl3XFnmZJG11oT
	gotFyjIC7Ylzc5UA1x/sYJARh4OycbSAGeQ1XS0LDzacPGD1z6+HuUAly5TWIFIiFom3KL8SQp8p3
	/vWxRhvDazZrh8zZzdH7sirCmkyB6TWhu6QWFTh+zBNEb5zi6bnO1XbIGtNXIhUNxsYTmkZwcmg8y
	xpxKNtefQuHUCzpOuLhxMzMJ20H6YGf3uzz8jdu1BODuklq7vI+xOz6A4xbR3HjUwD2LwfFdV57SL
	eX+NTe7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLeuY-00000008kry-2JzK;
	Sat, 09 May 2026 10:27:54 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLeuV-00000008kpw-2L7z
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 May 2026 10:27:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AavcQ8nfH33tZ/5rAfK+dkQsRsfdt2Cb7uMStYhg2jaMPw1bILJ0K2bcunyc3bgRsvExHExwcCsY2vJ9DfvOIzYz7QWlvGqlyC0nhz6l+Kdo3JIT4KvJbCTpDX0CyGa84e3IQY9FpDPEKOaiWYVxPQOjhkU8DnXV5CwcIiKZOzePlIRID6iXo1yh0oxGnQfDXey9nPB+W+4c9r/EtWWViA2+pDnenAOQJRBS5aFW7Bewa2RGHBqbcPeozki7VmmgrIDR9pyXNbyCmDvf/wnokNOq5KOm2bWPaL5rnoyVAD/Yp2ICB+CfgQwuFTEKdRvNJo35M/X8/RThx214JmG91g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1QIpneJD6m/S/80aesbxQwAdUvv860RySfeuq8k7Lt4=;
 b=DUqAv1FWNpZ0/sF2PrWDXnneLj/Ag0YLY2zAXQ2WnbFErdAZiqV5LYOqYMlndnr6Us2kie9wjYtu+GtkW8ZkojAPAzBHVi9o0fnKBuCnMu9/oUn4xMQ3yK3NIpbW7JWrCFny4LkFe2dpgaRK9w2p+ovSTRTbEZlwb6n+Ay4DEyjgAsOmXoGsBgc4ENogT9vhazLHQLZbnv/t0J41Ui08t6yui5YRh+N2uh7crAnpRzls9B751aWJ4AjoqyIHvrjfELv/TdMuSVWhFh/R24Ry8vQjxFWnoUqaT/0Ca4BI6W/ULnMZ3ho5TCotLNO6uh4n9WiXwHSnmlcdjHKw2HTSYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1QIpneJD6m/S/80aesbxQwAdUvv860RySfeuq8k7Lt4=;
 b=jLJHM0R0Y8koKdC/+p5Q0XdaGi9BYQeMLWTPksbXFXCecBXs3ozV2zyUeoSvibKPBsntqcg5AhrBU/e74ak7jpir5KftaHE+uWs1A0W8VBB0AF5araeajjUZfxdmfx7iYo+meYC2d+efHtyf3vFAwN44xGVg9nvgCRv+2AKfvyYA4Rn4yPwdqcJbKHEyNFPQz9zGeMJgqmsOp5Q5W1BczROZJ1emR9GQwG+W0fpv85v6+AW6C/8EBssjp/G4PDNEoik4ZblGHQoPLIAyLaPpTiWDK6IRFbPHPqodoSYCKJvQVPXRikbjajBBMEeXMLyIxn12zsPSRGZUrj+mXlTPXQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DBBPR04MB7500.eurprd04.prod.outlook.com (2603:10a6:10:1f4::16)
 by PA1PR04MB10604.eurprd04.prod.outlook.com (2603:10a6:102:48e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.20; Sat, 9 May
 2026 10:27:47 +0000
Received: from DBBPR04MB7500.eurprd04.prod.outlook.com
 ([fe80::c291:543b:4bde:cee7]) by DBBPR04MB7500.eurprd04.prod.outlook.com
 ([fe80::c291:543b:4bde:cee7%6]) with mapi id 15.20.9891.019; Sat, 9 May 2026
 10:27:47 +0000
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
	maxime.chevallier@bootlin.com,
	andrew@lunn.ch,
	olteanv@gmail.com
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev
Subject: [PATCH v6 net-next 01/15] dt-bindings: net: dsa: update the description of 'dsa,member' property
Date: Sat,  9 May 2026 18:29:40 +0800
Message-Id: <20260509102954.4116624-2-wei.fang@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260509102954.4116624-1-wei.fang@nxp.com>
References: <20260509102954.4116624-1-wei.fang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0030.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::15) To DBBPR04MB7500.eurprd04.prod.outlook.com
 (2603:10a6:10:1f4::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7500:EE_|PA1PR04MB10604:EE_
X-MS-Office365-Filtering-Correlation-Id: f4b14a6e-8418-43ad-fd40-08deadb59d7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|52116014|1800799024|7416014|376014|19092799006|18002099003|22082099003|38350700014|921020|56012099003|3023799003;
X-Microsoft-Antispam-Message-Info: hhhd7zlMsd3DerYjENSEHx2c3Ek88RYuGwu5hsQW+Z4Nqaimdszv/Y+j56mush7w5N7l41x/OSWgVxskp99h8cuMX460gKk17cXg1GlKmDESUNiIeGB92U61S19SasCMh6pK24Lmd5tM5Ptt1GJcYhQZM/69KBtykcyisJn3C61ogCA2p9Q3YOMWkghtY6d7dnVctxUH6dC53dpAyebICKXzfebglgaaMVIHy7yZ02PgCybZ+17HNoYsoeB92bPP7IaR5OiqtTSmabHg1osirEwGbWfQsnvMctw6UG7xEXSGUZ/jLnnlpeMA3CdruiipXEa5tSsaY+eR64AyG/811XwVhiHM5byh+HQkpml8THknznrxJHCqZjLHMng8rN1D3xhX0VZFYmm0WINAFikJdqiZzdwt6xuGBUsX/h88n2kV5/QkcuAFA47K73oTojignSs+8+Zu+6H4vZxLl46pVsP8za4CCR0BkAQduxBdkXzN2Kk1Y3SULWEfw7B5EpadHNV7JZXZpxfNCZHZIE0gep9WaMdgT1Bxd0gaBGc8/nkqXqaiL6O3H3j2koSBPskryE7b0zgFrXsLEDZpTO0psFxCdBMchUqG/8kBuvnm8n4XJhiycMz7aQ4pVKcdCzYdb2ipkd3PpaKSt5wBfAb0JgADfmv+fIQz58u0yyApDQzxkyD4jZfvZLkDGTf3qgEzAoK77DtuZh86ggFKekENPiTj7FJjMunD+CAvlP0IWDzLT/8UZZAuTYEOtzcMMy5rd1oa3j0pbrEjTsyRXpBBmg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7500.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(7416014)(376014)(19092799006)(18002099003)(22082099003)(38350700014)(921020)(56012099003)(3023799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jsOCUZG8dRaLhm5YUo9oM7Qc5vzoRxkeDMEdJvaPMMp9HwCjmCUmT1YjJluW?=
 =?us-ascii?Q?m0l12KDoL6TmkTVSX8kiinPoQwLYqdPAM74XqrM1NztR9GN+DspTMThAYTZD?=
 =?us-ascii?Q?OqDdKrG1gcWfGpoEDlxZ6Dt1jfSsItIvWlpAYN1X0a4nEHf8XizF4wX7jo1V?=
 =?us-ascii?Q?+t11XsBVZgnY/LUhnZbzq8TwWyYtSnvj3m8kohTml2ouDmd9zBfDnwC9vtfR?=
 =?us-ascii?Q?EJBEmNB60lPJxb/A2rInTXnRiRskmR/KlUJwuhOFKy5xw0w4oHKDoR5Jdbcq?=
 =?us-ascii?Q?3RdCpBKpUIc07Ihwl21WPOxQXjLU1xKpTEaHVvE3XILIgnvukrZ+MujxqgeZ?=
 =?us-ascii?Q?1pA38Hx+dHYlgmVYp1lmrIHB2U0vyI/pTwgB4C3MOTo6Z7B7oACiQXjdoMhB?=
 =?us-ascii?Q?VUYuRC9q0orowVecH21MZYov8Ksrz57mOG2nZh6H3Bsl+qlpYt4CWNjJU7ak?=
 =?us-ascii?Q?5BX5TVSmGITM68h8Mw4mmLlUsIqn7DGqxdDU19SXPycvJe3HAJ8bytO4mYQZ?=
 =?us-ascii?Q?WhwS97dJrQhTYVkR27ljkmVqCfokkYLT0Iz1MmoFkFuS/0NtxjdaDhsJTMcB?=
 =?us-ascii?Q?BWKJzDtZBRyaANz6bCsmmJsYmAgNGgR4O9UgZGeNyi+vXn2dcwqYuzTd1oGk?=
 =?us-ascii?Q?KJuqZVTY4gFplFUDu68RQCpFaai4xOzCcHsSzaNM/6zjQTXI/v2Vxf8AmDzm?=
 =?us-ascii?Q?t/9FLt5McFq4/ZscfraMCgVGNg4N5iZTJQWrHDQq51xAMgxL1ByX9xssImiR?=
 =?us-ascii?Q?7dEleQnx4pE2z1IHLVw8LFL/MNpr44G0bY18c3CdZeAQapc8MShhrQCE9PS7?=
 =?us-ascii?Q?2rQ/bMtBXFaG8fKHZoLmXkMCMdiQRQ/HQBQridrZcuRsb4fGDEkIa7zaN6/t?=
 =?us-ascii?Q?I4lOxosEgSnF0Jivai8JZMiF/wwlUN29jXuqcffW0xMLkaA1gykel5nTnwow?=
 =?us-ascii?Q?sb84Fs/2KSNpGYPnpp040eydEkRcEWb5Vkb0TLkhXgvLAXcVdMQuSRooMPpz?=
 =?us-ascii?Q?0fFhpWnG1urRilTcwclhdssNebSAWp586YCuT5FZnistyW+wZFhPF+2gVP6E?=
 =?us-ascii?Q?mXvC987Ep4VwmvgNIyvPBi/Mx2ZwTKnr7QST1IRun032GJKBRyZfVuIqzghJ?=
 =?us-ascii?Q?NyFGfRAkUgyToqAUvGYnANSyX0wtQ3i332Pv0vB/TLyLrtdSuhLvOjP387bF?=
 =?us-ascii?Q?UeqJhvhDGmkF60RdmXeyokf8paMOSiAaHPNl0GgSr/ia4r4Ypcw+ZTeJoj4i?=
 =?us-ascii?Q?AqMpba4zxphKei93SF5ZON1ryKWrojMd6aRIvnM4VUA1MVAgSn75UbUdzm+S?=
 =?us-ascii?Q?iYT2s+PHARmiM9tih9lsUVwRvoQNwzGG9iUNrRDK7kJJdYTebkA/WNA+3kl8?=
 =?us-ascii?Q?u6lGBh+OQAgcDu9yvYNObIxWn0EPrBy/KiGRbL7F7yDjD+wOgO0YuDTPm1qY?=
 =?us-ascii?Q?RF+27HXXc/BOgLhyiI/syNFDcZ1kmpsqsT7+3Qj7tMnc1d4bEdkdNf93I97N?=
 =?us-ascii?Q?bHuDahiL/IgXqPuRXZFbWGUnWODiQF51bcqTE9oe7kRzpD/UZ0SQ+vs4XCq5?=
 =?us-ascii?Q?teDGyPjHubZkxV0/twh1Ck9Rz+Kp8347wO+a1Yz7QlJN73+P9VGDQMnuzprE?=
 =?us-ascii?Q?XscLhRMnyLAGUGZ6W0t3WFGTVIiJvWdbe6Upnfn6f5aW1ES9R6M6cT9UdBan?=
 =?us-ascii?Q?UmSovtUlGTd+RPKCd67u3e5WHSGvQ11gif/iaFJJr6aiupD5aHtdCtbK10fK?=
 =?us-ascii?Q?fhYwLrYGzQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4b14a6e-8418-43ad-fd40-08deadb59d7d
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7500.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2026 10:27:47.8362
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0zD46NPwAe3ivAw3tXBAUf0VKxe57CMIajt4bowN9dtXCKc7L21F7B/mpvv3u3cnL2lroCifr/QMf51WftRhTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10604
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260509_032751_596612_E5EAA536 
X-CRM114-Status: GOOD (  15.19  )
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
Acked-by: Rob Herring (Arm) <robh@kernel.org>
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


