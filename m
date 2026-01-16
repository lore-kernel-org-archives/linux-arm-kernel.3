Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E56FBD4A612
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 08:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Iy32DvVjFhC/ZaUBRHEl2ojKu912dgkG6W3wGWhkCI=; b=DoQbqJMovRqC9/B95yvaApFHbs
	CdJIgxgWt7wi9J2OQv9pB57d+8ZB2nJ3L9NXYm0cZlAfQNGhgFrL1HC7ciKGknyr6vzWcOZESNh11
	r8LuynVShh9rYj308qJVTEtgiqx6x3sg7XfJM3r2qpcV0KJuZDCIyvcr9m2RDwGB5pgWP4Phn7PaY
	l6Pm7BUIJOKAmB7OJJGYVWsMIAx3ssYcnD+5ZlWF0Z01M5UUctxsP6yPfJF8QwtzQY6mjywfF0bBX
	7pJSH6FpAnYYnmjlVM0rHbitb8OFIT7h24g436v6wtVm2g9d3FJeANsLTWi5WQbJtp5xgaJYLf7bw
	N6UAK2HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgfPJ-0000000DmoZ-3QNL;
	Fri, 16 Jan 2026 08:42:13 +0000
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgfPG-0000000Dmnc-46H9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 08:42:12 +0000
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FNNEcG2455755;
	Fri, 16 Jan 2026 08:41:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=1Iy32DvVjFhC/ZaUBR
	HEl2ojKu912dgkG6W3wGWhkCI=; b=CswZvGCvENuMOPM1zofjpTu044SQZ53RL8
	bC3WNLUitkH4e9bEgFiZuxLscX3089E2+qD/SVhXcfL3xLdsQ/XZdverQEQrFK5T
	SsWBi17YVEQ9JosjyJr/cmnIgHgZt//n18FqaeooINmehqpG2DlH8+leTvH+hbnd
	MUtqemiljQe9gvIaFalvKePi7xzBZmcvgPSTyCwUoCnWOUY8wwyKYCEWijVnEI8N
	dICzxUg6Q2fdXJBYQ/vAiIQ8/jTUYxOGlZ0vRk7FGMpPMBUpoIpVoXpsWPsoE5C6
	s4L9HlpvxMmzSevwtw6UgzMeX1Vqvhnq1dyvUkFq5920CTqQM7Ng==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bp5p3d153-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 16 Jan 2026 08:41:49 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60G6nRqr035308;
	Fri, 16 Jan 2026 08:41:48 GMT
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011054.outbound.protection.outlook.com [52.101.52.54])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4bkd7cnfsu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 16 Jan 2026 08:41:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NwMFCFoNMPADXML7YMZLLBl68Ny7Un1W9ANGBKy5UEyCDNmKHv5GtEn5fAEE7qy2QvOFVGCQ3dXXHWJO1rQKerQmLUBZQyneP3xaoMzSDaSxXNUG2L13ueEUnp/F6XZKs1JWFt80mbk0sF9huek8ziLoTD6ITVqaGBMr9yhrrrB0JZZm/+XzMLj1pOPvOCSV0f1KJkzpiEuLeqr2eDRPTXRR+DmN1af5VkyJaFMNgI77s9ZvZ8WOOycdTD2X6Z/XJhUs1zpOfRNuhHDuSF2E2Tz/XMEqo2EmHJbKhuoIB/unC4yjOf6cQrkmWpgbgqjFFJ0NfZBy/1jWwzfigtp83Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Iy32DvVjFhC/ZaUBRHEl2ojKu912dgkG6W3wGWhkCI=;
 b=sz2zieRZFX8kyTojjh06xHBW3z4M15AMRjIO6jZl/7tAKFv/Ho7idHIL7qZPShmJTbhN9bLm9RNAKo+7fJOG9ROKUkCJkWqYfdn5HJqHrWEOohZWYHWb/5zfy7KeWVTYyao8VGdPpIoV88RxxclsR4Im198M24lvqClOyIjMDvNloVHutET3jnFidksQRHWqaPt2vL8Kp3xx0LhtQqI73mXQ13OGx/Hfl/e8ONnElwviu35zOoNMkofgQknH4ZMW3MI5y8IopS3b0NpHs3fX1225S7TsPTo2BVxMpHRnMcHP3C/nGnLMrniDDQRRE+Ak2LiqbeP5fguL7tpVm1d2jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Iy32DvVjFhC/ZaUBRHEl2ojKu912dgkG6W3wGWhkCI=;
 b=UYsOhXXID4Om4FpcZENahvS30ST6pJ4503p3C3K+Qz6k5nYeX0GzD6SxiHnnkdwnXl5p3PuOTv/iDDFuVpScxGNtarVRJlRp4q/5Dx0risWzTw1bXVGnWk5mCNjdtCpfZCKxgIGhQzyYRelhWs7Urtrh3D+XQJ2QZmN1NrWv5sI=
Received: from BL4PR10MB8229.namprd10.prod.outlook.com (2603:10b6:208:4e6::14)
 by DS0PR10MB7343.namprd10.prod.outlook.com (2603:10b6:8:fd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Fri, 16 Jan
 2026 08:41:42 +0000
Received: from BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582]) by BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582%6]) with mapi id 15.20.9520.005; Fri, 16 Jan 2026
 08:41:42 +0000
Date: Fri, 16 Jan 2026 08:41:44 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: akpm@linux-foundation.org, david@kernel.org, catalin.marinas@arm.com,
        will@kernel.org, ryan.roberts@arm.com, Liam.Howlett@oracle.com,
        vbabka@suse.cz, rppt@kernel.org, surenb@google.com, mhocko@suse.com,
        riel@surriel.com, harry.yoo@oracle.com, jannh@google.com,
        willy@infradead.org, baohua@kernel.org, dev.jain@arm.com,
        linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/5] support batch checking of references and
 unmapping for large folios
Message-ID: <c285f2fb-b64d-4932-b9ae-ef420097728e@lucifer.local>
References: <cover.1766631066.git.baolin.wang@linux.alibaba.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1766631066.git.baolin.wang@linux.alibaba.com>
X-ClientProxiedBy: LO6P123CA0034.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2fe::16) To BL4PR10MB8229.namprd10.prod.outlook.com
 (2603:10b6:208:4e6::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL4PR10MB8229:EE_|DS0PR10MB7343:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c8e121a-a512-4b6e-1301-08de54db1299
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NiDXhoSMaz8BREkJ4UJ8ItrvyZHPooJZsVCD4MQO7IB4runGsZgP2pcH45An?=
 =?us-ascii?Q?g76HeosNdAFEHrDCv0hsd7lnbJWajpqHZQ+U4f55tEK5UolaN3QVQVS+umaG?=
 =?us-ascii?Q?3qydaFWT7n1uV8KV5Db14tqjMyAWSmD5epIit2K/8HdtxEPLy9oVXOtUkIPT?=
 =?us-ascii?Q?HARMYuUmMWr1CiGXye1K31+/yLAIx7GR6SP3kFhMMo4OqUv4U2y1j/a/LXLZ?=
 =?us-ascii?Q?8z2ouy7TL0Bz0eybJwmXY1JoFm6M8V5E9+hVdKU2VW3c+hRJhWlT8HCMRzWo?=
 =?us-ascii?Q?J2QRXcNGxAcfp6qrhrYre7qm261dUg6G6hEygLhn/SZaAm0FrEUqLF6hlzXf?=
 =?us-ascii?Q?kI4r9YOTzlsXtwzJEySqWYkjSiQpK0r0TcrfuTuv0VkZA0H4mtjqPK0G4hpK?=
 =?us-ascii?Q?ddaePUuDqjz19qGP95L1hV7agW3ocBiUmUlZzkj18M+8/+6vFmDe3OUH6HSx?=
 =?us-ascii?Q?PQxGwdOXvscj7p4aF814qUcV3oVE4SKPai8ZiE1phCevG9SdkxH+uXnj4hxO?=
 =?us-ascii?Q?Xh8KfS1M65+I/cUJhNlKcr4PFgyfHsM3DLm3MP2q4z4//IuqYoC7UyhYYStD?=
 =?us-ascii?Q?8JuaXBXbVc6r+Mdd6PNy2N1O8/MRo8hQeBnRYmmxe3cSE9ytsEnG49V7gNjo?=
 =?us-ascii?Q?KPnUEvQKXJmh2QzN3njfXz6SkeU6sRaWkZp7aYERQ6H0eHqmDoJzlgHS3BQE?=
 =?us-ascii?Q?XLlQctlZ/ki7Ko1cInivLOMZEjDhLai2eUYgZFbDvDcUfeF+7VMpti8QaHu0?=
 =?us-ascii?Q?mQ/opf1MBifEomCnWDIIXnmep9R5mT6l1MgtATDoYF/xWfnT9AE7UTisUPmC?=
 =?us-ascii?Q?P7cFYwrTDVOjOWEs5Ly2Nz2VFbC1iKw0qWiBgHTiyfrKln5fBU/d8/SWjBjt?=
 =?us-ascii?Q?YLrq4nigOkuGz0SJF5K8ajtnSWyhUHIbf70W9wEleGPGHAk89m3lwAd1Lbm3?=
 =?us-ascii?Q?nfMd1v/k969xLNqLOl4b7w+rrOr3Uo7C6dzZrH7ade0nPTcEj5hamM4nLiPR?=
 =?us-ascii?Q?Y1fwlAIU5aZ8/Fvs3ZJWxwvErC4tF8INCoA/mdRozQj0N78jeZjVd21vrKN1?=
 =?us-ascii?Q?exW8HzGSyauCPQxYcK2XUPyMhIL8VrcAA8HaAMCb9cR1CIoocb/AHhZZPlN0?=
 =?us-ascii?Q?wBXMSw6BmYhRpqFJNp+PZkfTqKn0lV63npdwUEmrOJTv3dNmwXtd7pgnxg5y?=
 =?us-ascii?Q?Wh1rWe5x9pY/7QtTPqwI+82WTS1Hi4GSb6FgQ41F8dRH/rfQPrlwn/vJiVA0?=
 =?us-ascii?Q?T04KkwhW8ZxlAr4fxGwH4Eqfo8Jg5U1drlSuEKsLYHlggfb+T9a58oJXGi4C?=
 =?us-ascii?Q?w1oAa6cuRQsMOKpjn5BPGJiAR+rziq5RbDIE3Y4c9SHNQCCOTnM1IOY6csk4?=
 =?us-ascii?Q?QFDBha3hzBDJz/1jzlA03T8QP1pSzqf1h2IYDz/zUgaiWeN1BY9M69gEWIet?=
 =?us-ascii?Q?BDTgQoI+D/ldyerH52f34JN8Uuw1dd82I3ETe1tPjPbfQqdfsB+poYZSl8z4?=
 =?us-ascii?Q?gB2pxOFVAqvJ3NHD5Klz7SVlFjzfyPOXbWR/kYNDcGQWCzViaEtMSAqaQb1L?=
 =?us-ascii?Q?e2q+sYMk9EqeGH+EoUA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL4PR10MB8229.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rwfogB1gumUmodNoqJrO/rIGFD0Z/WEwYF/nXiDCMNjbSdeRg+26f55MoWzs?=
 =?us-ascii?Q?fmxaO+LuZdn7/fPJJr/IQAFP3TYmlIQaum9OhuqPUETFJc/xSY4dn1usvXku?=
 =?us-ascii?Q?0oycmh6e6p1MFFUU37pEeHsmLH3QoMf9mlqeNU1RN2T0Ab7SQbDBlGHgQZVs?=
 =?us-ascii?Q?Fk4KH+Ry6ojwUuUSqF//6YKP9gLfi4uKtezRVYaPARBxEXr05cM4r0bfD+c7?=
 =?us-ascii?Q?PDUrMp78srcEUvcBrhdJ0r01n4PJQ+S78oAFQwENTl7dzFVx1i+NESaJiKVY?=
 =?us-ascii?Q?7pbIKpvJ4TSbVjzVVnPfFAw81HWh8e1g42HVQzMY2WGsR2N15K1Q36ZX1gH2?=
 =?us-ascii?Q?4tUMeEWGs+xGcfjmigVurZZvdOXidnVSzYIf5ip1imJ59UVlPyCTYTHNs/M5?=
 =?us-ascii?Q?St1RniskvQQgsDN9WmVfuH3B3QTcKyiPtpIQv80BXJHP1VVcxjrbZ1/+5e3/?=
 =?us-ascii?Q?pafJ5v6P/UVCzxNge9d9J2SPmue8+iGaMJCJ3fCw7K6zHCHRgAUljECcdb1I?=
 =?us-ascii?Q?MQ4EGMYYnhhw853j08xHPKwrlE9UqVxmpGaidnXiTrs9161Xjs97R+UFFnEL?=
 =?us-ascii?Q?30XCifceWMEfbevvloBgAKmCe0xJc5DBCqEyhE7b+QMzOWBB6lYItDD6LgTm?=
 =?us-ascii?Q?+riSjWmMw/flDfyDBMN9JdfQ8PjpLgDPWTFJNylQVJb7kLPgThe4jEGA+14K?=
 =?us-ascii?Q?vJ6Eb/OsOv42A5E/F8SX6VJC/v4lqvzGV+k//nmCl8A8zJorhiYUSoLl5bSG?=
 =?us-ascii?Q?UYIt5VleQabo1UmPq7UshMt5lj5TdkPDoARF8+HoQzmsWqILh2s6X2YjGQkN?=
 =?us-ascii?Q?/if3j0G24ishZXmHgnOiQV9B1FDnOPsC8plSyrRTUV/p85bZHpX5K/aRK1ay?=
 =?us-ascii?Q?3hNiE58TO+vj+OjCAOhasx0oYvmtlUNOGGbWk1YXH6MjphYwPQ1ihu2n0Bg+?=
 =?us-ascii?Q?iVn2um439yMrxqpjza4+UvPub3SCEBP0k/TZlprIW/nf0TPN1DywMjSIGHQ6?=
 =?us-ascii?Q?n1XaXOZ92aTy7CxIVozwH6ITjJaecLzIPMa1wNWYZRygbqa4A9SglKf/UFA7?=
 =?us-ascii?Q?mvjMjdveJC6KEI3ZWxMc09OWSCPdje+ybNl6iMQnxffiViFfOReO4Pjm/uXW?=
 =?us-ascii?Q?VH+eaiZWwrI39irwwHvHKbYy9LsE17BoAeITLSt+wdrIxk9/0K3QPaFYaOSy?=
 =?us-ascii?Q?mo8K02wwrWmxYU+Z163Pnwd+LA/gFQZMOC8dmdfCNeQ6u8/vAKgwpzYCyYfW?=
 =?us-ascii?Q?xXldskQKkvghOGGrjyvpX1kbtNUXvzvSs4eoCxVUc6yOkRV1VLv4paKGYbBF?=
 =?us-ascii?Q?HTuG66oaQjOYvbtlYsmh4r/L01QzK72alyvWjW/YZqp+XckakGCqQq0IVrgQ?=
 =?us-ascii?Q?/fUz/kdLMoVnZ5BqZMo1kVDwbN5C9jSEcJHRIP89P8iw8adcbSqn7dohfvMT?=
 =?us-ascii?Q?1nq8ZEyKOq9ZYbBZkxtw3+qlPXE5brq4xUjk0h4nL3Wot9ePDJ47M63YMpPh?=
 =?us-ascii?Q?pJUiBuMSEOsrN/Mo/BrO+u5LDjgCijIKizYvXzghotlSaEZKTMMqppUamyVt?=
 =?us-ascii?Q?twcOYk6irk5ziGJmqBzTqbH2PCWXr1mWJP3J5ct7VkrDGgZ/ZkB9uRLUFIFV?=
 =?us-ascii?Q?DuQlbRVENTpU/hxFwuX3pAdc43qTg34pRVIqsbYYMAlEYy27cNAzOn3ZZJxO?=
 =?us-ascii?Q?bNAQQELkzivumhCokuC+pLxyUNJaseAGaruUCVwLDhNpcwZDYOBoVxC3U0He?=
 =?us-ascii?Q?5keouyAQNc9FdAX7BYrTswW9gai8D1Q=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: x4OtSNA41+KEgcA/y3sp2ALlIVfRJnsh5srMA31S3RPHksbg4dbc+ER/LdhDTJZkSNI4n6oK4KBj68kPRDU0hgoImXcaVsRhf5+OUDBUOD3XJCBIl5lf1Y6DrI/pCzGROJtHlX3ts+9/Xyt2vaAiZ2mw3AiBStK63BObiciG8GSSKniWChH+v1u70LVFYs1auDtjqAmLF89rF9MvVz8SM3p7etnAVNyScAibiN0rschzBWia7i+fQY9DH5XevYFvWC2qri83e+Wm7N9B5HT+ISLKW62GX+Pd8MItrWa6G98kPhNH3Yxoy1wZL6Ur0CZ5ZRUOV6bFmdUm2JcFPJYnMvjYjv3+2Yz6am/he33fWy2prspp2mP/VHrBktGchqAUT53AXRj+kLna1/dtN47CRG6jBmeih5lDoVvfDUWOFDyju/JGCDELFeCNM+KCvEhNCgi+2FtJG0FPrrkkbMyAgLh7SKwjEkiX205bdoZ0qYShDtlFjaXB1UPxVIY08WuxEWQsbnWoI5Z1dioLRYrvQHcVwiA5ROnbHJYFxh9xZWdZzq7sYtGIkO9p4s0V0BPjuKe/zol7uWIFZ2aGRXBBEsjB1yh5CDWEgcj4fQyjniw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c8e121a-a512-4b6e-1301-08de54db1299
X-MS-Exchange-CrossTenant-AuthSource: BL4PR10MB8229.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 08:41:42.1117
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zph+OVTcI/ewfb5DIzi8N9Xzz+u2TT9B6DO5U4r15ta25XlkH4TjjaD6CUiymvExTMrBD/4ebphIwjpG5ZXqPSphFz9w54eWmedd/ewNCy4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7343
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_02,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 bulkscore=0 malwarescore=0 phishscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2512120000
 definitions=main-2601160062
X-Authority-Analysis: v=2.4 cv=OJUqHCaB c=1 sm=1 tr=0 ts=6969f9cd b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=O5N6LRB6c10nbTEINNUA:9 a=CjuIK1q_8ugA:10
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: SMOg7FSt-LJ-Hsd7-geW1-N6Rv53XGb0
X-Proofpoint-GUID: SMOg7FSt-LJ-Hsd7-geW1-N6Rv53XGb0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA2MyBTYWx0ZWRfX9NVF+y0RNe4M
 kmMnnY4eJ/JcEzym8ekb8kBe4BD0ItbbASvwdKaZz4PfA6qxLNU/YjdTe9u4KtcYjNDKSjIh13q
 +1Op70Qj2+Y3k/pgg5l6A5+afcvRRirLk01tEUg6VVuoIARB7B5dbhQtpKiiYm4g1dTMoxlUlW6
 fagi0+ib8l0mXj6qdkWQPqxsfmUP4zw5ZMA8VShtAjF6ue26MnP+un8kx+jsMs3yAyZLWbRdrhk
 z9qtVq/StCWK5nnCmIVgm8F5HVA1+Odbi1LD8cA26GN3d9PvCdxY/8o2L7F7K6mOsQ9dZBXr4sL
 Tykz9hBSxOD1MVDW07tnsgyhqIYYF41P/9SK9K5YQCgG9TuZDsfpSlIUIHuwFc6eQ8ZwzjJgWXC
 FiLYG0xGQcvSa8lccbrF19ilTIBRnMcXytjYGxj1OwMQcVA8xkLPFK9xPS07Gl0ZX7pBPnNS0v+
 9l8659hAKadoMKlQyvQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_004211_133794_5410221D 
X-CRM114-Status: GOOD (  23.88  )
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

Andrew -

I know this has had a lot of attention, but can we hold off on sending this
upstream until either David or I have had a chance to review it?

Also note that Dev has discovered an issue with how this interacts with the
accursed uffd-wp logic (see [0]) so series needs a respin anyway.

Thanks, Lorenzo

[0]: https://lore.kernel.org/linux-mm/20260116082721.275178-1-dev.jain@arm.com/


On Fri, Dec 26, 2025 at 02:07:54PM +0800, Baolin Wang wrote:
> Currently, folio_referenced_one() always checks the young flag for each PTE
> sequentially, which is inefficient for large folios. This inefficiency is
> especially noticeable when reclaiming clean file-backed large folios, where
> folio_referenced() is observed as a significant performance hotspot.
>
> Moreover, on Arm architecture, which supports contiguous PTEs, there is already
> an optimization to clear the young flags for PTEs within a contiguous range.
> However, this is not sufficient. We can extend this to perform batched operations
> for the entire large folio (which might exceed the contiguous range: CONT_PTE_SIZE).
>
> Similar to folio_referenced_one(), we can also apply batched unmapping for large
> file folios to optimize the performance of file folio reclamation. By supporting
> batched checking of the young flags, flushing TLB entries, and unmapping, I can
> observed a significant performance improvements in my performance tests for file
> folios reclamation. Please check the performance data in the commit message of
> each patch.
>
> Run stress-ng and mm selftests, no issues were found.
>
> Patch 1: Add a new generic batched PTE helper that supports batched checks of
> the references for large folios.
> Patch 2 - 3: Preparation patches.
> patch 4: Implement the Arm64 arch-specific clear_flush_young_ptes().
> Patch 5: Support batched unmapping for file large folios.
>
> Changes from v4:
>  - Fix passing the incorrect 'CONT_PTES' for non-batched APIs.
>  - Rename ptep_clear_flush_young_notify() to clear_flush_young_ptes_notify() (per Ryan).
>  - Fix some coding style issues (per Ryan).
>  - Add reviewed tag from Ryan. Thanks.
>
> Changes from v3:
>  - Fix using an incorrect parameter in ptep_clear_flush_young_notify()
>    (per Liam).
>
> Changes from v2:
>  - Rearrange the patch set (per Ryan).
>  - Add pte_cont() check in clear_flush_young_ptes() (per Ryan).
>  - Add a helper to do contpte block alignment (per Ryan).
>  - Fix some coding style issues (per Lorenzo and Ryan).
>  - Add more comments and update the commit message (per Lorenzo and Ryan).
>  - Add acked tag from Barry. Thanks.
>
> Changes from v1:
>  - Add a new patch to support batched unmapping for file large folios.
>  - Update the cover letter
>
> Baolin Wang (5):
>   mm: rmap: support batched checks of the references for large folios
>   arm64: mm: factor out the address and ptep alignment into a new helper
>   arm64: mm: support batch clearing of the young flag for large folios
>   arm64: mm: implement the architecture-specific
>     clear_flush_young_ptes()
>   mm: rmap: support batched unmapping for file large folios
>
>  arch/arm64/include/asm/pgtable.h | 23 ++++++++----
>  arch/arm64/mm/contpte.c          | 62 ++++++++++++++++++++------------
>  include/linux/mmu_notifier.h     |  9 ++---
>  include/linux/pgtable.h          | 31 ++++++++++++++++
>  mm/rmap.c                        | 38 ++++++++++++++++----
>  5 files changed, 125 insertions(+), 38 deletions(-)
>
> --
> 2.47.3
>

