Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83AF7C71159
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 17:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WWkV2zBROEuUeOVcvj+ILYhpPEu0UceOo7Zc9Z/1Qpo=; b=nzPLhRjDPlzkXVLhIxZenTnN7X
	VdGG2lQ9QQnfVZp38PJe5bKgdBpYp0f80vKGOuWxrOFlyKOIXcvdYSSMuuQIOq/a5W3jUKo8NcI0K
	vrMmI0yMx1VpM2BPLuHkv66kvtACMEVQAi4qXkMfvFOWgr1WjwiMfjv17zLtHjuYLfKGnCDFcxgE/
	0HNmoXmqoS3K+7+r5Jb6nE+fVJkxtM9yJxuPHyRTVf3KW76uEvS+QWsQvJF47iLEiYhKnjBauhYiq
	dPqqe3bzSODSq3HEPju8K0kNwfsn+IKjdyYk2NRYaVYdfpFpq9XKXRVEpsgP2in2NLHk2MWBL/HWk
	5+Ta2yOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRDLS-0000000551s-3v4F;
	Mon, 16 Jun 2025 17:10:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRA1p-00000004ZIZ-25wO
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 16 Jun 2025 13:37:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:In-Reply-To:Content-Type:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=WWkV2zBROEuUeOVcvj+ILYhpPEu0UceOo7Zc9Z/1Qpo=; b=Q0gk0tQ6rYAqx6BeUX2bpeiI+Q
	2mSeSU3YvLXnShKv6l15hJj7GnSQfOKxQC6Ty69GDiYfoRId8JCHZTzUckAjJ5nBhW7dbB0cbn5U0
	AcWBSzKfjP1oSHlD5ArLf+ayDCUU3hr6KLf+ubV5a7QIz/1JnFMe3KAeo/N4Qq8Q+/EkZsLsj51/g
	O5Z60J5M9qno554IJWuXdDgMu54iJOppXzUJDA6a421aN6QjEHhP7tJm/ZyheCbXil/rMuy+fsLNv
	xE8kPuGCT0+aRXKbjOxJtZYzgOSTt3Vqn7JuC8dTSx1nEJzAqOE5vF8A/eMu7mZsr4OyuEtgEAIuu
	j0I4VxmA==;
Received: from mail-mw2nam04on20607.outbound.protection.outlook.com ([2a01:111:f403:240a::607] helo=NAM04-MW2-obe.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRA1n-00000003bJ1-0ygY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 13:37:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uFAum9nw8wgjfFPHQVfMxJyrgsZ0hYoyLayir41NM1Eq4ECmIUmpzVq8XuogEn0XAg9NcskCZxBYL/1NqKggtHtivH13Jo6qzWd3hdfet8ntkJQ9rulshWU7ZTCLwwuJ7qG/NhJN61aE9EzMdM37Fx4tbOGR2uFixmPNmpk42fVdkmLc1Sb0wZu7TbQ9JnUY3qM0N1/Wtgbe273NnLgn4Onamk/P0WxsP8YoAcAvbU2dFLsbBymNDjj/BafcSEluqYApNRlWplYtqyP6+SFcTw5nimb7tJZj/Dg47tzayvxRx7aACOv1Podzv98U95NXgQXgbtlE9kdzLcOj73+0Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WWkV2zBROEuUeOVcvj+ILYhpPEu0UceOo7Zc9Z/1Qpo=;
 b=a5MEUSmkjvdPDM4Lecfzn5l7XALW1D1yhbxpdOTYwevEwlwYa+RVk37bpWHSq8xtGA+fCLoSjbvoGiF0mz0zcDBHYFKKEgCuteU+OIO/aXOuNXkAZxhKWWG2J354ofSakor13cFka9yYmR79V2pSEjCiDnnVMYGeyk2e2h2g2pJOv7N34LeCvAm4Ze69Feam95sS7++NQbHCY3xUrvgbPDx3GA4ZPZHq5FOfQ1isiS44tVLqLZtaD8Z4bJHM1wXr1Mc95OfLL5OryUrcMJURjAiy0DJ/6jfM+WRKfs2WRBIYt1E91p+lxNuqmksPiDGyFo+c03+7CZ5am56ZQp8kBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WWkV2zBROEuUeOVcvj+ILYhpPEu0UceOo7Zc9Z/1Qpo=;
 b=kMK4oDmFX+4s/rtIJbxqj5oER4Z1FfPY4ISytVKqBDoYDB7qvKfoc4UIHl3V0hmogH8Wn7qCJ4IWUTqr/xi1ByehYVJf322R/L6qrYBEklpSedpXG3ZPh0/ft7gOSM2mLlK0ln7anOZBdvqP6RuXw2eUujXJVWt6tpLDjgH7fVOW6LqDC4Towjr0JZ8MLKHssdFclfm8pGkt0DlV8HpdrQPvBivaNGR2DvnclZmetmSD7NB9yPZ5uRILXB8Sd6bQLXyTlUxgbBGyvQtr+w6kH3n4GjGUenIFWeIAX5iigYalbDUm58jzhGzsQRV4lk91QOQnxg09YRG2R8+4QUaBjw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by LV3PR12MB9410.namprd12.prod.outlook.com (2603:10b6:408:212::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Mon, 16 Jun
 2025 13:37:24 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%7]) with mapi id 15.20.8835.023; Mon, 16 Jun 2025
 13:37:24 +0000
Date: Mon, 16 Jun 2025 10:37:19 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: kevin.tian@intel.com, corbet@lwn.net, will@kernel.org,
	bagasdotme@gmail.com, robin.murphy@arm.com, joro@8bytes.org,
	thierry.reding@gmail.com, vdumpa@nvidia.com, jonathanh@nvidia.com,
	shuah@kernel.org, jsnitsel@redhat.com, nathan@kernel.org,
	peterz@infradead.org, yi.l.liu@intel.com, mshavit@google.com,
	praan@google.com, zhangzekun11@huawei.com, iommu@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	linux-kselftest@vger.kernel.org, patches@lists.linux.dev,
	mochs@nvidia.com, alok.a.tiwari@oracle.com, vasant.hegde@amd.com,
	dwmw2@infradead.org, baolu.lu@linux.intel.com
Subject: Re: [PATCH v6 07/25] iommufd/access: Add internal APIs for HW queue
 to use
Message-ID: <20250616133719.GC1174925@nvidia.com>
References: <cover.1749884998.git.nicolinc@nvidia.com>
 <64145b184a0fa7c9b60532c9b475a51625edb77c.1749884998.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <64145b184a0fa7c9b60532c9b475a51625edb77c.1749884998.git.nicolinc@nvidia.com>
X-ClientProxiedBy: CP6P284CA0062.BRAP284.PROD.OUTLOOK.COM
 (2603:10d6:103:1ad::11) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|LV3PR12MB9410:EE_
X-MS-Office365-Filtering-Correlation-Id: 67c39a54-df85-4a05-e23f-08ddacdaed17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6Xo7BBNLa+0ULPsfuJL+YIR27uUwJw7cEc6gLtuKdG/g3aMN9D09kAYLKY7a?=
 =?us-ascii?Q?siEMdQ4IjLIRiuOK6z9VcV16UZ0HLKti3yPhQ/9z86ikEPf95jjLbW+2XSqh?=
 =?us-ascii?Q?Vz+8RMZnfLEPQqw2H3p9Lpo2AqEYyhb8ngwt05szyfINlDMY2TDTH2oFB8DW?=
 =?us-ascii?Q?B1/MfOYruxvdXtiTldsu/bW1Ihxoc9u0RSIbwcienUkOMozL0qnob4KJ4Ssu?=
 =?us-ascii?Q?zf5+PVYPBI/nP1Nw3Y2twvEiAFFCqDV8v4pOP2gVDVP6lGFk4eY3Ss1Io2yS?=
 =?us-ascii?Q?KJdlcr9jxqX2Amgmdy/3ho1ETAnjAU/c6vG9yelZ01VUI3V3CZrs1/nDYFuI?=
 =?us-ascii?Q?/q1NrCRn006k+q3H9O7oqVba47ubrNA+JXaHUTQy4VKH4sDrelw9P3tlpAVD?=
 =?us-ascii?Q?CmSdV7Wtx4Mnjt+pMLsbD67XfFZCVWONalkMMkwACrRUjz5w5XOV42qgub1W?=
 =?us-ascii?Q?aKRPPy6xnhWjbWQPT+y+9TjLlSLlzUug3tix425dsXZcsNdP+I/fP1fDLxy2?=
 =?us-ascii?Q?JrxUdlpy6NH2RY7RpEN+3PphInBQTFZNxAJ3IPbvu8VnpF0sOMzsYqf3q8op?=
 =?us-ascii?Q?W10/E1ByN5eKDTiYiqlV/+WJzKkO6M3CMdvNBBORQyRTvnOmwId9PbP32aNB?=
 =?us-ascii?Q?CSo18HaFIzj3Xswnq0IOthiEt3FeDovqlqaf37TvH9WI4Ih4shiVZWxOlvw1?=
 =?us-ascii?Q?UBXtEV3zqx0lZz4i3mzSS88pBv+4ldVqd0uRGJzj4CMg739H/EJURHrebTJp?=
 =?us-ascii?Q?WZtleLz21fmcaPummn7AtJI8SZVXxybw1z7vsx2CPJb8oLLkOBm5Otcb/Sc9?=
 =?us-ascii?Q?G7oDxkIEE+m2ZgpVdyay8YS0YOhsA+9X1bRDuXkIGw2+Hh3MED++LhuACEkc?=
 =?us-ascii?Q?kaFHhVlEp8pvwbPZXV+zAhmZLO75yJjdvfJfsZ8z90Q4SM5fSywaLdU2yhyH?=
 =?us-ascii?Q?XCc+1b56krZv5966njB6c4gpXmhJpUFs1AaeB4f+mDhsyrtMNlgMLyPW2tnb?=
 =?us-ascii?Q?Hu+fYbTzJB1i3pz6jJvgPfsLLC2nqLOgAiAnx+DYe2QpTBVRHS+3E+HMo6Iq?=
 =?us-ascii?Q?SfxWMQczueUxhFnI5tqQx7+m+K2duGJjckpRNZtoZ0vYXQw208rEvRCPUzLk?=
 =?us-ascii?Q?bn5bq6JlyBiTkODGg4X0XoJ1S5I4IW1QlNSTK7xPl6tRly/d9zMuhsfLxBvg?=
 =?us-ascii?Q?aC3DaoSW1h9wQmiRAcNwrF6tCGwvtc05I5C9w+DuslxXiVGx41ME59dol+AQ?=
 =?us-ascii?Q?tXksxR9WbWrMDOSzhK2AiUHkFtuZClUqljAjAwu4eIIKPLJHGZ9vnt+7+nQ0?=
 =?us-ascii?Q?X3CijWfRbuRHSAft/DMmpaRMLiKePYBJaS3ml51tRniVjmEcyGeMZf/VMsv3?=
 =?us-ascii?Q?0qxerTigJ+fDvRJE+1e/w4LuB/9iz3P6C3/am2lqNSOAW6u0snKdXrIWffG3?=
 =?us-ascii?Q?wc9a0d043NY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nIlKe0fBTsMkbkYy9o7c3DEEQyxxeLLfJfbC8+uxMyinvxSeDPkYrhJhvVlb?=
 =?us-ascii?Q?dUqI54vl6bIVWZOaIs20E3DpxkH6qb7Vc7I735Aw4uvM0fhvlZc7uv3SJK7a?=
 =?us-ascii?Q?jdNDtp9LDog/4Hl2grElGzEPlh/jvx3NdPENDERo2k0Edd/XAThFjxowgJBR?=
 =?us-ascii?Q?y2wrM3geUEW7PsM+g1g68QNrzVWa3+Q8oNNRWizUX40vt+9xwgM2LxZkhsy2?=
 =?us-ascii?Q?jlwlpVVA0aiIpkojkC37UShTX7kIr927OBo1DFuVAWa5Xwpfew4CGN4TNOHu?=
 =?us-ascii?Q?WXMR+tzaCcU9XYC8DZtksEnHRRsR0ILz61pd68uJGlW5Mdp05MR3TmsdjETF?=
 =?us-ascii?Q?+S9dqro4zLDS2yvh1dWTWlJomAG0ILqBffmOfnrEP1/fIxz/qNX/1eCHn7Cr?=
 =?us-ascii?Q?oRp1D135BK3WKm6zsVsmGPD6OcRmLwYLxMFPjnE8ByYurmgi/EhoougqnQT0?=
 =?us-ascii?Q?B79sTUlSxSe/ANB246giJNO+6n8bEynz/XVmn/w0fnQcBOusVIAO1tERHwaY?=
 =?us-ascii?Q?2YWzKJM8ZJqS2NfsCcgoyMFLmzEzKkyRFNqUW5IcWDzG3v+qBiXJcFwemlvW?=
 =?us-ascii?Q?JvaDgqtUCOrLyBhK3mi5235xQGfKbIfRTnidUga6rJu1R6iwjqwYs/JAbEZh?=
 =?us-ascii?Q?/KwWZ3yKZR0gJarvpcXwGHisNMg3LInOsT8r1I4bEVci8N3udL5WjClJkt9Z?=
 =?us-ascii?Q?eRRDHAnOTCJmRf409AKzwwBcNhcivW7lS5wVVy4GZV23GEr35CGEotUyodY+?=
 =?us-ascii?Q?BpDBqHas+WeESiOPvX/TTbKm2QrvucETy0b/z+NqSFj72mwpQyn7tRWuLETy?=
 =?us-ascii?Q?aFmkerfvTHPaW4QSISdbLyx87MXXCP4NfsZT6Ie+c+DU/OSRoYrHsxc5hTsu?=
 =?us-ascii?Q?RUegQ1PwWLN+9eRSO3fxXYtUHnZOtIhLyxZV4zJycK8qMRJkOMNz6u4aZwPV?=
 =?us-ascii?Q?TJj4Fqz2tFIDAMssaLsbsg3SalKNnNidF+rVjBlOdQvGcw+bBoKzzKksYst6?=
 =?us-ascii?Q?fjrTSRrP2t9Mn/p5wlt4fjJQDoUASPTocXS5L5NfllBF0u4wwE1k5l1ZxnMf?=
 =?us-ascii?Q?wjGMcK8b6/6QfNMn5mDakMZF64kkibeGc99N/64YhkOqtjgVzfFnwDXNzp/o?=
 =?us-ascii?Q?mS0T4nohnauqIQl/BtByFfcdzSwPxP9Cm999AEPhdAMYLTB85mKbetnbTz+x?=
 =?us-ascii?Q?7BUK0a9DT1vGhg/+cS4gE429LCZ5eAGsJj9PuTaFm2+z2GBHnPPAIhkW+hqH?=
 =?us-ascii?Q?1KAe4uc2ZvEisMlnaKX8HST60Yw/FMCtiUy6Xh5DrlO71bbBAs/I5ZxD2tC+?=
 =?us-ascii?Q?zTwV/90y0JTSpPVB8LM7NGG3wBm/DOicwKkTygA7Jf4VAwiEA3yOB4Jn+joI?=
 =?us-ascii?Q?pTHHbeCCCMJLzCfEV9z6D+HkbHP5g68mqiAavxvjuqeg3KFSn4slAcwg8YAt?=
 =?us-ascii?Q?y5/mIS5/AThE70+1rA9zf34G29LKxvUVjOOU0iEdDWMRs5KzLbT3PM8AZurM?=
 =?us-ascii?Q?YfumM/Lt2DsmpvAT8ztF4Kzom0wlB4K0Hr0YbIjs6zOwzmkE9RyJwiewAhOr?=
 =?us-ascii?Q?0HBGBQ71i2embwp98xj/HHN+3bQU34fAe7iT1NMi?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67c39a54-df85-4a05-e23f-08ddacdaed17
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 13:37:24.0946
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lhw/44Mljth2EGj8NX8Cf5pw3Op+FihbivVCB9nKxLr43E7lReJzmfHGRbSvkaox
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9410
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_143735_386129_45060F4A 
X-CRM114-Status: GOOD (  20.98  )
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

On Sat, Jun 14, 2025 at 12:14:32AM -0700, Nicolin Chen wrote:
> Now, access->ops can be NULL, to support an internal use case for the new
> HW queue object. Since an access object in this case will be allocated by
> an inernal iommufd object, the refcount on the ictx should be skipped, so
> as not to deadlock the release of the ictx as it would otherwise wait for
> the release of the access first during the release of the internal object
> that could wait for the release of ictx:
>     ictx --releases--> hw_queue --releases--> access
>       ^                                         |
>       |_________________releases________________v
> 
> Add a set of lightweight internal APIs to unlink access and ictx:
>     ictx --releases--> hw_queue --releases--> access
> 
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/iommufd/iommufd_private.h |  8 ++++
>  drivers/iommu/iommufd/device.c          | 59 +++++++++++++++++++++----
>  2 files changed, 58 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/iommu/iommufd/iommufd_private.h b/drivers/iommu/iommufd/iommufd_private.h
> index 4a375a8c9216..468717d5e5bc 100644
> --- a/drivers/iommu/iommufd/iommufd_private.h
> +++ b/drivers/iommu/iommufd/iommufd_private.h
> @@ -484,6 +484,14 @@ void iopt_remove_access(struct io_pagetable *iopt,
>  			struct iommufd_access *access, u32 iopt_access_list_id);
>  void iommufd_access_destroy_object(struct iommufd_object *obj);
>  
> +/* iommufd_access for internal use */
> +struct iommufd_access *iommufd_access_create_internal(struct iommufd_ctx *ictx);
> +#define iommufd_access_destroy_internal(ictx, access) \
> +	iommufd_object_destroy_user(ictx, &(access)->obj)

Use a static inline please

> +int iommufd_access_attach_internal(struct iommufd_access *access,
> +				   struct iommufd_ioas *ioas);
> +#define iommufd_access_detach_internal(access) iommufd_access_detach(access)


>  struct iommufd_eventq {
>  	struct iommufd_object obj;
>  	struct iommufd_ctx *ictx;
> diff --git a/drivers/iommu/iommufd/device.c b/drivers/iommu/iommufd/device.c
> index 9293722b9cff..ad33f1e41a24 100644
> --- a/drivers/iommu/iommufd/device.c
> +++ b/drivers/iommu/iommufd/device.c
> @@ -1084,7 +1084,39 @@ void iommufd_access_destroy_object(struct iommufd_object *obj)
>  	if (access->ioas)
>  		WARN_ON(iommufd_access_change_ioas(access, NULL));
>  	mutex_unlock(&access->ioas_lock);
> -	iommufd_ctx_put(access->ictx);
> +	if (access->ops)
> +		iommufd_ctx_put(access->ictx);

I was hoping we could null the ictx to signal internal? That didn't
work out?

I would at least add a comment here this is filtering internal that
doesn't have ictx. Maybe a little inline 'iommufd_access_is_internal'
is appropriate. We'll be sad down the road if we need ops for
internal.

Jason

