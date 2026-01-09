Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7DA4D26D71
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 17:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l5RwkHpjSUZk7Rzm0ikgxUNBiO1kxEhXMjLxQoKi7X4=; b=Mlj+3kfoYWsAhCvqGXa/ykbnzA
	ieYH9Knfmuq1ULWJjlpMQ90AzEGAIKn6Z4ig5bFexhs4IX2CiA04fUX67LpfBBt4sb33cFtMH7AAT
	eh6l41v8sdGMTdgd1zHhD3aqZhvAaQPxsYx6PzaCE4/bzQw7MF5eA366VbrATdewrp23HJw7GgueE
	z41j98a2Bty2V9+4qRQroshDdHpG0dixRJNwYFan/jQxe0ScR6v/ISw2EEKLe9CCDH77dgwUwxEWu
	WXHDkqwi1rErfKAkL+Qum6Q45egYvUd+2T2lj/CpugYhOFy1RisAneo66tH6pwT142sTDW5IsOttk
	cVq3IK9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veFvs-00000002hyt-20YV;
	Fri, 09 Jan 2026 17:05:52 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veFvp-00000002hwY-2K5b
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 17:05:50 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=e9CyeSX0ln7FCDrjmx5gqdE+yDwlH4bvmLvEGPQjLRPnHxUnCIDvTpiYuT774dQFzJnWI3GpzpWDPU2kno8xa73m8FsO5fjvMk2qVSEqnMgKy5SiCRMzXf74RraBwciDboIXIWfirOBOJp9ZYLKTtjF0p6Wad7CXBH2CDjAmR3xV/sqA4TqoNpr7MIYa0m8/jjrX/lVUPOxMMbjQQ+qVOg6o2o2a8e2ZW2eI/hpcjyImiuiQCRRc17NXuBunuJdlXTFVCXEEaEz5DqQGz+h3Owy5aR4Pc9/rdIf89DSp+84bkKTMj1TNGfWe9CBcKKdHfSqJqqImzKvnNu/9kDiCNQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l5RwkHpjSUZk7Rzm0ikgxUNBiO1kxEhXMjLxQoKi7X4=;
 b=gLI5WBmcSQwTcCbAM4DhV+St1uSXycpzHQ56oO5QJt4eQk8be/A3JEZXVLPe/1BCArCVAyzu9f7RXAuPaXNZxlFZyG2Bu4LrGE5CC0xpMN0mesPNAcEBWV4UWA0qmh/g4A1PIuoZKTX2mte+gw0RhVPSe648HFlXLjzuSV+ljnY7Hcn03gTQ8OqsyhNhNt47LhEhjbXNfsqOkZZ02OVQXNYALXqLGXJrInaIXSXFUUQnB1DgVMlRGDv/cwME3zsQy2SreVMVPfSo9k6gUgdNVtiMLMZBcmqFMoXBrqRfKVjG3kfwTKVzTtb8yy4NXM98Ktsy8fsNd1Nqt1LmgFnkuw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l5RwkHpjSUZk7Rzm0ikgxUNBiO1kxEhXMjLxQoKi7X4=;
 b=KkuY2e6SdFBRbJEOEPtOwcLzHxZAJa8TDjT/6gvFtCv+Rcn2w6jzKk9GEvbCcdGNiVYRuIDztR6u6JffnSJv8aZ5kbcVuoZsQ8kbP1coawXfTu7idOwUbcAPMPSY7TOqUIxBQZbGGNvzhEoOswappaKH6CXF0Q6Fv8+hjy9eCoE=
Received: from DU6P191CA0043.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:53f::29)
 by DB9PR08MB9513.eurprd08.prod.outlook.com (2603:10a6:10:459::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Fri, 9 Jan
 2026 17:05:43 +0000
Received: from DU2PEPF00028D06.eurprd03.prod.outlook.com
 (2603:10a6:10:53f:cafe::7e) by DU6P191CA0043.outlook.office365.com
 (2603:10a6:10:53f::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.4 via Frontend Transport; Fri, 9
 Jan 2026 17:05:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D06.mail.protection.outlook.com (10.167.242.166) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.1
 via Frontend Transport; Fri, 9 Jan 2026 17:05:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T0gsAgMYT4mn2G9wQntbwMUU1Ab7KJ6xVDZ/bviYctVVV2kMzWxQCeGSigj2ZVC3NXbeEICJBiMCXO8rkcwKqYtkes+IRiF/jSzo2VjI9zEA++uN09gN0/eUD1HZbBVAWeLvRVHMWmph+w61Tbp6hBE0zh1ypALsN/8soxgigy1hRtrau0s2jsXeoSU0aAoswEyXkvJl7r31snCj23O7FsMNxU7+iOeqibuI2jGNNg7dq9NRKHJQvsTlnP3tyXFD9S3/NWX8yuSzAPFPTkVhpfyp3nb+0tfjjxsFfZnw9rXG4sC8dtvL/WlKZsAkqgh7WYv3BvAI7hWrww2q8rFOzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l5RwkHpjSUZk7Rzm0ikgxUNBiO1kxEhXMjLxQoKi7X4=;
 b=NtFfJbd7m30Z0JJnq/klj095NDTwrxsA38g62N6WF/glqdXU2RyyONBlMoKeIrlTrAAMLo7dNNU3VrXGnywVyy+O/DgX4G21sVHr3KSBu7S0jjygz0raEvslG+iJekxixWRlyzIbxEtIaD4802+tPnrSr6EaC5d3YMH6goa0F5N5Jm5j3t/jL8iU/BMHsB3RGM1b3Pb0rvMmv1oI3GiW2twdDGpiXGw2L2Gq8YgiY/VoWfparoliK1mYS1TzCNnm6yUVkqHe63FeX4iL+Yo/phx0XlypiGeea9r98AHfMWSM3OuzH1pLuWAx5SnaSN6zfhgHOmMztl2phyiwVYbdWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l5RwkHpjSUZk7Rzm0ikgxUNBiO1kxEhXMjLxQoKi7X4=;
 b=KkuY2e6SdFBRbJEOEPtOwcLzHxZAJa8TDjT/6gvFtCv+Rcn2w6jzKk9GEvbCcdGNiVYRuIDztR6u6JffnSJv8aZ5kbcVuoZsQ8kbP1coawXfTu7idOwUbcAPMPSY7TOqUIxBQZbGGNvzhEoOswappaKH6CXF0Q6Fv8+hjy9eCoE=
Received: from AS8PR08MB6744.eurprd08.prod.outlook.com (2603:10a6:20b:397::10)
 by AS8PR08MB6216.eurprd08.prod.outlook.com (2603:10a6:20b:29c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Fri, 9 Jan
 2026 17:04:40 +0000
Received: from AS8PR08MB6744.eurprd08.prod.outlook.com
 ([fe80::c07d:23d6:efa7:7ddb]) by AS8PR08MB6744.eurprd08.prod.outlook.com
 ([fe80::c07d:23d6:efa7:7ddb%6]) with mapi id 15.20.9499.003; Fri, 9 Jan 2026
 17:04:40 +0000
From: Sascha Bischoff <Sascha.Bischoff@arm.com>
To: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "kvmarm@lists.linux.dev"
	<kvmarm@lists.linux.dev>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>
CC: nd <nd@arm.com>, "maz@kernel.org" <maz@kernel.org>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>, Joey Gouly
	<Joey.Gouly@arm.com>, Suzuki Poulose <Suzuki.Poulose@arm.com>,
	"yuzenghui@huawei.com" <yuzenghui@huawei.com>, "peter.maydell@linaro.org"
	<peter.maydell@linaro.org>, "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	Timothy Hayes <Timothy.Hayes@arm.com>, "jonathan.cameron@huawei.com"
	<jonathan.cameron@huawei.com>
Subject: [PATCH v3 03/36] arm64/sysreg: Drop ICH_HFGRTR_EL2.ICC_HAPR_EL1 and
 make RES1
Thread-Topic: [PATCH v3 03/36] arm64/sysreg: Drop ICH_HFGRTR_EL2.ICC_HAPR_EL1
 and make RES1
Thread-Index: AQHcgYoKyqf/FAr22kaR4xdMF0D2PA==
Date: Fri, 9 Jan 2026 17:04:39 +0000
Message-ID: <20260109170400.1585048-4-sascha.bischoff@arm.com>
References: <20260109170400.1585048-1-sascha.bischoff@arm.com>
In-Reply-To: <20260109170400.1585048-1-sascha.bischoff@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.34.1
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: AS8PR08MB6744:EE_|AS8PR08MB6216:EE_|DU2PEPF00028D06:EE_|DB9PR08MB9513:EE_
X-MS-Office365-Filtering-Correlation-Id: c79f2ac8-0405-43fe-0c03-08de4fa152f7
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
X-Microsoft-Antispam-Message-Info-Original: =?iso-8859-1?Q?ofvMfIXXbSVl/6+wNCZxwRGefUblAQf0YOimfCaEd6JoeAqHkaNbqzsOed?=
 =?iso-8859-1?Q?G7UVR7r14qQyQZPJlJP+t/qEFrle/ijGbou7BuIX3sPKQrPmLTOnIWabve?=
 =?iso-8859-1?Q?MwRN+h5LR+mWC3QolIuWetnLI+u9f3G7V1tLUzEKGUKeXk/P6+Id49NXoZ?=
 =?iso-8859-1?Q?eUk9JfIHG3EDpmF/lJtcq/y51XtXU+fehC4BIaa1cALVVOguZF3lDuUIXV?=
 =?iso-8859-1?Q?eWqLU5ESyo1K6FRnGWBJyLRYVZ53SbVPb6C0mN2PyvH6WoC7GVkUDgO+yx?=
 =?iso-8859-1?Q?7o93W5JukC2JpvOPfJ2cdQxGRILamLd6vWkZU/UdCkqA7jAiQR6tJXTEjS?=
 =?iso-8859-1?Q?5GyqqXl1pIEHDhAV+BYcdM3ud5+9zGBT2xmw3t8snpICfbm6JnIKyIMsqQ?=
 =?iso-8859-1?Q?43gB/Rv2wAXfrWwbxg4Rgogr2JbKl5GSz1yVO2JZWEh0T/p4/+MwwsXBQx?=
 =?iso-8859-1?Q?Z0UfIn7v/5pvepX5cVHMTuTLQyhXa2wLYFFLkC3SzNV6YXbs93qdLmLjMu?=
 =?iso-8859-1?Q?ZkG38I0SSAN9LdWhkRY9pzDIQeglSs+zSq+vqCz4sWdZVHobzmccG2Zf3q?=
 =?iso-8859-1?Q?VU+ONrH3b3Y0qMJRh6/QVwxQccNUl7OwurT1egVa+3lMUyBw997zxzwP88?=
 =?iso-8859-1?Q?0qYRt+1I7K7CPY1lEKWyyFkapXgpwiNDC3BUvyK6llhVn0ThkMZA4ymt9P?=
 =?iso-8859-1?Q?wzn5uSoocAUJBMOFSwQlbsJGu1sWYlSl+hMf/jGDL1BOCEc4dfmgh0PDG7?=
 =?iso-8859-1?Q?Pd7FFwLXQdvkxwNctXtD/eOLZDe6VOLaL+ZYdO1xz6wnptwAKHXQNy20Ng?=
 =?iso-8859-1?Q?k2xiLnxe5Z4HI+cMlbbOASnrH8S75/5YbPFJDUbKz1OxF8sTM+1QPurqBS?=
 =?iso-8859-1?Q?m+oHi0geXOy1PTYCdTKsAEuqNvxCinermyAL2Kx9BJ3VQoklqRD84YEqmw?=
 =?iso-8859-1?Q?YN7Mrn8jO0iWDrc+L9oDzM+bAE+Olz967+S/tkAaSgitqHd+gNWg7S13CP?=
 =?iso-8859-1?Q?3+wW+6zgDHqPCS3dlmqQx2c1Fw7zwhTQEAELk1+e5UXLCATpmWNrCXDsSG?=
 =?iso-8859-1?Q?uRXqbmJnJMOlsJ7m+GrQTaaHZGFyTalV6xvaMbPSOnEI6UW7ou9FdjmRvV?=
 =?iso-8859-1?Q?YYY9/YD56IsuBk22joHuNSlPDyqxRvCAXAndU22aMLlTSQ/ezaBY4c8z/j?=
 =?iso-8859-1?Q?9nwtrOZLQz1MaRONpiLxaP1zny0tnlRgfPsQ8hx4P5Puhg9KvypXC0JIf6?=
 =?iso-8859-1?Q?pJhNuFGHL3CzHDnWLrhlymaxcmRHpcRe+jZ/TztSGGnYEYWuThuZiFrrWI?=
 =?iso-8859-1?Q?+mdz45w6kA+lNoACfl75y7JfNmuB4A1/cVt9yOlckOdwVhceCI/BZTkkqQ?=
 =?iso-8859-1?Q?gyOzVNG8lnvEgb5Houfg+BbdnXZcVPxEBMJ1meLUICSoaLlQNI6NvCGudw?=
 =?iso-8859-1?Q?CEgAagByRd0pKwP3JqgveHGNk1/LHyH5jnmagv/F3VCPXQbOZ3ggGtFfpM?=
 =?iso-8859-1?Q?w5t26j3ZCb8dJlqqBHNA1YCfTY6IpDA91Oq0XWA5ZF9yZtlRNafiRJgnqj?=
 =?iso-8859-1?Q?SuyTgQ4BhSAK6+uUbWNOKWsbaS06?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB6744.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6216
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU2PEPF00028D06.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: aa6cabec-95be-48e3-70e8-08de4fa12d43
X-Microsoft-Antispam: BCL:0;ARA:13230040|35042699022|36860700013|376014|82310400026|14060799003|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?yhsfvqpo7gC8JWz7FNrq79LZjV5602GKHN0Bn7ixPf+YCHnTtVXvSMyZLy?=
 =?iso-8859-1?Q?CTWs1tSECIYN+GxmsEdZuhIc2Ppf4yr1a9U3auP8d98/v4tDdFLxiKJrZP?=
 =?iso-8859-1?Q?0Xqw+o6SJTrlmXp/oqzMmNSRywxW6WyhsSCK+Ci892ytHGMV7ayBkb/aVO?=
 =?iso-8859-1?Q?NA07hhSGoHcOAUksU5OZPBTBmqZCyNZfIHXW+N0uovsbot5myOeJLkwdCE?=
 =?iso-8859-1?Q?yWtdWUjLq3hXjBQvnpHD6b4f9ulPk+Zuu3CJT4T4iw0S/NV2CMXYoXf/WJ?=
 =?iso-8859-1?Q?iOLQQUKzVYWHTUa1gyi/PIfG7/8bu08SNDD70F1gE+57Gp8c3EfBiE4hJF?=
 =?iso-8859-1?Q?Vd0ZBA0tYrFQLUzIsoYTkfKEgfvqrLCWL+rqRN9pkm03ujw09Aqck0BygE?=
 =?iso-8859-1?Q?sv5+DqR5AiqTb/S8nxVcGksDxuvX7jwGKgmL10UCdZQjE1yBKdymU669hN?=
 =?iso-8859-1?Q?HMPe1EGhj5HYM9f4BO68T+Zm/6N/HxkD7LCQuhaKwcH5ImQ1Nby/gNICJr?=
 =?iso-8859-1?Q?1Ddz7VCHY2TG3GGRO3p9l7rYO2Srji0qHlLJ2HJlBMwrR5ZBkIqcMPOvyu?=
 =?iso-8859-1?Q?ggMllv7CprYIM0cd3gjWbwN6IrH26enIDpQHkwSjxpPxfzLKckJYeMe+WF?=
 =?iso-8859-1?Q?Ehdf92jRySqNPGcgETumVZaxkR+ml59ZkflW6bAFRDbowtGdTvO2LBqCtq?=
 =?iso-8859-1?Q?s1fUKPerxAHQhymka4Z8Op8GuVCYGpi1B51BtZs2i6bNTY/nXzjdeLTBlj?=
 =?iso-8859-1?Q?k8Lb1yaNTPj4DQh2wiiF1pNO23Dzv8YAAx1Zr9J9XKUZLyhfMsHYl5lEq+?=
 =?iso-8859-1?Q?m1szQNixdurqzrfU4FscNnk28SRzdRl0j83DXt3Mxy+d05QW41s8FpFEId?=
 =?iso-8859-1?Q?C73BML57Lec2e/Y1hCZer8titvuCUGsDtLyZCgQwb3GEA75hvL+a114Krz?=
 =?iso-8859-1?Q?+K7MO0prlfesgW8m2kvH/7vdkoC9CtvcUcGzwRaLuBRKlNKNBLusyrWxMj?=
 =?iso-8859-1?Q?FbFNv0JP2u1xjK/4UtqCfkSCcAOmD+gTTWpXYy7WPwEfPaZO3mccCjUQ86?=
 =?iso-8859-1?Q?83jRqqEVYa3sin85Oa/21qSI79izxPkYzP8IGgW2ZXp2/a/8We4Zyque70?=
 =?iso-8859-1?Q?o9gEPN9rO0y/YBWla7MhAmzFZLsZjgjyzC8VpsudTmnb2EDD8DdCGGgBxj?=
 =?iso-8859-1?Q?l0w2V9WNE7pK8hhMDaaUiri+Pyklcv3/8RxRh4AbTg9+z5P6PSl3uZ0LYp?=
 =?iso-8859-1?Q?XxAi6T79XsFhTpNmTA9OkVlCJ393xFh5u7Z76oB5qTo1ZyV0GoR3baRYyl?=
 =?iso-8859-1?Q?jWptF9wfkv8xzLPtZPWi80JNiS/8y++f0ktacEtbGsUc8x8COGdJGkCEYU?=
 =?iso-8859-1?Q?pXsFunlFFdUcKUUXmVAz66nztszGT1kqbXmef5VaiDNXja9x5dP5LKn9PS?=
 =?iso-8859-1?Q?pOwSktEDzT7+lj2rK+07OFwiQuP8Da6ygUGtbAstuOIp5VkE8k0T2mxPfB?=
 =?iso-8859-1?Q?67QMEHzFY5XthAAKpzmmXazFW0ln3VKfx8wqdkkiGEvGpwYz8axV+62hz7?=
 =?iso-8859-1?Q?ZBO30bup56b4ixGwT5YHN0RoX9Pb/sXpCH0nD8t/KjTH3HTKIh9ah4jfAa?=
 =?iso-8859-1?Q?z0vPyrO/M02MI=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(36860700013)(376014)(82310400026)(14060799003)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 17:05:43.2451
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c79f2ac8-0405-43fe-0c03-08de4fa152f7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D06.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9513
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_090549_597037_030E0FF2 
X-CRM114-Status: GOOD (  11.74  )
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

The GICv5 architecture is dropping the ICC_HAPR_EL1 and ICV_HAPR_EL1
system registers. These registers were never added to the sysregs, but
the traps for them were.

Drop the trap bit from the ICH_HFGRTR_EL2 and make it Res1 as per the
upcoming GICv5 spec change. Additionally, update the EL2 setup code to
not attempt to set that bit.

Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
---
 arch/arm64/include/asm/el2_setup.h | 1 -
 arch/arm64/tools/sysreg            | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/el2_setup.h b/arch/arm64/include/asm/el=
2_setup.h
index cacd20df1786e..07c12f4a69b41 100644
--- a/arch/arm64/include/asm/el2_setup.h
+++ b/arch/arm64/include/asm/el2_setup.h
@@ -225,7 +225,6 @@
 		     ICH_HFGRTR_EL2_ICC_ICSR_EL1		| \
 		     ICH_HFGRTR_EL2_ICC_PCR_EL1			| \
 		     ICH_HFGRTR_EL2_ICC_HPPIR_EL1		| \
-		     ICH_HFGRTR_EL2_ICC_HAPR_EL1		| \
 		     ICH_HFGRTR_EL2_ICC_CR0_EL1			| \
 		     ICH_HFGRTR_EL2_ICC_IDRn_EL1		| \
 		     ICH_HFGRTR_EL2_ICC_APR_EL1)
diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 8921b51866d64..dab5bfe8c9686 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -4579,7 +4579,7 @@ Field	7	ICC_IAFFIDR_EL1
 Field	6	ICC_ICSR_EL1
 Field	5	ICC_PCR_EL1
 Field	4	ICC_HPPIR_EL1
-Field	3	ICC_HAPR_EL1
+Res1	3
 Field	2	ICC_CR0_EL1
 Field	1	ICC_IDRn_EL1
 Field	0	ICC_APR_EL1
--=20
2.34.1

