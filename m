Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3309C02182
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 13:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mj8hJKHE+y1HExsdI/CbQ3k1Wf5zm66b5t2WYP4Ehfg=; b=tvMgXRoQffRhuMCobggoZxWkWO
	NLZFZaAYlCBW2h2mL+kTW8O2F+quS7cqcaM7WPgH2tHBBjSWR9+ywpTuh7vH6X7vWb3zxTHhGtEDY
	UcmPVieHDtUkzS7xl3B4OBx+XWycbZ09vhRLEzqHnGegC1X/l4PAZ04PEUKAvSxcSRT+/+/L9utTL
	1AobhfqdvJus+uL63csctXHc3A2d9WJ5yZGUPhXOjdGKxuy4jFObG7dmGPvzizBtRXiQSj7sGzA9j
	zjmp72frcTUubhloGcCFnjXK8Yh9hRNij/1Hv9ZJALxD6bH0gEpeJtcN4FhzWKCdbVwaMhGqpSQLP
	Ghu0C4Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taxW9-0000000CYAk-3Ddu;
	Thu, 23 Jan 2025 13:45:09 +0000
Received: from mail-dm6nam11on2062c.outbound.protection.outlook.com ([2a01:111:f403:2415::62c] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taxUq-0000000CY01-2C4l
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jan 2025 13:43:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=twKhLd5hOzZ42LSs16XQDjdoDqHEfxBb2TxOSdCVARmehlPo8eMwug1LKqStvWP+n0/olAw322+PwG4MASBoNRKUI3n+LPrpCv8HvBmmSd2nEfmYmTxaHQWk1L7WOdpQY943hY7LR3UrCQRyE4tJkG8LHsn6DTNmyKm3ywfV7Irr7at61DWOOLrT7AqwXXRrQUtBkp7/qN9h3XG/6vvVFV+VbPl7ZnfAljsahaaA3wPoH0SXi/zVUzNZgL3Sj19xDPEFn1ZzXh6oTRpoKqttfkrp22NLm7Ve/gvF3hVWO+amnf0iyWrARht4bE4GSxObLZiosVdD94/BEHO+6JzKyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mj8hJKHE+y1HExsdI/CbQ3k1Wf5zm66b5t2WYP4Ehfg=;
 b=adx3W/jSDT23q4+yFPIcuqdFykA4KLH8mODe3SJ4tg/d5O3XrA2hhZZ7Gw1QNqr164xVnNZ0OCNLEAMqeITO0nNDfFkDxMUuCCHxGtkCvxmDPWZb5AY3zeGzYLJEQS2553vV/3Ea5e8buBAoXOSNJRarPchEH7PsG2jDb/dAuMHornA78dtFK0w2MmtseFxyBBLMYzNKneb8BSOL+x2/PqojiZQUPlALJQCp7CmZy12LNK5KMqnB79kmZwCf3Cgdgx1Pd1+4/kp0WROwU+/kzCgQ7XeNOruVvW3rXPtpylsV+fqHqE0w9aN1mXLy17e2i1DXQHXju3U7wHoDxgP24Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mj8hJKHE+y1HExsdI/CbQ3k1Wf5zm66b5t2WYP4Ehfg=;
 b=IMOZVvY1bW0FWtCRQqHjWCqwDku0C4UYH1zUjp4NyIbSNPECvs+MQ7YNtv4aNUVPWUTupnaf6FLIp/BI2jBoulmAbg+pfsMeomug3ZzK26e9/Oz5vLHFc8Uipx/s76ykosgQjLF3sXbW/YjXpnCUGVi3tzccak5Eoqu+42fRZ2+g3NOKMdekrFQOouOBpVqkoR/7qimaamQWKsExKuHyBh926CbJajpCtH5+QnHEBg3CoehVPsxO6mzyVEfb/w4x49Wi7kHLutZz4RKSMjJ/fZPJBhXje05nKjEAA1opUykhqtUhdvJVAaOWLmgPX+ZZJrA/PgHVVldbJEMG/JFthA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by SN7PR12MB7252.namprd12.prod.outlook.com (2603:10b6:806:2ac::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.20; Thu, 23 Jan
 2025 13:43:44 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%5]) with mapi id 15.20.8356.010; Thu, 23 Jan 2025
 13:43:43 +0000
Date: Thu, 23 Jan 2025 09:43:42 -0400
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
Message-ID: <20250123134342.GP5556@nvidia.com>
References: <Z463eXfgNArCOfPn@nvidia.com>
 <20250121183611.GY5556@nvidia.com>
 <Z4/7pGx6F1mpAUuV@nvidia.com>
 <20250121200924.GZ5556@nvidia.com>
 <Z5ALWFVTOSC/8+ji@nvidia.com>
 <20250121211404.GB5556@nvidia.com>
 <Z5AUNVHzJPATVqAY@nvidia.com>
 <Z5Cmvfp4JW9vmMTP@nvidia.com>
 <Z5Eywl1o9pdYyuQO@nvidia.com>
 <Z5Hpo+Q6gcwc0+r6@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z5Hpo+Q6gcwc0+r6@nvidia.com>
X-ClientProxiedBy: BN9PR03CA0576.namprd03.prod.outlook.com
 (2603:10b6:408:10d::11) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|SN7PR12MB7252:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c9c7cd5-51ca-46ab-fb46-08dd3bb3f41f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5Aj5ABV1HL8Ha1svOMhKpA6Hjlb+m8ZJZ4Blqpit0rpuTxIdVj8+f8fGIv5m?=
 =?us-ascii?Q?V8aReQJjaINlYAjuAsMEEVnX2y0F1Uv7z8lIle6RFxd+BbYA1YiviF9AVlUd?=
 =?us-ascii?Q?Yt79o5DFYbO8VXNxCK8om4SDMRneLyZe2rplR9yzkEu8GMS2fDkTjBe9i7OS?=
 =?us-ascii?Q?sYh1LnQITvgAHX3ywVo+pxmTxQS1+pqcBS0I6E2qriOiySVRxnJG8RB08K93?=
 =?us-ascii?Q?qyjg1W927hurgq//j9T128RQXD3gP0HkthY434zucmpAsjYAm0W78MaolDzY?=
 =?us-ascii?Q?4FLcIsrrfF9tFqcZ4nquTGvyFIZ3TRmnKsyWJVGAb6sluF/cTHDIEbl6zFHm?=
 =?us-ascii?Q?6yViFgp+bIe+64ei/uHT7QAL+uqvjmqYM4GeshSr+65TIuwmId8eT0b7Rd8p?=
 =?us-ascii?Q?Yl4F7dSV/iores73WmsOfhGasK0LKELl3xteuJ7jEWHwSIktdZRScNC+/TEC?=
 =?us-ascii?Q?r3k4rerscHTbXBd5eKGMgdMVQ/rPckKETqUcu+LdDxmsO31XhGf0tDZRi8v9?=
 =?us-ascii?Q?y+cNm0EXUYMqiMrEYG8xvRTj51vPBkvqBSw53zx9VYzagg1tE+Q/jfZsCKDJ?=
 =?us-ascii?Q?c+vt7tWxe31twr+okSvkw/9oJuOoeRVx6ELzILfAZ2C1L6y/KHpVh4lEacWp?=
 =?us-ascii?Q?VRqdBs9ja8jjWe7bQuvsPCCYMcH64ca4M6Mu64w/DsaBF4aSUpjaLMIfRZAP?=
 =?us-ascii?Q?K7uL2UpTtEOO42dqSopEsZUZ3cvV30xXFD0LvJ/lIkomtII1wrSwQNQvwEi0?=
 =?us-ascii?Q?RtS4Xz5+nHntb9eP7jpKvSo0nNYt06jp0yc1Ak9dfNr/ImpoN54d+5Lkt5Gu?=
 =?us-ascii?Q?mR/yiv363ABcUrNiLVzYkEbnhagwpgP5kSHBSRdHIjvy2Ll63d2Mr2ycfwfb?=
 =?us-ascii?Q?Z2P0e5gIutvijgfzKLQeXtT6sMKFgN8plS6tDyddLtkeMulpFzYw+c4IkcAo?=
 =?us-ascii?Q?gTG/wy0BTF2SeY/CTO4GxsRUZOZN+2oDQTgWwDTod8dMJ4k09UxxgP2iUYYc?=
 =?us-ascii?Q?FtGIuICqnUSwC9BNdQo92VI9v8HmL8U0DUWmXXA4QepQkyCV3YCi9PoEUtW6?=
 =?us-ascii?Q?g9gJPi6CNP8y4MG1BWQcSj26MyERFDPc9fMkXe3cHbIai/R/Owd/sS35kZ8p?=
 =?us-ascii?Q?M5F98DgLFNkPSQ60EvRI9O1YJy5CJGGze5PUPo0GXrR4WJyfs5/oklypiE1A?=
 =?us-ascii?Q?HAocfqpWvDBC+vg4Oe7nGhRnQXyQaPCrePwku5OTKnqluNNSiRx75/FW2/eu?=
 =?us-ascii?Q?GKx5xSBQd9QvfN8BiCqDxa6ZqU9ibyCPXubMdS14PQOdGHcwJyaHc7Lq/hl8?=
 =?us-ascii?Q?51/SGB1y0dlv2NtihvgD1Ebx3IWvSGOgLw1Shgb21dhkzyfEbshSOuW7ZBB7?=
 =?us-ascii?Q?Y0uK4zaOV9IJeKERwHox/Oy1+ryU?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BP1g8Bz1sXjzlFdoU6e6KmMJT6mbs5U9+iq7iUc8cURQ9FA+/8nrOnWQBXdu?=
 =?us-ascii?Q?JiNrWlvudgFcwAg2lGy+GPV4PijosWFy5iVZ8hNtaCvXoe5GqZanvEh2vE/0?=
 =?us-ascii?Q?/VRkNXiEKSrRyGFJ0CPmAyKLPtTz3Qnyk51KNcuyDwiyYKSCePS4a0bJTyO7?=
 =?us-ascii?Q?P/LRx+X/tgvXoVpV+/+1z53W4MMk+BzzOITwP0qCpGPwiRNjW4QneoHLLCDI?=
 =?us-ascii?Q?j9F3azPZoIdbhSfVwrJmtpUaIIJWWrPpJVICjVlC6UgXb4TWJjGS5E7B6d3N?=
 =?us-ascii?Q?3RVN7jt4vY6xIBMuXCegXM10wt4pND5dUYR6IdXiDZjaw/+jTu+JiXQwQBWT?=
 =?us-ascii?Q?y+6Sa94kag2+sZ6pu6jcJCQDhD7ufaEUIM5E6pNUlCxSn3JS17LR79qKEnjT?=
 =?us-ascii?Q?VjiC+aFLHcAmafqR3fdkqF7CnIGwNoFuaVhHyflPhT/NsL62iwC6ckdu+rQR?=
 =?us-ascii?Q?TYyPGNUGIfLebGFHBeD+/jukNMxRZhVa1LflVOtRn1O8gAkYPN3cUxCVxVMB?=
 =?us-ascii?Q?vB4g5q3y1D9nhnsjou4kqkGou/lnR2Csuq5QcqMRaVfF1etVKr0mpDwMT/hj?=
 =?us-ascii?Q?vjrFMMjeEOE8eOMyfBYNSuStD6ZRjRu11qnV7ZI609mPV7CZ8rhEQvjrEaSi?=
 =?us-ascii?Q?MQu1e3qFsh/TOdxo+5KN/07672FkQ8XqM6ZR4ZcyZiSSb0E1x34s9vh3BzBE?=
 =?us-ascii?Q?9d8ZeW3K5Xnm261CasWWliA3WJaIVgv4FIElNoutjYyYwX3DtTQjuQyHn2Fb?=
 =?us-ascii?Q?eYASkK45E8/zxaeL4a6F8e73KPzT9wlWwU2YD70vWQ0rSKMlLMN5UfCUL9E2?=
 =?us-ascii?Q?QlryiyM4IiePyu5MIiNQLextTzuZNKCgbpPkACt3QKi7eS3xtSRdfcLc+Rak?=
 =?us-ascii?Q?62UzeES43ONRIxzfkKDhZnBvjqcsxe0XAmSDAHmZ0R9s/03FBBSmALEQX9qg?=
 =?us-ascii?Q?2tbw1qJIX94GVum+HP9VnlNBp9V7o60Uj+7VPj1Vg8zbhuz4HvVbqQQlAhu/?=
 =?us-ascii?Q?d4nG/Nb5IYH4J5yeSqcVKBqjugsZn6OvfQ56adY9d3gvtB8WAtfzWcPmpShz?=
 =?us-ascii?Q?bPAwsFYVowHBYKv8iX82yQA+weI5iyFP8ZHOvec7hcTjHgoDoBC07q3g27yg?=
 =?us-ascii?Q?Be6MSQSZf6rpqlJRGL5OwfLEu3DleZgWo+lqjTnhodMnX9eajzdfh8MFOFqh?=
 =?us-ascii?Q?27YrNLq7GtKJXdLPTKoz+FX9eY5iWsGVzCvEMNO6bwLV1noWl1/AWsxMQp2K?=
 =?us-ascii?Q?eWfACV8LxS9kpS3uQ/XJiwikAWvZQpTIhvCFtDtXt7Q3S6TN0iayHfz6prN2?=
 =?us-ascii?Q?iwURDRc+Zqvz3sxjvZpaNbbazt/TWJjczPo7QtnlCAX4giEnt2byg/jCMpYn?=
 =?us-ascii?Q?pIZwcFcxjQmGsb8pI13hG76t0tmZGLewDlptm5jPOrBuqmubw3hW9CAUfiQF?=
 =?us-ascii?Q?HMo9lztFtYTPBOX+XA5hVwdErnnRmDAFXO4XM1Byn20P/+IWABq90igIyCX8?=
 =?us-ascii?Q?LbHzaxUswln8eZZHJP1Ri35p+9FZifwGPPYraRwM8H2y5RCgNpqetQKnYZzm?=
 =?us-ascii?Q?D5Osz8nxDoiEy3sKP50=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c9c7cd5-51ca-46ab-fb46-08dd3bb3f41f
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2025 13:43:43.8704
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DaSxrAtxTVCeVk6xs/9EMcFOC84Tu69h/dKpZ58rNVpAaJeGNlCDubXxeGsjDTEr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7252
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_054348_555781_A00DC903 
X-CRM114-Status: UNSURE (   8.08  )
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

On Wed, Jan 22, 2025 at 11:02:59PM -0800, Nicolin Chen wrote:

> I made a change to duplicate the overflow node in the fetch() that
> is protected by the spinlock, which is used for copy_to_user. Then
> the other routine for vEVENT reporting, protected by the spinlock,
> can race-freely update the preallocated overflow node.

That seems like the right answer, copy the few bytes you need on
the stack under the spinlock.

Jason

