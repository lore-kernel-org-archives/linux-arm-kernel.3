Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6230FCCA463
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Oct 2026 07:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Message-ID:Date:In-reply-to:Subject:Cc:To:From:References:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TSbGyB+ypDuL1fLjL6F7Y9JDJ/xTp9jNjBIDdZIFTF8=; b=S91bHP2L+vmXNx6KoJc3vnu2E/
	OUHg1CquTd2DqZv18Mb4j+6zA6yo17jkcb2T3wthum1H0a+RelZt+EMocBMl7HmPGPGawxX587l22
	MrOkcZiTQlD/XbS1KLXCqwq4IAg4KD+sHiSuh5XAooLbLRA9bsJ5QfqIITqnx/ycR01z3SoocQJG0
	5XqaDrZf3L+iLE6qrXL7Ma1aH9iemVnCqUvI+ZfslrehUPb9yMoMPUu8UiFCUHy1CcNzSHUtfvnOT
	QJY/eA9qE1epPB23LEMXkXdecsesWJyzih+RLD7W+9PCPrtILx7g8pCXi7cC6+t7KYoecKX2n7UrN
	FMUZdC8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHyiY-00000004VYD-2xcY;
	Sat, 17 Oct 2026 07:20:34 +0000
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHyiT-00000004VXq-0YwZ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Oct 2026 07:20:32 +0000
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69H6dIrB435363;
	Sat, 17 Oct 2026 07:19:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=TSbGyB+ypDuL1fLjL6
	F7Y9JDJ/xTp9jNjBIDdZIFTF8=; b=PpCnDQnb5DtBa0IaZJ5zKSQb/SHmjHDmf/
	nypcer1f8f2DdsumJW21po3sHI78eKRCxF7kUa7Nhngf5SHqVpceCOnCp3KdhNcm
	nRUdlQ3StK34vOBi71Fm9JiJT3DuX9PSZirjQzedk/rbpKNCxi7Xg0nein29vuI0
	k/zKl1BRArVBeeef4MXG4xGawSyNQ4fUIldGlfzz141JOdM+5ZUGj3xn7qamUeC2
	dLupzg/LYg1yCxWJpfHVE8YnGDtJ07bZ2ThsKybC9X47sLV22fbT+QvORwjgFkz/
	+vgfm5gED160zHfOX81shRA2eBYGDiQ+dK3vcEMDzdEq4pyuiaFw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4hbyemr4m3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 17 Oct 2026 07:19:49 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 69H6po4N015512;
	Sat, 17 Oct 2026 07:19:48 GMT
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013057.outbound.protection.outlook.com [40.93.201.57])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4hbyfbmynk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 17 Oct 2026 07:19:48 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OWfLMv53MEoQCBZdGKB3M7EQskjGi5LNvXGnfsPEQjFl9x0rnXFah+7plvAihkF+rhSvqKnxZfwGHCYSZPyB0EATLak+0gOq/yfkjn4HacyDrS98Rg2xoSkD17eueQfw4K60hThJUKYOdSBOex9EkE7QPdk3VFHsq/8p2NnXym+PP5JqzOs/g0Y5tc45Tdiy+WwmRjFBPV/rujOc8t7Qm/gpUgEMCro3/y0umGgcfBSpmUmh1KsLUt1wqXW9ODpfvkKJnUSuLU8P2atZ8YtjzaQs1UFcPcEf8+PStSX5TjiycyJykeE3EUqx2lZGM/0z24XJvixRF1aSV/Kb06w8aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TSbGyB+ypDuL1fLjL6F7Y9JDJ/xTp9jNjBIDdZIFTF8=;
 b=mOGjw3oQyC6WInF4Ak+kBZY5ciUCobHYqT42o+F4xvk1aflQ2JCsZR90ewsZOk0A2XUcOOJi/h/nUGePAn6xnusrV/22qEPSAL7n97oRxmRKbthu+/nclpxXwItRJb6JKetcmSAaNc7EEdUb7zFPJM6UFZiBK+trY0sjQx0SLX0vgRxZfUNAAsBKg4j5gT5E2aFg06E3x17otV/DZqFiVwRAYLXlFIo+lOrIiJOZFYipZnJlKKXWIrdSjYTVxtajfxcBs+dVZSB9Z0rCFzeZ1PwejRa6Kt5LsIpucCXMTFdssXHd+Luq7qm/HY6/bWVkSU9ZB779VLHfDQOC1x+gEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TSbGyB+ypDuL1fLjL6F7Y9JDJ/xTp9jNjBIDdZIFTF8=;
 b=kn4zOelOddqD9OyyOY/ZL2jEs/DgDrbYjBoZRum0Er3nA+libjlX8Mre0Wda2qcNqUISEnmUYTEkfaozxRG3Qc/QktxK3vDG88ilMctHBPbzYrh/3LB39zrSHqtRADWSGnMv8oHI/5kP7U3o8/eYpcrhIk8zxlcagGKXCm6S4X8=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oracle.com;
Received: from CO6PR10MB5409.namprd10.prod.outlook.com (2603:10b6:5:357::14)
 by CH0PR10MB5018.namprd10.prod.outlook.com (2603:10b6:610:d8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.12; Sat, 17 Oct
 2026 07:19:38 +0000
Received: from CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::3c92:21f3:96a:b574]) by CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::3c92:21f3:96a:b574%5]) with mapi id 15.21.0546.011; Sat, 17 Oct 2026
 07:19:38 +0000
References: <20261016070837.440748-1-ankur.a.arora@oracle.com>
 <20261016070837.440748-4-ankur.a.arora@oracle.com>
 <atIW-GIWaN6-w44R@arm.com>
User-agent: mu4e 1.4.10; emacs 27.2
From: Ankur Arora <ankur.a.arora@oracle.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Ankur Arora <ankur.a.arora@oracle.com>, linux-kernel@vger.kernel.org,
        linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-pm@vger.kernel.org, bpf@vger.kernel.org, arnd@arndb.de,
        will@kernel.org, peterz@infradead.org, akpm@linux-foundation.org,
        mark.rutland@arm.com, harisokn@amazon.com, cl@gentwo.org,
        ast@kernel.org, rafael@kernel.org, daniel.lezcano@kernel.org,
        memxor@gmail.com, zhenglifeng1@huawei.com, xueshuai@linux.alibaba.com,
        rdunlap@infradead.org, david.laight.linux@gmail.com,
        broonie@kernel.org, boris.ostrovsky@oracle.com, ashok.bhat@arm.com,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Christoph
 Lameter <cl@linux.com>
Subject: Re: [PATCH v16 03/16] arm64/delay: move, fixup usecs_to_cycles()
In-reply-to: <atIW-GIWaN6-w44R@arm.com>
Date: Sat, 17 Oct 2026 00:19:35 -0700
Message-ID: <87bj8srdyw.fsf@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: YT1PR01CA0146.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::25) To CO6PR10MB5409.namprd10.prod.outlook.com
 (2603:10b6:5:357::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5409:EE_|CH0PR10MB5018:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f172689-b369-43a7-06f5-08df2c1f00de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|366016|7416014|376014|6133799003|18002099003|22082099003|10067099003|4143699003|260925021911599003|260925021311599003|260925022911599003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: KKarSeHIr0czMSIvxMZHrifHCS8ImCZf7HZ/DHg5CvTjlpb4ozD5jV5pObdgKK4kHV/xIlwzPasxJ8Ys/maZAc/V/9OkNV7qOFJry0vb66BtVzST0a6PiHVk1YMTgbiKE83tvDDt+dMk52thF/xe0KedIZuF+bIo0PBiEM9rlaCiFYInytkZWmr0wNaTKxz93vbqZAXeSVIsQMb4OHaWqsHYe+BEXrobDmCz3xMcXkP4ROQ0WainqBc8q7K0SK7RhDe6da2IYU2rKnSHS+O9Ttjz44wvBHIR1zcGZtj7NlBQiR6zhLLNpUF2W8NhSZ+1cDRq/9qjy1RjAj7cbyLvbBznazbtSXe7eiOIoZZLvlyCkOclWKT6C8LjIaaoqc4vZ28mYiZOmx31BZw7AJ+43mhvp7VXWESURX+AG0ZO9VwdTac64OfHP5S4jCrlrBhBJcuZpGnO1Vl/FR1htVFsXHLl2pCsFLYvPuV+FZYDWTL05zCm15wCYQm/EeIDmoMCnR1y7RqAz59ui+Wz2H3JgOGmJV7G1ZkdvIv5BGNPaqks2roIuRTQklpFvtp5Ee5Kap7hoS+i+9rtmkffWGS8KbMcZBKUxbm8a/b2ZRPR2Cuu1/cS/RBQeilz6JvdoUjNIwaUK8p83JLQa4aFhoSG4958VuB+kEwGRhyqdp2QH/M=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5409.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(7416014)(376014)(6133799003)(18002099003)(22082099003)(10067099003)(4143699003)(260925021911599003)(260925021311599003)(260925022911599003)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iAJ9KKI9q+Y8FMMqafYNCa70+YHwQNQnMrskd8K0vLK2ZSHSMeE1WlJUaHlK?=
 =?us-ascii?Q?A3BMck4AlHFYw5jMR3Op+PH/9rph4eTU5Yb6eDcNfvuBn/wUtjlyqyORtvh8?=
 =?us-ascii?Q?O7IHtFcJEruB0o6hFgeL84VFKCWIZMuX/yHZ+RLO9CM7NL7l19noTsXsCl/V?=
 =?us-ascii?Q?MymQk45VfV3PTR8D/gBXktI6Pn9L14UGRbC/FmhUsexDj/Ux7EYEbK8uOAfC?=
 =?us-ascii?Q?AegA8uBHygx3N5ULbAPXjhrLj/l2QjpE9CP1tgKotpq8EasQzqrYfF92YAMY?=
 =?us-ascii?Q?a2PS3gOB7sfJiettnxUV9baEFkyw7v6Tr5tW61ciLfYZ47LUgjT79jTlcYEg?=
 =?us-ascii?Q?E0sfR4iTUlscPKiVgITquJo4VMNw7rR4DaCpN4acYGeXiC3+BGqjAZc+8Vz9?=
 =?us-ascii?Q?lGAMEBRhFUO2fAclZl7E9zLMM4KmQwLBS0rh4kYQv2YLboUrej9/3SB2TV05?=
 =?us-ascii?Q?UZJ+mkVDfFLKpw3vHjZopD96kgPDpZB34stVdzE0KxLylst3+6SwAP364Pa1?=
 =?us-ascii?Q?lJtuoT7TglqwYspvuvQflrlIqJTGVx/RQU0DVP6IzS76Uwoq9mXrXc0nfsLy?=
 =?us-ascii?Q?QvLf6wOjD8PFURhhn0b6RhcgQ9WWK47wk4sSQ28lon4mHP/u0NghhtrAvcg7?=
 =?us-ascii?Q?+ExFIduHEbcVAFvuM1d16bHN+jKNLnnvRdPjaqJwxsXhFEYZkffrmDEWa1eA?=
 =?us-ascii?Q?pNI09vxIb6YpkCHwtj47cQcBWYZ9Yz8mZD3Y8SLBuQODF9kDVoSQ8GIt+Y+M?=
 =?us-ascii?Q?ZAmLtwBPsLvZPp6MmhmyWMj1WePRiyo1C5Q85iclzTVq6aRsTGKHskE/mqdm?=
 =?us-ascii?Q?y3VR+K9ahv+f2ST1Fr/bxXreqoBOJMnFhFy9jRNyDlpCPmRKWWUkPWpgvbju?=
 =?us-ascii?Q?1MrP+qadCikQyVVJbHdgF2UMjVrlVW3p1RTuh5YDHNKQ1XHeox2asR+5Zz/8?=
 =?us-ascii?Q?+2fn02HgVsxGcg1rSwQdNYdx/PCBhcyxj/RpwRLg3MsrlNoxJaiP9ROH3yVQ?=
 =?us-ascii?Q?+sl5QWyaDn7ouyKwUrR3wY2LCc7WCKACuds4PwFZhvHk4odtjN0xj4zBGlp5?=
 =?us-ascii?Q?BoVeBCQhlrYuqhzIv/YZgRvUKML5H1hoCprOhP6B7w1FwS2StM1IjylP8mq6?=
 =?us-ascii?Q?1Rwv2A6GqqeDEbnHRaAAs33ac7tACdsWGjU4+KZdQMJHyHJIVW+2Cf3ZQnWk?=
 =?us-ascii?Q?+2QTwPVQqYZXpcDACLOJangrOdA8c+kfBNbVGfdD7yA0pgpOxtyp4L3MeBqR?=
 =?us-ascii?Q?FRgJMBrbVa7cuFdo7f+7AwqcpzEc9zWDcRVg9hEIcc7MB1hkhwKdmwY0CKCZ?=
 =?us-ascii?Q?0GXviFroBRXQQOJIRO2Q3KEzqUqSQoc+YG5aTmif51vdrbYddQmu8pHuzrhq?=
 =?us-ascii?Q?riZo3ncrmvDZT2yy94775YQa0IMMBWlxiMT5nkkFFrIj+eP6UzacBKsY43aD?=
 =?us-ascii?Q?KsHa7IhbF0SvsG2vpecrS+4WhG/WZ0o4tK7Ff8QE1UXf+qDoj86T6GV+i5aD?=
 =?us-ascii?Q?GpWiH+W8dTVlu+GbtP2i7r1jXmGmBWdAsHpSAlphzGphv7j63lcZ1cl7ehPr?=
 =?us-ascii?Q?6xh+tYvvENRG1vN60rIgV4dnpgDo/AgD2GFNL4ptiuHGkX1aq4zhP0bzxeEO?=
 =?us-ascii?Q?mIdwEhuibN2kC4VHhlcGjy+quH+eCsiynEV3fYYldCKGVkW1WrrcUFqutFjE?=
 =?us-ascii?Q?q1nIf8CiEy/rOCQ7GPLN/0kmYtw2ChYREyMBWW4QUoPxQUOZooT6+kizzldt?=
 =?us-ascii?Q?TsT0Q3c9MBOY6rOcZ5Qw3haxJ4jCQ/o=3D?=
X-Exchange-RoutingPolicyChecked: aB3ic0T8Qta/WO+UP/2o+e31tQL/l5c1ifivZYIVyt2+5EetBDzJsBjAGJz5uZcTRtRDiQAnfbwUIeuRpc9IZU6QmM8D03yPp4Hbda5fkl0Th4sn7J7LNnax0bDplVQLnbAExdLx66E9Dylzn8fc0NZqQK+mq1LzB0NU00Ug938lFc7ApfBGkDp1AJv328PM4xQFYyQLy+IavxZODc9wYPkaWXngdFZSgEDF4PxVRazm9JI9IYb9y8LpFVgv9VjxbbrUf/jEKZVMCXcn3UW8RRfLoUJlYj2z7dvfmjn98pG7KDs04un7acYQj4I0CfcSEP5fD2/Dsym+uouFUWeFTg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: gVn40aWX80NslTFNIO5aUa0tSYhaXn+oI7E0dHu7t1UxhWCU3dQ/5+ivYkwXITDJrYhqHayGdgjXG7BnkavZx270CG41Tzv/Dx/qw487mgopOmAVnjq4TbZAteMvtlee+Y/WdrkojdSSMw3SzKikHKeUJXkrATiUITwK8H1gse3OaUiWelWuYtwdojVxIpPFhywcPbxDrKMsRoqCOjSg5CiZJvz8TkWqhjnqLnivHYL6Mxg214aEImnun4TDZBoeGjFB2mU7aMw+AbC1RT0naL6g41F0NpN0Z2rDl9438A27rmAuuCMnrxErsHmeI6fJZifiMEOKTUmEoVfbFwL2gzL5CbuNTT//l8rplmfo3gVXUTKDlmMG/5MLOYTuP+ewwTG/efr86YghEF+QUVVhv0e4vu8wRyf9iQNr1nPcLob1GAX7TWRHTJW33KiZ4EPxjPWdQEsD0WIb153N/+jSedcqAxDTiaZvT9k2PGOwdWVj4Ib0iCmNIWBNBXkj3liNKvUMC9AJ2ZPJAmrSL62f9G9bgxnu0v0sAp5Y3scw8IirdwZX6jxq8vvLJVf0UVmnRtmrwNWgOqMrtVy75k0d1ZVrb/cJEW59lofF5V5axXc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f172689-b369-43a7-06f5-08df2c1f00de
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5409.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2026 07:19:38.3810
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CPwik4CU4qsEaWz+7ICKGTeUFh9eGf+Ztb7+vNQn3Rx3T8jL0FytPuUIDGLmSg2/N9BGpjzRkQ4soJUH8BLEq7vxZx3fdOKBcbBKY7of0Wo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5018
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 suspectscore=0 bulkscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2610020000 definitions=main-2610170027
X-Proofpoint-ORIG-GUID: MGbYiBAeULsZd26gkpfw0TPHcAxqnJHX
X-Authority-Analysis: v=2.4 cv=H9VOUOYi c=1 sm=1 tr=0 ts=6ad32195 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=x4eqshVgHu-cdnggieHk:22 a=7CQSdrXTAAAA:8 a=hVKcjfLwD2zrjd-BVogA:9
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDAyOCBTYWx0ZWRfX/TcjTNWYM2mA
 E/Y7DDFOtB9soH0zppMOzqj/633xeC/LyTo4Avai9CgNfPK4MR7dmz/j//nOziXcoDQFqvc5v4l
 d+q9W3Hm5zWeOQbIX1hb4XStyIeCt/x5ehErAWF/sbOq84Z7jpMb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDAyOCBTYWx0ZWRfX+1OFRvAHldY0
 mxu4CWqF2VQxioWvnEJMi64Cpez+rzvNomiDvNZulYmS8MESThPTqr0lWKWkGLt4yPOO2GbXpBd
 2bX4lw9eZYXWZgckm0pz+CQD4gIPxDbSdYTZLg6VzcUJ/qS8fxsNkoCT5cknku8391OvOEGiIO5
 IuGGoXUtajw0vpHIbs9Rdkr4cxqfSN+uJDjxS86aPcsIc43VSU8Vu7ysH3LR880hC7/4Hk5xJWK
 n48okb/YBJei3bJ5mGZ4LQzaeRoABiIBfcQ2zgCbwzzmk683Iayy1x6r74rkJbtR+t8WAT7UJfy
 iuqBOZY0Y1x1BK7VgmgjKM9fxFTW345IlMI25ExVuQZ9YIm8jVpgjRcomM2mgfwKH/sNxdTuV82
 k3ocshtJ0Oy5cKFl3K4LLt4YUjNsHO/GZUTi6hIOpqGHXfCCoauIMAx1OTUeG/JIe2YnEY/asIq
 nTr8D7bKBOZAwb3ZJkA==
X-Proofpoint-GUID: MGbYiBAeULsZd26gkpfw0TPHcAxqnJHX
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_002029_294556_7EB6DA1D 
X-CRM114-Status: GOOD (  17.26  )
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


Catalin Marinas <catalin.marinas@arm.com> writes:

> This Message Is From an External Sender
> This message came from outside your organization.
> Report Suspicious
>
> On Fri, Oct 16, 2026 at 12:08:24AM -0700, Ankur Arora wrote:
>> diff --git a/arch/arm64/include/asm/delay-const.h b/arch/arm64/include/asm/delay-const.h
>> new file mode 100644
>> index 000000000000..6ccdfe0a4130
>> --- /dev/null
>> +++ b/arch/arm64/include/asm/delay-const.h
>> @@ -0,0 +1,35 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +#ifndef _ASM_DELAY_CONST_H
>> +#define _ASM_DELAY_CONST_H
>> +
>> +#include <linux/math64.h>
>> +#include <linux/types.h>
>> +#include <asm/param.h>	/* For HZ */
>> +
>> +/* 2**32 / 1000000 (rounded up) */
>> +#define __usecs_to_xloops_mult	0x10C7UL
>> +
>> +/* 2**32 / 1000000000 (rounded up) */
>> +#define __nsecs_to_xloops_mult	0x5UL
>> +
>> +extern unsigned long loops_per_jiffy;
>> +static inline u64 xloops_to_cycles(u64 xloops)
>> +{
>> +	u64 loops_per_sec = (u64)loops_per_jiffy * HZ;
>> +
>> +	return mul_u64_u64_shr(xloops, loops_per_sec, 32);
>> +}
>> +
>> +static inline u64 usecs_to_cycles(u64 time_usecs)
>> +{
>> +	return xloops_to_cycles(time_usecs * __usecs_to_xloops_mult);
>> +}
>> +
>> +static inline u64 nsecs_to_cycles(u64 time_nsecs)
>> +{
>> +	return xloops_to_cycles((time_nsecs) * __nsecs_to_xloops_mult);
>> +}
>> +
>> +u64 notrace __delay_cycles(void);
>> +
>> +#endif	/* _ASM_DELAY_CONST_H */
>
> The bot reports are valid, moving these into headers pulled elsewhere
> will clash with existing functions with the same name. You fixed one but
> there's another.

Yeah I had missed out on usecs_to_cycles.

> Isn't it easier to just add an arm64_ prefix to these?
>
> Alternatively, I think we only need nsecs_to_cycles(). We have an out of
> line call to __delay_cycles() already, so can we not just add a new
> function to use directly and avoid polluting the headers:
>
> u64 arm64_wfet_deadline(u64 timeout_ns)
> {
>         return __delay_cycles() + nsecs_to_cycles(timeout_ns);
> }
> EXPORT_SYMBOL_GPL(arm64_wfet_deadline);
>
> I prefer the latter if it works.

Yes agreed this is a better fix. Avoids chasing those names in drivers
all over the place.

--
ankur

