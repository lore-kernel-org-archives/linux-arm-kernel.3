Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92309D778AF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 18:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:From:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r8A3KkWY4pPVp6ay6ZprVWjmuBpz+B52pIsrHxXN6us=; b=RG8DXAAFSwjNy6P5NdGMH9cWnB
	FGsUG0KTfbhEobPdlX3IIwo6EugenuSvwQWeDJ9V/880RRBNkHoim/s+Hw9YTuUJM2uW/CbL9M774
	0B5dqtI7lPwvrdbIvNIJC+x6eIxdTSWvQ2XUTVUHk15Hsw89QG+liaRBfk4bNp2z0ACDlD5uEv5Op
	gcWcaFDAIKg8u0Dihx4LGp2t0IDnq6JxRnWiHHxRNIENMctMZsJux4lva4+CAFD7arNHSVJXkahdT
	ppRK9geX+7RMyEb/cAj1cH1RwzfaYpgDiD4dlRUEyG9leoXy6qqCp4czvJkXekX0eZisyMmvRFuP1
	Bl/JPtFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjM79-00000009MXE-2Emm;
	Fri, 23 Jan 2026 18:42:35 +0000
Received: from mail-westus3azlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c107::1] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjM77-00000009MWt-0yRo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 18:42:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BGqWWDx9d3XixNw1YBCS1Dtxw9vZcQdDnyRp9CS9idJvel9ekUAqdEepju8+7onIM6ergfeMSa+Zf0rCsGwz79NQB9LZ8aKun+NNyaXZRAceNBFAUDdtBG2Bmns3SIpl7RMYKtmiY+BVa7qb7HbRXhaGtpwIRaEPduuy9FK1ee51xSRqcdl4H6GSxPnGqk7E8RNgyK22RIR13Xo1muzp9N/AY8WCUtC/DlHHtt+bKfkVup4pz0QY5p3HrclQ3ZjH5SuKd665pAva6aNTTQSVoHpPlYb2F6u8KV9n4jC7ICRJe4UjHzFhILTbeGICiWs1nEo87tWLGzeWyxQORLQnVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r8A3KkWY4pPVp6ay6ZprVWjmuBpz+B52pIsrHxXN6us=;
 b=ewjF4n0ZJR5P9PX8u4u/es7ot59y2Z48N27240F2kXPW9AoD5LObDnJKbsxH0JBybNxIyI4WDp/GB/vBG7uq9o6Y1mYtgf8tfwB1ssXTcr0MpRp+tEAaMNgj3qMwz7wFcmfAo5Vh5sbnITJIHIpMUlk3Eh30Ea98VYniyPfI03BQdDPil/rmxWOS+8XrHVjwqAdew3h/GMNS4gm1n2TnJupdxqjT0Wy8HAdheeE8joOSolfSbjkpKTc9BaY33sqpwItAL31e7vd+Qog5s/GouV2ZvMWFwdU97fw+p1L699DHi2jEZQkoLch9kmS3LVfD4TYbkfGKLgs3odOB+nboyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r8A3KkWY4pPVp6ay6ZprVWjmuBpz+B52pIsrHxXN6us=;
 b=FkWY5lkxTuhlEjLzUjJfnda9FYaH0oBgQOkSNA6dL70wwpw1AEciSzsRx0M3vx+Pa3qeOt1yAhKtZra3JbsB6WHdu3CkNij0Ju/9v4lOpj8N3S0LlzqCMdXGl1YIZ/2e8SE27LJ04PdbC85YGHC9JF+MDe/6QTUUA7NuzPeJd68=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 DS7PR01MB7807.prod.exchangelabs.com (2603:10b6:8:7e::10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.11; Fri, 23 Jan 2026 18:42:16 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::46eb:64a3:667c:c1a0]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::46eb:64a3:667c:c1a0%4]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 18:42:16 +0000
Message-ID: <a863af43-be31-4155-95e5-825effcd2aaf@os.amperecomputing.com>
Date: Fri, 23 Jan 2026 10:42:13 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [v5 PATCH] arm64: mm: show direct mapping use in /proc/meminfo
From: Yang Shi <yang@os.amperecomputing.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>, catalin.marinas@arm.com,
 will@kernel.org, ryan.roberts@arm.com, cl@gentwo.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260107002944.2940963-1-yang@os.amperecomputing.com>
 <965a0b46-f32e-40e6-ab71-211f84d6c3cf@arm.com>
 <fb5dff48-3181-4f5b-9be2-623785fc2da9@os.amperecomputing.com>
Content-Language: en-US
In-Reply-To: <fb5dff48-3181-4f5b-9be2-623785fc2da9@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0055.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::30) To CH0PR01MB6873.prod.exchangelabs.com
 (2603:10b6:610:112::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB6873:EE_|DS7PR01MB7807:EE_
X-MS-Office365-Filtering-Correlation-Id: 282dff74-c21e-4efc-a10d-08de5aaf2193
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eSt6bEtXSlZUa09jNC96dklydTVQTG9ZQzEzRUhRTVNPVGpzQW5JTHNJTXM2?=
 =?utf-8?B?ZmdrMW5MV2QwV2hKNTdxYnpQcEI3Y3VuZVRscTFMVWY3MWl2WVlLblhGb2t1?=
 =?utf-8?B?OXlVVStITGNrODBZbkxKcXlTSkdjbVNKTDZYSzhsNVhJTjJhTlZ0cEczeFl1?=
 =?utf-8?B?QmVmUGVyMGs4RGR4WFhUV0NEdU9pQVRVNU12RHNJRE8zWnRTdWVQeVhkbTI3?=
 =?utf-8?B?cXZXZlFIMk5vM3oxWjlrdjNkbk5pNEZGcDB0bk5TRDQrVjZRcmhpT1k4a2Vl?=
 =?utf-8?B?ZjZOZDh0ckE0anlNMmhMVmNRb1I2MWpMR3FMaDZrOEY2a3ErSlB5bFBUbmwv?=
 =?utf-8?B?UFNUVklObDBtS0taaG5BZmV5ZjA2OXdPZGF0Y1hQQUpnUVlkTjE5VHJMdm54?=
 =?utf-8?B?S255b0JjNXVwVVlESHBtVWtRQUZsYWpndWs4bnJqcG0raEEwWXBWNTlNaXVR?=
 =?utf-8?B?TVZMMlRnc04wZlN6Sy8raU0xNmVpSmVHTkIwRWJUbVlocldoU3pleDRFREhS?=
 =?utf-8?B?cmxwdVR0U1BxTnB2UVVMdXlqb3c4Nzg3eEhOMzZwY21TUFRFblBiNTFWL1Vh?=
 =?utf-8?B?NkVucHkveklXaWpTbjhrUHk5eTQyNDY0M245QjJuY295ckt6UU1pc3BJdHFR?=
 =?utf-8?B?ZXBvM0V5Wk4yN3Y3VnZjelVJUU1ZY1BGdXlqVm9XRG1nT2tjclpVRkZJZGpO?=
 =?utf-8?B?eVJQTTYxejhld2VhZmRLTjB4K1pUeC9LMEs3UkU1eWFKeGxiRi9hN0lWYzhN?=
 =?utf-8?B?TmlpcWpSK3cyZytVRkNUVzM0NlhPV1dtajFBS3hNd3ZmMGNyZDY5TTZ5ZXJY?=
 =?utf-8?B?YSsyZWV6Y3JVd0plM3VzTnNlQnZpODNFU2c0ejdCNVRSZDVtekxJZUJJVEhR?=
 =?utf-8?B?STRsMEltcnBaVTN2OW05d3pFaFlGSkt2OUpkWWxYTU1lQVdxL2ZXZzFDckUx?=
 =?utf-8?B?bkk4OGg4MkJWMnd2Qkd6NE1HZ0tuaXZybEQya0YyNVdaS3ptQTk5RlZhL0lH?=
 =?utf-8?B?OW1pcnlpQlpTakErUk91R2JYYVVjRno5NHpsWENkUHhQTy9zU2MvclhUWlB5?=
 =?utf-8?B?NjF6aHR0SUorRGdOZjUrVWdPeEl3Z1REYnQyVzdXclFIbERpQWRJV255eG5X?=
 =?utf-8?B?Ynl6bU82SW5MU1g4eXE3dmVENHhoOEpQWG1sdzVoNHZKQkU3b0kvS1hPSE80?=
 =?utf-8?B?UWJUbHhBQlE3VDdiQlVGYjArRGRIbUZoV1FCNUJ4RHQwR01ubnF6blRxVldV?=
 =?utf-8?B?Ykx0ZTBTTmE4ZDBYbnZ1WUlUU2x6K2tBckxweFZ3N2JMQUg1a29VL1NjSVR3?=
 =?utf-8?B?d0hUbk1LS20zTDZFaCtURXVPZ3lFWmdTbzF3aXRTWXFjZmtTbXVIR2p2ZmZY?=
 =?utf-8?B?Tm1mTlp2Sk9zZnRNemlQaDhYZHkwVU14Z1gybkszVjFiUnQ1N2FwMGY3MUJK?=
 =?utf-8?B?c1BWMGxVSmpZVEdzcDYwbVd5cUIyd1R1YXJhZ0hJTjUvU2NEZFpSQmZXTWF6?=
 =?utf-8?B?ZEdXdHM0U01ocUIzQ0xCY1NZbE1mN0FrdWtodjB0bXJreWplZVFBN1ljcE1p?=
 =?utf-8?B?MVJRQWpGa3ZldTVyR3NrNXJISVBQekNoY1RUVWtPOHkrYyt1YXV4TlhuajBB?=
 =?utf-8?B?cHprVWl4Ky9nc3psTWxNU1hyT0JDUUlQUDhKM0lxMFpMRHdMMWxxR09BSFRO?=
 =?utf-8?B?U2dNNXpmM280d2JGYkpZMVNqaUFSbkt3dkVQOG9wVGFuaWlvbjNpRGE4dDFS?=
 =?utf-8?B?UDlyZnhyenZobHVWVnhiNloxZUg1RkVwT0FZNTQ3UndlSlFST255NEtRS2dI?=
 =?utf-8?B?LzdvVXlSanIxK01YNHFLSHAxZ2lnTm8xamJoTVU3S1pXRzUwR1k2V3JjYmdn?=
 =?utf-8?B?dUdKb1k0SFBaM3JYUTBaZVlLc1lkN25MSEdRTkNNMTRmOEU0b0ZHODZoK1dS?=
 =?utf-8?B?VGswOHA0UXdXZWRIbjk0T2dSdkRJR0txN2w2VzZPMnpkRGMxSGNnWDV0bFhB?=
 =?utf-8?B?U0Ftb2pqdllxTkJwNWZvMU45NUgzTzhLaFNST0dmQ2NTOU9jRzE0V2pqeHcv?=
 =?utf-8?B?UThVNzRLdXdjWkNGYjlRKzFwaTg2N1JmSitlRWdKUWZaU3VwTDNDY1lpY1pr?=
 =?utf-8?Q?dlmE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y1dVYkxKTEd1ekM4dUFVQVJuNU9MVldzK0FEaVpkV3h1dWRuVGNUc3JHRzJN?=
 =?utf-8?B?YXlBNk13MUlNZjFTRmx2eTZjSkw1b3Jzbjc4N0Z5L05ucTE2RXBlSXhuK2VR?=
 =?utf-8?B?cFd3ZzVicUlNdVFLczhuWEtmaXExd0YxbW9PTG9FeGRsQTA2RUFuRDFQK2dj?=
 =?utf-8?B?TzZjckcwaFJPSFdjQlIxTUhZdXpQUVRaalhMU0w0a1hBKzBkZzg2cHNCN1VZ?=
 =?utf-8?B?S2swS0lmOTJnT0pYR2IxK0M0b2s1SHBGaGUya21reWxqNzlqWWR1c2VqSzRs?=
 =?utf-8?B?WHNsZ0lVd29sc295UWZiK3BacVhqVk9qSUN3dnhQdDBCUHRpdVVUM3JPVHF1?=
 =?utf-8?B?RVNvNjdta1g5QU1hMDFpQXhqaFR4Q1Y2Y05XdlczRHRLNVNubGV4TDl2TUgx?=
 =?utf-8?B?cVY1VjNPVUFNSzRuNVhWbUdyUnN4ajdZblRwM2M0Q1NXSXl0UStxOEU3cThQ?=
 =?utf-8?B?OUJqQ1FkSUFkeFY3dmpGQ2wxUERmWXdCWWttb2czVlBnTjdNcXV6VlVwK0RU?=
 =?utf-8?B?K1pXSEFKMEZGUzdyeUkyc0V0RlpTYXVjN3haczRsZ3VOVGVETWdtRHdXbXQ4?=
 =?utf-8?B?aTJoZXN1ZU5IbkNSVGpLU2wrMHFUUnhhUGRJd1I5eVAreHJGa0Y3RjllL255?=
 =?utf-8?B?dlRDanJOVlFHeVVISlMzMG5JeFB2Qy94ZFAySXA3UkF5SXFmMUk1d0dOZVgw?=
 =?utf-8?B?L3NXcUlhYmFpb25kQ2dOaG1kdDc5SDNnWElKd1Y2U3R2T0ZDQmQ0OHBKNGZS?=
 =?utf-8?B?UCtEZUlQVVkzWElNZW1rNXBDb3c3QjJOUWNnYVY3TlZ3aXNjZkswQUE2S1lo?=
 =?utf-8?B?bU1lMzU1QkRvcnZ2RnlVd0JHOUw1QW1hZ3NzdzFSbkZ1ZzJZNnV2dmFUNXAr?=
 =?utf-8?B?UjlYelJJVXZjNUpVejgzdVNSQ2d5Mi93UFpDdis2QWdOSm1PQWk0cXR6aVU4?=
 =?utf-8?B?MTd2VTUzTlBtbnBGV3hKanoybXdIS1NWRU1uRjlhZzJIWHg0V1Y4YU1SeUhN?=
 =?utf-8?B?NzA3WVh5R1I3Zks2SyszYzk3dW9IbmNEcDR0TkpnTy9JWUpwc0hIaE5sbzZV?=
 =?utf-8?B?M1o3dkkvNk9EZFlqdlIyR09YUzRjWWQ0eU1adHNlU3RIQ01PWVBVZ0UzU2lk?=
 =?utf-8?B?bG9qV2c4UzVGcjhKZTh6MUo2eDNZdkVPUG03M0pTNUR0M0o4NHgwOUlyaGdN?=
 =?utf-8?B?QVBWY0dwMFZtanN4MjB5Nld6d09IRTc0Q1Y3RjduVEc0b1N3Q2Jsa29Ya01P?=
 =?utf-8?B?M3JxUm1EN1ptZTlCNEhLS2s1ay9ieGkvVGNDZlFjZjlPeUxaUklLMDczT0tp?=
 =?utf-8?B?d0hxS2NNeTRBU0ZKakNTMFBJQTBCUFNJZkVRUWk3MG1ZZWc5YUFWTlFLMlBS?=
 =?utf-8?B?cTFBNWw1NmxJc1FoMVVWYjQ1VVhGM3hUSWdKUktLREJMNlRtdjdCaGlqeStw?=
 =?utf-8?B?dWFyVnNkdnJTN2V1VWZUK0ZXa096VXJGeEN4ek10T09GRHZLMkNsbTRSd0lW?=
 =?utf-8?B?ckVUZUpWa0ZvYS9mM0lKTFVLb1FFbEdyZk55TVNGaTFsOFppcy9tMjdHRW5j?=
 =?utf-8?B?MG92WkZ1UlQrdFIrM1lQTHEwcGpVYWtqbWkvUXRKWkd3Q0pySmI3bGRZQncr?=
 =?utf-8?B?clU5cGZBNXRMM1BNSjBPaEt1SmtJNzhMaXJ6QklNb2lkTEVWN3BXQm4yMnhG?=
 =?utf-8?B?NUUrL3h0b1Q0KzZnNHBTV3BlMlJ1NEZVamQ2d0lMMjFxbTRpcGJDeEg2Vk56?=
 =?utf-8?B?MEtNc3NwaTI1QWU0OURZNXJaQ201aS9VeWRHV3FQTU9oZ1p4NFFuYkZ2dzRR?=
 =?utf-8?B?RHFlc1RacGk1WWhNZ3QyTEl1VnFvOG9BUUZKampEalFzZTgvd2gzU1NPRVZ3?=
 =?utf-8?B?Qm5GRFBMN01uV3FYQ2lCTHV6MWlJWTgyZld4VE1lalUvWWJBcGRzZ2JXSXNp?=
 =?utf-8?B?MXhoSldrYSttZERoN0tTaWZMaURrT2dpVkw0UVJJeFQrZFh1L1U1NlJyUXhk?=
 =?utf-8?B?RXhHK2Q2ZWFDSFVNWHRVQm1ad094Q0hHbEk1RGM1bXpzeXpKaHczUHFYYWJV?=
 =?utf-8?B?d0Vaemxub1FwZmdZMWFHMnlvR3Z4eEhqTitTcnlqU0hDc2JkRk9XekNmaVRa?=
 =?utf-8?B?RHVlTTdjalhHelJmZnVGLy96dUlBMWJ5dHR1ZktCRGxxYnZISlljMHM0L3JI?=
 =?utf-8?B?bytDVFVWRk1QUTJBazNycXFnWkdDU0xuMUR2cE9tNlMvbDNYMmxuNENpKzRN?=
 =?utf-8?B?MEVISVVTNzBEK3FXY1NrMXRON0R6bHErbTcxVUxaQ3dGT0RQaTRZN2RZaG9y?=
 =?utf-8?B?OGlXNHpyb1FSWFVkNHhtelJTLzNIMmoxdFFDblc2OUhjV1R5UzZoMWVJNmpr?=
 =?utf-8?Q?mRHv+ldF97zAnhlk=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 282dff74-c21e-4efc-a10d-08de5aaf2193
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 18:42:16.4778
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DK8cqqQqKfplsqnAwBR3WUx3KXIU0iaGBjLJikvrbfSMY2e5KssechAeBeiMthFTO3ZEkrms7rL7BhkR9ANNjBYk9n+PLBIMYe+UC9E1/Dk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR01MB7807
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_104233_335220_22298495 
X-CRM114-Status: GOOD (  27.07  )
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

Oops, it looks like the similar response was sent twice. My email server 
had some hiccups yesterday, I thought the first one was failed to send, 
so I sent the other one. But it looks like both went through.

Anyway both are basically same. Sorry for the confusion.

Thanks,
Yang


On 1/22/26 1:41 PM, Yang Shi wrote:
>
>
> On 1/21/26 9:09 PM, Anshuman Khandual wrote:
>> Hello Yang,
>>
>> On 07/01/26 5:59 AM, Yang Shi wrote:
>>> Since commit a166563e7ec3 ("arm64: mm: support large block mapping when
>>> rodata=full"), the direct mapping may be split on some machines instead
>>> keeping static since boot. It makes more sense to show the direct 
>>> mapping
>>> use in /proc/meminfo than before.
>> I guess the direct mapping here refers to linear map ? IIUC it is called
>> direct map on x86 and linear map on arm64 platforms. Then should not it
>> be renamed as s/DirectMap/LinearMap instead ? This will align with names
>> from ptdump as well.
>
> Yes, linear map refers to direct map. They are interchangeable in this 
> patch. Using "DirectMap" keeps the compatibility with x86.
>
>>
>> Before the above mentioned commit, linear could get altered with memory
>> hotplug and remove events as well.
>>
>>> This patch will make /proc/meminfo show the direct mapping use like the
>>> below (4K base page size):
>>> DirectMap4K:       94792 kB
>>> DirectMap64K:      134208 kB
>>> DirectMap2M:     1173504 kB
>>> DirectMap32M:     5636096 kB
>>> DirectMap1G:    529530880 kB
>> If /proc/meminfo interface is getting updated via arch_report_meminfo()
>> why not add stats for all kernel virtual address space ranges including
>> vmemmap, vmalloc etc aka all address range headers in ptdump as many of
>> those could change during system runtime. What makes linear mapping any
>> special ?
>
> Other than what Will suggested, /proc/meminfo does show vmalloc info:
>
> VmallocTotal:   135288315904 kB
> VmallocUsed:      114200 kB
> VmallocChunk:          0 kB
>
> AFAICT, large block mapping for vmalloc has not been widely used by 
> arm64 yet.
> "cat /sys/kernel/debug/kernel_page_tables | grep -e BLK" doesn't show 
> any large block mapping on my AmpereOne machine with v6.19-rc4 kernel. 
> If we get more large block mappings for vmalloc, we can add the 
> mapping size info in the future.
>
> Thanks,
> Yang
>
>>
>>> Although just the machines which support BBML2_NOABORT can split the
>>> direct mapping, show it on all machines regardless of BBML2_NOABORT so
>>> that the users have consistent view in order to avoid confusion.
>>>
>>> Although ptdump also can tell the direct map use, but it needs to dump
>>> the whole kernel page table. It is costly and overkilling. It is also
>>> in debugfs which may not be enabled by all distros. So showing direct
>>> map use in /proc/meminfo seems more convenient and has less overhead.
>> Agreed a /proc/meminfo based broader kernel virtual address space stats
>> display will complement ptdump which provides more granular information
>> about their mapping (with additional cost and setup) but it should cover
>> all the regions in kernel virtual space.
>>
>>> Signed-off-by: Yang Shi <yang@os.amperecomputing.com>
>>> ---
>>> v5: * Rebased to v6.19-rc4
>>>      * Fixed the build error for !CONFIG_PROC_FS
>>> v4: * Used PAGE_END instead of _PAGE_END(VA_BITS_MIN) per Ryan
>>>      * Used shorter name for the helpers and variables per Ryan
>>>      * Fixed accounting for memory hotunplug
>>> v3: * Fixed the over-accounting problems per Ryan
>>>      * Introduced helpers for add/sub direct map use and #ifdef them 
>>> with
>>>        CONFIG_PROC_FS per Ryan
>>>      * v3 is a fix patch on top of v2
>>> v2: * Counted in size instead of the number of entries per Ryan
>>>      * Removed shift array per Ryan
>>>      * Use lower case "k" per Ryan
>>>      * Fixed a couple of build warnings reported by kernel test robot
>>>      * Fixed a couple of poential miscounts
>>>
>>>   arch/arm64/mm/mmu.c | 202 
>>> +++++++++++++++++++++++++++++++++++++++-----
>>>   1 file changed, 181 insertions(+), 21 deletions(-)
>>>
>>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
>>> index 8e1d80a7033e..422441c9a992 100644
>>> --- a/arch/arm64/mm/mmu.c
>>> +++ b/arch/arm64/mm/mmu.c
>>> @@ -29,6 +29,7 @@
>>>   #include <linux/mm_inline.h>
>>>   #include <linux/pagewalk.h>
>>>   #include <linux/stop_machine.h>
>>> +#include <linux/proc_fs.h>
>>>     #include <asm/barrier.h>
>>>   #include <asm/cputype.h>
>>> @@ -171,6 +172,85 @@ static void init_clear_pgtable(void *table)
>>>       dsb(ishst);
>>>   }
>>>   +enum dm_type {
>>> +    PTE,
>>> +    CONT_PTE,
>>> +    PMD,
>>> +    CONT_PMD,
>>> +    PUD,
>>> +    NR_DM_TYPE,
>>> +};
>>> +
>>> +#ifdef CONFIG_PROC_FS
>>> +static unsigned long dm_meminfo[NR_DM_TYPE];
>>> +
>>> +void arch_report_meminfo(struct seq_file *m)
>>> +{
>>> +    char *size[NR_DM_TYPE];
>>> +
>>> +#if defined(CONFIG_ARM64_4K_PAGES)
>>> +    size[PTE] = "4k";
>>> +    size[CONT_PTE] = "64k";
>>> +    size[PMD] = "2M";
>>> +    size[CONT_PMD] = "32M";
>>> +    size[PUD] = "1G";
>>> +#elif defined(CONFIG_ARM64_16K_PAGES)
>>> +    size[PTE] = "16k";
>>> +    size[CONT_PTE] = "2M";
>>> +    size[PMD] = "32M";
>>> +    size[CONT_PMD] = "1G";
>>> +#elif defined(CONFIG_ARM64_64K_PAGES)
>>> +    size[PTE] = "64k";
>>> +    size[CONT_PTE] = "2M";
>>> +    size[PMD] = "512M";
>>> +    size[CONT_PMD] = "16G";
>>> +#endif
>>> +
>>> +    seq_printf(m, "DirectMap%s:    %8lu kB\n",
>>> +            size[PTE], dm_meminfo[PTE] >> 10);
>>> +    seq_printf(m, "DirectMap%s:    %8lu kB\n",
>>> +            size[CONT_PTE],
>>> +            dm_meminfo[CONT_PTE] >> 10);
>>> +    seq_printf(m, "DirectMap%s:    %8lu kB\n",
>>> +            size[PMD], dm_meminfo[PMD] >> 10);
>>> +    seq_printf(m, "DirectMap%s:    %8lu kB\n",
>>> +            size[CONT_PMD],
>>> +            dm_meminfo[CONT_PMD] >> 10);
>>> +    if (pud_sect_supported())
>>> +        seq_printf(m, "DirectMap%s:    %8lu kB\n",
>>> +            size[PUD], dm_meminfo[PUD] >> 10);
>>> +}
>>> +
>>> +static inline bool is_dm_addr(unsigned long addr)
>>> +{
>>> +    return (addr >= PAGE_OFFSET) && (addr < PAGE_END);
>>> +}
>>> +
>>> +static inline void dm_meminfo_add(unsigned long addr, unsigned long 
>>> size,
>>> +                  enum dm_type type)
>>> +{
>>> +    if (is_dm_addr(addr))
>>> +        dm_meminfo[type] += size;
>>> +}
>>> +
>>> +static inline void dm_meminfo_sub(unsigned long addr, unsigned long 
>>> size,
>>> +                  enum dm_type type)
>>> +{
>>> +    if (is_dm_addr(addr))
>>> +        dm_meminfo[type] -= size;
>>> +}
>>> +#else
>>> +static inline void dm_meminfo_add(unsigned long addr, unsigned long 
>>> size,
>>> +                  enum dm_type type)
>>> +{
>>> +}
>>> +
>>> +static inline void dm_meminfo_sub(unsigned long addr, unsigned long 
>>> size,
>>> +                  enum dm_type type)
>>> +{
>>> +}
>>> +#endif
>>> +
>>>   static void init_pte(pte_t *ptep, unsigned long addr, unsigned 
>>> long end,
>>>                phys_addr_t phys, pgprot_t prot)
>>>   {
>>> @@ -236,6 +316,11 @@ static int alloc_init_cont_pte(pmd_t *pmdp, 
>>> unsigned long addr,
>>>             init_pte(ptep, addr, next, phys, __prot);
>>>   +        if (pgprot_val(__prot) & PTE_CONT)
>>> +            dm_meminfo_add(addr, (next - addr), CONT_PTE);
>>> +        else
>>> +            dm_meminfo_add(addr, (next - addr), PTE);
>>> +
>>>           ptep += pte_index(next) - pte_index(addr);
>>>           phys += next - addr;
>>>       } while (addr = next, addr != end);
>>> @@ -266,6 +351,17 @@ static int init_pmd(pmd_t *pmdp, unsigned long 
>>> addr, unsigned long end,
>>>               (flags & NO_BLOCK_MAPPINGS) == 0) {
>>>               pmd_set_huge(pmdp, phys, prot);
>>>   +            /*
>>> +             * It is possible to have mappings allow cont mapping
>>> +             * but disallow block mapping. For example,
>>> +             * map_entry_trampoline().
>>> +             * So we have to increase CONT_PMD and PMD size here
>>> +             * to avoid double counting.
>>> +             */
>>> +            if (pgprot_val(prot) & PTE_CONT)
>>> +                dm_meminfo_add(addr, (next - addr), CONT_PMD);
>>> +            else
>>> +                dm_meminfo_add(addr, (next - addr), PMD);
>>>               /*
>>>                * After the PMD entry has been populated once, we
>>>                * only allow updates to the permission attributes.
>>> @@ -389,6 +485,7 @@ static int alloc_init_pud(p4d_t *p4dp, unsigned 
>>> long addr, unsigned long end,
>>>               (flags & NO_BLOCK_MAPPINGS) == 0) {
>>>               pud_set_huge(pudp, phys, prot);
>>>   +            dm_meminfo_add(addr, (next - addr), PUD);
>>>               /*
>>>                * After the PUD entry has been populated once, we
>>>                * only allow updates to the permission attributes.
>>> @@ -575,16 +672,21 @@ pgd_pgtable_alloc_special_mm(enum pgtable_type 
>>> pgtable_type)
>>>       return  __pgd_pgtable_alloc(NULL, GFP_PGTABLE_KERNEL, 
>>> pgtable_type);
>>>   }
>>>   -static void split_contpte(pte_t *ptep)
>>> +static void split_contpte(unsigned long addr, pte_t *ptep)
>>>   {
>>>       int i;
>>>   +    dm_meminfo_sub(addr, CONT_PTE_SIZE, CONT_PTE);
>>> +
>>>       ptep = PTR_ALIGN_DOWN(ptep, sizeof(*ptep) * CONT_PTES);
>>>       for (i = 0; i < CONT_PTES; i++, ptep++)
>>>           __set_pte(ptep, pte_mknoncont(__ptep_get(ptep)));
>>> +
>>> +    dm_meminfo_add(addr, CONT_PTE_SIZE, PTE);
>>>   }
>>>   -static int split_pmd(pmd_t *pmdp, pmd_t pmd, gfp_t gfp, bool 
>>> to_cont)
>>> +static int split_pmd(unsigned long addr, pmd_t *pmdp, pmd_t pmd, 
>>> gfp_t gfp,
>>> +             bool to_cont)
>>>   {
>>>       pmdval_t tableprot = PMD_TYPE_TABLE | PMD_TABLE_UXN | 
>>> PMD_TABLE_AF;
>>>       unsigned long pfn = pmd_pfn(pmd);
>>> @@ -606,8 +708,13 @@ static int split_pmd(pmd_t *pmdp, pmd_t pmd, 
>>> gfp_t gfp, bool to_cont)
>>>       if (to_cont)
>>>           prot = __pgprot(pgprot_val(prot) | PTE_CONT);
>>>   +    dm_meminfo_sub(addr, PMD_SIZE, PMD);
>>>       for (i = 0; i < PTRS_PER_PTE; i++, ptep++, pfn++)
>>>           __set_pte(ptep, pfn_pte(pfn, prot));
>>> +    if (to_cont)
>>> +        dm_meminfo_add(addr, PMD_SIZE, CONT_PTE);
>>> +    else
>>> +        dm_meminfo_add(addr, PMD_SIZE, PTE);
>>>         /*
>>>        * Ensure the pte entries are visible to the table walker by 
>>> the time
>>> @@ -619,16 +726,21 @@ static int split_pmd(pmd_t *pmdp, pmd_t pmd, 
>>> gfp_t gfp, bool to_cont)
>>>       return 0;
>>>   }
>>>   -static void split_contpmd(pmd_t *pmdp)
>>> +static void split_contpmd(unsigned long addr, pmd_t *pmdp)
>>>   {
>>>       int i;
>>>   +    dm_meminfo_sub(addr, CONT_PMD_SIZE, CONT_PMD);
>>> +
>>>       pmdp = PTR_ALIGN_DOWN(pmdp, sizeof(*pmdp) * CONT_PMDS);
>>>       for (i = 0; i < CONT_PMDS; i++, pmdp++)
>>>           set_pmd(pmdp, pmd_mknoncont(pmdp_get(pmdp)));
>>> +
>>> +    dm_meminfo_add(addr, CONT_PMD_SIZE, PMD);
>>>   }
>>>   -static int split_pud(pud_t *pudp, pud_t pud, gfp_t gfp, bool 
>>> to_cont)
>>> +static int split_pud(unsigned long addr, pud_t *pudp, pud_t pud, 
>>> gfp_t gfp,
>>> +             bool to_cont)
>>>   {
>>>       pudval_t tableprot = PUD_TYPE_TABLE | PUD_TABLE_UXN | 
>>> PUD_TABLE_AF;
>>>       unsigned int step = PMD_SIZE >> PAGE_SHIFT;
>>> @@ -651,8 +763,13 @@ static int split_pud(pud_t *pudp, pud_t pud, 
>>> gfp_t gfp, bool to_cont)
>>>       if (to_cont)
>>>           prot = __pgprot(pgprot_val(prot) | PTE_CONT);
>>>   +    dm_meminfo_sub(addr, PUD_SIZE, PUD);
>>>       for (i = 0; i < PTRS_PER_PMD; i++, pmdp++, pfn += step)
>>>           set_pmd(pmdp, pfn_pmd(pfn, prot));
>>> +    if (to_cont)
>>> +        dm_meminfo_add(addr, PUD_SIZE, CONT_PMD);
>>> +    else
>>> +        dm_meminfo_add(addr, PUD_SIZE, PMD);
>>>         /*
>>>        * Ensure the pmd entries are visible to the table walker by 
>>> the time
>>> @@ -707,7 +824,7 @@ static int 
>>> split_kernel_leaf_mapping_locked(unsigned long addr)
>>>       if (!pud_present(pud))
>>>           goto out;
>>>       if (pud_leaf(pud)) {
>>> -        ret = split_pud(pudp, pud, GFP_PGTABLE_KERNEL, true);
>>> +        ret = split_pud(addr, pudp, pud, GFP_PGTABLE_KERNEL, true);
>>>           if (ret)
>>>               goto out;
>>>       }
>>> @@ -725,14 +842,14 @@ static int 
>>> split_kernel_leaf_mapping_locked(unsigned long addr)
>>>           goto out;
>>>       if (pmd_leaf(pmd)) {
>>>           if (pmd_cont(pmd))
>>> -            split_contpmd(pmdp);
>>> +            split_contpmd(addr, pmdp);
>>>           /*
>>>            * PMD: If addr is PMD aligned then addr already describes a
>>>            * leaf boundary. Otherwise, split to contpte.
>>>            */
>>>           if (ALIGN_DOWN(addr, PMD_SIZE) == addr)
>>>               goto out;
>>> -        ret = split_pmd(pmdp, pmd, GFP_PGTABLE_KERNEL, true);
>>> +        ret = split_pmd(addr, pmdp, pmd, GFP_PGTABLE_KERNEL, true);
>>>           if (ret)
>>>               goto out;
>>>       }
>>> @@ -749,7 +866,7 @@ static int 
>>> split_kernel_leaf_mapping_locked(unsigned long addr)
>>>       if (!pte_present(pte))
>>>           goto out;
>>>       if (pte_cont(pte))
>>> -        split_contpte(ptep);
>>> +        split_contpte(addr, ptep);
>>>     out:
>>>       return ret;
>>> @@ -835,7 +952,7 @@ static int split_to_ptes_pud_entry(pud_t *pudp, 
>>> unsigned long addr,
>>>       int ret = 0;
>>>         if (pud_leaf(pud))
>>> -        ret = split_pud(pudp, pud, gfp, false);
>>> +        ret = split_pud(addr, pudp, pud, gfp, false);
>>>         return ret;
>>>   }
>>> @@ -849,8 +966,8 @@ static int split_to_ptes_pmd_entry(pmd_t *pmdp, 
>>> unsigned long addr,
>>>         if (pmd_leaf(pmd)) {
>>>           if (pmd_cont(pmd))
>>> -            split_contpmd(pmdp);
>>> -        ret = split_pmd(pmdp, pmd, gfp, false);
>>> +            split_contpmd(addr, pmdp);
>>> +        ret = split_pmd(addr, pmdp, pmd, gfp, false);
>>>             /*
>>>            * We have split the pmd directly to ptes so there is no 
>>> need to
>>> @@ -868,7 +985,7 @@ static int split_to_ptes_pte_entry(pte_t *ptep, 
>>> unsigned long addr,
>>>       pte_t pte = __ptep_get(ptep);
>>>         if (pte_cont(pte))
>>> -        split_contpte(ptep);
>>> +        split_contpte(addr, ptep);
>>>         return 0;
>>>   }
>>> @@ -1444,37 +1561,57 @@ static bool pgtable_range_aligned(unsigned 
>>> long start, unsigned long end,
>>>       return true;
>>>   }
>>>   -static void unmap_hotplug_pte_range(pmd_t *pmdp, unsigned long addr,
>>> +static void unmap_hotplug_pte_range(pte_t *ptep, unsigned long addr,
>>>                       unsigned long end, bool free_mapped,
>>>                       struct vmem_altmap *altmap)
>>>   {
>>> -    pte_t *ptep, pte;
>>> +    pte_t pte;
>>>         do {
>>> -        ptep = pte_offset_kernel(pmdp, addr);
>>>           pte = __ptep_get(ptep);
>>>           if (pte_none(pte))
>>>               continue;
>>>             WARN_ON(!pte_present(pte));
>>>           __pte_clear(&init_mm, addr, ptep);
>>> +        dm_meminfo_sub(addr, PAGE_SIZE, PTE);
>>>           flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
>>>           if (free_mapped)
>>>               free_hotplug_page_range(pte_page(pte),
>>>                           PAGE_SIZE, altmap);
>>> -    } while (addr += PAGE_SIZE, addr < end);
>>> +    } while (ptep++, addr += PAGE_SIZE, addr < end);
>>> +}
>>> +
>>> +static void unmap_hotplug_cont_pte_range(pmd_t *pmdp, unsigned long 
>>> addr,
>>> +                     unsigned long end, bool free_mapped,
>>> +                     struct vmem_altmap *altmap)
>>> +{
>>> +    unsigned long next;
>>> +    pte_t *ptep, pte;
>>> +
>>> +    do {
>>> +        next = pte_cont_addr_end(addr, end);
>>> +        ptep = pte_offset_kernel(pmdp, addr);
>>> +        pte = __ptep_get(ptep);
>>> +
>>> +        if (pte_present(pte) && pte_cont(pte)) {
>>> +            dm_meminfo_sub(addr, CONT_PTE_SIZE, CONT_PTE);
>>> +            dm_meminfo_add(addr, CONT_PTE_SIZE, PTE);
>>> +        }
>>> +
>>> +        unmap_hotplug_pte_range(ptep, addr, next, free_mapped, 
>>> altmap);
>>> +    } while (addr = next, addr < end);
>>>   }
>>>   -static void unmap_hotplug_pmd_range(pud_t *pudp, unsigned long addr,
>>> +static void unmap_hotplug_pmd_range(pmd_t *pmdp, unsigned long addr,
>>>                       unsigned long end, bool free_mapped,
>>>                       struct vmem_altmap *altmap)
>>>   {
>>>       unsigned long next;
>>> -    pmd_t *pmdp, pmd;
>>> +    pmd_t pmd;
>>>         do {
>>>           next = pmd_addr_end(addr, end);
>>> -        pmdp = pmd_offset(pudp, addr);
>>>           pmd = READ_ONCE(*pmdp);
>>>           if (pmd_none(pmd))
>>>               continue;
>>> @@ -1482,6 +1619,7 @@ static void unmap_hotplug_pmd_range(pud_t 
>>> *pudp, unsigned long addr,
>>>           WARN_ON(!pmd_present(pmd));
>>>           if (pmd_sect(pmd)) {
>>>               pmd_clear(pmdp);
>>> +            dm_meminfo_sub(addr, PMD_SIZE, PMD);
>>>                 /*
>>>                * One TLBI should be sufficient here as the PMD_SIZE
>>> @@ -1494,7 +1632,28 @@ static void unmap_hotplug_pmd_range(pud_t 
>>> *pudp, unsigned long addr,
>>>               continue;
>>>           }
>>>           WARN_ON(!pmd_table(pmd));
>>> -        unmap_hotplug_pte_range(pmdp, addr, next, free_mapped, 
>>> altmap);
>>> +        unmap_hotplug_cont_pte_range(pmdp, addr, next, free_mapped, 
>>> altmap);
>>> +    } while (pmdp++, addr = next, addr < end);
>>> +}
>>> +
>>> +static void unmap_hotplug_cont_pmd_range(pud_t *pudp, unsigned long 
>>> addr,
>>> +                     unsigned long end, bool free_mapped,
>>> +                     struct vmem_altmap *altmap)
>>> +{
>>> +    unsigned long next;
>>> +    pmd_t *pmdp, pmd;
>>> +
>>> +    do {
>>> +        next = pmd_cont_addr_end(addr, end);
>>> +        pmdp = pmd_offset(pudp, addr);
>>> +        pmd = READ_ONCE(*pmdp);
>>> +
>>> +        if (pmd_leaf(pmd) && pmd_cont(pmd)) {
>>> +            dm_meminfo_sub(addr, CONT_PMD_SIZE, CONT_PMD);
>>> +            dm_meminfo_add(addr, CONT_PMD_SIZE, PMD);
>>> +        }
>>> +
>>> +        unmap_hotplug_pmd_range(pmdp, addr, next, free_mapped, 
>>> altmap);
>>>       } while (addr = next, addr < end);
>>>   }
>>>   @@ -1515,6 +1674,7 @@ static void unmap_hotplug_pud_range(p4d_t 
>>> *p4dp, unsigned long addr,
>>>           WARN_ON(!pud_present(pud));
>>>           if (pud_sect(pud)) {
>>>               pud_clear(pudp);
>>> +            dm_meminfo_sub(addr, PUD_SIZE, PUD);
>>>                 /*
>>>                * One TLBI should be sufficient here as the PUD_SIZE
>>> @@ -1527,7 +1687,7 @@ static void unmap_hotplug_pud_range(p4d_t 
>>> *p4dp, unsigned long addr,
>>>               continue;
>>>           }
>>>           WARN_ON(!pud_table(pud));
>>> -        unmap_hotplug_pmd_range(pudp, addr, next, free_mapped, 
>>> altmap);
>>> +        unmap_hotplug_cont_pmd_range(pudp, addr, next, free_mapped, 
>>> altmap);
>>>       } while (addr = next, addr < end);
>>>   }
>
>


