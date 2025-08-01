Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E11C4C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Aug 2025 03:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iyGM5SM3DIRczFtGSYDgIVeyiIWg1p31ZGdpEeERIYw=; b=f8jkxV+F8h5sI2IF87TjwT8L19
	BS2pzQDGsC+th2ikhoUZII14Y3HfvXiE3PFoCX9q1PShmt5e4+IDXfALPg3io/7MpTiDgtJ4qkvns
	p+He8wH3K5kQcCnFYEWC71cTKqdjulDS45eT8/xGsJIih9Hkzd+Ha/0QzdBSULwCxUXGKew70q9tG
	wY3Lm7/lvRPlVXB6ngnOEtx6lzhzH/NPv1AGO0fzLiWiAmdXqqBq5F8FqqKWwpBOjq3Eb9meYLNKs
	R/jfmlMUc6XXTaaKpK/f51HSt7ilr17wVxx+RR2GrnSSyMYIuxojyNWtXgCGAMdF7OTnAD95XQ09K
	VkRzZLcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhgcd-00000004tQ2-3CnT;
	Fri, 01 Aug 2025 03:39:55 +0000
Received: from mail-bn8nam11on20628.outbound.protection.outlook.com ([2a01:111:f403:2414::628] helo=NAM11-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhga4-00000004tKD-17rO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Aug 2025 03:37:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qNm+Qg8XRm/4xWRuRPIrlRS2c6MzSmf5d1ye8QIUaGNv8TlxH76Dci0Eo6F7/zthDTdfb6XUd11/VRSF+7SPR9QBoIQEcwuUbWULm04QLZC1RDgjgPkfRCMG1XOQhUrm3gkIBxD+9+ZUu1plYnvVOaZ9GiL1Utc7imD/Oa/5Xc3YW0JGZ/dt53YhiKyyZ8BQpIFwJjNqzu/F0Fyc54OL0NiJEEjlFcFE0W10XXR8vLLiyCj/A0kkt4l7eYaKhMMSxneYB3K84gRcPaRF8kT1/GnxAh5umDpf2FqwHNoikrM2WmcvG/P6YE6CUc1nKFDYfSdaVBApryuQxb9mqF21hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iyGM5SM3DIRczFtGSYDgIVeyiIWg1p31ZGdpEeERIYw=;
 b=IcgkPUcAZV035w72KWt8OqubWYSL7GrStxl4zOvXVL6QLi92F+4IJhabBhliY/lWfvvgtuMwBI1YN24RnAhO862TQa7jMWfF2ooKYDwMAuyg0YXxiQYwwCYvhkJCUD8PeXqhFQ0DRirvH9s2nXn37R+VPnsTIrVbk6OBHXtnvQ1sS1rvhlSRY5Kbsc/djtDuB5hw72C9QXw9ssCbUhTnxyDeFTNJ8oNovlbne9cAqMrIQmOj28dzFqz/AbRpLuwbJc4SHZifrSYL+XZ6dE0j5UWeHPxrZIQsGg6Nt8ZgJqwKeYDzPu9cMPf0EcZeiNtpx+htuqvMDFky8n7ow899Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iyGM5SM3DIRczFtGSYDgIVeyiIWg1p31ZGdpEeERIYw=;
 b=l3pomGga3h1D3cyiFpoobJnDadMJvF4PZAqI0BiyWNXFSO4XUmRZIRS2HgC3SzUlXAqTgbcwxY06NgwONXDPZyNVGIFuuZ3clumBkcCz9+05SYTqm6cSRYcCUJNoijhzTGM9120CGJnpSXas7Y32RA+ceJA6Mgmu3pz+aOzqogwEvKVa8rWf3xHS8gBXXabiWSrPDGoV7UBDYPPDf2SECBO4UtuvllKPADvAv9gQfKeBHYH9QawF1hn8L6ugykMIcl5tvTfthWowgfCrsYYrdJs4DiS1uEVTSSgZioS9y1GlgTrcEqHPcedAJv097Tuf1SGHjlqPGCan6C6X2aIohA==
Received: from DM3PPF9623118BD.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f3a) by MW6PR11MB8410.namprd11.prod.outlook.com
 (2603:10b6:303:249::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.12; Fri, 1 Aug
 2025 03:36:59 +0000
Received: from DM3PPF9623118BD.namprd11.prod.outlook.com
 ([fe80::6ca6:1077:eb18:728d]) by DM3PPF9623118BD.namprd11.prod.outlook.com
 ([fe80::6ca6:1077:eb18:728d%6]) with mapi id 15.20.8964.023; Fri, 1 Aug 2025
 03:36:58 +0000
From: <Manikandan.M@microchip.com>
To: <krzk@kernel.org>, <broonie@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <Nicolas.Ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<Ryan.Wanner@microchip.com>, <tudor.ambarus@linaro.org>,
	<linux-spi@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/3] spi: dt-bindings: atmel,at91rm9200-spi: Add
 support for optional 'spi_gclk' clock
Thread-Topic: [PATCH v2 2/3] spi: dt-bindings: atmel,at91rm9200-spi: Add
 support for optional 'spi_gclk' clock
Thread-Index: AQHcATo0qpdsN9N6RkuKfC724ixwULRKha2AgAKi7QA=
Date: Fri, 1 Aug 2025 03:36:58 +0000
Message-ID: <691cfc11-3804-4f7d-b535-ea25f86c0c16@microchip.com>
References: <20250730101015.323964-1-manikandan.m@microchip.com>
 <20250730101015.323964-2-manikandan.m@microchip.com>
 <c1230d31-cb7e-4a21-b7d0-ea32d862823f@kernel.org>
In-Reply-To: <c1230d31-cb7e-4a21-b7d0-ea32d862823f@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF9623118BD:EE_|MW6PR11MB8410:EE_
x-ms-office365-filtering-correlation-id: fec9bd2d-d103-4159-ac08-08ddd0acab98
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700018|921020;
x-microsoft-antispam-message-info: =?utf-8?B?Q1FDb1E4SGRJNDZ1MHg1YjVPK3hRbVNudU42TTZEd1pCOFJnZzVIaThvUlNo?=
 =?utf-8?B?QkQxdHZUUVZrVk4wbUNFa0RpWGNiSUtzczNOS2tPZnZ3ZkIvTDRJSktBZkdD?=
 =?utf-8?B?SnNTV1A3TlNlbFloQ3R6TjJSbDZNS0NnUzhtZHFoemFEZlA1T0FSZEtES095?=
 =?utf-8?B?L0s4VVFYeGpsVEN4T1JaU04vVm9ERjBrdUtsTTdTbkp6dkdzYkF1TllKYTI1?=
 =?utf-8?B?RmdFa2s4eW1zWjNPQWdkZHV4bTVFazRUZkk4em5pcTJiZFhRbUNmbFY4OEJs?=
 =?utf-8?B?SW1oVWZBcXV6VmpUc3ZLeFpnd0o2cE1nUXZHSG9zRWdBS2xCSHpEUC9VeUFl?=
 =?utf-8?B?UzNmM2M0eVQ2WndGTW9LWFFRUWZJNmM4ZjBzUW1vMWp5OEIzV2hybVpGcElt?=
 =?utf-8?B?cEFGak1sTFpaVmg0anBvckY3OU9SalNQaWV0V2NjSCtpU1EvK2YwUHE1M2Zo?=
 =?utf-8?B?d0huQmJCQS84bTliR3Q1aEFYcUxRdEZJdTdnenpsd21uVENIQ2ZIRVBiZG05?=
 =?utf-8?B?N0dScTZKbHR1UnZhZ1NxUGlJOHFHZG83MitOTWs4T2dhbGQ2Q3BoTFkxbXRr?=
 =?utf-8?B?M05zSXRyREFLZlYrNnJvTkZaYU9zTGtIdDJSanhQUXl6VnRzK2kveW5ZTkF6?=
 =?utf-8?B?eE93a04wRkJBOTNKenpTeW5kQ3BUUlI0TThwZVBpYXMzSGd1MCtOalI1WE9u?=
 =?utf-8?B?U3V1N2tlMEhaZWJzMmZkR2tMa0JtaDlOVnlYVkcxTE9YOWQ3ZGFWZGl6NEU4?=
 =?utf-8?B?eTQwaCtramlrL1c2bTM4cWRKSEdwWlMrelhtK2k0ME0xM3RYZnVVcmhTK2lj?=
 =?utf-8?B?R0F4VGR4cXU1ZXVUVy9sOER1OU9FMm5QQ0M0Qy9FNStNS0ZjYVAxaWZjNWU5?=
 =?utf-8?B?VGVMazRqejZhQXhvUDJ1NVBYSldONkg1QVJLWlEyczhLRFJpeHQyaWRkcG5q?=
 =?utf-8?B?am9tQVBFdThvcmdjWGV5bG94bVZraFNDWmhzYXliRVNINHlYTG5FZWN2ZVBj?=
 =?utf-8?B?WTdLZ2Y2YStZV09Ba1BSRjU3RFlraEc4L1V5T0pkaVp2a1FNdFc5OVk0QXJs?=
 =?utf-8?B?bnBnL1M4OUNFZml1SmgzWExkdHl6VDFlTnFHbEQvRjFVSk92aEYyUTV5TW9u?=
 =?utf-8?B?aDgrY1VjV1JXclJKSUtURnVxZGlDejZ5L1lLU2dRUU1zY1Fpb1pSQzlaenBi?=
 =?utf-8?B?aGJZV0pFNS9zUlF5VWNjT00zdlFRejZIYlYxRm1yNGdac1FUNTB5VGlvLzNG?=
 =?utf-8?B?aWVKeFIreUIrT0dabDNyVU5FNjVuQ3Ava1BCdERqdDJpV3gvdTNDcUl6YWwz?=
 =?utf-8?B?VGxGZCswYjdsSmdTRmNvZDFZNjlpajNRNExVRmVseE9mTVdaZU1jSnoySVZB?=
 =?utf-8?B?K29aQnNjQzJCcEprdUUxTjVIWnZZRENiOVZnanM1Y0hBRDRZK2s2RjJpVjJy?=
 =?utf-8?B?bUdQc3hZSVo4Tlg2Tmd2TzlBYnZ1MFVCWndiUlVkTHUxY3V5ZDkyU2xPcSs3?=
 =?utf-8?B?VEZhVlY1T3Jsd2hBTXhYdUZaUW02SWNac2JKT3RrcUdEbnVid3AxUi9JZUQv?=
 =?utf-8?B?aVlxK1lnWmtFOFJkNS9XOXN2WnFWQW9obnRHUEZGbXVwZDJveHYyL3pQdTNV?=
 =?utf-8?B?WE9SZ3BmL01JejUvWFhOeGxjaFNDcmx5bFF3a1R1VG4yZEwzU1pCajNUcW5a?=
 =?utf-8?B?WnZyTTY4bm14cldYdzJoV05qMW91elpVSk9lL2lkV2xUaWwzMVdvN01EZndC?=
 =?utf-8?B?Qm9URzlQYlArRWJ3RVhGUEp2WE1yTG9HejB5NTJEZjF1WUYrWVUrMnJWZHFy?=
 =?utf-8?B?d1dOQVRwclhhYkJIUWVObFFGNm1SdmMxd3B3SW5zVlJDOXVJR1gxVkNJejVz?=
 =?utf-8?B?bVVQSDNmQ3QrczNUTmgyVVNPZm16YVRUbm1rNzJ5VkJjMGIrbXdlMWVBeWR1?=
 =?utf-8?B?SmMvemp0L3hsdmtQZUkyVEVVSlRZdUoyVThHSm5iMDJOOFZhZ2Q4dllZZWpv?=
 =?utf-8?Q?Zog/FI8XUlEx7N9C0FhC4TdPANmtwU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PPF9623118BD.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NmU2UDNDOElZS3MyYXY2QnNpWkZKYXR3cGpkOEMrRFJhVXY5ZlVIdnFleXlN?=
 =?utf-8?B?bEZVWG5ZalEwaU04ZEFwdEp5bzFUNVMxNUNobzlGUTl4NXZFSXNmN1V5Sk5i?=
 =?utf-8?B?aVYrUlZCeUpWUEZCYlNLbm9HMXhvVnY1eFNrNHcwcGpieHRSNjM1aGp6Uk4v?=
 =?utf-8?B?R3VIZFludFEvSlFUNVF0VmFaMEZacE8zQmRKS2FzcGFpQ29hb0lSdkdUSHpM?=
 =?utf-8?B?Mjcrd2ExZFdPQmQ4c0kzUEpQWWhsUk1aSVc5Q0F1cGYwbWdLb0N6UVFVVnZL?=
 =?utf-8?B?c0hnNmVheGV0WTNkNUk3c0VGaElHVUhYYTdSN2xKVmY5VndEVTJnQU9lbkhv?=
 =?utf-8?B?a3pjWWFOU1A0RzdocDEydzk3Zmg0RjAxcUVEbHhxcm5mdXNYaFNpaXF3Zitt?=
 =?utf-8?B?TFFUS2dPREN5aWw5dkZuVFVlY0FNVHRiVFlDc0c1a0RFZDZubUo0RFp5a0xC?=
 =?utf-8?B?M0t6cERKdWQ1RDlZcEhkSUNhOE1Fd0dXQjdkaFBGdm54YitiTFFTTmRwTmVM?=
 =?utf-8?B?SGVpYlAwQkhoMndEeGVjeExaTlh2eStERGlGN1JpdStxenAzOU9wd2xBN0c4?=
 =?utf-8?B?OW1VM005d3RQOUpGUVVOWEhjMWNYMGNIWUhLVWlRd3dYSTkzdEttZmtwbnBN?=
 =?utf-8?B?b2UwWjU2bXZYdEJtZlk1OVJQd3Q5RGVYQ1JsVUJjUTVVQWQ1c2l1amt4SEtx?=
 =?utf-8?B?VmhpYTRaL3YrNlFNeS9nRVBuTnhiTVErS2R4UXhsUVQxYllMR0lvTkhQY3JJ?=
 =?utf-8?B?S1F6VkRHbEJIUDVFTVRLTWZWeEZQQVhSaDhMTVVXT2p5WExSV0J3SG1OVyto?=
 =?utf-8?B?US9pMkNVVkhPQTdKbjJLVjRFaVZlbCsvejhFR2Z2cGI4RkgySnF1ODlZZHlI?=
 =?utf-8?B?eUo5ejljdGRGQVZvMmFQUWZqQTFMbGdjSmE3bzUxUkhJZytNcHBKQ0FlNU5F?=
 =?utf-8?B?Q2o3YUFYcENOZUN4REdhTXo3eUYyaHQ0Z2lUbmpFK0Z2aXo2cW95b2lpbHBp?=
 =?utf-8?B?eCtKMFhLelBwdERwbEdZT25SR0Z1RGRZY1JmT003aWd6bzNUNFdsQS96a3I0?=
 =?utf-8?B?dS9qazMyQlJpZ2JpSitoSllSd0JvWkJaeHY4L2Q1MHU0cGJBVUFHdHczRUMz?=
 =?utf-8?B?MVlEZHNtR0lWQWYwRmRvbENrd2JtRmdxWnRURkxiL0FaL2pYTGhSaEwxdGQ2?=
 =?utf-8?B?MjNYa21VSzd2TGlKVm40ZnA4UUZBZCthZlpSSllsR0YvZGEvQkVRa1M1N1Yx?=
 =?utf-8?B?SlZFVWRzczQ3UDF5cCtxOHBJTTNEdlBvdlJLR3FGanZJZWpEK2ZFOEQ1aUlr?=
 =?utf-8?B?TFNmS2hJRGc4MEJLS1dFejRwMFBydThROWpvL3RoYldjb1ZkM2YzZ1JDSlNF?=
 =?utf-8?B?dDJ6bUhRUzZoa3QyMVFFQkd4YnpwUlRWdGp6eWZ3NXFhRHNLYkc0OHhzeWRj?=
 =?utf-8?B?ZEN5K3VKOVFCM3YwWmtsZEI1MG5HVzllNlJLUktPSmpXZkxxZUFrSmVzblNX?=
 =?utf-8?B?VTF5cDVjTUt0ZWpaem1ucGx2RDN0RWVPY203ZXRIRkRKb242VFIrQyt1am1m?=
 =?utf-8?B?U1M4aUFUbk1HcnEyaEdvajYrYVlLS2dZbHVUVkNoTnF4R21rK3JLSXBCVzhD?=
 =?utf-8?B?TmJOMzlxRVpLVHA2MzNxQVdVbS9sdDZJRkVhYm1jOVFiQkpoZHMxRWo2Z2VS?=
 =?utf-8?B?aWI5ZnJabXNTbWV5dEx5Z3hHTWRLODc2VnMyVk95a2lxeXhGVGxTOEowL0VO?=
 =?utf-8?B?VHp0elltK2EyV2kzRXdVWEcrSDhhVHNJR1RiWkdwbHIvYWwxOVVnZ1lwbmRV?=
 =?utf-8?B?Ky9xZkNQcmYyZ054TXNYYkZpRGxDOUVacTBXSkIrL0Q2WmtndDRpaVBSRE9y?=
 =?utf-8?B?Wm5PVms3MElrSC9HUVhJVVRoSjIyYmZjK1ZteDNlZk1tSzNUTHhlOUtwbGpL?=
 =?utf-8?B?K1NIeTNYb2drOUQyVUJ0Z1ZnbnRWZnozUlhzMDhSUDcxZlorOHplcTd2VFpv?=
 =?utf-8?B?U1MxRWxKT0VSQllGRmxmdXNuLzVZTmxzMjMrRzlRWlB2Nmk1VXBzMjFJRWdy?=
 =?utf-8?B?SkNrT2JpUER0bUVOZWN2bWxhTFcrV2NsMGV6eDE1VDhlZ0NPK0ZwOGNLN203?=
 =?utf-8?Q?faiufuF62QJA0kKRM5yQbYbWe?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3DE651B4F07EC2478FAF0867FC6E2BFD@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF9623118BD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fec9bd2d-d103-4159-ac08-08ddd0acab98
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2025 03:36:58.7787
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J9LCGwRBA0RsuYE7Am7kJsbJFjgM5kq3PmQfOBVIQR6zKrElNjt2iKUCgR58OkqLrh6fxDCmUPWliQeA/AAQl94yS4LxP223tAwBz2eWx4E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8410
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_203716_298868_7CBEE8B4 
X-CRM114-Status: GOOD (  15.45  )
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

SGkgS3J6eXN6dG9mLA0KDQpPbiAzMC8wNy8yNSA0OjUxIHBtLCBLcnp5c3p0b2YgS296bG93c2tp
IHdyb3RlOg0KPiBFWFRFUk5BTCBFTUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0
YWNobWVudHMgdW5sZXNzIHlvdSBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUNCj4gDQo+IE9uIDMw
LzA3LzIwMjUgMTI6MTAsIE1hbmlrYW5kYW4gTXVyYWxpZGhhcmFuIHdyb3RlOg0KPj4gVXBkYXRl
IHRoZSBBdG1lbCBTUEkgRFQgYmluZGluZyB0byBzdXBwb3J0IGFuIG9wdGlvbmFsIHByb2dyYW1t
YWJsZQ0KPj4gU1BJIGdlbmVyaWMgY2xvY2sgJ3NwaV9nY2xrJywgaW4gYWRkaXRpb24gdG8gdGhl
IHJlcXVpcmVkICdzcGlfY2xrJy4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBNYW5pa2FuZGFuIE11
cmFsaWRoYXJhbiA8bWFuaWthbmRhbi5tQG1pY3JvY2hpcC5jb20+DQo+PiAtLS0NCj4+IGNoYW5n
ZXMgaW4gdjI6DQo+PiAgIC0gRml4ZWQgbWFpbCB0aHJlYWRpbmcNCj4gDQo+IFlvdSBhbHJlYWR5
IHJlY2VpdmVkIGNvbW1lbnRzLiBSZXNwb25kIHRvIHRoZW0gaW5zdGVhZCBvZiBzZW5kaW5nIGFn
YWluDQo+IHRoZSBzYW1lLg0KPiANCg0KSSBoYXZlIHJlLXN1Ym1pdHRlZCB0aGUgc2VyaWVzIHNv
IHRoYXQgcGF0Y2ggMy8zIGluY2x1ZGVzIGEgY2xlYXIgDQpleHBsYW5hdGlvbiBvZiB0aGlzIGNo
YW5nZSBmb3IgdGhlIGJlbmVmaXQgb2YgYSB3aWRlciBhdWRpZW5jZS4NCkFwb2xvZ2llcyBpZiB0
aGlzIHBhdGNoIGFsc28gcmVxdWlyZXMgYSBicmllZiBleHBsYW5hdGlvbuKAlHBsZWFzZSBsZXQg
bWUgDQprbm93IGlmIEkgc2hvdWxkIGluY2x1ZGUgaXQgaGVyZS4NCg0KPiBCZXN0IHJlZ2FyZHMs
DQo+IEtyenlzenRvZg0KDQotLSANClRoYW5rcyBhbmQgUmVnYXJkcywNCk1hbmlrYW5kYW4gTS4N
Cg0K

