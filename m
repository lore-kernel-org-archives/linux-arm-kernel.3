Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9B1BC7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 14:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i9MmeeKg8JK9+Mc46xGJmiRlOz5i6Wg25buvbbN2m8c=; b=v2C0d/fwfQ04f/ICE/djhjnifZ
	HOlHOybKFCr7gV1fXEeUKaWUw2RCpPZ4qk5T/Q3Ch6Fgp2ccpEWOv0zqSth1V6SJXqGVFTh/QVPUK
	BRJcEX+Nq+QC/0SLlndwHXHOULsSBXPQvuLdPjn/pNJaBcIyhPOjjGV6T8ukBbAFNvv1Xhtlnyauc
	NHTHBIrzlTNXWnCWnswyyUp9N4QVun6qfr9BbOv3xEe29VzDfgaOerpl4sJZFHQou7PEL4OW/vsqx
	8jXQ5U5REw4f0GqWgDfp+qynwlEMS6gh/mJvNgxC0gvAHKd7gwLgEFNBsA1ZSGY8IfjAWc7AKcpEL
	GluKB/EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUQpI-00000008ui1-1Hv2;
	Wed, 25 Jun 2025 14:10:12 +0000
Received: from mail-northeuropeazon11011049.outbound.protection.outlook.com ([52.101.65.49] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUNWN-00000008KvI-1aq9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 10:38:28 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=g2Jh+je14E3zo77nU6sxo2zUlq16cOWEesVDOWTB3ixMyv5Qj31ssUFQu9uSVhyaT2q6PV1OttnaXokb9vO5dA3znQHcbe85Rkj45oTV73XPLesGlZcg+7QZk84zoirDbS4mpBcz4S2Ibu9vK940fLcpfiiZGLILtSj+M3PErfjy2uhn4kkc3CszCg7qWCUQ6NKMu+NFdfT3hGkbAzxCYcoffgkk2NXpNpNIcvtDVQHZAVgQnDzDL50ratnGu0GvsslwDl+x3Yu2IJ/l/AY5RpCY8l8pIFnRN4ImSL0ee76P2dKDxDCShd4NjQjVaQWS04E4PtP1YWJW5rT4NBQhIg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i9MmeeKg8JK9+Mc46xGJmiRlOz5i6Wg25buvbbN2m8c=;
 b=W2hITO0qB8TMQF9jWBGFdp0oU+Y9vqmhYGzPkqKWQy7vEfgED6vCDeaEZBeZhTnpJwX3fTOAmLk8GlTZT21EHcbycVxbvJyI2hC0VdfngbyK1zgye+jsFiRTVYLF3DZVecZKTJABwATgJWWFLGBR7vX+/fYdnTCNNU238RoixpQ0IyfYSRDLgHZKGysV9O1jhHo8GuAfZkUvIMEIrW2cp4jdIi5nmlyj6BKQHOY+UFxg6STy4eQ1acStd/HINpXU/VOerSuPOLGCNElIkKKYe44Waqz2L8fRx9BgV82HqGnaCtKJx3Mnf9lDDtEmuFNXSfl8u2sN1s92lvkwjStYAg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i9MmeeKg8JK9+Mc46xGJmiRlOz5i6Wg25buvbbN2m8c=;
 b=rC3RQhGq5KciMWwQqlglI1cM3AmU5GxgVBSYW1ls5zWbJkdtmWuJplTZ0VhNdw4HmQM+ntvIX+acfCdxrb9rzxKn5i3CyW4x4PJcag3LfDU3JfmzNY1hkbZqu3y+wvsJ5nGOi++jwFeV/xrVhfQkCYehNBi+cPLcjn8cC/TZDZ4=
Received: from DB7PR02CA0007.eurprd02.prod.outlook.com (2603:10a6:10:52::20)
 by DB9PR08MB7510.eurprd08.prod.outlook.com (2603:10a6:10:301::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Wed, 25 Jun
 2025 10:38:21 +0000
Received: from DB1PEPF000509EA.eurprd03.prod.outlook.com
 (2603:10a6:10:52:cafe::1f) by DB7PR02CA0007.outlook.office365.com
 (2603:10a6:10:52::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.17 via Frontend Transport; Wed,
 25 Jun 2025 10:38:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509EA.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.14
 via Frontend Transport; Wed, 25 Jun 2025 10:38:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JgEFI7Pr5C+Dn8MIp1cUUjeqNDDurApk1lWqcwQzPrMbhFX8KwpDaIhc7F94j2yL+BGivJfczYLmR02ysOF8tOKlLi/8gP00W6xYeEiItsN5ZKCNUUgAS9F9cCTsucP3hm6dtJiYel22mwKcdGi6kgXAcaOlNuLqUvm3QUVWCq1P0VfHoJVMX4/nyHHAxaPqWYLv9lNjVIYQ+Q/HcyU+DKqoycxn5ZgftbWU/9vMGJeNgtNphUC/1r3aBg2JbbLKfhudWxxsg7Xbkt0hxeCkqi/o90s14FH+6632wYcbh125+bqpoIuxuB6ioJorINNpau3BLvJFGkGIa+PVHcNaLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i9MmeeKg8JK9+Mc46xGJmiRlOz5i6Wg25buvbbN2m8c=;
 b=nyVgywqtAGd+EAs8SKG6NbcYwgRffwVbna7JPfbf/V7Qb3u6SF+G+xp/1x3lBqEnGsQiYg8+jQAQgIRYJFz6MeL7QLdtuEAdwua2vm3ajBqCUlofBZSKTsl5QqfcyBruJ+HnJ5MtJUVGRIS5c5YdxQGUf/bXp1GRUzjyk2SN1rya8o7HxuXZ+EjVSDa9cIYnHTCiHkqk69WABUXfF3ZuEq2NfN89x5PtMpAy4YrKNnLLHdC8//r6ho4npeP/ekOWbQjVyMoYXuwJHwSnMemkio7RX+2dFLdOcKFnLXpWC+Mk9Mt+sEvEZpou4hGoEso0U9/tKlcZl3hw/62V8LfsBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i9MmeeKg8JK9+Mc46xGJmiRlOz5i6Wg25buvbbN2m8c=;
 b=rC3RQhGq5KciMWwQqlglI1cM3AmU5GxgVBSYW1ls5zWbJkdtmWuJplTZ0VhNdw4HmQM+ntvIX+acfCdxrb9rzxKn5i3CyW4x4PJcag3LfDU3JfmzNY1hkbZqu3y+wvsJ5nGOi++jwFeV/xrVhfQkCYehNBi+cPLcjn8cC/TZDZ4=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by GVXPR08MB10891.eurprd08.prod.outlook.com
 (2603:10a6:150:1ff::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Wed, 25 Jun
 2025 10:37:47 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%7]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 10:37:47 +0000
Date: Wed, 25 Jun 2025 11:37:44 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: sudeep.holla@arm.com, peterhuewe@gmx.de, jgg@ziepe.ca,
	stuart.yoder@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org
Subject: Re: [PATCH v4 2/2] tpm: tpm_crb_ffa: try to probe tpm_crb_ffa when
 it's built-in
Message-ID: <aFvRePYyX/Xuxe8N@e129823.arm.com>
References: <20250618102302.2379029-1-yeoreum.yun@arm.com>
 <20250618102302.2379029-3-yeoreum.yun@arm.com>
 <aFs02ZgVyGTg2cJx@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFs02ZgVyGTg2cJx@kernel.org>
X-ClientProxiedBy: LO4P123CA0178.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18a::21) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: GV1PR08MB10521:EE_|GVXPR08MB10891:EE_|DB1PEPF000509EA:EE_|DB9PR08MB7510:EE_
X-MS-Office365-Filtering-Correlation-Id: 65acfce5-60e4-4507-9c04-08ddb3d46736
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?vxBEj028zWmltDSy5eWfAkn8bDECtqj26Go3Dbb2yeM4EdKmlsGnICWIQ05Y?=
 =?us-ascii?Q?UgfXQiDNjI8lsy0ePigjtlqAOGwg3tCWSCqAvItVhbqu1qAQHrAoO8Q1DNFO?=
 =?us-ascii?Q?Bmh2LPhxtB53LDL/vRiCD4Q2oPktdUI/ULY7pThjPH3ZHWnZtoodly8SBkd5?=
 =?us-ascii?Q?JJtFBrqM81nEpxRSIKZQnbQXDtH36KpdlRqn8MDbY2fDj+QLlcwuw6D5VzGE?=
 =?us-ascii?Q?mePR5ib9dlQhZQr78KjdK+nGQjMIe0VmdKM+oJlXllynsCc7brfir77CvCxO?=
 =?us-ascii?Q?ZqPFbwQtGqje0gEaDcdQpuPAYHfTJSbydwlDPY+syGSR2odc4eh5/LVdDT7t?=
 =?us-ascii?Q?poY+HrHV8UYF6GZJGkpBMfm7+uT8fY/RTIRvNlIAQFyidHO5k014oKazs2CT?=
 =?us-ascii?Q?qnRWhlgpfjPpD3RU9xWNx9Bv7WTEsQEH+UPHsbXh6VrCDzMc+VTWYN67mkpr?=
 =?us-ascii?Q?y0xr0gcfeiYTbr3hyu3NW9l4JmQlF86JQYIc3DkUx68wlTiKlmevKOECg/nd?=
 =?us-ascii?Q?hFgrFdcLiSgOL5a46OircaY94FOaQIGoH6OSvr/iYRTcg1c90m+Y6zyxkpBj?=
 =?us-ascii?Q?6KbwEznuZVhuRGG994w3AKIvACbz2UWS719/SToZUsTE10o3NJZBfqSqWTPz?=
 =?us-ascii?Q?+jRM7hcWuf5i3WkaLAAYqNK6Y7Mef/6TW1cUJMabxdPM2LN8OP050txIClDM?=
 =?us-ascii?Q?qobcvSuHDjINp4hxc8DHbwrsd0FNgID/5BIAGGMZdg8ytwbj89qamKclIX+k?=
 =?us-ascii?Q?zlxb1JL17VAQkfXI0xIpQG8iPkP362qUQG7xY3iVjSayZqdriQLLuY2VPVvF?=
 =?us-ascii?Q?piylpGh+hC6ejsdXZZPDeTWn5DM8GAdgYO8yjkB8I0AYzQPznBH98qPbDCv8?=
 =?us-ascii?Q?KuhCwUJvqHjQDr8BhEaZKY3UvYgzOSiayrCZ/CiqyZkQ0AxWADzztLMV1RnL?=
 =?us-ascii?Q?k/VXtD7c/jqHgs251gFvyf+3ibp0AmY6TU6PSPtQDyLKYwenTFSW8y+0LlXT?=
 =?us-ascii?Q?kJl4//9B3cD3YNkLnyE2u2+DHUv1YVGfgJvMsMwwZmo4QtxWQvlRkeYot1vi?=
 =?us-ascii?Q?qqCaGOz9BUjCwdNCz7mg7T6epoh8d7mLHmL/dsnndIrPwqn59Acn79NL9S5y?=
 =?us-ascii?Q?Uyx11n5ySR0t3DVV4yKcVLuVEfGgX06N1NAtkucsAAzZBV94LxghfyzueASx?=
 =?us-ascii?Q?911doGQHUHoPn/nSg62RWbYUlKgVeD64ev/cDAOlhNx2Pbb7TlfPWZ0zg/E4?=
 =?us-ascii?Q?liWG8FhC/PZRtRwtpNWB1ZqiOTdXWk2HyQ59yYZBtkHsIMryJXXnqaerVVMM?=
 =?us-ascii?Q?aejlesqQbO0iJqRCniJfbvL9SyGSHFXn+gV3cAp9fWhX2erRPSyHtMWmNSwJ?=
 =?us-ascii?Q?7kkaoFTE4sQtydVyh1z9vZav9xp9HzcxCkYNIRK9YVMsqgbW4Q=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10891
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB1PEPF000509EA.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 51e47693-9592-47f5-6779-08ddb3d4538c
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700013|35042699022|376014|14060799003|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fl+51+fT3ZnFQ8xu0SXODd6lL3mtSEc5CWBRxjmzeA/Wg8CKdbaR86tcBjBx?=
 =?us-ascii?Q?aWVHf/XTGGwd401iVQjjqWXqiR5Cuny0iGnx89xmLFC7TCW+038cE5F0GpbL?=
 =?us-ascii?Q?a4QwHHWyiK/ShVGsiRFjR8kva8+nlntjcUkg/4seIKRRIhuIBHthVR91PpuF?=
 =?us-ascii?Q?aP+Gse0Nlwt6rga047TiXQNN1a+628Ys+qr4/xlSP1TuETOzJ2SCz57rMjbs?=
 =?us-ascii?Q?QmILgjdQWD/xVUD3QbsNnToY/DVifWnyF4MaPO+09Sb4t7ReZr0L8ujZTOdv?=
 =?us-ascii?Q?HXbk/XqgQHzt0s0wcIGZ6H0bQwX1FhvYGqbUtFruAQk68dtF1FnzmTUiTP4X?=
 =?us-ascii?Q?m7uB/mfEyl90lKS5mBv5sNs/hGmEphlC7DpKX6I6ALkGEA0DRcDpBEX/jqEL?=
 =?us-ascii?Q?SWjNEYaxtABaRUU2dXWB9rtA8iV4NiI/CCKVCGZYm/PSnc8BUNSXRhr26NB2?=
 =?us-ascii?Q?leSRsoqJ2vhkwqWz1ZR1OqqmR6o9RhickoD1WLWJR6Dcwaxo5Rj9o4imCndD?=
 =?us-ascii?Q?Xt7Iu2LN5gUuvxUPeNM8NyN17sNlsI38qMqlE7ftAZyZ+MEU/EY5FfWtMh13?=
 =?us-ascii?Q?ta73wL8ATf4q9XAE+QP8oAcw9u/W7GF/UYWMUXpugDym6gQ/YdjcnU+29mTx?=
 =?us-ascii?Q?a6UmmUxqUKrogTcU350w9uWgO4ajpgx85GNqh8sKA3F5Ma3wEPKVpRtZ6EPK?=
 =?us-ascii?Q?34q8X8iyI7GjI5SmDc6SVFtvndG+QvLnvRItDlnPD5m6xc8597tWmqUIZhws?=
 =?us-ascii?Q?jfwoM8VLG+LC9fNUjnmsUDIMc1SRUcRxCNfaDhoe+6sALVuIfYbNIWABNZgA?=
 =?us-ascii?Q?hiwao79jPdDuH4+qmPATTD+9YTkwI0gGrorNd76HWROEzfNJ+9rQUwdbfgAE?=
 =?us-ascii?Q?3nhEocAD5JdU6wYzih5R9mMf9VKSukCVG5HyxG8KqdsxgPoivf6ULWtAv5pv?=
 =?us-ascii?Q?f7mHysTJy/WemxKgCN7+ggXZoxeaZlLCNuz123KGravkDdnCqudG+LGpkris?=
 =?us-ascii?Q?2Adsgkv25Usql3j16bHGJj1c4qNayaP6I7/5UTKHW1AZoGlI+/f8RoU0ErAy?=
 =?us-ascii?Q?QQn6N1uq+5yaKnRPBhc5wXCa8t+xPEhQSCNXaRFcMl8yFfR6dfCR0KL3qs4v?=
 =?us-ascii?Q?K6KXfzGg952HmcC61kWWy24RHwOxwj+yIkk3msxHTWbCuoalRPtkUEqtGhr6?=
 =?us-ascii?Q?+2XRcpmQ6G2qQdMPDXfsHBoFcCVcWuyFNknbP9Ezeu6hlBMmJynXrYPsyLzp?=
 =?us-ascii?Q?3hoF5fag6cK+9i1jHkL6yURMqmSzBOxcWdAr3NKbMjll817aqJLjIr3hX/Lp?=
 =?us-ascii?Q?Ps/I3Pcf+xgPfQi5cY9vexC2y6QX3YXA9WJN7K7eHVglZnIpofW/ewYcX80K?=
 =?us-ascii?Q?vh39ENPdA5KHkvlEYBghoT+8fd0khvrQopo5u2uZBg5NUuoSM9/vB5HWAwsa?=
 =?us-ascii?Q?9W8meDcf5c1sfRiyGqoi3a68tbVCPciEwcZrkftHstj1AgCz1Gr2+irynWx/?=
 =?us-ascii?Q?s2Lx6mZfb3JEjHorCLZlZADniUvyZyUpmSO/?=
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(35042699022)(376014)(14060799003)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 10:38:20.1463
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 65acfce5-60e4-4507-9c04-08ddb3d46736
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509EA.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7510
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_033827_426466_5E18B6AE 
X-CRM114-Status: GOOD (  15.05  )
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

Hi Jarkkok,

> > --- a/drivers/char/tpm/tpm_crb_ffa.c
> > +++ b/drivers/char/tpm/tpm_crb_ffa.c
> > @@ -115,6 +115,7 @@ struct tpm_crb_ffa {
> >  };
> >
> >  static struct tpm_crb_ffa *tpm_crb_ffa;
> > +static struct ffa_driver tpm_crb_ffa_driver;
> >
> >  static int tpm_crb_ffa_to_linux_errno(int errno)
> >  {
> > @@ -168,13 +169,23 @@ static int tpm_crb_ffa_to_linux_errno(int errno)
> >   */
> >  int tpm_crb_ffa_init(void)
> >  {
> > +	int ret = 0;
> > +
> > +	if (!IS_MODULE(CONFIG_TCG_ARM_CRB_FFA)) {
> > +		ret = ffa_register(&tpm_crb_ffa_driver);
> > +		if (ret) {
> > +			tpm_crb_ffa = ERR_PTR(-ENODEV);
> > +			return ret;
> > +		}
> > +	}
> > +
> >  	if (!tpm_crb_ffa)
> > -		return -ENOENT;
> > +		ret = -ENOENT;
> >
> >  	if (IS_ERR_VALUE(tpm_crb_ffa))
> > -		return -ENODEV;
> > +		ret = -ENODEV;
> >
> > -	return 0;
> > +	return ret;
> >  }
> >  EXPORT_SYMBOL_GPL(tpm_crb_ffa_init);
> >
> > @@ -369,7 +380,9 @@ static struct ffa_driver tpm_crb_ffa_driver = {
> >  	.id_table = tpm_crb_ffa_device_id,
> >  };
> >
> > +#ifdef MODULE
> >  module_ffa_driver(tpm_crb_ffa_driver);
> > +#endif
> >
> >  MODULE_AUTHOR("Arm");
> >  MODULE_DESCRIPTION("TPM CRB FFA driver");
> > --
> > LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}
> >
>
> NAK

If you NACK with your comment on the cover letter,
Would you check the my comments please?

Actually, this wouldn't be fixed with the Kconfig.

Thanks

--
Sincerely,
Yeoreum Yun

