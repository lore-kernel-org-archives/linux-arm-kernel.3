Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A245BCC6B34
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 11:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x7guicA1ee6KMFvHr7KiFtQmcaxpSVeQQQ/sfrssbLI=; b=ht9otgFSkHic22uwRMidDAsAcl
	t7dlG2lFktuuCIHUp7mcgEkFjF+3PwW+itvefSdAXqhR6IIlef653jcfHtnE65ojrSZF9891m7L5p
	9lrJJuxiwbdrDP/3hWl/JKduzvK8N8FzAOJDcyPXYse9lW+ROvb3Ud4/5PcI05LSq4hRd+gHX82H+
	xiy27iLYXacalOgcenNJbgz06j1Z+zLNZhtoVuMSvt8vrS1LFvIDVkHgQuK+82QmkQgvmWZ2wORw6
	mMguA2GnwLMgLixZywpgAe9wz97JTCyWqf98y+RkONar/AW59iW6uXx1cZBn5+IIg90Rekc+7Ztlz
	xMHhnTgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHJoy-0000000Hb7H-0Dgu;
	Thu, 15 Oct 2026 11:40:28 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHJov-0000000Hb5w-16W4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 11:40:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EAFIb8hZFJiCBprwgdEGoiz1m792azAGVOJNHnMnsYwyLWfa0il+JW3KgODk41+FcE40zYvg9XdYYlZVyYQyNiM8xOQ76WLU8Xq5uPz3UMUOsJwRyBKIWB54gIcbMalHwASkHpjILAjVav54bayOi39wmE1Rxz/1tuY52KWAse2ZKLVVxXS0RP43leONYV3SUvxNsTw8NHVNEFzN4FbB2A+peW6hQFtGsV7vi3zKKAS/byLh4JF0W1OVDZZHEYWLTi/rGLD5hXYeGDH8n8b7w/LLuPX9svfOR7+JWMtSfjB7cR2Naww9Ibq8ZGvqcIPhnmHxB7WE+AJzDaQnDSmvnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x7guicA1ee6KMFvHr7KiFtQmcaxpSVeQQQ/sfrssbLI=;
 b=EQ2/Cvvmxq4IRh60iVn8c3Ef2EzKSqh8stShpGZPu9wJjRWCnb9f0TH8tFZ972NTKFV6CnbAs8pbKaNRE5flnKFzOudJKcQ9gVOQienN0/3tMAytiQ2NmrjNOwkhGAKZNZB/bjnhaaUUM/0Bcym9AuTOxcAlLUzwV5gash/iqJ7EjdEmbcJj+oXSUdZbcP840KiiJdhxpgIXsT87CPtDUhmQPp9x/OjB5gmaiPCSGOnVosEZcwIzgbpJKuY0ggGeOXXKff1ZqGsN8Q1XBOAMY/Fbcxe/N+DFZVrF756o2+lNo7D2VUFlGhHLYthCPC5XB33oZ7OEd7g75f8fI9RZyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x7guicA1ee6KMFvHr7KiFtQmcaxpSVeQQQ/sfrssbLI=;
 b=M4snPh/Qme60/Y0lMYKBTx0VeRmAodPb0rvn4JKhHFE15BmLiCqHvhiXzpqP/74wCAS6GGmr3+Ci8VXsPNHisgQ91ZeVYvhJj8/9uwST0uCrQWplkKENFFTFbMoSA4QExuTKJKqK0aMma/stia3lZc2nCnR6CLG2jVual/mWHeXjzo9usJBTjuEMVDOSI02GXCc1yUl28t34rwcZ27LlII8Qgtifx1igia9/mxifHlsSoHuxFN83tGpL2vMolEH0lQEmGIqVDCpd8ZWM/zSX2Yrza0MShr66m6FtjvEs9K+PF55w4tIgb0tOhmkjxhEUSrewNrr6gWwK3LgCFVSZkw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AMBPR04MB021426.eurprd04.prod.outlook.com
 (2603:10a6:20b:78c::16) by VI0PR04MB11867.eurprd04.prod.outlook.com
 (2603:10a6:800:31e::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Thu, 15 Oct
 2026 11:40:14 +0000
Received: from AMBPR04MB021426.eurprd04.prod.outlook.com
 ([fe80::1cb3:7fae:cd68:6de]) by AMBPR04MB021426.eurprd04.prod.outlook.com
 ([fe80::1cb3:7fae:cd68:6de%4]) with mapi id 15.21.0522.013; Thu, 15 Oct 2026
 11:40:14 +0000
Message-ID: <a626dba9-6aa2-4cf9-883d-8c6f94770d6c@oss.nxp.com>
Date: Thu, 15 Oct 2026 14:40:12 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] clocksource/drivers/nxp-stm: Register sched_clock once
To: Juhee Kang <juhee.kang@redhat.com>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 NXP S32 Linux Team <s32@nxp.com>, Dustin Black <dblack@redhat.com>,
 stable@vger.kernel.org
References: <20261015113738.435986-1-juhee.kang@redhat.com>
Content-Language: en-GB
From: Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
In-Reply-To: <20261015113738.435986-1-juhee.kang@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P192CA0034.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:658::13) To AMBPR04MB021426.eurprd04.prod.outlook.com
 (2603:10a6:20b:78c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBPR04MB021426:EE_|VI0PR04MB11867:EE_
X-MS-Office365-Filtering-Correlation-Id: 909a761e-1647-4ab4-42d5-08df2ab113eb
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|19092799006|56012099006|11063799006|261009223027099003|260925021311599003|260925022911599003|260925021911599003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: Supa+lngm36bXANZA6JqShM/Zb0vY5jcGNiO5mLkXWTMQ0F/ecU7gW9Sg0i6myBzBaUdqXMrgB78UpZ6yKjhLmGx2a0hFE5uITcoAPxFqazpeXEeqymnyQrD7wMSkR/irs/0mZ0scT5R8s2WGLglhQ85WmlYaKRekXMMlmunevjE3Ymf6GP3slf+wCH0LbWIUxp13DFc/f2UbTekzHxk3Envumport0zkjCYPzFku+6YJx3tVC5/lWn086Kr+PHfuDine7CUPjoOYVVasdwfc0IhA7CDm/Efk/yaZI3SSZ5Q5HwZfG7TqbBrbrYL/kbYt3DqIOdMdqiJiDTNszyLv7VOifK7fJyuvAPbcSbSbNvy/teBPNB7g0K1vIBUvHaD/7FOrkhEDwbJSF3sAFnm49sk5zx5tYIwEfXBTNrkWVPYpbxZmpxmSNYISR99xxJDytU2gr99R0NWuVDwmF1t+/nBIfyT1mPcGMSdYS3M9/NqlDrIBFwtvdUFCb0rZXW+yfshf0eVRimUP+spgMG9UUGrk0h8ZrNxwT3tn9w9967+gblSAGGkH81OZ63vTziE2PL4TNx+lRxwtWKRIdPirqsNLiSVP6uWDdY9YBorM+DBEGOL1ZYExo9UfAapeIprgdPWGTf1LZJBfq6N1MlVn6+SVMksdYA2xQXBaMl6HXE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBPR04MB021426.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(19092799006)(56012099006)(11063799006)(261009223027099003)(260925021311599003)(260925022911599003)(260925021911599003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bGxud1hQZTUyTzV4NlpsaXZ3TnhKUGNIZW1kMU4vV3ZyU253OEZkY0J0N1BH?=
 =?utf-8?B?czZIT2lUMTdrYUMrZXEzNUc2ZFlMTE9GV1hiTEVCWEVZUGoxaHcvbnp1eDE5?=
 =?utf-8?B?cXB0bWdFbnJTYUNRM3dYaFZOd1VxOEtNaHdlU2JsaW9zTkpPaWF6MnFrVk5Q?=
 =?utf-8?B?MlZTRGNJTkx6RzVXY2FyZHhJc25aNVN4MytSK3JpbXlkTjBHb2FpNlJuVDQ0?=
 =?utf-8?B?TklmRzN0cW56R2E5cUk5cktJZ2U0dzhDRmxZMFh2bkhNUFFjVVdMQjN5UDdZ?=
 =?utf-8?B?ZERSb0VZVGdYbUdST09WTnY4eEswNVpUMzV5R0dHTVVrcEJyR1d1dXRRWXpa?=
 =?utf-8?B?RTFRMFBVRVN6TkhjSTBjSUNyREdXdFRaTHFteE9DeGI1ZHl2OGdPdndEMm5O?=
 =?utf-8?B?UVMxTTc2Tm0xNXpzcmVNV0I0Rmx6NjNCZ1o4cStlQ3l4V3cxaVdUZTRNV1pi?=
 =?utf-8?B?VmViUXlNeXVyNUgzTkpwTHJLNSs1SWVXaXV2ZE9rUmJLdGdhcEc5WlNBaThh?=
 =?utf-8?B?TlZrNWl4MSt4ZHRJSmRObzB2WnFXdWlpajFtODZIR2VLcmZJVWJWL3NrUHNN?=
 =?utf-8?B?R0dKUjRXSHZtQyt1MmhYWUgvMlZuWGE4OWxYbjc3VGtGQTIyUjJtNE5aRUVE?=
 =?utf-8?B?cTZ4SmFCSTQwTHhsais0Q0I3c3dod0tCcldxejJjcVl4bE5vR3IzSmJhWVhh?=
 =?utf-8?B?QjVadkpaSGNBN0FDU0hlU2UwMjNwamRKNGMxS0tVYlpCQ3dVTjI5aWs3bWtn?=
 =?utf-8?B?bFlQYi9kZnR1T3hLUlY0eUNlYzc2VTlDYlc3RnViL255MHJzODByd2tiTWhv?=
 =?utf-8?B?MGNXdVFZMUNnZUR6RWRMRXFnNzRMSHNXVHdiWFp4emFQTFZCdEpXNHdvRy9o?=
 =?utf-8?B?aC8zaW9GZ0hYZWtSTG9acXIxd0trTWpwbDJORFdHQjUvNGp0ODA5ajRFUkNE?=
 =?utf-8?B?NXhkVVpiNjZJaUVaUms3ZzZSMTN5YjJvTnQwTGlTcGZYdVZmZEpPbDRtYWhZ?=
 =?utf-8?B?TmhSa21iV0cwbGF6cG4vUENnRzhkdnBUOW41SmdUN0FNLzhBRzRDc2N0a3d6?=
 =?utf-8?B?dXdiRkxxcXBtbHg0QTltelRldkpscytTLy9NM0dTM3k4SFhZVjZESFJUZi9r?=
 =?utf-8?B?QllRSkNRWkh0QWFUTkhTb0hqV3doSHg0a2pWblJXOU1jNFRrT0hQcFNBcnh3?=
 =?utf-8?B?WFIxSGNNS2dyRE0vQW9PeGx5Y1RFU25OQ0IwdUVqTVUyMDl5cHlDM1lvRjJi?=
 =?utf-8?B?V1F0S052dHE5bm1GejErY05sVm5HYlEvZEFsZVdJcWlNbXZ2aHlNUEVtcStV?=
 =?utf-8?B?NFY0aC9vUS9iQVdEcjRhUU5qU21HeUVDWFZha20xRHEvMjZpOG5TdVlyWmJ6?=
 =?utf-8?B?bkszWnA0QVN1aGMwYk1mSVlCemFxcmZFQk81R296MGl5N2phQ2M0eExVTlZ0?=
 =?utf-8?B?MHd3ZUIyd0NGRW1JanlZdWFISHh2OTZTWkl4c0xyckpPRk80elkrVHI0ZlNq?=
 =?utf-8?B?K1dxYWxTYThnVy8rRVFyYytISkVmUjNoT1BqQUN5aDBvR3IwOXg4RjczT3F2?=
 =?utf-8?B?QVI1U0s1Z2YxcDV0eGtEbDNBVDBGVlRDVnFaSWVncm43YmhyVnhSVm1ydUVD?=
 =?utf-8?B?aUxwc3FRK3pxaG51MHVsV3c1MWRWTWRoSTFNR0dCZ3N0aXg5NHFHTjhLNk9t?=
 =?utf-8?B?ejN3d1hlRVJMektiWEc4UHcrSm05bnZGR2xkR3U0djNlOGVFRTVTT011QlR1?=
 =?utf-8?B?RTkra09iUU9udkwrdi8vVkltUnducEZVSVg3WE5JODJJKzlJaytzRzFibWlH?=
 =?utf-8?B?c0JQV2FzTnNqSnJIbVpZT3RZa0J5UzBlZmd1R0hQSjRMYXkyVmtQTGlDY0Nr?=
 =?utf-8?B?RHFLNEcxNlpNcW1oTWlycFYrSThQYXRCcnQ1eXVza2RWN1dkdWRzTTJtTVpL?=
 =?utf-8?B?Z1l1b2x2TTBpeWtWUE1UaExPMVdrZU5uMEZkNHplM2lvbE0wMU01T3R5Z2h4?=
 =?utf-8?B?aXUwL2hoOStTcmhzck4vdG5EVVhMN2k1Qmp6OVpBWmhwOTh5enZOelhLYzgw?=
 =?utf-8?B?aXJQOEQ3ZWVyRDIrK1pOWk56b2FvQkhidDk4Q01tajllYmc4cjdiWjgwVzBH?=
 =?utf-8?B?QzlLQTBPclpBZWlaVnZ1QytqMWl3dkZUYWF6Y3I5RVAxbmh4bFk3K05nRFJT?=
 =?utf-8?B?anZvMkdITkZpbG1XOGVQYnRvQ3VqZUpwenpxRzZGejJjdmhQaUZFeW1kd09F?=
 =?utf-8?B?WkdlRm5OSHM2cVkzMWtVRDA1QnVLSjdKcmVzS283STljWFVsMVN3QkU0Y1lD?=
 =?utf-8?B?RVp5bXA2d1B6Zk9MRHdpNzllZHlZM1J1ZGRYNExRUDd0MmdiOXd2cWJwcUNL?=
 =?utf-8?Q?kjMqPOq6XvxcnrdU=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 909a761e-1647-4ab4-42d5-08df2ab113eb
X-MS-Exchange-CrossTenant-AuthSource: AMBPR04MB021426.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 11:40:14.2708
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ueNOwxY3+dG+z7yKEFKvwd5cpGDNlhvDoiI1ncG01HLvdfsus940KnheLNiRSBqsgfk4kO1UPkqObqfcGiVAIxtUaKblZy/f73O3ibSi+8Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11867
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_044025_438033_D0430028 
X-CRM114-Status: GOOD (  20.93  )
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

On 10/15/2026 2:37 PM, Juhee Kang wrote:
> [You don't often get email from juhee.kang@redhat.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> Each probe updates stm_sched_clock before calling sched_clock_register()
> again. The call then subtracts the counter value saved during the
> previous registration from the new STM's counter. If the new counter is
> smaller, the subtraction wraps and the timestamp jumps forward.
> (e.g. from 0.4 to 32.9 seconds below)
> 
>   [    0.403653] sched_clock: 32 bits at 132MHz, resolution 7ns, wraps every 16243448316ns
>   [    0.404056] clocksource: timer@40120000: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 14456668980 ns
>   [   32.890509] sched_clock: 32 bits at 132MHz, resolution 7ns, wraps every 16243448316ns
>   [   32.890882] clocksource: timer@40124000: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 14456668980 ns
> 
> To fix this, register sched_clock once at the end of the first
> successful probe. Clocksource and per-CPU clockevent registration
> remain unchanged.
> 
> Fixes: cec32ac75827 ("clocksource/drivers/nxp-timer: Add the System Timer Module for the s32gx platforms")
> Reported-by: Dustin Black <dblack@redhat.com>
> Signed-off-by: Juhee Kang <juhee.kang@redhat.com>
> Reviewed-by: Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
> ---
> Changes in v2:
>   - add the comment
> ---
>  drivers/clocksource/timer-nxp-stm.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/clocksource/timer-nxp-stm.c b/drivers/clocksource/timer-nxp-stm.c
> index 6fe098a4a33f..23b2d44e4b78 100644
> --- a/drivers/clocksource/timer-nxp-stm.c
> +++ b/drivers/clocksource/timer-nxp-stm.c
> @@ -211,10 +211,6 @@ static int nxp_stm_clocksource_init(struct device *dev, struct stm_timer *stm_ti
>         if (ret)
>                 return ret;
> 
> -       stm_sched_clock = stm_timer;
> -
> -       sched_clock_register(nxp_stm_read_sched_clock, 32, stm_timer->rate);
> -
>         dev_dbg(dev, "Registered clocksource %s\n", name);
> 
>         return 0;
> @@ -473,6 +469,15 @@ static int nxp_stm_timer_probe(struct platform_device *pdev)
>                         return ret;
>         }
> 
> +       /*
> +        * STM counters run independently at the same rate. Use the first
> +        * probed instance for sched_clock to avoid timestamp jumps.
> +        */
> +       if (!stm_sched_clock) {
> +               stm_sched_clock = stm_timer;
> +               sched_clock_register(nxp_stm_read_sched_clock, 32, stm_timer->rate);
> +       }
> +
>         return 0;
>  }
> 
> --
> 2.55.0

Thank you for addressing this issue!

Tested-by: Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>

-- 
Regards,
Ghennadi

