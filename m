Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0A3BCA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 07:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=siXFATNL8BPbvaLE5ahkplfgb+xCjvIwRB5Vcpstd2w=; b=ZJLDntc8bg//hLfo8oEgUbDbst
	boPxnCHcAEQfmRCrLhkM8dpHDJS+XZ0S3y/sb3Pab3uCc+4K66NrkWaxhse1u9NhTMynWbG/bEUSH
	KB0I1TwgLPcaaW+1t4t2XfbuPkS5Mdfsz7UZY8CHlaAaJ2rDAGrUfWwMcj3Ol0a8X7GpHF/BcDEi5
	sphVHhHUH+hRjp2UwriBnfyyZpCKzJPPsRUEwoSrZSwDtnxjOleATU6bEHH9j7YEFvGZ7aPTTU1Cf
	MX6eSahdKkvwUfTX0bKzgELQGsc/1MaHISBOJHYInsBXimbkdHJbAHdFLCKzYbSA9jGlEGh31gBq+
	0sPpEFIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE05L-00000000G9x-3VHB;
	Tue, 06 Oct 2026 07:59:39 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE05B-00000000G5r-1ylf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 07:59:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dQdFMt4CdDb0nn9eXkTRZGPMVtTant0eQzURL15MHK3wF+8yymaa3MSdbB9x4gcxhRG5ZWUtT9BE119M+qS/codMXDEA6uomabJRFaVjoQy5liO50aBi7v61xAp76acbxiBNTSZlk9g+8F3hLs3hESKLJFd8gSSJ3BrfiWCwRNcP+ZCc2QISwuMcIvLMP25E5OWdWA67RFF83+wLDdaaOIMiWls19hQ/gpHrCLlTvdeWqd8waHMFa7q9VKg9+9NTO0JKA7h+JRe28hvORaOdJw5p1oMN+XA3iwZYdyg4mGuBlCkPxLPY0MIYaJnrDYfzP6tzlICkRC8qvry3xZtXgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8S1312sNuLQ2UAC4F9iurZB1+7Xe2NmebIzEz5zPWhw=;
 b=fIe1Fs4BAgKGoghNn2cnShIVwyehvzEzeDUrlrK5KFJJHFpLVzBnwc+GittFzK3UQFb3koMQ11FhAJ0TRMAmOYFR+5bj6ynMhuC/9Ae60g9VXGSBaHmskrPRAEdZ+Yz76mgAVLk1F89vZlqsygE0SOKB+809il0RxuWQf4Fe3t+gnbR7DL4poJ3J57jNNnULPki4fUs21B+FxHM8pzJOFkvVx2TXJ4aZfhIHpqEf6EIOHYCLNbRjWk24WOvFZ/g4zXtiAAg5Reg2Z4ikJR4HNUkVEtC1SJXBO8e8udahu4k101wPGcHyQ+bQ3R5rz0nrj6d2Ej+cCu31keOlmEc7lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8S1312sNuLQ2UAC4F9iurZB1+7Xe2NmebIzEz5zPWhw=;
 b=gQfS0C05d+1YPUm5UAME0YQ4Cq02ROgFvBYiNWrR19Wu6uPRMbdO21bWUA2Fkk2xfCY4GJvK6Acme75dLAVj1ZFU4ILYQh2Xv85smBhf9uP3wZBO0hp9XJcA1eCiFVNUi/uMTfz4qo1NZk71Y/yodJNM5ne0HswiGxSn9weMG+ExozOwvNeMsv28j460jYx/KCiWaeNZ/madXWXH/HPLLhvWEjL34iST4lYlYWKfyssOM+teDfeCQtfcLduyWGFcB046MKfQsrSSs9tGs9Y9b5UBdZaSFto2kUTV6dIRkD232BfUaO0Sgn2vvc+32XIyZtU8UluO3hFPc5RCSOPTbQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DB9PR04MB8169.eurprd04.prod.outlook.com (2603:10a6:10:25d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Tue, 6 Oct
 2026 07:59:22 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0472.016; Tue, 6 Oct 2026
 07:59:21 +0000
Date: Tue, 6 Oct 2026 02:59:16 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Nuno =?iso-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Vinod Koul <vkoul@kernel.org>, linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-spi@vger.kernel.org,
	Frank Li <Frank.Li@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	=?iso-8859-1?Q?Am=E9lie?= Delaunay <amelie.delaunay@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v4 01/10] dmaengine: Move enum dma_slave_buswidth to a
 new header
Message-ID: <asSqVEHe8EjkbcwW@SMW015318>
References: <aqws8pN2rfS9-dCC@parshuram>
 <aqz1-OzFobOROuBw@nsa>
 <aq18_TMNs4EJzgZO@parshuram>
 <arDtEB0na9DxDWAS@nsa>
 <arFXc0LqEpgWSS6m@SMW015318>
 <ar-Il2qP_Qms3Qw1@nsa>
 <ar-13p3a7ENGfMOF@SMW015318>
 <asEWwIfO0LB27wj9@ashevche-desk.local>
 <asGk4fj_HQ5HupB4@SMW015318>
 <6f5dd1c1622adbaf0174a949ca91cb11872087ff.camel@gmail.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6f5dd1c1622adbaf0174a949ca91cb11872087ff.camel@gmail.com>
X-ClientProxiedBy: AS8P250CA0020.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:330::25) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DB9PR04MB8169:EE_
X-MS-Office365-Filtering-Correlation-Id: 202381b8-c4fe-4946-0702-08df237fbb1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|19092799006|1800799024|366016|376014|23010399003|10067099003|56012099006|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: +qoyi8UaEgjAqeOg9CJkk1z7h6acAHM1H582kuLFmmME0mcB3n+kej+QvsytN7BYENklzOZXcgHdjVfnXg4QlhiKPFm/z6SXdKEQjL/WAQfjGzMOYrK25MzcEGmpyesDGmNfNI19JmGzdIu/B9R5c9kv5vH5PGkpdEqECYyXCMkLUcEaq6VOZEyFYz9budcb36uSAkCObtEcjMrJzILmsMWJFirmclWqb3C5u3VusUpfh3sFtEAfhcH4gEighHHuqcaLPa4bXS4NdYwZdjL2wd+ndPNUo07b/Ppz5nYJftXaeAKHj53zpazD14exV9dB5CBi5W6vyuzkZsq9Io6apgWTGnj5Mz/Ccp9t5yU7dKeBdimfc5F3Tqei88jdz5G3X39Lc9Wyt/fP21GCkqGfMd09U3AUeC40PbXZQcAyjSnTVDdCkksJp7x4B721lkfmyAVr13FwhnCsYJXFLEl49FycR22pT7pJh7P5sqMEVgMDcIJXAg6xoM9i26Ca7Tn/bCCDmbnsPg9ShX/ow1Ui69MoS068rab9YP31cjUssE2lXd3KtCMFcAEHw7A/rKblJldNmpAagOGpqWpLVF+GW4ubngj8Yp/gdlXLtE388dUAIUgThsTYepqRapfs9cIJDy2f9OW7pyYYd8pT9gR85C6rnI2hL3S/lLbufUQq45Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(19092799006)(1800799024)(366016)(376014)(23010399003)(10067099003)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?2dRSLLqfxUAqfpi3yFrUwwMGPH6P+RNCq1kW4Ik+ZvI2YlwrCVrjqIGcre?=
 =?iso-8859-1?Q?bJcwz8PdBq6DG69DkjsfbhndHxzrcIq85fzr99EcVPEpki9HAVAdB1A8a5?=
 =?iso-8859-1?Q?n6gvtKpcpolsu/lzcdcMZnIlKMOfzpgLUCXBdLw+tz6nFmByjRRwCICOMS?=
 =?iso-8859-1?Q?3uFnpdui06uPtReIKzFPTqDS8j1vI9iY2rESpAYCs4armLbPJIIKRHHn/C?=
 =?iso-8859-1?Q?pNFt6J3s21lswhMwqNQOHz/MmRa1lAcrlCijP2BzLmRHMjwVI1hQCOv21r?=
 =?iso-8859-1?Q?MweIvinkDYPS/MMUQORfOrwwJOgCrAThHgbnTM+OFfkg0s/nSyIon4oAsU?=
 =?iso-8859-1?Q?1Ps4pnj3+pA3AnLhmEG4vcjV6UqXCAcTtGpxodvrQUC5X5AatqLA7k/bcj?=
 =?iso-8859-1?Q?rBdEuEM4bLqx9l5VPg+IapBgw5xisvHgZ/JUj29dwUFrlgFJ0MLON3cc52?=
 =?iso-8859-1?Q?NtpR0iMiQH2ayexzIkPkgi+Rtd2cVob+Hq5T5brZc+eSmvMhbN9HPVAhpm?=
 =?iso-8859-1?Q?mZqTdOVTHGR3mY4LH2pZcaPfytNP0KNHRqbHuYYCpAEx7mLAzqBZB4GHx1?=
 =?iso-8859-1?Q?bJaVp9GjuZUn1xU7XxtUX0YbU8ZVeCdFCroehCw1Kh8to1HHBQegmgjQNu?=
 =?iso-8859-1?Q?JhDPrX5FiL/tMj+guSZ/Vm3KNPXw7g3iVxzWNAfQzwOcLpjv4Tw9hHk4Gu?=
 =?iso-8859-1?Q?26yGyG3HhtB74t6gc3XtHyjdwWVPXDZ0EqnCxAGozJ0hXAIzAK8lMwg5lh?=
 =?iso-8859-1?Q?8snXDoH6MrjZTtkOjUmPnRJwUBk4k7ina/i9+QqYOHIdA0F9slHWQd3ocn?=
 =?iso-8859-1?Q?F3PKqHYs7OEm9TKYMdgZnrx58tuO+B0Ti48MxVipUlR//hPUp2ZKNQiAjt?=
 =?iso-8859-1?Q?4ZNXp0xJFruK6AhLHZ4eets/WkzWgXqCtiQSKFklqNNxX8xMRSKX5acyhq?=
 =?iso-8859-1?Q?TgxM/QWeSa/ddeAuluuUl5lWvp559YdMKcBzB9k2H8pd/3ks3S7jVZDo4K?=
 =?iso-8859-1?Q?MFS0T69ekEvJp26nhYiEJwS8OCviLF5q0NMo4Thsz8td3FRcLIPZMi6vD7?=
 =?iso-8859-1?Q?GLDzuZxtX9dImjJ+XIG+4MQildzqnjwAuBjS3QczpA4w0AU5EELvPDpmwU?=
 =?iso-8859-1?Q?5SF+ZxU77G80k7Dr0WSW5N8BgL5bioVRK816PRt5Ehtfhs9KBFyKi6eCnS?=
 =?iso-8859-1?Q?bkQWRuBJiAXfUItxTonf/CF312DUYvygQ0ykhXi2f9BB44i9ae3E4gw1pY?=
 =?iso-8859-1?Q?a1rVhnkSBMR+FI7t65NMtYeuWPi81JpXOkDF5SoS9aYgcjS1P0i0GUIajV?=
 =?iso-8859-1?Q?ZmceAYTldu+BCPk59HcSWnyFN9+nhR8XWLJIjaKAzVK+RHB1aOZObXVbjk?=
 =?iso-8859-1?Q?sIRUDErI2+gOfD8JoSTDjoZuPQBdDYajZWkW74OWEu6lKklT6iXHpSIiXk?=
 =?iso-8859-1?Q?MGEcIjUNxrDu4NX4h0ewK+3oqiOeakDP8r7ay/QkFImpfpIUgXE0BpWfQi?=
 =?iso-8859-1?Q?L3seiI/US/eens7ZtXz4qSgf9QeSZPmHJucEigUsHnbYMp3HWGnm11d7vi?=
 =?iso-8859-1?Q?HvgvksGaL+LpfqTAtOQ6lrzBbj7/Cu2QueyJ0agilLoNoDX8zsSkOOnG0y?=
 =?iso-8859-1?Q?hD+27CtN2WfdfLZJzmt7M/AlgjzolyVgLbeDh0MCBp7FEdJZmMSSkeIbSk?=
 =?iso-8859-1?Q?jRSg/qMzJv7xIzsq2Y0uQ1QFQk4Wv8yX1fGD7pARoSUEllw+OkoUXzTgk6?=
 =?iso-8859-1?Q?vV6qFncFjvE1yEEQpnl4z7ygAuiMFquN4jxhU6BW/jyhCY1+h08zJiVrJL?=
 =?iso-8859-1?Q?S7pJLKoHu8hcv3Vt8Cr7//trNXLjUqLukvIkXsS5fkcth+FRwaT4?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 202381b8-c4fe-4946-0702-08df237fbb1c
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 07:59:21.9358
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7priwL3EoequfIr0AUCC/obOZGC41UhRwHZ3vlCQXUomQcbFy5pDXAuLjdjKoHEESvbl78SRw/6gtREsPXqzUNzGMNDCRXVQ9aOrCAaW5iw/BtpTLg/2igl0NmKk4wLp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8169
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_005929_519990_37FF1F18 
X-CRM114-Status: GOOD (  25.13  )
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

On Tue, Oct 06, 2026 at 07:36:06AM +0100, Nuno Sá wrote:
> On Sat, 2026-10-03 at 19:59 -0500, Frank Li wrote:
...
> >
> > There are already include bitmap.h, and use
> >
> > typedef struct { DECLARE_BITMAP(bits, DMA_TX_TYPE_END); } dma_cap_mask_t;
> >
> > Suppose all DMA Engine consumer will use it to do some check. So I think
> > needn't split it as indivial version.
>
> Are we sure all consumers are making use of dma_cap_mask?

Some legacy user check it. Supposed needn't check it after get channel.
I am working new API to check it to avoid direct access it.

> In fact the only function
> depending on bitmap.h is the one clearing the cap_mask. But stepping a bit back,
> bitmap.h was the original proposal from Andy so the idea was to have the new
> widthmask (this one indeed heavily uses bitmaps) already as a split. And with it,
> came types.h given that the DMA enum needs to be used from both consumers and
> providers.

Supposed provider is super set, which can include consume part.

> And note that consumers might want the header without actually needing the
> bus width API so the separation kind of made sense to me.
> Then, as a follow up the idea was to also split the cap_mask API into it's own header
> with a backing include in the main consumer header.
>
> So if we all agree with the above, I guess the current series does not really has to
> change. I see 3 ways:
>
> * Just go back some versions before and have all of it in dmaengine.h
> * The current form
> * s/engine/consumer on the current proposal include/linux/dma/engine/*

I think we can put include/linux/dmaengine.h now. The split/move need more
work. I already sent some patches.

Frank

>
> - Nuno Sá
>
> >
> > Frank
> >
> > > where it's indeed required. Besides bitmap.h there are might be more headers
> > > that "include half of the world" which should be avoided in every header file.
> > >
> > > --
> > > With Best Regards,
> > > Andy Shevchenko
> > >
> > >

