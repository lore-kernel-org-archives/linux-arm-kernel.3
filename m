Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26866E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 17:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5pNKG1KzyQlLZR8ygUhuQaG0AnClE0nTQ0RojS/Ngv8=; b=HaBteXZP7Z3Tf+l7IkPu2L9KGX
	NxaC0mWQSSysPAM4JRnTnAUekpyiqYutIdvM0dlm7LZYbw2Zwi9VlkmxobqmwkDUbaRszBwj6LGU1
	XvDU5NXu2EgSqlfFuUYF/5gS6wJAF79Lh2C8wT1R/zAV8EgutG0ah/3aRZlaUXnTeSYlQywrphNt4
	fzAWY/TUKPCZQs9L2RuLdfs+6g+BP/icHDyz5PsGnBL8Qx7uGSDMd4r5XviiXAar1l+mxoB3KWwX0
	XpyE3dzRBuynNaaqPxomAT+Xl8O4JCIj4zW8EamAp0yH/iR+CWNRJ9LWwE5Eow5bpqZ+DRgOj/MAt
	M/H59ctA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUr0X-000000029Ml-2Fsk;
	Mon, 06 Jan 2025 17:35:17 +0000
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUquE-000000027pv-2iCG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 17:28:47 +0000
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 506HBsP5022748;
	Mon, 6 Jan 2025 17:28:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=5pNKG1KzyQlLZR8ygU
	huQaG0AnClE0nTQ0RojS/Ngv8=; b=Oq7UHDdqDxUD3ZWkvnO1NNWno6sECGgMob
	B8tWaO340U2cvnOaMXSQDvK9mB0Xjs1P3+XItZ/fiYMxZUcWP23REEY2s/dee9LO
	yGcJpOWvnyuIIVQGMB+5QDKI4ujuVx2wRSUo8KhZbyUo13rfZI8cfYr5UZ+84heH
	gJgmxLUdgsSpQ+fo97hiaOBTWX9yE4ddtLgM/dlsLMJpyomE1j7CxaqYOi+khO7N
	Soi8Egx0cYC0K9Y1KzI8dDDzAv4wPRBNrQSFB1cdL4bvGzQ1W5st8daM5lK/T9G1
	rkbxySZQmVoQK022Vnt6DX3gRVQasGjIx4Hn0KW9+00pO38gt/wQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 43xus2b290-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 06 Jan 2025 17:28:31 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 506Gq26E020030;
	Mon, 6 Jan 2025 17:28:31 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2040.outbound.protection.outlook.com [104.47.74.40])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 43xuedt4by-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 06 Jan 2025 17:28:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cOxBzLXigysFwa9MTi3NvuTvwFta7nZTzpix5opEaJpWlsFfoQpFsefb7aqKCxDDtfGhoOs7ng1vvLPeJCo/MoxVcJQ+JPnxZNY1GN5CyIXhsV+HOLkcQVmvn0PQ+ACtwCQ5ann30v43UGWK2TuZjWX2C6f5Z3i5xsmlJCS6SbMfnSoToXYMpEnG5Ay2Bf/1p04UDPaYFJj3zz/odFe60JM83iDYxDEuN43kSB0alNN0twIQRiEOidKxwtpA1XaA/3mMagUyeRzNjHWX2O75KJfYLz1Lk4MPbiHqbi6T9gzeUpMVu47a1dAvNhGX7pu7PCw/750CL19yEDzwUqisWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5pNKG1KzyQlLZR8ygUhuQaG0AnClE0nTQ0RojS/Ngv8=;
 b=GXq8D2bNXk9apdwTvweGUptTHwqkELw9WLz3CBw2RfvIGaijrKfaOxvGUUL5A/vb7iDXW7kbnfdWgQxvSJOLiEHFJnu390AEBoRgKkUgean94MPzZjJsGao4BrSw6+BBltAKyXeZcK1/sUd3fBIbgHfjomG4EPC1z3K5WVzhOdH/BJfj43W0k2jpwByFJyT4e8n8xCgBfKW7apUDcvsUhXPhsJOzbIFuW6RfKeD19adzVUNBlCFFZTGHwMGmjSqqxfxM4O6RjEZ1xIAfD2/qxB8GngboJqI5H/jHS68UCY2kGJ3SlKmwYIvNzBg83INjtEGJJZV9uAFkFMjR3ci1NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5pNKG1KzyQlLZR8ygUhuQaG0AnClE0nTQ0RojS/Ngv8=;
 b=WKqvFSpaH5R4bIsgRfjs9z/jVwjB0Qo7ZezJ9lXvRq4y8qN7FRQ9K+LHbTm+5Zj6m5QKQjUPsD5N+owYXCYChoaA3oS1bwC5MKrxaxU0MWh5knCdxyYeCyT0fYQMZU7dpjp4brKlJAcnU1S7DDd8V2hTuUl4kJ2yb7s4lVtTw7Q=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by BLAPR10MB4897.namprd10.prod.outlook.com (2603:10b6:208:30f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.18; Mon, 6 Jan
 2025 17:28:24 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%4]) with mapi id 15.20.8314.015; Mon, 6 Jan 2025
 17:28:24 +0000
Date: Mon, 6 Jan 2025 17:28:20 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Barry Song <21cnbao@gmail.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org,
        linux-arm-kernel@lists.infradead.org, x86@kernel.org,
        linux-kernel@vger.kernel.org, ioworker0@gmail.com, david@redhat.com,
        ryan.roberts@arm.com, zhengtangquan@oppo.com, ying.huang@intel.com,
        kasong@tencent.com, chrisl@kernel.org, baolin.wang@linux.alibaba.com,
        Barry Song <v-songbaohua@oppo.com>
Subject: Re: [PATCH 0/3] mm: batched unmap lazyfree large folios during
 reclamation
Message-ID: <8dafd991-9d2a-48f2-b35d-5c2049992c84@lucifer.local>
References: <20250106031711.82855-1-21cnbao@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250106031711.82855-1-21cnbao@gmail.com>
X-ClientProxiedBy: LO4P123CA0177.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18a::20) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|BLAPR10MB4897:EE_
X-MS-Office365-Filtering-Correlation-Id: 5933f311-deb3-459e-fe4e-08dd2e778625
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?avJIHYb/QEie8iMLA4ZfP0nThc/HoOuKO+vO/ajpPOSf2DcEzCHc/KHeFy1U?=
 =?us-ascii?Q?8+vgjOndSJppjyEyP3L+ApZN2cJYjH0e3meAeSVmUVPqa5LdJYqM/NlmhECF?=
 =?us-ascii?Q?sPGOcl+6JOei8OywaMSK+Tl9F+eQJ3mpYAu5cXrqzJXC3gUIvEVfsT9oAjic?=
 =?us-ascii?Q?z78F/MKL5DYyt4fIYhsXiiG9YrVUTRLc7fQ8B17rR82Jxid3K6nIpLyERtTV?=
 =?us-ascii?Q?TJZkVZSzXWuRcKVkl1jeAH7ROpzgF5QnpSop+fEgw1bycHcFFuH4jttu6hWF?=
 =?us-ascii?Q?Zq7/inymJE+yHwfmJNAz7AsNimKznVKntBnWYPJ/q+u0hNiDwsd6m8yBflVK?=
 =?us-ascii?Q?e1I+LBidz21cpf8Xmq/1YgU+2oQ2uiNwQLoRjnWlOyjAqCMCUHbgHgSTnoPB?=
 =?us-ascii?Q?a1jctvGq/o1DYXIJ2Vbyovo8fdk+YN+y6uv4VqN4ncVU3n2UbOjSEyz0Z2Gh?=
 =?us-ascii?Q?teytPvf7kCulmNfNzqwiMbRcKYFsqxXYrAHb+5D3xdyisrNa6BnaSdaQUiIt?=
 =?us-ascii?Q?6sPCPdhIJ0YVfAxzqmJqEC8ZMvn8H1SRYLE0cIfLLsQva1Xm9cARAxMATpTv?=
 =?us-ascii?Q?wVEHaFdQGHYtZExO1euFNqfus+xASxVAWvVkl3bbolFGrOt03wlRrNyGEE1R?=
 =?us-ascii?Q?zKPTsdziaU4DNk2uBOYs+ZFzrKRagOkaJRVuSgX4ZV+kPag+lFBICyIRazUL?=
 =?us-ascii?Q?oKvmJMObGs42DHZyxV0XTT74369MaLb3Akix/7uWYyzeK8wHfBL+lbz4BnD4?=
 =?us-ascii?Q?55DUNWrz1qte9/nhHcX1BX5Wb9gMTyyXK3bcPWwPivIiGnbAPk49cmnjmedM?=
 =?us-ascii?Q?js6K019YvRdu8I9KfreA0sD8bElrwvhiLKIuhHTY5uqOepEVwrj9VfiRRyqe?=
 =?us-ascii?Q?rvr84USzhjSDRxn7lInzfZOmuclutL0+qP+TxuXJOYjBNnUPacrZptaJbPfG?=
 =?us-ascii?Q?1sVxrEI7ZL7f6wCJHmJde5qtRj6dMygYfB69m9o271Ab6X0r6f4jb4R3EnKd?=
 =?us-ascii?Q?lI+BpTUlDr7+mTM8Z1guQLPIs1850R/v6busKu6NLaJu8pk1gmFW4Jmas9n4?=
 =?us-ascii?Q?OUg35J8232FQ8Dwf/dVDcSOcXKLUHWJ86QwyO4AMRljQaHrJ65HU7bMhUnrB?=
 =?us-ascii?Q?1/a6C/D/BQ0KvEMOajDGPGe6qPFZBP9DOjKD2wq00TNnyujVSRrjIdLkVUS2?=
 =?us-ascii?Q?QGWDx0NOqVPPkaN0euGsKYiRLbDucWem1oyaQ2C9lHNLiNCEFoGQkKdEhv3W?=
 =?us-ascii?Q?mNeBGCZFbz+sBN/oAg3nEW9KSI3Lan8TzRBjoBrjZjh7s/T8SAyd9BxV9/rE?=
 =?us-ascii?Q?akBJhR8Qvf6pSSB3MedEbRRDRV5cK/5XpaiAUKJoQDD4N4sVu7RwlZzy+FCQ?=
 =?us-ascii?Q?vLFL1litQuTFc0kals9A9mAHcLfy?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3366.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QLS3eeouodSqMDjhPQqE4bitQdaeLTipm01dV+QTAA6jrSPIDwhfQoBMWJ53?=
 =?us-ascii?Q?nxidJug8tNyN5HsnVOeFgQxrvJTRQtkSFL0NPBmWYM69A7+ndcbFUpltCwEi?=
 =?us-ascii?Q?nwtRFO2WtO6PIC5av8CK08fihD0YBzuqnBdpBUQThVcPUjYJbyti07wicuDJ?=
 =?us-ascii?Q?iLK5/sIZgR12a241/Mo4nNGrtuVIm7ZGAhWzoxPuWMz0VgCWVqk77ryrZSI5?=
 =?us-ascii?Q?JuBgYd6dgpKHUTHSOne/DfViVk63v8B9YbkBLfREIxbXccyt2bC35TU7zo+r?=
 =?us-ascii?Q?mV8KOSqxl4lW95TKOBoF/WBDTYYiTMfpzS5hH77bGYr7zFrdm74yKC2QUN/Y?=
 =?us-ascii?Q?GDyNHwSkjckNPejL7BifQ79E/aZqJ3L5bYY6yAwffKbMlAkv5NqO4Bh9F+1Q?=
 =?us-ascii?Q?kZ25899RrUDbBPPvrW5+bIggH8M4vRGnS9dHL+cCmvEwqT0XhgM0M5tGbQHp?=
 =?us-ascii?Q?nmI4sb1yY0BUnWgJN9Q8VlF/ZFZJ5d/Gf/fYuPEIVw0tRO+shpyb4n5EQpW3?=
 =?us-ascii?Q?DXGGF5xbT58Bl+RWNs9887r7/d9rWPf9VucmQiAXFSY6OzRuDDLihUwpF161?=
 =?us-ascii?Q?iVhUEpzstCHpd+k4w0+J1pOk7ff/gtFuE1LNJx23A6vKTLYTjONKKsu3UIzY?=
 =?us-ascii?Q?mEbCYvnr3aTSQhnHZFi6TzuW+3p3/zrehSepw+dEMJz2kmYcMwqILkMLTC+V?=
 =?us-ascii?Q?oL4Ah3fExW8dg5yE7dfWGsbCND5KqpJiFsNIB6kipojxCnBuOa6qcY5VIKdq?=
 =?us-ascii?Q?1JRpPM5kuGVdnqin/w+jV2ecwOt91I3ILMiealzlXW5Ux0JZYdXBvKZ3zk4N?=
 =?us-ascii?Q?q8q6i4cM45FHYqtUcpmSkljEpyNMLYEH7P7aaLpur/yFDLzEu22aTCP1lsP+?=
 =?us-ascii?Q?Ehzc7OP3epREbB4Vg6HTilBSHADVUkMb0iq6vcKcrsR5CjUeWUPlLF11Ica3?=
 =?us-ascii?Q?ZNPiycxdSoWgBEt6qXdoVq9OW5kW+Pb3a98UkcMC+l7gw0dCIz9U1BMOr53V?=
 =?us-ascii?Q?rHh74Ou6oYhhKAUDAvkdW6MGKvRtUJ05AYArESCo24SC9Set0GM84+6ThBPv?=
 =?us-ascii?Q?5I1kBqBdpMaIpZrwJH/Wp/f3ENUcvfJVW+6kr/8AQ3PurA6wu+I977o/vwsU?=
 =?us-ascii?Q?a/y2wqAWqOn9BsfxZjgapO/PSVuY5Cecbgi7cl/emrgot9MQfQ06vl1lsbgD?=
 =?us-ascii?Q?/YIwRaITtk2yTvTD1ORc/11fApryynxLRimTRsKg1sYR6oLbbzWxVik38Q0y?=
 =?us-ascii?Q?Gx6x8ycVmdYuovaIWD/j8PN6vi8maVjEeWXJMy+INFimA+1ig4UStR+WhlnI?=
 =?us-ascii?Q?6z4gy6hcDTYdibAREaU3mQg5g8k6VCnL5TtC8qFgqfptKgrlai0B5Z/XXEXn?=
 =?us-ascii?Q?/mAr4Mgo/mQt2tX0lAk23QlqpB0fIlrbhR61+YzWsoDpemQOwcFV9T17weg5?=
 =?us-ascii?Q?7ag5S9PDtC+BqSdj6WNECRZL/mf0Y1Jz0XzwOSoFA7qdV1bs85uQ0CbJgtJH?=
 =?us-ascii?Q?0OC/+BKvOvQHTeCESWtxmaH3tSrfT/IXn2+ooW2jY+MiiRS+SD095e7SEp1t?=
 =?us-ascii?Q?LjAQbr23L8/LD+8dUgKRc10l0qIDIAfoOexaRnati6Zdw14XcQvtRCbCChFP?=
 =?us-ascii?Q?IA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 4fWMfi01PdBSunjKgrBhtv38lQifeYbL7K3pDKf/uhJBCTK0MyppQFjLjIrhrr5G8GrrxUnq4SpaLnC6lJW21bGxoO7MM+Iqx5OvGdJ8IUhi+rTA6Yteb//ExfFrGspM2MR3ELLZwgw/MsEivV8kpAxAdxWiXJxkpi8xoBQVuZBEhTq8uknPTYsDk7jppUrmKme9CD13pHUhSVmvqLpwrg9PAIrIfYgPpUoqPlSVkh7dqNjKAruTH+vPpXmTwYbhem1lGow9WRa3jMqc6UiMz+k3tPPawSSqAEijO8f0dkdXBp4xqVXbIenZOWLGRLQ7A+Upnae+dV7GuhfeSZWiqf95hvBd9TT5VCQXLjGilPjvRosYG6WVcbOx6825mU8G0/nohA9cFyigMfhnyRqIVSHi2zcoYHjLZSLskiWwGvs6UgMGes8USZ0ZdrwUQy0nXQS1/E0kwuNbwitDjj7q5sbAZnoQyhA7DC2LCaifmbDEHT0BMwNrDRxERNsiNnFrqiYGNWQwZnDz190PgZzXqzI+uCfPFxgUL97kDbQVjp4YF1LEydxa6glzX7tIsFu/bznUzW5SaZHsNhIOQHvLMCY9PfW3YG3dpWk38cyfqrk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5933f311-deb3-459e-fe4e-08dd2e778625
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2025 17:28:24.5604
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hTomDndRsQdD16h++Jut3rrX1HCjaYbms1Sc4NYdZyf4jh6PwjWiEW6iFvUgQIC1MxLvYpRGwneIeyHZu5Iw91FQAWa2mLpZT8PJAdBPcms=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4897
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-02_03,2025-01-06_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 adultscore=0 spamscore=0
 mlxlogscore=824 bulkscore=0 phishscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501060154
X-Proofpoint-ORIG-GUID: V7tc9NKqtnjegs18LHXOAeybl4xXcYXG
X-Proofpoint-GUID: V7tc9NKqtnjegs18LHXOAeybl4xXcYXG
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_092846_795039_F7B0B943 
X-CRM114-Status: GOOD (  15.76  )
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

On Mon, Jan 06, 2025 at 04:17:08PM +1300, Barry Song wrote:
> From: Barry Song <v-songbaohua@oppo.com>
>
> Commit 735ecdfaf4e80 ("mm/vmscan: avoid splitting lazyfree THP during
> shrink_folio_list()") prevents the splitting of MADV_FREE'd THP in madvise.c.
> However, those folios are still added to the deferred_split list in
> try_to_unmap_one() because we are unmapping PTEs and removing rmap entries
> one by one. This approach is not only slow but also increases the risk of a
> race condition where lazyfree folios are incorrectly set back to swapbacked,
> as a speculative folio_get may occur in the shrinker's callback.
>
> This patchset addresses the issue by only marking truly dirty folios as
> swapbacked as suggested by David and shifting to batched unmapping of the
> entire folio in  try_to_unmap_one(). As a result, we've observed
> deferred_split dropping to  zero and significant performance improvements
> in memory reclamation.

You've not provided any numbers? What performance improvements? Under what
workloads?

You're adding a bunch of complexity here, so I feel like we need to see
some numbers, background, etc.?

Thanks!

>
> Barry Song (3):
>   mm: set folio swapbacked iff folios are dirty in try_to_unmap_one
>   mm: Support tlbbatch flush for a range of PTEs
>   mm: Support batched unmap for lazyfree large folios during reclamation
>
>  arch/arm64/include/asm/tlbflush.h |  26 ++++----
>  arch/arm64/mm/contpte.c           |   2 +-
>  arch/x86/include/asm/tlbflush.h   |   3 +-
>  mm/rmap.c                         | 103 ++++++++++++++++++++----------
>  4 files changed, 85 insertions(+), 49 deletions(-)
>
> --
> 2.39.3 (Apple Git-146)
>

