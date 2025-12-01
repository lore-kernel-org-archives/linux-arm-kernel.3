Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98644D111A8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 07:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:To:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MikhVlmbBcWcpIJgnhzibpUo3zLLIuqVCuZunXPzKnk=; b=XeVhAxKGCs5SyVGmJ6I8XgZpOK
	3bsN6EpDtmE7pvex17iglAtYviDa5P8YDo4aGSW7IVtdDWt+ML2FN/lb7iByi7nZWNjdfiJGaSsPY
	FzQrjIrG8Oj6UXzzPVW5ojzhPGez5QBPQrix6Cy7X6UIFuK9yRApl4Jao6UbJbedfFajqo2b/RrMC
	asEPfuGwG80DabYvwdu01NaW9hBDL3tbxKPiYNcAwi6IS7U88OTSwIa311TqUQ2OS4LCPPz44lhFv
	+02vYECzTtRqvPGhxKShMhCbRENOpdETMqOr+6/BFGYgfjQFGauuIIg8nA+y1WdMItJWxYKWtId1O
	/AsNxTdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPxtc-000000031by-3AqK;
	Mon, 01 Dec 2025 07:00:28 +0000
Received: from mail-northeuropeazon11011026.outbound.protection.outlook.com ([52.101.65.26] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPxta-000000031bK-0SDB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 07:00:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WMzKASz02otClV0znmunRwAoAPVYERjv5YiQp8tLa7rLHJD0HMlfH/ZfE/aoT78OtKyq4MSTUQH5pPr8TfAupaPE9tOXVAy1aQhy6I/w84LOh0l8SNi58/mFmckF9tEUKFxHubnGEt0iGeMAbUauI81xri4OxboUkYutQmTysVQz8lRuliKtPH/zz+QbWu6Mg3F5wpxdUG92BBCxZ/DHlVu3U8KXdbe8Vftlllz9FVsjTOHe3efJTDrfrHrXpIGnOWsrpdesp7n033fyB52hYJPaJx6KEbaG+wP9McS1LxmCk3YaSCC1voRhIlc5H8EH6xdZYM4HohfQaAZF4PIoOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MikhVlmbBcWcpIJgnhzibpUo3zLLIuqVCuZunXPzKnk=;
 b=avhQZMq3LE0zB1m45ICFMI57owU5GHpjsxbnZkF6BamvLieaUxm7PQcGOBcT61gMudnXo0LjeOyP1vQNgOtMUvx/wneJdmnlf3ww1xOBz+DtbdsVrIAOe8B/Mv6/FpJmUew3W7DKAWW2HjoR7o0TUaGxT78ep7cs+6mZXINtVQqm0icAX/s1hT0eyDRH1I98AgXI941HKGPDmtHNFCYkE1s4bW8dLov+PvoBmafsGYFKxfOCHtO4HvysBXPWxVh+8eemrB4jGYQ4a1wjzogHm0hiYEPfiASzXN+CtYLgbNCCyylM1/LG/nOQFTQixVPQZ7iqCBRIwl9Zi7aZQzRS9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MikhVlmbBcWcpIJgnhzibpUo3zLLIuqVCuZunXPzKnk=;
 b=BCvOiaThA+vwXZfjH6UYzZ1q2w1oGNaQwl+9hIAdLvQUiGiHRjgG74T+C9aaoPRKTo71M2mdXQ6EZyZQBNJMIkwGurn4jO6K3IVv/1KsDsYYoEkhR84NzZTCUK3breXDdmdFNfrf5tdfUsp/TxXGuUoOuxbYz+MGZev6BTgp3BYWUAqVLw1ngIBuHcNlr04UCuFxpvQ8HFY/ByNCPn3BgFrjp2A/oCLc3mPV3holCz0xyAnxi22kjGv2KX2f4uRkgz43H5XA0FM7ClRYRf6Krkm7J3DP8bh17CmkTwJTcfYYzx5A1i1asixQM5r1lgfqWoB7nfZi7LgjZqN7WpOE7g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com (2603:10a6:20b:3ef::22)
 by OSKPR04MB11416.eurprd04.prod.outlook.com (2603:10a6:e10:9b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 07:00:20 +0000
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc]) by AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc%2]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 07:00:20 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] arm64: dts: imx93-14x14-evk: Add bt-sco and audio XCVR sound cards
Date: Mon,  1 Dec 2025 15:58:42 +0900
Message-ID: <20251201065844.3823323-1-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.50.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0086.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2bf::16) To AM9PR04MB8353.eurprd04.prod.outlook.com
 (2603:10a6:20b:3ef::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8353:EE_|OSKPR04MB11416:EE_
X-MS-Office365-Filtering-Correlation-Id: edb2cbd8-21bc-4268-2355-08de30a74a8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|1800799024|52116014|376014|7416014|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OGNQe2LuYudCf/Wp4w2IlAYn6o3wH8uD2cD6+x+h3sU+Mn4mWbdPOEWLXZvF?=
 =?us-ascii?Q?YNYyWRSV1W77ZT4tTX5ce1WslshbbjaMSUZLwm4bXLCfTqMIW8Hl4hIs9RzK?=
 =?us-ascii?Q?aoQ8E3P27jRB5OyrU0D2HbEz4ZhLtBoj/Nelr2YcYJqSPjPWZ4llOR+GB7CS?=
 =?us-ascii?Q?juLBYLDTO/qD/7r54tZk5Du6LEbii7sQhB3LN/Icug1OPhA51laJIHUaHQxr?=
 =?us-ascii?Q?EknN9NQrsJ78lkdLe5aj3WhPxNKDRuslXuHmVNop7R3lTbMbci3lHpR1d45c?=
 =?us-ascii?Q?IuBIc4zgxFx/IPotXI5SH9swV7KCC0QUzBAz/koWUgbxBxkVwsAXcVRPmVsh?=
 =?us-ascii?Q?fB0AZZ3r2wbSuZeiXDNnBxWSYTXrHnU+KGsCdzI3otTojBBmI/uVWiE9aNoc?=
 =?us-ascii?Q?B7j+wDrG6V5Cb2Rpc0PMl+YOxkAc9NX6Vr2MmY9yPpo6v6pCBm3jeLNeI2jr?=
 =?us-ascii?Q?6a3iVGl2a9BiceX8DNlgwVov/esnOvGyXttqb4IPih1unTH+Wv7nxeOhvceJ?=
 =?us-ascii?Q?ytre0zuF642eNL/bub2S1kKKMvOcOISMJPRS55M2qGwDWXkteBnnk6IrNPOz?=
 =?us-ascii?Q?421nJcPKPztwp6h6JdOxrLFrF4vbRTLQiGd4i0nWHow+FNYNVUoFbFyObp1Y?=
 =?us-ascii?Q?5zUDPBIT3E0J0JvuLnEYbQCU+6QIluSGTfS4cF7hPzpLoMAgh2RxIZn++ioU?=
 =?us-ascii?Q?aWlEILJ26OzsUlfy8XZ46MH/zhBOX36ddEKJAlcPy4hLDokOd/cPINVsCCYr?=
 =?us-ascii?Q?zfiqIa/lhro57l32uBl520w53svIKHE//zh+k1UP6pQ92wUe0ez9KbrnfZQg?=
 =?us-ascii?Q?1sJuarBOitp84KDjDWIpthsdYOimFdAksVUNjhQNSEudIJJjPjVTHT+096/b?=
 =?us-ascii?Q?nl024KcWpJ96ChaOwOFZMphJGtvzVAhbPKavUJRpjxvXiu8VD0u9cOsk2WfO?=
 =?us-ascii?Q?R6S45orCbgCXG2d98Chp7qR+PEb49/0O5kTrcEgb3nnR6SGCoQ5dJ3y+GHBf?=
 =?us-ascii?Q?R7UXZoBdZw0nbkNPyRfpgsRpS8ELOI596zW3II/Id5Sx6OC0TNzDneaWnaP7?=
 =?us-ascii?Q?HYA5UbzmvDitCjV9RZXeFD456oAzjj87TxIevMNo4rAY8OG86sQlSZyNvKF/?=
 =?us-ascii?Q?rH1SH2evFoScRpj2yzIdj844DRu9vxkZR+9sayJzku0wpooKR0vp6/ghdtKk?=
 =?us-ascii?Q?Ln+CSwFpZaADIZujo+JCyHF2IHV1Nz3saCNlWgeyZCQytlqZ1u+//oPZiccN?=
 =?us-ascii?Q?L4ejbRyqoCX6HBH3DUEnuR/q3AnogmH3HhoQ0p0pzH9UH84o09g7TPZJzuMV?=
 =?us-ascii?Q?jymSArG9cE9DnzzAZfA4a/3KZ+VPHPSoqJWGUJZnjV2LFeVtYZt5jaari5ee?=
 =?us-ascii?Q?7JcIH/Hz+OMLCC5RwWFXMR/gcijbnHENpi4OJmoECv8QDC6MgMdz+nCM0XJI?=
 =?us-ascii?Q?APfX6Q56djAnvVedPwx22wfTHVvkdK+aLlWoLU9qewQos/T0wRvemDVFr7oi?=
 =?us-ascii?Q?4ZKYHlnlyk7tox3F1e7AcTdTFuvdNCGGVTzwuBOurjJotHK/Tvoa1MjtzA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8353.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(52116014)(376014)(7416014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zpjOQD5eoE3WF4A1hDXmy/PZwDxEUND+ZwTeTs7ga/coJR66ARNM5n4sxIRs?=
 =?us-ascii?Q?5XctjXOgSGflUTM2DfDTlaqHqzAYRal56aoyB1SMfxpvnQTYCFIND6usqvyy?=
 =?us-ascii?Q?zWMqkVqoSovL75HLuXSM3V1zxg/y2oQfvlHf5jLpEPY33sMkt4WgqvylyVYa?=
 =?us-ascii?Q?f6PQUykNYFQ5Nmh8NS9VFHdcoX6J5fmR9lWnhKpgT2W9YkAKdYoYZG2Mj3mn?=
 =?us-ascii?Q?EB5wvoGsZzmGC94EMapDSqwgRCEjZ5BsluIZl1lHGv9azzCHVOxI3tq2qz8K?=
 =?us-ascii?Q?X/zI2hBn04KnB6uDgCkUFWK6eaXmM87qY0awMWcvNUFZ1jto6fkDLmd09Aqf?=
 =?us-ascii?Q?zsNFS4+Df5zlZvledoZQozGeKWGO0dTOnFaYzgKVNcl47piAFN3aeV6vHDX3?=
 =?us-ascii?Q?2fX3fJiaExyZCAYX4E7VCDUMFnCCy0k0gcOT71iAla5uvHcCgadqNeDt/7ux?=
 =?us-ascii?Q?RVQvcBKIrpaUPkGF1XPftECl+ICgkpHk42DqInkWWjyA1TRWGsV/mr2jMX9g?=
 =?us-ascii?Q?aF+rj6sFo1EABsWzWKVXise4su8RWPNKzwMs2JfHOeOqVYNcbYiQgheR8tRu?=
 =?us-ascii?Q?i//cAcM2JXEfwFxdam8CUgxkCF47UygeXq1agqmW9izq4rF4vjVMtj7+VYNa?=
 =?us-ascii?Q?t0y8uhwZO31FmHTHy6VgF3BfSR0AhLkg4T1mkKUFRKUbdBHG0+jCvwLAkWsg?=
 =?us-ascii?Q?1v+Lhi+Q48AvoLkegc4oUnsjeEPvqzp0RHYDmMSbY/BTgwVVqqDkDlY8lfRN?=
 =?us-ascii?Q?8OEllm94VZiyyr4YDpEcMIPwZw1xeRDMoF6Cw0ilMu3qfdqR2MHRjtU0cDEy?=
 =?us-ascii?Q?f9mncJ4QbRw7s3inIYRCRXtoNleP6ibCTm/C2idlCb48i8zAJObhc2+iHJZc?=
 =?us-ascii?Q?GN4zg2xvIt27pGww7V2a9KHZc2hsOCju0j8QC8Zu+gSPGVMB/Vl72kjDsVqo?=
 =?us-ascii?Q?CmMfZjkqjbEmX3t8svZ+RuL1wf+sR4gJakiQ1R1PjQJ8ERib4mCnpB4bshj0?=
 =?us-ascii?Q?vrskse3m3ITjMVHQrXHhT2eg+Dht2JSXZ2umc8ZDgvtJ52Pm9OCLbWcKNocc?=
 =?us-ascii?Q?aoz0FGzvO9if+oYUOypw6g0o1UOe28m/6Ocd+e1dLxpA9c3vDBTX6GkrN0C2?=
 =?us-ascii?Q?VqHcGJ60eD9CAcMP0sUd+BYF3YxA0QDuu2iNcid1lIG318hRJuLIbnh7TDJU?=
 =?us-ascii?Q?n4Eo/dfApaLamTTy5r4oSum6dcgMLb3sXeLEG3qzQy3zYlics1REngxopT+4?=
 =?us-ascii?Q?Drt+zvaCh4uKIolRI7gf1o1HegLfYDGzDZdd+u7mv7FAa0uDXDABogMdxHYO?=
 =?us-ascii?Q?ZEs1NoRbgFF4GXtTeLAWDFdMftQYefA54hw7dAZtR2bln/h60LiZFbp+6Xlv?=
 =?us-ascii?Q?66YeeA6kQdTKF8jma+HkShG0jkfPUbOEvWqxRVOT2LO9iz9YeGaESKQNPlzB?=
 =?us-ascii?Q?DOnh5F7WdKebRbYDWEnztfzsf4nCeRFZXaBwjFtyFWOsfGMIaRVSeVUXJCPE?=
 =?us-ascii?Q?GF563kGaRp8b6yGqBJRwscjp8Kh5GZWJamCANE10Ac+JmjVN/ox3TrGtJGLQ?=
 =?us-ascii?Q?Y7UnkLRB24rjZiUk1BXUb8CsHqccchm+EtyJJOW/?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edb2cbd8-21bc-4268-2355-08de30a74a8e
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8353.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 07:00:20.5228
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: znN8U66LbgLkVZXC2+efloohsRgDIWmr1M/SyCnFWv3kZlcAINLDkpG5QqCt7GEVjBWoHW8UR7vtnHKZtQBxIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSKPR04MB11416
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251130_230026_165969_33F86910 
X-CRM114-Status: UNSURE (   6.72  )
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

Add bt-sco and audio XCVR sound cards

Chancel Liu (2):
  arm64: dts: imx93-14x14-evk: Add bt-sco sound card support
  arm64: dts: imx93-14x14-evk: Add audio XCVR sound card

 .../boot/dts/freescale/imx93-14x14-evk.dts    | 74 +++++++++++++++++++
 1 file changed, 74 insertions(+)

-- 
2.50.1


