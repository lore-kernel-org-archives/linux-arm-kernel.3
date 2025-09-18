Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A373CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 22:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R/gYKK/O1SmOxCO1k9J0MRHZRhpQpSpozJ/pVgEuWGI=; b=uzWX2uNha5CTnIJkpTWvnliFVo
	92mwHmZtEtDQSJz4VF3FxVI9kQ9TntvPPfj06a9pl7FMIgIiVSfg5TTJutUIg5H6H30eJjIbfjqRJ
	5mjjzUHH3K5plU1Vbb6GTfDC3fERMma0FKBvcw5LR3a+sRnC+NduX5HwcD8GGue2jnwmN4ysX6/NM
	ZIt0CuPoNFzucA0Uea7xNWMAFt9jRUZ9JB/DUn1mm8CjDA1kkM8riLJFm/rSF4rdKvDUPmcZN8JlL
	Vf/C9auvlS8sT89SUc7gJ9vWa37yhRj+JzXlyzbC/K2u21OrBpSExdNOMX5wiDsxkZRIvyXt6wSAb
	onDNmMLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzMxj-00000001Jii-1hCH;
	Thu, 18 Sep 2025 22:18:47 +0000
Received: from mail-westcentralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c112::5] helo=CY7PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzMxg-00000001JhJ-0vjh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 22:18:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z7PkRWmB9lgV/OPDk7WkaIHpa0mYT86RqdGRXg+5MHBRjb3IyLM1S4m7ieMYTK08Hc+iaZKJ5t3QyB2AR41mAQuFMWREYvs9dlun2KLiug4Amyhmw+Z0RLhC3ul7o55wgcPA3Q3bPAi5MFOC3zUGyFxFY+aC6PmPAmzFHMgfV9fnYVlcceXVbWkaGcJGL4Sa21I1kVUT4isMKNuzO1HNdDkzOXIeqmbGw6tP4uhWBcIuFwZx0mSzBvW4TqfBIfhdi4l9ozoOhE2JP4w+JzesrtQc+Mzq7aJHzQuMGP5lpj8o7wGTWp5yzvCTR7Nc4hMq+gOA37VGyC6peCo9N6FTKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R/gYKK/O1SmOxCO1k9J0MRHZRhpQpSpozJ/pVgEuWGI=;
 b=tbR40lyBbh2hGJXA6VSzgPyci9zONtm5ht7RmEqXoHk/LeyjmN/3MPBnTyP2En9jefIvrc1toXd/YIYEjx9GlXSDyS188xODOMxq55RVLsTe9VDkIKCfUCNSQ2jHaqYPwPJjHBIEd1lH7Rkog++TZCMoo5XWtNuQ5P/eL4Q85H6ednJbBNxAnzEyexEkYDNqXTqEkDVPu8ar2Wd05Pzi14E4dUyBDIXCsDOqdBd3eAw8oecl5b1S6N60+C3ibz5sz618MtW4vDT2KJPPyzK4jF5bDD3c8rCf9z0atwusyvyJKhgnXPdZzohC9r5Z8W9GJzTiIER3JEos2VUaBVi0jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R/gYKK/O1SmOxCO1k9J0MRHZRhpQpSpozJ/pVgEuWGI=;
 b=nPGe2X5vzIwCx8wqGDEtt01/GbS+jngT6fwk0BVDQPkUjzksCgZ5lX6ykNTbbmmRrpibAW3GuLy+NZ76k6j5tYi/WLtmODdAI5CP4LfqCqcIzmm2Lgwoptq476iBIDqrpStoBZwFXI+wS6v7+ntWVUczXzenTFgCmGklS/YUJwo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from BN0PR01MB6862.prod.exchangelabs.com (2603:10b6:408:161::11) by
 MW4PR01MB6322.prod.exchangelabs.com (2603:10b6:303:7e::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.13; Thu, 18 Sep 2025 22:18:38 +0000
Received: from BN0PR01MB6862.prod.exchangelabs.com
 ([fe80::8a1e:34a8:2ad9:7f83]) by BN0PR01MB6862.prod.exchangelabs.com
 ([fe80::8a1e:34a8:2ad9:7f83%2]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 22:18:38 +0000
From: Carl Worth <carl@os.amperecomputing.com>
To: Jie Gan <jie.gan@oss.qualcomm.com>, Suzuki K Poulose
 <suzuki.poulose@arm.com>, Mike Leach <mike.leach@linaro.org>, James Clark
 <james.clark@linaro.org>, Alexander Shishkin
 <alexander.shishkin@linux.intel.com>, Sabrina Dubroca <sd@queasysnail.net>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] coresight: Fix data argument to coresight_enable_helpers
In-Reply-To: <a331eceb-ec49-4396-a61d-78a75789b090@oss.qualcomm.com>
References: <20250916224441.3008824-1-carl@os.amperecomputing.com>
 <a331eceb-ec49-4396-a61d-78a75789b090@oss.qualcomm.com>
Date: Thu, 18 Sep 2025 17:18:32 -0500
Message-ID: <87frcj8kw7.fsf@rasp.cworth.amperemail.amperecomputing.com>
Content-Type: text/plain
X-ClientProxiedBy: MW4P222CA0006.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::11) To BN0PR01MB6862.prod.exchangelabs.com
 (2603:10b6:408:161::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR01MB6862:EE_|MW4PR01MB6322:EE_
X-MS-Office365-Filtering-Correlation-Id: c6d6b283-b4c8-4c4f-c64c-08ddf7014fbf
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|52116014|376014|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6IvcVXbf/V6m0bZtHEGRtPabYhDF5G8Vfkcf4R3+Tp/an0jITIgWdqqh5FbP?=
 =?us-ascii?Q?GgflIz8axUQQEKVaLwfrHzQnEE3eLppD99OIlhEgYzKAmo3PnAGPhZtT57PV?=
 =?us-ascii?Q?RGPmlxr14umXpTy/0TLpYv9LJP5q3AWonbpFPBgH6aD8oRKUlwcuAQdTPIRO?=
 =?us-ascii?Q?e1eV8fJGzY8jI/WGBWoV8hibo/17XGP3QMNl5y1QDhKkOgA6GAzA9uzsOjHx?=
 =?us-ascii?Q?ZUbV9GLjaquaymFwFDU7T091PcclQAFL8W4HFJCwrC44ts9jPOXJkuJGHONx?=
 =?us-ascii?Q?U7C5nwMCLDYPHbO7lSD6fiS2xQ5gigh/OwCUjcN2qeed4c9JWEuMYnYzvO7M?=
 =?us-ascii?Q?GmXDQlA/lukjTIyx4/vZyxsBQNBJ/gOCSVuNN50/tNmh0uqkuQ2IQ9YF5y1g?=
 =?us-ascii?Q?xYdOd8Asup7WDIdyzRcqNp/irFh63uISPgUxYeQiDRzgtu56eK4KTA0lK6nq?=
 =?us-ascii?Q?nsmwRGOx1pbavEOCe161Ie1bOi9BrGFxrLpyv0JyTr5OVEsHYPmBP134mqvM?=
 =?us-ascii?Q?OfUPTfLPa18Nymb/CcxgAth2bov5sXaZjnhUbVUwoCOJczNaZorK/1B0pVqV?=
 =?us-ascii?Q?HeRPIKKZe+q2/9gKHClF1e6++xw8MH/rpD9ywcd1GSLxyQ1MGvoTDWw/7fcU?=
 =?us-ascii?Q?cDEDe3fnnQ0KW9dSrLEnL8zMWI8dEqjYQwBaDfp/eVFHWDHUdE4ANqyvcG3O?=
 =?us-ascii?Q?QVKUQe2ApmDX8Gy5cRR75jyOLgXFHoJGv2Wo5+vwvI0m4l8hfGUMB00ZWpss?=
 =?us-ascii?Q?z1wxRssrBWQ07JAN5rO1GskGGYZbtU97QxwlXUTlW1L8eUL1YVTgUsWZozeE?=
 =?us-ascii?Q?KooPDpLTJcsQPlG52j7wPM1UJxNJrOIG+/UvXeCAd8sObsUpvetk+YDrR0cm?=
 =?us-ascii?Q?Xu5qN7SELVBR2lx6Cz4/jiy3Ovu32aud5j6cHM5fE8l+GM8L2R9XPVmgw+2l?=
 =?us-ascii?Q?PDgfx4xvJhjLXXgK85HaO94H9NaYqq0fNccL39l1obvx7t/HUtA2VuWTC+yi?=
 =?us-ascii?Q?SqkpzvLp+pR3y9iuXnnV5m2famG84lxHZoQ+yJNi73POB8HHyXMOXavE156M?=
 =?us-ascii?Q?QKpkqyk6qVZXW55KI3OW/t2+tJDfMbhGs6NF54fFDH/x/CqekztR3EVbMIkw?=
 =?us-ascii?Q?LCvjF2lMQsxGFY/F9HvZfMk65DhiJBIYtbUqn1EOERAx6n0BO5VyAyqwXo+M?=
 =?us-ascii?Q?gsP8NiR6RW00x2JFbIZ2YvFwkQoUVkY1ZrqqObQqfUwt1nYnzzxmtU7urqhU?=
 =?us-ascii?Q?f2MsbXp245BQnJzxW8F1HtbKDwNa9l6afX6BZlax7p1td4asXXQ4AZIWZGTG?=
 =?us-ascii?Q?V8S1yRezIPaF9gmigmlKRbGadotxJwj9Mojx2vd6fVaBrMozqaA4qGaaXufO?=
 =?us-ascii?Q?jYq9Q9l1+9AVDJwin3LA2k72vTC/JhwJ5x2RbXcuHy2z9w2xtcIYFywJjJ/v?=
 =?us-ascii?Q?un5VqHiD+z/Wlf4KKx1G7lP7WiGp2/erDIaZf6llWSLhmT3NdUMf7Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR01MB6862.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(7053199007)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NyHUnHXpJ6+OabwGJYyCH0OnXPkGCeTQ4/z1fyryEuWjsDmmxph2qowRMZ+8?=
 =?us-ascii?Q?hq1NL71N4uZa63C9sUOQ3IOLc/0cxQQyD8UI7oMrDtVKUcw2rDtoi7Bjum1t?=
 =?us-ascii?Q?Ug0eAim/Kowi4EAsSyczMpoi/hYr42ENLEZm9eUxN8L0Z7s2/kXFSRO9wGXe?=
 =?us-ascii?Q?iVxGsca5O8Mn5F/G7RQhxnRCXIGNg9Tk5I12oNeoSEDeoYuJFvGzdMxPOwjN?=
 =?us-ascii?Q?UE+zEHnBq3LhkgKpLSFhhFLEnqjSZuvWjoSMPNXkwojuy/jNfYULGbqQ8weq?=
 =?us-ascii?Q?9KXxN9WzXsgurAov/iZd0zMuLRh1TUj7G+rYBhZuE0ujr5ZB6crYukedo+Rz?=
 =?us-ascii?Q?YK9tbaHMTCab8Q4RBd7rxN6fJZxPLyDNSwwLN0Su0DdqFrZGlI+uZj3e2jqE?=
 =?us-ascii?Q?mogTaVPAxE7ItwG6cbqoHEcbD0vdRq32CM8SA4oGfGV/OgKg+fv1YH89XPsL?=
 =?us-ascii?Q?oMyny4EIyWom4sCBv4BlsW9Vl6Uib8km/exY/ca4zg1redzikC7lf9UwJgIU?=
 =?us-ascii?Q?K8Vr+389bWyHnOr1phtcsKnwY5X94QapnF5MDcwwCCyA1BkUjrl9ANVInToF?=
 =?us-ascii?Q?U18wWjilE0xGJcRcWGwLJaRZYAw/sn685ig9HYZ6TCyUA8NcFVaOk6fd89AH?=
 =?us-ascii?Q?APbciVkeeBpHQg0WFeDMcOsneEZdJw4dS1GHFlG57IFhdtZ2ybdSSMhNeMEl?=
 =?us-ascii?Q?YQ833i72a2dszsgw+Kr7EJZaoqa36RO+Kl27N02wm9nCmSmw03cMcHQ84Cqu?=
 =?us-ascii?Q?gtIzIT01o8TPWaHFttd0pV2vS0vBVZf+FrXvvOgM9E9nXWnYbf/AZTcjQVLE?=
 =?us-ascii?Q?jsePavcBpOaUe+dxm6HF+i9mrN65b9A2WPc4phc9T/+yWIpB8/o3E+o9wS5y?=
 =?us-ascii?Q?vL7tuX+1j+oU2+E/Czwx0W+sSfTOlBPiH4HEcVGvjsVEHJXJgf74LwIlGddl?=
 =?us-ascii?Q?uJ05oSHsv/0qrSZrt31xiR98soP0LU07tIM7cvaiyIQA/GpgeW8wi5e8MX/C?=
 =?us-ascii?Q?VgXfWs9W4jNyfvcpftBmmhcVmFVtX0kPvgGoCr5iTXL3tqE0jHJuYvXHwhOv?=
 =?us-ascii?Q?zfCZHwIDJa0WoYhm7hEhV3hGjZE+vqToxKdqlD8cR3896az2NAwN/Jj6cZ06?=
 =?us-ascii?Q?J55OiPX72qjGlw1UQiWknofEaTFMYQIjTwKnP/Y6U4rB5vcUc3Ew8zILtttj?=
 =?us-ascii?Q?iSOSPw+qOQEo3nHlCxTepqjrw2VjAhH7C3q6gmgddxWS7/0eeMfaXi2b8KG8?=
 =?us-ascii?Q?GxWt8oQi8Sd4zvq1jQJV9EF/W54QjQUS7djMyMGsDq6cxCfAKHCZj2aS53ym?=
 =?us-ascii?Q?oEwXbTmCxdqK/kCBor3m0rgR4L4vGmmUUM3xKbu38ERxDI3pXNtlXI2ZER/n?=
 =?us-ascii?Q?wdgFu9S/9mfl/V4XXokI8vy9h5EVee987n8xTMB4UZxT+ZY3NjA3wEy1eHvE?=
 =?us-ascii?Q?PFQKlrYTNnn8OvLjsmSys0PsQsMacCDAll/iXCerkTO4iQclwTXfLiTKVbwn?=
 =?us-ascii?Q?QsFL3wFSFth84biPYtx618oojJd5aVj/ROulA3QUPOuEvz3Se4LyY/3Ftx2H?=
 =?us-ascii?Q?iLAskna7ZmuUKQ30OkAXYjmPyL9JHGOmCpAX6Tojba8UqgPr9FEL3pOv8crE?=
 =?us-ascii?Q?R0z2Yp2SQ856FS1bAekWYa0=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6d6b283-b4c8-4c4f-c64c-08ddf7014fbf
X-MS-Exchange-CrossTenant-AuthSource: BN0PR01MB6862.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 22:18:38.0022
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nGesGJ7OReINDGbeUT9vyyEfPXoH9FBIPyg7qTlsoR/bZEd5L3aLCxWvvet1bMMbGbQu89cy43jg0/7Re1wAVMxauj1r6gommdwXGEgLL7w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR01MB6322
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_151844_270816_AB849347 
X-CRM114-Status: GOOD (  11.10  )
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

Jie Gan <jie.gan@oss.qualcomm.com> writes:
> I dont think we can change back to sink_data since we introduced 
> coresight_path to wrap 'data' which is needed by the path.
>
> I suggest you to add the struct perf_output_handle to the 
> coresight_path, then retrieving it with data->perf_handle in 
> tmc_etr_get_buffer.
...
> We can assign the perf_output_handle to the coresight_path after we 
> constructed the coresight_path in perf mode.

Thanks. That much makes sense to me, and I'll put together a patch along
those lines.

But, further: with core coresight code assembling into the path all the
data that is necessary, is there any reason to be using void* in these
enable/disable functions?

Could we also change these functions to accept a coresight_path* and
actually get some compiler help at finding mistakes like the one we're
fixing here?

-Carl

