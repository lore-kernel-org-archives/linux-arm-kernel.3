Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90DE5C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 15:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r9UMNgQxvjKNuY3HQAniiAFscWLPguoGfK7+jJXlL0A=; b=CXE4X78tIql0RhyCzq0sexD2N1
	9Q0OKyMG1e03YGkdG7WajIO2yir86KK/ERVyPyLgGO1HTiHtF6OmV2XFYU7IZZOnU33BsMaGbs05J
	EHtUBvILezvaor0PJRbZJ1pcthTDdzpW0QUeNW0kDPOb9X43T3sL7vMdEyYZ7bpr1I30zk3Gz+goY
	ik/1o0vtlvEYq/sgqsWAEtvFCT5aXxwca3i9C9g7WNha1xggjccJh+lQB2A9h6XpcwGndRou04gWl
	XjKQd1505ZoMaAY/VVyvy2hClmAme5n0NXAZSbsIsuY63FddeVODStZfQ1x7st1W2yP/tvHcimVHz
	zYQmuKjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqZau-0000000EeKk-3HDj;
	Fri, 07 Mar 2025 15:26:36 +0000
Received: from mail-vi1eur02on20609.outbound.protection.outlook.com ([2a01:111:f403:2607::609] helo=EUR02-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqZVx-0000000Ecz4-1oE0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 15:21:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iRXbJEeKWNHfxV3wYon9vOfPmv7VIiO3tEorF3TS93glEGUcBZi6k87ZU0x7T+17ZMwH8m29LCAiM4Z0/ztEPo1awGr2tnjycBUxykBUfujj/VsptgnOm7NFeEaFT7y0tZOZTV1Krt36hCEPXpMlY0zrzPWdIV7dxC7grCaUEfBM3gyD8XOToKBwxdyOpD6E4oB59DmJO/IWnD2JGwV1EztkBJw79277Qqj05jzGcTn186forXP6yzQe5Cgh/jN2jcKj3fanZnkpquqzMRxrzIdjDQfj9T7OUDm7PblF/DMc9KMsUhUmGCh1v60wpb4VkEaQq1DcfaUXlat3n7Ii9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r9UMNgQxvjKNuY3HQAniiAFscWLPguoGfK7+jJXlL0A=;
 b=VPpG0Wgj04hD7eDS2/ax5YubKhUvdCgkNggy2ygNBMoaB5GRL4eBltKxSVPLTj4NR4xWhb4gauFub3odAuX2hLCYpQN8ffz03fA++8gcsWSdARuFc87sBzgVlpuoq/Mhbf+rQ0Xzqwx6+b+o1YbvBzL3ytfWI9j/8Fvu4GRa0Dh0/oVFUD+zWRzCH2qtYeg7tZmWQ+6J/CRXEaL7oG8i7JlhMwkEqpokEU1pnv8yGcIMzGFruT/ee3tRpe7dQrBAJkSOzhWcjYXCvwyKRrQBXMqHhovTStZ3VyvV799ELlR1xEePiiGmdzyPVdko3BNdZ5jygLFQKMzb3PAaxcA6PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r9UMNgQxvjKNuY3HQAniiAFscWLPguoGfK7+jJXlL0A=;
 b=OeEU2kXUehv/rXFkiExMrOwKr2T76VQoz7wbSRdjAcTuR6rs8zsSRZ24Z+zxY5+pVye71OdjqBhBAfvaHoDBMpp56QordBoh/wiJipkILeNMeTmpPDC6OBChJttDKBMeonoSwKHQcI2UWrAXox/MffnMa0XFtxV8xhqrw8Khv0OXkWX7JJIk1vMxgoL++sXMJJ87zNfC35OHzJgLyAmcNErtNaZHiBwoDvEOoxcJJuBi9Lx6iFn3XRArQioMwyCjmVXIi7fSJKjOczRh6bhOy1QWEbW4U8M8jHnjL3vAiFmv2UuDX8nmcYG3Y+DtkrP/WmG4TfmhQsVVxLHNj7zU5A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA1PR04MB10892.eurprd04.prod.outlook.com (2603:10a6:102:488::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Fri, 7 Mar
 2025 15:21:26 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8511.017; Fri, 7 Mar 2025
 15:21:25 +0000
Date: Fri, 7 Mar 2025 10:21:14 -0500
From: Frank Li <Frank.li@nxp.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] drm/bridge: imx8qxp-ldb: cleanup return value
Message-ID: <Z8sO6vQLPTd2KClD@lizhi-Precision-Tower-5810>
References: <20250306-drm-two-ldb-improvements-v1-0-f139d768b92c@bootlin.com>
 <20250306-drm-two-ldb-improvements-v1-1-f139d768b92c@bootlin.com>
 <71c44221-b18b-4928-8faf-00893ec4a109@nxp.com>
 <20250307122217.158b24d6@booty>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250307122217.158b24d6@booty>
X-ClientProxiedBy: SJ0PR05CA0003.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::8) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA1PR04MB10892:EE_
X-MS-Office365-Filtering-Correlation-Id: adacd307-054e-4f62-9c25-08dd5d8bb995
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+Qe86dPhhhB5HiLH2OdABqfHemfFtA6o/D+9KVY2kv9fAJbbIssRWNx4z/O7?=
 =?us-ascii?Q?BJpVKGSk7ZKuZxZXCS6zNxd5LCXWCFyhzqbsq1+5cK8PzsOoSNNxnDORYMDc?=
 =?us-ascii?Q?aDlYrFQ7risQmQjnfv0dPOxt2SANsBKcDnQDB9X/bzHMDCz+oHZf+eGcygZP?=
 =?us-ascii?Q?V0IqRB0g1ABJxY/sCWqQ2xARoVZTN/pbMA+V1GkzSo3Csv9iiDahMJRnE6DA?=
 =?us-ascii?Q?dAX0znd5K0JrTh6jHea7jutziu6Lti7FLrHp9Iu24CEh047yVxZg6hbGwZZd?=
 =?us-ascii?Q?naBP3HAasIpf9CQCtw1I6kXnrl3seV3/HgbGzlmEJr8Mq7N88ev737gCiwrR?=
 =?us-ascii?Q?JWwrRdQjIinw+lVnopRdiwWpCFfL6Ilzwr5eBE8FfkElSgkMe88qjvUj83Kt?=
 =?us-ascii?Q?l+uI+XwA2648PYN7eM8w2Eim4jX0plM3cWK9cMTPgGpYbEqhM7VlcNZdY3eu?=
 =?us-ascii?Q?EIqA+yLWUJ5PopPMjqXjf8DnpLoVf9AzV9jOtjSjQQLkPBkrpaU6OqYS51QB?=
 =?us-ascii?Q?9h+yTYSN4xKYeE9VGgaZZBBbQB4Bl++EvyKm6M4Q2V/B+/ie4eTLq/jNaTii?=
 =?us-ascii?Q?I2C39AeaHFuDRvMY0tGnxm2GHXu1z+4+Y61Jr95Eiy8fbvxHqoFPRqb+SRQ2?=
 =?us-ascii?Q?S8ZLSr0mzlr21Imw6le5cFmgYsSJ6l+yYN1eZY1iNa12VpMD0C8CVL0yjez8?=
 =?us-ascii?Q?o/5m9c4PucPNXrR3sOlOp8wanKUBMC2uzg04maDjh9UFHwMH/WJd3wkXC93z?=
 =?us-ascii?Q?gHMhpdGCG8HZwf7IUb0+rDqE8t6JqrZOqjvxP9N5GsICv+AvCf8Qtkj8YTIS?=
 =?us-ascii?Q?wi5ABg6TSm4/Z/Iky0r1d2WDOD2XySyJ/RBcIGeXR3ruE8KGfWucPD+RMQLG?=
 =?us-ascii?Q?ltGLYvYD8t8zuQdzINROdgRQ03Wgz+YvVcHVPHCSvUmIKRVoF3I5kRsIuoGt?=
 =?us-ascii?Q?bpCYvMsQ7LG0YVKA4sBAEoZSRSZKWMlQSd3KfO3VT5ylKtGz04KYlD1kjRN3?=
 =?us-ascii?Q?qR06ENGYdFtOEYffd/FXjM42jQWhWTzN5EHf/uq7M6ZsyQeUBmWR44mreUZa?=
 =?us-ascii?Q?TgI6MN+N78BxjpoDDxKTdVma5Lv3pJEaM+PT2N0V1PvinLmsd4H9F91i7uUX?=
 =?us-ascii?Q?5UsjKlrmkgFL3Fy/KWBX757CrzjNdj3LY7ndIJ+BHJOAG8OTCJrf+c0GaXY9?=
 =?us-ascii?Q?jJE0s6Mp0G5P7PHzwk9lBBS/xp1PWDqHyRx54e2XfrxMcPvy6IOipvz+avRA?=
 =?us-ascii?Q?pEUhT9i20vOPfisMEaYOUxQNKrSZoJ0lJAVdTH3LIcXRHZjwcgTu5cl2LHcx?=
 =?us-ascii?Q?F1OTOaftQoJ5oabYFeiOqsMNIQeLNf4OzlHMbx+IRjA3xI0L1Z4ZCMykKgtY?=
 =?us-ascii?Q?XYsKMtjTSdnJ1n2q0dBB53MUQVwz?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1TdPclEOAU36Hgs/rPuqwt+eN5qSx6C+Ek0UKVI++fAQ6WOgC6Zx3iEMiXd1?=
 =?us-ascii?Q?NPeBy8HQIjn9TcgVYSzzg06QnPghjC/cXPea1BORw9E+/xMvX4vnjL5MiB2g?=
 =?us-ascii?Q?4Eg3GEi3IqqZW+oX6wUWl1kHLE/aGZZBZFqPmzlKbSVaFrfwqhEidaYGOOKO?=
 =?us-ascii?Q?Hucahsm0/v2V9HKyIZpKgqt02wQX6Bwt/F/7rPDlm2Ok0HwXDey0BotMV2Dv?=
 =?us-ascii?Q?u/YmOvSR5Ff4dROETcQdgERTOcy1238rp3RCfW/DrQ2UYLwkQvuabblmZPZc?=
 =?us-ascii?Q?SfJA+peuQYpzX8xkJeeVA4LNWnD/OgoJq0fwCsZM7yMPVLIzT3CAuKEiExgd?=
 =?us-ascii?Q?Rm8+DpiuIwkNtQ+53UrskFKE5NEQqXB71O4fuCi11lQKBbqvhqMsILZBaBFk?=
 =?us-ascii?Q?CkVOynrpNIX5MZfTzCNLOUPZdSO04jeMdJAcuzYuYH2JVO87dfDr3Z57gj8o?=
 =?us-ascii?Q?ljKIZ6jCDyDdyCVrUFOQ6H4gmhvrkGEXLbvKTMUIT0OE5Lm1wMqKUjRKkJ8r?=
 =?us-ascii?Q?JarZdBpNlU9D53Z2y2wfnN3tAtgiqBPt0106v9vJmQlCYwYZ+EHvEu5M1Odv?=
 =?us-ascii?Q?eaFdYcgWMH+/S5UPpWyHTb3WygEY2xuDkALQCXhmjoO0NrNZWsEdufS7BpUE?=
 =?us-ascii?Q?P8n0xdTN0lgvwy2DeEWgSpMAoLJxE9uiFxIgKSxAVvp9oFStRbaJ8ufdNHXp?=
 =?us-ascii?Q?LGlbDuynelxpKpyAf0av1DY3uDKpujn4EBYEXhOeps11beFOxRjj2jEo6Gyd?=
 =?us-ascii?Q?BW9nRU1qExrLpXaB1YURLkoIIQm90fr6OgjdAJBMXbFn0LXJQGBnZukJEDlu?=
 =?us-ascii?Q?RgDeoraiKcgVrVuGWvMJdxwgSVD19CNqvxJyqF/ThnomFFGN5H3FgkRmvPPf?=
 =?us-ascii?Q?E+oX8HzM0lePqCswWhMujU8V643rNHVDri/EGXWM6xzMCdI8YgA3l8VTwv3Z?=
 =?us-ascii?Q?s2IMIAUpQ1ollBhvbcIPWC+eW5v/YNM1MaRD/weUFivWwd2bRhJ1b8J5e8Jl?=
 =?us-ascii?Q?z6+VpcT+6zkhb3Tl5gl5AI2HxIiA7z1m3lcLKjXgUGkxu+3hOzw6OPYexBZO?=
 =?us-ascii?Q?87E/aBKOAd3cGF2F9RIlyZk/PNl5uuJCWrXyYHKSjjacBIArn/++JptE/S7C?=
 =?us-ascii?Q?gMH6/hmXWnNVhD4U0oWblRnIYodGnTvC612x56r1sIuvxMHsslKExoMI6c3n?=
 =?us-ascii?Q?SSnlV+4hEMbSE8VTlVZ5h0dh2wMJr9O9XsCclo/IFxaIfP6qs/uBRFBLSvnz?=
 =?us-ascii?Q?+ZtOUj/jQU9WtEWkvtohQcB0HmPVDZeYGcdxFOZlIIzVS7TTEzmlpXycn/Gs?=
 =?us-ascii?Q?W3ml9Y0bCVuC0JjAjK5XQvxXd2tBFH60/4UKXkjaDFVxV4H8s8Or6g1YpGSq?=
 =?us-ascii?Q?BNK3V7KkTkd9Xb59a9Jvqa0F9qptstMiAQeuxt+if9eo85GIwShh8Ox03E4a?=
 =?us-ascii?Q?jU5b/gchR6JXdTG6yUK9BCYhwzdYnZd1qiRqduiQn1wo/QlL4SwfJnZTtEVR?=
 =?us-ascii?Q?tn6XWpaF5jgLvO3dxxZTJp2BNcuFZgShyGi6adoN9oKY7caH54WqD3m924Yn?=
 =?us-ascii?Q?vu7DigOzoIQSRmQqY3gvRxGf/zYMLcdmHZ2YkVSj?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adacd307-054e-4f62-9c25-08dd5d8bb995
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2025 15:21:25.9232
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eY+0V8jcvQaIq86r2poxYjJgdeLscn2xHTIslK9O1CS4kpGycR6oe0nk4jujtfw+QkR7/Jp8zR/m2XlE3hSHng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10892
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_072129_471310_C0F58CE6 
X-CRM114-Status: GOOD (  25.08  )
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

On Fri, Mar 07, 2025 at 12:22:17PM +0100, Luca Ceresoli wrote:
> Hello Liu,
>
> On Fri, 7 Mar 2025 14:42:12 +0800
> Liu Ying <victor.liu@nxp.com> wrote:
>
> > On 03/07/2025, Luca Ceresoli wrote:
> > > 'ret' can only be 0 at this point, being preceded by a 'if (ret) return
> > > ret;'. So return 0 for clarity.
> > >
> > > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > > ---
> > >  drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c b/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
> > > index 7bce2305d676714cdec7ce085cb53b25ce42f8e7..bee1c6002d5f84dc33b6d5dc123726703baa427e 100644
> > > --- a/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
> > > +++ b/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
> > > @@ -665,7 +665,7 @@ static int imx8qxp_ldb_probe(struct platform_device *pdev)
> > >
> > >  	ldb_add_bridge_helper(ldb, &imx8qxp_ldb_bridge_funcs);
> > >
> > > -	return ret;
> > > +	return 0;
> >
> > I guess this is not the only place across the kernel tree where this cleanup
> > could be done.  So, maybe use some tools to cleanup them all?
>
> I had stumbled upon this as I was doing some changes to this function,
> and needed to understand the code flow. Definitely 'ret 0' would have
> made it  immediately clear that all the code between the last 'if (ret)
> return ret;' and the final 'return ret' is not allowed to fail.
>
> I think this change would (slightly, but still) improve future readers'
> life.

I think "return ret" at probe already become common sense for developer.
No value to take efforts to clean up this.

Frank

>
> Luca
>
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

