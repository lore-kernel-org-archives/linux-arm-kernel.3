Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEF85D7878F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 15:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eBRAynp2TMsAzUVIiiSIi+Mza9FUD0sH5si7DD9EX78=; b=qsJ8iV+ppISWTRTo5xok/a8PTQ
	0uasIPSCdgXmAEUlQ4phSrFWf/IGkh4uVUp/kyFpWHakp0ZYgKn0thharTt9mjyUCv2Md8nByoiNc
	Q66XbCKCf0E+a1n1do9n+HuC9i8QwBpuCoElGXhflwY+MAcdyxKrslM6u8xA4KIm46ADwXAihN/Tv
	1WPmhIlc27wJMngMSmqpR4AhoIH0X7qV4HXcZKOGeKptb//wxqITR0PqNH8zEaV9cz/bYKBDkROdX
	sMgDl1NcDe82j238q+wY6TXJ31CT//gO5Pqae6FvR6K53oBYVc5tNseGKLYYLBj+imLNHOArEXNC3
	ujbHncsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWcfU-0000000AWkT-45bk;
	Fri, 19 Dec 2025 15:45:24 +0000
Received: from mail-westeuropeazon11011002.outbound.protection.outlook.com ([52.101.70.2] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWcfR-0000000AWjm-3Q5A;
	Fri, 19 Dec 2025 15:45:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R7xEqFgXUQp8DTV6Vn46PaFcsx4uPt9A1n8uK7PuxU/krUso4PPYgJ+UTkUaoAiGQzNjTaIU+8OeVOuLo644AnQAXfbDllu+KTqoVsNP83be0CYHIW/5HSXCmxE34SSeRwaS/rbWuN7pKul90lQ50oEWuSp7lhQzR2jOMhy0f4vTsrYulMnAp1HjZEN03BV3KBYJmZ/FKct6/GY6CGB2lmEipw75VjRz3/uU9MFDMi0JWOvUGUA2H1s7n7OhRldo20NbNbEreEluooRgsvypiPL8htwjSkw3sVIkM/PxAjuiO37Y3i63B6YmEOcCOlJGQvJ2yHIT1sHa5GTGWfEeqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eBRAynp2TMsAzUVIiiSIi+Mza9FUD0sH5si7DD9EX78=;
 b=kkqBx6NlRzoifWgAcuXEpB/MPFRhCkEOriXCnk2NREYNTdSc7l7JVMjqXNhaiRs1gxcMHzbEHlB7thMt4YcUUtopCaiMrK6Rkwv4kkDWElDa2FlYLHeIa3yuwuATk0arZSyTCTRPF6qGthVRE4uFVqCSIEV0YfrgtUv9M0sC3N+63AsJexLp5TxQOWyuCERAC6jQdkoJl6KbjqxCbYxxPp45tiaU+HNT8O7itRPDJ9vxAY7U6kfPpcviqWRf1d8m/ALoLPISkX8RDGjf+HwY/+TqvTi1MJI28hrtHo+C3DoNEGV6wvUN0rLYXEor36Jo5Mw9ncgIRG6/23yTWvit2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eBRAynp2TMsAzUVIiiSIi+Mza9FUD0sH5si7DD9EX78=;
 b=OD50rl2fKBFtZzPps/mSNx3wuFDqlQOljCpn515/uT/pziWFNgrHJ1gcWHn/uReToEz7WxmlrvvGPh0CROHYJNjdCX2PJZl/encvArREww5Tc0hS5eeWNqlaMa8G+NDRFQffwh9UAuxY5661uV2kbXAReAtp+akk8032qrCou2tllOzMyd2OFQWQ/IdrxLzGaBm7ilgA6RXeUpOp69K3+MP1zcbDvjVT1No98TutHsMDYP4OxuziF/SRaYDO1dzunkps1PzYmlHOGvguaTt0JE5vb+LCCvqmvFZC/uWRv4qTyFoPIvZmHeSkSl1oVMr3BCQ0q9A7m4+xlK8UsOjptw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by AS8PR04MB8229.eurprd04.prod.outlook.com (2603:10a6:20b:3b3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.7; Fri, 19 Dec
 2025 15:45:14 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9434.001; Fri, 19 Dec 2025
 15:45:13 +0000
Date: Fri, 19 Dec 2025 10:45:07 -0500
From: Frank Li <Frank.li@nxp.com>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, shawnguo@kernel.org,
	kernel@pengutronix.de, festevam@gmail.com, jun.li@nxp.com,
	linux-phy@lists.infradead.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] phy: fsl-imx8mq-usb: change ssc_range value for i.MX8MQ
Message-ID: <aUVzA+c6V+50TETP@lizhi-Precision-Tower-5810>
References: <20251219081354.3806806-1-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251219081354.3806806-1-xu.yang_2@nxp.com>
X-ClientProxiedBy: PH0PR07CA0072.namprd07.prod.outlook.com
 (2603:10b6:510:f::17) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|AS8PR04MB8229:EE_
X-MS-Office365-Filtering-Correlation-Id: b3d2cf98-9481-4318-dd82-08de3f15999a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mAXnr/Nt1mtY9qg5PuBa9tE54fa3Zlh2cs75GMeTpRQVjNVsaTRgqFZeDH9w?=
 =?us-ascii?Q?zojDxTk+1OaQEGiULJO0FXBj3Owdxl/ctYg1xJtc+ZU0l+8GK5GOYNZKB38T?=
 =?us-ascii?Q?j49EJdJRecK9weakL0xRoO2DiuxmFvyRgmOYYQqoc/AbjTnoQrYHP6qy9B0l?=
 =?us-ascii?Q?qRbVDaZasp6hi9OSwkgMmNi6R3qa9dCVvnEOnTMprNX29tiTQaF2M1hPLs5a?=
 =?us-ascii?Q?2TB3/Cd9GerynxAyy0+B1WYyLSpB+Epb4/LuokCrdkJqhmb++Mz2w20a1uTe?=
 =?us-ascii?Q?psMNPaET1AebB6/Sb0gP1LwLX2E41WfO4EDE5ejU0lIOCp9epy/uzzzwBmSS?=
 =?us-ascii?Q?YCTGm/V3NAaBCYG24ru3PP22wKifmLO5a0cD7HmKzKvnY7M3eYGrXTj3sEPR?=
 =?us-ascii?Q?RS8thjgUm59B9dusUy3k8IzSrGJgYoFdRm8XG+GtwUdOo3vO9i+MuSU/0gIw?=
 =?us-ascii?Q?gGM0d2K2QLfTo3ZJZcTkcfR7qqjuJyiSgU1AbtLVJDjMPwiRPDdyzpElYrjw?=
 =?us-ascii?Q?bliAKmgHEAGIb6QWgHkUxzSWod3SOfvoDl9EuuonupdVi3LwZFudDopenM9w?=
 =?us-ascii?Q?FtT5zQEgq78g47BwoiMoXAwYZrW6mvG/y6045hge7Sxtje2V3hCFv2dXJ1Fn?=
 =?us-ascii?Q?bXNwci2AnHVwE3bZtXwT5Ybja45Y0f8EZ8rk92tYSW875tyQJrxaMkgvk2zx?=
 =?us-ascii?Q?TFu6YkLme02fYzzBKH1ToaKvOANyNSq1Z1LaeB2NXgWyyKn83DwtVpqjS1G9?=
 =?us-ascii?Q?YzntnHGB6CEvT9uQ3xxOO9ZZVovpe1yUfPf54ok93AUVuRrYsQXxOvsiD5IE?=
 =?us-ascii?Q?QuMzWt6zpvkEGPZ9Gw8vplJCDow05boMw4RCK8hhf/11uOVdJUTQuSc7O2+y?=
 =?us-ascii?Q?CskoBV3EpOyVVTP/Z3OkvkMNAQ7QM88D3n3T9DX3AQnIo+Cf7pj8VgIoBz7/?=
 =?us-ascii?Q?4oBQuyDr/QHg/BzVO7U6MWfc4qQbw2mKbKqqyVDHDHyY2zB0JMhXahUEmmdu?=
 =?us-ascii?Q?a/GCvOXobIIULckW/lhSSzqItuKZzwQj3FA5NyURJrdzY6oS9QA3xZRjIQgr?=
 =?us-ascii?Q?FmblsMmQNb+2JMzb3uiHHl74ri0pBFinPLrt0zyXVscT/FbeSJeDLf306ANm?=
 =?us-ascii?Q?yvBz95RNOOMfXkEPRsIescelkNWHS5WQu77kMD706UemoFGK7dw7xkOJaED0?=
 =?us-ascii?Q?FHh+sei852hzk8SWSin9yl25fOXVTcPMy6vegidPMC7g8f0lNUoHwG7xCH0X?=
 =?us-ascii?Q?FAlZizZv8sIDUR7/pfByzxvkux4ynwvekMdyUDI2omv8Q0m3RH9A+DYyb10r?=
 =?us-ascii?Q?CCVtZgE545iLr4BzoRr90SkanMymBgRqcBz68ZutZxEYtSPrSYLjgOT8SMFS?=
 =?us-ascii?Q?3+ZZYK/J5eb1HRsJJYt4DgzXYSrb1uXIe0CdyrvJDbHU97Pg1COancbuHXHD?=
 =?us-ascii?Q?Kus/8Zn9sUUl+H7sqq6xKRPUTwvP0ZrBKnCdBH7/0OQuJzTnsiCTSS0xpwV2?=
 =?us-ascii?Q?HAy81PxQ5x1ix4G4qFQfeRKAv1KjNqSb9Fno?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NzE8ef2eH+gvo5/DlG+KprWAT7aJlKC0IDxCxQ65jjK+yov13D28azPYy1IQ?=
 =?us-ascii?Q?ReiCgWFwzSQcTAr6SrTMEblZmcy7sfNtd8Fcyj4PhC07MBX1rjEjJbzi7z7N?=
 =?us-ascii?Q?NmBFwYAw/MYoM9x6F3IjoIjmAfs6MiIfCqPf9LiEWKrnuvZnUeekRFGaV6ZS?=
 =?us-ascii?Q?vLl4nXYbrUHB9oLaW5l7GL1Ie8NqZYMuFWncwvYN8q1lnRuWANhN6ybXouZF?=
 =?us-ascii?Q?B0QysGZedTWBKjNMrEH0LFi9yQHMUoKsQQ7eVm7ZIv9J/A9DHqfi1hfBdhwq?=
 =?us-ascii?Q?VNxd5hzSuhrpUjNDselyVJ9vj2HbTbrisLDm7L5Faf8s6nXWwkeTY3E1yvU5?=
 =?us-ascii?Q?9kfa2f+iaBaazxxg6saEHeYsgqNEJjpQ9RHMUKH2QkD/oY14SfT8fMrEUOgY?=
 =?us-ascii?Q?GMfek6C1Wzq86TebuTFdkbaRgpm7ZjJ8RyRVkN5Un928MGcByStJd2zgpwfX?=
 =?us-ascii?Q?f+GMssMl5FMOOLfK17amAqhRoYfvXb9jb6TVcFnBEqgh848+b+/wAinzGDZ6?=
 =?us-ascii?Q?6c3oLAVyFIcfXTHUhPHnoWAD4my9TobUbX5i/kM8OvEw/aohyDruhioUaGtC?=
 =?us-ascii?Q?MV86wL1Ssmyb37K+VaUqt/UDV38jzDnoRQ84y3MxWLE/wlUYzB5VjW0xgFzb?=
 =?us-ascii?Q?BnkTirFvMvUnfz9FrAFSe9b6HH/7qFfPCt9chQltpMdOlYyX2R6LVcIxZbOv?=
 =?us-ascii?Q?6FmP8ajk01VLzsHINjf7Evh89poyvsoUzXnXNeqFEOTw/W+FDTMvLf1gZ/t8?=
 =?us-ascii?Q?kMm/si8CTr6N/xQEyzvcYatsyD7S0CpyCX20a0K6ukwCRI7tliKflJ2C5T5C?=
 =?us-ascii?Q?/fZJEjYTt5wcIU2P6vzwdwVrpNihYlytmxGC8/pw/cfkxE2YloCCXkl07CVs?=
 =?us-ascii?Q?jEduVNiF7zugUpR0+3nMZs5pttsmrkYBL4gsiPqBiM9wLwhbaScflt0bJPV9?=
 =?us-ascii?Q?skwiXOXnUboY3efOx+kXjeuwCeLr/288pBzZcStfHUpZfc5+U+wMQFU72gyY?=
 =?us-ascii?Q?2FD0QgwafOchYoo8piX1P93D24992mLEgmz0L+FB7EZWV10xN+354OFdxPaK?=
 =?us-ascii?Q?jIkDdM9GzpAzNm17bqrOY4npZZ64kbxCKQqwUKvkIwpayzGLVLQQdy1xO2SC?=
 =?us-ascii?Q?grYpNnPDSSGsWfkivGJE5SZ7gbH9ByBjxhxtrByp1c7tbktBxqt1jT75aN0C?=
 =?us-ascii?Q?Q4antz6ASO1XVFarint+/AP5Zdm8m6mLWdj5LaN3QeqD5w2eaBt/auXBXQqM?=
 =?us-ascii?Q?y58wShYYMBe++4DNhq1NCWbTQ0t5JHkTetsnnReJZliwBZWRdYzGuRdpSo6N?=
 =?us-ascii?Q?8nvCAALRpAu9OlXO+kYNJ7nraWcDeqG+APhyKnNrtKQyRxJl4RxSr1IjvcYI?=
 =?us-ascii?Q?muC9RGFA2keMSeOyh8hY2buYXldLf+ezlYYmvZ4covk4GHRV0jhwxgxJxh+0?=
 =?us-ascii?Q?T9Aoed3Q53EALENzS7XWI++4uBmaGcBUuiIxoHkVqP0l0yF3euhFoNOV3ham?=
 =?us-ascii?Q?zguUdRhkPywXZ03peITgKkv4CIh0J77cH8g4akuBWwsS3pGc+R7spT4aHEwv?=
 =?us-ascii?Q?JvnOlHxrsRtW6ePYoLedvlFMFy+ibQl8JzbCI5sI4m6IgI4iWSP7MYbepSI2?=
 =?us-ascii?Q?Cjhio3X2pV70IZ6C5yGaapE32ylBOymemhNLjksNerrc0jeLEf3SIp5GokcU?=
 =?us-ascii?Q?eMGG+jJm6fDfZFkF0K8q7K3EV3o28MEpPIzLWBeDlPpZJ52L?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3d2cf98-9481-4318-dd82-08de3f15999a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 15:45:13.8681
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yV8n3O7U84byXZhiyJhqo6dvZXOYt0JYuTXd39tR7HGCnIfR4ew2g9II8W9BV0WDHaHGDyrvYZoGb5RYlU5viQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8229
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_074521_888234_40FEDB42 
X-CRM114-Status: GOOD (  15.82  )
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

On Fri, Dec 19, 2025 at 04:13:54PM +0800, Xu Yang wrote:
> According to IC engineer suggestion, set ssc_range as -4003 ppm
> will have more tolerance for EMI, and suitable for more boards.
> Besides, it's confirmed that with this setting the TX SSC test
> will pass on one customer board.

nit: next time wrap at 75 char.

>
> Signed-off-by: Li Jun <jun.li@nxp.com>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> index cb2392008ad2..02d9af409b08 100644
> --- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> +++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> @@ -18,6 +18,10 @@
>  #define PHY_CTRL0_FSEL_MASK		GENMASK(10, 5)
>  #define PHY_CTRL0_FSEL_24M		0x2a
>  #define PHY_CTRL0_FSEL_100M		0x27
> +#define PHY_CTRL0_SSC_RANGE_MASK	GENMASK(23, 21)
> +#define PHY_CTRL0_SSC_RANGE_4003PPM	0x2
> +#define PHY_CTRL0_SSC_RANGE_4492PPM	0x1
> +#define PHY_CTRL0_SSC_RANGE_4980PPM	0x0
>
>  #define PHY_CTRL1			0x4
>  #define PHY_CTRL1_RESET			BIT(0)
> @@ -780,6 +784,9 @@ static int imx8mq_usb_phy_init(struct phy *phy)
>
>  	value = readl(imx_phy->base + PHY_CTRL0);
>  	value |= PHY_CTRL0_REF_SSP_EN;
> +	value &= ~PHY_CTRL0_SSC_RANGE_MASK;
> +	value |= FIELD_PREP(PHY_CTRL0_SSC_RANGE_MASK,
> +			    PHY_CTRL0_SSC_RANGE_4003PPM);
>  	writel(value, imx_phy->base + PHY_CTRL0);
>
>  	value = readl(imx_phy->base + PHY_CTRL2);
> --
> 2.34.1
>
>
> --
> linux-phy mailing list
> linux-phy@lists.infradead.org
> https://lists.infradead.org/mailman/listinfo/linux-phy

