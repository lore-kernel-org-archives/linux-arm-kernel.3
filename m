Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4345CC02180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 19:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D7oneJnpt7I4/OrtnRNEacoJCVZA/5RW7Euka466PaI=; b=PAPzulxbvccNf5Bazy5/zubUMQ
	bu34azmRx/7tD03aXR8OGziPsRcI+il5zY5yKaxX65Az9BZ4v+EpY29LsAtAO66qOTbRFCLT2ZVzg
	RgUCE37GQ6uPZkxEA69PlPSxe9WCYqCmSI4C+Zb6hZDjKOJLdMvRnS+NUKJusft9UOq1Ld+m4RgU6
	sdK+R/brGecAYM173Oo8ntKVAnmeVMxpXhXzUUzeIDS6R8n7upWNi+m+EppA49lgp1cOQiQ1zpzYl
	w7RHCxBfd67BrC6lOeWSLBooONb1mXoeFuNEYWUESIYz8T7Bl93jKJqIfo23uJWBNp903z52rSOM+
	juAX1qRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXPr8-00000006Kjo-2dmI;
	Mon, 13 Jan 2025 19:12:10 +0000
Received: from mail-sn1nam02on20611.outbound.protection.outlook.com ([2a01:111:f403:2406::611] helo=NAM02-SN1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXPpt-00000006KUu-0NwS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 19:10:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yoYorU5lYAzNZbALKAceqGVGU0I4zupOrU/L/xjqxl/V4X1+9HNuEoiLxotrudidwpJ7jOobByQAP2m5Ff7hW+wa8I70oGJcD+Rose5eTjDqYq8qE4G2XCFZfp1KbMG81cWnsoczZhA87espMCM6zZkefSOQAA1E/Mrvbojggv6dhYUftUjx5YcTRr92jZok+YoaFh/zGkYErPnqplIzZi6ldWhqjlhY2loRfwfqrl7cz0f6IBXXb+8rZ/Jv1zrzDpWREp2gVh3OreXLnpIfrCs2YcghzDgTSZvjxOhf1KMc8xcw5QeFCKcS2fyX4dkLFopL/XIJCSAt/kc0MO1Jjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D7oneJnpt7I4/OrtnRNEacoJCVZA/5RW7Euka466PaI=;
 b=agLOt3e5zKUb2vDMk2ouw2brZwuBTAzRTC0ibPyPr56k5pdjCSwmflRQ0g1cmxL4+Uzs0+5BMvkfTa4q0pKZ33sDWncQJVqAsjfxFTV0wxrbrcwALp+BK5P27zAYa9gQAAlAW6CgNx5T5jKw64YlQ4jcDnK96aBuCc6i1PWxRaKgn1HZlPig6gszhYN2rIbvHEJf6EFtm+jBmXuQqW0JU0Z9L9sNhwJTJ73VfrykR6zOowXKkjOjCnfBuL3pqzmdnAPFaSRkghUJYQ47srwtMe3UuDBZ2nXVd5TixrEoGn2wXvZTMQbi53UIh3fjRClx9CsRDdqmFB1gpOD9o4orfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D7oneJnpt7I4/OrtnRNEacoJCVZA/5RW7Euka466PaI=;
 b=bdgNnYHGgAAeCMo4KyXF0fiiu31TVxYv17xiqdOyhX0D958ExyoFEDfaHABkdEfk4294F/yef7+yeLWlke4TFYYdRNQe7fXcVBNIY9RZG8qcg1hKogK03OmZgZCBabgI1Z1rrWxOosIhSnekcvKUloFSHn4rZ+ScN5absaRSQr+POabpvGVyQAaznThEqktT2e4xJ/UpFC5S7XPHOA0FWBS2D7RXJTaK/AZ0GlFtu9lGuNDxUUHwydH36qkE62T+K/uD4RaiVWxGI/BnvJMBvyl3RP8KMdelJGxp6xPb34pq1mVIggcxOQgpmFoV6QY8AynA+WbapOFI39JG38ePxQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by DS0PR12MB7898.namprd12.prod.outlook.com (2603:10b6:8:14c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.16; Mon, 13 Jan
 2025 19:10:48 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%5]) with mapi id 15.20.8314.022; Mon, 13 Jan 2025
 19:10:48 +0000
Date: Mon, 13 Jan 2025 15:10:46 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: "Tian, Kevin" <kevin.tian@intel.com>, "corbet@lwn.net" <corbet@lwn.net>,
	"will@kernel.org" <will@kernel.org>,
	"joro@8bytes.org" <joro@8bytes.org>,
	"suravee.suthikulpanit@amd.com" <suravee.suthikulpanit@amd.com>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>,
	"dwmw2@infradead.org" <dwmw2@infradead.org>,
	"baolu.lu@linux.intel.com" <baolu.lu@linux.intel.com>,
	"shuah@kernel.org" <shuah@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"eric.auger@redhat.com" <eric.auger@redhat.com>,
	"jean-philippe@linaro.org" <jean-philippe@linaro.org>,
	"mdf@kernel.org" <mdf@kernel.org>,
	"mshavit@google.com" <mshavit@google.com>,
	"shameerali.kolothum.thodi@huawei.com" <shameerali.kolothum.thodi@huawei.com>,
	"smostafa@google.com" <smostafa@google.com>,
	"ddutile@redhat.com" <ddutile@redhat.com>,
	"Liu, Yi L" <yi.l.liu@intel.com>,
	"patches@lists.linux.dev" <patches@lists.linux.dev>
Subject: Re: [PATCH v5 06/14] iommufd: Add IOMMUFD_OBJ_VEVENTQ and
 IOMMUFD_CMD_VEVENTQ_ALLOC
Message-ID: <20250113191046.GR5556@nvidia.com>
References: <cover.1736237481.git.nicolinc@nvidia.com>
 <86e78625c48d0c8fb815496dbc57708b98a46ec7.1736237481.git.nicolinc@nvidia.com>
 <BN9PR11MB52768B2EA84EDEFFB04662598C1C2@BN9PR11MB5276.namprd11.prod.outlook.com>
 <Z4GRMEjAIoBjHnMe@Asurada-Nvidia>
 <BN9PR11MB5276AAC06F5B90D09923677F8C1F2@BN9PR11MB5276.namprd11.prod.outlook.com>
 <Z4SbzRB8/me4kbDF@Asurada-Nvidia>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z4SbzRB8/me4kbDF@Asurada-Nvidia>
X-ClientProxiedBy: BN9PR03CA0593.namprd03.prod.outlook.com
 (2603:10b6:408:10d::28) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|DS0PR12MB7898:EE_
X-MS-Office365-Filtering-Correlation-Id: 0668ce42-440f-416c-f3cb-08dd3405fd04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YklopkfLvhwdhjEvAT+reIB9Ni2TwJzjDmofVW1rZK0plvN7enuk9yzJvG66?=
 =?us-ascii?Q?Hy6Z2sOqvY1UezrlYk7BJC78z7QbSRnFCrUnj32SEi0TdvCXe2w/CWrEaC0Y?=
 =?us-ascii?Q?AXE2ooq7qRmJLVMmlsnsOc0+SPiC1vLwpLXNJ1Kni+3O367vqcFHrHl8GmSB?=
 =?us-ascii?Q?9EUHb+aH1dTBV6yNswnkpsLkM4K/IEW9VY9N5/Y8jG1B6L4q70hqbPPy+pVg?=
 =?us-ascii?Q?zAMqf5hVDhozoTVZGe56/71afIDObM6ypO2z9rFopqO2F5eyj9JooQIVs8Jm?=
 =?us-ascii?Q?8gZVzo7CK6wxIKJCkaID63W/2XAPaSugw6ZSrgIcwkJncPaTwA1s96bNYTAM?=
 =?us-ascii?Q?3MYtgh1ZkRNLQ08D9IKn5ZxgCFCVkDxrHhCGHv8hRh9JGSYUiENFx193yN3H?=
 =?us-ascii?Q?gI/EuAYoxQmT2w3HfwsV2nyUCDyR1V+O5jRAfdZ2BpBs0iEVNdy42A/E0oOH?=
 =?us-ascii?Q?EqGW6KsOtWaJaCXrpgdAvIi2i5aWTr2Uq/m5hjDsCy+x7zXcsYLDHPQlGyl8?=
 =?us-ascii?Q?rA4Kumf85itcs4Q3Wn0udw2fbCbdEwIRACjTl9M1KP4IZ9R5syijMIcwHk8Y?=
 =?us-ascii?Q?VYoRqe72HNEeaQeM6Vk8yv2GJ4CAVzUnQV3bR+9LAE1Hiuf6Er/dnAsG5JgJ?=
 =?us-ascii?Q?lkrWInRrGOvQzMPw+4vnQAu9UxddZRrHEGyT7rSk6ZAsIJkUSxnwQTy3Bw2M?=
 =?us-ascii?Q?xilO4BZkLFraOILIu8qtu0GbAjlxK6UE4oEqCtck2mdzQiHLP424xIN1LoN3?=
 =?us-ascii?Q?1G0WTu1COwIfci1w5wLBT5W/ZmIstB8STb7Zp1mkolVf1+IzN6+OKNkafKDO?=
 =?us-ascii?Q?d5X2z5bHeMF2W01kFE9k1GKrpA9BD9NbpcPSbIUIP/KGP+BW9aUjGfMUf9XR?=
 =?us-ascii?Q?JSUzD0miQdoARYVNKtx+LwXGsuXpTcV4yUxZpL+jIXbwS9MqQzEIXuzGZ4CF?=
 =?us-ascii?Q?H9F/cNnu+wJnuMAop4NXoXZRJlJQP87EB/Yatl/HNC05U0jzOl8K2e7HP3mq?=
 =?us-ascii?Q?5xo0l1ugf5+rDBJTAcuAyH/Htf4iX14nJ9y+qIl2DfNxhaqLTZGvjNbNGI8u?=
 =?us-ascii?Q?VsneII9MY3D/ltNX+4rbSLdUTQzwx7ix5A7komH0VO5a4DbolU3+ooTMm13q?=
 =?us-ascii?Q?OslSCVZ33U3ZB5AoDVsIRh0Zk9BsgdW/V9um86QIvfRTtsLtv9IIKYjGsqV5?=
 =?us-ascii?Q?bs0nZCQO2nGUDf2Skaxe/YcQDvjL/T0j3Dg2BG3v4DkF82f+492X9lGndsx4?=
 =?us-ascii?Q?5apTX64klQSZEzQ6yQ5RnwgZumK4DbVY5SkgIlJ+O7IxqmuwYo82uosF4HUe?=
 =?us-ascii?Q?CNRzbkc+pniaTjcJOVNwKfdWG4RfRRHBWf8lrfcP6SLlWyekMUw54NJe4mKF?=
 =?us-ascii?Q?xMX2gZGvsaV368a+k9PbOV7TJzRE?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?d5UsSbMjOqFAfP2A9xNRpxdNICxdoArqnqWYv62bxt+rPhfbd8Y76elB7BCX?=
 =?us-ascii?Q?6ddweLuN48RkaaDmUpzvoXySYRm4/MrFWOG4Dl2HZhSlfrHKCUiZ4vpyeRTk?=
 =?us-ascii?Q?yzeqKjp06JP3zDCfBd4UleJV1kb1f3RKdDTCwgLlgwaMmzXuSbEfdZBnJhjI?=
 =?us-ascii?Q?BhRxHWKIg6lfyVNjxCYPULLBzUXsVEG7wV1NvwTklxeOLaQvrGUKndr63HXo?=
 =?us-ascii?Q?pVPXXsj9f5bJbYKSYr4WngQZO/Rz2c4PjDs9wuJ+NHWW6m7sxKVmh4LY02xT?=
 =?us-ascii?Q?0/Vpt37S1qHzrvJwVE7w2sAevmg5Ko8SoOjJRrPq+kxhViNiJBIK/7Le2xW3?=
 =?us-ascii?Q?NpinvKMzMXdv8OF9AqrolcYhGvkB8B9Vj6/pVVcALELwF9xLK9tHCVgxUMjV?=
 =?us-ascii?Q?Dt9pjXW4doLLLQ9Z0lTLrupMTzlrUvSCpZN0Pwy5Tm9RdzGuIGDid7kcCaXr?=
 =?us-ascii?Q?4O9V0xjfsiKDzzLSB3HuSvFfJ5GeGhHEiopk11crB0k3+iG0Qs2522zNeHkR?=
 =?us-ascii?Q?IL1qWa4eyWJxgTymvbkxF8ytgTSXlZw6YJubvU5wsfkfrOmGJFu2KCpCvTbp?=
 =?us-ascii?Q?d9KtirNquzf9u/lBVxY6TK4zqFdQyAcMb9O2KBOyYVmYHurYAWOt9PT2o9Fz?=
 =?us-ascii?Q?2gA1qwMBjE0qHj+LB+Wwe/7Vpf0n/5OZ/V1rwWwVcNWHhIPYcUwK+2lbxnjc?=
 =?us-ascii?Q?G12gg/luLCRd0RPPbcTLRM9hGsBSWjile7x+S7FrrsX+GjSIUOO2PyH68Ojf?=
 =?us-ascii?Q?/bcnlnNyFQ8wIYdMOcUe9uPE6OeYZL35obERWtxElgMJSprIu+bBdWfdx6sg?=
 =?us-ascii?Q?ZAGkVCwf3cV64zItH6aWiCyXOlx19vAI60TMY5evSCNE5qQg9yX+EX4F8TT1?=
 =?us-ascii?Q?+aSO4Ft7ZXTB7I/oHRLsVYpsIX+DG/gFu1q1YFvpofjLG1dGtZGN2kPzYo0r?=
 =?us-ascii?Q?mKGxMJck5ipUXWxg8Nssq1cO+/qBn6VduSRpHOYrA9LNWP93qAfg3TY0xZaT?=
 =?us-ascii?Q?7uxbZ+wcC74JX/EnSfWolvK2MSWxjDXmQwSYIzzjE2lZ1upNeZx02zg4Eepm?=
 =?us-ascii?Q?eBqLHMWtRxKcSkXQ9HAKXwXol3UZ4ilsKBP+14r03wblOIXi8xauTlaT0yGI?=
 =?us-ascii?Q?8hLW7YVKlVoat8dnSvx2LcT6JvZ8NqQ2b1kG/9Fva9tiPWxrhkduqTfnutKE?=
 =?us-ascii?Q?HVoHhYkUurebuUOCTJv/s1G179/gR8QK6CxMB9nZ2Vsv4BMngxxQS0CfCy87?=
 =?us-ascii?Q?CGkJCbmYUi1RXBz876ZbXwjJs/kZ2dAjfFAWOtjDTua+qLrQZ+/4snaX8YEF?=
 =?us-ascii?Q?PovpucDBSjkeqdJ+z91NwuYxjcsm+wHhS7iC6MMxTi4YhaGkgwinwIPkl7dB?=
 =?us-ascii?Q?MYZp7AzLooVkrOYUUDRvzYFuraGF/G0kOpkeWMZcjnh4VcWklOMsI/e80oc/?=
 =?us-ascii?Q?L5OOzgYMzvsIzAMyrdmhqwNO738+fWcOVlBbEl3C/fpMyL/GNGUM4OO8Ax26?=
 =?us-ascii?Q?Fu6BSdcg85jZKoZ4Cd9YGhmAh8LJpsvWUV5przBArMXvEknlMr+iPLvVjw2W?=
 =?us-ascii?Q?mANS3DmaWQByLkB/Lr3fXCZX7W43AHBo4WmAzsYz?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0668ce42-440f-416c-f3cb-08dd3405fd04
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 19:10:48.2325
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pYyQVp4XRY1sKSn/Hk8VVRbBNpUf37fCKK9lCgw7BrdxNwJLqYfm/GjKdji77ops
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7898
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_111053_127210_4BA7917F 
X-CRM114-Status: UNSURE (   8.73  )
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

On Sun, Jan 12, 2025 at 08:51:25PM -0800, Nicolin Chen wrote:

> We will still have the fault queue:
> 	if (error is handled by PRI)
> 		report via fault queue; // need response

This is an important point, we can't generate a response for the PRI
unless the fault queue is used, so even though the vEVENTQ could carry
the PRI event, it must not be done. If there is no fault handle
available the kernel must NAK the PRI event internally, never send it
to the vEVENTQ.

Jason

