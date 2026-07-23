Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 554E4C531F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 17:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kYSaYklFyPgE9vnP1NrmjFdFdsuzm6LCQCBa79aJwkQ=; b=IY97il1xe83ZU/GD8bvHOzyMLt
	nOz1A9127sLCFuOvqRnhvYAXkUfre7v468NF/zLhdvOvVUxqArp/FJWz57QVYSSEdtNDIuhJPBsav
	umnosAmF2qQrbwooc6gqWKjFvlsLn8qboMIxX/XJH/u4G0gTKMQZQUmdLGV80qdgsiPgf1q8BMvQu
	M5bl7YJtXPx3oQRShVey4VnR7rU6IbuRWVHLiVZKW/1oLXUCeop9eH+txAAVa7d3iAn1Oq50nrdO9
	GKk4XJjcE55LGgM+/gM9kNWl8SrenVobBXfcUBPNcCw7MmMPTwWv6l0WU/nQMcljSo1P1eeT5gAqJ
	OphvxQtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmwFb-0000000EiQv-1430;
	Thu, 23 Jul 2026 16:26:23 +0000
Received: from mail-westus2azolkn190120000.outbound.protection.outlook.com ([2a01:111:f403:d002::] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmwFW-0000000EiPQ-2cHH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 16:26:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=inFKMHTV3/jLRAsUmCGjKXOT4WWSS+5u7YjeAj7RSvxKJCzw+5rrAiz0MtNH1ylWg+HgAKys5vkZCYWilWrjyqtMuCkkUiqgCTeLxWYBxRd4I8Uf/bwYUZWsrd+mjmV7HiHt25PAFObr8ZtMkfJPs3+1F/8Qd4xPdle2JF/zlhnVpbXVX5H0sl9OHsNAEXDjd7PWKOnsqqjDtmlCqUVZ2cbP4kmcY2eRrdFGKMYxln5WwIujGwLxi8+ifrmGSbawBB/czQ4ROSBMO6X/qQoGx8lOx+HmgmVdPvScmYxmuUV032HmbXkxAGnyHKmV2SkWkQXxFBWcDi7S92v3nFXR1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kYSaYklFyPgE9vnP1NrmjFdFdsuzm6LCQCBa79aJwkQ=;
 b=b3k+ldsNlsECYytaN0ZrBIUkQ0qSd+KMrv/2Qk083UwBurlJLDYu9TJ/LTfy/4o5laEGOwsmKW+K+A5C8ojwwWm1UfIa5Gf/pLoEK+MIc5aQkpQ6tcV8F1fKEnDkvtM6WUADmYc5nRGDtsGDnZlf57Zw3MFqtx6jii28Mb8+OkNg2lDUlZeNomK05f5rInpltg5hG8tWnX+rDfI+XV9U8sAfFvpN/bHRHGj/pb4QJ5rlIRdjb3dy2ydrOh3oED16K2LOaXYugaB5a3WjIPwFzW44/Ej3XyCb22IpRR1mUKx3+i+HiV9PAcbb+huftCeCJzzrR8PDu4QuFpgSY39D7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kYSaYklFyPgE9vnP1NrmjFdFdsuzm6LCQCBa79aJwkQ=;
 b=QA3RRplGo/0egKl5+8ngJurpjvwFfViSlny1SxTJW2Mcbv7UzNa76+sELA3qNi12RnLpjRl8DIrRW5Fb/i5RYnvv9tUpYY0d1IVeGZl5QocE9/bZjOeyv6dZxcda/b0ArLMqAC/9uVB5fEweIEuXWyeXY5XMRuR5iiYgOOHqp0VKHLeMC+mUtoXyrKKY0Zy8ZMxpJWKW+N8sYmIz2eKdGPVyNZKDNF1Ap3tF32e6a62S30ExXtJZd0pBcOG5hD/qgK/qgnhBA7vv0KJEPQ8LuLW/Jqa4zNIP49sMFZ1pF1HNv+6r/J3cd9fdNtov8b5eWBPaQ6FOtqTN0emWjWPxiQ==
Received: from BN7PR02MB4148.namprd02.prod.outlook.com (2603:10b6:406:f6::17)
 by BY5PR02MB6610.namprd02.prod.outlook.com (2603:10b6:a03:200::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Thu, 23 Jul
 2026 16:26:06 +0000
Received: from BN7PR02MB4148.namprd02.prod.outlook.com
 ([fe80::6007:d1a1:bcf9:58ef]) by BN7PR02MB4148.namprd02.prod.outlook.com
 ([fe80::6007:d1a1:bcf9:58ef%6]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 16:26:05 +0000
From: Michael Kelley <mhklinux@outlook.com>
To: Kameron Carr <kameroncarr@linux.microsoft.com>, "kys@microsoft.com"
	<kys@microsoft.com>, "haiyangz@microsoft.com" <haiyangz@microsoft.com>,
	"wei.liu@kernel.org" <wei.liu@kernel.org>, "decui@microsoft.com"
	<decui@microsoft.com>, "longli@microsoft.com" <longli@microsoft.com>, Michael
 Kelley <mhklinux@outlook.com>
CC: "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will@kernel.org"
	<will@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>, "sudeep.holla@kernel.org"
	<sudeep.holla@kernel.org>, "arnd@arndb.de" <arnd@arndb.de>,
	"thuth@redhat.com" <thuth@redhat.com>, "linux-hyperv@vger.kernel.org"
	<linux-hyperv@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arch@vger.kernel.org"
	<linux-arch@vger.kernel.org>
Subject: RE: [PATCH v3 0/6] arm64: hyperv: Add Realm support for Hyper-V
Thread-Topic: [PATCH v3 0/6] arm64: hyperv: Add Realm support for Hyper-V
Thread-Index: AQHdGU0xmKmEvFHjEUuYfHXV92zT5rZ7TU9A
Date: Thu, 23 Jul 2026 16:26:05 +0000
Message-ID: <BN7PR02MB41487CA88742DC70ABAABF33D4C02@BN7PR02MB4148.namprd02.prod.outlook.com>
References: <20260721201148.1441143-1-kameroncarr@linux.microsoft.com>
In-Reply-To: <20260721201148.1441143-1-kameroncarr@linux.microsoft.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN7PR02MB4148:EE_|BY5PR02MB6610:EE_
x-ms-office365-filtering-correlation-id: f2fead66-ab83-443c-1d06-08dee8d71867
x-microsoft-antispam: BCL:0;ARA:14566002|31061999003|15080799012|24021099003|8062599012|13091999003|8060799015|55001999006|41001999006|19110799012|51005399006|25010399006|12121999013|37011999003|10035399007|40105399003|1602099012|12091999003|102099032|4302099013|3412199025|440099028|1710799026;
x-microsoft-antispam-message-info: =?us-ascii?Q?InmGPGLmJUNdMuhjhQJRxpw8G9tZYG6DJ+/8yGXdI2QN5n3F+VhbvwiMgDOp?=
 =?us-ascii?Q?E5i9xp+XTWUZxyomKKAq1lq7T3qs7+iv9D8HbvDVNLx9qSYUQeC8Xk1JJQ72?=
 =?us-ascii?Q?iYDLPL8aQCHvkgzvmsXAW//7l30NmA9nVn904d7q00QKFhit5f+YXpzempsX?=
 =?us-ascii?Q?wJYPPVRIGl/x8yhGKww9/YRfY5EatC7WSc7sZGcbEki2p6kB/cPS0TisQT8+?=
 =?us-ascii?Q?fUfC/J4g0HCTTOj8FenR8nitju6qftJQrHReZCPKwgczexcLU+b8tPj5Naxn?=
 =?us-ascii?Q?hkF/DXLMjjCelZo6qCDpcLRNH6vPB8UgQli09Nsz+WGqLfuJF0R4uw/SxaCn?=
 =?us-ascii?Q?C5OKLTqETIQDsCdrt46h2TJYquXQ5+FKIaRFPSZpTiQy6UqSrE+u3yQFuHT2?=
 =?us-ascii?Q?cy5Uvk5y7srS4UAV9M2Df32jh1+qCHytA3r66XtHrgNDg5xRz/XvV1gTL1A/?=
 =?us-ascii?Q?YOEDpqeiTuUFdaz4vT/4okSDRpHtfVYCaRVTNm793gzKwU9FAeYUvBwbP3+I?=
 =?us-ascii?Q?TAtxJSiMG87U8YBgrqLzOHUx8qwsNHhwY4lDvkvPzN5n/jY3JoAd8lVcU9LR?=
 =?us-ascii?Q?gNLH4VFMhgjEFHWmVPKGQHFzonYn9i6Gxqw4spZh3sgLQIMt+qGomKlB/PND?=
 =?us-ascii?Q?CazCVc7YaCH9EAchJGXsHQ4tQNyurrt2Ll4pPBqVtYGvHeqUIaOZR1USPFlj?=
 =?us-ascii?Q?xNAhQJ7hwzx4pserIJf6P//ON+mL1yBSVrqS6OFisuBaeldGs8Ww64sxt9Et?=
 =?us-ascii?Q?K8kHC8pFmJ6AruLPeVsS3lEmzSZ6WTpRYwZfCR42USgxT7iqTCMBptMwjEb1?=
 =?us-ascii?Q?UMZw03nWntoBt2OJtEVqJGvtZH5Jt/f7f5Hv9UqNmKKIMPPvCu6WGi5LnFZU?=
 =?us-ascii?Q?zAmNHwC7HmdGuHgI/4JjohXqMDnKsTQKgLZP94tE12trUG/Fe77smxKKE5gb?=
 =?us-ascii?Q?0DGXP+tv0IUS8LxMuPDYSAzoCrBmsmZnFBYyLspdFqF2DmKA2Eepry2hd1b9?=
 =?us-ascii?Q?+XHNYCZJA71ro/0w7VZF7mInNrkdSZnBtFthW3Bma09L0wvfDW+jA6FZLtsT?=
 =?us-ascii?Q?4dlaD9kv10od8ZH2Tj+Pk0m/mPom65RRpEz3PQhIh3iHerhZxTXzMJw6TFv3?=
 =?us-ascii?Q?vZPIQEGhKsyC1DaQcZ97SH/OeR/AnGfGuh90mZskSBWOoj4LWwAVbis6siTl?=
 =?us-ascii?Q?JWvCTQ/u/+57kyakuF8K6GofduHV6glJyxGaxBzHM1rPTkCJ0aS5IXx3j5B6?=
 =?us-ascii?Q?al2wIddO04ZZUT4E9NAw?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?71eTwNkict7bVqWMWafiuMWXPGixgcb6ZaaE4GMHay0fFS4Zu4wmaHJVgQ6n?=
 =?us-ascii?Q?MitQxyDaYyQ5zANAwtE5NEFEmQBplRpDEooT0Lk7xMlaD9TryrdwTHhWMdii?=
 =?us-ascii?Q?4/woX4jExD9m2uirdecdkNTL0WGP8eWaaICYJ7lWJpaN2XEEL89uWgiiNyee?=
 =?us-ascii?Q?xM4ZGlfAsBA0CZEzu06Okbc3y5DKeCKbEidSd1tS+HzNRXtXTxwl7oScqJJh?=
 =?us-ascii?Q?zgNiniL/diNPRZqRtnAs0Kf62dwjpxWRiK/xqy6QQftvgx79oVeb6oYt4JGr?=
 =?us-ascii?Q?7XHwBCZosyYa0d7J5Umva/EMU6Z3SncBbZk9+hXdozyx5EuV7zELNbwXzZ59?=
 =?us-ascii?Q?PjeolfNvSaIavQI1RXy+LWbJOFmZ4OVmUY4+XD6F06cRsK/UFa+ym4ANQ9G6?=
 =?us-ascii?Q?5RFxRbV00fs+u0dBlt8B2hXttDPp3N+6T5G0DdjnXw3G54VhHTIqNqP+8Sug?=
 =?us-ascii?Q?gZybgkpKeqAFyw0VRm49soPruU3SblPoY4nqxmLhnOjzYGCvqWyu/Z6EGU0S?=
 =?us-ascii?Q?d3HyzO6QVVkux0bFqeU+wYcqRnITYYChau2cBxYM9UndGKOaNhwR75fXOmvr?=
 =?us-ascii?Q?xrl9DrTbLJRs9sKiOAy4fCWqtjSVdGm1VvOIEojujilnf7TFz2dOTsdhFsRH?=
 =?us-ascii?Q?HAbNXJsS4MPYcR5LLj6joXgVwKFWz6R9z/nitZaYAYambmiRaz77E+1DKHSf?=
 =?us-ascii?Q?GqFl6i8hEGnklsgXWSTUOZrN/8bfLpqteQTCpskF0w2meH6Cfe/vCZk8wf+L?=
 =?us-ascii?Q?Xa/0KmN3sxPwDBCVQRmiQl+UhF2GQyOxbCCx21odveOGzLoOsZBWQtQI1pE/?=
 =?us-ascii?Q?8nSrddB6p+SZHm+TnjUf0k18RpPpbuifAHsAPjIJHCwKewDSXApL1RcwofdS?=
 =?us-ascii?Q?BdWzlDBiALSobYSfTbVQXYmb6gTh5NJPeKAz0cwL19yoql3bNa1tWdoxBR3y?=
 =?us-ascii?Q?Y3ceTvMpblUF6E7axaSAjGVpQ3LIVASGE/CDwPLL8LCpqHPUxbCktS4qSZkz?=
 =?us-ascii?Q?5tLeC39gHhDY1iEd99miTtFSKdgvCMWgvTpuJgAt4/XuMTgIsJcHIdE1Mm+r?=
 =?us-ascii?Q?SGFQsANpClpUMY9WIic1y2BxVSeST6SEd5Eh0nUia3kjDfzF0dEpRSVI3wmr?=
 =?us-ascii?Q?sdwhAjxS5xf0Sz2xv/2AYeS/kUMvTyRVsaMzWALpGZa02sovdD1GbZX/Y8+V?=
 =?us-ascii?Q?u+DzukZTV73wfXu8KPT5CfhZV4cfNodjEBIuuxYTY09HuPi8zrr24OcNDwZQ?=
 =?us-ascii?Q?N8nz32Oetj+tB5+RjrIgX4G+TMoE8OQOWJ4VnVEc0lga1mMMFSx8EB5ExPqA?=
 =?us-ascii?Q?WHroMN5XQpxzMTegCc4Cm4ADNqKXG9xvjbz/BP2KKbQ023ozto6BKXB/5nFo?=
 =?us-ascii?Q?VVg1oRE=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN7PR02MB4148.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: f2fead66-ab83-443c-1d06-08dee8d71867
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2026 16:26:05.7729
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6610
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_092618_723232_F16BAC3E 
X-CRM114-Status: GOOD (  20.11  )
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

From: Kameron Carr <kameroncarr@linux.microsoft.com> Sent: Tuesday, July 21=
, 2026 1:12 PM

>=20
> Realms (CoCo VMs on ARM) require host calls to be routed through the RMM
> (Realm Management Monitor) via the RSI (Realm Service Interface). This
> series implements most of the necessary changes to support Realms on
> Hyper-V.
>=20
> One required change is not included in this series. The two buffers
> allocated via vzalloc() in netvsc_init_buf() cannot be decrypted in
> vmbus_establish_gpadl(). Currently only linearly mapped memory can be
> decrypted.
>=20
> This patch series was tested by booting a Realm on Cobalt 200 running
> Windows. I tested 4KB and 64KB page size. I replaced vzalloc() in
> netvsc_init_buf() with alloc_pages_node() -> set_memory_decrypted() ->
> vmap() in my testing as a workaround for the issue mentioned above [1].
>=20
> Changes since v1 [2]:
>   Patch 1: Add explicit padding to the RSI host call structure
>   Patch 3: Change from a per-cpu pointer lazily allocated to an array
>              of host call structs indexed by cpu id
>   Patch 4: Align input_page + output_page allocation to PAGE_SIZE since
>              that is the smallest unit of memory that can be decrypted
>            ~Remove KASAN tags before passing address to
>              set_memory_decrypted() since __is_lm_address() does pointer
>              arithmetic.~
>   Patch 5: Add a helper function to reduce repetition
>            Check for NULL before indexing into host call array
>=20
> Changes since v2 [3]:
>   Patch 3: Remove hv_hostcall_free() and inline the logic for simplicity
>            Reorder edits to keep #include line at the end of the file
>   Patch 4: Remove kasan_reset_tag()
>=20
> [1] https://lore.kernel.org/all/20260721195633.1438361-1-kameroncarr@linu=
x.microsoft.com/
> [2] https://lore.kernel.org/all/20260609181030.2378391-1-kameroncarr@linu=
x.microsoft.com/
> [3] https://lore.kernel.org/all/20260625173500.1995481-1-kameroncarr@linu=
x.microsoft.com/
>=20
> Kameron Carr (6):
>   arm64: rsi: Add RSI host call structure and helper function
>   firmware: smccc: Detect hypervisor via RSI host call in CCA Realms
>   arm64: hyperv: Add per-CPU RSI host call infrastructure for CCA Realms
>   Drivers: hv: Mark shared memory as decrypted for CCA Realms
>   arm64: hyperv: Route hypercalls through RSI host call in CCA Realms
>   arm64: hyperv: Implement hv_is_isolation_supported() for CCA Realms
>=20
>  arch/arm64/hyperv/hv_core.c       | 155 +++++++++++++++++++++++-------
>  arch/arm64/hyperv/mshyperv.c      |  38 +++++++-
>  arch/arm64/include/asm/mshyperv.h |   4 +
>  arch/arm64/include/asm/rsi_cmds.h |  22 +++++
>  arch/arm64/include/asm/rsi_smc.h  |   7 ++
>  drivers/firmware/smccc/smccc.c    |  41 +++++++-
>  drivers/hv/hv_common.c            |  17 +++-
>  include/asm-generic/mshyperv.h    |   1 +
>  8 files changed, 244 insertions(+), 41 deletions(-)
>=20
>=20
> base-commit: a4ffc59238be84dd1c26bf1c001543e832674fc6
> --
> 2.45.4
>=20

For all patches in the series,

Reviewed-by: Michael Kelley <mhklinux@outlook.com>


