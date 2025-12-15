Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01900D59D99
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 09:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ttp8ukIKdkPNkBPD+2CWaqEikeiCIrfPbVyRAMx512M=; b=NykhP3Hmv66iG/KUQxUVldL15w
	AvVdYyumEsDWf9zd7rHQ6YOu6G5JteplpO7XCX1JPI9hc7l5EUMEX1u4+j8NvfGQfrfGwdIybLnGp
	bIFNkXxqnHs2IcwO2WQeJD0OolRBaQDD9UyXzR9zYIjeApiVars+02DuLou8BLQ1UGjDgvXFJ+e/o
	x2ILoZ8dT3iCbPZQ+kfo12WcPv6VAp5JNGErolhNPjFBmJixhqfZ0jGZPDE/KyxRTsqB6huoSxZmn
	/s9hb802PMa0k5lSQymIkf1oj1WrsqEYkGDSU27x8F+WkATxO6+WFf7+bwA2WxHxa+ByTbA+2UFxo
	+ZTXqhTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV5KV-00000003PRH-3E9N;
	Mon, 15 Dec 2025 09:57:23 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV5KT-00000003PQa-0rAh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 09:57:22 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=OStokhJxQwoD12y7qU7+RiDPRWFkeiJLgEaL5p43YZpCTG1EERbsz1dHHw5ZzgspVBP07EBFQllPUWXEBJKvAPXzZnTdfhoomSOKH73sSHfe+5mrie4pYkrcDbmDDLTDYlmhpPpCO69JaWlpVjWK73BjhnDJACdh1s0WqFUtlji4zbgZFWnE58c5bUfVszD2/dSDjzhCTuk8FjrvkTU+QZakZpZXHxVuwKhLPBFYeTsP7eNnSFuiP40eBbHKRfz96THlK5+JjHYD37r/3zt79qDEbNlqU1gXw/XYosOVe9+Kih5YVQLTkxWvOrK5frSP/jIkPlzQpXVgv6WEsb8E5g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ttp8ukIKdkPNkBPD+2CWaqEikeiCIrfPbVyRAMx512M=;
 b=oxsI1IE6rk14/pTWk4OnwRUnJJjQYXQAzQhQy3zCpO2ODZi+Bt2Lq4HBDqx+CvW3pyoafI8rxwp2kzA4aLe/PBx5h12Ig1HBlaL8Do9xak04NumbJ6iq7TvPvdVv6FnQyytKM9ivN6XaeUnEcpjj7siYTYdOHGFRbdCD7lLXS717z0HvmEcr08Q7cF9LYIoawRZfwR1As1AsonXAbwui/G8MMbyc2rRMRnhNuAHb7pq6CB5vnYt3Xh5ow37T7YkLClLVtussDhGh9GW8Yx7w7hKhwwIZb7AfbcPC32JX/g4KokVf5ZtwQWXX6XKoKaVlZuHq9Pu2nPjqGc+Y/a8lqg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ttp8ukIKdkPNkBPD+2CWaqEikeiCIrfPbVyRAMx512M=;
 b=eQL2K6lbBSuuFfx4Skp2pXEeM02BJyR0i6FDd3v/PXNliDtw85BXU3xF0o7hIVQdfx/TR9UKevSM94wt4V+cREnbfRtJLJG8Fc4pmTuhPc2dhgjaX2BQrjEjt6HoaPJav1aGB7VwUCX1sTwTAzafXc9Q3skzKzAn5hsZrNN9yV4=
Received: from AM0P190CA0004.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::14)
 by PA6PR08MB10472.eurprd08.prod.outlook.com (2603:10a6:102:3d6::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 09:57:14 +0000
Received: from AM4PEPF00027A5E.eurprd04.prod.outlook.com
 (2603:10a6:208:190:cafe::62) by AM0P190CA0004.outlook.office365.com
 (2603:10a6:208:190::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.13 via Frontend Transport; Mon,
 15 Dec 2025 09:56:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00027A5E.mail.protection.outlook.com (10.167.16.72) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6
 via Frontend Transport; Mon, 15 Dec 2025 09:57:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CA0IIZp/oIo5FSbFQVtixXOswPGmfT+6gHihrAKTzn6teNwl/iJ2KbhtcaQzyPcKV61Z0QPcGGWshTddcZChmVT2wEiHsrQMNatVbmYequ0rtMyWUnFsIsZCMghCNoxF6yVdIcmDjKF71vuOMD+4GLWBGUCI6rnH5VDC/nfNHiwm3fU7JgUv0LZMJoP1drsIqYFWnKycxzMBErbkTlS6PgrA27v3vslMnoX2abP2m+X05XHF0/mvPKp9TMMv3Cm0Jn8jBUXvpJHhe8hSJUeWN8MMz8wVSy1lcJKdtCb1HSapDskhXPCDdUc3XyaLzrBO7CPKsHBJSmxP8urfG37S1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ttp8ukIKdkPNkBPD+2CWaqEikeiCIrfPbVyRAMx512M=;
 b=VHjDv/OwxbN04OIWg2R5+xeJFw2FZNhC+YQSg8mw9cXlEBe8zhPAE01G2jCh+qbbHjI81G1Tu3tq2CzmF1JnknBGqOR5uNf7GpSZcIEvN37t9cKNy5XQCWBJyAv0ZBqztc1/3of5pFZecRvGzAIWT/O2N/ikhyls37G+Y8+3xjvE5paMpWbZVCwgu1Iz/hLMpG/Uam0QdfcJlsAqbEPYMLCvi837SIGKLrLctIErURz7e7WMd2tk+HovYNbEkeV6EBBOCoFCVA1qaeBkb9z0Gut58Ded5WixL81Bq7ssu7SRS2If6ZPl6fRiQnt5GbW6nfRuiRfnpxNWcl8c4CBdAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ttp8ukIKdkPNkBPD+2CWaqEikeiCIrfPbVyRAMx512M=;
 b=eQL2K6lbBSuuFfx4Skp2pXEeM02BJyR0i6FDd3v/PXNliDtw85BXU3xF0o7hIVQdfx/TR9UKevSM94wt4V+cREnbfRtJLJG8Fc4pmTuhPc2dhgjaX2BQrjEjt6HoaPJav1aGB7VwUCX1sTwTAzafXc9Q3skzKzAn5hsZrNN9yV4=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by PA6PR08MB10526.eurprd08.prod.outlook.com
 (2603:10a6:102:3d5::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 09:56:08 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%3]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 09:56:08 +0000
Date: Mon, 15 Dec 2025 09:56:04 +0000
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: catalin.marinas@arm.com, will@kernel.org, broonie@kernel.org,
	oliver.upton@linux.dev, miko.lenczewski@arm.com,
	kevin.brodsky@arm.com, ardb@kernel.org, suzuki.poulose@arm.com,
	lpieralisi@kernel.org, yangyicong@hisilicon.com,
	scott@os.amperecomputing.com, joey.gouly@arm.com,
	yuzenghui@huawei.com, pbonzini@redhat.com, shuah@kernel.org,
	mark.rutland@arm.com, arnd@arndb.de,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v11 RESEND 9/9] arm64: armv8_deprecated: apply FEAT_LSUI
 for swpX emulation.
Message-ID: <aT/bNLQyKcrAZ6Fb@e129823.arm.com>
References: <20251214112248.901769-1-yeoreum.yun@arm.com>
 <20251214112248.901769-10-yeoreum.yun@arm.com>
 <86ms3knl6s.wl-maz@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86ms3knl6s.wl-maz@kernel.org>
X-ClientProxiedBy: LO2P265CA0147.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9::15) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: GV1PR08MB10521:EE_|PA6PR08MB10526:EE_|AM4PEPF00027A5E:EE_|PA6PR08MB10472:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c8470bf-f51b-4c8d-0434-08de3bc052ce
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?WU0jNfIoFbtkJ/vAkPNbU0BRT2eMoNKF/EPdkjlIp072Mss+xTzN9NES6NQo?=
 =?us-ascii?Q?/LEu416/XlaLFjjgTE7s7y98pdRIgVodzTdEe6yplyWP6fEFt1Zh5mcK1Wp5?=
 =?us-ascii?Q?WbGIMeu5pk8EscuE+KoX7M68R/sdP9pss3gxXiD9JX+j7oiFw5LhC0akMszf?=
 =?us-ascii?Q?vQR2aZaJVppPGsRkZxkRM/+eXDfZRrCM08mcoRoDoBJ8vFKkJ/31L3nBQxSs?=
 =?us-ascii?Q?j5C1yI9JbVlYMwLd3XQe4IpL/LNY3k7cFZ4o5leWCUCOaGWnBauqvh68Adsi?=
 =?us-ascii?Q?bJcV6XmUebVrwqN9uOtSantnJn9BnFt6XMKvHNCx5oVFIPFAyVEMMXKcZlaC?=
 =?us-ascii?Q?iBs7HU67IkwIw1jGsRv1xQqARKme7fVotITMrVzl+mVyobdTBxx7NK3eTaJE?=
 =?us-ascii?Q?fp5csPFP4pJ6SRzBchRTGcnWjp138KdQdgoQTmjhJ4TakV146LYd3Urb4QS3?=
 =?us-ascii?Q?YPuldibbFFU0zrvHuYrH7Zd9izCdUBLrk3vcb1DlS1g2KA40QMgxEL2d3Dam?=
 =?us-ascii?Q?jj5SVCFATH7z3NWbgDqn8gteMgk4umBYUDuzNupz1w6Ws26NfdZ5aZsMGEVQ?=
 =?us-ascii?Q?1L2kEXnMi4LRu/XkCTl9wlXyybDbdaxv6l3RnRxjfA3usYiMOJHrynHf0uzm?=
 =?us-ascii?Q?5nF/pJO097qSxDQ5RIIW4b0eD1U5RqmIGygFLpUp2vo6KfEGhzZWmSuCq/ly?=
 =?us-ascii?Q?XVoJVFM6p90o4eeoEBWUsV0bn57MV60F0RUd5cwpWvr+8qtKa3Z+pozZDzzA?=
 =?us-ascii?Q?S4m6WYDRw7Slzx3RGjCw4sHSu36CVs5uD53tPv/MpdejOc/8QKHhIN1q2gSB?=
 =?us-ascii?Q?jpocscYhE7W0ehehecxXNg4f78lIcQ1YwRA0XTY0Ih0fR1goshs/+bPwZ7aS?=
 =?us-ascii?Q?DmhacY7txg+cvfqs/6RNFohnmbIqo3xKh+7O9MOFyJFGQD7XHQHsb1t7MUmW?=
 =?us-ascii?Q?WpB1g3XQLwwYRQV7DsK1Z9Omd0RKyBmRIYcz81aB8jpHYTqNv3CgRW/bnMWw?=
 =?us-ascii?Q?eORB7nALDjatPy4X2L9AQ0Dx/g9pFK0863VfRI6R5XoE6GF+jYHhHq2XM48h?=
 =?us-ascii?Q?+SE2aEvU1HQYmZa3JeaYXAVgUiiYo+WTzupViQOeaI9ksd6WHL3Hb/AF0hzk?=
 =?us-ascii?Q?hiSvTI9WB0+lpYQlR2JRt4zu/Qwhmp0TwcW8VvVGNjkZQA6tIzrf9FNnfErd?=
 =?us-ascii?Q?OMXNGKuZSzXmO/Uvwq6zbIHrjgraRy/fLn8+iBBlCxOjy7COBheEXpU2NFKt?=
 =?us-ascii?Q?DvJBEdltuobjGaD+Ar/DaszVDQcU5+YypbK48Wa54Snq68CuexLhfqM/+4sT?=
 =?us-ascii?Q?dSP1Q0380W2VqPC0EwddDpD1SxTtoQHA965vK5N6s2knRfc3p6Ta7FD2zukE?=
 =?us-ascii?Q?n/3VMGsiMOQ8o7mBIpT+RM6D3i6kDlw4xUVmJodqojXyvvZdFiTdWfrOCcpb?=
 =?us-ascii?Q?2tdwemlzAkJ/bxPd46c0Z1rJKM0teyRQ?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR08MB10526
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM4PEPF00027A5E.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: b83ad1fc-da98-4c49-8fd9-08de3bc02b60
X-Microsoft-Antispam: BCL:0;ARA:13230040|35042699022|82310400026|7416014|376014|36860700013|14060799003|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?a0PUQjGtP6rlpWhgGBjo3bPu2RrYImIKzcsGdhm1uOjvbomly6+JKdT3Co/P?=
 =?us-ascii?Q?qJm097txoeHyvfF5jtUwI22XEw/Jt5RN8lE2tg9gxuDHntDSvkhyZ58/bd0a?=
 =?us-ascii?Q?kWhWoYqNenaaSS4FUZ1k5T/q48eNqJvbG9J5qngAq0LzvA0cS53OP0cCMfwp?=
 =?us-ascii?Q?Ji/hXMsAkxZYiGQGpEQTmOmtRfgPpOC/MpkGfCqGA0osMe65emhrky8/P0+s?=
 =?us-ascii?Q?BGJETR2NAD8G2KJBIv6puzv80wa978lpv+lmqqrKSp/N7TXlLdidA0mSTK7M?=
 =?us-ascii?Q?TRyxWnBgOimr8avMTg8T2rILHojTIAVrDx3kl2/enKy9WjHsD3kWNphZaJu2?=
 =?us-ascii?Q?25j1x6vqj1Hj3u2y/B+EI/UR/M9vzMeiLrEx/MB+HckDbBwMMnbjhyBTaaZz?=
 =?us-ascii?Q?wSMXZUMOrINwxAoPGBrbki7BqwumHZJiLLPxukrPHkFIGUq0jHjunqleL0uj?=
 =?us-ascii?Q?HSn4nO4zzhUA6dNVmroodG3rmvJTLETuBejhupbe9DgyTMAiRvmlwx9uICt3?=
 =?us-ascii?Q?Pln2lTshaaa9VMMRKoadKFPUUm4ylshB6H1Mx3eDeqkpgyacpnFaUfrvdUgv?=
 =?us-ascii?Q?wGRa28TbNg/ssMghFTnqcysUjQUnUU6bC4OageVadRDm2Nc1gqHD4iNW/kOB?=
 =?us-ascii?Q?7dFyAAO9rlj+UL5jniBpeFoJYqhG8FnZFQw97bD5b/TAw94Rt5qjsL8bgmko?=
 =?us-ascii?Q?GfQRWgqdsC/YxXZjcUHLRq07SArIRZtQSjtXICbz/cw3VCIf7hlUeCDufv1n?=
 =?us-ascii?Q?3FT4zho6YMnkRA+SukSFJ2VHwaNAXCYGMOET77IlAldFvL7j7FxrSqaiajWg?=
 =?us-ascii?Q?JUm2yebyFCCaR2TUF5mfzvu6z55+491kzcb6Q+cy3EfPjH68q14WOUC87M6R?=
 =?us-ascii?Q?/W1xqejRIhycBKsIDaM75A1cC88zYByrd2vC9BMF8xMQt37XTvt6Uj/3QI5y?=
 =?us-ascii?Q?Iq7QSP8PUriYxjqzhkhCvD9fkYR//qlCRSBycRrWogDZkY9knBIgWKPOcg2c?=
 =?us-ascii?Q?eeADnEOGVvQp0eBLAy96IQTrTtlhQP2c26BLMxGy1UwR1v+CZ5O6Mac/01sI?=
 =?us-ascii?Q?iGHO4TfPIAmJX4pKpV4g3QgNH8a937zyALoPYalxZKsBH0pvJDVjgmfC2ule?=
 =?us-ascii?Q?YCURLzK1ofKXvmWptCc/DpjUCU01XrlTl9PSJFSrtOppAqzY+ZwnLf9L7fBY?=
 =?us-ascii?Q?GmujXeVgg2S3pdRakKGCc+FTjg4YPbx98NSYd4cskhVwIjDpfJmEYy/x4ITg?=
 =?us-ascii?Q?OwxWm8S4jNj+LoygALqgSkU/eC6pDkG8ZZgfInHV+BmdFTLtjdHkJYPY3x9v?=
 =?us-ascii?Q?ydXQuRc4Ucu0rTf6Uhn3Yxk93GkNiTZyfqKSjCWzAj1rhVsq0GdZCUNeEFjP?=
 =?us-ascii?Q?6dq/QUPx+DG9ApNe0BFBmxPNpnpvUzHluv5xkLzH5Hg7zVPj31N8PxfZMh4e?=
 =?us-ascii?Q?lgN1vHvFA3cppex3vlXCp6x44PP/JnAPYipiKdWXW2/7lC9sF1kdJvIwhzp5?=
 =?us-ascii?Q?frOiWzISmr9elxxqZOS4+PpKW2GrmwDQbbZlrpwtnmYgva7oqB4wznR9Ig9B?=
 =?us-ascii?Q?V+uqBFXs9YCQ/CbSXFk=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(82310400026)(7416014)(376014)(36860700013)(14060799003)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 09:57:14.1265
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c8470bf-f51b-4c8d-0434-08de3bc052ce
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A5E.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR08MB10472
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_015721_248104_7FDB77B9 
X-CRM114-Status: GOOD (  11.82  )
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

Hi,

> On Sun, 14 Dec 2025 11:22:48 +0000,
> Yeoreum Yun <yeoreum.yun@arm.com> wrote:
> >
> > Apply the FEAT_LSUI instruction to emulate the deprecated swpX
> > instruction, so that toggling of the PSTATE.PAN bit can be removed when
> > LSUI-related instructions are used.
> >
> > Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
>
> It really begs the question: what are the odds of ever seeing a CPU
> that implements both LSUI and AArch32?
>
> This seems extremely unlikely to me.

Well, I'm not sure how many CPU will have
both ID_AA64PFR0_EL1.EL0 bit as 0b0010 and FEAT_LSUI
(except FVP currently) -- at least the CPU what I saw,
most of them set ID_AA64PFR0_EL1.EL0 as 0b0010.

If you this seems useless, I don't have any strong comments
whether drop patches related to deprecated swp instruction parts
(patch 8-9 only) or not.
(But, I hope to pass this decision to maintaining perspective...)

>
> 	M.
>
> --
> Without deviation from the norm, progress is not possible.

--
Sincerely,
Yeoreum Yun

