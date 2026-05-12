Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B58B4CD4F35
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 09:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NHxEhSh2+MLoqJi5tR8o67bSekR2JxzBP6x+oRqfZNw=; b=zN4G6xMpn58MU9sovUI3ENaU4P
	80EHTDXQC9cL8OVN8J1P+rdIjAJxCzz2mAEaZtGbA4leaWmha5eDsRZNFrVWFvQlfoIo8dVuZtOQ3
	gg0hFY6Rf/BUAVQBCfFlZqGaNjs9LBYwxOKv+13ietvwdC9ZqZyT50TpwKwu5WlIHr+JDDEEvnJPM
	j717A+2KntUyKKenIsVmnRgDvHbDkqTHxJSZwr1PsXfw015eFHEXqajnkKoUB6iz1ZxKRYBBdl+Rz
	9DckrEAgwhMRix7CQRkl6fWlUSjMFFrro3EbHiCPk6mAJs/3IYoebKNCQrT+xeh5R55hMWxcoG8Ab
	9qKvamYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMjtL-0000000GMC1-24aH;
	Tue, 12 May 2026 09:59:07 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMjtI-0000000GMBV-3cMx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 09:59:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kt20Grc66Vi4VcVxpSxaeYDcbNxBeQ6g8Qn+gIW1pVrhMQkzhoLwnO8Bes6120nfH9iIi+x0zD4q1im0Sl7A2Dz2P1I1alIMoRWorWADQ66FXmXpPjiAKqVDBrJar4/ArJKsp8p1iv5twztVqa9XutZbpPiIFze09X5RbTK+bkQUlyXxfyyBSgKKu6/d+mwnU+Z0wAyh0DWmm7rar2kZw0UWCrtsbunu4CbtmIIUFKvKofEH/PDsC/MADRbYCT5goY9OZiz/61SQaF9INi5pfdNKlYQBuMkNovLNMd+s62kcjfCwkEaXogr80/yq/R8s9LfjloEqzMTAPi1hZBH4Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NHxEhSh2+MLoqJi5tR8o67bSekR2JxzBP6x+oRqfZNw=;
 b=nlzZ9WYavz3ybX+sTtpJ26t0SAQQI0ZfT6FWxKLD4YM8LlHljoA8030BZuz/wtE/KsEDlnTtk4vaLvTrWsFy4gqzpWfJN+Z+7yarFZtY297rNcqzQmxZHAAwlN7BmtkL2jR0N5qwCK7cbZ84swNEQucZw3pha6y694SIJEOIFY2KjokvD16fI+vX+S4VbCTKGuzet1QSnVHBVWpjPP0mR4zChRh7adEJk7Onfg0fPKyuMwPqEW3PgctH7uWHK6H2WbWLilYDEzZt2dTpJ3F8eWj19NZIqHmLG8yUfI7bCwhWpH6ynEpB7BmPcwF6tMm+CPN3Xw/8xjial1qtVl5OiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NHxEhSh2+MLoqJi5tR8o67bSekR2JxzBP6x+oRqfZNw=;
 b=ZT3I+dv4G7IenUm+Ciw5ppEMHrbqCyfLR9D0EKiRoZE1njkIapWjVLhsk1GN6M6PCv7iXEn6YhhP845Vn5RXPQFgBmoHm4wCKVv0+YaA7QV+9oopHfkVpBBRFnfKwQyF9hJXyOCfSV0W2WKsijAnYTbybOEZhOaqz2MSm6Yi5V0y4wls0UGXnDnZwAqV3okn81KZ2yhnUl5d0gBqAcrKzcCBd5fYWyUXx89Sv+1Zei6VLj4QspmaFuad077V4hK6hnj5YcXFee9rG2zJKOsccQhoFPQzL1cxB+gT3B4oNb2EmZtQuND27cOSDkAhK615R+MYIoj/iLNoRhwnvg6u3Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AS4PR04MB9483.eurprd04.prod.outlook.com (2603:10a6:20b:4ec::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 09:58:57 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9891.019; Tue, 12 May 2026
 09:58:57 +0000
Date: Tue, 12 May 2026 17:58:02 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Franz Schnyder <fra.schnyder@gmail.com>, Thinh.Nguyen@synopsys.com, 
	gregkh@linuxfoundation.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	jun.li@nxp.com
Subject: Re: [PATCH v3 3/3] usb: dwc3: imx8mp: disable auto suspend for host
 role
Message-ID: <5cj6k3i2oemrxnqg4eztrnanvtgqvfx6gruy4u562ihokneazx@hfg7pyyev23r>
References: <20260108081433.2119328-1-xu.yang_2@nxp.com>
 <20260108081433.2119328-3-xu.yang_2@nxp.com>
 <k2sxmwhrv3tivustfnpz54ehuufkcrcruu2uuukuyugqtqljzl@5roxndm5fn5u>
 <jjwlrgusucoacaye75uqfuh76a4jhdv3ivzjuemgusw3trwseb@mymuy62cptxp>
 <hsyy2owzbt7tsljktlrz5g4bnrnecznvcyy6zxt7gfyxb4xvgi@ysko6xe6h2zm>
 <af8stIGhzVMfhyIQ@livingston.pivistrello.it>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <af8stIGhzVMfhyIQ@livingston.pivistrello.it>
X-ClientProxiedBy: FR4P281CA0302.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f6::8) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AS4PR04MB9483:EE_
X-MS-Office365-Filtering-Correlation-Id: 16cfa069-4ac2-4046-1256-08deb00d1554
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|7416014|376014|52116014|1800799024|18002099003|22082099003|11063799003|38350700014|56012099003;
X-Microsoft-Antispam-Message-Info: ydaX5ZpGOfbz2YvJygW8AIKQw0VQvbqRzXBJez3PjWyvnTidlCTBHsNql3fckOV0AhG7pDMbdORjbzl94/uE6af2WniIgsrgdGJdVrWnMJTNBopYyhYqLrMVMXGoEs6Zhn++UqYKu2IeHrQiTJY/Zh+bfrAYl+TpI1hqJ0BeGwIrEzJhdH3VuHZ9TNcyW2HW63ofFZH3LMQkQpyUDkWgU3jLPg4/8fJFVLVTZkNPXwHnbAH5MkD76eZPfkX3h1sQA1/Ykxgkzg0Wk4sN0xOyH//wUOf1E335PF4f7P1peGai0bPsgyaPdMA34eHJJN2K1V5wRImLWTJL0cbCpSzD4BAsFuNy7NYsSjTjPj+7n4VHxDNaJxDzR42tLxOnjU8S/7VSYfv6cPPBfEe2NlX0xyWmPCOpMNfouZtsKjuLmNYE9N1PiZScQOmWUYhzPl/sVmpyNHApNIvaBpVyvVhm4m9iMVWKkhU1rN5zg9V/d7i/zM3AfhphKGH/Ld7NPWgryIPjmtIAM1xbtDaZO3uE0X8wrHH2PMijiIxWgXfgmM5DMgwARJmZKLhAONG7BBx+CgDtG9vQ1d8Wl23uT98qsjLrXIpWff/1KmKED7tWeAQy5JuP8dJDyxEQFSrCqDvEZ0wo70w+NTRgjo8X51fg8nU8EHH7/Db6ylnq9KGK0mblX2ZniByzD+A9kzrB8d2tesnGo96QS+jVqCYNKZvP1+6u+omOZUjdQn1Co/E7uRjbAjJ5t3W6TlmGbx6nSfaE
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(7416014)(376014)(52116014)(1800799024)(18002099003)(22082099003)(11063799003)(38350700014)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tM4yqlGthlis4ZZraJCCZ3/H04w1nyvKWkn7HSy3dNnA7MXxjd4QGZ94Wkpq?=
 =?us-ascii?Q?sIDfQmdPXPP6Th2UUr3wF+0HVR1rXx2GCsxCybEAke40rKlKpkOL7vC3Fgp4?=
 =?us-ascii?Q?ZnAyjNIPRpZWJy26Cb5+MNr28e5eswt3+VSIugvHABUXjlx98tgQldEDJLcC?=
 =?us-ascii?Q?ookyu9Bcsj0RqSzvMmSud1RAWekhjmrf/Vj1nlOs3aflQ2Uao18c2rgrpdIJ?=
 =?us-ascii?Q?yW6FI8xK/CnxAHkyqxHf+XPfEOFeyFcPbKZhC/aM7dtj4mGgAi/keiuMRifG?=
 =?us-ascii?Q?W/KdxAa4FgRQd05NstMVNYpLgsWLlcVbIalAciQ+8oxykYtuDWvqE7fx8SPs?=
 =?us-ascii?Q?IGch+CO9u7+HimdkSw0X45ZDe9M95g8sE7dBJuSpmh7xqG15Os17HcAoetlz?=
 =?us-ascii?Q?dpog2GodFLV1hDOw5bUWG9EG+P4265j1+INVStFGmXRlFzezheBf1dDwjsNF?=
 =?us-ascii?Q?Fak+H7d/TVf4l7PrqLMWky9VLBTYvRUj2Fd6qQ3a4O5V5stiWTfOFfpTT3I0?=
 =?us-ascii?Q?stEgHpSklhegCt3SZFlFNX6hQdZ1MZ437LVnBFzOF0YUch8jU2/ImXJH32nn?=
 =?us-ascii?Q?yCzCAI8dWvd9mNC81w33cEdt5R1uLr4yStsGXtv+LZkFWtsXj8l9DwXHgdyr?=
 =?us-ascii?Q?Dhv+tJeDAHFbUEvYDEPwbPRK8j3lziPBTpFu7AHqe9BKxbWSEv7QtCKk8Of1?=
 =?us-ascii?Q?wzZg3bZBpgNsEbgwRMnK0z/TTN+NImhgV3klDFZiSEQl5veW+jaaf2Z7b2p6?=
 =?us-ascii?Q?mkaONVfBlL1Ha18XWkOKan2iOnZm58LYSAFC82oBk47kkRoGsMPtuVSZ/KDu?=
 =?us-ascii?Q?IxKYheBkKDDXFLbbTIovRJCYtWwF+dp98F/d27dseSPlfAQhk2/mViDTYNrd?=
 =?us-ascii?Q?XP/xP2ckrL7Jbxgal6fsxpfr6AmkdPve5WwR3qL2W4sg9+mlxnzpByR79B7Z?=
 =?us-ascii?Q?YZgJLhcuH+yqQboqkiVsdL/rIXFC5zup4Pq50Qfvd+A/noxKXT6o2M5o6BWH?=
 =?us-ascii?Q?kQYSo3roAxx+42AJoVVPd4Ga5Kj5gl0DbxIl0vDJZumZE8OYT5+6aqFRL9eR?=
 =?us-ascii?Q?tfAIO0nzNS7LQe+LAFj2d9syrL/tlDWg8RAuqH13NYo11Wxf37p16T9HtXaX?=
 =?us-ascii?Q?txaKYLBPTWUwzz1T7Wxi0cQQHK0gIFiyWsLNE8d4YjFQkY6Hyps8xqGaGzrw?=
 =?us-ascii?Q?8rg2qU7dC2qJmaXAksZpOafSq5qo6tyfTI5XPymafWl1xc8U57bsAOGxTz68?=
 =?us-ascii?Q?OJJGUZM6qdb1HzPx1uqgo253bGNO5iqb3RMBrvtfGD/dt6WI4pJ+xGPCVYYJ?=
 =?us-ascii?Q?3YxuvFjGoaZAO/WfzkAYa/K38vDIoj6KXFnkSCtGQNooTAeSjhVAcaaRkdUi?=
 =?us-ascii?Q?hAa93M8nGRNqJPoBX9xJ++5ZaRGW3KB1hdLo+2pOKJacNfuxtRt7/1C2bc97?=
 =?us-ascii?Q?hNJEQA0rViXncX+Q+nMZuq+AMMhkFsYb8bfZh46mz/p6+OZ9htcxVpArfgux?=
 =?us-ascii?Q?sCBU0TyKORUaeMEC/iX1rgq1pPwFjwcGwgk6NvTvgstFTPK5uGt3fjhDM8i8?=
 =?us-ascii?Q?6/c2QPH3fkITfX1x5SKd7NhQfVBKYsFvdFyVEsp21LVMxmHff4jViqomGbg9?=
 =?us-ascii?Q?AW4k+Lex1kXcLSTJYF8mkgq5W7yU+AkPUuQb2RXX+7g071RhgVh64zD7JzU2?=
 =?us-ascii?Q?pznlrfgPGIQGZ+orb1ssq8SQH0myndZGM3ZkedWenORDgjTP7iGMjLSv2Hm+?=
 =?us-ascii?Q?uQSYVqyBsw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16cfa069-4ac2-4046-1256-08deb00d1554
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 09:58:57.3483
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2SL2NAqruUS43nLemEtdO1Eq43u0W6xtZFBrxcNMkqPy6Pk4TkZJSUVPLzDgheLwSD6b9dxG47/qs47KGogUXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9483
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_025904_901723_E2B15904 
X-CRM114-Status: GOOD (  31.17  )
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

On Sat, May 09, 2026 at 02:46:44PM +0200, Francesco Dolcini wrote:
> On Fri, May 08, 2026 at 06:04:49PM +0200, Franz Schnyder wrote:
> > On Fri, May 08, 2026 at 06:54:40PM +0800, Xu Yang wrote:
> > > It's strange that link->status is not DL_STATE_DORMANT or DL_STATE_NONE at
> > > the time which means the device core may not properly unbind consumer devices
> > > or handle something. The patch does a simple thing so the issue may not come
> > > from the patch itself.
> > > 
> > > 1639:	list_for_each_entry_safe_reverse(link, ln, &dev->links.consumers, s_node) {
> > > 1640:		WARN_ON(link->status != DL_STATE_DORMANT &&
> > > 1641:			link->status != DL_STATE_NONE);
> > > 1642:		__device_link_del(&link->kref);
> > > 1643:	}
> > > 
> > > Which kernel and dtb are you using? If it's a downstream repo, how do the USB
> > > controller and related DTS nodes look like?
> > 
> > I was using kernel version 7.1-rc2 and noticed it while working on 
> > sending the Aquila iMX95 upstream.
> > https://lore.kernel.org/all/20260506-add-aquila-imx95-v1-2-69c8ee1c5413@toradex.com/
> > > 
> > > Does the issue easily happen? Does dwc3_imx8mp_probe() eventually succeed?
> > 
> > I did various boot attempts with the commit reverted and couldn't 
> > reproduce the issue. With the commit I ran into the issue in about one 
> > third of all boot attempts. So most of the time dwc3_imx8mp_prove 
> > actually succeeds.
> 
> ...
> 
> > > Yes, if you use the new driver, I think this issue won't happen at all.
> > > 
> > So once your work is merged in the imx95.dtsi we should be fine.
> 
> To me it looks like a regression that should be taken care of.
> 
> Maybe not relevant for aquila imx95, where you did reproduce it (the reason is
> that aquila imx95 is not in mainline, yet), but from the USB point of view this
> board is very similar to other boards using the i.MX95 SoC that are therefore
> likely affected.

Sure. I can't reproduce the issue now.
I'll research it when more information is given.

Thanks,
Xu Yang

