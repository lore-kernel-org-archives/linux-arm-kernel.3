Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ADF5C43602
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 14:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f8ZHqSloZbKxEXszHfx15tdXO1EbHwE3uKdULZqA1Ag=; b=PbrtHT4+oczihmS69ePMcURM+8
	hpxNMpTWbV3Fw0OzrB7LP5S58p6IDmki9s4gbesY6ncCPECgA7pAQVRwpBSWpTVnra9cF/IREbZ9/
	yR8RyI5RazgRfTSPQTsfYS7C/9dBNUBXCGOkTpTXqtBK0QxbXfDEWY7sChhkhiFySDj/TxT8TTscz
	xHaKtQVRU5UTr5NQDeLAmC8dbQa7TafXE26u/ooYPaaLjlmrTzogrrn7aivtLIIYMEb+SnPiuiKDi
	EJ3ZVniKbcU+of7cgfQOGfkCtkQHnV775xKcJyRkU1jxMyrijj5/TqYt5jeS9MTJxAad5IcSNatsh
	4USVeB9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh7Fi-0000000FDuv-2bOy;
	Tue, 07 Jul 2026 14:58:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh7Fg-0000000FDuY-3rKI
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 07 Jul 2026 14:58:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:In-Reply-To:Content-Type:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=f8ZHqSloZbKxEXszHfx15tdXO1EbHwE3uKdULZqA1Ag=; b=CBxUHcsAEIuwXgMwiFBRXGH+AN
	a/iLzYDSJUVzGOlgl4JDKwKw/kG33lFcb9SJFqHAmQRdz1VmHh8eKuZxXqVplwLlp2tSIQnxV6fqv
	F2S6XWmlzRGTUL9ZBbtetRWXK9IQjsexVxmLgkp3reDHmmq2XwiQ8api+xQXrHbOnu+8VDWpKo123
	z1/OgX0Lkcs2DZq2/mdxLACJRoq/hyul55pAbPC8O+MdEbZYns2sCnJkKpoiD9wkj/r0+jC7WGmqk
	wxbefv+67dqGEt/tktLIrLCVD8BpqUZ2CjvUGQnH0URLBNbXL27BfH9xQFM9Wepb7DVhop25MXWhg
	95Sdp63w==;
Received: from mail-eastus2azlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c110::3] helo=BN8PR05CU002.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wh7Fd-00000007Zml-19Ns
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 14:58:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e2dNolgTHJ3Xl2+fhfNTDBkNFoV2qzAt7Ds39KC5ELYgoru8PxC0KQ7qApEb7lVXhVdtApPdZhijst6r6Y2sMwiYcCZdql2DJFMRybjti7sSwWqYQXVNeADl0HXjEg3Geb07OgLVLs/3xE2CLkEKvpj1/vNiXnZ+JRucROEJgftL9eJH36OIuYXoxedkHhlX6yMelz5qqNpz56fyKoAJy5mKucE4SuU5145k5Bf1M5VuoWBGdupG+zL39O5bogRea4T+CFoF0UDs6gyGjKLn7E/Swnow5kJ9rPtp30td6U5VfM6CBnIxAt8GiUElg6dSAoO3V8UGHrMpcdIKpNjt+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f8ZHqSloZbKxEXszHfx15tdXO1EbHwE3uKdULZqA1Ag=;
 b=VQmya3StJcEyXe5R0nsAUHKAqFRODrMPldWOBq/R0CRrZRzJ55O5un2teRAuXoyhOfKKDc8JcBsnss19EKe3RTMQougXG6lVRRq71Q7MVyPquo7ixHjNXkxGlyyziOxBCde/8sklLJltA8yl066lAuFKwypqxTAX96gtWXeSfKEABkzeGMEbx8r1heXg5mAgyTan8ioOm8y47FlRaP6KnwV/mG3w/UN9cirwkqRjSj2/uqr5cLt0bVXejZeR7OH/T6ERw7P5rXHfKPy/LI24cWm3eYovRBNbD11NeGTI/LKqFU6z8o99funKzRY3cYp5FKE2Ycvizs+TGP5K15hzFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f8ZHqSloZbKxEXszHfx15tdXO1EbHwE3uKdULZqA1Ag=;
 b=A+WJ8c8gCMJEIi/SuMsNE67vOXWeXVYLopGXMhJM+Z2CkP1Oo2nj9z6oDeXciHR3yNlRazl+Yfklco1Cs9iHjA96Tdy4BKzGyGNbR624L2Tj3D9Qu6RJknXSDJ/FihNqQZRtJcowGxHwluH3NlNy5e7Dz77eoHgHUEI554YceI1BfCfU3Y15HgAADmFNJIi3ReDKehvjtYptcs8ogOQPfNpU9xJicQOQvgtC+GCzXkIHeTk32d/9waezIyh7RiX7RI4EMkMGzG1zcZ0EYYq32AaX2ElY2qfQ/dBgM6GxyyqOmNR5DuZz3lC4vL4NoIXz6xHv90LCUhX8wCsDaof9VA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by SA0PR12MB4366.namprd12.prod.outlook.com (2603:10b6:806:72::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.14; Tue, 7 Jul
 2026 14:58:14 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%4]) with mapi id 15.21.0181.008; Tue, 7 Jul 2026
 14:58:14 +0000
Date: Tue, 7 Jul 2026 11:58:12 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Mostafa Saleh <smostafa@google.com>
Cc: iommu@lists.linux.dev, "Joerg Roedel (AMD)" <joro@8bytes.org>,
	Jean-Philippe Brucker <jpb@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>,
	David Matlack <dmatlack@google.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>, patches@lists.linux.dev,
	Pranjal Shrivastava <praan@google.com>,
	Samiullah Khawaja <skhawaja@google.com>
Subject: Re: [PATCH v2 5/8] iommu/arm-smmu-v3: Precompute the invalidation
 commands
Message-ID: <20260707145812.GK220801@nvidia.com>
References: <0-v2-43074a57a53a+fb95-smmu_tlbi_jgg@nvidia.com>
 <5-v2-43074a57a53a+fb95-smmu_tlbi_jgg@nvidia.com>
 <akzoeexW-4W70QdU@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akzoeexW-4W70QdU@google.com>
X-ClientProxiedBy: YT4PR01CA0448.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10d::22) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|SA0PR12MB4366:EE_
X-MS-Office365-Filtering-Correlation-Id: de926871-38e6-4c9b-aed3-08dedc382ba6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|7416014|376014|1800799024|11063799006|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 43omubcVcPXnNNeuf1kSox0LKdfNozYYnx9Vdozb4rhl2co3dOkAWHzU+UbZeBr2vh9u0yTnQp39itLrbDKYq0Vepz1+irh7NzkbItRdDp/R01SfAWNgSybjKKBtVXMvey/KJEcnB1npWgNdAyCBysENAHnXuOpdTmGtq/fUjfswOOU1PhcuiJI4yJmGe0YtTEAIX6CGJ5phLjOOF5alvpj6FZ7xES+aa8/DnOZzBH55jwfhtp5VcnBRk+Hs9etRIwbFGO0+YBtJdE3CPCzthAKr0Xx9i1TpB33/OsEww3JdLRtTxIQREjDd6Qb+5XnEcVBh/7n3kPbCkhX4mCUOtJvXZoSlkQWHtk9508Mff/xcf1WKgajE5SoTIMOAk2iiwSQ+E44HHRmNVW6a/DGdRnQ9CSaL64fOAn0Qr4aLDkryCXeCd/fL664atvDcCUNsu12EhUQPTi3oCUm1QP22sLotuh+cxE4CVoig2bY0FEM8cilrEsvWOs476UNd6OlXhLLGxK6KLTDXU7UXo4iwEF/gM8HS9w1wFTM85MjALnKuFXDtVB1gMsZOxdaOJI/RDgnAHq/Y+O876bPOXtndLh/MTwl9f7PztcqY4QQ+iPQP04KNXzXvt+7e5WDue4swVWOIH8nEWaP79QTh3xMfwDklLo133cjWXnlvEMMCSSk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(7416014)(376014)(1800799024)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vkjLTcf90bu1UdCSXrwMkrhVaesXHmVgKoibfjDZmnZFy2xs5XPn6jfkyWVj?=
 =?us-ascii?Q?GuGmckL7dbCqtUkq7qNULxIbJiAqmF0wnCtvAhO4JUrgakQ205gbZzi08/fI?=
 =?us-ascii?Q?Se8X6oL/4rE6jAO8wSrf9ulq345yNpP9zwGlzT1MldIoRQbxVHo3GtQDXNJ8?=
 =?us-ascii?Q?ruxX5EAb3GtduHOCy6ysJhJSFurFV3M6nie2Cv9XIdTJJEIaoQS+D+uKG9Iu?=
 =?us-ascii?Q?t8XItZbJvVpHQjtqwKHpae8Gj9DO66bLkGX6eeVEm8ofQZP2GntuMjm8Aq9D?=
 =?us-ascii?Q?ahoWw+dQQ4O3+EmOI+gd8SINd7xk4nR1FMv0ZzUeXYAJ+aCwqT19n4W0FqCO?=
 =?us-ascii?Q?yyjxyXBP2Dunzml+pKTfNW+gkK8gll4BHV+Xn6B5aTzc/GDsRBqudVewQVxt?=
 =?us-ascii?Q?9VSKKuSlVgkw2phlETjUglywqZdcuq8JmgLO/IIHbVZNSqXmiyyWSe1hC1Dv?=
 =?us-ascii?Q?pj4Ue5JgYPz2R+w76leMk+rzMYedFu3RhfjhRHoRpO1wgS5MpAFn2AQ2WnuU?=
 =?us-ascii?Q?EZBdEvBaCkyaSimqBTU1QQ77ZBcrrz+qG0go9JSicnMyYdyBezvkZwMIHmZS?=
 =?us-ascii?Q?E1W5NbFOj3Hhw5wfx+HmkGcvbwiLbuozuPbEe+1PJtZDIMrv2S+zA3Q6VjvB?=
 =?us-ascii?Q?1Kb2FADT1XZPVjBqTqHIcf84zVuaujyIY3aq9c1zPc5f5lSJk2ALYK15xszE?=
 =?us-ascii?Q?SZ58SOKcVhK2rspWoG6EgwBDMETaphvCiFAG5J0vptzkJ5wRIsz1sac4LfxB?=
 =?us-ascii?Q?JXtT8jP/1RmagBD1FtW827USlxdJPDqK0VPeBockhEtKdXobXmuqNK7zLfAC?=
 =?us-ascii?Q?PnZKaa6Eyweyyyj4XWBmEVBARFXXITx8cS+IijRssuxZkAPyVuBSl5XagIX8?=
 =?us-ascii?Q?cAsRnxqgI9efyEDAOXz6vXZBA+MiDgR1842+FE1zjiX1PxoGGfLGKAzLbnHr?=
 =?us-ascii?Q?ybkVGGV6NGHeMwrWzr4pPsTvpsw8qjhqUKv+2XglSyUKngXtopK9Wtf9fcGS?=
 =?us-ascii?Q?uV0xelvaN5OSVAfphYOLkAkSi9YEsfQbTZz2A4PX/thwQBsGxf1KgtpbcMl5?=
 =?us-ascii?Q?BzUi1lKaKg2121f4JTLzOI/mtwQJbQXkz+UamkpA7GFxLZ+1VLpDSnXtFuA6?=
 =?us-ascii?Q?pWssLnX9b9TxXlw3ez+VZXIciT2c7jc/SjDIXH5cjorWVcFv+39h2ZaWAMHc?=
 =?us-ascii?Q?zwqw57ifQ5px58s672+QaAXU/9HI6gl6CL0MEM3Ecdxr3UzF16faH98+kNH8?=
 =?us-ascii?Q?l6J7QiXvCzKlN2WTnKWGhQkpghWYYjyy3H2b3TEYiYZ1o9SGxJLRBXj4qMHT?=
 =?us-ascii?Q?nabkFkVj0eY6GqyM79kUHOePw+wks+aLZbmP2TvevHwWQMluGGa/vkf3oJgh?=
 =?us-ascii?Q?xjTmv+Bf97/oGt+aGnWQjFqf4QZ+cKTwEHaqM/9lOlQDUV+DToec39umtpOy?=
 =?us-ascii?Q?OogXpFvhuRw9qMQZUyle0QnaFqNfaQTdDEhMsSvW2VGF9Aq9yniATxd/WoQ2?=
 =?us-ascii?Q?s01qhJyDxCzsp5oOFbYxEWgsGyN+R7mm1oURdv/HMal6bKeYrL4tg5kJpTI9?=
 =?us-ascii?Q?ZKHA5RHLU6WfifrjuQymVyLC0XZd6pRRhvXo2mZX6z5qp1C0dmhyBoBx7Ugs?=
 =?us-ascii?Q?e2n2eiqaVZXpyHzhz+52xALcjqWWHyORZ4ehBcrFHFAZU62Yc5M2OCkTBGd1?=
 =?us-ascii?Q?tICX67SfwrYS/r4B+0LOHm8yLtXHgf4evrGobwMgANODML1P?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de926871-38e6-4c9b-aed3-08dedc382ba6
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 14:58:14.3838
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AnNxgaqp71WVp31/xh+WtKGjpwcAczsfyWYRH0M5XxpMBWHVvBxP+G25uDWM54Y6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4366
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_155822_115242_C117FA02 
X-CRM114-Status: GOOD (  14.90  )
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

On Tue, Jul 07, 2026 at 11:52:25AM +0000, Mostafa Saleh wrote:
> On Mon, Jul 06, 2026 at 01:26:42PM -0300, Jason Gunthorpe wrote:
> > Store the required cmd data in the tlbi and just copy it out when
> > processing each item in the invs list. The cmd form only depends on
> > if the instance supports RIL or not, otherwise it is always the same.
> > 
> > This avoids redundant calculations for each invs entry.
> 
> I do not understand how does this avoids redundant calculation?
> This would be the case if the domain shares multiple SMMUs,
> otherwise, a range TLB invalidation should be unique and can not be
> reused.

Right, if there are multiple SMMUs for the domain then currently it
recomputes the range for every one.

At the moment I think we can't have multiple SMMUs per domain but
Nioclin has a patch series changing that

Jason

