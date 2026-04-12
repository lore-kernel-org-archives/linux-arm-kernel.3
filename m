Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FDC9F3ED4A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Apr 2026 00:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RvUXYGiZdTF6tL4lZok2ZYLxcZz++STExWzVVuKb/3c=; b=JI2qm7Oqny3noQRy5wija6+sFU
	wCPV5fD0CEQdkCYc14vH5QukCfTMqrm/sJ8zqg3v4zDpGqTlCkgk4LkUoj7SOC1taIFPUFsQ/fPFv
	uJdFa+cS3fpq8qHvrrUh9YZvMjts9n0oyTsQ3YXca+LjGd7afFgBmVOSS46gjvDMl6Zps0KaxbFaM
	DpkpMIjaCIYg5C+VQ1c0v6ID71K/RzUxEXeo+y639jC/9s2HEfiyI6aSi9AIo/CXLCDLVqznMTndM
	wlHlroYWrgVLyei9WJI6Yq7nVkaYb8NMEo8H5dIy4dFpZzbnZ/ZRgUCg2An6j1dVpO+8Pu4sI+lz/
	93SkZslg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBjAP-0000000Dw0Q-202p;
	Sun, 12 Apr 2026 00:59:13 +0000
Received: from mail-westeuropeazon11010055.outbound.protection.outlook.com ([52.101.69.55] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBjAM-0000000Dw04-0m8e
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Apr 2026 00:59:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ekOKzSapgr3qnVP8nYwXNrgg0/lh/7oX6ngfyb9McwPSkHxoyTMPiXW+IqSLJiUdk2k02nB/0gbNr4Zie0+vdDE59X2xLSg/xNlhjorDOg7a6JyGW+FcwaSG8ljzFrWSBoZ12CDL9uxEx/SfYbdDiwutkR5Pjc3C9crrgwsax/y0xFb0wqDO6h8d2RH7grzj66dj7GP6f3ouaCBfaodqJozqTSbNb5no7gJ+C5k0CS1gZpN4gt0ZraUu1AeiL3C6KTxRc3N516W0E/Nz6urKUnFkSaJWvnQC+M8ZwYc4ZUnI6nYJmCpxPWj3VRtgUlY5/1VAAkHDtZIKEsDsRLo2XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RvUXYGiZdTF6tL4lZok2ZYLxcZz++STExWzVVuKb/3c=;
 b=ci0ECn9KSkT4rAI79IUho2o1iO4S4Lr1pa0QWYWqYwm7CwZ3F4mnfeFYpNTenw/I2sLTLthzZxSvG69LfsCRK03qKHq+AwHsY192c23JFgI+K/MwW87y/2NA0vSZYjjZteer5LVBsdsF1EL4xb7tlAptQ8NvrSBr1APdqi4eTq2P3HcxFI3ff0qANr+R+1Ef4ScKquRC8rWLwqhjCyxkl0cYyZn7tGESuRWi6kaPI4xp3SRd1lHL0nXjT3YgIB9W/w9Acfdsk80nyVFdCsQrn2V4CO4Zdxace9dzc7F/nTSHPy/8RW1nMMJklqbI1gwV0/et2rOXe55jguGPSkgrOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RvUXYGiZdTF6tL4lZok2ZYLxcZz++STExWzVVuKb/3c=;
 b=X58HiEfEpY7ZHsKhSbAkVavRhykPbuT4sAAO0qUHjWabiclDQPhPaj1ueh9QIB6hDa3PhN5dhvFJbg4a9DFWhfCbMSn8WRib+34+5wU3TeYLNfsRH7tXkLGwUcMYxG3Huz7fz6iZW7UioIF2KF5iLmjVCc6zk0SIbNriXZQX/VJodIanheYC9G8+zMTcXr94/RLKJEOROsAMZ2R8QsFIUieT365Yr4r+IFijRtUTdzw/uIOD4fv3jJgaEqrY3LZtIiKZ5LanYgF7F63jssn+fXV0am3Hl7gQ6RzXnAfgWY6QJRvDYEtLwaL0SUgxO9Xg14VGFOAU6PS0CsmMsbAGWQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PAWPR04MB10032.eurprd04.prod.outlook.com (2603:10a6:102:38d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.44; Sun, 12 Apr
 2026 00:59:03 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9769.044; Sun, 12 Apr 2026
 00:59:02 +0000
Date: Sat, 11 Apr 2026 20:58:55 -0400
From: Frank Li <Frank.li@nxp.com>
To: Felix Gu <ustc.gu@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>, linux-pm@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] thermal/drivers/imx: Fix thermal zone leak on probe
 error path
Message-ID: <adruT5fgNSZ_VOLr@lizhi-Precision-Tower-5810>
References: <20260412-imx-v1-0-cc3b45d63811@gmail.com>
 <20260412-imx-v1-1-cc3b45d63811@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260412-imx-v1-1-cc3b45d63811@gmail.com>
X-ClientProxiedBy: SA1P222CA0123.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c5::10) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PAWPR04MB10032:EE_
X-MS-Office365-Filtering-Correlation-Id: 99a56d1d-b2ba-4b21-fbf9-08de982eb04c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|19092799006|7416014|376014|1800799024|366016|56012099003|22082099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info: sIXv4IRbCBuNoTjaDTwIjGPLOw/Hd4OSzrm3/wJqGGiQWjYb3vwFCDhC/+U5TkGIBA/KWd2DzrhsFKbMus3NUlib/DVIDcyO0RE+0+es351QIwwxpZxS5OC4reBnAnVJ2rUi51xDhEvmhWgRpa4QSef8sqyn3yBU/hJhyAufPtyM2yZNymlQ13fY0wK2Aqu0bzl82y3zvohQHaq5VNgw3zVbr9nB05RlyYGi6kRkoFOhsURUoB6i5ErGmh0Ie+r1myou4cqSTnF00SoE4anQsivHwJPJUiN74o4PTsaSvUbFzzr1eTxKoFB/VPrlTTWr4jrJOzwnh5hwKTbsMHtQItuJOfZx9pq3AhV6rNZ3eyIrMj+Jto03zVF3UBaaYISC+68pUSLWyYSXHMS0D+xQdmw2Ud6kRiiIRayjyuDSmdgfpPdpBcgdLL9DLaOnHYvlOykuiar4VgUePwA9I09RKGk9un926VOVEWvI3qeVZrC6GOWmHGz4KScL7SiEIZ7VgdCjfqeOMcgFC6M0eXAegHWA35CEYMb9KMxxOOWUIBBpI9AGvGJt2D5hzy5UuColEMqCp9fpzltcmbultthid1Ct3t99ymsD14zLioKeDzvieWgHGF2ho02b9v+UfRQ92sX+Ph0Fuj5r0Uji7Bcbc6fRuKaS87801+dNgP76f+jLWPC9LlmfhadUUZNJnxbzxI+pwoFIALFfRQPg5m8c0uh21qmReB44DlY7HtgIavblyiBGt+hPYAbzA5sj4WCgd/rfXX6m5K3Crs4CH6Ufh6GDhuH9VdbN1s2PHlVZ75g=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(19092799006)(7416014)(376014)(1800799024)(366016)(56012099003)(22082099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QF7dQK/844cZDJEMd0fJ7GS6Zg164l1Qju+AYqPCJ05UJRDPsuDgnCsGyfFD?=
 =?us-ascii?Q?/sU/6gkRhs5UwbiTw5rIaawkcKi5MbFiCgHUm8BUYxtpPpK2RXWb59/mJ5vP?=
 =?us-ascii?Q?zURLACNqOCCxlIuWGdTzNQaFNvbrUUF8c//IyExebTfBu13S7exoxyRqL7fq?=
 =?us-ascii?Q?rc6/+cxLUwdQ6K2k/1BG1u6mX++OaOTn+WS3PCmloa8UnkzfrGSUydUUeV1L?=
 =?us-ascii?Q?+LEwTNzK3hpe0XpaNoCbEjPcT7Op3w92wAnW/DE4uu+Q+g53feOay/IF6cCR?=
 =?us-ascii?Q?YKuexD/P/yla2K0yVvgrQ0q/egjz4g05Ad6cy7FMijTztjbRGqlWfPNBFysC?=
 =?us-ascii?Q?3sb31sUtifOlvLj4/BGcfST6Oopcg6ix0o576EU2z5Tof/wOamN3flwyGkoW?=
 =?us-ascii?Q?oG+MjDCOcf7P9a/4Y9ejSOwFz/c0fqJycU4gvC8APtyH0pXgsUIqZDUDs8Dr?=
 =?us-ascii?Q?2d/RRr2HD1WBCb6WtIu31UXdc0bw7lcJu6rbOCSf7aNphyrDKnLBD4vIEe1j?=
 =?us-ascii?Q?noFNwYCs96OsyFcXbb22UJ6C7YMCHkqDZULeuo0iL/gl6yv6tcJIcl9gZOGM?=
 =?us-ascii?Q?+wcHowRseA3mRJ6PfeiGdup9MtJzhfMOvYMduhBdH8Lj4yD34aenXFVY6+H+?=
 =?us-ascii?Q?LVmauSpBkTBQ2kVM9p2eVn1nSshJDPiukrcQhxFA0BUTj/YquQVGHSyoH7Ux?=
 =?us-ascii?Q?fusYt1PoMotgYbRNEdv6JfG8vV3swcfybIIWEGNETw00DYIfxT5CilQidQtO?=
 =?us-ascii?Q?VAcr2cHXq+j6ioS2ngbuYxGgkr6B2WJ8hed09oJGNEXAWKssv2LZO1D8Sroz?=
 =?us-ascii?Q?Olv48M0r86mwC3hNXfal6kpqzGX8ofU73HbLP6kznVg4GVcDM+9e5UMQoLAT?=
 =?us-ascii?Q?CUNa/MJs+6f4hv86n+CHmpgKH05VAZld2TIBzNROdO/iLtTjkP5AB4RKtvJc?=
 =?us-ascii?Q?hMyFfdT64HGUhQxJau7AYByzP2lLPhIOTvNZIod6KpsCCzp8f++TR3Ne5GMH?=
 =?us-ascii?Q?dErh3+n2QujXS+vlSPb9Fgi9xSJSLale2gK8b9JFdOZI8MJX3F3u7PzQLJi9?=
 =?us-ascii?Q?o2euGp0sRdC84PmJiWzWRuudCebj8vrCOy1P+Zv9+FmK1Xzs7yEVXxI6JXAJ?=
 =?us-ascii?Q?lhvJX94AsDamimsWk1cKzhD/P1bw6rSPUdxSMtbBAIgLWwwLVoG03D6EBfo6?=
 =?us-ascii?Q?4m73Ir7s5La4LxqWxdh2hiAcj+BLc7lgAcEnzxcblnTymIxeG7XtPPNzeeyQ?=
 =?us-ascii?Q?xvF5UFlooxFoW8mBTubiYWP9fhXabZDn9hJL4ZdWxs0gk/Lz0cP5G7NsMsPR?=
 =?us-ascii?Q?ZI13HuWMp9W5/HrDB1F4BedDBi0wVcVZBAkdhz+yh9tjQxja4F80lv1aaVId?=
 =?us-ascii?Q?dnN0JTjpg2FA5J3BkRuHapIEL1Csvrkc0932QAnNlvdDfHsi9FsLgWLyeW2r?=
 =?us-ascii?Q?GA0GQ6XrsmCbKYMXEgCv55tgN1OxBE/+9ISPks7c+7qp7MgZVQ25Pg8/SErG?=
 =?us-ascii?Q?4ohQBb1S9meD2rsSci3OFdU1PkBt0wwowmQ7TE3svbCeeVRUMrOGi89f8077?=
 =?us-ascii?Q?0WXS0DR90YNE7Zitxs+SnTyeneWnOIXuzQcDThFPAJF4AnzQzKt+GF4reEEi?=
 =?us-ascii?Q?un22eMsm7j/O9oQQvOPhdGx2zaSkW7rbPdcMMTsMRVEq4IFUACntpoBsD/Ah?=
 =?us-ascii?Q?fAbjQJibTN1f/QeBUBEa1M2GDYMC1fLezr/DIqXfDNlhrkak?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99a56d1d-b2ba-4b21-fbf9-08de982eb04c
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2026 00:59:02.8483
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VaVEWSbxn85unn7WXuyi6HpLvlqxgxJm6Ul7UwWp9vWfVWSSMLnEqWWNyFXb8P6KDA3l597I+x6RmE9fj2Mpng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB10032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260411_175910_267019_895048F1 
X-CRM114-Status: UNSURE (   8.60  )
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

On Sun, Apr 12, 2026 at 03:03:03AM +0800, Felix Gu wrote:
> If pm_runtime_resume_and_get() fails after the thermal zone has been
> registered, the probe error path cleans up runtime PM but skips
> thermal_zone_device_unregister(), leaking the thermal zone device.
>
> Move thermal_zone_device_unregister() into disable_runtime_pm so all

Use devm_thermal_of_zone_register() to fix this problem

Frank

