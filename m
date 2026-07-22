Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0334C44539
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 09:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hf2IS+CP8tMX2kDLbSf6TUyUq7Y0om0XhZ/GUCr64e4=; b=H5w+fi+0xfgMqhUjWrUisM/fbO
	2l/rgHO0f6uuLnYMScncdAF8n0S29UuKXuNnRarH0mq2uen/H66CKqGdRxePO6hvh2UjaNQnf3nRJ
	kn+/BaJO5nrxrHJhAa3lU6pqL+qWxsziJpl9CoHJC45mRLPNTIMMQybCkyaPkALE9tLs1O8iRhAaN
	3heD7Fvg/XDl1jaJ4fSEZqq58ME00O0kyLSwYfsIJshs6u2Kh8PU1Kd3wgAP0z6g8SS1Sid+S5Qsy
	7B+Sq6Qh3Y4aNEAT2I11pQveHpNiJ+n+bH7nkRNBNkzirIKO+Zuo83zzbPs2vb31UjA5Auoyrgysu
	o5wiQBHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmT6n-0000000BNgq-2cNo;
	Wed, 22 Jul 2026 09:19:21 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmT6l-0000000BNfs-2w30;
	Wed, 22 Jul 2026 09:19:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QfhRzhVXjvYhMfxvCNCyb/xLf0W5VBxLvF+1JQyf7bp1cxESWKIbOlUWqIm/mCrxS+wzty7UiyL2E/Qd6+JuDhZxm2DCr6a8db9BHwCGmDV+0kit8oy1WgD3YIBDyG0zh7FRlSq+wkqBk8qyML+N7r+TDEkzG6whDYY0qr/QMTQqy7raySWnL3UNva7sQCWCmtOQjjXULw4wu3dt+Unk3O574o1dWMy/BAjut790Zo6KbqY4q353Zz39NEOaAtGgr6FRjyzYRA5/dp0s/hHfWLO9nK2QW9jIid75KWtPwmjhrmbUi6ly1IlfkU0t5cC5cCWRl09543PhgTv0AUZU2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hf2IS+CP8tMX2kDLbSf6TUyUq7Y0om0XhZ/GUCr64e4=;
 b=lBt4G1mIhOZKPE7+FUEQYhe80coxXsZ+RR+drRvEvY+Rwg38qkQva0VWgKsWUFKEzQUUD24My5r7wtBNVYn9k5SulxWzGC8lnH09tfZkwPULPwYzaXRzwyH4Ck82LbRIVv+FGJDczVzjU/AKE67VHO0nYIuH0QJSPmh5JWGso41IRqNCwa//+cRHaS8ja4VTNg8+rTOKD2Q2DwwPQKmLlQFO/ySIQoMNAugOHHyTvZvju8e/xMec4aOBaObMT259tuA4IWVH4VKIPZGTWCGGKiILt7aH1y0YLco2ufg12LK2E/56OEDivOAfnwNZabVdgyRwIW+H8jXE2nRmtJbgLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hf2IS+CP8tMX2kDLbSf6TUyUq7Y0om0XhZ/GUCr64e4=;
 b=OnP14ng/UB7pz9SNCCfs1Tm5WbHl215B9xZ63G6YBIKdkCFPvmmRiTCRdE+XBqvkv4AetYEJUf8vFfpWlanYToPL5Rw8G6Gt97pQh6bOgJ59YZeVXoZtvJID6+SLPhoV+O52QZgsalY6cGHmwLxhItGhFgBKENYjL5MlwZdftJ8UfX2PRzEBt2ZeL37Ctqx2MuRdaBhfwOq+dP+q553iyNVVKTj+hPnNRNN0ld91oCHl0EbihCLqfnZYvQYs/Top4/nXZ7EIB80XvqvpNxar1yxEyZOpIi7aG7R0JaANPm1/SZv/Nb3f9r1OHVgw90oGfSOCFQp7/lGT06BGAxsh6w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GVXPR04MB12290.eurprd04.prod.outlook.com
 (2603:10a6:150:319::13) by AM9PR04MB8384.eurprd04.prod.outlook.com
 (2603:10a6:20b:3e8::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 09:19:14 +0000
Received: from GVXPR04MB12290.eurprd04.prod.outlook.com
 ([fe80::1739:3404:2175:33dd]) by GVXPR04MB12290.eurprd04.prod.outlook.com
 ([fe80::1739:3404:2175:33dd%6]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 09:19:14 +0000
Date: Wed, 22 Jul 2026 12:19:10 +0300
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Tanjeff Moos <tanjeff.moos@westermo.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	Michael Walle <mwalle@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 phy-next 6/9] soc: fsl: guts: make fsl_soc_data
 available after fsl_guts_init()
Message-ID: <44vzj5ehxz6osrbddzwz642puwztrqtwoisznl2opuntrshjq2@xdc3nr73qiaa>
References: <20260721231603.67865-1-vladimir.oltean@nxp.com>
 <20260721231603.67865-7-vladimir.oltean@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721231603.67865-7-vladimir.oltean@nxp.com>
X-ClientProxiedBy: FR4P281CA0098.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cb::15) To GVXPR04MB12290.eurprd04.prod.outlook.com
 (2603:10a6:150:319::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12290:EE_|AM9PR04MB8384:EE_
X-MS-Office365-Filtering-Correlation-Id: 351b0eac-745b-4abf-4d15-08dee7d24c68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|7416014|366016|1800799024|19092799006|3023799007|11063799006|10067099003|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 3yQ4b6unqCMXuTxVgkmJXuXBOXHbxt6u67OlcWIF6h8nXGxT+IBp26CVc7We1gnC4EdIypUqalmalMkx0zrS1iMq2lb54lWeCLx1am77lNEtr3rZE6mtFVPU9OrUTrVQV5o7qI9m7jdN4Wsgy81zMUY1IFFRSFGI5kNCEkRDPGhleplOZuL9MpPmvPQoTTE0zJ09nxZzs4yFO6lExvKxAXVP6LWPR878y6oS5sudB9zZHYURRuR6ijyHDHUuFQC5V7DUzV7YMFcylY8lWwWjkaeYibb5BAIkaiVS17IS2aSUZFt5wCU3q9Mt5x7JMxFYN10A4ieOWlEBaIbynohkQF8Rx+8O+JQ+L2uba3Xpvy9Yg5OprZ8pBO5XVATMAL8NYNvdCWaO8Q8dQx6kuRQOfr5kAmczXnQnOjEdRraehxPccrGyI4ecNkHXiXxlpyxMKwJU1gPdCJMhalKy1GHWzefCLTRdZ4hXyFk7LREuWwVYlrL+/dFmRPaZUzT9y3AmtdKTCwlH/GldxzvR0fPrOrjgf80xqQkIDsZ1hcDzKYL6W99TthGAUj5+SIME2nQEUNdly/V6tCTocdsttHJZxWI5YZKHcM0iKAtUUOgBse7FhQ14RqXm4KGY0eT0yabRJWlcOCtXMd+RVOAwiU92LbPj9x7wvSaMqgl6N5B0FzE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12290.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(366016)(1800799024)(19092799006)(3023799007)(11063799006)(10067099003)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5ntmYLzMBoD/ATEsQjC4Sa5ro3dQjIOmWnA+RAUnsB9QpSFzmHPTdvh9ZvXm?=
 =?us-ascii?Q?smTNH/WVb3yGg/CK/i7kc6uKenouPyD108akngMvFbafjVy8iV/9Ng3KHgj9?=
 =?us-ascii?Q?QOeSebP10/irDQhAya6tKg6XQxJa11nYmD2UNnuQ9zfhTaGVjUUb+it1GQIR?=
 =?us-ascii?Q?SVWAkbpzJfD7SUMW/L+4L/Mug0HfzuEkaNMozWXBy3+MHTjClLxsmAX8SMj1?=
 =?us-ascii?Q?fO05rYcAKHfdoNUkEIV6F4K3laLh0x6+I++B81XXNBLghkfhagKScSaL+NBd?=
 =?us-ascii?Q?hKU5KBXjHmr1MT4ild4IkM8IXoD8ISI6xe9kKInEBAgO8uOJchMZ683zmn3N?=
 =?us-ascii?Q?m9tOoBxosWRzRli9OUX4+8yhTli9MkIjS494A0vi0HFAmPRcdbCbOeJGVPqt?=
 =?us-ascii?Q?xZZZND6MO0uo++FFFr1xyBPVmYz4TPcTVn7OhrgrfVgm2OzCR2Cf8l1GKzdc?=
 =?us-ascii?Q?J2EkSQuE8bR3N2yIWnvvQXpVNvYyMmBaR+/RwKq+MUkafF5GLh9D0aOVAXCQ?=
 =?us-ascii?Q?u6AaEL5PwE23K/AWoCfr136eeoe92dOnfvBorDtJmx8hupEWUqaAizxE40hb?=
 =?us-ascii?Q?UKBvC+4YnaCva+sFGMA5dQod9oJ/w44x0r68v9lW3xjD9d4LPsrZd8ZTDOwc?=
 =?us-ascii?Q?VOAX68ttJpIsn2YjnBVU2jQgeQW0baI9Z3V4Gqynn7o8ojFX2hlm7LD+acos?=
 =?us-ascii?Q?eh9YWk4n80g1PTdfXvfzAeDCviIk0k51v2D/hPPzyMNXUCmtPe+whPsR4SlT?=
 =?us-ascii?Q?2c8FOQ4e/+cmWk+2HC9EmLSY4e/AKGDHGmVAsphD8rlJ4RAv8+l8vUwnONJT?=
 =?us-ascii?Q?oNnhUGTvo99rGKA1WqsZ6ul6FRyZoEZkPiDQL9qTGH829gd89W4a5c1Xb9nZ?=
 =?us-ascii?Q?0tM6Unmmjk4qFi2Ye6bTEqOJ/gB4xrkp699/6tSPMJ2eogw5oMHHrUB/TmuD?=
 =?us-ascii?Q?zz1CY7jWDnWhn/JtCe8QcwLu+GIgEGe/KewEBn1ZrF9A2xZEOCC5zAClKOOX?=
 =?us-ascii?Q?dAGLmnR1b6vU83tv86mOvhY61NNHp3TXrbKHsF7FQLu8UInrt5ea5Cj9/EFN?=
 =?us-ascii?Q?pu6FaI7+uYUPn7Bq0EqBhtv0YlT3hqaEpwtrD7J/E72GwajrbB8hkIsNGwqQ?=
 =?us-ascii?Q?ny2D6VtcEd3seZuOVQvq5IS6T/2pzBnUuGKIVQer0bwmM9n1OKlBGSVPgm+q?=
 =?us-ascii?Q?80+6atXIoPt+ZfT/oC6fC6RkOYfyJuISKLyHXDIRpfCgAiGWmzXXoxgFeoO1?=
 =?us-ascii?Q?l/5VlAtYAPEZ/gDzUIueNtvzTLrCn3lppEhWkIMLPE0Zy8DI4IBQfiSkX3FL?=
 =?us-ascii?Q?5FQAhiItPXfbC4Rz1ZZeZ+x6p4bibeXGnfDs0lNwR8NHqTGucF/tnf2nob5Q?=
 =?us-ascii?Q?O4UktVa47cpz2o1317+lf9SVpvqAh+fLJc7xZPq/DoQ+0FpkuBHeJ/uKxwI8?=
 =?us-ascii?Q?ziZ+enDbx/Tr7poot0GqmSPIggqXAZzFUZFX9FXArPs4hWTNvVcREg2TAodl?=
 =?us-ascii?Q?99A7yQcBpNI9TPaiqYkT/qRQR5YL+M4Xg9Q3G+0z4D29UxzdB+FwP62bV9OP?=
 =?us-ascii?Q?PAMXWNhtJeFnG0Iex6kDMFejT8zJOmsWSt4gXfFLrvRgo96/MLqM1+7GECpY?=
 =?us-ascii?Q?5nKkJzzHDV7lKZEltrYcO12IpyRL0JRZRmUB5dHJMEwZaHI4Gy2GIWFFHf4s?=
 =?us-ascii?Q?HLT8KmFox/BJ+rZ7BVondGhGvA5NX6LYuptuK0n3FSgRKhGw7TdzY8xGJx6x?=
 =?us-ascii?Q?TRm+6xaTPA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 351b0eac-745b-4abf-4d15-08dee7d24c68
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12290.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 09:19:14.5517
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3hO9ZdWKVOP26Z2gLbWMWg9X5+arYlSqMv+Fun8qb39ffelvyK5wWtj41ZQCyghq1036HxykYKfbYBiFr1bBrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8384
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_021919_736190_C29AB5CD 
X-CRM114-Status: GOOD (  10.33  )
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

On Wed, Jul 22, 2026 at 02:16:00AM +0300, Vladimir Oltean wrote:
> In a future change, struct fsl_soc_data will be extended with methods
> for performing RCW override.
> 
> Since this will be performed from a calling context outside
> fsl_guts_init(), we need to keep track of the soc_data that we determine
> at fsl_guts_init() time, so we can reference it later.
> 
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>

Reviewed-by: Ioana Ciornei <ioana.ciornei@nxp.com>

