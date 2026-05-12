Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C67BCD4F24
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 17:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Cc:References:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w/AoDDE4OkeBe3CLgRzPTmw7mPNw+go0G7XwVsvZMOc=; b=BE2HLUmAqe28Ujrq8oAC/uqQiq
	UgXsZzP52bnvMtbL4c/mLQ5xMX9gmDzxY7A7XHEwEVqkI4DrZFtfqcQ0DjyGcbLMY1MtFiCmA098Q
	jR+Sx0hnMQL2VVefWEhu9e6ZQl3YAALnSZCS6VJCDsZUqOgEey/nPI737TADA5oYWBCKXXJHbjZ/9
	fxM1zPJAl8PJCuhgFLk/r0HTnaYUBdHzu7A9wxj8Sa4bnfDdfRwA19o41kbAQlloeORuidNIxY/4J
	LeUsU5yQl1fUfjjuRt6QcGfmrjydlqJRfMhAMON1n6tX+Bqhy8LVSpjAWblUkk2WwtdtKt8k1PrFL
	RGIKlTJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMqhR-0000000HWCh-2zwb;
	Tue, 12 May 2026 17:15:17 +0000
Received: from mail-westus3azlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c107::1] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMqhO-0000000HWBv-1Zal
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 17:15:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CqNcPd9k3oy4oJEJz38SX7iB6gcrG0XqeP3EvnzzxRHxkwQjAye2ZdcM1leXOJHwt3sNkGoF/F7dUiubM0dYvdXhQ/ecF76LFTAZh63prhi34fLvfO9kZZpwh1Q239kztAp6YIZF4rEV7FnYE9E4gk00pi9/5RNL5bBXXUzqcFjL3Dt4oXMV0ful2bd8JAhXH3daKEjvdvDD52DYDsgwn3+vHgDHL5UHmijliZuMDt+CDQ7Gb0QeyMWwyIUTySyGbXeaQc0G3h54V68zVXTkN4mc7bIC3ipBH9I/GuVwTsbXiX7a1Iid+PJV/btWCQzpLI0YuGQT2v4yJ7qnoSZcrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w/AoDDE4OkeBe3CLgRzPTmw7mPNw+go0G7XwVsvZMOc=;
 b=HT7naAsgG5G+WknTUR071zXKebOL1Ulu8frc23roogfsgrZg8BS+E6vkkAGcj4td5w012ieVr7GXprXABecvcocDCCOGEbYwVp6vEkpWDNfsSw+9+a4gJstgMKiPr1MriWRrFIU1Zr2ILaNXeeks4YS//CIHHqW0/5iHrh7n7Ct4oFL9z5G43/zxvcKgwp5v3+ejSnL8t+FKCxrw10wJzjkz5bQrs3eyDv8haVWcPwPK7bUZXTKJEGOAbGXgRjuG5/OM+W2YDH1SkBzheWjilVyh5ZVZ06wb2wHcQuMS9uJHTwTA/BwpQPr6+mNBiNNZagxbs6uD+El2PTg5/cv4UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w/AoDDE4OkeBe3CLgRzPTmw7mPNw+go0G7XwVsvZMOc=;
 b=qu1pNOWciw+wRz8jBcHEjoUSf0IOJjZj/0fHoukohZX1vDhqWWERQyzEPURkUhhaBvfuhUrSi7oZPSXVaDr8WDRiASAsC4t72s6Mlx3DzA0XfzLLld7nTwUGaNtT6xTirKgbLBo5x4sU9sV1Ck+mvLwGK22xtVUhvsOtLN326Ec=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6448.namprd12.prod.outlook.com (2603:10b6:8:8a::7) by
 DM6PR12MB4435.namprd12.prod.outlook.com (2603:10b6:5:2a6::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9913.11; Tue, 12 May 2026 17:15:04 +0000
Received: from DM4PR12MB6448.namprd12.prod.outlook.com
 ([fe80::62c2:71cd:7fdc:987a]) by DM4PR12MB6448.namprd12.prod.outlook.com
 ([fe80::62c2:71cd:7fdc:987a%6]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 17:15:04 +0000
Message-ID: <986f9f97-e990-4a61-bd25-d32f6cdea325@amd.com>
Date: Tue, 12 May 2026 10:15:01 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] remoteproc: add common wc-ioremap carveout callbacks
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>
References: <20260511211841.284809-1-ben.levinsky@amd.com>
 <20260511211841.284809-2-ben.levinsky@amd.com>
 <bd083464-a5a2-4994-ad88-ddf42d2c765e@foss.st.com>
 <DM4PR12MB64482037D67096393D4668CE83392@DM4PR12MB6448.namprd12.prod.outlook.com>
Content-Language: en-US
Cc: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Magnus Damm <magnus.damm@gmail.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "Shah, Tanmay" <tanmay.shah@amd.com>
From: Ben Levinsky <blevinsk@amd.com>
In-Reply-To: <DM4PR12MB64482037D67096393D4668CE83392@DM4PR12MB6448.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0104.namprd05.prod.outlook.com
 (2603:10b6:a03:334::19) To DM4PR12MB6448.namprd12.prod.outlook.com
 (2603:10b6:8:8a::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6448:EE_|DM6PR12MB4435:EE_
X-MS-Office365-Filtering-Correlation-Id: bc538916-cac6-4473-ccc6-08deb04a023f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|11063799003|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: kUdizuQVqc09KA0KefFz7G1t49sTZJScKOrTzJo3Qns+nG4FLOeXKSGzE0JXByv8Ef4Y0XSVv7LEb6jpKMnNGNcjqUMy575Nus0Ue/JyP5JqxzmR9mvxlaLoX/dIO6ILrSVNFJCorqwsqhQiVTjoVSvgaojw3cfyAF08Gu7h+Yd1N6CNNyBwlYl13T1PTHlVQLDuPKfMfW/DZkjTQiH5b7ySLj9jOKiUl/iQeqSl966gu/xC/zs8RvCGP9LQtQ6JWgaNyUOrNbeslhzzCwovRoEyVkSfD9gdmdIYEmrpT7zKNdl0MPLth0VuCPPYuzlSe/zF6RrtPvkASNV0B3YdtFL6vQ9TqjhLBZPAZxQ3VMxlMFnTr9sDSXxsXkn/HF2aiibLEIHLg0K4G5Cal9Ju+8eJBAB12/ZD9afL5K7GwGjJJsiC6cMPy65U1pNktuZ3hUuRjk3cVJWWxTbZS1GMa8mfthkl7OvGGE6c+Ovg7/blE6zRMlKku2it2Nhj/0oFrx1YpbE2/A+KdZgd3xDfZGEl2w366RQj2/c/MOF1sUqVg/NqbXO8f0qrCUPQrVEF4V4IqELDcWBUKxpu0LdWOXYUD98PKYg0QpGiuZ8m78HJlpedjv/HslYdVXuytSL8s2IIrzujuSC8k0A6Feg+JoxauGA7VmXM1Z5YwvuxG7EU4ZQLz05M+CGQC7SZn8sH
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6448.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(11063799003)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R1hrNVRRdzd5Q3grRWhENTVCMGJ6REhsa0NycmhoaGpBZWpJMjRUYTM1OExt?=
 =?utf-8?B?NFl5VFk3NFdHclpJK0p2b1dRK01FWE1KYnFDVFBIRFlhSFY5QlA0bHN1NDU5?=
 =?utf-8?B?RzBBU0tscWFMSFdEOXpQNHF6N29RWnFOVTY0SFdpSUFpRVo4Z1VmNDdoakEx?=
 =?utf-8?B?c29BV2oyUVgvRjlqL0pmM3J4WnR5eWVYRk14NW4vbXdJbzdSN3UzaFNjVjFZ?=
 =?utf-8?B?anUrL1VPcmJrTXV4ekpQakxnNmc5bWJjQWlGQVptV1F3WUl3d3FuLzdWLzNX?=
 =?utf-8?B?cEhqbnJNelloTDdFbGZTSGhYSzRyaUhyL29uL01MS1BEeFR3V2Mya1dUd25i?=
 =?utf-8?B?RExkbVRWM1VOKzNRMmsvMHNKVDJ0dzNMMHJESDc0U2NuTzBBck5jY21wNFdT?=
 =?utf-8?B?QkxJNWVFUmhvdmNsQjB5Q3lHdnV0UHpUdnVLUnVhZzNKcDM0Vk1NeVNJVmFa?=
 =?utf-8?B?cm4wVjdOMU5Ja3hPdyt2RXZHTmNPUmRudXVCSEt1R3IyRUlIV2NGaFl5bERZ?=
 =?utf-8?B?TVJOMkF4MFp1OUttYWNXQ3NSMXd1Vm9mekJ3dzh5Ync4amI1WHBmWUFKQ1ZP?=
 =?utf-8?B?UkVPQ3BadnpIZ1FpdlJDTGE4Z1BGVUdSMHZ1ZU5qTjczRUFFKzF1N1gydnZr?=
 =?utf-8?B?Ni84N2NOeEhPQ2x6cVRtbnBadHp2QjVJQWZNdGQvMzV4aWh3NFFjcElFOGdl?=
 =?utf-8?B?VE5NbldzQXMzK1NYRGxISERHV0dzSkJnWDFSV0NDUVhxQ1VQTzVnSmp1anU1?=
 =?utf-8?B?bGl4MzhKK3lvRGdhMkh1SDlPR1FWSk1xaGZwQ0lYa0VPREgvZ0JjL2R4RFFR?=
 =?utf-8?B?dm15aXJSaUp1S2RwMUNSckQ3Tm9KRWlhblBnek16S2tTQ2xrWDdDVG9OZWpu?=
 =?utf-8?B?enIxQlF6QXc1WmRGRDRxbEQvYTdTMjZsRmhHWU5TaDZza1JXY0pTSzhON3lV?=
 =?utf-8?B?ZXovRitWUzFBZWRma3hNRHNYNHUyendWeTZYWTJ2Y2VUUitFZHFtbVNjeEtJ?=
 =?utf-8?B?MHphUDRVYVhzYzBFaVRZSmFmNVRvQzJDRVFqUUtDbkJQOXl5VzRCNjR3RE5X?=
 =?utf-8?B?cUZNOWUxTENtVkd0eDRrZHBkRU1oMytXbG5menN4ejh1NVFzYkVuZmJCMWJP?=
 =?utf-8?B?YXlIVGpqdjVPWVBDMU43N1F2ZmxaWXR2ZjJxUGlpYjc0dVd1bWQwWXRDTEFZ?=
 =?utf-8?B?ampRRkQ3RUJDMFF6T1JwdXVPVDFxdSt1d2F5VDJoajhiTGRESVlhL0hwd3VD?=
 =?utf-8?B?b1R6NUJKdFRveWViWnJwYXIzQmRNZW1uWVEwcTJzTllYQ21Tb29UN1hrc0Rw?=
 =?utf-8?B?cTlxQ0Fnd3kveTlxV0luUGRwUnRzSlhRS05uWW1STkZzTzJWTU44NVI5c1JP?=
 =?utf-8?B?ZktkUXI2SXo5bE5HMFZnWDJ5a0NKU2V4YjA1VU4xYkVpM0RoM0RmYVB6SmZi?=
 =?utf-8?B?a1M0SE5QVWJ1N3U0QXZRV3dhb1NyQlIvLzNkU3Jjdjg2TmhOclVmT1lXVzVh?=
 =?utf-8?B?VUwveDVjZExzL091ejF0ekgvZVZkcVAva2p6TkVKZ0FZZkNDSUVkUmJQNzNz?=
 =?utf-8?B?RDhhRnFiRmgxY2EzRmhVbHVrZEZkREIxRE1iWlFTQ2tMUzU0TjZBT3RLQ3Q1?=
 =?utf-8?B?OE5VT3lNQVQ1Q2VJZ0hTQytBUldRQVZEZ1BvYlF4T2lybUdFWkVIUS9kSTJV?=
 =?utf-8?B?dCtDQUhGMGh6S3cyaHFSdnE2V0dYL2Rhd2RRUXA1WlRXVy9LSUp3UTZHUVQ0?=
 =?utf-8?B?VG5wRkRjSk8xcyswK1luWHdNMkhEQlF5Z3RPQ0lJRngvVlZ4OG8xVUVoRzNP?=
 =?utf-8?B?OVFPaU51cTEyVlJPUm1KeVRYWHJleGh3d1RRNVducTUxUUlNSk9MRStSaWV3?=
 =?utf-8?B?YW5JclFRaGM5NTUxL29QRUEzT01qTWJySFRnWVFHMW4yUHkyZnZmMHNHcWJR?=
 =?utf-8?B?czd3YkVWUTZSK1ppM3VBWUVHdjVnMzhsbW9nOUNKdmN1OE1DSFZQRmJZcFNQ?=
 =?utf-8?B?cXprQjdWZGswMFc5OU5oY2ZQZWQ4U3p5ek11UkZLYlROQlRUUDd4YkE4ZklJ?=
 =?utf-8?B?bGxuUGhIM3pTV2M5dW5OUVFaQVg2REk2MHJGK0pxcFg4enN5bHI0VnZseXFR?=
 =?utf-8?B?aklMdklSZXhsWkJKNDQ5RkJHQUVMeE5nSE9oRjVPdzhkVVUxbHZ0VmVrWk8v?=
 =?utf-8?B?LzE1dUwvYjdJYjMyUVNSN0xNQVJBRDVNOGl4SGt2YUNZdjkyNGc5QnpzdXo2?=
 =?utf-8?B?aHY0Z1JZWm0zcUpPMS92QzFLd0l6WUE0VVdibnlzSkZ1THJ5akFiVzg1VzEy?=
 =?utf-8?B?TnBKOElsRUVUTS9KNE1BUjhXTFBDVVY4Uk1sa0kzYmZMR1NYakRUQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc538916-cac6-4473-ccc6-08deb04a023f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6448.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 17:15:04.6948
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FguomXZaUmeL2pVsbvhw3ESKKszKE8w4HIgjLA80KwhY/xsT8iqSg/X1Qe8S4lyUeyyl3Wpjz8rKv8mIyAQ+IQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4435
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_101514_464998_B000436D 
X-CRM114-Status: GOOD (  25.63  )
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


Hi Arnaud, Geert,

See my replies below

On 5/12/26 10:03 AM, Levinsky, Ben wrote:
> AMD General
> 
> 
> 
> 
> *From: *Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
> *Date: *Tuesday, May 12, 2026 at 2:45 AM
> *To: *Levinsky, Ben <ben.levinsky@amd.com>; Bjorn Andersson 
> <andersson@kernel.org>; Mathieu Poirier <mathieu.poirier@linaro.org>; linux- 
> remoteproc@vger.kernel.org <linux-remoteproc@vger.kernel.org>
> *Cc: *Frank Li <Frank.Li@nxp.com>; Sascha Hauer <s.hauer@pengutronix.de>; 
> Pengutronix Kernel Team <kernel@pengutronix.de>; Fabio Estevam 
> <festevam@gmail.com>; Geert Uytterhoeven <geert+renesas@glider.be>; Magnus Damm 
> <magnus.damm@gmail.com>; Patrice Chotard <patrice.chotard@foss.st.com>; Maxime 
> Coquelin <mcoquelin.stm32@gmail.com>; Alexandre Torgue 
> <alexandre.torgue@foss.st.com>; imx@lists.linux.dev <imx@lists.linux.dev>; 
> linux-arm-kernel@lists.infradead.org <linux-arm-kernel@lists.infradead.org>; 
> linux-kernel@vger.kernel.org <linux-kernel@vger.kernel.org>; linux-renesas- 
> soc@vger.kernel.org <linux-renesas-soc@vger.kernel.org>; linux-stm32@st-md- 
> mailman.stormreply.com <linux-stm32@st-md-mailman.stormreply.com>; Shah, Tanmay 
> <tanmay.shah@amd.com>
> *Subject: *Re: [PATCH 1/4] remoteproc: add common wc-ioremap carveout callbacks
> 
> 
> 
> On 5/11/26 23:18, Ben Levinsky wrote:
>  > Several remoteproc drivers open-code the same ioremap_wc() and
>  > iounmap() callbacks for carveout mappings. Add subsystem-private
>  > helpers in remoteproc_internal.h so those drivers can share the same
>  > implementation.
>  >
>  > Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>
>  > ---
>  >   drivers/remoteproc/remoteproc_internal.h | 26 +++++++++++++++++++++++-
>  >   1 file changed, 25 insertions(+), 1 deletion(-)
>  >
>  > diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/ 
> remoteproc_internal.h
>  > index 0a5e15744b1d..3724a47a9748 100644
>  > --- a/drivers/remoteproc/remoteproc_internal.h
>  > +++ b/drivers/remoteproc/remoteproc_internal.h
>  > @@ -12,8 +12,9 @@
>  >   #ifndef REMOTEPROC_INTERNAL_H
>  >   #define REMOTEPROC_INTERNAL_H
>  >
>  > -#include <linux/irqreturn.h>
>  >   #include <linux/firmware.h>
>  > +#include <linux/io.h>
>  > +#include <linux/irqreturn.h>
>  >
>  >   struct rproc;
>  >
>  > @@ -122,6 +123,29 @@ rproc_find_carveout_by_name(struct rproc *rproc, const 
> char *name, ...);
>  >   void rproc_add_rvdev(struct rproc *rproc, struct rproc_vdev *rvdev);
>  >   void rproc_remove_rvdev(struct rproc_vdev *rvdev);
>  >
>  > +static inline int rproc_mem_entry_ioremap_wc(struct rproc *rproc,
>  > +                                          struct rproc_mem_entry *mem)
>  > +{
>  > +     void __iomem *va;
>  > +
>  > +     va = ioremap_wc(mem->dma, mem->len);
>  > +     if (!va)
>  > +             return -ENOMEM;
> 
> Could you add error message here to help for debug
> 
> +               dev_err(dev, "Unable to map memory region: %pa+%zx\n",
> +                       &mem->dma, mem->len);
>  > +
>  > +     mem->va = (__force void *)va;
>  > +     mem->is_iomem = true;

Hi Geert,

Thanks for the review and the Reviewed-by for 4/4.

Here there is a real behavioral impact from not setting mem->is_iomem for carveouts backed by ioremap_wc(). In that case rproc_da_to_va() reports the region as normal memory, so the ELF load and
coredump paths can end up using memcpy/memset/memcpy_fromio incorrectly instead of the io accessors.

Given Arnaud's feedback, I'll split that out from the helper cleanup and explain it explicitly in a separate patch in v2.

Thanks,
Ben

> 
> HHere, you set mem->is_iomem, but this is not done in platform drivers.
> 
> It seems better to add this in a separate commit after patch 2/4, with
> an explanation of why it needs to be set.
> 
> Regards,
> Arnaud

Hi Arnaud,

Thanks for the review.

Agreed on both points. I'll add the missing map-failure error message in v2.

For mem->is_iomem, I agree it should not be folded into this cleanup patch without its own justification. I'll keep the helper conversion behavior-neutral here and split
it into a separate patch with an explanation of the impact on the remoteproc load/coredump paths.

Thanks,
Ben

> 
>  > +
>  > +     return 0;
>  > +}
>  > +
>  > +static inline int rproc_mem_entry_iounmap(struct rproc *rproc,
>  > +                                       struct rproc_mem_entry *mem)
>  > +{
>  > +     iounmap((__force __iomem void *)mem->va);
>  > +
>  > +     return 0;
>  > +}
>  > +
>  >   static inline int rproc_prepare_device(struct rproc *rproc)
>  >   {
>  >        if (rproc->ops->prepare)
> 


