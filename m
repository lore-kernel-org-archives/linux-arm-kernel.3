Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDABCD47CDE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 11:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LmWLPiMhlzk2HcmQ+dJzVtfkVognxMhuyYwHc8UD9sI=; b=RikTuJJIIYpAUWSko9i6VDs043
	gv7ykmUw676Rz2oWQe8dotvQzCaLgDQNH4wf+2vbsmQh1QFm5ELP38PUXeBJkwx56qnk+DtwSJFKU
	CXEq2vaqdneWt4Gtdj94ZjJfXhBUTndGNP+/vGScCGpq32GfX/Kyf1YAMKeMrv5EP6UWRCQXAUrOO
	CC6X20vOonjQASlf5ARkohp/EDFNhAftxtYnJi0vgSOIenGGqQVhcyURyyk0tlLfCW4/yY2V6xBnL
	79hi25cKwmnK5PIGMFeN8rVYmuczheQ+VBxjANziJRKGau8fzH+mCYGLknDFc3sss8dj5qN0/m5VW
	JrGU+iyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vghmu-0000000E1H6-2NiJ;
	Fri, 16 Jan 2026 11:14:44 +0000
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vghmr-0000000E1Gj-1Bjf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 11:14:42 +0000
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FNNH8Q1910018;
	Fri, 16 Jan 2026 11:14:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=LmWLPiMhlzk2HcmQ+d
	JzVtfkVognxMhuyYwHc8UD9sI=; b=fOG+ODs2/yLa6MRSZs3p7g6h80Tjz6Qm+2
	XufD49vdftXL3PbN4jmulvSSL/TdiIdpDkzJm/EWZQJmEx5EVEXuWuBN6VeiKa+b
	raVCLltYMNmGBhxgPKTrLathYtWVNv4BldZblnf/JavEWCEvkYamrXs+ukHNhA2o
	3u3hJ/hLfRrvr4FDnJVtVengXjBdd0ZRcnDkftL10GnKB1HmU6YojsVzkpqwakkw
	Dy3IXRdVBrehvqq4LmmX8jTxRdhs1HCfEv4DkwHB2N4piJdEdl43gCP6x2y9uTjY
	dD0Z8+M7voRE1+MK1QsO9W0n0RJ8VYS2axVsi6qO1jqi4HaXLtbg==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bkh7nsx6t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 16 Jan 2026 11:14:21 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60G9a3Yk004549;
	Fri, 16 Jan 2026 11:14:20 GMT
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011059.outbound.protection.outlook.com [40.107.208.59])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4bkd7cs22p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 16 Jan 2026 11:14:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=noh5qzCpM4wW6zOZQyLfsDVnfYvHn9PUdU3rRh4yCZ75X05Jd3EE5iBhJeFcFMx4bnx97TsGZpwjegfK/V1CEBRZ9usJvpevgpJuzrLALhdfBi8nuu59Z9pwabxsrdRWmxYZQRBuisn8ozbFJXl4oZUGfEK38gQVzduR01qt+fDGOdpq4KHTstBJjgAzl+BiSEZOsby1XXNJMPCGAqIFdfxMN9IIxRAx3Xt6oSL6mWLwE0kRhS6+vX3vfs6OAOmt45uF4rN2aOS+nyT8IsfMl71qCsKAS7aB9vvM1oA5vIn0lAJiVaAg2DFTsESGsn2YuiRBToag9sjnHNwU301ipg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LmWLPiMhlzk2HcmQ+dJzVtfkVognxMhuyYwHc8UD9sI=;
 b=WV3zDnEqF7OrY9VbCvAPwgVWHLxnO4DrP4lcNU4AQjB7UmnQQCf41mqEq4M1cRERGLnMCn6zzRz5mepbEkBsrKO6/RhvHWfabBg2Ma1JQ02Ufu/sg2nO0CMtwSxrRufvofnGOF9CPeTzbJK6M6k7A/2AnEk9SrP2L/xWKskzMOF4X1paqUSK0wEBjG2KwsJNgvFrzWfTi+lmwPox6OY9povBSzmc3e449A+UAYbEmM9bD2ImF/BZdh+WMrlpBSSFLQLGp+RTAroWmMLEx5JnnnZ2SW30WJDRPLMZqAjH2F2llAopK7IIETR5Fl394UpqA1KvwZRDEWxJ9QzXdZpzMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LmWLPiMhlzk2HcmQ+dJzVtfkVognxMhuyYwHc8UD9sI=;
 b=ak1pOnUmT3haAPu5hzlR42/74l2H88QQliIY+AnwyYIatv48Kvpif231eLg3PdsqSTcL4balLLyZ87MvFKoSVbvePYD0B/1cQoznGtrv+S7ZGKLSvNKaSYN+ApkPLMcGAhHxrASqVBfmASn5XZ4hkWUfZqUI+IFvNptW4750C1M=
Received: from BL4PR10MB8229.namprd10.prod.outlook.com (2603:10b6:208:4e6::14)
 by SJ5PPF2740EE012.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::795) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Fri, 16 Jan
 2026 11:14:17 +0000
Received: from BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582]) by BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582%6]) with mapi id 15.20.9520.005; Fri, 16 Jan 2026
 11:14:17 +0000
Date: Fri, 16 Jan 2026 11:14:20 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Dev Jain <dev.jain@arm.com>
Cc: Wei Yang <richard.weiyang@gmail.com>, Barry Song <21cnbao@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org,
        david@kernel.org, catalin.marinas@arm.com, will@kernel.org,
        ryan.roberts@arm.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
        rppt@kernel.org, surenb@google.com, mhocko@suse.com, riel@surriel.com,
        harry.yoo@oracle.com, jannh@google.com, willy@infradead.org,
        linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 5/5] mm: rmap: support batched unmapping for file
 large folios
Message-ID: <82580f1b-2e15-4c91-a563-0b76ad9f068d@lucifer.local>
References: <cover.1766631066.git.baolin.wang@linux.alibaba.com>
 <142919ac14d3cf70cba370808d85debe089df7b4.1766631066.git.baolin.wang@linux.alibaba.com>
 <20260106132203.kdxfvootlkxzex2l@master>
 <CAGsJ_4yKRtyADU2ZxUMgvqdrhAEL4SpZxCMRt28gNJfUf--5zQ@mail.gmail.com>
 <20260107014601.dxvq6b7ljgxwg7iu@master>
 <db4d0a19-598b-48ff-accc-f5940a481035@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <db4d0a19-598b-48ff-accc-f5940a481035@arm.com>
X-ClientProxiedBy: LO3P265CA0018.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::23) To BL4PR10MB8229.namprd10.prod.outlook.com
 (2603:10b6:208:4e6::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL4PR10MB8229:EE_|SJ5PPF2740EE012:EE_
X-MS-Office365-Filtering-Correlation-Id: 88b60759-a60e-4d42-7a6b-08de54f063af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7416014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Mkg11gvpM6SlbGDXAsTBp4bxtbaH+RvC+AoPk6k023fC18Ls1Esg9cZOUeqR?=
 =?us-ascii?Q?RCnJd/LIpRZK/Wr/s+9FHqU8/nHEY0JZQSFHl/NRyhcrGEuu3bLZUWyCi69n?=
 =?us-ascii?Q?ME2cGH5jWQfA/GmgdRlD6brwp73ndzqVgwEz6Nhj5nMeI1miu/zGGHVWewDu?=
 =?us-ascii?Q?JHZrjTMvsL96iNE50aGZldnwSgAbPsaFiojoVJ/wTAm9hMEIoxwtNA7jU9sR?=
 =?us-ascii?Q?jBoiR271FcQMQzY5tARA1kpr+1UYUkE0Nf5SeLzLqvB2/hPADBUv6wxd2WZf?=
 =?us-ascii?Q?4qXzMxllIh5F5voipaRQjxbgHK2CPixUSrciwMV7THSNKP9mk0QfuQZ83LiF?=
 =?us-ascii?Q?I6IqRdZaR1xGODQh777PtAJy0mRJawLqtHQQ4+Glfek/r+DZX0Fh2H83UrMq?=
 =?us-ascii?Q?b7XcHpaYc/3ffCvpaKeoX5extZS1sxLhqIZWjybaLgMD0YUd+4QJsSvyfXAg?=
 =?us-ascii?Q?LcFOBslDDWeBTrvn00/5hHadhRKC+tM2tzoWDWr8A8CenRGx+IICBG+RgEx5?=
 =?us-ascii?Q?Me50w7xVP0li+MYIlfPHY4t0id2S6zyGAPKCC1wJwekCUetev5Cy5r5vVS7J?=
 =?us-ascii?Q?BJkfR9R3JlfZLLTuOe0uG5scOuoxArq8BJsPK60bXHmiKJ7J2ddSd4eYVvSb?=
 =?us-ascii?Q?lSpF+FIxiX3/Xa8JfICd65c3TWBgAYzXICnA2Ne9F6rPjL6H5t1j3VbKzeDl?=
 =?us-ascii?Q?r7ts0Dipje205cLD8/RbzSKpmgRctPaPTU5sOKYOgt1RsBuV7TcsgRLe8hXS?=
 =?us-ascii?Q?c1qw2S75lYmL9UNU4GW87CGkx0GTC46ZkRUmAt3JEiEgOrjClbVvsdXui3pF?=
 =?us-ascii?Q?LMrsxRGiQF4Dvlc+lkFjT2nJ1jjsnTky5ZkfzbcRI8DFDTkxB/0QY336Igrl?=
 =?us-ascii?Q?NLxHpcNV3EGhYiv/cGI2on/qYjhPVDHEHIxSr1Z2eC5rrgzOhqhsyXmWKbpG?=
 =?us-ascii?Q?MqsPuu54lp8jkc8YiZM3wV8BMYTrubCUWDZg2CeuFAwW5uObkeRE6RkCSQSa?=
 =?us-ascii?Q?R1Cv4CRE+Gps8GEabxKGCxgXJNA2Q4h1K8Ybnozq/eXrvuLeHWExPOVkiYwI?=
 =?us-ascii?Q?GDYG3TScD0h2AuBTpU4gjCtBq+RNyPxKRK8/Olv7+EOBhB7R9EUB3V4Q6XO8?=
 =?us-ascii?Q?lVp9yZ1oEAJWdxmMbvMzALrePEEoHg+m0WXeH59zKdZfuXkV6VkiKvtyBLIf?=
 =?us-ascii?Q?iXL6Rdwg1rz0+uT+w6meitF//t8vdOFxYr8oplWQAROwiIeA3S91uchI5out?=
 =?us-ascii?Q?igbUe6IM3wyUHRaj+bnRUm6b2se80OukUveafbCkvEyuEsXO/OWkH1Jm9Rjb?=
 =?us-ascii?Q?rOUg1QGGMdFuM6xPFQNs63CQB4HrpcEJqcNEaxckmLZG3zRgKL1vfDYZ+cva?=
 =?us-ascii?Q?iMklBrH/xVzyCAftk4Wwr8P7bYUBaZFF1nY9TzZxH8WbIExXxDD5JiKuzcF4?=
 =?us-ascii?Q?JiaD/a/fFTGdfVCtyWE1EAGVBZykgTsJLypmtMizzUvHd7ZJE6upcPWUu++U?=
 =?us-ascii?Q?GWiauTbDVg4GvgJC7v3vBAiQHnfLoOAmi+UNpX6o8dCq5BVebM/n17OxOYdj?=
 =?us-ascii?Q?Wc31oIumTyvSbIsSiiM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL4PR10MB8229.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?A/B2lR1fNlNhL7Z5I5LMYg2XQPiHk/0hkUrgn/+4fJYO/xaUnjJ6WrtZ9VCz?=
 =?us-ascii?Q?FNQbfCyTD5p/sm1BEF5zA8gvw0miv1vZM/2UuHddDj++4SKhpRjsveCbqudz?=
 =?us-ascii?Q?dvutVTOdEuIjOrXYUYctBsnxE9Y839F5Z5cjpemifxPudoyQbUdkQ7+bqhjY?=
 =?us-ascii?Q?5y6rELU5Ra1tEdPMi+vvLwMjy4O8lwT0Svx32dl3/KG4wP1cN/q7g61IwtAf?=
 =?us-ascii?Q?/pbNaqmT6r/kVYLHwMxj1ckGRF614UKxgBvMPDvpo5xm58vp1xKi62jXLVzd?=
 =?us-ascii?Q?xeZIn5BtmOXSzj+1TeWj/EX6rtYLQJAzQoDyNbVFWEMccgs5YR2UmYyvvqHN?=
 =?us-ascii?Q?Myu40koY/PzoRlawOautHkICkFzY1/IBoLupjjxUR9XqGK/wUrdFsb0tklRg?=
 =?us-ascii?Q?GVwgfE7xqFeBzvkdY2mST7QzqDLxZegTAzK0HFZG8L0QC1cnuC20WDFOKwH2?=
 =?us-ascii?Q?XkfvqfgBhd+mDkFwhcf0vIiIrx4xxOPz4N4QK3XPHm7g7fXYmzVaKX28h7dr?=
 =?us-ascii?Q?o/HvN7km0qZ46caTZORW+ZPbzj9Cq1f/EMoCYG2e5VkdqMjADjV9CEyA/v5r?=
 =?us-ascii?Q?r6lN8ix1iQBqTdAYuFXnqDXLH34WDGkA+QKSxRNJAtRJhRvyzW+O2BoRUXmM?=
 =?us-ascii?Q?pMwnH6CwnRPmX5b1w8nKjvNuazd95hRGT4XIfEQKaNCOd2iKffhHnzTBXkyj?=
 =?us-ascii?Q?O5kHIEEaXV3XOdD0E5hkrdmBifFILSc2qq83PFdXa3gYimE8J20EIY0S3xAD?=
 =?us-ascii?Q?HfaBANz1A7KdNMWt78c835tZV7F2eC4KHzjuAH4Qho1s2+1uVDbFtIfXsYXg?=
 =?us-ascii?Q?cSMXuPBB+mRFgnV2BMJiQRFDlGgUCWGJ8jYE+M7d7julm1Qp+fX6G2ayDZ8D?=
 =?us-ascii?Q?ioUXP7XlZE4mKC0/AERT34QAmiWWCN7rto5pnHoXYV2KuYKCiyxu4qPxh3wi?=
 =?us-ascii?Q?JnG39iqhsN1Ilyb60e5xq4Fm7AypTDLvPL2tdelaqyG4yZTiNpt8uxuUu0qF?=
 =?us-ascii?Q?iWzFwj8x560RPtBWoshhie6mru81RZ8LXrmVNcqyqFdyn246LBVZFHBEEjiI?=
 =?us-ascii?Q?tzhFoCootARUkeVXEZJOlTUPHT54zG7lc/+aqL9+AgkS6rVfDqXyF1NqjW9U?=
 =?us-ascii?Q?5ywYxfgEFNHWQg7YKIME+A0SYhaBVYmdMqHkmXO2YT1p4RjTLJszcmoGixe9?=
 =?us-ascii?Q?KpgGK+iraiAuS3kxtK7sr4WLA9wXQs/bfTkgp4IZiHDI1xkzQZKbkx/QB9hS?=
 =?us-ascii?Q?P92DpAGKMroOBPVuRnC200iP+6Cdsgb0Q4LMhrdtkSkexI42GaHzMd9B3/bI?=
 =?us-ascii?Q?3HO0rHGkL3i8AtHoSjUUyz36LRCCGULwX4SUkIS964lMLA0Co7tDxQb1gzmp?=
 =?us-ascii?Q?yEA67gVcbdUx4rArKheBL34FnCVNArCi+KDcBk4BNC0BKcFquDI0D34uJees?=
 =?us-ascii?Q?4pluhIni9Qb6Y+bcTyg3X7slvo/lab/AdFGhrbwVeQ8NZBOxSSaA3jiXxm2h?=
 =?us-ascii?Q?phcAcWM2aYdd7R8XrU458MF/NjXxaXq7zWvlpu7nj3kcbOppctFwUdfvmE5p?=
 =?us-ascii?Q?Wj58JEixB1U2zwAN4zaRDHC3VkasxJqMATAmTuvCt+IvEvz9fIHIACZLXQnC?=
 =?us-ascii?Q?drJ1zwCuYpmTR1Hcv+qlwRDTadR3H81QiPydzerOglXe0N5x5K9fW2fSXeCj?=
 =?us-ascii?Q?5CXYQsPOg/Ybc1jk6P0h4HA+bejEOyXTxqodISPqa4ujGmaC0kfpJKUxxmSU?=
 =?us-ascii?Q?qLgjTihRy3Z1mq2LqBhb6Z+WRnQRDL0=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: oLkPTqBCYol18gaE0JCIzKZAiCRp0VnzT2o82a3u8v/r25vOBgS3F74UAiB0REUH01MV2xnm0XlYAifL+RRsjXhnqhWhLYhczO8Z2VhJysJydFZHQoUbFttoslYYZ6Nbr4kvgA4EnG6i+aM6GS4QbMBbu72mDEljFiLfl6oU+mzlDsWhos/jSkUt2GfA+8/zsb9Shy2NGSh+277tJXy+jyV22F5WXK+ss/Z9SkmGsa8v+T/TcG6xPq1HRv4agvaOOmIhC3dNCuuWptQODW4IvXklJrKkoF5+i3z0MMtSU+6NdYhE1nlu/zEXnp5I94eJIfzCSUzrLNMDlvnhs1QtKJq9QbOfKnRtfNwggGG+4zhW0SWLeirzcVYaCW5wx0bGHbiqoWFLDLJuacm2jv0sEInI/gM0k9Qd+UtK+SSnpWjknxFsXreqMxJLwQyF0AXym9R9yu/aDabKDzf9nD/ksF9YJeI8UkvP8iQU0Eufy0mkO8jfUp6Mp2Bh/SKCC8pUXb2WkRWr6DY29VvTkmNV3TkNOwGd8rL2ZJzWHYu5gd+EDY9C1AHcQiFvmsIfbTGWZ5xopyNpQlOV+hJjzUK2eb79XgoMTjXDifEYnhKf4oA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88b60759-a60e-4d42-7a6b-08de54f063af
X-MS-Exchange-CrossTenant-AuthSource: BL4PR10MB8229.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 11:14:17.5716
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5gkLzYUPX6GRwKmUEiEjNR/hKZR/6qfv0YvUnxh37wX3B0OAhI1qzFD7QTl2zKleJmiKRc3LWM+lI1Rum3IeHxByWG1TZw8pqTZ1rDaxnFo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF2740EE012
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_03,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 phishscore=0
 mlxlogscore=976 adultscore=0 suspectscore=0 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2512120000
 definitions=main-2601160081
X-Proofpoint-GUID: 2OQHWnZnpO0VEwOz3eV_evivI-GxuHBv
X-Authority-Analysis: v=2.4 cv=X7Bf6WTe c=1 sm=1 tr=0 ts=696a1d8d cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=d0Bs_iWOTQPGxvJmqcUA:9 a=CjuIK1q_8ugA:10
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA4MSBTYWx0ZWRfX84AULkqZT68o
 3C5vKlfiHb8d+YTXjTB9pzXCdFV3v7C14HjjJQuU7yWVCvVAQq2BGAf6H3FkrbQmWORVn73B9y8
 FUhu23RBRZUfIyD6CSOcAgXVtBVxtUEYyLD/ZmQMJSZIO7VzTCGLjht9tJPlXwGJXYrZMrvP4Hp
 5vFVPY7e2T4++rbZfQ5UZaHjuC+LHd3MYWG9G094+6uspoUR9RryLgVjLnoIBUgqv9FqJJOot5g
 FgFJqhtPQGLOi1UplIdK4Fq7PRd23Ih1D5EexQVMBtcHvsHhoSwKX+zKD+vhLS+1aLkJ6AUFmk5
 dO/iaO98zHOr0jsqdrqAry7vvAY3a4gj6H9DlTTrm4XoADQbDnHHqjpF/COXrE1OsHPfGL9qcnN
 pJ6+vE1k8zSO3JoOR6Gb4tyQ5J9Aq+zyO15CIhsDVWZsqQJ/JUe0QHwci/hpf/w2ycNx9lmppk2
 ZqgJVXNIBT6U1eUzmTA==
X-Proofpoint-ORIG-GUID: 2OQHWnZnpO0VEwOz3eV_evivI-GxuHBv
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_031441_447616_8B2FEFBD 
X-CRM114-Status: GOOD (  14.09  )
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

On Fri, Jan 16, 2026 at 03:23:02PM +0530, Dev Jain wrote:
> I am of the opinion that we should do something like this. In the internal pvmw code,
> we keep skipping ptes till the ptes are none. With my proposed uffd-fix [1], if the old
> ptes were uffd-wp armed, pte_install_uffd_wp_if_needed will convert all ptes from none
> to not none, and we will lose the batching effect. I also plan to extend support to
> anonymous folios (therefore generalizing for all types of memory) which will set a
> batch of ptes as swap, and the internal pvmw code won't be able to skip through the
> batch.
>
>
> [1] https://lore.kernel.org/linux-mm/20260116082721.275178-1-dev.jain@arm.com/

No, as I told you, the correct course is to make your suggestion here with
perhaps a suggested fix-patch, please let's not split the discussion
between _the actual series where the issue exists_ and an invalid patch
report, it makes it _super hard_ to track what on earth is going on here.

Now anybody responding will be inclined to reply there and it's a total
mess...

Thanks, Lorenzo

