Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD66FCAC597
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 07:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lfV8/rgw3390d8ayNhzsgQGfW2Lt+EuCyzNvOArzk5o=; b=ulvRThfNoSiAHZ/aZ2wC0j8dso
	FTgtJva+lwT/KQMEnXbo0VmKOBeviimdAW20wGi75QF5SP3o4O082HjDeGJIXCK9gz0QnvZl/4sAm
	KfGXofjo8/N/RYPylNWZ4afaqlP6Ec//jcX7DPghQVaB6LzrLanjJru5oTr6o/dFC3g51CCCLcSu7
	qU/kCl8Yt+ZUniYeqwn3dLtNFOOmXo4u1D4k5r0Mw/1pd45lB9Y76fQOiKLUlRpZGp3Y5zlcSSoTm
	5l7L/j8gXwOMy0m4ZLAMQYsiGnqdvLnLnxifYu7uVagtQH8gW5CNKAX4/WMt+wsIG+4s6ZW6Q4QdU
	6SHMltdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz8fc-0000000GUvN-04bp;
	Thu, 18 Sep 2025 07:03:08 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz8fY-0000000GUuk-31Hw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 07:03:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ql8VNB5VQJaCSROOyVP1+VM+p5Zib47dUHVGjNxeZz6X0dr/zDqkuWrnIHvey9TKl9pLdrhXtYj72RY5QklMOc2p1P2IG8UzKkRQFM7nDYtXxhWDIdpj7687s7lS6CyGN5WIE79pukwtOkLgl+M4YhlenqakK6f7vjk7K+i143FnmMzk3CJuHKfMWJEKldsndwaT+QTKfLqJ3dWeWmJr+rBys2tqJvN4c+SqRjddunPtS6r7gWpMw6E6ZxpsS76qnCjZdwinr/ygmX4DSgvOJJHwFvi32OmHpaqS9LFIiD4pOZ+3nbSWV4vaTPD3e3csgzLEZrMAbtxIZOPeZTyILQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lfV8/rgw3390d8ayNhzsgQGfW2Lt+EuCyzNvOArzk5o=;
 b=BEbzWGVh0OjgrM6bu08jq1GPGJtPjOg07OJ9eQ5ywab5hKA9nRk3rpNnOxsmPJw7JnYTVPPmzB8na4b5xrShW4EYH/Fptw0OUhuSE8XW8XZG0Wae+6Y8Dbqmy08HnZAcW2KreonZsEm+qdtCiCKHD+zA9gDtisfgFgoKKq9gM3KBN70ox731AUm4ZDL2Upt270Cl+H3tNi5bzzfQMT3U2lxY3K7Eu6jrJQLeSkGWjkVK5Ca924FLjpMiik1GCFFrpFASuMO39lIK9dgBzP6Xudf/gnTKQ+x4EXNWpvM5dw2LM7Gv67E8AQGUOPKtUpcPiugjptPOeG6EebPDH3QNig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lfV8/rgw3390d8ayNhzsgQGfW2Lt+EuCyzNvOArzk5o=;
 b=RmzmphDNKkR0J9l6ecLQKLz04RnukDIBdi1osFQgW3fCkx7knZMsKeqwr39cehoCGkFrCg1GRFzEb2W+wU7RTMQoJP+msUK3cc3HkJi/hSfouJg0SPFd1nbSVaTO6b2XfM/jGR/QwOt+Ii/K+t+VOGvK9hrnFj1Aqz6Pu7H/Se3lFOR9iKwnXKhM+OJQnmgW2eOKT4ybu5+s0mbUiclRtjdGQv4X/5zPegr8mDCDlhqTuyka6sGUgaCxZY3H+Mq0NnjIGVLV6gkRoEr104JjkPmDeObWrlSPCFfCTHEpgAueJAchCI9UlSn65OjBgcWdoQUhNwXsVx+yaw7Jg4FkIQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI2PR04MB11193.eurprd04.prod.outlook.com (2603:10a6:800:291::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Thu, 18 Sep
 2025 07:02:55 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 07:02:55 +0000
Date: Thu, 18 Sep 2025 16:14:26 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Rogerio Pimentel <rpimentel.silva@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, alexander.stein@ew.tq-group.com,
	dario.binacchi@amarulasolutions.com, marex@denx.de,
	Markus.Niebel@tq-group.com, y.moog@phytec.de,
	joao.goncalves@toradex.com, frieder.schrempf@kontron.de,
	josua@solid-run.com, francesco.dolcini@toradex.com,
	primoz.fiser@norik.com, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: add support for NXP i.MX8MP FRDM board
Message-ID: <20250918081426.GA23028@nxa18884-linux.ap.freescale.net>
References: <20250918014053.696710-1-rpimentel.silva@gmail.com>
 <20250918014053.696710-2-rpimentel.silva@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250918014053.696710-2-rpimentel.silva@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI2PR01CA0007.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::11) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|VI2PR04MB11193:EE_
X-MS-Office365-Filtering-Correlation-Id: d24a1019-3816-4238-d3dc-08ddf681640a
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|1800799024|7416014|52116014|376014|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?etr9qhnD5nerYIP53uOx5DTmHekbZyFIBXkzVHmofd18H4AvvDlS3KEP8A7c?=
 =?us-ascii?Q?IWuzpljokF11fovay4Jok7DAClRYPEKsxM4rjCS3L9cjxsSdZ8VqJV6R9C30?=
 =?us-ascii?Q?rLxA2+5Bt17lWIjl3R32SxR7x1CeqsRJfAvQrWP93ISvIysMJFy6vP+ZC86D?=
 =?us-ascii?Q?iFyL49twK8ltoN2zFCnq7DekQi1dC0IGJqDQY/L3Q6wcXF3lzyJuE30fm17u?=
 =?us-ascii?Q?LL706sYlPXROVknHR+tDu7DI8lym0Ek7t5AB8gC1q1p69SAP+VL+ShNcXiCf?=
 =?us-ascii?Q?hAXfIXygMKW2J0WAINJ1b5UR1H5Seqbd16YjmX4hXWr7KiNrybqwuMSAQbzj?=
 =?us-ascii?Q?fKXGf47Ad16gFEKc7JkTIjjVM6qJ+jERC7FNNITMrWuggHl2FLYDPEJyYW6w?=
 =?us-ascii?Q?VeFdRnPti1cpDe6nEy4yUmPYpSJZCqRu//9IqMp1yapmiTWlnUz9lVyBb8vK?=
 =?us-ascii?Q?SDx5k702LtusR3BjwTRBuHDCzIeDlIaPsnKQIBo7dn6iBjGIYfBw/0OGLzna?=
 =?us-ascii?Q?kKzQJ44VM69Ux7jWyowbpgM936kLBe0Vr5msapnQJNoN+rILe7u4gcLfbxri?=
 =?us-ascii?Q?Ca6iaW+9HG2wPcObRrfTgiREp/g3lx+Qs2cu4qqyNu0u1E+hsNc5CAg2Ly/p?=
 =?us-ascii?Q?E6nX8cWblYUXSBtGSE0WEIFYlstv9GxvRM7Y/GpcLW4iblUu5XQtRbgAYjTG?=
 =?us-ascii?Q?TxYEUtZ9Y3WMyUskAoCx1ov6Y88eyZS08heQ8KFAQbqF8vvCJULhkYNbImRV?=
 =?us-ascii?Q?m6vXsoDqMggZmSOSeYPWtrd+2UiVWXHcAp0QpP60ua+34VQfE4Endao+4Ftm?=
 =?us-ascii?Q?cH/RxtmvU5GF/nCoe84uc8GDnh/PVKv0Txp18p9gYaT9mXKNatp/Bwf30CYt?=
 =?us-ascii?Q?QiyB1I2+zCA2o/II11qLKyHWwsZ0qK/Is1Q1It92wp9mkm7rcdj13+wCOWKZ?=
 =?us-ascii?Q?amWDWnWlThdwdc1ei8kGnFUwcjIr8LRzh2SjsEtqanpAhWqRe1ZxqTyRNMwE?=
 =?us-ascii?Q?J4rFaAaSdCrt+ie4izg11lXgr+l1f0OwUqQvT4skgirzkq+o43mf+kMgWR4U?=
 =?us-ascii?Q?oa1slLv45CQ+W2js+r5keEn2Vbi6leCwK9fuXtp6BxOAkbAwS4k639VhgF9K?=
 =?us-ascii?Q?UdukkwhHnUZUpi8tEGJRPHQHAsKfE7vAns/QXd3dCmECUpjLSq42RAnonLlh?=
 =?us-ascii?Q?yieAQRjN+z0WIXbeEJw90aGN2x85wp+P4+9zHIsNmLxjSkWcDUzMp/bcmxUR?=
 =?us-ascii?Q?BJirLTdBSs+Ag3c0As5iWBva7Wj/tqw7c/bERM+zG9CNIlcY9oxaSc7l0/aj?=
 =?us-ascii?Q?X4m4xvaR9SfmsZTVXXXUD41g8JNzSTSeGrdB9vidUh9y8umOFjIDJrilVkOr?=
 =?us-ascii?Q?PHOhM2TG+DSrGfyNRofq6WwxbdOVGIAuqQrGZuwtW9R9eqYRYNz/fLIFZhqO?=
 =?us-ascii?Q?uxg++ekpp5zVZKn5Mi8jbCsSB5GqfpHNEnGuqJvd9PQWtwLKsdz3oBXx+Kfe?=
 =?us-ascii?Q?xGX96VYfHjLjTUk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(7416014)(52116014)(376014)(366016)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IVQzILYH1yuPFXPs1GF6Hl06PpKBJglqq75/WhLbSmra6egCFJlYjJiPpcq3?=
 =?us-ascii?Q?cHCZ97rrBTISc657TZC11IiCX/P5jHSS68WHjn9T3zCIph0zr/eKk5qDznKS?=
 =?us-ascii?Q?FU4HJr5uA0SWY3Ep0w4jvFqcsSPtTS5GaWWgUS7MEiiSjO7N2ip0Oo1JyXdM?=
 =?us-ascii?Q?ztLADxecDuaSXfbr2IDeIioyfWHZU3lwT4SGUJ75kYSPwfKKK34ZHx3MBPfu?=
 =?us-ascii?Q?qcRJo/UA9C9n7TeqbxWF2MLH61PdG/rlxFuIYbC67/mh03oAp7h3ADGavDM6?=
 =?us-ascii?Q?3X0WoQw/V4vJaaP1z/l1FvJs7oLpOFM5D0RNXLWxWrRKvuMeIJALgvTfvfSR?=
 =?us-ascii?Q?kMkycnnvTJ39yUUOcl3iDhXD649cJKUun0TNdXWxNRgmvSqttHp8abbj8r7n?=
 =?us-ascii?Q?+qjmCeQSgAq9cBwtNfMx/z7BsqZvlTgLvuECF+pLiFogr+FWY+cFcX4No+TQ?=
 =?us-ascii?Q?m1QSgr2yzMaohpMLRlEx3Dg0UJaMySRFbdlDE3k1l7Ikth7aifGrG9SkEF6d?=
 =?us-ascii?Q?2uOv6+eQov4/tnvFJA8sU2y9w8NNHLn6j9DK9RLXUeWEyxAU/QeJEyhPTmmD?=
 =?us-ascii?Q?NFvTv/rlm+kjnhP2aXiBpxg5dCHq4R9LVpfsMpokAAEbzCT6czxEoxPdx1fO?=
 =?us-ascii?Q?L2nUceERwzkvAINm82W8govh2a5u9KDrQWqf3qygsHzJspODoApx0iazh4Cq?=
 =?us-ascii?Q?3RgohUwmxDOP9p1EUpc2UWYTJSEev21ekkYxekYr4Kj2fq7d7LkEQgC/nfZj?=
 =?us-ascii?Q?9TGhCbJK4homFPoXDjYWtag5gQNl1+GJXsY7/QxEpLICFZX7lLJHgCZ99SS/?=
 =?us-ascii?Q?k75Hx8wyuRvFX4pcW20yOzalqFPFgmOQU92rj+fFa3ssPC/5WmXHTFmTTR0m?=
 =?us-ascii?Q?jf0veFpd7o6J4cNO4YjsIkQvTr5r93N3X6O0YDDRUNZKXN2SCBWc363gTzJ1?=
 =?us-ascii?Q?/TW7r/PYEd5JUupUbkRrss/8eP+v0AUaiIoQnYfKNT6wHDdVgqat6QLcrAwR?=
 =?us-ascii?Q?Y47DNS+GIfv3BB8pyT0CgfjAZ0E9Z9JaLSwXk+mJIPN8Ot2gPY68n6tcQih7?=
 =?us-ascii?Q?UvnzlCrCGDVjjDwSlTUYXEKLQhPnOrg8YkyA+HCN8E8FZ3pa80BOcrW5J/56?=
 =?us-ascii?Q?1s5cvQ8XKezUCrxDdb1MG+aNFfLik0DhWQwkXZlHHEAzObpBOIK37bbmYU1V?=
 =?us-ascii?Q?pS40iC25x1mVv93MmiPPhEVqWbBUjUmyDoDeKC829CeEI9zKYK30oiHe4wUw?=
 =?us-ascii?Q?qKeKOBQtWKv7JxHCIHyjmRb2hAJH/8AQuoH52MwmtaIXrqNv3Gd92L0SGWnJ?=
 =?us-ascii?Q?pFMee2IuFQrtJqf+71bVCy+xMhHFIMIDRitehCiQC6fpyoFpy8nxOkQM9Dfd?=
 =?us-ascii?Q?2aDkdS9EGL5FYLYvfepNUWiHJMSgTn38VCm73apUk0J4eDfApYq/CUiAe8Gq?=
 =?us-ascii?Q?coVI97rCfRr/t5OKYzIjZxIH8UKI/d+BpSZrm3ScEjrGPzLHWzpODPM6Mwvr?=
 =?us-ascii?Q?4KoJsMRcEKLoPmLv6+1bkxFSlc/V74DFRdM0gc11V0ZtArfyHp5lKCRjNM8K?=
 =?us-ascii?Q?pbLBYeXBIZcLD/GYH058Uyzs02gzEAo/VKtwGCR7?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d24a1019-3816-4238-d3dc-08ddf681640a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 07:02:55.0058
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KdNF7Mcd1PkmtOCioQDb6aTMQbV4BC7yFLDYgQiSRF7tmQKHS7jU4Tyg7yxJdGH//FGxsnHy8106KT6RUPqdXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB11193
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_000304_762076_1443E73A 
X-CRM114-Status: UNSURE (   9.72  )
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

On Wed, Sep 17, 2025 at 09:40:53PM -0400, Rogerio Pimentel wrote:
>The FRDM-i.MX8MP is an NXP development platform based on the i.MX8M Plus
>SoC, featuring a quad Cortex-A53, Cortex-M7 co-processor, 4GB LPDDR4,
>32GB eMMC, Wi-Fi 6/Bluetooth 5.4/802.15.4 tri-radio, Ethernet, HDMI/MIPI
>display interfaces, camera connectors, and standard expansion headers.
>
>Based on the device tree found in the NXP repository at github
>https://github.com/nxp-imx-support/meta-imx-frdm and on imx8mp-evk
>board kernel mainline device tree.
>
>This is a basic device tree supporting:
>
> - Quad Cortex-A53
> - 4GB LPDDR4 DRAM
> - PCA9450C PMIC with regulators
> - Two NXP PCAL6416 GPIO expanders
> - RGB LEDs via GPIO expander
> - I2C1, I2C2, I2C3 controllers
> - UART2 (console) and UART3 (with RTS/CTS)
> - USDHC3 (8-bit eMMC)
> - SNVS power key (onboard power button)
>
>Signed-off-by: Rogerio Pimentel <rpimentel.silva@gmail.com>

LTGM: Reviewed-by: Peng Fan <peng.fan@nxp.com>

