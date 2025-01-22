Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68289C02182
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 00:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nRRio8jcO7px1PUgS6xk6DsgAXxmilYtlC4aqxkj95I=; b=s/sRVw/BOEegMOtt4pEC4gOTCa
	1YsDbDKiPZtEG88axGsuDFHeZ5pIE2RzoL5mipzb9XDXREgb7/TDTEzroFutpvaqWUcbZmq9OV+EW
	pow9AGlJqp+MXDClC1D4yvVDDd++hDaXugl5CY9DN2Q1J5ykCLt73rnChwQGtwiQvej542ZpjZBRr
	IZJZsDqOXuwPOwOVhcLM7TKdUo+L6YitCLsS/s65+1v08aA1iJPRFYbHekyRauI/YMA+ryj3WD5cN
	bpdDnCqmTjmzUuWjRpVA9wgF7hGPABHf3mU7ZtUab+b338wZimldazp1QznHhlcSNrUQNHuzwfNPf
	OiYOdUCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taOWN-000000091dP-3WfD;
	Wed, 22 Jan 2025 00:23:03 +0000
Received: from mail-co1nam11on2062a.outbound.protection.outlook.com ([2a01:111:f403:2416::62a] helo=NAM11-CO1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taOV6-000000091Q7-2HGF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 00:21:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hALv7R9611ifhAlidgZD1PuJ7KT736DAqz2qcWyjFYlhjywng58CkyPenr+sGZ5D0NAqcbSLNKxNW8ibKs/zDzLaEyi99NY59vKuodexq2eE1jW9L5E6u3jkGJKlON8kwiI3p89WXpcWYEkD4jeBJEKN3NZg7OdkAOyd+OloxSQBcGfXJxMqqSEeB9+h8WReoT1j+jcdqYhOOY+7ZLfUyQQcjzcecUAvTs03F9iwqpIPL8UeycU/D2HVkX9HsgKxb96HamvUYJ1mhaAIB2H+QpJjEAEQcfbwXykdNqtIpsbANNJwGZ9o+JsrYxiwEn+HUnKPB+mDJ+JNRUwpo/xiXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nRRio8jcO7px1PUgS6xk6DsgAXxmilYtlC4aqxkj95I=;
 b=W5/wUfMBdss7mXotCWvRjrvQFOlMHjQq1WJAyzMnz3VwUZmlbiqxhcNpu88J1gNtoGVk7er2o+yov9E4mHiwf+IucoZvpebIj5XA9/NoVeBHXj3WTX1AV1DewvHa8yYA4Gpm+/YU8q/pBp4s+ODwtohKJ59a6Khh5KqK2HhNBHWEkXLzBIRi1FrKtzO1S7cFmGEgnXjLzhwLmZtIhBvrW8kmp3PDGdiBMjwaCI2y0nZUNM+o2xBwyTODOSzGwk62IJ0Mr0AOWYs7L0KETyzVUN0uOtsdSZ0+vYvWDq2rwu846N7R1cDq/Hnv3pa6thIijroIn6msDTOUs53GL7ygIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nRRio8jcO7px1PUgS6xk6DsgAXxmilYtlC4aqxkj95I=;
 b=f7C1CyI/00m5jRYBZSXwb5eAzr1coRCBjfHQ4705g7cQOGNhZFgU4ROyT+h+op/no7G/3mmFqTxgX6feY5+CUpRT1oXlMJnoaA1XYRNr044wvFEuiifNZ/g2Gw4JK9KWBVEkhCk6dhUfhCRthf8CxITFXJ35NTNib3hQIg4byf/Tl7o9KCAc0EWhvyNTig7kiMPEFv7Zo41nfixKsatV38kZbrxvaosVwzKnw75ymiPUzdFTUdPXlhJDRF7xHhK4IRQcqzyhl+l2u0cKNNG/nXLtmzk0Aim0nTAdBOMsOxQMxniQORyePYFr+5/pYtP+RyyxmRKE/djW3NFq84rsVg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by PH7PR12MB7113.namprd12.prod.outlook.com (2603:10b6:510:1ec::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Wed, 22 Jan
 2025 00:21:30 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%5]) with mapi id 15.20.8356.010; Wed, 22 Jan 2025
 00:21:30 +0000
Date: Tue, 21 Jan 2025 20:21:28 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: kevin.tian@intel.com, corbet@lwn.net, will@kernel.org, joro@8bytes.org,
	suravee.suthikulpanit@amd.com, robin.murphy@arm.com,
	dwmw2@infradead.org, baolu.lu@linux.intel.com, shuah@kernel.org,
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
	eric.auger@redhat.com, jean-philippe@linaro.org, mdf@kernel.org,
	mshavit@google.com, shameerali.kolothum.thodi@huawei.com,
	smostafa@google.com, ddutile@redhat.com, yi.l.liu@intel.com,
	patches@lists.linux.dev
Subject: Re: [PATCH v5 08/14] iommufd/viommu: Add iommufd_viommu_report_event
 helper
Message-ID: <20250122002128.GC5556@nvidia.com>
References: <20250114134158.GC5556@nvidia.com>
 <Z4rVg1Xg5TCiFlSb@nvidia.com>
 <20250120181854.GQ5556@nvidia.com>
 <Z463eXfgNArCOfPn@nvidia.com>
 <20250121183611.GY5556@nvidia.com>
 <Z4/7pGx6F1mpAUuV@nvidia.com>
 <20250121200924.GZ5556@nvidia.com>
 <Z5ALWFVTOSC/8+ji@nvidia.com>
 <20250121211404.GB5556@nvidia.com>
 <Z5AUNVHzJPATVqAY@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z5AUNVHzJPATVqAY@nvidia.com>
X-ClientProxiedBy: YQBPR0101CA0158.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:e::31) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|PH7PR12MB7113:EE_
X-MS-Office365-Filtering-Correlation-Id: 83a5d50e-736f-4b90-8e47-08dd3a7ab7b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?f0/81J7sro0MpBZEt+fWb+LWBH7Z5t94LPB60xUzaTi0vq3skhUTtMp8DiEj?=
 =?us-ascii?Q?xqAafLE4ugWdxBTd0HPZvLZsVONMZUIO4slALBy83oMufNNxNh+zZdurc+AW?=
 =?us-ascii?Q?mB1hAW2p9m0hNawXK7p6WPfN/N8b+DoF1XwXAf8oAuXtDflOvLoSSqq+80cY?=
 =?us-ascii?Q?uRh8QipCAF6v47W2mIDA3hKt7XOEwIlWSVUuo/QtxsIumd5mntKP1yE7DPnO?=
 =?us-ascii?Q?3F4bFJzA5JfNzC7EoSs3TOwJ1fWa5BzpMbmDkrFBp33mT65E4to5p256X5IE?=
 =?us-ascii?Q?R/TqoTwkDnJcmUw8WBH2YVK/eiP3oBEGxZGiqAEqZ5QDTYlz/Y3MmE8MMTM6?=
 =?us-ascii?Q?FRKh10s1h3aIab90BnBWRKWwVjAH8q3pwRflTgyc3++KMsXp8VaXl15zfulo?=
 =?us-ascii?Q?j16Y5oOoqOmv9RcyqY3TQQIHSoi2bWpu/uElEETKlrSF8a9RUXk0AFa+KIsJ?=
 =?us-ascii?Q?6/DuKpLN5lu11qQ+BmodveUQJtX9UP7rpcOlIzx7ytEOFr1j15nUJhNUFxES?=
 =?us-ascii?Q?pez6jTg7GBd1dxZvmpeJhJr1DldUpdpJPXI7iIf8poeporV1VKqqd4P57dFQ?=
 =?us-ascii?Q?vn6ac9PIocIqWoKFo0FzrwVYBSJLDYlQe8x0obUCcU+FrljvM87dobStE8Yz?=
 =?us-ascii?Q?VGh8Yg5tOuM1jkGOlrQeTwfiqsBtV4L7PCjTIOJRUIBx8xA9Ikiq/ve0VcAf?=
 =?us-ascii?Q?F9jV935Lqg5bu1NB2FZZC9PosCK9gSqzpxrXQ2BIEVOEODiJxvhmRjQydNtQ?=
 =?us-ascii?Q?nL4mm+6SMq+PCeIfkyLRnlzKRoYpq7FODtHALQueCG9AaDHBYUGriWNJW9lm?=
 =?us-ascii?Q?KV62tTomHporSdN1KktKVIefXgegFpTZlmOnc2srPsGP6RbLokoSUz5ln23I?=
 =?us-ascii?Q?sXp8BHRe0yPE/Cgt6oBMYSkDCRlkqfQ0Oz9b8dgRr+C+5UHFi3WGqNF94uys?=
 =?us-ascii?Q?oqcp/yuEwklIhvtNxuZcx0lTHJ8rMXaj6hVuc3Y8sxVkMhQfzYbWR/+J2/z9?=
 =?us-ascii?Q?+PFWwTgOAfFOcFXDGkIEVEpf3l2UjBev0y5ksX9taKCxhj2cXiBSsHa+qJAO?=
 =?us-ascii?Q?GY+EQGM98kRl9Hed7BvMq2ctHQYJcHEVhqIvMpJTaVYO2OVvjWSWjdjPvYIV?=
 =?us-ascii?Q?LpeWuZQViPMtY1jQptD3ebkPl3Gpo+44nY6ZRINULoz/0XFjrNddpbhxYoOz?=
 =?us-ascii?Q?OigJo7aq1er9qntxPeWQz2Hs7qQNVZguHD1pPlG1ULIOnprrKLla02Bk4EBk?=
 =?us-ascii?Q?bpQvwQoOqsse21n2bfUokWpc+NuNnIIJZ7gHtESo66q55UgqYlREPg04Xd1p?=
 =?us-ascii?Q?1gkUliNgHwl1Hzaocd/ZmL0EA0hSVklFHdKjgW3+TWsITf6OuSI49IEgPTmd?=
 =?us-ascii?Q?TKXHNNnSk0fvgbNGLu2+40fNDviP?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0dzmuESVdV6mq1ofobwqr+eNv3YHslu4SPu1CjKN/wKYqtaV2Zo0Bgrntya2?=
 =?us-ascii?Q?zBgWI+lgqIVYtYjNXc8sFRstqZges1CnFhIxQkoWOsFWh8RPkpUkl9zNlE/P?=
 =?us-ascii?Q?mg/hU5xk6cdghYIpPKdZPXWUNhfMYM2BrpW0bzkEZmdoou8l2SuCz6GCT4E5?=
 =?us-ascii?Q?1rXOaB+cABZs+qDYTRzKULhKo4WdCjFfCfn/3HcA9MDs0Alro6iD/YKA1nnf?=
 =?us-ascii?Q?olYTFS151mimvnNlr8o5J8BMGJtMKMFfU/1mwSHs5HCBhIXVzxaATSBJwfHR?=
 =?us-ascii?Q?oSrGKj4dZIRpGM8kR5JL3iXFB1oyDXqzBp74Ry2ly45PaDp2KvZPxk1kaxo2?=
 =?us-ascii?Q?Ux2HO1lbOiKXZ4cM7Ia3YGIneF/zOvsMkdOI4qnKBaebbaXxYnedRFzjDcEP?=
 =?us-ascii?Q?+P4xxF14XB/iQoWjIDYJ5obfU7lCsBnwKoB/PFiM7wpPuqHrHo/2PAde1Yob?=
 =?us-ascii?Q?3pb7T7S8jX2a/TaZi0p1dEUQPfQ7SlezkE9H2pgIKzFceFoKfKWPznollSBL?=
 =?us-ascii?Q?fR/iLsAecZemfmP9W0kGYRj19UYd7TLV7JR6LQCj4wI1LmTkYB9rQnXV3K39?=
 =?us-ascii?Q?z6p4mywGp2fEJfkZXSxYrJQr/0FyRU69Euis+wdM5gI2sZE6a4ltdaqIWCcz?=
 =?us-ascii?Q?EyHw96lBtxXBbVzHbDGXd+X+qmWAn35756H4t5BH9qW0lmHGTovjhRn+bN2C?=
 =?us-ascii?Q?1BGODUOQv1/LEiOvSFD9Oj3GU4lTn5w4pE7/Vl4uwvKsLt6dFEz+VR2w9Vtn?=
 =?us-ascii?Q?eWjyymxQqnT/iIn5QmSvoXA4qSJvye8SRCDdxz3D/+A3238+zeYxlcZeOGkP?=
 =?us-ascii?Q?S5JtV4MN/TbDpV86yc6vt6Jwelzt2eW93RiF+BA8tgNX4nzat8g+Rmq2/2ej?=
 =?us-ascii?Q?nZDcBSCvP2v5OQ4HH7T15pE5s/4CZjJ0m8R2JZWG1ko89n9CYG45YMsbXivK?=
 =?us-ascii?Q?qnfTZQk1+aeK5FQzlQob6nGYcIhcWPRSoA3sg2GjysaSVx6D4NRD333uJ88k?=
 =?us-ascii?Q?rijV+md6iqHgGvrWkjufkKGvAXRT9NSDZsO/dtaI21qH0S0Pw3YyIgyr8GTW?=
 =?us-ascii?Q?0zr4r/y0R3hIA6g5IRJ1cn0mygr7kFFpWUlGEMAn5qDLK0yyC16HKixUO6r0?=
 =?us-ascii?Q?AzWr/gAfr/Hbg8dnVhalXHMxEBN0AIUOT5kBJapcBHeCOxkZIVDFHIZreJuE?=
 =?us-ascii?Q?g+JW10zsT+tKiOdvgpLLnoQ9O6ROEncbwFuVFGIeYVJY8jU8PphdGCtB7hep?=
 =?us-ascii?Q?9ZlJViWgJJ302MPaPeZUMKIrQZv9TpsPzm7AQGYxbpe9ntgaOWbES3cmj5By?=
 =?us-ascii?Q?X3eO32vCCbXhFuS15r2ZpT3do+YMULRX+T8UH9zaMZLBjKaoE/HBNIy2P/o/?=
 =?us-ascii?Q?24+zEKUdPqdemSupyqOGYbeEm1ue77/YxV9DzhqpsKvuf3hmjqO0YsLyQttY?=
 =?us-ascii?Q?RR2ueuiN/7refSdgK2mVmYD79vHDN16FxuS17V1nSUWqCoi/Y3lY14fLVO4n?=
 =?us-ascii?Q?ZxtH1ygOjDvjtn2p1lMVrg133dUfxYMEAb8rE07Z0h45RWIAOXvbSr7rqDJ/?=
 =?us-ascii?Q?5Bxm/SgzsVZVgXBVRJdA0gLtvhLZLR81SZHK4Q1X?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83a5d50e-736f-4b90-8e47-08dd3a7ab7b9
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2025 00:21:30.1585
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L9cHtTAwjsmJBc4yKjCYXh+aYuX7MiP5RNd5HCxhGm4PRFV2kxVlJMeAqnrAjKrD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_162144_577058_007CECBF 
X-CRM114-Status: GOOD (  12.88  )
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

On Tue, Jan 21, 2025 at 01:40:05PM -0800, Nicolin Chen wrote:
> > There is also the minor detail of what happens if the hypervisor HW
> > queue overflows - I don't know the answer here. It is security
> > concerning since the VM can spam DMA errors at high rate. :|
> 
> In my view, the hypervisor queue is the vHW queue for the VM, so
> it should act like a HW, which means it's up to the guest kernel
> driver that handles the high rate DMA errors..

I'm mainly wondering what happens if the single physical kernel
event queue overflows because it is DOS'd by a VM and the hypervisor
cannot drain it fast enough?

I haven't looked closely but is there some kind of rate limiting or
otherwise to mitigate DOS attacks on the shared event queue from VMs?

Jason

