Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C3CAD5E12E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 10:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PEYn6zFHd/8RF6Z1jai/GLUUH4DHnVUMkDNmXc27HL8=; b=Sq9LkFX40O6zvl94QuECgVa6iJ
	fbJmq+beANJY2GjKoQbRSFALkS2+0Z72jddUNX8igSULCRzeaB4+MTEFI3p94qne5srQkPej1tjMe
	EgXzGgdugSUMdFgjd23eLCXWLNq+AkUL6gVBl5w5KAqItT587rlCa1S0eV6vLPd0jHOrhxij6G1P+
	wUR/UMsGBgEoDNME2FUNDPAARpcdyOJqitH0I3V0AAq0V9cFAgaloPBEz18DEpecB0R9vz1MMEVjp
	A576qpCC3LWmnKJMLeDgLwpOeAS/1Do7Eo+OD9dLvOlWzX0YC41P9cF2XDmzcTPILdQMs8N6BzKtG
	llOqgEzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVSi1-000000054OA-1YlV;
	Tue, 16 Dec 2025 10:55:13 +0000
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVShy-000000054NL-0ePu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 10:55:11 +0000
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BGArsAI136680;
	Tue, 16 Dec 2025 10:54:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=PEYn6zFHd/8RF6Z1jai/GLUUH4DHnVUMkDNmXc27HL8=; b=
	gqfFUHzGhAHE1malQU0bcpIGQ0Ynn9bG++pPFAR/cx5KnKrKo7+roAQLLf9vZ4W/
	QUonf5zRWTBdnKVnxn4gSu4JuiTXMwEaNOhk3SzXWK4fs9gsdT+H3/o50Ovl4deG
	7t7zV3G1AVILBs2x+PYu9gnyuY48QVIgNuFoHr7F6my/Vp2aY7TQRb5U7vkr23kJ
	muynVdt6BercfGVNRDjiaDvv5Na71T3HgFM0bWfBmkBVWYy0dZK1Triw9Q0VweH5
	VQ7ZBkLkUp9osP/cmN42iuVt37Dw1D1G8yRfO6YOxy13dBhy6Dv02ubktPsxiTUG
	WWgbjLaDts/BIxS+d+gwAQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4b10prkqrv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 16 Dec 2025 10:54:48 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5BG9uDWX024791;
	Tue, 16 Dec 2025 10:54:48 GMT
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012049.outbound.protection.outlook.com [40.107.200.49])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4b0xka2v7v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 16 Dec 2025 10:54:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TyPKzny5EEap/oOWdNIzYtwKYwevG5kynQXLLovNCTQdmYpJD+BhMmyuWy45a3uJUFNNFGmM74DA+MbRDs+7Omg8t4Qub6y5cfPaZ0IcR0fkuu1FEJu1DOZwD/tGno8CfpH8pu0XPXo9vsJ72ub5eP2CTOrCDVQ/Zv80YcrVKNw3VafhA0WBKunC/1XsxmHuBEVpJIW8VNY3ECLYIxH1esHS7PiaV1Zk0SZPIvSvo1cE1X9mbEZFguutPz+VbtU8yUUPyhenqcjHvwSZfdKX0vl83/pxq6U7DZigqMpul8FAd7nhURJZdoljDWf3NYsC/64EZ/k90ar96fZFlQtIYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PEYn6zFHd/8RF6Z1jai/GLUUH4DHnVUMkDNmXc27HL8=;
 b=ReeU9HJbgnjEQ09n2uEsVpFqN8QTu12D6A4c3r0VJRaO+oMI/NX6AoJcfAlLdoVfqjcAy1nly2j+lDfT0ThpizONozrl5uskMV53hfe65SYyWUIRRvcSwroGfDjp3Ljx/1tDatGIxrjZ8vUzeVs3MCBLsNifECMkZbvYfUc4YuYzCjfz6S6bR8P/JSvSyyPu6HCbl8z5cBPWkVsEk/uY4OEWxrWtwTjrsGeahJ/gM53vkVg0/ghF3kkkqpWUCSrSfgNCnMZiyX6sgMsncWiwQfv2Q6SnJd/L+A5h/arQd/A8tW33L4C61D7bSoqRa1+9B0nh0wfEMK/IDGlqahilOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PEYn6zFHd/8RF6Z1jai/GLUUH4DHnVUMkDNmXc27HL8=;
 b=hB3d7nO3JQisuqu5V26jFar7cyPoJtkp6u2sQlKXWprpNGVpHuz/iBGYoJMyHmHp5yeKwflxbghFOVYNXjXjfeFBsuQzL3/d6j6oakXaS2n7fp4jxBesD0QdygEfaMxpkj7N9OfsoFY5XvCg496hhb0r6V3oAnkOKQ/dD7m+Di4=
Received: from BL4PR10MB8229.namprd10.prod.outlook.com (2603:10b6:208:4e6::14)
 by PH7PR10MB6250.namprd10.prod.outlook.com (2603:10b6:510:212::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Tue, 16 Dec
 2025 10:54:32 +0000
Received: from BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582]) by BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582%6]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 10:54:32 +0000
Date: Tue, 16 Dec 2025 10:54:33 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: Barry Song <21cnbao@gmail.com>, akpm@linux-foundation.org,
        david@kernel.org, catalin.marinas@arm.com, will@kernel.org,
        ryan.roberts@arm.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
        rppt@kernel.org, surenb@google.com, mhocko@suse.com, riel@surriel.com,
        harry.yoo@oracle.com, jannh@google.com, willy@infradead.org,
        linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] mm: rmap: support batched unmapping for file
 large folios
Message-ID: <e718cfdd-a39f-48f6-98c8-f17683f29bcf@lucifer.local>
References: <cover.1765439380.git.baolin.wang@linux.alibaba.com>
 <af330c9ea188bd0f28189b1e6e5803f6de9d2abe.1765439381.git.baolin.wang@linux.alibaba.com>
 <70d1dedc-b4fc-4eb6-baf6-9e54b6a62249@lucifer.local>
 <eb871ca2-47c8-4b10-a61d-321716f6c147@linux.alibaba.com>
 <CAGsJ_4xp40A3u=N5_mw00Eo6bPmFvctD3j=1Qmy3vOo2EmX3hA@mail.gmail.com>
 <9e038290-70ff-458d-b46d-bc512c3442be@linux.alibaba.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9e038290-70ff-458d-b46d-bc512c3442be@linux.alibaba.com>
X-ClientProxiedBy: LO4P123CA0512.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:272::18) To BL4PR10MB8229.namprd10.prod.outlook.com
 (2603:10b6:208:4e6::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL4PR10MB8229:EE_|PH7PR10MB6250:EE_
X-MS-Office365-Filtering-Correlation-Id: e6dadae0-34cd-408c-146d-08de3c917ebc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NVBxc29UUkdJWXN2VW1nWGttckZPK3RES1NBY01MN2VjSEhVYzdOcnBHRzRs?=
 =?utf-8?B?b0Y2TVM3a0hDSDcrVHYyRnV5NUJHamlrSXZuUGZ6aUdaUm53dG9iRnFUVnBZ?=
 =?utf-8?B?SjR5b0luelpwK1Q3YjdRandtSGJPMzZJc2kvV3lUQjdQU3hwUGx2T2JnMVFM?=
 =?utf-8?B?MGJIS05JTm1hSHhBRUtNNStOTDF4TFdySVYyZTh2MXB0Z1FOZnI0T1BwRXJJ?=
 =?utf-8?B?ckdkeGdzc0YwOTBaSjlxNlFsVkovWXpZNTBHSnNWTjhGT0YxVW9FY1I4RUdQ?=
 =?utf-8?B?VFBPVjYwQXg1VGh4UE1yRnJZaHVoWmV1SXZ1cndBaUhEQW5DSXFxb0gwT0FH?=
 =?utf-8?B?UGRtQUZxY0dqVld5R1E1UUpjMWtLWTVXTVUvM2pZVTVVT3BSLzB3UElHVkxz?=
 =?utf-8?B?OUF4SEozNW1hRlh2cUZscks0YnFwZWdBUitpMSt3NnNsZWVETzIvblk1YmtY?=
 =?utf-8?B?aENkOGVkMm82emlqMi9vQVlOYWNPMm1uajk4T0Z3ci9OYitSbWNJbjFzZUh1?=
 =?utf-8?B?b0tPeXVmWGhOWThMeDZLcmtDR2lra3E4R0w2blBaYjhCRDFIYlpmSnlWeDRK?=
 =?utf-8?B?WDBBSElOVFhPZERBTkNEYkxXN1U3TEgxV2kyU1JMUmJpMlJiNnVoUVBaZ0FP?=
 =?utf-8?B?bUpDZWJ4dTNsUTRNek9ZeXpPejEzS2Q4TWJYR2R5UWcwdC9zVlVGZHJQbGV1?=
 =?utf-8?B?Mlh5a1cwS2J5anNVWXN1UmQxVjVudFNyZElrak95UmVDM25yMWtOVXlKZ0hC?=
 =?utf-8?B?MkJ2dWZ4UThpRldkVVhVb1FhcG9RSWxSOG1PZzNncENwZDVqNnliRTU2WTJa?=
 =?utf-8?B?YVpTbHFNTnlwd2dzTjdyU1ozbHYxak9uY2MvS0xWeEd5Ym1ZK2JNb0tZSWlw?=
 =?utf-8?B?aFN0QlhZK2hVNmNpODY3M0pSUmpRK3dRVXRUNG55YTJ4dkdINVBBTlVCQTJK?=
 =?utf-8?B?OUE1YUxZYmhUcHlYanNwY3Zyd1FSNERiU25Eb0lScnRJejJ5eU5qcTdNWVM3?=
 =?utf-8?B?NnZHUExlS1B1WVZRd1d4ZEtUalRtZzF4UXNieUhuVmJDajZhM0ExK1ZnSGZW?=
 =?utf-8?B?QVJzRlZuQWpWOHdWb1BiNFlKWldTb3N3Q2sweDJxOWVCSkZ4anlINGJVYVJz?=
 =?utf-8?B?NlBFZmlaMDYzdnJzVVpwbGxCZkozV2F0SzVhVTk4cTErN0F5UWtSY3pHVTh3?=
 =?utf-8?B?bWZ0UjZxV1MwalJWZytacUJZYTMrbjMwZmlFZ1VYMmtESExZbG4rV3NTVFda?=
 =?utf-8?B?Y0JLV1hhVG1GYmRaakFNR2w4eVdNYjNCNVFPZWpwVng0Ylk3VzlWYnpQU0Nw?=
 =?utf-8?B?OS9DYXgyUkFUVVFEZjlFQmU3RitETVBBbDBEUWIyZFFwVFA0NmExYkhNU0w4?=
 =?utf-8?B?YzdrTTRGa1dGUlZnMWpJSEJabEsyR3lFSlZoS2NIc2xYNDhHNTR3eWVnSTZX?=
 =?utf-8?B?WTVyVmZvYVcvUEVXampvL1M3ZDQvNmtpdXdHUlNTQXpBeERUVkVUT0lJV0pE?=
 =?utf-8?B?SFhiZ05NK0JnamU4L2VOaDc4NzA5SzlCVU81bE9lOWJQVGdCOUt0TW9MUFlj?=
 =?utf-8?B?ekpjUVU1YmZyZFN4SGZqMkplL01FZ2ZMQzdGZ1p0MUg0T2k1emZhTkx6SkEw?=
 =?utf-8?B?ODRYNWd5SkVpZG9qWmpNVVFrMlNNbVhEdmtoSENlMEY3MDc4Rlp0akJDcXBo?=
 =?utf-8?B?bUVlN0xMa2VtN1pFeFdONXpnZW5lUUJwcTM0cDBBWWVQY1JscHZ6SFJqVTR2?=
 =?utf-8?B?Q3JYWGRUMzlwd2dNSlY1czROcVB0MW1ZQUg4VWJRd3VaSTNqYzlrc0Q5dUlZ?=
 =?utf-8?B?L1ZCMklmSzdsVnh1SkVwMGxYSFBFbTljUi8xUFVmN2hWbXVDOVA5eG5ySnlk?=
 =?utf-8?B?bE5xb0IzdUxvVlRpZmkrdFU0NGF3NVRmVGN5dWxnaDhLVjF1Snc5cFQxQzE3?=
 =?utf-8?Q?nT324Nki1+np4huQ+7WuJzXUst59sVpk?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL4PR10MB8229.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZjJ4anMzV0RYazhvOElKVHBPd2UvK1AwVFV2ZU9UczF0MkJ0a3pxVWhTb04x?=
 =?utf-8?B?Z1R1VnZ3cWdKZ281dm1rSStTSkhtMlhtQ3N3RmhuRXBIN0ozelQ4UVU1U3Rr?=
 =?utf-8?B?NkNOQ3ZOa2FKQ2NzcXBxRWdPbWR1U0pqTXdYLzN0K1AwdzZTWGdLZTBwbm13?=
 =?utf-8?B?TmFhY0lQckU2NlJlSzEvVTFuSTNlUXIyRXdWbmlocTJCd1QwSUpuTndNL1lG?=
 =?utf-8?B?OVBOWFBGZysxNFdjVFUxS0N2dkxEWVVPNTB0dko4eFliK0g4d1FCSW5SKzZ5?=
 =?utf-8?B?dTIrRFp1Tk1VVStFY0pFTVloQ1RWWGJGZkZGdWxWeE0wSER1b1JJTCtjWVcy?=
 =?utf-8?B?WWlxT1pJWmpXZWl2Slc5aGhPcUhDL04rV3BDQjVvN2tWNW5objhKMnJXd2pk?=
 =?utf-8?B?TkJGR2pISHNwdFpBZGV1V0Job2p2aVh1ZSsrMU9VUkViYmxJUWU3MG10Q0c2?=
 =?utf-8?B?enZFaktWT2lhN3NqZWRtM2xQN2RqdWJqQ252SjFld1YvQnpVNEhabWRmNDhO?=
 =?utf-8?B?SjduN2pMbitZdGZCT0F5d3ptTGFKL2Jza0M5bEFNNFE3VU8wOVFYcXNUczBK?=
 =?utf-8?B?dkRLaytscS9SNjl3RGVpTU1SUkhtMDBBckZ3SUFEWndYaWxOakVWMFpEZDBI?=
 =?utf-8?B?OXE0b0JqeEdFVzhrMGhpQjd6aU53QzE0ckFSdjVESXM3VWtGTk54UUFvM3RQ?=
 =?utf-8?B?bWlSREFkMzU3SWQ1SWdkTFgycGpVdFRhTENDZU5icUVlUXBDM09oU3p0WUpi?=
 =?utf-8?B?VFJYVVpURzlWVmJvMVo4QlA2eXA3Rm12VDZiV1FwTWs1cVFWYjFxNi9pN3hZ?=
 =?utf-8?B?VnRFY2JsZERhZXpFR0dVNjZONUw4Z09Ya3FINGJYL1JyYlM5RS9iNWxndUlQ?=
 =?utf-8?B?QUc0ZnhtcEQyZ0tuYmRiVGhIY0xMbXpudWl5OEpGS2xBd3RSNkxac29JVmZw?=
 =?utf-8?B?dVJWamdNUUtGSHVoc1VmTi9sN2tTSkg5eWxydkJBQm9QVmhTbXZlQVRBN2Rx?=
 =?utf-8?B?eHJscURpb0xsdlFTUjRNWTIvZHZDaHZoWk9oUUhJYndrRnVZcXFPbFd6bXVv?=
 =?utf-8?B?aWY1K2oxOUJXMU9IKzgzT2JoWDJIQStQdnNqTWVGQ0xDOUJoK21WMWIwUzJt?=
 =?utf-8?B?ZGNTcFdZUW5Zc3FyOEQ3L09aeWVtRU5vUWkrTUcvd0VOMGVqWWc2WVAvdmpz?=
 =?utf-8?B?cEpCVXFPMlBxelRhUDRSYTY4MWF4N0l3cnFUaGpvODk4MzNScHZXN2VZaWd0?=
 =?utf-8?B?ZERBSzBjbUhXNmtMQk9NT0RSSlgwWkxaSFA1dnRObWxCQXpQQS9pVzJjaEJj?=
 =?utf-8?B?RUNwdGZ6cE12TkdlREVmWUMxVlR1L01KVkVvcmtVYkxBUlFzb3V3dXRFYkpi?=
 =?utf-8?B?UldaQzBUUTdweVI0STlMSk5lUFlIUCsrdjVGVlE1WnYza3BHR1RPM3J4M01l?=
 =?utf-8?B?MUlhc2pBMDd5QVV2YnRwNjluUEFjVUc4Zm5WVk1FN003clRQcXlFRTNrZXhs?=
 =?utf-8?B?MHYxanNvNUk3NTZVUDlpRytvWVhTbjA3Tk43MVJtS0ZEQXF4ZlV5VFJnb3ln?=
 =?utf-8?B?Y3dZbFpCN0VzRm1UUFdRZ0lONXo4UkJpTGpQR3M3RGVpcUxOdFp2SE0xTDdt?=
 =?utf-8?B?Z3VrTDlGaFBqa2xMNFNCaGdDNnlnRXpBUzhVU1hyOVRNekNueXVsSEJDSTds?=
 =?utf-8?B?NXZTSEpxR20vUy9Jd2pKalNBcSs1dUxtZ3haY0hBRWt5UExjcExIc0NzaGd2?=
 =?utf-8?B?TkxNVlpjT2ZZTWlLaHFmTkpnbUV3WnluVW4vNTNSQS90bnlrdGxCVEpsdnJR?=
 =?utf-8?B?V0hESUZJUDU2TE1kVTRPKzBuckY5U1k2bExLZFZDZzFpT2w5NmtXZ1NSQU1D?=
 =?utf-8?B?ZDQvUWRaay9CMmhhdm5IWXlDSkRKU0FsTGZRSjZEN2pmbU1oNEdGTHZjZlRB?=
 =?utf-8?B?ZFI5V0p2c3dSeTNnQkFLcjJwT3JET3VGcEJody93ZkdVUjVhVzBUSDRramxW?=
 =?utf-8?B?NGoxeE9sZTRGZUh5NVVCcThhcVRkWENVcnEveDhNR3JSM1k0Ri9nSlhWR2d4?=
 =?utf-8?B?bzFNazBHOHlZVGFVTWNaejEwaDRmbjBZd2s2WmtaMDZNTVBCMjdzWE8xWU04?=
 =?utf-8?B?VktOLzRIREd3Nlo0NVdDaEtKeGFIcmNQWkJKOXJ3eWMway92b1Z2UXV5QjBI?=
 =?utf-8?B?ekE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 2UaJ1cE0JaK+jPcUFTWt5wDck8YrEPoucsf2edJm1khpErJxsPCKE5IqTveAYCu+zZHnmkC6yMsZnYfx0bOzJlsMakDOHa9HMDMesPdfShP+p9/wYwCnbecciGgVdk+fghn1e8zAw9hwk8KJDP3GGnJV3p5X2FAvLbJ00Wr3ST7WGxcVliXIIFip0Tl3vQSvwoJxiWhjw4MNVxiywWJErCwbnISwhnbuuWPlN3xmaQzct0lhxdgblsrJBqG2ENbktmfWg1njuATtvt0ltEK2IYwO5Gn9aqYPI93U8LDD30afvtpCGTNvXwjQdLoo16njRoP0jhWk/WTubwxuTPdDw0D1hS5UZdpIQ7zCCBoeZoZzUCA8q0AM94sEpveGU+bS22eXL9QaRhiiuld6IkHRtg7LswIrAH2sdsDFiHtM8JxA7FfasbIXfOFid98bRmF0Lv5/t8fGvuC3b8iAJIxNdE33CGyqy6gojWhRt7hqI5kR1wkDnv+T7E59oVkvm89fGCDAiGxOYtrbU5RNZdLnRvlO0oh5/2+tB6aAMqwyqze/XVQUpLlD8oknl/w2U8NKVAlD279OKUbGztBfe9Wnr1t5OYrJu/p75CGS6zRaV+I=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6dadae0-34cd-408c-146d-08de3c917ebc
X-MS-Exchange-CrossTenant-AuthSource: BL4PR10MB8229.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 10:54:32.8066
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q1EUMl3TepHGhGYZ6cn79WtzLJcIpVpRHQjljeWS8Wvm+PwCR8OvNUdUZ41uftplilgT0vpPxANiIzlLPWsfUS5PblJOhMIr28CHddBycVY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6250
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_02,2025-12-15_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 spamscore=0
 bulkscore=0 suspectscore=0 phishscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510240000
 definitions=main-2512160092
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDA5MSBTYWx0ZWRfX8LiWtyC1Aw+L
 JVy079+ZT4itc4IShuyhJ/PtWdSAGXQvF0TLnWsFGEFBbpGdgUHF4KIo+WOHI9+F5KbtCAtSBfF
 MHfUoy0xFZrA3MhF590dIHj7hEb5+3UU+tVo5TyhXIS2HsDe2l52usUjaWXH1m7PAyw2L/iyQkA
 3BcY+ThRhAyF93NadaOcaq9zbZkw3mxz49TUJ7MCSs2/UsTmx8xTMmOmHm3/iQiNSqcCS1CAK8f
 o0hkj0U+i5W8d7z7RJhtJT1wTKp523LQz2awAxa9SFGZH7s52IKXC3agRnPAPiN6BP7l10OWkcS
 jbsMt7xjVDgkk6bRUquBx0RJm6h/ZZZf8y7HUi6NvRVM1hDFtlXWqii/PbNJZfmLo4sMg8YS5P6
 ejPgztPQs9/pfon+Gg/Sz3TPoj3J1w==
X-Proofpoint-GUID: tor4XFlI2UZSC80PGYDKUcfBLOONc4j8
X-Proofpoint-ORIG-GUID: tor4XFlI2UZSC80PGYDKUcfBLOONc4j8
X-Authority-Analysis: v=2.4 cv=dParWeZb c=1 sm=1 tr=0 ts=69413a78 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=R-C7wWcTzcBmiIEkE54A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_025510_227522_9FAEA484 
X-CRM114-Status: GOOD (  23.31  )
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

On Tue, Dec 16, 2025 at 02:22:11PM +0800, Baolin Wang wrote:
>
>
> On 2025/12/16 14:13, Barry Song wrote:
> > > > >
> > > > > diff --git a/mm/rmap.c b/mm/rmap.c
> > > > > index ec232165c47d..4c9d5777c8da 100644
> > > > > --- a/mm/rmap.c
> > > > > +++ b/mm/rmap.c
> > > > > @@ -1855,9 +1855,10 @@ static inline unsigned int folio_unmap_pte_batch(struct folio *folio,
> > > > >       end_addr = pmd_addr_end(addr, vma->vm_end);
> > > > >       max_nr = (end_addr - addr) >> PAGE_SHIFT;
> > > > >
> > > > > -    /* We only support lazyfree batching for now ... */
> > > > > -    if (!folio_test_anon(folio) || folio_test_swapbacked(folio))
> > > > > +    /* We only support lazyfree or file folios batching for now ... */
> > > > > +    if (folio_test_anon(folio) && folio_test_swapbacked(folio))
> > > >
> > > > Why is it now ok to support file-backed batched unmapping when it wasn't in
> > > > Barry's series (see [0])? You don't seem to be justifying this?
> > >
> > > Barry's series[0] is merely aimed at optimizing lazyfree anonymous large
> > > folios and does not continue to optimize anonymous large folios or
> > > file-backed large folios at that point.
> >
> > Yep. At that time, I didn’t have an Android machine with a filesystem
> > that supported large folios, so I focused on lazyfree. But I
> > agree that lazyfree anon folios and file folios are quite
> > similar.
> >
> > >
> > > Subsequently, Barry sent out a new patch (see [1]) to optimize anonymous
> > > large folios. As for file-backed large folios, the batched unmapping
> > > support is relatively simple, since we only need to clear the PTE
> > > entries for file-backed large folios.
> >
> > Yep. It is actually quite straightforward to go from lazyfree
> > anon folios to file folios. Swap-backed anon folios are much
> > more tricky, though.
>
> Agree. Thanks Barry for reviewing and confirming.

OK that makes me less concerned, but you do need to put some more justification
in the commit message.

Cheers, Lorenzo

