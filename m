Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93000CD3445
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 May 2026 16:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+306wj3e1bAWNCJw5Soq2MlQFgMYoSZG5jLsfZ1UUxo=; b=ZTCjiAUJ56YpcI1vzhjr3punm6
	Tqieu2tMQ8zDbZj5hWvv8pYI9PKOUdGBNxwwot0XSWr3xWjZCyoT4Y8VZ1T6R5hw5FJIVIEpTyxVg
	L0/Q900ROpMT5VqtHZ3zds/k3+qDxQZiGK4YKuoMtXAHqY7b7zhAd8A2oj0w8lFPY197LdIuIfAqd
	GBrkJiVAeRU7iqNsEFsp+GJw99TDZBHObHdAvP6KC4d1hS+b8rXHq03O7ecCCidNerATrDsArLEcE
	coMOyv7udMu6kuiYXQnNQhUwMIaDdgykyNkX1y7FZGeZIQaJ8YQ6uCJLe5RQHtx/WtYW6PEmEeFfr
	E2mAK7vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLkwR-00000009IMl-20Fb;
	Sat, 09 May 2026 16:54:15 +0000
Received: from mail-southcentralusazlp170130001.outbound.protection.outlook.com ([2a01:111:f403:c10c::1] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLkwO-00000009IM1-2dth
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 May 2026 16:54:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uDEYNyvG75T+B3eK6BpvhL5YtVejT+DVI+U2hn3R2Ou0rC9r+EcSICniY272My/zk0Oath5IHKEjF2+cpKQccBULu05GpLxr9DM3hlK29ejnI0aMJ1Nc6qKBQ/jChX10Lk8g4ay5VYDAKsj1yQEpilIAV4dKpK9JsG0bECNybuBDHIB5sxImqWwm/SCjO2o1nVT2+FfWv6QDSYqqGkwlI53WIAUHr0SHG05n6c5shAbN3ryCNw59wBcPp/FxztOj3Di/AV0ibIlNtYj/FbHyekFs1TDYb243nTBRqnZvVGJaH4NCMhbM4Hb1Te443Sl6jpP7SB7zSqhwGRXaPoD1RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+306wj3e1bAWNCJw5Soq2MlQFgMYoSZG5jLsfZ1UUxo=;
 b=hWb3pRKoDMYAmDy5dOFTjeVyaWIu0eyaNsSz8/aBMTCdQZL4O6tG6sitvbsb2lBSWIfZHbj8CcufT1ifqpkMUmsvoRKCS3gWqk5Qr+RHcdUyDle6FlRpsIgBBQ5KRa8q9YPYLhBFhP65cZsw/HzOKDBxi6TdwS65/jhPyqdTEIzzUQaIGegRsNVkfsEEEs7CwyoRC30QBwhJ8vm5nRu7EV3MqTU8TmHtqEbztcRuhHlicUqmTTL9/5AjapZx7IARsFI4dIr+BTVYyXfzqCd6/yVFQk+6oVlp2Xg+Szc/4QvtQWb1/Qmx8MIgLwioIoyXEamkyVMh5yI+Lw8BvzJaRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+306wj3e1bAWNCJw5Soq2MlQFgMYoSZG5jLsfZ1UUxo=;
 b=a1RU1RdxZzNr1/qJOsJZXaY3tCrU9iRRlY0dCyeq9GDTWvRLdhmuQPKtpF3zzi3cMmwozGOduLXcmhk+Ec3IZ3m2iK8qSReunF8kZCvfDE7Eocj/StoUanWv6LE4NWp8WA+bziExj6OFlkpmdDP26w1pV8ZseR8bRdkV7da39ZkJJn6w6UIcX7bQzHKAKTrfru3vVFfdePbtsHnX9LX3LAiT/+Zw4RkZHsvdnKusAIDbhoG/S+LVmzNBpKS/NfwRTPfjU9mVGSYemF5/5M8xelnoSzf0GykbTahaRHvwcVTMqUIMdcFw/E8owh9ath7BKGwx0Kl+7k+yrckz3lBn6w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by SN7PR12MB7978.namprd12.prod.outlook.com (2603:10b6:806:34b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.21; Sat, 9 May
 2026 16:54:02 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.20.9891.019; Sat, 9 May 2026
 16:54:02 +0000
Date: Sat, 9 May 2026 13:54:01 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Pranjal Shrivastava <praan@google.com>
Cc: iommu@lists.linux.dev, Jonathan Hunter <jonathanh@nvidia.com>,
	Joerg Roedel <joro@8bytes.org>,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	Robin Murphy <robin.murphy@arm.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Krishna Reddy <vdumpa@nvidia.com>, Will Deacon <will@kernel.org>,
	David Matlack <dmatlack@google.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>, patches@lists.linux.dev,
	Samiullah Khawaja <skhawaja@google.com>,
	Mostafa Saleh <smostafa@google.com>
Subject: Re: [PATCH 7/9] iommu/arm-smmu-v3: Directly encode CMDQ_OP_ATC_INV
Message-ID: <20260509165401.GL9254@nvidia.com>
References: <0-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>
 <7-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>
 <af3NH0cihPUQ8PST@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <af3NH0cihPUQ8PST@google.com>
X-ClientProxiedBy: YT4PR01CA0038.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:fe::29) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|SN7PR12MB7978:EE_
X-MS-Office365-Filtering-Correlation-Id: 89eb2f74-eab6-4aed-0ad6-08deadeb92ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|1800799024|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: LU/wZE0NuvXEV/NPi9SqNnGGPFTWqLVNPB8FcH99NuCS2dIVwWDiRRn3Ve72cgdTeOq5E7YitLYcaqhOZb0gKTH+USRnCyheVwUd83UkqaPkAoGhpf4N+KLjCd4U9uzJf86to0JL8oPXQZSRf3/f1N2fulu5siwLOPbASEvy3wAfnBL1eP2BCs84DZWAPDX65M78A9SnZI6GwbOCxennXnLgZSykxBniT1x/Y7xIAKq/URGt5qswT+5BmOoTFldtgpNpZ+VepTQIDuDfzt+c8UZXG1gb2qB/E4olIPkCoAIk71FHobOot7nD/Lnu+yBY/9icC9ZO9K0OF5kJKi/nUQvdKpFmI/Q6f+Rhpzlq7LdpOvE86bvd5kSAPa+cHiv5/gGTNzxXMmK5xdwajOUdMrlm8EXulvahdbqYo++MoJMxqTZSDwliutXZvjMW0yyLiBJLG02cT1LHn42e0CJP4T5KUSBCpCc2vX0nmn8sixJmclBVUQdbVO7tOnmDvwF3zq90FMtud/tY0X7QZj25owFLcUMqYWg05CFIZqVKfMN46OL1Iq1ykaFwKSNgM0sFBqTr6mRT7V4VKhNFWfOrMHZ4Kg+yeyyLcNMDBH3npUUSfe0r1y0mvfwGHA0OBwvlT+mdJc6OUkpwaedxQk5AJ70KvofyOPKBQrtVJ6ceJAzsJVOj22GUZ+kRGYpLzBvo
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?z7aU3lNItMNFPieCxLXvW+mSkmQ/5bsbQKB1IIXA6UObC2YwpZ50KWOBJL3C?=
 =?us-ascii?Q?OZ8MldO7VznQLE2e6HRQmA/hKUgsCOqVtsOYKhZNIKwCkzG3Z3VS3mGcU8Z8?=
 =?us-ascii?Q?GhcQV+Hy5YiMKyCOHNlEV8SRYc+jaMREjz1ZsmZHo07KA6rNcjnp08nVVXa0?=
 =?us-ascii?Q?AYo9IYAqLHkBXZAH1f1RKazHckrDz4Yc7Io9W4D7nAQRTh+kgf5YM+PLiZtk?=
 =?us-ascii?Q?8Qm3SRgL2G4SOQfGrdKTOjUt/MBh0Z2wOiNk3UvUEziivOILJvwUOlfNHoaR?=
 =?us-ascii?Q?/eJlDYqaZR/rTOrBuVm/up6jpR+I2nghvwGxPq7oHnBxgrSYSkCWOMbmFG96?=
 =?us-ascii?Q?y7WfystgkiHr3camxR5O/dHwyyheCNNsTVk/LjPXVCPZJaL7eEakY3lUsqeS?=
 =?us-ascii?Q?gIxl+ksA2FkUtqW/xBJQ5bkxWW6jS4QopLY4TnK/QFRbdwDSj9xtzjSztbea?=
 =?us-ascii?Q?6ZHA76dl/hYz2oI9sUzxYJzTj9l24GAhIHg0wHpEydUxctOYFVks9kc8Mp8l?=
 =?us-ascii?Q?T9Fr0BpzN0Zipl8LEygoIS+dLHTbsdI3SVl+i4QtfzJEWph468+q+qvpkCkC?=
 =?us-ascii?Q?pULu8PtlBtBfHw64tp66JNOm/ORqkA1AzvGPHToekLXZZ9mbZkjesLRu6nkq?=
 =?us-ascii?Q?laKV1tYEs4gyTI9rGRSjjwWCBRysei/g+38BR10ifpvDP5a7YInbxGiwWcZo?=
 =?us-ascii?Q?fsspDkIbiG87bEvND9O9JLj63zl3JT3Upw2q3RNrZONRj+AX/DNzpqyQcXoU?=
 =?us-ascii?Q?W3z2wENr5AFH8lFS6R/FpTHOkLWN5PVKMJ3cqUgZKfo3gp44Q2ZAD8pWiRb9?=
 =?us-ascii?Q?aIbZ87IVOqdnARTgrEk8q1/qwRW1Fqy0svMwZg912IDzj5zzjEsDWsHCM3tL?=
 =?us-ascii?Q?iMnl98cmepKrxQWfBhOCsWa0gh53jTpU0/0dhAX7H/cyPf18xizxCHk7LdXL?=
 =?us-ascii?Q?635mQgLOyb0OQcIirkGgQUeNcoaNhR3LxmKGQ2JmGO/TfotYJ8SdqCYCyjvO?=
 =?us-ascii?Q?nL0jOALorRBw1u4czoSGM1QvZDkq+iXSVcqIB+rBMvIU8GURjOpiOpodcy2s?=
 =?us-ascii?Q?T+Of0k42kosVAgCchhK7rdt3XjjDlwhxmReDIpc8tfDnN99EboHHP1DPCrZx?=
 =?us-ascii?Q?qliEODEyoLEMgjZbcFrCjBZPQE6dR3kpTiQahDpxsVFz7FKI1gjNGMX0cbTj?=
 =?us-ascii?Q?ecxdW2nYMj8P9XG49R8sl3aDqX/PLTmm19TKSl0LENYa64A4K3fZC0gAjO6H?=
 =?us-ascii?Q?lYbseBJkt5wzvGf1fkPKklXQxSFJ4Qxgu23V4W9VkbVGSQfVknUGQh66rxiO?=
 =?us-ascii?Q?I038TRWaATQ7K74V+LDszQRJ8mdeqv6Zd/JZgF5obrwzrJTrOXszAnKCPy3B?=
 =?us-ascii?Q?aY0zNJEyM6xqmIs2sxc12T9OXugveXAGHo8C1L3yNOZB8kSd0ko55Cd8/eBd?=
 =?us-ascii?Q?Y2gjCbb8pllE998v4rCZFy0OXzE0FnBu3iEaqrSzyYmFnPUm/b+CLqhDX4rt?=
 =?us-ascii?Q?cl6MRJNHyULKOeApv2O3NGEdnnLmTLxId3FnmIJwJeCI4NWnYIKSPNl8OOpQ?=
 =?us-ascii?Q?aReHALNOFYb4esXKY5Zvxhn0Zcoq8527j5Qr2T+MvGaf7iME4k4fviWStZzz?=
 =?us-ascii?Q?IwOMzKJD2ftfLKLpBmwVvzZjakCTN6Q0YMJsiHNg0Cv74u0pPQd8fL5wRJaz?=
 =?us-ascii?Q?SS6ayOxRgo/wI7mYOsOv7cdMzpY8yZxKPjUj4CsGioTmRq4i?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89eb2f74-eab6-4aed-0ad6-08deadeb92ca
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2026 16:54:02.7082
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K5MGMuVS6fhslcrf2CKHQJnXHFJ86Q2+4+YqmWmx2Ypxtb84d23qYDYovywKm6u8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7978
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260509_095412_675108_CCDFF48C 
X-CRM114-Status: GOOD (  13.77  )
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

On Fri, May 08, 2026 at 11:46:39AM +0000, Pranjal Shrivastava wrote:
> On Fri, May 01, 2026 at 11:29:16AM -0300, Jason Gunthorpe wrote:
> > Add a new command make function and convert all the places using
> > ATC_INV.
> > 
> > Split out full invalidation to directly make the cmd instead of
> > overloading size=0 to mean full invalidation.
> > 
> > Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> > ---
> 
> Nit: I guess it's worth mentioning that we remove CMDQ_ATC_0_GLOBAL as
> we don't set ent->atc.global = true anywhere in the driver anymore.

I added this:

In section "3.9.1 ATS Interface" of F.b the specification says:

  When the SMMU returns an ATS Translation Completion for a request that
  had a PASID, the Global bit of the Translation Completion Data Entry
  must be zero.

Even though it faithfully forwards the G bit through to the ATS
invalidation command there is no way to create G mappings so there is
never any need to send a G invalidation. Thus don't expose global in the
new helpers and leave CMDQ_ATC_0_GLOBAL unused.

Jason

