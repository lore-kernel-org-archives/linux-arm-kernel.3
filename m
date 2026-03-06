Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCB4BFCB615
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 15:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EhpopCPKvuwkj6FC9iA/wvM7/RzmN7Zdv6rgKnpBY0M=; b=z7EBMltndRzvY0rXqFWQZ4uJG3
	trEvLlTHSSJHLA6cr8bCk4Y1BLGE/Zb9YLA2tpLVz+i3n4MsM41eO4BzPbascUbiVYhRkTBPVPJH8
	4/ZQH2s098AztLo9dFwubrsz5gO5UjPZ+r2Fl1ppel33b4XH6/4r6MFR22VuQ8uIT7u/cxbHlG7JO
	tmv6stsdZtbuhPAcbPXqTQajYUYGFxSwCV0Lz7TchxzrKALGmbceJ7YemJTQdZ/NHTTNJdvDqAHpE
	jeQn2BprTuhZZlSqTpRrXOvq84fVkxk6+cRBTIejiweMBe4xZQYPFSMTxI1k+eWJZkwfRH25jVWss
	oxbEFUwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyX4C-000000041g6-0gWv;
	Fri, 06 Mar 2026 15:26:16 +0000
Received: from mail-westeuropeazon11010028.outbound.protection.outlook.com ([52.101.69.28] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyX4A-000000041fM-1z2X
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 15:26:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PjmBe0tvnoSqIpLc4yx1kqrNuZ8bZcGbAt6ks8Ml7M7uRYdo9sGqAbmSpNqJxYAsDMjjRGIPwEdotBl+HrzNcWS6RhOIyYkykaquhJzIym0k3b3D5w4ZCwsOCTYinRXLZRI1zqHFlGIckykDeNsXfyCRyhB9u9LeNZaU9lbhDmI0josubVrB63jLPOpsR8PVcsiGhbmDupeV1DhYgn3wu1F0zCgKoKLqedOEaGPJgDo11w8pnH3knuHxx1nRcIGvK3QAv4DIQRzG2zTNav7gIntn7Hg1VWBUXPF24I/B18fUJum3rO2bkuUJxmi+OsObilYSeMXJTCLzT91IfqicRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EhpopCPKvuwkj6FC9iA/wvM7/RzmN7Zdv6rgKnpBY0M=;
 b=b2LsC3dER5KeAwFICw97tBv9kZ5FCcT/xJhxyxtohwbDtqL94oo7T5UMMv5kGjZS+VBJ+g2QcL4C7KecQqu076o6d2ffDHJIqEKabYgRMcEjLduicvuli39V9zCHur0e2Ez6mOfCPkOEYzTdVaRSTHtp1HbJvFvYudb5h8LxzYcJ0vcamAMO1EpsgG/L6BvUgOkv7BqRM9Hqafomh4Ayt/97Fp4np93P5eT1gXlv35dMMg7pvvEJcx3npJj4cPlQHxjR8di1D8ygnJDXoexZmcilsbVI0jrsNpT/Ns2VTR0/krVeoUvnYbnhuouOWcc278JcNVLOWciUnr7H5ZoYmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EhpopCPKvuwkj6FC9iA/wvM7/RzmN7Zdv6rgKnpBY0M=;
 b=iI/mky5XP7m1mGmpXUXdqwI8pnGYAWnlZ30fkOimv7mMl6OaBu1zaJIjqUQWP7fZXGh/dYArr0uAQyOCc15i9oXevNlsPEWsq2PaI5954tmM7mHzu7qZRCoA9Gg5PqtGUPA7kMRXAZSonoEQ1oY6C1FdGr9ujSBVAXNpeCkiimwiJF5P3Nct1AOOivnrfRtPPU+RsJ0oa6fLQDRql55hdub35dWRKRzYUEy2YGGxwysRm0AFcqNYtuA04QQVkabtMbJFsO7q3sGep5lTaF2Zza8XpAeFYMh+DL6MT+LezZOWM8LOy8xUaLyPMNFYDouz5DqPLn8cdGwvaMKgfuS7AQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by DU4PR04MB11908.eurprd04.prod.outlook.com (2603:10a6:10:61c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Fri, 6 Mar
 2026 15:11:59 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::5c3a:1a67:2e02:20d0]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::5c3a:1a67:2e02:20d0%5]) with mapi id 15.20.9654.022; Fri, 6 Mar 2026
 15:11:59 +0000
From: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Haibo Chen <haibo.chen@nxp.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Lucas Stach <l.stach@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	s32@nxp.com,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Eric Chanudet <echanude@redhat.com>,
	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
Subject: [PATCH v3 6/8] irqchip: add ARCH_S32 dependency to Kconfig
Date: Fri,  6 Mar 2026 16:11:45 +0100
Message-ID: <20260306151147.24446-7-ciprianmarian.costea@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260306151147.24446-1-ciprianmarian.costea@oss.nxp.com>
References: <20260306151147.24446-1-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0161.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ba::13) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|DU4PR04MB11908:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f495ee9-f05b-40f4-0379-08de7b92b6a7
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|1800799024|366016|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info: obYa7V5pRzbin+E6k5ftgeolQ+RIcYAJH5aoCqV0/3t9gqzoeLvH3GlX/P5kWZ3aDw3V2JF6tkHwm1VvnIA/AKaG3TGdBPNNcpfnF7xzhwQkhTU91zoOEPKEX1g3xJzKkJ07rvcYF64YSErUrdaZIZFrLaX4W472IGL8T0ZOsvRLJZY1Qaspt+00bvEXyqvixsa9ueiUdnS/kMYG29pMma+bLtWAdhBhmg9X/ggOh1wVcF1VGJls7TbhMdRhE8qF7BFThUk5I6rbjAILqI+LRoZsAATQYF5CLShxoUOsrGNhmJmjfDj1bETEfEchYq72S830EUSkQ1Z/PFINo9+J8guqsQ5Y2oW6IHTSRvpIlfPa6bw/IpU/wjiRB1337eDh7xrRmcDOabuprCBNFBg5A2CEJrw2gxK0w1enHCsPX19t1tnvgUTCNASUvQMQ2Myy/84IscUKkkHea3XPzxfC3b2OmnR+fl5rgLQEAuzF8OYgDFAg0SkRmJ4DIFswNzCigwYLZQTsayKrMKmdZ7kc7GsW1yfEkMPCg39e0fDDEk8Ld6S0kmLAiVLbY67nasyYEMQXIApCdYfGJvLzfWGxN4xMcRBAld3Q/pjZUWYL7sfxx8CkLAulWRYjIwT4i5ZTjQuRWAOZalGkU+P+QS9TBYgNfIe2RqBtmnnFLO5Yys0rR7l2PcFnLHsILJpEBU7/29jIC9Qy79p0IEbO77AkXoDRFH1n2iIG5psDfg3DdxNY+lUxMU+uDKGQv+AHSsKQdRO/QuUxBRzNdbLWwVAq9A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(376014)(7416014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bXczZFFZV1FiVWFzTllWTm1ESlJzQ1hQMWo0SFNIM1hKY09oSzRoT0tXUCtM?=
 =?utf-8?B?NUMxTkVBRlQrZXc4WlN1VmVyTDB6V0FQZjVvTENxcENMK3J0WTRUaHpyS0hV?=
 =?utf-8?B?Qm1NTDVpbFlDdmpkUUpFZ3JLbmNJdEZqZlR3b0doNFpaUEdLQytGSWFINmtl?=
 =?utf-8?B?SE1xMG1JN0x2SmhvdGZBU3o1S051Um5Zc1JNRHkvSUtQeWMxNTdNYmhyNDF1?=
 =?utf-8?B?NFBGU3hHR2ZGd1N2dk84TFg1YXl6R0JiR2pzWVBsRXdIWG5xS0xQaWpib0s1?=
 =?utf-8?B?ckhpY1ZaRDlzZFc2NjhmaXJ3K2NocnVxUVZMYWh5OVVJTnpibTFBYm5pMEU4?=
 =?utf-8?B?L3FUMFVsWERrN0pnajRRcEFVNVo2cEpIRVQ0UDk1amVPd0x3MEl4dTJZK2Yz?=
 =?utf-8?B?MDJIZmJiazN5SXBUSzZZWW9mVC9hNDd5UWFVbEUyQUhJVnN6aVE1dTR6YjVP?=
 =?utf-8?B?OFpmdnd6aVBUNDVxeklIOUZOTDdKVkFIcmliTUxEeFRLYzdtcERwWXE3aW9v?=
 =?utf-8?B?WHNzUVN3dVJRakdaM0lGYVVmLzRqTkNld3JhM01NR2dPaWxRU08yQkdGUGFx?=
 =?utf-8?B?ZGhhem1NNGt4WVo0Yzk5d1VFWFl0cm95dkRHbHpLTC9vOC8yMHR1SGZDMzZX?=
 =?utf-8?B?TWhTSjVnVC9jaUpLVTJtV1hMR083QWRZbTg0bTJJOVl4VGl5MlFZbjMzYUlJ?=
 =?utf-8?B?Mm5iQ3pJdWF4QktXZ3NkR1BsN3A3MGhkS21PZDRQTCtlTVBtcmVuL0w1ODN3?=
 =?utf-8?B?bTNRdlBHdkJSSTVpejJnRTlSNndqZVdhcmcrdnNZdUluckZZVDQvTEFDRXJq?=
 =?utf-8?B?aUwrS2VGOFNDOWhqWXpJd2NoczJsbmhIVzJaaHdlQ1dHamNyUVRHaE13UTlm?=
 =?utf-8?B?a0wzcmxxMUpTZHhtZE91bzlPbUxPV2NDSEpidGRFNG9vTWlUME15Smx2c1VY?=
 =?utf-8?B?d2ZQeW0yaDZDejM0K1Z0RFBrVXpLcFNUcEdNTWhDei9scktBVHV6bjVEeFda?=
 =?utf-8?B?SmJJRVpWNXVWaTVQbFNyOFgwVldRWUlpak9VUjRNYVJ3andjTEQrZkh6VEFz?=
 =?utf-8?B?WHdEbytDSU5uSVptdTJrUmZIaXpOOHB5c0FSVDNRNGp0K1NYTWNsdDBuZEM4?=
 =?utf-8?B?UDE1L0ZicW0vWHRCSnhLTlBXZWFtWk9TdkFIdkkvTVYzSkV5T1l0RmFHK3hl?=
 =?utf-8?B?WHhBMDN3WExQNVhkbDJZTGo0UTJoWFRCVEZpN2FueEVJdmJTc1FQQnJuZTAv?=
 =?utf-8?B?TEYxZDhtT0NiM3lDQmFLYStwMGdNSDh6My9iMXBlSW8wU3B3OFRDMFRaaytR?=
 =?utf-8?B?OVVmWXNHejc1OWU2clBmSjJiWjYvRzRDYUlrLzFBTHg2RXNvMVp2S1V6YWNC?=
 =?utf-8?B?YTI1dHBId1NLL3JiaG1CYkZZMXFwbk1JazVQelp0Q216My9zaHRoQ090RjZt?=
 =?utf-8?B?OTdxQWlpMHM2eW5haXF1MS9EWFRsanNoY1g4THBHVXp6ZENSNDlKUFRITUlk?=
 =?utf-8?B?Z0RDbmI4Y0U0aVlMOWhKdWZURlpIQUpTVXJNS2R3WG9qYjdDOXFJV0hXS1Nx?=
 =?utf-8?B?YzJ5UHVJQmRwc0wxdEpEdk81eFNqNUxaOURUVXYyUitmUWszOHZLYVJVZ3Fu?=
 =?utf-8?B?RGthTld0MUFTeXpud2svMG13eXdMbTBSSEs0bElneFBBSFozRU0vWCtPSWhZ?=
 =?utf-8?B?K3hBZWZWZm1lMjFoSTZzQXBRbFdpbXI5MTVJbDhPWlZ6b1NDcm5kSnQ0WmRD?=
 =?utf-8?B?ODd5TWVvbWRYZ1FVQ0luUFBSM3dtQ2x5WFpRbXhKUHlBdStJSFZ4N1JRcCta?=
 =?utf-8?B?eENOcE5lTm9IRjloRmJYT000ZGtmdVZBb3NyTW9EWTB0UEhCREozdHZLOXdU?=
 =?utf-8?B?Y1NMVzIrbVdrRENSMkRwc3BQQUNqbWdLRjdVaVZlcDhVbU1kcjdFWmh3cGd1?=
 =?utf-8?B?cjR6Snl2TnVmSnMvZW94aUlNdlFrZFlBemRZa21URFNUNE43VTlNM2NGbzdh?=
 =?utf-8?B?SFBhNXl4eDhXNXFqN2ttSXh2OURIV0RZZkp2aFpoWE9qOEMvM1VxWmRLc29Y?=
 =?utf-8?B?YVo5dEwzWU9sZlF0Z2RjeU5qa3NXeEplbVR2YVQ3NFRpay9DNUFiaWdrOGpp?=
 =?utf-8?B?b2h4YmgzajlDYlA4aHRXSXVVTmd1R2NsYW92SzMyN250TURxM28wWS8xYUNy?=
 =?utf-8?B?L1Q2aTg3d0dVZEVmVk00Z1FmcUFoQUh4UHgvYWxZZllYZG5NRDJUVk8zd1Q4?=
 =?utf-8?B?U1pSQXJ0Q2pZS0RvVm5Nb1VnN0RveTA2NjUyd051clVVbUJQangvUUVzS0Jm?=
 =?utf-8?B?QjNRazZIeWVHRnNaNllxcjBNaVNvdWJPZzM5WHdMZGpvenVGSXF3cG5HbGZo?=
 =?utf-8?Q?TFPtu4pKN12AICpY=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f495ee9-f05b-40f4-0379-08de7b92b6a7
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 15:11:59.4397
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kdl+W6yGz8Fmk0n4nILjbm/+TTBDQ4vewONlFhm/bb45jrJV6g4hSgZf3r8tL8IvYmSx/hacfX1excufC0iNlJ9gc2L+ZEPe5kDIjfIwYQ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11908
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_072614_505582_4D1B1001 
X-CRM114-Status: GOOD (  11.99  )
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

From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

IMX_IRQSTEER is also used on ARCH_S32, but only requires ARCH_MXC. This
can result in unmet dependencies when compiling strictly for ARCH_S32.
Resolve this by adding ARCH_S32 in the driver's dependencies as an
alternative.

Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
---
 drivers/irqchip/Kconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index f07b00d7fef9..ad32a084afba 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -541,11 +541,11 @@ config CSKY_APB_INTC
 
 config IMX_IRQSTEER
 	bool "i.MX IRQSTEER support"
-	depends on ARCH_MXC || COMPILE_TEST
-	default ARCH_MXC
+	depends on ARCH_MXC || ARCH_S32 || COMPILE_TEST
+	default y if ARCH_MXC || ARCH_S32
 	select IRQ_DOMAIN
 	help
-	  Support for the i.MX IRQSTEER interrupt multiplexer/remapper.
+	  Support for the i.MX and S32 IRQSTEER interrupt multiplexer/remapper.
 
 config IMX_INTMUX
 	bool "i.MX INTMUX support" if COMPILE_TEST
-- 
2.43.0


