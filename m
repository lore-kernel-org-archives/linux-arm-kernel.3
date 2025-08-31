Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B144CA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 Aug 2025 07:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l/F4ypvLS4Gkr/5JPuDTIZKbpyGgGJAxWZdeK0Uxis8=; b=HOPk2ga/Obiq0/OYOO9w5KqyJT
	BSKOv+UbpRhe6oxQ9z4hpa1woDtBRHm30hbXYRN83jWtaOMJ9/E5td3gUIxfODa8PbylH1RmJ3l2h
	9DY8KrTsWy9o1sLXkLfOFcTUJOmzKoS9z88gokj7X9/TqxzzDK6EhdP1WMXI6AdGP3KGSPMSAOPw1
	kzwLcBMWBWVPKX3L+gKuCoQwZTXYqBG3Dqtvn5Ha7ldXgkbYDLBchkV24kTY6BmF8mfTgtPQun6h0
	vOLdNNLfDgRrZ42w96j2yFGaMrDW4NdyhDtx0UxS/qy7mHKpkiSVF41bVp65Lu6lsml6tnQ/qOZdV
	zBfxMFZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uscHM-00000009rOk-1AHM;
	Sun, 31 Aug 2025 07:15:08 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uscDg-00000009r5h-48zH
	for linux-arm-kernel@lists.infradead.org;
	Sun, 31 Aug 2025 07:11:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M5huiuKfG5sQotjN8318Kqcd66xCZD6Rygj4ic3gMG5SS/LRZ3xmdoflDi1xzzCC96AzdZZ7g+ULFoggdv9BNX+SrMpDzCrvCfFfF9mRiIojBFNWAxGb6gbkmQxUJ73ZGAPFS0nfM0vuKt2KXLuj/Lo9h8wXqGfqrxZIZmXtaR/XpXglaEgDwKTDhgJTvbAKi+Hg1keoHzd74IFDGq3enlMENtsx3eQDxGsKLgtAB1FXE6mFMj6r8YRbpkiD4m2RjQ2+8PKTeebesxagcnmRwRJxKw7/V+qOM3rdnFUqe6/E/N1cHw4ZGoQKZpua7wRPyrIwqfQegS1JaDnPMGYYbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l/F4ypvLS4Gkr/5JPuDTIZKbpyGgGJAxWZdeK0Uxis8=;
 b=CrvIM6PaMVcSrZHPmsEqLgyG6LicG3/GQX98z/8LheN4BjepfR3bonaL60lVtlQr+I0J+yRv4OxGIJC8dI11MnfhPahhkxHz2v7/ZiihP15wUu430/C4tPCc134retra0NsjOJl4vpl8XmS+sGvA6y2qTEIELAAJXFVx6/oPYmsj0rotZtGuWWCbxl1h+W/jRjUlMMQ98O/Q4bJtwH/ifNIRsGq4JlWFlv39jDr0JG3Phpmc1Ru+TSP3lE1lCLwB0uebJDmBIvf+Dw8uezwqtUXVOwhEXo2KCixYBK+JcvkzKPSZrEec4QaEZfdd0wal/ltA6OsmH9+hcqRNzyE6aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l/F4ypvLS4Gkr/5JPuDTIZKbpyGgGJAxWZdeK0Uxis8=;
 b=SY1QqqTM7oQPuDd7StpapjeKfFCFpm2Pfaf3iIekiaZa+28xDj5nJSx3IBq4yDa50S6Dkhfi0StrvTgGJxVdwuSJFEYXPKwVdLUAWVoMSVs2/lAQzjvsnGfytMe/EaBDLfKYyIWcTxRqMMYnsYjIRZtyKw6MOPZxZjTdFOoNMQUVZN8zHmEoN3ByUOWSbilUhq7N6YXlaPu73MAhF6A3KO7+ne/oxF+t7w2rIIx+xnn3bYnPEDM526AxFhg5gFyqLXxon3+l9Y84rRhPYh+XLUvIfmbjjpfUcyNz/Y73a/VmFDjvQ3/P6Fsb6mqje6Q0R8wke9nY3F5kEtoyL6uMpQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PAXPR04MB8174.eurprd04.prod.outlook.com (2603:10a6:102:1c4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.12; Sun, 31 Aug
 2025 07:11:13 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%7]) with mapi id 15.20.9094.011; Sun, 31 Aug 2025
 07:11:13 +0000
Date: Sun, 31 Aug 2025 16:22:29 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Peng Fan <peng.fan@nxp.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, arm-scmi@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/6] firmware: arm_scmi: imx: Support discovering
 buildinfo of MISC protocol
Message-ID: <20250831082229.GC17728@nxa18884-linux.ap.freescale.net>
References: <20250827-sm-misc-api-v1-v3-0-82c982c1815a@nxp.com>
 <20250827-sm-misc-api-v1-v3-2-82c982c1815a@nxp.com>
 <20250829-woodoo-acoustic-lynx-7ffaba@sudeepholla>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250829-woodoo-acoustic-lynx-7ffaba@sudeepholla>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI1PR02CA0040.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::7) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PAXPR04MB8174:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ec770cd-7c01-473a-d26c-08dde85d917b
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|52116014|7416014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tzOQrLy51jH74g8WKH6bAyLh8ffII1oTfgVvs6tK06z1fOrDplljhWi3IyZd?=
 =?us-ascii?Q?DwT3kr3YZfNp9A+KVtyTN3YQl6jnureNqobQTrOBwjty86PqI+oJ3HngXZAZ?=
 =?us-ascii?Q?vEgg7nG/7mUq6maEQoIaPiAXLD5F/K8wP8BsBhZE2h03r5trs9mSKSIivwWq?=
 =?us-ascii?Q?xHFWH/i4CFxvxaWJNMCk6PhOeh9EaPDbOShT4SvLv3Dj/ijenTHWLJG/EWz1?=
 =?us-ascii?Q?OJHUZA9QGCwum7QMQ1es4G73dxPT9T0dqDA2GPWAUtFanjlDWalmy9UxGWQX?=
 =?us-ascii?Q?X60pLRormJ5v7ilXro/vatkRYEUUy8uoJ5L0my98uPIZDh+r4IyhWZfc5MFE?=
 =?us-ascii?Q?Q01QacSTR/xILlvvzRV7It9Sfy6NEEP1zFywRZqJUf8cXDtRjYbsZsadnLRb?=
 =?us-ascii?Q?39pi0sKNspFuZM/9Z9NN/ZB6emXRlQ9+lGpp+m4O+ErwaOBb182c/SVl2eR/?=
 =?us-ascii?Q?Se1z/PWVA0JPS9vvY92Al7fQh0ZZijckO5a/7fqA1eGgPPPb2PXby+6c4WkZ?=
 =?us-ascii?Q?9JDcTmFy/yfaD6/YYlyritWWO6tkeeq3l/lXPz8hjq9zRThlZXcQ1w6ftHL6?=
 =?us-ascii?Q?8TbhZKhjg/6lQdHsVisxqNgfPyZ3YZMGt/znYRpKU5/3cNpXB+Y1/r8STk0Y?=
 =?us-ascii?Q?irlyyo35KZJTN1Vbd8jBoPa9P8KYLKgL4BATaO3NXiKn8UxDXMOC0TXPmIUx?=
 =?us-ascii?Q?i3/wOYWyl7NHPrc5eWV8YeEBDcSkJYuUsJyHXzkfTZKZDM+CFZCzUM6vZ6mB?=
 =?us-ascii?Q?WBtRSZ/cFtvly66Vs4JzG7a0rIv4GPAoccMQo7a56S7FHZSVgM8eWPPw/lcx?=
 =?us-ascii?Q?dzWpkHa7ByovE//erQz9suY4Tp4w2/LRR5+Ys01A/n8SSFCIuiTVWCBFnBS9?=
 =?us-ascii?Q?+u51A4qRhhjesofSZEsZISjznRAisdAxq0nTPckOS1szZBEPy5a0bgDXhM2c?=
 =?us-ascii?Q?HedFPq536UOs86Mftlf2brfMLfT7I9jJIBlV0oyE9PJysPngHHONYY4k6Jqn?=
 =?us-ascii?Q?SXhcVsTPTKLd0HtZ17E0uBvS/nfbXU8+iTn7LBMe38bAIqCR8GfPxPWosqw0?=
 =?us-ascii?Q?I+v311Nh8rLPsdmQGqWAG9ABNs/EX4TTRQVTATj6gbwQEUsu/1bKU0sQhqXf?=
 =?us-ascii?Q?qCJ2Eng7Ix5zsrdYuJuQqeHR01rtkjbmSyR+r4lSh0F2HJ1akzMwbDDvgh52?=
 =?us-ascii?Q?oM1JTk9AwEws6c3V+H+wQlgr0JW603qJ+gXJO2uVi7us3SLMrNaFKPkzkrgo?=
 =?us-ascii?Q?HQEwis6THtamYDAYjRIuLjoJCFWOheawn3m5WzPLOyYIavjwshFl8dQxYzeN?=
 =?us-ascii?Q?lYJbjY3FrlXPGz/UE4YJAZW2jTEp8cjHky+Gs9rmawVqUi1HNlaB0lwGL1Mc?=
 =?us-ascii?Q?bVfN154ZaSjr6zqcB/Ky6Llim92G7aRSYBlqQr94DE+4yqyGhW6RFh1vxgEJ?=
 =?us-ascii?Q?CP58r+STrpupmOjs/bY0rW0ydFYU2ccpt31sydEyxPVuq3eG+mGd/w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(52116014)(7416014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FDiXGk9dMhQ1z7GKwtUvgOHLnJenWynZeKDHRUFtfYXbU/7q4sj56dQ27nrB?=
 =?us-ascii?Q?4VSSQOrVyHSWR/sOwFPf83+XH3RebWQW3wTToLu4WeoleW3okiQA3gnSdxIy?=
 =?us-ascii?Q?cJN3FmpcM+tJ59coniXUhAzQJynHIaN/Ik5kozG0UVWNhygNYvnbnqbccPp3?=
 =?us-ascii?Q?n4C535aprR1JR+hiv1Fw2DwDvWCrdS/QCdtqbOJJSIPhl36cZpB2uM3AAiYz?=
 =?us-ascii?Q?n5Vg4VASsinY/RQ5MNhIFw+fT0OR/lC+JRx0iAmSUvXU4HJkGkXe5vcJt7qK?=
 =?us-ascii?Q?V91Z38PVamWkeqiBA7NZmbCqpDWxpmeHjr9ToUauTvpnn6InldXHKn8VlDIw?=
 =?us-ascii?Q?WZha9mRgK+pxfILHoFRkOcNA23Ta00Z7qCRu2O8+a8+D6Sns2GXBX8TEW3hw?=
 =?us-ascii?Q?TReUrSFIsCP4lQ/mTDe+k1QE6Kv/FdbipuBUkmLgY9j0EoyxhIqwG/CIR4+q?=
 =?us-ascii?Q?uqqhbcDACzD8TSP9EP6XVmUoReBd162ZEKNWvB4R5woTyiaXCH7pFMFqjQgv?=
 =?us-ascii?Q?yMhb4VX0mOdyDX1AOEhmaTdfcPIgcAw1vsxieiKpDIf7P22mxGqHTX2lnzCG?=
 =?us-ascii?Q?sd/w7Gl1N+fA40YVaSnt04NrXhczx7AnlhJs5CXENfrr5xSJ+lNZhAI7+3s8?=
 =?us-ascii?Q?87sLElYftU9NEVjtKTJJaV3S1fI/NKJf3Y/Mk2nTteodTlI3O61IUHnGBwXc?=
 =?us-ascii?Q?wv7zZWCXHdLd4HFm8VEyVzt2HY6ApaVxdPaUb3CFlD+rYclnzL989ZruV5Vx?=
 =?us-ascii?Q?BX/9KFJvnLXlxPq0dkmcvFZTzrIeGFmiWfCO4Dxx8cEgIZ9ZymM+R4Ghaqdl?=
 =?us-ascii?Q?Lt6xMgvX+Sg5u8iMGwClxtZQEMUwfx8PmyLDKO6epJ4JF6uGgphAfyZSsaP/?=
 =?us-ascii?Q?Y+tCUbbX+B2XAaL4lUKzJE52ZokVT6jvB59ri0fQpWRPwMdDpx+ijAdAFQZK?=
 =?us-ascii?Q?pQoLxVKyIl8libVIhWBkWo0zIDtMSwYK+fQN0i35+xKIpVOR30ZNGRRX5BTw?=
 =?us-ascii?Q?64vpXM3ziknTk40sIW+WB++jAhbNtH93h0rSv28m51BoyicLKbLAjTBhqVw1?=
 =?us-ascii?Q?KLNJpdneFDMWTfrteIozsHWrLh+Dm/8zzVemq5Ah/Kkbp8FpNLmAviVkZfDk?=
 =?us-ascii?Q?tDXcY5fun98wjuViKy1ejbproKHrBq3T1RwA9TE9H7P7FWsRIkZKAmmUkU5W?=
 =?us-ascii?Q?gqCV3NGlThoRhgLV7ATbUcADZ87WmUKId4shAhLigzcCOrOagT911Q6CKg0a?=
 =?us-ascii?Q?MHMMkB4qZXWRBQRrbdo65i3O0GuSvryl+1JwXSHVuM4+rPKCIfUHUjCHkzgI?=
 =?us-ascii?Q?VCoZguBwwMs1FAaVw++4Mjx7O90VhG9f0wZJKdAEHJAKDF8wfJj1X/zenq3I?=
 =?us-ascii?Q?VKdgMm0ZFbkh5Y0wIwXcGvXKzqOF9HRmlw+5c+lQvf5/Zp1QB46qHOE1yD5p?=
 =?us-ascii?Q?BN4kvZx27mjtxHCJeJAT1mMIzhoLpB/XF8MduWCCaJj8tkz2Vgt7HXeF4bUb?=
 =?us-ascii?Q?yyYZescQDClNTiFQtRmGptLx7Ju5OYmNKYvzSg9gMFjIcRF6OAjY6Irc0fzA?=
 =?us-ascii?Q?S+DRqb7pbw8MZdixGxjLo9e6sZRqCfwkoERkqU7/?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ec770cd-7c01-473a-d26c-08dde85d917b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2025 07:11:12.9778
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +FgEsct2Tg2d/CXUF2mh4JwTs2hyImMyHi6WujxTvb8J7Hm0Mb+d+BqIW1eYkGakqm/ztWtJaqDC3WgQgezpsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8174
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250831_001121_080035_7FFE6D88 
X-CRM114-Status: GOOD (  14.54  )
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

On Fri, Aug 29, 2025 at 11:50:20AM +0100, Sudeep Holla wrote:
>On Wed, Aug 27, 2025 at 12:59:14PM +0800, Peng Fan wrote:
>> MISC protocol supports discovering the System Manager(SM) build
>> information including build commit, build time and etc. Retrieve the
>> information from SM.
>> 
>> Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
>> Signed-off-by: Peng Fan <peng.fan@nxp.com>
>> ---
>>  .../firmware/arm_scmi/vendors/imx/imx-sm-misc.c    | 41 ++++++++++++++++++++++
>>  1 file changed, 41 insertions(+)
>> 
>> diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
>> index a8915d3b4df518719d56bfff38922625ad9b70f6..464afeae8267d8c1eca4c4d5e008eca6d741c6ff 100644
>> --- a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
>> +++ b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
>> @@ -25,6 +25,7 @@
>>  enum scmi_imx_misc_protocol_cmd {
>>  	SCMI_IMX_MISC_CTRL_SET	= 0x3,
>>  	SCMI_IMX_MISC_CTRL_GET	= 0x4,
>> +	SCMI_IMX_MISC_DISCOVER_BUILDINFO = 0x6,
>>  	SCMI_IMX_MISC_CTRL_NOTIFY = 0x8,
>>  };
>>  
>> @@ -65,6 +66,15 @@ struct scmi_imx_misc_ctrl_get_out {
>>  	__le32 val[];
>>  };
>>  
>> +struct scmi_imx_misc_buildinfo_out {
>> +	__le32 buildnum;
>> +	__le32 buildcommit;
>> +#define MISC_MAX_BUILDDATE	16
>> +	u8 builddate[MISC_MAX_BUILDDATE];
>> +#define MISC_MAX_BUILDTIME	16
>> +	u8 buildtime[MISC_MAX_BUILDTIME];
>> +};
>> +
>>  static int scmi_imx_misc_attributes_get(const struct scmi_protocol_handle *ph,
>>  					struct scmi_imx_misc_info *mi)
>>  {
>> @@ -272,6 +282,33 @@ static int scmi_imx_misc_ctrl_set(const struct scmi_protocol_handle *ph,
>>  	return ret;
>>  }
>>  
>> +static int scmi_imx_misc_discover_build_info(const struct scmi_protocol_handle *ph)
>> +{
>> +	char date[MISC_MAX_BUILDDATE], time[MISC_MAX_BUILDTIME];
>> +	struct scmi_imx_misc_buildinfo_out *out;
>> +	struct scmi_xfer *t;
>> +	int ret;
>> +
>> +	ret = ph->xops->xfer_get_init(ph, SCMI_IMX_MISC_DISCOVER_BUILDINFO, 0,
>> +				      sizeof(*out), &t);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = ph->xops->do_xfer(ph, t);
>> +	if (!ret) {
>> +		out = t->rx.buf;
>> +		strscpy(date, out->builddate, MISC_MAX_BUILDDATE);
>> +		strscpy(time, out->buildtime, MISC_MAX_BUILDTIME);
>> +		dev_info(ph->dev, "SM Version\t= Build %u, Commit %08x %s %s\n",
>> +			le32_to_cpu(out->buildnum), le32_to_cpu(out->buildcommit),
>> +			date, time);
>
>And fix the alignment above, just noticed after hitting enter.

My bad, just not sure why "b4 prep --check" not report warning for this.

Thanks,
Peng

>
>-- 
>Regards,
>Sudeep

