Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CECEC53200
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 02:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VMi61o4H1uJm4yz9CrL4mVYIEqdmIN4FPjwoCP75zw4=; b=bDQJIHtmgrMVwpwmtwvcQZYCmT
	X1Qgt0YuvsppkZggR3C2HvHCVjaBl+4VuRVKR1fYaBp5eFSL4i0Xq8XE5wzjnP3gMNBwczZtg7rVE
	0C7mKEJeB6ORRMZchPwrzAo4Hu1WdKWmDMCPQd/x4+9X/GMpCpkRJQ7zZJ6+IVz99x5oTNNwJEay4
	3Ny5hvwhXmEr5p/54mrMJ2zQrMDOoYNn6jtO+l1tBmzcdGWQEdMOQKbEETCYcFu4XYtVW2qFNq8Ci
	8DA2T3EiU71I2kbo6A0QIvQ+TofTQ/QcFN3/E8AcXb+j/qyvw0+6Gzs5ytABG+JrVN3BuJSLEaAYM
	9rI7HYZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woBXO-00000001qjC-1lgs;
	Mon, 27 Jul 2026 02:57:54 +0000
Received: from mail-koreacentralazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c40f::6] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woBXL-00000001qid-2ZL9;
	Mon, 27 Jul 2026 02:57:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TWHFSTv6c89z6sKPk8rvecbVBzCVCKnS6a4kbFennrVdojaOLG3050sy7avOEr7gyivgk9ol/m37VOut6bmXl7w7p0cuOtNbvDrwiYZgzg1wJS+bingxbqG2079ND+gD7veUXW5rccIsfFq8SlDnlbGkyK8jWAIzpfjz7yAX1QzTV7lyyjok44ixt9vx49HbIXaBeO8ZAHlgII4O4INGCdpvCAAwKpdofxSS7lfV2UBPgdCak7Dxb7n75mUY1Qeo4aABT2sjE2SoPN0cHUBiuM9ndeC+Nd4kynFJoYAqVQQsVh1X4u5FrI8xCjwJx8iVTP5/PMFbpE06PB0+d8bV4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VMi61o4H1uJm4yz9CrL4mVYIEqdmIN4FPjwoCP75zw4=;
 b=cRY2jr3YdlqLPJAUyjjNtqE9amGT9KAw5QVo4WuGglKHKt1c8vdHuo+/DjzbwYhfQxsilVuUrNadDw5JQ5tRHCN0fxNKyAiUBRFnNBbiwy78IRthz59S7v4r3MkXdDudOmUG8JvOXmt3LXNMNSFn3cw6W69p531O6lzpP3kYAUjYKVs19Hd2f0X4PsKoYONlX5yWkdOtYWXO+UKIJTh1zzewOIB0aRJL4FTEyraH+WaoDHrlCNzyhSqJqltZSHG5HmZRgLXP3H8U3CgysedAgaoXq76rGn8gFAL3xjtO6H8hOW24/KEgaO3XKSbiXW6t7EpZeNbH9aBLmN/4xq1udw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VMi61o4H1uJm4yz9CrL4mVYIEqdmIN4FPjwoCP75zw4=;
 b=tDwfv5Yg1X+fEo+/j6cXlkxHi93K5xKwJt++ohvYRdYjmBwVETRez+Uf9Cq7H2eUVXCyXHi/cw0OYSpebgZsOS61X+udRV3VH2vrMXIOj76/W3gnCQvg8vui/NkQy2/xwJB8+rel/8i1OcrYbsi5Laqqj2gsEVW3rIecNQ/mjK0mVk3Jt7nx3osyJv5ynfL8RwB9sTgsxsJHxXB/i9MyFn/koLdQzMYtkvfN/jCaH1h15NqEc04v815rQs7mZD5a2CsjlfXiYTy5RRXhzkH2+w/R6wotHB9wT0xuqGaxpsjDG6FSHXnMGUFBp4wcNoP9Rdg8npG01GcK/tsG7gdUOw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5521.apcprd03.prod.outlook.com (2603:1096:820:51::12)
 by SEYPR03MB7533.apcprd03.prod.outlook.com (2603:1096:101:147::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 02:57:35 +0000
Received: from KL1PR03MB5521.apcprd03.prod.outlook.com
 ([fe80::f12b:85e:f95c:191e]) by KL1PR03MB5521.apcprd03.prod.outlook.com
 ([fe80::f12b:85e:f95c:191e%6]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 02:57:35 +0000
Message-ID: <2d5afa25-ccad-40bd-803b-27ddeb32ed4d@amlogic.com>
Date: Mon, 27 Jul 2026 10:57:34 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/6] firmware: meson: sm: Add video firmware loading
 SMC call
To: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20260724-b4-s4-vdec-upstream-v6-0-6072a7ee7428@amlogic.com>
 <20260724-b4-s4-vdec-upstream-v6-1-6072a7ee7428@amlogic.com>
 <49F34481-918C-42ED-92E9-DFC336526BAD@gmail.com>
From: Zhentao Guo <zhentao.guo@amlogic.com>
In-Reply-To: <49F34481-918C-42ED-92E9-DFC336526BAD@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR02CA0124.apcprd02.prod.outlook.com
 (2603:1096:4:188::9) To KL1PR03MB5521.apcprd03.prod.outlook.com
 (2603:1096:820:51::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5521:EE_|SEYPR03MB7533:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a23f148-7064-4dcb-685a-08deeb8acfcc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|7416014|4143699003|11063799006|56012099006|10067099003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 3P1bpV+wVupeeskQ5oO1z4rIaebSS5plzXTDBbbDdMJWvgS/Ukt+y70BT/0OWPLk1SPEGqU6eVoh+LM5Ik+/NtdTiQ7Z42IDvbROphlDsK47gM3QHRAUSJoLvDcoAOzA4waZWEeEyFxGP69Qr3kdcwcT2cKh3TV2LYxhFqrrGUmAL+fskebbnQsncoQaT/eVlfvl5GlJOm3WDtYiSR5Ncgt8g2Wzv3UfIe+Pyhz8Stg/zRcT+oMXvgIDhIHOTynGt+WJuGwS4tiY4mtPH83RLTWALUo3fsW/xF1z+ScxqnB6bYrrmfya2BN3KZWdU4W03e+LkabBovzbZ3j071eXredNFnx3f1V0WH72B8sA+GRQw0HoYkl8uAM/kkTS7cbB2bJv1TY8bGXwtWbVehEyf+nntQG7NQSujcrxTt0EbBdyDWEbFpJ2OxT38p6ocObBkzxCHPKkNwcy9I7UMJY2L06QWF/UsDqWNzO1pYof/fweiQh1TJvBN789+WfmkB6cp6dFleRB3dt6RksRJigxAZg4jolrSBurshsnG5NY0zFZpbJARV7EoNmZaoaqUbI4FOAskLH0F2HQrtcODEB20JOAiZT1RYOF8S/JMTLURJZprQ1sD9C45HoKkWe8kdmx
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5521.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(7416014)(4143699003)(11063799006)(56012099006)(10067099003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Uk5LTzRRTDdENmNENGlJdmJMOGFIOHJrTlNldjRzYmV5Zm1zbE96dVRoNkRi?=
 =?utf-8?B?S3VhVHFndFVYV3dTZEFBQjdCV1lKMitEWEV1eFovV2tNUE1jd0JEWGVRNHhE?=
 =?utf-8?B?anBvdGJJalNuVnRaRmVRUXY1ZTArM3YvN285RlBjeVQwcGllODd1c3owRkJ4?=
 =?utf-8?B?Z0p4M1V2ZFpIektKQURRN01tWXlGa2JYM3haVDlWUm1UQXQ4QmhwWU05T2lF?=
 =?utf-8?B?MTAwTVp5QkcxTjdQbnUxbTR1N0RZeHJQTDZ6WVFwNGxPZmlwS1g5NjNRRGhN?=
 =?utf-8?B?ZVluQ3RhcHRwMVY5dHpCOWR6MUN4Wjd6UmhidHJQRy9TUUlidWFuZ0pjWnVm?=
 =?utf-8?B?cnM0eVFKNUNoSSt2ZXhSdGtOWTJwSkY3YWVENDFxUy9Jd0ZyWHdBS1FmMDdY?=
 =?utf-8?B?WmFoZWxlcmR3OWp2ZGJseEozNEt2Q09NbUJJMDlodFBmTDYyZ2JaZlJ4SFpT?=
 =?utf-8?B?Uy9zcXJVTURFSFQvRFA3Z0x0dHJXMndUUGxTRnlxSWJHWEhLM0NIbWI3bXNU?=
 =?utf-8?B?UTRadC9Zckc1YVVkbWhNMzAreEV3QjBCWlhsNE5EbHhtSWVRSURjRGVTbHlD?=
 =?utf-8?B?aGhQd0k4WDlDMkRYeFpXd05lQ2ZnalVnbENSZFg0L0t1Qmd1VWFzVXpZYXli?=
 =?utf-8?B?WTNLdTBqTmVXZWQ0WnJhQkR6M21qVTBxeU9WQ2FPWkVOSmlRV1UxM2w4bkdW?=
 =?utf-8?B?bHgybDEwcWFDei9BeXFhZHJVWWN0RXlYRWNaWkVFa3IrMFZHRWZ3Skk3N3Jl?=
 =?utf-8?B?cDh6ZTJIM2taalVFVG96Sit2RmF1MjF4ZnRmNXFKb2o5TDdwbEQ0bDdDTVNx?=
 =?utf-8?B?TzVvM2RLa2x2eDdGRnM5TlFSM2tqdkE1bGhVN2ZlUDJKNWl5NmFWWjlWZm9p?=
 =?utf-8?B?ZDUvTEMxSTlwZHFYZWRqQ0QwaExhRk56VjhCczFSU0V2bmp1UzBRcVRxd1du?=
 =?utf-8?B?SXJ5MlRZL3VUU3hLOVJPQ1FEeFROclovRUhOdjd2cUdLVWc4S2FzRys1eHBZ?=
 =?utf-8?B?WXhlanFZY3BPWFdHV3JyN0hHY1BmeEp1SEdNaW52d202SUtOVW9TQWtyT0gz?=
 =?utf-8?B?R0dnWGVmTmFwWE56c3UyS0owTXQwS09DREhycDBncXdOWnE1eDYrRjM2S08z?=
 =?utf-8?B?VGtXVHBaKzZ2SU42Tzl1WGpQUE1YUHovSWhzRG96MGNPMGk4T3luYytTemFH?=
 =?utf-8?B?SHBGN3hrUTBHVmdBWWM5WXZDZXI4dlNONGs4TXRyUHZqL20zYWRkeEdTNFlt?=
 =?utf-8?B?L0tLTzlvb1dHYm91REJRd1pySmx4dS8yQTlkK1puUDZiMHFId0wrZXhtZGIw?=
 =?utf-8?B?ZUd4ckNPbUl3WlY0RlptbGFaVUptRG1WMEM2RG9yQW9RYXpsWmF2RlpHeXRK?=
 =?utf-8?B?bHBPdjN2dWZ3aFc1N2g5cHVUcHBxWGptVlJDTER0aEh6V3lpV1RITSt2QmV3?=
 =?utf-8?B?Y3dOTnRUQzBTMEx4K0hiazFSTmdqWktiRm5neHJFRi80aC9lYVBhYnhoNnhL?=
 =?utf-8?B?MDVaTzRFTFgzak1tYzRjSG5pVERsWEpzMzQxSktwSmxDR0dXell5Q2pxT3pF?=
 =?utf-8?B?ZG15N09EdWpNcEpoMUh2cnQ2NWxlUkwrQ1dseDc1UloybW8wbE1Pa2dSUFFE?=
 =?utf-8?B?WFlDb3BTdWNCSEVPVnE1MzZsRlVPNytwVjJDSVA5QUxIMWNmSzRLRTdiS3JP?=
 =?utf-8?B?WGw3eENxdkxpUGM2bDVGalcyS0xYeUYwMUxvTU9xZEo2a1RvbExveWZRejJN?=
 =?utf-8?B?M0YvNnlKRk9zRG9GQ3dLVUtRaW1kd0FUZFEzTklrQmdpZzZNM1Z3eXhNWFh3?=
 =?utf-8?B?OG5tY1MxMDFWRUNIMFkra3JNN3hmVkJsdERRdjcwM0VnUVhrT0VMWjhxd3d6?=
 =?utf-8?B?NXBGV3Q3V2piMUFYOU9yZDZvUW1TbVdkd3Z0bGh5TXZHQy95T2FpeFBNQXJQ?=
 =?utf-8?B?WEZaM1dGYUpCZkpweDJOU3ByTDM2Nkg5SVplcWZ0aFBiR2I3YWVydG1zWWlY?=
 =?utf-8?B?dFZUM292ZmJhcWdHc25xRGRQRFBjVTZNbEtCOHFwa3pIc0kyYnU2ck5ydDl5?=
 =?utf-8?B?elB4emFnQTBHaWs5aUVLK2tDM044Rll6VUJEdDlHbmFmbmpLd3MxRXNBSjJ5?=
 =?utf-8?B?NXF0K3BJTnZxbThVT2ZZWjdhTVo4cElSOUN3aVFrU0cvYmVnL3Roelg4c3Qy?=
 =?utf-8?B?bXVHKzMrNlRNeVdRRXZzbW5zWFF6VnhWUWJoSFdTQlZwcnc4ZmFtbDJ3TEN0?=
 =?utf-8?B?dmxJZUVVRUh6dXE0RWFsajNwaEc3ckRock5HaVR4TjhEcWd1OUVJVGRZL2Ri?=
 =?utf-8?B?VzV4VHczdlg2RlJDODJudGhoNHpJSDRuMUtTL09vWDBRRWUwMWMvUT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a23f148-7064-4dcb-685a-08deeb8acfcc
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5521.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 02:57:35.8531
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pOjPJU3d4Cu+MUEYB0q78wO9cCz49CkgVJ4TRe6zHOpyrkEESaole+fdikVHsNfmMfWnMLh7NWDhCeQT8exSgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7533
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_195751_660000_D7494213 
X-CRM114-Status: GOOD (  13.77  )
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


Hi Piotr,
> [You don't often get email from piotr.oniszczuk@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
>
>> Wiadomość napisana przez Zhentao Guo via B4 Relay <devnull+zhentao.guo.amlogic.com@kernel.org> w dniu 24 lip 2026, o godz. 09:04:
>>
>> From: Zhentao Guo <zhentao.guo@amlogic.com>
>>
>> Add SM_LOAD_VIDEO_FW at SMC ID 0xb200000f in the command
>> table to load video firmware.
>>
>> Signed-off-by: Zhentao Guo <zhentao.guo@amlogic.com>
>> ---
>> drivers/firmware/meson/meson_sm.c | 1 +
>> 1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/firmware/meson/meson_sm.c b/drivers/firmware/meson/meson_sm.c
>> index ab9751a59b55..887caa5c625d 100644
>> --- a/drivers/firmware/meson/meson_sm.c
>> +++ b/drivers/firmware/meson/meson_sm.c
>> @@ -48,6 +48,7 @@ static const struct meson_sm_chip gxbb_chip = {
>> CMD(SM_THERMAL_CALIB_READ, 0x82000047),
>> CMD(SM_A1_PWRC_SET, 0x82000093),
>> CMD(SM_A1_PWRC_GET, 0x82000095),
>> + CMD(SM_LOAD_VIDEO_FW, 0xb200000f),
>> { /* sentinel */ },
>> },
>> };
>>
>> --
>> 2.42.0
>>
> Zhentao,
>
> What is req. baseline for this patch?
> (or what extra patches are needed to test it on 7.1 mainline)
>
> Asking as applying on mainline 7.1.5 I’m getting:
>
> patching file drivers/firmware/meson/meson_sm.c
> Hunk #1 FAILED at 48.
> 1 out of 1 hunk FAILED -- saving rejects to file drivers/firmware/meson/meson_sm.c.rej

The baseline for this patch is 
https://lore.kernel.org/all/20260424-add-thermal-t7-vim4-v5-3-9040ca36afe2@aliel.fr/. 
I submitted my patch based on 7.2.0-rc4.

Best regards,

Zhentao


