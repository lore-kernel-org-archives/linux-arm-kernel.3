Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA697CAC598
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 04:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bFhMl1KdqTtaRAPs5sGPOdbKqu0ti9sLpRUZzPnC1PI=; b=YnBu2sWNnyUrpPZrq1qXVDi5CU
	B+Ve06UkHA/wHOj9A7paWc0iyea4HGqtCHfHWHiG5MXM4uYFMjtod8DmL1xK4Cda5KV+/izYvvXid
	s78a8ap+UUhb4An7fm2fJB2W0GtMKqlOPIBvngSLA/rhfCVdATxEC6bnrWATNtXcwUE9Rgf63QIZd
	gtegpP36T0fGAyzigLCnyfDrg1NF4yTcdQ2bLCr00uszgQ7nllBDg+rhlTBUAFbbZ8vpVVcIdP1fQ
	Xgpi/oQ2H7iCc7JUraJD5nlJbd8FEm889Rc8c19oWwKtRQZpO+o7SymQXjgUUIp40lr6XswEWFqmZ
	M6/kXTmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uykAm-0000000ABZx-3ckb;
	Wed, 17 Sep 2025 04:53:40 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uykAh-0000000ABXS-30oy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 04:53:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DboolseuP3HsWLpeTcs2v/kzNq3BgaT1QwOOAfxF8sQUOiK9Hophk4LZmgVxZlrEYcpW46a5s1VYVXjktztyFML5ZGCGdnuR3vg9TGEg1mYG3C4BybllRDfg109FqZIPnXCvuy4/piDGDQfmBoAvl3RHw5viuZ3TqFxc3ZRXm5ddHJ7oMfw9X0pKEtc5/o4Ht4PTap8wMebSHY9JniHX9mEhw1OCyKy2mcwMRvZr8xmnLVXr2ix4Za1pShdIeuNXzw2jeXIAF/jStYGNuNn59DPt8Y8dLxoOPt0aUrEMH9fNR2VlqhWFNY6b6fuvEPV3WwsDl1qkehDhwqozhPE/QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bFhMl1KdqTtaRAPs5sGPOdbKqu0ti9sLpRUZzPnC1PI=;
 b=VrFbpQahFXyMuV3FDVnnA96hK3UIYWmiMH0x4EDbt1q3i57TtFGWHoBDbHQANB5pSWf7tS4BvUm0JTfT8vV6w6m/d5odfEphFhjMYgERDF3M8XA6keZ3bZU/Znj375svZVcyjs5JaaMOKYY3tsYiBkk1z950Cqxc0sUNYl3VED991ZHAABAM2IM1ubtctG7CoHkNc0koKiiM4vaUmiBMTDTZzFDuy8lbY/MITTNpMylPjqs/ikHdYM6cpIeDpCl2I+c2WwPIYDPdQv3aLZ97t2bc4yilA50bQ1kKlhQQI1g0hl1tORFd71oibHqm9PoVmvAj73t50+LJardcR1z0aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bFhMl1KdqTtaRAPs5sGPOdbKqu0ti9sLpRUZzPnC1PI=;
 b=HZMBffFi6AFHHhnmouY8d3WxHpaZCBynnHZmVzvVs2MngdD+tWSHHqclA1bGh/EgP+/0S6jsg11m+WHN+THRCdEiojXJDfOtSeNZikDW3qM0tLWrFQg1Ea6V0jiM7DvUpGV8eOkjXaJwxgQUt0nz6HhLaigMHudxgfzIUmsf3KMNDj12fhxkKBsVu8IPo3r8wJVp0KuYrWdYem7QXBCdJ0VYXibwXjc2ujiSZvK9uymBb4c64YHIUBlMRhhb5o1jjatw+gyLJwPFmSIfZlA+7EKMQDm3vCps2N/6MejNUQH7T50/AevVOKCHj9zAYm+YqjxRtgZatSCIPcy+i5UFhw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8833.eurprd04.prod.outlook.com (2603:10a6:20b:42c::19)
 by PA1PR04MB10098.eurprd04.prod.outlook.com (2603:10a6:102:45b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.12; Wed, 17 Sep
 2025 04:53:31 +0000
Received: from AS8PR04MB8833.eurprd04.prod.outlook.com
 ([fe80::209c:44e4:a205:8e86]) by AS8PR04MB8833.eurprd04.prod.outlook.com
 ([fe80::209c:44e4:a205:8e86%3]) with mapi id 15.20.9137.012; Wed, 17 Sep 2025
 04:53:31 +0000
From: Richard Zhu <hongxing.zhu@nxp.com>
To: frank.li@nxp.com,
	l.stach@pengutronix.de,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	bhelgaas@google.com,
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
Subject: [PATCH v6 1/3] dt-bindings: PCI: dwc: Add one more reference clock
Date: Wed, 17 Sep 2025 12:52:36 +0800
Message-Id: <20250917045238.1048484-2-hongxing.zhu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20250917045238.1048484-1-hongxing.zhu@nxp.com>
References: <20250917045238.1048484-1-hongxing.zhu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0172.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::28) To AS8PR04MB8833.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8833:EE_|PA1PR04MB10098:EE_
X-MS-Office365-Filtering-Correlation-Id: ed420dad-9adf-44fa-3883-08ddf5a6263a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|19092799006|7416014|376014|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cHZYFhoR+fDdXjrsK0qzSWIM9CWxVEikitNdGoYgiHD3Sp9fvABCRrk/wMCi?=
 =?us-ascii?Q?1VH/RNazEgcR/f19QR8pB83wdOE3zjmD//V6AAB4pFlhVgYCiK4E5SZ6X3Bu?=
 =?us-ascii?Q?uT6yEcdB2fYdD8wqedaT/ZrY0UlJyTmZLSuHtdGmv+dkOjRwnzQSrrWlGELS?=
 =?us-ascii?Q?GfIfrYW2EE9W0IxNWkhbupzLdirKLmyD4UnoGmIZ4hwqmHX80S78CUH5QiLi?=
 =?us-ascii?Q?4ra34UYE3TdJBNQ5XiIACutbEhPWc9PXlAQCm3K8e2rsBph99lSKwLXzRitH?=
 =?us-ascii?Q?WdzlB+DdZux2TYbyzpyb2jxe2BQOI6+T+gvKV7sbfBH4BHStMgh/ff1gJE2a?=
 =?us-ascii?Q?K8G2Q/OEdEsoEcii9mDuNWpI54I0G0ffQWMJ6YXKWCQTrH2sV21Q8AGT0zRF?=
 =?us-ascii?Q?Q39Y/YkLqAQXhVKLjO64t5WkCE59br7fHi0hyMx2CRB0GpoI+NvmLTF+mxmW?=
 =?us-ascii?Q?EJSbWo38RP3NwKc/eyLA8AJulLW/t97r7mRDf1YtaQF5CDk1NojmRrjcsrlS?=
 =?us-ascii?Q?RpnMLB+Oe57nVVUVA2ZumBHkaDIrkV+F2gSZad6HjUeQVA36csrXLDA1kNBJ?=
 =?us-ascii?Q?7tLiBSfVnTbqO9NzzqxKnoMQ0+O0cTwf2NYyeA78RSHT9QCFdtrnDrjXqyWl?=
 =?us-ascii?Q?SBlfohoVQ8TyZSet9JjRrf5Iqap7o3JOKDws6cpP9KGXBHXMwekVsW+yaMp/?=
 =?us-ascii?Q?4iDV4GNq+DYxQIhU/4XMMqAahsX/TPDNHPZYVHDstAJCh3qc6oZivIqQ1zcB?=
 =?us-ascii?Q?aM9Jzvz8aymWDzwghbL/jxcFKcFYpKbFbDSg2N0YPBA/i+9YIpNYshWPm+5V?=
 =?us-ascii?Q?WRCtTgwsgMC25henLu4BNkyIxC4PlHcZirYDu+Tj8hu3/6olz6Jg21qUVbHn?=
 =?us-ascii?Q?QcxueYDEwVnBwDQgZgXyE5H3RQtwjI6t/hiQDxtybAXihEVRRsSgDEXgRfud?=
 =?us-ascii?Q?zOxzPp05c80EZtbiq614gq6nkj23XJmmibkMu2h4Msi0H2VKhJEZKLyS7gTl?=
 =?us-ascii?Q?F02ZMw5i7cbhoAOqfbALwvHCEP41eUg83Iofyt8UA9uzoxLujSTyszpP09F3?=
 =?us-ascii?Q?JDTUyuqLPH83e4ARMYpwdWmUtsY1sQkkQGxdk2577vD+CjVw8UFk8l/0a8Jo?=
 =?us-ascii?Q?joBSvmiHPrOM3JP7f5x1xlE4oTqV/tVI5/jFg+44kIOUlP5jO9+8mH7PUi4p?=
 =?us-ascii?Q?gHXWTEZGGtotJBLbaeyRtYYxrWuS6kRqP7y7Hf5H0IzSflreKeR41TQo9NpV?=
 =?us-ascii?Q?KY0+UegTsFjxY2rTyuDRVpxiByiwZk9aLkhOG5N+5501Vw6ycu7HFsl7nVeI?=
 =?us-ascii?Q?65PNcRwetP4ban5vIrKiehh/JAUwsL/yWRG5aA6FNh8zsrly5otnuKVXyDmv?=
 =?us-ascii?Q?u9ri6lrRYrj8fF7n9vQNmAPQDz2f0jjwt8V7bNnDURo2MERbBog6pPiwGU9M?=
 =?us-ascii?Q?AgQYjYa8yfulRv+vC0iysqy73a4JmWJI6NtFKhMP4f32QlWzE61+uHJeU7g+?=
 =?us-ascii?Q?tvI47K+y44QnLN8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8833.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(7416014)(376014)(52116014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MmSjZYmA0ciVS3VVVfOFzU4PLsg4/SrSb6KdTgPLU2vFk/RcmZQNZVK/rCC3?=
 =?us-ascii?Q?21VnKtc9W1WmWtjmpFEQgo3GPxsihMxqdYFp+4AlzPN4EWrrKXgHZMM6IJu3?=
 =?us-ascii?Q?pFU38TdWoRqXfo5SlY7R4fwjHkUMbZ5c89ygFkNfaYpzRra1XzyJgpNPO5hQ?=
 =?us-ascii?Q?k4KaPdbnxn9KZ5Gbv8GRg84Kz745yW9i5sLal3uVd+tgvSnr0oVSzNi4U+Za?=
 =?us-ascii?Q?AkitxIHG9ExY7QltMwSfxcJMUAhwa0HkrpOy/hUnphx6VdZvAR0uhD4cYsb0?=
 =?us-ascii?Q?tO3yUe49gKecKDu8P1ec6DdB1SWDKIslHXr8m0sMrWmmbCTdNx34WS5zZcpS?=
 =?us-ascii?Q?XWig8cJvn0ic+dzVlQHmqrEeOl8Slhdzqd0D8M9MmMT+RE2OabMysikr113a?=
 =?us-ascii?Q?EFHv3vAsj37KySJSYNdRXXX4o7yLilmynXE6rNnkikl95cuZ2HemymvySeQ2?=
 =?us-ascii?Q?AxeOKh6Vpn4edXrHlD06nvF9iVnVftVn4vcN/fD7PoDN3hDEd66ds6lsZWL5?=
 =?us-ascii?Q?dffSnW27VD655ZjlUc/M4C/rPquWwv1OYJlz2/iBkDyRIYe6s06KcgqtbvD4?=
 =?us-ascii?Q?5d3tVPENfSo8+Q+U31rnCbA0BTTlHG+kHzFcOjm8WdXAfszgY49oPtD8de0O?=
 =?us-ascii?Q?z62Z22ABGZLTbpAnA/9oya9qllkuPIGhRYQq2Mbu4OFDOH9R98XcKuD0iU1U?=
 =?us-ascii?Q?QTbR+/2rJuXW7pquZ4HEpSyz+quQsB1ylUnBWS7N2RjIzZcGgWuTeC2uvt5v?=
 =?us-ascii?Q?b9Pmtd0/fi2jgmQKMDgorOMypfQ0NWmyRNaGCgPuOh0YyhWZ/x3m7ZinKaZO?=
 =?us-ascii?Q?qWK+TBtyeqYNinHhEqm8H8JjR3GIswDd73n8XR78Ow/Eyv1l5mNo8zQPTqJY?=
 =?us-ascii?Q?oXYd59bMnbeYyRqKu3xG0ibMUBa658sUfF5kfJW00zJPrOz1yvr2hX47Iv3T?=
 =?us-ascii?Q?zOfaS0BF85qlmjYb8uXkFcS+ULE9u0H+/5oTGauZShipUGQqgtsYBntdDpBg?=
 =?us-ascii?Q?u8+MRdXf2/sd+jNYAEIz5QjkkQiHJFy40IKaVo0IyeAt2tpQ0EJRZJcbDVdR?=
 =?us-ascii?Q?c9oAHBMCQrn3h2tN6pgMcfAldPg0OUCs88zz96Uf6GTyAwScXqqhCf/PMaYC?=
 =?us-ascii?Q?ztTCAlaHPmXBX0iOu/XkIimhfBTs+2pnNPQKwtcZtSbzpxWPePpxiI93lmU2?=
 =?us-ascii?Q?2vMUS53+EM7U7Ob/VnE58ZoLntLCff1InDdYy7xTTUAss4ln7nXWVy3B+M9P?=
 =?us-ascii?Q?g4894gU9XFIGMBqiqC/mFyaPM8DrkJg85lgGV9W617uk+Q+kT5HbFxUo7DYU?=
 =?us-ascii?Q?5g/XV1dr7TxW500Pwo1OA+XqaESlGbTRbzq7mXEbuVtI2LVhkSI1paVVaYyd?=
 =?us-ascii?Q?yIP3iPmqm5z8rAXuGHCNHT3gmHE+PYj8mzn3c79u0KHkqWWF6nUkmHaNKYX6?=
 =?us-ascii?Q?xrIwygnDp9fy6i4UfRZYD5L7qv6Gus8lxfSJ4ISnl2y3rAyEdEPtS+5y+GsN?=
 =?us-ascii?Q?aUz7ZXQfQUPY/PlKWwdoFmIgoZPnXtyAyB+1E9qZysCQTjSz3EZFj+1kQn06?=
 =?us-ascii?Q?BLJVNj5xYxlQO3tkSvjJc4/vzTXRwGRq6bLzeMv4?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed420dad-9adf-44fa-3883-08ddf5a6263a
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8833.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 04:53:31.4208
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z389TFXrqnI+vHEdICvREqb5VckbPkjLBoPtfMjkS+rc0fMSzGaVasvw6/EKRiovCB9MP9OvA/1dKMZQOy2EwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10098
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_215335_758679_5AA1B0D9 
X-CRM114-Status: GOOD (  11.00  )
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

Add one more reference clock "extref" for a reference clock that comes
from external crystal oscillator.

Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 .../devicetree/bindings/pci/snps,dw-pcie-common.yaml        | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/snps,dw-pcie-common.yaml b/Documentation/devicetree/bindings/pci/snps,dw-pcie-common.yaml
index 34594972d8db..0134a759185e 100644
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


