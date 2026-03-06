Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB617FCC062
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 19:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V6eXy/hndPDYnIzd3PKHnJ7e/M513SGL5N6TEtGXG/s=; b=P7LNDc1MQ9wtJeYpjrWlts76GD
	E3b5bEp14MJatwxvQ1nLmVXGi2h3TBN6wM4nOXfzYpILVoZcqS7Hsq1Gyg6SixHUsrxNdyVN0161M
	j1B2/JeAyIXPSGm22mYG10Hm7PsrJFZq9MQloGGhii4nVprL+vSmAE3kCd/MOEaFvfmXSCQlLRjzM
	N/4rPq8VcsilsAl5vapDc1BXFtPCthp/0tu4fgAcy+ZbDpFy1wPji+J7bRsj434JScUr2BO4L/pfF
	lvI4p0Sz2zn+9xGaoJ/6qZdrNKVegU5C6k/cuj9BEOKlKopDw0zAwe3Roz2T6sARNLoXWfKlDYm05
	8dJi/GxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyb1Z-00000004Pej-35KB;
	Fri, 06 Mar 2026 19:39:49 +0000
Received: from mail-northcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c105::7] helo=CH4PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyb1U-00000004Pdz-0IDI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 19:39:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UmlGxg8NDbNbKpoOisEOjPXtoZ50tqtqMOaAwPHUsBtvqgCVSXRy/5q+Mcgf+VBcI/L8LAWo8Ww7h1Tqo2Al4gUO60h8ddjzgzF7jf66fHL7y7YA2wWpV795ErGQgwvlBXoc/FLq2zuu5TGg57bMT8zjE2AilnlmHngDuYLs5cPf7dFNC12Rpcb3vO6sFOpyVLHR2bWxe+ayw2fskN5fltug6RjlQ0U05hK1NB3k/s6W59ky075GRyXs9ZMpHj86+hzkhGaQaaZAl4KrUnmPogbwmCrLJ6N8PxkjfrsCG76G4hUvjzcvYWdkpOPkuJpu2tP5c6A2tAj5yDQJ5BnnlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V6eXy/hndPDYnIzd3PKHnJ7e/M513SGL5N6TEtGXG/s=;
 b=HJhwoGNHjuAXnYKJMvE++9NoxuJQdr2E9WE6cE+uxiS5gdRZHN1rPXRv4vNLmRrAVQilU+VCYMXp0ZBGGLVubRekLzIbKPlcN0oXxXUySlNLEKlfAQIWHp+4oA6vCdioTlM+C4aPU61bpjswRGRhSTaE1OJE4PG8QY/k8EKvp+/AsSbQprs4WKQbvA1TPMw9L7AX+4l4tBBl5fexJYUzljcObRZjdPZ0PAf99z9eBrqUUg+z9tLKxF8RdL/v/oM8Atgi5wvrd60MYcV3j3t5u8byIYf0BFml4BzDJpVFNDQIwEDfBYzyoui+k2/zDvT5t9sgxuvJzReFpPE8qwkzcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V6eXy/hndPDYnIzd3PKHnJ7e/M513SGL5N6TEtGXG/s=;
 b=QsFtPdMW+zZG/hlF6nMxjMNiH90jOS5zdUS8anRC7U8fo8ItvnpO2i9jxk6jS2LNKGhzfR7If7Zf18g7jnAee1XhBzgDzatXRctqk+Kd1ioAZu0JgGEu6GTXen4UThhqiN48p8O85FjyEFyVa/wD+Sv21MLzm45yueNYPfcUYc3PAJ3EftdI5dcvvh0EJJOeT70o4FqsilqWcUsXlqgtVe2c+4I26Pl8IfZJhp1Lazb5Vj1wgPD+izL25pzQqo87YuPLSgVYjSSgx4+CAIuxeRFxUQrES3CvXtzYtAHA+x87G32kRqF2zYgmEd2TGNYdmg97BoKwkFiVFLH+1HtGOQ==
Received: from PH8PR02CA0037.namprd02.prod.outlook.com (2603:10b6:510:2da::35)
 by LV9PR12MB9757.namprd12.prod.outlook.com (2603:10b6:408:2ed::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Fri, 6 Mar
 2026 19:39:36 +0000
Received: from SJ1PEPF000023DA.namprd21.prod.outlook.com
 (2603:10b6:510:2da:cafe::53) by PH8PR02CA0037.outlook.office365.com
 (2603:10b6:510:2da::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.19 via Frontend Transport; Fri,
 6 Mar 2026 19:39:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ1PEPF000023DA.mail.protection.outlook.com (10.167.244.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.0 via Frontend Transport; Fri, 6 Mar 2026 19:39:34 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 6 Mar
 2026 11:39:12 -0800
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 6 Mar
 2026 11:39:12 -0800
Received: from Asurada-Nvidia (10.127.8.10) by mail.nvidia.com (10.129.68.6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 6 Mar 2026 11:39:11 -0800
Date: Fri, 6 Mar 2026 11:39:09 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: <will@kernel.org>, <robin.murphy@arm.com>, <joro@8bytes.org>,
	<bhelgaas@google.com>, <rafael@kernel.org>, <lenb@kernel.org>,
	<praan@google.com>, <kees@kernel.org>, <baolu.lu@linux.intel.com>,
	<smostafa@google.com>, <Alexander.Grest@microsoft.com>,
	<kevin.tian@intel.com>, <miko.lenczewski@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <linux-acpi@vger.kernel.org>,
	<linux-pci@vger.kernel.org>, <vsethi@nvidia.com>
Subject: Re: [PATCH v1 2/2] iommu/arm-smmu-v3: Recover ATC invalidate timeouts
Message-ID: <aastXbRlJ+SNdush@Asurada-Nvidia>
References: <ca7ab934bf0f433b62a5c15d42241632c4cb9366.1772686998.git.nicolinc@nvidia.com>
 <20260305153911.GT972761@nvidia.com>
 <aanygWWZLA1htDdQ@Asurada-Nvidia>
 <20260305234158.GB1651202@nvidia.com>
 <aaot8uRsli5jNPzH@Asurada-Nvidia>
 <20260306013347.GD1651202@nvidia.com>
 <aapgyXadT1TEz29u@Asurada-Nvidia>
 <20260306130202.GG1651202@nvidia.com>
 <aaspAx9NiXmtRg11@Asurada-Nvidia>
 <20260306192211.GK1651202@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260306192211.GK1651202@nvidia.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023DA:EE_|LV9PR12MB9757:EE_
X-MS-Office365-Filtering-Correlation-Id: 8157cb26-a924-46bc-b69a-08de7bb818a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|7416014|376014|36860700016;
X-Microsoft-Antispam-Message-Info: 91ie2tFjYUNTnyuwM9YRO9UogG+8HQarO00kO/bHjXYIU6/ZUXzGIRlztlb7S+oOkmi6OQIRcgYy9h3uu3i+RIyHHQG8EJEFP01AQi8CfM7kfNTZt3u5Gw/xgkUTJUY4rctfAC0sWYF50RWVaZupoXB6Z6sALguRasrUkhGSs7gsuIUEo+9ahiTo2JrHwjrpvanQLpJYlkzB8L+Y8VJ9WAWglNZxKB9iWRglR/yIP0HkmqHn96V6U0ssZv3BSn3iTrU1jeGNsjl0Duak6Gdv8cvATiakVEPTgy+hRg8WQjt0aKoVkekslQD1QSHGYbc8AjIeUbcKgkGjU1uiUKmWBQAzeuIbOxtW+qvfYav3x+Hc66fTIDWNSprnrz7YIXFSaaH+Kry/fjQXAcaYyqYVuji/pRy2F3Y2WyM7kEZh0I3CKy8C4/DZTSC9CaHO3VwziTLdmVc9MRURwqFW/M6uAEiXOw8gvk7akJ3gDd6VL+5Pk0rbU51klAVI4lH2mJEnM+1sFBKUhvH0ZSGWvgKuh0SqkfecU0PuACZVSm5zr1JjhwQj0rtQ7Cx989unZ7Df8ST+utMgu/lyihqXw4mUTr51hKm3pTXMchAVXT6JqVDfJp1CDVwlgemAQAo3nLqx+MyFSS1TcgVmfyj02cTBrhuM20gnVq5jUJH2rObLmjdsqP2dz8pmMM9+B5X9I5zf7/bEY0fi9FppyRZaEiGyEy98QrmwnxlDh7ArCxYar2qNDW9U2u4uo1ljgajI2QGzmWSowGxGmsZdRgWsI4kV+g==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(7416014)(376014)(36860700016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Ebmwti4MccIF0avEtdMzqD7QNbeRQoXj+8JOSU/Wl9dnmioHh8BF/RxXhVxxadfbc0cYHrl5ovKtQ5W+8QBLk/tw9pjywnjbIfkR+K1wtyM0Xh+qvDpSfu/i9gy6WW4QvbFNNojmuf/aRW6Vimo5PpipvsoDAEF6HAoCRkIqblA2yYPha8OtThbx0PpxRtcYF3U84MNpqMLkvIzd90ypHyLtbIeuPYbs3cvbHQXVzyKA3usqDcpANTOaF9CgAWnDMSGQ1Oi/fT2chVDl4tpWfxaqZyewsz1aj8kHCLuYDN9+sbdfgq+YOrpmpmJ1S7dZ1z51Iu/3lsFgJyRhRmYKYOSHNAgjPQTLUtEoyd7sJRVNkf65euH7rmm6TrIueta0rjG+KbWN2yHlB5o2dHb+4YZ+qhVOORWC+vUJKp5qFa0D5R6i2Q26XC9zp8ze8Sz0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 19:39:34.9441
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8157cb26-a924-46bc-b69a-08de7bb818a3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023DA.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR12MB9757
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_113944_140420_9318F465 
X-CRM114-Status: UNSURE (   9.68  )
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

On Fri, Mar 06, 2026 at 03:22:11PM -0400, Jason Gunthorpe wrote:
> On Fri, Mar 06, 2026 at 11:20:35AM -0800, Nicolin Chen wrote:
> 
> > In general, the maximum users count of an INV_TYPE_ATS would be 1.
> > So, an unref() would be sufficient to mute it, though it'd require
> > the unref() API to support a mismatched users counter, because the
> > PCI reset in the WQ would block ATS, which would try to unref the
> > removed command once again.
> 
> INV_TYPE_ATS_DISABLED could be made to work too..

Overriding the type.. hmm, that's brilliant.

Rechecking the unref API, I realized that even the "users" in the
latest version isn't atomic anymore. I recall that we are fine to
do READ_ONCE/WRITE_ONCE on an int type because invalidation array
is serialized by the asid mutex, which wouldn't work either in an
ISR or just in the arm_smmu_master/domain_atc_inv()?

Thanks
Nicolin

