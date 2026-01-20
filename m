Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F1F2D2ED17
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 15:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TSqKY+NFCvbw7DBaMRqAKRA9ScBsyr4d9/cM5uAxKrI=; b=hadmFYeQNoAcqeMsGNUaAK0Hsv
	iA4enyJgrIx24ZgY5ufwDCbCDIVQXLVF8scge+Ub2yCL82uFod+1OkaqrzxPm8jOnEJhL+09JYj15
	yR+1A0qCuH4yKwB/jToa0029GIcxMluq+htZ0eocLuYLGy8HiKZLLs7PrnrerIqvDJbPSyPZ6TBWF
	xWS+jJgI2D3U4nABloykTFfnQrgNzBiTNmjNnG8oMgLEJUN9z/nD0gWCK6cnVc7mQX5n7+ktrDP3v
	F+kRf+3DhYyWX4c9pTiMQTi1kCK7nY9MErtEHeiBVMrhJEi+7hYXa6BUB2F0iDXUZhKLFpLBmAuMG
	nlweaTlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viDvk-000000046Od-0g1Y;
	Tue, 20 Jan 2026 15:46:08 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viDvh-000000046NS-3xlD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 15:46:07 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=rLovj9UEIpVzBPG0jF5UGIUd1MDgU5zdo6/EM5xETBpQyURoQkj/2dAyIfe5nbCyuEUKtv3UOzrXnsdN1fPqH0MM0SUpx3G6e0OZa2t1RG/lOuWBc033CZnxhK/z8cqkI6dQFLxEeI120+XMj0db/+yLpVauuTg8cXQU29opnLa6ItYf3RbNUsR2caRxMyr5OK5NJsO+2OLbvwq3zkgt8Y/vDfW5C/ljws8tZ2m+6iFDVs/U9xDlcYO6O1pmvReXs1Cp1V7p5gp8kD6AcBTnIcwUpXyBo7XwxFLxYq5ZswzWFEan1FdXMJ+Ha2F0CLtguqL9FbIFUI5NAWTg6eXmHQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TSqKY+NFCvbw7DBaMRqAKRA9ScBsyr4d9/cM5uAxKrI=;
 b=fzWKpv8aFwtww0eqITDMRD/ql8B5A5pBMmuZB4ojjb+SPSpQWmVkCyO00CltKEh6ahhRzFkuppBBAYiFOW81g2SdboPfKsHJFAP6yKgzEloaZ8VxOV2/XdXoMx5otzDwNip/RZnNW4wKWKhkAliD1uAhj2hxIzc4DZ+svsqz0O6T6uSZ2lABHzkCBVb05poMsk1GJXN97BMN9uA3UZepO8OZxrvZf0pZEUdWw3cfSK+XS89v/yu6zrCBASF5BlLJ5L1EhjWKt1KXbR++OXsKXqCE7ExpnIArAET9U+nMSFw/uMmFbdPi9gQXSkJI3gLafMO3uprcwXE5CzLf6p/o0g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TSqKY+NFCvbw7DBaMRqAKRA9ScBsyr4d9/cM5uAxKrI=;
 b=NwG/oa5tBDLu5r0DMdZySt2TtM88imXakGPqggMT8C/op3Nlvs9sbVyvXY+VtcLsvcoTCFpKh+zMBdA6YODFhYO49qXndX1mRYoJJtLOK3rDI/dXXjuNqWMccyFfXOkNDgd3zm3nj8J3Eddjzy2YgwKjy7bVixNo0dPvhY9kW5Q=
Received: from AS4P189CA0061.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:659::10)
 by DU0PR08MB9394.eurprd08.prod.outlook.com (2603:10a6:10:421::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 15:45:58 +0000
Received: from AMS0EPF000001B3.eurprd05.prod.outlook.com
 (2603:10a6:20b:659:cafe::fc) by AS4P189CA0061.outlook.office365.com
 (2603:10a6:20b:659::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.8 via Frontend Transport; Tue,
 20 Jan 2026 15:45:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001B3.mail.protection.outlook.com (10.167.16.167) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.4
 via Frontend Transport; Tue, 20 Jan 2026 15:45:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pIrP6augi1DkUpAen9KBgv+zIYMOCe6HPhCkKWLxPZ7rcA59PQbiggOeSgaMclhoY3SaFrk1W6a501MeIwr0M1aQT31nYDUgpJ2ahzUbiWOoflu/r4Hn52WenK/84RZD7QnMgS9QcDw0nWdDXCAZUSwd+Sbwbyyvhx5lYSnQ3oVxECE86a1a5/mq79mqLs6uiRqa4NVV/y9Bb76xBaVSefLQhGAPC2ihByRuFcq/PsTyp35GFyOz6Z10i7ErdC7hP87LH5lrEwjblsysRRo+T5uZNpu+6e6zrfz/WdLnTfe4SWFYnw3wNYBpmlyGvmUZqq7TFoh4RMPerBRGusX4LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TSqKY+NFCvbw7DBaMRqAKRA9ScBsyr4d9/cM5uAxKrI=;
 b=SeeIvX6uWkqu6yxbJXdPnby/xOKHkc1N/GGUOOjGWZKriQVoI5h/YbWbZrJ8pr0nSAtDoFIKesd/vIgniQpCNJ761DdIuMMJorEZFfVQGnfw4NkG1dgq/Cisb+zF5Cb2xt6mWZqyQn8YrE1BZzkEZVjr+Z9gGDkoK++UaDS8nkU4l0NXDmGtp3/3QCtINSJt81CPFR/BudvMDa7q9OWZ85r7ko87xRlVyXnkoHRye9PejO/D6FjHBUXXLNkgYW8MObi49EzNtgSP5sjOhaV4t0of7z22KhmyQpuK5DgdXXPxFdrJaPO8bhBeew711l3VKLdvMltSskFzdAt1Ah7Y3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TSqKY+NFCvbw7DBaMRqAKRA9ScBsyr4d9/cM5uAxKrI=;
 b=NwG/oa5tBDLu5r0DMdZySt2TtM88imXakGPqggMT8C/op3Nlvs9sbVyvXY+VtcLsvcoTCFpKh+zMBdA6YODFhYO49qXndX1mRYoJJtLOK3rDI/dXXjuNqWMccyFfXOkNDgd3zm3nj8J3Eddjzy2YgwKjy7bVixNo0dPvhY9kW5Q=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by PAXPR08MB7671.eurprd08.prod.outlook.com
 (2603:10a6:102:245::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 15:44:53 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::8c9b:58d2:2080:eb98]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::8c9b:58d2:2080:eb98%3]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 15:44:53 +0000
Date: Tue, 20 Jan 2026 15:44:49 +0000
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Will Deacon <will@kernel.org>
Cc: catalin.marinas@arm.com, maz@kernel.org, broonie@kernel.org,
	oliver.upton@linux.dev, miko.lenczewski@arm.com,
	kevin.brodsky@arm.com, ardb@kernel.org, suzuki.poulose@arm.com,
	lpieralisi@kernel.org, yangyicong@hisilicon.com,
	scott@os.amperecomputing.com, joey.gouly@arm.com,
	yuzenghui@huawei.com, pbonzini@redhat.com, shuah@kernel.org,
	mark.rutland@arm.com, arnd@arndb.de,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v11 RESEND 6/9] arm64: futex: support futex with FEAT_LSUI
Message-ID: <aW+i8dAsciz+WwrA@e129823.arm.com>
References: <20251214112248.901769-1-yeoreum.yun@arm.com>
 <20251214112248.901769-7-yeoreum.yun@arm.com>
 <aW5dzb0ldp8u8Rdm@willie-the-truck>
 <aW6tix/GeqgXpTUN@e129823.arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aW6tix/GeqgXpTUN@e129823.arm.com>
X-ClientProxiedBy: LO4P265CA0321.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:390::12) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: GV1PR08MB10521:EE_|PAXPR08MB7671:EE_|AMS0EPF000001B3:EE_|DU0PR08MB9394:EE_
X-MS-Office365-Filtering-Correlation-Id: 82a15ee0-4b4d-478a-56b4-08de583b01a4
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?NrLeDQ57ahksTzmvrdEKIAPLC/32C2sJ7FobLx8QsQQXWnbX999mQCFc7/Jf?=
 =?us-ascii?Q?N9LnVtskqRES6x/xJIzIS0dANtLIV+LLNRsv9YwICnhLkWMKWfV+ZlQrFKr9?=
 =?us-ascii?Q?bt1j43RC+GQ/JTF/VsA9jZSiIC/Y71i9WmMFD3zsMXItdAYq4zZpp1CZov9p?=
 =?us-ascii?Q?w/oCTNDXnmnx81nkPxfhkccYMpM1G4p7S2y92uMCG0vFuEoV7Otplhp/bXcv?=
 =?us-ascii?Q?uzG2pQiUhN4IoAW9cjAdm8g4AZzEIqfHny7/nBddiuKICLpMhxMwkTrsgw8i?=
 =?us-ascii?Q?uQ8nvfVAH3zOv41pnq1xmVueimG/C1rqzIxfEPP9CgHc8qSvwEbdqFNDcCm3?=
 =?us-ascii?Q?+nu7jKPlPMA2RzTJcPl/XXry6Z9ivZoTECaQHSQ7w7xfr1UXkwtebz5tJykZ?=
 =?us-ascii?Q?FWJpqg5/t7rAkq/b7VYIrMVzqru4nC1s5m0VSKDdyFPCEs6IaApIXI4A5ope?=
 =?us-ascii?Q?1FO2ZR1aryyQXb088dnjbjySvnOyBkFIsQe4sATpCLOZhttYP6WYp36+EAw7?=
 =?us-ascii?Q?6u5YpStX1lar4opeHY/I5bdr7jy4KSMzV7IsGTGbX21bHLGgreGsUqkbateF?=
 =?us-ascii?Q?A1Fnp0BL4+kVz2VxaC0BXWFnjLjeUigNIc2P4s+iXwGoq8Gx4t8flq9AopWH?=
 =?us-ascii?Q?p0qKJa0sv+K/OGWirRNfjElJlnq2glBzgeamxkRSS9eKJMM2qGq0FtohhJKv?=
 =?us-ascii?Q?0ReBOcQ+iFbJQTAUED0taTfjMG1SDPFa/ikMNXoDJJxj6af5t6sb5+AQNYAC?=
 =?us-ascii?Q?7AtVGjzP79KXiME9JqC2tmbtp2XLzh3F0a7JQBt3RvI7aVmSc8OofoVI9jvv?=
 =?us-ascii?Q?iW184ghfBUpVk2AynjPIe9kB0KQ8F3c1APVQiTzJwm/4+BaiLD7Ax0+aQhnV?=
 =?us-ascii?Q?tRr5tAzGxnMmykKYZXw8ZluzozJm2atT4zGASrjFZqBmW9H2TFxg8c1X3YMG?=
 =?us-ascii?Q?f1QmGe4ZP3TAI0pwiYHUwVUsv1xtJ0ANKIRyGz5RTJOknApaN8rkfYfqf9wc?=
 =?us-ascii?Q?xdutSK+KfgwG5zDWEzkxh4AxkOmcjnyP/IvbYjuGJSKwJRv8IfJ2XuTXKC69?=
 =?us-ascii?Q?9/ckX5SSYznpImUREyF1gMsLIOuZ5Wmr2BooATe3R/r/vNHAY7vnpKkpltHg?=
 =?us-ascii?Q?dGwmYIK9YgajZLksf52NhP07FXNiC9q5XwyBlQE7I5SOIn/z8I28lJutydoJ?=
 =?us-ascii?Q?y7Sx4Gag9FSsquNl8Y8/gNiBsDoIM8bvKiHYvDuHJoci5rFlW5Lx6bTwMPDe?=
 =?us-ascii?Q?KLR1h0cAJgep//G9SOoNJsP+hKz+tHHaMwV6G6OInUtI4Oh4VJ8YBvlgZfN6?=
 =?us-ascii?Q?QS4Ht8zYDo5CsHT2ZocS5r4VGU9d0+uMBYVi7P+IHgbCVFZtHfic083eIOJc?=
 =?us-ascii?Q?8O4iwyhtyEHpXIrW9x2iEqPbzDd+7trcJiy1btTxVNLaVx38tCjpPLpMqFQW?=
 =?us-ascii?Q?PLagdp2fTH3//l+7er9T17UkCRWBouMDQ0DmmREXGQEN5jJcxYFetOX2apPi?=
 =?us-ascii?Q?T+42m0TIVUnXlxm2LGYc9mKGM/jrZz+xUrtpabFocVerTTHWBsqPBl79Kv2w?=
 =?us-ascii?Q?h8gIrmCtiAKen1GGPqs=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7671
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF000001B3.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: e8e33603-26f3-4bb4-db21-08de583ad9f8
X-Microsoft-Antispam: BCL:0;ARA:13230040|35042699022|376014|7416014|1800799024|82310400026|36860700013|14060799003;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vaF2bQdn6YHjZ76xXdVJjdP/aNJ2g3f7DFqw8vqvd+nq9jdroHn4sfb2a4Is?=
 =?us-ascii?Q?UUHix2WKzPGvSrBYes9GqXZX2GuzQc3+qEcc11zj4I5SqyD/RzsgQ4j+JhdQ?=
 =?us-ascii?Q?l3f8OdCVeym3kF2yktGrejhf9OAd3jc8yAjn5QPYJU6cl3x4C6cFFB3e7KTc?=
 =?us-ascii?Q?zqrcCq62Cskw/BKfk7UT2qFXIBgUqoiNYpfZobhxFrKjyr/UARP4Gj+j80/t?=
 =?us-ascii?Q?eeXbnCLY+hoC59mE3GmeaTAGUqeTcanjgKXUH/4AsOHFXaY8eROmBvX717b7?=
 =?us-ascii?Q?1kQHgcTw+adnM2NVFr3OOAceGiTgu8oNF1e84gNZ4aC9/PmcF31joTXqbr2p?=
 =?us-ascii?Q?gn77qc47RLyo9nfOBtWVNFT9zg6axCG06WiuvwllAG0HfO7CQfDvFksy+b4u?=
 =?us-ascii?Q?KDw7hHYarE/iq+23cz48wvysZoqcXP/Vq6wdzjtwFTKqCTC4mSkpd5TiIdc6?=
 =?us-ascii?Q?Iwywu7hY4i7tAuvpgLZRbWWFBCw0Da1mUvxiYI93dK4FaOM0Sy+STbksth2E?=
 =?us-ascii?Q?+GSyoC7vEEYHuZPSf0xgH6ilHbscKNhKU3c9fOKcTQT/3gdZBYqJO4LZFP0v?=
 =?us-ascii?Q?hXcSaATrvHzsH/ckBPuZwqqZaLzCf9cBTxzC5L01KauPRMkNFaAEIl6aVrF7?=
 =?us-ascii?Q?FMiHxPD51rS47i733dVwWSKLDH5hdCthYGfXtmkmio10saj2vFZZWBOzxqSp?=
 =?us-ascii?Q?wqTOUC3sNRSxjdAiDIzUzpbbGfSLbIZPg/TPl8VNKys63kBxhTLSKa3XL9Ix?=
 =?us-ascii?Q?i3PlaP3B31pPxeKf9RGTKXV0HzWfhKRuEkWRN7MlnlvWaL8pe5yS4aiJ5mkP?=
 =?us-ascii?Q?A3yzcoOmsFw+l9BnOZpL6JrWnDWa+9qd5w7ntexfd9BSeVahk6V3Ptid+Xtb?=
 =?us-ascii?Q?4X2Z5emKGtVvDX//xarYBWkkjo4KkNXD7SpabW9CrcJNiONREcO/5rDc8rKA?=
 =?us-ascii?Q?Ww+ANLqyIXIl0r36TNaAIutevWsIbCoWLZ+g2SQMqpHS5KvJUhGWDtmPcQjI?=
 =?us-ascii?Q?8R3lc86Q1ZNQB1keCyGztOhLaq82CphS3x8e6pyQ3/APS2D1b+iD8pa1k9Nh?=
 =?us-ascii?Q?nHOCxlg8TRwjgSKhuPQxNtfoa8IG1I8iqBAX6kj6Z4dMPLstkuhBvKoBPic7?=
 =?us-ascii?Q?xiT49GNz30pmhM1hcGwQYrHCBTY8H5QPLQ269v1vCNEv89DssbRNnO1g4lx1?=
 =?us-ascii?Q?bIEEgtFT19Ay7EuV/BGtSsmJd08SqJzglV8XesfUXDHLChsVGbRFgYlzFJvO?=
 =?us-ascii?Q?07mA3gPAlMSA5xxz7i6umA7svbPmuwMMwSTy15Sk+PoYPk2TvYr8CpEanxiL?=
 =?us-ascii?Q?J2h6P22VwB/m8aq9itSQb/x4LpAx31jNSh+vUVDGY2Lv1V5uHUc8xhZ9CVak?=
 =?us-ascii?Q?UghUkCf/CwYm7I5RvXdGSr/UE60XaKqCWF0SLMbfARCyUuqKdvIxiaRiKwYR?=
 =?us-ascii?Q?u3nIbh1fPIpu3S4eTUbcdkwYxJ0wpRYJngDIFtdn5iF/oyrVtFFTEb0q0W/j?=
 =?us-ascii?Q?jRaQPH5VAMBohlv8ZWSaqHjXAE2eSol7y1q+L37MYKqVym3kYd1CVgCYokv8?=
 =?us-ascii?Q?vDuwwIKMdOdWvqujGwJmzzKf2yICN6nw/j6pPfNMrK1cGvyHZdnKEPbbY6H3?=
 =?us-ascii?Q?RKYGSCVxeYKrzSiS2smxqmnTLLOyS7yrlxbgXH8423G/ehaoQUzIG0h3w7m7?=
 =?us-ascii?Q?kvypCg=3D=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(376014)(7416014)(1800799024)(82310400026)(36860700013)(14060799003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 15:45:58.6069
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 82a15ee0-4b4d-478a-56b4-08de583b01a4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001B3.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9394
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_074606_128536_C3047014 
X-CRM114-Status: GOOD (  29.03  )
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

> Hi Will,
>
> > On Sun, Dec 14, 2025 at 11:22:45AM +0000, Yeoreum Yun wrote:
> > > Current futex atomic operations are implemented with ll/sc instructions
> > > and clearing PSTATE.PAN.
> > >
> > > Since Armv9.6, FEAT_LSUI supplies not only load/store instructions but
> > > also atomic operation for user memory access in kernel it doesn't need
> > > to clear PSTATE.PAN bit anymore.
> > >
> > > With theses instructions some of futex atomic operations don't need to
> > > be implmented with ldxr/stlxr pair instead can be implmented with
> > > one atomic operation supplied by FEAT_LSUI.
> > >
> > > However, some of futex atomic operation don't have matched
> > > instructuion i.e) eor or cmpxchg with word size.
> > > For those operation, uses cas{al}t to implement them.
> > >
> > > Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> > > ---
> > >  arch/arm64/include/asm/futex.h | 180 ++++++++++++++++++++++++++++++++-
> > >  1 file changed, 178 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/arch/arm64/include/asm/futex.h b/arch/arm64/include/asm/futex.h
> > > index f8cb674bdb3f..6778ff7e1c0e 100644
> > > --- a/arch/arm64/include/asm/futex.h
> > > +++ b/arch/arm64/include/asm/futex.h
> > > @@ -9,6 +9,8 @@
> > >  #include <linux/uaccess.h>
> > >  #include <linux/stringify.h>
> > >
> > > +#include <asm/alternative.h>
> > > +#include <asm/alternative-macros.h>
> > >  #include <asm/errno.h>
> > >
> > >  #define FUTEX_MAX_LOOPS	128 /* What's the largest number you can think of? */
> > > @@ -86,11 +88,185 @@ __llsc_futex_cmpxchg(u32 __user *uaddr, u32 oldval, u32 newval, u32 *oval)
> > >  	return ret;
> > >  }
> > >
> > > +#ifdef CONFIG_AS_HAS_LSUI
> > > +
> > > +/*
> > > + * When the LSUI feature is present, the CPU also implements PAN, because
> > > + * FEAT_PAN has been mandatory since Armv8.1. Therefore, there is no need to
> > > + * call uaccess_ttbr0_enable()/uaccess_ttbr0_disable() around each LSUI
> > > + * operation.
> > > + */
> >
> > I'd prefer not to rely on these sorts of properties because:
> >
> >   - CPU bugs happen all the time
> >   - Virtualisation and idreg overrides mean illegal feature combinations
> >     can show up
> >   - The architects sometimes change their mind
> >
> > So let's either drop the assumption that we have PAN if LSUI *or* actually
> > test that someplace during feature initialisation.
>
> Thanks for detail explain. I'll drop the my silly assumption and
> call the uaccess_ttbr0_enable()/disable() then.
>
> >
> > > +
> > > +#define __LSUI_PREAMBLE	".arch_extension lsui\n"
> > > +
> > > +#define LSUI_FUTEX_ATOMIC_OP(op, asm_op, mb)				\
> > > +static __always_inline int						\
> > > +__lsui_futex_atomic_##op(int oparg, u32 __user *uaddr, int *oval)	\
> > > +{									\
> > > +	int ret = 0;							\
> > > +	int oldval;							\
> > > +									\
> > > +	asm volatile("// __lsui_futex_atomic_" #op "\n"			\
> > > +	__LSUI_PREAMBLE							\
> > > +"1:	" #asm_op #mb "	%w3, %w2, %1\n"					\
> >
> > What's the point in separating the barrier suffix from the rest of the
> > instruction mnemonic? All the callers use -AL.
>
> Agree. I'll remove this.
>
> >
> > > +"2:\n"									\
> > > +	_ASM_EXTABLE_UACCESS_ERR(1b, 2b, %w0)				\
> > > +	: "+r" (ret), "+Q" (*uaddr), "=r" (oldval)			\
> > > +	: "r" (oparg)							\
> > > +	: "memory");							\
> > > +									\
> > > +	if (!ret)							\
> > > +		*oval = oldval;						\
> > > +									\
> > > +	return ret;							\
> > > +}
> > > +
> > > +LSUI_FUTEX_ATOMIC_OP(add, ldtadd, al)
> > > +LSUI_FUTEX_ATOMIC_OP(or, ldtset, al)
> > > +LSUI_FUTEX_ATOMIC_OP(andnot, ldtclr, al)
> > > +LSUI_FUTEX_ATOMIC_OP(set, swpt, al)
> > > +
> > > +static __always_inline int
> > > +__lsui_cmpxchg64(u64 __user *uaddr, u64 *oldval, u64 newval)
> > > +{
> > > +	int ret = 0;
> > > +
> > > +	asm volatile("// __lsui_cmpxchg64\n"
> > > +	__LSUI_PREAMBLE
> > > +"1:	casalt	%x2, %x3, %1\n"
> >
> >
> > How bizarre, they changed the order of the AL and T compared to SWPTAL.
> > Fair enough...
> >
> > Also, I don't think you need the 'x' prefix on the 64-bit variables.
>
> Right. I'll remove useless prefix.
>
> >
> > > +"2:\n"
> > > +	_ASM_EXTABLE_UACCESS_ERR(1b, 2b, %w0)
> > > +	: "+r" (ret), "+Q" (*uaddr), "+r" (*oldval)
> > > +	: "r" (newval)
> > > +	: "memory");
> >
> > Don't you need to update *oldval here if the CAS didn't fault?
>
> No. if CAS doesn't make fault the oldval update already.
>
> >
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static __always_inline int
> > > +__lsui_cmpxchg32(u32 __user *uaddr, u32 oldval, u32 newval, u32 *oval)
> > > +{
> > > +	u64 __user *uaddr64;
> > > +	bool futex_on_lo;
> > > +	int ret = -EAGAIN, i;
> > > +	u32 other, orig_other;
> > > +	union {
> > > +		struct futex_on_lo {
> > > +			u32 val;
> > > +			u32 other;
> > > +		} lo_futex;
> > > +
> > > +		struct futex_on_hi {
> > > +			u32 other;
> > > +			u32 val;
> > > +		} hi_futex;
> > > +
> > > +		u64 raw;
> > > +	} oval64, orig64, nval64;
> > > +
> > > +	uaddr64 = (u64 __user *) PTR_ALIGN_DOWN(uaddr, sizeof(u64));
> > > +	futex_on_lo = (IS_ALIGNED((unsigned long)uaddr, sizeof(u64)) ==
> > > +			IS_ENABLED(CONFIG_CPU_LITTLE_ENDIAN));
> >
> > Just make LSUI depend on !CPU_BIG_ENDIAN in Kconfig. The latter already
> > depends on BROKEN and so we'll probably drop it soon anyway. There's
> > certainly no need to care about it for new features and it should simplify
> > the code you have here if you can assume little-endian.
>
> Thanks. then I'll enable LSUI feature only !CPU_BIG_ENDIAN.
>
> >
> > > +
> > > +	for (i = 0; i < FUTEX_MAX_LOOPS; i++) {
> > > +		if (get_user(oval64.raw, uaddr64))
> > > +			return -EFAULT;
> >
> > Since oldval is passed to us as an argument, can we get away with a
> > 32-bit get_user() here?
>
> It's not a probelm. but is there any sigificant difference?

Also, seems for 32-bit get_user() i believe this is to read the
*other" 32-bits to call __lsui_cmpxchg64().
However, this would be call the get_user() with different address
accoding to uaddr (uaddr -1 or uaddr + 1).

So if there is no significant difference for get_user() between 32-bit
and 64-bit, I hope to keep this as it is.

[...]

--
Sincerely,
Yeoreum Yun

