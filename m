Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28476C43327
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 19:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pNzNowTZmvpOzqxaLLIdSXl0tVijP8DFPyrnqLyHFlg=; b=de0bXSU/+4DuiaDmVjB6n9xH8x
	M6L2chZl3eaY5QZaBJOdsDtzT4HK4rx4CyO8KE5KwfS5ukByu32v1nY0622hltRQdFDP0/HE1lf19
	aYCOEvN+OEjQD/U0FTGBnMO08iCEXhYe170g1M9niHfvNPJh9++Wza0kIODb5OGQLQF2FwNfIkIwn
	n+iZ3GaYdUUv9pbEN2smJ9e2XI02C8u3M4+3L5vESwcHE1Uf9TycgEcOK6Perj4bqOlpLJxrEpFP6
	zS9LbxoeJDirf/iM2Z8j8f6sMyr/rv+PD4v6vjL8UQUxp5Folu0dvL7+T6yT4CcjpuwBf0N9t2umu
	CniNrVOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wedow-000000005kZ-38ME;
	Tue, 30 Jun 2026 19:08:34 +0000
Received: from mail-westus3azon11011031.outbound.protection.outlook.com ([40.107.208.31] helo=PH0PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wedou-000000005kE-3rSw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 19:08:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MKNd+zNT6z+tWYYc9ZQWvKJIppF3RKwWiGFRGb8OR7PWNH1o4x0Sg2lkKziL6mEiuGdPdNDzehO/Nt0pLCvp9P0CLiRPXX4WIO+P9QQ/ROFaRVZnSyiL7YdDdf1/KWeV6wX0Ow/jatvYbM4f3geciGJvIruAYiXSXJQmv5z5oA2Im2p9JnO+uUR1LLXck7JuZ3X7wQalCgD/zDn3J/i7nXRs6oyqBKXBGGKxHSO8Tb+7LX5K6lqBNZVP2H2FWZkARJAH5AEjA1KUUIOsjj4Sb3Os8j5kLLl3W3UGWMMWLNl4F6JFe3Nx/zzxd95nwd+2DM2DFbB5A9AyIv0dfsN4qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pNzNowTZmvpOzqxaLLIdSXl0tVijP8DFPyrnqLyHFlg=;
 b=LqCBtbqPAHMZeRYVIevW2+v0l4uFh0MdvoniCzeD+C55rTdi8YC2gwU3JSRqnBZtN8BOf3Sq3kVSczW55D97iPs8NK6EaV4igIiwxp5TeFe0u/tWGjOveekSRC5VpvttCg8o3qoM4pmYMhkhpBA8Hy7ILPVb2rn7cpnxj2U1B5qM8rMiFvWcBkjkOE3pXFlHqzNxgIJEKMO9ex7pHOe/ZfiJXBz2I1ECRB+pEUuTxk34IlcXXW39OUucY3oVodg/CJ1PIvUGoVBEbnS2/wc/oOiBmI8VBSkZVvo2a3cpBWSy/zzTTYDhD8nlwbfsRWESyWv3EaTSyUfvjIoyouWLTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pNzNowTZmvpOzqxaLLIdSXl0tVijP8DFPyrnqLyHFlg=;
 b=MxKtgRdPAaNeMu99oIOidTKm0xvBnTcXSFSwri4N+DrDdxGfIBEeRHggZOcv2F+6/26tlMjpBJl8jBUZUDF9GleJJdkcL4DdsGPXHoHQzmb/8yQDIP7Zlox6jn04xnVNtfdKEvBxYG4pMYaAHFIWDj/hN9mcW0ijJvxWMu+X1jHVXsg9v4vxh4GCm+F2T7dPI/gEgTE+WmtMoauf6OBeDmTGTfXi0kkmPOzmNxVUR3y2oJ01t1VQXLiHvjLuBehXrqeCXgwjwBQEWRvkuZF9M4J2eCXviu73MMIE7cBsUy0rwo9KPa0lKiDQr82tY4A9EjhDUBtKmX78lVKOCGNsOg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by IA0PR12MB8896.namprd12.prod.outlook.com (2603:10b6:208:493::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 19:08:20 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%4]) with mapi id 15.21.0181.008; Tue, 30 Jun 2026
 19:08:20 +0000
Date: Tue, 30 Jun 2026 16:08:19 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Pranjal Shrivastava <praan@google.com>
Cc: Mostafa Saleh <smostafa@google.com>, Nicolin Chen <nicolinc@nvidia.com>,
	will@kernel.org, robin.murphy@arm.com, joro@8bytes.org,
	kees@kernel.org, baolu.lu@linux.intel.com, kevin.tian@intel.com,
	miko.lenczewski@arm.com, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, jamien@nvidia.com
Subject: Re: [PATCH rc v7 0/7] iommu/arm-smmu-v3: Fix device crash on kdump
 kernel
Message-ID: <20260630190819.GG7481@nvidia.com>
References: <cover.1782799827.git.nicolinc@nvidia.com>
 <akPB6l-fuJUcg4a2@google.com>
 <akPX_N0P2EcI_jbV@google.com>
 <akPhuF9pAWaBXzpi@google.com>
 <akQLURkLA-bZ9dAk@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akQLURkLA-bZ9dAk@google.com>
X-ClientProxiedBy: YT4P288CA0015.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d4::15) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|IA0PR12MB8896:EE_
X-MS-Office365-Filtering-Correlation-Id: cf56889c-1ae8-4730-4e10-08ded6daf2fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|7416014|376014|366016|20046099003|56012099006|22082099003|4143699003|18002099003|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: Jx9f5eiLHLZuHjJygw+IjtSnREhqGkYgWPrhP3pSoXW21i3uCyW8JTadpu0ZpKc8DSviViuOTjVu+XHnL8koGBSHhVO+WFcS8EB6/K6MgdJPofiaVg17nomYcny1G2IPaEDYH/EXffWj51IO47eV0SMuJkiLzOz8R8Vw65MhJjQN4kbvsNJ93z/SzpBXMM0hyHhE4Fk2BScdwJoGMeqljaCfw5ziM1BYKmhpvOo7IE28CeVWOJva6Wx3XxhO0mrwP+dGTOtnZQUCC0btD4QwJOjtjhNoj44+1MOw5MTPVQ4doKfCVJKJQ9psHN9EFfvKw0r85/3OtfzBO7vq9C3ItuQ0aYT00cK0Zqw36spq3+vXbJJIe2NSuCgDqOisXeGL84awm0RuDCejjshnjmnTi59Yxq1ogtGVpwnRcAQJ9KLBuaPWgEO7z3MuAMvavxKwIxaw3UczL5eOKW5o4OzuByvw42fmJrjKj20tzyR2Tb+F6McnWtkqR23lMKkB0JPvb51TmOiNNcBY6CE7xxLD74QkeMokiXPutibnxvoOIq6phgVvUbebstI28MnGWHN4gvX4LFXQVOJi63xBA5H1EryMcuT6NgQjvoF4dK5t3tfvLnKP30An8ODVRq5fLhMEG2hDqxXGdcZuFhIPt+OVdxnUHChZ8uTmB7Bcd4wSYig=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(376014)(366016)(20046099003)(56012099006)(22082099003)(4143699003)(18002099003)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aGFKT47yrHDd2x2dbVrcPzqsFPouGY0PJ5LccBvBhLtBCjXdSkv0IGACnUSS?=
 =?us-ascii?Q?3czXryv9/8CUj/FVLxrFUsqSLR9eccdcdU9z/WhZeZ97gebWAX7FSRCWi06f?=
 =?us-ascii?Q?oGRrlHLOvYJb6Y7uwKouFJ4YwCXLYvpQnkD3PO7iHQCQD7rkgwvsr1CuKPmz?=
 =?us-ascii?Q?2R9ajQ17WKTNFd2l4uhPBbHQbg4M1nM42BzayaAfgESzFH7zzI34sLFfgxHK?=
 =?us-ascii?Q?oEWZCXQvYOotGSrIxmP5Mlxdz14eVpIVzhxabOm4mfjqF8xXfzYXlHNJQKTO?=
 =?us-ascii?Q?yW1CvDZEAI325j/kfG+Lut9fqfVIVozZhTIi3/S9CJtSBtG2L4yURSh1vkaf?=
 =?us-ascii?Q?K/1sjaJ9HM7ZMSHPushI615yIudiQJBfPTaaENysy1HkpWcgelbnJzSH1dqh?=
 =?us-ascii?Q?RmAuEgxLkT157tSkj0Fc0H+LnFkjrz6A7h0j4/ZxboOfSWIfdDPCiqFtL09f?=
 =?us-ascii?Q?9XwnNkWe9oD1OChsA41bfrgcIbutjSPgY1wqWsvBhdVey8/L+MOCc6JaQMAC?=
 =?us-ascii?Q?hJVtnyhcxOGkv/R9ES47ZunKswjaMMh7QbFWvkBWhIv3a0sdqy3Z4wRRm+Sk?=
 =?us-ascii?Q?L33PiCXc6JFlqo0rKQSMmkEthl2EV1V0tTdHPl+yx+7yeAxcm7hcV5Q5UO2C?=
 =?us-ascii?Q?eTwDdi2fjooLUoAIf4laJ7tX6l0tzCyR79vPGdkiYfeMlqVV3j9jifxr4pV6?=
 =?us-ascii?Q?YFRCMguJqEb+i9w6gh3IbVUf8G3nbh97nTuj2cmR1eZp1HDZabwkGEOYYqvQ?=
 =?us-ascii?Q?2J/OA+ac+UNZTWnmTVNhMBDzr2Z4RHtwrJqyIQwvZxXbbSWv7Wg99CJik0iZ?=
 =?us-ascii?Q?hMdnqev/KUCPhrCzojynRrlrFizZF7PkuNLabyoRsqfzpHQrl5DzgTCbi95L?=
 =?us-ascii?Q?W+fLAqEbW+xMiPWsXyFuUuGPh0htxGA4KG/9p9PH1IjAokO7hgr53N6PypS1?=
 =?us-ascii?Q?e5qgf6KCeTF7Ogc/AD624v9gvXZaqZ2qgOgoJt6HM6wznFes6I8j1OTKnlgY?=
 =?us-ascii?Q?um10banbKMrBQdBnBSrfVaU6zQgfPdjX+l+9+BbhbWiTvvFzCZn64fu5EXNJ?=
 =?us-ascii?Q?5czTGN/hHriCVfKop9HzH3WwqGP9b+8HQu7jYAd7wgBNlRrINV/JBZWCUe5S?=
 =?us-ascii?Q?9ES09O5r5iKWAlew1JilinhOk5364G6RpsVaOu5NPFZf/7zOrYsJSX9exnFo?=
 =?us-ascii?Q?yQZm/U2bvh0VzfP3y6VsI3J0VWW2XAh+622Ue9SnkxJ3slnMOb6rwRxpyfJi?=
 =?us-ascii?Q?RgyoH+uFK2+PXPa0p0iS/NrfmJHRwTAA5hfeolFIHwHC8pyLzpZ3Ho1MbAdC?=
 =?us-ascii?Q?JEdOXVjS/ahqX+wsCRTJQhXakNmK5JPOnzRBjF+Oa2Gjc85vepvU02r2wzvW?=
 =?us-ascii?Q?9kPUn6lm3vuApuZsKvwYxAaTo716cZzcRGSuozOaarQT0GK6C7PbZVFZOLFs?=
 =?us-ascii?Q?HoD1ewye6HgwWAWMZZ+Yy34fb3awZINKleksWOlL8GZ2boPdDj8R9H0VI0UU?=
 =?us-ascii?Q?UiPl7KvY9QxbkcwK+Bxs0cws8x5mn+peVoNTnB27PBRwWmUaN/vw1sM37lvU?=
 =?us-ascii?Q?CteP9SxxBdcIBy+vRM2QVgeRmPgE9Sm8GAfcMnAEY+BtMVyKRZFDQ2MM2Z3j?=
 =?us-ascii?Q?LLwphdyiYR6O+nxcJ4yEAckknDgJm2ZXI+wpNoE4fL16bVzHqCjSIBR/5D8+?=
 =?us-ascii?Q?eZxcncoHE3QEM4n254l8N7z6vhXGHi8yWe9IPX5O9sv9Cv2K?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf56889c-1ae8-4730-4e10-08ded6daf2fe
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 19:08:20.2979
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SMJIjPg9dCqcIf9bM8ZY9n8RU3CZsf6zkCqtGfdnhi0PsUFf/8mb7J+ltLcVCZQ4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8896
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_120832_983585_746819AC 
X-CRM114-Status: GOOD (  15.60  )
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

On Tue, Jun 30, 2026 at 06:30:41PM +0000, Pranjal Shrivastava wrote:
> > As I mentioned above in the previous
> > reply I am not sure I understand what situation leads into this, when
> > does a device trigger SError to the system vs when not which is observed
> > as an event in that case.
> 
> Ack. I see what you mean now.. How does a DMA fault raise an SError? 

As I gave an example to Robin if the unhandled failure escalates into
RAS emergency unplugging CXL memory then the system is going to
explode when kdump touches that CXL memory as part of the dumping. It
is not quite so simple that a DMA abort is triggering SError.

I don't know exactly the sequence of events that lead up to the kdump
kernel crashing (I imagine it is hard to debug that one), but it is
something related to the new kernel not participating in the RAS and
the RAS flow escalating to something fatal.

Jason

