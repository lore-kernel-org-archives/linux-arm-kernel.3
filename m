Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDBF1C3ABB0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 08:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KqA5t5rYp/r/ZJwSGHOVkzCLqSwezjn3z6RQslketsQ=; b=DF1eHR2cADDp0hnZ/emoNWTm/y
	C6lOe+Kb2nmKVcChC4j94z1XsNQOYdzVeuHzOvw8p+6pX0tVRO1STnrNYr/jEd2ihhFbeFUxmt5Vt
	LlfrGyjd79WPADCZtBhKLHjJW8Q6m1DvW95rr+aKGNqNdJEm5AhiDJP4zCIkMvyVKAr2N+eAutqEB
	xjc5mFHnygafoFVr5NbvXs55Do7HDz+mLj86ktV1eM750k9sPUGaM2EWlxd8VayF3l31NqNTzbQjh
	Sft8PvV6n2MGkM+zss+eeQxJajvfktqumV39VIfhQ0Zc0fcQOuCJwGx+mA0PhEbVAJxVlbZioudYX
	PyBbiXxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBr4U-00000006lm0-1Zuh;
	Mon, 05 May 2025 08:21:06 +0000
Received: from mail-vi1eur02on2072b.outbound.protection.outlook.com ([2a01:111:f403:2607::72b] helo=EUR02-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBr2U-00000006lRv-0jmC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 08:19:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sIr3ORFlhEHzA41bh/ACX46La2ksKisobsLrbajrySmGA1Ktwr+wI9vWeZaKqKGizIdrMBq+7DRv47YrvhGbZ0nTo8Edx/5k1MkcWXqGEv/WAbZSIC/YjdMpei3lAGjMzEZpzpIlpnA166WcS2Gop1S+kpuUoGxz8+aC/iDrgEbQMaG+6+salXFuer7mjk8c7oBjqnqdrkKmlMk0OXEjWI3Zh82gPLaZNLhSb7RissidvYwAVC+lJWkCMkwVpvApDQyFc6NQvjHoQyGZSLBltCeAw/hOS8ocUzpEK/XRiynaKPqp3GAjm5eeJlUKyhmzZG5/Dg5pNkjMX8JOCwRzTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KqA5t5rYp/r/ZJwSGHOVkzCLqSwezjn3z6RQslketsQ=;
 b=WC9+WSLS+CIhqmyAc183+mvZf067T8HjRJkiMINWn+cB9EwK9R3LTxZrJwqaVgF8oUo3qq2AGUPm6YXqmRZgOaPjZgNZgvRR1RR9gleAuwqZogv+XP/jgHFzUGgMpfOKUz2G/5+CGfQsf8wJb7HtffEbIsqDfmPmXL+Gb6hduX/owWJxCTIRZQBGvkBGP1nBJjwndJgJx+5DRpoFUjJQzxhAAn+uUILruXsuhgDfICKAZT7Mcqu0h8RgPcXp1+s0F6CyHTwWp9IknJq+6K2I+qQP9OAwwcIhFR9Hq8X8KHEryWFA9D/QTRVM5QPoPe/DUaOvrnExGd99Enx7xbR7og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.de; dmarc=pass action=none header.from=phytec.de;
 dkim=pass header.d=phytec.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KqA5t5rYp/r/ZJwSGHOVkzCLqSwezjn3z6RQslketsQ=;
 b=e8Nvk66j87hi6axJdyUq/UuxyCWXrhCkjgDDXaaaJo0882EGF8cge3qly0DRjiU/FhpI82YOW7/a7EWDGSkRvj8eRXLkd5mUTW1uT3p+iMAxrYjV8D+JjHUjf5O+1sPQDf7uxW5OPHzcpEJvMJwPwoA3kIi0JJ571cFHiIDKB3y/99dLp1v2AXt0tj4A/qxSVxSvcxQArTeAviE5XIAmK9a7nKLKMLguw8GXX2DTyTHhnfCAQC6NontiPI+XawpCT3oF2m421gbH01XOFu2JqyWITorrVBa54w/sXs3OUpDJx95srK9TFXajAfey5EK/ltW4NCUXCtTFC7y6a6sWZw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.de;
Received: from VI0P195MB2484.EURP195.PROD.OUTLOOK.COM (2603:10a6:800:248::6)
 by AS2P195MB2248.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:59f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Mon, 5 May
 2025 08:18:56 +0000
Received: from VI0P195MB2484.EURP195.PROD.OUTLOOK.COM
 ([fe80::24f:8371:2871:5981]) by VI0P195MB2484.EURP195.PROD.OUTLOOK.COM
 ([fe80::24f:8371:2871:5981%4]) with mapi id 15.20.8699.019; Mon, 5 May 2025
 08:18:56 +0000
Message-ID: <f40e97a2-41f4-430b-b3f4-815587201191@phytec.de>
Date: Mon, 5 May 2025 10:18:44 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [Upstream] [PATCH] arm64: defconfig: Enable BANG BANG Thermal
 Governor
To: Garrett Giordano <ggiordano@phytec.com>, catalin.marinas@arm.com,
 will@kernel.org, quic_bjorande@quicinc.com, geert+renesas@glider.be,
 dmitry.baryshkov@linaro.org, krzysztof.kozlowski@linaro.org,
 shawnguo@kernel.org, neil.armstrong@linaro.org,
 alexander.stein@ew.tq-group.com, biju.das.jz@bp.renesas.com,
 javier.carrasco@wolfvision.net, elinor.montmasson@savoirfairelinux.com,
 linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, upstream@lists.phytec.de
References: <20250113185607.2210352-1-ggiordano@phytec.com>
Content-Language: en-US
From: Daniel Schultz <d.schultz@phytec.de>
In-Reply-To: <20250113185607.2210352-1-ggiordano@phytec.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P223CA0018.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::23) To VI0P195MB2484.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:800:248::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0P195MB2484:EE_|AS2P195MB2248:EE_
X-MS-Office365-Filtering-Correlation-Id: 1603a1e9-02fe-4884-7cdd-08dd8bad7ac1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|10070799003|921020|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WkZTQndKZnc3aDZUN0wxbWhZOTZaS2xhL0hNUUJBWmRncFRieU1LMXRTaXJR?=
 =?utf-8?B?M2s2TE03Q3RRMUVGejdidWw4WjJ6YXpGVUh4cWdFalB0ZThoVUpac29wUGQz?=
 =?utf-8?B?VDBkSXUxdnoybk1mTHdRSFNvNTJTMExZS0JYTkxVaS9Za3F1MTROSnJoQVB4?=
 =?utf-8?B?UWhKRUxPSXNzZm9QdCtjbmMvVWhnV1liTG1oL2hjdStuMVRveHd5UkovRHVk?=
 =?utf-8?B?ZFRVU0lKeTlsYzY3U3N6OUlUb0pldzA3YVJ1WEtWcTVCbzkrVk82cGU5OUZX?=
 =?utf-8?B?VllDWUhTN1RHbXJ0WTlQbDMxNDZZb1c2MW9vMFU1clNKb2taTHErem5PMnRw?=
 =?utf-8?B?MndtbXlkVzZZZnhZa2N2M0JBZVBraHgxbjYzeTZxSjdiYVhwVWVEay9RRHl3?=
 =?utf-8?B?NXFjZmhLWVFKOUw1THBIYWVOL3VmcytrOVlsbm9BOVh5MmduZmZ5WFg5eHU5?=
 =?utf-8?B?ejVINjhkRTc0NVJBci9MdXhtcmpJc3EyYW9TNVVkNGhReEZmR0U3YTBTdmxk?=
 =?utf-8?B?VWpTN0pwVXRUZ0dDa01NTjhVZlVCd25GdkxkM2NubVNSa2NlSWlBYVFIVDla?=
 =?utf-8?B?N0VXdGtLUEJGNWtLaVlpK2Zrbys4OHp3TzJrV3NmMFgxaDNIeFIyajlmWUI1?=
 =?utf-8?B?M0RnR25HSnBJVWxEZ0JLYjJLNHZiU2ZubnozUHBXcWRqZDBVeGpEYUViZWpH?=
 =?utf-8?B?SC9GUXJ3amdKNDIvQjhWWGNBMkt6YTNYZFFEclpLMkFmRm1panQ1b0habmtK?=
 =?utf-8?B?VkhDSkdOQ2J4MjBpU05MSW0xeVJCWTZsTHdLWC93cUt2bDBML1RaRHh2MVdj?=
 =?utf-8?B?eURpSVVvdXJBUFdOY2xsM0lNWkNYeUZBZ2V2ZkhoMXl2MG1iSGJqOE0yWjNj?=
 =?utf-8?B?VGsvM0NiclhOdlNmVXozaU9RVFF5ci9YR2tPWEFVaU1icG5mbmdrOGlhZXJZ?=
 =?utf-8?B?Y3hLbE42Zlorb1FSL3M4bmVkenJ2S25tL3BVMkhoaTIyUFNBYTVWWWV2d2xN?=
 =?utf-8?B?YWpUMG1lTkRyeWtoWU96YW5MTkRBS1MrMTBqTGhrVURKWGpGYkVhTEQwVVkz?=
 =?utf-8?B?OFVFY3BLUTJZK1ZoOEVyaVdDNURFakZDelhhU1h2ZURxSHVHVUhWVGRlWVkr?=
 =?utf-8?B?dExuc0xMbTBVNEd5MU5MRG9EeHcrNE10NFRXZTgrK0hud2NXZ2psZFJHN2gw?=
 =?utf-8?B?KzJJR2tUdGJISzBQckFnMmdCSENsYnVzYXZwVC84WVJKVi9iVmtiTHpSc1NB?=
 =?utf-8?B?RU1rd3hGbUFtSGpTMWl3S251WHhWY3k1WksyeDFtS3NwRlgyWGd1YmVyTHJL?=
 =?utf-8?B?UGdCV1JoaFJBUkJaejFKYjBGcWtFekt1WnFaRkMxdnZubzhvY0FPNzVQMEhI?=
 =?utf-8?B?OVlhNEhIWk9nc3l0WHNjNE4xWHd4a2Z6eGZlQ1ZrcXNZYlJYYWIxSUhTOXF3?=
 =?utf-8?B?TmtjQ0Yva0ZRdkdGOCt2RTA1cWt2U1l1OWZyZUNuVG1aK2pIRlR6MWNtZDJl?=
 =?utf-8?B?VUlxZy9XWWpUOStGRENHUTZzZVRpdjVjL3hMR0RHQXJRM3NiZllhNS96QzB5?=
 =?utf-8?B?aXpXNFlSVHVQN1djL1FCWDY2QyttV2JYMDA0YVorVTdnY2tCblpjYmV3WW91?=
 =?utf-8?B?bWNpWHFhTS9TbE5jeXZBWFB0aklmQlJCN0NpcjdSZlRCSlJIUWlLY1YrdlMv?=
 =?utf-8?B?eUJzSnovQWc5emNoTmI2cDZtMnQ5MmJXYW1acU5OaGVYMFEyUTY2S3dnbTNu?=
 =?utf-8?B?RUpyWDRBR1ZSbE4yVGxHbFFBM1RuWDZ6Sisvb2ptcGozaW10TW5uRWJZRFN1?=
 =?utf-8?B?dFVFb0U1SkRZdjVUbmNZMnZuMHFKVXVDcFBVTGpLK2F5QlNpQ2dGckpNRDUy?=
 =?utf-8?B?NnU5aDgwc3BPTkxuSTVrNWRua3ZDaWwvNUZiY3lQYzQ1eUFJVDVHaXFYZDlZ?=
 =?utf-8?B?VmNwTFRLRVJXTjEzZDlNL0FOTS8zWGplVGVrdHUyMXpPTnFnQUdnRnpsa0ox?=
 =?utf-8?B?cHZKb1NFeU5BPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0P195MB2484.EURP195.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(10070799003)(921020)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L3BPbjFuWXRzVWNFUHJvZkNqQTVFdFNkNU5ZQnhWQUFXTzhvNXF0L3hlcW0w?=
 =?utf-8?B?V0l5YjhiQjZmMWFNRnIvbTJLS2ZWREFQVjc1OHArVlB0N0J6Q2taUUJ2M1Qv?=
 =?utf-8?B?Uk9qVU5xWFhNY3RSay9RK1lrWDhDeEVQdWRwQmFEY0dWV2lMQ0I1Zko5bkxE?=
 =?utf-8?B?eVVXRURZbDJBaWhxMzFvUGFYN2tjRS9rN1I4Vjl2NHArQkZpbm5lT3k0TFVp?=
 =?utf-8?B?Z2p3SUU2dFdUbnJldVlad2srVk0yMzZmQ25Takxmc2R5eElQUjBTSmhIS0Vl?=
 =?utf-8?B?c3lVZ0hONk0zSG0zeHBGYVp2ZHRkRThJd2RWUW5wU2NmdnBDd2szTzE2aEJR?=
 =?utf-8?B?Y0xrUGxkY3ZsWHJPZUNrbEd4YzQzUDlLcWpGaGdWczhNejRPWm9ZZ0xUTndN?=
 =?utf-8?B?NEdneUtQSHlxMHN0eWcxaWhlSDFQMjJwTWhkQi90d2xOSHRvSWNnQkw4ZTAv?=
 =?utf-8?B?eHlHUGRWL0wzN0xoUnBOU0NwU2hZUGpvTXFabnUzQU45bTc3aDd2WlZLc3JO?=
 =?utf-8?B?NkU1Yi9oczdzYTNhN3R1YUdQSU5POHVwbE9OY1FaMGZzWjBYcjRxUE1DdFU5?=
 =?utf-8?B?Q0h4ek5sYTlZRnBoT3NRRGlCRjZHUDVDcWxVZy9VeGorUjd6NWp4eG9LYnls?=
 =?utf-8?B?VWkzZ3MzUFNCVU5vbHNubUwzdm9MZ0pmSGtHQUVaVDcxenJrNnZLNUVlRnBH?=
 =?utf-8?B?YUo4T2JtWERsRU04U1pReWJRaVhEeFRCOE9Xcjc3V2tzRkdRbi9ZMjVxSmJJ?=
 =?utf-8?B?cUtuVWNUWDFVSEwxSlBqL2hGNUhJZ25MZ1pWYVkvWVZkMi82TStpTUhhZXBJ?=
 =?utf-8?B?WDl0d0R1QVpoVkpFZ01UbzZjRXpaeVFLT2FSYk5KdGN5UUQ4WkVmQ2Uydmt4?=
 =?utf-8?B?bVI3Q05VOG92c01MYjdJbVozb25HTk00YWFEN3Z0OXVDMVRkdUFIUVJnSFh5?=
 =?utf-8?B?MUVobUltdHBLRGlxVFNHODBvcGdld0MwMCtzcU8rZ0ZzM1FWK0g2K1RwL0VB?=
 =?utf-8?B?M0ZUL1c4SHVJc1J0em1ubjRQNFBjZldlNzFQMmZjQzBUSUJ5NncyQmlJQUZL?=
 =?utf-8?B?eWtjSm0waUV4V2VnemIydGlQRlpPZGJWK2JBSUlJajdHM2dWaUZnSk11cGtL?=
 =?utf-8?B?Q1NDUHFyYzIxd2p5U0tucWxnVTBQN2pqcHVVNjFjTlRkUFJGKzArNUEwUUpB?=
 =?utf-8?B?ZXlxWnRucEVmWlY3OHFyL0thY1VhNmxoSzdUY3F2TDN2RFVPZlBXZXNrUEJl?=
 =?utf-8?B?Rys4c2lPQm50ZS9KR294UEJaamVUclZhZjhJQ1lteEo3MlFXUW4vU3FPSk1K?=
 =?utf-8?B?NWtrTDZ0dmtFeGhJbnA3WEF0aXhmYklKOXNKM3dmYzFHeHhUVDY4MnZEL0xa?=
 =?utf-8?B?clFHRXd6ZkxLcUNMRFZmc1d5QWFlWW1kMW5QTWRxYjZGTk53MEc2c0hCTjhO?=
 =?utf-8?B?SFNRdHUyVERMWW9FR2ZhTzBqSmRyamhMU2ZmdGora1ZsbFlmR3NhYWhLWlFx?=
 =?utf-8?B?QUN5M1c2cktjdGdGTWdTa050ODhYUU9nV1FZcHlROERzQ2VtM3ZhcUNIempz?=
 =?utf-8?B?MDlqYjc3OHJLQkhwQ2VIaHpGenlCM3dOUWM2SW9jaG5tL3I0WTVNUEt0cGdQ?=
 =?utf-8?B?anE4dHFwVUFOZlNKME1NNDRQek5BRjFCWlZtdkNUU0lqRDc4ZUJ2akkzTnhO?=
 =?utf-8?B?UmhZTjE5ajBJU25qMk5NU0t6UWtqUWhxOXJMRGExTng4R2lDNHYwOEF5NFZI?=
 =?utf-8?B?K3hmc1YvNWFMcHJTUTJNUmlQaTJ2TDlXK04weHhjd0NMWFUzV0sybHgreksx?=
 =?utf-8?B?WVZMYml1VkNGTzdjMEllQ1pMVlFQRkV5S283QlBNbHcvZWxQT2U2MUJGZ1dF?=
 =?utf-8?B?Tk5heFJ0WUJLQnhxZnFFSVpPSXl1cHdqQWJqVnVicTE1Wm5SaEwzRWJNaDR4?=
 =?utf-8?B?b1BDYWdpdzZTU3BsTGYyd2hLbHNSK25IODRSZCs3dnRFaWFCdkdRK08yMkt0?=
 =?utf-8?B?SlNNSGZKUnJaSERoRDJ5SUpFUXhxV2ZHYWVqTm1ReENUNDVDSnkwZ1VSVWkx?=
 =?utf-8?B?Q3VyMldZSDVNY0hwWjFkY1J3RTczR2FTb1dwQnZkQjBTRGlzRnJSNnRsd240?=
 =?utf-8?B?SzVJK2Z0M05CNGppdnNHdzdWS1VZak9HWCtHVUhqTS9FMlArSkdVd2EvY0hK?=
 =?utf-8?Q?OTWIw2XmgCmezuu76dWTtHummeGhGfRFbxWe/3DZ16jD?=
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 1603a1e9-02fe-4884-7cdd-08dd8bad7ac1
X-MS-Exchange-CrossTenant-AuthSource: VI0P195MB2484.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2025 08:18:56.5181
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n/A/xaeNbbf/GcE6INIfri76aTG0hqu+jJsaBNBqI6wyB0Rjptgn7WpajyjqyUv1NjdEhGiZ3XftSts3shmdEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2P195MB2248
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_011902_218455_775C1327 
X-CRM114-Status: GOOD (  11.71  )
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

Hey,

can someone please take a look at this patch? I can also re-send in case 
it doesn't apply anymore. Thanks!

- Daniel

On 1/13/25 19:56, Garrett Giordano wrote:
> Enable the BANG BANG Thermal Governor to manage the GPIO Fan using
> hysteresis on the PHYTEC phyBOARD-Lyra AM625.
>
> Signed-off-by: Garrett Giordano <ggiordano@phytec.com>
> ---
>   arch/arm64/configs/defconfig | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index c62831e61586..3fd04c689269 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -690,6 +690,7 @@ CONFIG_SENSORS_RASPBERRYPI_HWMON=m
>   CONFIG_SENSORS_SL28CPLD=m
>   CONFIG_SENSORS_INA2XX=m
>   CONFIG_SENSORS_INA3221=m
> +CONFIG_THERMAL_GOV_BANG_BANG=y
>   CONFIG_THERMAL_GOV_POWER_ALLOCATOR=y
>   CONFIG_CPU_THERMAL=y
>   CONFIG_DEVFREQ_THERMAL=y

