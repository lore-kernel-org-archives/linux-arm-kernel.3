Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E81E3108E1E6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 10:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:Cc:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5+dgfPPjiWXhkin38pYgnFWhqCJM4E2nF5cedFHYmfo=; b=ewuOzTyDsLX48Z7k1h8L1xE5Tr
	oIqerBIVi9TsoopjhhFv0rBfJ/Mu8VMNpJiwyd2rnMml01fqO3wtv061t86tz6O4YYUau/DfM05YK
	7axcAW5RpTyQC04GIrV9mp6YrTC9YWpKBvZsrpa+ZrZ5prAzQds646T+8OxkVz8Rfvdi8bUfYU76s
	q5HchQQeUjjAdHbOgCM4m+7LbQf6Zp5HNB833WW+Vs+hfHOB26i3K8NXR/ta0PJwBPltVF5Rx2zad
	r4UtDjdkvTg3gqz89d+I4NFYcdJ/uirtlL7WuVZ9inmaPBnblMNSnEeluGWF/bcqYjakW0UVbuWZ/
	ObTcmblQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3B66-0000000AT5h-2RRt;
	Thu, 19 Mar 2026 10:59:26 +0000
Received: from mail-swedencentralazon11013030.outbound.protection.outlook.com ([52.101.83.30] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3B63-0000000AT54-3Lgl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 10:59:25 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=H12XF1OLv5ceNeLglG5GHdxWxzxTZClQ9Zbn1UHdRk/MGGem/pzYhJM4UbDdHkj49iEg75DyXeNTlz6WV/ZhvLjgZ4o8TK3jv6fCwufez6u9PgZgwPUq8T09c4ow7vYszQqldhiuMXhbLnKjFyQ6vaZhMOF/k+YrtgXX+6Z2khD1w1qwZFA2r0R87AjC6CpjLPC9Es7Yml5SE0ZaUgYMwsn+oXAQ928FWhIBs7SKQMsGp1gLxaNdlnnfwtXMPNzyJ8XzZ53mGyiiRe/jAsel0svqLoVCodULfQWo3uxyG+jJYS7n9leOIh78w11yVKm9E4GWWRqqzd2P85elH9VTKg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5+dgfPPjiWXhkin38pYgnFWhqCJM4E2nF5cedFHYmfo=;
 b=o4IdSrESZ7IM91m2IRNs1l1uJBmz1ru42QX8qZ3LxkCFMlv87XNdReAzqkNL6YipA8vpaDuhz52YoIZaHSuajpp4/epvcfnlfsebfI9yIjVL3z+M/l5ObIRwdCg623qECoNexQEyC9gj4Ibv4/Pr5+2mdG1lajdaK2SVxLWStfj5LSjzx6KmobHNjbTVCT0l9EAvoqBYjuE+5YXAchdFvdTsNnk7MouisCkSRFGq8TH3QVQhpf0pd+dMmJ7SgIctgCLiLs2Eu0cxQXVQO95TxLYv3xldyfDD7A07m+Ci0jb8Wj+7gApPN2WdMMAYVwi9NypkmuAijDoEE6YEPCcAUw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5+dgfPPjiWXhkin38pYgnFWhqCJM4E2nF5cedFHYmfo=;
 b=AELC8bH3mGqVpcurjK0EcqqGhUHQ5WZN2Kpbbcn7W1cvMyPdJ2KUhR/6apxtf/Dw6bPX2w9CtWnCTzM7yto5gjIq9XTGmT3DnHRYnUD5fXEyzgycHxbV/m/1XMi/AfVhQysPU8RRP6PRFvwZpJpsoMtlvH09BruQYfsz+1JrafI=
Received: from DUZPR01CA0340.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b8::13) by PA6PR08MB10648.eurprd08.prod.outlook.com
 (2603:10a6:102:3cc::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Thu, 19 Mar
 2026 10:59:14 +0000
Received: from DU2PEPF00028D09.eurprd03.prod.outlook.com
 (2603:10a6:10:4b8:cafe::2f) by DUZPR01CA0340.outlook.office365.com
 (2603:10a6:10:4b8::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.28 via Frontend Transport; Thu,
 19 Mar 2026 10:59:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D09.mail.protection.outlook.com (10.167.242.169) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.19
 via Frontend Transport; Thu, 19 Mar 2026 10:59:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WMCmCMIdBvMOPGH/aPp4dj/3x7TeJAfIPfJhkZ2WLHSO73q0AJMnTcrx3RECoN1F73sTP3MHg5CHCR55u7bbFwmW1JnkWkcVzEPvIp371jtfgXg468ZOVmywG2XSRkXgKpawQx7LFfEFBSqryzHrtjWSHnL5Qq101iKW7lVs5aXR5qxQzUyW6XHzPcay5DqLAILBoWtRdpArclmt2WMrqIyfoRs7SfzdFMfi63YOc1+wCKtRCxeo/PiVTjVuNpPL88kWlJQg7ENSoYKnbhMJmrnGb4XxATYO5QBQ5NUw7B2vhOAi/umt3Lchrz7hDkRWwcmp7UkgtXInYMsXDJh8oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5+dgfPPjiWXhkin38pYgnFWhqCJM4E2nF5cedFHYmfo=;
 b=dnA5Vf/5XD9xjTZ+me+epmoPQf3ogwP+P/chg2vbGPpVe6+2DkSulAOKjgUp/mxbDv7LULAShDJ+rb5ccBCR9K67TSGHK3tHPRovIZryhQXOccl+jYBa6Cag1mcK7l9B0HRJz5y9BYPAEHABcxbOL0nQyscEM5QKj3Az+xTNCek2TqDxIWheeb0QolpElMQj8H/PU5GmuLlsaAZr4ipSHkPCAWcumjsqL/IX/kCKfjFX/CFIkh9NsUdt79ycl0itBExyH0peat436oGXHw8a/4xKY5wOx2PNBcmLv0xLe8PIfDcrgn+jM60Yhfa+DSyhO6XA/4NRTTtUOOonO8VhyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5+dgfPPjiWXhkin38pYgnFWhqCJM4E2nF5cedFHYmfo=;
 b=AELC8bH3mGqVpcurjK0EcqqGhUHQ5WZN2Kpbbcn7W1cvMyPdJ2KUhR/6apxtf/Dw6bPX2w9CtWnCTzM7yto5gjIq9XTGmT3DnHRYnUD5fXEyzgycHxbV/m/1XMi/AfVhQysPU8RRP6PRFvwZpJpsoMtlvH09BruQYfsz+1JrafI=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM6PR08MB3414.eurprd08.prod.outlook.com (2603:10a6:20b:49::10)
 by PAWPR08MB11454.eurprd08.prod.outlook.com (2603:10a6:102:50b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Thu, 19 Mar
 2026 10:58:11 +0000
Received: from AM6PR08MB3414.eurprd08.prod.outlook.com
 ([fe80::dde8:bf0b:1dc:2a2]) by AM6PR08MB3414.eurprd08.prod.outlook.com
 ([fe80::dde8:bf0b:1dc:2a2%4]) with mapi id 15.20.9632.017; Thu, 19 Mar 2026
 10:58:10 +0000
Message-ID: <256b9d8f-3315-4f7f-a6be-da2d58fd670a@arm.com>
Date: Thu, 19 Mar 2026 10:58:09 +0000
User-Agent: Mozilla Thunderbird
Cc: usama.anjum@arm.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: mte: Skip TFSR_EL1 checks and barriers in
 synchronous tag check mode
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Thomas Huth <thuth@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 Lance Yang <lance.yang@linux.dev>, Yeoreum Yun <yeoreum.yun@arm.com>,
 David Hildenbrand <david@kernel.org>
References: <20260311175054.3889093-1-usama.anjum@arm.com>
From: Muhammad Usama Anjum <usama.anjum@arm.com>
Content-Language: en-US
In-Reply-To: <20260311175054.3889093-1-usama.anjum@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0622.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:294::7) To AM6PR08MB3414.eurprd08.prod.outlook.com
 (2603:10a6:20b:49::10)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM6PR08MB3414:EE_|PAWPR08MB11454:EE_|DU2PEPF00028D09:EE_|PA6PR08MB10648:EE_
X-MS-Office365-Filtering-Correlation-Id: acfa6553-2764-4e48-6ef5-08de85a68e67
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|376014|366016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info-Original: 1kJprBm3lR3CTNs8duleTqYCY1Ia2MQneO+xTJ+lPl/mv95td3acO93yVeXV3fciVbBrvyM/9d7j8x5WSS8RKUuQy5vd0ygnTt/HGBFELstBTi6UWu4glVXyeKdiG73bX0fy9g2mPIwfOiHeM9JieDank5A156cfOVubx+Uf/6TTkF7iI7PtJpDMAaKTzBrhYzJRaAm5hgw3mx/PVfM1Yp/la6AdCJWDZi6aL2uLpa+ov579Ohl3ZMimb56APocPJdQFV8nIGoyA6v7HmdkEP4cCItZ6cz0IqAo79h7OkYrJaGK1jySokbm9/E/0jaQ2TuSRaGDOUZ+cXzQHtmgCPucmCjIkhfD5qjJKxdZVseOIEdFdzRcBEFnNMt1k+hPRMBCSZNVuvIXpVg6N9KgCdq6kyt6sA90UpTTmqlTpBXqdQ9K9V0KpYmFFpQ9jlROdGbWaWaEfhdJQCgd80NAYbZ47WHsLkhwe6xbz6CJyCg0zR0Zt5l2iK8eaAByjLlHbCHdrWyDu+LuAvackeNhx0mpJiTwwpfvuoubNLIgLY+u3WIsOg7i5DnIHuGUprp2EFO9W2Ih7gPa7utWUcpEZPFAXB9/xbKFvrqJtp1THJ8/5ea6gFFBXMTJH/M2mesJujI1Nq0y6tKiUyXHDJbBrfaMBJYlpa2DR0N3kaZgO5rQfn/24X3+gvdWU0GMqR+9/
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3414.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked: EHGrS7+E374ryF+QpdhdYGpme+OFiaVZmFDnMbBLMxRg3GVWKJB0Ov2LqbU129Z4izAF+C5qi9+vbU2oFPRQLasXkyOcLl/uvSRbUpf3BiMYE/yEE0sxDVL0N5iXcfhCZF4FOQ0XKc6Sf3lBgv+fiqNYEiJm0Kd7y3Bcxx0T/DWgBISTDiAH7MO1jqLg5+DzVcXiScqzex8W8Z2p4U7P5M8zO6F7bOMTk9LzqNyOEHVdXNUhB8n5eRl55gczhRBGLzyXTaURy+PKMt8iZxP7NT/QGM2Icd3x5CRi9wo0wXLNBLFPrN3/apXzvAQnJVToICn/6SIFWWGvu03BZXrk4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB11454
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU2PEPF00028D09.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 887993c4-5f2c-476a-19fe-08de85a668eb
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|35042699022|14060799003|376014|1800799024|36860700016|56012099003|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: rbMOzszga9iOHuZQxsFkDERgBCCbBnAIIqUJ1lSsa+AC//rIcidwzJsT2iBEOTx/9HEwca5BXQXl8iTNxDW6CvWhBY3wCfPI4ax895aumxYjnrMYjTBQZNBr3mbs/eT4xcUi2o8O4Hz4b7MOmbNWe1vrzAVLeYLF7zYh6HovYI2OPCzUSyNB216gc6P+QVa2lfh+H4e/Ds7HzVX+D2eF6jGyfImLkc6cODGfUKuJu0d1iV2TXnXn6JPEQeWhv1XTi2r2D5iZMLPKGRnxg5oLc1L6jyct9I5nYiuBMK0kDZC2R13CHlsOpwQj2NU1icdXn0ilcF4dJF2bxKa3jdpmz1zLWjRXRsBTiArE/VHbnVKjYjGdLIR6cysIF5ML24PQWAshvx4SsRGkqImecUss6Lvug43oYwfrNd6mXd/zTm9PduyVYQ+66mutU2EbGt5Ri3dtkuA1ruJ4m+XTMYYdajjvHNbgtiHAF4ef6fcZ4B52EIINRSxI3N7vZNAr7xUm+gvV7YQELeYYSjwAa9g5CMS3Hz+cjWaYneB5EoUAAH3yzBspbXcAWKaN7/gdTLSpeCgP47exM/2EHYZ2vt/PKEdALZWy5Iz6VZPrENyDgz/xlFZJ8nXM+w4G9vO+eAb3Gx6ibMigqswdtyvS/YJvOBdRr8yhb5ad0bvGCI5frffPaOdiKFtEEbjRj/60S8/ElAiyxyXCBMDm0Ltd5wQy4AgiOA5MrMeqgY0FBrIMW88=
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(35042699022)(14060799003)(376014)(1800799024)(36860700016)(56012099003)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 5kp1WjBtD4FRfhs/O5WrYhdURgr95uTLowyqwObsYX2oBC28s5VOHJ1FO7XawWDWDBUNEWpnxglhhx+3Rvh0tVqyBMHKnRiD8yaDGNdh9eFLHkz6EEom9KaBK1NoWgdJLhoWULdAsPvB6Qw1HQfQRWNUTBwJUARtW4qGtKaSyCj7HfnzKFDcGUJ1ItK0iG6wQsWukpfWMaZYHzp6CIPKa7rxdV67gO+a8eiikqAKfqSTLqfgWneY86aTDNY+VNm+1KVCRR6XrAIXRh+n0UXAwwrM9Mmhd9D8LEbS1hvKbJFg93VPZL3m9wukKcvHpfncESavEn702L308JQN8Od1bCA3qNx/PP4o397bGiK9Bzf3VouZ8hqfSLlt0Z4O99CAGUOOI7JPvsT2ULz20uvc7VqdN10kyRJkYZ5VBgA71Q701qVLhxzbCflZPzqs0Raf
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 10:59:13.2224
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: acfa6553-2764-4e48-6ef5-08de85a68e67
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D09.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR08MB10648
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_035924_044048_F17C3657 
X-CRM114-Status: GOOD (  11.12  )
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

Please review and share your thoughts.

On 11/03/2026 5:50 pm, Muhammad Usama Anjum wrote:
> In MTE synchronous mode, tag check faults are reported as immediate
> Data Abort exceptions. The TFSR_EL1.TF1 bit is never set, since faults
> never go through the asynchronous path. Therefore, reading TFSR_EL1
> and executing data and instruction barriers on kernel entry, exit,
> context switch, and suspend is unnecessary overhead in sync mode.
> 
> The exit path (mte_check_tfsr_exit) and the assembly paths
> (check_mte_async_tcf / clear_mte_async_tcf in entry.S) already had this
> check. Extend the same optimization on kernel entry/exit, context
> switch and suspend.
> 
> All mte kselftests pass. The kunit before and after the patch show same
> results.
> 
> A selection of test_vmalloc benchmarks running on a arm64 machine.
> v6.19 is the baseline. (>0 is faster, <0 is slower, (R)/(I) =
> statistically significant Regression/Improvement). Based on significance
> and ignoring the noise, the benchmarks improved.
> 
> * 77 result classes were considered, with 9 wins, 0 losses and 68 ties
> 
> Results of fastpath [1] on v6.19 vs this patch:
> 
> +----------------------------+----------------------------------------------------------+------------+
> | Benchmark                  | Result Class                                             |   barriers |
> +============================+==========================================================+============+
> | micromm/fork               | fork: p:1, d:10 (seconds)                                |  (I) 2.75% |
> |                            | fork: p:512, d:10 (seconds)                              |      0.96% |
> +----------------------------+----------------------------------------------------------+------------+
> | micromm/munmap             | munmap: p:1, d:10 (seconds)                              |     -1.78% |
> |                            | munmap: p:512, d:10 (seconds)                            |      5.02% |
> +----------------------------+----------------------------------------------------------+------------+
> | micromm/vmalloc            | fix_align_alloc_test: p:1, h:0, l:500000 (usec)          |     -0.56% |
> |                            | fix_size_alloc_test: p:1, h:0, l:500000 (usec)           |      0.70% |
> |                            | fix_size_alloc_test: p:4, h:0, l:500000 (usec)           |      1.18% |
> |                            | fix_size_alloc_test: p:16, h:0, l:500000 (usec)          |     -5.01% |
> |                            | fix_size_alloc_test: p:16, h:1, l:500000 (usec)          |     13.81% |
> |                            | fix_size_alloc_test: p:64, h:0, l:100000 (usec)          |      6.51% |
> |                            | fix_size_alloc_test: p:64, h:1, l:100000 (usec)          |     32.87% |
> |                            | fix_size_alloc_test: p:256, h:0, l:100000 (usec)         |      4.17% |
> |                            | fix_size_alloc_test: p:256, h:1, l:100000 (usec)         |      8.40% |
> |                            | fix_size_alloc_test: p:512, h:0, l:100000 (usec)         |     -0.48% |
> |                            | fix_size_alloc_test: p:512, h:1, l:100000 (usec)         |     -0.74% |
> |                            | full_fit_alloc_test: p:1, h:0, l:500000 (usec)           |      0.53% |
> |                            | kvfree_rcu_1_arg_vmalloc_test: p:1, h:0, l:500000 (usec) |     -2.81% |
> |                            | kvfree_rcu_2_arg_vmalloc_test: p:1, h:0, l:500000 (usec) |     -2.06% |
> |                            | long_busy_list_alloc_test: p:1, h:0, l:500000 (usec)     |     -0.56% |
> |                            | pcpu_alloc_test: p:1, h:0, l:500000 (usec)               |     -0.41% |
> |                            | random_size_align_alloc_test: p:1, h:0, l:500000 (usec)  |      0.89% |
> |                            | random_size_alloc_test: p:1, h:0, l:500000 (usec)        |      1.71% |
> |                            | vm_map_ram_test: p:1, h:0, l:500000 (usec)               |      0.83% |
> +----------------------------+----------------------------------------------------------+------------+
> | schbench/thread-contention | -m 16 -t 1 -r 10 -s 1000, avg_rps (req/sec)              |      0.05% |
> |                            | -m 16 -t 1 -r 10 -s 1000, req_latency_p99 (usec)         |      0.60% |
> |                            | -m 16 -t 1 -r 10 -s 1000, wakeup_latency_p99 (usec)      |      0.00% |
> |                            | -m 16 -t 4 -r 10 -s 1000, avg_rps (req/sec)              |     -0.34% |
> |                            | -m 16 -t 4 -r 10 -s 1000, req_latency_p99 (usec)         |     -0.58% |
> |                            | -m 16 -t 4 -r 10 -s 1000, wakeup_latency_p99 (usec)      |      9.09% |
> |                            | -m 16 -t 16 -r 10 -s 1000, avg_rps (req/sec)             |     -0.74% |
> |                            | -m 16 -t 16 -r 10 -s 1000, req_latency_p99 (usec)        |     -1.40% |
> |                            | -m 16 -t 16 -r 10 -s 1000, wakeup_latency_p99 (usec)     |      0.00% |
> |                            | -m 16 -t 64 -r 10 -s 1000, avg_rps (req/sec)             |     -0.78% |
> |                            | -m 16 -t 64 -r 10 -s 1000, req_latency_p99 (usec)        |     -0.11% |
> |                            | -m 16 -t 64 -r 10 -s 1000, wakeup_latency_p99 (usec)     |      0.11% |
> |                            | -m 16 -t 256 -r 10 -s 1000, avg_rps (req/sec)            |      2.64% |
> |                            | -m 16 -t 256 -r 10 -s 1000, req_latency_p99 (usec)       |      3.15% |
> |                            | -m 16 -t 256 -r 10 -s 1000, wakeup_latency_p99 (usec)    |     17.54% |
> |                            | -m 32 -t 1 -r 10 -s 1000, avg_rps (req/sec)              |     -1.22% |
> |                            | -m 32 -t 1 -r 10 -s 1000, req_latency_p99 (usec)         |      0.85% |
> |                            | -m 32 -t 1 -r 10 -s 1000, wakeup_latency_p99 (usec)      |      0.00% |
> |                            | -m 32 -t 4 -r 10 -s 1000, avg_rps (req/sec)              |     -0.34% |
> |                            | -m 32 -t 4 -r 10 -s 1000, req_latency_p99 (usec)         |      1.05% |
> |                            | -m 32 -t 4 -r 10 -s 1000, wakeup_latency_p99 (usec)      |      0.00% |
> |                            | -m 32 -t 16 -r 10 -s 1000, avg_rps (req/sec)             |     -0.41% |
> |                            | -m 32 -t 16 -r 10 -s 1000, req_latency_p99 (usec)        |      0.58% |
> |                            | -m 32 -t 16 -r 10 -s 1000, wakeup_latency_p99 (usec)     |      2.13% |
> |                            | -m 32 -t 64 -r 10 -s 1000, avg_rps (req/sec)             |      0.67% |
> |                            | -m 32 -t 64 -r 10 -s 1000, req_latency_p99 (usec)        |      2.07% |
> |                            | -m 32 -t 64 -r 10 -s 1000, wakeup_latency_p99 (usec)     |     -1.28% |
> |                            | -m 32 -t 256 -r 10 -s 1000, avg_rps (req/sec)            |      1.01% |
> |                            | -m 32 -t 256 -r 10 -s 1000, req_latency_p99 (usec)       |      0.69% |
> |                            | -m 32 -t 256 -r 10 -s 1000, wakeup_latency_p99 (usec)    |     13.12% |
> |                            | -m 64 -t 1 -r 10 -s 1000, avg_rps (req/sec)              |     -0.25% |
> |                            | -m 64 -t 1 -r 10 -s 1000, req_latency_p99 (usec)         |     -0.48% |
> |                            | -m 64 -t 1 -r 10 -s 1000, wakeup_latency_p99 (usec)      |     10.53% |
> |                            | -m 64 -t 4 -r 10 -s 1000, avg_rps (req/sec)              |     -0.06% |
> |                            | -m 64 -t 4 -r 10 -s 1000, req_latency_p99 (usec)         |      0.00% |
> |                            | -m 64 -t 4 -r 10 -s 1000, wakeup_latency_p99 (usec)      |      0.00% |
> |                            | -m 64 -t 16 -r 10 -s 1000, avg_rps (req/sec)             |     -0.36% |
> |                            | -m 64 -t 16 -r 10 -s 1000, req_latency_p99 (usec)        |      0.52% |
> |                            | -m 64 -t 16 -r 10 -s 1000, wakeup_latency_p99 (usec)     |      0.11% |
> |                            | -m 64 -t 64 -r 10 -s 1000, avg_rps (req/sec)             |      0.52% |
> |                            | -m 64 -t 64 -r 10 -s 1000, req_latency_p99 (usec)        |      3.53% |
> |                            | -m 64 -t 64 -r 10 -s 1000, wakeup_latency_p99 (usec)     |     -0.10% |
> |                            | -m 64 -t 256 -r 10 -s 1000, avg_rps (req/sec)            |      2.53% |
> |                            | -m 64 -t 256 -r 10 -s 1000, req_latency_p99 (usec)       |      1.82% |
> |                            | -m 64 -t 256 -r 10 -s 1000, wakeup_latency_p99 (usec)    |     -5.80% |
> +----------------------------+----------------------------------------------------------+------------+
> | syscall/getpid             | mean (ns)                                                | (I) 15.98% |
> |                            | p99 (ns)                                                 | (I) 11.11% |
> |                            | p99.9 (ns)                                               | (I) 16.13% |
> +----------------------------+----------------------------------------------------------+------------+
> | syscall/getppid            | mean (ns)                                                | (I) 14.82% |
> |                            | p99 (ns)                                                 | (I) 17.86% |
> |                            | p99.9 (ns)                                               |  (I) 9.09% |
> +----------------------------+----------------------------------------------------------+------------+
> | syscall/invalid            | mean (ns)                                                | (I) 17.78% |
> |                            | p99 (ns)                                                 | (I) 11.11% |
> |                            | p99.9 (ns)                                               |     13.33% |
> +----------------------------+----------------------------------------------------------+------------+
> 
> [1] https://gitlab.arm.com/tooling/fastpath
> 
> Signed-off-by: Muhammad Usama Anjum <usama.anjum@arm.com>
> ---
> The patch applies on v6.19 and next-20260309.
> ---
>  arch/arm64/include/asm/mte.h | 6 +++++-
>  arch/arm64/kernel/mte.c      | 5 +++++
>  2 files changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/include/asm/mte.h b/arch/arm64/include/asm/mte.h
> index 6d4a78b9dc3e6..0e05d20cf2583 100644
> --- a/arch/arm64/include/asm/mte.h
> +++ b/arch/arm64/include/asm/mte.h
> @@ -252,7 +252,8 @@ static inline void mte_check_tfsr_entry(void)
>  	if (!kasan_hw_tags_enabled())
>  		return;
>  
> -	mte_check_tfsr_el1();
> +	if (system_uses_mte_async_or_asymm_mode())
> +		mte_check_tfsr_el1();
>  }
>  
>  static inline void mte_check_tfsr_exit(void)
> @@ -260,6 +261,9 @@ static inline void mte_check_tfsr_exit(void)
>  	if (!kasan_hw_tags_enabled())
>  		return;
>  
> +	if (!system_uses_mte_async_or_asymm_mode())
> +		return;
> +
>  	/*
>  	 * The asynchronous faults are sync'ed automatically with
>  	 * TFSR_EL1 on kernel entry but for exit an explicit dsb()
> diff --git a/arch/arm64/kernel/mte.c b/arch/arm64/kernel/mte.c
> index 32148bf09c1dc..8da2891b834d7 100644
> --- a/arch/arm64/kernel/mte.c
> +++ b/arch/arm64/kernel/mte.c
> @@ -291,6 +291,8 @@ void mte_thread_switch(struct task_struct *next)
>  	/* TCO may not have been disabled on exception entry for the current task. */
>  	mte_disable_tco_entry(next);
>  
> +	if (!system_uses_mte_async_or_asymm_mode())
> +		return;
>  	/*
>  	 * Check if an async tag exception occurred at EL1.
>  	 *
> @@ -350,6 +352,9 @@ void mte_suspend_enter(void)
>  	if (!system_supports_mte())
>  		return;
>  
> +	if (!system_uses_mte_async_or_asymm_mode())
> +		return;
> +
>  	/*
>  	 * The barriers are required to guarantee that the indirect writes
>  	 * to TFSR_EL1 are synchronized before we report the state.


