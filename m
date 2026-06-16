Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E25C8CD98CF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 08:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t4wPbghor/AWix3dkoj/esr2u04SI/HK/BwcdqeDwCw=; b=IVj+6ZmVtVmB7BXFBB643FcRBA
	9VQH9Z53vKmRiLCt6kYfdKi0QUm8SMFFYcAECiddEYVcv3VChF5cDFN3NOAMqj0oErgDnhK51mXqY
	MxfTF6yBQ+YSe8h3WnTLpG4fjHM+kr8LQpVOVeiWz2MmgBm1D7YDfAMqfVqNdpXl7Az9S9a0cQgkF
	f5AQKXo1HkMaKQIpmFT4Ju32+g9/McNtbpICWHmWnlwCzXOAHiekOuZJYu56+G/QDYj/ureF1DWJz
	Mbjjr2OQFp9klHO/EnozBljNqJ8Yx2veIq/NReIZvxhoELNrWdB2xKB20hiJGCXZEuG9r+mfGIfkE
	2FbecTWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZPSY-0000000FTXo-0XBl;
	Tue, 16 Jun 2026 08:47:50 +0000
Received: from mail-westcentralusazon11020104.outbound.protection.outlook.com ([40.93.198.104] helo=CY7PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZPSU-0000000FTX5-4AUE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 08:47:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A3Mem/szXDU1Esv+Y+ZVdIrom9/vRi5Zw9GcmhhsuyjHjoE081MtA1gDKvGEB/6Sz+LPb121s3LA3BT/TYYEjB+ocMo7G5kE6uUQvcywlXFNXHwaAcYesawMy26DSskMU1rq1sWwiDSgpp2y3eJ9nGQdnOBy9wKE7K6/mGbK8+a5YuzcEvsjYncGuLaUGc+9ApUioIjTK6XBtBSXYO+578h46jx8XoVwPZKa8wezpne639BlrN4RbkSTJrzDC9KrXXBbLee/VVhFPBDgeHbVn2MQD9lfEk6EZyV2ouMIag2ydqy558MJRtFNukAoJkkRsNGlWkvbi+xLY6bH/W6evg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t4wPbghor/AWix3dkoj/esr2u04SI/HK/BwcdqeDwCw=;
 b=y2ETo48pUW7GgVZ4E0+pvAoakvYSC4UOB+X2wdfub4L1Zrc8aUPTGvgLUIHoKpMLNJYjAp8VHJUtG8/VuadquMUczmKObzlMqVJKb1Re2VMrsWRtKJJxNFgitV8Ee/vMSpesHeNlCmraqEdZpBOhNmsI0qQ+2ODNohXsJ7PMP3QhEcUb9yQL57gXEwNJKhA/sV9AnfvbZLDH8B0DBIAHNEDbf9FJii5onWA7wHzYRgZwADA3h0Y1L1ZIoNvEo7NtNZlJa1ESKiLGIgtJwnN1Y2HgS1ob4u2GGbBCmaIB+f7TqzO5A0NLVMt61KgwUBtHpjQcX8ABsJ7qbUbDyIJgSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axiado.com; dmarc=pass action=none header.from=axiado.com;
 dkim=pass header.d=axiado.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t4wPbghor/AWix3dkoj/esr2u04SI/HK/BwcdqeDwCw=;
 b=qnvvS0zy4e0TNhrcpOcem6xTe4dOCqjs5VIfpvx5zMrhGvkizZS7DjRofmq3wFvQSd50gMYDgMiCnQqYRs9QQv5rw6eWOpLa+bsdvVHHHk37Ufwn80RPkZ7gn5u6Wg/Gh7whfjgzfVJsDt/lbmf/qmw9cYPabb9lQh6KzXHOc3mSCHiuiblTl4v2OlRyQTY2erv2oRK8H//oYOn6zCjpnejI9LFFaWMjbuaqQ1U3PMwp7b0oXr9EX0pZocxqf939tMnWH0S8M85H+VT7mW/le4RezQqHrD37vQSANLh4dyNxYCfndJFTB/l+UsLEJxTNc5gdEqd7i404yYOUiggiAA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received: from DM4PR18MB4144.namprd18.prod.outlook.com (2603:10b6:5:38b::8) by
 CH0PR18MB4305.namprd18.prod.outlook.com (2603:10b6:610:d0::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.18; Tue, 16 Jun 2026 08:47:36 +0000
Received: from DM4PR18MB4144.namprd18.prod.outlook.com
 ([fe80::cb97:ca8a:e55a:b11]) by DM4PR18MB4144.namprd18.prod.outlook.com
 ([fe80::cb97:ca8a:e55a:b11%6]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 08:47:35 +0000
Message-ID: <dd632be7-d5e3-4568-a3a7-d9e9c75de472@axiado.com>
Date: Tue, 16 Jun 2026 10:47:29 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] iio: adc: add Axiado SARADC driver
Content-Language: en-GB
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Akhila Kavi <akavi@axiado.com>, Prasad Bolisetty <pbolisetty@axiado.com>,
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Harshit Shah <hshah@axiado.com>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260611-axiado-ax3000-ax3005-saradc-v2-0-913c9de7c64c@axiado.com>
 <20260611-axiado-ax3000-ax3005-saradc-v2-2-913c9de7c64c@axiado.com>
 <aisPbXOB6cofF4_r@ashevche-desk.local>
From: Petar Stepanovic <pstepanovic@axiado.com>
In-Reply-To: <aisPbXOB6cofF4_r@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM9P192CA0021.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:21d::26) To DM4PR18MB4144.namprd18.prod.outlook.com
 (2603:10b6:5:38b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR18MB4144:EE_|CH0PR18MB4305:EE_
X-MS-Office365-Filtering-Correlation-Id: f8358096-5156-4be2-4db9-08decb83e9cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|23010399003|22082099003|18002099003|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info: kMGFsidtUjnfrFCxbmWWe3Euif+JnfEAMOuFr+1MaAhWQMOp+unkgINQ5h7/bCMD+cy9wi8UYsXXRAC3Z0lzmIxTl7oyNZiQ5x/Qd+yllQtZj+v56X8GpzjXEU45C3Oic0foN/rqStksJEQ8s8kAHi2P1OXIcw+ZL9UoF36zVVUuyvmvG/MrnR38Y2sB36tCD2qJpTolvumlISfwSJD1SojIdTiwkfSNo9aDxyWzZTTihqzz5XVqgamhZG88VVIPs4DjRXnQICvp3N6VyuWVzyHXlg7YtDbhI7SxjYUhIJ+5rTIU3vlOVNymrLHsYC0G2ps6J9xy9nrUlfFt0mMbOknUkMqb0yjvZGUfo+YXWr//5etvhsn4JXnGvRCBj9Jos7IdWT8XMTTJsdwgQop6pyehgbV+Te+ptoNo53BjYccF3YN/1zk6adnobAvbITsqaVvxDSuIxm4tdb2pcmZJJynFBdeoDYuQwD7gzL/2cye1d7Dg7VuVe/IIDcAZIm74f+l3pFuwp0F3izoDzgKaFzrB9C8XsGcP846vMHfjwxg4+6q7sFSgi3PFz0JqfxbMO3Z7+wexSsn8eOiMIqFQfn9Az0kAovam2SW0HPNzkByVm6S6Z8tDWk9Mr8H2XTOAY2C+j0Fj0tBXMtascfVWE4cRwJKcDm9FW2hFsc1UBkjPcjnHSxZdje/EcYS0Vpxe
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR18MB4144.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(23010399003)(22082099003)(18002099003)(56012099006)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dGE1UmIvdVZDUXk1aytvUmRnYkxTVERMek9OMHdOMmRJSkp0SmtOcStoMXVJ?=
 =?utf-8?B?ZjY3YmFuUWhONkhRekd6VXN4KzFRNjViMkszNkdQZkpjd1BoK0JJdEIrMnRY?=
 =?utf-8?B?NnZJc2gyNkc5Zzkvb09oOWVtQ3YwWjI3MmpRODBiZ3RIVkpzcDVxeEoza1hQ?=
 =?utf-8?B?dW1jMW1xWTkxQUVGTFJNLzUwSmJLLzRvKzJSbzlEMTN2aDFBa2I1S0pCVGhX?=
 =?utf-8?B?M0laRnFZa1kyaUFuaDFpQUJBTERCWlVjT3RGM3E1N3JicVFWZGtSbWRhY1lR?=
 =?utf-8?B?RW1McUVQZzJmVkgrcVNUY2dFR055cFVyelpvYkNkTnFEV0NaM1NGTUsweENC?=
 =?utf-8?B?Uy9YQ3A5VDZMbTNFd3lCVUpVcjBCOVBzSzNPYWowTGtXYXJ2YkNSVEQ0NHlD?=
 =?utf-8?B?a2xQOUxuVXRsWitnQnhCYUJMVXozZm5CekxSekhuYmRUZnRzREREeFd1c0JJ?=
 =?utf-8?B?MC9yemx6MFo2dWgxQzJINkU1NENQOUJ4S2FQMVgyZXkzVEhEUXFzUVlvWEdR?=
 =?utf-8?B?TnVJVW5RQXlJQ3A4UW12TnREVWRNdGF5elRoWDEvK2lvRmMyRCt3OFJXT1VN?=
 =?utf-8?B?OGlYSzVRT2ljK1J1OTJDbWJsTnNFN2RIbm4waG1IZ01kM2tnS2g0NHRsY0Nv?=
 =?utf-8?B?OXdFRy9NbDRXamlCOS8rVUx5b1ZZNzkrNi9POVhVNDZvcDdkdmlFbExqZitw?=
 =?utf-8?B?ZnhGUUQvQVFlVm5aNDRzbmszc3FoK0V0Ny84ZENocFVEa3dmcDgrMDQwSTR4?=
 =?utf-8?B?VmJSQTFwV0VETEQweGRXendHc3hkODZWOFJMb2s2RlZmUVBsTmFZZG1DMkFn?=
 =?utf-8?B?NFZVNDVId2xiVjNSaEg4L0IzQUpJV2xMTnhoSEVFR1k2eEFXd2VrRmcrODZq?=
 =?utf-8?B?aHpxSjZMSUdzb1ZwK1VLZW9LL1k4RGJybjkwdlU0UzQwNHVYM05PSkpuMFY0?=
 =?utf-8?B?eXkrOGVQZEFMc2RZTlpGaENzd0xWcUhFSjRDTkhKbENVUGNZWHIwWVo3bTVw?=
 =?utf-8?B?bWpIVmNWVWFsb3FwY2U1QXhBYWpmM1JBTFdNbk5zS3ZjNktCSklNRHFvS3gr?=
 =?utf-8?B?K29hSENJM2I5TDJEWDBZUkVYMlVQNE9xTVp0dDgvYmE5Q2lBNXBmZ2V0NTJu?=
 =?utf-8?B?b3Q4Ull3dFhYK3VVRCt4eVBLWFhNVW1qaVAwZ3A4TmZFUVJDSkVmbFNENGRl?=
 =?utf-8?B?ZXVtZjMrTEVjQlRUM1NzMWg0V0JSZXBjcUVvK0hEQTBBYklJZ3NmRHNzRTFu?=
 =?utf-8?B?UC8yVVhRdm43eHVWVHo2bjJYaWNnUHZxNytOZGs3dXc3RTFwbjg4VnVOci9Q?=
 =?utf-8?B?a1UxRHBrUm1iLy9raW1zYWdscHZJZXZudjNOZEQyVjUzYTlBamREdCtNNlda?=
 =?utf-8?B?UGZkRjNuU09xMjdCOVlYU01QZHBlWTUreFcyZjVta3pnNlh1WUN2L3gvZ3hi?=
 =?utf-8?B?ZDdVKzVrYjRObk5wSkQwRGNBRXpoRkZ4NUFMTlNzdVFDamZRN0xxYmRuR283?=
 =?utf-8?B?bjJBRjRJVHNQVDVDYzJFN0Q0RVVibEFRZEFUelU1NEQ3S1BnczNyaVZsVGdB?=
 =?utf-8?B?Nk9wLzJkZmlpM2hxeVZMYVJaY1RxajJDam44Q0JVK1hOUVB6RlM2R1dVSHh3?=
 =?utf-8?B?VjJDb21HVGp6RXVZa3ZSK0RvSGFjNVE5ZnB5dVRQWEh4OG9FVUw2SE9hT25Y?=
 =?utf-8?B?WGFtR0RpeE9jWGI0NDNLbFMxdGpJY0hzclU3UVg1NHVaK0VDalJDYmF5Qkxs?=
 =?utf-8?B?dWJZUSs1eXBhVmZLR2JYVzkzaVhKcjBteHRqQit6dzhIVEErVUswYk9mRlVI?=
 =?utf-8?B?WlBvZGh3cGRhcWY2TkZuT3VuNXRkNWVPbDBGd2N0RUpncU5BS1BEQ1ZXcFQ3?=
 =?utf-8?B?bVdwcmQxZm1CYmJnWnh3Sy9KOHRWL216bnNpV0RPT3BlZzVXNUY5Y3NVdUtx?=
 =?utf-8?B?aGFLNVlMY1JGZFFtYXM4UFBtYm5RVDFiQmhlY2x2QzlGU3N6dGw4OE95R1dR?=
 =?utf-8?B?bTlsYkZ5dnN1S2hZclpMbERVTlBIOE02MWpMWmxYWkpmRXhHekpMbUdCZy9k?=
 =?utf-8?B?ZjRkaDlEZDg3cXF6MFVnZnR4eGM4Y1Q2UkhSK1hKRjA1N05ReXoxWi9DbGE2?=
 =?utf-8?B?aXdFdXhXRUgwTUJoZ01pRHJnU1RVNWd5U1B1dTJnanhLZVZ5Skk0OVdvT0Zl?=
 =?utf-8?B?clJ5a2NFb3dLMFJBNWNsTjVjY2VjVzBlYm13US9TUlZMNGhzRGtZcVlwbDNM?=
 =?utf-8?B?NTJwNkNOaGNWU25pdUpvWnpJVXdZdzFkZE12akJXaWdNeWxXMlNCQlNDb1Jw?=
 =?utf-8?B?TE9naTUyWG9LVW1VMmdaeVZSdDljWW5iZXlqSEVaNWtJVmlFQm5rUT09?=
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8358096-5156-4be2-4db9-08decb83e9cd
X-MS-Exchange-CrossTenant-AuthSource: DM4PR18MB4144.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 08:47:35.8965
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yvS3fJ0FsqiOt1m3hwHiETcXnsjBKOdXuOfBu1wns+lYEpD36BhvHQiuYYd9SnUv5df8SoDtATN8QHlDESvvFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR18MB4305
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_014747_041229_2C2C816C 
X-CRM114-Status: UNSURE (   8.44  )
X-CRM114-Notice: Please train this message.
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


On 6/11/2026 9:41 PM, Andy Shevchenko wrote:
>> +struct axiado_saradc {
>> +     void __iomem *regs;
>> +     struct clk *clk;
>> +     unsigned long clk_rate;
>> +     int vref_uV;
>> +     struct mutex lock; /* Serializes ADC conversions. */
>> +};
> Is `pahole` satisfied with the chosen layout?

Thanks, Andy.

I checked it and found that the current layout can be improved. I will rearrange the structure members in v3 to avoid the layout issue.

I will also address the other comments in v3.

Regards,
Petar


