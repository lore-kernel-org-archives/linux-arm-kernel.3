Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BD91CAC597
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 08:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a5WRwDi/7DkdLnpcPsSPT1RPS4RzyJQy6KGy+SpAJvA=; b=ofHSZW+6IEKcg/9aVI3Xu8ld7d
	EG3cL8JGyMvo1oMX0FDF9HNJ8B5zwwGbuTL2VDYeLpKNFUy9eqEXFoyt+hYLVzZ6x/y9OpZJz2K8P
	q0Uw6R/1JmiA//xeVU4UTHT0oO/LCOSzqWjt7vn9uZgnAHQVbBLGY4sRgeFpypWydkzZOoJ537x5U
	x3yqQ7DN6pFx8Z9t5fXI+EcxjlmWO7JVYPBp1ab/tF/GmunvgXjGrS4q82GqnYNrrXHee7KE/qnj0
	avAnA5te0FdweA33e2AOFkG77Jv7iHoYx1fOYRuqmKLel0sI+a02x+MEGpZE2K4mr1MFDvlAAartm
	yVgbIx8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzA22-0000000GhbO-2GFz;
	Thu, 18 Sep 2025 08:30:22 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzA1z-0000000Ghap-3lQ7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 08:30:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WBEr0qCrDTimXnYYjgCa09aPa4xXWYCGF6OjLjwLNAy261cVJThRRTer+D9uLKeLHy87D0XZuIc5w8Sc6C9GktT+S56LeXrmBjOiloOIgExv3K8YLeNGO0VX5ZBmbRKMyWHIqaCapdUZb4FjxqsnFjHKwmLu3ARhlbMM/0Q8vuQf1aMomhW9UbQ1/jn/LmQCwxfa/TbYu0z4XPdxKjV35aRHGThojew7oKFBhdE/lpquBtRQotKDsQBNXswXl6VhKKBdoC80iaq0f94ZJKLRWjLjQ3o6YJK5AjbFbNi3oNKhWXKv2LXMwKgx5CSisy+ps99G+QPWRE+rkjo/S79f1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a5WRwDi/7DkdLnpcPsSPT1RPS4RzyJQy6KGy+SpAJvA=;
 b=FYO8o9HuztKtJ/e/5oNGgtVjkCxRS3TkLY6rE0uckNLaMsLoEHv+hiy30d0YLoJ3JlZmh/GbOyF0QqHsH7l3H53oysT4Jzz1l8FNobUg8CygkkGx9B9ZZxWTPndEbppaHoz1YXoN+jgvZMqVDFeZy9nEZJsKdnobvf8CHA907MTOaTqqQbq7Yb9gEHlZoqyJCT1RQ2g1syJik5sDaOdE+P2P6H/mv0NZlVZyE7AMJcoV2qy+exZEKX2vGvD7YktdRM5+RQvEUjB06V/v+tZfX4jAkhjb5ba74otcAn8ZiIn9dwNemesnLdNhXOORo0orxrv7e7irm/4Chl2JmlOGBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a5WRwDi/7DkdLnpcPsSPT1RPS4RzyJQy6KGy+SpAJvA=;
 b=GZY0u7gYMgVp2Wiht1TOBXXKyf8QzRg2gIwb8oFRtwDGt/6Jgxi+Ei68nxqiTrBHQEjPDWfsqDVIbC21S5b0+YJlYTjSYAbNe8gY2zkWZ+xLRMDuoRZbOalTlm909TidP3G2q60+4EvjXbit66q7oErUA2ECRlj7JmQRwYrEtH6V0iNQFL49F/OnbRnMrf9J3Hz/le5fh5gpsmEQtSPvfeX/bK+KrF+tYz5pO7bI3T/6bNJdxR3z+gHrdITlgBHdVYu9OfVpoejfUUS4Rmk/hmJeMua5RILq5kRYU2IX749FBeux/7cnEhm0oFyslWntrZGdc8HqCCMSyZHgDsOe2w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI1PR04MB6910.eurprd04.prod.outlook.com (2603:10a6:803:135::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.14; Thu, 18 Sep
 2025 08:30:09 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 08:30:09 +0000
Date: Thu, 18 Sep 2025 17:41:47 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Primoz Fiser <primoz.fiser@norik.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, upstream@lists.phytec.de
Subject: Re: [PATCH 2/2] arm64: dts: freescale: imx93-phyboard-segin: Add USB
 vbus regulators
Message-ID: <20250918094147.GC9196@nxa18884-linux.ap.freescale.net>
References: <20250916080635.1520551-1-primoz.fiser@norik.com>
 <20250916080635.1520551-2-primoz.fiser@norik.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250916080635.1520551-2-primoz.fiser@norik.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI2PR02CA0042.apcprd02.prod.outlook.com
 (2603:1096:4:196::19) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|VI1PR04MB6910:EE_
X-MS-Office365-Filtering-Correlation-Id: 026f87f0-7c9f-41f0-dc71-08ddf68d93f7
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|366016|1800799024|52116014|376014|7416014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2vn0K1klahcOJmJrvOfp+g3d+VwIIq4ONM8i41mLtF9zMotWQL2VxrHXR3DD?=
 =?us-ascii?Q?0XnqfjmDSb35+M2VbRJ+E0Do9icQKDCzXpVzEztsC+EM7ldDFQF0JGJPjOWR?=
 =?us-ascii?Q?vrHttGaId/Sbm/9Sngk9HO9lY8P/uxYGNJ24vgPOjvhYb4cKfXT7V22rAuQC?=
 =?us-ascii?Q?tXb8b9pDsnZ4kv99FRO9+WExccVhYx92Y+6flyjNFLi+QkgH/4Jwt19DuDY/?=
 =?us-ascii?Q?V0QvQoo+feNm+yYK91PrfSLj7yKmVtK5V+WaanmepYAqYPoNnLoOwJILAACt?=
 =?us-ascii?Q?/B7YRHt7lM5m9Nsthg5cgXAwtTQRfGYwMplcVzsYk1igjzVUDKJnu/np6D7X?=
 =?us-ascii?Q?fXqAJOTCOiBdsGiJ9YKwCwuBea49AIv31Ox5lPb6EpGyF2QMq7QV/coH7wkY?=
 =?us-ascii?Q?WIFtpiGqtvkobknDhBbAzRTc7Es+axA6WAaSyTx1wApDiSY/1x9GklxU2yOy?=
 =?us-ascii?Q?ljME4sYAhQvNRfpSDU1w+U8ZA8j3aoFo8zFA8n4ryA9ElYNaPAELqtwbHi3d?=
 =?us-ascii?Q?L86rxuw2wUuLHc1yARs77CT8RiMi0SpxrzBAlJ5lsewXh78iNd+BibVP3gBf?=
 =?us-ascii?Q?ligwBArCx1K4RXXojKaiz9AIHubxazwKTGUMuvXn/adPwQFFbiEPc+5txPsy?=
 =?us-ascii?Q?SBETi8Ox2RG+wINFnz34zAoCMCYOsvBs8uw82BKUqMwVH5E1stG1DTTybH2I?=
 =?us-ascii?Q?KK6bu+wEolVp6O5vEtYH8RZ9ytiZxC1JtiL6lkW5UCCAYL7cQynI8dST5Ile?=
 =?us-ascii?Q?JEzN3a4lp/bIxG4aQq1ipFEYIJRjsUW1D19V/ziHv0Tlr9CsSKMBIre8h/mp?=
 =?us-ascii?Q?hr2gzXodgScIZ6rYv8Iaf+kmvSm35M31nLl9k0ZN6nqrtEdHikGVAQ6NK5xk?=
 =?us-ascii?Q?z9pzom7k/UWUgLldgKZy5+z1OLq/7tLxnhOz4NPdc/wjisPSPMNdBAkpGGRY?=
 =?us-ascii?Q?8C5oaH5UlyjCh9MG1qToLXEod+iFJD+ImiytX1Te5vqeJxPf+xbqjjtVUuQQ?=
 =?us-ascii?Q?a3ZhrxWCg8fRxsgGLOnpN0LomsxsZZOaVQt56Y7uA1r1/nArscCXsBZZNvkU?=
 =?us-ascii?Q?ppnmuWnu/H+z+wYfYgcxjHl9sbe5esIJT4P8qItpRJbKTNoUIQ7VTrjXLdGx?=
 =?us-ascii?Q?yXmULRtzR8JKL5HK87et3WNgZXOOEvH8OxTRlkMWGquR1pkmS8DnCS6y+asr?=
 =?us-ascii?Q?rTeIMunEfDKQiNDmgoI2n8w+L0IoAWkqImhOmKGRpEHZscqLYUssIFGnWTKR?=
 =?us-ascii?Q?fUNWBBcj7Gi22CYWHAR1eKtk8fF0dDFlbUoV77OIF/p9wSsmJmFYVQlgmbzX?=
 =?us-ascii?Q?JfY2fESorBfUZixFVIidbnIcdQtEp9RmXDzx7P2kYtz3905dzlbbcZXMkc+b?=
 =?us-ascii?Q?oxx67QnMUmfdrussh5S5zzxpF8v3ZiO17eWtoEmx1jsZ179See2G1sh4JBVO?=
 =?us-ascii?Q?Mb2SZLCnM4KelUrsbc4Td99JITJ9jDjRMLJ1HMobEjU8fkAfCrL7mg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(52116014)(376014)(7416014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dLJh5PJHouf4TX8XWxc3M0mD1MLUZoDs82gmffRV5PhkEiSgWxKYAi+ZUxl8?=
 =?us-ascii?Q?qse5v+uMJBUapMXCr8OC4jh6USubshojYN4V29SzAvcQbRfKXrm7C+/b09vZ?=
 =?us-ascii?Q?vVoJ+rg50dt15Hm8jcKesmQXPk1bAAZ3euogOGSw28yKlmQCq/qyXoUjTFhC?=
 =?us-ascii?Q?sQWQWGgEwmdxrhUMTyx4hC8V3uacmABV63bvNPSbmYxv64WK3K6Ne3Z/zxab?=
 =?us-ascii?Q?z4LmBHvnW+/68E8y3BVOP4YZrfHaG/WKev1Km364xd/20AOrrdKkN//8odb8?=
 =?us-ascii?Q?P7765WHiNYuP3lRgOdvKzmOeuVUMi8t+0Rys4ELfNwENe3/42T1c3pbPkfp+?=
 =?us-ascii?Q?5bK6t4nilv5VaVL0TTDfRbohfdJkM8fXP8yujU+MUXPwPN7oYg6NrKZJsIiY?=
 =?us-ascii?Q?e4aTVztLeUrc8/tTs0SuPId0wxsUNOpHI+9V60AZL/P2XtIG+YjIHd8RVat/?=
 =?us-ascii?Q?xawHFD60ovhsVxGTqt2xh5ri1yFkNjO28OENP69OLnzKI7ud2xHOpcdXF62W?=
 =?us-ascii?Q?zxaHnuqW1IIa16w9Yjy1wvZx4bIvdA6BDGjViJnO5KAAOg7sUo+x45N+QfN/?=
 =?us-ascii?Q?lKpP6uVgms9XpkQLfikZHiqPREkZZhQD+DN5Jb/QCFJyEUxUe8BmN/otXX2H?=
 =?us-ascii?Q?GH14yxWUOBynEChKAJTSPDeAiY8NvHHY1zmwdHQLdIDApiEGmkzmiN6kZbkh?=
 =?us-ascii?Q?BvMhhn2gUfyFFxiFgFJOm5OU8NqlJ3GiBwaOZ8HuNK5i/Sq6cyRLb2N8HGBL?=
 =?us-ascii?Q?Pkl3MD0/JR/83CDw9et5050WBei4Tj814TdGVUlnS1x9Y95937DWegpEHIX9?=
 =?us-ascii?Q?ZHTcBTAy3o3qDFkmIuKDwPADlO3UYdfTxJp3qrjyIp0G3WjNCTHme+r9wXfI?=
 =?us-ascii?Q?6QddqhTzB+Ri9ROpBQHv2Ww7T2G489/Ea7qoEueKE3AdLi5DeDEZxAJ4AWFh?=
 =?us-ascii?Q?QOel0IjhrN6ZJu6DBEtm+6CdhnFzBCYMJpWOFLk2wcRgwPQXlnJV8YYCKsPV?=
 =?us-ascii?Q?T2/zRGmDQKT9be0BqrldQ2waXsCgi5FGnRGBoIpz67dzfI/CQNBnIB/AMA3/?=
 =?us-ascii?Q?VOx53r+LIFHqWjDI4eZ+/a4o9wjzpZDLWDQTtBI1/DVHfXD7oxvLItegtMED?=
 =?us-ascii?Q?wucP13Ahkw+Xr6g7oDwtTQdnu8VtRrnp2rsWmkFFxrFwk7PTA/6a6nXVcsZi?=
 =?us-ascii?Q?dJ79LQt1Z3ikia028/f3cJ8XTBQ1l2ESz3KRTJSoU4fHAI1erghMiNyGqaT+?=
 =?us-ascii?Q?2683ZRCXVN1fWpf56+BnO6nWHoeqU/0sAMZxVEF+BaMNOrD7GUH03h8oVKYA?=
 =?us-ascii?Q?gQIVgELj/Jf77PLc1xLvxwwlgeS24DOIllXWKUebepMi/5CMRWShGVyI/zRy?=
 =?us-ascii?Q?F0G9MDzf7w+r/6euJeGeatxxfsY2kFlkfsmfnYruCmIBvPqqFvMxtWMa19ju?=
 =?us-ascii?Q?WbjmKmVSP1Wli9NDUsIoiihLwcCey92562WYSxUthXLM/cxDkcwEhBx9fzhp?=
 =?us-ascii?Q?hF9bkPK7IIS7niOFKIUAhx2KiXBUMUjlbAvdEc53FL2lje1gOEMAzRapZKcO?=
 =?us-ascii?Q?NFfDIpniXt//XXocUpig+nRaGH0uIjul2tCYgHbM?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 026f87f0-7c9f-41f0-dc71-08ddf68d93f7
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 08:30:09.1394
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4gUP07Z9+o6RfVB2KpNSPtUyXpGNpaKlbhJEZAZBPRtI09iJ0O6NPn4GNZUPVyW41QRYR/sxfs7uKSokUsaiJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6910
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_013019_940170_2872F348 
X-CRM114-Status: UNSURE (   6.82  )
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

On Tue, Sep 16, 2025 at 10:06:35AM +0200, Primoz Fiser wrote:
>Add USB vbus regulators to silence the following kernel warnings:
>
>  usb_phy_generic usbphynop1: dummy supplies not allowed for exclusive requests (id=vbus)
>  usb_phy_generic usbphynop2: dummy supplies not allowed for exclusive requests (id=vbus)
>
>Because generic USB PHY driver requires exclusive vbus regulators since
>commit 75fd6485ccce ("usb: phy: generic: Get the vbus supply").
>
>Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>

Reviewed-by: Peng Fan <peng.fan@nxp.com>

