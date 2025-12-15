Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28FE8D5B16F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 13:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Jv/y2YeJx9luodWee/9LoW3kDVh0L9NlFMTDVyHJyK4=; b=F8XVuvjvXaD4bOPt8REKWpOm7u
	tuwHOPbUhhvXFDY9BKh/IhJ21mpmfp0Cy68urX/nZ93WK+WcAmfGqPBCxFcFPhLGw75hG0c/tWWPw
	lg1yrIQ267tSfKEdsz/ygab68miOVErpzCnpo4URq8hIcsgMgRvlWgDfHvUdse1Utd4vokhD5cgNs
	QQcWu8wtZ/4DANghjS6jN8pT/a/i6vGVf+PRk+CJnSDzV+T87YGmjh24CHQ7HbMhWjNlHqGH3DkiB
	6p9jC7sVSo6Q87AXszx9QvdygiV81rCY0xcKryg0KgG5QzY+HDLD1gqFFk2dkROiQK+Qs8dfVq/6F
	KVrndHWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV8dJ-00000003gn5-2eAH;
	Mon, 15 Dec 2025 13:29:01 +0000
Received: from mail-westus2azon11010055.outbound.protection.outlook.com ([52.101.46.55] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV8dG-00000003gml-0dn1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 13:28:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EzW3hp00EbsYiOUnHPgxPyb9Nc8u2HspUAje54UgegQUxLzBALDLvg4D6qIiiimjxTmNu9XtRBzW+JMFg4g+iaMyZW4+LNxkEnIwgBJLfyBoEx0tJamoKFSecOmkWsCG7s7bvt4M04C0uta3Hh0gAcc+5EnGZL+/RLjZD+LPEHbBc50XnQw6+a9Gog0mSqimXwbQ/sz4KWUBZ/0mQPfzFlpH42I4XE6ue3btC5ypAp4+LNmMtgdSTSvSAWmfik0E0PR6yeyfFj/dBkMmDZOJcxuC/R/XNbiVaLLZeNkZ5DhZzzfBBzcLvh8DlaHqBvFJZNiiqnJVMxK+ToTo4nc6LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jv/y2YeJx9luodWee/9LoW3kDVh0L9NlFMTDVyHJyK4=;
 b=BsoxnH9ji62MMZh8WLOzJSWjmqKwpiu7SRv8su/XWx0tRTYU5y17mb6xsiS+0BhUgLt/hBotMR646R76fC1M1Slgx9d3rmjv9A53bulbaa0gm25guFaIQUQagXlp6cuSyV4NuzhhxGhiFlg3u40vOJv+TeFKyGP51cVzEJTduvKH4fnOqXAi2OknNOYoooKTUOHZEeQTLqsf3hRXNIvsZyroHwdm1TipmF4k3/q6G+AcYMjdX2pObm+9bG/V4j8eYBkJ90N3LQKmcf3qMdwlT12ou8PQkGE0d/Xv116d3nJDNXTYwy7POiIboBTGjjE2MIb67FMwqoJM7YzhfN6a4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jv/y2YeJx9luodWee/9LoW3kDVh0L9NlFMTDVyHJyK4=;
 b=fUrRoOJZZq5mWE1jdnXdeC/2a0g3H+H+KeY90aAvNDYn+E+BixyYQ8HEHki34XtbpSqpyjflNt0tySfS70ElSncatQy3kPo49e9bllOpywxvZAJjqOFTa1ZdpZVQibdwveD0tDiqMMzxYffOw7wS89WAKxKihHDuPG7gU9txmrw=
Received: from CH0PR04CA0112.namprd04.prod.outlook.com (2603:10b6:610:75::27)
 by CY8PR10MB7217.namprd10.prod.outlook.com (2603:10b6:930:71::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 13:28:50 +0000
Received: from CH2PEPF0000009C.namprd02.prod.outlook.com
 (2603:10b6:610:75:cafe::60) by CH0PR04CA0112.outlook.office365.com
 (2603:10b6:610:75::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.13 via Frontend Transport; Mon,
 15 Dec 2025 13:28:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH2PEPF0000009C.mail.protection.outlook.com (10.167.244.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Mon, 15 Dec 2025 13:28:48 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 15 Dec
 2025 07:28:46 -0600
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 15 Dec
 2025 07:28:45 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 15 Dec 2025 07:28:45 -0600
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BFDSjAu2429701;
	Mon, 15 Dec 2025 07:28:45 -0600
Date: Mon, 15 Dec 2025 07:28:45 -0600
From: Nishanth Menon <nm@ti.com>
To: SoC <soc@kernel.org>, <arm@kernel.org>
CC: SoC list <soc@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Tero Kristo <kristo@kernel.org>, "Vignesh
 Raghavendra" <vigneshr@ti.com>, Nishanth Menon <nm@ti.com>
Subject: [GIT PULL] arm64: dts: TI K3 fixes for v6.19
Message-ID: <20251215132845.faudhjh7ywxdx2nq@elongated>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="z5ejfdttoahnulm7"
Content-Disposition: inline
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009C:EE_|CY8PR10MB7217:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c60ddce-a09a-4ed4-8657-08de3bdde173
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hhS9dLQBBRfpt8Ob5OQ0G89q1525C4rGDCk3FhGnExnr33xvc5H0zsmfodHh?=
 =?us-ascii?Q?SF7H168Ga/AN08d02Z1XPpocnjqAC6YQCaQJEVlBYWbCe00L4BQc2HnTRG6T?=
 =?us-ascii?Q?j7925rb3awfDnJz51bAHs0kMoFvxHvZiPeUS+bpbE03jNzDt2CACnoVpGNEy?=
 =?us-ascii?Q?TZZkEgW0afloONY9qor/BY2eBU8f0l4n1Oin9XWsDV26uyhCAoJnUcLnyLzO?=
 =?us-ascii?Q?IBUbxx2pBxzCfcVvFLspjrL8CCF6cBR8UzNKBC03O/5MA+lM/7zFyBPKgcXw?=
 =?us-ascii?Q?/Lg2Exawi8kpolXpvR5fSTXJjuT1pmWWGNNokIXYi+XJ0Lqew8ANvLhVPePM?=
 =?us-ascii?Q?MqmCl7Y3FWFFBvnqWEaAcad+CfCjcmmpiomh1QM9bfBexn8XmTM38QmYj0Zs?=
 =?us-ascii?Q?xStdfRnJ5bsxs64Dgz/AlgMjzNwW+TwLOBKBIxwUf1Euom9vlJIliZuc5bIm?=
 =?us-ascii?Q?ft2GABFYLQLUi/f4tkfwVL3WAmzA9q0pG3bnzFte2FRyAmiMPBAsvrbga420?=
 =?us-ascii?Q?VBoqp63XvbApX+vpDKExMw1B8O65LZcN4PW3AykMKHap4QTpMNvHGSWCWj4e?=
 =?us-ascii?Q?Vqt4jNt/zZByEmmNn46S6G1/UUpUoUC1F4dG1UB9T3EEY66RJpGbjFuGObhb?=
 =?us-ascii?Q?fmjym/CqUigZg+u8Mz+90JB/hCN0w6OovpW42HsImABuDVzZjojsWeDROaAb?=
 =?us-ascii?Q?jzPgWwS1fSaZOg6P/fWS2GC/0a4v058krJYLvIWyziHNl+GJzqaH2RlC3e29?=
 =?us-ascii?Q?J9BcywGT6TTCbi0AuiJecOXeziKJKGQnv5NV7JkTGpLluIgFHCnP61cj1X2X?=
 =?us-ascii?Q?WjJu1sBwsWHeBnScwFDfngm+hFSQ6cBSNAkjA9OR/RJhHXFsNXQuAAxNj25m?=
 =?us-ascii?Q?7TJQafJ+anlRphGPF3vW4oPtllp9leZ1oPl15hocJdxCRSschT0+6qBH+dUj?=
 =?us-ascii?Q?tXQ8qybPTlkUr+M1+7SeI5rLMpDDd0rfmvHgarBWDNxZH4InhoFXC0bkVUlH?=
 =?us-ascii?Q?b1vxkPBl1CLMfYctff5YsAmBBpfWveNXr7FSEwKT7WVIZy1MYUd/+vbWOvGC?=
 =?us-ascii?Q?ULtXw6BJyCXHOm4X46OAtm3/dBGvS1pqSdx6F6VJHtGNnzm1M35/3VAYHDC7?=
 =?us-ascii?Q?PWWbtoZCs2r2+ergzOWp+KR3jpz8HFJlEfl3Z13GVs/SAODK6ZylxITG4JVQ?=
 =?us-ascii?Q?I62VHWphnkWqLOz6EUFy6m1yhhRyUkr212B/w9p98OZqCV4sAzChdm5gUMFE?=
 =?us-ascii?Q?9IhxCSySm4kTvASyEiLAh76PLt3WBUvJ9D0y7U6uof+gOpldmM6J2WLvNRtB?=
 =?us-ascii?Q?li9TZCXHvTWFV/2RjCTFu02od2qputoTtG4A+YzvNlPZ45OzzxMmeVyia5mH?=
 =?us-ascii?Q?90Wsc7bHN71x+j+WfY+YbEeWvuLnc3BzLGhEPJ4opOSqC5i9NeVTZtMTtOl+?=
 =?us-ascii?Q?l0CCFXz4vY8/gixrJVu4pnAmBNNc31LiWsH/+xz2kvyd3Kv55StrvYZRtF/T?=
 =?us-ascii?Q?q7jl/LaNWJCNy1YVaKk+5MbiLTRDHnmgvgNnTYLkrMvTgSyWZpQlC5oCd9gN?=
 =?us-ascii?Q?rchyk4z8XjW23dfsJkQ=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 13:28:48.8584
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c60ddce-a09a-4ed4-8657-08de3bdde173
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000009C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7217
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_052858_196504_974E7F0A 
X-CRM114-Status: UNSURE (   8.48  )
X-CRM114-Notice: Please train this message.
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

--z5ejfdttoahnulm7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

The following are minor fixups found on device tree overlay files post
PR for 6.19. These were identified after we enabled builds of all the
dt+overlay combinations.

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git tags/ti-k3-d=
t-fixes-for-v6.19

for you to fetch changes up to cf5e8adebe77917a4cc95e43e461cdbd857591ce:

  arm64: dts: ti: k3-am62-lp-sk-nand: Rename pinctrls to fix schema warning=
s (2025-12-15 07:17:46 -0600)

----------------------------------------------------------------
TI K3 DT fixes for v6.19

- minor fixes for overlay files

----------------------------------------------------------------
Wadim Egorov (3):
      arm64: dts: ti: k3-am642-phyboard-electra-peb-c-010: Fix icssg-prueth=
 schema warning
      arm64: dts: ti: k3-am642-phyboard-electra-x27-gpio1-spi1-uart3: Fix s=
chema warnings
      arm64: dts: ti: k3-am62-lp-sk-nand: Rename pinctrls to fix schema war=
nings

 arch/arm64/boot/dts/ti/k3-am62-lp-sk-nand.dtso                    | 2 +-
 arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-peb-c-010.dtso   | 7 ++--=
---
 .../dts/ti/k3-am642-phyboard-electra-x27-gpio1-spi1-uart3.dtso    | 8 ++++=
----
 3 files changed, 7 insertions(+), 10 deletions(-)
--=20
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5=
 849D 1736 249D
https://ti.com/opensource

--z5ejfdttoahnulm7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE+KKGk1TrgjIXoxo03bWEnRc2JJ0FAmlADQcACgkQ3bWEnRc2
JJ24LQ//bvz0nmb4MZAAr3Cp3J53CPpVXOXoeP4S60mG8jEa7Jnm5m5eB5EFpAVP
yyLVGcWggJhKmR8bKxBMIjCbu8Q32uAqUy9BXU0BXVG9xz8oDW+sIXeXzrPlmP37
JLS68FTiFngYoxxCeNLuuwbmMaxFcHcK1cGbL6fQ4r8Ehk6GVR+dEJjBIGe4bfGm
n6D9T7KtwF0+wUh+XuOBz4U6lXPhUNlSrkdmZrrRb7zsOLy9mMNTBgTcTBIlkdT4
BRvNP04qmyL5BD+RMLw1GJopk9usU+4dXPyzD+GmuP3DKlOL6ZzjBiLAa6EqpZek
lFurXNYzrSUyPUGSP0z9SymV8Ge0mDp7Tw7TD0FhQx6FXW2OMNfeDo18K+VsMhYY
f0t1qVEorHke4FYtZW3PUi7oRSjezoBW8MZnycrZ8KF6ZxFXGyN20sa4RhTIIHyg
aP1JSqnksGs/49hSYORY/AnPWWcimqo//427WMgfTUZsuLNu0P5tEkqMnUr6THcD
wEflNMyxzufd8IoZCYw7nVnwq8ot9/rHCHf/MbZxKFqHnLBN3b8pDk7PD+jVRL7q
VLY3X46OE/2afEuesAfP0NvcGNPaiGOMA6JNh1cL84WQ6gS75VhtvI5s6DeHZICh
k9C1PR+etwg+aQkmXeXmmW74E4rpy48MK3T98ylD336VJ/WstF8=
=Dfkc
-----END PGP SIGNATURE-----

--z5ejfdttoahnulm7--

