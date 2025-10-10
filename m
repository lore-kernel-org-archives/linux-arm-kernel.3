Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4179ACCA476
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 10:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=huGH1EAm2+Ua8bm0Twlji4mWZuJuTbXxKuNAF/Ff7Os=; b=LUx9/HRQUDvGSJT+Ia1W5w7llt
	eWO49dd3WbZeFrLOQ/vngEFuQZntjw63HI3GJ4m/5vfBhFKwqDQQSPeJbpVQTnKqQJMdmeHQERJaz
	faGzb/z3rw7z3vD3UdQzvrQESEUUFKKTZNe/7tKIVf8YcglTl4Gkx/b9VLs3XLsxAvqtMnGfG9180
	gQXARmUvnJs0TqPeUin/d2VtEIbL3eB4KJ0/YRWk5XpN0CCNha/NnaboGAX1NwWeEedXY5/JRTdjf
	8AeXc0THGQjfeZ7uNh9qQ8+LOWM21TNabE9LNZtHccRazogyaK29APS/+S+cksTKl+vwwm8pdzuKV
	an8KnWqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7A62-00000008EJM-0PzE;
	Fri, 10 Oct 2025 10:11:34 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7A5z-00000008EIT-32Cp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Oct 2025 10:11:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E/GqrT1eSp33hqX2zRAKLlU/uULSt/1nhzN0NA0nRgo608cV0pnAFFIfzsBx4w2eDq3NK0Y73of/9VAaS6Eqxljnlw5CmBSToRJIn5w6J4ZJOFl5kN2uq5eNijojleLV96irzFivtDjm+YEHYtID9KGVStdH1aeEfQv7YYasOHPYyETkhdfHLY1y9tWz3sjCFRdQxGLO60qIRchygh5M80CxoX1za/yL+subYggTWq0PasBNusDrtjA0yiZiwF3qybBlrWcB50hnxpm1TAGCTV8x7mSqn+5sNeizRPw9+RVWMDpniduLfo567EeomXSvJZ07lMg9PkBEM8GBOHzUaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=huGH1EAm2+Ua8bm0Twlji4mWZuJuTbXxKuNAF/Ff7Os=;
 b=Mo9ByUSlTZnWtBd8nREpq0vP0/DfHkbFHv6nrDWeT19z0ZAHE6vao92dwB39t8rN/v5K7Zm7uV4YH+VkC1ER5sJS6hKCbmegW8rXozbaGyLAqArWze3jFjyfoO+1UW8Gm3TR/ZfbnugttdAbepGR/1UfmIc+Bcr/bWgxYu2/J3xCoMoIk9tAFBh98fJuF/xjn6TxrYK+WlRxH/4cXQrAuODJzl/TSZGikoeoGHP1F3yDLiPA2DvUc+IMclksUAGX5So+yfXVnOaBhSZ0LUn4VzbJ3XZf1rtWEEjBxGadmGUh1DpYEEzRyljWyJaJxd40M6phBdsS93RiC6q/jeL2YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=huGH1EAm2+Ua8bm0Twlji4mWZuJuTbXxKuNAF/Ff7Os=;
 b=bYKc7bHAMpIhoaOqMSFyGoYALcwA9DjNnqaE2C8TJN8L9MXX+xUUfvUoRu5s9A0yBg/o8/iMKyDlUasnyEEMfAdFXnhcBe3hPzDdb4pvx3xOeuTSggM74pzw8rRUPE6pCX6tGINir/RZl3nfSdFtor5my5XV/Bws7C9WtO05cmD+DXR5MNdbrWFZ3HzIWaCcrMSqlJgCc/PMuKWu7MwQE0usQPe5L799Zj0uaxPMpP1x5PTmR+E4ST+nM3adtTYVXnXejFR/G6u3+RNYVbVfBO21F2io3JC6xuf52bJFLj6NO12xm4zxRxd4pYZ/H82sENU+qD14PqPkfBamgwHP7Q==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI1PR04MB10004.eurprd04.prod.outlook.com (2603:10a6:800:1d0::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Fri, 10 Oct
 2025 10:11:22 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9203.007; Fri, 10 Oct 2025
 10:11:22 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, "Peng Fan (OSS)"
	<peng.fan@oss.nxp.com>, Kamal Dasu <kamal.dasu@broadcom.com>
CC: "bcm-kernel-feedback-list@broadcom.com"
	<bcm-kernel-feedback-list@broadcom.com>, "andersson@kernel.org"
	<andersson@kernel.org>, "baolin.wang@linux.alibaba.com"
	<baolin.wang@linux.alibaba.com>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "linux-remoteproc@vger.kernel.org"
	<linux-remoteproc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 1/3] dt-bindings: hwlock: Adding brcmstb-hwspinlock
 support
Thread-Topic: [PATCH 1/3] dt-bindings: hwlock: Adding brcmstb-hwspinlock
 support
Thread-Index: AQHcMugSlX0NQVdX+EKxCZGUaCh90LS7NjXw
Date: Fri, 10 Oct 2025 10:11:21 +0000
Message-ID: <PAXPR04MB8459EA8EADFFC0C6C72F184888EFA@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20250929200628.3699525-1-kamal.dasu@broadcom.com>
 <20250929200628.3699525-2-kamal.dasu@broadcom.com>
 <20251001025817.GB23170@nxa18884-linux.ap.freescale.net>
 <68e10834-0c1a-4cbe-be0b-76e17f8341e0@broadcom.com>
In-Reply-To: <68e10834-0c1a-4cbe-be0b-76e17f8341e0@broadcom.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|VI1PR04MB10004:EE_
x-ms-office365-filtering-correlation-id: 8cbac741-dd41-4bcc-d9e5-08de07e55ce3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|19092799006|376014|7416014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?N1g5cjNVRlBtd2UxZDNCa0tBTjNjMUNiV0s1TklzTEwwOU8yY2hNQkNyMUQ0?=
 =?utf-8?B?bmFZQmRyRVo4OWtlZzRMOStHVWJBSWdmR25GK0JJdXBYajJadFd6OS9VUjh0?=
 =?utf-8?B?TEp2Uks3aitDcncyMjlOQkRMVDQzbnE0T0ZPWFRYWGU2OHhWaGppbWRVdkNp?=
 =?utf-8?B?d0ZTSm1iSkpoUEMzSW5wVXBmY3ZFaWs3MUNkZ3ZvelpFQm12WXZxWDVaZ0J2?=
 =?utf-8?B?SWJnK3JkN0pSSjZQdUttekdXN0FZaEZFQ1lqOWsyL29WbXBBeXIwZldrVEtT?=
 =?utf-8?B?WkwxUEZWMUlNenp2OHNuVFlMRnk0c0lmS2xCZ1lsVitSZnlPMUxFWTJqUmRN?=
 =?utf-8?B?elF6SjF4dlllTmJOVGptVjFxTmdaL2ZTaktQUFdleEpDbGhRdHFOZ0x4UTIx?=
 =?utf-8?B?bVhQSmRFeHJoQ2FYbVRZb0NkL3JlMVFjdlFPWlFYdndpcUltZm9VMVNRYzRW?=
 =?utf-8?B?K2Y0MnA0N0YxVHlNRElZazVoYktrNDRrL29kUVc2SnZNRnBYSlUyK3FSbWJy?=
 =?utf-8?B?VjRFN2hqQ0Y0aWRaanBnZWlkZVJTeDBhdU9EUWpxVEZ2U1ZERFNCVndva005?=
 =?utf-8?B?QmZsSlUxWkVveWpLTFZQWUw1YS9CR2JCdU1IWHc5K3FZV2ZqTXJjM0VLVERk?=
 =?utf-8?B?aURYVXN5WU1Jem5RZW9WSFBVWkx1cDhJRFp0d3ZydU14RnRDYVphejJMbmNo?=
 =?utf-8?B?WmVZRlpaTHhHU3dwRGI5YXdyeERJRDNxYlY0MGFTdnFXUHpSRzlkbFRuem9Z?=
 =?utf-8?B?bi9Vb0ljQlcra3dZZVMyRFNXWFZ5WS9rZis1QTRkZjIvSU1yelAyYXFJNk43?=
 =?utf-8?B?UHN1UExJcDB5SzZWRWtOMkhyeW9JRHFxaldPOFE4K0FhMmlLMW9Rc2Vreksw?=
 =?utf-8?B?d0I5REFUS0FSbXh0dmVTb0dGWmZhNFhrY20wMnJ4TjlUcXpteU5td0xGbGds?=
 =?utf-8?B?Y0lzUmhhcHppWEo4dHAzYlZTYVlxaGVZbFVPMVdiZlh5ZE8wTzVUR1lqWlM4?=
 =?utf-8?B?TUZnU3pPSEpVbGZySUhHZEsrakx1bWowM25jZ2oxczdFT1UzL3A0ekxHWUpm?=
 =?utf-8?B?QkNJT0laMFVyeUJNSWNqS3JiSHNqQWkyeS9QdmdSRVpXZHlSUi85YkN0OGFB?=
 =?utf-8?B?dGRETGRlUVhTUlhDbVZNTng1SU9QYTdrUkp3ZDRyVEdWbTFVY3RQWnYxZUFR?=
 =?utf-8?B?Y0hRZzcxTDVkaHJQTTdISEQ2RDB0a1dKN3lSOWtZOUFnRFdpZ0JiRi9zcHZI?=
 =?utf-8?B?M2RlbXN5QmpwSG9kdWlBMXVJbkEvWHpTL1VTZXZKQ1M0UHZHSitRWjVoQmR3?=
 =?utf-8?B?S3VQUkNkT2o0K2xXUnJZeC9BdlBHcEFKd3N4cEh0OEpzWHFMY1BoK0Z3aEUw?=
 =?utf-8?B?Tm9sUUtxcHZYaUN5cjdzYkNRaHVVVUo3QzJoSTFudDJRQStHTGx2aDFCMmNO?=
 =?utf-8?B?Z2F4K1g0S21PYVNvQW92dEEvQkVZYkpYZXNjaFMxQ0VYTDJGdTFJMlVQNlhZ?=
 =?utf-8?B?dVFvRjhSRW1ra3o0UStCTWRHZlAxaVpaNGxjTERXVzBteEpLQ3Z0eHplK2VQ?=
 =?utf-8?B?ZkczSjhqblB2VlIwZVkyN2FqM0xkZXAveDJGTjF5NVJ0WWJaWlVyMXZEMlJE?=
 =?utf-8?B?Vm4yNG9ncXA2Ykk0b2NIREs1WDMzM1hvM1RoNWE1N2cxZE94MlRkOEROZFVU?=
 =?utf-8?B?ZUc1UCttTm5Qb0prRGI1OC8ybmdkem9NeHpWOHQ5ejcrblJob3VPYkRocUlQ?=
 =?utf-8?B?WkcxaG9LcnFBa3ZsK0NVWDk4TU1NNE44aU1mM2dmYm1UOEZ5VWIxdUFRYXFo?=
 =?utf-8?B?Z3hRa3BpUDVCZENoT0VpUmxyZ0NHdFJnT3dUeWtxQWRuSjhhS1VXaSthdzMw?=
 =?utf-8?B?N09NWU9yeHduTGZJeVcxUHFIblVWS2xGRXR4aTQ3UFQxelVFcnVqZnZCQzBk?=
 =?utf-8?B?NUEwVG9ENnBGbVEvZjNBQThOVi9GYlg0UWhmOEZzWGdNWWRDaFhzb3luWnIw?=
 =?utf-8?B?TzdIKzJmRUZGU240YThSMklLaHBqMVZkenZPRVAwOUYvUzMySHkyTVMvd3gw?=
 =?utf-8?Q?lwGzdb?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dG1xY0QrZ00vQWZGWk9za1pnSGhVNlZIMGlwdlpudlZKWTRQdm1RektudTlX?=
 =?utf-8?B?bnVjT0JFc0g1Y0FNc3djbkJjWEJZUHJKRHYwVGd1bTBzQVF6blc3cjMwWWZR?=
 =?utf-8?B?SHg1Sms1bVZyTzVYd2hOaG5Fc09jeUJTMHh0YU5ra2ZiNG9PWklKOXd6Vzhw?=
 =?utf-8?B?RE4wamFqSGRoenRFcFMxQ2NkRDJLUVVpRjNRdHl5eTJ0YzlCTkpXUkNzQ3Fz?=
 =?utf-8?B?K0h3blN2UWZaU1ppaWc2RWZtU2tjVCt1eWttOW1yOXNGNHlzd1NEbzhmR1VZ?=
 =?utf-8?B?eXNKN2toSDQvYlk3Y200WnZhRnVDWjlLSXhUUExLQ3dDcCs3Ulp2dmZCeEhB?=
 =?utf-8?B?alZKNE1rN1VKQTRUYkhCZk1CVE5SQ1luR0JiZEswcEJmL1RHam1MU0laOGN2?=
 =?utf-8?B?MUh0V3VoUkFtd3N3clBuSExhWkhiRzdqenRybEdMNE8zZ1ZwaS9wc1N0dkd0?=
 =?utf-8?B?Y2p2U3l5eVBpRk51ZzRTa0tLWklTUzAzNU1BYWI2QTVKb25id204bmRtb2ti?=
 =?utf-8?B?UXcxeTNHRDgweHZVVFRNdThOQ0NlQzlXOGtVL1pqRHBlakpVUzU1QkZZMDFj?=
 =?utf-8?B?cnRJZjI4TzBZQWRCbkhEclNudWZPajNDV0t1OGpmV0VNb0dMQjRoUE9GZ05i?=
 =?utf-8?B?OWEvbEpKTmJnZlJMSXpEMnQ0d21kampWcldRQzgxQW1ESGd5SGtDMVllVGNF?=
 =?utf-8?B?bysvbzhaS1MyTDdNY0I1TUgxVUFXd0hSR2ZHQllsK3VxYmlJU3JxRE5Db3Vx?=
 =?utf-8?B?WGJjTjFMR2t1Y0psTHhFaFpXNWkvMmVGQVRHRkNsc1JTOTJzK3IvcUQ1d0ty?=
 =?utf-8?B?azZRYzNRdDdsa0RVNnlCNFMxcFl2U2ljV29DRWVKQnZQeDllRGRHUWRLUE5k?=
 =?utf-8?B?Nk5KNFVXY0g3YVF2RWROTzVIM0ZOT1dSMXBIMENvdkdIMkVVdE5PcGNjM0dp?=
 =?utf-8?B?cHhSTTAwczVCU1ZXWTgwU1Z0NXhPcWJoZjMrQjkvb0Fud3BZdmpQOG5zK0hK?=
 =?utf-8?B?WjA2c1IzajloT01PRUE3L2pnQVlFOE5aeWpxb0ljOW1UeXk2ditaOWt2MFQz?=
 =?utf-8?B?bE45bDcyVTM3SWZqZFl4WHcxc1lHclFUY2w1bjFzWVpnUFl0SlpvZU9yNlY2?=
 =?utf-8?B?MmtKeGJTTlZab05ONUNvTGlPUlRnZGVFQkEyWm9zb3NZbjJWMjIxOFVTN1hX?=
 =?utf-8?B?ZkhNVS82akZyYmJEeEUxcDlyRmx1djVnN3E0TTFRWlhoLzZtaFp3dkp5dGg3?=
 =?utf-8?B?bDF6dmVHV1JWc1I5OXZtcmVVUFNDUmZsVlErR1NHT1VYMzdlVGRWMFhBeWQ3?=
 =?utf-8?B?L1U4YVFaUXZjRXBoU25IanhUUGh5d21wQ0lPUkF5UDB1TUVMWThsUTYxTE1Y?=
 =?utf-8?B?TDNHdHRwTmV2bjlHZ256SnZvRThKTDQ3T2tDZjhoTTJnWm5uZkRJTkNUN2Mx?=
 =?utf-8?B?VXdkZWdnSjd4amgwSytFeVhZcElNUWNVcnRVd1hzdFZWb29ScGxhYUxMQVE2?=
 =?utf-8?B?VjE5dWV1b3FEMVQ1aG9YMlJqY0JpVk1NY3p6WWgrUkswNUg0alNLdkVtVDJh?=
 =?utf-8?B?aHhyZ2NlT1RkTWFQUnZNU05DTnlTK2YxWW1Tb21kK3JlNk41WmVvZHlRMEFQ?=
 =?utf-8?B?ak9kODBqODJjYlRhOCtURHk5VC9lcHExNkFuQzdpUERUcUd4blU1Rm1VNHg3?=
 =?utf-8?B?RTZxWndMbS9wRnJoNkhVYVlSUVovL1BDR3J0cVZ6ZTNDbENKcXhTdllpdnBk?=
 =?utf-8?B?SGRnRy9iRmxDSFN4RHRhdDVlaU85RitKcDJDN25Fdy82QjZTUDN0SlFieEpx?=
 =?utf-8?B?TUpCdDNxKzFkQy9rM0NUdzJzUzZEWlZnY0tRM3RKQ2NEOHRjSEtjNDhLSDBp?=
 =?utf-8?B?ZTl5RnVDdnE1MTFOb3hLNmZVaE8yMEJDYTlQeDYySTJZQWRlL2I3aXZyelAv?=
 =?utf-8?B?T3dWam4wVE82d0xxbEoybXAyNkdZUzRwOEdNT2ljY2xscWd5VEloVlZuUnF2?=
 =?utf-8?B?VUpvbVR1VjJXK1RoODdwQXRIdlZLZ2pwL01NTUxFYUpWM2JSdUs0bnJnaTNL?=
 =?utf-8?B?cldZUkJaRWtiZFg3Vm5sTFVBYm83ZjcyVFNJQVJXSGtjc1h1YlZqNFdxMUpO?=
 =?utf-8?Q?KeC0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cbac741-dd41-4bcc-d9e5-08de07e55ce3
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Oct 2025 10:11:22.0403
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0Hd4hMKcMJzGdUVRmfKVrQD2c0p20fVOV44OZ5JpG6CcwViOd213CwGzwUlmxaylfxq8p6+dvgPqZpejITgJiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB10004
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_031131_920856_9A20B270 
X-CRM114-Status: GOOD (  21.96  )
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

PiBTdWJqZWN0OiBSZTogW1BBVENIIDEvM10gZHQtYmluZGluZ3M6IGh3bG9jazogQWRkaW5nIGJy
Y21zdGItDQo+IGh3c3BpbmxvY2sgc3VwcG9ydA0KPiANCj4gDQo+IA0KPiBPbiA5LzMwLzIwMjUg
Nzo1OCBQTSwgUGVuZyBGYW4gd3JvdGU6DQo+ID4gT24gTW9uLCBTZXAgMjksIDIwMjUgYXQgMDQ6
MDY6MjRQTSAtMDQwMCwgS2FtYWwgRGFzdSB3cm90ZToNCj4gPj4gQWRkaW5nIGJyY21zdGItaHdz
cGlubG9jayBiaW5kaW5ncy4NCj4gPj4NCj4gPj4gU2lnbmVkLW9mZi1ieTogS2FtYWwgRGFzdSA8
a2FtYWwuZGFzdUBicm9hZGNvbS5jb20+DQo+ID4+IC0tLQ0KPiA+PiAuLi4vaHdsb2NrL2JyY20s
YnJjbXN0Yi1od3NwaW5sb2NrLnlhbWwgICAgICAgfCAzNg0KPiArKysrKysrKysrKysrKysrKysr
DQo+ID4+IDEgZmlsZSBjaGFuZ2VkLCAzNiBpbnNlcnRpb25zKCspDQo+ID4+IGNyZWF0ZSBtb2Rl
IDEwMDY0NA0KPiA+PiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaHdsb2NrL2Jy
Y20sYnJjbXN0Yi0NCj4gaHdzcGlubG9jay55YW1sDQo+ID4+DQo+ID4+ICsgIC0gfA0KPiA+PiAr
ICAgIGh3bG9ja0A4NDA0MDM4IHsNCj4gPj4gKyAgICAgICAgY29tcGF0aWJsZSA9ICJicmNtLGJy
Y21zdGItaHdzcGlubG9jayI7DQo+ID4+ICsgICAgICAgIHJlZyA9IDwweDg0MDQwMzggMHg0MD47
DQo+ID4NCj4gPiBKdXN0IGhhdmUgYSBxdWVzdGlvbjoNCj4gPiB0aGUgYmFzZSBpcyBub3QgNjRL
QiBhbGlnbmVkLCBzbyBqdXN0IHdhbnQgdG8ga25vdyBpcyB0aGlzIG1vZHVsZSBwYXJ0DQo+ID4g
b2YgdGhlIG90aGVyIGlwIGJsb2NrPw0KPiANCj4gVGhlIGFsaWdubWVudCBpcyByZWxldmFudCB0
byBkZXRlcm1pbmUgd2hldGhlciB0aGlzIGlzIHBhcnQgb2YgYSBsYXJnZXINCj4gSVAgYmxvY2sg
b3Igbm90LCB0aG91Z2ggSSBhbSBub3Qgc3VyZSB3aHkgeW91IHVzZSA2NEtCIGFzIGEgY3JpdGVy
aWEuDQo+IE91ciBIVyBydWxlcyBhcmUgdG8gbWF0Y2ggdGhlIGhpZ2hlc3QgT1MgYXZhaWxhYmxl
IHBhZ2Ugc2l6ZSBmb3IgdGhlDQo+IHN5c3RlbXMsIGZvciB1cyBpdCB1c2VkIHRvIGJlIDRLQiBh
bmQgaXMgbm93IDE2S0IgYWxpZ25tZW50Lg0KDQpTb3JyeSBmb3IgbGF0ZS4gVHlwaWNhbGx5IGFu
IElQIGJsb2NrIHN0YXJ0cyBhdCBvZmZzZXQgNjRLQiwgYnV0IDRLQiBvciAxNktCDQppcyBhbHNv
IG9rLg0KDQpUaGFua3MsDQpQZW5nLg0KDQo+IA0KPiBUaGUgYmxvY2sgaXMgcGFydCBvZiBhICJz
dW5kcnkiIElQIHdoaWNoIGhhcyBsb3RzIG9mIGNvbnRyb2xzIHRoYXQgZGlkIG5vdA0KPiBiZWxv
bmcgYW55d2hlcmUgZWxzZSwgZm9yIGJldHRlciBvciBmb3Igd29yc2UgKHBpbi9tdXggY29udHJv
bHMsIFNvQw0KPiBpZGVudGlmaWNhdGlvbiwgZHJpdmUgc3RyZW5ndGgsIHJlc2V0IGNvbnRyb2xz
LCBhbmQgb3RoZXIgbWlzYyBiaXRzKS4NCj4gLS0NCj4gRmxvcmlhbg0KPiANCg0K

