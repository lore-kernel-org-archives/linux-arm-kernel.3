Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9438EC61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 14:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wyeSGDpgZg8XZV2TG4f4nXJSt5UjIh5ojeXHowBJaXw=; b=xGrYZbqiw9JwDiynBS9sbRYJ5G
	oFLgG53Rsvo8v1KYWD0ApEEUgU9EbVvODg0x0ZZK1eU4gTbZSjpjDf1ZjeARAenedLP0iDHI2HgEK
	kvEOcimbAu6z+jWGRI1iILD8tY/yAgfdYf1DEWG2Gm4FIXDHtKiSn9pyT69MYuYtThZsK3sw6B7SH
	QKrEf4QmMUrAuJtRPVt7eatHMvCy4kmziu2UiXVanW2yyr7qlW6IuZ/EeMcjgGpUyPJMrbcwVM1km
	P6Oe0NT+G/bQMI2OeFA0qWDJDMx0jYXqDX4eCyDNRk+uc3HNHaBv4ip3ib2kmr9Ytjq1iVTDlrcZE
	b1qRjs4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Uct-00000002L0y-32oA;
	Fri, 04 Sep 2026 14:10:43 +0000
Received: from mail-northcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c105::7] helo=CH4PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Ucp-00000002KzB-333P
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 14:10:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z8dmiT42pwFnLraqCVOmZwjbNfk+BtAJ4HzxcHA3imPh9rjjGd4w64+toC05/vsl5fkhR64OtD4TOxfWPWCyOO5/hs4k05oiJofnvVvbIKiPOQ0AvCM3PTzXDhfslKPQ390ukGKtE2/Sg3iilsOHq2IdB2HyC6l1TnkuxsCQKxLAtf9hULqYhsu6duUNs0+ChsLTtDgwJ31WAI/rd5zhCjJxoXALjyFGk39Rc1TrsWJC7xEs1V+iO5hVmONwlpP+v+FNBTu7tNf9jUuJT8KQ6kf/iKRPmB1TE8fxUNapES8W4Q4CT4FL8lNLjXctZu49pu1nz0vjGGNyOx8BKtKvnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wyeSGDpgZg8XZV2TG4f4nXJSt5UjIh5ojeXHowBJaXw=;
 b=h89gStxXoWC+5qhSezM56hTvtJjl8F3C46NDevxx1YZ5hJ2kwtXZIoBXYso+U2hYdpvLrnGJTcqzoNDWJep28gFc3ufGELUr8ZiOKv7D89a2i5LVWgNYJLFlTYOVC95qLPnS0jCpUyIMbWBG1nfPeJHb4AgPdfkKoAtL4mX1z3Z+mPmK3K4KLLxE1NQcgeSINowP5ZeL6gwunGPqO4Zhrq6Rh26w7t5ypD01jtJZo3TEhCZek28vjfUuANjSPNvH25vtG6iim77NhsFgflv8+4yyPtfWLqfesFigv+tqbxMuYOg2aiqf/sE+6pjaBXWGrWMcMjErJph+Hh0xV3+kxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wyeSGDpgZg8XZV2TG4f4nXJSt5UjIh5ojeXHowBJaXw=;
 b=k+HFGBqHntZp6r02utNEk2/yV9lGOlLPCtvVlBABE8Z4cl01cTBfeakvtpKUZLbTet/7ds2MI/C7awYSnG57zEK4FHztmJvQB7Y4mthiJ5rh2KsdCydeWq04SFWbPizVh4g+MU1UckZfEGUCsJZi9vO3P84KISQdeXhQbcW2BtX5BeTENmV3QbHNa397e2idbaR+qog4C9lhyRkHR1xl0jYoPyN7KgQGcTOMxp8e2utVUxYmT33NPG6UIOmtq5yPTYYZCR2hnEzk8ldjPj8FaunfU7YwRZBr8pfv0b5rHRFer/ZTMvg+BaQlTysIZv2XkgIz6xtrHi8aLlrImKULFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by IA1PR12MB7518.namprd12.prod.outlook.com (2603:10b6:208:419::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Fri, 4 Sep
 2026 14:10:32 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%4]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 14:10:32 +0000
Date: Fri, 4 Sep 2026 11:10:31 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org,
	bhelgaas@google.com, praan@google.com, kevin.tian@intel.com,
	kees@kernel.org, smostafa@google.com, baolu.lu@linux.intel.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	skaestle@nvidia.com, mmarrid@nvidia.com, skolothumtho@nvidia.com,
	bbiber@nvidia.com, harsha.v@oss.qualcomm.com, jic23@kernel.org
Subject: Re: [PATCH v3 00/13] iommu/arm-smmu-v3: Add PRI support
Message-ID: <20260904141031.GS4157646@nvidia.com>
References: <cover.1788222485.git.nicolinc@nvidia.com>
 <178846311315.1308030.14786655545615918885.b4-review@b4>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178846311315.1308030.14786655545615918885.b4-review@b4>
X-ClientProxiedBy: YT4PR01CA0076.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:ff::20) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|IA1PR12MB7518:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b25b3bb-5e3e-4274-4ef5-08df0a8e4816
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|366016|10067099003|11063799006|4143699003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: AHsBrj6ZxEf2STIfbiaGyc2T6ympCu6wuUZEeLk8MBzxsrAV2yXWzRvhFRaLIEuEbDNj20Y7/LKY38pKhyMmgneVAhAsRLxC5M6qmAQRuJPu4AbIotGk6QM6RCF1dmTfZ9tD7M6mfnyX/U7wW2IeSLOXcONZ12HOlsvRgA1DgTQghBWT1zqbrRB+/847ndDnLkZnC1HmDwIA113so5SlorTgUA2xfdHrebPnLdFJkNyiS9cwEGWbINFG4+i5rgenaKK+eiI3y2Or9VPw0/VourUhPU9qrQcoEKeLqQLG7Dx+6i009Chav9r5YFN+pHPQvnxEJAgA6L+GS0ti2055eIM27ZTUKxv/Z6WDN39dR1yIcivXCeisyYVHVfxHgIprj3hiOfnYq4djQCGL6bjuNykIo8h5HLMS1aiNWr2RQMvw9vX3ZiozY1TUarvs/4egP7vT3GR0kXB/dpDXdT0dzUxwXUqke3pQRrexDCFIe4qgSwfqKQC1VOgHxMkjivFnZEVVwvYBrVBWHokuWRFt++QsdqAbc/agMSOGkg2OzDzsPu9mYgkCfzkKs3X9+ZQUWbGaharSxYT3NluWl9TpnA/vprOrcZPAYGPjViABFXimgvVEx+qOk7Z0bTCQXftqWbyKJWZqEYib+isKyWC2FujsxLr2JHJQBvWWnpWfoYI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(366016)(10067099003)(11063799006)(4143699003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YYjAResk8f2nFgegXyNjvxYPCGmYaKLYIdK8UUhJvF5A6LI23aawY6Iu3INn?=
 =?us-ascii?Q?Q+oJOEiryNQc5Z7hrLkld2vIsYriNuo3WAXQTcGYSDR2tDmKRShwQO5IJNce?=
 =?us-ascii?Q?SfjmgZdInPBFNz+2HsVoPolCaOOyrlsEPl2ffUv8gnQil2uKos3uMpv+E5Ej?=
 =?us-ascii?Q?Lvv98T/pL5q9oE6RFcYG6ER/LufAj/gRPmXRoNfqUbK91F2CMwUdP4TlUw+g?=
 =?us-ascii?Q?7Tb+QtbsR+nBUZczqjzlAecnp9rcoROvc8Q6trkyy+70Qs+tjO/szZkOFa/i?=
 =?us-ascii?Q?+EA4jgaLWWkkPiQsQ+xAh+a8rqVMoR1+5zJQnGMC8bSQMMqkMryA0CDMKY14?=
 =?us-ascii?Q?BwjpMLaoW7CzV+DoAU7np9bbhrWAtS2Bm0eV6cVcRxD+Qmfi0NP/zY1LOY5M?=
 =?us-ascii?Q?L4lR1EUWdTCUHGwKG6z94Xz8JR1ph722q59WSOACcgg39psAhtl1T1TODUo6?=
 =?us-ascii?Q?DEy61vxEnDqxbeHRrdEQoD2mu+J80CdULQ8HKc3jQOjhUtntKTXvMY4HuOmP?=
 =?us-ascii?Q?LnUz3ZyMqRqyR1d5rr+7r2h1U8PQDiF1Y2fIJ9e24uW5/V+rcJ92Q7uNw2FV?=
 =?us-ascii?Q?fkqXiGiCIY4nb4K9G4uC6Gcg3CjJ2EoQ7oaJnEYbevu1/auDHhNzHIfHhVr1?=
 =?us-ascii?Q?tjNg6bBn0W0MDBR7k41zp6m12iHwoZFv+1Fpz32yhOwXVd2HSUtNZCl/yZeS?=
 =?us-ascii?Q?WXChGv70cZcJAjZ5+Ic3eOCmYvevZaPMVKqKhvZ7dxoeNU9rRoRmzc0O0dmt?=
 =?us-ascii?Q?gI2v7Vsd+no49dQbGpOmVaC10vgxNQmJIZgMw8OkpK+D6A/MP0zVWKO7P2ks?=
 =?us-ascii?Q?zNnlgKb2bBWnG1svrF3RT1CcgFLow77qlsClmrvGIjm8RoM7QJNGJva57iKB?=
 =?us-ascii?Q?fyN+bEDHNseUNWZLwh8DUDahTayCnKhQB/1E7jNebLBkqPnbSaYs+HituPI9?=
 =?us-ascii?Q?gdB0k5AmjUO2lULNWGvSpYrlkJ8fE3WbOwIbVS88hUtGyafLZ6Iw1mdAazQo?=
 =?us-ascii?Q?pxAJLfrO3we4QXGrjKdzeSH+SXg1BCxekB69raPFxGIIPoQb0jDfiFQjG9ao?=
 =?us-ascii?Q?MTRQ3Yljzh6celRNMuUjiE6L+FbPnhAQYtFqUR1WTVTkVmmmIuX9IucC8ylx?=
 =?us-ascii?Q?aFUrcMl0qoVVfrpZeIBmiWdy0MbnSkxtBoWFm3mWtvzZPiN7WgyPxQ5uh9rI?=
 =?us-ascii?Q?qLU5Fh06hnZtihseipLoqCTMhZqsUUJ47WwLSb2V8AbLjmmcqd0giEMmZusR?=
 =?us-ascii?Q?wm6mOJrPSfeMZ7Apdqhzp/Kudsw8H+75gcW+6aMNVGg8lZC1AHzyAYmU/uud?=
 =?us-ascii?Q?XQE71P9a1yLZiFZbxLXCLl8kDjqL8jiiksgFrVqdkSLVt16dFGuQUOnj+lNH?=
 =?us-ascii?Q?SCbM1zpjVmGq94lNP545o3O2rXiznmx7YVTrJI2C4Jm0+Bbg1AhAjhU5895K?=
 =?us-ascii?Q?zpKjZDvojKEtxG3cR/oUgFjT73R+4LeAzV685aOh0lmWnlVysCJJwi4/C/hL?=
 =?us-ascii?Q?mK2zHTSkL0VVnP1rEbJWzvHGGOF4uAMSgYQxA9zgJVxtsKqYUdaqkPfURweD?=
 =?us-ascii?Q?gpJfDLDMIzna26WOOo3ADH9wCM5HoGCP0PhNcjV4mL5Xdjd8jujkh/6QVpMA?=
 =?us-ascii?Q?CesQfoBrYAW7OUXniINrb71od1gwvZyZcOXJUIg4LjZZk0c67UQfftBmXM6R?=
 =?us-ascii?Q?YB63nB9nzyn3DtCtbea0nYUWo9y0IL0MBdT8EAJVaghp4M0I?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b25b3bb-5e3e-4274-4ef5-08df0a8e4816
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 14:10:32.2523
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VgEXk15TKgZomefm36dRiPthDmzY+zNEUUQNwHJCJDbHHILpiEHwwrPZke667ybZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7518
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_071039_769806_FD20E3C5 
X-CRM114-Status: UNSURE (   7.48  )
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

On Thu, Sep 03, 2026 at 12:18:33PM -0700, Jonathan Cameron wrote:

> > FWIW, engineers on the NVIDIA side have managed to verify the PRI feature.
> 
> I don't suppose you can share what they used to test?

Real HW with pre-production firmware, we can't announce what devices
at this time.

Jason

