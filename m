Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB724C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 10:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZzreyxmGbBaATDMiMYeaSU3sTfowN2TWdaxjJe8+1+8=; b=rnYJCKHy9RRk+xRM8qG+4jWeKc
	BZUogwMAiMnu1bGOGdwUcqpHhtUmAbuYzB+m2QtsDiKOCZl3B1FTL8/tnIFV/CjMIyxsL9TSU7lqG
	I9nOIjAGPooEN7TRyTo4ntadTuHNeJdIOBvuA+Cq15VnzCiGbZR1g9sLMzMGT+ltaaRNABudDFD3D
	TSozjph847r859MXxA40KY6hmsnerJOq32gaorNEDVaAu/3fMA2Is8iO+5EbSwgJHbZHcTAW3/f9l
	2D46233pmGpijYMc6v0NJK/viIdhXRZZoC4sYh7t3kKXHAGpGB8GDLxK9MgY4jpFDb1eVfZcLXOE8
	CKMjDJNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWXtx-00000004hY1-1ssG;
	Tue, 01 Jul 2025 10:07:45 +0000
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWXqm-00000004gE1-16e8;
	Tue, 01 Jul 2025 10:04:29 +0000
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5611N27U009441;
	Tue, 1 Jul 2025 10:04:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=ZzreyxmGbBaATDMiMY
	eaSU3sTfowN2TWdaxjJe8+1+8=; b=hODat181jT8L+piuixN5fIFT29cKcOWC0z
	0iz8m+K+J+hZm7yNABjz10aU4j924/Oa0iigtA7N+XOBQh3ac/x88ORVp90no26m
	bYpYlj3s27EZxNZ+mKNWiLuerAvYR/aiuJo+WCAjjmBDlWj42M8e9QniJ/Lwtags
	pIa9mCqLuIbrnlpvi7LgwSnGayZId70VUv3MMIpBRd0kNvN/hEcnstBJAl8p9Zzf
	Nkfjm/okLXxGE8aduHPhj8gY2fZRyGbWrgJJ+uQsx5QpfcDxAfr90RdUrqMwOlhB
	Nx8P9fsHecK/WRsAdlL2xJyFVsqARPGzHk6okILpxJ4ATQUzulzA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47j766cfey-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 01 Jul 2025 10:04:12 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5619hx0e011643;
	Tue, 1 Jul 2025 10:04:11 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2055.outbound.protection.outlook.com [40.107.93.55])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47j6u99w5n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 01 Jul 2025 10:04:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jJaJFq76JjMekBUgP1+RmogMUOI+6U6Orpzog7D8DAtLnXKJm/J8ZBH9Pmolwe3eXXuVCWF8auwBNPtdABzL9tddmWpAAABLmw7YLXxRV0LKUGNyh8/8fWRz1vSanvUQc7KzYA5EgfvBT628zsuoe4tS9GCzFmFw0e/cJYFtdkDca8ofVZT//c+M8Cnz+hTU2YTWfRyGzBllCNZquPr9mL6fOzYA34tVx22H5/kP63/ZvOi+6YZqSzS5NEeVzhvUYMOtmpLIT6MFeNOOTcECxBOXazh9knmL605A54044wQB7jIGKhLwmJ52rqtgR3us45T+Z/AXqsFqljjW+m0Zig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZzreyxmGbBaATDMiMYeaSU3sTfowN2TWdaxjJe8+1+8=;
 b=Db/4yUdBkA2gY/e4SDBOmAr3akFdqoiU5mQV2UbajyD/E2NeCA46EPKl6LRevpSaM/RA8UAyogPBHjywbPs9RC6RLyaoyelPZMTXDcNDep5ka1WsEKTkcBtstLkcwLAUYBpUZ2N56iOIZfAl5MFU3Zr8GtD+mK4ha/DKVUcwSNebS0ADn6w/sj3yOwVtsYT2dOESAagE5gxJSm40KIwL7mEV4H7iV1rq5FwBhrQ0g7QustBuw/G7VJykl56iU0AdMtCb2l2qBXnXB3rutZ7wCXgn6e17oPeapJ3vEzUiGjRnQd+GSL+oAy/Jg1h4St5KlC+W44YYL5O1QeEuF+e1bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZzreyxmGbBaATDMiMYeaSU3sTfowN2TWdaxjJe8+1+8=;
 b=jKdQnJ5x1ub+9AhYeFszOAvT3gQNLY3KnM87Zn23TCJ8f4PIleqiHhABYmSt+9ez3fg0TxpAOaKQowwD2x5EvKZxdL5scFuI5SqvYMHTnGyXL9rDbEj79oz7manEQujbC5rMa7kG+flvTRn+rcI1jJ/gyMa25eRZIV2mZf5jf5c=
Received: from CH3PR10MB7329.namprd10.prod.outlook.com (2603:10b6:610:12c::16)
 by DS0PR10MB6247.namprd10.prod.outlook.com (2603:10b6:8:d1::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8880.28; Tue, 1 Jul 2025 10:04:08 +0000
Received: from CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::c2a4:fdda:f0c2:6f71]) by CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::c2a4:fdda:f0c2:6f71%6]) with mapi id 15.20.8880.029; Tue, 1 Jul 2025
 10:04:08 +0000
Date: Tue, 1 Jul 2025 19:03:50 +0900
From: Harry Yoo <harry.yoo@oracle.com>
To: Barry Song <21cnbao@gmail.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org,
        baolin.wang@linux.alibaba.com, chrisl@kernel.org, david@redhat.com,
        ioworker0@gmail.com, kasong@tencent.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, lorenzo.stoakes@oracle.com,
        ryan.roberts@arm.com, v-songbaohua@oppo.com, x86@kernel.org,
        ying.huang@intel.com, zhengtangquan@oppo.com
Subject: Re: [PATCH v4 3/4] mm: Support batched unmap for lazyfree large
 folios during reclamation
Message-ID: <aGOyhvR-GaUYgLwQ@hyeyoo>
References: <20250214093015.51024-1-21cnbao@gmail.com>
 <20250214093015.51024-4-21cnbao@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250214093015.51024-4-21cnbao@gmail.com>
X-ClientProxiedBy: SEWP216CA0044.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2bd::7) To CH3PR10MB7329.namprd10.prod.outlook.com
 (2603:10b6:610:12c::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR10MB7329:EE_|DS0PR10MB6247:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c17926c-d8a3-4119-5106-08ddb8869e57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Ay3KpWOTpfmDKZ3FiuWN7p73iQtPtRGRRvEt4f9YRd5O813P9yy1dRhDEbLo?=
 =?us-ascii?Q?Sj/KbjpajQkfjKSPeDoBldE1aAlmppKZqqV2xlcpJlR1Iqr7WQPjDpq2SyZ5?=
 =?us-ascii?Q?NQlYIfksiF6STXRvAIJthDwkVLjSB1uinu24NXT/fRz9pJnWcuTiPDj8H2OI?=
 =?us-ascii?Q?jkZaCoeMu4TtAZ120iOsLie4FnakeBQqPtsYhD6lywPW4KdwT/dEBsJsCc0j?=
 =?us-ascii?Q?DRU0OBOHzYWsZofk+b80zj5JvE+vycwbX2EpwjGLz0YbELkIW1iED35vqK2m?=
 =?us-ascii?Q?8rcgUM8/uXMqcLNQMrDfYuKwmBWvRaVhRnaapGK/XaUrwBtQPmadeqjGXHIM?=
 =?us-ascii?Q?s4bJt+GZelNY9SfhOdjQPL1FhlcvZOOBOqeg4MzP64qJOT5tvIZaiksgg5rK?=
 =?us-ascii?Q?42CcCnj44oqVIZkVesIBlgm9p5SDzYLwall5yt037uEefs5MYEyzE9QknLbq?=
 =?us-ascii?Q?jG6NoFOPbNHKBqtsyoxl+hW6vH2p9G08aw8WIIFkAq9STT+Pe4fo25UnSpf0?=
 =?us-ascii?Q?EZ9h2nVSO1dNda3wb4EBHHF486AMEzn648E9boJy2OIXFd/CEtRw9XqQGTHJ?=
 =?us-ascii?Q?LFPVRNK+RUC4PXYdHl5G21KivXx9hfvOpeFC3Whu9NVvwIfpUweB47QI08a1?=
 =?us-ascii?Q?T0D1mbaiBuyTAogKbJOASPpgp3OnudYp05iW42NcipheZ2xsrTu8NaPYqIy3?=
 =?us-ascii?Q?t2iyf37Md3YkJ1YiaQQrR/f2YoYkcgzb5LOE62MCHtEhSjy47DpqF6d9Vo23?=
 =?us-ascii?Q?C0bGgbJjwBBvSJJg8S0ocOOyIbTvq5ByOl9Mh6bTL4FeAWsQZVW55ByU9SkG?=
 =?us-ascii?Q?fNJ0HnqmaUSIGKt+O+ROephBgS0mSuSpwXxH1Ss7a4YjzGOdRA1gOxW8+43W?=
 =?us-ascii?Q?pmCslfvokvv6U3TuJaEojxnwnd/Y0DDNabSF85AaA7D6UWvKEDebUu4DmPZQ?=
 =?us-ascii?Q?lFfs50GoHyDmF9qwaI+t9kaOydu1v4r5J+IjUOKQbCd7l8OrtNM6eACTDqbG?=
 =?us-ascii?Q?P2f23fZJqFofih4mOlIxGizFjPSV9PKLfgDIKMynwFzLx3cGKLUxkgjUYY30?=
 =?us-ascii?Q?51VWCQwHl0zYbWl+Jxz3M23wYUu+wqsi6jAI0Z7Nh0EO2NfUtMDPq44cjpQq?=
 =?us-ascii?Q?cZmBqOk4/1lo7YpKteNjTozTW8J5IKh1NgWpFOMpPjVh4u9xVhujp38Yk4WI?=
 =?us-ascii?Q?w2Tqnjk4hVIjTLZHG4cLk/3aTO3u2XlZG1lRawHoh+BeQccGiEXr0Oc4X6J5?=
 =?us-ascii?Q?HoSMxGjtHd0V0LGgjMgEVh05jv8fKPZTrDA6+mIvxf1VhQAtRMUUY43oGGoL?=
 =?us-ascii?Q?I1gI3f+vcIS/7QYEA7cLrhQhfq/lOBk+1CBQmzPQj95v4xaEpIvtRapQU8xz?=
 =?us-ascii?Q?4uAvDY/Q9ASLmqx4wVxA4CUUfpVk6P5jiPQTbL9xklNBkRORXvBrJO/3yPhO?=
 =?us-ascii?Q?rKgjJBZsehI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR10MB7329.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6U8n92iJWJUyprdRvwx+Mf9kmnqtblYdlTHC8cxK7ZU7YTIUUehXWJhjLZGU?=
 =?us-ascii?Q?yzZlwBy1FpwgiK3USdUg68eJOANgSgwiImj/hzaKctAKDu05yzsMwyjOBnCY?=
 =?us-ascii?Q?t8Ye7W/0IuABy9qXUVDR8KX+5gZ2XfJI6UiCG/eA3P1ipp1AoKF0BjRGBogk?=
 =?us-ascii?Q?Y046qFykLXkbxIUf0kJg+NTNMIV4jkHWn7/C1hIyKK7x53UJzHINNHz49xR+?=
 =?us-ascii?Q?4eF0bfNb7miVgmRDdTcJl5z2ysE81ECk6oxGUXjRACvbDBkEKwBHWAMyQrZX?=
 =?us-ascii?Q?y5TvQiNR1rMyhoyx5U0GKypbAAJ4FhxQW+XgwGJlhYPIJtMVOAcHzdZ4Umpp?=
 =?us-ascii?Q?7GwDQJH7XXUwEfuybVtI7M53vTKkVjrcb67iYNe6zdBQhODkR9f7t9S9uHz8?=
 =?us-ascii?Q?6aXlPhnOu+rfrwQTuVIQI037Y9mOOdk55hV4VNxz9r/7SJY67sOgL4S6+lQ4?=
 =?us-ascii?Q?YKXTLDORlNb3Bu+BY2fyIjy12VIENVcfUzsyQOlnFh+P2CWRntMsMF2z5Tmy?=
 =?us-ascii?Q?7CDfgmNqIQUZJq+PDp1A8TGGFATBBK50P7RBjiNFvZY+wPscQa47IirSor6P?=
 =?us-ascii?Q?MyvfTEi2lxhdwNb/uDNrFasp08XZoM9XAg+CinmxzlwaE0qd87GUmZr+L8Yw?=
 =?us-ascii?Q?uCwzbRw5SbeIvQYPUmual9q3JYYv3RPE9IUmTW9RtepUUPkCtb0UgX6sjllJ?=
 =?us-ascii?Q?WarQtAMhren1RXx2Gn1fnlnXJvTKyObAQvkbIU5fo1bEmKb09k/B0eUmvNCV?=
 =?us-ascii?Q?QWEkSZTZWZGQvFQIwCeW/8JjgWIOkEseQYdfeCrH0fT0gzua6JagBtj5ZYf/?=
 =?us-ascii?Q?6LGNvjG0WbynlNabyK0pd/Xr+MCX8bQzHJPjeW2BXQgheg5xJ5AkfQKypDWB?=
 =?us-ascii?Q?YVV/pfaC1LvNavVgPRhtXctcqNSTx3wNJCWyWbS5kDqHUTrwKWLuIAx8NDaR?=
 =?us-ascii?Q?P/4xtPBYhv3vD2CF0sbMj45NjK/iw9JsQSh4Jw1otugrWWPG2Tk5Hzqw9F2O?=
 =?us-ascii?Q?oH2YRwUmaQzRzNAI5B3XHC1hQvoJOguNHc41deAinTTtVynVzDhDTaNwzBwt?=
 =?us-ascii?Q?jHOTYsa7KOlVAFsh4OQFCij2C7QzpeNAC/vmLs0pnc8aTvy51Ii1x4nza/85?=
 =?us-ascii?Q?m3C87igjnJHpePyL6mgo8Agx/aIo/oPcQZRKGYT1XPb8ZEM/unY7aHjKoiGe?=
 =?us-ascii?Q?LIJOsGRWx928hPbckllVwO6t/pz/zyb59RcnvKqtfbJaaezjOa7ZtIdE8med?=
 =?us-ascii?Q?1q5fAQE/Bl86GFxz6/X4i94cIzU7czKPbDXazo3GiYmCRdIlNh2HIMd/us3q?=
 =?us-ascii?Q?AdKqpYaYzXu+KUzK6XMzp1AHUqRO5SirHFmZiU8v/xd5c16JbQRkJpNoCQRf?=
 =?us-ascii?Q?QiXGYJmOzZMpcphfcqVZhe5XR9P6Doy++/spUcgdxKYxI4msD/75Y/umwyTA?=
 =?us-ascii?Q?9NXNDSyOtwMZsfPm/XZWpRkTTNTN9OkWy4At1QUS2Y+VmecX/g50Uo7yxJl5?=
 =?us-ascii?Q?Zefx8GNOZIzb/ipT39hg205xHPprustdBN/rCOB/R7rvKAkVrJ87N3LGsq85?=
 =?us-ascii?Q?wTnr8qDeaj+HOQDDOYdKlvAeNz1qillWTG6B06ti?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: xGmGGNoExaHpUv9g7QcVlNZd61Y5XgdaEfMfayWtX6tZ+HNyXCPyB7Q4umbLdxkzeDrEz0XiOXO4nnZSJsVbzbLguItlGbEuEoH0ZB4KdhAXsWWydbCUBS+ud+RPMnRkOt3U5G3bnOA9h/v8x4h4XfvcoXlzWb7Wx32rM/X7+frhy+LaeIBTiVMON4YIrySuAzDa/cBAeM7GJguB6vORxSn3VPlgQ7i2Bg89gpo0psu7qkGIfR5oNShVp7zsBoSGZavqfmD5xFM3HjjyHKpJQg+IQpXLG7HtipU0VvWwQVWC4eH9fIw9219NRf5RdQ5kAx+PdfMg9b7rRYImaEO/t8G47OUrIBAGKjKg8w3YUCq4qrLTVSHK4PM/p5fBROyFu9XZNN3dBZAsi+pScswlcgIQgkGMKSx+m6bwgYH1eP+6BvVzEUY+Ljz2WtasXiFp4a16rHZX6n3GJF+Ad++JvIRrSg9E0OytEHe7G3ulJdUGN7EC4Yl6u20JEy8MOuH7+YiH9AwUQmydVZoWEXj2nGjMX9hB9KxgSLavO5KX0v8nlaHRnD7cOFpqHTteLEm9nsl+ovbzXOZ8I2Hl8kXyRKE0HB8dSiBmNcnbNZe0iCw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c17926c-d8a3-4119-5106-08ddb8869e57
X-MS-Exchange-CrossTenant-AuthSource: CH3PR10MB7329.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 10:04:08.0671
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DbVl4hnSK2LpfVsFDe0AC8UDAO4Bl5UVah3usXD+6Ec2a+nvRauhYmOfMpF8xbwaqS5CTggdHzNSmdbagiq91w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6247
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 phishscore=0
 suspectscore=0 mlxscore=0 bulkscore=0 adultscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2507010060
X-Proofpoint-GUID: ApuUtVUz1G07nSu8LQmXzNd2xYanEmpi
X-Proofpoint-ORIG-GUID: ApuUtVUz1G07nSu8LQmXzNd2xYanEmpi
X-Authority-Analysis: v=2.4 cv=b82y4sGx c=1 sm=1 tr=0 ts=6863b29c b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=A2pY-5KRAAAA:8 a=M8hnOpAdE7aLp3orPdMA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA2MCBTYWx0ZWRfXwp7c5pmmT9A/ uhr5Iat8WouJXEIIuGj5/lNYNhizhdLzlhzu/gWBgE0sqYPmDG/i6E+tBiwNQhG/AWSXpQJ6OO5 miinSyGCdnedpJFLQLwReOOl9LxH8+DxQhvhoGzhw0smVHrr+JMi/6dR+BC6f7AEyJkALHgJM5e
 1xaDow9Xbu3fcMTkPgGKHJSUpga/DWQudP+IDKJhJvGdKdanAdT59CEdGsh8uD8P/GIgJJqC+jm czJ9Eu6Fy/daaGc8YS7VnzCIqqsdAeKYyQVeOuJlW6rUPyE90EynyNnPnFt3d8S5DrMcP5YEhMc n3kMGL9j/BcjyYM2Ld2pTAhlfLF4AV/xAHTm+SzTpbYyohRx9fMNcHq0ja35QE9fAuL2bNBZUDg
 +ZHXgRyjOnrqddazxInUz25Nks0DapmAeg2GfyuQo1i94BBEgjOzfiwZkfSZAz6fxds0tC2d
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_030428_426291_1E501CBA 
X-CRM114-Status: GOOD (  14.88  )
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

On Fri, Feb 14, 2025 at 10:30:14PM +1300, Barry Song wrote:
> From: Barry Song <v-songbaohua@oppo.com>
> 
> Currently, the PTEs and rmap of a large folio are removed one at a time.
> This is not only slow but also causes the large folio to be unnecessarily
> added to deferred_split, which can lead to races between the
> deferred_split shrinker callback and memory reclamation. This patch
> releases all PTEs and rmap entries in a batch.
> Currently, it only handles lazyfree large folios.
> 
> The below microbench tries to reclaim 128MB lazyfree large folios
> whose sizes are 64KiB:
> 
>  #include <stdio.h>
>  #include <sys/mman.h>
>  #include <string.h>
>  #include <time.h>
> 
>  #define SIZE 128*1024*1024  // 128 MB
> 
>  unsigned long read_split_deferred()
>  {
>  	FILE *file = fopen("/sys/kernel/mm/transparent_hugepage"
> 			"/hugepages-64kB/stats/split_deferred", "r");
>  	if (!file) {
>  		perror("Error opening file");
>  		return 0;
>  	}
> 
>  	unsigned long value;
>  	if (fscanf(file, "%lu", &value) != 1) {
>  		perror("Error reading value");
>  		fclose(file);
>  		return 0;
>  	}
> 
>  	fclose(file);
>  	return value;
>  }
> 
>  int main(int argc, char *argv[])
>  {
>  	while(1) {
>  		volatile int *p = mmap(0, SIZE, PROT_READ | PROT_WRITE,
>  				MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
> 
>  		memset((void *)p, 1, SIZE);
> 
>  		madvise((void *)p, SIZE, MADV_FREE);
> 
>  		clock_t start_time = clock();
>  		unsigned long start_split = read_split_deferred();
>  		madvise((void *)p, SIZE, MADV_PAGEOUT);
>  		clock_t end_time = clock();
>  		unsigned long end_split = read_split_deferred();
> 
>  		double elapsed_time = (double)(end_time - start_time) / CLOCKS_PER_SEC;
>  		printf("Time taken by reclamation: %f seconds, split_deferred: %ld\n",
>  			elapsed_time, end_split - start_split);
> 
>  		munmap((void *)p, SIZE);
>  	}
>  	return 0;
>  }
> 
> w/o patch:
> ~ # ./a.out
> Time taken by reclamation: 0.177418 seconds, split_deferred: 2048
> Time taken by reclamation: 0.178348 seconds, split_deferred: 2048
> Time taken by reclamation: 0.174525 seconds, split_deferred: 2048
> Time taken by reclamation: 0.171620 seconds, split_deferred: 2048
> Time taken by reclamation: 0.172241 seconds, split_deferred: 2048
> Time taken by reclamation: 0.174003 seconds, split_deferred: 2048
> Time taken by reclamation: 0.171058 seconds, split_deferred: 2048
> Time taken by reclamation: 0.171993 seconds, split_deferred: 2048
> Time taken by reclamation: 0.169829 seconds, split_deferred: 2048
> Time taken by reclamation: 0.172895 seconds, split_deferred: 2048
> Time taken by reclamation: 0.176063 seconds, split_deferred: 2048
> Time taken by reclamation: 0.172568 seconds, split_deferred: 2048
> Time taken by reclamation: 0.171185 seconds, split_deferred: 2048
> Time taken by reclamation: 0.170632 seconds, split_deferred: 2048
> Time taken by reclamation: 0.170208 seconds, split_deferred: 2048
> Time taken by reclamation: 0.174192 seconds, split_deferred: 2048
> ...
> 
> w/ patch:
> ~ # ./a.out
> Time taken by reclamation: 0.074231 seconds, split_deferred: 0
> Time taken by reclamation: 0.071026 seconds, split_deferred: 0
> Time taken by reclamation: 0.072029 seconds, split_deferred: 0
> Time taken by reclamation: 0.071873 seconds, split_deferred: 0
> Time taken by reclamation: 0.073573 seconds, split_deferred: 0
> Time taken by reclamation: 0.071906 seconds, split_deferred: 0
> Time taken by reclamation: 0.073604 seconds, split_deferred: 0
> Time taken by reclamation: 0.075903 seconds, split_deferred: 0
> Time taken by reclamation: 0.073191 seconds, split_deferred: 0
> Time taken by reclamation: 0.071228 seconds, split_deferred: 0
> Time taken by reclamation: 0.071391 seconds, split_deferred: 0
> Time taken by reclamation: 0.071468 seconds, split_deferred: 0
> Time taken by reclamation: 0.071896 seconds, split_deferred: 0
> Time taken by reclamation: 0.072508 seconds, split_deferred: 0
> Time taken by reclamation: 0.071884 seconds, split_deferred: 0
> Time taken by reclamation: 0.072433 seconds, split_deferred: 0
> Time taken by reclamation: 0.071939 seconds, split_deferred: 0
> ...
> 
> Signed-off-by: Barry Song <v-songbaohua@oppo.com>
> ---

I'm still following the long discussions and follow-up patch series,
but let me ask a possibly silly question here :)

>  mm/rmap.c | 72 ++++++++++++++++++++++++++++++++++++++-----------------
>  1 file changed, 50 insertions(+), 22 deletions(-)
> 
> diff --git a/mm/rmap.c b/mm/rmap.c
> index 89e51a7a9509..8786704bd466 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -1933,23 +1953,26 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
>  			if (pte_dirty(pteval))
>  				folio_mark_dirty(folio);
>  		} else if (likely(pte_present(pteval))) {
> -			flush_cache_page(vma, address, pfn);
> -			/* Nuke the page table entry. */
> -			if (should_defer_flush(mm, flags)) {
> -				/*
> -				 * We clear the PTE but do not flush so potentially
> -				 * a remote CPU could still be writing to the folio.
> -				 * If the entry was previously clean then the
> -				 * architecture must guarantee that a clear->dirty
> -				 * transition on a cached TLB entry is written through
> -				 * and traps if the PTE is unmapped.
> -				 */
> -				pteval = ptep_get_and_clear(mm, address, pvmw.pte);
> +			if (folio_test_large(folio) && !(flags & TTU_HWPOISON) &&
> +			    can_batch_unmap_folio_ptes(address, folio, pvmw.pte))
> +				nr_pages = folio_nr_pages(folio);
> +			end_addr = address + nr_pages * PAGE_SIZE;
> +			flush_cache_range(vma, address, end_addr);
>  
> -				set_tlb_ubc_flush_pending(mm, pteval, address, address + PAGE_SIZE);
> -			} else {
> -				pteval = ptep_clear_flush(vma, address, pvmw.pte);
> -			}
> +			/* Nuke the page table entry. */
> +			pteval = get_and_clear_full_ptes(mm, address, pvmw.pte, nr_pages, 0);
> +			/*
> +			 * We clear the PTE but do not flush so potentially
> +			 * a remote CPU could still be writing to the folio.
> +			 * If the entry was previously clean then the
> +			 * architecture must guarantee that a clear->dirty
> +			 * transition on a cached TLB entry is written through
> +			 * and traps if the PTE is unmapped.
> +			 */
> +			if (should_defer_flush(mm, flags))
> +				set_tlb_ubc_flush_pending(mm, pteval, address, end_addr);

When the first pte of a PTE-mapped THP has _PAGE_PROTNONE bit set
(by NUMA balancing), can set_tlb_ubc_flush_pending() mistakenly think that
it doesn't need to flush the whole range, although some ptes in the range
doesn't have _PAGE_PROTNONE bit set?

> +			else
> +				flush_tlb_range(vma, address, end_addr);
>  			if (pte_dirty(pteval))
>  				folio_mark_dirty(folio);
>  		} else {

-- 
Cheers,
Harry / Hyeonggon

