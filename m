Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 483ADC7EE31
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 05:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gigk7tM0nbmaLfX80XfOgUa/+zE146wo2no6+mGBA00=; b=HIf9VFoimJ+90vFx7//CaWrHLI
	FCR+43uV0VSr4MG+jKngjLBZRQBNXvyiUr+6IHIWwha6XioPkCQx/+ltq3leUeaAAWKHCD6Mqb2I5
	H51Qb2w7K3bYhA7Cxn8rgB0AAnIMM2+bhwlTDvA8G8Np/IT1UVcHcT8xuZx/i5YmwEi3uakauwMRD
	3+SeKHP6wonmXlsppU0bLWxGU2ZbpxqjJjDCPrXCAnqNdJ6Jwhg3Pige8onuFry/0vdt7W1QYugl9
	oCGSkUQuokMQC9/zew/4mc731ikq5w+NlbAOUJul27v3EJNwVEuddjVDsmkjj2mARSzO0ZWr5HARR
	KDjhj5UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV25B-0000000De5O-0Fg0;
	Fri, 27 Jun 2025 05:57:05 +0000
Received: from esa11.fujitsucc.c3s2.iphmx.com ([216.71.156.121])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV22r-0000000DdzB-1JCR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 05:54:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1751003681; x=1782539681;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=hjnIigFJrrp3ciJmFkLTd2uxh7oOA9SfkvtJJDsQ8ik=;
  b=vnvmgiKDKyql31JQ0Y38zAE3JUycJoXZM5IKjvhVWgYWA3EOCn/XpGur
   SZosMJbHu9UJqGK6BSbJsAj0U68QbpFbZOZhbYLx43+iJygZkGlxRqBre
   dXXvNZJHAc4dJx9e75kdKEu7c4QTbg98wS5XSdTwscTIUujoJd+FFDMv/
   rJMHaPurvtu1Tv1MgDiWb14U6AXhw3GoYFS5KuEugNnPcizIyZHLX11KO
   6678SGTU14lMc/blfcQgxFnvHAdaMRoJsSY6/efkoX6HDMHbz0qLh+Ub4
   g1WvvcvhwL2RB6Yp6GDzgJgY/bL1I4D9eF1xcR5PKQnh4Vw5gbkNjwxC4
   Q==;
X-CSE-ConnectionGUID: hsdp1kxUT7COC7e+UGBiNA==
X-CSE-MsgGUID: klDXvdmGRBmTQhCGjUpMMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="160863445"
X-IronPort-AV: E=Sophos;i="6.16,269,1744038000"; 
   d="scan'208";a="160863445"
Received: from mail-japanwestazon11011009.outbound.protection.outlook.com (HELO OS0P286CU010.outbound.protection.outlook.com) ([40.107.74.9])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 14:54:33 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XvDqwfbSn7FNhi0Yp1pvXfJZOaZjEj/00SlbtUwLC0INvq6M/3XbCCYodMId6+kqcW8LAVmjXX2rJf0xWFI3jMHIM8DjvgfyWM2SEQMtW7rzRlM6ShFTyMQuE37/tU7Jx+FG1y4NT2jsikhznIW9UUayiprILq6QYg38mT1ApH3TtrQlsyF8CdWzS3xo/N5Hdr3FtEG4zjJXnuF5FqY3m3ErMrJMUyC+shgoHcMHARep3WfB8Lg2x9EZIpjW0Plin+DKyRqHZ7uoU6FeWgkzsnohRskXZcr87Hdkr71ssdUdLCH9RA+R57+7KoPfUllpnRSjxeeQDq+gQv808LDjAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gigk7tM0nbmaLfX80XfOgUa/+zE146wo2no6+mGBA00=;
 b=jnCogULp4OpLSf5HKKcHA3vxX+KWPGCATHCs8CXM/L+FDOPqk9CUAr0DKyPLhGUqzk5KtIoJK4CzgV8mkrtJp0v6DyhVwh6pxRFgTG98RA1Au0PVEOJet2PYchpkE8U3ZpXY4NxwO13a3OKnODMgv0IPnE4KWJOQu7JsqjOfM4G503cET6FOjUBTDlQobPdDxDgvziM17JBNkG5sBCCpM31FvzvtyZqOYXYpNVJ9ZuVNCQDSD8sdXEoICYiCipmZzLG2wueiR9VspdTSbu9d7uqXJ4cI0Ghb8Ve1AkyBYxZ9TFodazBWamnE/n6lVsluCDsaXRHRUXLXHa1jTta8Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from OSZPR01MB8798.jpnprd01.prod.outlook.com (2603:1096:604:15f::6)
 by OS7PR01MB15115.jpnprd01.prod.outlook.com (2603:1096:604:36d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.19; Fri, 27 Jun
 2025 05:54:30 +0000
Received: from OSZPR01MB8798.jpnprd01.prod.outlook.com
 ([fe80::4344:1f7b:e34d:c672]) by OSZPR01MB8798.jpnprd01.prod.outlook.com
 ([fe80::4344:1f7b:e34d:c672%6]) with mapi id 15.20.8880.015; Fri, 27 Jun 2025
 05:54:30 +0000
From: "Shaopeng Tan (Fujitsu)" <tan.shaopeng@fujitsu.com>
To: 'Jonathan Cameron' <Jonathan.Cameron@huawei.com>, 'James Morse'
	<james.morse@arm.com>
CC: "'linux-kernel@vger.kernel.org'" <linux-kernel@vger.kernel.org>,
	"'linux-arm-kernel@lists.infradead.org'"
	<linux-arm-kernel@lists.infradead.org>, 'Greg Kroah-Hartman'
	<gregkh@linuxfoundation.org>, "'Rafael J . Wysocki'" <rafael@kernel.org>,
	"'sudeep.holla@arm.com'" <sudeep.holla@arm.com>, 'Rob Herring'
	<robh@kernel.org>, 'Ben Horgan' <ben.horgan@arm.com>
Subject: RE: Re: [PATCH 4/5] cacheinfo: Expose the code to generate a cache-id
 from a device_node
Thread-Topic: Re: [PATCH 4/5] cacheinfo: Expose the code to generate a
 cache-id from a device_node
Thread-Index: AQHb5ySh5G6irViRj0qGfV6qVsLL0bQWfqlw
Date: Fri, 27 Jun 2025 05:54:30 +0000
Message-ID: <OSZPR01MB8798CDE4E2ED8E1B1B40E6608B45A@OSZPR01MB8798.jpnprd01.prod.outlook.com>
References: <20250617172132.00002844@huawei.com>
In-Reply-To: <20250617172132.00002844@huawei.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ActionId=6c54d70c-aaa6-4ec8-80c7-eafb83860147;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=0;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=true;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED?;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2025-06-27T05:43:57Z;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSZPR01MB8798:EE_|OS7PR01MB15115:EE_
x-ms-office365-filtering-correlation-id: fbbe3aa1-6e7e-4dda-613e-08ddb53f1581
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018|1580799027;
x-microsoft-antispam-message-info: =?iso-2022-jp?B?dFdiSURkSkxwS1JoNGtXZXpPM2xFQmQyRTQ2bjJUSmQ4M1lmaWZ0bXBO?=
 =?iso-2022-jp?B?c0RZOG93dDlxZjVkMURKWElzcGd2VGZaZ1ZlM0JqR3BXSHozcGV5Q2l6?=
 =?iso-2022-jp?B?cVdmaDYrNFdwWk1KVWc1WitnMDhlTmEzVTNsV0NFeTZxS0FBQXNGVmMz?=
 =?iso-2022-jp?B?UTNPS2szcWxCZFp6YzZrMThVZnNXZWh2cWNMVnJTdkZhdlNjSFYxcXVk?=
 =?iso-2022-jp?B?dHRZNmxJWndxbW1FVGYyWFQ2ZlQ1dmlWZUxsVTY0R0dQOXNYZUpScGg3?=
 =?iso-2022-jp?B?SEhhUkl6UkV2aXdVWUNjRXVSa1BhcXJGQ2xRbmNVV3d6T0cycXdpMDlV?=
 =?iso-2022-jp?B?bG9NY0VQM1BKejcwU2tMMUJYYnJCSk5Ja1NiOVBhTmVTaUo2Ny9oZlgz?=
 =?iso-2022-jp?B?VWgvTFo5RHNwRjJlYmxuQVRNVjRZMTExVVpwbTNFYzJCaUpERy9waGtl?=
 =?iso-2022-jp?B?WTlWTmZNcGhxeW85eUwzTlMyNWZwT3BPY1Z5Wk5pamJDQmVSOVVXT3ln?=
 =?iso-2022-jp?B?dDJRZllPdnRxVkpUdkU2SVZjbCtWMDZvUWV3QWVYL2VSYmRncnl2d2o1?=
 =?iso-2022-jp?B?QlJIbytJUWtJakF5bXRzSnhZWEpEK2VMNCtEd1VXdG1OVHpEQ1pCeVRZ?=
 =?iso-2022-jp?B?TXNBcTBuMmpHUUliU3hvWDNZOVdQOXdoYmNuUE0rTmNRbXRFQlR2dVYw?=
 =?iso-2022-jp?B?Q0Q1czFCamxtdnhjVGpicEs1NmxheWkvemZEQUErcjFDQTVBUUY2SGRp?=
 =?iso-2022-jp?B?bGVBNUk1UlJoWWxKRk9YQnBjYjhLbnhqbzc4N29TUGVlTHdyenpZOXJF?=
 =?iso-2022-jp?B?bm1jRnVGYWNKK25vczhKbG55ZnFxdHQrTThMWkZNc1hPNWZvdFNaQnIy?=
 =?iso-2022-jp?B?OVc1MVp5TElUSUxrcVMxbEY4NUJqRTk2K1gzVWpFcTZGdWlwdzRLMFFj?=
 =?iso-2022-jp?B?TVNTdS9tWTdpWVZ2V2JickVEcUJJT3BsSnN1d0pMRmthc3JQaG5YbCtC?=
 =?iso-2022-jp?B?TmRXSVdTbkhDUldNWERSbDQxdXcybXZ2cEtZOWwyemRlTUZTRmZ4ekw4?=
 =?iso-2022-jp?B?ZkoyU3poQkFwb3JmOFlzdERjZjUrOU5iUFFBRU9pWGNxWUJoWFR5ZFhK?=
 =?iso-2022-jp?B?aFhKdmk2NDExZGJtSzlZQis2Z3RaVWN3bDg5R1MvSWkxNE1kOUhCRjda?=
 =?iso-2022-jp?B?d2wwZWNaU1hQbUlvTm5oYnl5dllIYlZIYVBpWDVIMVBZOUo1TGVOTDJw?=
 =?iso-2022-jp?B?OHhzUDEvZUx2RXEzd2lPTnFiZ3RVR0ZoMisycWFQd1ZCRjJ5K1ZPWTNZ?=
 =?iso-2022-jp?B?QVU5cVBTdkpBcE5DR0RpL2Z1QmtIQjAyVXZaUGdIMXJMUnowWlhDaDFq?=
 =?iso-2022-jp?B?V1RoaVJORGJKNndrOW1RSlk3VXoxK1NYOTF1cTkveTdveTF3ZDkrTTVw?=
 =?iso-2022-jp?B?OE55TWdVaGN2RmRuRU5Ta1BPSUxkQythN3ZLbkt4b1o5bUxteE1wRlhs?=
 =?iso-2022-jp?B?aHJwaXdLR3k3UzdLWHBlU1NWVUN3T01QbzIyVVBUanRTUFlPdFBra2ov?=
 =?iso-2022-jp?B?cnMzRjBhUGhoZTZtZ0loZEQrMDdsR3ZMWk82R1BxSG10VWR2c0wyVG5p?=
 =?iso-2022-jp?B?TUh1WjlEM29yci9OQ0xvc2NoTWNUc0E0QkhsQ0FrRlZqNWVlc1drN2p1?=
 =?iso-2022-jp?B?bFJFVlN6ekVhMnEzd2RsQ2NSR1NJNmRmckx0aUp2S1VBK3FuaDNEUnBu?=
 =?iso-2022-jp?B?RTY0SFdFWU9kSDlPTzB5TU9haCt4ai9wcGhnUzcrZE5ZdnJ6NVZCd1Vx?=
 =?iso-2022-jp?B?TlF5S3ZkbzFLcFVCWVBDVXhjb2FlUWkrcUp4dXZIYUlXbWY3cW9uY0t6?=
 =?iso-2022-jp?B?dzdHQnpUeVZac3BhWi9QemppUlEvUjJGcUljSk9qMFFKOG56WnJaWWlK?=
 =?iso-2022-jp?B?T2hORjFzTzhHV2YwSm43c3JaRFdmRkI2cGhqWitoTzV5ZEEwRWNrK3py?=
 =?iso-2022-jp?B?L1dLVm4zV3lqek1qcVQ3R2hqTjNJYkFQVHFzM2xydnVFY1QwNHM0aVd3?=
 =?iso-2022-jp?B?TklLVmx5aXIxZUoxUWtKYm9JUVAzRWtlcGhlcFZ2NWp0Qm84YlhtbVdQ?=
 =?iso-2022-jp?B?dHBJNCswZzdieXRhb25XNXlpazUwWnpodjczWjFhbWlrSmFuMmNPbTlz?=
 =?iso-2022-jp?B?ZlpCN2ZCclBybFlCT2dmKzlXKzliVGpz?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSZPR01MB8798.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018)(1580799027);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-2022-jp?B?K1p3eTNkc20ySUxtUGZrQU9USUUwVWFFWlZsNHViZ0dHSlhaR2xiS0ZR?=
 =?iso-2022-jp?B?eE5yTWZ4RllMVXdkazJyTU1UbEJoTDFwbHQ1VzFYWFhYcHFuSlhTbzF0?=
 =?iso-2022-jp?B?ejlWN0pGTE5Sa2g2bG5Nbk02MUlqdFpXelo4RE5xZytrUnlvZlF2T1RF?=
 =?iso-2022-jp?B?emN1QjVNNDJKaHoyMGh6VVp1MXJRME5DYTl1d0xxMEFIMXl6V2Y5K1Bz?=
 =?iso-2022-jp?B?d20yY1F5ZUtLMWVnVnpIWkFnVUVsRWxralcxOWw5SFV6Z2Y4Tm5IUTRn?=
 =?iso-2022-jp?B?dFlVOGFvMnNoUENyNDJvY2ZJcmRIdlUvaWxnNjlPV2doRmJkeWNFdTZR?=
 =?iso-2022-jp?B?SkZxYXBpbnN6VFJ3TzVTWWlTUzBPSGoxbjNqV0RqWHBVbUJKdmF3aTdV?=
 =?iso-2022-jp?B?bHhrdVZBT2VuOE9YYXFIYmZVaitYSHFaWmNXM1B3aWpnQVdhazFVWk54?=
 =?iso-2022-jp?B?a25lNW5tbFJGT01WYitaZElVQmZzK1hZUmxyOU5jcjJFRCtYdkxUV2pk?=
 =?iso-2022-jp?B?YmxtV3oyK2IvTDd4SHJaL0Y5VFQrTzZjOEFkZ1JhS1V2cDhxNi96S1Uy?=
 =?iso-2022-jp?B?UTROc05HZWRVZ0k5UVU5UG1oajFzUk93NW52b2drM0lMb2U5aStBV01s?=
 =?iso-2022-jp?B?dDVQK1UzbE8vTnlxT0xLbGhXTFZTU0w1VGxsTmtTZWpDMG1IMXpiK2VG?=
 =?iso-2022-jp?B?RzBFR1pSWW1pOUhnS0hkbkJZTUIyV3lpOWZYR21RQ0tPbVVvQUpPMC9V?=
 =?iso-2022-jp?B?M0k0WHp5MlVhYXNpWnFUeDZvZjRqbjhMN0V3cVVtVnhMa3hxNi9ZZ1ZO?=
 =?iso-2022-jp?B?Z0tHODQzWWZJV01XU0xvRVJkV0JiM2x0OTZjNk1BVk5BWngybitkdTdt?=
 =?iso-2022-jp?B?SWpYWEZCYjB0U0VheTZBbHkyczJwWm5YUzNmd1F5TzVieU1tZ1N2YXV2?=
 =?iso-2022-jp?B?ZDNObUJHWURHUzdSZ3dlUG5CRi93M0l6cTFTMWtacEpvYlhDTGVRdVlx?=
 =?iso-2022-jp?B?YjVnb1JBQnFISTJBY2JkQVRDTkt3S3dEQ1N3czdQNWZBUW5xOWh5akU4?=
 =?iso-2022-jp?B?M2szTFhIY0dycHZaRktvdnVSTW0vTG5BS3J0bk42c1JTdE9iOU9uSEJw?=
 =?iso-2022-jp?B?OFcyaXVnSE1QaWVSVkdSaUttTUpNbk9hdUZ2T1BvZk5SRjY5eU9LdzRw?=
 =?iso-2022-jp?B?QlRUOXY4SkNtTjc5bmNMQTBxaVNlTGRxT0JjclMrdDY1UUF5eW5BTERK?=
 =?iso-2022-jp?B?TU9LdSt2dGREYmRKRUhSMlRoRWZiKzN1S0JTV3NwSW12WUp3bk9HOEpL?=
 =?iso-2022-jp?B?eGUxcG5McXpwbUtnZE5UQ2d4WFZtVldqNnlsUGFoNXN5WkFpVmZuU1Mw?=
 =?iso-2022-jp?B?WGV1SHNWOG9odDU3c2hlQXVHYWxLWmRpYVVBc3BWV2NNSTFlU1h5WFNp?=
 =?iso-2022-jp?B?ck5KNEtDeVZWWkhlMFpHNGdHdEovbVFNVHUyZWY3T29GeEhTSVRLdXF0?=
 =?iso-2022-jp?B?WTUvTHZ6N2RhQWUzY3pBOGJuL20za21yRVVkSURpY3gyWUxnd1piU2tq?=
 =?iso-2022-jp?B?VENNUytWSktmbDJrWU5GV2VJRE4zQTA0VU5HSlp3M2NVMGtlazg1RjYy?=
 =?iso-2022-jp?B?cm8ycWtkQVBzWXFjdkt2QU42dWRWMy9XeUFOcWg1RnA3NGdRcDhNR3JZ?=
 =?iso-2022-jp?B?cVdub2dGcVRwS3lzUkNCT0xKbFBLakJYTjBPVy9JNEFTd1lEYnlsdUo5?=
 =?iso-2022-jp?B?Ty9Fb1dJelNST2JTeG5Bd0VnbGNIWlRBYTlxRjRGRFh2WnJldlpmRzE4?=
 =?iso-2022-jp?B?QzI3cU0wTjhDSFpGbUQxUDdHREF3VkNKSHRmYytkaUkwbnRycWk5K3lr?=
 =?iso-2022-jp?B?U0tIRWNncWU3UU1NNWd6WWVsUTRuSXAzeHNyYXRBcXdwZDBjU1NDQTNt?=
 =?iso-2022-jp?B?Zy9ZTk4yRWgyckVKL2JNWk1qV2NKWEdMNElEVGVYR2VrZXp1WGo0N3cx?=
 =?iso-2022-jp?B?NitvcVJIUm5wTzNrVjhoVG9BTmRKSzlYejQ5VGV0cHZkbjNUT09jNHhD?=
 =?iso-2022-jp?B?RW5MK1lhbXZYZFI0alRjQmZlN05GWEFqUXkxdXlMaDlJRkY1R0JSQnlm?=
 =?iso-2022-jp?B?b3A5a3hnNUF6eDNtei92ZExKcWJHazBsSHFWWFVTZ1ZZalU4THlaL3Ez?=
 =?iso-2022-jp?B?aEVRRGxuUVNscUdEM3phV3M1ZUJvb1pCZXBVSFVlYWsrTW9kU1dXVW1r?=
 =?iso-2022-jp?B?cStZZGE3a2hkZmU4N001UWNnTE8zcll0UUt1UEx3TWtrSlhIL1Izd2J5?=
 =?iso-2022-jp?B?SnJkeWhBa1pSSHc4dGRkenRWdzhOY3Q5MEE9PQ==?=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: YPNTKD6fqH0NMI5sIQvGJJXRvbQGn999tutB5C0PNxCaRATKtZGzbMm/FJ5Pt1XLmNumlH4RnvfzkvXgZYZqg3PTw9/fMVGoQqzIJfsWwUI9ZoSbuUfhWgkkvP2mRFwf+qRL8xkQ/QG/fVNRlPQKTRjtUFzbYr6ag7B8UGl8NRzS0KM1Z/251Cm7O7DywrZUkMCHTMe51TWem505q4Sn/cbxMNTqPHkffZTYPNqenPq/MfFaT0mMMTDLp3mNluCspalKs6fi5uJ2TJs30eVBerdXlbPP9vLaYM3lGZr1RqW4Lw1cgJa7rSgN/BgJ8nVNa/SElZ/IeWutrAaO+JLjvN9Yt8TDD2MdcIIZSmrlqYtmbMqP0DnymvIBlXERqWVoA6Gfu3pqDcPakA/QFubdiOUNkboCS9YkcgqtSmS9+mnZYTpS49N/Zc7TTCq3IqmxXz1wBWs+PUY4T4c+ShNXVjichBh+aSKUp5SE2hDjXZqTGTdhn1FcmUAmz6RyYGSSY9NBBRQfhEtXvhDAXIJ8dWwaOPcw00KpMmF8PrD3lKj8FLxbfpQNxnxWLeiip+J589Z+DzjkrmT1Us4aDosobQ936gQ+NtIrvak90yZsV6CIm1X0+M4jS54DcAoKClyt
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSZPR01MB8798.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbbe3aa1-6e7e-4dda-613e-08ddb53f1581
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2025 05:54:30.4343
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FFVMT4E8B6Yf+JWqV2cgbPQsD/ZkBAsUS6RAXg0Sib+i7aalSIU0jj/9tN+XZl7o4tCrzzfColcfccJWTMxw3Hfd1V0GzZxsqOupx0G1Nys=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB15115
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_225441_940850_F4C5CE49 
X-CRM114-Status: GOOD (  23.23  )
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

Hello James

> On Fri, 13 Jun 2025 13:03:55 +0000
> James Morse <james.morse@arm.com> wrote:
>=20
> > The MPAM driver identifies caches by id for use with resctrl. It needs
> > to know the cache-id when probe-ing, but the value isn't set in
> > cacheinfo until the corresponding CPU comes online.
> >
> > Expose the code that generates the cache-id. This allows the MPAM
> > driver to determine the properties of the caches without waiting for
> > all CPUs to come online.
> >
> > Signed-off-by: James Morse <james.morse@arm.com>
> Feels to me like this needs to come with the user.
> The earlier patches at least expose it via existing infrastructure this i=
sn't used
> at all yet...
>=20
> > ---
> >  drivers/base/cacheinfo.c  | 15 +++++++++++----
> > include/linux/cacheinfo.h |  1 +
> >  2 files changed, 12 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c index
> > d8e5b4c7156c..6316d80abab8 100644
> > --- a/drivers/base/cacheinfo.c
> > +++ b/drivers/base/cacheinfo.c
> > @@ -188,7 +188,7 @@ static bool cache_node_is_unified(struct cacheinfo
> *this_leaf,
> >  #define arch_compact_of_hwid(_x)	(_x)
> >  #endif
> >
> > -static void cache_of_set_id(struct cacheinfo *this_leaf, struct
> > device_node *np)
> > +unsigned long cache_of_get_id(struct device_node *np)
> Bit confusing to have cache_of_set_id() call cache_of_get_id() like this =
because
> they are in no way mirrors of each other.   Rename?
> (and naturally I'm providing no suggestions :)
>=20
> >  {
> >  	struct device_node *cpu;
> >  	u32 min_id =3D ~0;
> > @@ -200,7 +200,7 @@ static void cache_of_set_id(struct cacheinfo *this_=
leaf,
> struct device_node *np)
> >  		id =3D arch_compact_of_hwid(id);
> >  		if (FIELD_GET(GENMASK_ULL(63, 32), id)) {
Since "id" was compressed into 32bits by the function arch_compact_of_hwid(=
),
is this required?

Best regards,
Shaopeng TAN

> >  			of_node_put(cpu);
> > -			return;
> > +			return ~0UL;
> >  		}
> >  		while (1) {
> >  			if (!cache_node)
> > @@ -214,8 +214,15 @@ static void cache_of_set_id(struct cacheinfo
> *this_leaf, struct device_node *np)
> >  		}
> >  	}
> >
> > -	if (min_id !=3D ~0) {
> > -		this_leaf->id =3D min_id;
> > +	return min_id;
> > +}
> > +
> > +static void cache_of_set_id(struct cacheinfo *this_leaf, struct
> > +device_node *np) {
> > +	unsigned long id =3D cache_of_get_id(np);
> > +
> > +	if (id !=3D ~0UL) {
> > +		this_leaf->id =3D id;
> >  		this_leaf->attributes |=3D CACHE_ID;
> >  	}
> >  }
> > diff --git a/include/linux/cacheinfo.h b/include/linux/cacheinfo.h
> > index c8f4f0a0b874..9c959caf8af8 100644
> > --- a/include/linux/cacheinfo.h
> > +++ b/include/linux/cacheinfo.h
> > @@ -112,6 +112,7 @@ int acpi_get_cache_info(unsigned int cpu,  #endif
> >
> >  const struct attribute_group *cache_get_priv_group(struct cacheinfo
> > *this_leaf);
> > +unsigned long cache_of_get_id(struct device_node *np);
> >
> >  /*
> >   * Get the cacheinfo structure for the cache associated with @cpu at
>=20
>=20


