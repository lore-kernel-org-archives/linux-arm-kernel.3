Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCE42C531F9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 07:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b0NSJUOPRVY6HjG3n4/Yo1/5qTSGvAksFWraSPYWnZw=; b=d/atBmeaIbchOtoShYMW+oyHc8
	HOs1UPOG2mhQgS3Evagt6QU7aeBX+YQgPjTR0ZvrbG4/tBckIKr8EhHk4OhiFVP8K1NFmahKqF9Jw
	3LXQcCtq1BSxmXbftvDB5auox1C00Dn0Rb1pxxYOcPE1HSRrzW2j+q0Njfa550TsKbtTvvU948ks8
	Kg1Ebjm8UNdcnayLiPbKGg7SMIiTvznLf5LADTJcPgEmL8k1hBryaOx8Ptg1sVbLB7GdlUurx3KS9
	27A+WmSu9ILWoNeCv8sKYQNM/9ESpnja7ZMqUO/0J5Uwa1y828qh05PL6TRd5qyUTullZGTHa4YXE
	L55WxJaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnATr-0000000FiKT-0CLj;
	Fri, 24 Jul 2026 07:38:03 +0000
Received: from mail-southcentralusazlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c10d::1] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnATn-0000000FiK1-3qQ5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 07:38:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l3ol2eIGMCiPH4LPkEpw/qiRoosdZqp4eLNeVM35CASNd9J+k3Vp9BCOUNvhEHVHqyjwRTc1jtJVTBw+Q50GrTw2wH+/wNennblUYdUdKPRukDL67zNRCoH6/C9pWjZkPOyvffS30COi8YWr5qvOBBO0YnuGv3XjP1HPtYg9a5oiL9e/1fCxNP3zRsVxQaB7MREuxmJFXEFbF2pMlY3LZTxKHArBbtviJiXeiexMmNxCAtEVNi7s5572AoZGAnDehb9I/MyCG1Pz2dZR5aWyBaLdugmcfBep/78EO+Pb5NgW3X8UCo0sR3/Ym67thBLOdJICpgemT7VbvVV39jXjlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b0NSJUOPRVY6HjG3n4/Yo1/5qTSGvAksFWraSPYWnZw=;
 b=LnU6lzqY3Pk0a5ynSyWghd/Jx9Vr+qwudqo9754jwjsO3ZYq2hsNFdv5SQ8us9HP6D9a9ToqNg5r/CrmMWos4UdyB17fJMHsgspKIw2TFXP29nBdfGEc30FKI1wRgN/E8UF2cHK5ZEFigJDU68tNmnXh8rO5k+i7C5+ZvolWJVRrQJx/tmacqNRFAAWnWBob6WFl1JI6RW34QO8fcc/Gnsa1DYKZ6hc5WnCVvatVVkFcCxdfRvi1XggIPdQy5JMDGpj22qGcYYkJionpzT+k2EBX39bSI+ers3Iol4d01Kfu2Mp0ktj6ocxxq7oM7uiQILF4gFsAOLlV9f4t/W22gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b0NSJUOPRVY6HjG3n4/Yo1/5qTSGvAksFWraSPYWnZw=;
 b=QUWAN32bwD7TLnleMBdwFrr/oO99sgRQ2vUO2P/ALPZjfBXX/ruBxS1lUB3pNIi6ZGvYVf8R4tbrg7cZSAYEC8hGp9ach2ypmYz3RORJ8+Tp3C8nJXBrvwWZLg+k6Ii8R7iHoDsoMKht6RPSTfN4nApLOv753Q7yFjVAH2IFkY0=
Received: from SA1PR12MB7366.namprd12.prod.outlook.com (2603:10b6:806:2b3::8)
 by SJ0PR12MB6928.namprd12.prod.outlook.com (2603:10b6:a03:47a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 07:37:52 +0000
Received: from SA1PR12MB7366.namprd12.prod.outlook.com
 ([fe80::ec75:5e87:d973:77e6]) by SA1PR12MB7366.namprd12.prod.outlook.com
 ([fe80::ec75:5e87:d973:77e6%5]) with mapi id 15.21.0245.010; Fri, 24 Jul 2026
 07:37:51 +0000
From: "Buddhabhatti, Jay" <jay.buddhabhatti@amd.com>
To: Prasanna Kumar T S M <ptsm@linux.microsoft.com>, "Simek, Michal"
	<michal.simek@amd.com>, "git (AMD-Xilinx)" <git@amd.com>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 4/4] firmware: xilinx: Use TF-A feature check for TF-A
 specific APIs
Thread-Topic: [PATCH 4/4] firmware: xilinx: Use TF-A feature check for TF-A
 specific APIs
Thread-Index: AQHdGqHhmhCBozLHDE2PDzXKeDPMRrZ8NsQAgAASCIA=
Date: Fri, 24 Jul 2026 07:37:51 +0000
Message-ID: <SA1PR12MB7366EBA8B05C87F90AA8B07F9DCF2@SA1PR12MB7366.namprd12.prod.outlook.com>
References: <20260723124841.2567827-1-jay.buddhabhatti@amd.com>
 <20260723124841.2567827-5-jay.buddhabhatti@amd.com>
 <d910521d-0446-4b78-b717-062c263eea9f@linux.microsoft.com>
In-Reply-To: <d910521d-0446-4b78-b717-062c263eea9f@linux.microsoft.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Enabled=True;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SetDate=2026-07-24T07:35:42.0000000Z;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Name=AMD
 General
 v26;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_ContentBits=3;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB7366:EE_|SJ0PR12MB6928:EE_
x-ms-office365-filtering-correlation-id: ff09b92e-04c1-45e9-13ba-08dee9567790
x-ld-processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|38070700021|6133799003|4143699003|11063799006|5023799004|10067099003|56012099006|22082099003|18002099003;
x-microsoft-antispam-message-info: kZJNEpIMIByg8PWV4sNgV+ylo0K6mRy7agX15aT+GjntV0yAaNL/5E00tzb1gMtkZf25ZbRA/BbI92dN8XWtZ4/7nyeRJIM5J3vKU7ntZ5YEmPNBfhvZ0jk9UTdxfQyB+CGC+mWaEXCuP1d+HWg5cGKRKbxh5dLuQpSk6W7jNEbUxnv3mwaU5aBYSEfBxMTKG4DO3k+iQ1pzxwkV606U5d+C9ZkYburfOm1ifOWqx0Wum5wN+9jb8wg88DMqq1ldG+G+hGa3c0JMy7q+a/kD4CGE+9sIszDt4L0eu9iZt3xfkG9MTea5yXc/4Mu/11MKE1e/05dpKjxvA1fw6lLTxeOIARMTsG//yztv23EjyV5SDoJO07EK1q8MKNyom8m1PXG7pEEkzR0xyJugulxS+7D9CgycARiB7dm8HZF1ZbtpC4zI1dLSOJG+fsdzsTZT0RkflelPiy7R/UtTf79s50He4Kq1nDNxlo3Vdq4Gkgwl8ILcYqDfRsKQIhIeM8gVc53UgMQreGXjlcYaHaXPq0G7idtlbzLXz3Wp7lKV4GNcYr3dtn82CtGvV3Czo1rnfq7G6gcr7j6S8ySgTKXq7BKQ7Pugg0kQQAZEtGgGP23Mi9igxu5jtJhwqlw3kAb5ISXLhgceBckmmQIYOQRYSc2uVtOUDDx27ipAlGyxpuNtG8HPJklfFbvYltA78Y3d07Zsp9zzEp7mL51SixKYUQJ4s6GhvqtzkX0fuqDz0dE=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR12MB7366.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(38070700021)(6133799003)(4143699003)(11063799006)(5023799004)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cU1zbGNjTnJ6L1Njcm40WUJkN3Fodlo1MDlqNUgyd1JTbmxzYnVJb2tDd0pZ?=
 =?utf-8?B?V2VjRDVLcFVVY2ttYktVY1pYS01ibXVDTXg3WEFuRzJ0RHBOanZiWmExTzJz?=
 =?utf-8?B?WlFNQmVGd1BEZ0twTmFnb1pxdW1BaDhPb3h6clhSVSsxKzlXcEtpbXlzc0g1?=
 =?utf-8?B?UnlMV2JwT0hBTGV6OWc2Mzhnd25raUJZa25mdUg5ZlNKYmJTWnJoSFhOSys0?=
 =?utf-8?B?MHJQSXd3RENwKzJBVzFyUmZkQ0VFSllsZS91UGVaMkczZWZSdGIzTmlXczY2?=
 =?utf-8?B?MWdIL1hTYWFZQmdLS0xidHVDOWRoVUJCY1VSRmtxUTFNZUlvMm55R3pwS3V6?=
 =?utf-8?B?WGczTk5qWW5QMnJESzNGNzhPSEJ1WDQ2TU1mcm1WS1dhUHV6SHJBTjdCWFA5?=
 =?utf-8?B?QVNkK1B1UzJGeDlOeTRBUERWcUxBRjRaSm5NZ0hwVndHMUVQcmU2U0RqUFY0?=
 =?utf-8?B?YUtIR25ta2wyaytYVzNOM3BCOWdKcXNpL1V2RmZBNnpFSjJDdms4eUs0RkJQ?=
 =?utf-8?B?Z0NQV1dZMGsxN3ZIcm1CS04yNE9oZWY1U1hYS2JPS2NZVjBISzYvMHFMUlNF?=
 =?utf-8?B?NHpua3JUcCtFNllYVzQzb0tWVUdwejNOdVhuN2J2d2lMb0l1d0Z6bjIxb0V6?=
 =?utf-8?B?V0VhOWlGWVBNNldSWUVVV0xybmtGeTJ6MEptaXFVL240blBrQi9heFZrUVZy?=
 =?utf-8?B?YzNpczZaY1R3S20rMEE2Umx0K3pBSjgwUGdRcE9vaTZLYjJwN1RVNENJZVAv?=
 =?utf-8?B?aDdCbzVnVVRoMU5MNW9VYzA0d1RRd3lZczJEdEJBSU5NVWFHcG1JSjExQ3VW?=
 =?utf-8?B?SGZvamh4a0NLdTMrS3doTDdUUUZZd0ZZWG8rTjJIeDZUZWoweTdKTk4vUXNT?=
 =?utf-8?B?L3NFMHZ3Mk5sci9YZ1VycnlSZGpmbjBjMkthY2hvZEV1ck5GbitqMXRoRXFu?=
 =?utf-8?B?aEFZSDEwdEpaanFhVFJBWWV0ejJsM1RuZXRoMytUeDIyMWRHeGZFcmVDMVlC?=
 =?utf-8?B?VUFyNmxVdlZZVVJkNWxxYXNWaWxNNUQwQmw5dDVKMVhoWTMyQjJjRnhlMEtR?=
 =?utf-8?B?VjIzNnk4VjZLYkZQVHFQTzAyZ1l4dUlidDBhUkhsemZ4QUN3VDlDcmxYNnZp?=
 =?utf-8?B?SWxLT2x4WTRBUnYwMndHTWNveURoNVNGZHE1TDVmK29qRUFrbWl2UkJxWEdC?=
 =?utf-8?B?MS8zL2p1ZzNjTjhvazNOUFVSc3Y2NVBMUnpUd2J4eFltcFRlWFRsTEN5NnBK?=
 =?utf-8?B?bWl0RGJXU0srL25tUVJ2Z2hRa0s1Zlo5Q2lOUlA4ZHB3YnBiRVVVZFdDRmRM?=
 =?utf-8?B?WTBXYkM0T3JWazdIMHlqV1BjbTBKVksxam1RUCs4Tm8xbzM5Q2hONGJaN1Nh?=
 =?utf-8?B?bWNOYkRRRmxMT2ZXbERRUFpWMlJjc0h1YU1TRm45anUwOUlHYWl6c1JjUzZR?=
 =?utf-8?B?djJxV1daRlFJQW9menM3d28rMUI4NjcwUG5CSDhtdDBSSFV5L240MXRWcDdI?=
 =?utf-8?B?RkROL2tQalVUWm52N2NXYjdUWGwvcEo5NUdJYVA4Y2JLQ3RqcDMvWk9aVXRk?=
 =?utf-8?B?V3QyR1AraDRXNkkwZVZjVVdNdVBqa2ZSS0kwY291ZkNtb29aeW51MGNqMytJ?=
 =?utf-8?B?STNyekUvRXhQeHQzU3RueWxuRk1vems2ZCtPd0lpcFlEdkJ1T00vZ016Ykk2?=
 =?utf-8?B?OUZoWlpnQ1ZtcmVtL0tpQllCR05CN005Q3RQOWZRQys0ODhXejlhR3dEV1hZ?=
 =?utf-8?B?ZEowMjJEbDNBMEYwL05NeWtrR21ybjZnWDN0K1BNZlBOOFBpQjJvNmpaTXV2?=
 =?utf-8?B?S1daSXNQcldTbXFVZ0RNdzdFWkZ5WUFWQXhwbVd5QkV2YTQ0dmNyQVcrZHdV?=
 =?utf-8?B?UkNJOVd6SzduVGwwN2RNbVVIZ3hhLzBMMk5INHBMdFUvT28zY0pzQTlxVEhF?=
 =?utf-8?B?N1RjbDZxZmVPVUZGTzdRSGlZdFVLOE52ODc4dWs4WVhQdktrd1ZTVDJpMUpl?=
 =?utf-8?B?Q0g4SnZUYmp2TUJadDdmcGQ0OTRtWEJOUkVuVDhnOW5CNDZ6YnBORzFDYUNm?=
 =?utf-8?B?aGRuYWJ2SHJ3MkZXRVlNclFJMCtKMlVsUUFLRStPSUNWbE5nRkdHelZKdGl3?=
 =?utf-8?B?aUt5TEtIMzJhREhGbDJNU0hSSTE3UkN1OVgxa2lQeWVyZ2tqd2RoQzI0Mkli?=
 =?utf-8?B?V1FSSmg5K2J3ZnIxeXp1NmxlL1dWTFZTZUJoSVNlZ25JMXo2aUZZNXZYbHZC?=
 =?utf-8?B?T2U1cUtsOWNBTVNpTzIyS2duS1ZRc3FwRUdrQ3lOemJabzQ1RHhldmlOQTVz?=
 =?utf-8?Q?E86rAkN2X26sxMBffY?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB7366.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff09b92e-04c1-45e9-13ba-08dee9567790
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2026 07:37:51.5013
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yiLUaaZNzU3y5os50JdTEdoUgmhGVG2HL3emfWev21yjJD1EzxbDv9DTFxkorKJYcod0ozTme8LVu3PERIhVqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6928
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_003800_001340_A664B731 
X-CRM114-Status: GOOD (  27.34  )
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

QU1EIEdlbmVyYWwNCg0KSGkgUHJhc2FubmEsDQoNClRoYW5rcyBmb3IgdGhlIHJldmlldyBhbmQg
dGhlIFJldmlld2VkLWJ5IHRhZy4NCg0KPi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJv
bTogUHJhc2FubmEgS3VtYXIgVCBTIE0gPHB0c21AbGludXgubWljcm9zb2Z0LmNvbT4NCj5TZW50
OiBGcmlkYXksIEp1bHkgMjQsIDIwMjYgMTI6MDEgUE0NCj5UbzogQnVkZGhhYmhhdHRpLCBKYXkg
PGpheS5idWRkaGFiaGF0dGlAYW1kLmNvbT47IFNpbWVrLCBNaWNoYWwNCj48bWljaGFsLnNpbWVr
QGFtZC5jb20+OyBnaXQgKEFNRC1YaWxpbngpIDxnaXRAYW1kLmNvbT4NCj5DYzogbGludXgtYXJt
LWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3Jn
DQo+U3ViamVjdDogUmU6IFtQQVRDSCA0LzRdIGZpcm13YXJlOiB4aWxpbng6IFVzZSBURi1BIGZl
YXR1cmUgY2hlY2sgZm9yIFRGLUEgc3BlY2lmaWMNCj5BUElzDQo+DQo+SGkgSmF5LA0KPg0KPk9u
IDIzLTA3LTIwMjYgMTg6MTgsIEpheSBCdWRkaGFiaGF0dGkgd3JvdGU6DQo+PiBDdXJyZW50bHks
IFRGLUEtc3BlY2lmaWMgQVBJcyBhcmUgdmFsaWRhdGVkIHVzaW5nIHRoZSBmaXJtd2FyZQ0KPj4g
UE1fRkVBVFVSRV9DSEVDSyBBUEksIGV2ZW4gdGhvdWdoIFRGLUEgcHJvdmlkZXMgYSBkZWRpY2F0
ZWQgbWVjaGFuaXNtDQo+PiB2aWEgUE1fQVBJX0ZFQVRVUkVTIEFQSS4gSWRlYWxseSBpdCBzaG91
bGQgdXNlIHRoZSBURi1BIGZlYXR1cmUgY2hlY2sNCj4+IChQTV9BUElfRkVBVFVSRVMpIGZvciBU
Ri1BIHNwZWNpZmljIEFQSXMuIFVwZGF0ZSB0aGUgZmVhdHVyZSBjaGVjaw0KPj4gbG9naWMgZm9y
IFRGLUEgc3BlY2lmaWMgQVBJIGNhbGxzIHRvIGVuc3VyZSBpdCBpcyB2YWxpZGF0ZWQgdXNpbmcN
Cj4+IFBNX0FQSV9GRUFUVVJFUy4gSWYgdGhpcyBjaGVjayBmYWlscywgZmFsbCBiYWNrIHRvIHRo
ZSBsZWdhY3kNCj4+IFBNX0ZFQVRVUkVfQ0hFQ0sgdG8gc3VwcG9ydCBiYWNrd2FyZCBjb21wYXRp
YmlsaXR5Lg0KPj4NCj4+IFdoZW4gZG9fZndfY2FsbCgpIGZhaWxzLCBwcm9wYWdhdGUgdGhlIGVy
cm5vIGZyb20genlucW1wX3BtX3JldF9jb2RlKCkNCj4+IGluc3RlYWQgb2YgYWx3YXlzIHJldHVy
bmluZyAtRU9QTk9UU1VQUC4gVGhpcyBhcHBsaWVzIHRvIGV2ZXJ5IG1vZHVsZQ0KPj4gSUQsIG5v
dCBvbmx5IFRGLUEsIGJlY2F1c2UgdGhlIHJld3JpdGUgc2F0IGluIHRoZSBjb21tb24gZmFpbHVy
ZSBwYXRoLg0KPj4gRXhpc3RpbmcgY2FsbGVycyBvbmx5IHRlc3QgcmV0IDwgMCBhbmQgYXJlIHVu
Y2hhbmdlZC4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBKYXkgQnVkZGhhYmhhdHRpIDxqYXkuYnVk
ZGhhYmhhdHRpQGFtZC5jb20+DQo+PiAtLS0NCj4+ICAgZHJpdmVycy9maXJtd2FyZS94aWxpbngv
enlucW1wLmMgfCAzMSArKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tDQo+PiAgIDEgZmls
ZSBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCAxNCBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9maXJtd2FyZS94aWxpbngvenlucW1wLmMNCj4+IGIvZHJpdmVycy9m
aXJtd2FyZS94aWxpbngvenlucW1wLmMNCj4+IGluZGV4IGZjNzIxMmY1NTRlZS4uMGI2YzIwYTFk
OGJlIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9maXJtd2FyZS94aWxpbngvenlucW1wLmMNCj4+
ICsrKyBiL2RyaXZlcnMvZmlybXdhcmUveGlsaW54L3p5bnFtcC5jDQo+PiBAQCAtMjI0LDM0ICsy
MjQsMzcgQEAgc3RhdGljIGludCBfX2RvX2ZlYXR1cmVfY2hlY2tfY2FsbChjb25zdCB1MzIgYXBp
X2lkLA0KPnUzMiAqcmV0X3BheWxvYWQpDQo+PiAgICAgIG1vZHVsZV9pZCA9IEZJRUxEX0dFVChN
T0RVTEVfSURfTUFTSywgYXBpX2lkKTsNCj4+DQo+PiAgICAgIC8qDQo+PiAtICAgICAqIEZlYXR1
cmUgY2hlY2sgb2YgQVBJcyBiZWxvbmdpbmcgdG8gUE0sIFhTRU0sIGFuZCBURi1BIGFyZSBoYW5k
bGVkIGJ5DQo+Y2FsbGluZw0KPj4gKyAgICAgKiBGZWF0dXJlIGNoZWNrIG9mIEFQSXMgYmVsb25n
aW5nIHRvIFBNIGFuZCBYU0VNIGFyZSBoYW5kbGVkIGJ5DQo+PiArY2FsbGluZw0KPj4gICAgICAg
KiBQTV9GRUFUVVJFX0NIRUNLIEFQSS4gRm9yIG90aGVyIG1vZHVsZXMsIGNhbGwgUE1fQVBJX0ZF
QVRVUkVTDQo+QVBJLg0KPj4gICAgICAgKi8NCj4+IC0gICAgaWYgKG1vZHVsZV9pZCA9PSBQTV9N
T0RVTEVfSUQgfHwgbW9kdWxlX2lkID09IFhTRU1fTU9EVUxFX0lEIHx8DQo+bW9kdWxlX2lkID09
IFRGX0FfTU9EVUxFX0lEKQ0KPj4gKyAgICBpZiAobW9kdWxlX2lkID09IFBNX01PRFVMRV9JRCB8
fCBtb2R1bGVfaWQgPT0gWFNFTV9NT0RVTEVfSUQpDQo+PiAgICAgICAgICAgICAgZmVhdHVyZV9j
aGVja19hcGlfaWQgPSBQTV9GRUFUVVJFX0NIRUNLOw0KPj4gICAgICBlbHNlDQo+PiAgICAgICAg
ICAgICAgZmVhdHVyZV9jaGVja19hcGlfaWQgPSBQTV9BUElfRkVBVFVSRVM7DQo+Pg0KPj4gLSAg
ICAvKg0KPj4gLSAgICAgKiBGZWF0dXJlIGNoZWNrIG9mIFRGLUEgQVBJcyBpcyBkb25lIGluIHRo
ZSBURi1BIGxheWVyIGFuZCBpdCBleHBlY3RzIGZvcg0KPj4gLSAgICAgKiBNT0RVTEVfSURfTUFT
SyBiaXRzIG9mIFNNQydzIGFyZ1swXSB0byBiZSB0aGUgc2FtZSBhcw0KPlBNX01PRFVMRV9JRC4N
Cj4+IC0gICAgICovDQo+PiAtICAgIGlmIChtb2R1bGVfaWQgPT0gVEZfQV9NT0RVTEVfSUQpIHsN
Cj4+IC0gICAgICAgICAgICBtb2R1bGVfaWQgPSBQTV9NT0RVTEVfSUQ7DQo+PiArICAgIGlmICht
b2R1bGVfaWQgPT0gVEZfQV9NT0RVTEVfSUQpDQo+PiAgICAgICAgICAgICAgc21jX2FyZ1sxXSA9
IGFwaV9pZDsNCj4+IC0gICAgfSBlbHNlIHsNCj4+ICsgICAgZWxzZQ0KPj4gICAgICAgICAgICAg
IHNtY19hcmdbMV0gPSAoYXBpX2lkICYgQVBJX0lEX01BU0spOw0KPj4gLSAgICB9DQo+Pg0KPj4g
ICAgICBzbWNfYXJnWzBdID0gUE1fU0lQX1NWQyB8IEZJRUxEX1BSRVAoTU9EVUxFX0lEX01BU0ss
IG1vZHVsZV9pZCkNCj58DQo+PiBmZWF0dXJlX2NoZWNrX2FwaV9pZDsNCj4+DQo+PiAgICAgIHJl
dCA9IGRvX2Z3X2NhbGwocmV0X3BheWxvYWQsIDIsIHNtY19hcmdbMF0sIHNtY19hcmdbMV0pOw0K
Pj4gKw0KPj4gKyAgICAvKg0KPj4gKyAgICAgKiBGb3IgVEYtQSBBUElzLCBpZiB0aGUgZmVhdHVy
ZSBjaGVjayB3aXRoIFBNX0FQSV9GRUFUVVJFUyBmYWlscywNCj4+ICsgICAgICogcmV0cnkgd2l0
aCB0aGUgbGVnYWN5IFBNX0ZFQVRVUkVfQ0hFQ0sgZm9yIGJhY2t3YXJkIGNvbXBhdGliaWxpdHku
DQo+PiArICAgICAqLw0KPj4gKyAgICBpZiAobW9kdWxlX2lkID09IFRGX0FfTU9EVUxFX0lEICYm
IHJldCkgew0KPj4gKyAgICAgICAgICAgIHNtY19hcmdbMF0gPSBQTV9TSVBfU1ZDIHwgRklFTERf
UFJFUChNT0RVTEVfSURfTUFTSywNCj5QTV9NT0RVTEVfSUQpIHwNCj4+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgUE1fRkVBVFVSRV9DSEVDSzsNCj4+ICsgICAgICAgICAgICByZXQgPSBkb19m
d19jYWxsKHJldF9wYXlsb2FkLCAyLCBzbWNfYXJnWzBdLCBzbWNfYXJnWzFdKTsNCj4+ICsgICAg
fQ0KPg0KPlRoaXMgbG9va3MgbGlrZSBhIGdlbmVyYWwgaW1wcm92ZW1lbnQgdW5yZWxhdGVkIHRv
IHRoZSBvdGhlciBwYXRjaGVzIGluIHRoaXMgc2VyaWVzLg0KPkkgdGhpbmsgdGhpcyBzaG91bGQg
Z28gYXMgYSBzZXBhcmF0ZSBwYXRjaCAobm90IGFzIGEgcGFydCBvZiB0aGlzIHNlcmllcykuDQo+
DQo+PiArDQo+PiAgICAgIGlmIChyZXQpDQo+PiAtICAgICAgICAgICAgcmV0ID0gLUVPUE5PVFNV
UFA7DQo+PiAtICAgIGVsc2UNCj4+IC0gICAgICAgICAgICByZXQgPSByZXRfcGF5bG9hZFsxXTsN
Cj4+ICsgICAgICAgICAgICByZXR1cm4gcmV0Ow0KPj4NCj4+IC0gICAgcmV0dXJuIHJldDsNCj4+
ICsgICAgcmV0dXJuIHJldF9wYXlsb2FkWzFdOw0KPj4gICB9DQo+Pg0KPj4gICBzdGF0aWMgaW50
IGRvX2ZlYXR1cmVfY2hlY2tfY2FsbChjb25zdCB1MzIgYXBpX2lkKQ0KPg0KPlRoZSByZXR1cm4g
dmFsdWUgY2hhbmdlIGlzIHNlcGFyYXRlIGltcHJvdmVtZW50IHVucmVsYXRlZCB0byB0aGUgc2Vy
aWVzIG9yIHRvIHRoZQ0KPlBNX0FQSV9GRUFUVVJFUyBBUEkgdXNhZ2UuIEkgdGhpbmsgdGhpcyBj
aGFuZ2UgY2FuIGJlIGNhcnZlZCBvdXQgdG8gYSBzZXBhcmF0ZQ0KPnBhdGNoLg0KPg0KPkV4Y2Vw
dCBmb3IgdGhlIGFib3ZlIG5pdHMsIGNvZGUgbG9va3MgZ29vZCB0byBtZS4NCkdvb2QgcG9pbnQu
IEkndmUgc3BsaXQgdGhlIG9yaWdpbmFsIHBhdGNoIDQvNCBpbnRvIHR3byBzdGFuZGFsb25lDQpw
YXRjaGVzIHNlbnQgYXMgYSBzZXBhcmF0ZSBzZXJpZXM6DQoNCiAgW1BBVENIIDEvMl0gZmlybXdh
cmU6IHhpbGlueDogVXNlIFRGLUEgZmVhdHVyZSBjaGVjayBmb3IgVEYtQS1zcGVjaWZpYyBBUElz
DQogIFtQQVRDSCAyLzJdIGZpcm13YXJlOiB4aWxpbng6IFByb3BhZ2F0ZSBhY3R1YWwgZXJyb3Ig
ZnJvbSBmZWF0dXJlIGNoZWNrDQoNClRoZSBrZXhlYyBzZXJpZXMgKHYyKSBub3cgY29udGFpbnMg
b25seSB0aGUgdGhyZWUga2V4ZWMtcmVsYXRlZCBwYXRjaGVzDQooMS0zKSB3aXRob3V0IGFueSBk
ZXBlbmRlbmN5IG9uIHRoZSBmZWF0dXJlIGNoZWNrIGltcHJvdmVtZW50cy4NCg0KVGhhbmtzLA0K
SmF5DQo+DQo+UmV2aWV3ZWQtYnk6IFByYXNhbm5hIEt1bWFyIFQgUyBNIDxwdHNtQGxpbnV4Lm1p
Y3Jvc29mdC5jb20+DQo+DQo+UmVnYXJkcywNCj5QcmFzYW5uYSBLdW1hcg0K

