Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11F54D41D74
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 12:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JYP+03+dQKnJshXCEzuDHHsaz6AXjPgAut8i6sBNIMk=; b=f2AkwSEpCDBMzSWeJX1HiDLTH5
	x41YeuSBfitMWFleSPz4me7GgKPr8Jz2HijXgPXFVkkjqEOypUbiBPnTH+ET57rdKjKddZyFwSpIa
	IkPOUnBBezzQ91VLtx1DwzpWv3rib0lpwaQo8qEeQMX8cDuHhoUqQJsda7ErhABzBueaY7jTn6XUx
	lgWORFjdVwzjdmCiyluY4oghUHZph7+MctkzApYHMeadFS8e9s4uw9wq3OD/sxAfAl1A5+E3lLS5N
	3YvIMF/Cr/V6wGaxJLtE8cy2WWqlwiWfb1g1F8smXbhBZygEil+7X7eMKXoy40jFlPTP73QCRWL5Z
	aB5kJEnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV7qt-00000003djy-41YT;
	Mon, 15 Dec 2025 12:38:59 +0000
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV7qr-00000003dj4-1KlK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 12:38:58 +0000
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BF9uvuv1859764;
	Mon, 15 Dec 2025 12:38:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=JYP+03+dQKnJshXCEz
	uDHHsaz6AXjPgAut8i6sBNIMk=; b=lAmYrKDhJKLai8jbKuY3aJ/9Qo3DIM4I4i
	lyae61Yvczo31M7aDzxo4r9Ephpzkvmbbjii0+0ZnMFHGM5LnyuknDJHCECXTPP2
	5yNRQDtzDOdh/+bDGx2bZi3gHO2Qf4AxSLB57DeJAry3saUh+jv42bvh30kSrITM
	3ZZNjCrS7EhwDDaOKKGDIhzKbgUK/pTomy8l582qE9ErTeallZhkD2CTyskucojJ
	Yq2nOmBPDGGNYBJzLN81PnC/PQYF1eeKhl41YHZYhx64Tc/BxWOdEctbylhTULbg
	QbU08oO30YtgKRWszH650CQshFHHLYpzxE/7cWvqaprB5Gnh5JOA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4b0xja1x92-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 15 Dec 2025 12:38:37 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5BFAaLYL022557;
	Mon, 15 Dec 2025 12:38:36 GMT
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011020.outbound.protection.outlook.com [40.93.194.20])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4b0xkhwkpa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 15 Dec 2025 12:38:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C71xQmcj9nKv61DrHj1pFi0AerD1bSnmLw6XOtLhSMj14Z29owat1jtxsEFPqKEtd1Zuh3DoOqyCEnrmLxOA4zI0aRYBQ4qFACBB31HFF/cfTbXJN3LmqRfEYceAryw7TXPQhoKEFlJHP1TQOnzXJyHP9ptPYg8mkSvhPN+DzW5fBp1UhY1906/PpRKoEfj6gyTggLqgLJqPNWNgpRIaZEGJ65xgtu2LPthqLfUKaYx2x6YeGDV5ckBEs1BlqB3HZZBpLilCGXEqoyGEVZDKULUQnStLnB1wXbZgfNDcehROZyS/RGmOVivAg15G9EQ8Ee/OdC1yEq166rsWtaB8Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JYP+03+dQKnJshXCEzuDHHsaz6AXjPgAut8i6sBNIMk=;
 b=PDA0RMMaDZndcoCKvJIRIQMCN9Pt4JNFEjkSkh2gT/scwRmBpX1wbO4xKSgB0ncdvaegWLZjMYyqkTuSuR4LIogRUW3Gz7ct8szeaYbliH3lz85cNxF6owgpgfSd3T7xJj1bVaLLgbUcmoThQNXuzD+NZLDyl0+naAXBQ9RczckfPVOzgcSsTKA10gu0RcEr5U3aXTAuitVnGQEAfnEXTgnhwiJKdaFFG2+u2SleuRZBXH27WjJQ3R+sFVd9vcVka6kP5Q6AtGpZmzk0Qp3nwosFSS+y0W/JCGKjbO5Tn/KF+8Eozd6QPjW4GYmA96mUjWZagYc7nhRjW26ze82X1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JYP+03+dQKnJshXCEzuDHHsaz6AXjPgAut8i6sBNIMk=;
 b=xv9zCAY9JERVJ1tRQqiNkMtMLY9LoyNF0gM9VbLcFax3Whe135Pk/oZvVsr+kXsrflSXGyopFNMefV9KEAA29QD2h6VKSumKNDciDS9/b991e+MNli8aFa0k/uWgzE1TiHTiL/lPYW93AKdIkIwDWBkiSh3lTVdTJaZD5fSOke8=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by DS7PR10MB5102.namprd10.prod.outlook.com (2603:10b6:5:38c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 12:38:32 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%7]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 12:38:31 +0000
Date: Mon, 15 Dec 2025 12:38:30 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: akpm@linux-foundation.org, david@kernel.org, catalin.marinas@arm.com,
        will@kernel.org, ryan.roberts@arm.com, Liam.Howlett@oracle.com,
        vbabka@suse.cz, rppt@kernel.org, surenb@google.com, mhocko@suse.com,
        riel@surriel.com, harry.yoo@oracle.com, jannh@google.com,
        willy@infradead.org, baohua@kernel.org, linux-mm@kvack.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] mm: rmap: support batched unmapping for file
 large folios
Message-ID: <70d1dedc-b4fc-4eb6-baf6-9e54b6a62249@lucifer.local>
References: <cover.1765439380.git.baolin.wang@linux.alibaba.com>
 <af330c9ea188bd0f28189b1e6e5803f6de9d2abe.1765439381.git.baolin.wang@linux.alibaba.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <af330c9ea188bd0f28189b1e6e5803f6de9d2abe.1765439381.git.baolin.wang@linux.alibaba.com>
X-ClientProxiedBy: MM0P280CA0021.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:a::26) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|DS7PR10MB5102:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bdf3a11-46f2-4fc7-0f3d-08de3bd6db12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?g8E7JIMTea/GdURbGm2IDk9WIs4b3k8s1Ql6BFi5PgXhYDub6HO5PyzENv7Q?=
 =?us-ascii?Q?SRHH62yP1xK9JVUagHMXu9OdvOm7bP8FG7yXHuqAXjDaUwSUAzaoOSHNV2r9?=
 =?us-ascii?Q?NABEsR5kCHweQ2JRgQSXq8m8dktr39E5XjKkzDbHl4RzBB0aoPhPHkU0qmCU?=
 =?us-ascii?Q?4KSH3xhmuXypD7K3cls3zpH93pXlA8zXlkFvZ75RDcQOQIJPlZ8oGaF7BhTm?=
 =?us-ascii?Q?OWJlnnL+86uQJbrscVXfGXsosLK8L/whTwIO6y5TWjuKaYh6hl7UHT9be0Kv?=
 =?us-ascii?Q?MNkxn9ooknewGLFVxGBin9csrBE1eJIEHjTnln7qSXXLhbRaupo+AuI2AW6w?=
 =?us-ascii?Q?GWxgMCM/Gf7xcObTHuhjJ43EIJz7cgLLT7Q9nSuPYk5lumV1PAnZMXS74SuO?=
 =?us-ascii?Q?ldVUL7Y5gL8bLFcOu4xj85qw/06J/lC18JutmkR7tRcA4NO7iDBYOwqWxn43?=
 =?us-ascii?Q?TqI47CCjYCaXnvv6FefwdI5MjYwGvBexjcfNjy/ssDZisfYcVcJmHEJQf8cv?=
 =?us-ascii?Q?3rU2eZ6B1YYeoNDqxhF0eucZ2wAPygnVlIL1csGn78pbF+WuRjyWuOAfXD8n?=
 =?us-ascii?Q?G7/fwJnjJTfy6o+Dw5MUhHD8xHsiex9dCh8EJ1jwW4tv6jxk4aLP+yszCN2p?=
 =?us-ascii?Q?spXB4nu29UcExzpDZFepXwCazhqsm2wGAyYgH1HJu55GdqpCmjCZlizx+RE6?=
 =?us-ascii?Q?P4bS24StQ51neO24r/5G38DYpCm15bZEyEranXknzjgleAKHDTGmeIS8yVWc?=
 =?us-ascii?Q?FfDmd9VdE6EbBXMHrD5se4bdbLrKhSqpNt/nHXDrG5KqxzopBqlqjZK8Uenx?=
 =?us-ascii?Q?xZX8rMNhuKs6R7949VoTSTUThhD0Oi4f8CgYnXovWhji3cdDTMHQmXUy58jM?=
 =?us-ascii?Q?IQI9wctm0np2FR/U7lybqnI/q22b9GHf5SpkDLdN8Kj4l/JEJI6JokIlMAGi?=
 =?us-ascii?Q?//AOPywMTzosem6ssq5NxSLJzrF8hpNvcVW/JyyT7XUqotvLYJ1UJJoMAq1A?=
 =?us-ascii?Q?5Q7tQBmYYcQ3el/EjoyDQEYFP4OFkZeQ/2J/IrASc87aX47B4C3EwyjIM4dt?=
 =?us-ascii?Q?geN4/putfwBi6PIMfe78FRMALwf5Yw7xX6Oi5a1alWzMaoaRKiNJrkR6/DJA?=
 =?us-ascii?Q?sxB8SDUi2/d0HsKvrQDRsE3D2sujI4sC4YQWCVDfQXbqvEc8tGLF/H+cz5PE?=
 =?us-ascii?Q?9sPIBBTOZ0gSyxbAlAmFQ3UZFDdXH1bQriefhqRUzb4M5HflL2jDyw5C/fGs?=
 =?us-ascii?Q?hg9cFNB0P0g5JEzrCeveR4EXHAmx/+zby0R9uguXvY3IQ2mf1XZ45JJVJ073?=
 =?us-ascii?Q?Fz5X8M4voJZ7144WoW+is+hB3vSlCuiyTueChlnZkISbsudI0VM+xsmNDcum?=
 =?us-ascii?Q?7nEGFDz9ydhHgF/QlS+jWS75xCWCamh9inTZfDV4ZDDTGC9eQQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?A3q6swoGuOotFx0D+xV8RONHZcWjkznuLyTb45xUwMwmDhpXVZVXLWzJVOIg?=
 =?us-ascii?Q?rfacJ9vC0vDSGcmt5VU4Yz3WsRi5IHytGfhovmEJ8BqgQLQPLJNsaagYW6v2?=
 =?us-ascii?Q?vqWtRMCnHgMAhHRS2xGvPDzD0odShTjgxHqvIH6mardg76ajMnZvhJWqt4Dv?=
 =?us-ascii?Q?syUv52pTYs66zA2Tzod5d7kl4lrdUNfIbjFf7W/k7015A9JOzDzAoblWEZZC?=
 =?us-ascii?Q?N5APnK5K7rVr8KpJ86Kk2eRIG8uJrGNoQCFhTWtiT8K4LA5vm8vDceVN/X+h?=
 =?us-ascii?Q?kgPV3rZX8qQ/GBoZwfp3UNPRNy0G6vJnKqEX65AjTQzNJwnKycAn2M4nXDQr?=
 =?us-ascii?Q?iS6K17GBMIE51ShmxUNEawZrw5OurGSi3R/jpMdUkpBBYFWq3HW1Gjc4rL8P?=
 =?us-ascii?Q?4/QZ2OxaKSnIEpB4zQGPuvIcE1vutnfwud48yM/q8RQqodEmbr7V1m7Syura?=
 =?us-ascii?Q?rcfFj3L+KyFDEbYBqL1RlWwZXhKd/jlx/gE0VLh9yKc4smmNyZ72jMtqmc5K?=
 =?us-ascii?Q?cTxXd3gNtWSbGG5g96sN1/iEitP/I9OSk6EUVdOO8sP+WjZlSum4RYO/WOun?=
 =?us-ascii?Q?pBrdpem5yPfi0iSbn+eGVRb/TmlH5Uin/SQJYE7/bYy7wMucdGzspMYo2lou?=
 =?us-ascii?Q?u9QRTuQ7QGJDlGM8Ry1NR5CsJp+lXHM4qffp0T2G4NNDZejIShNUi/EmtxUS?=
 =?us-ascii?Q?2B1C9cV7xLNMT9erQovUeGGT+tY5W65RFFocFnpvaE7BYBqQ8CcACgt+2fEE?=
 =?us-ascii?Q?rpcPtk3P7K0/cF8Na7A7i4YcDaqaYWd/Th6zGnFF9Vfjqsd7TPHTlDCK+EFz?=
 =?us-ascii?Q?KfFF39MPNLY9BS6LJJD+Dx/bZtkmeDvtpqUyYH2clNTugk2Y07TZqX/dBfKm?=
 =?us-ascii?Q?vG1SiAjWftbnPkjLTEibFEbSueXsR82uCf3yw+IrzwfEv4XQdD/Gk2V5RBgn?=
 =?us-ascii?Q?ykcg5FosMRaHVfxtKuP1i75xEJocl75wm2csjkkHW5IiP0zVBe3NohFmobsR?=
 =?us-ascii?Q?5HAqS4w2h0kr42pzOrGtYC2c+kxjWPmj0nGtMzr2X8ew1F4SG35dI7WY/qRY?=
 =?us-ascii?Q?mSFmkn0przwDkki4KxTHbHJHWnurqjMgoPTqQ6gkMPkl7WI6ZyGQNS6QNMOB?=
 =?us-ascii?Q?imu5KC6BP+NSd9BererJ8uOIgJDf+DerxHM1yhBYbtRV6uezQGc2+Hqmeu7/?=
 =?us-ascii?Q?YNPNQpFtqE5CqOecyizF5iRCBWQDSYN/ZzCSYqHo+UXDVkUP/AapayNaGlx7?=
 =?us-ascii?Q?chWXCC8XH5Ft6aGwZw9YWzYrNjU8btASzrtlZyeAXCK+2lv3DZXqtOVxOdec?=
 =?us-ascii?Q?5eqqZzgqzYwPJd6d1rbmCgzlAunqdLVWhSEbLxozQFTcM1UW+IZ0i7w90qtL?=
 =?us-ascii?Q?mdLXa3IqOKvSZ+UuElzO3TuvsoXkWvZVO8UEMzTCdbMjIx16809Spok0xabh?=
 =?us-ascii?Q?RxF+w+kd7RD4phzi1EphoxFK7p8oz5Al9pdsyqrcE4FjYnr5AiwELWKvjM2x?=
 =?us-ascii?Q?4zVWhJClALIx7AZNcj73G6hPZnoxuAezgvcfPeVs2fryKf6cPKDEE1TxhsYq?=
 =?us-ascii?Q?3ZXRSmSah02L3/McnIw7BBY9J1gXLdwGZjAwknkk8I5ZVT0mXCFsMx8G16PA?=
 =?us-ascii?Q?Wg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: Xf8fffKilEUpxAmcb4KA/py+YNo8G0TNjsbX8bQrSACv7zQSNdF4hpSoydB7ejqRBmntKNZ2RX+gF51eN0nsitKmjtEnKnQtQoSM/i5+NikS+66vqzn887CB3UMotBdm44dhE8kMFrpPc0jhFTTNeXU95XOJIPVqsAimTfWOe81peQPaCBNuJbehsGBTGrtKFiZqwhfqu142GMVtcStfEejVkuCRa5fTgNXYNqIc7VfRFLPtm2e5Gd8Fe8i+5XR6LHY0cRZOY69o0IcO52h+AqHhQQPWZSqd66/JMAvlfIafm6RI7PO7+j5EsS7C/pWWlg1hfPGC/egx5MAm+bkjQuEb95mlo1S6iqPeL14rsiNF8Aw4HAZzuzbxbmSSIyWSZHGpiOOPB1ZtPR2mEhhue/zGafobqwk9Gk42JPE8kTDd2IbCb6MHKps/YiOo1XfRw/MmD4VKbF0slr1iLZkIxHaLSV49ob7JO6E0MgpBD2qCuPmz3jQKj01IB+eRndItmYpWF/WzlOwOXTfH4neRpwx4HFcRQcTrQ7O0hcAZyzbDWwSui3W3bPSQK47L8yAwypoLLUaUo0qRRJuDDOohbbNQd6/p291KeRgiTYuT/Pc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bdf3a11-46f2-4fc7-0f3d-08de3bd6db12
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 12:38:31.9015
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ieM8Lad3nRKqtIocldAdP+YPKI9Fs8ID3fjgsT/10s8O801jpigobBXBRCTa8ZdER40HU+WHjITw6wiPBxyuI8Rsi5CgtomhEPeaV5oPah8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5102
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_02,2025-12-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0 adultscore=0
 mlxscore=0 malwarescore=0 mlxlogscore=999 phishscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510240000
 definitions=main-2512150109
X-Authority-Analysis: v=2.4 cv=TbWbdBQh c=1 sm=1 tr=0 ts=6940014d b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=SRrdq9N9AAAA:8 a=vq9G1Rq8lSYBAlDLLf4A:9
 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13654
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDEwOSBTYWx0ZWRfX3xdPB6cwGMZP
 67hAiPnkAQFvN+Ae1xjuxtikmR85wbLuOXqXF5LyMj3EBEMWDR9NvHV3NtzbtOxLb1CHn6Y+kTF
 x5JRUhfCee6FDJXeF7fZAt4uHdYL+GQ8uWZm4vAi5on7qo/A/7r+ntAt8GDBUuJK/U+5NpKd9Lw
 UsxsnuGpdPYjZ3Eh9FCCMR96dkzH6bsZkoWJweELlF4ciOh4CjNeOzIiprb8lkDgxZQUtWGkRje
 2AaC0Z3Akyy9R0SP6CsrRfKdzUyFyISbyS5gGxy0Te+0kTARzrbtgffqJUbuSvFrPVPBPyCmcP1
 2kYnEV94HQ5dSFUqQbPbR3VpKcJDPq7hiH8kvmcL02xiytog9RDlWk0kxKpCwWRvmw+yIi4QTmQ
 IjUC8gZcqlp9XwotbEU3tM2OYhchrb/fERdOnxArp2QOQzVQPzM=
X-Proofpoint-ORIG-GUID: ziG81VA-VOUiLgQnpb0tshDJw-sIeDMJ
X-Proofpoint-GUID: ziG81VA-VOUiLgQnpb0tshDJw-sIeDMJ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_043857_481518_C15D2EDE 
X-CRM114-Status: GOOD (  22.38  )
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

On Thu, Dec 11, 2025 at 04:16:56PM +0800, Baolin Wang wrote:
> Similar to folio_referenced_one(), we can apply batched unmapping for file
> large folios to optimize the performance of file folios reclamation.
>
> Performance testing:
> Allocate 10G clean file-backed folios by mmap() in a memory cgroup, and try to
> reclaim 8G file-backed folios via the memory.reclaim interface. I can observe
> 75% performance improvement on my Arm64 32-core server.

Again, you must test on non-arm64 architectures and report the numbers for this
also.

>
> W/o patch:
> real    0m1.018s
> user    0m0.000s
> sys     0m1.018s
>
> W/ patch:
> real	0m0.249s
> user	0m0.000s
> sys	0m0.249s
>
> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> ---
>  mm/rmap.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/mm/rmap.c b/mm/rmap.c
> index ec232165c47d..4c9d5777c8da 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -1855,9 +1855,10 @@ static inline unsigned int folio_unmap_pte_batch(struct folio *folio,
>  	end_addr = pmd_addr_end(addr, vma->vm_end);
>  	max_nr = (end_addr - addr) >> PAGE_SHIFT;
>
> -	/* We only support lazyfree batching for now ... */
> -	if (!folio_test_anon(folio) || folio_test_swapbacked(folio))
> +	/* We only support lazyfree or file folios batching for now ... */
> +	if (folio_test_anon(folio) && folio_test_swapbacked(folio))

Why is it now ok to support file-backed batched unmapping when it wasn't in
Barry's series (see [0])? You don't seem to be justifying this?

[0]:https://lore.kernel.org/all/20250214093015.51024-4-21cnbao@gmail.com/T/#u


>  		return 1;
> +
>  	if (pte_unused(pte))
>  		return 1;
>
> @@ -2223,7 +2224,7 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
>  			 *
>  			 * See Documentation/mm/mmu_notifier.rst
>  			 */
> -			dec_mm_counter(mm, mm_counter_file(folio));
> +			add_mm_counter(mm, mm_counter_file(folio), -nr_pages);

Was this just a bug before?

>  		}
>  discard:
>  		if (unlikely(folio_test_hugetlb(folio))) {
> --
> 2.47.3
>

Thanks, Lorenzo

