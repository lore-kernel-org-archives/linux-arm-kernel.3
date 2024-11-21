Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 664CBD75BA1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Nov 2024 02:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Date:References:Message-ID:In-Reply-To:From:Subject:Cc:To:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f7q20w+zD52W3QS09cScAozppCy+MENEJhnES8t5J5c=; b=XS2AJLn6JzAxW8Ti7/3YbTNSOK
	wTMkKHnbz/NPjZXTpwVOOjGzTR24d2TK+IFdIgFnanh+f6w1sL1KWxZLyURKBbyFNG3pK3IQZKRTD
	fHbjOk7e+tcHDM1t+yPGz9oHlBFBp8Nkf3Wq2SxvsFmHZgvzJeIK4glIEUNX9mDThroUZjuhRiPXE
	SI4PcZKpsOpzefeO6frmIeuRnugFsVT7Gp0gcpARMxX3JLzhNLPMlIHh4P9NyLtdyws8165bJpcks
	d82iehcZ81VRkl+fvpcX11mj8oZzwagu9t6o4gNGbkvbrgCHSp38WSXZWYhKpAbsb/O1T5sZ0wMZM
	SKCFIXbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDxJ9-0000000Gd2x-3nqy;
	Thu, 21 Nov 2024 02:52:39 +0000
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDxIE-0000000Gctb-0T7I;
	Thu, 21 Nov 2024 02:51:43 +0000
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AL1i0UT011970;
	Thu, 21 Nov 2024 02:51:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=f7q20w+zD52W3QS09c
	ScAozppCy+MENEJhnES8t5J5c=; b=XlBK6RmC4hIwpTLTVDliITvY9SgTRprfkB
	RpcOIIXrf7on1+ix10m1k+y/89+HS0ibVECB99UL/mrPSgd4OCsy1vFhJ8YPuTlz
	ZQk302Wwyt19ljHOvFdtD3rhsndMFvA32bF4gaOhhXzINuthCUzT32GQdKbxikhy
	Lsb5WWCyouU8g5XknciubqZRSr0xy4dYnbw4Yiv1vclmRueSbfZWbFhqj46f5ylD
	leFavNP1hZXRdQ4fgcM6KLeI8GzYpMjxXa99iR1b3iwwe8zrNeqy6bqHMh9eFPoX
	zSgPWC+dM9D9AYbx4rVLG7p3dqqweDuOcgb5wGCz05LigUTWLmsg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42xk0srrve-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 21 Nov 2024 02:51:17 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4AL041TK036928;
	Thu, 21 Nov 2024 02:51:16 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2045.outbound.protection.outlook.com [104.47.66.45])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42xhub2735-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 21 Nov 2024 02:51:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RIlZix8c5BurTrGRhvUF2we7B4FhHaoZpfdD56Xfa9Bte/hfIppF4spobCxVOUyOmDZjQMiHT19dxko8WXPW7PoLYty09yliTwYGKmnTxvPC/xm4Y3y6m9mU5TOOaErPBJfcYibUXia5ZzfJyCmiyfCIimiwZFdNPsXEzMNIqPFiOqjqOpDcHDEEcu5sxgbxLPFX0ks8fNzll5qy+1qKPqbwDAuKYmppIVPtDh4aG5hDe61QoqrtymuFz1LrQnmuT2eVBsSjeZ+mD892lZeJ/T6qVFyvnksyWw0sRJKPVvsXdWlR9FrP97UvgtNNA8B0hNx3kxCYGfhAiwu5DzcJ2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f7q20w+zD52W3QS09cScAozppCy+MENEJhnES8t5J5c=;
 b=JSpgDZFj0/bZSPX5/n7qsMebdfXeu0ectDSct11vVkpOPWKyDcHy5eYsm9dR2VoWUlDdca8u0MXO0axw7tdcN2Uya3D2CxyGH/nLULag15AAuKMO/R/Jld4IoMywd/+MTslS0V8M3EPhsdyJprdW0Fa8ZqKxHMTMBTyx8HJQWEYPbSxnUPLKYJnPpEmNdLQR7MwwQ9FHXZNgs0vNI/dQGaxa1mVS9iCkUap1JQCgUvPTzpWL1LrTF6YjO/NmasyIo+5x20ucEn1lg7YDP3c+XOUvmNID6ctc+8tk0mctE9tG20OToRMt4sSiLMGSMPBqRPTrDFtDBS+Mdr2eEYFqVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f7q20w+zD52W3QS09cScAozppCy+MENEJhnES8t5J5c=;
 b=kxEvjWxyXNNszqogWTNbfhZapoyjWeMvUozS0iQEMbvR6Izhyv5D4bB17YC2hn2V6V3TVSyXa2iK+UCRdIV2k9aSXEYo7whrsbP4zfGMtwvkonJbnC5tlJ1ge2QuXMXXyQ3dS5XhPuKMV5pFCnl50Sbb7EaWGHcHWzjlodPlvpA=
Received: from SN6PR10MB2957.namprd10.prod.outlook.com (2603:10b6:805:cb::19)
 by SJ0PR10MB4479.namprd10.prod.outlook.com (2603:10b6:a03:2af::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Thu, 21 Nov
 2024 02:51:11 +0000
Received: from SN6PR10MB2957.namprd10.prod.outlook.com
 ([fe80::72ff:b8f4:e34b:18c]) by SN6PR10MB2957.namprd10.prod.outlook.com
 ([fe80::72ff:b8f4:e34b:18c%5]) with mapi id 15.20.8158.023; Thu, 21 Nov 2024
 02:51:11 +0000
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin
 K. Petersen" <martin.petersen@oracle.com>,
        Pedro Sousa
 <pedrom.sousa@synopsys.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Peter Griffin <peter.griffin@linaro.org>,
        Krzysztof Kozlowski
 <krzk@kernel.org>,
        Peter Wang <peter.wang@mediatek.com>,
        Stanley Jhu
 <chu.stanley@gmail.com>,
        Manivannan Sadhasivam
 <manivannan.sadhasivam@linaro.org>,
        Yoshihiro Shimoda
 <yoshihiro.shimoda.uh@renesas.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang
 <zhang.lyra@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Andrew Halaney
 <ahalaney@redhat.com>,
        Nitin Rawat <quic_nitirawa@quicinc.com>,
        Can Guo
 <quic_cang@quicinc.com>, linux-scsi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] scsi: ufs: Switch back to struct platform_driver::remove()
From: "Martin K. Petersen" <martin.petersen@oracle.com>
In-Reply-To: <20241119182856.55743-2-u.kleine-koenig@baylibre.com> ("Uwe
	=?utf-8?Q?Kleine-K=C3=B6nig=22's?= message of "Tue, 19 Nov 2024 19:28:56
 +0100")
Organization: Oracle Corporation
Message-ID: <yq14j41qozq.fsf@ca-mkp.ca.oracle.com>
References: <20241119182856.55743-2-u.kleine-koenig@baylibre.com>
Date: Wed, 20 Nov 2024 21:51:08 -0500
Content-Type: text/plain
X-ClientProxiedBy: BY5PR04CA0004.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::14) To SN6PR10MB2957.namprd10.prod.outlook.com
 (2603:10b6:805:cb::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR10MB2957:EE_|SJ0PR10MB4479:EE_
X-MS-Office365-Filtering-Correlation-Id: 5aa3f2e3-a975-497c-9568-08dd09d75b21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GK/+VJsDio+vXJGO7o1V5/laeqguKeH3kB+RVidHlg1LUT1Ms8vJbtrHDdwj?=
 =?us-ascii?Q?N0laQ0IjZr2dwX5VBH30rrINoHdpzOEt4BYJJBO7a49Zoq6GNsg5JwQd2Wg+?=
 =?us-ascii?Q?L2BZqKqmi2WrWk9z6/jt8npfX79YHiovBj/VpBTACPWH0x4tEh+NEyXUqiTi?=
 =?us-ascii?Q?DoKxLVmFc8wbBQLQMDRbb1zeJ0Ms3YpRE/5sVgCpYw/rcYoI2uBPMtvkGG2d?=
 =?us-ascii?Q?RYOAVtgYkwyxt54T0xOfBIeiQsGTjTi7a43D7/iqhTcDDNCuqc6CevuyBvOw?=
 =?us-ascii?Q?Jr3KaeBcMzydoVxV+ZHXgSiPpcZciwfnXlPofOClKd9GqtPlkslL/5KXIUKi?=
 =?us-ascii?Q?W/J1MqZcJ2F6Dm2U8YX3D8jYF28d1ZG0dNIpO66f/4c5odVwGTNdnCY5FLTa?=
 =?us-ascii?Q?iaEyJuYUIWx/2PnCUtIZrQgI8jzduvOJkTYE3X2Yhtb6WjPTh4FhtEYmhZHM?=
 =?us-ascii?Q?84w8KbXIV3G5ibN/B2SEcUV98LFq4DLOVfhnf+l3Ewopyd//oJVXeOvuxNx8?=
 =?us-ascii?Q?NYqIRWAgyeNEIVf6HrY+v6CIvze80LZIm2OCgVfvkwqCbZczd6R+YFu2kFqi?=
 =?us-ascii?Q?WGReFNrDxuld8b+IpoKjI0mj+aYTnfHFcF7Su8qkXjH49PV7eyubSujD4HlM?=
 =?us-ascii?Q?A8P37nuQ3XqA+dnh8ELrOLwTmg04lYAjP/u9AmfX+3NUj7MDo98MGaTj2ceO?=
 =?us-ascii?Q?nxaXqXewZiXwsFx+kcdpbPifg+JVnHxIIJnBZNYfcUrOzwwuzG9BBNkfstoP?=
 =?us-ascii?Q?GjvAKNOBAfvRsdvjP1zzCaliawXnaIROTaY0ub3AKezRgVOtHjryGERrESKF?=
 =?us-ascii?Q?V9C+v1og3eeddyE/zIurx1CPeuuN6V1wdJLSvzP44V2JIEx4P8K4QxPUz5SU?=
 =?us-ascii?Q?Qml7mxtanNqSTISONS1iuGmCuujM9lWfhxKUOy8OzZAwuGz8ClsA4muwm8/2?=
 =?us-ascii?Q?3Y50kIO7OgWSKo0hLWz71RagJ0Ofl8fTJH+HsxC3U4mFqpem93cyV5z/vewY?=
 =?us-ascii?Q?l+UaQ56o7/X++bT/TYNYp1QhTEWi67jg7H8mVOK6qTGKDrZQPoaOdNe3D0xp?=
 =?us-ascii?Q?wT+NiY+6jALaX++1k7iGVapb2LA8lCArOD8zccXrldDn0qsxvGdhO3hG350o?=
 =?us-ascii?Q?/1xyk2ghgWtPgs6KQhXK4aSLs0Da2Y8kkjosSNHmxCtvN9XmIuD+3BFhyw+C?=
 =?us-ascii?Q?mmpCYCymI4/AHXrJYQjXscqQB9Uj8tRp4PofkVUixfe1DNr/Xz+BwDU+Uwl0?=
 =?us-ascii?Q?GevemUSpNeh8OLrC/4nhB5LL0lcT4aCHDlu/ixRQdBW6E7d4j0ImhC+cSrtq?=
 =?us-ascii?Q?EBFULUiQm7AM3VJ440U0s6wY?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR10MB2957.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zsQ63M7r4lYCItuUx0k38PYQ118AUtY+ayWvPOxpsShiT+mNjV5+eQjBI1jK?=
 =?us-ascii?Q?6wGLJBBNOdl/sA1cmNJc6dFt8zIuV9iyN5/7l+3V3/gChGV2LZ5JjzxcyWQN?=
 =?us-ascii?Q?Qt0+U2QZOx+6kGIHSZUFofNF6NqYXvRa84kDxdU3jnbzcdatbETZlHFCJyk6?=
 =?us-ascii?Q?y8EW1jTFliUhfm37oeMbgX0rbi9g1cvhVaUS4vdkwIlkw561MmUabxihaNvu?=
 =?us-ascii?Q?q7kZQgDlWcq4OjwX7CeZSmahRFh9r5b8mc0wHkyAH7Qefz9bSxsGQAnNi6K0?=
 =?us-ascii?Q?Pnyufv1w4c9Pzh0W3TRRNszjb7Q9fiaWC/xVA0jPs0vFrR1RlVUPS7MP+WNg?=
 =?us-ascii?Q?Jgwt7UaBWJh/cZpeNCIyCpTJMvNmICYv1k4xGsQtpQkuxX8mH4f8MHr/9lef?=
 =?us-ascii?Q?gSs9+b/Rw/CmTWhJZCxdxNJ5khb6X5XMrxMpwSM+wbW3kGBwydlceX5FKPZI?=
 =?us-ascii?Q?hHnpEqFUVM+DK6faDV2jMgevxvPhC7hWH4N+y14ukV3+zQ5QrNKPephd7Gk5?=
 =?us-ascii?Q?j1+H69cwSsUYM9qClV4dyjlXSLMT8j8x7R5PV5QPvKYhOMBp4nHhMcpoU3VI?=
 =?us-ascii?Q?ioFEfLJMF5ogMDhM1DtNfzxCSfVXt8fEY05lxnV/teAKw4axc/shoWa29FrS?=
 =?us-ascii?Q?poduDad2IoTn8GamklX6H/mcMhJcxAqClKGHfERmTL4QKyJqwlcJ726JNem8?=
 =?us-ascii?Q?oQEtSHcAZQqG5+idQMX4+AqbrpggrjrvDE0VnF+5n56ZjlpZKjsrGGJaxgyW?=
 =?us-ascii?Q?9HzrXbaa9o5RJNX1lUdK7Z1Cev8jsmGiWGulOdlckjyDliFFpJvdZh2/N1ue?=
 =?us-ascii?Q?eQtDs9MuJWhCPmUA31PH0qbp2bZIt+rv3Dqy5yKN+KF9Qf1vtBXWkoup08SU?=
 =?us-ascii?Q?GmHmSgDdESvNEL/EXmzBNv3f6lyEyRdvwq+iDAe44Ss6HDTozmvvIttwAOzC?=
 =?us-ascii?Q?ZQUOI6WgOuMbSbes9UYC60R+PAgLU+IRcRvu4fwuH4t+5pWWnwnLkhlmTa6T?=
 =?us-ascii?Q?SFbHMiUS+2qu2m0H33J+sBLXeSqXHsmrTR4aVgMUGAclnBAYlic2via/gwqK?=
 =?us-ascii?Q?gmQsalcGtcjQceXyVGVKjPrvGRCqAh0Tr8VMafIFAVRcyDZUOR/L20gzDRLm?=
 =?us-ascii?Q?hRItg8wQC5pvoeblMKeC57NPteqTgR9aawSIVZ+AlNJ9jWRdhze4oA3TgeK/?=
 =?us-ascii?Q?PdN8C+3zqMwjY83gNwTbIj6Ggo4A7Jf+yEnMyiaHoZ8561shBCdnW1KQJmJO?=
 =?us-ascii?Q?T4OC/KNHiaMxRIUTGP/u59Lw0pyuxcJLDUkHQkUBEKa2bfNZeqGttkLQvrMk?=
 =?us-ascii?Q?RTMYtC1FbRQqaiZOBj532DIhIhnP61olRVn1J0+PVkKJ9r5re5CR6H1LrW/5?=
 =?us-ascii?Q?j7p/R48nbHc+oGx4xODTx3sxhSoObqOKRd+FR+Wj5G7jIgaoTE+ayA5PQYZQ?=
 =?us-ascii?Q?XgNjQ0Nb5ZJxbDZuKpknPcjCnsI8JL1TgBI56vSJ28tKWLCDgItIhFLjArky?=
 =?us-ascii?Q?iT2DHr2Ira+mWYk4HdYbQxkwt6s1nFTXLoHS8PBT+uFYCn/61bP9tAJnfix7?=
 =?us-ascii?Q?BGFOHMmAz2Ljb4dO6Ae4VtoRPbaOn4ttlHK0t0PXz1bwNyIbP/SjMCU5/SxP?=
 =?us-ascii?Q?Ug=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: ISz69Fx8ts5GRNoycYvuKVAQAjc6QC7hHF3rPQmmJBquUQfej82jlxPoi2ueZgs9RhdUNXBc2fHpZ3/I9+wNR2jQwyLHJmkEaO5l4g3SB224z9lsOrICibqfSd22Fmzzi3QXCDtJFEIkV/DJtbeqvl/NIM89/wxRS9+MC96rYmdy/qDZKgEQwtZTH+39hngcTvFflsY1RwPr9zAuoaZ8hs3lIjVBU10Mq3rmEyLEVw00BlGcldAivVP2mKXhxNBmSu9g1nP243kz6QFUwB1ekiyt+mV7VXjJtTbOjMdzgoIdijHP4Y2hdv7MjbCYhDjtUbNbJf8HS6cIpOk5QbJSk9C6Slb6RSP4w0SY44p7Pcd/sRfYv4nnc2Ug6z2LYbuwKiLCjdETGeaWggaIaWQm/TDUpCOIgJ/0CD2hSPvQY25LgvMvFOO9KebFqZvWvjt7d+5TFeqPPzBgViwxY5KNgPq5fHsEWmT7aYznFZl0JNtYpoKxglYw6trrCxDTvPyzInbdXeMZbeV65e27RK/Sly7ugK98ko32bzpAVmvDQdgLurghNJQuPch4fc5z2qNBQVaTIN4+GMH0MCeflFAwZqFp1gExsEgksR2BSMShQr0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5aa3f2e3-a975-497c-9568-08dd09d75b21
X-MS-Exchange-CrossTenant-AuthSource: SN6PR10MB2957.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2024 02:51:11.4767
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vh92dgzhoLNk5IU/MwxbgWZPaNDYayhS981yAv6egQTFAviiJCLjFs/g0XfFowApflZpXG77ifKLgwUDHBV8k2H6/1Wf9Bmb+JBOgm8ubfs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4479
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-21_01,2024-11-20_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 adultscore=0 mlxlogscore=999
 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2411210022
X-Proofpoint-ORIG-GUID: lfovPQoIofTyQS98Mo1WunhBBNSwmNl_
X-Proofpoint-GUID: lfovPQoIofTyQS98Mo1WunhBBNSwmNl_
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_185142_270434_0D61DD6C 
X-CRM114-Status: GOOD (  12.02  )
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


Uwe,

> After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
> return void") .remove() is (again) the right callback to implement for
> platform drivers.
>
> Convert all platform drivers below drivers/ufs to use .remove(), with
> the eventual goal to drop struct platform_driver::remove_new(). As
> .remove() and .remove_new() have the same prototypes, conversion is
> done by just changing the structure member name in the driver
> initializer.

Applied to 6.13/scsi-staging, thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering

