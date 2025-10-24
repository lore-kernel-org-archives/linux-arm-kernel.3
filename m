Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25ADECCD193
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 02:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=slc61vDsw7WGxQbx5bVC9rWYUS60mslnF6poCXrPq58=; b=amS3jOCRkG2+9oyocKnCF5Upt4
	n0nEu+Y2ZVK8s2WgvZvzTCjPNbdIuT2IX59Kc8hI0AzV01SN7YzhBnKoYRldqMbwrvPFAg22XiytI
	BjUnVM2LZzyODPG74CUGABGcGS5G0N6hI3ZB9tczzPR3d49UhcGAVCV4ISYKV/xGKDFLREPeJv7of
	CNEOCLtmI+LF6gs7GISGigeoRxquY+00kKEk7J4gZvVbGizF2steLNJFcdhImTDr3sIY3Dv8Qf9OF
	yeKpLGXyIHPMd/+ItaIYLwYZScLU9vRsXqU25O6W5i7VdyTUJcCB+z4MhSvEpwWaheK9fRAOzK4xd
	GFm4n+mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC7jx-000000083al-3NJC;
	Fri, 24 Oct 2025 02:41:17 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC7jv-000000083ZB-1R7D
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 02:41:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mUUzer6e4kNczcjyzUxa6REanWBY0oDX25hguZGO4S9+9dNyhht5OyH62Jye3bQH4WYS/wtALsTTH84ors4uTRh1ZP7hDZZcqHLVmzS13CoePOpfhIqxJH3bWSsMnaqoVy9veEtnsJeh4z5YFovnXBj6dVjdSFnUakjLM8/8lSBo8OzL1QydtvK3vc1/4BgZpo4WX5lrLPGJPKrlGkfrax8PJ5PRzAwc80fuJzP8Yn5HaXeFYgSnlcaBGEKFj1xidofZCg3Qy39VwZYSjlUPezi9xyW/3I9HjqPKzi9Wb2rV5kutWk0X4OecjFAi2hfpnMlA+YBtiTjbsyRczVrYuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=slc61vDsw7WGxQbx5bVC9rWYUS60mslnF6poCXrPq58=;
 b=KLic4gYS7Wkx8960za0xq9HMwV7B2pFjr261el8PPO7RBk+b5Rq0K8/qwgiVVgECl+cvlYHITLDf8ml7aQNODNSZu9YfGRePSUJPh3T4XStRyNe5jMPxCVH7m/B85izmvbRlNFxzBcDzys1cexP+LWyTi5IwUxIR8ndTU66X3yN3SXSKfNAXqLkUoBSXa7VVLkSplGAj58KgwXFXKt3BwHvFrockK/Oqf0srJOOvrfZP452ntCeJzQr+haUIf6jjVg+Nb0Vf6bWEAEncG3u+oKr5OePRVfaixgfpXAgWBOH/iBw4c3RRbNnMEhag7oO8kyrb+bklxe3ThTP0jSPhNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=slc61vDsw7WGxQbx5bVC9rWYUS60mslnF6poCXrPq58=;
 b=M0StxYIGd2uyOPjheBWTmtxmqPq6x6X+szdWmj0ys+Z4LTqvdce32jdaxT1M6pVn69zXoRktHJGD5jvTSNWGcPSA3KyVCkKiMQPEvh5fIihHDbjqA/eWJTlA7jMdKUMhhWxSomj1NTi+OuGLns+SeYtHC69DZRpVFYCa/1+hJr+BVhlgv0WMGjdQbPcdjt5yBKAP4ZJSu4GowIMxz+lZydmSOAIJOUCcLxLfHAcE8rsGrINuJBaMTPY5pSgpNqO5wnba/Yu3vLltRUjmDS19r9MdjOFUsK+YnGQUeYJp+P+My7LHQx8Z42O+VupZLOXaXMlolHGx8HjMp8nM2K2QjQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8833.eurprd04.prod.outlook.com (2603:10a6:20b:42c::19)
 by DU4PR04MB10624.eurprd04.prod.outlook.com (2603:10a6:10:592::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 02:41:10 +0000
Received: from AS8PR04MB8833.eurprd04.prod.outlook.com
 ([fe80::209c:44e4:a205:8e86]) by AS8PR04MB8833.eurprd04.prod.outlook.com
 ([fe80::209c:44e4:a205:8e86%7]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 02:41:10 +0000
From: Richard Zhu <hongxing.zhu@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	bhelgaas@google.com,
	frank.li@nxp.com,
	l.stach@pengutronix.de,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v8 1/3] dt-bindings: PCI: dwc: Add external reference clock input
Date: Fri, 24 Oct 2025 10:40:11 +0800
Message-Id: <20251024024013.775836-2-hongxing.zhu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20251024024013.775836-1-hongxing.zhu@nxp.com>
References: <20251024024013.775836-1-hongxing.zhu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGBP274CA0008.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::20)
 To AS8PR04MB8833.eurprd04.prod.outlook.com (2603:10a6:20b:42c::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8833:EE_|DU4PR04MB10624:EE_
X-MS-Office365-Filtering-Correlation-Id: b1407813-1d95-4b73-b5e5-08de12a6c795
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|376014|7416014|52116014|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rjTrjx2UlpbgaLC0g+6KLbdGUUPYyEY+R97Q61xEzrZG2BS8I53WYXvd0tMh?=
 =?us-ascii?Q?6kYX0VOk9ShYLwUygQxBL+uuWnaV+aK8CE1QXTHwj4R3ooWxtLY1CqVQIfPZ?=
 =?us-ascii?Q?XuLZ50IxKnqL8N63xIy0aOzIX69wkO5taNopa5hel7XEPYyGFybsJ318s77W?=
 =?us-ascii?Q?l/3MFKXQMBeutHP8UG5y3XwpkB+ARzVKbmMjdDWc7+wgcgF5BJjPacpMDfi4?=
 =?us-ascii?Q?3421aDwfcMRzbs8OMjlEOvRpN9Lcu0ZeVJvObRACNz3G7hrj2yM8096tOjSq?=
 =?us-ascii?Q?51M/ZBIa3IKddEXwAfxmTT+aG+KVMfaCSPmOrV7ahUt1LBuNXyufYCF56CmQ?=
 =?us-ascii?Q?RobIKpYhGC6eXhWsYov9Z+YoL6FtUn1sPEve7wymscg4nO3rsxvXmSOfrcja?=
 =?us-ascii?Q?O020/PGkeDRQUrc0dhLMN51XHswqXA5/UIEBz+akeAbhd7ABe2oiVTsLhWnM?=
 =?us-ascii?Q?zxLqkk9O4tEqdO61+LevRCDcXnqdZ/DPirmtCThlb2BK4YLcc2Qd/ILCt23O?=
 =?us-ascii?Q?MUPKVe4F/8sXx7M5Wks7lgFa8ZEhp5KYsuAiqBSZJ4NzpvQ3i5WmrpLtpCb1?=
 =?us-ascii?Q?OfLy3NAKSzH0ZQlMpO6BCCt3xzqhfFmcZP3RG/Tsc/oadfkH9GD9hMwFr8HU?=
 =?us-ascii?Q?IY8xOY3+2h1Mrkc8CTg15/nDw+VB2CJLL/FMYh102uGf8oE/CbT8TM7jwOEx?=
 =?us-ascii?Q?ikNQ1V1SmRV+LIWr8K1pjwZ7xScaQ6oRIeddydYa/fC7nwkgO18e2iviKl0r?=
 =?us-ascii?Q?c/nj9Z8NHDPMvKR2MlxRfsYfnHjo1baQFm2WA8Cii1beCXh8zCqbO9IQMcDX?=
 =?us-ascii?Q?ZU//1K7kDLWIqWFOjhg5GoFL8b/wmumAhSnTRcQrYGRWztvDRPK8X9Q03lWA?=
 =?us-ascii?Q?03R+QLjKG/H9+DNDytCaj4cf2x0WY9cmODlfPxpM2lCVVpQIO83IOwT4HxAe?=
 =?us-ascii?Q?lrqvOy1Jyk3Xm99dIgdCQXRNJZEq56FTwWLuFd6Z4Fx+UZj8s4S4UFgpOC2r?=
 =?us-ascii?Q?pX/jujTyE6tkXOA7DzVZzmpVLovFI0xnOY1Fw/3HLg1y1UqDoqf+Nl9o+EFX?=
 =?us-ascii?Q?mS76vaM4n23S0KR/R38M/7jW0OcJGUYHO4vt9PTsMWiC936zsuR3hzJYU+NI?=
 =?us-ascii?Q?OPQwpSo77GfWQXw2G0a9VYlRhXUjxbq6f5agsS2IYMkrq9/a9/l56x7OJzSR?=
 =?us-ascii?Q?sPfFL1G9xoYVmfppYTwdEYa6ujxDOL6Cn4njltfPjzqAIPyuDioicSse/PA8?=
 =?us-ascii?Q?52bo5DtQgYkgJVh0LeJyx9jMYhxtgUh6nHlO9fVDY7vEsG2Cq9soPFkYcf+r?=
 =?us-ascii?Q?+tU4QSnY5yApHLnAAJxwj8eoWuN7jkuMJ87LEx5lMI4tKhXZjs9GFVh6GMlA?=
 =?us-ascii?Q?eaXZ5Snob6NBSp0sgZzUL164Hv2cFtJmABnqVFaG3WodSp1zWkijcdKEQitN?=
 =?us-ascii?Q?I8hEIaJy2qmeWDQxFnnZGJM9HFDxK+fzlQQVwbG0j3FWerI7Y23KZ/Mvhvr8?=
 =?us-ascii?Q?YEvYEFDVQo6anVG6cjz9PhsLpFkM9aBQq5Yui3+ofXpusH2vr7iWotNSCA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8833.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ncm1wuuEpg+3Eb6ZVPUIHYDBr/3JHGVKfzpqzRQ6bF817hBbjV9wMh+m+CGG?=
 =?us-ascii?Q?9qoiF3tY4YXvq5saP9iiLOTvm1m5DlMXdSb5reT6WdEGD0jb5WkH40iwz7mk?=
 =?us-ascii?Q?2rZadVhRUpqexJH3kl2B7JchnxThws/Mmbe5J2nF3H1fMQBMN99cR71iI6UY?=
 =?us-ascii?Q?LH8U0+bPhFVAqIELjFk72BO7J7ZKcee/15MHj3yDyEKG4iMUms3VB0kJiqSW?=
 =?us-ascii?Q?jTdlW/reACJb3I8Wx1JhrMxabX1RgtN//8UbsaoJT282Ldz2NiHZMBoa/T93?=
 =?us-ascii?Q?s6zrZeJ940UAgip2qbqUqizXuxG29ujYJbf6nyI8+b8Nf0xmEdbwfkrNNEzp?=
 =?us-ascii?Q?llvnVPO3nS7doFWxVfE+s08DoEd33fMErGaT6MPQ4eIWET78fUaqhsZr9KvM?=
 =?us-ascii?Q?N81ONoC8JmKMsvsKDmqDWCoo8wAtqQnZxp3jOzM/usdO+SFx+BMErjXNL0IP?=
 =?us-ascii?Q?xQekUspM9foHDhdZpNCXsE+ijBLMMX5t81mk1PGJVeX9pRAR3ZhDwhspdody?=
 =?us-ascii?Q?vOk+eUj/I6i+7kQFh8JhxjmJqc5B//GnfEkM6FvchYfur3ZOLi/8wN/KYz7c?=
 =?us-ascii?Q?fGxEdv7/oEhKx69VT5S9yo/Nf+Aet/aGzd9RDX4tLPIkqBo4mDlL8DYtNYKg?=
 =?us-ascii?Q?Ph37m/SoEQiPFVnyV5JF+TqszSEZwDzn4dfWzsyfFNRhGS/wqYGbuXUdjfGB?=
 =?us-ascii?Q?k8FVxpb+UvxHQAKEfQl/eNMTDBOTXGBzJpdHFS6IpiXDcaia6MH6zQnDVSYa?=
 =?us-ascii?Q?fz620EGqjCteftuYEP5etvAYAT5YkB3Uc7we3Qnnj+qGaq8je1nXmrNDz4Jo?=
 =?us-ascii?Q?ByRztmn8w/VNmAkYcl+rRujvVSU+MaqkhuPSxZFu4OpzQLKZZ72yKtoe8KzQ?=
 =?us-ascii?Q?gjxgXBeINomsxUOPRWhiKEubFcwrPq0Bu68Y7DCrfNL1idsmgSkzGi6GrUai?=
 =?us-ascii?Q?dOzr7y0KN0fLDiLJAQd560gyv6Sllt/iu7oHOgTgS3+cnsBLO5z0sY6JNYjo?=
 =?us-ascii?Q?Nkhy9lweujclptMfVJGtTn+zwlBlaaymTRwXsJ+fF1U8OZ8os237v3zuUgD7?=
 =?us-ascii?Q?mPsiTI0z/ltNhfM5nD/dPCyKh+tRFHf6H/J7XN+ZDnvtNXrcJwV58Q8biakm?=
 =?us-ascii?Q?49tKOHWGA5q0Y9+UWjQLmqAodXwwPBRJoFXtJXFElk2exTHRBH+4JjvOnm8E?=
 =?us-ascii?Q?bylsyhPqDZajWdCTTAtNYJBfHMpmHiOnzrC2P3RiCqaev9isjRTONlVP4HFD?=
 =?us-ascii?Q?3ZCP2UFjLpzhLldIm66VTIfLEM88RNZqkKRnaZ3/ZRKAKkEGRJrA9Ngfc0Q7?=
 =?us-ascii?Q?Za4THaN327nWzaVr+N3verdN1xZbmg3BU5KaVtEhNj/d4iw5P1O1GaiVJfdC?=
 =?us-ascii?Q?HgPozlUbog7pvaX36XVMVGEvryQUJxLMDSFCg1DQplZYD6LJ4hGOfUchCWQP?=
 =?us-ascii?Q?VQ+DpwfYV7uOgPRipcUJeZ0O7kjySlWrvtQ5iB1OsOe/TM7/UUXyG9Pm0BVh?=
 =?us-ascii?Q?iGNU+5RpCHqYqz1Luy8coBCqzX9n9rk2Rms9YGHKaKbH6He4oaC9OU5P9lyD?=
 =?us-ascii?Q?khDKpZEMX6q72A8ZwFbqCG2C7pdrEk+MBir1Wya6?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1407813-1d95-4b73-b5e5-08de12a6c795
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8833.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 02:41:09.6385
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: quJIzKfF07l/6APg2/1+llBfU5cUI19ODkHY0gmFfzNV/AixpABs39XmTI9MFzhcGm10kBlHY1Yj1wJPkUUwkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10624
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_194115_433655_E30B3881 
X-CRM114-Status: GOOD (  10.74  )
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

Add external reference clock input "extref" for a reference clock that
comes from external crystal oscillator.

Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 .../devicetree/bindings/pci/snps,dw-pcie-common.yaml        | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/snps,dw-pcie-common.yaml b/Documentation/devicetree/bindings/pci/snps,dw-pcie-common.yaml
index 34594972d8dbe..0134a759185ec 100644
--- a/Documentation/devicetree/bindings/pci/snps,dw-pcie-common.yaml
+++ b/Documentation/devicetree/bindings/pci/snps,dw-pcie-common.yaml
@@ -105,6 +105,12 @@ properties:
             define it with this name (for instance pipe, core and aux can
             be connected to a single source of the periodic signal).
           const: ref
+        - description:
+            Some dwc wrappers (like i.MX95 PCIes) have two reference clock
+            inputs, one from an internal PLL, the other from an off-chip crystal
+            oscillator. If present, 'extref' refers to a reference clock from
+            an external oscillator.
+          const: extref
         - description:
             Clock for the PHY registers interface. Originally this is
             a PHY-viewport-based interface, but some platform may have
-- 
2.37.1


