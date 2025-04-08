Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A0EEC369A2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 17:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+khpEJOPXtsV9nyj1OYsnGNYTGbZDVg/JxrXC/Gdxno=; b=QdpBLUFXVqg8UA+jc68riBV32L
	1QwA6QZHXywJggkpMyzScBD5bQN6JL/ir5KfyKUuPk54rNIMh8gPB8xEkgU93H8+fJf4RiusWBYoo
	X/a6xaDYf+4/obsv2odOP0K8XQlicYkN2braxOXsCm8Tpa/ctWpMVsmtmD4qGVKtMTJpskh/2Ne5V
	Sg8G3gkFbhq32tVPo+bH5M8nlVOXU9nRX/rpW2xJqNRCxOqidk1iO3B4FSPnPwMDqHDvZdJYYPovF
	knAHGanBtDXlNO0/0cvIHVlv3RjuANzuU995M+BnTblxGQBF8BbPmWM+W8SxXa5WAqqLcOBI3vxJ0
	e0DoRpJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2DCQ-000000052ZL-2Dxz;
	Tue, 08 Apr 2025 17:57:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2CgS-00000004y6B-04GS;
	Tue, 08 Apr 2025 17:24:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Sender:Reply-To:Content-ID:Content-Description;
	bh=+khpEJOPXtsV9nyj1OYsnGNYTGbZDVg/JxrXC/Gdxno=; b=iEdFMxCgNINkXLKoDq+xSlI5wN
	31hJsQslpNpCGMH8v5RsLFG6sdnVI6N0mf5tAlsTOaoH+tbPNFF+qqHiG6M/2egzqRsmhqPkoTSYm
	7/6KQL9GvxWmXBC4fPlavTJiU1D6jqJ4k8/uHuNwwKotcoKPqW83kZixMw9HthOzLHcKJJMziQZK2
	6583ZVW54v014Kj36XHDH/eLDefyfnfmvrpILw8N0NewdopxMteVEhqYEWqZbOEIMg6I2j3nCtWNc
	RF02vm2nppNVkjzxChunI2vVCs8goKGAJg0K3w0UOaHhtW4qDcIc6lYC2V3aTgPN0KdQM84aibzhq
	RqiYfsKw==;
Received: from mail-bn8nam04on2060f.outbound.protection.outlook.com ([2a01:111:f403:2408::60f] helo=NAM04-BN8-obe.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2CgP-00000008M6z-0y7r;
	Tue, 08 Apr 2025 17:24:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o8q6NzVeBqOoa6ba5bDETo2/mZl0Y5l4jb7Is2rYCL6NXbMdeiDRfy9aT7eVMJ0edGR4JP5UrxciI51U+sCxZdfJ/3wPwN/M5VSzG8kDsP1L8ZRzpfh0CFFJiYJHVWGBrsd3WMGdfy4i9VzK7r7jZAE3FuXrM2vEumWMgsdrM/NWvSJx8iZcgRmGmh78m68UuXNH8P2KktDSGQ6bGwQvCB9mgNFZPPHc0gQ/a9ZBaFS672fUraEOsI+xc5e7n63wxs1zT+YZU55hpPcJaDqwDH61b13THwzDB1mN1QiafsXHGXjQ/+lR5NyfuZidhdCsyZ+6QK+XwMT1Zup8M0dqhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+khpEJOPXtsV9nyj1OYsnGNYTGbZDVg/JxrXC/Gdxno=;
 b=o/KbMvSC44A/3YfpgoutT+RngOeDI2KCEDPhoqujIRS0TMxw6cG/gylGBpJo3V3wFuN08cheqBZ1By8nqjeiYQCfRU2dws1nozXOPqxtMMUuWJOWceKD4ANR1uIdLTusni/nPBVWlMEisigEkRy0qPV91B8RdcnvnaqostLjDaQgKwxZwkehN3BjWGVYIO8obMCyFsqVUAQNJJ3LE+o7XMwV0xLWDWvAX3yP+vpcEHUM5xF9kdUt49896eWzahGyjJo2yKPD4zqZTyoSn/pkswCXeRS7mgdz/K0ZhTRROPoZ8D5EN81vSbTm4IOtSbzoHYFtd6Wt5oWDq+ye1DK2EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+khpEJOPXtsV9nyj1OYsnGNYTGbZDVg/JxrXC/Gdxno=;
 b=MOewCa5l4IHoi75/yp/GJf+nDdPP2GKaZaxiqw1DKPl0mmhFiGWitjsnORfw31z7smdbXRY1FTxVr8By0S8wqJiOHtffb+1cZw61y3QBb7+nTuaPEWYY6W5QQYd7uRQ4/zz9R9RsPqMFBiN7OGDvBoOGoKmHDIozR9UyOotqdm0Lf/rsrwqWPJk6hkemUJZJksoV7nyvxXK76GGCurN5zbwsufyk8tdsUkL4sXMBJFqsWtCurygkBE9dQA1ddgMXSCUlHv2jEg6tgvCI37sDreTcVIs6rst3kHgXvVlBEIYrxImwfo0YsAZYt6OzC4itCPTUWv3Mgu0fxKS8ZpwnCg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by CY3PR12MB9579.namprd12.prod.outlook.com (2603:10b6:930:10a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Tue, 8 Apr
 2025 17:24:12 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8606.028; Tue, 8 Apr 2025
 17:24:12 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alexandre Ghiti <alex@ghiti.fr>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Albert Ou <aou@eecs.berkeley.edu>,
	asahi@lists.linux.dev,
	David Woodhouse <dwmw2@infradead.org>,
	Heiko Stuebner <heiko@sntech.de>,
	iommu@lists.linux.dev,
	Janne Grunau <j@jannau.net>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Joerg Roedel <joro@8bytes.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Neal Gompa <neal@gompa.dev>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Samuel Holland <samuel@sholland.org>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Sven Peter <sven@svenpeter.dev>,
	Thierry Reding <thierry.reding@gmail.com>,
	Tomasz Jeznach <tjeznach@rivosinc.com>,
	Krishna Reddy <vdumpa@nvidia.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Will Deacon <will@kernel.org>
Cc: Alejandro Jimenez <alejandro.j.jimenez@oracle.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Joerg Roedel <jroedel@suse.de>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	patches@lists.linux.dev,
	David Rientjes <rientjes@google.com>,
	Mostafa Saleh <smostafa@google.com>,
	Matthew Wilcox <willy@infradead.org>
Subject: [PATCH v4 18/23] iommu/riscv: Update to use iommu_alloc_pages_node_lg2()
Date: Tue,  8 Apr 2025 13:54:06 -0300
Message-ID: <18-v4-c8663abbb606+3f7-iommu_pages_jgg@nvidia.com>
In-Reply-To: <0-v4-c8663abbb606+3f7-iommu_pages_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN8PR03CA0029.namprd03.prod.outlook.com
 (2603:10b6:408:94::42) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|CY3PR12MB9579:EE_
X-MS-Office365-Filtering-Correlation-Id: fc0e6c3f-f85f-4912-f83d-08dd76c22dab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2q6SK4xofIu4APGqyirFzl/c8jxq0ZjQ3bY88ng6Rn7AuTnInsz+hbJVnMVY?=
 =?us-ascii?Q?OxC2M77bUyoyW1YTSpsWp/1jSJES+yXerdZQlrB4qtkV4SOX5r6vNXGsgm3R?=
 =?us-ascii?Q?ns9ZG44kIBdGIikeUL5BdkXRzvmWvutmIXMAumYHyq/RNF7BpsyCAw1ysRTw?=
 =?us-ascii?Q?900UMemplkRLv8haj1BzZ+ren8MOQvHOQ2U76ZeVrFC5cAz+BzQc0Fj8D0nQ?=
 =?us-ascii?Q?2sWlXeWEd0Ji0lDAZhBJhS4j8Qfz0Tkc8rU23ZFjme+8KIBgfHKEb+i1CU6C?=
 =?us-ascii?Q?jGgx91bqU0aoswKv17qFbXCFZmX8pdl4D2pNN0u/FiRBDAKJzT8HS5QlRM8r?=
 =?us-ascii?Q?U1yfr1nCc2JSjb5xXArMO1zSJQ4+2WhAxSRW2dtXI2oahbRWz5F1euKnKg2y?=
 =?us-ascii?Q?hYx+WYeSyqOGanzFPRy7e41M3pLiqBNdIl1clMhgIBdxZDDD+R2cgnB2aZo8?=
 =?us-ascii?Q?YHqir6mLPzmN3826fC++EMk2hcGv1ajo2VRn3DtW9pEdGe9WmZw3FOrUQyjW?=
 =?us-ascii?Q?EuX+BV7555nDcTxMO6BneiIGxktpDrozifMpCQ8UrYWrJXX177ApS6fyo+a7?=
 =?us-ascii?Q?JIh6kzmcbXdI84+M0UHvQHots5YMbZI0M8KHfeTlJmhKzmcuqrsqkqBK6ey5?=
 =?us-ascii?Q?BUgPlCruH3bDT1onnpJ4hE0P3GWja6DfxPw7rQi5aIZpORRVfKeM8XdXkdQ/?=
 =?us-ascii?Q?SAgGG3sKNy0/EU5ZviugYR1ZhUgIeXMqSaibKv/KngP4yvdfGoTFSvxs8eov?=
 =?us-ascii?Q?b8/rtIBKr/OohryCiDQhwzIgS31ODHzGjSLd3HFH90ypFsSZcrYQzfX0QynM?=
 =?us-ascii?Q?aHO4G1TEM166GpqqIXr31tOwAYKPcJUcKj7O1w4mT146/OJ3/SPKxLujWTts?=
 =?us-ascii?Q?AwCWI5vhmjVrNL5Mylb7hRKieT03RAPdrRJpRKTvuJ9wjYv4o4YM8Fu09gvP?=
 =?us-ascii?Q?u1zUjtFa4V91GcIsndq6WSIQRoJHJuiFfzhmDMLhXtb7elWQIDAlp++RpSoT?=
 =?us-ascii?Q?SBXjPUuj6mG2DE2qxtUcYX1sKj2+/Nhha8jmTjSlAP6jrQ5KDeYv/IzNT3gN?=
 =?us-ascii?Q?OPh1Sj2wPeOweKLtBVnGuAVOcwFfa1t6cbXxkM+kUyNaXkJzhSYQ6dVSA2ez?=
 =?us-ascii?Q?DM/Yy9z20FjdYj+Pz3vSGvBgCE9s8mYW3NYdotxuR4NWd+MYmse8DGzev+v/?=
 =?us-ascii?Q?MriXxLOpGDNKT93rIRpwiGn6iQyihK4e27r/sKqtO2jPnCoZ5//7Ex0cofb4?=
 =?us-ascii?Q?HbeXsZo7GsFDkcy0Y0ZqwvyxFse+0rS9sdD5xpiHI/ndVjN+073ACLRhOIDJ?=
 =?us-ascii?Q?lFPutwkY3957pfEHdqF2M0+iaGbhqBeE2izJX0iIlnqCBSWU82L3C1pqo9is?=
 =?us-ascii?Q?dOLl+kNVG9XHOnt3vMcm0bpSPQFdCJI6jEomnWFM+hkpZoH0V9dmPKq58YB9?=
 =?us-ascii?Q?alyVxnwg6cSpDXJYOo3zQyUkYNSNNkVtL1xERQpRgZ+UI0HzJSb8yA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1BobYXvJn70Qh5Cjl6MJ3VaDon0GbhrmpJKr51iabk26t8yvYJ33d/9F34qI?=
 =?us-ascii?Q?6eqozIQGdYv/H9SRi58IsOjLv3doRHJpm+apPrgTfr3WvUZf7RMFIF8M0lVd?=
 =?us-ascii?Q?d3lu5EMFq4GBrwEx3h1DKss9RRQrMg3Y90ZJqSemftRuG3k92hwd6zYIXQ9G?=
 =?us-ascii?Q?B2qic1s8gRyOEa8mZggf136G5BwHDRPAOq+Sa7UPHxyutuqd357cyzeHUJAa?=
 =?us-ascii?Q?MhA4TUy8c5OP5cFzqVBLm3SUt5VnvtYZ2WaFCmg8yE64CY0OZCInKjqFqi+U?=
 =?us-ascii?Q?KasAZ3vmTbG4ZyJzj8JVmOgXaUlKT18KYD0qW9I6msdB41S+JiCCmgPAjhEO?=
 =?us-ascii?Q?75uAN5GL89ABljUbQ+Uqie854qOU1q4CMpUpcnNjHUJ5+p5ruj+0yxYsfVHz?=
 =?us-ascii?Q?GvQBG0fs00xw9NNH9CP4gwsFy0J9KBYtMaY8eZAsma6+QtenuSKoXgtttjLb?=
 =?us-ascii?Q?24ndSYrBrBgzIklKRPvqzIj5AXBaY7uY1v9Rd5ibhH9/NXQSj7qENqIiDw8O?=
 =?us-ascii?Q?ESwHABnjS7ePsHskD5meNgna67HXymYCZgF1stEd94ZpvQFoVypsvUHF4RJo?=
 =?us-ascii?Q?QY5gO+9QWRzHbRVr1ttqpJXtG1vzlnt1CY7bKJJufJzop4m9c6PJrqQJXZ0y?=
 =?us-ascii?Q?V7MzkbgySnwfg7loArBCjBkTUXwJt+0xF2DT+GjIp9P/dqTW3wXzMAKs+5Zn?=
 =?us-ascii?Q?VEnoJdCi2ZRAeim4H7n5GRY4sjihkvIEftfMMKDGhw8K1KommgJNJyMBAjQU?=
 =?us-ascii?Q?c1XNGfwOP3V9ISZFQGBpvwM3ImW3zTmeC4jaedMplwNPv3hxWgbtTqDsnhKJ?=
 =?us-ascii?Q?SExqOaA+bxTitZvHqBCipG2HeeauzmlL7LQdjXSSeI0CbEPZ/jJU0hmVj+iQ?=
 =?us-ascii?Q?3/OZpwP8Nb96Hyqr9vc6LyNafF9igsVp/6VV9DBqz+AXvxg1l10vPcWL4mHM?=
 =?us-ascii?Q?0Fs6XW8XLGhN4P7T8+GYZBB8CFyHQCQ4qoXrmnknBOh4ADDvFCljFI6asqew?=
 =?us-ascii?Q?MHvIA1+nltZMyOPHwsB8kDJ9vWtjqn/MukV/uKUagRB99KbKyL+LbhHL/sZS?=
 =?us-ascii?Q?3RIVgI1vwn7pj1Z5KDgQprrujTKXK7QrFlRMlJHOOdQvVuKF7RtCWsGipHOT?=
 =?us-ascii?Q?362c4X6WCR04E1kxKF427WwTKVJLKuUlSu22kuvsTlHsH7nKxwztuFhfoaax?=
 =?us-ascii?Q?pIw6/69Zq8sTtymFe1xDIzITsTxq1pdzfvEaRvrVzzzJdbW2MMdVnPt//rK4?=
 =?us-ascii?Q?o+5WgRvlCTk22NX+yMs8l7t8LSeNnZQ1POr1/YCv1OrK/YKTEIA+TEtsvUGW?=
 =?us-ascii?Q?iXy4yqtp1rsX8BKhyJnaQqRvsJm949VnLxAVdU+CrLz+SEKKUWNidMyCK03m?=
 =?us-ascii?Q?8mQ0RTkul4mexs2j9VJ2fG8gt+LftkHgepwj3eJ2tdJ7fyGl9QsfHqaqiglW?=
 =?us-ascii?Q?8bsAg7ES1DCASgeqd27zEKj5RfE1ztj/+AwfVA1PuwvmWYzj7bjrFDxv2TKS?=
 =?us-ascii?Q?7fuxrSoowxaiNKbeqUCaVXr/sbJxtZMw0qOMXRf81R2B3iAqJGxM94ubY7Mg?=
 =?us-ascii?Q?j7sgz7z+0C0YYltMI/Lbr2gRj0vAUzT6Yne1EFCI?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc0e6c3f-f85f-4912-f83d-08dd76c22dab
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 17:24:11.9985
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: at3CBa+6N/U+GFweHWK5+Uo/I3Pt+9lYoB8IEV1ZzY03luPxiMStdVos+evIylNy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9579
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_182421_352349_FF3607F1 
X-CRM114-Status: GOOD (  10.73  )
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

One part of RISCV already has a computed size, however the queue
allocation must be aligned to 4k. The other objects are 4k by spec.

Reviewed-by: Tomasz Jeznach <tjeznach@rivosinc.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/riscv/iommu.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index 2750f2e6e01a2b..8835c82f118db4 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -65,13 +65,14 @@ static int riscv_iommu_devres_pages_match(struct device *dev, void *res, void *p
 	return devres->addr == target->addr;
 }
 
-static void *riscv_iommu_get_pages(struct riscv_iommu_device *iommu, int order)
+static void *riscv_iommu_get_pages(struct riscv_iommu_device *iommu,
+				   unsigned int size)
 {
 	struct riscv_iommu_devres *devres;
 	void *addr;
 
-	addr = iommu_alloc_pages_node(dev_to_node(iommu->dev),
-				      GFP_KERNEL_ACCOUNT, order);
+	addr = iommu_alloc_pages_node_sz(dev_to_node(iommu->dev),
+					 GFP_KERNEL_ACCOUNT, size);
 	if (unlikely(!addr))
 		return NULL;
 
@@ -161,9 +162,9 @@ static int riscv_iommu_queue_alloc(struct riscv_iommu_device *iommu,
 	} else {
 		do {
 			const size_t queue_size = entry_size << (logsz + 1);
-			const int order = get_order(queue_size);
 
-			queue->base = riscv_iommu_get_pages(iommu, order);
+			queue->base = riscv_iommu_get_pages(
+				iommu, max(queue_size, SZ_4K));
 			queue->phys = __pa(queue->base);
 		} while (!queue->base && logsz-- > 0);
 	}
@@ -618,7 +619,7 @@ static struct riscv_iommu_dc *riscv_iommu_get_dc(struct riscv_iommu_device *iomm
 				break;
 			}
 
-			ptr = riscv_iommu_get_pages(iommu, 0);
+			ptr = riscv_iommu_get_pages(iommu, SZ_4K);
 			if (!ptr)
 				return NULL;
 
@@ -698,7 +699,7 @@ static int riscv_iommu_iodir_alloc(struct riscv_iommu_device *iommu)
 	}
 
 	if (!iommu->ddt_root) {
-		iommu->ddt_root = riscv_iommu_get_pages(iommu, 0);
+		iommu->ddt_root = riscv_iommu_get_pages(iommu, SZ_4K);
 		iommu->ddt_phys = __pa(iommu->ddt_root);
 	}
 
-- 
2.43.0


