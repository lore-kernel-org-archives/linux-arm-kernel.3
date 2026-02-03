Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8B03E83066
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 08:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NiYJSAwCHQyP5hfAcuvdxIOeny/syGT6SCxxQ62MdNI=; b=RXS4crzIYyQqkDbkj+JWeyCSKw
	jwrE9PV78+K1/Vcg4Z9xIIgedPoPxuFRUhcYw2NBpb+/oBhI6R1M4ehgVuAEHULEo89z4COPJdpTS
	FNKOcOawREUBxniNhHyoyAhYcZkiiCxigL8U4Dy0ZIUjnbHX4RqIDIJWVGgNysQ5wp/kgmMmWGPw5
	+YN0vpH1UYzGp8aubScRsIONx5Bljw0viXA712Phc5IBXr5WaV05aJBxsfsPiFpQbFY/RG4AloihR
	L8S9grpiFhgsrf3TZSl32XeXhQwl/MyH29lUDOHJIPPyHP8lmEeOeN9lIQPZfJLACzortK+IBcjZT
	Up/MmlnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnBLQ-00000006Gmu-2Csz;
	Tue, 03 Feb 2026 08:01:08 +0000
Received: from mail-westeuropeazon11013045.outbound.protection.outlook.com ([52.101.72.45] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnBLN-00000006GkA-3uWw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 08:01:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VUZFWcvECH3nNHb1onKSPX8GI9AbzsWw8mXlCwGAWLdvE9+dLVjwlhp4GkZ1dAx6+Na+3uFpcIICiqQ1heRPSdMWOoBB7j0s9aVNHYgODFG/lljJId3KvQAhjmyDGmXCLwdfR62hRzhDCd35e3W+OUgMibcEuGzhHo4USQQCUxycXO0gMX9BH6eYBdBcdxkA6+ujJTAs2eCCBKujNc1Pa2J/OeeT5I89WXlpdwVZKe27p8C9BImd/34SMJjbV5+LBGPo30XmOziOw6A81Eyd75zN2QteU7H+QWeXNwG2LDKT2KMSaIFU87rdJF8oyM7x6v0bmv3AWhrnNVZXVmELNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NiYJSAwCHQyP5hfAcuvdxIOeny/syGT6SCxxQ62MdNI=;
 b=MlRdyZ1npP7qleyvL/28m8sdXol3+59XZEd2aLMemBgGkVa0MsiviDUx9qzVdhvR6uDwd7m4B2gb9aZkqKquWhG9ihCfjnbzuEcDmtEN5nZ0FUjZULyoL4eTbPxsk3+blGJv+iG38hlzVt2PloGhxqrr3WpaC+0rP+cMdqHE38ouyfceYn7wDBVsc8xTaum7w6zmt6sm2eBy9PRCtCp9KW/B+wbr5jH0SHp4YYCKogUQM6gJGoVYzy7WhsrlMTxKwSlalbP4/aq7FFXZIhQVpC1gFh9UvqSvbo2qgov/IspXo1HA8XNFzW84svsd6W8VFuVutVlPep5XoIzQJJRiDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NiYJSAwCHQyP5hfAcuvdxIOeny/syGT6SCxxQ62MdNI=;
 b=ezCh+crWEnPsEsTmgbE/Tonmpn22avSCxw7EtSIhM5X9O5x5p4DxRZld539yH09YxzGb2l2yAPMH/ojztGEM2qiQGS0LDTU1l+XsR7aQ8S7oSuW5OSLQ+aNwa0jHXCSAm/psSWMTZGcpuYVvsBpjJ/JV1W1eZ7kTK1N6QwRPXX798y8jMGe16jcR2sjrLgBjZbT8851yCawKKvvUFqXxpPlIu6aIPH97gPm450V0KstEbM/XMeEsQZGguluo+422dHr83VfHxKM8Plu6YrrXubXcXknFBtArAHRGbxvT4ErJUX04zTZsmKa6ciAf4jz/4lnoiqrMuK2sh8cigMK0Zg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GV2PR04MB12102.eurprd04.prod.outlook.com (2603:10a6:150:30c::7)
 by VI1PR04MB6990.eurprd04.prod.outlook.com (2603:10a6:803:138::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 08:01:03 +0000
Received: from GV2PR04MB12102.eurprd04.prod.outlook.com
 ([fe80::ba38:9cef:8457:c944]) by GV2PR04MB12102.eurprd04.prod.outlook.com
 ([fe80::ba38:9cef:8457:c944%4]) with mapi id 15.20.9564.016; Tue, 3 Feb 2026
 08:01:03 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: Frank.Li@nxp.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	shawnguo@kernel.org,
	daniel.baluta@nxp.com,
	dario.binacchi@amarulasolutions.com,
	alexander.stein@ew.tq-group.com,
	Markus.Niebel@tq-group.com,
	matthias.schiffer@tq-group.com,
	y.moog@phytec.de,
	josua@solid-run.com,
	francesco.dolcini@toradex.com,
	primoz.fiser@norik.com
Cc: imx@lists.linux.dev,
	kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH V5 4/5] arm64: dts: imx93: Add imx93w.dtsi for i.MX93 Wireless SiP
Date: Tue,  3 Feb 2026 16:01:36 +0800
Message-Id: <20260203080137.1492376-5-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260203080137.1492376-1-sherry.sun@nxp.com>
References: <20260203080137.1492376-1-sherry.sun@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0014.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::26)
 To GV2PR04MB12102.eurprd04.prod.outlook.com (2603:10a6:150:30c::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB12102:EE_|VI1PR04MB6990:EE_
X-MS-Office365-Filtering-Correlation-Id: 627cff4c-f290-417a-6f18-08de62fa60a6
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|376014|7416014|52116014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?f03mjoEVljngjydV2XUkvRylPbwdT67qM/IU9kU2vnlXpWn5WTfDkOuWc5o8?=
 =?us-ascii?Q?QLJZHuD0kz1HOUyCn7EdTf14urgXBWoWdaJCPHIsG1zlxW2NBQmEr0yUf4sk?=
 =?us-ascii?Q?NWtcmv8q+dsu1FU9Lupp+MxtPhOi0Te2+HgVZxebE6+OBVwdnyVu7TBYbfsL?=
 =?us-ascii?Q?nZGA7TAUe+3ONqK2RkG/svUpT9Rq11C+OLi0tcrzAYWkHfhLJNo6jhPsy2G7?=
 =?us-ascii?Q?Ncisij5tpXVLAvWcMjdwKYykVOq580Hdp/EMT/wujpl2oq2G5vo0UcGggvoT?=
 =?us-ascii?Q?cN1JC6jXu9nHQgeRpXRsndUZjGUUKHC4HPFP6VUDiEFbDce5IWvp0dHLshwS?=
 =?us-ascii?Q?euvw5s8xezDDSsRz+pPofkjYqDLOMEfbiaJHqebCdhUJ2jPnmqifSPw8VOWF?=
 =?us-ascii?Q?E9DRVDVSIythElfCsPEg5i71THZD79iqW/GDWxHFQq5ABb+Rx2LouPZ8gW4v?=
 =?us-ascii?Q?2uZb+cPp8HRkFYry2FDUGW0PoojMl8WMhS8wjdzv+dz+h7+OnU6kMSFgBfBl?=
 =?us-ascii?Q?ynui5KvKsWv6M7O4Ar76+8SbLyy0XiqRAS9gIYvHGm8lg00gTT0nwKpOL/vD?=
 =?us-ascii?Q?AFRrwiFzLaxUMuzp8DLn30e0bw6WfEjnzvUSACXySakncwhepTQeyQatVRnj?=
 =?us-ascii?Q?p45g3JqxN3iujtholIsr0G3Im0X+biHo58CeYEbg8QVpfoFdAJO9m5xCdID7?=
 =?us-ascii?Q?SotNxTxfBx5FGhyOUEsa0xs/Wf2eq2BElNY/phfm4Ok9jmAo0HbbLr/5P+ue?=
 =?us-ascii?Q?a/zB9yGh1tbIyaGAM2u4/9kCGoARKsd+VtP/8VVijvcL3WJcnHFgghTJQOKw?=
 =?us-ascii?Q?W4Hus9fQwZVsiVZlNiSHgV5uK17TLPJJexXzC6vYPylNi1/a+oY2ky6v1Xay?=
 =?us-ascii?Q?G06Ejb5hPMBDKSbwaPvebe3kUKEaA+5E063TTX2Xf/S/3naK8qZc6t5DZLJt?=
 =?us-ascii?Q?pyPQXNeZC7oGOop/BTijuTl37e8f15EE6P587dy9xP2f0jVYW1QkmH12SMWe?=
 =?us-ascii?Q?qvDgf95EVNeUQa5rnC7/4Zeqz728y12NmVuZGifMpTkSR2LqzS4fJyLpck9M?=
 =?us-ascii?Q?wfTX9bVGJL1SzobTDnGUClb6qK4MQvt0Wootu9mRWFBg6IKWQwa5XnNlf2Ch?=
 =?us-ascii?Q?i9ga8TYtn93PfqUTjVQ7ZZJKwVO7zZEnUBlQDt9+LC3dFvZXAbXy1mqb5I4r?=
 =?us-ascii?Q?QM3SMXfJ7lp/AtZT43R50Ni18RkGLW8LHuaTt3cK01o70AB2JC04xfeNluky?=
 =?us-ascii?Q?I0luc17HwhoF/lkKEEDuDS7bdDtbvsWDG6w11kLi8WncqaHkG31j9KAdfFS9?=
 =?us-ascii?Q?5qMvup4QezmC0aztVQt4g4A4C4AvkqPSxrZgcurkADhhc7bok8x9lN2DhtZ9?=
 =?us-ascii?Q?TMh+O/v7AdpSnh6dHYpHPW142aOFqTxi+YLeo0i8WYXtZw6tJlHjd0Xpd0iy?=
 =?us-ascii?Q?NMuQKoWb/PQ3vHNiiPmgamFnPz85aKtq49f+vFVZFx1WJv+7BVG3iYfm3abr?=
 =?us-ascii?Q?Y1+lMmYbM9OtBQvQ8RggJdoTNicmMlR/sYhiD+o0DPBZkaX0KqbkMac9GwV7?=
 =?us-ascii?Q?VwM2Bv6n2KqWA7EkMr6r7zvVc8RUTKFAizX2OU5Kg2z06p4untKCxdhpxvhP?=
 =?us-ascii?Q?HQSGhdA7oV8Nxv7tr71aUg9fqo7+sFTDi0aixAlXGtzB?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB12102.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(7416014)(52116014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4FKAtwVcjjUapyKVNiIsxdzDzuUdq5QynAo7UDZwIklBGyxYF5jXovJHhI88?=
 =?us-ascii?Q?Ovr43Gbc9gSOyEkG0JlPNH7kNoARaHdAZdK4E52jekIfOmSAvDNfV4hiWdS/?=
 =?us-ascii?Q?BtDtqJ3+6TAWbdCbVuEEhxNBlWtMGboW5hdwa/4a3czebt7rvhda+ERyBml2?=
 =?us-ascii?Q?0TmodyJLCPib6c2o9wal35JgKEOJIRV9h5cZzfxs6KcyB82IfjSbgM1eAZ4y?=
 =?us-ascii?Q?TVJjIsTyvI7vl7W0D6mBX6K7bqG+QIpv37lQnG844vaVKH+H8rHyGPlBovXm?=
 =?us-ascii?Q?x7D6yUVI7DNPflAjS14fua3Xi343sma4J72JKGCY5lDFnFnN2P0MiVhvx242?=
 =?us-ascii?Q?/Dvc7OJwnj0ruioX+RjGPKfqGG2+cqS8THVmoTNRbpLw6wHz4+cs3zD4SqzV?=
 =?us-ascii?Q?9QhnI/ytyyzBm1w8mA9+Bm83qOLpaOHRqya39aBDjPGO4MBJFnkfhW03y0v3?=
 =?us-ascii?Q?1xU+1gWGPCJ6uSIGFgUfrPGL77oYLCuO0YqiTqIaaOPDRIz1ffTXlvrleeXm?=
 =?us-ascii?Q?dBQDj2NkiEq057N8TuYPDfugs9TtuxgsazVmhixgNs9zJQPuprzQwMa9w8bo?=
 =?us-ascii?Q?dikgVdCEjzfwOpIhgipZ38HVp9V9bHHm4AdvGZU+cDYhJomWDtnT6i0VjSa7?=
 =?us-ascii?Q?ljPDzJyeVOdgD8WJl3zCfgIExaHli8mCWec9A8kWlNNA71vFolrBpkBL/ZgS?=
 =?us-ascii?Q?Fs4/4g15kYuVaTjOdR5Qb6X1qVEj0958+kXaKb3Ic9U5Qu6D7GO+Je4ny9+1?=
 =?us-ascii?Q?9AurCi9nhf1Sa62SOhkiG4RTcqfJzbkxsK3MLJzd4eOwbdtSf7L3fL9YLlTQ?=
 =?us-ascii?Q?SQwo9+FGYESx8T3W7DhPjUlrzY6zoZTjDYhgnxRpeTn8EY7kDAyk4ihRyCpI?=
 =?us-ascii?Q?dBWrj1beh2umvOmI6mMiZJtfsCEKB7LrGl2wiZLNYru8Gq4c12zCyo8/4H2C?=
 =?us-ascii?Q?UvBf7p776Lf58l6/0ERbbLBNOdJ7mlEXCmPv25onPKyDw9MIth00y1B3xYYo?=
 =?us-ascii?Q?fdJZn/hygeW+L+uVSrbOeRcT+/hhkltoQTjI0G8DPcHtIA3kbVDfqx1qNQl7?=
 =?us-ascii?Q?xvpDGyL5PnTWGPqn3LoIEtwGvZTHffF5mJ23fIF2m3/5FsqDnno4U+5K8C8N?=
 =?us-ascii?Q?kTt3SP2OBtn06GVNp30TCrlNEC2TRs82iHel89ciNm1VygXBNMEyHC70hL9z?=
 =?us-ascii?Q?NxbwW4ezQs0TjQXA/A0u3A3gNjtn4AAD83e6xP5yHWDKrGbHfRb7mvHtOcy0?=
 =?us-ascii?Q?5smZ0NsGqXBNvtYK3J0aR6gOrBCMwsm8rtOwpubAImwyfrjkFRyZoadscPp+?=
 =?us-ascii?Q?TL5TxLj+c0h2lf/HaNlwy2sAXKozBtXr4m0bUUAYLG+2n5N7PuorR/1ecX3j?=
 =?us-ascii?Q?bMnsnnhVn6KUmof6mEbK0dRi6dXQeABIB33S0LsA63B35xQJ3TghI/EOlYmp?=
 =?us-ascii?Q?pz4ijo7JX6hxpUH9ybgkiNFgEaRytPBr0lWhki7DajkfsMeP0tuVVbCTAtRs?=
 =?us-ascii?Q?csSfgWgqo31pzlgwt2REAdmdlyICU1WYihU6Mqz2JEGUIW3VOfXKx9VJm2qx?=
 =?us-ascii?Q?cMqevyySfSSrRu9fH3x+vTiRRcQiWJy01snGJDgWqbXcA0I5fr1F+aNKQ4XQ?=
 =?us-ascii?Q?1wJEwO+wYukLMbuKL3o+ZesGfkujILOBBNYiUeHovDUKEsQVOiZyF+EoR+BT?=
 =?us-ascii?Q?4s1Kxx3Z9jtszx3so7HaYP0Og/lqkEU8Vn6Pk5hzffudmMDhxY/dQhMX134r?=
 =?us-ascii?Q?J1Qv1DoYfg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 627cff4c-f290-417a-6f18-08de62fa60a6
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB12102.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 08:01:03.7782
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W0ghZx5/1KjlhI7UTrFW9r3qVnhPf+hj3RHyxn0EjQw7KRcFp4p64cAK99QnRu1aiDLuNKIDvwz1lXJKeNRQ+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6990
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_000105_973364_31E63565 
X-CRM114-Status: GOOD (  15.45  )
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

Introduce imx93w.dtsi to describe the new NXP i.MX93 Wireless SiP, which
integrates the i.MX93 application processor with the NXP IW610 WLCSP
(Wi-Fi + Bluetooth LE + 802.15.4) connectivity device.

The new imx93w.dtsi is based on imx93.dtsi and adds the pieces required
for the internal connection between i.MX93 and IW610 inside the SiP.
This includes USDHC3 which is used as the host interface to the IW610
and the required GPIO settings(e.g. WL_RST, WL_REG_ON, etc.).

These nodes reflect internal SiP wiring and are not board specific, so
they are placed in a dedicated imx93w.dtsi file that can be reused by
multiple boards adopting the i.MX93 Wireless SiP.

Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx93w.dtsi | 110 ++++++++++++++++++++++
 1 file changed, 110 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93w.dtsi

diff --git a/arch/arm64/boot/dts/freescale/imx93w.dtsi b/arch/arm64/boot/dts/freescale/imx93w.dtsi
new file mode 100644
index 000000000000..95fb025c3949
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx93w.dtsi
@@ -0,0 +1,110 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 NXP
+ */
+
+#include "imx93.dtsi"
+
+/ {
+	aliases {
+		mmc2 = &usdhc3;
+	};
+
+	reg_usdhc3_vmmc: regulator-usdhc3 {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_reg_usdhc3_vmmc>;
+		regulator-name = "WLAN_EN";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&gpio2 29 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	usdhc3_pwrseq: usdhc3_pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_usdhc3_pwrseq>;
+		reset-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&usdhc3 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
+	pinctrl-0 = <&pinctrl_usdhc3>;
+	pinctrl-1 = <&pinctrl_usdhc3_100mhz>;
+	pinctrl-2 = <&pinctrl_usdhc3_200mhz>;
+	pinctrl-3 = <&pinctrl_usdhc3_sleep>;
+	mmc-pwrseq = <&usdhc3_pwrseq>;
+	vmmc-supply = <&reg_usdhc3_vmmc>;
+	bus-width = <4>;
+	keep-power-in-suspend;
+	non-removable;
+	wakeup-source;
+	status = "okay";
+};
+
+&iomuxc {
+	pinctrl_reg_usdhc3_vmmc: regusdhc3vmmcgrp {
+		fsl,pins = <
+			/*
+			 * Enable open drain and internal pull-up to allow the IW610 JTAG
+			 * connector to control the PDn status.
+			 */
+			MX93_PAD_GPIO_IO29__GPIO2_IO29			0xb9e
+		>;
+	};
+
+	/* need to config the SION for data and cmd pad, refer to ERR052021 */
+	pinctrl_usdhc3: usdhc3grp {
+		fsl,pins = <
+			MX93_PAD_SD3_CLK__USDHC3_CLK		0x1582
+			MX93_PAD_SD3_CMD__USDHC3_CMD		0x40001382
+			MX93_PAD_SD3_DATA0__USDHC3_DATA0	0x40001382
+			MX93_PAD_SD3_DATA1__USDHC3_DATA1	0x40001382
+			MX93_PAD_SD3_DATA2__USDHC3_DATA2	0x40001382
+			MX93_PAD_SD3_DATA3__USDHC3_DATA3	0x40001382
+		>;
+	};
+
+	/* need to config the SION for data and cmd pad, refer to ERR052021 */
+	pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {
+		fsl,pins = <
+			MX93_PAD_SD3_CLK__USDHC3_CLK		0x158e
+			MX93_PAD_SD3_CMD__USDHC3_CMD		0x4000138e
+			MX93_PAD_SD3_DATA0__USDHC3_DATA0	0x4000138e
+			MX93_PAD_SD3_DATA1__USDHC3_DATA1	0x4000138e
+			MX93_PAD_SD3_DATA2__USDHC3_DATA2	0x4000138e
+			MX93_PAD_SD3_DATA3__USDHC3_DATA3	0x4000138e
+		>;
+	};
+
+	/* need to config the SION for data and cmd pad, refer to ERR052021 */
+	pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
+		fsl,pins = <
+			MX93_PAD_SD3_CLK__USDHC3_CLK		0x15fe
+			MX93_PAD_SD3_CMD__USDHC3_CMD		0x400013fe
+			MX93_PAD_SD3_DATA0__USDHC3_DATA0	0x400013fe
+			MX93_PAD_SD3_DATA1__USDHC3_DATA1	0x400013fe
+			MX93_PAD_SD3_DATA2__USDHC3_DATA2	0x400013fe
+			MX93_PAD_SD3_DATA3__USDHC3_DATA3	0x400013fe
+		>;
+	};
+
+	pinctrl_usdhc3_sleep: usdhc3grpsleepgrp {
+		fsl,pins = <
+			MX93_PAD_SD3_CLK__GPIO3_IO20		0x31e
+			MX93_PAD_SD3_CMD__GPIO3_IO21		0x31e
+			MX93_PAD_SD3_DATA0__GPIO3_IO22		0x31e
+			MX93_PAD_SD3_DATA1__GPIO3_IO23		0x31e
+			MX93_PAD_SD3_DATA2__GPIO3_IO24		0x31e
+			MX93_PAD_SD3_DATA3__GPIO3_IO25		0x31e
+		>;
+	};
+
+	pinctrl_usdhc3_pwrseq: usdhc3pwrseqgrp {
+		fsl,pins = <
+			MX93_PAD_PDM_BIT_STREAM1__GPIO1_IO10		0x39e
+		>;
+	};
+};
-- 
2.37.1


