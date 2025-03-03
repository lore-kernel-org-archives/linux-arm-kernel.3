Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E7BCC282CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 17:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U1SDgH4glQr5q3gvi71PqmwLoSmZ7M6DADtASQe8ddE=; b=EmRSOzGvUkEzc2RJ5ig67a6t6u
	pGRFvfVF2bJyu49/CkVtpC5FKeFXVkybfaebbEcgk6+T4rYffzgROfvDenyYvjca7erxJGUcFeAbS
	l/CXnMvZMy5MsjJPQlbwYRSSOvZ+mXYEnYFXdaQbN9EJG1qi7FOShVNoFmeUCpWcpqxGfpehf2WHC
	hKS3jpUD82waS3rbN3HCcD10TY9xCaXRE6H9B13WoRbUlKkmnrevKQpRg0lFzmtKFqkosRB0LCSn/
	3/VLuT/eh25Nk0mQHkh0Bcg7ICFAGKYUsEv1jiP93y42b1q4wkhRx1ipzDeVcbR3MabsAWVKa441N
	8W2yoY7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp9nv-00000001o94-3FtW;
	Mon, 03 Mar 2025 17:42:11 +0000
Received: from mail-db5eur02on2061f.outbound.protection.outlook.com ([2a01:111:f403:2608::61f] helo=EUR02-DB5-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp9mK-00000001nln-2q8O
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 17:40:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AQtZr9wC6tmm3gHMHSIeh9fIQOV7dGYRHdEESfg5rDUkVq7NLgRDzW8EPSZUQOOXjD3vNFTil5FBdEtg/ybyE91pLQB9fFRGgdvxL9EMv0Z5gTJDgenn6GFU8lZAvYqiEtFXFo2bQhRQS61VI/jfRYnKBucE82WnJ31W5Ez/id9wRib2RrL4yGhR8G5inVEllwOI+rp9WFqoFWACVJpq+sjVSKGB3RBfDyXZVu9zKesACLiOnc2fqIfkV6gfBa3nbPbMhuVRRzGyklPncmZivtP3T2xKJ3VBLT+IwOzJ6JhPDSo2/H12lLEVRA+OMKBLQun6FVbkZnD52dXMWpr6SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U1SDgH4glQr5q3gvi71PqmwLoSmZ7M6DADtASQe8ddE=;
 b=DYevTt0oVfKB3wwWFwTRVQMvI0uo6c+fkDzLmR/79AcfT67pWglAh4pobQNdvgEVpfVkuUUyvowCdRPuz3I5FjEiOJaaVvv35pRkXqzWs7RhUl1PLlV1yTjNPt/bqhwBb3FEdcSbZhrXtYFjylv0lK6tILad0B2wIZfhuu/YVB8rZX9Kh5LZx5GTrCJeVUXtin9wyVerJTguCaA1aDPq6cGHcohLkIYsmmx+d8GvKoS1ff3c3Dw7+WN63Zs+5b5fjZ5Jto0RPUMOSF5DjpwH+Jgpn+igjZcRvgWt5MH0YxPehMA7NG7vNsIJssxOd3ceWlxKO6S+PHXYQIUQFVHyyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U1SDgH4glQr5q3gvi71PqmwLoSmZ7M6DADtASQe8ddE=;
 b=YtZEywsnpWgIbDWLHWjqiz1qb4fpYp8G9MR1RKNEkdBH0cEgKJsNyO7kKbqXG7tWIQTk5nD301yz8Evq8QX0t7fvWbISDMLUq81hDxeQPf3Dua5yxTolot74JoPUrKT7slArAVp11jLYhetrig7LdPp+hnoiLKRUUSCojpfKmx2IXibRRtjBaZNsLDsQ+9hzj9kBQ29GcvTuuOsVxKRonYNvhvbTuCsvdZt782wddZ65Y8E50qtcH+CiSqNtMNwV2/tjwQ600DqRoQn1xEfMswAfUHAZ75/+0X5ihAnmbBYmorNOMDoX9p73zcdWyG06odZhGZal4OUQEfRNoO0ZKA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VE1PR04MB7263.eurprd04.prod.outlook.com (2603:10a6:800:1af::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.29; Mon, 3 Mar
 2025 17:40:23 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8489.019; Mon, 3 Mar 2025
 17:40:23 +0000
Date: Mon, 3 Mar 2025 12:40:13 -0500
From: Frank Li <Frank.li@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-media@vger.kernel.org, Robert Chiras <robert.chiras@nxp.com>,
	"Guoniu.zhou" <guoniu.zhou@nxp.com>
Subject: Re: [PATCH v3 00/12] media: imx8: add camera support
Message-ID: <Z8XpfW/TWg5rKpbm@lizhi-Precision-Tower-5810>
References: <20250210-8qxp_camera-v3-0-324f5105accc@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210-8qxp_camera-v3-0-324f5105accc@nxp.com>
X-ClientProxiedBy: SJ0PR05CA0024.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::29) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VE1PR04MB7263:EE_
X-MS-Office365-Filtering-Correlation-Id: 51498a00-6ded-4d32-a88b-08dd5a7a79c3
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|7416014|366016|1800799024|921020|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?l1qUVFAYi5TH9ij0v1Z76v9zsVByU7IZlR/P5huUq2/FMpu8vos5Nr1AyBjU?=
 =?us-ascii?Q?y9EqyFd/HqWwxwcimbkp+ifeezds5aGno+FF7GKsQrHf7LhImbR7HFjrx3eE?=
 =?us-ascii?Q?8A/Dg1yxvjqVyHHJ1+aOThcg3FdoI4f8d44aLZ/BAMRmI86R82ySAfqtlGhi?=
 =?us-ascii?Q?ZUZsrEIpkSPy9OnKQjCexjkkOSm1VWUe8Lf4NBiqG1+tqBGcDnmN28SrhNRR?=
 =?us-ascii?Q?WlZ6h1BfRAqlCV4aKXhjvvOT1zLVAgQUIo1EboE2X/OXMBYm4ZjVcD/kXSI4?=
 =?us-ascii?Q?r8HE6qBqCB8FFXS3V+74JjKLl+KkyaCEqnAIXl33JR53FvpK1GRoaEhV88ZD?=
 =?us-ascii?Q?ogrzDnLxtLGy3wIwmlnVVRMlOK0bGTdFxFIxziHzKfGf1PF9wYbXzEK/OfdK?=
 =?us-ascii?Q?EAWoisveMy+m2hquhKDlqwtaEk2nkKLqZXnPzQNCKtCsy7DFerAU6hVgtVtN?=
 =?us-ascii?Q?IE9jGvhrNNa+4EhMJlOVz7/XlARoIRCDqIjktLOO7NSyYgJOi6JDzDjBXTvM?=
 =?us-ascii?Q?kCa8fUhCu7G2QmJfgT8GRew+nbVRRlk8I2oIx39xpmNxUdmzeFJiC7YCzqVg?=
 =?us-ascii?Q?uWNNUkmMEkz/1BbMPp4F6TC3sw0n7LoivC+bb8K7rPrTMyQJ6hVYlFh9vgGP?=
 =?us-ascii?Q?jFFRyQia7IiySuKn0j5JH91klPBZDZBQjGjXn0Nm38nkOOCjrcCWf5T5FBWl?=
 =?us-ascii?Q?onYBNQ33kzb5T8ax4vK8/pKVgqvQZmHx46cg5qGbCjNyjilFcSOa+7WnuF7y?=
 =?us-ascii?Q?UEY7qLVzppqnJS0HMhx9+X7dOdwdwmPY/rorwmNEmuyCUjU/qXGdrAAIfuXW?=
 =?us-ascii?Q?UprwjJD4rxfOKtFUh3jIiHpMBFmVflVp5bkokZ2ygTpeIu3xFI5WrX/eW5Uz?=
 =?us-ascii?Q?khCOHIZbsGPIJSuv1l+oyl20IddDo6j5WeQYjj/Hpa8yvRDT7/pROjM7EjBx?=
 =?us-ascii?Q?KC1J2IEOzELChxWQI3WBzxdL9pJlzCGZ9maZ905ljSL4vaVuvzn5/6Lmrx3x?=
 =?us-ascii?Q?kaeHd9ok6SYhLpZTP4BUe3X9Z8//UekIRIZtcKaxGK/vFr1GblqFlpoJcPcy?=
 =?us-ascii?Q?Xl5CW92LTBDOGq3eyBpFPzX/X6NmTNupqG2mwRms9P0pSWMzi4jL9mObxy+I?=
 =?us-ascii?Q?TpVVkyegiqCxpidX9+BbcnYjPYoRLEtSWDrZ+0XccP0YBvBO05DDpsnZF+ko?=
 =?us-ascii?Q?xDbVQWOcqu9h7ThkHq4aVwAxjkrPjTPhHZ5W716FicabBxMZS0iteZ8rjYow?=
 =?us-ascii?Q?uhxXtcnmMb16I6IUlSsDi+73Q052UYrTGfNqAmuyx3muvIquKeKDt1X1aljk?=
 =?us-ascii?Q?QefwEWc+gsqBBl4Nbdh9HzYwkcuJMB9BcdX0tHDqVeC2nRsHiP14bXAzcQ8n?=
 =?us-ascii?Q?SusPJD7bsCipYwBvTR8dj+2iOCM5TxClRfynpiDBYgVM+Z9stjxV9g5ab00G?=
 =?us-ascii?Q?by+ikaoyAncxP/xjSo02Vtp2qUMDVJiXu9aEEIyRPWLI3ckrCm70kQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(921020)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ze2elhKfM7lhe2I0wYRn42BoYPqhLCTx+hEQmDKOsRW6fcF90MZhzLhACGny?=
 =?us-ascii?Q?DVWmLm76rpGc5CXk5mg2ti5AWvxlJRHCIjB2d1vIU1I1IOmXRATjMIQ/wTz8?=
 =?us-ascii?Q?IGbbYSZkL4hguH9TADzbjS4PIM7TysehRW8YRFUSDmK6S2CVR5fEa0FvIDlf?=
 =?us-ascii?Q?DK6f5+9wzAfGARK0rWNUHZEHyrES9h2Z6iVHc6keFm5jIrb7cI518SjoF95F?=
 =?us-ascii?Q?9aLF7Va5V81hPYL9pefjSwaKfOcGmd70OgMDv33RzSnTUfaYnRICIIukrDWh?=
 =?us-ascii?Q?dxqpQXvjZmXELohwcfYV7r5sN8zn8LYUWDDrX4BU/78jN6q70m20idMSAI7v?=
 =?us-ascii?Q?XtGEtu1Rj5XdNkAbwJ5aLwZMPkVtjGVWOq4Hcnjxjt9QfpUkJ3u1WH4jToQH?=
 =?us-ascii?Q?R628m6aA8Zi8WYdDYS0clS/bI1rHetWp1FC9hVnwEdLUM+D2ghK5L7Oc1B65?=
 =?us-ascii?Q?4iK5sVj8RxoqYaNLCUlUnA/NnCJKWemm90F8L/pMcZvZhlW/h5LpdrPsgMuL?=
 =?us-ascii?Q?zcgT+RcFdErdl2Vir/IbBtq1q2ZRPObmhVpMrc29vCr0XAl0zPGxHUC9VVk7?=
 =?us-ascii?Q?WZTsZ+WjKTywZXmAkt+0vxfaznHUI4ugw+NnYIR8mcryKutHH7SMp58CiUfr?=
 =?us-ascii?Q?hbEutEzqZiaFL16XE+RS658Wp+QxPwm+nNfwZM1U1g93TsS2AljMF1lXyZ6/?=
 =?us-ascii?Q?0if2GSyDWC6Cd35JcjgyI70XT03XwLeo0dW4uhJ9KnOnVVou28d4w/Zm51GZ?=
 =?us-ascii?Q?Tu+jj1TVNCtYMpgOOMX+eNWyIVHcs6dyfXr21fnB6JlWbeX3M3wnvRgRYR88?=
 =?us-ascii?Q?GaKP+4d5vCSQYsYHB1GTWOnGpzLL/fFXnaM5SFO6Mp0l6A9zbC27fV26vhIS?=
 =?us-ascii?Q?PsOt7vbxfa+k3tou3icYjoOJ4KjQ+s/Kj24QL3hzIMH5rQstEgvl2cVPKy47?=
 =?us-ascii?Q?AXnjbO25BGUAsloi9B8yX+3cMzfuKmUUhXMfdoVnHcbs8KamhNoM7mTYTW4A?=
 =?us-ascii?Q?KSbpRKRvo5Ydq/5RtsPwC3Y6D73rGpc3ATLWjU5rvNcHhyZIuBWQ+h98vI/H?=
 =?us-ascii?Q?wO03x38XPgTlfbStgOkHP5e2tcyJqceM+chCRMX/VYZoZe7aJLr+RuClhyR0?=
 =?us-ascii?Q?8pEc5WKJ0F9k6tnl+5Zt6FuRkPegnUGfT0did40GyzLXdPdnxgBigPm0yX9T?=
 =?us-ascii?Q?tJ7CWf9HnWbQMC2g8LMVKry1456h8zagkU8DRRlFCZuUcA52+zAoIpnmOIMD?=
 =?us-ascii?Q?zltS7gFluDoWna2sU7yqBixJ9RK2RMWBZ3ik2OzcKHmkhKnjBtj6bJ3HgnWv?=
 =?us-ascii?Q?3Tyuo0PNX8nf8XY6AVAV7AeD8FblSsSWHui+M9h9tPWt+40KbfRZNJBTpOYp?=
 =?us-ascii?Q?JlTCx3L9aVqkhDufGopVaVGt6zkWaMT/gU6p7XXCz3lWxaXRLGufuJVaJAbC?=
 =?us-ascii?Q?xATFqo2uqOHbvhZN0tLpMNN+mY4VA6TDRSV3GXiRIyMnVHdqxi4jMWVrvxAG?=
 =?us-ascii?Q?9qxSJT7nIZIe9uBW0Lt0s5Vx4nfXiMTl1CK9XDLDqQxHCugE4MVZkdJXWuSE?=
 =?us-ascii?Q?lZNieWCNPKZfdE3rD5c=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51498a00-6ded-4d32-a88b-08dd5a7a79c3
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2025 17:40:23.3892
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 77bqYub/DJUIr+brra39gqu8t2W7xCZyOgjvjlY5Ts31Qjnc8eNw4OVxc2IOD8aFOuLyH7deIaSwljOXqkg6/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7263
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_094032_721494_F97C8BBD 
X-CRM114-Status: GOOD (  21.09  )
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

On Mon, Feb 10, 2025 at 03:59:19PM -0500, Frank Li wrote:
> Add SCU reset driver for i.MX8QM/i.MX8QXP.
> Update binding doc.
> Update driver for imx8qxp and imx8qm.
> Add dts files for it.

Laurent Pinchart:

	Do you have any comments about this version?

Frank

>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> To: Dong Aisheng <aisheng.dong@nxp.com>
> To: Philipp Zabel <p.zabel@pengutronix.de>
> To: Shawn Guo <shawnguo@kernel.org>
> To: Sascha Hauer <s.hauer@pengutronix.de>
> To: Pengutronix Kernel Team <kernel@pengutronix.de>
> To: Fabio Estevam <festevam@gmail.com>
> To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> To: Mauro Carvalho Chehab <mchehab@kernel.org>
> To: Rui Miguel Silva <rmfrfs@gmail.com>
> To: Martin Kepplinger <martink@posteo.de>
> To: Purism Kernel Team <kernel@puri.sm>
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-media@vger.kernel.org
> Cc: Robert Chiras <robert.chiras@nxp.com>
> Cc: "Guoniu.zhou" <guoniu.zhou@nxp.com>
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
>
> Changes in v3:
> - Remove phy driver parts.
> - csr is dedicate for mipi csi2, so add it as second register space. csr is
> mixed with PHY and link control with csi2.
> - Link to v2: https://lore.kernel.org/r/20250205-8qxp_camera-v2-0-731a3edf2744@nxp.com
>
> Changes in v2:
> - move scu reset binding doc to top scu doc.
> - isi use seperate binding doc for imx8qxp and imx8qm.
> - phy and csi2, compatible string 8qm fallback to qxp
> - remove internal review tags
> - Link to v1: https://lore.kernel.org/r/20250131-8qxp_camera-v1-0-319402ab606a@nxp.com
>
> ---
> Frank Li (9):
>       dt-bindings: firmware: imx: add property reset-controller
>       reset: imx: Add SCU reset driver for i.MX8QXP and i.MX8QM
>       media: dt-bindings: Add binding doc for i.MX8QXP and i.MX8QM ISI
>       media: nxp: imx8-isi: Allow num_sources to be greater than num_sink
>       media: imx8mq-mipi-csi2: Add support for i.MX8QXP
>       arm64: dts: imx8: add capture controller for i.MX8's img subsystem
>       arm64: dts: imx8qm: add 24MHz clock-xtal24m
>       arm64: dts: imx8q: add linux,cma node for imx8qm-mek and imx8qxp-mek
>       arm64: dts: imx8q: add camera ov5640 support for imx8qm-mek and imx8qxp-mek
>
> Guoniu.zhou (1):
>       media: imx8mq-mipi-csi2: Add imx8mq_plat_data for different compatible strings
>
> Robert Chiras (2):
>       media: imx8-isi: Add support for i.MX8QM and i.MX8QXP
>       media: dt-bindings: nxp,imx8mq-mipi-csi2: Add i.MX8QM(QXP) compatible strings
>
>  .../devicetree/bindings/firmware/fsl,scu.yaml      |  12 +
>  .../devicetree/bindings/media/fsl,imx8qm-isi.yaml  | 117 +++++++
>  .../devicetree/bindings/media/fsl,imx8qxp-isi.yaml | 103 ++++++
>  .../bindings/media/nxp,imx8mq-mipi-csi2.yaml       |  38 ++-
>  MAINTAINERS                                        |   1 +
>  arch/arm64/boot/dts/freescale/Makefile             |  12 +
>  arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi     | 376 +++++++++++++++++++++
>  .../boot/dts/freescale/imx8qm-mek-ov5640-csi0.dtso |  90 +++++
>  .../boot/dts/freescale/imx8qm-mek-ov5640-csi1.dtso |  90 +++++
>  arch/arm64/boot/dts/freescale/imx8qm-mek.dts       |  60 ++++
>  arch/arm64/boot/dts/freescale/imx8qm-ss-img.dtsi   |  45 +++
>  arch/arm64/boot/dts/freescale/imx8qm.dtsi          |  12 +
>  .../boot/dts/freescale/imx8qxp-mek-ov5640-csi.dtso |  89 +++++
>  arch/arm64/boot/dts/freescale/imx8qxp-mek.dts      |  44 +++
>  arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi  |  60 ++++
>  arch/arm64/boot/dts/freescale/imx8qxp.dtsi         |   5 +
>  .../media/platform/nxp/imx8-isi/imx8-isi-core.c    |  47 +++
>  .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |   2 +
>  .../platform/nxp/imx8-isi/imx8-isi-crossbar.c      |   8 +-
>  drivers/media/platform/nxp/imx8mq-mipi-csi2.c      | 179 +++++++++-
>  drivers/reset/Kconfig                              |   7 +
>  drivers/reset/Makefile                             |   1 +
>  drivers/reset/reset-imx-scu.c                      | 101 ++++++
>  23 files changed, 1477 insertions(+), 22 deletions(-)
> ---
> base-commit: ce37eebeae8fa9e6c53f7f1ccd182ad5f27d66cd
> change-id: 20250114-8qxp_camera-c1af5749d304
>
> Best regards,
> ---
> Frank Li <Frank.Li@nxp.com>
>

