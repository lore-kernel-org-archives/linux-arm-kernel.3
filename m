Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CB12CCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 22:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Subject:From:Cc:To:Date:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DJGPn+FMTtF4FeUrnWxXjSwNYaxwSY6Ay44yIblDrtU=; b=ObFFsOofCLP3UMdsyQi/dJfsbU
	FHLAFkfqcjJj8I3Kxs/yGqv9nBtMkDIMMocrvsqhHCibWcSl7QPnYDXm/S0YHBUxljU+s9JZB1/U9
	eUh5vGcB7rAe6K1RCNCpXUSlvhzKDDxmIReLOhRVf0VmAyO/HeVNMUJiJvS5lRy3rtHTVTMpHmd8H
	3KLDouIH8GpdN2Sxd7TbnBqh4oHzn3rQ/tLLZAMBjMT3b5523SgTD3YEd4kw8nN4eNB/3oYaJsPD6
	ZhyaKC7mH9jOGIWv8cIepXojd2jk9CEGaDvRQKwkg2qGSJlmlV0BDU8oSnjF+YBh+J+woC8LLlj4y
	N0/GXTTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEErA-000000039Qs-3y8k;
	Wed, 29 Oct 2025 22:41:28 +0000
Received: from mail-northcentralusazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c105::1] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEEr8-000000039Q2-33Or
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 22:41:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JjXMI/PhafPBEIiLcJhssLOyTRmwUEvaftlcse7mFEbRKVQtxAo6TQ/ymah2/06rJ1j7FR72RqlM5CXjMIbtNPJ5ircXfl2/ls2H0E9HsgOdewogC2abt0nDzsLu2Ub15SNB9hkiX6Ibujmafvui7YJRLTCvblkcHA9gAQ0+Pr26A0KwvSA4Oq/fpTwUuBVxvvVXISKr8vT0Bj5RPLytfBr/1Wo7uyxWJtU8uKKoc6YFlIj5N+siTog2vmSuWa7lJXNn0eUGQxxdUcIEhoZwobvXAhXQjCpoUFxaHrO2RidENtDfa4eGyu74SE3UauY9a1fKjV0p58OxqwXbZkipow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DJGPn+FMTtF4FeUrnWxXjSwNYaxwSY6Ay44yIblDrtU=;
 b=Nq+5aS9INRDSkXZ24S3ukcxjVZZoxVpMNHhnPti83yKcT1KYplEVw+imdL4YF6oyM79UkAjSBdUxvHJPoSWnYrSwI8Xd6KEnwA2Qapd2uTnj2IbRArlHhMYzhGASTpCkRukjeeNgFPBULIjvy5l0RzFWxnDIaBAYs+/UM4tWLUq9v6uyIxsQq+54EOiY2QkKynkIlaWkBF3vo8WCBvzov6/JJ6kmZHaxocNbD+sn4aCOV7wJE4o5aIm26eok++zuK0V6sWXx6tguUzaCw8BYHOn8hGuv1I2rzQnye8xpoVrlI7+fqylpa6Fx7HPWZ13Z3Pg23vbbfjncFTZ1be5A6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DJGPn+FMTtF4FeUrnWxXjSwNYaxwSY6Ay44yIblDrtU=;
 b=aDAMqI1v7b7ZDNyyeBA6/SYZhRR6O8HEuQNDUXjM4mJGOc/lKWgutpEWn4/oIBosgRZH8ZCqeJDOqJEet1uq2h5CrA3sAvAyzZ0xA21LkSuj+3hfa53JoGQ38Jj7+YpTYKkw4nTaCvFkCobpgGFyGI30OyGxhPWuyfTApBRNGD8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 CH3PR01MB8340.prod.exchangelabs.com (2603:10b6:610:177::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.12; Wed, 29 Oct 2025 22:41:20 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460%3]) with mapi id 15.20.9275.013; Wed, 29 Oct 2025
 22:41:20 +0000
Message-ID: <04ea9978-e6aa-4498-b899-76d56e19b084@os.amperecomputing.com>
Date: Wed, 29 Oct 2025 15:41:17 -0700
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: LAK <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
From: Yang Shi <yang@os.amperecomputing.com>
Subject: [Question] mprotect() can't clear PROT_MTE
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR06CA0062.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::39) To CH0PR01MB6873.prod.exchangelabs.com
 (2603:10b6:610:112::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB6873:EE_|CH3PR01MB8340:EE_
X-MS-Office365-Filtering-Correlation-Id: b0ac5ef4-8e7f-4f32-5024-08de173c47b5
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YU51TnUraHFXazdZT1BTSjhjeEZKWnJHS25TR1MraGhCUmlRMHVrU2I2TXVZ?=
 =?utf-8?B?SGp2ZUhFRmxJWEFCZHowSUdDcnUyWTRCWVBLWmI4TzUvQUZ5UTl3OTRGaHJH?=
 =?utf-8?B?ZnpJWG81eDBUa0YxN2xJaHE2QzAxQmRLelFZR1JzaGRHOWIwdy9UbXpOSVhz?=
 =?utf-8?B?YUZCZmlzSzlCaHVaSExVQmt2Q3lvenNIU0xuVjVUcDVNWFF4em9uRUxNVkZD?=
 =?utf-8?B?ak5PQklzazNVemFJTWUyMGppVVVwWHdtTlorMWFPdlhVN2doeVNIMDZ4elBa?=
 =?utf-8?B?eXIyZ2JXc3dWbmNSM3ZPb3lncEMxeHdBTFF5QnN0bVB1cG5aaTdJWkYwMnI4?=
 =?utf-8?B?Z3ZraDNkaG5LZThqd1VsaldRaHo3NDYyYUpJNnJyQVpnTVBQUTBhSlloTFpL?=
 =?utf-8?B?eFVwOUxkNTZEbVpOMlVFVGo1cWk5S3FnMWo5QW5UajVIUjlwdXl1NXllMHI0?=
 =?utf-8?B?OVIrRUxxQzQ3cXZxbmVVYStSS0kzaTNKeDY4bENOUHh1Wmt4RndFbmQ3eEVP?=
 =?utf-8?B?a0xYanB1QmpzU2dDSTBvc3hyKzFUMFZReGlpYTVISk5jSU5WYzk2ejA3cjRo?=
 =?utf-8?B?NC8xTmxFTmluaktFdUZZREJ3QzRzMXVJbGhKc2ZEOWRIcGErKzZxM2hEcDFD?=
 =?utf-8?B?NVQrMFNDSDVxSEs3REVmUXFHdE9PV0VmamxtUVRHbUNtaHplenNwY3haY0w1?=
 =?utf-8?B?eUhPZWZxZXExRytnNUh3SElnWDJqTS9KM3BzSUhmQnJYSkpXeFJNdmhvUlh5?=
 =?utf-8?B?Y3Urd1ArbC9OZEt6dCtMWlRoUW9VQjVxNGlUdCthQnBSR2VyQUdVV0NBVTVo?=
 =?utf-8?B?R1FXWVA0Rkozell1aDk1d2VwQm5uRVhSU2lGME55cklIanpoUldmUmZqOXp1?=
 =?utf-8?B?OGtMVVBCVnIxUnZtdlg1WTgvbmVpM3lFbjlnT1ZUSnYwSlE4a2dGaXFUNjZT?=
 =?utf-8?B?RzkyR0xZZTBPWDJDQkxBbFBrK2FKNDlTM1NFNkVyMTdIOThnN0JVUXA0L2g0?=
 =?utf-8?B?WCtpcnU2RmNCZk52Z2VHck41ZE5PREZPOHJSejFKR0dyZmVoRllPb2NXSGEx?=
 =?utf-8?B?L0RNOE1Bc20vVG9WOTBhOWxTd0d4SU95Q1FTeUkzMEpJUnk0RDJ3TlZmNzVv?=
 =?utf-8?B?bDlTTjlPdkh3SGE4dGlycTVBTUR3SlNVM2IxM3JXK2YwMzZtcG81cGtFbGEr?=
 =?utf-8?B?NVhWWGRZN3RLQmZyb0pQd3llWHRkQ0VRK1ZhUHdCLzJObzVDanVYbWxyN28w?=
 =?utf-8?B?K1B0UjRaUUsvYjZhVTc4RGZMV2cyTTU5T3dha2w0SVYvWEFNTVQ5SFNSUDBK?=
 =?utf-8?B?VzEzUGdGMU9SdC9USHhQRk9QOHhaZjRKcDNNSk5kT2l0Qm9IeVR4UmYzdTlV?=
 =?utf-8?B?dmJEZDdrWFVaaUJXUFpuMEFTZ1YzUU1EcXRFeEFiMWFPdmpMNmFLMkgxMWRZ?=
 =?utf-8?B?QWs1UlpwR2l0S0xPWWZnazNHUEVJTTNac1hlMHg5RzZVTHVXeVNtenhTMndF?=
 =?utf-8?B?cHdobTJ2R28wekRORUtrdUU4ODQ2TldRU003cGxNTlBhYnRqZEMzTDVwMmhQ?=
 =?utf-8?B?MFZ5SXRxKytDZDJDTWRSN3paUEpLdlJWN0tFOCtienc5bEFsbmFGbEZDV01W?=
 =?utf-8?B?aXZicUV2MjVTclpJR2pPYmdGL1dYakIwNHN6SW56bXM5cXp6MTdGZUJMR0I5?=
 =?utf-8?B?R1ZLY3FJamFYVUpVWmQxcEFQc1VSV0dUUGpHSGEyOUJkdmdFVjBiY2JZOVVp?=
 =?utf-8?B?VG10RHlnSUYrVVBST2N3cXRHK2dLSjhZSUJ5RERTdTVHbXZUOHlEZUhVMkZn?=
 =?utf-8?B?VlFvODVmY2tFbEw3YjBiSWFleUVia1FOWDVWRVRxN3BKOXdtSlFWc2Rqa21n?=
 =?utf-8?B?dlhNWmMxNGNuUUNwM01tTzdLd1pnWFcwYVArTXJKeGt1QmRwb3U1Y09oNWVw?=
 =?utf-8?Q?QexvflpR6t+LowKba/Hj2f/QnYz0u04u?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QzVDczh4OUlGSUY1a0E0VENYMTFTZzNQS1M3cFlIY0N3WFVQMkZMdEJPVkRk?=
 =?utf-8?B?bFkweGtuN3g3YnBNdTFiVHVLMHp2aEpKaFZVR3c1dlE3Zmwyd3llSW5WRWNj?=
 =?utf-8?B?bVR6dkhSbGdidWtDZkJnTEx1WXAzNHBPeXlGL1RHaHlmMmdNK3ZrMlJkaWtO?=
 =?utf-8?B?OVIyakJBNm1JVHZCYUpGdkxRYkpzWnFXeFZ5ZWllV0FScERNRDBrd0VoZ3VP?=
 =?utf-8?B?bE0xQXFRakEreEJFaHJ0RmM3dC9WLytGWGR0VHRsWk00NkFicHo5d1Y3cmt1?=
 =?utf-8?B?Z3h5STFzZGxndjdBOEpXVTlUcTBueVBjUDlyVTFXcUVRTldtbUJwa2hwWE1Q?=
 =?utf-8?B?MDZEVW8zQit1VVJCcHZ4OWFtWFhCUmZKQ2pQdzR0TWVybHVKaDNyVm9ZUjRV?=
 =?utf-8?B?QTZpMHRCbytKYlRzbWVWMU1FY01lRUJvdFRTcmdaOGFNRGNrRmVZcUJFRVYy?=
 =?utf-8?B?dG03WVBWSXVCWUExVlJFSE10VVlzRVdKNUx4a09PUWRSWWdoQ1VNMk1yRUpJ?=
 =?utf-8?B?TGNRWjhEd2lGTHpReVZaYmxzZUR5Ym9kZUFaZkRpN1VhbFNaWFZBQ2oyOGZS?=
 =?utf-8?B?SWFmaVhpNVJnNmtXLzU2L1BFR3ZHSDNhb0ZtQ1g5VmN4VzBkOVlrTFlPc2pK?=
 =?utf-8?B?UlYxM1hFZmFBbFZKQ1JqdjdxQnlXMFpBWWFPcjJGVEdUbWRFeUdtUzNwREIv?=
 =?utf-8?B?UUZnd0pOeUQrRlRmU1Z4ZDRjNGJaT2htc3VhZlczZE5mUjU5aHJrTkNLYzJt?=
 =?utf-8?B?c08yZ0lyNUM3UTNTdzl1K0FtdmJJbDlqNTAzT3ptc0w3TUpodTNnVEFFUHEv?=
 =?utf-8?B?aTAvYTErMUoyZ0xxTmtPMXhnY3lPcXpuNlhkWnpNOWRBemdWRTl3MXNnREEv?=
 =?utf-8?B?Y1pWWTViWkE5eVpxQTRCVVFMWURVdThicXpHdEpHdkpndFF1UEwrV1JoWnlL?=
 =?utf-8?B?V0ZLc3JXNGdKRkIyLzdTTldGZ05LSExJQnlvSFVJWU92Rk1SZzBLbi9YRlNJ?=
 =?utf-8?B?akloQkhIUCtUb2FoMWFBU2ZEZHlieEsySm52emZqaWNpUUZPMndnNXJLU3Bn?=
 =?utf-8?B?bk5ZaXNtL1FweFRpclZQZkhjRUw1Q0I2czNtenR6SlRLb0FvenkwTXZvZ0Vs?=
 =?utf-8?B?OXZMb1hWTXZXZ0hmSTFFc3NSWStJM2twM1RFQ1ZIUnBpckdXVk5lUHBEMkpT?=
 =?utf-8?B?cTdYZmw5TUFNWFNmMHRXcVlPYnpwdnZXRTVlTDRCblE5WUxRenZhcjk0ZmVU?=
 =?utf-8?B?TXRreUh4TmozNDI1TDM3d0doS1ZianYySmxWUzZKYVRtU2ZQbjdtTEl2OXhE?=
 =?utf-8?B?RDFNOEtPMVQrSGNIbjF5QXE0UUFnRlpkNmZIL3VuTWhjSjd3SDNvcGdmZ2VR?=
 =?utf-8?B?ajlJZWhqTHdGZUo0OEgza0hiSjFEeGdEcXpOeGUxRi9sSXBMWFJScnFZdmgw?=
 =?utf-8?B?c3I1ZmJMT2FDMTdTWnVqOG1UMUt4dWRxYzNDL3UvU0xyYnJ3WVlPVXZSVTB6?=
 =?utf-8?B?MzhHYlg3UDF3blkreTlZY1NWT2xxVEFwS0hCdVFjTS9MQVNYWTZFRXVzbEpK?=
 =?utf-8?B?aTdRcWprdDlxa2JEZ2dBV0FzZUJmdjNNV2JCUDFZVm5jOG5rM0hiSFVPNkV4?=
 =?utf-8?B?V1dFMnRKbHMxak5kNWQ4emRabkdqbHJMOEtGb016VG9qUkdqV0VkV3BXbWZz?=
 =?utf-8?B?b2JGOUl4bUpuY3BYN2VUNVlNcUxhM292ejllRytLNzJ0bWUwTzBoTVM3Ymt4?=
 =?utf-8?B?bUhOd2MzcHhBN1RQaCt2K01uQ0xIanppVzhsUGJmNVBNY1pJREJZMVk4R3Jt?=
 =?utf-8?B?cjhVQVdLZ2RyQ3ZMdWRiUFFWUXNhendvOHRzU3ZIKzdrODVXRU1tYlRqVk1I?=
 =?utf-8?B?ZGo4S3FpMXpITnVEVjB1ODBFb1Z2czExbitIRUl1TFZmbkw3QnpRY1B0MEVx?=
 =?utf-8?B?OUNSUmlsOG4rdnhKQllFd3JQWnVOTmkvcm52UnB5NkRmVit5U0VZdjhEeU1I?=
 =?utf-8?B?ZW93VVhNVmhOazNvUit5VjltVVF2V2dsRklwMVF2cXlaRTM4a2dTR21ZVEcy?=
 =?utf-8?B?Ti9Wa0xPQnYvSVJyNGNkMEladFlrbml2L3VneGhMOWF2bHlnSFhwM3dNRmhB?=
 =?utf-8?B?T1IzZjZDNXVMeXJDcndLVTJZOWxrZjk0YVlEUkFIUTR4QWkxdG1SYVZFb0tI?=
 =?utf-8?Q?wka9Anb5bcUuVqNQiMtdyvs=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0ac5ef4-8e7f-4f32-5024-08de173c47b5
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 22:41:20.3977
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jT86P1xEH6etSIGi8DDODsGY3QiMsY5F/vH4XW6eWpRMirUpPVkwPFIr1NnEzqYtXbADyd93QUkm8RQ4yr0GsHJlfMPkYQWJa8iZRm4SxLM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR01MB8340
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_154126_785068_9328C678 
X-CRM114-Status: UNSURE (   6.02  )
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

Hi Catalin,

Our customers have usecase to untag memory w/o unmapping it, but 
mprotect can't do it. It seems like an intended behavior because I saw 
MTE doc explicitly says PROT_MTE flags can't be cleared by mprotect().
But I don't see why mprotect() can't do it if I don't miss anything. So 
I'd like to know why it behaves in this way.

unmap + mmap or mmap(MAP_FIXED) can do the trick, but it is not feasible 
for anonymous mapping because unamp will wipe all the data.

Thanks,
Yang


