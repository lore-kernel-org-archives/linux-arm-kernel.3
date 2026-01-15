Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0464D4662F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 22:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wMwrl5TTH9DuS0E3tNlnoJWbjn+P8InnNXwMfv8jqS4=; b=eko672a4xOQsMMOoS4sXBaBeHn
	V5GN0SGtr0+rtW+wl8aIGT8UzEG6BopF3XOh5HdIB1BFt9j2QzHu8j6rnZTlpT1rnLj6VaBmvw9Rz
	cX+/jURrbuNWsyc1QuzyKOH2FJTRXlt6/ploEwShTTVc+9g3Wn5ZRaoRkBiCwT4aFFyFcukUFyWoq
	WbfrRFRYpzPKOZhLiEskuSP2dgQLF4WRiBlpdOSCiaZBrReJEBiYFvXcR67sdgk2Jfh+sjg4WBecA
	eOim2UTqcMmp/u+x1GtTW1dsRnejP8818Fb2qd8xUe9ahXVf8yuWtO1J/Jz6hw2z0OFAhWeOb7+q9
	Tf42PB8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgVW9-0000000DFzc-0eF9;
	Thu, 15 Jan 2026 22:08:37 +0000
Received: from mail-westusazon11010049.outbound.protection.outlook.com ([52.101.85.49] helo=BYAPR05CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgVW7-0000000DFzB-0yW3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 22:08:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AOk/3g1xnKPJ5YXr/s/gH0QCJS2PovfzplwSALHXpedpPnqYW3LpMwzKAYj4CNnMVcJsx3bybLA3EtIREWORUPdncL+WuYmXq0dVz6Vl116AThUUtzcDJ27HmfU3jUwLDHH70zPNoMVmIxUc43Pwi2Z1uZfOgFvd2BaG9NlISi7/Hf4xdHIODelQKLdr+gk4mj3ooKRKCQF9grKRqjL50wpU+ZwcMlYepoN+fubf6dkOSfGafpZJccdBjWBDG5kf8UiO/QgW7+7rvKyh72DOUjAt/3rJHU6XWiOULouP3IRC2WFtaR3cf8V4Eo30/slgr/JLSJQNFgDcQfpKtvtZrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wMwrl5TTH9DuS0E3tNlnoJWbjn+P8InnNXwMfv8jqS4=;
 b=JE6TtevnlhEBo9NisdU3UDHiXQM1RMuzjVR29lln8SzB+gifX/d+Ipj2uwvH+7bM/dKkz/Gq/FbbyjkoTOEiUwrmGbzxDsOiXFeI/GoUX5cV+KeD+adXnT/n/U+L9uxwUcGVFoE9oD5WscwTBcdUrbOXop/eK5yY6CDqZzOAN4HmSoejVMZ0gZiphMzyh7+ECrWnThJFTXTxTmNYLosV4z1gk0NDMtwTUs2OVTR6h/qvo0XITgwnQNkW7mpPMnfuTS9fQQfGRTA4E1LHuPL36NlQtqzyA0pmvHh5G9v1Rg53IoHnKhc2FrZz9Apo+9VZ+VF8AYKJxq0CpqBNDYdNSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wMwrl5TTH9DuS0E3tNlnoJWbjn+P8InnNXwMfv8jqS4=;
 b=DlnTiE7JFdUukpyONuzXYf0c6xWsCU/BukEtJUH6Y6jjHnrr27wniDXe0ZURqKhm1awziAMWtcWKZrtScPvjQ2xw3BZevll/s9thvAhAeMOuTyvXlnRW6OsaTLwo7sHxc9yPieAYwGOusdfvxTA5WPIQcIvkCm9A+o6sJaf417tm7nJUKwwV810aWQOwamKFFJ21Fd+DQEgaKqwq+tFQF811RYiFbvXGZPQz/XGtQ4UHrPGX7F4JYmnl6hKLByy7mGSyFVwfrKPRRF3gxo8h502gwcvK42MwTEH2h8obLCuIYIMQNgaohBdAvX6fyssX74Y/Uu7cbavQWYScTYR1+A==
Received: from LV3PR12MB9404.namprd12.prod.outlook.com (2603:10b6:408:219::9)
 by CH3PR12MB9099.namprd12.prod.outlook.com (2603:10b6:610:1a5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Thu, 15 Jan
 2026 22:08:29 +0000
Received: from LV3PR12MB9404.namprd12.prod.outlook.com
 ([fe80::57ac:82e6:1ec5:f40b]) by LV3PR12MB9404.namprd12.prod.outlook.com
 ([fe80::57ac:82e6:1ec5:f40b%5]) with mapi id 15.20.9499.005; Thu, 15 Jan 2026
 22:08:29 +0000
From: Chaitanya Kulkarni <chaitanyak@nvidia.com>
To: Will Deacon <will@kernel.org>, Chaitanya Kulkarni
	<ckulkarnilinux@gmail.com>, "joro@8bytes.org" <joro@8bytes.org>
CC: "robin.murphy@arm.com" <robin.murphy@arm.com>,
	"robin.clark@oss.qualcomm.com" <robin.clark@oss.qualcomm.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Chaitanya Kulkarni
	<chaitanyak@nvidia.com>, "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH] iommu/io-pgtable-arm: fix size_t signedness bug in unmap
 path
Thread-Topic: [PATCH] iommu/io-pgtable-arm: fix size_t signedness bug in unmap
 path
Thread-Index: AQHccT9KC2G/q3IlG0Si3P8xEFPPYLVEMSgAgA/DTQA=
Date: Thu, 15 Jan 2026 22:08:29 +0000
Message-ID: <4c3e1d10-50f6-475a-bd46-46358e0bc69e@nvidia.com>
References: <20251219232858.51902-1-ckulkarnilinux@gmail.com>
 <aVwsThVhGG-6bINs@willie-the-truck>
In-Reply-To: <aVwsThVhGG-6bINs@willie-the-truck>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR12MB9404:EE_|CH3PR12MB9099:EE_
x-ms-office365-filtering-correlation-id: 29489b4a-bde4-4627-b294-08de54829d17
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|10070799003|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?dHNFSmpsc1d6dmdaQmJSUnJqQWYxRXp1cUlZV3Jjd2Jud0t2UzQ2S1RsY1No?=
 =?utf-8?B?UXJXa24xaVk2Tnk5SFUxVnlzM1ozTnBqaisxb3plMHoyUXlXMkFNa2NBNTB3?=
 =?utf-8?B?Q2ZmSTg1cDZJSUdJWUlVVk9zRnA2ZGdYMkdJTEYzenlIbGVxM0R3bEUvMytS?=
 =?utf-8?B?RjNhMjlCcE1uUW9xT1p0MDhidG5qWE9lM2h4Z25DTVZyMzkrYVdlUFRIL2dn?=
 =?utf-8?B?bVloaDdkL2dqSjlMZEl4THV5ZDAyRXZoQUlKMjYwSFk0NUV3NUJPNTh5VUN1?=
 =?utf-8?B?d2NtajBzQzgzTkg3YXdVNXNydGozTzduUmJmTDQrblJhQXVRaUlBbXR6RTFR?=
 =?utf-8?B?R2Z2M1ZlNEhFdGN0NTJ3S2Npc3BIWHRSYmdIRTNIcEk1Wk40YWIxb3RnaFBE?=
 =?utf-8?B?aHhDK2tRTmUzaW94eFBvRDdqZjBiQ3FjOGtMYlFvN3dZV1VFcllPa2E0R3dD?=
 =?utf-8?B?QjJ1Q1pEVElJOTBrYjNhc0ZtY3ZoV1lyNEJQcm9McDRSQlluNUVQdlBEZkFO?=
 =?utf-8?B?eExSSkdJMzRRSktNSVVBMW8zK3owLytONlg5ZG5qZll6RUpxSDIxQnZNZ09t?=
 =?utf-8?B?Y3ZkQVoxcUNaMlJrSG9PQ3JlYUNZaUlMTTQ1NEZ4Qk9VUmdQd0hxTVljRUJN?=
 =?utf-8?B?aEd5UlYwNTNXRTNuaXN0ZFQ2REN3dFA3UVk5a25TK3lyZXVaYlV0OU9rSFR2?=
 =?utf-8?B?YStFTTJpb0xlQTd0eE53YjFBSjIxdEltNHlpTWhLZDgwVXg3YnpCVGxYRGpv?=
 =?utf-8?B?YU53K3hHT3NXT1BlcGFwam5uZjkrZ1VNbkxzMDhoV2wvbXg1QTBQSGtkdnNE?=
 =?utf-8?B?WmhFckJleTBJY0lVcnFkTzYzVFVUOVh1V0pWamFhM1N1cVM2eE5XSGFlclJs?=
 =?utf-8?B?ODJIRGJ3ZG9XRHJGVjZWUDBieWFCaTU1cU9YYnFuZCtaYWd4cjk5eFdqWU9o?=
 =?utf-8?B?VHBOODYyZncvM2IvQXV6RjRZb3BZUzRUQmZvT3V0M1JBQVlLTHFWOHVWRWE2?=
 =?utf-8?B?QXRHN2JMdGp0ZFM1V2lpVkkybFBFRXBJSE50QlRnczV0T3JVcjFscEZFMUl0?=
 =?utf-8?B?MFNjYVdybmRXQnNSZ0h3emNHczk4OTUwQ3FEKzFhNFNqMzVEVUFvWjlmTElt?=
 =?utf-8?B?S2tPckY4STZDZC85bVpBcU8xNDFyVFlTSUlLQTFwenFBbmlnWjJ6QmJ0NHJa?=
 =?utf-8?B?MVo0RVdEZUludXR4bzVsZTJOUkJzMTdOZXZHVTZjSGM1Vk5HVEF2M3pQT0la?=
 =?utf-8?B?K3puSHFsVWpjMDQzSHcrQlgyQ1I3OFh4L0I3RC9NNGdqS0tnamRmT2VOV2Uv?=
 =?utf-8?B?dDMzZElDTHFUVGdQd3lObjNVeEpVSWV4dXBXYW9MdzZ3UjRESmk4T2RPU3Mx?=
 =?utf-8?B?TW9qQ09MWmk3eXBFeU1GTHF6VHNXY0VJWXpmRDlGbFFIclRORFdyY0dZVXd2?=
 =?utf-8?B?SU9SRTlUZU5ncXRERWtKbXNXNlkzb0N1RFRxbzFZcW9jUFdNUE9KbUN6QlpI?=
 =?utf-8?B?Vzhpc095ZGpHSlFKRlc1M052NWwxNzYvTTR3SThzcXFYVGZTUzhPLzRNb09J?=
 =?utf-8?B?L3FrMEM4ckVUM1FQRFU3dlVwM0dxZmZFSHpibXNENGhNMnJlU1MydU9aWTZZ?=
 =?utf-8?B?TG0wT3JzWXN0blVMbWozS0dBaGV6bnM5SGRkQlo2eWVVOHhrYzMzYjNxd3Fv?=
 =?utf-8?B?ekM3Zm00WlFCc3Vjc24rQnBvcXpjcmMvM2xNSHRVNlh4MWk1TkFla0J1am1K?=
 =?utf-8?B?bzNNNUlTTTA5TTJ5Y0dZNko1V1BSOWU4MDdTT1dBM21LK0lGZytpZGc4SVVu?=
 =?utf-8?B?Wko4Z3lRRUJyTXhFWGZaVS9ITHNUU3o5MWY2NGRpZjhuWjNQbSs2U1ZxWWFh?=
 =?utf-8?B?RlZRa21YczdnQzFmbkRvYmphSW0zK0VNQ0ZBMlVNS2cxbFBjSTd6UXUza3Ba?=
 =?utf-8?B?WmJ4Z1FyMXlJNGttQWx1cXhwaXpWTGZKd1NCZW4xWUNkQ3c1S0dnUS9qeDZQ?=
 =?utf-8?B?WEJIOC8vZmU4V2N6MEp5WWFMQ1BpenRUTFVvWFJ6T3ZOSFpUai8zQXRvVEo1?=
 =?utf-8?B?VVNPYUtwNWtmd1FMZDdnUUczL2xUenovMFdJSXhueDRvekljS1NiKzZoVDUx?=
 =?utf-8?B?Q3ZsaDRvTlFWMmpXc1MzbUNKdUtYRDc4Wjc0Zll5SVdzN2ppVEVmVlJQWnBG?=
 =?utf-8?Q?mxs5DpTBZU430zoVA3jtsnE=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9404.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aTU2UGwvZUVReGF5YVpxTVRwMlpCTHVocytRQUhqUUp3d3dVTC9adUh5K3dM?=
 =?utf-8?B?OHRzWS83eHBtcEtaZldBaEd1OGF5ZEd2Vjdsdk1sY21UUjVQaEZJOU5zcW1x?=
 =?utf-8?B?MjRCak9CWnNycW4wVG9lcHh4UncxdTRtQmVSZzR6SkpoU09UdDdCRzNkOUhJ?=
 =?utf-8?B?U0NZTitTdXF5a04xZWNuWkcrUnJmUXo1b1JzQ2NwRVhJM2k3UWVKRzF4Wk0v?=
 =?utf-8?B?SU9EeEdJc0FDeFY0WDZCWnFjb0NvWmt3bHMvQk5INHY3b1lTZ3Zzb2pzY0ZS?=
 =?utf-8?B?cUIrV0h1KzRaRXA5bDVxQVJTSHRsZklGRHR6anp3QzVEcVcrMXM3UGxiQnJB?=
 =?utf-8?B?QUdROEFyVkM0djRld1lMMktkTCtURkJnU3JTcXpNU0phbXBzcGU0WnR0d2la?=
 =?utf-8?B?aW1YcmYvLzFlejJQVnpCN3daNXBEaEdSU2RIMjcyYkFybnMvSXp1ZEFhRlFO?=
 =?utf-8?B?YU4yS091eWRmUkJPSHh0cFE5aGpxdXBWNnM3am1TVmQvSHdKS09YdDZkQlBk?=
 =?utf-8?B?MFhGMjRNOVRXaXBSTGRCSFp1NDFDRzJLQXZnZEtHYVlyWHZCc0xabE0yYlZZ?=
 =?utf-8?B?WUtpalVVSHRGTTBKQnBIYnJTa2hjelQ3cm5Hc29GUys4cktsUUg4bWxkclpm?=
 =?utf-8?B?V3A5R0poOWhhSkZsNjdmWHN5ODlSaEg0TFYybjIwQjIxZm4vc1ZFSUplVkUx?=
 =?utf-8?B?d2N4MWY1bks4anZQQTFsc21kWnVkb0FtbDBLdmovOGE1WEFtakR1OHFtTVdx?=
 =?utf-8?B?YldTV2RUKzE0WEZ6WDVCbjFTS0NxaytCbWZrc0Z0UEc3cEJqeGJwcklrZ2gr?=
 =?utf-8?B?QnlVc1EwbTY1RmZzK3ZsSjNxQ2VPeHRBeE9wNm1uZDVkNmpsMlVjREdYcUE0?=
 =?utf-8?B?T2lWa3VUdC8xMHJHLzIrd1ZEWjd2b3BONXY5bEltMEhrUnBCNFc5QTZwTWYv?=
 =?utf-8?B?YWJLclB1Ry9SK21aUDNpK2FrMkRubXp2Zm9JSWV6Vy9ZaGwxVzRMMmYzYko4?=
 =?utf-8?B?S3oydU5lNFN2MGc5dHRiZ0RaWGplR05NMytkS0MxZGZ1SGVQMnpvOWxRa0VW?=
 =?utf-8?B?QWJsdEovdnlMZWExN25JWTRHTm55d21wSzI5VCthNnd6R0pleHVkVFptbkt6?=
 =?utf-8?B?M0thYW5uRTM2eEI2Tm93YmYyaEV3Sm1QLzBKbjcwOVhBZnVJM2ozMkdXUEdG?=
 =?utf-8?B?RWIvTmMyeDlPcTVvRXdPR09uclJObmNQNmxqRjNQYkVXOVRqNFdCTllGV29D?=
 =?utf-8?B?eitKREpseVZ5MUcvdlB3VTRYMEZlVTdXWG5SQmFhSFl2Q1NhMUJwOU5xWEJi?=
 =?utf-8?B?OGFoQXdvSTNiUWFwZGozL1h3OUwyS0FLWU9HNXd0UEJYdWJoQzlsQmFOWEhD?=
 =?utf-8?B?Z0Z1S2Yrc0IrQ1lKQ1V1VWtqOUo2cXF0Y1lRSjhDMTgrZ05jSWJqNnBwMHlo?=
 =?utf-8?B?Szh1UzVKdnlUNTgyWXM4Q1BXZWtwZnQ5Mkx3anRHa0hDTFJoZFBnVjJNem85?=
 =?utf-8?B?WDhsRWVRSUtrTVhrenZFcEVCajIxYW9OMXNhQWpKNDJicElqVWFWMS9IazBp?=
 =?utf-8?B?czJwOWFaNTlFRkVhZy9sU2dCdHREWXcxdnVLNktpRzJ5bGZyQU1GL0pkSzQ4?=
 =?utf-8?B?R2hjSStDMlVKcnRhZEJNZGZYb3dlYytpc1ZYSU04aTkzVHBSOWkxNHNNU1JS?=
 =?utf-8?B?emhyZVAxY1lYdllvSS9Rd3d2SnVjVXZERVRjVEIxeis0Q1dWZG50SmlUYVRY?=
 =?utf-8?B?ZVBrYitxaUJqRS9JUk9PZUsvdlRMUXd4S3JndE5ZY1ZGWFhjTkdCb1MyeGxr?=
 =?utf-8?B?SGxkc1FIeEZrVy9zOEV0QUlZeC9IeklLTEdxLzFhUHJLQ2hFNWFCNmJqOERt?=
 =?utf-8?B?ZCtRbk1LWk1zRm9keHJGMFdVckE0a0ZwaEpObU9DekpjbnJtTDBoT0FsVnAx?=
 =?utf-8?B?Sy9yTVV5YTMvZUZvN29DNy84czE2R1BGdHVQMkhjc0J5NTZzK1BZNVhUd20r?=
 =?utf-8?B?ZTh4ZlRLZEx3LzRDMWJXRnhyVU9jYnVtbXpnVnd5MGZLTXJ6RXlCUWs1UmRS?=
 =?utf-8?B?Ly8vbHc3Umc1WGV0V1pSbXYxL01Id3RNQzFlcFpDck56U3pNemZ6RmYwcDBR?=
 =?utf-8?B?eWlMYnVieHI1SUhpQ1BpWVl1dVVnL1hPWTJWcFN3U05IYWxDOUFZdXVyamcy?=
 =?utf-8?B?SStCRTNjQXRFUU1ySjNDWGZHTTQ5YnhZWE93M1cxMFNmTm1RQ0tkS3BzdHEy?=
 =?utf-8?B?N1drOFExR1crelVFRUF3NGFYdXVFeWFlaHVYdGY4QzdWZVVBcU1zSW11NlFI?=
 =?utf-8?B?RVZBR1dML2tJZEhSQWNGTUx0aW03d1JnSmZxZXRESmp1dG1Jdk93Zjd5bFEr?=
 =?utf-8?Q?8decQ5/v4Vi04KwhAUuyV0VmZ8Rc9A+Ug0ab74Mik021v?=
x-ms-exchange-antispam-messagedata-1: gfqJQWdQd9/TvQ==
Content-Type: text/plain; charset="utf-8"
Content-ID: <B6BBD7A83F9D9C439BB11CE53A41DD51@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9404.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29489b4a-bde4-4627-b294-08de54829d17
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2026 22:08:29.0649
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XN69EBJEO+dmygbrVJzNP67MCuAU5Di3R03Iv5j8rC1vujDmQvc9O446R2few4KX6+Ko54abVPamNm6aPx8jiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9099
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_140835_276885_61EA8048 
X-CRM114-Status: GOOD (  19.17  )
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

T24gMS81LzI2IDEzOjI1LCBXaWxsIERlYWNvbiB3cm90ZToNCj4gT24gRnJpLCBEZWMgMTksIDIw
MjUgYXQgMDM6Mjg6NThQTSAtMDgwMCwgQ2hhaXRhbnlhIEt1bGthcm5pIHdyb3RlOg0KPj4gX19h
cm1fbHBhZV91bm1hcCgpIHJldHVybnMgc2l6ZV90IGJ1dCB3YXMgcmV0dXJuaW5nIC1FTk9FTlQg
KG5lZ2F0aXZlDQo+PiBlcnJvciBjb2RlKSB3aGVuIGVuY291bnRlcmluZyBhbiB1bm1hcHBlZCBQ
VEUuIFNpbmNlIHNpemVfdCBpcyB1bnNpZ25lZCwNCj4+IC1FTk9FTlQgKHR5cGljYWxseSAtMikg
YmVjb21lcyBhIGh1Z2UgcG9zaXRpdmUgdmFsdWUgKDB4RkZGRkZGRkZGRkZGRkZGRQ0KPj4gb24g
NjQtYml0IHN5c3RlbXMpLg0KPj4NCj4+IFRoaXMgY29ycnVwdGVkIHZhbHVlIHByb3BhZ2F0ZXMg
dGhyb3VnaCB0aGUgY2FsbCBjaGFpbjoNCj4+ICAgIF9fYXJtX2xwYWVfdW5tYXAoKSByZXR1cm5z
IC1FTk9FTlQgYXMgc2l6ZV90DQo+PiAgICAtPiBhcm1fbHBhZV91bm1hcF9wYWdlcygpIHJldHVy
bnMgaXQNCj4+ICAgIC0+IF9faW9tbXVfdW5tYXAoKSBhZGRzIGl0IHRvIGlvdmEgYWRkcmVzcw0K
Pj4gICAgLT4gaW9tbXVfcGdzaXplKCkgdHJpZ2dlcnMgQlVHX09OIGR1ZSB0byBjb3JydXB0ZWQg
aW92YQ0KPj4NCj4+IFRoaXMgY2FuIGNhdXNlIElPVkEgYWRkcmVzcyBvdmVyZmxvdyBpbiBfX2lv
bW11X3VubWFwKCkgbG9vcCBhbmQNCj4+IHRyaWdnZXIgQlVHX09OIGluIGlvbW11X3Bnc2l6ZSgp
IGZyb20gaW52YWxpZCBhZGRyZXNzIGFsaWdubWVudC4NCj4+DQo+PiBGaXggYnkgcmV0dXJuaW5n
IDAgaW5zdGVhZCBvZiAtRU5PRU5ULiBUaGUgV0FSTl9PTiBhbHJlYWR5IHNpZ25hbHMNCj4+IHRo
ZSBlcnJvciBjb25kaXRpb24sIGFuZCByZXR1cm5pbmcgMCAobWVhbmluZyAibm90aGluZyB1bm1h
cHBlZCIpDQo+PiBpcyB0aGUgY29ycmVjdCBzZW1hbnRpYyBmb3Igc2l6ZV90IHJldHVybiB0eXBl
LiBUaGlzIG1hdGNoZXMgdGhlDQo+PiBiZWhhdmlvciBvZiBvdGhlciBpby1wZ3RhYmxlIGltcGxl
bWVudGF0aW9ucyAoaW8tcGd0YWJsZS1hcm0tdjdzLA0KPj4gaW8tcGd0YWJsZS1kYXJ0KSB3aGlj
aCByZXR1cm4gMCBvbiBlcnJvciBjb25kaXRpb25zLg0KPj4NCj4+IEZpeGVzOiAzMzE4ZjdiNWNl
ZmIgKCJpb21tdS9pby1wZ3RhYmxlLWFybTogQWRkIHF1aXJrIHRvIHF1aWV0IFdBUk5fT04oKSIp
DQo+PiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZw0KPj4gU2lnbmVkLW9mZi1ieTogQ2hhaXRh
bnlhIEt1bGthcm5pIDxja3Vsa2FybmlsaW51eEBnbWFpbC5jb20+DQo+PiAtLS0NCj4+ICAgZHJp
dmVycy9pb21tdS9pby1wZ3RhYmxlLWFybS5jIHwgMiArLQ0KPj4gICAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9pb21tdS9pby1wZ3RhYmxlLWFybS5jIGIvZHJpdmVycy9pb21tdS9pby1wZ3RhYmxlLWFybS5j
DQo+PiBpbmRleCBlNjYyNjAwNGIzMjMuLjA1ZDYzZmU5MmU0MyAxMDA2NDQNCj4+IC0tLSBhL2Ry
aXZlcnMvaW9tbXUvaW8tcGd0YWJsZS1hcm0uYw0KPj4gKysrIGIvZHJpdmVycy9pb21tdS9pby1w
Z3RhYmxlLWFybS5jDQo+PiBAQCAtNjM3LDcgKzYzNyw3IEBAIHN0YXRpYyBzaXplX3QgX19hcm1f
bHBhZV91bm1hcChzdHJ1Y3QgYXJtX2xwYWVfaW9fcGd0YWJsZSAqZGF0YSwNCj4+ICAgCXB0ZSA9
IFJFQURfT05DRSgqcHRlcCk7DQo+PiAgIAlpZiAoIXB0ZSkgew0KPj4gICAJCVdBUk5fT04oIShk
YXRhLT5pb3AuY2ZnLnF1aXJrcyAmIElPX1BHVEFCTEVfUVVJUktfTk9fV0FSTikpOw0KPj4gLQkJ
cmV0dXJuIC1FTk9FTlQ7DQo+PiArCQlyZXR1cm4gMDsNCj4+ICAgCX0NCj4+ICAgDQo+PiAgIAkv
KiBJZiB0aGUgc2l6ZSBtYXRjaGVzIHRoaXMgbGV2ZWwsIHdlJ3JlIGluIHRoZSByaWdodCBwbGFj
ZSAqLw0KPiBBY2tlZC1ieTogV2lsbCBEZWFjb24gPHdpbGxAa2VybmVsLm9yZz4NCj4NCj4gSm9l
cmcgLS0gcGxlYXNlIGNhbiB5b3UgcGljayB0aGlzIG9uZSB1cCBmb3IgNi4xOS1yYz8NCj4NCj4g
Q2hlZXJzLA0KPg0KPiBXaWxsDQoNCkpvZXJnLCBnZW50bGUgcmVtaW5kZXIgb24gdGhpcyBpZiB0
aGlzIGlzIG5vdCBhbHJlYWR5IGFwcGxpZWQuDQoNCkluIGNhc2UgaXQgaXMgcGxlYXNlIGlnbm9y
ZSB0aGlzLg0KDQotY2sNCg0KDQo=

