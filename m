Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 246AAC28B30
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 13:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7o82yK2no5e9IIfpvBeFmplLaTLozf2ltOCPe6wi35Y=; b=k9nKHgER/PLt/ajGzOycofbJ50
	TV0zJKfubvwUAnWt5sf5/qDcp83ueTFq9UQBQ61Z7nMzz8B10q+bRJHjusWe6xx28TY4/WThATIHi
	DLyPAF4IkifqG27SamysrAZSgUFpHobkJphivSxAGTBFKc2blpwEEOLNa+FYBCS41D0zlMJQTmjjd
	abJSpbTpRsmsFdhJya7xJsmG31K+TYhpU/Ox3FF1hPtQSNTnx4Xcg86NlKhLWEDZgXzjOQUc6lrGS
	HRj4rwzrpxGnoCLnUglpBlS4kYQNCmWmhabHj7Iy92FCR/03syxSoctaeKuCOx29PGCLA4vaFv5am
	nxDv6xog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuAb6-00000002kcV-1ZvV;
	Mon, 17 Mar 2025 13:33:40 +0000
Received: from mail-db5eur02on2062b.outbound.protection.outlook.com ([2a01:111:f403:2608::62b] helo=EUR02-DB5-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuAZP-00000002k98-2QzS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 13:31:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RtkyiIQU01rI6mTRBqKi3a9eTJaTvslJxAkKaM0fPrUpMG0Z+SHu5gb87Tzt/IVaHQ1wSSelGC+YHgbUEvTswGhb+hLVv0snC4D2exkf5k/PL6nNOmoTovsLnVYCZcxW5FtVQE+vCS9HeIb/JNcBQXrJpK/UtCvUao3i+rYc9QQjfaA21CFogC+JA0L7TxA1TJuKsVmmHMMdJbglcpnrH0JXjJ/I6au0CkYO/yLw3aoik2us73UDKLqPsqmfq6W0DS7eziy+cdivyLCiPRpkB2LZx+vEnllWJanv2Bk3nxAdsAJa+wbEJy92LuKUPj7QSmuUOOGLGKJRSstvOkTg7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7o82yK2no5e9IIfpvBeFmplLaTLozf2ltOCPe6wi35Y=;
 b=RdINqKdaVKJHhQfNCdORJOryowzqJa95ADl2/3xdNBISNQvXzXlDTah1iKexDNYqibre33ipwIKlkj48MKsaQsNt0xLb+WVqIBePzcFucUc8jxd9IW5fsvDPKe92nAc5PhVCLByVZVKfEvEf/D0mq3RXC65XBwSgNdM+S/nFGUYIRVSbxcZtz+kJC7S8K+IjtjP0Megl4rRGJrYbECHemKaktVMf3zpMDCVR+XVfT2QdCNjj3QvdKmwdM42izbUmZflnIL/9Pdp0eqz80g6q0Zh60mDgj74m9492RbaTxE5ps0JXdluyAkhsFdQC9zbyKsQNkV+SSW2qwB5uGxonxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7o82yK2no5e9IIfpvBeFmplLaTLozf2ltOCPe6wi35Y=;
 b=k1W/mVqUSk4ZQ+ntMheJjForsJ+EiwC/XJvL0KddtaG/lWO8xrKlbBlPJgKok+IAOSOgfFnQlM8nDg9lgN8w9WBxGWZAPD236+hMMQ7Hx1l6PXKsXaaTHxEm20RrbklAHKVEdRCkKj2lgEg5zN4rC7laTNqemfP1rb4YBfMZ0Sa7zElVJK5zvokzS7wIs0e8zviU/hb9vMvQz6h8YNrXO2QId1WoGS8IsF/E/1pbo0UNTjni1UMC894e2lfCj+XZ6zRRqS51e4WrIDi3gYL+Qlar+ag6Z7QlrCYmMgRtyor5Bj32Mx5lp4fd1TMBpZiqNo1TIe9i8I8UAg2M+CJppw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by GV1PR04MB9513.eurprd04.prod.outlook.com (2603:10a6:150:1e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 13:31:49 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6%5]) with mapi id 15.20.8534.031; Mon, 17 Mar 2025
 13:31:49 +0000
From: Daniel Baluta <daniel.baluta@nxp.com>
To: shawnguo@kernel.org,
	robh@kernel.org
Cc: s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	frank.li@nxp.com,
	aisheng.dong@nxp.com,
	daniel.baluta@gmail.com,
	laurentiu.mihalcea@nxp.com,
	shengjiu.wang@nxp.com,
	iuliana.prodan@nxp.com,
	a.fatoum@pengutronix.de,
	mathieu.poirier@linaro.org,
	linux-remoteproc@vger.kernel.org,
	Daniel Baluta <daniel.baluta@nxp.com>
Subject: [PATCH v5 0/5] Configure imx8mp dsp node for rproc usage
Date: Mon, 17 Mar 2025 15:33:01 +0200
Message-ID: <20250317133306.2003909-1-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PAZP264CA0254.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:239::20) To AS8PR04MB8247.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f2::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|GV1PR04MB9513:EE_
X-MS-Office365-Filtering-Correlation-Id: dd1db609-7be0-4976-44d2-08dd65581219
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1PG9U86Z5XYUn7WAGvKBlXtnIMFn9lTaPs0xC+T7Yzir7HzSTRX5/gSi+Vfb?=
 =?us-ascii?Q?HyM+zoMxuMb0M/auSHZyZ1nPeG6ykd/a4LauKvkdUeMnYhxm4luEl8b8741y?=
 =?us-ascii?Q?E/KTbhtmm6iLJ8RR0AzEgSixPClYLz5eoW/ooE9YsgKGFcPVJT8PXAPH/8sj?=
 =?us-ascii?Q?lni4AG0eEBDwe8ftfuxjHucJLhTMqiOoFFaETiScw7g5Pd4h/F5+1V79xH+S?=
 =?us-ascii?Q?sDlMygPpD/o4XhYPooF0Sx/PUealzvo68KTw1yQVMpThZHCHw/NPKzCPPV3v?=
 =?us-ascii?Q?TcX8sa+mMPI8TwxvCzfQ1ov8cPZbCjkiHbTFs3uK6GuUEz5Now4YsANOc/qY?=
 =?us-ascii?Q?qSWhfOZ0WRcrGGAksTf7G5zU3U4K9NxP1/43v/4RsBF98aMPIVjF0DcV5ffD?=
 =?us-ascii?Q?d2WwT+7MoNawxcjDG3q27iZOYy3LjaKjpeV+hQBGa2P8a29EksAK9J86vXLo?=
 =?us-ascii?Q?faNriHuzprPws+o4AyANzG52Nv04C46EQkvsB3GwRJ8//wojBu7/Jf4b57fm?=
 =?us-ascii?Q?nShgfIuldP0ecuKuMupQz6sFqgBLr/yqN3wST6fow82yqWusZA47sa4TCGFZ?=
 =?us-ascii?Q?nIdsXNG6lJKuVnvu59/4PdCJ2gz40MfGKgDKtYYhv8aAC8v84zgwqUllHgki?=
 =?us-ascii?Q?Fw65lSDvIgtu5yY0804wZSQWSQKCD6l62gtx0JR08eQGSr/05PFpt6akUqmk?=
 =?us-ascii?Q?Lm3+7ZgQVM7cGQvqcaCqW0nGqV0Y+NsafXUabeYWW0jaNr6Ec3aguB3NBrMC?=
 =?us-ascii?Q?z4PyeZgA+q2O7BoZdZAnhDZFGpwVaDjGpJFwY26i8H8U/TyMXZW4Btql1zDQ?=
 =?us-ascii?Q?UKqAieriQDN4JfOSBRzNOiQz6Dttth3N+HIj0G5jLnTb8t35j3FltQES1vw6?=
 =?us-ascii?Q?7f+XaWmdV7x+0vnV4x4uyqRJX7Zh093SuNUjFcEWPClSCy4uCmscUWGYlYN9?=
 =?us-ascii?Q?qU+Uxe+VAtJxfQ2UrXQixKFlnd3hK9+Cc9NsM2L4EIDuGDqgoyLrpvUFUr98?=
 =?us-ascii?Q?I8V4+WYkxlT77XtSiqPQlW56EJv6l/OQ/7PulzHC5rWN4ycXXfu8obiNtD/2?=
 =?us-ascii?Q?3Mp6OjeK3sy7m0b+7dQPqdgD6hdtrmRQujeCNv8aItw2Wh4lzGNR8EmwLpmR?=
 =?us-ascii?Q?u71MxDKCEGfkzEXttQRaHlRhQwiSWBeFUjUxWY7ms4C6xsP47i+5Rf/rPPoy?=
 =?us-ascii?Q?rfOsMS2A/QjDznblLol0zWPy15tuY++WfCoXCKX2xaWhW0D1mR7gXG/FXQel?=
 =?us-ascii?Q?hH6GjaOvmn8p5BGC2mQJ1vT30oSUyVGKdRnjAdujA2d8oSHSbN/q59kTUNG+?=
 =?us-ascii?Q?eB5mpOJ9Lw2sez2JfMbDawCuKrjCHEchjeg/FOt65qN1H8dSEbwTovngjF+E?=
 =?us-ascii?Q?fDAJgfx8TgNllhUn6YBQCOnSlhtuEc7ve7QR6FT7Wl06yfSDOhGWNZ5B7QFB?=
 =?us-ascii?Q?9T4VlFSyblA3/gTO4VTL/3tFvWZEjMzr?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mDWmvq4DR5hWInSd/O41E1PRn31H0gimC8XwPbUZ9XUG411HXD0y0jKIpII8?=
 =?us-ascii?Q?4kdL5EnpROkKg31EL2j7gvsjYLWt0DEpaAvv8ztnLQzMNDGWRowx7gqjKGTv?=
 =?us-ascii?Q?prIkYfM+Yk14mF21pn7JELXORGDk4Ra5+IElikl3CHWPQAN2821C93qTjMCZ?=
 =?us-ascii?Q?U61r9MGhS1RhNX1n3CNc0gkK3ZaEYBkk8m6hACcK/+uV/Sy2po7XhEBAVN1E?=
 =?us-ascii?Q?ReHWKIwo9sXL1Mjsar4CqfiwjiY/aF/BEiUAys6LwhA50bAq4+LN64qn3B2V?=
 =?us-ascii?Q?TwP6beHVKFjHJ9+dfp4QTTiQXdmmHezNZkasfrA5FYfGiJ9oL3Qd729tOECB?=
 =?us-ascii?Q?on/qx8mAjpRg+2pq6+qx4iugjh+zOpafY+JwTXppZ/sI2MiA61hXhWJJGJEH?=
 =?us-ascii?Q?XOJVDqlUcmhSoheXqkLo7XURyTl6/lpN5USNGCfReAj/AMuxH5NYKlYsZ/8d?=
 =?us-ascii?Q?uTXUxNiPhByG1XGPRq/PtnyJkZ3Y4fd0wz7SiyemEEpFS615VNeeDKYuafsQ?=
 =?us-ascii?Q?Obdxyybua4Arst3bnm6umiBLQQagJS3+df8laDFJPlI9tPWcpdm+htbNnioM?=
 =?us-ascii?Q?HknB0pwRrVyciO6VTjaF3lPo6ilN4890YkNheX2Iw0HiVy1SoSUVddkX7ESu?=
 =?us-ascii?Q?cJdrKkrArxf1CHYe6mHebInIYdzZAGks4J7mMlr9YzjmeUpUQI4qH4YmtBqP?=
 =?us-ascii?Q?zB+ck3uc9QR3b7WUZlMn3rrYzvbVCWwTS3fmZX8AyajL2IELBFsmfsfD/P9o?=
 =?us-ascii?Q?3li4y1cnXktQm2zPInHMwxzR4I0PT+2qt4BuVJOlxN5jXuA144OLJFxUQuv2?=
 =?us-ascii?Q?kq53kUaff8AU16TC+Vr+hMTLKSEKRAWxXr4ov2Y+AMbx3WL+2Kkfyr+aJdDF?=
 =?us-ascii?Q?FraH7hMUTuVaIvBIleLGKjv5OGwdFcLH1ZEuQXtIDLzORvzHc4IbaFnP8HKI?=
 =?us-ascii?Q?TKkWUWMH5WDa2M+8HmHec3MHxhPeKlXZvLhYG8WrLqeUkGtDnKomyzqIa9Av?=
 =?us-ascii?Q?ts++geFuxu4bOhSvzm/59qNTx+BPY/ba/FJuaJycBDtxQYkAW+v1cdFvEDtr?=
 =?us-ascii?Q?HaHxbwH0gAQeAIJHMjJWTBm+EhlsF2es3i4tF7m0fCbouwmBrWiUsNWrOjl6?=
 =?us-ascii?Q?GkSaOcHXIAG/YbmFMS8vXngcEHn5O+CYa5W/nr9Ktz5Y4of1zaOZGck36S1I?=
 =?us-ascii?Q?VWBVr0EkvYN5QIht7TPBQ/xd24v1czBfl782NMHLG+DlQNhIR6fq9kpyOomO?=
 =?us-ascii?Q?WkFralybLTwIVlpDczNsqQZFvKfVCHRk/GD3yYd8O01qDdem+BOhMaQo8H0H?=
 =?us-ascii?Q?koqMWlIxKsMqHAqv1UWZN8aQP8kUcHXylUi395Pmglb3mHWXkNsO529Q1WS6?=
 =?us-ascii?Q?FBSEbycKsGivOS1bWDbx9u6lLleP7ESA7hQnUEx2QOEuRmMvNpPlaUX3oPmx?=
 =?us-ascii?Q?U50PAh7A5xX+5UdJickzn8/jsUknYEzkBIXQESH2+MpCEPLv4a694fhbAlkA?=
 =?us-ascii?Q?j8G0e4bRogwBxiGHeumzygdTR1TtV/lfAZKQ8Cvcgdq3riGGVdWhPA7kCoQH?=
 =?us-ascii?Q?DjOnwi79ESkVQNfDnMXQpFekskEnEEmPGnRZn4PC?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd1db609-7be0-4976-44d2-08dd65581219
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2025 13:31:49.4166
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bg2DTMuo9bLtHQX/I0IAKgbG9iisf1L/0SzBvzOGl7rumEaOvwVEODXv70A2QKY5CCd4tBIrU6qyuWT4CHaPAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9513
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_063155_620086_4E807134 
X-CRM114-Status: GOOD (  11.10  )
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

DSP found in i.MX8MP SOC can be used by multiple frameworks in order to
enable various applications:
        - rproc/rpmsg framework, used to load for example Zephyr samples
        - Sound Open Firmware, used to enable various audio processing
          pipelines.

Current dsp node was configured with SOF in mind but it doesn't work
well with imx8mp-evk dts. SOF controls audio IPs from firmware side
while imx8mp-evk.dts preffers to control audio IPs from Linux side.

So, configure 'dsp' node to be used with rproc scenario and later will
add a separate dts or an overlay to configure the node for SOF.

This patch series configures and enables dsp node to be used with rproc.

Changes since v4:
(https://lore.kernel.org/linux-arm-kernel/Z6zGLn3B6SVXhTV1@lizhi-Precision-Tower-5810/T/)
	- after comments received on v4, we implemented the run/stall
	  bits using reset controller API (changes merged ->
https://patchwork.kernel.org/project/linux-arm-kernel/cover/20250311085812.1296243-1-daniel.baluta@nxp.com/)
        - drop patches related to DSP run/stall/reset via syscon
	- picked up patch related to using run_stall via reset
	  controller API.

Daniel Baluta (5):
  arm64: dts: imx8mp: Use resets property
  arm64: dts: imx8mp: Add mu2 root clock
  arm64: dts: imx8mp: Configure dsp node for rproc usage
  arm64: dts: imx8mp: Add DSP clocks
  arm64: dts: Add dsp rproc related mem regions

 arch/arm64/boot/dts/freescale/imx8mp-evk.dts | 10 +++++++++
 arch/arm64/boot/dts/freescale/imx8mp.dtsi    | 22 +++++++++++++-------
 2 files changed, 25 insertions(+), 7 deletions(-)

-- 
2.43.0


