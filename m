Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08A4FE83858
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 13:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zOBTHa5zEyw4bEStE0UwwLMeaaBMvE0LOGJFp5ZwAC8=; b=YgnyZNOnI/nMSCE9ZKm1YrJ6xd
	Ap7hP2LqIqgvjIIs1j9hWiv5wUaZN0ey7UKOLrhwyxrTHNOutnoeYjlbz5xf92BM1Aovnis9MvZRR
	rv+lCg9/xz8o5jXO/pM8bFQt1kav+1rt6ek0L/ydL+xvbVVnqJV1QIg2Sv38J7qvpMgSKaZd6fvgW
	3mRq5e/tFrYe3MNmvPWo/jSlRc7qlYDz+e001l+V3SBJeQEEzqQyINg1Q8CLuWLqF6ltmxEvlF/ue
	q4mN4+73S6bLAjPCV3His/ch//uCXWDb4npJYXRdfbE3RDcj9vhmDzgRSneivFlFeJ9S9hI3hH7u7
	rbyNL0lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsKzQ-00000008Irn-188r;
	Tue, 17 Feb 2026 13:19:44 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsKzN-00000008IrL-43XL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 13:19:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YQLLF8HBhDXd3JgDIg8zb0vxUhVs8etpAXk2iXP2AsCxK/YfqXQL3YT3fZhGsAcIHSho3XJPq19b9V52Yb+zxFn5zLCs76VwCyjAa9TMhPbFMbaM3qUA08juayLABNnH5W7R66C1Dy6ClFIijWvbkTRHJY2Gs7xLn7KwPHcmP17tiNQlay+qxa0Gjh1UQ2CVZeUWb4PTATYgv+k9q/xrrWUVpYN/UEcJuH08+CcDXUm7UnuT64sCgq97eVrIrF5GdEy88GEXwdGChGqD9ERVifvWzDl5oNH1f7TF9ZcWU2oW4oacI/Pz6JSgS1wz5tjuNjhqvPI9sbu6bRQbVHFf2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zOBTHa5zEyw4bEStE0UwwLMeaaBMvE0LOGJFp5ZwAC8=;
 b=gUBvnj7HcN1trAwSDY9Qyd+7vKLtv5pXOM6uqY5iyCaMuAYIeanuFhBnHqKUd7zQqi5cNfsvO86yMAafpsm08R7YU3cHzD1HyJcYTS7xdgXmj6GMpnHKyKV1egamBXZIjHlsfRkkyMVKGSa/2dTlDorcTDSHkVI++Dl/mHAPLt5qQrWH8lA9jjqcuZGV71YXpfXnjLdy2TEkWF4UAwBqYgVhIYmQco1sdSoUtVksr13rG6ka+YxAHtC+wPhyDJrNMyMVBlrNzMnFsbZZWGzNXOFh+/N7VJEs9L1f3t2Htwdj24XiRkBtYBbhOiq43j2BtcTTIHU+e5e1Nrlfdw+JaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zOBTHa5zEyw4bEStE0UwwLMeaaBMvE0LOGJFp5ZwAC8=;
 b=hvSr0NJ7zJhGw3EUwfquv0n8JA8IZ9uupjI9GZD/U0xOtDPTxRZoqBmdSaLLNNn7E9r/DB10FFLIwK+i8A3xgZBECgBmt9nCjhMdneSxhqQgYH7QfPLV49K8Wv6maiwwQEZVEo2R1+qUoqdI+Ss0MWMynIR2CMdT34gSoejoodAErHmvhvM8uvwRevDX+4TqB2yhpJ6roQo1LRk4y10sHOLTlnon44OG0qkqupigfla+gISOj7l0MQKHnnIkcEJlA1ZPqYWdWsAjnrNSzhlsjFzxqdTvxtRodBAV8wmqnmHBmD/jzVRoLs/XZgVbFUAPnf6bS6ZdHxvuJM0P1mHJMg==
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b6::22)
 by DU4PR10MB9592.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:617::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Tue, 17 Feb
 2026 13:19:36 +0000
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9126:d21d:31c4:1b9f]) by AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9126:d21d:31c4:1b9f%5]) with mapi id 15.20.9632.010; Tue, 17 Feb 2026
 13:19:36 +0000
From: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
To: "alexander.sverdlin@gmail.com" <alexander.sverdlin@gmail.com>, "jm@ti.com"
	<jm@ti.com>, "msp@baylibre.com" <msp@baylibre.com>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: ti: k3-am62a7-sk: Disable mmc Schmitt Trigger
Thread-Topic: [PATCH] arm64: dts: ti: k3-am62a7-sk: Disable mmc Schmitt
 Trigger
Thread-Index: AQHcoAz+v8NLvcx+EE++zWoSs7wclLWG3/+A
Date: Tue, 17 Feb 2026 13:19:36 +0000
Message-ID: <5c604e259e412f9a49f42d6557d52a2d82c1d8f8.camel@siemens.com>
References: <20260106-topic-am62a-mmc-pinctrl-v6-19-next-v1-1-1190ac29aadb@baylibre.com>
		 <c47697b4-6ebb-4af9-be96-c964d990835d@ti.com>
		 <DFO764ES0FNP.1SUQK9R0EUUDQ@baylibre.com>
		 <1a91fd40-e814-4b4c-8914-d8f0c4768e07@ti.com>
		 <DG59D7WGM35A.1WNIIMNCQ8U3C@baylibre.com>
		 <7ae7f6a1-0ee1-4d56-b1d0-f038a7d22b4c@ti.com>
	 <b649669afe4e2c829389a6bedabe47446d2f3d2b.camel@siemens.com>
In-Reply-To: <b649669afe4e2c829389a6bedabe47446d2f3d2b.camel@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.54.3 (3.54.3-2.fc41) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB6867:EE_|DU4PR10MB9592:EE_
x-ms-office365-filtering-correlation-id: 7ed0a707-ca3a-4e4e-cdcb-08de6e273273
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?VE1WbmNqMi9GNGFkNzc4cDFTR0J1M2E1K2ltck1jZ3J3eVV5MVV5b2sybU9R?=
 =?utf-8?B?TmVwaWVQMFBhK1R4R1VYZnR2dEpvN2hldXZaeDZCZHZhMEV3N3pwL1U0Vm44?=
 =?utf-8?B?ZHpNY1Y4QlpVWDlnbWgvVlRpVjlKRzRsbXk3RitXK3VxRHE3aTJlYXFLTzJV?=
 =?utf-8?B?bHorN0IvUXhxODlxUGU3OGVzNkpkaXptbk03RzBKb2lHOXliOE1PZ29JcEgr?=
 =?utf-8?B?M09iVW85NnR3d2xqZjZXN09lZk9HWG13ZkxoQlU3RW9jb1d6WHdyVkM4VW82?=
 =?utf-8?B?bU5mWkV5RXUvdzlENVl6KzNDSUs2cXkzSnF4RnhudEVEOW8zaUZKY0ZwdjAw?=
 =?utf-8?B?RTBuczl6MUZSeTJRMWc2NHNkZFdEVFZFRU9Bd0lBM092UEhmVWpyRU9TV3lN?=
 =?utf-8?B?NytrMkc5Szg1TlIyZmJCd2ZybVZobjMwejNUNUQvamROSEJjNXFNZ0EyREhY?=
 =?utf-8?B?ZVNRVWM4VjZTcEN2em5hUXhNMGxsbjFVOCtIUUNKbms0TVdPR2tFNER4bkhL?=
 =?utf-8?B?T2Z6eS90U29QU0JOQ3JwdW9JMzgxd1dzZk5BMzhtTzI5MU1YWjlSWC9rdEF1?=
 =?utf-8?B?MWVZbmx3Rlo5WUw5Q04xWVFXQXBPdE9UeWNGSThjZ3pOYzV3bUFpMEJSOURx?=
 =?utf-8?B?UlZKUjF1RkZ0ZmtDMHdQVmZBeXdwaVZlb0Qyd3hwYmZicWFNc0x6aVBIVTJz?=
 =?utf-8?B?V0dHV3NPV1NXUzE0Wkw0M3RKenVuTnFSNVZjTU54NHJCRVR1ek4xNjFYQWhu?=
 =?utf-8?B?MVovd3M1U1did0lhU2gzYUMvTXpMNmdmaEc1NWNaNDEwMEF3UEJrWHoyNTR0?=
 =?utf-8?B?L1hhUm4xQnJxWXlnSnA5Q1ErcDVkYVdFeTVMU0RLRjVneGRZUGQwNWxHYVNO?=
 =?utf-8?B?d1c1V1BFb1JUTGdjcXgzYUxRckQxOGhWK1E5ME9NRFZJTHlPZ2pYcXVWT0ZY?=
 =?utf-8?B?UDBmYjBMUVFlMFk3RjFzODh2cTZVMnpXQUpHeDR6d3c5aUNZVExKdG1QVXp1?=
 =?utf-8?B?eTNlQVcyVXdtd1dINEtpWGFmRHY0M0Y1V3RaK05nYVh5L1RxN3NDTEpqN1Y1?=
 =?utf-8?B?OFZqWHlOZVNlbmlHNFJOb2JGK2kwb0VXVjF6bHpRbFFpVkM2TTZxWUZNK2xk?=
 =?utf-8?B?S3B5ODBxdDNLSEZWZ0ROc3IyYjhodjBjM1BaN01JenUzWlU4eXBaVjh6MWxn?=
 =?utf-8?B?NnllTU5adHRJL0NBTjlWOG12SGlNYy9xV3JmbmcxU0VYL1UvcTBxQzBINFhq?=
 =?utf-8?B?V0k1ckJwZ3ZwbFhMK2h3LzRHYS80Z2xHWVlTWGphN2gxcyt6UnJsODdNMXBn?=
 =?utf-8?B?TmdnWm1tWjI1Nm9wSnJTL0x3bVlqVENORHBxTmJkUk8vdzMyTHVDUW1ld0xu?=
 =?utf-8?B?SDlwckMrT3VuZ1NxQXZpTHZPNUR0b1VQNzBBZ1FBYjIvd2VnK3AzNy82WGRE?=
 =?utf-8?B?N3VEdEFidkZnSEY5Ulp1d2g1ZGdibXBLT1VUQTNHQ1NKWktnMWZwY0ZHZkk2?=
 =?utf-8?B?aEdmaWFDWElyZVg3a3BvWDduLzFYMGNoWG5JM01LVExYbDM0LzRWY01RN2NS?=
 =?utf-8?B?QTBGOG5nTTdaa0Z6dXJmRXRiU1VybEtydDdtSE5mNFR0VzI3b3ZRSWdBQ3ZJ?=
 =?utf-8?B?eWpZbGtNWTl6YTNPL1BhaWhKOE9iZHJCcjUyb3doUjloajcyM0I4ck11dFow?=
 =?utf-8?B?Q3NINHRMNHpPaFEydk5rbVZhWVVIOVhyQkVaS2gvS05HOHVyRCtydWc0eXhJ?=
 =?utf-8?B?dFg0VlgvOHdST3R5TzVRdlI5K1I3YkRlamI2UkNDYmN1cm1ISkdac0NaSlVE?=
 =?utf-8?B?VmpycTZKMnoyMHV0Umx2OCtCU1NSL1Jsd0I4ejYyaVZRajgwamh6bldtL1hR?=
 =?utf-8?B?WlhBQ0U0bVVGbkJrOFhRSXRYUmlaZk9KRjRYOFVleUEzalZteVQrb0pMUHpO?=
 =?utf-8?B?dk1sb3M3bVU4ZnRLNlNWaFNEais5N01aQ3JCUjV6ZFI4dlgzclhKOVhuU0Jv?=
 =?utf-8?B?c1pUbmtsZzVtRXpISzM3dE51UUUyblpZZDNLSU1SazhkVkJaUzU0SEo2ZnVH?=
 =?utf-8?B?bGxNVlAwQ3pPN0d0ZW1EQlBXMFVsNmprbGdEWCt6RzhsVjhTeUFoUHJnRGNa?=
 =?utf-8?Q?vBgw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SHByRzNQSng4SkR2UnIwdU9JelpIYkxPcGVuMnVnVzgwdWdRcStUTmM1TWhx?=
 =?utf-8?B?T013NXdCWEcybEh0VzdBVlFvK2VyNmxKMGtYQ1VrVE4wVlpzM2pSbEgxOHlp?=
 =?utf-8?B?ZFdOL3hDcHpnUksyQmRiYVhmZ3o2VWFnL1NYMUxMNVh5aTBTdWlKZTMzbFZW?=
 =?utf-8?B?SEF0SFFrQmpFL216UVBLY0MwUndadDBBb2R0SnFaVUFFZGJhbzdqRkdkcUlE?=
 =?utf-8?B?dmhEY0xaQktocVFlYkRoaEd2V3pCcnE5L3MwN3hseGhqcWJielFSSVNsaUY5?=
 =?utf-8?B?U01FYXN4ZUVYYWpoUGVSNXNOZmtvUkdEejB3eFNyT21QZCtxcWNlNE1hcWIw?=
 =?utf-8?B?S0hvZjNsVW1lUi9sQ1owQ2ZyeHVOcGx5bDFmcXdLdkl4Nm9rVS9pc2xwelU2?=
 =?utf-8?B?L0VNbitETk94eWY3T1QxK0dsUk9LWFZQRml3OHZkSzJJZnNYVm8za3NLU3A4?=
 =?utf-8?B?amw1cUxvOGpnampqRmU2ZjZLSnVBUkdpdmpSZHB3K1I4N0FqK25mMlVWNUFF?=
 =?utf-8?B?d2RYSkFQdWxNY21BWlJJdDVDcHY3blR0cGVmdjUwV1JGOXV2bzR6algvcEUx?=
 =?utf-8?B?bTJMdkRBaDZhcHR2RmdUMGdOM0lOS3oxQ1VrbmFHQTlmNFZ3a0hUMlNaU2FP?=
 =?utf-8?B?VTJSQTY3WXQ2WVRKQjhQVVhnVWhNdXk5RERkdVNvQ1BPdm1seDRld0NyN0lE?=
 =?utf-8?B?SHdOeEozTWlQUHVBUGFNdC9ZcGJYZkRBSURUaE5DVG8xbkhMdS9NWTFxM083?=
 =?utf-8?B?ckcxTENFd0prMVBCK2E1VUpRNzU4Wm85WnBnQVZUUU9LUnUxbzcrQWVYYlFq?=
 =?utf-8?B?dEhNZUJvRW9ZdmZUYkhQcjc4TFFlM01OWXcxVjZEN3F5ckl6eENRTTFNVXpG?=
 =?utf-8?B?THVYOUs4VFdMLzBmdlk5SUwrZDJRMTNNTVQzaDNQNEp5MmNaL2s4Sm52M2Jx?=
 =?utf-8?B?TG1kVUJxVWJSaDl1UkU5TnlNMlNBOE5obWoyTTY3NUozejZQL3BqYk82SzFN?=
 =?utf-8?B?R1ZiZkVZWGtHbVhocC93dEV4K2ZHOTVvUnJlQXg5MUFTNVZLWGE4eTFVQUU5?=
 =?utf-8?B?aUdVa1AzdUVEUGdIbXZZNjZaOU5xS0s4ZEJOTE5yditYVyt1RVVybWRwWmpT?=
 =?utf-8?B?WGNxcXVnNUNVQmZQS29MekVleEVQa0h4VDZQWktLdVJ3YW9YSFJmdXlhcHZJ?=
 =?utf-8?B?UlFuY3VQSlFyQ295T3J6dk0xdmIwZlJGL3RxRGQ0eXFTWStscWxYM3VYMFBZ?=
 =?utf-8?B?Q041VWN5MWVJdkFhclI0QXJYR0ZRYzFybnM4R3NIYnBaV01RVFg0Wi9WUFZl?=
 =?utf-8?B?aHZvUGV0NVBITUxFQjQ2TGQ3aXFjSStqVnlTVjQzbXk4bXpOem1ZYnBFbDN2?=
 =?utf-8?B?WVBJaGgwR0RlcGtGOUxIOFc1UWFHaWNya3IrSnlZdXRpbWxRQWVqNmt0UE9R?=
 =?utf-8?B?RStBRjZOODB6QmowaE5BRGU4S1lVRGR1NEFMY0lPaWVYQVNPSnNLem92R1VF?=
 =?utf-8?B?NmVnNHIvVHZiWGhzQnVOR3pUWEJzZHQ1VnY0d28rL29pQ3RBZDgrdXVuK3dt?=
 =?utf-8?B?RkROanI4NjJMM3padWd4OHo0R2d2Y2xZRVRpRkNXYUpEaS9xNkF0ZFN1ZzZB?=
 =?utf-8?B?MnhwWS9vYnU1dnpyU2JmdWN5czlYb0NhbDh4MTZEc3BoRWFwb3kxcktTbnpm?=
 =?utf-8?B?WFBiRXVSMGN6RS8zcEcvU3N0d0oyVDVaMFhJcjYxUjl2K0xxVnR4L01IaE9o?=
 =?utf-8?B?WDc2NjNVT1lYUXhUSkJ0bkdMK0dUQ3JkZ2dlU2huZ0FMMFh3YTd5dXpDRVhv?=
 =?utf-8?B?cFdNaXUrVyt2RVBPZFlkQThPSjZnR2lKNHR3aW1aOXo0b0VaZ3J1ZUtYMlVs?=
 =?utf-8?B?V1FPNDJteHRGZlQ5dCtkUFhGVHFJbzlMY0VldEh0Rnk2WlRuRnY3MkR3c0RW?=
 =?utf-8?B?N2JMREs0RlV2TUR2SlJNQk5SY2cxNFhjWElZcWdMWktCYjNBT24rL1RQS1N0?=
 =?utf-8?B?TC8zczFPMnA5Tk1xSFhSNHI1VERkS0tIU3JCT2luUFQ3dlVkZFQ5VVZWQnEz?=
 =?utf-8?B?NGJWL1FMRjBuNzBzQ0NvbGkrQUJqNjZQbWtrMXpkc2x5MUNueDExd2YxVUNP?=
 =?utf-8?B?WnNqSG0vYTdmWWZTZzlhZHRXSllkUVJ3QU9BU0dqcE4wdDRlUHU0NTBBTmpM?=
 =?utf-8?B?Z3pxVXVXNnRkcTdia0F2NU5VcjFNV2psZUF5UHREcnJ6MnhUQjg2Z2R3RjVP?=
 =?utf-8?B?Z0JVdnJpbXduVTVNalE2eFhKZTkzQjhVRlhZdlM5dEt5ZGx0VGZHcXF3V2Iy?=
 =?utf-8?B?WTFaejJ5RUlNWkNwbCtrV2l5aVYrcjh6Qmc3ZDBJUXBGOUpQMmZadUJWUi9R?=
 =?utf-8?Q?W7AUSjJGW98AHk+U=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0C3EB139194D5F43B837ED9E03F40FB5@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ed0a707-ca3a-4e4e-cdcb-08de6e273273
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2026 13:19:36.1826
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u+GclHwMN9E0S8XyoAPY8JUE4gfFZXH/3+BEA5FK4R+Ko0kW+4EYvg6IqioILAmm9cyz0iGz6fdWE1XRsC2jiGdJFva5LNsQzns2duvM3xU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR10MB9592
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_051942_050751_9C97E5A5 
X-CRM114-Status: GOOD (  14.46  )
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

T24gVHVlLCAyMDI2LTAyLTE3IGF0IDEzOjU3ICswMTAwLCBBbGV4YW5kZXIgU3ZlcmRsaW4gd3Jv
dGU6DQo+ID4gPiA+ID4gPiBDYW4geW91IHBsZWFzZSBydW4gYSBxdWljayB0YXAgc3dlZXAgb24g
TU1DMSBhbmQgTU1DMCBpbnRlcmZhY2VzIGxpa2UNCj4gPiA+ID4gPiA+IHNvPyBodHRwczovL2dp
c3QuZ2l0aHViLmNvbS9qbWVudGkvZjRhNzNhODMyM2U0NGJmNzE3YzZkMmM1MjhjNDk5Y2ENCj4g
PiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gVGhpcyB3aWxsIGdpdmUgbWUgYW4gaWRlYSBpZiB3aGV0
aGVyIHdlIHNob3VsZCBiZSB0YWxraW5nIGFib3V0DQo+ID4gPiA+ID4gPiByZXZpc2l0aW5nIGNo
YXJhY3Rlcml6YXRpb24gd2l0aCBTVF9FTkE9MS4NCj4gDQo+IEkgd2FudGVkIHRvIGFwcGx5IHlv
dXIgcGF0Y2ggYW5kIHRlc3Qgb24gb3VyIEhXLCBidXQgSSBoYXZlIHNvbWUgZG91YnRzLCBpZg0K
PiB0aGUgcGF0Y2ggbWF5YmUgbWlzc2luZyBzb21ldGhpbmc6DQo+IA0KPiAtIGFtNjU0X3NkaGNp
X3dyaXRlX290YXBkbHkoKSB0dXJucyBvdXQgdG8gYmUgdW51c2VkIGluIGFueSB1cHN0cmVhbSBV
LUJvb3QgdmVyc2lvbg0KPiAtIG5ldyAib21hcCIgdmFyaWFibGUgaW4gYW02NTRfc2RoY2lfZXhl
Y3V0ZV90dW5pbmcoKSBpcyBpbiBmYWN0IHVudXNlZCBhcyB3ZWxsDQoNCnR5cG86ICJvbWFwIiAt
PiAib3RhcCINCg0KPiANCj4gd2hhdCBkbyBJIG1pc3M/DQoNCi0tIA0KQWxleGFuZGVyIFN2ZXJk
bGluDQpTaWVtZW5zIEFHDQp3d3cuc2llbWVucy5jb20NCg==

