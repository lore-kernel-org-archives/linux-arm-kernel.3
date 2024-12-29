Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 245F6E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Dec 2024 08:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lxv9OMRbb48AefBBZ1zT1EcpDq513rj5Kp94hTVbYZY=; b=2/li1mvJaiPQrX7WyAcQtVBJjC
	9gRN22ewax8I+IgY42H72+eG96HG7w3HcXgYK3aGMNE9b2rPxUYURo4zOKr5xCOZavZMLrcAE0HrY
	ARVYradbsn1qcZeVVx2uHzZnUJgdkcEJ5CTJj1eQrKUS6wmhbNOqtLLr9SZN88iYVj+G/GugUL0YM
	U+7ySVxSbaXbLptT7t3sOeAOCxDTTJMSz3Dz2+Xq4S22ou/XOFAy6UyzAmOyRWMfqW37xWgH1Znj+
	+N/Bo/vMFCi7eMOkDiRbrAfW2icMEkyfciXMbI+6wUQ2IO2WMKBoRLp06phjM2Ra3fchSnHWah2H7
	cZt3U6eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRodQ-0000000376w-3cdY;
	Sun, 29 Dec 2024 08:26:52 +0000
Received: from mail-am7eur03on20627.outbound.protection.outlook.com ([2a01:111:f403:260e::627] helo=EUR03-AM7-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRocD-000000036xg-0BD6;
	Sun, 29 Dec 2024 08:25:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CQN4uNuqz23rc0xYlFfKnAdCm34Vk0qXlTh2jGH/bWODlynC5ZFcVBak9s4iuAYCPe2bfVI1qPJGrFqdnKMni/v6nHRWGuyq3E+sqZ/0lT1I1WQMB8cbY+3OI8uZe7VlUDrkVmThAWc1s7V+ui29Pjb6I6829RG0MVDsIFmoGSc00tGYlnVumk600l7N/dJiGs7H164KysgrpNRY7aLvfctxNZmauqKWAsJLwozw3Wtna34649fzmGlNLJquwxfbEXbcab06Dd0FxwSoUaaCZVZ0rv3wSSZ67a6TRM26iA392LZTsrMQ+pU5CkngRgMC+ilk5Uhf820eGfs0efL/OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lxv9OMRbb48AefBBZ1zT1EcpDq513rj5Kp94hTVbYZY=;
 b=OzCr1uM6voTfQZMDez9JjempXY9XZN5Y3nuW3qiGVITsV2LMUsUwHFyXVtNC++4aF8aEH4DNcmx9v4FPY1mqkUTOVlM/oL09rWeief6l558uq6zFH5yscN97CtDXcHG46SEZStTkArQJN9GxPpvRtdJs5Zp9ri9UzDj+Iz290TyTgWTRxEAA8aMsHwR/ilUQ2t9BVybwDDIDF8j32I65UKbrMphhuEdTZajWBouFtRo7Spr+SDI0pfnnQmFnUGwXPPbT4GE1CzLF03TgRUvPvxPhSklImakPyv0AXKs1Mo4EYrj1dsGc3vG1/H2louMZw+kbYRndYI4a121kmUjawg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lxv9OMRbb48AefBBZ1zT1EcpDq513rj5Kp94hTVbYZY=;
 b=p+eKJT35glDRDCbxZSQWv7KB4T4Nfg2t11iIaRaok4kxi2O867XJ1bXb3K6Yw+gFFKAxAWWl+ySEivMFEWth+oLzjRnWNbtAIFy4rGddLGaTM4uC4u/3hs4egGAdtymaHevubDpPFJvxDYBGuTQcd3G8BwdCXw66K0ZVCeA55l5Pvt2O3WMRyrIwDSOFwU4/HZQhINBCtQAHJbQ/8B/RL6EliGykUl2BCYupt4zz0DvWJih7rBB31PuG/5EeOaIO6pUc/HXEOw131M8P7w5sN1B1q9BTYyz3NdZxiXNnH5AHx27ggQgvTBGaAOqaow1mSP7uyI1vja9o5KRrX8QNcg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA4PR04MB8064.eurprd04.prod.outlook.com (2603:10a6:102:cf::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.17; Sun, 29 Dec
 2024 08:25:22 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8293.000; Sun, 29 Dec 2024
 08:25:22 +0000
Date: Sun, 29 Dec 2024 17:31:02 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-riscv@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 00/12] pm: Introduce devm_pm_set_wake_irq
Message-ID: <20241229093102.GA11533@localhost.localdomain>
References: <20241228-wake_irq-v1-0-09cfca77cd47@nxp.com>
 <20241228101046e64adfb2@mail.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241228101046e64adfb2@mail.local>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SG2PR06CA0251.apcprd06.prod.outlook.com
 (2603:1096:4:ac::35) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PA4PR04MB8064:EE_
X-MS-Office365-Filtering-Correlation-Id: 964af8ed-a974-474a-49b5-08dd27e25610
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|52116014|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?oUiarl131e1wEg14BRNIQl9JpiQRkggfhls8os9u9LBtHfc6TSFEnUJiA7w0?=
 =?us-ascii?Q?Gi8Tm3bM0fHk39nEJx4aOITBMObMawdTc6rAGVzy+LByzjPvyHPZba7/pdnL?=
 =?us-ascii?Q?HOpQRhnYEGuGMCYnEsLgxotikvl6iiBtc46Z5gWD3AZYufqbdFsnywUA69Ru?=
 =?us-ascii?Q?O+OFJDWTgCpy0P7Aqko1egmFn80FKnFMz7Q/L52vO1e5X9hSQMk93LRfYczQ?=
 =?us-ascii?Q?mS7h8WkwII0TE60kT9InArEfeV+b38WtvDcVsOsrP+Vtxy3hSZBneBFkGM1l?=
 =?us-ascii?Q?Z2W2DUjlN3317f5kIuyXuYTQrwug+CujnDdYOYo8XI2tAyixscwUOVqwAKnA?=
 =?us-ascii?Q?j9Yg2aLESMgvjeq2NdrcCvRLRaFqUx3c6oJPQl2WF/0YQ7FhMh75ewjhbjEJ?=
 =?us-ascii?Q?OdfxKDW4ixSZurxg/ogKbt7qrxwB2M9nB0Z87FtN7d1IwZkoVq3Oi7iE94nx?=
 =?us-ascii?Q?ZLy0+WRZ2A4w2nu5XLqpyYkCnsZXh/mvp4irBQeuvL5kSCl60oWd+u0TAiSO?=
 =?us-ascii?Q?g9hgOQ6PNRxFmSoPnkT4HnOtYrq7L6yzH+t02JAPfXh5D8cN0VsD2qHDoKvm?=
 =?us-ascii?Q?25b+uFmFGugTu2oAG0GPfnc1jR+dgFu8ftx9deqDG9455oqf7vrzpxj4vGqY?=
 =?us-ascii?Q?lZQivoghVaI3OeAseEAt65C4gJmCmtNn4Jx5sGxV/Ji3usk7mTf2MNHwnqdT?=
 =?us-ascii?Q?r1dAg+JT8GsdvUEL/QrSra3PGN5zlhKO1UzSJ3rpT4VgXd8Uk8YXUkw1RBE6?=
 =?us-ascii?Q?n8Wz8xzeGuACyP4xwya7yk4iwcE1ou4hKnr75cVW1TSQjmCvWF2WplKIMNHJ?=
 =?us-ascii?Q?mj24ICOtjrOYaNEgkguKdJuxUyCiKBMzaeacilMwVWq/NFZlgEraVjZAKmIg?=
 =?us-ascii?Q?/sR6ry1RM7yr+cHF6TZjMEMCSK4IolwonNM2VI/oxd54hcH8Va/wdMRJa61v?=
 =?us-ascii?Q?emPyCvd+GxlEsQF6DDk6Vrp+FFKpnCX9/afjVyYngf00OHaSVsW5ik5kpzO5?=
 =?us-ascii?Q?bQS4mb0rWA5jKOcccIIMT/m+p8B+Y+PzIpvzjeGr8wxq+GJPEB5HTqrzmvlQ?=
 =?us-ascii?Q?dsgdtVwepKbbtoP2gmAFWufkNO3cvBDDVarN9oL42HnH5EEyYPnQoxcmf8La?=
 =?us-ascii?Q?XZAy8dQj9xpZvl5Ws66NKFOUbZM69nKoKSHQY6B70uzeCpdrp7vslzvJBgVz?=
 =?us-ascii?Q?F8Fal1X/hLoizA/BA0sr0yPrph8C1G5LwW+FyWodqrCUxnDGOV0QaJxWkzRA?=
 =?us-ascii?Q?AMSg+rqGT3x0Gc6BPZ249ZOHniTfR311n/1GQnodDvvU5+7IqC6kEnMRccFZ?=
 =?us-ascii?Q?W7od45AWK/oK8GPA+1wyDMytK3+FQ812uH05YlLHNrH5GXRFQNsgMXonJgMZ?=
 =?us-ascii?Q?qeb1lVkfXLWbUBzUM9sNIbuhsCTBoTpCU3Kv3kL/lz9SJ+bn1Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(52116014)(366016)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hmo7YHJ/2SfhXlYsjA8ycNXFgGq0zO+f+EjlJNO/bAKJvTGtVSJoYx8Q6Iou?=
 =?us-ascii?Q?hVIZO6RmfR8n/wnAJa4ps0Zxlg62lP4Yuu0n1RUTQOxU2WR6WHabPZSKX0Oz?=
 =?us-ascii?Q?7W6vsDIuh5xZ48G4hUAPmdwd+LRUtjWH6B9xkFCutX6sX5RUvzORNoMK69Rk?=
 =?us-ascii?Q?GSHkPe4IMVlZ9yacNzoqjdKzs79YH+viKkyeZFLtq2A7eSIBIfv+1Jy9Fd9k?=
 =?us-ascii?Q?jmOS5k4oOesXYsXtup4qHpzsAUNK0/xlNqHMCRkHHxmglBAjln4tMfznddVb?=
 =?us-ascii?Q?lRxShYXMgtd+qp5iuL6d/TcB5r8fzHcpvb8jh17vtZepH/qWpg70+AgojG+/?=
 =?us-ascii?Q?BSbitXNbhmwPhS9sACY/XgHp2sD46JTDY28t2Qp2/SGcxvQ6qqJIxVsMiVq2?=
 =?us-ascii?Q?8rx2mCXfh4yVIb4hjZ+Rv03Br7zNmbq7PHydoa1Ruwl1a2uotg/fABVfW973?=
 =?us-ascii?Q?x6OiM2PV1eCpLN272DebrQgPiKR7wa1Jw9txp7oNjJ7c9EHiF+7mALg6EGys?=
 =?us-ascii?Q?p0rjTEO/iiPY6hCJ7f2WMDtcjgGZrcewMOrYY26QJsJ9fJDBHyp/DNRIsNn0?=
 =?us-ascii?Q?BIQ/nTCMHYS/Z2hiYnObhXrOLHy1dH0A1Dh8xT8wPoVM17q+9Zizy1Gx4m9r?=
 =?us-ascii?Q?8PSQdZDvD2PL75LJ+0WT15ZBCkC5iHdTOxa+x2JDGd8/yBMIncDjnXMCFZff?=
 =?us-ascii?Q?ic4IS9JagL/pxtUPLBq+JVcu3M2CC3Y502CbqTBcPz2Id86j6C1cstn0QVE9?=
 =?us-ascii?Q?FEC4GxRT9Avg6CcjNfu58qBZ2fyt1efNhPZS0SZeIxMmpuRF4Mjj+afrIYtI?=
 =?us-ascii?Q?tMiV05Gsbiw2x8qfv3m5xhsiT1L9E1E5lKULAv3iP/b9YjpTxcnmb61sAQMm?=
 =?us-ascii?Q?ADfdSOo7H++ygrpW7JaC+3/UgZUQd08HysDBa+pbITriFz1kkiE0HB8Oka1P?=
 =?us-ascii?Q?NIO6n7Fs6gZ038D7xQffjfSnza1DMR2Ddj3ibwtukQwLEgLzNv/dfs62QGyq?=
 =?us-ascii?Q?iUQxwpYWrO41MwPsxRhPuwY0VQ9HQ+73eBbulidThXgNaJQF9q5IiPmBPWj1?=
 =?us-ascii?Q?9A9A/Ivw8lCXicpsVmyL4AqrDKVKQuDY4CpI5wy2PXgRhtw+zDz9i7xZvVcM?=
 =?us-ascii?Q?rxtSTezjk9XH2lUEn1fcOyimmbe7Gq5BsWFY6iaflwvkPjUZj4/L0VosF0j2?=
 =?us-ascii?Q?tITPxkv8zzIRPSU+Ys49ymHKCKCgFPFBEnlJKbh+oljAy8Um0EO2I2B0ueJT?=
 =?us-ascii?Q?RgW10kWl+7gQ//T4lcDA2se3j7xZ1jLdXYLxu8sVNPbC6vCZJNfqssNKJfL6?=
 =?us-ascii?Q?vQti6agTMSfNLA2NUYMsAXF8HJs3IfLe+PNbWMXNtEBdCmpZyTbNguItuteI?=
 =?us-ascii?Q?jacFIa/24psA1YdRmhlbPn5bfEh9KiqNyVzaVqSTY6EV3s1C0M3fWDtD1Kw4?=
 =?us-ascii?Q?A5oWY7dNFIKUxTnZ26CIacpj2b63DsYRu5CKyuvJQv8xwLH7LOhaSTqh7Mo/?=
 =?us-ascii?Q?c3PC2LCEXAC0TvySMZ0LF7aQBJvxOSx1mB3gDT529RnQmy/ciGReuYLK+8AM?=
 =?us-ascii?Q?QVcYml2vddx6XnJPsHCXIpcuVyMmlemLu90t+qB7?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 964af8ed-a974-474a-49b5-08dd27e25610
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2024 08:25:21.8896
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fe79KQmpNt7OY8oztbz5cpTdWjyNqqejEUNB2bB5onhY2Yz2SE1DLpsKlpeZD8QxZL2nvuDq8KjmabW+026UEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB8064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241229_002537_101185_9CA6CA67 
X-CRM114-Status: GOOD (  13.92  )
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

On Sat, Dec 28, 2024 at 11:10:46AM +0100, Alexandre Belloni wrote:
>On 28/12/2024 09:14:36+0800, Peng Fan (OSS) wrote:
>> This was a retry to address [1][2], to let common code handle
>> dev_pm_clear_wake_irq. Then no need to call dev_pm_clear_wake_irq
>> in each driver.remove() hook and error handling path.
>> 
>> In this patchset, I include input and rtc patches to show the usage
>> to avoid that introducing an API without users. There are still
>> other places using dev_pm_clear_wake_irq. If this patchset is
>> good for you, I could start to clean up other drivers such as mmc and
>> etc.
>> 
>> [1] https://lore.kernel.org/all/20241111092131.1693319-1-peng.fan@oss.nxp.com/
>> [2] https://lore.kernel.org/all/ZymxvLMkkktRoCXZ@google.com/
>
>It seems your patchset depends on devm_device_init_wakeup which did not
>make it yet.

The devm_device_init_wakeup patch in linux-next/master

commit b317268368546d6401af788648668f82e3ba1bd3
Author: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Date:   Wed Dec 18 13:09:35 2024 +0900

    PM: wakeup: implement devm_device_init_wakeup() helper

    Some drivers that enable device wakeup fail to properly disable it
    during their cleanup, which results in a memory leak.

    To address this, introduce devm_device_init_wakeup(), a managed variant
    of device_init_wakeup(dev, true).

    With this managed helper, wakeup functionality will be automatically
    disabled when the device is released, ensuring a more reliable cleanup
    process.

    This need for this addition arose during a previous discussion [1].

    Link: https://lore.kernel.org/linux-rtc/20241212100403.3799667-1-joe@pf.is.s.u-tokyo.ac.jp/ [1]
    Suggested-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
    Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
    Link: https://patch.msgid.link/20241218040935.1921416-1-joe@pf.is.s.u-tokyo.ac.jp
    Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

Thanks,
Peng.

>
>> 
>> Signed-off-by: Peng Fan <peng.fan@nxp.com>
>> ---
>> Peng Fan (12):
>>       PM: sleep: wakeirq: Introduce device-managed variant of dev_pm_set_wake_irq
>>       input: keyboard: ep93xx_keypad: Use devm_pm_set_wake_irq
>>       input: keyboard: omap4_keypad: Use devm_pm_set_wake_irq
>>       input: misc: nxp-bbnsm-pwrkey: Use resource managed API to simplify code
>>       input: touchscreen: ti_am335x_tsc: Use resource managed API to simplify code
>>       rtc: stm32: Use resource managed API to simplify code
>>       rtc: nxp-bbnsm: Use resource managed API to simplify code
>>       rtc: ds1343: Use devm_pm_set_wake_irq
>>       rtc: pm8xxx: Use devm_pm_set_wake_irq
>>       rtc: ab8500: Use resource managed API to simplify code
>>       rtc: mpfs: Use devm_pm_set_wake_irq
>>       rtc: pl031: Use resource managed API to simplify code
>> 
>>  drivers/base/power/wakeirq.c              | 25 ++++++++++++++++++
>>  drivers/input/keyboard/ep93xx_keypad.c    |  8 +-----
>>  drivers/input/keyboard/omap4-keypad.c     |  8 +-----
>>  drivers/input/misc/nxp-bbnsm-pwrkey.c     | 15 ++++-------
>>  drivers/input/touchscreen/ti_am335x_tsc.c | 43 ++++++++++---------------------
>>  drivers/rtc/rtc-ab8500.c                  | 11 ++------
>>  drivers/rtc/rtc-ds1343.c                  |  8 +-----
>>  drivers/rtc/rtc-mpfs.c                    |  8 +-----
>>  drivers/rtc/rtc-nxp-bbnsm.c               | 29 +++++++--------------
>>  drivers/rtc/rtc-pl031.c                   |  6 ++---
>>  drivers/rtc/rtc-pm8xxx.c                  | 12 +--------
>>  drivers/rtc/rtc-stm32.c                   | 10 ++-----
>>  include/linux/pm_wakeirq.h                |  6 +++++
>>  13 files changed, 70 insertions(+), 119 deletions(-)
>> ---
>> base-commit: 8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
>> change-id: 20241227-wake_irq-b68d604dd902
>> 
>> Best regards,
>> -- 
>> Peng Fan <peng.fan@nxp.com>
>> 
>
>-- 
>Alexandre Belloni, co-owner and COO, Bootlin
>Embedded Linux and Kernel engineering
>https://bootlin.com

