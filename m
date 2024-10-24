Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE8CECE8E9B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 17:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gBoB3qhjy1F+NlA4wPqJn6awqwyQg1XNxd7Rrry3l4E=; b=svRAsKHm5toeEYGZTe5bPHNcZh
	9paBTHT6O41KJGN9ktTpoZKDNTx9h4YNAatNfbedUQ5MBbKdbnmGAtXvQteDCbzaRi1jnDxcKliR6
	x/47RP6h5+jrSt8Iahko6FWxuFBaLYdSnr4wx8xZW8KTYsyB+wymE+nQdlg9pVNKBqDFR3EWvDykP
	M03WlrcQnR7hPaQuqoozzdDPdwXr+xdxP08EFGIoRfn3eIaKtanzepGigwtqKBvTf06lDjL2NeMRj
	lqmmQSqD6CIHafKun9la5d9sfUM+NiS53WNOIA8kpKFbq6moV1/rtTZoa0+jd5v6t14gnR4jopc4n
	dBCiIF5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t41uI-00000001Kc5-3m1l;
	Thu, 24 Oct 2024 17:45:58 +0000
Received: from mail-db5eur02on20627.outbound.protection.outlook.com ([2a01:111:f403:2608::627] helo=EUR02-DB5-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t41bN-00000001HOt-3ASE;
	Thu, 24 Oct 2024 17:26:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oiOXFDCJCreStTtQNUkFkR4iH8RbY9BOH5/arO2SuvEk5pxz+Hm0vzy8b+GQziPVxYHV1SYpee0FSZ904f9LVU4NwEVY1amK4E8HxL+5UwJd5nQuNG0C3PQQMrhKgXHZCy4c1E/DejKpp6/QZRNjVgtiDVX09sSF5vpaNULRQ2fatOnZrXXJiW1nM+nKMrrnqkZk/jCE3HBxI5/SMlOrAWcz/+ASK5lz83U4qwMnmpMWUzEOb7wkQiVPchqlyyyGP2Vu1IL3SeerfIcGcGzd/B8w3k8ZfMFX6cn150QSrWZf1elI02FYxdcWz4B0faqKqEzDMaXwSopGROGB8zTWCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gBoB3qhjy1F+NlA4wPqJn6awqwyQg1XNxd7Rrry3l4E=;
 b=jVtKCkMUen1Rr69er4DUULMHDzXFMKiT2+auXnGQl9+R1vTZHVpzBOlxmx3FKbYl2mhiWSs14QLpDhfZGTOP0zBaNGZdUkocTvA5Ive+A/7QeawLyXZwmojwyn8CwZoDlkRGc31dTwoY0b14jDSLKGuLhih2J5kTP1ZbAfAQND78JlTggdctoypRtA23Cm/Dn3uet4ic0HqNJYcdyaj94xnS67nRCwpjRWUfC6K83+HRQoyPs54l6cdm3RqNpk36g044NQ+/2PXyS03qmyIAn/n3SLcRcM2eluhnLbEZZeIAyUPuwQKGddwo7cQZjS6X7+11sNYRMdjwG/UeRHkFEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gBoB3qhjy1F+NlA4wPqJn6awqwyQg1XNxd7Rrry3l4E=;
 b=Gp3+MrPy2IZ3sjHNWAi702/IoEeumgbTo8Tvm9xsBfurWAhpEPYmmXSX+EyLx2Mu1l8Fhg+GVWOqabDrZLszPHiZrhzFn/cosy3HO7FRKGG8NE/VXz9hi+Gacsii9970r2I09VG6A6NFiiezlm1aNPE84LSHlen76epUH7adFF8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AM9PR04MB7651.eurprd04.prod.outlook.com (2603:10a6:20b:280::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.20; Thu, 24 Oct
 2024 17:26:16 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%7]) with mapi id 15.20.8093.014; Thu, 24 Oct 2024
 17:26:15 +0000
Message-ID: <42f132b0-2518-454e-aabc-13095bdfe6ca@cherry.de>
Date: Thu, 24 Oct 2024 19:26:14 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] arm64: dts: rockchip: add HDMI pinctrl to
 rk3588-tiger SoM
To: Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Heiko Stuebner <heiko.stuebner@cherry.de>
References: <20241024151403.1748554-1-heiko@sntech.de>
 <20241024151403.1748554-2-heiko@sntech.de>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20241024151403.1748554-2-heiko@sntech.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR5P281CA0037.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f3::17) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AM9PR04MB7651:EE_
X-MS-Office365-Filtering-Correlation-Id: b6216549-ca94-4a6f-b071-08dcf450f6de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NFdLYVNJclJGOVNvbzQrYytVcTRvcDhRdzJWcGR4Z3JmK3pRb0lhZTNuRndT?=
 =?utf-8?B?R21LVEk3N3NBUVBXZ0lqYSt2SEVsQWV4aTFrK3Y3bVlyekFoeWlDc0tURzFP?=
 =?utf-8?B?M3Q0dEU3MUgrcHgrS2Yzcmdacm1ZTXBFVS82SDRqaHZTQW1yTlBYL1VUYkYr?=
 =?utf-8?B?dDgyeHJwaXhwNVpwa0xxV0U4KzMwaXlNWE8rQlVWRFFRMEFQUU4zSk8xRHRh?=
 =?utf-8?B?YmNBbUJzcXRCWVNsQkplSjdVU2kxWS9rcHI4LzE2dTRKSnNPZUxKNTg4SEpq?=
 =?utf-8?B?QmFncFpuNmI0QjFrdHQ4SWoxdzZxV1hJUE5mY3hTQWhCdjZ4ZHNsK1g2WkVt?=
 =?utf-8?B?Vi80WWJ1aDh4Nk1ld3BGQUVNazhJS0MwZlkza3VYQ05uZy9vSGs4MjdRTGlx?=
 =?utf-8?B?RUYvRlk0V0xkc08rNUJOQVlLUWFsVEUwLzluRlIvNGhLdWtUSDVmMnR4d2FB?=
 =?utf-8?B?Nys5c1JndkxEM3NRdjM3U1YwdHk5SnE5NVZCU1Q0b241d0FoRUIvbzdjUW85?=
 =?utf-8?B?WEdGQnIveEtuTFdtV0k2bGRzZW51aGtYSVJLUFZUOC91WU8rejA4cTd3bFU5?=
 =?utf-8?B?dERzdll4cHJSWExyaFFyK3pUQUpjUHFiOHg1d1VWRGlkZEY1TXJSaFV5WTJS?=
 =?utf-8?B?QU5jM280SWFndmhKZXdrekoyZ0JTVThQaUJidkNFSk1oS3hNR2hKQVZ0Rm1n?=
 =?utf-8?B?ZkkzRE5SU0FXYUNaUERtbFdBTlFrRDZ0WFZBRDBpUnVKWnU1ZWZuNkxsNmYx?=
 =?utf-8?B?TFdsVnA2RFZtSUJQK3BYa29JV3VoRmY3L0VvclhXMzdldjdRQ0I3dy9IWVhI?=
 =?utf-8?B?V1NFaEVpMkFuemNwaUhpOWx4NGlIUTFPYjNvaTQ5Y25PYjQvUUloZFQ5Q0lK?=
 =?utf-8?B?VkhxbmZ1QTVidGFnaXFIRGs4b0p1aHloTW9Kd2RBZUErNGFRMjQ4K2FoVUUw?=
 =?utf-8?B?b3VqSFpudldrclFwakJ3MWtKdUJmQ1Joc21wZGd1SkhRZFVNV2pqZWVGS1ZR?=
 =?utf-8?B?SXM2L3RzNk8vc3hHLzRaVlpVZ2hrQllBNk9hVmxxUnRxbWxxdmduN0poa1A1?=
 =?utf-8?B?UUUxUWxmdlRJWkhJTG4weWlFRU5Oek50M3pGOTgzWFdmbURvWkdubldXL0Nw?=
 =?utf-8?B?LytKcFdUd3hUQXFzL012alpXTmpUd3BDb2xSTGFpOTRUKzREam1KQ0dLN2tq?=
 =?utf-8?B?ZGF1ZzN3Vms3YnVnWTllUUlPRkY0Y0hYSkR0QSs0SE1PSjA4Z2FadDFSZUEv?=
 =?utf-8?B?RlM5Qko1UXgwVnBTbHhwd1BRS1NHRTFnQlNZUnE2WmNzU2ZCL3kydTByU3hW?=
 =?utf-8?B?ckZ0NHZaZ3FlOU9Mb3Byb3VkN09MREx3WGJUOVY1MTJvMEVuUGFSMGRWTjBu?=
 =?utf-8?B?d1FVVWRWVDV5MzYreFg0Z3lvUC9tL1FvQXRXNGFaMVhESDlrdjQ4NEVRR1BN?=
 =?utf-8?B?NUdTOE1DZGkzakp0Wjh3cDhNa1FycTVRSnBQWkY2RnpRM0ZBS1hQb0laLzAw?=
 =?utf-8?B?Sm1wK2tXVFh0MGFuTmJycTRML1NvWGR2TGh5WlRPTTU2MVM1V1RtMmVteldR?=
 =?utf-8?B?NDdHRU00QU43cm1CaEk1Z0s1RHVVRzFYcXdHc2tXc2VEcFB5Tnh1cHJIQnJM?=
 =?utf-8?B?Q0FwVVdwVXVMaWZwb1oxUjhOT3RXRzlFL3JDWE9Qa2wrWXY4YmJRQXVaYXEx?=
 =?utf-8?B?OU5qK2haOEMxb1labmtLMm1sRzFnWm9yNVZuenlTdjhDUDJYSzVCTEx5RGdO?=
 =?utf-8?Q?IqNcVQhgubVEfXihTHIh2UaiAMZrPoDty72Vqs4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZjBvK1lPeStmb3hFMGZoc3hIOFRQa0J6ekRmd3JNMGIyZnlYM240OXFDbjVo?=
 =?utf-8?B?NlZ1WWVncWhLb053UUZNbjNEYmg2c0lRNkdYTEtlb0ZZeVJ6cncrKzBKczEz?=
 =?utf-8?B?eEhIVy84TDFMektpT1loNCs3TVUvWS8yczFkaC9PeEdQendNZm1Md1N3SDAz?=
 =?utf-8?B?c1FTcmZIMHQ2VU4xUS9VWmxBRDVSRkZEV3Bwa0YrcmFOVXMxS2Y2SEUvSHd5?=
 =?utf-8?B?WVBCVS9UQTZQNzRQcGRsTFpVVVJaWGRqOGx6Znp5NFRUOFZiSTQ3NUhzUWhp?=
 =?utf-8?B?eEpwMU8vUG8vL2w3Y1N0Q2crMTFsdEFOVklqUDNKRHhYY3o3TGFxbmozcmRW?=
 =?utf-8?B?SHZ2NWh4MDlLSjVrVXdWZnVxSksrSWZTOHhXdlRuSjhWMjVwTm96Y1EwczFw?=
 =?utf-8?B?Q3JZRk5wRDZobGVyUmJla0NFK0hKUyt5SzRxQlNUQzdJbzNuMktQZnhRTnZr?=
 =?utf-8?B?enF6VURGbXBuaFhoeDFhL0F0WUJ6YkxOZ2dlREhwUHFjNlA1UWEvelV2UWRu?=
 =?utf-8?B?aTR0S1FkdlVTa2VQQWdUdFlpZTNXZVpDV1lMU0NKTkluUVM3QW12V1UrdkF3?=
 =?utf-8?B?UEIrM0UwVnkzWWQ3OEdsWWZqUEJjdEtjSW1lNktmVXhjMGhKa1FHVFEwZTlK?=
 =?utf-8?B?TCt4V0dzR1QxeU5RaGlYdWhJSDg2RzlnNDE2WkZkcDZDNFErVUtkWnBnaHNz?=
 =?utf-8?B?Z1B3aFlGSTNWTndkcVNNSnZ1MDhjeE4rTWJsTE9FMjRiaGs5Z1pjVmRDWSs2?=
 =?utf-8?B?Z09JYTZFdXJJL3BieTlyMUYrZlhsR0QwRVp3cGRGYnZqOXB0MFBVeEdxaUIz?=
 =?utf-8?B?ZnhIcy9TVWpZblB6Mzh6M21rTlhkMHRPZXAyTmd2YXpEcm5QTldKQmx2MkQw?=
 =?utf-8?B?VERNRmdpblhQeUVmWGFHMi85dFNtUkJCUHFWcjdHZEF2ME12RjRlNlphRUhM?=
 =?utf-8?B?QnhkblRkemxkTmlaQnpObG1sd1oxQnJhSXN6RFB2NU5HQ3NWNkRIeGFvY0hH?=
 =?utf-8?B?UTN1blBVNFN0MnJYcXBFME8zMW01NHJXVDlVTW1JUnczT0RPcTFCTFNMM2Ur?=
 =?utf-8?B?cFJsTGh6eVZjRVNuWWJWTCtodjJaS20zR256c29PRVpoTk80a0xHOE81Wm4y?=
 =?utf-8?B?VTNiaitnbzNjWnNXeng5WFp5MXBlempMbVd2VTYvUElkNU9QZDVMaDFYeldi?=
 =?utf-8?B?OUJHdmdJNDBRTU8wZUl1Sm5CSnA5TEFjNVhDRUV3cm1ya3QvS1ZnUUdPWjIr?=
 =?utf-8?B?SFZyeTVOOU10bmFtdGlYZHN4RjljVWJSM0U0WnJiSG95MDlWWW9uSTA1UDVo?=
 =?utf-8?B?eWZ6UEhPZFdLMjE4dEcySm96a3UvT2N2elBXSVpqZkNtSnNNdlhEdmQvaWVX?=
 =?utf-8?B?Z1lGR2l1UjFhUERZSXgrOFZLKzM3Zk5zVm16Z1MzZFRvL01aRU4wTVJpb0xu?=
 =?utf-8?B?bVJoK2JoQVdPdzVDL2N0TmFaK3NUUXpjKzdTaXVyeUxDSkI4WGx6eEZFL1hW?=
 =?utf-8?B?LzdDWlZsVzdoRXpxZHNTWVRHN2pzbzJTVENmQTFWTW1oaFZ2ZjNJU0NkalRE?=
 =?utf-8?B?WmxzNmEwVHhBc3N4YnNCUnpqTGZEakNkWVRSUk9VTUlYTzhWTXNIUUVtSGIz?=
 =?utf-8?B?YTBnOHVQQUwzcno1dGMrbVNPT3doNFY0amNaSXFzWW8vSjQ5OUh3S1dEK3Br?=
 =?utf-8?B?bkN2VG93SW1VbTVSNE4zbGJTeGhVQVU2dFFzbUxSalgwaHBOL0h6TW9IRC9Q?=
 =?utf-8?B?MENBQUNFRFZ6Vzh6MTRiZ280enhWckRnNjQvaXVmSTBYRjR4Q0VPR0ZuUnc4?=
 =?utf-8?B?V3c5YW9tUHByUmsxaEJxN05QRkJvWHF6ekhOYTA2VENFN2NGOWc5NFFkSUhW?=
 =?utf-8?B?ZHVzNzQvckFpUmFaYUErMVE5VmZtL0ZZL0xManoycjc1bDMwZVFYeVJrL0hR?=
 =?utf-8?B?YVRDa3BjSVJ4R3p3VnoyV25jMVVQK215c2VaMDMvanJGTlpLZlpPRnBISVU2?=
 =?utf-8?B?aEZDai9lMlZFQUQ4eXZBZlBGUDc5MFVPMkRpTS83YnBMWEJQNEdsMjR3dVVV?=
 =?utf-8?B?NDIyZkZ4Z1NEZHZzSUNhbVc2UDVXMXFZMm9JcDFDMXM4dmFGZUZJTEEvZTRH?=
 =?utf-8?B?R1d1R1dpcS81dm9LZEtFTkxUZ1Q0SjViNElXanA3TmlCUEd2QkU3VVZ0aEl4?=
 =?utf-8?B?bFE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: b6216549-ca94-4a6f-b071-08dcf450f6de
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 17:26:15.8114
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eY1yjsoAr5NCmPAQRr2wGLZ6moazoF7siriNEZbz0zbNedB0HZrQH3mi/RJPFLl53PsIrDGQAYMaq3OagH2X8Ss92tyQOu0OxOrV5IOCxzU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7651
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_102625_846084_858B17F6 
X-CRM114-Status: UNSURE (   8.88  )
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

Hi Heiko,

On 10/24/24 5:14 PM, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@cherry.de>
> 
> The Tiger SoM routes all relevant HDMI pins to its Q7 connector.
> Some from the M0 and some from the M1 set of pins.
> 
> Add the necessary pinctrl entry to the hdmi controller for the SoM.
> Not all baseboards may use all pins, but even for them it'll serve
> documentation purposes.
> 
> Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

