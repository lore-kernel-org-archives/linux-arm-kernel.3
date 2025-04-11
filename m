Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 846C2C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 15:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mzh0EVKhcbat8LcQpFsLp50tI8/w1NSgEhc/jFwx36o=; b=mSBmVgLKGoMAUT9Hdn0AMyO0u5
	jsYygVNOY8YNFwXh1WBLI4y4cEBJzv6C9ad75n+JhgrDiuXnKMgB4uxF9gYifGi8K721bcavFxT37
	YYa+Ku5PYulLNnGokyF22PZNuUFs5XZ40TRCy+TIJiuxeWAY+Cnpsl3w9+PRY792xx0T7loOWsPzW
	qByKXDRF2c1rhtj+tEZ+LSmF/Eq4u2wpbMggLA4h6UCuGCaxaFbX7D7//4WTBNQYw/JyZwsoP7fDX
	IyBH4hVFKtKjKPerX5ezN/UO4Rf55ZyXnHIqX3WKhAJ0VkjcApqZ9nn/eAECQhszd2DMgmg+yM7cQ
	8u5Dv7ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3Fsi-0000000EB7G-07d0;
	Fri, 11 Apr 2025 15:01:24 +0000
Received: from mail-am0eur02on20601.outbound.protection.outlook.com ([2a01:111:f403:2606::601] helo=EUR02-AM0-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3FX8-0000000E7gb-2Zz3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 14:39:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U2RCoZJeXU/+ALIbiqpFe1IX5va9jaTU2AcqD79z3eOCfAZ1flyNJ8NMuj1La2vc/hhGEKzA7roHiXbsz+dsNo9PXGicsyu7DoWSlkqlT3zUUEQPkoUHSMygWWs5zO8w1ynxJ30+mtga9Kveg2e7xrbGw9cPIa4PXzSInxUqzWhX3UnbMpKxwmlJC4oYJw9wm6zZcDlYO/F3isMHS4O7leOgsLyxF+mmxXX2lEZvPXH2wrMU/pcJbd2a8wrlBakkqpepTxLm+qTjai1naCxLEHKkP6FCwl5ACe5rNLx5ozvvGXtWBa3OWfu4zYMw7pdrgFVb+Ei0+s4oQdfgcw07dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mzh0EVKhcbat8LcQpFsLp50tI8/w1NSgEhc/jFwx36o=;
 b=WJJYJ7uOv/GofZ99hhwjIJsoPo3dZfHe8vcIyexbonq1OeLlHfKGn9I33mNpGAmDib5m19unXMTogY77w/v5DiynmdYO1EdiAPO72s4iQjT33Y1MfCSzbnjllBSsR98SAbJ/cave49kN/RYOUWRDLZik2DlQFTFt1nUZSTyjPa6K6N+NH4dJzuz1qeBgxfj56n3+9VDvdlgoTTc3xnecmTuhmQYK8Q0J6rLAl8XyETxkef/76J4e3szhO59aauzAe1U/xu7jzsiG+es4N8ZXKF8GhIc1UEfUS2p9/TboRrvoeKVaYEAeWl1vjRrfMB+6YDern3nNlAK/SZC7MwsE3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mzh0EVKhcbat8LcQpFsLp50tI8/w1NSgEhc/jFwx36o=;
 b=Sam0pGoer0OL0wmHNBbx7WDGlQf7NCPq+2aqoejHtrz/oc1B3O7sX1odhD0Rn9yyWbjTCplDSPix2kWtc0nUYsIW1BktlN2uzwlupehbEQSyrL2FACT7GD+D3wOkYk2VRJ9d/XHyQ+z1RqH9KRAQZWb7/FPdNr5epQq/ZXevQCnqkI8YPaHzdmdIMNrK2AbE5bRtHDycV8Vkg7/o3Nku3JjcricCrtPhLK5D48yHNMxK6GmGzIgX53FX2/BC4S16A+X5MLjWv2aCniqbNeeE/eYYQdltMsxipLSq6/KFxTbLxGhlMlRPXr6rjo0Ttk+zFFSQpNulTkZuZkZZ2hVQ9w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by PA1PR04MB10228.eurprd04.prod.outlook.com (2603:10a6:102:454::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Fri, 11 Apr
 2025 14:39:03 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%4]) with mapi id 15.20.8606.033; Fri, 11 Apr 2025
 14:39:03 +0000
Date: Fri, 11 Apr 2025 10:38:55 -0400
From: Frank Li <Frank.li@nxp.com>
To: ming.qian@oss.nxp.com
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
	mirela.rabulea@oss.nxp.com, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	xiahong.bao@nxp.com, eagle.zhou@nxp.com, linux-imx@nxp.com,
	imx@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 4/4] media: imx-jpeg: Check decoding is ongoing for
 motion-jpeg
Message-ID: <Z/kpf30xQppEzbNH@lizhi-Precision-Tower-5810>
References: <20250411074347.809-1-ming.qian@oss.nxp.com>
 <20250411074347.809-5-ming.qian@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250411074347.809-5-ming.qian@oss.nxp.com>
X-ClientProxiedBy: PH7PR17CA0063.namprd17.prod.outlook.com
 (2603:10b6:510:325::27) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|PA1PR04MB10228:EE_
X-MS-Office365-Filtering-Correlation-Id: fbb26194-029f-46f6-fe85-08dd79069a94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UNbXE8hzbajqzlhEXWArXyUub/zq1wTUMm3QhOoZanR4dVQVSrZ5Ye2pvVs5?=
 =?us-ascii?Q?dX501sgpxuZ48A9sSfNAtC2UuElwD7MYLijt34gFmYrU6ZCrYGvqyZO8s24l?=
 =?us-ascii?Q?I5xG/rT89Qqav/Crtt+R+YNnY8rVOXgE1IHVb8+l0UJuVBZxxUuUQqVmzW3O?=
 =?us-ascii?Q?4roL8JQWVT7z/BIEJLgrDPN1PPXA1yELW8de6X1ocGN+kNMbQ2lVTRq5RKLv?=
 =?us-ascii?Q?4yQLqs27Y9yDO1pgWem1rc7iL/SrBNVQ8vz7moQdSlMfAC21stg/JzwZ+jZJ?=
 =?us-ascii?Q?y1TqFf2zqTEaqypD38DswPDX3asvBauyNpZ+9c0O3WVZvA9pSjNBWz4viyzd?=
 =?us-ascii?Q?wlcE9HlIOUUAAzGBSYKfodHHjo/P9qRlK91sDF4b4tyCP6G04bCE1hqfTmRR?=
 =?us-ascii?Q?AMhB+vvZFgQl1bt8ZIks5jI7C2eJGtLPHOcII4HF7mo18rqlf80VwKFvmqqS?=
 =?us-ascii?Q?K8tPMYOk/Yff8og5WkM1YZJuWzP/a3M50lOO5sdfVGn9NY/8lrhPoi0bQFdr?=
 =?us-ascii?Q?E0PxL+oBeOZ+2uuIuaxV1ixJlayErdIoqZXeTj83Hs683en8kOFg38kEpR7N?=
 =?us-ascii?Q?LW1rNh+6nSG7MEg5rHYFfKEjh7TjHpgFtPRP7k1/i2DA7eqfMfM9CYbygWPK?=
 =?us-ascii?Q?fAHk4BVvo+Oj3VDCdAF0GmZvLO/iiUn9E1EY0qS4yaeB3zJbup+WcR8axept?=
 =?us-ascii?Q?OlRrGK7XRbHNiXLkhvB64/WPAVYN74nq83tiFxhV33kpvaewOXVoFWKP2Nsg?=
 =?us-ascii?Q?fCPyS8ywE3ahVhY0g2/xqhPigV1GU7ktGPgrvZbNxsRv4aT0JQaL/WtWzmMs?=
 =?us-ascii?Q?CNl7Nhib++TOsTZqLojNtkXvbGuC5982WOD1jKdh1LAwGIVa8FJKv6Miy4kz?=
 =?us-ascii?Q?vMPX8sgQ+qIm5mpeLSm/h5uBqqWQu+mIkxbupl2mt6a+kUiZHP50IaIT3tE4?=
 =?us-ascii?Q?mL59yBLIzjz7VjUM53fGmtidXmMlmW3/c0rLp6AlILt4tBkJfyX/EKvEimkZ?=
 =?us-ascii?Q?XAphQnTY91c71cmCt0cHP0RXfoSNwcvMXFCE/ofrfIRYik8vZQr9PnbeFixp?=
 =?us-ascii?Q?Pvm3hKAwkboqacB7dgal2L7XCN/NweaG77H/4wcu/aNrB1is8FW4WvLB7Djz?=
 =?us-ascii?Q?9x5/nSpimv1U2pTGbDvgV6C4dpfdWOOYYk2lI6Kl75/KsYz5dtWW5bLSVWM5?=
 =?us-ascii?Q?Yfl8abF0j/hCgKg/Ap+fcqPmP1av3PzleQkG1dSQdZSqEO99xR7zVvyNluWX?=
 =?us-ascii?Q?uJzRK3FGoMGeZp5VkGRQ+0MGM/5IfnkyFJN7Z5PENpNHUzFuu5zPZlhaQfVt?=
 =?us-ascii?Q?1Er5G0E+lS/ZRzG78Lr52e6E4VtfzU0bcQ0H3im4Oi2VBH2Zft6B43ALjhce?=
 =?us-ascii?Q?kVflBjKJgViOFzHy3Gh3P/c90FXjTeU7RQaz0pi4n55+BHdbSHkHQo1pwo5k?=
 =?us-ascii?Q?n8fkQP0z7xGP5+7paiVE9XSSi+3A6b0tijbPvvxTnaVDfUt94N1gjJlYP1Vy?=
 =?us-ascii?Q?juXrwDfmI27O5SE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?02asZeo9ekyK83XK08ZtUpqndtgfOFEdlGpTDJVg4qVedSXk9OucF6g+6EGb?=
 =?us-ascii?Q?WaTHxX9tJCLvTApJdH0E24wNIcUmylfrIJBx+oIyOc9Oxo5hcN5Rw9kTrVBU?=
 =?us-ascii?Q?tBbAZ6NebNF0KyD7sNbh8qEPUpvH9SHSkFtdaKOMsmH5aQBwlhHgqaNylhw2?=
 =?us-ascii?Q?07UckloCLvQS+n/JJAifMC/lmNr3LNXgjdRrWm5tqihYG+Nn/AgEJUWdRY3z?=
 =?us-ascii?Q?qkjvLcSUU3jm6VYO+8CgzV/k5nsXbaEPhz+wwIQsMxHY8Da9sd8+FDZSJKNb?=
 =?us-ascii?Q?3gGkIkfO27rKmAr+L7kWbCfJGNUdPJVt+bfz7tXbgV4ZZy70qr0TCWoXwx2v?=
 =?us-ascii?Q?SU33JUU9hD0HXwZLNGbL1UdhDwngbVpQ74ZUMNQ05a0SKzAr4mUCvD2rt+hn?=
 =?us-ascii?Q?0MiqH6yImpfRPLfLm+YLhWGP+Kk3oErupzCf7l4DohTqV9SyChPE9wlVk2O7?=
 =?us-ascii?Q?DvDugUkrbfuBVjSyLrLKopRSeZ6qpOcvRf3a9pNn55+qaGeU99x5Oad1fmDu?=
 =?us-ascii?Q?1RMyrb7mofw5Gj45Yt4HSCCSI0AT0izgSLFbk4Sv3xvRXFyQKKoAzSM74J8O?=
 =?us-ascii?Q?oK+2+XK/2S7e9FI+H6lLfG4Ty3PWgqjZRgcRxvMFWJ1NbUiYZvE5JNn9ZezT?=
 =?us-ascii?Q?tyYG4cjqdhXHWwH+GMKGbwb5uZRgjxIAWrMEZS80leTvI0736APj5jGCZADu?=
 =?us-ascii?Q?ptCjQaGHXO0+ww4AJsiZ6d/rWJDXAYP3tKxZOv8OnQVM5vwwPi8c/oOtMiCA?=
 =?us-ascii?Q?rl+nzMxZtRPRiaguSCpRRrNNsRtQ9Yd+NXUpaUZ8YwGLvuO33z5LQVyDcaIe?=
 =?us-ascii?Q?2hGzDGd4zsX03I8rOmKCL6t6ONoISYXbUxaN/+F+7b7w31vqZOZxS7JMjtjc?=
 =?us-ascii?Q?/4sG3B8kVTJfJqO+hkBvFsPK4rsOLiPcY7qXoMPdWgvyXGNAG7PAxrWNyj6B?=
 =?us-ascii?Q?Tk+EXJCjShDR4PdIqEOoUEb4qAypw8TnjOj69M+UcCayVaFcBkwECdQ03ChP?=
 =?us-ascii?Q?I1r7sIDBftvp569A2qSXNn7lHNsVHp1Px1ytW8+kuxPWm/2OHNA5ClIdVMBJ?=
 =?us-ascii?Q?UgRx3+Esl+/rD4AIssX0SjQk9ytHOrB4ESj3vMQKNQUY7by+erDjV8vnCDVy?=
 =?us-ascii?Q?99/Z/3zvBgVxJ7O7kX1hssAcC82fYwm0aJ9qxoKhS0nY1pv05tMnqzEfSxOY?=
 =?us-ascii?Q?tXd5iBJUMt0m4RZv0sABdv9VB9hQ7tZFyq1WfMOx8p+KP2viCggaAZPjjwhj?=
 =?us-ascii?Q?qxNYo8IUdiIsMN2ShIfbfFCNWu1fhESgi9vpeNHSEIJoKBCS5O0vLr1XeFCz?=
 =?us-ascii?Q?tmdlt9RuxqLZzZxWKh0zQri4ovJOb9wbMGuvQZf1VYNVDyB1eSeMlzHoi0II?=
 =?us-ascii?Q?F8a3VR4iEw1WAvVuUgoTMS+anxixKEDEswpp7Su+7nXRft6GACP0zfC1X4WF?=
 =?us-ascii?Q?rc9SllX2rmB1FkW+30Fm7sZZmOp3k2yWTN5Ql73diq/eA/ok0IgoVqsP+zlG?=
 =?us-ascii?Q?Vd9O/HMKKy07uxcSJOFy605m0TKljNjeaHSp7pbvQNMP3AeWW6MC+UJ9PNC1?=
 =?us-ascii?Q?exrZnD/snpKWmlrqykrxeBQcYu6TB9CPq+TfxGJa?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbb26194-029f-46f6-fe85-08dd79069a94
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 14:39:02.9762
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MEL4wC8otjVGaMlpPBvdv5vB6FrZ8urND9Evw5mpdTiV0b0VhhjQmPwq0ci3FERONcfv+R2l3woCMOgLRCAZOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10228
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_073906_656713_C6600A4F 
X-CRM114-Status: GOOD (  36.76  )
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

On Fri, Apr 11, 2025 at 03:43:43PM +0800, ming.qian@oss.nxp.com wrote:
> From: Ming Qian <ming.qian@oss.nxp.com>
>
> As the first frame in "repeat-mode" is the pattern, the pattern done
> interrupt is ignored by the driver. With small resolution bitstreams,
> the interrupts might fire too quickly and hardware combine two irqs to
> once because irq handle have latency. Thus the driver might miss the
> frame decode done interrupt from the first actual frame.
>
> In order to avoid the driver wait for the frame done interrupt that has
> been combined to the pattern done interrupt and been ignored, driver
> will check the curr_desc and slot_status registers to figure out if the
> decoding of actual frame is finished or not.
>
> Firstly we check the curr_desc register,
> - if it is still pointing to the pattern descriptor, the second actual
> frame is not started, we can wait for its frame-done interrupt.
> - if the curr_desc has pointed to the frame descriptor, then we check the
> ongoing bit of slot_status register.
> - if the ongoing bit is set to 1, the decoding of the actual frame is not
> finished, we can wait for its frame-done interrupt.
> - if the ongoing bit is set to 0, the decoding of the actual frame is
> finished, we can't wait for the second interrupt, but mark it as done.
>
> But there is still a small problem, that the curr_desc and slot_status
> registers are not synchronous. curr_desc is updated when the
> next_descpt_ptr is loaded, but the ongoing bit of slot_status is set
> after the 32 bytes descriptor is loaded, there will be a short time
> interval in between, which may cause fake false. Consider read register
> is quite slow compared with IP read 32byte from memory, read twice
> slot_status can avoid this situation.
>
> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  .../media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h |  1 +
>  .../media/platform/nxp/imx-jpeg/mxc-jpeg.c    | 31 ++++++++++++++++++-
>  2 files changed, 31 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h
> index d579c804b047..adb93e977be9 100644
> --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h
> +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h
> @@ -89,6 +89,7 @@
>  /* SLOT_STATUS fields for slots 0..3 */
>  #define SLOT_STATUS_FRMDONE			(0x1 << 3)
>  #define SLOT_STATUS_ENC_CONFIG_ERR		(0x1 << 8)
> +#define SLOT_STATUS_ONGOING			(0x1 << 31)
>
>  /* SLOT_IRQ_EN fields TBD */
>
> diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> index 45705c606769..4346dcdc9697 100644
> --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> @@ -910,6 +910,34 @@ static u32 mxc_jpeg_get_plane_size(struct mxc_jpeg_q_data *q_data, u32 plane_no)
>  	return size;
>  }
>
> +static bool mxc_dec_is_ongoing(struct mxc_jpeg_ctx *ctx)
> +{
> +	struct mxc_jpeg_dev *jpeg = ctx->mxc_jpeg;
> +	u32 curr_desc;
> +	u32 slot_status;
> +
> +	curr_desc = readl(jpeg->base_reg + MXC_SLOT_OFFSET(ctx->slot, SLOT_CUR_DESCPT_PTR));
> +	if (curr_desc == jpeg->slot_data.cfg_desc_handle)
> +		return true;
> +
> +	slot_status = readl(jpeg->base_reg + MXC_SLOT_OFFSET(ctx->slot, SLOT_STATUS));
> +	if (slot_status & SLOT_STATUS_ONGOING)
> +		return true;
> +
> +	/*
> +	 * The curr_desc register is updated when next_descpt_ptr is loaded,
> +	 * the ongoing bit of slot_status is set when the 32 bytes descriptor is loaded.
> +	 * So there will be a short time interval in between, which may cause fake false.
> +	 * Consider read register is quite slow compared with IP read 32byte from memory,
> +	 * read twice slot_status can avoid this situation.
> +	 */
> +	slot_status = readl(jpeg->base_reg + MXC_SLOT_OFFSET(ctx->slot, SLOT_STATUS));
> +	if (slot_status & SLOT_STATUS_ONGOING)
> +		return true;
> +
> +	return false;
> +}
> +
>  static irqreturn_t mxc_jpeg_dec_irq(int irq, void *priv)
>  {
>  	struct mxc_jpeg_dev *jpeg = priv;
> @@ -979,7 +1007,8 @@ static irqreturn_t mxc_jpeg_dec_irq(int irq, void *priv)
>  		mxc_jpeg_enc_mode_go(dev, reg, mxc_jpeg_is_extended_sequential(q_data->fmt));
>  		goto job_unlock;
>  	}
> -	if (jpeg->mode == MXC_JPEG_DECODE && jpeg_src_buf->dht_needed) {
> +	if (jpeg->mode == MXC_JPEG_DECODE && jpeg_src_buf->dht_needed &&
> +	    mxc_dec_is_ongoing(ctx)) {
>  		jpeg_src_buf->dht_needed = false;
>  		dev_dbg(dev, "Decoder DHT cfg finished. Start decoding...\n");
>  		goto job_unlock;
> --
> 2.43.0-rc1
>

