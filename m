Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07210CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 20:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	Content-Transfer-Encoding:Content-Type:Message-Id:Date:Subject:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sOT4sf7IH6jAMiFNNsQ2ocidGPbf3S9u6XFk3/8aIWA=; b=pa6cOh9qAqpAead7k8bcEBPjpO
	qU9UJ8Bn9KLQO9z9bqFQw9aFHQNKT1dx1zNvTEaHcEQdWuXqED2VeedJ0YYjA02zdiF+yi3lKXzji
	/vJ9DLC48zi1c+Yb5O/PJNrISZGTsZ+FA3wCRwTsnVlWwLaU8nbLORmr6iQ4UWJXqTrcrXdOzMplq
	IJG+SCeAIs9AQOSvKZEUfpdsnO+wRPIRAM/w0E/fgg3FPu/RbjxKQAz8JUhN0ejsa9G4g+WLdJenX
	S4RGDrvRrp4v1lMWaQvdQoxqO0wNSMoz8kVdSZBkT9bvghq327OF41Df6ChphMZfVnjCaX+3q34oj
	1JPp2Wtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU9Vu-0000000Bp2c-3pvd;
	Mon, 01 Jun 2026 20:45:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU9Vu-0000000Bp2N-0unK
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 01 Jun 2026 20:45:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Cc:To:
	Content-Transfer-Encoding:Content-Type:Message-Id:Date:Subject:From:Sender:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=sOT4sf7IH6jAMiFNNsQ2ocidGPbf3S9u6XFk3/8aIWA=; b=E7Qxq4mLEtdnCvLGsECk/JlymV
	bVMwC1fxYDDVmDOJw8Yj+q6SBTUdFt+AIYWR+XijJAIs/EirefgiedJhzFpt6AOyEj8fceGAV7e/u
	SLJOCxL+L2JQFrEyAo2OsQlJkj4yAfY9DFk/IOHl0p5Jfquubuw2PuDb9thl+gfU+Mokw2WFDxXvZ
	WyMeIzsKVnvguDLIQVy0wlQKAHDY1c4DxQCyjGVhgcXaBe8xw8T8MyyG4XBBqm7k8v2KogaOwd5wV
	G3mZs9ryZv9rj3C1K8LbDt6f9oIOxxgdYIg2pLu/vvCGvjOiEvsxwktwZj4MhJC7tg3Q+Q/DtpmB2
	Q+E41CFA==;
Received: from mail-westcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c112::7] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU9Vq-00000007inR-3Ozc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 20:45:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BY5wiakhN9FjQSzLsmUwPIfTFKIUp6UA/0s9ulu9O1WIRNoKlDqPPTR5tNvIBCafxxOH+iDnkHgR8mHQLPzX4aaxgEpqA4yua1i4L2lrYJbpHaXiMTec7nIGPsgSVspmYDcKu3thXkPcWWtFeCXs5mmQzrafcx/Zmg1W2zBbOP6dMYfiAekGWyflFvxXrjAJmnIcpxCjr8NAkb2ygAOw54Nx1fb6TKd09zX4cRoSdZ3/loCdpVDEO393p0yA9fF4lP20atYvwybK0nroK+BfOGlLk48T1g/H47ff4USAfAT8qrZHGUDhTydEipiKvJByv2Fr2bSWGe/OBp2tJBkyNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sOT4sf7IH6jAMiFNNsQ2ocidGPbf3S9u6XFk3/8aIWA=;
 b=GhjFFtxAji1J6a7y/CPU3++ihGbq2bBg4HHbND2Lb3F290cHLa+wnzAoo5ytACeOCtbid0w96GMudjPbjxjuYVDRGnoiyglF5XDgeLiHDbm9Fo45tkl9dpKBblgh2j7mxR1w+z0oV4xx+uEXMCsp29apPg7Tj0wQB2NLz3qRwFVXfnf6T8WPaOijnDg+AtlRSPvcldYjQEcfYT+nyL1h0NoaxlDP9DyTMqiPAeFI2a2hBhgm/OucMyxzIzzS5u9Sipr3bvnqJQxMoCV9jgTP/5gbbY5INft5BALwAL0Emet5HDgHoXJjoviL5TEyqyVsfcky+JWkqSCnAIvGT+7Imw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sOT4sf7IH6jAMiFNNsQ2ocidGPbf3S9u6XFk3/8aIWA=;
 b=D/rtURLfnZzoe0Yn3GW8LfvKyZREsciEzzT/QKK5mfPIJZkZ2azTv7soK6nMdBPblqs9qU73EmQD2r/COQEtL45O1YwHspEAhs8sb932YIseUOvf7K+rbSUhAr3ge60GRqvoUMCSQ9iFuy4eQDm4pRi6eD5sQG8PV78VXCJhu/hZnsrXiIWcu85MKQ/zpBs4dWlO+q++wwdpGBOOYUmCr+hqHsn0l5Gj+XAW0GNLX9e/7HoP9viqNjJSYZoSWQ0Yr2pqSgwUQwPQPdW4UskEtxnhRd70ns3gvdUyu6m1rE+VIHqIFIU/CxLA3bXoeXqChZkupzW/ZOxW1pt6Eo6Ocw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB8768.namprd12.prod.outlook.com (2603:10b6:8:14f::20)
 by DS0PR12MB8042.namprd12.prod.outlook.com (2603:10b6:8:141::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Mon, 1 Jun 2026
 20:45:19 +0000
Received: from DS0PR12MB8768.namprd12.prod.outlook.com
 ([fe80::c16b:c351:2fc7:95e5]) by DS0PR12MB8768.namprd12.prod.outlook.com
 ([fe80::c16b:c351:2fc7:95e5%7]) with mapi id 15.21.0048.016; Mon, 1 Jun 2026
 20:45:19 +0000
From: Seth Forshee <sforshee@nvidia.com>
Subject: [PATCH 0/2] firmware: arm_ffa: Fix RXTX_MAP buffer size
 regressions
Date: Mon, 01 Jun 2026 15:45:10 -0500
Message-Id: <20260601-b4-ffa-rxtx-map-fixes-v1-0-c071b12ae05c@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFbvHWoC/x3LTQqAIBBA4avErBvwr6KuEi2sxppFFhohSHdPW
 n48XoZIgSnCUGUI9HDk0xfIuoJlt34j5LUYlFCtaLTE2aBzFkO6Ex72QseJIipjaKVO2l43UN4
 r0B/KOk7v+wH+T9alZwAAAA==
X-Change-ID: 20260531-b4-ffa-rxtx-map-fixes-244ede71a935
To: Sudeep Holla <sudeep.holla@kernel.org>, 
 Sebastian Ene <sebastianene@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Seth Forshee <sforshee@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: DS1P222CA0009.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:8:454::15) To DS0PR12MB8768.namprd12.prod.outlook.com
 (2603:10b6:8:14f::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB8768:EE_|DS0PR12MB8042:EE_
X-MS-Office365-Filtering-Correlation-Id: eab88bdf-fde2-4a38-4226-08dec01eb16c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|3023799007|11063799006|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: N7nA8yllY6D52m4709V4VarbH7/OwPl1J63NXmkAdmkTbEL75bDmeYUAzuGyL6qb9DWRiCPTfG0EojrCre4vJphOF0wxaQgJY90WpiWvX7Pavb72d0pB37y1vndATAxJQne7yUQOSxfelsAP2c0JezBfxZ9bNnm4YwLiGuBOuUVZkDaU4YcNOSJ99eZpRSFPgKNy2uzQ0JnM2E0UmMg7nd91fIwDpr34YidlNNKhfGzkADgqSwUUSRCMbb27lMtQVZfey8DC2yNCLNmgLHDmLgEjwKsn/37QcQceYMZPVewiGdDQGl13GQV4B2lTadsvBMJHa7/k8fCWNGgQg1l/VwU5BxcfgYHlc+FM5PlUPwXXxYR9d3njmWzzz58etD5lJjWeFOY1ogiQjOZh99+m8nWjQlL3/8uN7ztOEhCO9/drdxb3TAKQF5oluN/O2ChlPiqCRHGnabAOuD8ttayk4F35U15Zg5UqZx5cZRYo1DlChzyZVWYjrZgdqnoobDeX3bmyqfRsIF9fM8ZvY05fG/7DlH2jxRvlIR3Wz6burT6qyCJ2/1kN+P1O4GRGcW0g9GFYBBlBkeS37gT+F+Nnm9I0UX+KypoAkbwZ/IR7tUW6s9ePUf++fFY0e96YHYxXrpyeNxC/av6M2qtN/ZzwNFtDuPJnIL9CQdAW+S/6FplVPjhtxt6j7s2peFYUi+R3
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB8768.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(3023799007)(11063799006)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L3RIektMYWVXQmY1Z1FhNXIzcktWZ1c1OWFKSmYzMGZ3MXRjbzlFSHRtL3ZF?=
 =?utf-8?B?ZW9KN1Bjd2lMZzQxQkduSS95bEcxOThHVFpjdE5DMTRQTTJPNUprZU5qRUMz?=
 =?utf-8?B?RWE2SkNPWEJsOVlMSC9ndFcxNmQyZGRsMnpkTUNJVXozVzVyMmZ5cWpLc0hR?=
 =?utf-8?B?bEtVL1N2MVhxd0gwcG44SHBUcWdPeWlFNXhjSEE5aFFXUXkzVHJWVjJ3aTNa?=
 =?utf-8?B?dTNoVGhEdU8zYjRyOVQ1b1o5c3JJQXQ0TkpOemQ5WHcyN2JybUNqUnNMSFNC?=
 =?utf-8?B?WU5xYW1rY2gxS1puVFBlZ3M4bzdhQWQwajl1bVlFdGJaamRzbEV3MmwvbW14?=
 =?utf-8?B?Z2ExMVRHaUVjdXdlQnpHeGREN3BrKzB5U3JudWxESlcwQ1h1Wmd6RVlqYkVj?=
 =?utf-8?B?OXY3UklYTEppZnZDYjJCTnc4eXFjZzF2RWgrRTJaK05sZGRCYk5yZFg5OEtS?=
 =?utf-8?B?aW9VOHlLbjhuWXgzZU44WjhOSWFzdWNLWm1sVXRneHFGaCtjZ2ZidS81MVlF?=
 =?utf-8?B?NDgvSmhWRWI5NzluQkVIeUNMYzIrbWh2M3FkTzZOaWtySFlwenVkTVpZR1Nk?=
 =?utf-8?B?UnJYVVMvdGttWllZMkpBN0g2emNaL3FXYXJGVEVYV2VjRzVOdEpEQnNacmFj?=
 =?utf-8?B?bStwdEdXeWdNOUc0WG82S0VPYVFodis5bXZISUlpcHovSGFNVEZNLzA4Lytq?=
 =?utf-8?B?SjJNMzJ5UE4venFWQzRvZjRWYWNna3dTdzNTMnRyUzNxVWxiNmJYYzlqejB5?=
 =?utf-8?B?R0s0c05UTjF0UU1jRlh5RTM0SG1Pb1FiSTIvVk9yQ01QR3R1cUYrMmFzdER2?=
 =?utf-8?B?M3ZYbWJRLzVVaUR6dmJ1K3Q3MHRibVVHamRZRjNnZFJNNSs0SzVKb1hIWFpj?=
 =?utf-8?B?MVpCMStIOG5yRGkwNThzMDNXaEpLVDYzRmxMc2l1VEpNaFk5d2lCY0MvTkZD?=
 =?utf-8?B?bHdGL3lHSkNtQUdWcG9aZ3F6YXNWTFVIWjZOM3ZuWklDSXlNOWg1aWNrdUUw?=
 =?utf-8?B?d2lXdEU1bVRPMStTdndoNjlDdGtEQktLRGx1SFU0UmljclNkUDkrTit3bWFM?=
 =?utf-8?B?a2F1U1VJYWVWNC9FVU9sUVEvVDBCSTVqTWNWbktjVU5vZ2Z6dGdLdGExZ2ZV?=
 =?utf-8?B?eHlhRTdTSlc5S0gzMXpNNzNIQllPOTh0akY1djBwQ0s0Skl6OTVBT0MybGxG?=
 =?utf-8?B?REpTRzJRd0Mwc3k1ZEkwcDFGelpmWkt2K1RjTjdUQTBzOEYzTFFPdFRrWWdV?=
 =?utf-8?B?c1JiNmEzT2ZXMDMyUTJSZk5kWDVTSEFpYktVSzd6Z1VnaTF0Z0pLb3RWb2c1?=
 =?utf-8?B?MFJUT1Y4NUtwd3hLaFVqT2FxYzBweG91Q3c1YXloc0N1Z2cvWVgwN1JKQW5k?=
 =?utf-8?B?MDdNRFlSbUcxSkREWFhRWUt0UGxMbCs1QWdUZW5ya1JTNUJrUWpmQXF4ekJN?=
 =?utf-8?B?eUJwZFowQkhmUkhKWmttbVB4c2FFNWRyY0JVSTJuZ2tvR1pVVjZmQWJQU2VM?=
 =?utf-8?B?VHlGbVVoS1VPTzVlQXdKQUhUcGdXZ3V5MVpLcWc2bHQ2OHNaTUNvOUt6Nyt1?=
 =?utf-8?B?T3lmVHNHb2poWTFRZUd6ZG03L0lYYW5HS2tBNUNxSTdsSW9SVVJibDFRRkth?=
 =?utf-8?B?QmN0SzdKZ1Rja3N0K3FBQzh1TlloanJ1MTI4d01SWHlOS0xCVUN5aE5xcW85?=
 =?utf-8?B?OGdicEpaYS9OVkVQaWdUK2NEeldtTkNCWkxaS0N5dkMzUjF3bnp3UXFYa2tV?=
 =?utf-8?B?WkRUODRNaFN6L3BMdGw4andrY09iUTA4MisvWXBKaWIzWFBZMDJybXcwWUdI?=
 =?utf-8?B?bGFEa3JJVnF4dy9LaUV2Nkc2Skc5U0J2NWRsY25ROFdZS1lsWUFoRHV5RDlL?=
 =?utf-8?B?VUtWRURwLyt4eEg3Y0Mra3Zhd3pJK09pUUVMVXdSbHg1SFV2Q0RUc1JFY1N2?=
 =?utf-8?B?d29FUWRCdWMveWFoVTdCOEtZL1hLdm9uemRtNWJ2V2VUWk5USlZQd0p2UmVh?=
 =?utf-8?B?QlBQaWVudXRUK2F6cTliUUxIb05UTDNEbllzZGVmdTkxTFRlQWViMTN1NUxq?=
 =?utf-8?B?NWVKYnA3L3J6dWc4SnZ5UjdjcFlyL1BacVNXRUNBekFyL3V2VTJ3cWxobmFF?=
 =?utf-8?B?SEVOQ3N2MitId1pxcUNFUHdzdy9VN0MyNFYxZEQ2b2pYRmtZeHl1TzBzbHNU?=
 =?utf-8?B?RjB1ODZSa3pYL3hoWVI0T0R0UXlBcHQ3N2hjY1N1RkZFcnRqRWxqUWVtWlVj?=
 =?utf-8?B?TktwUW50NVZNNExPTlkyWnJzR0R3TVhuZXFvQndSWkFGQUhyWExiLytyclV3?=
 =?utf-8?B?bVdzekltMDVmUnBINDVHNERrR3BEekR3ZE9JSUhpZWJWQXZYV1R5dz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eab88bdf-fde2-4a38-4226-08dec01eb16c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB8768.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 20:45:19.2826
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qTobyYHiVvGIEKRwYnoEAJ+hKBVoFtvKjbwWuPlBQYtCXA74slPJNtSSbsMOyKglULc1s00KAZ8V+GEE+Q48Dg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_214531_335563_ABEC718F 
X-CRM114-Status: UNSURE (   8.92  )
X-CRM114-Notice: Please train this message.
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

Commit 83210251fd70 ("firmware: arm_ffa: Use the correct buffer size
during RXTX_MAP") caused a regression for some FF-A implementations. It
has the effect of passing the size of the page-aligned buffers to
FFA_RXTX_MAP, which may be larger than the maximum size supported by the
SPMC. When this happens FFA_RXTX_MAP will fail with INVALID_PARAMETERS.

The following patches deal with two distinct scenarios which lead to
this issue. With FF-A v1.2+, FFA_FEATURES can specify a maximum supported
RX/TX buffer size, so patch 1 decodes this field and honors the maximum if
specified. For FF-A v1.1 and earlier the maximum is unknown, so patch 2
deals with this by first attempting FFA_RXTX_MAP with the page-aligned
buffer size (preserving the behavior introduced by commit 83210251fd70).
If this fails due to invalid parameters it retries with the minimum buffer
size from FFA_FEATURES.

Testing was done with FF-A v1.1 and v1.2 implementations, both of which
reject buffer sizes larger than 4K. Both implementations were tested with
4K, 16K, and 64K pages. Without these patches, probe fails for page sizes
larger than 4K with the message "failed to register FFA RxTx buffers."
With the patches probe succeeds for all page sizes.

The patches are based on for-next/ffa/fixes.

Signed-off-by: Seth Forshee <sforshee@nvidia.com>
---
Seth Forshee (2):
      firmware: arm_ffa: Honor maximum RX/TX buffer size
      firmware: arm_ffa: Fall back to minimum buffer size if RXTX_MAP fails

 drivers/firmware/arm_ffa/driver.c | 51 ++++++++++++++++++++++++++++++++++-----
 1 file changed, 45 insertions(+), 6 deletions(-)
---
base-commit: a6848a50404eefb6f0b131c21881a2d8d21b31a9
change-id: 20260531-b4-ffa-rxtx-map-fixes-244ede71a935

Best regards,
--  
Seth Forshee <sforshee@nvidia.com>


