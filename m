Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFB9BC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 06:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kQLADtTUmcxu+IA/5gBv4GO0L7Lw2M+dmIz6saIi914=; b=GJx+INIm9coGq+BIA+nq618xse
	W4XR+g9AuBtVZLNAkMj2cxvuqwO+ZlYBpyyVnIrjQuo/D57JXT6w658WLZEj/PVVAPoLr+5lx1Fq0
	OXCZP8n4Scl2otSyX+yvLH9FedUAcYH3uGEZsG6J12pyOfhSZ+xvVEmLrE9nhRJD0dZKt9rzQVsqR
	LAUXQUzFiLJf9yX+pP7zAzamtFDGhpVHeS6X/iRZq6v9AQM0iV76FZ3RZC8uY1SBq5C1lrHkO4aEV
	a8JCHpUnLJP/gihpgis5R+DOzi9Ez7dLHttj5OsKZv/OQMnwbuqvHZw/rtmmdRUhUpSY2pErTgAY/
	Zw9/gb7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgz3U-0000000EBFP-0g2x;
	Tue, 07 Jul 2026 06:13:16 +0000
Received: from mail-westus2azon11010069.outbound.protection.outlook.com ([52.101.46.69] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgz3R-0000000EBEc-1m6Z
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 06:13:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VM68Enz29HmnBFo2VOlfvD29BS199f8SOi/zDTCHEygt3lJS42jovg2R2RSzmALWP9w76HaK92YIfXWgHkyx9y+F3LdI7b0dTwEhRncjOu/lLoxLz+lHYK1lA8a38mlxBZM4cN2XDvN/0GnlsET1N/M7RcU4hjSPGD6tiwuXKiQXIaOuavPPSc3DLNZFraB3CUpYh+tiQMF5AXlgAVMnPogs95V5mk/79T2nB5DdLA4dQMHYyAx34S5V3xvOUv/dLZiTuR0cTvxILnfZ9y3CHx0XmV8HAPFTGHgqixJRdjCUliTWiqa4pkpVMi1FPHl9U2cp2Xu3K+jG0xof/e3oHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kQLADtTUmcxu+IA/5gBv4GO0L7Lw2M+dmIz6saIi914=;
 b=jQmPan5g1VNcE4TUh05aiV5D2MmBECnbRCyjTNAMAug4uRjIla7kIB10DfhlvnpMUAAnGXfOlTCJXCa1N5t6ciEDXoYh/cWWQb4MYii0rnEmNBUgtJDBR7tS7bkiuPubIDC0WP3aA0jwZRrgybtuyOnjOuuYABOKUocqmBm4Z8BNdAdynLWsHcPBjHzQlJ5A2wmkfmclG2Oo8N66LYASE1G6XI86zZ/akNw8LsG/zR2W3HnPDrL4SbWjVgSU6TMa46b/yC8QELEeubVESo5wLlVeN/P4+tNQevUF9PVxtrOLCOLl7i/7YNBSepCDDGwIszVRiTTQGhaUmfHhtKwFLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kQLADtTUmcxu+IA/5gBv4GO0L7Lw2M+dmIz6saIi914=;
 b=YWgFs1cLmJkS61GUYmoNY2oBrl7E1Ggg7rtMAICr4+t7FRaf7j4JZv2P4Ol0q2tF8JS57kgSDFLNg4FXZVBx8wUDHl4djBtwxz5/5m+akF3e8bcsq6bfEY8xKUcqZzXN7X1F3MhSbWvN4P0DI7bz19ycqcV6rQ/4H185UBjLlPjIUpd6FTg4NZOEW4NsS5/I1240QM5fkb/orqykc75P89uDdfmCH/TpqI9XZe895xFu4RCTGXyp+4vesPnCNuz0rx67UDFvw96v605/iLveEhtMA8Z4/xTQOJ9sZ2v6PEZHvHQQTjehT/vIBwqo8hKfc2d01z0UOxB8PXstffk8iA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com (2603:10b6:a03:432::18)
 by SJ0PR03MB6598.namprd03.prod.outlook.com (2603:10b6:a03:38a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Tue, 7 Jul
 2026 06:13:07 +0000
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775]) by SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775%4]) with mapi id 15.21.0181.009; Tue, 7 Jul 2026
 06:13:07 +0000
From: muhammad.nazim.amirul.nazle.asmade@altera.com
To: dinguyen@kernel.org,
	maxime.chevallier@bootlin.com
Cc: rmk+kernel@armlinux.org.uk,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	robh@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] Add Intel Agilex5 SoCDK TSN Config2 board
Date: Mon,  6 Jul 2026 23:13:01 -0700
Message-ID: <20260707061305.27580-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
X-Mailer: git-send-email 2.43.7
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0162.namprd05.prod.outlook.com
 (2603:10b6:a03:339::17) To SJ0PR03MB6964.namprd03.prod.outlook.com
 (2603:10b6:a03:432::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6964:EE_|SJ0PR03MB6598:EE_
X-MS-Office365-Filtering-Correlation-Id: e199d9e2-af12-4916-8317-08dedbeed009
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|7416014|1800799024|23010399003|56012099006|11063799006|18002099003|55112099003;
X-Microsoft-Antispam-Message-Info: reH/Luba8cHkeNTpB+o94mqwXFMZXvKMQ6S1/nmS+6IsRjHqW+/CCCIxGfruQLdV3nVPL71+ZyM8kRGqZGcEOrnRRCD9XofBbsE5SsTAmenldobBmRmTEzzzyZe8viMHB38G/Rs15F09EnymJm0FJOxrqkUTbJ91IS5GfAcmFiSWhNb4b499rbJn8iTldyyldnn5BGAS5/lsWNOu/tiFoCHsS+57RoHLp6j2CsEVmGpNta4EBk54yrhKTiheA2HZpi+CcEXc6XrLGF06e85wtL0hOyh11UCmfia916LIixnKs51A0x4l16jF8SyVpvMdluLiyf3L1Fd9neFQsOk+kvpFYqP4H82fRqUtpnr7saL2l6sKUsRaT8odoeAPTm83Vef0KEC4UajGjp9ENz34OepCOnhq5oLrFTTzCKKUa6Ng85iH+fVpQtjXs0/iDEYd5REJVxlCEc8+2L1aKNPP0PQVmlZZ1npVSKck/IVkXru/dfyGGvvaMRreji9UMKzT291Zsmg83LeibFnrJwkhinu8/ns13nepPFubrETpPSD+bT3GtwYFs87P+v1T8KmarFYzA42mCztRgSvFxVHjFxCy3yrC9aK1DYL5Y3b11/YfERpWGeBuLMS/n6Nqxh11CDkdiGnKYGcppJh9A3+eL35on3emIl7rQqNia6lLRGw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6964.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024)(23010399003)(56012099006)(11063799006)(18002099003)(55112099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?s4p3dQYqQvwwMzYAl+Mv/Z77/dywZxiaUN8qDokLWXUqOY8xy+ZTWDPhYuek?=
 =?us-ascii?Q?qB8+f8P6SUFqb0wGRHUSfio4QAaYNC6b+d2VUW4sgHdFACAN8uPgg1NMGDD7?=
 =?us-ascii?Q?MkGeK7uKtkUpfmIdRPR84Q6m0LZi6uLrz1BS6p+bqJ3254AHGGb4xhfHZS4C?=
 =?us-ascii?Q?pvrlKw8L2Af00Oz4R+nqPNwf/bvAmlCsvVdPEz3YctPzKSYdxhXDX0XUr8ID?=
 =?us-ascii?Q?B0meg3Ve50W4RW61bNzvRzh5hDLuL3tl6wlcbJmx+2/edlHJKBUSr9mRguR7?=
 =?us-ascii?Q?EiJ/aWAuLeXOSO4Yi+SRad9zfgCHFoeLlD77f4FYRNcFULzmMlG2BlrGLLcH?=
 =?us-ascii?Q?BKILvqJOUSVxFgU3FDd0/xWcODA3cPmv5iCvqcys5JPU8JJkYhjROaHK7ycx?=
 =?us-ascii?Q?mIb8WTQeREfiKA1zmuSjA8FOpoKbOGfOvSOhFrfUOJXTBTDDsRsmEvAAe3dM?=
 =?us-ascii?Q?XUpfiHHyWNbvMKXqw6U6kO3YOm2SqQv+zQptZgcoyWVCXFaiJSqgl5EUSZiV?=
 =?us-ascii?Q?Qg/CSD2KeJSkIwkRyOujqhUbw3SA/eWZaPRVEWY/BtkiSDDRJI1qDm2aWylm?=
 =?us-ascii?Q?iNwdCc7PaffB6RyYpqzdcrOn5kTWNv9z7sbRo98bTUM1e8e/zu3vWV9QFOdW?=
 =?us-ascii?Q?Gnt1w8Nm5MdBSmZ6rQB3mOTbThu+6dWC4Rck63f9x2LbhJo8OxXs/PB2kYT4?=
 =?us-ascii?Q?9t78R1yYu2A3MBLPhnkqfmaNEFKKO7lFhRtRJpR1v8iRwMssFRFaTNq8mBch?=
 =?us-ascii?Q?WBQuRpEZWGHUzd3ukfuqhIjFxaDEGqfKL/xdQ0PjCeBi/4T21NJd7Fnhj/q4?=
 =?us-ascii?Q?uhSD26+sTHQ6G+PYwKaIeuoTdspQU1fh48gDgZKHpUNn+DGwIRWQyBC1Q3y4?=
 =?us-ascii?Q?+CdnC2RSu6O+wPjglzzVPqjF1aka/4oVUi7xiMymEzsxujZ1mx/NZfZJGDpd?=
 =?us-ascii?Q?Y5wVjEjNN7wlgyTgwAo2k/ErRldSym2aYTxRJMoJtOG321E94nC7k4Suj+Ub?=
 =?us-ascii?Q?KEU93y5a2CRyfioIvDHB7DDPExOGD78OTzbgJ/BQHSSdsCzZgME45noTjr34?=
 =?us-ascii?Q?/7iEEpDzKnMAmlEFKULHc43fW57lAL59bH79qM7IFONs0bpIANL2e3Pi3O6p?=
 =?us-ascii?Q?9lplr6mrEYtb1apJbPjFLjSktd8hnNdjBTWeTPtVLma9GqsZTj2RO9MQLop2?=
 =?us-ascii?Q?mmw7OqH89WEsfD4BR22DrWDsWGJ8hnn5CsAi0dLlILabqDwawvtXuqs/pZuN?=
 =?us-ascii?Q?pKG2Uu91ZgABAeHXTrCE2LDlZYpBRwt0Uj7TnOONllxwsbY1jS6sAFdSazyD?=
 =?us-ascii?Q?qbfXFGU1QSg7ltgRUVQkG286O73A5hZy6l0QZu01mUJjC7i1wqNoMGinqvfK?=
 =?us-ascii?Q?MZ5s8u2tTNa0JNPA+KCntXL207JjausKkAMJEv+jOAPloNn+ly6AlUhcF4Xs?=
 =?us-ascii?Q?X4uAraP50xGQur+tb+uxdx+AGK18G+IY3kaqajXGGstBBb2lnzfcqOblU1r8?=
 =?us-ascii?Q?wGxY8SOfgR81BFL8gANFPdLeH3UhzOnPVbj1BgW04rEcQHLUHaviS7pSNhWL?=
 =?us-ascii?Q?Aky0OvuEkvOyhAmYd5yho2E8dg9D+T0V6N1PG5coLNOdTVGEPsvgd7pK26ej?=
 =?us-ascii?Q?t/fb3oTraUyc8lEk7YPuS0EELSLZXYrAAYTgOWivMZrWAiUoA2Bk4IEXIzOs?=
 =?us-ascii?Q?E87evnhxWXIjKymta5eF0TcZnPzIX2/3B4cJKIXlfTc4tBPGE5ueermN35sc?=
 =?us-ascii?Q?zL1Yhn1ld9TKNUmzCv7pEUwfI443laAHAQYDHB4dqsE8yjDVPKcfXoiOXVSh?=
X-MS-Exchange-AntiSpam-MessageData-1: B42cgGY41GFxYA==
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e199d9e2-af12-4916-8317-08dedbeed009
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6964.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 06:13:07.4497
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SxX+TFWMiEuIB7wNuCq7689Vh/avjm1y/ckO+zIVSBvNjUtOTNyqYdAAhcMo0nE3eq/tEW16oMiHVeF1/rb3F486H+fB/RoTwQiZOhUCrG6Hk9Hs6BAvRhK5dddUW/NdpWUNSS2hmBWt39tigHWWbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6598
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_231313_485176_C4730DEF 
X-CRM114-Status: GOOD (  13.83  )
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

From: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>

v2:
 - Replace mac-mode DT property with a board-specific compatible string
   "altr,socfpga-stmmac-agilex5-tsn" to identify gmac1 on the TSN Config2
   board, per Andrew Lunn's feedback.
 - Change phy-mode from "rgmii" to "rgmii-id" on both gmac1 and gmac2,
   since the FPGA GMII-to-RGMII converter provides the TX/RX clock delays
   (acting as MAC-side delays).
 - Add a new patch (3/4) documenting the new MAC compatible string in
   the altr,socfpga-stmmac binding.
 - Fix DTS Makefile indentation (Krzysztof Kozlowski).

---
This series adds DT binding, device tree, and driver support for the
Intel SoCFPGA Agilex5 SoCDK TSN Config2 board.

The board has two Ethernet ports: gmac2 is a standard RGMII port, while
gmac1 is the TSN port. On gmac1, an FPGA GMII-to-RGMII converter sits
between the MAC and the PHY. This converter provides the RGMII TX/RX
clock delays, so phy-mode is set to "rgmii-id". The driver uses the
new "altr,socfpga-stmmac-agilex5-tsn" compatible to detect this setup
and configure the MAC interface selector for GMII while ensuring the
PHY is not asked to add delays a second time.

Nazim Amirul (4):
  dt-bindings: arm: altera: Add Agilex5 SoCDK TSN Config2 board
  arm64: dts: socfpga: agilex5: Add SoCDK TSN Config2 board
  dt-bindings: net: altr,socfpga-stmmac: Add
    altr,socfpga-stmmac-agilex5-tsn compatible
  net: stmmac: dwmac-socfpga: Add support for Agilex5 TSN GMAC with FPGA
    converter

 .../devicetree/bindings/arm/altera.yaml       |   1 +
 .../bindings/net/altr,socfpga-stmmac.yaml     |   5 +
 arch/arm64/boot/dts/intel/Makefile            |   1 +
 .../intel/socfpga_agilex5_socdk_tsn_cfg2.dts  | 131 ++++++++++++++++++
 .../ethernet/stmicro/stmmac/dwmac-socfpga.c   |  13 +-
 5 files changed, 150 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_tsn_cfg2.dts

-- 
2.43.7


