Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5722EE77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 20:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3GuRV0TTGhB6eSkAOE1dKT8pXXxMwLZ9SF+dOmrytC0=; b=M6fqVHZU8Q7sJSP7/L5Kmd2Lj3
	DwIKVWKKdIpPeq5n3RtE3vf44/1uX2Y2sQtA+P7vVsSWHlEiflRrKAYjUJF1MidOhjl8bkIWUvUV4
	mGK2ldbvuajjY+Xa3lrqYmsuAjpDn1IVnFup+6AkNHolUPDeAfWlygbXZUmghzrsHHjKVsk6v7ir/
	jWTuAPcbjFCMrjRuDy1hCyba87DuZOaVHIHcLIUEPzEEQn6RfNS50RLpd/U/lU1+jv2vrep+Yl+rV
	O0GVDsI0Qnyx5hz3I2jUmU65PS3alH5VHXfBTpfonrpCvLFcsnadNiC9bjUKw4MAoe23NzeXQi+9p
	jthq8Ppg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOMxv-000000030Rh-1V9F;
	Thu, 19 Dec 2024 20:17:47 +0000
Received: from mail-am0eur02on20611.outbound.protection.outlook.com ([2a01:111:f403:2606::611] helo=EUR02-AM0-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOMpI-00000002yYx-09tl;
	Thu, 19 Dec 2024 20:08:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WBqbuJwv5ZeOJJ72Qp3pC2ETSuP8GJE0JzUgWc3wlzyiVDfTHINIDFGYZoJyMvPOLeqQsnbleKBgR+l1JtZRew4A9eFMAi1+jFqpnkKrY64Yvuqc1D8G6b1kGwxqSrXnraVvP3PX0zktthb24SZPE2FtAnn1Eg9/SupZJO0PU22FerwQrBlOAX75bXrz6qZyYSNAzKRxoEcKHVfyuo+wPXQ0NBWzUS0YdyVmENoKqCRh01EC/QAhRDC5I0mFI+WAqkq/TcX1jB4sRmIixaJDozcB4i0MpbUuzjVS4O5CDJZQiGvG50QRvEH9sZ+7ajolAehqXNIJJhxOZyThy8y9DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3GuRV0TTGhB6eSkAOE1dKT8pXXxMwLZ9SF+dOmrytC0=;
 b=bxBojsVDd0hxoQ2jwyWLEPY9Gt7tFaqjToOAvyDz0EpCjv6CH+JlD4Mp9HY359LfuHTCSBE0mymz/+kfqOW3QQWiD1IveuUdJcsarBLsWfRmzU1Rq+ZjJ/ZDUTS/4jY6xYkW4WOA6qb4uUS9TyEfTp6mmllud1lFEPZCmMQ9fD4zyGrRPu9exBGG/fNJFu/dPPnFIGaj6gQLC0NaJXUfvF5T4LHH9JKVLAhelb/qIyp2QdKctOm5rrfmgU9yNCyO8CvOVlPraiEDYglsjR6aV6Lc8DW5lMyMhOM5QS1o+Du2xTWzUnvTRoFi2rPJhcXJX9oE9/qGuSMsV15w3tPoaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3GuRV0TTGhB6eSkAOE1dKT8pXXxMwLZ9SF+dOmrytC0=;
 b=bxWePJliAhFOjzi/ClOsSz8TRr+g/Gic8oNwn3TlS5cQdI9lZldLit6NIqFdLT1GwS36UADTDv9Bet//YbzVeo8exx87BkqzOHG2S/ec1P81WWeS9mVrlnJbBrPEaVtcRVuFRhIHOqsoT782jZ152d8UktyUz4Dr6an/XSbMzE/oxpWQuuuv0vaH7jJQTu+GbOoeJXXoj4BQ0ew9Tze1b5dhNHPHe25VvvNukUpG4PFDfzqcj3GU7NNaLZrThAQZfSN7K2nllRetTRcig/pZbMyJFJk+rwlgtRfLv7gUmsmHCMML1EBong1jxYZ46adiOK1M0zkodi9p6/FutNKeHA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PR3PR04MB7292.eurprd04.prod.outlook.com (2603:10a6:102:85::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.14; Thu, 19 Dec
 2024 20:08:49 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8272.005; Thu, 19 Dec 2024
 20:08:49 +0000
Date: Thu, 19 Dec 2024 15:08:41 -0500
From: Frank Li <Frank.li@nxp.com>
To: Defa Li <defa.li@mediatek.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com,
	mingchang.jia@mediatek.com, yuhan.wei@mediatek.com,
	hao.lin@mediatek.com
Subject: Re: [PATCH v2] i3c: master: Improve initialization of numbered I2C
 adapters
Message-ID: <Z2R9SUJYJlUJSmtL@lizhi-Precision-Tower-5810>
References: <20241212091818.8591-1-defa.li@mediatek.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241212091818.8591-1-defa.li@mediatek.com>
X-ClientProxiedBy: BYAPR07CA0004.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::17) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PR3PR04MB7292:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fa9b9cb-cc06-43c9-6fcc-08dd2068f372
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|366016|376014|7416014|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fpyZ/TiMYbAqAOMm3jryzjf1IKzLBTRaef/5xZbllpbLDrNB1MXPDJri4uOs?=
 =?us-ascii?Q?SvyxZ8QB5jtTZJAhJdq61xJRcvqh2NdZdxgOjWjQ9A/O04T2ptEI5ExXjBLa?=
 =?us-ascii?Q?koMPBv9JXxnMHF3arJPOXuq/dW8nOunoiFfXZZ/fCo7L+u9n1iWatLFI/y7o?=
 =?us-ascii?Q?ZADqQdnIB7unidAZ6UfOY1mouuDB23wd8/s922QzYXcdk254M7bfhB6u9Pn0?=
 =?us-ascii?Q?xojOCbPztNdHiDly8UEYJlJvP/tMML3SpcR4jT8lutm9wa3df0ky9qDnb2nm?=
 =?us-ascii?Q?KRCQ8dgQRBUr8sF6ViSY2R5EIgHESKBEtMYf/mwQ2kp1Udn01qzBrOWAwogJ?=
 =?us-ascii?Q?cf1A9dNNsNYZ+plMYTEe7ZtauRTyUxw8LTTvhPH2BZbDZ3wpIAtIIVPh8I2i?=
 =?us-ascii?Q?LI2GgmcPSSQDPDiPi1aLgZ+dv2wWDeHP8Cql7wsbDvHs6QtVnMyQXduZJZFp?=
 =?us-ascii?Q?o1x54rql5ScutVAHy3sPKM5oMxZpkAL0S183eZDY1A5Hhb9gjEq9TFNRSh3h?=
 =?us-ascii?Q?xHHWiiWj03qAMbi6n8JaTrbQpsVDU7IMHI5FGcOSFOKbT2ODpg0CM6tumqlL?=
 =?us-ascii?Q?eWCeVjuJ9Wir88zZEc8MC8oh5hpj4ucEWb5L2QUguVn7qm1nxCpnEJBM+CCT?=
 =?us-ascii?Q?2gnP0iPm5wk9ITWfPWQ4QYBprXu8+SNNpE48hWfNQBE0MeAiKW7OM6YRTCZI?=
 =?us-ascii?Q?5qLb0GQz315v19m4TnLpKqBJMl3DFVwWkrnA/H0Zgqt6+Tul9/3xl1ZrlFQX?=
 =?us-ascii?Q?65/xevCwSgrGj4GxDhD4reeTQRbNm4Rkz0+Bol2mbHajfXVblg4oN1bWzwUs?=
 =?us-ascii?Q?B9fjE9xkKWK2b0cmRINMaX6OnWu/3WnzehpO4lNJkD7+lQbaHAydAm91l50i?=
 =?us-ascii?Q?X+UlzKIeBTx9Qm5FnWsNeuG8Ioz7a63U8ljMjDiPE6+b4L4f10Xjpvw8052R?=
 =?us-ascii?Q?lzdI3c60mjNPHglip0kIYo6iET5U6ZBUlAjTqISz2KsmPX9XInFUTntCNDkC?=
 =?us-ascii?Q?8V4VOg+urPuSV1uu8hLRT/6HIXEpURC4XGQnwiCULCYhFGV4bSZdbOd+kueF?=
 =?us-ascii?Q?vXj4q+AQBowC/BO7few/m9k8JLnRaY38n0agNM9jA7ECi5Nt7aJFE/ScMWm4?=
 =?us-ascii?Q?fpmVgjAZ6ntpBcQLWZxv7hD5xbSs7qBfmJJViDIW3Khp/WLtnsT8DjLZ2mz9?=
 =?us-ascii?Q?O4UfA1l0Vsfi+Opv3CMisk1PF2UgUF8d5MVHiPKK8Wu7d4iU2zLczWp1CJJe?=
 =?us-ascii?Q?VNMCfaW42P2Utzyp85EVnEeSlkTILDP8qUQp4uO2Z1Z4pX/GJffH+2BZ7pE+?=
 =?us-ascii?Q?lw0uWoVzTrpPjQe432CcJeLwPxdAl/zHI11wioaJFQoUcCM3F4qQcV1aS6lV?=
 =?us-ascii?Q?MPf5mKKXwZfEB4B1/4xfNwE6CzNBXBxrSIhFp8LGpOW4XAYYXXehjMSvbhJG?=
 =?us-ascii?Q?u2RXw2zUx9ti4YWke4/jjtMC8rFgwHl0?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(376014)(7416014)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DEMMpo6h4vr55AI4zFwzSKYtBkt4h8o14znG1QsTvSAVdyQt2+W8zKdAb/qj?=
 =?us-ascii?Q?Vth5Tl+UCri98gk4M1Yx/CJLeKLF+nMnzzxNHijea7Sime5i4l98c9fj5vJB?=
 =?us-ascii?Q?zmf5mrS8CCSpoOne+4bJU57qeB0Xmq47nEHuBc+9QyRkV2b/uYo7J5Gf0S2p?=
 =?us-ascii?Q?WNkf+2f1nPQBHL/HiVpTaBv1m4Uy9AcCZOGyZ++fIprdVfvK8hTKQJHVj4gG?=
 =?us-ascii?Q?8+Yl+pHKh8xxZfrhgeuRMA+wfD+5GHY4fyx6fP5Xw6tMQ/+ZIY9oNtwnMZ5a?=
 =?us-ascii?Q?pRKXffHzOJ5PmXUbib71cVogmqNcEkvMZCpAwrDXUbDn2R+L8VEX3S7a+C0D?=
 =?us-ascii?Q?hcyDC4BzYAiTSobq1baXDc5d2LVbYrUrNyUU7tPZRzbj42s54NYFgt+443nM?=
 =?us-ascii?Q?DOQ08UZ3f6DELb1RtWeimZr3UKpGJM3D/cY/seduehp+UNgOlqB8loLCxWPt?=
 =?us-ascii?Q?iYPGHT4tIOt70gjZx5HfoKSt37pDFfCzwEuAmP84pH0VnFtKty4Lu/bzb3JN?=
 =?us-ascii?Q?Op3q9I49fs7oxMzTLC7nnlJrIlOi3KXowaiWkb7XVhqsaXdOBBDinw6lehp4?=
 =?us-ascii?Q?Ekzq2oIc3jcR1YPLNqhbe/xRMBUErl5zq8MqRhHUVYnuiaUq72E8BojYwJWg?=
 =?us-ascii?Q?6A9Jh8vg71GAOaD5xhiteiKvSvhPaljsTHw7NbzrWCc9Ae5Ymhodb8Yb4mQV?=
 =?us-ascii?Q?eTBBewH4sbBqy8QHwMnlYX/mbDuwJA2uwCtshXb8Vi0olXZFbGsjxiBAy1TS?=
 =?us-ascii?Q?DtcBK6BZ2a8XYrn4RQkSyka0dxCMn0uwSBLauhljcalualIAtvgnhUqtrA0B?=
 =?us-ascii?Q?cIZ7O4eWToB0M+CjxRZuHMgwxzSlCUtk1K2YLtUgvdmQj4Wqw90WFNOYP1cB?=
 =?us-ascii?Q?vQ/L+M5MHFx9KPxa1N0SG8E9Sy7idWbfIqp1Uguue4+MdqpTcAabpkDDFazn?=
 =?us-ascii?Q?EatWD4r3Z+940WeN5oPZ3nFsUzE8oo8QFWmUu+0tOZM57SGNh05tSh6vqwtz?=
 =?us-ascii?Q?TqSxawBxwCv1vOhtO1lfBBljUSgecP7REguKewREYUoygrykjPF/BJLXnOho?=
 =?us-ascii?Q?iKCmByAUlMjsvBroqXPnoL3ux2KArqMwlBp3J2+tqvpdomyDILl6bsAfyg2y?=
 =?us-ascii?Q?OwTBCy/he+uzDIfIA3jcXW1ZIMVq1RsQx9N0s3OAlQIjDfAQt/cCjrhq35th?=
 =?us-ascii?Q?NlZdmObZ0zrGORNE9UvXeIExU/BCbvK0+fFiivT3HxsTDb3jt9tcjjRLvWaC?=
 =?us-ascii?Q?P8iBVsa8x5SL451BVwa78ed8sJmdeCDhOOL84WaylJXIFnOCtxwGzJ6dP/It?=
 =?us-ascii?Q?crjTcf3NS+DJ2ecGw1K3WO21WrKgoE6wxSPS2m/0Ehk2gHYjqkpr3IwBBwkX?=
 =?us-ascii?Q?06n3vTwhzHMZTbXKAw61CU9wI2C/SX7toVOWe9C9DWsp0ibsVb/dx3Sf6sAf?=
 =?us-ascii?Q?lm0uU9/Xm37qtUptPCWCk09YK/g7cz/yZgQ5rH/LBrQif1kcJyKLTnKN1vYc?=
 =?us-ascii?Q?sA9gxdlPXE5MM5B73ATaf7gM/sxh+NePPdyX35cDW5dW2Y0sStibaa1WZV3E?=
 =?us-ascii?Q?ws5T8VxfhgHmkQD8r58=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fa9b9cb-cc06-43c9-6fcc-08dd2068f372
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 20:08:49.0797
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5J02+98m/PddvwlLl17ve9FHOpv9+R3JyAexCBGcqbzMv65keSATjgzgt1FrrOcvwxFh+ThKhkBLLJ6Jyoc6YA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7292
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_120852_077654_0CAE5A4E 
X-CRM114-Status: GOOD (  23.39  )
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

On Thu, Dec 12, 2024 at 05:17:53PM +0800, Defa Li wrote:
> Add logic to initialize I2C adapters with a specific ID if available,
> improving device identification and configuration.
>
> For mixed buses, in addition to the i3c alias, an i2c alias can be added to
> assign a fixed bus number to the i2c adapter.
>
> This allows an alias node such as:
>     aliases {
>         i2c2 = &mixed_bus_a,
>         i3c2 = &mixed_bus_a,
>         i3c4 = &mixed_bus_b,
>     };
>
>     /* assigned "i3c-2" and "i2c-2" */
>     mixed_bus_a: i3c-master {
>     };
>
> If there is no i2c alias for a mixed bus, the i2c adapter numbers will
> remain as is and will be assigned starting after the highest fixed bus
> number.
>
>     /* assigned "i3c-4" and likely assigned "i2c-3" */
>     mixed_bus_b: i3c-master {
>     };
>
> v2:
>   - Modify commit message and code format issues

v2: ...
 should be after "---"

>
> Signed-off-by: Defa Li <defa.li@mediatek.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  drivers/i3c/master.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 42310c9a00c2..92223e0b6e59 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -2486,7 +2486,7 @@ static int i3c_master_i2c_adapter_init(struct i3c_master_controller *master)
>  	struct i2c_adapter *adap = i3c_master_to_i2c_adapter(master);
>  	struct i2c_dev_desc *i2cdev;
>  	struct i2c_dev_boardinfo *i2cboardinfo;
> -	int ret;
> +	int ret, id = -ENODEV;
>
>  	adap->dev.parent = master->dev.parent;
>  	adap->owner = master->dev.parent->driver->owner;
> @@ -2497,7 +2497,15 @@ static int i3c_master_i2c_adapter_init(struct i3c_master_controller *master)
>  	adap->timeout = 1000;
>  	adap->retries = 3;
>
> -	ret = i2c_add_adapter(adap);
> +	if (master->dev.of_node)
> +		id = of_alias_get_id(master->dev.of_node, "i2c");
> +
> +	if (id >= 0) {
> +		adap->nr = id;
> +		ret = i2c_add_numbered_adapter(adap);
> +	} else {
> +		ret = i2c_add_adapter(adap);
> +	}
>  	if (ret)
>  		return ret;
>
> --
> 2.46.0
>
>
> --
> linux-i3c mailing list
> linux-i3c@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-i3c

