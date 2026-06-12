Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F791CD98CF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 21:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yhhPg/60jVu+9ueMwVengRkXodjFnkFlALuQTOAHq0k=; b=0jIHg60+x7ejp4oA4NGdYP+XPE
	FRn9hIvpkUbPnFkfEEIb5x0sg3UzJT4+t1KMf7MMe7qKbzAWkgty2fTrzRVSB+0yKJUTCurXDA+HG
	WDS1lVEBRNkbIt4TmTxq9Nt9xG/HXGu9gp/26/NxAWyKHceq4JOMcG2A5M1Hp2du2Sxt3iqaz2hTi
	9cq91n8nx8F67s0L0jtQc9ReZfaKTVHpFGHjoo23ovthZbk8d/EPJ5N7m/seZlFK0Srf4gM+nUE/D
	Ui09a85WTMH2HOdMjofqTCxHFF9tTX7Rn/OMfAHj0wb7Rh5dwHdqGqUkataWqqcgDnFJCXk8EEORe
	diSqfgJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY97x-0000000Ba9d-0I3n;
	Fri, 12 Jun 2026 21:09:21 +0000
Received: from mail-northeuropeazon11010049.outbound.protection.outlook.com ([52.101.84.49] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY97s-0000000Ba48-2JSm;
	Fri, 12 Jun 2026 21:09:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vk2GG8GfJdzhOoWq2mrV90fPg/nMG3cCoR3vD5QOm/eUOkQfkEUtytkpXXLiL/DEVrBUDzk5/JHO0563I4TtnNKhsm9KfOPzjktQhiYkp5vSOfgpkyOgVgjIW0gSEbbl3Sl2jRnZt5+Be0UNY2yCkkt/oKSY+o0LEJAJ7nFDLP8Hl8JXYUBaXe8KWTqN1bMaeCs/2tGGbxmKRASiigV1W3Emyg+jC3OdvyrkJ6U7LCDndhFTAu1EjyFAT3mla8edf+IiLlTFP5JMubzVHj4IJjnJeVSvrYY/AUIVT5Shje2g0B4Bo9fBXei0cETC50M4CQJ8Xr6s59080pfzK7DgsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yhhPg/60jVu+9ueMwVengRkXodjFnkFlALuQTOAHq0k=;
 b=DDd30KuQEIn15XKZunI93KP8rhCV3bl8m9aYmha80ci7IruRBNu5mXd5ya4XfZlV1WTj/0UQhin2GbvxCP7gA8c4hNnqcPMOjqN/fwh5eqbXRjIBl76QYYPIKHy7ES3Vwk6zmYPYrK6aHBbZ5uIbZdc0iK9FCmgIVVQsUPFtkv6qWwxRJY7TRKoIR83zICtnaXxP44sXsg/u2o8OcCvAERCCpRbcvagQy6ryp854fUP9rV5y2kEqFHpY4hdI439q6AY8ICPGyxbDWchhNzcTPsEXe9efWd2nJ7BjiE9dm4lTobCOJXUWeSfpkRZneShNsZzKxOqnv8D7dozUEN+XHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yhhPg/60jVu+9ueMwVengRkXodjFnkFlALuQTOAHq0k=;
 b=MtW+7Lobc1QMqUaXDU3dV1bwzv5feL5otulRNEDwzC52Bkdgz+AM+fUfPLCaSbjTJj23LBtSR5wrIrZHDVvBdV/dnSezXhoJ+te9f2+1WgiCpCzzCXpLDamibi7TxtbOFSvHg4TRcO+HfjN1J3rZ/LAfLZojMifVy0O9VlSv3PCnpIkQJlk+xjJiyn1tDrFeDmhvveHiib6EMc0tuPfmkfUY9Ke16LC3f/C8XOr3kVaTwDAJBZNIJgpxIObPxJKXUQtmF65P2l3bUnJrqW2FwNKGkDArgqGGE1spUlAvIHrrn7ItdU1ul5t/ANUzRFJDD8MzbtvRjK6Jyb+bV4660A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com (2603:10a6:208:17d::10)
 by GVXPR04MB10969.eurprd04.prod.outlook.com (2603:10a6:150:221::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Fri, 12 Jun
 2026 21:09:08 +0000
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023]) by AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023%5]) with mapi id 15.21.0113.011; Fri, 12 Jun 2026
 21:09:08 +0000
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: linux-phy@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Tanjeff Moos <tanjeff.moos@westermo.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 phy-next 3/8] soc: fsl: guts: add a central fsl_guts_read() function
Date: Sat, 13 Jun 2026 00:08:54 +0300
Message-Id: <20260612210859.266759-4-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260612210859.266759-1-vladimir.oltean@nxp.com>
References: <20260612210859.266759-1-vladimir.oltean@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4PR09CA0015.eurprd09.prod.outlook.com
 (2603:10a6:20b:5e0::20) To AM0PR04MB6900.eurprd04.prod.outlook.com
 (2603:10a6:208:17d::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB6900:EE_|GVXPR04MB10969:EE_
X-MS-Office365-Filtering-Correlation-Id: aa16d76e-3059-45c4-4646-08dec8c6d7ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|23010399003|10070799003|1800799024|366016|7416014|376014|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: JgCpeatGyYjVmwaIeQfMhXQnkw1Bd2vEE0oXEGK0HaQP1OnjKmDZ3N8vGlQLhxpmewzlXIDSr/5qW4PtNYLliUgqT2IgB8UTqs8rPBDwjRN5L/aZQ3danYGNpZqMvkbcx5aY3sUE2eU02ekpBL9v6ABDtzv7xsSLyqaX1xG5eH2gjKE1QnQl+jyr9Fzakx+qpBRfObq/+eBRtRVc+txRotwVpG1H9enMbHvwhs5FspDbwdrglyc9BRMSmDWsl6IlH7FWw+GOsGnum2De5KR/Pz9Wr7PKGAfeHuWPREo0+SAOzV79pKcN3zMs9zasUwZR8h8/EGIDe7DuSgunSrL1mDo7hLh/K2ztgW/Ib3TgE1tEEzXQOMsLBFjBUeBZ4VSOiUvLSSlCsgi3sbDYpzqDmVpphYINfHBPIim+ZCKSK1rAjrK9qIaND8yXJyqav8TtNvEYzv4j5iWh7DfRZZJ9cJmVF1P9m2ZTf3ITO7JpYbvyXqdfiIyK4Cy/94GU7fEtJ87jLuQ8zIbRINZza0W0c8qAQUaJHW9xpnzbrnQxBXGqfhprcMTqX8mtOww6krH4tolgQnwmQ3WGqCzLAgQLxfEb1CEcI0nDJO5yMCwqCc6Y8kRMhwWvfqBDNOzKtNrNaVpKeeTIk/JGSF86+3Tm42GG/p4Sp1biGNsZuZ+Gu8P9eEVJUQrpq1FPZY7mmenP
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6900.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(10070799003)(1800799024)(366016)(7416014)(376014)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5rKBImQoTIi0mBEywV71PvxkCC6G1vk1f7yRMxAHnMJY5H9eSJQvjAvxVZAj?=
 =?us-ascii?Q?SbSrSjLwOOfTUeHJLnOBvT1lSaWWslC0Q0yV8Np9RppUGP9L5/1w/Ps7ZqXv?=
 =?us-ascii?Q?7jTeV8TE9e10P3PwqTRG+Dw1qm1zCgayMvDyaNH/oY3uOkFNLJNAgg26HwY9?=
 =?us-ascii?Q?zkiyUtErW2sligOhbc3F+yQ4bjO3JSTHwN10vfbmuEhJk8zDjsf9wW/C0c5w?=
 =?us-ascii?Q?qNxJZUTgsVSob0I+Ir7tYtC3vgF4NOwly/Ne40vcUW6orFWm5w40Wbytj6NK?=
 =?us-ascii?Q?JRUH4FSd7EG9/QaSt7ypR29RVIbxVL0av+BM2WdqYoYLrUeT+uJOuUQvHla8?=
 =?us-ascii?Q?IgPbiq1J1OnPLHFsLU4Yve4PZFIgcR7NmebvUlprJDvg9wCQXqr2sQzsYeXS?=
 =?us-ascii?Q?Gmfaw4pnlLmd8XeUSQStNZXetSJW9npG+TqtTCO/BfK+AUX11WdScUkDATz3?=
 =?us-ascii?Q?rCer60AGTETp2cLrhS4Das5Qz6mpaGFUTUm1HnYaZYZRfByzsMI+qHHypfl/?=
 =?us-ascii?Q?ie95QMudNGxfRwGQnRPlHHRy2WYWy/DeSIVaGzMLMfd5HDR5urcECVappeQ4?=
 =?us-ascii?Q?yoLVCPQgO3aQEYoaUaXERNSLWzAyhc7o8x51tGgIh9/NDwB1k0bQ33y5PsIh?=
 =?us-ascii?Q?STdTHWAtSJV9Fc03u7jycczjEbJjV/DULgiY+o9j/tPv2/ri/AnSjt2LksOr?=
 =?us-ascii?Q?MS1moN6CDUNsdET0inEtRNpEcQehL5nTNdeorZjWj9TfUGZZxXi8toh431lN?=
 =?us-ascii?Q?rJ0DdRpcLiXiLwVGM5n/oWKhItJMq3pnJYyg4A1eQ+/pLWKjNX8xHmTAagCG?=
 =?us-ascii?Q?/tY2DQsdLgbba7DCiVaYhY6zdjZjQlEGRit+Y7JzexfEMxSZSi5Wx6g6Mzej?=
 =?us-ascii?Q?5VlnnFy3Lr1HnGqYMpelYv1Fg5WlVIhthFH9rykyywBhpd4ogilu0pnXGHv/?=
 =?us-ascii?Q?7NF6hbpLfZkQ0oaAjIvI2pq7PWbar50T/vjxvDlZsJ3WVun0sdZTOABHIEO7?=
 =?us-ascii?Q?X1xmcai5ePw0xPP8/inrXuh+JEHI3GS+vPeUxLhv4Ut/8ZBv8J2fcYrqH7zS?=
 =?us-ascii?Q?h4rlwgvWcuJ7AX5DsSG9n/HRErWb0crlQrqvR6FmlGLFWbcimdxyS3diB3w7?=
 =?us-ascii?Q?L2syahXAOXlGyjfREpZvuw0+iJDCXBZPUXY9oBYnBXG00MU2qGHL2EblnIz4?=
 =?us-ascii?Q?oXtsqmlV5PeFP+KE7WZxLJqFH4zUWdPY5PKnS/SX+q8rXOQYnm8NwsToIy0p?=
 =?us-ascii?Q?2JHBfXYN6Hvl2v6hfrOGF/UZjLjUPqxa8Jn7b/tcckSJe/tsbfGQkGFqehxo?=
 =?us-ascii?Q?JzAhoqqSB1OpDU58hBbWJYLG2lFecejOOXH/Qx2r+aByNmhj039ssSbH54lx?=
 =?us-ascii?Q?zqWEc8s9m4RK4v8EL5nosfqrEHrs/GIaPaJLoZnhG0S3Q5tggIdGVrBym+qt?=
 =?us-ascii?Q?0GfI9SI6I6grzFB1ArZ4XrydW2yFHfAC9smZXVzheBG4o/rQZ4JdkKkzu1Re?=
 =?us-ascii?Q?rhkqJFzcH2dY1wu5vIVIs7jScdlbHghCAOFaO7sBss3ib5TFCCFiBFzlQCZ2?=
 =?us-ascii?Q?v+J0XBgIVqKH7PMscqUJBtpkVHOfvjA0zFmeZm3GoVyTbR2Haljv0HT8EUVl?=
 =?us-ascii?Q?hgFSfIZ01nF7eADNXR2AegHvyeldpUAaRPyY7kkpItn4xsmwqqvZlA0ATFIz?=
 =?us-ascii?Q?UKN2elKNYzKVwtzTUmcF1lNIod4ItoALrZ39k+cyaCuvw2KnuqKBpFyg1osf?=
 =?us-ascii?Q?XAyBttpjK9XeJlmmJ7sN/qmmqxnHllafimlsQvmJRvMR/YbtGlqG?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa16d76e-3059-45c4-4646-08dec8c6d7ae
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6900.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 21:09:08.1992
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CVP3zekQfowSgwuDvslH25gojX3kpELQzVWAtVrA/udK+rp2rnhOGldUFfhbFI7LhfnoJEZuYICfxRdVnmlW5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10969
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_140916_595001_0DFBFD53 
X-CRM114-Status: GOOD (  12.85  )
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

From: Ioana Ciornei <ioana.ciornei@nxp.com>

Add a central fsl_guts_read() function which will take into account the
endianness that was already determined. No point is duplicating the
if-else statement each time we need to read a DCFG register.

Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
v1->v2: none
---
 drivers/soc/fsl/guts.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/fsl/guts.c b/drivers/soc/fsl/guts.c
index a0a52a5603a5..dc1a42cd9544 100644
--- a/drivers/soc/fsl/guts.c
+++ b/drivers/soc/fsl/guts.c
@@ -111,6 +111,14 @@ static struct fsl_soc_guts {
 	bool little_endian;
 } soc;
 
+static unsigned int fsl_guts_read(const void __iomem *reg)
+{
+	if (soc.little_endian)
+		return ioread32(reg);
+
+	return ioread32be(reg);
+}
+
 static const struct fsl_soc_die_attr *fsl_soc_die_match(
 	u32 svr, const struct fsl_soc_die_attr *matches)
 {
@@ -209,10 +217,7 @@ static int __init fsl_guts_init(void)
 	}
 
 	soc.little_endian = of_property_read_bool(np, "little-endian");
-	if (soc.little_endian)
-		svr = ioread32(&soc.dcfg_ccsr->svr);
-	else
-		svr = ioread32be(&soc.dcfg_ccsr->svr);
+	svr = fsl_guts_read(&soc.dcfg_ccsr->svr);
 	of_node_put(np);
 
 	/* Register soc device */
-- 
2.34.1


