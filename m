Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02742D778B0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 20:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wXT9CIUnvJXNz2htHtxdp+bcJfMLgc3MPgPlBsCgwiQ=; b=aMg+RzITFyKG6IUFiNyfdyViOI
	yjHxtzCf6U2HGtTI032wEYlgSTKthWHIzNsfZFBJGZo2q0NUgSNYI5IKs/sLVnNJm2w26pwbvLb2B
	cvSzNZ+HMzcMhYgHftpt0lVALu8LMh2qTDOh6lrcGvQsApNQsfBpsN6UHsAZ+HmTFwGPAEwNolFoG
	Vjfqt6qZb9Ov0DEhbqfWbH2z5fT18tgB5G4Jwu5O2KNT0JPnCeWU6Sy5SIqp7pM3RLupHUay03s2m
	iSHES9uvfG7DDQz5uyFspQokaOBrq5TgpllY05yUftSMwQzePVmpumo1SPS3Alquo39o7BdDSfi1F
	coX6E/BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjNS8-00000009Sth-0RqJ;
	Fri, 23 Jan 2026 20:08:20 +0000
Received: from mail-eastusazlp17011000f.outbound.protection.outlook.com ([2a01:111:f403:c100::f] helo=BL2PR02CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjNS4-00000009StF-2z0N
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 20:08:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KrMNeMSRCaCrmYeOQvtGk4YkCEOUEvCNX/XhQzUDA0CIgLaxwGOBhvZg8a8csZaVA8U+HiVBh9M1wMon/6s8CAIbF6/wKwM/7ab6MxPNz19A3t1i5HBUwU1SS318GqJTZ/Q363wwmKUnj64E1IKg7Y/rmQcvF5Ql4wZwCZhOvmw3vi7cf1Zq5wUCD/PZLFoj7aaSAA6kXGF6GbltkPwh8RRaqJ7gspW+awM3gdLCAq6rp/buwTvggf05sl7YLOD+zqJu/lrCYKMCM2sqlL+o7LIU9wgqG1nqshShenT+k1gjUNU/43S3j/BfxPN6H5NRKTPkHrW7suVUH+Y9wp5/TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wXT9CIUnvJXNz2htHtxdp+bcJfMLgc3MPgPlBsCgwiQ=;
 b=UXOxtjyWu6/odsSKAnzzv2QJCeOxz1ThXHWd9zpS6VS0SXRz7XHd+Csmg1pekFg41+RuOeQ4gAzjRKni51ZVNpKbAL6CcOQFcGW1jOnE7CStdjvwYVSYYQzLKj/9J9/MZr+hnD6O7hodVrGliffDv9yPJtKZSc6YFPYzVPmMKlk0PYOrmh0sDuXKvqT6k5XVkXAhWaj5lA16+gTMptNvuVNHcH0AGDnZCf96t5yknPhzvq2Ia0ES/vbeFnJVnVUXS1za1r8MNBL/RkplrFxjWGWzbKWNBxML9JoCDJIi17cBZ+2E7x6BOC6Y+slpJY9D1LslYRp5GuzxFkoF7Sl6OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wXT9CIUnvJXNz2htHtxdp+bcJfMLgc3MPgPlBsCgwiQ=;
 b=GMdX3l/CENIDS9R4kx5UTLs2KfEaxUiL0glfncg9rbXRjsKMaFqwGEpDlQKo+jRdd1/goc0IcINd+6Wo5xgn50zuzHLZg+KCW1PSfGuIFmYvpxMjGhvD5fnIobqnUkZGt3wsCp3+koYX7Q+624EQlktZfgE9tdKYcman8ktzvQk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 CYYPR01MB8291.prod.exchangelabs.com (2603:10b6:930:c4::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.12; Fri, 23 Jan 2026 20:08:11 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::46eb:64a3:667c:c1a0]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::46eb:64a3:667c:c1a0%4]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 20:08:11 +0000
Message-ID: <1d9e2eff-c6c9-414d-9e39-e046fc0fdc16@os.amperecomputing.com>
Date: Fri, 23 Jan 2026 12:08:07 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [v5 PATCH] arm64: mm: show direct mapping use in /proc/meminfo
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 Will Deacon <will@kernel.org>
Cc: catalin.marinas@arm.com, ryan.roberts@arm.com, cl@gentwo.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260107002944.2940963-1-yang@os.amperecomputing.com>
 <965a0b46-f32e-40e6-ab71-211f84d6c3cf@arm.com>
 <aXIxYcAsbFZn3ZNU@willie-the-truck>
 <8e9f762f-5933-4e30-ab6d-489a56de4eaf@arm.com>
Content-Language: en-US
From: Yang Shi <yang@os.amperecomputing.com>
In-Reply-To: <8e9f762f-5933-4e30-ab6d-489a56de4eaf@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0081.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::26) To CH0PR01MB6873.prod.exchangelabs.com
 (2603:10b6:610:112::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB6873:EE_|CYYPR01MB8291:EE_
X-MS-Office365-Filtering-Correlation-Id: cda762eb-c36f-4c1d-a95e-08de5abb21f6
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a2h1ZElYa0RnRStmOGdHRll2S09MUzNOUG9YNDFxNWo3ZDQ5WG9SdUtINllt?=
 =?utf-8?B?KzdTRmE0Z2ZSVnVjZXYzRVpxRVRLUTlucU9aME14SFY4cWtoRVhCUEpEQyt3?=
 =?utf-8?B?SG5VTlVaQUtwdHRhcGgzY0lqc0tkZVVsMllkYk84YkFhRGNNMUx3QlQ1OFNk?=
 =?utf-8?B?TVloWU0xc3JWaERaSVhsWGZmUHhCRWF0SHorTGR3c0VrK3hmY3FmcHNZU0pN?=
 =?utf-8?B?eGtKRHh2eitiQmlxb1VLKzc4dit3ckIyMnBZUkNxVm1VZkdRQTU1bFIyY2RE?=
 =?utf-8?B?S21WWHJJeGU0V0dxbzdtNnE0VUVhN1V4S1NldnpWSTlnMjBiWDdFRDE2WHFH?=
 =?utf-8?B?S1o2dXlxelBtR2NobWZMU2k5czBoNTlDTlliV2ttbTQ4ai9pMUdaLy9meDNC?=
 =?utf-8?B?M05neXB6YXV1VEdTT092NSt3eFI0SzRtZWpaVmRvTWxuSE9tKzU2ekhVbG5z?=
 =?utf-8?B?TnVOaittdS9UNUw1eUxqOXEzUHJwM0NKZm9FS3VRb29VVHNuOEtpb3dWVnoz?=
 =?utf-8?B?VFJuNDJKOHFSRXUrcnNrS2h0SEdON1N3NUdTUkk3bW1LNW44eGVneTZwZGhx?=
 =?utf-8?B?OXNzSDNKelhRcUFxWnVZM0dRWE9vK3YyVy91WlpIWlIyVGROeTl3VGxhellR?=
 =?utf-8?B?cUpIcGNIdUZDeHlHN1BDdnh2UEhuR2NuaU5GM1Bnem1VRU1ueVEyVVBsUFRL?=
 =?utf-8?B?Y0FXMm1wU0RrdTdmQ2pMbERpTThzWXViby9wdHBuUmpMYzNRTmxxUWdncUti?=
 =?utf-8?B?K3UzRTRzNitvcXE0U0FKYUZhUWxMOUpNU04zbEY5R0Z3TFY1RC9yRXM4eEQv?=
 =?utf-8?B?Q1drMFlJV2xHcjBuZTY2dklHeXN0akcrQVl0TXdGS2Jqd3JuTldjSHN3MVgv?=
 =?utf-8?B?WEpITU5lc1cvMmtab01ROURDVjRhMWpLanA0bnBlaTMzTC8rZERabVNOOG9n?=
 =?utf-8?B?dXdDTTBYTGtZU1kvcExuT2RUbmJmazFHTUZ4N2dNRzhCTnp6Sk45RUFndit4?=
 =?utf-8?B?VW9Db014MTI5a0RUMU1MeHNuTXZEMlJNVUdOdnU5UGJqQmpxT2lZMkRVbE1x?=
 =?utf-8?B?UEpURkZ4TzlJYUJJOU8xU1NTZXY3VVVHY1dhY24wVzh3NmMzd0d0aVF1aEE2?=
 =?utf-8?B?emExK2JMTHdYRUovbEF2YjN2YlZ0dFRRdS91NnNWOGpDNElDRHF3cWJzL1Fy?=
 =?utf-8?B?RGdkek5TR1RBUmlrRjRMSENacjdxRUNqTGY5MVpHcTFYd1Z4N2NYN2FMMTQw?=
 =?utf-8?B?ZEpLVHZkYktBZ2hNY1RNY3dIM0thZ1FTbXFsVktXK0JZZDlOWHJUN3FxcHZL?=
 =?utf-8?B?RDAwdDA0UktOcjlBd2Jldk9mSmF1aW04aXU3V2FXMmJuNkN2cGxIWjBudFlQ?=
 =?utf-8?B?ejNSdEp2SHdWQzFxamphOWM0L1pyQ0ZiNkExOTN6TERiQUpLalZJb2ROSUQ2?=
 =?utf-8?B?SysrQ0xiYlpnS29OTUFiL0NrNXgweUdZd3ZOVW93alhldVF0YXZOR1hidTFk?=
 =?utf-8?B?amJCZ3pBemp1cTAzYnVYcXBjY0YzZndZUVNRMWlVcUp3cW5QWHJnQk5JWW9V?=
 =?utf-8?B?SUZhZ1NxT3dETUROU29WSU1VcWFHWXBhWEk4WnZCL2x0dE4vd3hIVXh3MU12?=
 =?utf-8?B?bG9heFozbEhpK3IxUHNOZjR5WlBMTXZLQnN5RUdPSDdyTzBXMVBsNGE3eDhY?=
 =?utf-8?B?OHFDRlNlS2dPaHB5azg0K0JDNVlYUS84d1Y2dzFXMU5XQkM4RStaT2tDVGNO?=
 =?utf-8?B?ZEpBcUxiSnNNcTRuQXUvR2QwbldvbExJM01VVXdFckZEejJZc1JFNUJHQnpT?=
 =?utf-8?B?TFpobXZCK2UwSTEwNXRlLzY5UzZHb0hIQnE1UVhKN2hpakM5L1BZMmcrSldI?=
 =?utf-8?B?UlRCbXFjV0tocFJqRkU0RUpFL291S09jdTg5RFZBRnQyZ0tXUnhwbG5qWmlK?=
 =?utf-8?B?Sk5acEVJZnpROS9ONzYzcm9WeWtiQkMrUnZra3dqZk83VElUWlhIOEY4Mm9X?=
 =?utf-8?B?SFpVOGpDdjVidWcwVVZqZWZKRkdGWVB3a2dMVGFSSXlKZGljT09OMjBGS09t?=
 =?utf-8?B?bzZUNnFZb0U1ZEh4anpJM084NHpBS21rejhtSno5MmQyUzBhTUZ4cUFZeXE2?=
 =?utf-8?Q?HXUU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZHp0RFhac0dqM3paMW5QRklJR1Q0a2JwcVhyV0IwcE1DckQvT0J3WnVuSnlY?=
 =?utf-8?B?d2hWY2J3bkdtYjgyZFM1QWRBNlZXQW1sSUtkMWdISVRGckl3YVBHZEV6Vzhj?=
 =?utf-8?B?V0c2TU9UV2I2Mk9qc0RHYWxPYmxWcnErdjZGZjZGYTRGSjhNaVJTNGpjdVJS?=
 =?utf-8?B?Q2crV1orclVtbVNJTHVUUjJGeEs3MUh3V3NqRC9WTUsvOUpqcWRKbEFHR0dO?=
 =?utf-8?B?REcrVVVLTEhHYkxqMWZRSENBRzhxOFhPUVNSbXdwSVpudXRPL01QYlpRWndl?=
 =?utf-8?B?NXo0Vnp1Z2hwVDdSdzJlYkdrdlpXMHFBb1BINGozQUl3NUZQZkZWQy9XdVRN?=
 =?utf-8?B?NlYyOXZsMlJ6NnZDMGVjd3Vzb1R4MmlvN2pIY3VIcXhTR240aXhUaTVodm5m?=
 =?utf-8?B?UlhvTXBYRWZQQjhhSVVWN2Ixb3NFQlhtZ2pEeEN1UEI2RDNZZTJpblNESGYw?=
 =?utf-8?B?QlJnQndoMXduYWg1ZFJNNHpabCt0bFpOOGQ1QTNqOFRDeTdLZ2NpWHg2RTFj?=
 =?utf-8?B?c2ZmUEpHa0tjWVh4QXlZR2JEOTg4aDQ1ZVQzdWJKR1J6eFZTVFRudzJnVzhJ?=
 =?utf-8?B?WkwwVldYUDNPYnVBWHpDNWRwVXNhWGpxMStxL2YwekRVMGo2SHdiOG5JS1FY?=
 =?utf-8?B?OFExQmpaQnRXTE92aUlnM2NjUVNSV0xkLzU1eER0aEF3QWlIbmRGQWhzQ25S?=
 =?utf-8?B?SVJFSGhGd1lPQU5mQmNUZWZpaU9naWZCS0E2eDZPRnhMbU9PWmFHQmxwM3NV?=
 =?utf-8?B?NE93MkgzQ2grdTZDbTI5cUpMaFhrUmlWSWpOWkU2ei9IV01qSlIvT3JjSHVZ?=
 =?utf-8?B?NWNkRmV1b0FxSHBZeWNacmROOTZYZjFUdThTZ0k1b2JUL1hjeEVEWGF2Nzdz?=
 =?utf-8?B?MmJFa0ZqcmpWb3BRd0gvaUl0MHU4b3I0d3BoQXBySHdZUmZLSlR4dUpvTWU3?=
 =?utf-8?B?cWFtWUx1dmpHU2Zxbk8veXROUXJRN1BlUThPUTZXbHYvUmViRnNpbU4rSUFD?=
 =?utf-8?B?cGZ4MEFrMGhtbjlyQ2NDV2owT1JpZDczTE5sK0pXazlBTDZGa2JGSUd3VXMx?=
 =?utf-8?B?TUpzenloNitHSm5QTEpMYmlNMWMrbmM2akdrZUZjRjVJYjliMXVscXRzMEJi?=
 =?utf-8?B?a2lLMkZLQUdsaXBJbFRlcTlQclRQQUk2cm1zZnN2a3BCbkJnNzhpSkhLekNW?=
 =?utf-8?B?VGdZOEdPRWdmYWdYUkI5b1BXOTJXY1lFWmpJM3p3UThkSlZJdVRqdmxwSm9B?=
 =?utf-8?B?S242WlVLZVVUVlhOQlAyb2hhazhkeDZKYjlaNzBSNWlDTmx6U0U0d2VRazFh?=
 =?utf-8?B?U1NpVlFPNGhqL3JoVFplcjhyS3lJU3pYSmFTUVVibmREWDRtZXBBTGVScmx3?=
 =?utf-8?B?VGJrc1VYMEx4N1RnekloSDVlOWxJNHh1aDhURFUrVUlSa2U5WHUvSlIxbEJh?=
 =?utf-8?B?WjdUeFc4L3BZYkNOWTk2Y2NuSVJDNlJKa0FCQ3dxc3pMVHVwVmRkSFp4Z0Yz?=
 =?utf-8?B?YXUydkxnS1BlbmVvVm1uS2I3ekgzZFNYTnI1QmRPdmIrT1lyT1NoQnBOTHg5?=
 =?utf-8?B?ZWd3d0MxUWk0aEVkcVE0dG14aWVudE5vbE5wR0dDbS95TkE1enpEVlRkbXpz?=
 =?utf-8?B?VklvUk5JbkZkYzVNTnM2SDNLM2xSeE8zSUJkell1YkdFV2dBZkdRcWRsM21Y?=
 =?utf-8?B?a1IwK05YZFNOWkEyL2JGbS92dU1VcTQrajJTRWEycyt4eVVqbWIyN2wxNi9Z?=
 =?utf-8?B?U01JN3dBdjVxVzJjNURRNUpRbGFmVVk1U0xCVjdUQm5LSjhtQ0piMUVBK0lB?=
 =?utf-8?B?YU1CS2tMY3IydUdmcktkOFpwcjRvRmRMTThsN0plaFZ6ZVIrZGxOcU1vSmtI?=
 =?utf-8?B?S3QxODdoZktGcWJWSzllYWd2WSsrZ0xpWml3eW1VUDc3UENHSmI4Y0NJeGlU?=
 =?utf-8?B?Vk5CVU1SdnpnWXpiRHMyVG5DUGRIYUhwMFRyV0ZVeTdMNlhocEhYZzBTb0xR?=
 =?utf-8?B?Z2cxTC82ZzhhSDVUM0VXUEhiK0p4b2lYOVlJU2o5Vk55Tkc2MGNUWitqSTlG?=
 =?utf-8?B?ZHpxQjhnWjJ6eDQ2TFN5OHlOa21sbzBSY3o4bjJJdTk5S1lXV0QveUJtWEtu?=
 =?utf-8?B?QVBtRTJYL1JFYStvK1J0S3NYcXRkQTBmdjB2Ty9mWm5HOTdFVHdjdkwydnVi?=
 =?utf-8?B?YlpoTXJuVmFLc2ZVUk5QNUw3ZmRqKzZPYVhZaUZ1RERNTFB3MGZRSEhCRVRR?=
 =?utf-8?B?Ym52TW9DWDhtRjhOd3ovVTlKNDRsTnZJWEdkVTZoVHFzdFg5dHlPS1JvR2Rj?=
 =?utf-8?B?dnVIbHVocC9rMC84OEdIQVo3enhHTXRQTFNNeFUxaGFIQnV2bm1pejQwUmZx?=
 =?utf-8?Q?zxDAkR1AWZ/qAzgk=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cda762eb-c36f-4c1d-a95e-08de5abb21f6
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 20:08:10.9893
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XRqWYcglebu1HKXxO9BbVcQmZRKV9h8YNa4IjvJQ8eWG/8PaP8n0PtVaIhRWIn/nmP6Sc8GEKrfAJQC1k/ATmPNoCzqWLRg2yxhbHqcMExc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR01MB8291
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_120816_774732_FB5FB035 
X-CRM114-Status: GOOD (  20.72  )
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



On 1/22/26 6:40 PM, Anshuman Khandual wrote:
>
> On 22/01/26 7:47 PM, Will Deacon wrote:
>> On Thu, Jan 22, 2026 at 10:39:25AM +0530, Anshuman Khandual wrote:
>>> Hello Yang,
>>>
>>> On 07/01/26 5:59 AM, Yang Shi wrote:
>>>> Since commit a166563e7ec3 ("arm64: mm: support large block mapping when
>>>> rodata=full"), the direct mapping may be split on some machines instead
>>>> keeping static since boot. It makes more sense to show the direct mapping
>>>> use in /proc/meminfo than before.
>>> I guess the direct mapping here refers to linear map ? IIUC it is called
>>> direct map on x86 and linear map on arm64 platforms. Then should not it
>>> be renamed as s/DirectMap/LinearMap instead ? This will align with names
>>> from ptdump as well.
>>>
>>> Before the above mentioned commit, linear could get altered with memory
>>> hotplug and remove events as well.
>>>
>>>> This patch will make /proc/meminfo show the direct mapping use like the
>>>> below (4K base page size):
>>>> DirectMap4K:	   94792 kB
>>>> DirectMap64K:	  134208 kB
>>>> DirectMap2M:	 1173504 kB
>>>> DirectMap32M:	 5636096 kB
>>>> DirectMap1G:	529530880 kB
>>> If /proc/meminfo interface is getting updated via  arch_report_meminfo()
>>> why not add stats for all kernel virtual address space ranges including
>>> vmemmap, vmalloc etc aka all address range headers in ptdump as many of
>>> those could change during system runtime. What makes linear mapping any
>>> special ?
>> tbh, I think compatability with x86 is a good argument in this case and
>> so the naming and formatting proposed by this patch makes sense to me.
> Fair enough. Probably adding a comment above arch_report_meminfo() along
> with the commit message, explaining the above rationale would be helpful
> for developers to understand/recollect this equivalence later on.
>
>> I'm also not sure that it's particularly interesting to see these
>> rolled-up numbers for the vmalloc area. You really want information
>> about the area, so extending /proc/vmallocinfo to give information
>> about the granule size for each entry might be useful but I don't think
>> it should be part of this patch.
> Agreed - vmalloc has a separate file for its details which can be improved
> later to accommodate rolled-up numbers. But what about vmemmap ? It always
> gets updated along with linear map during memory hotplug and remove events.
> Should that be included here ?

The granule size of vmemmap should be quite static IIUC. AFAIK kernel 
doesn't modify vmemmap page tables except HVO, but arm64 doesn't support 
HVO. And just 4K page size can have PMD mapped vmemmap. It doesn't use 
contiguous mapping either. The smallest granularity of memory hotplug is 
128M with 4K page size, so vmemmap for hotplugged memory should be PMD 
mapped as well.

It might be worth showing the memory consumed by vmemmap for hotplug 
memory so that the users can know where the memory is used. The vmemmap 
used for bootmem is not counted in MemTotal of /proc/meminfo. But it 
sounds more core mm generic and shouldn't be part of this patch IMHO.

Thanks,
Yang



