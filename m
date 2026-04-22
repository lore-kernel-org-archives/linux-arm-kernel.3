Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64AADF94CB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 03:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/LJkj2FvTQ1BNtpVHnwLLKCjNLJTwG1GyevFvLluBU8=; b=BTpxqC9whllPYlc7AD5JZvjN2m
	9wkjqc5q4YKvJW98sLXpB+3KzxT4BHXpCd8ceHwLugRFsZZIsLpxBNaOOCvG8cHmvkm6nZIf0grOo
	u/uRW/BNqWZ/swODa3BM8a0zR+lg1kDHhXLJ7sJMfjp+CvxFpsyp6meP776K5A6MQX4YEvG51nIw3
	Sdf+/8+ArZQG7g03y8220tZ+UTSPCael2cWkURR0T4RVOHWi8bHhqDkNWKSi2wUkgjM3RF3eQOthV
	I6Rt6rkWl7ptpjQVFlZpkKlaneAPx6x8leZSZrCJkMtnqrm7+aAnHIAANi44Mgm15jHerCgC0lWog
	fWq9b3Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFOhy-00000009ZB5-0lpN;
	Wed, 22 Apr 2026 03:57:02 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFOhv-00000009ZAU-3Uaf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 03:57:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N5lLv3DJFAsD2z/jUri57AvqWWynOWb27tVaSsmcBhgurJ8sgdx/DTnmcizUssWIG8LUC73uHsJsnLyUvWRtfAdkdVJbGrzSmPfcUfPY5Na3jiG+dAvDjs6MiW4Bvp/qtxgjsSiC2/oNiXxLnyMOmWm6qJvLqhUwOveHlgKS7JHVjdVYE/zvCBDBzUgGQaVXSGmAPxIgT15lG1HHXGt4b0ulvV+8wJ6o90EWVSIWOgJGUKyBEsuBuUBdwOfy5H/znWYHbBGMXTFwCthMg/PaQRLDxt/KMlhht/hB17/2GzSHMBNAKiHIVtU0bqu1gQdmm1BxFhqS0A8zCzxm4NrC+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/LJkj2FvTQ1BNtpVHnwLLKCjNLJTwG1GyevFvLluBU8=;
 b=sSA8N3FkpslN9k9zfVBs+yJf/5/4hj8NZnQWrkrZIsfW+hT9zne4JXPRABaTtAzyZafiSPv0TfkcSChH2CoBKPRwCX/Hv/k9ayUX3v3mXwV1Q0JFZjvvBtyva3oCV23zsuIE/sglFrvd4GjKGN/h0pTls/UCNbcq1o8LXudxHEKrPmg4wYfhhVzXKq7ej0H4BFxGczW4Bq+3xpRos1OXj1rpaTZv9lJuR0NmcEv48pTWaa9IYexkpMLi37onBYs32Lad9P6CMasFknrBCTaw7e6ajf1binqH/x3EMA1+jbs+qVQg7rs2J/NmnHeOVlGPNCp2dUSUzRcr443wdN6DLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/LJkj2FvTQ1BNtpVHnwLLKCjNLJTwG1GyevFvLluBU8=;
 b=QjFQJEx7oo46lVwG+qBL4mEbszXAdNME4im1BTRJb5+GwyFxPXy3tQMW/IMgSpHjbs8X3g25e5C8j6EZ9kJViQleNFeE+dEbAHonFLESjYSCt8CdCzBDCVOQRy9fwXmymB0UB51xEF4FF0YLHtgPiB87+YiNcrVq4cSnO6KRKv1gO32J/DnJw0KWul9iwpJaWuXqiPRd9CHfIxjk2RBApgyWBUYIcmg4NYSLZ4lGZYczq6kahZSEmBoFogDZ8ohxvxlb3dDkk27LprwZOUPgCVJUfrhBgDReqONYNEg6/i8PBnjWB0tlh/Og2CWBKC2JdZrmChcPEyaFcLFgbqlyMA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DB9PR04MB8378.eurprd04.prod.outlook.com (2603:10a6:10:25f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.18; Wed, 22 Apr
 2026 03:56:55 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9846.016; Wed, 22 Apr 2026
 03:56:55 +0000
Date: Tue, 21 Apr 2026 23:56:46 -0400
From: Frank Li <Frank.li@nxp.com>
To: Jacky Bai <ping.bai@nxp.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v5 3/4] thermal: qoriq: workaround unexpected temperature
 readings from tmu
Message-ID: <aehG_hBSostFyhNg@lizhi-Precision-Tower-5810>
References: <20260421-imx93_tmu-v5-0-05ea1969bb9f@nxp.com>
 <20260421-imx93_tmu-v5-3-05ea1969bb9f@nxp.com>
 <aec_TlguJkc4A1qN@lizhi-Precision-Tower-5810>
 <VI1PR04MB6861B0C33CF3030D6C9293B8872C2@VI1PR04MB6861.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <VI1PR04MB6861B0C33CF3030D6C9293B8872C2@VI1PR04MB6861.eurprd04.prod.outlook.com>
X-ClientProxiedBy: PH8P221CA0048.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:346::29) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DB9PR04MB8378:EE_
X-MS-Office365-Filtering-Correlation-Id: e72fb94f-9570-4288-96ee-08dea0233185
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|52116014|376014|19092799006|1800799024|366016|11006099003|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 8+LKTGAuk6YTVlTUC2FAsrZbMFj9Sz/22fTlO9JzOhlB4p2grS/UwHrddc7QLDeTxrnY2Nt/YyffD8tHNecc8F7AgXcsqOmxSo27HyGHT4Wq6r2hijcXCWtW0BwJJVNtfyAUMYfSwb+37YxVtZdA/JA48rVwj+umeJ2WNLV9sQQ9x+9wu57C8CJIsPpWa+1Qg/rPuIcOsjG3hCEKYKBPs+USBd0/sN9lZ32tBGLx7ylgqVukSReWFq1d9GV6o8oGjzseNUO6GJlsa0nAQW76ugKASB/2CdDoSNWGfXQMpEpGg5zcDU2gYNE7MOmzk/DNZySUkiimp/AJNFti9gsNGd2af2Wk1WuUjcpiLEG3csh8zGiq+TFYI0E84dkhjxpTnJDrn+LDXUWurEba+HLGh7bzXBmC8WUnBBeaJ798CWhjfotBwzoyo0iWNg6Adm/qgqldBYcg/43uADevMZ6y6kS5qKalShkx5VgtNudV/UReJD6aj88WZuYRxsU+0R3Yzj0OH63L48LrdzmT6hW7O6OpGrBi9scQWTze5AI6dKoyrnpSfDSik33JBTUpvzQypxyLYVxdKSPO9QKhHI6b2zLK+zJt6C0TAXLptVaw8BHJVdwN/8jWSK2UY+X/JWF3vcNPLEdEf82sMXHXhjtTOLUnjXx63YRmr5Md4/3HzOA6bVXvG6vTqfruVEHpglXn+syJ9TX0uUMzAHqzb1snyhczp5T2u2DUaD90Tohbz01w3P8M329ZYt1KAi/pX+lptPCBsJExFCEyy9ADYx9Sw5AW+8UP6+CPmdD8L61aoGI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(19092799006)(1800799024)(366016)(11006099003)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1HGHpckfymjjq2ZH3nK47IWQGCkrW7Qr1r3sMNUxG1ATomP7QV8DdcYEuwVE?=
 =?us-ascii?Q?pvFIJmmQp789DKILuw8fOz2TpfFdbb1IOI0tF7lFsJj3Pnijt4o7Qp93ZUzM?=
 =?us-ascii?Q?gtfuRhUPyoK6v7eOIqZkQP1koYRzGurOO7bLI3FlwAp8EEvECtNtDldCIRVd?=
 =?us-ascii?Q?I4oGSVkEaKGwNLAMbl6zHGL5rlWO16oetZ7t1SqLyraMa/lqqlgr03a25Dll?=
 =?us-ascii?Q?cSBex7AH/g/M1GBQDXqZK7oE2TnvrPiwwyyLyMVGwhZjNiUk5jqAcDYp9BGX?=
 =?us-ascii?Q?QH0uPO4ZXRxTlLmU5i/nrG6wQs5htdwvOnx63uIz66+Llxuih+ZNGuisZsiY?=
 =?us-ascii?Q?qgSU7Du7DJWGwqr4R9G7Wx4hAqxr3KkKHrQDB0F1kO9/TPaOsMMzuTNWEyTc?=
 =?us-ascii?Q?JyJVxrWBTX18/oohwBp+1bHGqtA5q5j2iUu/7v7JrJraT/n752kuaZwInojv?=
 =?us-ascii?Q?JqLfg96/Hd/xlxbM7mp4Ccp3wKtXbGl5XTa25z0p1Vavw8B/chXKeh38Ea0k?=
 =?us-ascii?Q?qXyFDJgKsUPL3vIIzrlmJAaYiEVoe6cYbk76MU0ZABS65K//JkARPmMehHJr?=
 =?us-ascii?Q?6A+TBCiGhE8NLNqMOhLJWeytXQRTeDsBFUDSeYAEvvTNjfywvt5dBCvimm1f?=
 =?us-ascii?Q?j/aA7q7O807g5W4ONwT6GhVtlidsZqPt/PrVEMkrQWNrVDY3A6RMtASzerNm?=
 =?us-ascii?Q?HUIVfEDBifZeihFFj0dvgoGTi3tfqGi98ir820UmuzrKf2SyoiVVMNEIoap+?=
 =?us-ascii?Q?tKQqxxSmiZBHGCBUzTukXUOswamvf8Ff78GeWVkLEEj5Mt4HJ2rhWOzpUFz0?=
 =?us-ascii?Q?V0npSXdbvEI+sgv9GoAbDvoXcY/9PzC4bqEMNQqJgx4g1ZiweNXZsYxEnhjK?=
 =?us-ascii?Q?VGgl1MNjJukbOVJdbpIOyfS11Qe5wRsiQCEQH/dPDIl+DwCR8JpINHxvnyLU?=
 =?us-ascii?Q?EOtgjaUrS5/jj6UPrXPDO58EIN6idhudjf0AecBqehaQ4Rv3LVQLhXP6mihf?=
 =?us-ascii?Q?l/Wv9ZeTVYgZKrC2SGzG30WESFlYAsem1gmJVUyZan00hCoaC3Hamz9vK18N?=
 =?us-ascii?Q?mVYJKEhIYQ0QPDzThvx3eA9eQevXKxJ1fAKXK4vdOGRp6kKoy8tuTtCEVNrg?=
 =?us-ascii?Q?8/gIrVBae+RPqFy4qYj8GcPAa6ieQ5LVADvP67x7gvRGNnRRSCnyntr+3hb+?=
 =?us-ascii?Q?SuwrzZg1oG6hMjWy8Hq+R1tnNE2Cy9LGvQlI1iRb5m5whxBXjWKlaBmcapAt?=
 =?us-ascii?Q?BaFGkGCoAuwFh3xGxinAmh723cH+XZ5P9K2y2LFluvyqMNsrqM7gBrFaV/3B?=
 =?us-ascii?Q?uINjb6h4wa8NnfRLLQtegJ8vgMtZ+rod91SrzdTeuiBv2iUYm/zxkAkX2ukm?=
 =?us-ascii?Q?/lJ0qU3YDissMzh9uNVMdTpFdU09oCYCi4R+uxqlIWyyJC5TzwV6AFBuarNL?=
 =?us-ascii?Q?v7p5LjTYZNFzsS5x5uk9Z6bqZgZjbm+jAayP8yc53r/0qoua94T2OBq3M96P?=
 =?us-ascii?Q?TSpuBCegJwvH90hJ5cJ4QL18CAZ8lnLLL0x1X1uTXjPafO8ccqIThBXIEBeo?=
 =?us-ascii?Q?q/eejjhZ4DCItQYJ3ktvKKso4W3u9djQGP28bkotGvLSpxAdXKXAQp62fCkL?=
 =?us-ascii?Q?covjNMQAqAzjY+3T/LjwpVSOwr5TZscZbbvctGWBhxWJFRtt3U/U8jPqo2vl?=
 =?us-ascii?Q?J4ZEMEbc4RIwlt6j44QCWq4KZ279dIh8kcMZipwSOO372Qwz7JzHWiXB5rTl?=
 =?us-ascii?Q?mQa/QDP6bg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e72fb94f-9570-4288-96ee-08dea0233185
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 03:56:54.9696
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o1wJq5UnO1g2+WQgxfdJ4G0mRVFqQDKvBBMO5qZ9e9/f2g3iu/ffUNwqT24tEBKEnPvQ1pq/Ff4hwfHdxmt8Tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8378
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_205659_894355_76C311D4 
X-CRM114-Status: GOOD (  26.21  )
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

On Tue, Apr 21, 2026 at 09:56:18AM +0000, Jacky Bai wrote:
> > Subject: Re: [PATCH v5 3/4] thermal: qoriq: workaround unexpected
> > temperature readings from tmu
> >
>
> [...]
>
> > >
> > > +	/* ERR052243: If a raising or falling edge happens, try later */
> > > +	if (qoriq_tmu_has_errata(qdata->drvdata, TMU_ERR052243)) {
> > > +		regmap_read(qdata->regmap, REGS_TIDR, &tidr);
> > > +		if (tidr & TEMP_RATE_IRQ_MASK) {
> > > +			regmap_write(qdata->regmap, REGS_TIDR,
> > TEMP_RATE_IRQ_MASK);
> > > +			return -EAGAIN;
> > > +		}
> > > +	}
> > > +
> > >  	if (regmap_read_poll_timeout(qdata->regmap,
> > >  				     REGS_TRITSR(qsensor->id),
> > >  				     val,
> > > @@ -130,6 +159,15 @@ static int tmu_get_temp(struct
> > thermal_zone_device *tz, int *temp)
> > >  				     10 * USEC_PER_MSEC))
> > >  		return -ENODATA;
> > >
> > > +	/*ERR052243: If a raising or falling edge happens, try later */
> > > +	if (qoriq_tmu_has_errata(qdata->drvdata, TMU_ERR052243)) {
> > > +		regmap_read(qdata->regmap, REGS_TIDR, &tidr);
> > > +		if (tidr & TEMP_RATE_IRQ_MASK) {
> > > +			regmap_write(qdata->regmap, REGS_TIDR,
> > TEMP_RATE_IRQ_MASK);
> > > +			return -EAGAIN;
> > > +		}
> > > +	}
> > > +
> >
> > The above two code blocks are the same. Use helper function to avoid
> > duplicat code. And why need check twice?
> >
> > 	ret = qoriq_tmu_err052243()
> > 	if (ret)
> > 		return ret;
> >
>
> The first check is to make sure no error already happened. if any error, no need
> to polling read the sensor value from tmu, return early to save time. The secondary
> check is to make sure the sensor value just read out is still a valid one as the error may
> happen after the first check.
>
> It should be ok to remove the first check. As the error only happens in some rare
> corner case, the sensor read polling delay is acceptable.
>
> If only keep the secondary check, I think no need to wrap this code block into a helper function?

Yes

Frank

>
> BR
>
> > Frank
> >
> > >  	if (qdata->ver == TMU_VER1) {
> > >  		*temp = (val & GENMASK(7, 0)) * MILLIDEGREE_PER_DEGREE;
> > >  	} else {
> > > @@ -247,6 +285,14 @@ static void qoriq_tmu_init_device(struct
> > qoriq_tmu_data *data)
> > >  		regmap_write(data->regmap, REGS_V2_TEUMR(0), teumr0_val);
> > >  	}
> > >
> > > +	/* ERR052243: Set the raising & falling edge monitor */
> > > +	if (qoriq_tmu_has_errata(data->drvdata, TMU_ERR052243)) {
> > > +		regmap_write(data->regmap, TMRTRCTR, TMRTRCTR_EN |
> > > +			     FIELD_PREP(TMRTRCTR_TEMP_MASK,
> > TEMP_RATE_THR_LVL));
> > > +		regmap_write(data->regmap, TMFTRCTR, TMFTRCTR_EN |
> > > +			     FIELD_PREP(TMFTRCTR_TEMP_MASK,
> > TEMP_RATE_THR_LVL));
> > > +
> > > +	}
> > >  	/* Disable monitoring */
> > >  	regmap_write(data->regmap, REGS_TMR, TMR_DISABLE);  } @@
> > -400,6
> > > +446,7 @@ static const struct tmu_drvdata imx8mq_tmu_data = {
> > >
> > >  static const struct tmu_drvdata imx93_data = {
> > >  	.teumr0 = TEUMR0_V21,
> > > +	.tmu_errata = TMU_ERR052243,
> > >  };
> > >
> > >  static const struct of_device_id qoriq_tmu_match[] = {
> > >
> > > --
> > > 2.34.1
> > >

