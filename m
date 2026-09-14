Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D01ECC88E72
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 15:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0gaYeStyPLFoFAMrwMANgQRqUwBUBqgNxg5udeK2HQE=; b=xtN1DH1fyngP5lOM7ZnsP+rbrh
	lN9wGhOpSfKSA59UVz1UBoNy20veV7iIbiiuN8igLSCddhpuqR4O8Ai48dbh0k7VUZ+0bxGBuVovM
	3iYCYYVImhhVvCtIjbNAF7nEJMp6L72/Hz8gqfCD0vJPWWQqe58WS4s/pHTYCQsPJ6qewD0cqltVC
	zKTEYZEnza0zSCHuvBCE08cBkgHzEo4zhLAXOp1sg5DpICkhnO5KLHW0zfLGKOXVz0MW1cEq9Ibz4
	6YSI8WPQ2uTaHhlfBe6pGaNt5FKVjrvHAXMopUMSVwFtBYrZjAMT1UGUyBFOx+rBB+bgMVfCthYDc
	we3W/vqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x67gV-00000003zDj-30R7;
	Mon, 14 Sep 2026 14:29:27 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x67gT-00000003zCt-1EKf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 14:29:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZtFmJzo1VsN2CwnP8q3U9w9IvDpH68ZzvHk+HTVZVk3w7NCqq1zA43QuN3ty6RliLZ6CTNJUpqtsFJsAOEsfr9QaeffXFiUlKo2IxVmWUey98eH21KyppVLI0hgQnnJPHGHigHitk52dGfdFnNi0ibAviWSCMCfAzPwVuPvtHEuI7TMRXENrWjoXSupsbIGeDxrSN0QuYEH5K1Yr602jIWPbXLLnjl8u93LfLOqUCsR0QJ5JwXl17U2+stG1M9cEku9IqLkNMW8WInVLIyUjMV9JgYo8zGBzhlqXOyAZtGYBUIsTrUcaSA7KrZQg7H9SE8GClbxYZudcB3nH/efZAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0gaYeStyPLFoFAMrwMANgQRqUwBUBqgNxg5udeK2HQE=;
 b=iTZS7QBAe7/cynxSRS3RJdPA6alsCJW/hbRHq7jSqVT8f4DHfJrtua/Jac8YyG3Hcf+HOBN015/au1Tm6q9m7sQ8aOldumBk87RPrA1IOXijO/Gu8LNSbFSUSs/dPY5gjqriq3LbfyFcwV6vdjyiBIlAfilkG6AJRQ0CLfiMcEBepnxdcJtMq3EtDHGRQZtG3Dyl5GbITXfmt/9UlCXdbNvToRXET5RelEt0aaN2pbqbQUJzY0z0XDDFeBzbkuSh0ivVTDVMZJsyg+RjMo6LwnxKo3+54Xd0NSRP9qZDbU7xMdnqE2vfmtFITkk05SyNVnnwhGnwWneG24Q9uIYe+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kontron.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0gaYeStyPLFoFAMrwMANgQRqUwBUBqgNxg5udeK2HQE=;
 b=eR75mMWX8T7TH41NoFbUZwEjseCT6QDvoPWdjHm5kZ7ZXNMAcxqOG9W5wll6t1ng1u59it8MzqbOrJPOhjQUUHazVFZn9Vdqp7YSL8s+Uo15ngGG3l0PwlEo7jlTEGEJ9f+zpZPo7UCp1c2lkz63+Kk8XGiAwp2ZB+Olz7HuZLbKq20MBuuP1ZwV0Y6ZOWDpWBiusBr9u1rnlvfG7aPw/D3PpxmskzWxFL7OwJ3KsBafakIxaV+atXn+vcZ1MtX/3u32I4q4ElOfTc3KFKErHKUU4jddswk+FKwUHcTfDBZAm5dF+g5CkpMHlcBK7e+u/1gkc4pL5ggnxPdQgkioLg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1fb::23)
 by PAWPR10MB7914.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:367::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 14:29:20 +0000
Received: from AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a276:4ad7:962:da22]) by AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a276:4ad7:962:da22%6]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 14:29:20 +0000
Message-ID: <47a361d3-7a20-41ba-ae18-67d2ff61b0c5@kontron.de>
Date: Mon, 14 Sep 2026 16:29:18 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: imx93-kontron: Add support for Kontron
 i.MX93 DL
To: Frank Li <Frank.li@oss.nxp.com>, Frieder Schrempf <frieder@fris.de>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-clk@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Mikhail Vaniulin <mikhail.vaniulin@axians.rs>
References: <20260910-upstreaming-v7-3-imx93-displayline-v1-0-bb9446e6ed6e@kontron.de>
 <20260910-upstreaming-v7-3-imx93-displayline-v1-2-bb9446e6ed6e@kontron.de>
 <aqLcsc6SROjv6FRv@SMW015318>
Content-Language: en-US, de-DE
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <aqLcsc6SROjv6FRv@SMW015318>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0410.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d0::15) To AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:1fb::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR10MB4277:EE_|PAWPR10MB7914:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e3324eb-5663-4768-4d74-08df126c908f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|7416014|376014|1800799024|56012099006|11063799006|4143699003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: RWEC++loL8euAkZD0S6BMjukUoP7pnJIBf4wF+QrZ0iBi3eJnMzif0GvDutThDJM4G16FVU31kyYLGhoZVKr1OzhdDOvk7tQeF9zlQOnMWQ9d0Bevcm0j0/t6id5atYicSPGhRUJYWxg56vXzx6HbFhsiilRLjpIm/HxBKaxMT4VMSAjhXmQcBQXQsPMXcXsst2FZV1cJQIUTb9dOW17QwbLlOlO7nTMwsSdIane71AoXpSqx0DWE9tkEvA0+g/itpiC9XJ9Wp2T/36VhdfSJbiME8SusyjYdN3rB8ps3SSiGBy/rpdQUK5LOZdN/4CWp+BdiiEgETRzVVTRKVVEv3+f/gyShgelSxRERhtZFYvTPrafL5S3WtcODUQGT8WDNGUdRuJBp0ghfvLFlP2GJDvndEAKumbwhdjwN81RbNxCM7Xpn+Yvf4Hy3UGxnTswqCnjq6PRCLvZBBBmMTqAXg2dcM0uo195p7DrlEnY/H5zuaLSy1hCvxTVIEoi/KkIT9e55gShujrPPvsc5e/kTnea5xDgtz1ah7fMN3w+84Yr8A2qn3mS99I8vg2vlmZCH8cnFDzR0obW4V4D39UnptQR96Jl36nF9eW/aE0dI/TbuNdovPzgNeUPlLJmRxj1
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(7416014)(376014)(1800799024)(56012099006)(11063799006)(4143699003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Rjh6WU44ZlA5QTVBbzFnQ1hZNGdGdDhVbnNkU3dvYTVMditYb25nNDR3alYw?=
 =?utf-8?B?VjBtWXpKdEVGb3hMS0tqbkxjRDF0eUV6UmZ6Y3BkMXA0a2dwbGRtL0hENlF2?=
 =?utf-8?B?cHFEMVp2TWFOMHErZ2xhRkVmZnJDR3NWRkpLbERkQzhGRGZNK2pGQVVVT1lW?=
 =?utf-8?B?WEo3NHh0dU4vYVRxQkN3SUtSOVM3amVpM3RXaU00V1JWZlR6MWMzYmRpRkJD?=
 =?utf-8?B?SlI5eUEyRE1VbFVYcEhidlVtblg4SFBtUTFHSG5KRFBmMHoyc2lBbzJiTTV5?=
 =?utf-8?B?THp2Q2lNQWR1NjFJejZidjlVZ2o0emNUaWY3U2lmbjNzeVRtZG5ZbVVxTXdC?=
 =?utf-8?B?RWlWc2RtbUhZZE1KamRpdE1iZ3NLSzMxQ3Nnc2pIVFZzcjRxTitqMHpKdHoy?=
 =?utf-8?B?SEVpenBBSlVHSytxd3B3SzAzYWtoTnlPZXNyVm0ya0VzNENBRU11VzFLdmRk?=
 =?utf-8?B?TWpIZFhzL3JiVURwdW9oT296VWpST0xQQSt3L2FaUkFCMTgza1E4VndXQ1F3?=
 =?utf-8?B?dEVvUXdjZ21nQ25ldURUa0w5Q3lpZ2tvK0hvb1ZjbEhCYnhPekdqK2pwTGo4?=
 =?utf-8?B?UnBwM2JmTXZGc3lQcnYyK3gvblp4VXdmZkx0S3k2KzJGVkdtc0MxTGhhbXla?=
 =?utf-8?B?SW5uL1VVbndGTGJpcmV6L0xSTlpSTU1wWDVYVVFacU5nWlpwZnpaWmZHM1h5?=
 =?utf-8?B?S25nWWE1c2Y0K2VtZnhzS0lSTUhaQzJpSzYxYkV5RUxYaE1kcEZ3Z3pVdlps?=
 =?utf-8?B?SFBVZW1GNWdicXI1d3RZQ1VqdXJRNTlkZGFVUjNnZjZTMTJCYTZLdDEvTFRp?=
 =?utf-8?B?WUllRVpHTVlBNU45THd3Wlp3aWdIZnFJMmNaVnVJOUd2SXNoWldhcnpzT1BX?=
 =?utf-8?B?RmxMZzkxVCtnV3ozTzdHRjhab0FIWkgrVjJGYmR1NmJYa080clFXQ2NjUFgz?=
 =?utf-8?B?YVRkRHZNNER2UG93TFRjc2s2OXpvQkNML3JWaFN4UjJVd09lSk9XSDgrOGg0?=
 =?utf-8?B?emVwWnNLNWFmay9BbHM5UksyOW1EWjZZajM4T2tGc09lbC8vYlFhUDdhcU9O?=
 =?utf-8?B?cXJLcjlvQnZ4NkJZUWprRFBMN1BTalRVVkpVM2E2T0pIS2NlV2FmSldTdXhJ?=
 =?utf-8?B?M0RPa2dqV0xPV2s4aFdyRFlhbFhNcmlPRmxKUGZJL1V5cW84bUR2Q2tIY1lx?=
 =?utf-8?B?bitiTnZveXRZVlpPWlBjNEh0b2gvV3k1TEJQeU1pdjdyTWRKd0lVRDAybUY5?=
 =?utf-8?B?Tkl4ZGg0RWdZS1R3QXV4VFpqN0VNdjd4eWx6Q1hzdHYrR0dQSGJQbmY2R0pO?=
 =?utf-8?B?TUYxdUlLNTJIdU9XZ25hc1FKYUJWaSswNXZEcXJTdlF6NnlBU0hYUTJ1TXpj?=
 =?utf-8?B?UjROL0QrNzhxamx0V284bk1WdjdmdHBWQjIyNjE2bnFkK2M0VzRiNHFSZGg1?=
 =?utf-8?B?U0tQaERERmhjTGM4c0FpbE4wNmsxcU5SSU80SEFpcjZHZ0VBQ2V0Y01aTXJp?=
 =?utf-8?B?SnBYSWNMQ3JPeDhLNHVxVzB2T0Z4dTBXZGYxb1h5UzY0Z1JCV2wzdmFDNFRS?=
 =?utf-8?B?V1BrcWs4dUNndEtSOTVCb3NqRWxidGZhNzB5MG9oWk4wOW9VVjdEU3Fycjd1?=
 =?utf-8?B?WWRXbFlQMUltdEVPOG12ZEg0cFl1YlNNWW4vNHB0bU1BRUdBZWFmVlBsdmZr?=
 =?utf-8?B?UFFQVnl4Wmdjck9IeGtpM1dIeWk1NXZrK1I1OFRxL0hwdHRQUkdTWkNidDZV?=
 =?utf-8?B?bXo0L3kxMTlncGhYZE1iaDAvVTQ5ZTArUTEvcUtBMXRpVklISXNZUVFld1lQ?=
 =?utf-8?B?dlBkSlNzbHdCT2w2K0VQdGc0dGh4dTRuM1Z1ZjdjZm9NWVdzMmFTbkxxN0di?=
 =?utf-8?B?b2doUC9lK1MvTmVYZ0JySHd4c1haZmRUOWU5eTVLWmxFaUpZckh5c1ZyM1NV?=
 =?utf-8?B?MWg1by84aFJKV0N5ZnJ4enNmSzNXRTV4YVAxRUJDNDlobmwwckJWSmtBWjFC?=
 =?utf-8?B?bmVESGlHZzNBTk9abjlEVnRpVVdSRHN1azhRZGhQbXJEOXduNXhjQ2JKSGt4?=
 =?utf-8?B?bTNnbmZmdUdMTHMvWGtjVm1Yb2VYS25PM050R2ZzNWwzYkxKaklvUHhxdi9h?=
 =?utf-8?B?Z3RRN0hEUWJUN3dzamFHWW5TdkRuOEVuY2ZmK210SW1YdVNKS0Z3ZThsbmVK?=
 =?utf-8?B?TkY1aTI0LzBzcXd5L1ZXQVoxVEYxNWZ4Q1JoQThwem5WMndicEJ0V2NrMXlk?=
 =?utf-8?B?Z3FDZXZWNFkzZmN2RnorNmVNMGJFRVhPK203NkY1SWRRVXlGTUpZajFuSEQr?=
 =?utf-8?B?QWF2dkFqbDlUajFtTU82dDRsYW9WWDQwUTFWNjA3WHR1U3MvUkdLbmw5VjlN?=
 =?utf-8?Q?3TlUY/OjnyJmUAUo=3D?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e3324eb-5663-4768-4d74-08df126c908f
X-MS-Exchange-CrossTenant-AuthSource: AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 14:29:20.2222
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LWv8p/2Tpnt3kIn2ZGzU/1KbuzBdi5HxE59IfmdAWK+TvZDvpnCSog/XkASZ4ll2JiBcqKn1OqjfAytag7eIiby11iP4dEgS5lQxfpy3DR8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR10MB7914
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_072925_640828_7339C5FD 
X-CRM114-Status: GOOD (  12.80  )
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

On 10.09.26 18:37, Frank Li wrote:
> On Thu, Sep 10, 2026 at 05:19:07PM +0200, Frieder Schrempf wrote:
>> From: Mikhail Vaniulin <mikhail.vaniulin@axians.rs>
>>
>> This provides an overlay to enable the 7" LVDS panel on Kontron
>> i.MX93 DL devices.
>>
>> Signed-off-by: Mikhail Vaniulin <mikhail.vaniulin@axians.rs>
>> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
>> ---
> 
> Can you use similar method to share 7" lvds for other boards also
> 
> https://lore.kernel.org/imx/20260910-verdin-imx8mp-hmp-camera-ready-v1-0-3c9349ecdb9f@toradex.com/T/#t

I can try to unify this using a nexus connector node and unified labels.
But it looks like there is at least one dependency not yet applied in
[1] for this to actually work.

Can we apply this now and I will rework this once the driver core
changes have been merged? Or do you rather want me to wait until it has
landed?

[1]
https://lore.kernel.org/all/20260910-fw-devlink-nexus-ready-v2-0-17ac82dbe226@toradex.com/

