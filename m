Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1EB3CD98E2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 07:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ieHQFyHBbhegB5JIMCKBzIO8F2lqEsLvLb7YOcXrKng=; b=OkLw8tU9U+qUBZEBq9GZuVvWNm
	d8wFmfcsQkuPr4pvK+3J/8L5zd4rWWV15YcrY4MsxTULaGLzLBakN4cNFs8aqizbbg9bJI7BLaRX4
	Kpytl288pKBugAXvq9qVr807coFPnrInf0Ht5qDI4iD3VNI6kpLZkRTxSFJMvhLRS7RN56e1cfSYH
	o/m3Is1ekFMhRl3iC+kmExXLo/X4UiarHymJu84OztP0Q61SMuosQHYLm6Z2wbg+mWnm81MvyO3NC
	i76N88n90qYSDKs/pkrDSKZIDk9o3kelv1+U4r5bHXx92Pkye0GlY+47fiCImpHhZDQuCFBeGe9j5
	ii1o8M3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZkAk-0000000GkXw-29zD;
	Wed, 17 Jun 2026 06:54:50 +0000
Received: from mail-swedencentralazon11023091.outbound.protection.outlook.com ([52.101.83.91] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZkAh-0000000GkXN-2ldF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 06:54:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vB4VXAcq8KRbksOTAtC6/qNjitieufqFl64CGcnGVOPPyRrHAH0dOiANDn9ttPNeQNgkec9bEc5GmNZSpELCPrNYxS8IUM1/ag99kFSts6H/kfkz4hxl/g+QYSta6uwi7gxzlMa0NHxjIho1VK5JLvnZPOsDZzti90Y5qOZlcmTK4w8lWjeu9O4vrzVEfmlEOatEAETsYu6aVNmDnTIcFyP0QJt4MSynUiTELkaYah4/qZDkMBOeTBgcx18A7OYMPEeJgReGM+33gzWKuz6G7bdqB+e/H9dXZrx1BX/v9RMAAvRe2oAD8HkYbCONE7XGyo72MIlhcqV22iR7o/a/Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ieHQFyHBbhegB5JIMCKBzIO8F2lqEsLvLb7YOcXrKng=;
 b=rkDeKQ3MrQXpJMVXt4fZfvKmYTOgn+ISjsGJwru9PY2VrvyWVLSqB5QnKoZGkVyAvqprdzc3GYO2+exnjH9QUyGnAIh1gfcC/h67jVDHGLJ41wELj9HNplFrN3iwIRuMWxdG2A0j/TUm8szTa+qYFn5UL0wwNfC+NSGpEU6Tm0kWj82Lt6eziZKe8rmb+mPdGUQ/PAthDAu+seuu0m5eN/s/XlvAtXLZXJx4mivDifv/Ff+MN/PZsiSWfGWXd+Zmum4d+1P4Y2LdD7mx+ZD7z7TBhL3D561BEaWqwkGuyKS36vSmvXu4keX+adViDjnqNaDohe8SInqXifQKAfrPnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kontron.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ieHQFyHBbhegB5JIMCKBzIO8F2lqEsLvLb7YOcXrKng=;
 b=qnPY+yKzCSwouRSZjsow8kIy7Vxqq4jMphJHQ17uNI7AV798FAgc8CoojlZSm308m8aX0nU6ZVZP9rQoakowpGEYhXObY70u6JaAwREidVGRxvpfjxKcCZxBCd6D7kWAsqoV2NEZ7bHagunshVqWJ/nFv4HfUhIRvw/MeTrISYvfRWTr+NRbLx+mlLEMpuPlszIcrtSd8T8DEbbA7chNTe4jCnrYM9Pg1LK2SBYKNAoFQmL8TnNILKGaclMxB+olbwIhUM6S4OmtTTlE3803CPSPZ3pSHCh9sdPEhnBjf5msxqTFrm3MoBB7/RRETwJ5W3ulVetskQwMc5ClWm5tmQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1fb::23)
 by AS8PR10MB6021.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:52a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Wed, 17 Jun
 2026 06:54:38 +0000
Received: from AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a276:4ad7:962:da22]) by AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a276:4ad7:962:da22%3]) with mapi id 15.21.0113.015; Wed, 17 Jun 2026
 06:54:38 +0000
Message-ID: <9c1d34ec-0b96-471e-8b60-6b4c852878bf@kontron.de>
Date: Wed, 17 Jun 2026 08:54:35 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/9] firmware: imx: ele: Add API functions for OCOTP fuse
 access
To: Frank Li <Frank.li@oss.nxp.com>, Pankaj Gupta <pankaj.gupta@nxp.com>,
 "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Frieder Schrempf <frieder@fris.de>, Srinivas Kandagatla
 <srini@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260616-upstreaming-next-20260609-imx-ocotp-ele-v1-0-cb7f3698c3e6@kontron.de>
 <20260616-upstreaming-next-20260609-imx-ocotp-ele-v1-3-cb7f3698c3e6@kontron.de>
 <ajFtkysqxuLV8GgF@SMW015318>
 <cea74ed4-1003-419e-8da3-1c62b1ace726@kontron.de>
 <ajGsiglUUbDTIxTh@SMW015318>
Content-Language: en-US, de-DE
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <ajGsiglUUbDTIxTh@SMW015318>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0149.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::16) To AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:1fb::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR10MB4277:EE_|AS8PR10MB6021:EE_
X-MS-Office365-Filtering-Correlation-Id: ca9ebaa1-003f-4898-e7f9-08decc3d4c53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|7416014|11063799006|4143699003|3023799007|56012099006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: F4+OmvmiB2doLXS8beGpULQJxdrvjQw7V5rtv0lCW2qCO1f4Yf5wPxGjf0YAi/YdlJ4hya3vQ8+7bItTcqEOSfu/V0X/+Npzb/WnMT1HjI5tTqG9vTTq+R6ESwOJB0fEH4YN6fxeY4kwjAoLiZx7M/e+VRUf6mrqvSzWXER4PCWuxtU/FwuUzPbj9QCgseOUlV/MzJUbXMgyA9/z3JrUKPJPMfswGYGqgdwxgMBUbwWHbxzxrWlB319SOQLH1yCmAisaao3YtceOvGhwkzkeTQ9bCpdz432g8o+dp/S0uAXp+A/zbug840dp6vbANcxKSFFf8moQqXGBWlNeEqAawq//tl8MPaAkiDh0tL0OqtwsmhsT1p1K9BTTvtVXzHdhvOznEPGGTVbUQUS57/WeJMwz79YWK1Fl0ZgPrShy2m+Hj6c4Mn5eQKtweWZENTMYhhJNbg55FkFI7H09SYOs+B6dVJaILp2ac5dFo2o7Q8qECOVz/+Eje8l3dIFv01MM7hBY+QXQxUFoBIe7vGOpPhc1PgfhKvyo+YK/Q6x5b9WRl7SCk2J2A7J7hAx2/0x3O2ZtBkADr2OTW56VUD69DWwEFqlM+yqHf3TNFw8Atyp4ZfV0rajItWJrW9dOiqicnrBY46rw3L2TwCTwKr0p8tQrlKMzc7Kxqu8szuugqMwSef7CMV3i0sXfwKcwa2gM
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(7416014)(11063799006)(4143699003)(3023799007)(56012099006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MHovZ3liZjRFZGVtTjNhZU5VTWNlQU9CYmhKVUZOeEZoRDFseVNvdnIzUDY2?=
 =?utf-8?B?VGJ0azd5R3ErUkFydVI0c21CdmZGU0RIVFdPZHZRR0dnU3dzL2pDSGZNdSta?=
 =?utf-8?B?clZWWEpCbWVBS1h2Z1BnTjlLdjl4R3Y0MlNyQzFqdFBSaDQrbG9PY2dJTUJB?=
 =?utf-8?B?bWNzd04xVDIySVRnSmY4d0Fnd0lkZk9NcVRTSGJ3dkhVSk9qUmJUR2dtSUJ6?=
 =?utf-8?B?U21SbWcxVU41elZzV3VuMm9mdkZsYzh6TENFekVKNWgrMXRlMzNIZHIwcFBV?=
 =?utf-8?B?b3lWYVRpNVhTZzlCVFhmU0d5aFc3YjlCZTZGdmtBZmw1NXQxQjdEcG5GK1c1?=
 =?utf-8?B?WkFOOUk0emdkSTRHWmhCNjA1a1A0eHNDL1RudXJhSWZOb2NSWFJwZExjS3p6?=
 =?utf-8?B?bk9ZWFBiV3NGYlQ0cWFXYlpzWitIMXYwam81WWgyQ0lHM2FPQnF1ampmbWNj?=
 =?utf-8?B?ejljejRDdlU3ejdLVTR2ZE9IV21LWUlSVktNYU5BNjhBVzZ1U0NLanpKU1Ba?=
 =?utf-8?B?RmZxY3F0ZlVmTEgxdFhrVHpNb2ZxcTVTK0tsS0wzMnlCTTRQc0ttSFBmclYz?=
 =?utf-8?B?dVo0Z1JuZEtiNk5udU90Y2dZTnZKRUZ2Y0hCOUw1eVpEK2xmRFFqYnBzSWpn?=
 =?utf-8?B?VGhNL0RmNW9USmxsM2NOS1BNRSsxeWU3U2g2WW1RclRCQ01WVGxVVFdnUnRH?=
 =?utf-8?B?Uk5BR1I0OUh3ZkdueTFhdDlRclB0czM2dyt2Y296NmVzQWl0L3hKK3gyQVhX?=
 =?utf-8?B?VlZrWEVUWEV5WkJ4dnN1ZDJaM3Bwemp0OXl5K0lnV2tIRm5aVzJwaUYxdFo4?=
 =?utf-8?B?V2Rmb21OWVZDVWtwckFBdEtBTWVIeHByalE1RldKejhucjY1c3kwWE4rbmhG?=
 =?utf-8?B?cXF1dGh2Ty9nUzBOTExkR09DMUxHa1dISkZSb041SE1reS9Ua2lnSk1uS0J1?=
 =?utf-8?B?UEp2SWkyN2w1V1A2eFozajVJeU01Q2RnazhNWHhiSXIrb2d6RFNvTHZvUmsz?=
 =?utf-8?B?S1U3UnlUT29sWERyVzJnMU9ZSXdhcTRHVU9vb0E2Mkg4bys0NUphYTkxYkRO?=
 =?utf-8?B?S2MzWU9DYWJrVnN3Q1hGeTYrcUptRURrWktUZkJuaEV2bXlSbFMvTG0xcnAx?=
 =?utf-8?B?ZHB2emdoVGlZWDBsaFcrdkFJblNZZjRkcUNFMnk2Ump3YjlMbE1HVlFQL3Jx?=
 =?utf-8?B?VCtKMDdnZDkwaUY5dTRsVC9uZEZOcGtsY1FTTWZ1L293Tyt2cDRkMUxPNS9L?=
 =?utf-8?B?TlpVQWFZTG1OVm5aOWlpMFBFSXVPUGdacFVvb1hOTXl3MkpyZ1AvQlc5eVNL?=
 =?utf-8?B?NTJaZXc3MFlpT1haWmxEU09GandCQnZLbDBQR1NmM1g0YXNtMnI5NlArRlpF?=
 =?utf-8?B?eG5zNm9ORXRldEtXcG5CRmFKUXBZZSt5a05kcGIzdkRyNjNLOUxZOEVSblAz?=
 =?utf-8?B?bDBXOG9FdXVwUDQvbEh6YiticFpoVlkvZk03NXlBc0dhaEZaR3BOV3ZtRWp4?=
 =?utf-8?B?NWdDQU9qMlhkcktIUE9qYWlVZkRNOXdPQ1VMMmM5N0FMMVhaK21jekVBWFMy?=
 =?utf-8?B?b2d0emtaVW82RTlLemNGWkp1ZXpyS2NmcjNncFVrMWRjeUc5K1FDc2dWbDAr?=
 =?utf-8?B?MEgyZGJkSnBnNjJiZWlPTlhjZFRXQmlPUnd6ZzVtMEhncG1WS0xLdUxEOWFy?=
 =?utf-8?B?TVJ1U3cwb2tIOUwwWjcrOUZ4K1piNTdiYWlUSEJCS2FKTkVONG5seGxHS1J2?=
 =?utf-8?B?VjI4ZWdIdyt0L2JjUytoUDZQcU5lWTdiOGxyTmUyRCttZkFoeU5VSU54NmZN?=
 =?utf-8?B?RU1yS2orN1Vud3NldlRlOTRFOHFQQ1NndTZ2K1N3eUFvYXowcjJPT3NvRG1a?=
 =?utf-8?B?dmFndjl5TWpmbjArWTZLVVZMaU5SRE9wNGdTRnZueDJpYUZRUGY3djJ4eUNR?=
 =?utf-8?B?VUxoR2g1T3FSZmNPQTVwckRBa3BDL1BMNzhycklRWDR6d2ZROGtGcFRkb0ZJ?=
 =?utf-8?B?QnMwWDNtb1hXbU9DUnJQMkdVUEpzdHRmYVRIZWY5MHB3YTVrK1Zub2xKWlRZ?=
 =?utf-8?B?ZlpYNXFuSElnUndkZlVwcU9RZlcxcGM2TXRlZjNtTkFQa1hNdHRsUjNSYXRj?=
 =?utf-8?B?eGQ2UEpOeStCWVducDlrYnppL3JDb0R2b01uWnA3VnRwNFBpNGxLV0RIZ25H?=
 =?utf-8?B?cTBCNzcrNkhwRTNGalNBbll1cXpzSTZuQmpBRFpXbGhmaDJyM0Foa2lheVFH?=
 =?utf-8?B?ZmF3TlJadS9zMldQKzVCS2xyZ1p5VGdlY1o2cGgxMEJDOEZoVVVmNFpRczNv?=
 =?utf-8?B?SFI0VEJRQURrTS9EOFNqMzVkUDdiWitzMm14SXdWWlAvYkcwdmVNQ0VPRGZy?=
 =?utf-8?Q?oZk4XD6TEnZFCtfM=3D?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: ca9ebaa1-003f-4898-e7f9-08decc3d4c53
X-MS-Exchange-CrossTenant-AuthSource: AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 06:54:38.4028
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uU92WJ38ZZIjz5Mi3hRbsaHZlKb/z+f6jDwwNS8VVX1T/I88ZnHFdNTTm4DDmKGj5GTNkNykbn7HQxdixxJq3HfKCVjoEYHSFpz/LREnYpo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB6021
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_235448_040839_4DD2EE28 
X-CRM114-Status: GOOD (  22.40  )
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

On 16.06.26 22:05, Frank Li wrote:
> On Tue, Jun 16, 2026 at 07:59:54PM +0200, Frieder Schrempf wrote:
>> On 16.06.26 17:36, Frank Li wrote:
>>> On Tue, Jun 16, 2026 at 01:52:18PM +0200, Frieder Schrempf wrote:
>>>> From: Frieder Schrempf <frieder.schrempf@kontron.de>
>>>>
>>>> The ELE S400 API provides read and write access to the OCOTP fuse
>>>> registers. This adds the necessary API functions imx_se_read_fuse()
>>>> and imx_se_write_fuse() to be used by other drivers such as the
>>>> OCOTP S400 NVMEM driver.
>>>>
>>>> This is ported from the downstream vendor kernel.
>>>>
>>>> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
>>>> ---
>>>>  drivers/firmware/imx/ele_base_msg.c | 122 ++++++++++++++++++++++++++++++++++++
>>>>  drivers/firmware/imx/ele_base_msg.h |   6 ++
>>>>  include/linux/firmware/imx/se_api.h |   3 +
>>>>  3 files changed, 131 insertions(+)
>>>>
>>> ...
>>>> +++ b/include/linux/firmware/imx/se_api.h
>>>> @@ -11,4 +11,7 @@
>>>>  #define SOC_ID_OF_IMX8ULP		0x084d
>>>>  #define SOC_ID_OF_IMX93			0x9300
>>>>
>>>> +int imx_se_read_fuse(void *se_if_data, uint16_t fuse_id, u32 *value);
>>>> +int imx_se_write_fuse(void *se_if_data, uint16_t fuse_id, u32 value);
>>>> +
>>>
>>> This API should implement in fuse drivers. Other consume should use standard
>>> fuse API to get value. If put here, it may bypass fuse driver.
>>
>> The reason this is here, is the downstream implementation in linux-imx
>> and the current code organization.
> 
> Downstream may not good enough, sometime, it is quick solution.

Ok, but the code structure and API design has been upstreamed like this
and the refactoring could have been done before, if downstream is known
to not be well organized.

> 
>> I thought there is some good reason
>> to have shared functions and it looks like Pankaj structured it like
>> this so all API functions live in ele_base_msg.c and the internal
>> structs and defines in ele_base_msg.h and se_ctrl.h are not exposed to
>> other drivers.
>>
>> If I would move this into imx-ocotp-ele.c, then I would also need to
>> change how the code is organized and make the internal se_api functions
>> exposed to other drivers. I don't know if that is really a good idea.
>>
>> I get your point but it looks like this contradicts the intention of
>> having a clean API in the firmware driver.
> 
> You can refer imx-ocotp-scu.c, structure should be similar, only difference
> is that lower transfer APIs.
Ok, this would mean that I expose the generic SE functions and structs
required for fuse handling. In practice, I would remove
imx_se_read_fuse() and imx_se_write_fuse() from se_api.h and instead add
the following:

struct se_msg_hdr { ... };
struct se_api_msg { ... };
struct se_if_priv;
se_fill_cmd_msg_hdr( ... );
se_msg_send_rcv( ... );
se_val_rsp_hdr_n_status( ... );

Then I would export the functions in ele_common.c and put the fuse
read/write functions in the NVMEM driver.

Is that what you want me to do?

Pankaj (and maybe Peng), do you have any comments on this?

Thanks!

