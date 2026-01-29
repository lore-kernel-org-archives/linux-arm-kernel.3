Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E709D46BF0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 01:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/3Mc3YY8ck7bX0v6KQY+s1dEuUDllzvG0J7UXVL+Du4=; b=myjSlUICyYXW2Aga0TgR7ROeiz
	StRkhrBOtXPvA3GnbEMzZ9ivTdMZ5P/mdsZqGfGCOxkiGuPElRhMQViJWNDY6aeGkzwtCSjnEj34+
	LpSZ/IAW9mpQwnM9G3fJRHWSVI8XBVisC/jWacLCo1Ex5/x4wFdpxVYOXOSVlw5Hy1MvDex4h18Ul
	8J2Ow9xijNyCxCoivLN2Wa9mZNwKV/ncr8PniXn7yPco7VJrOK9qcZS9sA0auCnEWcoUQ3DHg6l8Z
	tYdmGH7IQI8tixHap9bqWQ1JrN7hC8uXCtwmBI2cA30ejJvzdaeOF1vfy7644yymPJdyKeR2tnC9A
	XyTc8xEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlGo7-0000000H3Vn-3YtK;
	Thu, 29 Jan 2026 01:26:51 +0000
Received: from mail-koreacentralazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c40f::6] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlGo5-0000000H3VK-1nca
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 01:26:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QilN8MQHH9ayn02GUrfVf9i79NowtjJDfWhDxub+NKs9gKYvp4ss1cCdm8dwyikxt8wznLaBvJfiqZicd0hCtzcgggZdjYwa7I6UfWxHfApCEFARcPVQRspWt3W/ddKrdZoblOXIeEuf1iWuJhoR+a4TTpbTjtyEhy8JWexnRFIa/yZ7C7oVgEmvYtHPdcfwAaUTtWgaGZxQrhQc3dYd91J7L3Pb8jFlZzWDicP1CdbCnOV+gHfmB5mj8UkYvXYqSUAeVMKGK7CQTjgaVNBnRWqf5hVEcVrvQF0xi0GqK6kD05+0Fw0A/rbjtQXzCK7OOPSJMZ4EF3MFw0SP5s3Zzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/3Mc3YY8ck7bX0v6KQY+s1dEuUDllzvG0J7UXVL+Du4=;
 b=amKojBvn56L0HpEAfwPwjhUVHXYd5TqsrATCKNXu27Ad+1ltLeKdFfB/RzaVLbTbsfkpF06Aeqxs2pTs8LiwU3P2+5JBlRoAWyLeN9CsK3myzNl2KH/pbHAEkpfdFH8bjMu7G3S1WnD5vY5SYpKVUJunnFH/SSV8W7W/zJOXHybqtK6UPKiHVkwvlax9hq50XUeni7bG3CPvuijpcpOnogvrpTdMURoB7Bmwai0lEl1B+e5YOrS1NrE4gogrBcsJl979abK8zpKxKv4MQbBM7OS6Ei4Jx+zuKCl8hKWVJE4VEN8ceLyE45LjtME4n+wXAbH3TjpzpQtsU8y/FU3ZdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from TYUPR06MB5876.apcprd06.prod.outlook.com (2603:1096:400:35e::5)
 by KL1PR06MB6556.apcprd06.prod.outlook.com (2603:1096:820:f1::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Thu, 29 Jan
 2026 01:26:41 +0000
Received: from TYUPR06MB5876.apcprd06.prod.outlook.com
 ([fe80::6718:b716:70e:9b32]) by TYUPR06MB5876.apcprd06.prod.outlook.com
 ([fe80::6718:b716:70e:9b32%6]) with mapi id 15.20.9542.015; Thu, 29 Jan 2026
 01:26:40 +0000
From: Gary Yang <gary.yang@cixtech.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, "lee@kernel.org" <lee@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, Peter Chen
	<peter.chen@cixtech.com>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, cix-kernel-upstream
	<cix-kernel-upstream@cixtech.com>
Subject: =?utf-8?B?5Zue5aSNOiBbUEFUQ0ggdjQgMi8zXSByZXNldDogY2l4OiBhZGQgc3VwcG9y?=
 =?utf-8?Q?t_for_cix_sky1_resets?=
Thread-Topic: [PATCH v4 2/3] reset: cix: add support for cix sky1 resets
Thread-Index: AQHckDmM0lroGc8ScE+Aon9VrBGENbVnca+AgADp+3A=
Date: Thu, 29 Jan 2026 01:26:40 +0000
Message-ID: <TYUPR06MB58765E2F64B15B6434D596F7EF9EA@TYUPR06MB5876.apcprd06.prod.outlook.com>
References: <20260128093611.1932770-1-gary.yang@cixtech.com>
	 <20260128093611.1932770-3-gary.yang@cixtech.com>
 <c4c546df215cbf4fc42bca58500a94140a5d6bf3.camel@pengutronix.de>
In-Reply-To: <c4c546df215cbf4fc42bca58500a94140a5d6bf3.camel@pengutronix.de>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYUPR06MB5876:EE_|KL1PR06MB6556:EE_
x-ms-office365-filtering-correlation-id: 7dfcddaa-aebd-4745-c38c-08de5ed5747b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021|7053199007;
x-microsoft-antispam-message-info: =?utf-8?B?THpaczJjVCt6cEtCaENZK0g3VGpFQlpKTmNLYTliU1hCVDE2d2hOTVRQaTRH?=
 =?utf-8?B?cnRDOHJvK2t2dk1ENVpOVmVvNlNNOXBVUmVOUThJRGNOcCtUL1BaVjFORTRI?=
 =?utf-8?B?R1piY2VyY0tjOS92MS9adUpUbzhXazF2ay9VajFLM3RoSXN2aGVmdXJqL1U1?=
 =?utf-8?B?WE9RdVFkMUFXYjdOS2VyejJyaWJudDBZdE5KN2ZFTDh5bGdjNHQ4VTN6Y0RJ?=
 =?utf-8?B?N0xhaU9GOENRTEM2ZEZvcnNZMm1majk1U3FiYkNJN2Vua1pFaDdGN0R2KzRs?=
 =?utf-8?B?emJvMzZCWHN4OXlmVHZKWFI0QVRMUUl3dWhweW83VVJJMVF3S1BEOTE2Z3Zu?=
 =?utf-8?B?M0Q1VllnMVZNdGFRam5XdmtZemhsY00rV1daemJ6YjN0YTZoMU1tbjd6eDc4?=
 =?utf-8?B?b2NlSjAyMnRtdnVRcHkvWVpwNng1UDU3ek1DcW1lRWpjcVFYa0NGc256MTlN?=
 =?utf-8?B?NHFQVHFzNmI5dkl5R1R2dE9WZ0V5MXQ5ckVJVlduMDVtSW8zVitXWGhhbGlU?=
 =?utf-8?B?MWFDOHdTTGZHT2djdm5NbzlTbFpHS3JNbzh4L0g4TjJpRHVpVk5HcTMzbnBF?=
 =?utf-8?B?VVZMN0hLTlJIS3hTWnhYRXNoOElaNVF2OGRhSUZacEZNYTlsMmxHSy82MXJD?=
 =?utf-8?B?RDNydXh3blhVSkRqajRqMGxrckxFRnUvR1Y1WGRTVFdhZ0JFbTR0eGt0ZHFj?=
 =?utf-8?B?S1l1Skd5RXhqUkZrTU1SNGx6WFVpamRFNEUyVEV1dTlHUW03VUV0VHQ0cy8r?=
 =?utf-8?B?TTJrem1FbDkrZzhKd3hTWEQyRnpyVlgxYmo4MHBLNDRBU2M4L2dkUWlUanZ0?=
 =?utf-8?B?NTFEUFpxOVlGM3F1TzZPRGU0VmdTYllkSEJUN2VHUHhwYzJHT3VHOUlUQnRO?=
 =?utf-8?B?RitEM3pnbExMNnhZcWIycUxMQ2RLdEdxTHRhVlk4Zk9EUHFZQm16SUxzNXN6?=
 =?utf-8?B?Z0tBZllsb0NrVjNkcVh6V2lZbjZvLzVPajFIMkMxUzBlK1RidEpWQjlmUWdt?=
 =?utf-8?B?Qk9TUkh6d0tTOXRwYmptcnRjOWxOY3g4NlBtajhidmo5WEIxWWp1c0phRFJ6?=
 =?utf-8?B?RUF4U29aZmhsRlJmRnpMWVpBRFQ0akQ2ZmtxQnp5VjBkbHJWWUt5eTMyU0xl?=
 =?utf-8?B?a3QvaG5IaThMd3Rmek0rbTYyajZnVXEveDA5Y0RuYTZwN3VCcjY1NWpUenEw?=
 =?utf-8?B?ZlBGckptUWcxS3hCbzBpZElMVmtsSzh4YkxhWUwyNGhsd0NKTUU3bUtramZY?=
 =?utf-8?B?eFVWRHZMS3llNXhrMGhZTlh0aml6NEduVVNZbkhCNUFTdE02K0Y3eUp6czMy?=
 =?utf-8?B?dERUeUo2ckhFdHBMbXFTb1JsNkxLTDN4STM0ZEdZbDBhWjFyQ3FPeG9va0dZ?=
 =?utf-8?B?RWNuN2xXUzJ3bjZjcng5Rm9pdXdIdlZhRzI4MzlrUXhYdnhBMElQRkM3anVW?=
 =?utf-8?B?aHRSeVRoSXgrNUtqYyt3ZkVnZG85azBtNDM5RG1HOS92Um5kYy9Sc0I3OVVG?=
 =?utf-8?B?bTVTQW5IS2dRY2xnZDNVL3kzM3NnRVR0WGJiU2ZNQUx4dXZ2eU9IUEIxdytL?=
 =?utf-8?B?S1RNTzEzL0poa1Y1TTB6K1FSUDV0RXNHMHZmSTNJQ0JCaFRhOEhGSWZ4SGNW?=
 =?utf-8?B?SHljUjR6U3d1anpLbEwrL0x2c01pdmpRbTVzeS8yOWU5TWNQQmFBbXZqNlY2?=
 =?utf-8?B?SUVNeGF2ZUU5enFQeFVhME9CU1ZaaHVja1YyYytHWDlxWmhrbWJSM0tDRWla?=
 =?utf-8?B?Z211azVHclRrdzYvMi9wWnZTV3lxNlN6WE95SXJtZmJQZzZrRzhER0tqWlZ2?=
 =?utf-8?B?anlEeStSNFNMVzQ1Zk4vYWJxMmRSSDRmV0Q1aFk5ZzNGMy9hdzlQTWFtRitW?=
 =?utf-8?B?ZDJWd21ET1I1TUVKTld3REp0b0VOQllPK0FnR3F1SFBUb01zYlBYeWpUTFhO?=
 =?utf-8?B?NFljWFkrZldkQlFuTEJyYlBWelpaYy82NmxNSHRtOERBOFB4a3J4R3ZVbHRa?=
 =?utf-8?B?UnJyTHNBNG5aSndhS3NxeXBxQXVPdFE3UTZydHdsZDVjaHNaSlpld0dRMHZT?=
 =?utf-8?B?V244cFVzT05MWWhoNkdhY3ZFOTlQU1JqV1h0WURIdUVNS0xQWVZ1NmdBVnAy?=
 =?utf-8?B?TUo4OENvYzNoamtIQTV2QU1uMTBhUUxwcC9rdnA3QmJTTnFQcVdXb2J0bTB6?=
 =?utf-8?Q?1u9Xef1b94m5uM6OFvsg5vs=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYUPR06MB5876.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(7053199007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U2dHTS9UQ21WVnE1QkVjdmI2WGVucnNNOUVMU3QzQ010eXRSTWo1SlVTbFdR?=
 =?utf-8?B?WDNkZGd1RkhqUzBlR0pPNTY0c1NaVCtWZldOY1BHWkg4eVZlYnJNTU5hbm5I?=
 =?utf-8?B?Z1hmbG5ZMWVhSEU0WXQva1RPRXJxcVRjZFRLL0tORVY5T2R5Rk9ibTMvaTdz?=
 =?utf-8?B?QlowUlU5Q1RUTmlkVGIwcVprb3g5b0VwTkN4SFhKUDZ5c3d6STZPTTlXbjhp?=
 =?utf-8?B?MUZCVUhWQktLNjk0emxSQ05PUUlvTjFIU3E0bW5aUGJMSEYrWXE0NkEwcXV5?=
 =?utf-8?B?cUM2cHY2Ymw5SDVES0FHVDh0bjNyWXpUdllDa2RxWldaSWZnVXRxUU43WWZI?=
 =?utf-8?B?L0ZBSXZpZlhJRzlyb0FKU2xDYy9wOC84MG1KOWJEbDl3V1BVVEZtdXNqQ2h4?=
 =?utf-8?B?L1dvV25mbVE0T05jd0toMllQOXhualVEcWlrU0dCRUhFUWdLcGFEcU1HenJu?=
 =?utf-8?B?SFF4aGlQQnBSV1VpVWFTQitkL3Q1UzlDVmVlL1lYMGxSN0w2ZkxiNlBFUTZx?=
 =?utf-8?B?ZVpxTStuaHR4Yi9leTFIV1JmM0g0Y2lIcjMvL3dabGFsUjZ1VXRvMllhWWpz?=
 =?utf-8?B?QU5SMDJJTGdacWVvMjdxaUpzOGFBOExMZmFVNHVUNVIybThNcFpxMnQ4RWdv?=
 =?utf-8?B?Y21lNVNRM0hBcm54alhqUE93akhNbjl0ZU5ySVdSVEgrVHcwWW1HVjFLRFZU?=
 =?utf-8?B?a3BVSy8xRS9zb0lYNkR3NWhUNG9yQzluczhQVk9pbjhRejVvY1M0NEQ3bXRh?=
 =?utf-8?B?KzczNFZxdnV0aHJ5OXBDS3VMRUtMTEN5WjJNRzByQmNMUmJWVWVHVGpzaDlw?=
 =?utf-8?B?TGZ4MG5RUjlaT0tkK3dOYVRvVDc5QWlHTkVZeEk4bk1kNkwwQ0hualBucTFK?=
 =?utf-8?B?elphU0dKVnlJWHNkbU04b0NrSDgvb2pKeVVvejlvT0VvZW42YTJYMWIrRGlx?=
 =?utf-8?B?R2pnOUV3UzdBL1ZTMkkrckVlRTRBOVNMVW9WSkV2V1QxKzBpWlU5VkUydit3?=
 =?utf-8?B?SWZXdkl6RnNNV3BDWEppLys2WkwzTXlMbVhmaEhETmwxWmlPUTRLemdZTjdV?=
 =?utf-8?B?VWpjbWFUREZXTmdPQ29Mc08vd3E0VXpSY3JWT2RoVmN2SU1yd2VhT2pOc2Zj?=
 =?utf-8?B?bHNmd3hiS21oUjBPbUp1YTdvZVlJVnNwQndaUGE2bnM0Z3p6T2pFNTYvc28v?=
 =?utf-8?B?VXJkRHB1ZldtQTh5ZzI4NGh6aWY0TG5XdDdMWlAwcE1pZzliQnhaeE14N2xl?=
 =?utf-8?B?Y01VTUF1bzRocHlqUlJFK3ByWHhpWStVdTliZmZ0aHRIYkk4RFRLT211bEdh?=
 =?utf-8?B?dVVYVDNLcUxvbHBxK2I1d3FDRDR1S3VDZzhmQmI3RnIxTTd0d0l3WDUyek9Y?=
 =?utf-8?B?TWgxTXBzTnpyTy9EamFvWVpBKzVhYTFEUXZjR29YVXQwSVdBQi9Pby9xUjJs?=
 =?utf-8?B?bnk0VXd2R2VzTGhOL0p5ODRSY0puSTF2a0d5SFc2YnEzVUc4M2xBUXJuUHRp?=
 =?utf-8?B?ZnNyb2Y3RDlLeDJQVVY1bEh0VGUxWjNONlBVZzYyMjZ5bDQxU1VpRWNlZmgw?=
 =?utf-8?B?Q3hwK0pVNHJUa0JiQ0lOc25PM3ZMdENaZXBtaFg3aEtybG5EYVZoQy9ETXhL?=
 =?utf-8?B?MGxJYkZiUStHcmxjYkhHOGk4clAzK1Vra1pDUXgyWDJ4NnNYYnp2cG9sNDFW?=
 =?utf-8?B?NkV5RERzVHE2MWY4emJjQ2gxdHRvUlBkSlF0QlZlMjlLbHhNbGxpZjduQUl1?=
 =?utf-8?B?NDZYRU85QkFROHVNTGdqdnpWaTNwRTR1eStHbDRXZ3pvRjJXemR1ZlVzaGNk?=
 =?utf-8?B?dkVHSGR3MC82THJUTFV1RVM3dFpHeXBRbHJDWjdZN2pUNFNHWFFCb2pyNXlT?=
 =?utf-8?B?VHlhZXRFTkJJWnFPcVNqT3lYaFArWHZxUm1LU1QzeUFPQVBISXR1R2ppWmJI?=
 =?utf-8?B?aTdLcU5zYXIvU0RiNGJqY0pSc2JIQmRYZFdhYlJGMlJ1NXVXelQwcWlURU5K?=
 =?utf-8?B?RTJVcGtjeEtrVGhnaStRS0RnMXFrTDZ0Vjl3Tyt6SGRoYTVuMHcxaExYN2hs?=
 =?utf-8?B?bHdiOWxpaW1LOVdNR0ZRbStaL1pUMFMrZDdVSDVpNmlUQ29GZHBoa1JjSkhZ?=
 =?utf-8?B?eERGU2NMVFE3UEhjMHZZVVdHZ3g1S0FGVlVqWXc1Z1lnNEk4SEY2eGNxN3Y0?=
 =?utf-8?B?S1hDL1E1T3dBRjExMkpheTlFU2kzUkdjSk12M1FlUWx2ZVFPSlArYW9tbGhX?=
 =?utf-8?B?NTBhNzUxSDEvMDNqWkZ0enpsU2lHcWtFMG1udHlJd3BhWklZL3hyRURMWVV4?=
 =?utf-8?B?cXkxaHczN1E0L2g5UjkvSHhUbUJYNHU3V0s3ajZtb1c0QkVtL0Rodz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYUPR06MB5876.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dfcddaa-aebd-4745-c38c-08de5ed5747b
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2026 01:26:40.7252
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l/1zvvwe80XzhkHAo2MZyHiWOzc/29AB07EoVaOC+khsKwk5C0kut4CVSv65K+we9ZY/ge4dZ/tuaGpTdTqV+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6556
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_172649_493272_13FD1EEB 
X-CRM114-Status: GOOD (  19.25  )
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

SGkgUGhpbGlwcDoNCg0KVGhhbmtzIGZvciB5b3VyIGNvbW1lbnRzDQoNCj4gLS0tLS3pgq7ku7bl
jp/ku7YtLS0tLQ0KPiDlj5Hku7bkuro6IFBoaWxpcHAgWmFiZWwgPHAuemFiZWxAcGVuZ3V0cm9u
aXguZGU+DQo+IOWPkemAgeaXtumXtDogMjAyNuW5tDHmnIgyOOaXpSAxOToyNw0KPiDmlLbku7bk
uro6IEdhcnkgWWFuZyA8Z2FyeS55YW5nQGNpeHRlY2guY29tPjsgbGVlQGtlcm5lbC5vcmc7DQo+
IHJvYmhAa2VybmVsLm9yZzsga3J6aytkdEBrZXJuZWwub3JnOyBjb25vcitkdEBrZXJuZWwub3Jn
OyBQZXRlciBDaGVuDQo+IDxwZXRlci5jaGVuQGNpeHRlY2guY29tPg0KPiDmioTpgIE6IGRldmlj
ZXRyZWVAdmdlci5rZXJuZWwub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOw0KPiBs
aW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7IGNpeC1rZXJuZWwtdXBzdHJlYW0N
Cj4gPGNpeC1rZXJuZWwtdXBzdHJlYW1AY2l4dGVjaC5jb20+DQo+IOS4u+mimDogUmU6IFtQQVRD
SCB2NCAyLzNdIHJlc2V0OiBjaXg6IGFkZCBzdXBwb3J0IGZvciBjaXggc2t5MSByZXNldHMNCj4g
DQo+IEVYVEVSTkFMIEVNQUlMDQo+IA0KPiBDQVVUSU9OOiBTdXNwaWNpb3VzIEVtYWlsIGZyb20g
dW51c3VhbCBkb21haW4uDQo+IA0KPiBPbiBNaSwgMjAyNi0wMS0yOCBhdCAxNzozNiArMDgwMCwg
R2FyeSBZYW5nIHdyb3RlOg0KPiA+IFRoZXJlIGFyZSB0d28gcmVzZXQgY29udHJvbGxlcnMgb24g
Q2l4IFNreTEgU29jLg0KPiA+IE9uZSBpcyBsb2NhdGVkIGluIFMwIGRvbWFpbiwgYW5kIHRoZSBv
dGhlciBpcyBsb2NhdGVkIGluIFMwIGFuZCBTNQ0KPiA+IGRvbWFpbi4NCj4gPg0KPiA+IFNpZ25l
ZC1vZmYtYnk6IEdhcnkgWWFuZyA8Z2FyeS55YW5nQGNpeHRlY2guY29tPg0KPiA+IExpbms6DQo+
ID4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI1MTEyNDA2MzIzNS45NTIxMzYtMy1nYXJ5
LnlhbmdAY2l4dGVjaC5jbw0KPiA+IG0NCj4gPiBTaWduZWQtb2ZmLWJ5OiBQZXRlciBDaGVuIDxw
ZXRlci5jaGVuQGNpeHRlY2guY29tPg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL3Jlc2V0L0tjb25m
aWcgICAgICB8ICAgNyArDQo+ID4gIGRyaXZlcnMvcmVzZXQvTWFrZWZpbGUgICAgIHwgICAxICsN
Cj4gPiAgZHJpdmVycy9yZXNldC9yZXNldC1za3kxLmMgfCAzNzYNCj4gPiArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrDQo+ID4gIDMgZmlsZXMgY2hhbmdlZCwgMzg0IGluc2Vy
dGlvbnMoKykNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvcmVzZXQvcmVzZXQtc2t5
MS5jDQo+ID4NCj4gWy4uLl0NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9yZXNldC9yZXNldC1z
a3kxLmMgYi9kcml2ZXJzL3Jlc2V0L3Jlc2V0LXNreTEuYw0KPiA+IG5ldyBmaWxlIG1vZGUgMTAw
NjQ0IGluZGV4IDAwMDAwMDAwMDAwMC4uOTJlMzRiNDhmMDQxDQo+ID4gLS0tIC9kZXYvbnVsbA0K
PiA+ICsrKyBiL2RyaXZlcnMvcmVzZXQvcmVzZXQtc2t5MS5jDQo+ID4gQEAgLTAsMCArMSwzNzYg
QEANCj4gWy4uLl0NCj4gPiArc3RhdGljIGNvbnN0IHN0cnVjdCByZWdtYXBfY29uZmlnIHNreTFf
c3JjX2NvbmZpZ1tdID0gew0KPiA+ICsgICAgIHsNCj4gPiArICAgICAgICAgICAgIC5yZWdfYml0
cyA9IDMyLA0KPiA+ICsgICAgICAgICAgICAgLnZhbF9iaXRzID0gMzIsDQo+ID4gKyAgICAgICAg
ICAgICAucmVnX3N0cmlkZSA9IDQsDQo+ID4gKyAgICAgICAgICAgICAubmFtZSA9ICJzcmMiLA0K
PiA+ICsgICAgIH0sDQo+ID4gK307DQo+IA0KPiBUaGlzIGxvb2tzIHVudXNlZC4NCj4gDQoNClll
cywgeW91J3JlIHJpZ2h0LCB3ZSB3aWxsIGRlbGV0ZSBpdCBuZXh0IHBhdGNoDQoNCkJlc3QgUmVn
YXJkcw0KR2FyeQ0KDQo+IHJlZ2FyZHMNCj4gUGhpbGlwcA0K

