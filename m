Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0CFEE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 07:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hdL3UCKYJLbJXvGaCsvSydMZY+u1pV5Ev91i21iPTNw=; b=st6lXV38UkZFVxyTN9u3qn/5oz
	FE+WyFBAUA4s+pCL27GPfa49QSOfQD/CoHHJbth76n5SHS3vSu8hbvV/qHQ6FYXcHxg9dw7pcGfVb
	v5wqyNajczgDMtg+lxUNy0qO7voX29+P/SduLU7VarIU71ZUpFiFGUg4/eVnSJXimcr0h/84vhLwj
	ZXlJN9Z2ZC9HqtMn478pNBnpYqj3ndL/E8cOOc0s83sk9gFLjfXicOpr4SqBP28ZZrc013TGkZ6lJ
	HG7XUKr4b73861gwOeCy6YLPLUOqd39jo2ZKEtblh9uzHU18TYO7fTQHxiOJ1lNyWn9siwAiqNjIi
	3POGhMUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM05z-00000002xg8-2JXI;
	Fri, 13 Dec 2024 07:28:19 +0000
Received: from mail-am6eur05on20608.outbound.protection.outlook.com ([2a01:111:f403:2612::608] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM04t-00000002xUE-3XmZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 07:27:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BNVnEcfoCiEffcNBryJothiprXT4Pt0CrrI4hE0DWzM/vOKGpsf/6QIPmg+DjJ2RTGPuOQh2PjittWfnjHfxLQsI8kmIomCW0CAPsuEFwAqrfhNl4hQxC46U01/IIk+Ch3Ce1F4kkwdan+re4BYc1exN4Ovl8ks6S73mHn5mlPUT8AGR3G2JVHhzchZsbFITMjKFcwuhHhC7ma1twLbVT63T38BPQr8/+q50j1ekKMiL5rOD0XvBUfWoZ7OKiZD/IDOWqI+kzKgmUzc2CGQT77fpXkex1gMma7dguMtgvUt15FnECSz+1LENEYS3SYXfZfQ4/86jQETsHlfPh9Sd1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hdL3UCKYJLbJXvGaCsvSydMZY+u1pV5Ev91i21iPTNw=;
 b=x2kBnDLNTbu039GSym4y3uKHXZqKink3ymHqz/eYbWWmDBzrUxtHgkPfxYb2OU9BifoWwMBleZvbICGTE910VEOY8yWlH8eahv4QVeODMs8lTwZO+aSQgNcscl3q+LIv7FXOowa2A3YlZDRLaTV5Jrc5w1yV6J5xUobPZODN/LPYU2bjcYc5UCnr/j7JVL27yEQa762Ag/uCo7OGSvqmt1ClzSzQrRyHsK6GPR00EPIj+YU7yDerIZatH51lF6QMeoeLR9zrrPknbkty/8+i4g0BG5FaAWzi7fUfRuyjD7Lz5LQgG5hodFvSJtJS4RyDbMKkmDnbvVQeT77lR+fESw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cs-soprasteria.com; dmarc=pass action=none
 header.from=cs-soprasteria.com; dkim=pass header.d=cs-soprasteria.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cs-soprasteria.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hdL3UCKYJLbJXvGaCsvSydMZY+u1pV5Ev91i21iPTNw=;
 b=Wrtfd0VXOesybT/CY7vFDtxML8TmqSOlhvxCzClZflhWPXOMFomR6MzAXnY6lXYNiOUGvWtoP5ScVasu+DXKerYnlczEFi5xCit7064cTXyb1olT7lO8rPRNhGlTgo8UIHbwMXI0WIJGt/Km/f7ybG3EfZTehweLT8Ad+sFJ046229ttenTCmHLUxLSo3WO3e9+4cSKJOSPA3m4q2Wd4lL+NlQ9iJJy2oMRTsRpMCjFm8rb67GtYWSd2r2zHoU9k6PAqI2TNCDDtIHngHx7odmuofD0247/hk6iu/Vruy0Pg+81d39jmfrjvqYTV8sn8/CKRFWGq358aNejGOD/zIA==
Received: from PA4PR07MB7455.eurprd07.prod.outlook.com (2603:10a6:102:b9::12)
 by AS8PR07MB9111.eurprd07.prod.outlook.com (2603:10a6:20b:567::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.16; Fri, 13 Dec
 2024 07:27:03 +0000
Received: from PA4PR07MB7455.eurprd07.prod.outlook.com
 ([fe80::191c:a08d:4945:6288]) by PA4PR07MB7455.eurprd07.prod.outlook.com
 ([fe80::191c:a08d:4945:6288%6]) with mapi id 15.20.8251.008; Fri, 13 Dec 2024
 07:27:03 +0000
From: LEROY Christophe <christophe.leroy2@cs-soprasteria.com>
To: Frederic Weisbecker <frederic@kernel.org>, LKML
	<linux-kernel@vger.kernel.org>
CC: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Andrew Morton
	<akpm@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>, Thomas
 Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 06/19] soc/qman: test: Use kthread_run_on_cpu()
Thread-Topic: [PATCH 06/19] soc/qman: test: Use kthread_run_on_cpu()
Thread-Index: AQHbS+Mex5HqM2GsQkaLVT6cfvGz17LjyQcA
Date: Fri, 13 Dec 2024 07:27:03 +0000
Message-ID: <986fee5c-8537-498f-83ec-65a7c7c7a71c@cs-soprasteria.com>
References: <20241211154035.75565-1-frederic@kernel.org>
 <20241211154035.75565-7-frederic@kernel.org>
In-Reply-To: <20241211154035.75565-7-frederic@kernel.org>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cs-soprasteria.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR07MB7455:EE_|AS8PR07MB9111:EE_
x-ms-office365-filtering-correlation-id: aa59d417-63ba-458b-bb31-08dd1b478a4a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?RW1udzFrNVhQN2NNemR1dnhjZ29WT0RycE5nYUIvaHNUZEtuclhYVFlwQVNh?=
 =?utf-8?B?dXlXL0k4UmxFQ2VOUytvTEdJL2hvWU1raVJnU2VmaUNwVVdwMzNHemhqNlVP?=
 =?utf-8?B?dFUrVWwyQVJ1UlhYemgrNngwb2R3RzdKQ0tBS2FQVmxwYVB2ejJHaWlHTlp0?=
 =?utf-8?B?cHYwaFBseUNnTWhKMlE5Tk9mSDZXZGpxQS9oczRZZjlxVks2eEdTMWhHT1hz?=
 =?utf-8?B?U3ZpaUhNN2J6a1VDKzB0UEZIUmJHRHNLQ1phU0NEVk93dVdCaUMrUUFmWVNy?=
 =?utf-8?B?TFFMb3hmdkQrM0c0M3FmQ0EyVW15bjN2RnFsNGZBd3QrQkdtZ0FrSm9UWDQz?=
 =?utf-8?B?endqQ2EzNjV4TldEdmZVWVVGajltODJXQWhGVUJxdENGTzBCVkNaNURjS1Ey?=
 =?utf-8?B?QmxjalBKZ1ZObHFKcXJqdWsvSzRtRWNtMTJtUmdCS0J3SURoVUhmek9wSFFa?=
 =?utf-8?B?azhIYjgxZGF1T0JicGd6SG1WQW9rTWNwN0ovTUQxcllSN01xbVZjNXhqK3F0?=
 =?utf-8?B?ZGF2Q1V6T1hrQ1VidVFhZllpSVJuOG5kK2dCSU5qRlZLZ29qNGJtaHpEL3dw?=
 =?utf-8?B?ZUdrdXZXZXcvdFZhVTlWVWUxdGtMVlBsUFp2Uk1HMXpxRFBIb3J1aTZ4a0Y2?=
 =?utf-8?B?NVRsL2cvd2dWa3VoZEJBdmQzOFpUOG1PbDVhTVE0UGRmNzlLUWkySFVXclRE?=
 =?utf-8?B?L0NyUG1VaWZaM095bWp2akpLcHkvQUY1WnlCNHM2MWlDWjlaRU5hU29qVWpG?=
 =?utf-8?B?WGZKQjZSSURxbENLcG1CVXpkd2hnSGZCbkNOcVZLUlNuTXdzNU9vMHl4U1kw?=
 =?utf-8?B?ZTd5T1h1ZGVpdjRIR01CemNHVVhxT2cxayt0M2c5T0FidzlYTWZFTGVUbWtZ?=
 =?utf-8?B?NE1YKzM3dUtieFFYUDArM1Z3UVlyV0VWSFNaWGxIcUN5Q01wKzhZUHZOcHo5?=
 =?utf-8?B?WEdIVDlMYlZLSGVRUTN1TlNDRDhEdVc5SjhPMEJtR3hVakRhckwvbDRPcFZJ?=
 =?utf-8?B?dXJXQ3VqTUFpZVJWZ0ttakczUXNCbVZPQmFvTFFWWnBWNHJxRXFvdG9qSG11?=
 =?utf-8?B?NWNCZitHOHUyQ2FUaUNxNmRpdjlkZTJYcE1xYS9qQVEwNGxWbkFOZTVkV0Fw?=
 =?utf-8?B?c0Q5M2pOamNQVzJ3SngwL2FKaFZ2aXhDUzEydmJ2dHNJZXcxTDVRZWRmd3dD?=
 =?utf-8?B?Q1QzVkNPZlJSYkc5R2FCUTR2L2p2NzVhR2NDQlk2SGdQVzNxR2UxQzdOUEc1?=
 =?utf-8?B?blgzZTgyUzYveHZtM25DZEh5RWF5RVUrc0FYQ3lmOXk5MVJ6T0tnejNNemcr?=
 =?utf-8?B?NW0xVXdzM3lMNnMxUklKaGkwOVd1K202Y2ZEUXpoM2lOazB4a3pPaExFUFlY?=
 =?utf-8?B?blFHdUs5eVUrSUlOL3dKK3h0L1N6WmgyUG1hNGZKeUFyQmljWlVySVBVVGll?=
 =?utf-8?B?Rk1KVVVacy82UStQdG9ZK2RTNy9ObFNNb3JWS0gvSDZJTXJ2SWJpWi9ERDlU?=
 =?utf-8?B?L1pESWlHb3VwcVgzbThSMjZKSjk1WGxNL29BU2xxUTJSU3BnRnRhZXZwMUtk?=
 =?utf-8?B?NVJBaS91SUdkUUhDU2dhVm9SSGJsN2pubC9LZjh3RVJtRkloOS9wM0lKcVBw?=
 =?utf-8?B?RUk5YnhiWHhWbGxLcW1nQjB6dWlZQ2Ziem96M1BBOG1GcTJUQTNFc04zNXVr?=
 =?utf-8?B?QzZXNDBzZGp2UXE2UDJURkN1ZFRXblJFYW9HZ09BZWwxVzZRRUdmNmtxY1Vh?=
 =?utf-8?B?OUc2RFplUjlNUmJiTnhXVDE0SWQxRmpOQ2FzTFRKdFN1M0EwYzliZ0NqRE5z?=
 =?utf-8?B?aVRnSHNqeVo1cDYvMGFKU1dLNHMxTTQ0N1d4ZUdyNlg1eFkxVW9GRXcyc2tJ?=
 =?utf-8?B?d1V1MVRtZ2wxbEdoQVE2MnExQkVabHFLd3lHSWNTb1g4UmFKYUJ1SXdpTHVY?=
 =?utf-8?Q?PdQHZ9k3ewPaTGbN4jUH7ikPe1UDwXQi?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR07MB7455.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dlhnRVluU25QM2Z0QzNnRWEzSTdrZjdYT2RNSEFPNUVlZW8yVUd6WFd6Rmtn?=
 =?utf-8?B?Y0FQcnB2N1JNQ1c0RGwwMWRXdlgydURRMHEwU290QzJ5L3VQdVFESEJpSDhV?=
 =?utf-8?B?R0hsaHVzM3RNRXRVeHVCWWRHZHVIR1lEWXp3L3lPcFN6dDRSRXk2blV1Qmxy?=
 =?utf-8?B?VHRRelhjcTMydGZ3Tk5PZlI3eVBhRmpndWc4amxuYjI4VTUvZnhPckZWaE9Q?=
 =?utf-8?B?eDV3VlNpa21nWTJUU1N5SFAvelF0OHlobCtoaHNaaHlJNTAyOTdFTExPMkhH?=
 =?utf-8?B?di9EeG5nQUpPWkY1RDF3Z0VueW9qa2hNalM0WS9SSUtuSVVmV3dkZm5DYmsx?=
 =?utf-8?B?OHdXaWN6REVyVyt6YzR3ci9CUno2U3VSaEZkSmx3V1ViT2VmR3M4UDV6QVdn?=
 =?utf-8?B?RVJ5RG43UXQwSFRGS2xGZFFVSmlFS2JuVWpzSk5GTThOR2NTUW5rUnUyeEJh?=
 =?utf-8?B?OXU4OWlQWDhnUUttZ21PQXY3Y1I1NUpQYVB2bFBVeEFJYmp6NGlyQjN5aldY?=
 =?utf-8?B?UStoUEV3VTl0OEI0THN2NjBhcnZZeTluSXluTm56OHRmK3RkbjgwTXpkYVZZ?=
 =?utf-8?B?Z09HamJSWkExY0tYUWR4NmJBbGUwM0RZL0ovcnpRdjFIQjNwTk9EVk1uMXh1?=
 =?utf-8?B?ZXZKNzF3SUJPOGlaVXZYdGhIalR2ZmlPdlkyVlZXY3NMZE9MU0hBQmRjdW1r?=
 =?utf-8?B?N0hPOEdMQ3pTdzlKVDFFdUFoc1ljcmNtUVdicHJPUVdCaSs2VEJqalVPU2FC?=
 =?utf-8?B?NVNYYWFUQTJZSDVQWGhNS0w3cDJ4ZFFjL3cvRnhUZzQ1MGVFbjhBb09HalFV?=
 =?utf-8?B?OGNIRkpseWRCeFkzMWpOckpod1ZEUnZnMmRpT0RrRDlGc1dLQ0gweEVDeEY5?=
 =?utf-8?B?R3U0eWZPaFhhbWlTTFVGbkdiL0tDelhaRDl1RG01WU9Ra2FQdUhFRVVZclk4?=
 =?utf-8?B?dldGd1NwcXdQM0czbHlPb3VhY2VVeEhiR1VBZjFUaW9CVVluSGF6dTMza2pt?=
 =?utf-8?B?S1ZBUjRnUUpQbW54eXV5eGNkVVh1U0s1dDNlWlZlczM0dHRUSnlNOWppQ1B5?=
 =?utf-8?B?cXM4V3IrVHJyUVNUdVhhbVpERHZXZHBzTVdHOWllVENsaWdqT04wa0xlNUo3?=
 =?utf-8?B?SGNOSWVFUkJhdElOVlNWR1NGeHRpSzhVK1Fmc0hONUNObzZCRlQvNG5ObEk1?=
 =?utf-8?B?aHcrek5YZHV3Z1RLVy9HNEN5REFZSnlraWFVSWpsMjhiekxlZU5OZHVNZGtN?=
 =?utf-8?B?VTM5blBrUmV5aHFKN3o0blRic1ppNDAyZ3c5K3NsVnEwTFI5MFB5K1cxUG9C?=
 =?utf-8?B?QjB4WUs2RG13UGdPOGtoN1dobHhhZGl1QkZvbmlmaGNKZlJYVlBQTDNaa2pq?=
 =?utf-8?B?aHpQN1JPOUMzdlZpZ1BTanhSV0tRV20rOUN4a0lUVzd4TDlvSjdpNmtOVlNK?=
 =?utf-8?B?K1poV0Z1aGNUUUV1VFAvL1BqaHRWampyVVBpQ09Xa1BmVjdONDgzQ01jYkkz?=
 =?utf-8?B?NXIyUmxlankrOEUzQk5JekJndGJvYWFrOFhVdUxlS2ZjNktUV2pqSi9LVDVl?=
 =?utf-8?B?UHZScVRrSGlnUFd3cU0xNHplU3ljalkzNGxjWWV5WkdkdU43V0pCUVlaY0Nl?=
 =?utf-8?B?SmxJREIrZm1QQjhnMXQvK3cybUtndmZPYVNOSnVzU1FwaTFuOXR3YWo2NUta?=
 =?utf-8?B?TlluNGx0MkJPQ0hlYlBETUVUNDBZYStzcGtHb1dhaVJVVFZSSXZhMTQwZjVq?=
 =?utf-8?B?eWJ1TWVmd2dkVXAycWlhSGQxY1orUlErbVZtWlBoMklJc25ZV1pmQXFoZlZX?=
 =?utf-8?B?NVNpQndlVTlIVUpxZEZQQXBYakw4c1RiU08zMDUxcmdlSGpnRDdHaUhiUklm?=
 =?utf-8?B?dVJERy9NVU9iem4yZWt1a0gyK28xcENpNmpyY0xrM0VKVW54bnVwOEQ5c3pt?=
 =?utf-8?B?aDRDeUo5M0hGK29YM3dXSTJGUXNtdWJmSzVQNWxFR3FSSTgrajhsQmJiZ2xM?=
 =?utf-8?B?VUw2Z3BEbTZwaTFIWGoxWGJhYWs1UTNhYmVkRkJzdHR1VWRzalozaVc5cVJh?=
 =?utf-8?B?Qkt4VXpXUnRiTjZ5QXh0WXdGYmgySHo5RU9tR3VjVEg2TkdRY0dVdE5MUnhF?=
 =?utf-8?B?TC81WTZLRU1CMi9HTGJVczlKOGdWR3RJUEVzMkJYR3FRQk5MS3ZXOG5iTklu?=
 =?utf-8?Q?ostCVC4X50ZucpF9qIvxNkc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F7D7DD7166234949A5178134762653A0@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: cs-soprasteria.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR07MB7455.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa59d417-63ba-458b-bb31-08dd1b478a4a
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2024 07:27:03.2642
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8b87af7d-8647-4dc7-8df4-5f69a2011bb5
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iYaECwIX2PddRGv7phiqsaPALMYISHNVD/irhNop6RKv8y87bYiXHZK47leYOKYKe7Akmbxu6a0Llf4lTn00NU6iBgDW8ovxnO39S2zJtROa2CKbZGWLeUvxV/V3XwOx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR07MB9111
X-MS-Exchange-CrossPremises-AuthAs: Internal
X-MS-Exchange-CrossPremises-AuthMechanism: 04
X-MS-Exchange-CrossPremises-AuthSource: PA4PR07MB7455.eurprd07.prod.outlook.com
X-MS-Exchange-CrossPremises-TransportTrafficType: Email
X-MS-Exchange-CrossPremises-SCL: 1
X-MS-Exchange-CrossPremises-messagesource: StoreDriver
X-MS-Exchange-CrossPremises-BCC: 
X-MS-Exchange-CrossPremises-originalclientipaddress: 88.124.70.171
X-MS-Exchange-CrossPremises-transporttraffictype: Email
X-MS-Exchange-CrossPremises-antispam-scancontext: DIR:Originating;SFV:NSPM;SKIP:0;
X-MS-Exchange-CrossPremises-processed-by-journaling: Journal Agent
X-OrganizationHeadersPreserved: AS8PR07MB9111.eurprd07.prod.outlook.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_232712_342752_7864B119 
X-CRM114-Status: GOOD (  17.04  )
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

DQoNCkxlIDExLzEyLzIwMjQgw6AgMTY6NDAsIEZyZWRlcmljIFdlaXNiZWNrZXIgYSDDqWNyaXTC
oDoNCj4gVXNlIHRoZSBwcm9wZXIgQVBJIGluc3RlYWQgb2Ygb3BlbiBjb2RpbmcgaXQuDQo+IA0K
PiBIb3dldmVyIGl0IGxvb2tzIGxpa2Uga3RocmVhZHMgaGVyZSBjb3VsZCBiZSByZXBsYWNlZCBi
eSB0aGUgdXNlIG9mIGENCj4gcGVyLWNwdSB3b3JrcXVldWUgaW5zdGVhZC4NCj4gDQo+IFNpZ25l
ZC1vZmYtYnk6IEZyZWRlcmljIFdlaXNiZWNrZXIgPGZyZWRlcmljQGtlcm5lbC5vcmc+DQoNCkFj
a2VkLWJ5OiBDaHJpc3RvcGhlIExlcm95IDxjaHJpc3RvcGhlLmxlcm95QGNzZ3JvdXAuZXU+DQoN
Cj4gLS0tDQo+ICAgZHJpdmVycy9zb2MvZnNsL3FibWFuL3FtYW5fdGVzdF9zdGFzaC5jIHwgNiAr
Ky0tLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygt
KQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc29jL2ZzbC9xYm1hbi9xbWFuX3Rlc3Rfc3Rh
c2guYyBiL2RyaXZlcnMvc29jL2ZzbC9xYm1hbi9xbWFuX3Rlc3Rfc3Rhc2guYw0KPiBpbmRleCBi
N2U4ZTVlYzg4NGMuLmY0ZDNjMjE0NmY0ZiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9zb2MvZnNs
L3FibWFuL3FtYW5fdGVzdF9zdGFzaC5jDQo+ICsrKyBiL2RyaXZlcnMvc29jL2ZzbC9xYm1hbi9x
bWFuX3Rlc3Rfc3Rhc2guYw0KPiBAQCAtMTA4LDE0ICsxMDgsMTIgQEAgc3RhdGljIGludCBvbl9h
bGxfY3B1cyhpbnQgKCpmbikodm9pZCkpDQo+ICAgCQkJLmZuID0gZm4sDQo+ICAgCQkJLnN0YXJ0
ZWQgPSBBVE9NSUNfSU5JVCgwKQ0KPiAgIAkJfTsNCj4gLQkJc3RydWN0IHRhc2tfc3RydWN0ICpr
ID0ga3RocmVhZF9jcmVhdGUoYnN0cmFwX2ZuLCAmYnN0cmFwLA0KPiAtCQkJImhvdHBvdGF0byVk
IiwgY3B1KTsNCj4gKwkJc3RydWN0IHRhc2tfc3RydWN0ICprID0ga3RocmVhZF9ydW5fb25fY3B1
KGJzdHJhcF9mbiwgJmJzdHJhcCwNCj4gKwkJCQkJCQkgICBjcHUsICJob3Rwb3RhdG8lZCIpOw0K
PiAgIAkJaW50IHJldDsNCj4gICANCj4gICAJCWlmIChJU19FUlIoaykpDQo+ICAgCQkJcmV0dXJu
IC1FTk9NRU07DQo+IC0JCWt0aHJlYWRfYmluZChrLCBjcHUpOw0KPiAtCQl3YWtlX3VwX3Byb2Nl
c3Moayk7DQo+ICAgCQkvKg0KPiAgIAkJICogSWYgd2UgY2FsbCBrdGhyZWFkX3N0b3AoKSBiZWZv
cmUgdGhlICJ3YWtlIHVwIiBoYXMgaGFkIGFuDQo+ICAgCQkgKiBlZmZlY3QsIHRoZW4gdGhlIHRo
cmVhZCBtYXkgZXhpdCB3aXRoIC1FSU5UUiB3aXRob3V0IGV2ZXINCg0K

