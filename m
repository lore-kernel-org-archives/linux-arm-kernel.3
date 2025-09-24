Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0BA9CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 19:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o1Oka1ymqiDCT8AH5vPBbN5SvXLrYjc04NsyQpMOGoU=; b=rmTEqZRtM3tcDJXzeO7vCWAVPs
	MyL+z8NmpYduiRgQ2IHguPi7I+WYESwA+3dIQ+fs8OFkniPQG5ND/rZCdiy9cow47VcLsNuaDfS7h
	9ds3QjeyfoOHMQcbJjxk5LXqobv8i822h6lpiWkkjWilLuKzFBp4+7YmTmxMpCWq4LQ1j2jkJNvif
	qGU4YDIsB5lwnVLTj9c8DyctBoO31Alz4t1Ije2iKg/kXIMeorhf0gaOCnBV5iDk51P5b90IvCA3x
	6dhfNjfpsTU4CU77aorlwP/DB9KAiUPeP99f/uFnUwDffntu0CkvL67VU5DdoVoY+JI4UyTB9YGJn
	qwHul2LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1V1d-000000030Ol-0wIz;
	Wed, 24 Sep 2025 19:19:37 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1V1a-000000030LZ-2ZCM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 19:19:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MeFA30D4RjwchzPA+ImjMYl7368zkIps/ygcGlaXk750HIEdkUmtL5QlQXY6x37ngNYs+vF6ZBD3cl9HrkLGKUjTw9mpm30HpJM8l9WJOmWhbcrV+H7isjTvuCZj4v+sSB9kjc1FQWKSETpVFzeeAvx0bTa8WQP3weZVxVd/Yz72QHs/JUIE6N0AydYzZaButU/uSTf+J6YPOb2oOqAGYoW5imdAcJQ28UOu+c7ADXKmDhM9K75NMI19aVnh1Gea8brrxRgV91H/wkphuJoqT2B1JG9yXxGKIu+vydpwBsOYp9aHtk1yjbuT8+GpLFU4R8CKFZE1Lh/KCqT9tADHww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o1Oka1ymqiDCT8AH5vPBbN5SvXLrYjc04NsyQpMOGoU=;
 b=P/VZSwj6aGwyjoSUPjZd9hildGfaNiKDHrc8VGYBHVBh3JbrI6sewl1G2/UFhbUR2nLMWb2DG8ZyPbvAXDFIUF1hZvynwjVJMm7rZkVWplGmxLf2aDAA+iEU9M7o6uL6Fasv6uXYmMO86v2I/f5lgJ+mfJH0v1ctm8lbmBkVdetEblukGUBbx777u131GabKwPlE3gIMdxb8E6a+G+ERflPZszjBb5od5Sqrqu77PNaQX+TFTlFNx1dkQfeDn31rNWWkI1xymWY3wMlXmCS7ugQC4WhCTtkflFMhPeZmSXUQ3hIgp5myPSm/ZPZwCf09XAaMTlWvdjpmU8rcI3efcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o1Oka1ymqiDCT8AH5vPBbN5SvXLrYjc04NsyQpMOGoU=;
 b=bCiwcRe/B4iHrOAFMD6lm362u0K9TagLSIkIDWjU9LG97vPLprUFDBQZCSFEjBTBKwoMp+pvlHvZYdoAkY6qMMN2fpweV7SEsoLumDo8T+EOMqAVigeqquhNWnXtUXg+2Z75xWh/wTJOeGzwbeyoGHxLq3/KTnGMOdzfbRmY1xF8PX+WNzMwKwLxs98bKwMiW2MAk4hmNmjm6vMpOqEPyR9i9fcjegK8so75a7ii5hi6H+8BhAyOp29REPo77Ki7zM58fkEnSDe+tHNTw9weRklZTcI0nEg5yBBIb8qpyIkmW3+u3xECjNzMK/+mHuUkx4+x0JEHIg8qYs05hpainw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU2PR04MB8821.eurprd04.prod.outlook.com (2603:10a6:10:2e0::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Wed, 24 Sep
 2025 19:19:29 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9160.008; Wed, 24 Sep 2025
 19:19:28 +0000
Date: Thu, 25 Sep 2025 04:31:15 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>
Cc: Peng Fan <peng.fan@nxp.com>, Bjorn Andersson <andersson@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Hiago De Franco <hiago.franco@toradex.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>
Subject: Re: [PATCH v2 0/6] remoteproc: imx_rproc: Use device managed API to
 clean up the driver
Message-ID: <20250924203115.GB2711@nxa18884-linux.ap.freescale.net>
References: <20250923-imx_rproc_c2-v2-0-d31c437507e5@nxp.com>
 <20250924164650.GA2711@nxa18884-linux.ap.freescale.net>
 <CANLsYkzWQEWKM-_iff7wY-sk_OERFiAMSrXP6Cyf8vJfXqunjg@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANLsYkzWQEWKM-_iff7wY-sk_OERFiAMSrXP6Cyf8vJfXqunjg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI2PR01CA0030.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::15) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DU2PR04MB8821:EE_
X-MS-Office365-Filtering-Correlation-Id: deaaec60-c6eb-4826-bf9a-08ddfb9f47da
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nCUhXaP7w8C14oBQuAXZYuQ9yXl7wHIZBQIIMo8LolbOrMNKxqKxwC9FmOg9?=
 =?us-ascii?Q?FtK6GKRhzyGvqRjh4VbuiA/mCLCEeKqZ9KiGBCNBdoNKOqPMT9D+O0kz5BDj?=
 =?us-ascii?Q?LFDY+zzbYNQCAHywGn+hY6gwUsZGaoGBjd5HHmVCJFHWroE3YXNma+7TvxxX?=
 =?us-ascii?Q?PpbqqhtpSr18oxajb2XOK3S4i/GHpoDR8GdglsxyCamDZn4R9843GN5y0y0v?=
 =?us-ascii?Q?9QSBLtT0YLMpsHeumhBmeu8mx9JR1zlYR4lAwS6GJOICwym45Kc7Wc6sQWn2?=
 =?us-ascii?Q?FeDlVliKAkcfy402fbIMzJl9N5DJCmPidVuc5OTDpDdZJy5HkjS+cN435S4N?=
 =?us-ascii?Q?JPzwegH3BylASg/s2msDAPVhanGk+hcF5rB6h/15ypjWvNHl9cjgR6VWvipS?=
 =?us-ascii?Q?+9Tmx6d3M5kQdJP0OLKSLrNfifj/4+ykPfW7zdb7WF1dTQafUEFFIvLyT6ZB?=
 =?us-ascii?Q?fHYZOAMHej1XiwxqQOI09Tz9vUJ4GWg71T2l6kUi5nrz4CEI7Hkj9Y6uEFja?=
 =?us-ascii?Q?3PDzpYkOkG0CcmiD1FAv9NfbW8G8wCVE9rNyeQ9qm39qWKhGLaUAe6tjjta7?=
 =?us-ascii?Q?EZTBk4PjhPvCr3tTMHgqGgHat5Aph3WAAqe0jPmWQL/UwiMZb26/WNxGSsYW?=
 =?us-ascii?Q?lTSfvn1BMs8nQ2zSm1yFAOouUGt4NYJ6Mkz2/vwiCXV5qZygWWPgBEU2HuT2?=
 =?us-ascii?Q?pqX4H6kicObZiCvF8YPTOmS75j7jerHjSyllbvn2wLxkex5D3aD2eCKIL1Ki?=
 =?us-ascii?Q?cn4mBlg6rTcfobRHtupa+HvcutzEXuyJaAhd9TMK1nMCMSibpIcmWyqzPhL1?=
 =?us-ascii?Q?7Vz+BC/7abbU2Pvr0GgOPgGy/YVhopZ4y2i92/MOea+xVincS/D/l8H+HR0V?=
 =?us-ascii?Q?Nyr1e2vlXlqN04Gigpv/6K2ecwL4jQp4IXeiGtJdQ9hdTTgFuwtzQHNF7Vu8?=
 =?us-ascii?Q?CYZ7EuI5xnyrYYf4RVaWhQahYBkdAAyo/ftowDTdZq7GYeFt7vgvTJ6WriKd?=
 =?us-ascii?Q?LIHyerJKwh1Jl4Pfwmk32id4KyLGsYHIxx3sy9f0mqlt6saqi2x4Yo0yefJR?=
 =?us-ascii?Q?49fcxArm3aznb7+AMCv2oFPsewxPjSRFbjwJ/O0llyHfUS9JaJq1Qi+1FJvn?=
 =?us-ascii?Q?VChST5lj8RVV6wcOwJvPieecNAyfbJvs1B3l7i/+ADMh+FqtVoDfXhqA4pkp?=
 =?us-ascii?Q?2TnNeObTI7S5IeB+bCPTg/Ug93DFagbWIVZD+yEDyuP+dnYn698/X30OdAoK?=
 =?us-ascii?Q?t9jsRnhDeOwuuINuk2R8Yy2lggT3LFIDxB3LzoVaWcTUED1BE+vMk/3ClIY9?=
 =?us-ascii?Q?NodPtNDuC5rALQM5zpptO5VdzpbCDmMyogt31JP4ZSdroiQyMEvXKybvXpO+?=
 =?us-ascii?Q?JGems7fMnruL1OKjxc0ZVi6RyLdr4L1oR7PediHVk5L3l0ojIjrmi0xdEKXO?=
 =?us-ascii?Q?9+gnbG02NRw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?E65K8nTCzm3jiJdB64llGk4Jk7siPvF7OeuCbZFP+X4CH4Ff/C8MZYHKEHYa?=
 =?us-ascii?Q?V+mf/6yvsbmTtyUe1su3tlScBsmI+gW7El1Ekcg1y1WmVxVUU/L9JvCGNvaJ?=
 =?us-ascii?Q?AT48zIQgFC9plvbxYT24gPVI0fVJ/I/V9OtpwHcCeHwMjwDog4yCBB+SqsKo?=
 =?us-ascii?Q?4HFQyhTQsfLymtHxRZm90TMTljthCvm7jLy9gvx6Bu2ZKxQpxam3Mriejahl?=
 =?us-ascii?Q?AuxvJjxdorzUlkmbBLH3sAO5e8fHF/NCmw6AcGyrUSHMDJilWYp0y9VQy+g5?=
 =?us-ascii?Q?ojck202RHWtvTzauEgvG8toVkguUgm+mvJt4s3aBnt6PrsjW9nHyYvo5dLQl?=
 =?us-ascii?Q?9wScV87R/uve3gErSPAfh6W7DalduT9Wsozr3V945zoZj6GcOGFVKnGC0N+4?=
 =?us-ascii?Q?uXGO+lNtAS7tme2qpOfrq1p8pd/lCw3nTTTW/70IzGcqa3qj6/ddTKQkaqFw?=
 =?us-ascii?Q?FD/N8hifRMRM7PravFRfxCvVegljTTPRAr5wbrlBYqGurS1IA4LxCEDqnzW7?=
 =?us-ascii?Q?AC2/354NkdX9RAEf/TxG7v9o2M+hxQpl5BI6Px+az/MxXPqLcOUcwiqBDZs/?=
 =?us-ascii?Q?s0XasKsdEjSa5xiTNeGwDbHz7kC/P85MXLvO09q6DQRZK2SpNPY2dEh5LEao?=
 =?us-ascii?Q?ujhB0lnW9TGlDke/4JOpcBiD2DPM2Tzvxuti0kyQTnLIKtCHLxhnFWHD4Y+K?=
 =?us-ascii?Q?DCnrax/fayjQU/dBNZln5vBhiUJWOEdArq07BNmVyYb/PEcGQETnU5joR4A5?=
 =?us-ascii?Q?m5rN+LPFGBOtFa+6EToLSHwIZ6tJ3gWwqQnRgVwyeu4OSRrvD8CyV7D/cLIS?=
 =?us-ascii?Q?JBkL9nUKw84t9ksS8ByOCBlvgcn/Gk96NBgLiB3QbdB1nhNH/5vl48XQPk4+?=
 =?us-ascii?Q?evgQpcOc1D/yoq+jjG5KD7Y+ed1bE1+MawqVv1C+q8Kn+7AWD1ecb5yFuP/m?=
 =?us-ascii?Q?dLKUwL80jYkYTvD56Md6fHk99CRbAmnuTdAR8vADfaIjx8a0QJ5d36ajGNgX?=
 =?us-ascii?Q?7S40P35oZf8COMCCbABfP6qaohqiEEj3kpIVKGCE2UYCJ4YfNCN65QNIv7Uu?=
 =?us-ascii?Q?6KV7ocBrOO7iwoNHC6sThDBdh7qb7qq3xeKrviPMO2Qxqjd4SE1J7Zrb53Ng?=
 =?us-ascii?Q?/h07NCQ8BAGUlASH/wgJPrNi6RRCBVT6y8Kc37ehz3VScudj5mYfl6t6R/8Q?=
 =?us-ascii?Q?iVhpIFLbfGG2JsB3zkmU1mJoXhAep3ofQ0RtfoUSA4cMiAptd8LknDzUCLEh?=
 =?us-ascii?Q?M8TZfmrg2hb+YQnQpYC9YFxJJUhd2LXUCxliTSo6H5XTME4O3AaqS01+IQab?=
 =?us-ascii?Q?MP7tsJ2WKPI6aEGo2hDxRRBudAUZSUY+B6FyOt4hgCsl2AsjUbIKl+zfnPO0?=
 =?us-ascii?Q?IvLr6B1yngTr3Ozn7UB02wDtnHcwpgDInXDlg+G3/VI+ZLpCfcJwciD68oz/?=
 =?us-ascii?Q?m0earhMo9dfife2zVyVQlUCNcOCIYFm8dgMmpv2Tvc7A0B1BkYykyxxYJqNd?=
 =?us-ascii?Q?GtxqM1GbbdxDrXSifRFUZtfdIc4547qwOqqU3v84WrpacpoSMmRrz/lYKQdu?=
 =?us-ascii?Q?qxzzCe60RaPWK8TcHGIULokUHnbCDQYlp1HdHK9W?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: deaaec60-c6eb-4826-bf9a-08ddfb9f47da
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 19:19:28.2447
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: imsVw3AQIgMbdOlY5G4kYrpyDW5MBJog3/t6H7VjiWPd1UfUKiIZ1sWsGg73s29J5LEMKH7O16qt1poP05xGeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8821
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_121934_663596_8889A5EB 
X-CRM114-Status: GOOD (  19.35  )
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

On Wed, Sep 24, 2025 at 11:10:33AM -0600, Mathieu Poirier wrote:
>On Wed, 24 Sept 2025 at 09:35, Peng Fan <peng.fan@oss.nxp.com> wrote:
>>
...
>> Sorry for early ping - I just wanted to check if there's any chance for this
>> patchset to be included in 6.18, along with the other cleanup patchset [1].
>
>It seems very unlikely.  I am currently looking into how the PM
>runtime framework behaves to address my own questions about this patch
>[1].  Furthermore, I am worried about the usage of the device
>management framework when it comes to freeing memory.  I will get back
>to you with comments on that front when I know we are doing the right
>thing with the PM runtime framework.

I see. Not sure Ulf could help clarify or review, then you might take less
time.

>
>I dropped the 3rd cleanup patchset.  More than once I asked you to
>submit only one patchset at a time and you still refuse to take notice
>of my request.

I apologize - I now recall your earlier request to hold off on submitting
further patches until the table_sz clearing patch was clarified. I
misunderstood and appreciate your patience.

Could you please clarify whether there's a general rule in remoteproc that
developers should only have one patchset or patch under review at a time? If
so, would it be possible to document this guideline in the kernel documentation?
That would help avoid confusion for contributors.

I ask because I have other patches queued that are independent of the current
series, such as:
 - Reintroducing the table_sz clearing
 - Misc cleanup in remoteproc core

I understand you may be busy and have limited bandwidth. Would it be feasible
to offload part of the review work to Bjorn? I rarely see Bjorn reviewing i.MX
patches. Alternatively, could we consider bringing in a third maintainer to
help accelerate the review process?

Thanks again for your time and guidance.

Thanks,
Peng

>
>Mathieu
>
>[1]. "remoteproc: imx_rproc: Fix runtime PM cleanup order and error handling"
>
>>
>> Both patchsets have received Reviewed-by tags, have been tested, and
>> successfully passed builds (arm64 gcc) with each patch applied incrementally.
>>
>> [1] https://lore.kernel.org/linux-remoteproc/20250920-imx_rproc_c2-v2-0-3351c4c96df5@nxp.com/T/#ma16bb8a38300f6eb333ee04f00d57805aee3c114
>>
>> Thanks
>> Peng
>>
>> >
>> > drivers/remoteproc/imx_rproc.c | 128 ++++++++++++++++++-----------------------
>> > 1 file changed, 57 insertions(+), 71 deletions(-)
>> >---
>> >base-commit: c3067c2c38316c3ef013636c93daa285ee6aaa2e
>> >change-id: 20250916-imx_rproc_c2-2b9ad7882f4d
>> >
>> >Best regards,
>> >--
>> >Peng Fan <peng.fan@nxp.com>
>> >
>

