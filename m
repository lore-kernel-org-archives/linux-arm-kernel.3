Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A422ECD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 14:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gomqtA7MohlPsGo78Shb4CHwZGfAzd1cFgNsNMMMyaI=; b=mkA+GIh3Sg8mD3V/Caj9Qspdha
	xNmDYCeoJWjemhXg6Yz9HQEkm8I78jDqqEBhiudPBcfm03dPw34WAsllLy3EEbvBjr3Wyd2LAh0hV
	R6IyBWsIicUqscyg7qUE+GPwgIEfIM5J8RDTiI+eeFZG6zJBKq6JFwmagiZ1iZwR6G6swm/Mcun29
	PfXB/wEhsdzaVmRPGhytyIYQybQrdGLzH/Vwl9gTX1TsO+Nsm2LV9oto2x7vE0U4iF0x4YGc4QLu5
	zXWOI+exa0m6SzFPUHkC1N58z/kYY7NkQTn13Md5YlCWBnr9Cms6lgM1e/4TP+fCskkaePpkkZRmp
	p6zDbHNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPi05-00000004q7x-1eP8;
	Wed, 20 May 2026 14:34:21 +0000
Received: from mail-northcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c105::7] helo=CH4PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPi02-00000004q5s-1gpN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 14:34:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rn5S6yQ/e3GCWu1bXBg3VH6xxEYrOWRyazCiMfGxdzyXJIR9B77HnFs4LO3v4XM7km/3B2cJLY6b5Qka6jtuz0C76BRXEW7BtmUIF8+4QaMg22F3vmQY4gnxiw4sHUcw3/f3L3S98GyunLkKd9IMwIUuoaRwmLXRTy+KvAk0d/Xy1hwhBJfFx3z8nuG/cUsYzrcOtQ6FfQTwypPaXKx+RdKA5CZM7ZO9CwigsWYzsuCqktCR+dZpKRP9RVnpCyohLpmc/W5Anh5AYSTPWFbSY9JSm6bMeoUO0Y2rqdltEk701nc0XPnsBEMvDLAUIHrovQlXVGuIaX9SEENgcGMmmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gomqtA7MohlPsGo78Shb4CHwZGfAzd1cFgNsNMMMyaI=;
 b=F3V224YA94F/mjLDyLe/tV0fWIm0BvzLR29/gUoyPv0lXmBDwlrB4n8U62xMf44FVIEo3Le2gDmvOMgyZBb+JPj8hne4fbaso0mYUIemxXglj3P9NrU9a6obL8vnNkYPut2j4p3UpHoX1wVUppjU5q8oonF05AIOaQOjUVxNIt2twUPECAMnzqXijxQvDPZqycuXvpabi5iMuPZ9d4Nw18+Vqp9beigg2kF/tjn8+dmF/G61CU+4E52Eyyh9tOEHf2dSB5CKbt+/q12z7KXA8wXzBhWBdBUWHQPD5sQTNh1mzn41ErsCny8/DxobgQ7dBZ+fBiwE+yeFhgGyoN7gQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gomqtA7MohlPsGo78Shb4CHwZGfAzd1cFgNsNMMMyaI=;
 b=piarjOPBsg/tNYoPww1U8MOJO/vh6AYLXNHG84MDP++Jb7PBdhezenWgJyAJHFF2XN1zw0/aiw7T4PQUBs3IF0v3PK/AILmpmHwRNWQh2TK5LWtTLwNMBJyYamSKrDkzOjcdPxTaLo0FNUBXJnET1VSzYuIUEnqw5wp6oXZeSJQJwwpexXDlI3Oc0IKO98u0lSaSXO+zFAmoQ0dtdtWRCHZHhS5aYDbOUuSSrNZZ9KP+1hj6eut9gUAR2UFvEkjz7qyiH/cyANYKxGnx8eyejsydP6AVUMSwo54LczXAqKYjZzGgraGp1xlvHQXh4heh43dE9kCSRCDPaUqhWO59nw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by IA1PR12MB8310.namprd12.prod.outlook.com (2603:10b6:208:3ff::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 14:34:11 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.21.0048.013; Wed, 20 May 2026
 14:34:11 +0000
Date: Wed, 20 May 2026 11:34:10 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Yi Liu <yi.l.liu@intel.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>, will@kernel.org,
	robin.murphy@arm.com, bhelgaas@google.com, joro@8bytes.org,
	praan@google.com, baolu.lu@linux.intel.com, kevin.tian@intel.com,
	miko.lenczewski@arm.com, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, dan.j.williams@intel.com,
	jonathan.cameron@huawei.com, vsethi@nvidia.com,
	linux-cxl@vger.kernel.org, nirmoyd@nvidia.com
Subject: Re: [PATCH v4 1/3] PCI: Allow ATS to be always on for CXL.cache
 capable devices
Message-ID: <20260520143410.GV3602937@nvidia.com>
References: <cover.1777269009.git.nicolinc@nvidia.com>
 <f6734b9dad0050138676f11ecd14e9db1cf6b697.1777269009.git.nicolinc@nvidia.com>
 <e8337102-aecd-48e8-9a2d-10f41ed43c5b@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e8337102-aecd-48e8-9a2d-10f41ed43c5b@intel.com>
X-ClientProxiedBy: BN0PR07CA0028.namprd07.prod.outlook.com
 (2603:10b6:408:141::27) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|IA1PR12MB8310:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f6df79d-b7f1-465c-e73f-08deb67cdbaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|56012099003|22082099003|18002099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: U2kaZMYHeV4alMAHkKEVijDHcg9oCefxEF5o+Vr+JzisQCClTdp0a85HNwe+BEYtYjanmPWDKZzAsZWp+i+V3YO+O96106SLAkFqG1gMlY0e1RBVRZVWvVsQbFDNYEPLw9BtdxtSrWwSza2Le4LYai5sWJynPesJSXfx5hlAmsWDCAxeKceRuql5q2aE5PhjZq+SE2HKuDCpm/Z6sr64oE/lRnWX3J3pS21lWduxqWmQlr2O4u3K1KQom1gUL1CNYQ1qKYrUesJJy4s7/b2mFVgyBXPvnbR1wmRxTwPQ0BlRPDZW15jgr0itFAtaasqj5SjbBspErn6JTw4KBO32mzRwnWKx+Pv4Q68vGWNLVwuxsMAu32u0LLGZnRtUkyBPpfzpxU//YPRmhok6CeRN/qa4b3sTCdjtqKdVy/TMCsefQ63COykr1cF8W4qgfkqSCrfFC+0yKaAFqGLfGk6y7mM94/6HUI70htSyO8BC7bsxP3INrI2FtR/eMczt5JKtdEvIABvv9++qZco0HW9CHF4T32q9pVOLzppG/ODvnn4YlxdOizAsQjzSGYELsYHIE5GUP0v9ZU+Nl/1RtKvykwgB8DiTH7m2X01Vf1aWW/i24Jo3F8JT/mMJv10FionefFA6nMX6i9teA2q6SGmfOfvWEeX4V+QqOLNKJSgrQ6SdHivHGSQW6KmIq4lWuvRx
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(56012099003)(22082099003)(18002099003)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ttf4ICuiouhoT/YpBzARJmvBjAbyfceAx3pBPXpqcx8bTkYXUWKlSYJUB7qR?=
 =?us-ascii?Q?bQGWEKOAwYRW5CildeSlGWaTsGRm7VLMFIQElkwE/BfljlIAGOZKKLeQWwb1?=
 =?us-ascii?Q?njXPM51v5yq5keS5GBsV7rvZl8UCT3IzhCk4ntLw6gajAT3Mm/nc96urq7uP?=
 =?us-ascii?Q?g+CWOJa7OUh14fm329JdHCej2MCO5BPR5BDl7sEjPKIpD35H1nDCAaVEXZZI?=
 =?us-ascii?Q?oOGarkv0Yi7J1XAg9BCddGel5ll7/jp29kDUXK5nZFQnYu9i5QX/POsr/RM3?=
 =?us-ascii?Q?QusCtAVny5R4dIEG6Fk+Uqg3esHyeuBsHAMKIV3Sob8BGHaTJTqRT+nwNevQ?=
 =?us-ascii?Q?YP8za2skLCEe/lrhqHNqbLW2tGzc7QoYwlmeBYE0Q1fY90pghWmK+Tx2sRkk?=
 =?us-ascii?Q?2nZsL+fciYFOltuFaO+Ng7rkM0n5aURD9v+ibAucO/yB2l3yTqPwjXYL8611?=
 =?us-ascii?Q?FZeTKjHnkHJEwWBRR6M12EuHQWBBTtGNBaq/QiPf7MRStq9ZkbM5s0OQ7m/e?=
 =?us-ascii?Q?wXDOrbACbGhYXjMXiKUf/Sd/maOb5pNW8Tp0Ee5jjpqvciKxv/L+jBkxIaWZ?=
 =?us-ascii?Q?romrT6rzbV+sYuOHJezbAb63IKuhGU4nIAnzgTLpIVIeKdhv2Le1+dcnQPzc?=
 =?us-ascii?Q?0pnXrh5h2vxzP04fIQVnN1eEGuwmZ90QunFhWs0ET6J1/1rUU+F6wxC7EjYh?=
 =?us-ascii?Q?syrEZe6b5YZ+ZVt1D9xAbn1MP9e6Ngd5oQBsrQNAQGDQ9XuveKYYh4qliYmt?=
 =?us-ascii?Q?Ff561sqociPlf6GrpOhOyId9RgIhGxx20IhlTkfdDDCW0ZQiUQKidXzTT16P?=
 =?us-ascii?Q?9zuVFpKBib2wc5wrVyQrJeumdmYhkFuXQyLJjfpfe9rWZ+dHL+qxYKOsBu1h?=
 =?us-ascii?Q?CLNCPIFPKDMruPf/BAqw290xfzD+FexQpoQVEqODwOag7TPFc1JUo+eSlNbE?=
 =?us-ascii?Q?UjxwsZLT7yCjDfbmuUo+AF5lDV1/AyKHwHz5wGE0NesHwjW/dhTdkgI7iFzS?=
 =?us-ascii?Q?IrrZfFoeTsFN4z4493hOgLh2SAnXw9UP71TIm+TsKsN/KdNZd2HZbMGV3RIo?=
 =?us-ascii?Q?uaxysBs4P0FcP/wu0tCz1RFDwf81aMrmlT4+bIJ5I9Jx2OL2L1Zen4avFQ5y?=
 =?us-ascii?Q?krmDqk+dep3kIOjrBa+j4BURQrLZCo5eyEpv/DpH5TA1ND61qtRiiqJB+19+?=
 =?us-ascii?Q?IMnKTBxwQiLyw+Qj+HXUSLQlfkPLszFIeoNxs0uIfTMRW780GQj4suVmDXTb?=
 =?us-ascii?Q?ihC/3jTtpVWcCVZBIjOKTCfHX+NitpwqVR7FnftmnEDUP3TeL+AXw3tQwdNF?=
 =?us-ascii?Q?wir9kk01ZzSJ969hiMcFm/XcsY0OGkKxCx1QFW3BIs3uULWSewdNc4qENiLW?=
 =?us-ascii?Q?5Z75AhMDGgTyhdBeY5gjhOJrGl+q1JR7UPXXuM+QRDsIxvDtRqCdradEuHJg?=
 =?us-ascii?Q?BSsPIquPnKH14KBAuK+9J2LL7DG/iFLK3lcdVAXTaTmx6vok6gfqSeKB3iQn?=
 =?us-ascii?Q?jONA7XZ7FTN9+b2ONqogvw2U106ckCq7OaN9zUOAWGzRo+UVMgkVoqT6l/CU?=
 =?us-ascii?Q?v/mv9lIcycSlLSEtHxdYw+WPitaXakrjdhEiaoKWbjwFYLlS19KxLDGOJw7N?=
 =?us-ascii?Q?tJawnaEcTrzAh1RXKUtv2UC32hvnVvicZFY5B7yZmK62JdeMMCDVpO+vscRH?=
 =?us-ascii?Q?X1k8ysku9b4ryYcajPNELyiwTGmVDSdZ0K6bGzBH54LlQtfC?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f6df79d-b7f1-465c-e73f-08deb67cdbaa
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 14:34:11.2518
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wW4RDHiEtinXs7kSbo0ttt0krlbqrDDGl/EIeKQLnRAINIi31FgVWi2JWGPhEGgq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8310
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_073418_443313_411599BD 
X-CRM114-Status: GOOD (  10.01  )
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

On Wed, May 20, 2026 at 09:12:31PM +0800, Yi Liu wrote:
> On 4/27/26 13:54, Nicolin Chen wrote:
> > Controlled by the IOMMU driver, ATS is usually enabled "on demand" when a
> > given PASID on a device is attached to an I/O page table. This is working
> > even when a device has no translation on its RID (i.e., the RID is IOMMU
> > bypassed).
> 
> nit: this description seems not accurate. Intel iommu driver enables ATS
> in the probe_device() phase. mind tweak a bit to avoid misleading
> message. :)

It probably shouldn't do this, it should follow ARM and have it
dynamic during domain attach.

For security we need ATS disabled for blocking domains at a minimum.

Jason

